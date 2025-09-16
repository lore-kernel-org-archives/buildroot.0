Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1014CAC599
	for <buildroot@archiver.kernel.org>; Tue, 16 Sep 2025 13:52:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A56160E04;
	Tue, 16 Sep 2025 13:52:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aMSsmWK3MnaU; Tue, 16 Sep 2025 13:52:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0717260DCB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0717260DCB;
	Tue, 16 Sep 2025 13:52:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E06F722F
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 13:52:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C6ED8405DC
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 13:52:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9iF-Y1hh47DT for <buildroot@buildroot.org>;
 Tue, 16 Sep 2025 13:52:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.97.179.56;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 18DF0406BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18DF0406BA
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 18DF0406BA
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 13:52:25 +0000 (UTC)
Received: from 91-153-34-249.elisa-laajakaista.fi ([91.153.34.249] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uyW6X-00CGzN-Pw; Tue, 16 Sep 2025 15:52:21 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id a4543869;
 Tue, 16 Sep 2025 13:52:20 +0000 (UTC)
Date: Tue, 16 Sep 2025 16:52:16 +0300
Message-ID: <20250916165216.GB2989466@igalia.com>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: buildroot@buildroot.org, Thomas Devoogdt <thomas@devoogdt.com>
In-Reply-To: <20250916122005.30652-1-thomas@devoogdt.com>
References: <20250916122005.30652-1-thomas@devoogdt.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HJ0WdAJ28I3b+zXowE9+7TYsI0fK4P5G0culfAkjXa4=; b=E5FwOisPowOZrV9bxsT9tAex10
 Nk86bxVo33js1bBn89bYerj0F0PMSM2qOTiS44Vznhn1JlYF37fP1PUt9DaL0BVm0ZKWjKHdgw5sd
 b/1hTz03K2SJ/cLBncQSluAeATJDDgyDRrQDmk7hGVQqplOTfoGm2qTE1XIX+L58Qknl6SVSgzZQE
 MfMeCm9O9twb3n35/WtckJhNUeCuPQMD0O5a5zfoR2x26zsWk06tLeVfGbSbCCr18cXATeO2nrggs
 j4TgUDxJVAMZC/pHDj0cb1ZcidPr1LLC63ozTV6N9atX9T2mr7Yk8eKL+42c3EM5C4oAoDU95Wtyy
 lXQeKjRw==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=E5FwOisP
Subject: Re: [Buildroot] [PATCH v1] package/webkitgtk: bump to version 2.48.6
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0702756265060052153=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============0702756265060052153==
Content-Type: multipart/signed; boundary="iTbBxPHSA0u9hkoY"; micalg="pgp-sha256"; protocol="application/pgp-signature"


--iTbBxPHSA0u9hkoY
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

SGVsbG8gVGhvbWFzLCBhbGwsCgpUaGFua3MgZm9yIHN1Ym1pdHRpbmcgdGhpcywgcGF0Y2ggTEdU
TS4KCk9uIFR1ZSwgMTYgU2VwIDIwMjUgMTQ6MjA6MDUgKzAyMDAgVGhvbWFzIERldm9vZ2R0IDx0
aG9tYXNAZGV2b29nZHQuY29tPiB3cm90ZToKPiBGaXhlcyBhIG51bWJlciBvZiBjcmFzaGVzLiBS
ZWxlYXNlIG5vdGVzOgo+IAo+ICAtIGh0dHBzOi8vd2Via2l0Z3RrLm9yZy8yMDI1LzA3LzMwL3dl
YmtpdGd0azIuNDguNC1yZWxlYXNlZC5odG1sCj4gIC0gaHR0cHM6Ly93ZWJraXRndGsub3JnLzIw
MjUvMDgvMDEvd2Via2l0Z3RrMi40OC41LXJlbGVhc2VkLmh0bWwKPiAgLSBodHRwczovL3dlYmtp
dGd0ay5vcmcvMjAyNS8wOS8wMy93ZWJraXRndGsyLjQ4LjYtcmVsZWFzZWQuaHRtbAo+IAo+IEFu
ZCBicmluZ3Mgc29tZSBzZWN1cml0eSBmaXhlcy4gU2VjdXJpdHkgYWR2aXNvcnk6Cj4gCj4gIC0g
aHR0cHM6Ly93ZWJraXRndGsub3JnL3NlY3VyaXR5L1dTQS0yMDI1LTAwMDUuaHRtbAo+IAo+IFNp
Z25lZC1vZmYtYnk6IFRob21hcyBEZXZvb2dkdCA8dGhvbWFzQGRldm9vZ2R0LmNvbT4KCkFja2Vk
LUJ5OiBBZHJpYW4gUGVyZXogZGUgQ2FzdHJvIDxhcGVyZXpAaWdhbGlhLmNvbT4KCj4gLS0tCj4g
IHBhY2thZ2Uvd2Via2l0Z3RrL3dlYmtpdGd0ay5oYXNoIHwgNiArKystLS0KPiAgcGFja2FnZS93
ZWJraXRndGsvd2Via2l0Z3RrLm1rICAgfCAyICstCj4gIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNl
cnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3dlYmtp
dGd0ay93ZWJraXRndGsuaGFzaCBiL3BhY2thZ2Uvd2Via2l0Z3RrL3dlYmtpdGd0ay5oYXNoCj4g
aW5kZXggNmMyYmViN2QxZC4uZmRlMjQzOWRkNSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3dlYmtp
dGd0ay93ZWJraXRndGsuaGFzaAo+ICsrKyBiL3BhY2thZ2Uvd2Via2l0Z3RrL3dlYmtpdGd0ay5o
YXNoCj4gQEAgLTEsNiArMSw2IEBACj4gLSMgRnJvbSBodHRwczovL3d3dy53ZWJraXRndGsub3Jn
L3JlbGVhc2VzL3dlYmtpdGd0ay0yLjQ4LjMudGFyLnh6LnN1bXMKPiAtc2hhMSAgMzZmYWYyYzMw
OTY3ZGI1NzE3NWNhZjg4Y2VmZDNkMjU3ODFhZTZkNyAgd2Via2l0Z3RrLTIuNDguMy50YXIueHoK
PiAtc2hhMjU2ICBkNGRjNTk3MGYwZmM2YTUyOWZmN2ZkNjdiY2JmYWIyYmJiNWU5MWJlNzg5YjJl
OTI3OTY0MGIzMjE3YTc4MmMzICB3ZWJraXRndGstMi40OC4zLnRhci54ego+ICsjIEZyb20gaHR0
cHM6Ly93d3cud2Via2l0Z3RrLm9yZy9yZWxlYXNlcy93ZWJraXRndGstMi40OC42LnRhci54ei5z
dW1zCj4gK3NoYTEgIDhmOGUyNzcyMmIyOWJlNWFiYTg0MzIyY2Y3MjUyZmUxNGFmY2VjNjAgIHdl
YmtpdGd0ay0yLjQ4LjYudGFyLnh6Cj4gK3NoYTI1NiAgZDlhYzMwMzRiN2EzOWMyYWFhNTY3ZTYx
MTJiMzEyNGIxNThlNTkxYTc0NDM5ZTQ2OTc0YTAzMWRkMGU0NGUyNCAgd2Via2l0Z3RrLTIuNDgu
Ni50YXIueHoKPiAgCj4gICMgSGFzaGVzIGZvciBsaWNlbnNlIGZpbGVzOgo+ICBzaGEyNTYgIDBi
NWQzYTdjYzMyNTk0MjU2NzM3M2IwZWNkNzU3ZDA3YzEzMmUwZWJkN2M5N2JmYzYzZjdlMWE3NjA5
NGVkYjQgIFNvdXJjZS9XZWJDb3JlL0xJQ0VOU0UtQVBQTEUKPiBkaWZmIC0tZ2l0IGEvcGFja2Fn
ZS93ZWJraXRndGsvd2Via2l0Z3RrLm1rIGIvcGFja2FnZS93ZWJraXRndGsvd2Via2l0Z3RrLm1r
Cj4gaW5kZXggNDE5YmVmOWQ4ZS4uY2I2NjY0MWUzZCAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3dl
YmtpdGd0ay93ZWJraXRndGsubWsKPiArKysgYi9wYWNrYWdlL3dlYmtpdGd0ay93ZWJraXRndGsu
bWsKPiBAQCAtNCw3ICs0LDcgQEAKPiAgIwo+ICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICAK
PiAtV0VCS0lUR1RLX1ZFUlNJT04gPSAyLjQ4LjMKPiArV0VCS0lUR1RLX1ZFUlNJT04gPSAyLjQ4
LjYKPiAgV0VCS0lUR1RLX1NJVEUgPSBodHRwczovL3d3dy53ZWJraXRndGsub3JnL3JlbGVhc2Vz
Cj4gIFdFQktJVEdUS19TT1VSQ0UgPSB3ZWJraXRndGstJChXRUJLSVRHVEtfVkVSU0lPTikudGFy
Lnh6Cj4gIFdFQktJVEdUS19JTlNUQUxMX1NUQUdJTkcgPSBZRVMKPiAtLSAKPiAyLjQzLjAKPiAK
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo+IAoKQ2hlZXJzLAri
gJRBZHJpw6FuCg==

--iTbBxPHSA0u9hkoY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABEIAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCaMlrkAAKCRCRxVnb5MkS
Oy5AAJ9DET7WoHvzirKqvjzXsmsqIzFBowCePXN3Q8SzDS2S0aa/ES2FWSLxCgU=
=//6b
-----END PGP SIGNATURE-----

--iTbBxPHSA0u9hkoY--

--===============0702756265060052153==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0702756265060052153==--
