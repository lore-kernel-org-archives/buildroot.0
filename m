Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A171C433EF
	for <buildroot@archiver.kernel.org>; Mon, 21 Feb 2022 15:17:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B6AD408CE;
	Mon, 21 Feb 2022 15:17:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0KFPc6L4GeCO; Mon, 21 Feb 2022 15:17:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2475840270;
	Mon, 21 Feb 2022 15:17:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 273361BF2C1
 for <buildroot@lists.busybox.net>; Mon, 21 Feb 2022 15:17:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 157D64025F
 for <buildroot@lists.busybox.net>; Mon, 21 Feb 2022 15:17:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kfhWch6Wl6L7 for <buildroot@lists.busybox.net>;
 Mon, 21 Feb 2022 15:17:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8FFF640270
 for <buildroot@buildroot.org>; Mon, 21 Feb 2022 15:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Qh3PAyF5wP0D7U3ST95Bde/HNqMELC6LBKcF6RskUVk=; b=gF4eDwg9yU+PelLM4+XmEIx9xU
 EGCzggI7g2HU4F5Kwpm55SfFfikwz7HD0XoVQhE6Sa5+y7C8tUbFfPImfr1wPefDo+brFJTxvi687
 +qdBIGd8+eqPLpzVzYCRMGlx5dECpSYO8KCYQQAjDBdurFJqvPZ04kY6U54OJQM+LvDWlX2XFDTQQ
 7MrLlHxONcqmnteuRcMX/4tna9I6ls4KO95TC7ZegzLUXFC+WOV0RkdWkYItME1XnTrwk9HQhFLvA
 fJbudQz4sAlsXU/qdz2+9V9qu1XR93xAN9f+8Dd0C+K1MJOs1hEV88aDGs69rb0tHRANOhR1GWhvX
 MikD0nWQ==;
Received: from 163.179.165.83.dynamic.reverse-mundo-r.com ([83.165.179.163]
 helo=momiji) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1nMAQv-0008kl-Nh; Mon, 21 Feb 2022 16:17:01 +0100
Received: from localhost (momiji [local])
 by momiji (OpenSMTPD) with ESMTPA id a4a41d9c;
 Mon, 21 Feb 2022 15:16:52 +0000 (UTC)
Date: Mon, 21 Feb 2022 16:16:48 +0100
Message-ID: <20220221161648.GB1133490@momiji>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <87o8319t47.fsf@dell.be.48ers.dk>
References: <20220217230908.1532564-1-aperez@igalia.com>
 <87o8319t47.fsf@dell.be.48ers.dk>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/webkitgtk: security bump to
 2.34.6
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
Content-Type: multipart/mixed; boundary="===============2126263646274850830=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============2126263646274850830==
Content-Type: multipart/signed; boundary="+fnWCDMRsjfZsPRJ"; micalg="pgp-sha1"; protocol="application/pgp-signature"


--+fnWCDMRsjfZsPRJ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

SGkgUGV0ZXIsIGFsbCwKCk9uIFN1biwgMjAgRmViIDIwMjIgMjE6MzI6MjQgKzAxMDAgUGV0ZXIg
S29yc2dhYXJkIDxwZXRlckBrb3JzZ2FhcmQuY29tPiB3cm90ZToKPiA+Pj4+PiAiQWRyaWFuIiA9
PSBBZHJpYW4gUGVyZXogZGUgQ2FzdHJvIDxhcGVyZXpAaWdhbGlhLmNvbT4gd3JpdGVzOgo+IAo+
ICA+IFVwZGF0ZSB0byBhIG5ldyBtYWpvciByZWxlYXNlIHdoaWNoIGJyaW5ncyBpbiBpbXByb3Zl
bWVudHMsIGEgbnVtYmVyIG9mCj4gID4gbmV3IGZlYXR1cmVzLCBhbmQgc2VjdXJpdHkgZml4ZXMu
IFJlbGVhc2Ugbm90ZXM6Cj4gCj4gID4gICBodHRwczovL3dlYmtpdGd0ay5vcmcvMjAyMS8wOS8y
Mi93ZWJraXRndGsyLjM0LjAtcmVsZWFzZWQuaHRtbAo+ICA+ICAgaHR0cHM6Ly93ZWJraXRndGsu
b3JnLzIwMjEvMTAvMjEvd2Via2l0Z3RrMi4zNC4xLXJlbGVhc2VkLmh0bWwKPiAgPiAgIGh0dHBz
Oi8vd2Via2l0Z3RrLm9yZy8yMDIxLzExLzI0L3dlYmtpdGd0azIuMzQuMi1yZWxlYXNlZC5odG1s
Cj4gID4gICBodHRwczovL3dlYmtpdGd0ay5vcmcvMjAyMS8xMi8yMC93ZWJraXRndGsyLjM0LjMt
cmVsZWFzZWQuaHRtbAo+ICA+ICAgaHR0cHM6Ly93ZWJraXRndGsub3JnLzIwMjIvMDEvMjEvd2Vi
a2l0Z3RrMi4zNC40LXJlbGVhc2VkLmh0bWwKPiAgPiAgIGh0dHBzOi8vd2Via2l0Z3RrLm9yZy8y
MDIyLzAyLzA5L3dlYmtpdGd0azIuMzQuNS1yZWxlYXNlZC5odG1sCj4gID4gICBodHRwczovL3dl
YmtpdGd0ay5vcmcvMjAyMi8wMi8xNy93ZWJraXRndGsyLjM0LjYtcmVsZWFzZWQuaHRtbAo+IAo+
ICA+IFNlY3VyaXR5IGFkdmlzb3JpZXM6Cj4gCj4gID4gICBodHRwczovL3dlYmtpdGd0ay5vcmcv
c2VjdXJpdHkvV1NBLTIwMjEtMDAwNy5odG1sCj4gID4gICBodHRwczovL3dlYmtpdGd0ay5vcmcv
c2VjdXJpdHkvV1NBLTIwMjItMDAwMS5odG1sCj4gID4gICBodHRwczovL3dlYmtpdGd0ay5vcmcv
c2VjdXJpdHkvV1NBLTIwMjItMDAwMi5odG1sCj4gID4gICBodHRwczovL3dlYmtpdGd0ay5vcmcv
c2VjdXJpdHkvV1NBLTIwMjItMDAwMy5odG1sCj4gCj4gID4gU29tZSBvZiB0aGUgbmV3IGZlYXR1
cmVzIHJlcXVpcmUgYWRkaXRpb25hbCBkZXBlbmRlbmNpZXM6IEhUVFAvMgo+ICA+IHJlcXVpcmVz
IGxpYnNvdXAzLCB3aGljaCBpcyBub3QgeWV0IHBhY2thZ2VkIGluIEJ1aWxkcm9vdCwgYW5kCj4g
ID4gZGlzYWJsZWQgYXQgdGhlIG1vbWVudCAod2l0aCAtRFVTRV9TT1VQMj1PTiwgdG8ga2VlcCB1
c2luZyBsaWJzb3VwMik7Cj4gID4gYW5kIHRoZSBjb2xvciBtYW5hZ2VtZW50IHN1cHBvcnQgbmVl
ZHMgTENNUzIgKHdoaWNoIHdpbGwgYmUgZW5hYmxlZAo+ICA+IGluIGEgZm9sbG93LXVwIHBhdGNo
LikKPiAKPiAgPiBPcHRpb25zIFNJTEVOQ0VfQ1JPU1NfQ09NUElMQVRJT05fTk9USUNFUyBhbmQg
RU5BQkxFX0dSQVBISUNTX0NPTlRFWFRfR0wKPiAgPiBkbyBub3QgZXhpc3QgYW55bW9yZSwgYW5k
IHRoZWlyIHVzYWdlIGlzIGRyb3BwZWQuCj4gCj4gID4gU2lnbmVkLW9mZi1ieTogQWRyaWFuIFBl
cmV6IGRlIENhc3RybyA8YXBlcmV6QGlnYWxpYS5jb20+Cj4gID4gLS0tCj4gID4gIHBhY2thZ2Uv
d2Via2l0Z3RrL3dlYmtpdGd0ay5oYXNoIHwgIDggKysrKy0tLS0KPiAgPiAgcGFja2FnZS93ZWJr
aXRndGsvd2Via2l0Z3RrLm1rICAgfCAxNCArKysrKy0tLS0tLS0tLQo+ICA+ICAyIGZpbGVzIGNo
YW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pCj4gCj4gID4gZGlmZiAtLWdp
dCBhL3BhY2thZ2Uvd2Via2l0Z3RrL3dlYmtpdGd0ay5oYXNoIGIvcGFja2FnZS93ZWJraXRndGsv
d2Via2l0Z3RrLmhhc2gKPiAgPiBpbmRleCA3Y2I2YzkwYjIxLi44MmMyMTBjOGY5IDEwMDY0NAo+
ICA+IC0tLSBhL3BhY2thZ2Uvd2Via2l0Z3RrL3dlYmtpdGd0ay5oYXNoCj4gID4gKysrIGIvcGFj
a2FnZS93ZWJraXRndGsvd2Via2l0Z3RrLmhhc2gKPiAgPiBAQCAtMSw3ICsxLDcgQEAKPiAgPiAt
IyBGcm9tIGh0dHBzOi8vd2Via2l0Z3RrLm9yZy9yZWxlYXNlcy93ZWJraXRndGstMi4zMi40LnRh
ci54ei5zdW1zCj4gID4gLW1kNSAgNTFhMTY3ZTVkMDNiYWNmMzBjNWM1ODhlNmFhMjMxNDMgIHdl
YmtpdGd0ay0yLjMyLjQudGFyLnh6Cj4gID4gLXNoYTEgIGY3MjU1ZmZiNDg4ZTcyN2U5ZTI1MGUw
ZGFlOWYxOTIyNjZmNTBmMDEgIHdlYmtpdGd0ay0yLjMyLjQudGFyLnh6Cj4gID4gLXNoYTI1NiAg
MDBjZTJkM2Y3OThkN2JjNWU5MDM5ZDkwNTlmMGMzYzk3NGQ1MWRlMzhjOGI3MTZmMDBlOTQ0NTJh
MTc3ZDNmZCAgd2Via2l0Z3RrLTIuMzIuNC50YXIueHoKPiAgPiArIyBGcm9tIGh0dHBzOi8vd2Vi
a2l0Z3RrLm9yZy9yZWxlYXNlcy93ZWJraXRndGstMi4zNC42LnRhci54ei5zdW1zCj4gID4gK21k
NSAgYTVlZWVkZDAyZjViNGJiYThiZDg5MWI5MmRjNzQzZDQgIHdlYmtpdGd0ay0yLjM0LjYudGFy
Lnh6Cj4gID4gK3NoYTEgIGJiODI1MTcyODliYWY5Yzg1OGZhNDA2ZDFkODQ1Mjc0ZjgxZTI1Y2Ig
IHdlYmtpdGd0ay0yLjM0LjYudGFyLnh6Cj4gID4gK3NoYTI1NiAgNmJjOGZkMDM0YWFkMDQzMmEy
NDU5Y2U0ZmM3ZWUyNWFkNjVhNDkyNGM2MThiZjhkOTNiNTJiMGMxYTg0YzFmNiAgd2Via2l0Z3Rr
LTIuMzQuNi50YXIueHoKPiAgCj4gID4gICMgSGFzaGVzIGZvciBsaWNlbnNlIGZpbGVzOgo+ICA+
ICBzaGEyNTYgIDBiNWQzYTdjYzMyNTk0MjU2NzM3M2IwZWNkNzU3ZDA3YzEzMmUwZWJkN2M5N2Jm
YzYzZjdlMWE3NjA5NGVkYjQgIFNvdXJjZS9XZWJDb3JlL0xJQ0VOU0UtQVBQTEUKPiAgPiBkaWZm
IC0tZ2l0IGEvcGFja2FnZS93ZWJraXRndGsvd2Via2l0Z3RrLm1rIGIvcGFja2FnZS93ZWJraXRn
dGsvd2Via2l0Z3RrLm1rCj4gID4gaW5kZXggMTZiOTI1ZmU3MS4uZjRmYzFlNzgzOCAxMDA2NDQK
PiAgPiAtLS0gYS9wYWNrYWdlL3dlYmtpdGd0ay93ZWJraXRndGsubWsKPiAgPiArKysgYi9wYWNr
YWdlL3dlYmtpdGd0ay93ZWJraXRndGsubWsKPiAgPiBAQCAtNCw3ICs0LDcgQEAKPiAgPiAgIwo+
ICA+ICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICAKPiAgPiAtV0VCS0lUR1RLX1ZFUlNJT04g
PSAyLjMyLjQKPiAgPiArV0VCS0lUR1RLX1ZFUlNJT04gPSAyLjM0LjYKPiAgPiAgV0VCS0lUR1RL
X1NJVEUgPSBodHRwczovL3d3dy53ZWJraXRndGsub3JnL3JlbGVhc2VzCj4gID4gIFdFQktJVEdU
S19TT1VSQ0UgPSB3ZWJraXRndGstJChXRUJLSVRHVEtfVkVSU0lPTikudGFyLnh6Cj4gID4gIFdF
QktJVEdUS19JTlNUQUxMX1NUQUdJTkcgPSBZRVMKPiAgPiBAQCAtMjQsMTAgKzI0LDExIEBAIFdF
QktJVEdUS19DT05GX09QVFMgPSBcCj4gID4gIAktREVOQUJMRV9NSU5JQlJPV1NFUj1PTiBcCj4g
ID4gIAktREVOQUJMRV9TUEVMTENIRUNLPU9OIFwKPiAgPiAgCS1EUE9SVD1HVEsgXAo+ICA+IC0J
LURTSUxFTkNFX0NST1NTX0NPTVBJTEFUSU9OX05PVElDRVM9T04gXAo+ICA+ICsJLURVU0VfTENN
Uz1PRkYgXAo+ICA+ICAJLURVU0VfTElCTk9USUZZPU9GRiBcCj4gID4gIAktRFVTRV9MSUJIWVBI
RU49T0ZGIFwKPiAgPiAgCS1EVVNFX09QRU5KUEVHPU9OIFwKPiAgPiArCS1EVVNFX1NPVVAyPU9O
IFwKPiAgPiAgCS1EVVNFX1dPRkYyPU9OCj4gIAo+IAo+IFRoaXMgaXMgYXBwYXJlbnRseSBub3Qg
YWdhaW5zdCBtYXN0ZXIsIGFzIG1hc3RlciBoYXMKPiAtRFVTRV9XUEVfUkVOREVSRVI9T0ZGIGhl
cmUgc2luY2UgeW91ciBjb21taXQgMzhiNzQwZWM2ZjQ0YjQKPiAocGFja2FnZS93ZWJraXRndGs6
IGJ1bXAgdG8gdmVyc2lvbiAyLjI2LjApPwo+Cj4gUGxlYXNlIHNlbmQgcGF0Y2hlcyBhZ2FpbnN0
IGN1cnJlbnQgZ2l0Lgo+IAo+IENvbW1pdHRlZCB0byBtYXN0ZXIgYWZ0ZXIgZml4aW5nIHRoYXQg
dXAsIHRoYW5rcy4KCkFoLCBzb3JyeSBhYm91dCB0aGlzLCBhbmQgdGhhbmtzIGZvciBmaXhpbmcg
dXAgbXkgbWlzdGFrZSAtLSBJIGRpZCBoYXZlIGFuCmFkZGl0aW9uYWwgY29tbWl0IGluIGxvY2Fs
IHdvcmsgYnJhbmNoLCB3aGljaCBJIHBsYW5uZWQgdG8gc3VibWl0IHNlcGFyYXRlbHkKYW5kIEkg
c2hvdWxkIGhhdmUgcmVvcmRlcmVkIG15IGNvbW1pdHMgYmVmb3JlaGFuZCB0byBtYWtlIHRoZSB0
d28gcGF0Y2hlcwpuZWVkZWQgZm9yIHRoZSAyLjM0IHVwZGF0ZSBhcHBseSBjbGVhbmx5IPCfpKYK
CkNoZWVycywK4oCUQWRyacOhbgo=

--+fnWCDMRsjfZsPRJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCYhOs4AAKCRCRxVnb5MkS
O9ImAJ9OAU4V9vRpCY5Dy/VFYCjzXrDs+gCfQ3ZfvuN+bAiLqaOBpSKoXAYuOho=
=+TO5
-----END PGP SIGNATURE-----

--+fnWCDMRsjfZsPRJ--

--===============2126263646274850830==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2126263646274850830==--
