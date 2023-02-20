Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23BCEC05027
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 13:27:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BA77740591;
	Mon, 20 Feb 2023 13:27:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA77740591
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ry19Sur9D8I8; Mon, 20 Feb 2023 13:27:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B1760405A9;
	Mon, 20 Feb 2023 13:27:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B1760405A9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2C13D1BF3A8
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 13:27:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 057A541751
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 13:27:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 057A541751
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WALHJte3V0-D for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 13:27:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E277041624
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E277041624
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 13:27:36 +0000 (UTC)
Received: from 91-152-140-132.elisa-laajakaista.fi ([91.152.140.132]
 helo=momiji.lan) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1pU6Cb-008pmF-1Q; Mon, 20 Feb 2023 14:27:33 +0100
Received: from localhost (momiji.lan [local])
 by momiji.lan (OpenSMTPD) with ESMTPA id 194ba273;
 Mon, 20 Feb 2023 13:27:31 +0000 (UTC)
Date: Mon, 20 Feb 2023 15:27:27 +0200
Message-ID: <20230220152727.GB497036@igalia.com>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Thomas Devoogdt <thomas@devoogdt.com>
In-Reply-To: <CACXRmJgC3ZJeWuJXpid2RRCD7CnXu+PZ7wRfBP35dLqfOVU62w@mail.gmail.com>
References: <20230220090923.2155635-1-thomas.devoogdt@barco.com>
 <20230220090923.2155635-3-thomas.devoogdt@barco.com>
 <20230220112939.GB446957@igalia.com>
 <CACXRmJgC3ZJeWuJXpid2RRCD7CnXu+PZ7wRfBP35dLqfOVU62w@mail.gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6f7zt4t0jeuqCSHCh/9yYwW7Y/+zM73mhLJJpt08A0A=; b=VMSFyUmD4ai5Ewdv2CuZq5t+pn
 M4I41q6Zkr49TP4g0+KYWdyZKopobZ7duOAJmMKHWvu4VNsFO9Hi/1Wisxg4KEWBvUTjRTIrYqDpc
 pqO6DIFweSnOuCTkt/kDm1xEi6kpYiYQH6nCR8JOWAyWOG1YJ9KdxPuW/ClKA+LloTm4BajEfx2Nu
 nIO7RaXu3BVGXnShWA3DXnbbgb9WdZyt/7uKd4vgP54+fd4fRYui9elBVDS4AUqBKT81t31tvoAi3
 8kSHnH6vHFErUT3I1dXyXPXdC4lIAojfjdhObaHigu9yKbZPjXChbNb4RKblscV/VVNj1rY1R2inI
 DAJdLNoQ==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com
 header.a=rsa-sha256 header.s=20170329 header.b=VMSFyUmD
Subject: Re: [Buildroot] [PATCH v1 3/3] package/webkitgtk: security bump to
 version 2.38.5
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>,
 Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============5393652414426590853=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============5393652414426590853==
Content-Type: multipart/signed; boundary="N33+pT58D0253NiJ"; micalg="pgp-ripemd160"; protocol="application/pgp-signature"


--N33+pT58D0253NiJ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

T24gTW9uLCAyMCBGZWIgMjAyMyAxNDowMToyNCArMDEwMCBUaG9tYXMgRGV2b29nZHQgPHRob21h
c0BkZXZvb2dkdC5jb20+IHdyb3RlOgo+IEhpLAo+IAo+IENvbXBpbGluZyB3ZWJraXRndGsgdGFr
ZXMgc29tZSB0aW1lLCBzbyBJIHdvbid0IGNoZWNrIGFsbAo+IGFyY2hpdGVjdHVyZXMsIGJ1dCBh
dCBsZWFzdCB0aGlzIHNtYWxsIHJlcG9ydCBpcyBvazoKPiAKPiAkIGNhdCB3ZWJraXRndGsuY29u
ZmlnCj4gQlIyX1BBQ0tBR0VfWE9SRzc9eQo+IEJSMl9QQUNLQUdFX01FU0EzRD15Cj4gQlIyX1BB
Q0tBR0VfTUVTQTNEX09QRU5HTF9HTFg9eQo+IEJSMl9QQUNLQUdFX01FU0EzRF9HQUxMSVVNX0RS
SVZFUl9TV1JBU1Q9eQo+IEJSMl9QQUNLQUdFX0xJQkdUSzM9eQo+IEJSMl9QQUNLQUdFX1dFQktJ
VEdUSz15Cj4gCj4gJCAuL3V0aWxzL3Rlc3QtcGtnIC1jIHdlYmtpdGd0ay5jb25maWcgLXAgd2Vi
a2l0Z3RrCj4gICAgICAgICAgICAgICAgICAgICBib290bGluLWFybXY1LXVjbGliYyBbMS82XTog
T0sKPiAgICAgICAgICAgICAgICAgICAgICBib290bGluLWFybXY3LWdsaWJjIFsyLzZdOiBPSwo+
ICAgICAgICAgICAgICAgICAgICBib290bGluLWFybXY3bS11Y2xpYmMgWzMvNl06IFNLSVBQRUQK
PiAgICAgICAgICAgICAgICAgICAgICBib290bGluLXg4Ni02NC1tdXNsIFs0LzZdOiBPSwo+ICAg
ICAgICAgICAgICAgICAgICAgICBici1hcm0tZnVsbC1zdGF0aWMgWzUvNl06IFNLSVBQRUQKPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgc291cmNlcnktYXJtIFs2LzZdOiBTS0lQUEVECj4g
NiBidWlsZHMsIDMgc2tpcHBlZCwgMCBidWlsZCBmYWlsZWQsIDAgbGVnYWwtaW5mbyBmYWlsZWQs
IDAgc2hvdy1pbmZvIGZhaWxlZAoKTXkgQVJNNjQgYnVpbGRzIChnbGliYywgbXVzbCkgY29tcGxl
dGVkIGp1c3QgZmluZSwgdG9vIDotKQoKPiBrciwKPiAKPiBUaG9tYXMgRGV2b29nZHQKPiAKPiBP
cCBtYSAyMCBmZWIuIDIwMjMgb20gMTA6Mjkgc2NocmVlZiBBZHJpYW4gUGVyZXogZGUgQ2FzdHJv
IDxhcGVyZXpAaWdhbGlhLmNvbT46Cj4gPgo+ID4gSGkgVGhvbWFzLCBhbGwsCj4gPgo+ID4gT24g
TW9uLCAyMCBGZWIgMjAyMyAxMDowOToyMyArMDEwMCBUaG9tYXMgRGV2b29nZHQgPHRob21hc0Bk
ZXZvb2dkdC5jb20+IHdyb3RlOgo+ID4gPiBGcm9tOiBUaG9tYXMgRGV2b29nZHQgPHRob21hcy5k
ZXZvb2dkdEBnbWFpbC5jb20+Cj4gPiA+Cj4gPiA+IEJ1Z2ZpeCByZWxlYXNlLCB3aXRoIG1hbnkg
c2VjdXJpdHkgZml4ZXMsIGluY2x1ZGluZyAoYnV0IG5vdCBsaW1pdGVkIHRvKQo+ID4gPiBhIHBh
dGNoIGZvciBDVkUtMjAyMy0yMzUyOS4KPiA+ID4KPiA+ID4gUmVsZWFzZSBub3RlczoKPiA+ID4K
PiA+ID4gICBodHRwczovL3dlYmtpdGd0ay5vcmcvMjAyMy8wMi8xNS93ZWJraXRndGsyLjM4LjUt
cmVsZWFzZWQuaHRtbAo+ID4KPiA+IEhlaGUsIEkgd2FzIGp1c3QgYWJvdXQgdG8gc3VibWl0IHRo
aXMgdXBkYXRlIG15c2VsZiBhZnRlciBzbW9rZS10ZXN0aW5nCj4gPiBhIGJ1aWxkLiBUaGFua3Mg
Zm9yIHNlbmRpbmcgaXQgOi0pCj4gPgo+ID4gPiBBY2NvbXBhbnlpbmcgc2VjdXJpdHkgYWR2aXNv
cnk6Cj4gPiA+Cj4gPiA+ICAgaHR0cHM6Ly93ZWJraXRndGsub3JnL3NlY3VyaXR5L1dTQS0yMDIz
LTAwMDIuaHRtbAo+ID4gPgo+ID4gPiBBbHNvIHJhaXNlIHRoZSBtaW5pbWFsIEdDQyB2ZXJzaW9u
IHRvIDguMywgd2hpY2ggd2FzIGFscmVhZHkgcmVxdWlyZWQgc2luY2Ugd2Via2l0Z3RrLTIuMzYu
NC4KPiA+ID4gU2ltaWxhciB0byBjb21taXQgZWMxZmY4MDJkZjlhMGYxN2RkMmI3MzRiYTUzNmE1
ZTIwNmFhNWFhNCwKPiA+ID4gd2UgZG8gY2hlY2sgb24gPj0gR0NDIDgsIGJlY2F1c2Ugd2UgY2Fu
J3QgY2hlY2sgb24gPj0gR0NDIDguMy4KPiA+ID4KPiA+ID4gICBodHRwczovL2dpdGh1Yi5jb20v
V2ViS2l0L1dlYktpdC9jb21taXQvZjgxMmM1ZGIxZmYyMmJjYmUxMDcwY2E0ZWQ2MTMwODVjZDM2
NDk5Ygo+ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgRGV2b29nZHQgPHRob21hcy5k
ZXZvb2dkdEBnbWFpbC5jb20+Cj4gPgo+ID4gQWNrZWQtYnk6IEFkcmlhbiBQZXJleiBkZSBDYXN0
cm8gPGFwZXJlekBpZ2FsaWEuY29tPgo+ID4KPiA+ID4gLS0tCj4gPiA+ICBwYWNrYWdlL3dlYmtp
dGd0ay9Db25maWcuaW4gICAgICB8IDQgKystLQo+ID4gPiAgcGFja2FnZS93ZWJraXRndGsvd2Vi
a2l0Z3RrLmhhc2ggfCA4ICsrKystLS0tCj4gPiA+ICBwYWNrYWdlL3dlYmtpdGd0ay93ZWJraXRn
dGsubWsgICB8IDIgKy0KPiA+ID4gIDMgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA3
IGRlbGV0aW9ucygtKQo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS93ZWJraXRndGsv
Q29uZmlnLmluIGIvcGFja2FnZS93ZWJraXRndGsvQ29uZmlnLmluCj4gPiA+IGluZGV4IGRjNWQ3
MzhkYWUuLjk3NjM0MTA5M2UgMTAwNjQ0Cj4gPiA+IC0tLSBhL3BhY2thZ2Uvd2Via2l0Z3RrL0Nv
bmZpZy5pbgo+ID4gPiArKysgYi9wYWNrYWdlL3dlYmtpdGd0ay9Db25maWcuaW4KPiA+ID4gQEAg
LTE2LDcgKzE2LDcgQEAgY29uZmlnIEJSMl9QQUNLQUdFX1dFQktJVEdUS19BUkNIX1NVUFBPUlRT
Cj4gPiA+ICAgICAgIGRlcGVuZHMgb24gQlIyX1RPT0xDSEFJTl9IQVNfU1lOQ180Cj4gPiA+ICAg
ICAgIGRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfTElCR1BHX0VSUk9SX0FSQ0hfU1VQUE9SVFMgIyBs
aWJnY3J5cHQKPiA+ID4KPiA+ID4gLWNvbW1lbnQgIndlYmtpdGd0ayBuZWVkcyBsaWJndGszIGFu
ZCBhIHRvb2xjaGFpbiB3LyBDKyssIHdjaGFyLCB0aHJlYWRzLCBkeW5hbWljIGxpYnJhcnksIGdj
YyA+PSA3LCBob3N0IGdjYyA+PSA0LjkiCj4gPiA+ICtjb21tZW50ICJ3ZWJraXRndGsgbmVlZHMg
bGliZ3RrMyBhbmQgYSB0b29sY2hhaW4gdy8gQysrLCB3Y2hhciwgdGhyZWFkcywgZHluYW1pYyBs
aWJyYXJ5LCBnY2MgPj0gOCwgaG9zdCBnY2MgPj0gNC45Igo+ID4gPiAgICAgICBkZXBlbmRzIG9u
IEJSMl9QQUNLQUdFX1dFQktJVEdUS19BUkNIX1NVUFBPUlRTCj4gPiA+ICAgICAgIGRlcGVuZHMg
b24gIUJSMl9CSU5GTVRfRkxBVAo+ID4gPiAgICAgICBkZXBlbmRzIG9uICFCUjJfUEFDS0FHRV9M
SUJHVEszIHx8ICFCUjJfSU5TVEFMTF9MSUJTVERDUFAgfHwgXAo+ID4gPiBAQCAtMzIsNyArMzIs
NyBAQCBjb25maWcgQlIyX1BBQ0tBR0VfV0VCS0lUR1RLCj4gPiA+ICAgICAgIGRlcGVuZHMgb24g
QlIyX0hPU1RfR0NDX0FUX0xFQVNUXzRfOSAjIGljdSwgaG9zdC1ydWJ5Cj4gPiA+ICAgICAgIGRl
cGVuZHMgb24gQlIyX0lOU1RBTExfTElCU1REQ1BQCj4gPiA+ICAgICAgIGRlcGVuZHMgb24gQlIy
X1RPT0xDSEFJTl9IQVNfVEhSRUFEUyAjIHdheWxhbmQsIGljdSwgbGlic291cAo+ID4gPiAtICAg
ICBkZXBlbmRzIG9uIEJSMl9UT09MQ0hBSU5fR0NDX0FUX0xFQVNUXzcKPiA+ID4gKyAgICAgZGVw
ZW5kcyBvbiBCUjJfVE9PTENIQUlOX0dDQ19BVF9MRUFTVF84Cj4gPiA+ICAgICAgIGRlcGVuZHMg
b24gQlIyX1VTRV9XQ0hBUiAjIGljdSwgbGlic291cAo+ID4gPiAgICAgICBkZXBlbmRzIG9uIEJS
Ml9QQUNLQUdFX0xJQkdUSzMKPiA+ID4gICAgICAgZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9XRUJL
SVRHVEtfQVJDSF9TVVBQT1JUUwo+ID4gPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS93ZWJraXRndGsv
d2Via2l0Z3RrLmhhc2ggYi9wYWNrYWdlL3dlYmtpdGd0ay93ZWJraXRndGsuaGFzaAo+ID4gPiBp
bmRleCAzNGZkMTlkM2RlLi5jNzcxMjk3YjVhIDEwMDY0NAo+ID4gPiAtLS0gYS9wYWNrYWdlL3dl
YmtpdGd0ay93ZWJraXRndGsuaGFzaAo+ID4gPiArKysgYi9wYWNrYWdlL3dlYmtpdGd0ay93ZWJr
aXRndGsuaGFzaAo+ID4gPiBAQCAtMSw3ICsxLDcgQEAKPiA+ID4gLSMgRnJvbSBodHRwczovL3dl
YmtpdGd0ay5vcmcvcmVsZWFzZXMvd2Via2l0Z3RrLTIuMzguNC50YXIueHouc3Vtcwo+ID4gPiAt
bWQ1ICAxYzljYTgzYTBhZDdlNGNhOWU5MzMwOTQ1NzJjYjdkOSAgd2Via2l0Z3RrLTIuMzguNC50
YXIueHoKPiA+ID4gLXNoYTEgIDM4YjQ3ZGYyYmU5YmZiOTdkNjhmY2U4YzdmYTI4MTk5NjZhNzkw
MzYgIHdlYmtpdGd0ay0yLjM4LjQudGFyLnh6Cj4gPiA+IC1zaGEyNTYgIDRmNDdlYTI5YTJkNGQ1
ZjE1ZWVmM2RjOWUyZDZjNmYwNjdlOGRlODYzYTNmNjQ0NTVlMWNjZjk2OTNjYzFkMzYgIHdlYmtp
dGd0ay0yLjM4LjQudGFyLnh6Cj4gPiA+ICsjIEZyb20gaHR0cHM6Ly93ZWJraXRndGsub3JnL3Jl
bGVhc2VzL3dlYmtpdGd0ay0yLjM4LjUudGFyLnh6LnN1bXMKPiA+ID4gK21kNSAgZGUwNWQzMTRh
M2VjYjVmYjM4MzVlNGQ4NGY4ZjQ2NmQgIHdlYmtpdGd0ay0yLjM4LjUudGFyLnh6Cj4gPiA+ICtz
aGExICAxNzc0MzkwYzYyOGJiM2E1MjRkNGVkNzZmMTFkZTRhODc4MDc4ZGI2ICB3ZWJraXRndGst
Mi4zOC41LnRhci54ego+ID4gPiArc2hhMjU2ICA0MGMyMGM0MzAyMjI3NGRmNTg5M2YyMmIxMDU0
ZmE4OTRjM2VlYTA1NzM4OWJiMDhhZWUwOGM1YjBiYjBjMWE3ICB3ZWJraXRndGstMi4zOC41LnRh
ci54ego+ID4gPgo+ID4gPiAgIyBIYXNoZXMgZm9yIGxpY2Vuc2UgZmlsZXM6Cj4gPiA+ICBzaGEy
NTYgIDBiNWQzYTdjYzMyNTk0MjU2NzM3M2IwZWNkNzU3ZDA3YzEzMmUwZWJkN2M5N2JmYzYzZjdl
MWE3NjA5NGVkYjQgIFNvdXJjZS9XZWJDb3JlL0xJQ0VOU0UtQVBQTEUKPiA+ID4gZGlmZiAtLWdp
dCBhL3BhY2thZ2Uvd2Via2l0Z3RrL3dlYmtpdGd0ay5tayBiL3BhY2thZ2Uvd2Via2l0Z3RrL3dl
YmtpdGd0ay5tawo+ID4gPiBpbmRleCBhNjk3NGRiOTI2Li4zMjYzZjdmZWEwIDEwMDY0NAo+ID4g
PiAtLS0gYS9wYWNrYWdlL3dlYmtpdGd0ay93ZWJraXRndGsubWsKPiA+ID4gKysrIGIvcGFja2Fn
ZS93ZWJraXRndGsvd2Via2l0Z3RrLm1rCj4gPiA+IEBAIC00LDcgKzQsNyBAQAo+ID4gPiAgIwo+
ID4gPiAgIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiA+ID4KPiA+ID4gLVdFQktJVEdUS19WRVJT
SU9OID0gMi4zOC40Cj4gPiA+ICtXRUJLSVRHVEtfVkVSU0lPTiA9IDIuMzguNQo+ID4gPiAgV0VC
S0lUR1RLX1NJVEUgPSBodHRwczovL3d3dy53ZWJraXRndGsub3JnL3JlbGVhc2VzCj4gPiA+ICBX
RUJLSVRHVEtfU09VUkNFID0gd2Via2l0Z3RrLSQoV0VCS0lUR1RLX1ZFUlNJT04pLnRhci54ego+
ID4gPiAgV0VCS0lUR1RLX0lOU1RBTExfU1RBR0lORyA9IFlFUwo+ID4gPiAtLQo+ID4gPiAyLjM5
LjIKPiA+ID4KPiA+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KPiA+ID4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+ID4gPiBidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwo+ID4gPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QKPiA+ID4KPiA+Cj4gPiBDaGVlcnMsCj4gPiDigJRBZHJpw6FuCj4gX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFp
bGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKCkNoZWVycywK4oCUQWRyacOhbgo=

--N33+pT58D0253NiJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABEDAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCY/N1PwAKCRCRxVnb5MkS
O7FpAJ9b8AN08g9lsMEjr/LuZoapKF9plQCggCrQgx4bR1VW9ZJg7PSMGrI+TqU=
=9VBu
-----END PGP SIGNATURE-----

--N33+pT58D0253NiJ--

--===============5393652414426590853==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5393652414426590853==--
