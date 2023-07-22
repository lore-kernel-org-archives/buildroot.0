Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BECC8EB64DA
	for <buildroot@archiver.kernel.org>; Sat, 22 Jul 2023 06:53:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3F4BD402E8;
	Sat, 22 Jul 2023 06:53:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3F4BD402E8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W-GfGZ6lAQwN; Sat, 22 Jul 2023 06:53:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 73A6B40359;
	Sat, 22 Jul 2023 06:53:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 73A6B40359
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 76AB21BF5A7
 for <buildroot@lists.busybox.net>; Sat, 22 Jul 2023 06:53:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4EA3E4174C
 for <buildroot@lists.busybox.net>; Sat, 22 Jul 2023 06:53:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4EA3E4174C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 35Zm4tccUkRD for <buildroot@lists.busybox.net>;
 Sat, 22 Jul 2023 06:53:33 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ACC5C416B6
 for <buildroot@buildroot.org>; Sat, 22 Jul 2023 06:53:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ACC5C416B6
Received: from fli4l.lan.fli4l (p54a1b341.dip0.t-ipconnect.de [84.161.179.65])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B48E4A4C0930;
 Sat, 22 Jul 2023 08:53:28 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33646)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qN6Ua-0007ro-1U;
 Sat, 22 Jul 2023 08:53:28 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 22 Jul 2023 08:53:24 +0200
Message-Id: <20230722065324.18202-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230722065324.18202-1-bernd@kuhls.net>
References: <20230722065324.18202-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1690008808;
 bh=2prHi6I8q4h/54aBTJKa6j7aKlfbdleo8tS2IREbIuw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=few4kR8L1Tw5/fe7w4n9Hz3U6wxBMRI1sg27CtnGoNCP5/rUID0lurqd0/eBt30Zw
 oesQH6COkN6/DfLVFczoSm5aWfDq95ujYzVTEMdbrrwX0DMGKrdfsVIXtIpM1+Ncsz
 CH/qjuUeUn9mx9GKgoy2HH1C02t1l4QvkRgUvJlfGliegJil2ctZmYMhDWiqnQLSed
 /d+faOKjMX5KzwBTogrFKEgp+nzIBqn0d2R8ipmDFfuKfpJUvuLX+ZaRUreMHtp0oz
 1NdFP/xShwUpE3WLueKGJGiEWDxUZ/6oHtSpj9P9YZVOG5gd7DkiFNVFDdL40hGNgg
 jENjMxVGGypyQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=few4kR8L
Subject: [Buildroot] [PATCH v3 2/2] package/onevpl-intel-gpu: new package
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJvbTogQmVybmQgS3VobHMgPGJlcm5kLmt1aGxzQHQtb25saW5lLmRlPgoKU2lnbmVkLW9mZi1i
eTogQmVybmQgS3VobHMgPGJlcm5kQGt1aGxzLm5ldD4KLS0tCnYzOiBidW1wIHRvIDIzLjMuMAp2
MjogYnVtcCB0byAyMy4yLjQKCiBERVZFTE9QRVJTICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgfCAgMSArCiBwYWNrYWdlL0NvbmZpZy5pbiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgfCAgMSArCiBwYWNrYWdlL29uZXZwbC1pbnRlbC1ncHUvQ29uZmlnLmluICAgICAgICAg
ICAgfCAyMyArKysrKysrKysrKysrKysrKysrCiAuLi4vb25ldnBsLWludGVsLWdwdS9vbmV2cGwt
aW50ZWwtZ3B1Lmhhc2ggICAgfCAgMyArKysKIHBhY2thZ2Uvb25ldnBsLWludGVsLWdwdS9vbmV2
cGwtaW50ZWwtZ3B1Lm1rICB8IDEzICsrKysrKysrKysrCiA1IGZpbGVzIGNoYW5nZWQsIDQxIGlu
c2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL29uZXZwbC1pbnRlbC1ncHUv
Q29uZmlnLmluCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9vbmV2cGwtaW50ZWwtZ3B1L29u
ZXZwbC1pbnRlbC1ncHUuaGFzaAogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2Uvb25ldnBsLWlu
dGVsLWdwdS9vbmV2cGwtaW50ZWwtZ3B1Lm1rCgpkaWZmIC0tZ2l0IGEvREVWRUxPUEVSUyBiL0RF
VkVMT1BFUlMKaW5kZXggMDc0ZmQ5YzU5Ny4uYzViZTc0N2IzZSAxMDA2NDQKLS0tIGEvREVWRUxP
UEVSUworKysgYi9ERVZFTE9QRVJTCkBAIC00MTYsNiArNDE2LDcgQEAgRjoJcGFja2FnZS9tcGcx
MjMvCiBGOglwYWNrYWdlL250cC8KIEY6CXBhY2thZ2UvbnV0LwogRjoJcGFja2FnZS9vbmV2cGwv
CitGOglwYWNrYWdlL29uZXZwbC1pbnRlbC1ncHUvCiBGOglwYWNrYWdlL29wdXMvCiBGOglwYWNr
YWdlL3BjaXV0aWxzLwogRjoJcGFja2FnZS9wZXJsLWNyeXB0LW9wZW5zc2wtZ3Vlc3MvCmRpZmYg
LS1naXQgYS9wYWNrYWdlL0NvbmZpZy5pbiBiL3BhY2thZ2UvQ29uZmlnLmluCmluZGV4IDBlMTg0
MzNhMzYuLjNjNDE2OTcxYmYgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvQ29uZmlnLmluCisrKyBiL3Bh
Y2thZ2UvQ29uZmlnLmluCkBAIC0xNjM1LDYgKzE2MzUsNyBAQCBtZW51ICJHcmFwaGljcyIKIAlz
b3VyY2UgInBhY2thZ2UvbGlid3BlL0NvbmZpZy5pbiIKIAlzb3VyY2UgInBhY2thZ2UvbWVudS1j
YWNoZS9Db25maWcuaW4iCiAJc291cmNlICJwYWNrYWdlL29uZXZwbC9Db25maWcuaW4iCisJc291
cmNlICJwYWNrYWdlL29uZXZwbC1pbnRlbC1ncHUvQ29uZmlnLmluIgogCXNvdXJjZSAicGFja2Fn
ZS9vcGVuY2wtY2xocHAvQ29uZmlnLmluIgogCXNvdXJjZSAicGFja2FnZS9vcGVuY3YzL0NvbmZp
Zy5pbiIKIAlzb3VyY2UgInBhY2thZ2Uvb3BlbmN2NC9Db25maWcuaW4iCmRpZmYgLS1naXQgYS9w
YWNrYWdlL29uZXZwbC1pbnRlbC1ncHUvQ29uZmlnLmluIGIvcGFja2FnZS9vbmV2cGwtaW50ZWwt
Z3B1L0NvbmZpZy5pbgpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi5hMGNh
OWUzZDdkCi0tLSAvZGV2L251bGwKKysrIGIvcGFja2FnZS9vbmV2cGwtaW50ZWwtZ3B1L0NvbmZp
Zy5pbgpAQCAtMCwwICsxLDIzIEBACitjb25maWcgQlIyX1BBQ0tBR0VfT05FVlBMX0lOVEVMX0dQ
VQorCWJvb2wgIm9uZXZwbC1pbnRlbC1ncHUiCisJZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9PTkVW
UExfQVJDSF9TVVBQT1JUUyAjIG9uZXZwbAorCWRlcGVuZHMgb24gQlIyX0lOU1RBTExfTElCU1RE
Q1BQICMgb25ldnBsCisJZGVwZW5kcyBvbiAhQlIyX1NUQVRJQ19MSUJTICMgb25ldnBsCisJZGVw
ZW5kcyBvbiBCUjJfVE9PTENIQUlOX0dDQ19BVF9MRUFTVF83ICMgb25ldnBsCisJZGVwZW5kcyBv
biBCUjJfVE9PTENIQUlOX0hBU19TWU5DXzEgIyBpbnRlbC1tZWRpYWRyaXZlciAtPiBtZXNhM2QK
KwlkZXBlbmRzIG9uIEJSMl9UT09MQ0hBSU5fSEFTX1RIUkVBRFMgIyBvbmV2cGwKKwlkZXBlbmRz
IG9uIEJSMl9UT09MQ0hBSU5fSEFTX1RIUkVBRFNfTlBUTCAjIGludGVsLW1lZGlhZHJpdmVyIC0+
IG1lc2EzZAorCXNlbGVjdCBCUjJfUEFDS0FHRV9JTlRFTF9NRURJQURSSVZFUiAjIHJ1bnRpbWUK
KwlzZWxlY3QgQlIyX1BBQ0tBR0VfTElCVkEKKwlzZWxlY3QgQlIyX1BBQ0tBR0VfT05FVlBMCisJ
aGVscAorCSAgSW50ZWzCriBvbmVWUEwgR1BVIFJ1bnRpbWUgaXMgYSBSdW50aW1lIGltcGxlbWVu
dGF0aW9uIG9mCisJICBvbmVWUEwgQVBJIGZvciBJbnRlbCBHZW4gR1BVcywgc3RhcnRpbmcgd2l0
aCBUaWdlciBMYWtlLgorCisJICBodHRwczovL2dpdGh1Yi5jb20vb25lYXBpLXNyYy9vbmVWUEwt
aW50ZWwtZ3B1CisKK2NvbW1lbnQgIm9uZXZwbC1pbnRlbC1ncHUgbmVlZHMgYSB0b29sY2hhaW4g
dy8gZHluYW1pYyBsaWJyYXJ5LCBnY2MgPj0gNywgQysrLCBOUFRMIgorCWRlcGVuZHMgb24gQlIy
X1BBQ0tBR0VfT05FVlBMX0FSQ0hfU1VQUE9SVFMKKwlkZXBlbmRzIG9uIEJSMl9UT09MQ0hBSU5f
SEFTX1NZTkNfMQorCWRlcGVuZHMgb24gQlIyX1NUQVRJQ19MSUJTIHx8ICFCUjJfVE9PTENIQUlO
X0dDQ19BVF9MRUFTVF83IHx8IFwKKwkJIUJSMl9JTlNUQUxMX0xJQlNURENQUCB8fCAhQlIyX1RP
T0xDSEFJTl9IQVNfVEhSRUFEUwpkaWZmIC0tZ2l0IGEvcGFja2FnZS9vbmV2cGwtaW50ZWwtZ3B1
L29uZXZwbC1pbnRlbC1ncHUuaGFzaCBiL3BhY2thZ2Uvb25ldnBsLWludGVsLWdwdS9vbmV2cGwt
aW50ZWwtZ3B1Lmhhc2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uOTVi
NmQ4NjdiOQotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2Uvb25ldnBsLWludGVsLWdwdS9vbmV2
cGwtaW50ZWwtZ3B1Lmhhc2gKQEAgLTAsMCArMSwzIEBACisjIExvY2FsbHkgY29tcHV0ZWQKK3No
YTI1NiAgMWNmNjEzYjBkM2M1MDA5NjJhMjk5ZmM1YjY4ODc4OWYzMTUwZDcwMDE2ZjRmNzM1ZmM3
M2Q5NWYyMmUyZTk2ZSAgb25ldnBsLWludGVsLWdwdS0yMy4zLjAudGFyLmd6CitzaGEyNTYgIGMz
MWMzY2M1ZmQ2NmQxMjUwZGJjYTFjM2Q5MDExYTlmODc0NTM3NDQyYWM3MWM4ZGU4MGYyZjBmZWQx
M2YyOTcgIExJQ0VOU0UKZGlmZiAtLWdpdCBhL3BhY2thZ2Uvb25ldnBsLWludGVsLWdwdS9vbmV2
cGwtaW50ZWwtZ3B1Lm1rIGIvcGFja2FnZS9vbmV2cGwtaW50ZWwtZ3B1L29uZXZwbC1pbnRlbC1n
cHUubWsKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uOTEyMTA0MmNiNgot
LS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2Uvb25ldnBsLWludGVsLWdwdS9vbmV2cGwtaW50ZWwt
Z3B1Lm1rCkBAIC0wLDAgKzEsMTMgQEAKKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCisjCisjIG9u
ZXZwbC1pbnRlbC1ncHUKKyMKKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCisKK09ORVZQTF9JTlRF
TF9HUFVfVkVSU0lPTiA9IDIzLjMuMAorT05FVlBMX0lOVEVMX0dQVV9TSVRFID0gJChjYWxsIGdp
dGh1YixvbmVhcGktc3JjLG9uZVZQTC1pbnRlbC1ncHUsaW50ZWwtb25ldnBsLSQoT05FVlBMX0lO
VEVMX0dQVV9WRVJTSU9OKSkKK09ORVZQTF9JTlRFTF9HUFVfTElDRU5TRSA9IE1JVAorT05FVlBM
X0lOVEVMX0dQVV9MSUNFTlNFX0ZJTEVTID0gTElDRU5TRQorT05FVlBMX0lOVEVMX0dQVV9ERVBF
TkRFTkNJRVMgPSBsaWJ2YSBvbmV2cGwKKworJChldmFsICQoY21ha2UtcGFja2FnZSkpCi0tIAoy
LjM5LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
