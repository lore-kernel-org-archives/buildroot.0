Return-Path: <SRS0=bh6H=OM=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CE4DC433EF
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 07:45:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6765B61178
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 07:45:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6765B61178
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F5BE613AE;
	Wed, 22 Sep 2021 07:45:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QrRH6HUb0UY4; Wed, 22 Sep 2021 07:45:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5875B613A9;
	Wed, 22 Sep 2021 07:45:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DBF2A1BF3FD
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 07:45:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CBD9280E4C
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 07:45:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8S2-hVKhV5GQ for <buildroot@lists.busybox.net>;
 Wed, 22 Sep 2021 07:45:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D54FF80E30
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 07:45:42 +0000 (UTC)
Received: (Authenticated sender: kory.maincent@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 1650B1BF20D;
 Wed, 22 Sep 2021 07:45:38 +0000 (UTC)
Date: Wed, 22 Sep 2021 09:45:38 +0200
From: =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20210922094538.7b1de78b@kmaincent-XPS-13-7390>
In-Reply-To: <20210921194105.GA3176@scaer>
References: <20210921132829.56405-1-kory.maincent@bootlin.com>
 <20210921132829.56405-2-kory.maincent@bootlin.com>
 <20210921163727.GW1053080@scaer>
 <20210921194944.53b0cacc@kmaincent-XPS-13-7390>
 <20210921194105.GA3176@scaer>
Organization: bootlin
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 1/6] boot/grub2: add support to build
 multiple Grub2 configurations in the same build
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

SGVsbG8gWWFubiwKCk9uIFR1ZSwgMjEgU2VwIDIwMjEgMjE6NDE6MDUgKzAyMDAKIllhbm4gRS4g
TU9SSU4iIDx5YW5uLm1vcmluLjE5OThAZnJlZS5mcj4gd3JvdGU6Cgo+ID4gPiA+ICBHUlVCMl9D
T05GX09QVFMgPSBcCj4gPiA+ID4gLQktLXRhcmdldD0kKEdSVUIyX1RBUkdFVCkgXAo+ID4gPiA+
IC0JLS13aXRoLXBsYXRmb3JtPSQoR1JVQjJfUExBVEZPUk0pIFwKPiA+ID4gPiArCS0taG9zdD0k
KEdOVV9UQVJHRVRfTkFNRSkgXAo+ID4gPiA+ICsJLS1idWlsZD0kKEdOVV9IT1NUX05BTUUpIFwK
PiA+ID4gPiAgCS0tcHJlZml4PS8gXAo+ID4gPiA+ICAJLS1leGVjLXByZWZpeD0vIFwKPiA+ID4g
PiAgCS0tZGlzYWJsZS1ncnViLW1rZm9udCBcCj4gPiA+ID4gQEAgLTE0NywzNCArMTYwLDQ4IEBA
IEhPU1RfR1JVQjJfQ09ORl9PUFRTID0gXAo+ID4gPiA+ICAJLS1lbmFibGUtbGliemZzPW5vIFwK
PiA+ID4gPiAgCS0tZGlzYWJsZS13ZXJyb3IgICAgCj4gPiA+IEFzIFRob21hcyBwcmV2aW91c2x5
IHN1Z2dlc3RlZCwgSSB0aGluayB3ZSBjYW4ganVzdCBkcm9wIEdSVUIyX0NPTkZfT1BUUwo+ID4g
PiBhbmQganVzdCBwdXQgdGhlIG9wdGlvbnMsIGV2ZW4gc2hhcmVkICwgZGlyZWN0bHkgaW4gdGhl
IGxvb3AgWy4uLl0gIAo+ID4gSGlzIHN1Z2dlc3Rpb24gd2FzIHRvIG9ubHkga2VlcCBvdXQgb2Yg
R1JVQjJfQ09ORl9PUFRTIHRoZSB0d28gcGFyYW1ldGVyaXplZAo+ID4gb3B0aW9ucyAiLS10YXJn
ZXQiIGFuZCAiLS13aXRoLXBsYXRmb3JtIi4gSWYgeW91IHByZWZlciB0byBkcm9wIGFsbCB0aGUK
PiA+IG9wdGlvbnMgZnJvbSBHUlVCMl9DT05GX09QVFMsIEkgY2FuIGRvIHRoYXQuICAKPiAKPiBB
aCwgcmlnaHQsIEkgbWlzcmVhZCB3aGF0IGhlIHdyb3RlLiBCdXQgb25jZSB3ZSBtb3ZlIHNvbWUg
b3B0aW9ucyBvdXQgb2YKPiBHUlVCMl9DT05GX09QVFMsIGFuZCBzaW5jZSBpdCBpcyB1c2VkIGlu
IGEgc2luZ2xlIHBsYWNlLCBkb2VzIGl0IG1ha2UKPiBzZW5zZSB0byBrZWVwIGl0IG5vdyB0aGF0
IHdlIG5vIGxvbmdlciBhcmUgYW4gYXV0b3Rvb2xzLXBhY2thZ2U/CgpBbHJpZ2h0Cgo+ID4gPiBB
bmQgSSBhbSBub3Qgc3VyZSBob3cgdG8gZml4IHRoYXQsIGluIHRoZSBlbmQuLi4gRXNwZWNpYWxs
eSB0aGUgc3lzdGVtZAo+ID4gPiBjYXNlIChtZWgpLiAgCj4gPiBNZSBuZWl0aGVyLiBNYXliZSB3
ZSBjYW4gbGV0IGl0IGxpa2UgdjEsIGFuZCB0aGUgNjQtYml0IEVGSSBjb25maWd1cmF0aW9uCj4g
PiB3aWxsIGJlIHRoZSBvbmUgdXNlZCBpZiBib3RoIDMyLWJpdCBFRkkgYW5kIDY0LWJpdCBFRkkg
YXJlIHNlbGVjdGVkLiAgCj4gCj4gV2VsbCwgdGhlIHVsdGltYXRlIGdvYWwgaXMgdG8gaGFldiBh
IHNpbmdsZSBVU0Itc3RpY2sgb3IgQ0RST00gdGhhdCBjYW4KPiBib290IG9uIGFsbCB0aHJlZSBz
eXN0ZW1zOgo+ICAgLSBsZWdhY3kgQklPUwo+ICAgLSAzMi1iaXQgVUVGSQo+ICAgLSA2NC1iaXQg
VUVGSQo+IAo+IFNvLCBpZiB0aGUgc3RhcnR1cC5uc2ggc2NyaXB0IGlzIHRvIGJlIHByb3ZpZGVk
LCBpdCBzaG91bGQgY292ZXIgdGhlIHR3bwo+IFVFRkkgY2FzZXMuIEEgMzItYml0IFVFRkkgYmlv
cyBjYW4ndCBsb2FkIGEgNjQtYml0IHBheWxvYWQsIGFuZAo+IGNvbnZlcnNlbHksIGEgNjUtYml0
IFVFRkkgYmlvcyBjYW4ndCBsb2FkIGEgMzItYml0IHBheWxvYWQuCj4gCj4gU28sIGlmIHN0YXJ0
dXAubnNoIGlzIG1hbmRhdG9yeSwgd2UgaGF2ZSBhbiBpbXBvc3NpYmxlIHNpdHVhdGlvbi4uLgo+
IAo+IFNvLCBJIHdvbmRlciBpZiBzdGFydHVwLm5zaCBpcyBldmVuIG5lZWRlZCBhdCBhbGwsIGFu
ZCBpZiB3ZSBzaG91bGQgbm90Cj4ganVzdCBkcm9wIGl0IGFsdG9nZXRoZXIsIGFuZCBqdXN0IHJl
bHksIHMgeW91IGV4cGxhaW5lZCBlYXJsaWVyLCBvbiB0aGUKPiBhY3R1YWwgbmFtaW5nIG9mIHRo
ZSBwYXlsb2FkOiBlZmkvYm9vdC9ib290aWEzMi5lZmkgb24gMzItYml0IFVFRkksIG9yCj4gZWZp
L2Jvb3QvYm9vdHg2NC5lZmkgb24gNjQtYml0IFVFRkkuCj4gCj4gQW5kIGRyb3AgdGhlIGNyZWF0
aW9uIG9mIHN0YXJ0dXAubnNoIGluIGd1bW1pYm9vdCBhbmQgc3lzdGVtZC4KPiAKPiBBbmQgZml4
dXAgdGhlIHBvc3QtYnVpbGQgc2NyaXB0cyBhY2NvcmRpbmdseS4uLgo+IAo+IEJ1dCBhcyBJIHNh
aWQgZWFybGllcjogSSBkbyBub3QgaGF2ZSBhY2Nlc3MgdG8gdGhlIFVFRkkgc3BlY2lmaWNhdGlv
bnMKPiAodGhleSBhcmUgZnJlZS1hcy1pbi1iZWVyIHRvIGRvd25sb2FkIGFuZCByZWFkLCBub3Qg
aW1wbGVtZW50IG9yIHVzZSwKPiBzbyBieSBkb3dubG9hZGluZyB0aGVtLCBJIHdvdWxkIGhhdmUg
dG8gc3RvcCByZXZpZXdpbmcgdGhpcyBzZXJpZXMgYXMKPiB0aGF0IHdvdWxkIGNvdW50IGFzIGEg
dXNlIG9mIHRoZSBzcGVjcy4uLikKCklmIEkgYXNrIHNvbWVvbmUgdG8gcmVhZCBpdCBhbmQgY29u
ZmlybSB0aGUgYm9vdCBmaWxlcyBuYW1lLCBpcyBpdCBvayBhcyBJIGhhdmUKbm90IG9wZW5lZCBp
dD8gOykKCkhlcmUgaXMgdGhlIGZpbGUgbmFtZSBjb252ZW50aW9uIHRoYXQgbmVlZCB0byBiZSBp
bnN0YWxsIGluIGVmaS9ib290IGZvbGRlcgozMmJpdCA6IGJvb3RpYTMyLmVmaQp4NjQgOiBib290
eDY0LmVmaQphYXJjaDMyIDogYm9vdGFybS5lZmkKYWFyY2g2NCA6IGJvb3RhYTY0LmVmaQoKSXQg
c2VlbXMgZHJvcHBpbmcgdGhlIGNyZWF0aW9uIG9mIHRoZSBzdGFydHVwLm5zaCBpcyB0aGUgYmVz
dCBpZGVhLiAKClJlZ2FyZHMsCkvDtnJ5Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGxpc3RzLmJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
