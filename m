Return-Path: <SRS0=9D0o=OI=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A9AAC433F5
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 08:50:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 52FF960F93
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 08:50:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 52FF960F93
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2150B60649;
	Sat, 18 Sep 2021 08:50:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iuECqJVENHFY; Sat, 18 Sep 2021 08:50:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6008460716;
	Sat, 18 Sep 2021 08:50:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 487F01BF365
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 08:50:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 42A6B400C8
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 08:50:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NrPIoeZ1zbor for <buildroot@lists.busybox.net>;
 Sat, 18 Sep 2021 08:50:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 422A840019
 for <buildroot@buildroot.org>; Sat, 18 Sep 2021 08:50:48 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 1493620005;
 Sat, 18 Sep 2021 08:50:43 +0000 (UTC)
Date: Sat, 18 Sep 2021 10:50:42 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20210918105042.7a0887cd@windsurf>
In-Reply-To: <20210917212429.GY1053080@scaer>
References: <20210914093457.1389174-1-kory.maincent@bootlin.com>
 <20210914093457.1389174-2-kory.maincent@bootlin.com>
 <20210917212429.GY1053080@scaer>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/8] boot/grub2: add support to build
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
Cc: Kory Maincent <kory.maincent@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

SGVsbG8gWWFubiwKCk9uIEZyaSwgMTcgU2VwIDIwMjEgMjM6MjQ6MjkgKzAyMDAKIllhbm4gRS4g
TU9SSU4iIDx5YW5uLm1vcmluLjE5OThAZnJlZS5mcj4gd3JvdGU6Cgo+IFdoYXQgeW91IGZvcmdv
dCB0byBzdGF0ZSBpbiBib2xkIGZhdCBjaGFyYWN0ZXJzIGhlcmUsIGlzIHRoYXQgd2UgY2FuIG5v
Cj4gbG9uZ2VyIHVzZSBhdXRvdG9vbHMtcGFja2FnZSBhcyBhIGNvbnNlcXVlbmNlIG9mIHRoaXMg
bXVsdGktYnVpbGQsIGFuZAo+IHRoYXQgd2UgaGF2ZSB0byByZXNvcnQgdG8gZ2VuZXJpYy1wYWNh
a2dlIGFuZCBhIHBhcnRpYWwgZHVwbGljYXRpb24gb2YKPiB0aGUgYXV0b3Rvb2xzLWluZnJhLgo+
IAo+IFRoaXMgaXMgbm90IHZlcnkgbmljZS4uLiA6LSgKCkluZGVlZCwgYnV0Li4uCgo+IElJUkMs
IHdlIGhhZCBhIHNpbWlsYXIgcHJvYmxlbSB3aXRoIGJhcmJveCwgd2hlcmUgd2UgaGFkIHRvIGJ1
aWxkIHR3bwo+IGltYWdlcyBmb3IgaXQsIHNvIHdlIGVuZGVkIHVwIGR1cGxpY2F0aW5nIHRoZSBw
YWNrYWdlLCB3aGVyZSB0aGUKPiB0b3AtbW9zdCBib290L2JhcmVib3gvYmFyZWJveC5tayBkZWZp
bmVzIGEgbWluaW1hbGlzdCBiYXJlYm94LXBhY2thZ2UKPiBpbmZyYSwgYW5kIHRoZSBiYXJlYm94
IGFuZCBiYXJlYm94LWF1eCBhcmUgdHdvIGJhcmVib3gtcGFja2FnZToKPiAKPiAgICAgYm9vdC9i
YXJlYm94Lwo+ICAgICDilJzilIDilIAgYmFyZWJveC8KPiAgICAg4pSCICAg4pSc4pSA4pSAIGJh
cmVib3guaGFzaCAtPiAuLi9iYXJlYm94Lmhhc2gKPiAgICAg4pSCICAg4pSc4pSA4pSAIGJhcmVi
b3gubWsKPiAgICAg4pSCICAg4pSU4pSA4pSAIENvbmZpZy5pbgo+ICAgICDilJzilIDilIAgYmFy
ZWJveC1hdXgvCj4gICAgIOKUgiAgIOKUnOKUgOKUgCBiYXJlYm94LWF1eC5oYXNoIC0+IC4uL2Jh
cmVib3guaGFzaAo+ICAgICDilIIgICDilJzilIDilIAgYmFyZWJveC1hdXgubWsKPiAgICAg4pSC
ICAg4pSU4pSA4pSAIENvbmZpZy5pbgo+ICAgICDilJzilIDilIAgYmFyZWJveC5oYXNoCj4gICAg
IOKUnOKUgOKUgCBiYXJlYm94Lm1rCj4gICAgIOKUlOKUgOKUgCBDb25maWcuaW4KPiAKPiBJZiBJ
IHVuZGVyc3RhbmQgY29ycmVjdGx5LCB3ZSBhcmUgaW4gYSBzaW1pbGFyIHNpdHVhdGlvbiB3aXRo
IGdydWIyLCBhbmQKPiB0aGVyZSBhcmUgb25seSBldmVyIGF0IG1vc3QgdHdvICJwbGF0Zm9ybXMi
IHdlIGNhbiBidWlsZCwgYW5kIGl0IGRvZXMKPiBub3QgbG9vayBsaWtlIGl0IHdpbGwgZXZlciBj
aGFuZ2U6CgpOb3BlLCB0aGF0IGlzIG5vdCBjb3JyZWN0LgoKPiAgICAgaTM4NjoKPiAgICAgICAg
IEJSMl9UQVJHRVRfR1JVQjJfSTM4Nl9QQwo+ICAgICAgICAgQlIyX1RBUkdFVF9HUlVCMl9JMzg2
X0VGSQo+IAo+ICAgICB4ODZfNjQ6Cj4gICAgICAgICBCUjJfVEFSR0VUX0dSVUIyX0kzODZfRUZJ
Cj4gICAgICAgICBCUjJfVEFSR0VUX0dSVUIyX1g4Nl82NF9FRkkKCk9uIHg4Ni02NCwgd2UgY2Fu
IGhhdmU6CgoJQlIyX1RBUkdFVF9HUlVCMl9JMzg2X1BDCglCUjJfVEFSR0VUX0dSVUIyX0kzODZf
RUZJCglCUjJfVEFSR0VUX0dSVUIyX1g4Nl82NF9FRkkKCnRvIGNvdmVyIGxlZ2FjeSBCSU9TIHBs
YXRmb3JtcyAoMzItYml0KSwgMzItYml0IEVGSSBCSU9TIGFuZCA2NC1iaXQgRUZJCkJJT1MuIERh
bnMgdGhpcyBpcyBwcmVjaXNlbHkgdGhlIHVzZS1jYXNlIHdlIGFyZSBpbiBmYWN0IGludGVyZXN0
ZWQgaW4uCgpTbyB0aGF0IG1lYW5zIHdlIHdvdWxkIG5lZWQgMyBHcnViIHBhY2thZ2VzLCB3aGlj
aCBpcyB0aGUgcmVhc29uIHdoeSBpdApmZWx0IG11Y2ggbW9yZSByZWFzb25hYmxlIHRvIGp1c3Qg
ZXh0ZW5kIHRoZSBncnViMiBwYWNrYWdlIGl0c2VsZi4KCj4gPiAgR1JVQjJfQ09ORl9PUFRTID0g
XAo+ID4gLQktLXRhcmdldD0kKEdSVUIyX1RBUkdFVCkgXAo+ID4gLQktLXdpdGgtcGxhdGZvcm09
JChHUlVCMl9QTEFURk9STSkgXAo+ID4gKwktLWhvc3Q9JChHTlVfVEFSR0VUX05BTUUpIFwKPiA+
ICsJLS1idWlsZD0kKEdOVV9IT1NUX05BTUUpIFwKPiA+ICsJLS10YXJnZXQ9JChHUlVCMl8kKGNh
bGwgVVBQRVJDQVNFLCQodHVwbGUpKV9UQVJHRVQpIFwKPiA+ICsJLS13aXRoLXBsYXRmb3JtPSQo
R1JVQjJfJChjYWxsIFVQUEVSQ0FTRSwkKHR1cGxlKSlfUExBVEZPUk0pIFwgIAo+IAo+ICAgICAt
LXRhcmdldD0kKEdSVUIyX1RBUkdFVF8kKHR1cGxlKSkKPiAgICAgLS13aXRoLXBsYXRmb3JtPSQo
R1JVQjJfUExBVEZPUk1fJCh0dXBsZSkpIFwKPiAKPiBIb3dldmVyLCBJIGRvbid0IGxpa2UgbWFj
cm9zIHRoYXQgYXJlIGltcGxpY2l0bHkgcGFyYW1ldGVyaXNlZC4gV2UndmUKPiBnb25lIGluIHF1
aXRlIHNvbWUgY2hhbmdlcyBpbiB0aGUgcGFzdCB0byBmaXggc2ltaWxhciBjYXNlcyAoZS5nLiBp
biB0aGUKPiBkb3dubG9hZCBpbmZyYSkuCgpBaCwgeWVzLCBJIG1pc3NlZCB0aGF0IGR1cmluZyB0
aGUgcmV2aWV3LCBpbmRlZWQgdGhlIGZhY3QgdGhhdCB3ZQpyZWZlcmVuY2UgJCh0dXBsZSkgaW4g
R1JVQjJfQ09ORl9PUFRTIHdpdGhvdXQgaXQgYmVpbmcgYW4gYXJndW1lbnQgaXMgYQpiaXQgYW5u
b3lpbmcuCgo+IFNvLCBJJ2Qgd3JpdGUgYSByZWFsIHBhcmFtZXRlcmlzZWQgbWFyY286Cj4gCj4g
ICAgICMgJCgxKTogdHVwbGUgYmxhYmxhYmxhLi4uCj4gICAgIEdSVUIyX0NPTkZfT1BUUyA9IFwK
PiAgICAgICAgIC0taG9zdD0kKEdOVV9UQVJHRVRfTkFNRSkgXAo+ICAgICAgICAgLS10YXJnZXQ9
JChHUlVCMl9UQVJHRVRfJCgxKSkgXAo+ICAgICAgICAgLS13aXRoLXBsYXRmb3JtPSQoR1JVQjJf
UExBVEZPUk1fJCgxKSkgXAo+ICAgICAgICAgWy4uLl0KPiAKPiAgICAgJChmb3JlYWNoIHR1cGxl
LCAkKEdSVUIyX1RVUExFU195KSwgXAo+ICAgICAgICAgWy4uLl0gXAo+ICAgICAgICAgLi4vY29u
ZmlndXJlICQoY2FsbCBHUlVCMl9DT05GX09QVFMsJCh0dXBsZSkpCgpPciwganVzdCBkbzoKCgkg
IC4uL2NvbmZpZ3VyZSAkKEdSVUIyX0NPTkZfT1BUUykgXAoJCS0tdGFyZ2V0PS4uLiBcCgkJLS13
aXRoLXBsYXRmb3JtPS4uLgoKSS5lLCBrZWVwIG91dCBvZiBHUlVCMl9DT05GX09QVFMgdGhlIG9w
dGlvbnMgdGhhdCBhcmUgcGFyYW1ldGVyaXplZC4KCgo+ID4gLSQoZXZhbCAkKGF1dG90b29scy1w
YWNrYWdlKSkKPiA+ICskKGV2YWwgJChnZW5lcmljLXBhY2thZ2UpKSAgCj4gCj4gVGhpcyBpcyBt
eSBtYWluIHByb2JsZW06IHdlJ3JlIG1vc3RseSBkdXBsaWNhdGluZyBiaXRzIGFuZCBwaWVjZXMg
b2YgdGhlCj4gYXV0b3RvbGxzLXBhY2thZ2UgaW5mcmEsIHdoaWNoIG1lYW5zIHdlICp3aWxsKiBm
YWxsIGJlaGluZCB2ZXJ5IHF1aWNrbHkKPiB3aGVuIHdlIGhhdmUgdG8gdXBkYXRlIHNhaWQgaW5m
cmEsIGFuZCB0aG9zZSBjaGFuZ2VzIHdpbGwgbm90IHBlcmNvbGF0ZQo+IHRvIHRoaXMgZ3J1YjIg
cGFja2FnZS4KClRoYXQgaXMgdHJ1ZSwgYnV0IG9uIHRoZSBvdGhlciBoYW5kLCBncnViMiBpcyBu
b3QgdGhlIHR5cGljYWwKdXNlci1zcGFjZSBhdXRvdG9vbHMgcGFja2FnZSBlaXRoZXIuCgpTZWUg
dGhlIHN0YWNrIG9mIGNyYXAgdGhhdCB3ZSBoYXZlIHRvIHBhc3MgdG8gbWFrZSBpdCB3b3JrOgoK
R1JVQjJfQ09ORl9FTlYgPSBcCiAgICAgICAgQ1BQPSIkKFRBUkdFVF9DQykgLUUiIFwKICAgICAg
ICBUQVJHRVRfQ0M9IiQoVEFSR0VUX0NDKSIgXAogICAgICAgIENGTEFHUz0iJChUQVJHRVRfQ0ZM
QUdTKSAtT3MiIFwKICAgICAgICBUQVJHRVRfQ0ZMQUdTPSIkKFRBUkdFVF9DRkxBR1MpIC1PcyIg
XAogICAgICAgIENQUEZMQUdTPSIkKFRBUkdFVF9DUFBGTEFHUykgLU9zIC1mbm8tc3RhY2stcHJv
dGVjdG9yIiBcCiAgICAgICAgVEFSR0VUX0NQUEZMQUdTPSIkKFRBUkdFVF9DUFBGTEFHUykgLU9z
IC1mbm8tc3RhY2stcHJvdGVjdG9yIiBcCiAgICAgICAgVEFSR0VUX0xERkxBR1M9IiQoVEFSR0VU
X0xERkxBR1MpIC1PcyIgXAogICAgICAgIFRBUkdFVF9OTT0iJChUQVJHRVRfTk0pIiBcCiAgICAg
ICAgVEFSR0VUX09CSkNPUFk9IiQoVEFSR0VUX09CSkNPUFkpIiBcCiAgICAgICAgVEFSR0VUX1NU
UklQPSIkKFRBUkdFVF9DUk9TUylzdHJpcCIKCkdSVUIyX0NPTkZfT1BUUyA9IFwKICAgICAgICAt
LXRhcmdldD0kKEdSVUIyX1RBUkdFVCkgXAogICAgICAgIC0td2l0aC1wbGF0Zm9ybT0kKEdSVUIy
X1BMQVRGT1JNKSBcCiAgICAgICAgLS1wcmVmaXg9LyBcCiAgICAgICAgLS1leGVjLXByZWZpeD0v
IFwKICAgICAgICAtLWRpc2FibGUtZ3J1Yi1ta2ZvbnQgXAogICAgICAgIC0tZW5hYmxlLWVmaWVt
dT1ubyBcCiAgICAgICAgYWNfY3ZfbGliX2x6bWFfbHptYV9jb2RlPW5vIFwKICAgICAgICAtLWVu
YWJsZS1kZXZpY2UtbWFwcGVyPW5vIFwKICAgICAgICAtLWVuYWJsZS1saWJ6ZnM9bm8gXAogICAg
ICAgIC0tZGlzYWJsZS13ZXJyb3IKCkluY2x1ZGluZyB0aGUgcGFzc2luZyBvZiAtLXRhcmdldCwg
Y3VzdG9tIC0tcHJlZml4LCBjdXN0b20KLS1leGVjLXByZWZpeC4KClNvIGV2ZW4gdGhvdWdoIHdl
IGRvIHVzZSBhdXRvdG9vbHMtcGFja2FnZSwgaXQncyBub3QgbGlrZSB3ZSBkb24ndAphbHJlYWR5
IGhhdmUgdG8gcGxheSBxdWl0ZSBhIGZldyB0cmlja3MgdG8gZ2V0IGl0IHRvIGRvIHRoZSByaWdo
dCB0aGluZwp3aXRoIHRoZSB3ZWlyZG5lc3Mgb2YgZ3J1YjIuCgpCZXN0IHJlZ2FyZHMsCgpUaG9t
YXMKLS0gClRob21hcyBQZXRhenpvbmksIGNvLW93bmVyIGFuZCBDRU8sIEJvb3RsaW4KRW1iZWRk
ZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZyBhbmQgdHJhaW5pbmcKaHR0cHM6Ly9ib290
bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBsaXN0cy5idWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
