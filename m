Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18771C433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 09:09:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D26CB61154
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 09:09:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D26CB61154
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7AE2860E6A;
	Wed,  6 Oct 2021 09:09:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wIcBUu_w3zvM; Wed,  6 Oct 2021 09:09:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D05C660E68;
	Wed,  6 Oct 2021 09:09:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7059F1BF3DB
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 09:09:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5C35C4059A
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 09:09:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ViVdW83Z-MPl for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 09:09:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 007C840478
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 09:09:32 +0000 (UTC)
Received: (Authenticated sender: kory.maincent@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id E563440010;
 Wed,  6 Oct 2021 09:09:29 +0000 (UTC)
Date: Wed, 6 Oct 2021 11:09:28 +0200
From: =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20211006110928.332bf2fe@kmaincent-XPS-13-7390>
In-Reply-To: <20211005174223.6efc9aa0@windsurf>
References: <20211005145205.27617-1-kory.maincent@bootlin.com>
 <20211005174223.6efc9aa0@windsurf>
Organization: bootlin
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] configs/octavo_osd32mp1_brk_defconfig:
 Add support for octavo brk board
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gVGhvbWFzLAoKVGhhbmtzIGZvciB0aGUgcmV2aWV3LgoKT24gVHVlLCA1IE9jdCAyMDIx
IDE3OjQyOjIzICswMjAwClRob21hcyBQZXRhenpvbmkgPHRob21hcy5wZXRhenpvbmlAYm9vdGxp
bi5jb20+IHdyb3RlOgoKPiA+IAo+ID4gSXQgaXMgbGljZW5zZWQgdW5kZXIgQlNEIDItQ2xhdXNl
LiAgCj4gCj4gV2hhdCBkbyB5b3UgcmVmZXIgdG8gIkl0IiBoZXJlID8KClRoZSBkZXZpY2V0cmVl
IGFuZCB0aGUgcGF0Y2hlcy4gSSB3aWxsIHVwZGF0ZSBpdCBpbiB0aGUgdjIuCgo+ID4gK0Y6CWJv
YXJkL29jdGF2by9icmsvCj4gPiArRjoJY29uZmlncy9vY3Rhdm9fb3NkMzJtcDFfYnJrX2RlZmNv
bmZpZyAgCj4gCj4gU2hvdWxkIGl0IGJlICJvY3Rhdm9zeXN0ZW1zIiBpbnN0ZWFkIG9mICJvY3Rh
dm8iID8gVGhpcyBpcyBhIHF1ZXN0aW9uLAo+IEkgYWdyZWUgIm9jdGF2byIgaXMgc2hvcnRlci4K
CkxldCdzIGtlZXAgb2N0YXZvIG5hbWluZyA6KQoKPiA+IC0tLSAvZGV2L251bGwKPiA+ICsrKyBi
L2JvYXJkL29jdGF2by9icmsvZ2VuaW1hZ2UuY2ZnCj4gPiBAQCAtMCwwICsxLDIzIEBACj4gPiAr
aW1hZ2Ugc2RjYXJkLmltZyB7Cj4gPiArCWhkaW1hZ2Ugewo+ID4gKwkJZ3B0ID0gInRydWUiCj4g
PiArCX0KPiA+ICsKPiA+ICsJcGFydGl0aW9uIGZzYmwxIHsKPiA+ICsJCWltYWdlID0gIiVBVEZC
SU4lIgo+ID4gKwl9Cj4gPiArCj4gPiArCXBhcnRpdGlvbiBmc2JsMiB7Cj4gPiArCQlpbWFnZSA9
ICIlQVRGQklOJSIKPiA+ICsJfSAgCj4gCj4gRG8geW91IG5lZWQgdGhpcyBjdXN0b20gZ2VuaW1h
Z2UuY2ZnIGZpbGU/IElmIHNvLCB3aHkgaXNuJ3QgJUFURkJJTiUKPiBoYXJkY29kZWQ/IEVpdGhl
ciB5b3UgaGF2ZSBhIGJvYXJkLXNwZWNpZmljIGdlbmltYWdlLmNmZyB0aGF0IGhhcyBhbGwKPiB2
YWx1ZXMgaGFyZGNvZGVkLCBvciB5b3Ugc2hhcmUgdGhlIGdlbmltYWdlLmNmZyBmaWxlIHdpdGgg
b3RoZXIgYm9hcmRzLAo+IGFuZCBpdCBnZXRzICJ0d2Vha2VkIiBieSB0aGUgcG9zdC1pbWFnZSBz
Y3JpcHQuIEJ1dCBtaXhpbmcgYm90aCBpcyBvZGQuCgpBaCByaWdodCwgSSB3aWxsIGNyZWF0ZSBh
IGNvbW1vbiBmb2xkZXIgdG8gc2hhcmUgdGhvc2UgZmlsZXMgYmV0d2VlbiB0aGUgcmVkIGFuZAp0
aGUgYnJrIGJvYXJkLgoKPiAKPiA+IGRpZmYgLS1naXQgYS9ib2FyZC9vY3Rhdm8vYnJrL2xpbnV4
LWR0cy9zdG0zMm1wMTU3Yy1vc2QzMm1wMS1icmsuZHRzCj4gPiBiL2JvYXJkL29jdGF2by9icmsv
bGludXgtZHRzL3N0bTMybXAxNTdjLW9zZDMybXAxLWJyay5kdHMgbmV3IGZpbGUgbW9kZQo+ID4g
MTAwNjQ0IGluZGV4IDAwMDAwMDAwMDAuLmQ3NjNiNDg5NDUKPiA+IC0tLSAvZGV2L251bGwKPiA+
ICsrKyBiL2JvYXJkL29jdGF2by9icmsvbGludXgtZHRzL3N0bTMybXAxNTdjLW9zZDMybXAxLWJy
ay5kdHMgIAo+IAo+IFRoYXQncyBhIGxvdCBvZiBEZXZpY2UgVHJlZSBzdHVmZi4gU2luY2UgdGhl
eSBoYXZlIGl0IGluIGEgR2l0Cj4gcmVwb3NpdG9yeSwgSSB3YXMgd29uZGVyaW5nIGlmIHdlIGNv
dWxkbid0IGRvIHNvbWV0aGluZyBiZXR0ZXIuIEJ1dCB3ZQo+IGRvbid0IHJlYWxseSBoYXZlIGEg
Z29vZCBtZWNoYW5pc20gdG9kYXkgdG8gZG93bmxvYWQgRGV2aWNlIFRyZWUgZmlsZXMKPiBmcm9t
IGEgR2l0IHJlcG8sIGFuZCBmZWVkIHRoZW0gaW50byB0aGUgVEYtQS9VLUJvb3QvTGludXggYnVp
bGQuCj4gCj4gV2hhdCBkbyBvdGhlcnMgdGhpbmsgYWJvdXQgdGhpcz8KPiAKPiA+IGRpZmYgLS1n
aXQgYS9ib2FyZC9vY3Rhdm8vYnJrL2xpbnV4LmNvbmZpZyBiL2JvYXJkL29jdGF2by9icmsvbGlu
dXguY29uZmlnCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4gaW5kZXggMDAwMDAwMDAwMC4u
MWE1YTA4OGRlMCAgCj4gCj4gV2hlcmUgZG9lcyB0aGlzIGZpbGUgY29tZXMgZnJvbT8gSXQgc2Vl
bXMgdG8gaGF2ZSBhIGxvdCBvZiAidXNlbGVzcyIKPiB0aGluZ3MgZW5hYmxlZC4KCkl0IHdhcyB0
aGUgZGVmYXVsdCBkZWZjb25maWcgZnJvbSBTVCBmb3Igc3RtMzIgYm9hcmRzLgoKPiBQbGVhc2Ug
cmV2aWV3IHRoaXMgTGludXgga2VybmVsIGNvbmZpZ3VyYXRpb24gZmlsZS4KCkkgd2lsbCB1cGRh
dGUgaXQgd2l0aCB0aGUgZGVmY29uZmlnIGV4dHJhY3RlZCBmcm9tIHRoZSBwcmVidWlsdCBpbWFn
ZSBpbiB0aGUgVjIuClRoZXJlIGFyZSBzdGlsbCBsb3RzIG9mIGZlYXR1cmVzIGVuYWJsZWQuCgo+
IAo+ID4gQEAgLTAsMCArMSwxOTg5IEBACj4gPiArRnJvbSAyZWZlNmJlMzQ4NDg5ZGJkYzg1Njk0
N2VkYTZlNTE4NzQ5NGFlZmM4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQo+ID4gK0Zyb206IE1h
cnRpbiBMZXNuaWFrIDxtYXJ0aW4ubGVzbmlha0BzdC5jb20+Cj4gPiArRGF0ZTogVGh1LCAyNyBB
dWcgMjAyMCAxNDo0NDo0NiAtMDUwMAo+ID4gK1N1YmplY3Q6IFtQQVRDSCAxLzRdIG9zZDMybXBw
MSBCUksgYm9hcmQgYWRkZWQgIAo+IAo+IEdlbmVyYXRlIHRoZSBwYXRjaGVzIHdpdGggImdpdCBm
b3JtYXQtcGF0Y2ggLU4iLCBiZWNhdXNlIHRoZSAxLzQgaGVyZQo+IGRvZXNuJ3QgbWFrZSBhbnkg
c2Vuc2UuCgpUaGUgcGF0Y2hlcyBjb21lIGZyb20gdGhlIG9jdGF2byBnaXQgcmVwb3NpdG9yeToK
aHR0cHM6Ly9naXRodWIuY29tL29jdGF2b3N5c3RlbXMvQlJLX0RldmVsb3Blcl9QYWNrYWdlX3Bh
dGNoZXMvdHJlZS9tYXN0ZXIvdS1ib290LXYyMDIwLjAxLXN0bTMybXAKCkRvIEkgbmVlZCB0byBy
ZWZvcm1hdCB0aGVtPwoKPiAKPiA+ICsKPiA+ICtOZXcgYm9hcmQgZGVmaW5pdGlvbiBmb3IgT2N0
YXZvJ3MgT1NEMzJNUDEtQlJLCj4gPiArCj4gPiArU2lnbmVkLW9mZi1ieTogbmVlcmFqLmRhbnR1
IDxuZWVyYWouZGFudHVAb2N0YXZvc3lzdGVtcy5jb20+ICAKPiAKPiBXZSBuZWVkIHlvdXIgU2ln
bmVkLW9mZi1ieSBhZGRlZCBvbiB0aGUgcGF0Y2hlcy4KCkkgZGlkIG5vdCB3cml0ZSB0aGVzZSBw
YXRjaGVzLiBJcyBpdCBhcHByb3ByaWF0ZSB0byBhZGQgbXktc2VsZiBpbiB0aGUKU2lnbmVkLW9m
Zi1ieSB0YWc/Cgo+IEkgZG9uJ3Qga25vdyBpZiB1c2luZyB0aGUgdmVuZG9yIHByb3ZpZGVkIFUt
Qm9vdCByZXBvc2l0b3J5IHdvdWxkbid0IGJlCj4gYmV0dGVyIGhlcmUgaW5zdGVhZCBvZiBjYXJy
eWluZyB0aG9zZSBVLUJvb3QgcGF0Y2hlcyBmb3JldmVyLgoKVGhlcmUgaXMgbm8gVS1ib290IHZl
bmRvciByZXBvc2l0b3J5LCBvbmx5IHRoZSBsaXN0IG9mIHBhdGNoZXMgYXBwbGllZC4KCj4gCj4g
QWxzbywgYW5vdGhlciB0aGluZyBpcyBiYWRseSBtaXNzaW5nOiBhIHJlYWRtZS50eHQgaW4gdGhl
IGJvYXJkLwo+IGRpcmVjdG9yeSB0aGF0IGRlc2NyaWJlcyBob3cgdG8gYnVpbGQsIGZsYXNoIGFu
ZCB1c2UgdGhpcyBCdWlsZHJvb3QKPiBjb25maWd1cmF0aW9uIG9uIHRoZSBib2FyZC4KCkFscmln
aHQKClJlZ2FyZHMsCkvDtnJ5Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
