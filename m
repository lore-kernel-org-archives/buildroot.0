Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 403CDEB64D9
	for <buildroot@archiver.kernel.org>; Thu,  6 Jul 2023 17:01:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CB1AB415A0;
	Thu,  6 Jul 2023 17:01:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB1AB415A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qH10u1f4Chku; Thu,  6 Jul 2023 17:01:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B5B07415AB;
	Thu,  6 Jul 2023 17:01:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B5B07415AB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 411ED1BF3DE
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 17:01:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 198D6415AB
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 17:01:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 198D6415AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dH81ba68P1zU for <buildroot@lists.busybox.net>;
 Thu,  6 Jul 2023 17:01:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0576E415A1
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0576E415A1
 for <buildroot@buildroot.org>; Thu,  6 Jul 2023 17:01:32 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cfe4.dip0.t-ipconnect.de [79.214.207.228])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C3FB4A4C0EF5;
 Thu,  6 Jul 2023 19:01:18 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36788)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qHSM2-0007xh-1j;
 Thu, 06 Jul 2023 19:01:18 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu,  6 Jul 2023 19:01:06 +0200
Message-Id: <20230706170106.10825-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230706170106.10825-1-bernd@kuhls.net>
References: <20230706170106.10825-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1688662878;
 bh=8HGJUHz0NPFiqRHcgRZj+Thgy1vJQ1ejfdTZFjGDKrc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=knOZlKdTjB9YxXrpJ2ziflj3g7zF+xWnLSiRt8qQWAF2m2a1BI0TSKwY9Q6pYYDNy
 GyFJctD0bBgf6k62gh9Tmh95/p6UU7D8Nyl/e2HVih0y407WXGcFxSCDMByaaYaMdu
 rrkw+qORGM9EJHYTXeATaGREECvqXzR88xbGZewpxTfTzRDp+Tgtip4iz97dlIqcTA
 zof6+eAbFYqmQv1Op8OIZHuxpVNv3HscxiDpIRcMA0X6lVVfQDS7mvS0cToNqdKUTZ
 uz4x0Dr7AdeSWSy0I3YXs732ivhIvht7gPSiY/K71aFt8qey396WsIKUdWdp3saDTn
 rQk9lPf/qC4NA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=knOZlKdT
Subject: [Buildroot] [PATCH v2 2/2] package/onevpl-intel-gpu: new package
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
eTogQmVybmQgS3VobHMgPGJlcm5kQGt1aGxzLm5ldD4KLS0tCnYyOiBidW1wIHRvIDIzLjIuNAoK
IERFVkVMT1BFUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxICsKIHBh
Y2thZ2UvQ29uZmlnLmluICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxICsKIHBhY2th
Z2Uvb25ldnBsLWludGVsLWdwdS9Db25maWcuaW4gICAgICAgICAgICB8IDIzICsrKysrKysrKysr
KysrKysrKysKIC4uLi9vbmV2cGwtaW50ZWwtZ3B1L29uZXZwbC1pbnRlbC1ncHUuaGFzaCAgICB8
ICAzICsrKwogcGFja2FnZS9vbmV2cGwtaW50ZWwtZ3B1L29uZXZwbC1pbnRlbC1ncHUubWsgIHwg
MTMgKysrKysrKysrKysKIDUgZmlsZXMgY2hhbmdlZCwgNDEgaW5zZXJ0aW9ucygrKQogY3JlYXRl
IG1vZGUgMTAwNjQ0IHBhY2thZ2Uvb25ldnBsLWludGVsLWdwdS9Db25maWcuaW4KIGNyZWF0ZSBt
b2RlIDEwMDY0NCBwYWNrYWdlL29uZXZwbC1pbnRlbC1ncHUvb25ldnBsLWludGVsLWdwdS5oYXNo
CiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9vbmV2cGwtaW50ZWwtZ3B1L29uZXZwbC1pbnRl
bC1ncHUubWsKCmRpZmYgLS1naXQgYS9ERVZFTE9QRVJTIGIvREVWRUxPUEVSUwppbmRleCA4OTFi
OWYzYjQ4Li5mNmExNTRhNGEwIDEwMDY0NAotLS0gYS9ERVZFTE9QRVJTCisrKyBiL0RFVkVMT1BF
UlMKQEAgLTQxMiw2ICs0MTIsNyBAQCBGOglwYWNrYWdlL21pbmlkbG5hLwogRjoJcGFja2FnZS9t
anBnLXN0cmVhbWVyLwogRjoJcGFja2FnZS9udXQvCiBGOglwYWNrYWdlL29uZXZwbC8KK0Y6CXBh
Y2thZ2Uvb25ldnBsLWludGVsLWdwdS8KIEY6CXBhY2thZ2UvcGVybC1jcnlwdC1vcGVuc3NsLWd1
ZXNzLwogRjoJcGFja2FnZS9wZXJsLWNyeXB0LW9wZW5zc2wtcmFuZG9tLwogRjoJcGFja2FnZS9w
ZXJsLWNyeXB0LW9wZW5zc2wtcnNhLwpkaWZmIC0tZ2l0IGEvcGFja2FnZS9Db25maWcuaW4gYi9w
YWNrYWdlL0NvbmZpZy5pbgppbmRleCBjYWVkOGVkOTA0Li43YjNlZGQ0NDk2IDEwMDY0NAotLS0g
YS9wYWNrYWdlL0NvbmZpZy5pbgorKysgYi9wYWNrYWdlL0NvbmZpZy5pbgpAQCAtMTYzNCw2ICsx
NjM0LDcgQEAgbWVudSAiR3JhcGhpY3MiCiAJc291cmNlICJwYWNrYWdlL2xpYndwZS9Db25maWcu
aW4iCiAJc291cmNlICJwYWNrYWdlL21lbnUtY2FjaGUvQ29uZmlnLmluIgogCXNvdXJjZSAicGFj
a2FnZS9vbmV2cGwvQ29uZmlnLmluIgorCXNvdXJjZSAicGFja2FnZS9vbmV2cGwtaW50ZWwtZ3B1
L0NvbmZpZy5pbiIKIAlzb3VyY2UgInBhY2thZ2Uvb3BlbmNsLWNsaHBwL0NvbmZpZy5pbiIKIAlz
b3VyY2UgInBhY2thZ2Uvb3BlbmN2My9Db25maWcuaW4iCiAJc291cmNlICJwYWNrYWdlL29wZW5j
djQvQ29uZmlnLmluIgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9vbmV2cGwtaW50ZWwtZ3B1L0NvbmZp
Zy5pbiBiL3BhY2thZ2Uvb25ldnBsLWludGVsLWdwdS9Db25maWcuaW4KbmV3IGZpbGUgbW9kZSAx
MDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uYTBjYTllM2Q3ZAotLS0gL2Rldi9udWxsCisrKyBiL3Bh
Y2thZ2Uvb25ldnBsLWludGVsLWdwdS9Db25maWcuaW4KQEAgLTAsMCArMSwyMyBAQAorY29uZmln
IEJSMl9QQUNLQUdFX09ORVZQTF9JTlRFTF9HUFUKKwlib29sICJvbmV2cGwtaW50ZWwtZ3B1Igor
CWRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfT05FVlBMX0FSQ0hfU1VQUE9SVFMgIyBvbmV2cGwKKwlk
ZXBlbmRzIG9uIEJSMl9JTlNUQUxMX0xJQlNURENQUCAjIG9uZXZwbAorCWRlcGVuZHMgb24gIUJS
Ml9TVEFUSUNfTElCUyAjIG9uZXZwbAorCWRlcGVuZHMgb24gQlIyX1RPT0xDSEFJTl9HQ0NfQVRf
TEVBU1RfNyAjIG9uZXZwbAorCWRlcGVuZHMgb24gQlIyX1RPT0xDSEFJTl9IQVNfU1lOQ18xICMg
aW50ZWwtbWVkaWFkcml2ZXIgLT4gbWVzYTNkCisJZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX0hB
U19USFJFQURTICMgb25ldnBsCisJZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX0hBU19USFJFQURT
X05QVEwgIyBpbnRlbC1tZWRpYWRyaXZlciAtPiBtZXNhM2QKKwlzZWxlY3QgQlIyX1BBQ0tBR0Vf
SU5URUxfTUVESUFEUklWRVIgIyBydW50aW1lCisJc2VsZWN0IEJSMl9QQUNLQUdFX0xJQlZBCisJ
c2VsZWN0IEJSMl9QQUNLQUdFX09ORVZQTAorCWhlbHAKKwkgIEludGVswq4gb25lVlBMIEdQVSBS
dW50aW1lIGlzIGEgUnVudGltZSBpbXBsZW1lbnRhdGlvbiBvZgorCSAgb25lVlBMIEFQSSBmb3Ig
SW50ZWwgR2VuIEdQVXMsIHN0YXJ0aW5nIHdpdGggVGlnZXIgTGFrZS4KKworCSAgaHR0cHM6Ly9n
aXRodWIuY29tL29uZWFwaS1zcmMvb25lVlBMLWludGVsLWdwdQorCitjb21tZW50ICJvbmV2cGwt
aW50ZWwtZ3B1IG5lZWRzIGEgdG9vbGNoYWluIHcvIGR5bmFtaWMgbGlicmFyeSwgZ2NjID49IDcs
IEMrKywgTlBUTCIKKwlkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX09ORVZQTF9BUkNIX1NVUFBPUlRT
CisJZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX0hBU19TWU5DXzEKKwlkZXBlbmRzIG9uIEJSMl9T
VEFUSUNfTElCUyB8fCAhQlIyX1RPT0xDSEFJTl9HQ0NfQVRfTEVBU1RfNyB8fCBcCisJCSFCUjJf
SU5TVEFMTF9MSUJTVERDUFAgfHwgIUJSMl9UT09MQ0hBSU5fSEFTX1RIUkVBRFMKZGlmZiAtLWdp
dCBhL3BhY2thZ2Uvb25ldnBsLWludGVsLWdwdS9vbmV2cGwtaW50ZWwtZ3B1Lmhhc2ggYi9wYWNr
YWdlL29uZXZwbC1pbnRlbC1ncHUvb25ldnBsLWludGVsLWdwdS5oYXNoCm5ldyBmaWxlIG1vZGUg
MTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjViNWNjOWEwMDIKLS0tIC9kZXYvbnVsbAorKysgYi9w
YWNrYWdlL29uZXZwbC1pbnRlbC1ncHUvb25ldnBsLWludGVsLWdwdS5oYXNoCkBAIC0wLDAgKzEs
MyBAQAorIyBMb2NhbGx5IGNvbXB1dGVkCitzaGEyNTYgIDc3YTc2ODY0NWMzMjNkZmQzZTM5NWU2
ZTdlMWFmZjg4NmE3ZDNhZjc1ZmI5ZjM4ZWU5ZTcwMTRkMTFlNjM1NmYgIG9uZXZwbC1pbnRlbC1n
cHUtMjMuMi40LnRhci5negorc2hhMjU2ICBjMzFjM2NjNWZkNjZkMTI1MGRiY2ExYzNkOTAxMWE5
Zjg3NDUzNzQ0MmFjNzFjOGRlODBmMmYwZmVkMTNmMjk3ICBMSUNFTlNFCmRpZmYgLS1naXQgYS9w
YWNrYWdlL29uZXZwbC1pbnRlbC1ncHUvb25ldnBsLWludGVsLWdwdS5tayBiL3BhY2thZ2Uvb25l
dnBsLWludGVsLWdwdS9vbmV2cGwtaW50ZWwtZ3B1Lm1rCm5ldyBmaWxlIG1vZGUgMTAwNjQ0Cmlu
ZGV4IDAwMDAwMDAwMDAuLmVjODg5YWM0YjIKLS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdlL29u
ZXZwbC1pbnRlbC1ncHUvb25ldnBsLWludGVsLWdwdS5tawpAQCAtMCwwICsxLDEzIEBACisjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIworIworIyBvbmV2cGwtaW50ZWwtZ3B1CisjCisjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIworCitPTkVWUExfSU5URUxfR1BVX1ZFUlNJT04gPSAyMy4yLjQKK09ORVZQ
TF9JTlRFTF9HUFVfU0lURSA9ICQoY2FsbCBnaXRodWIsb25lYXBpLXNyYyxvbmVWUEwtaW50ZWwt
Z3B1LGludGVsLW9uZXZwbC0kKE9ORVZQTF9JTlRFTF9HUFVfVkVSU0lPTikpCitPTkVWUExfSU5U
RUxfR1BVX0xJQ0VOU0UgPSBNSVQKK09ORVZQTF9JTlRFTF9HUFVfTElDRU5TRV9GSUxFUyA9IExJ
Q0VOU0UKK09ORVZQTF9JTlRFTF9HUFVfREVQRU5ERU5DSUVTID0gbGlidmEgb25ldnBsCisKKyQo
ZXZhbCAkKGNtYWtlLXBhY2thZ2UpKQotLSAKMi4zOS4yCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
