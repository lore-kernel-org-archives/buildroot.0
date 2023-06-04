Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74F80C7EE29
	for <buildroot@archiver.kernel.org>; Sun,  4 Jun 2023 20:10:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B5AA5417C7;
	Sun,  4 Jun 2023 20:10:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B5AA5417C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nn-qiyVbzby7; Sun,  4 Jun 2023 20:10:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 791CD402A6;
	Sun,  4 Jun 2023 20:10:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 791CD402A6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9DA051BF5DF
 for <buildroot@lists.busybox.net>; Sun,  4 Jun 2023 20:10:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7783281F82
 for <buildroot@lists.busybox.net>; Sun,  4 Jun 2023 20:10:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7783281F82
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QGBYoFamq8kg for <buildroot@lists.busybox.net>;
 Sun,  4 Jun 2023 20:10:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 279CD81F78
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 279CD81F78
 for <buildroot@buildroot.org>; Sun,  4 Jun 2023 20:10:23 +0000 (UTC)
Received: from fwd72.dcpf.telekom.de (fwd72.aul.t-online.de [10.223.144.98])
 by mailout06.t-online.de (Postfix) with SMTP id 489EF47AB;
 Sun,  4 Jun 2023 22:10:21 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.6.127]) by fwd72.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1q5u3P-0f5i7t0; Sun, 4 Jun 2023 22:10:19 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:45852)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1q5u3P-0007FC-1L;
 Sun, 04 Jun 2023 22:10:19 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun,  4 Jun 2023 22:10:19 +0200
Message-Id: <20230604201019.2674652-2-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230604201019.2674652-1-bernd.kuhls@t-online.de>
References: <20230604201019.2674652-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1685909419-5A7F357F-B2286CC3/0/0 CLEAN NORMAL
X-TOI-MSGID: 0dc98096-99b6-4f3f-b2ef-9b7f30003246
Subject: [Buildroot] [PATCH/next 2/2] package/onevpl-intel-gpu: new package
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
Cc: Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogQmVybmQgS3VobHMgPGJlcm5kLmt1aGxzQHQtb25saW5lLmRlPgotLS0K
IERFVkVMT1BFUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxICsKIHBh
Y2thZ2UvQ29uZmlnLmluICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxICsKIHBhY2th
Z2Uvb25ldnBsLWludGVsLWdwdS9Db25maWcuaW4gICAgICAgICAgICB8IDIzICsrKysrKysrKysr
KysrKysrKysKIC4uLi9vbmV2cGwtaW50ZWwtZ3B1L29uZXZwbC1pbnRlbC1ncHUuaGFzaCAgICB8
ICAzICsrKwogcGFja2FnZS9vbmV2cGwtaW50ZWwtZ3B1L29uZXZwbC1pbnRlbC1ncHUubWsgIHwg
MTMgKysrKysrKysrKysKIDUgZmlsZXMgY2hhbmdlZCwgNDEgaW5zZXJ0aW9ucygrKQogY3JlYXRl
IG1vZGUgMTAwNjQ0IHBhY2thZ2Uvb25ldnBsLWludGVsLWdwdS9Db25maWcuaW4KIGNyZWF0ZSBt
b2RlIDEwMDY0NCBwYWNrYWdlL29uZXZwbC1pbnRlbC1ncHUvb25ldnBsLWludGVsLWdwdS5oYXNo
CiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9vbmV2cGwtaW50ZWwtZ3B1L29uZXZwbC1pbnRl
bC1ncHUubWsKCmRpZmYgLS1naXQgYS9ERVZFTE9QRVJTIGIvREVWRUxPUEVSUwppbmRleCA4MThi
NWEyZWNkLi5lZmJmZjczOTE3IDEwMDY0NAotLS0gYS9ERVZFTE9QRVJTCisrKyBiL0RFVkVMT1BF
UlMKQEAgLTQxNCw2ICs0MTQsNyBAQCBGOglwYWNrYWdlL21qcGctc3RyZWFtZXIvCiBGOglwYWNr
YWdlL21vbmVyby8KIEY6CXBhY2thZ2UvbnV0LwogRjoJcGFja2FnZS9vbmV2cGwvCitGOglwYWNr
YWdlL29uZXZwbC1pbnRlbC1ncHUvCiBGOglwYWNrYWdlL3AycG9vbC8KIEY6CXBhY2thZ2UvcGVy
bC1jcnlwdC1vcGVuc3NsLWd1ZXNzLwogRjoJcGFja2FnZS9wZXJsLWNyeXB0LW9wZW5zc2wtcmFu
ZG9tLwpkaWZmIC0tZ2l0IGEvcGFja2FnZS9Db25maWcuaW4gYi9wYWNrYWdlL0NvbmZpZy5pbgpp
bmRleCBhNTJmNDBhMDE5Li41ZTA1ZjNkNmM3IDEwMDY0NAotLS0gYS9wYWNrYWdlL0NvbmZpZy5p
bgorKysgYi9wYWNrYWdlL0NvbmZpZy5pbgpAQCAtMTYzNSw2ICsxNjM1LDcgQEAgbWVudSAiR3Jh
cGhpY3MiCiAJc291cmNlICJwYWNrYWdlL2xpYndwZS9Db25maWcuaW4iCiAJc291cmNlICJwYWNr
YWdlL21lbnUtY2FjaGUvQ29uZmlnLmluIgogCXNvdXJjZSAicGFja2FnZS9vbmV2cGwvQ29uZmln
LmluIgorCXNvdXJjZSAicGFja2FnZS9vbmV2cGwtaW50ZWwtZ3B1L0NvbmZpZy5pbiIKIAlzb3Vy
Y2UgInBhY2thZ2Uvb3BlbmNsLWNsaHBwL0NvbmZpZy5pbiIKIAlzb3VyY2UgInBhY2thZ2Uvb3Bl
bmN2My9Db25maWcuaW4iCiAJc291cmNlICJwYWNrYWdlL29wZW5jdjQvQ29uZmlnLmluIgpkaWZm
IC0tZ2l0IGEvcGFja2FnZS9vbmV2cGwtaW50ZWwtZ3B1L0NvbmZpZy5pbiBiL3BhY2thZ2Uvb25l
dnBsLWludGVsLWdwdS9Db25maWcuaW4KbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAw
MDAwMC4uYTBjYTllM2Q3ZAotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2Uvb25ldnBsLWludGVs
LWdwdS9Db25maWcuaW4KQEAgLTAsMCArMSwyMyBAQAorY29uZmlnIEJSMl9QQUNLQUdFX09ORVZQ
TF9JTlRFTF9HUFUKKwlib29sICJvbmV2cGwtaW50ZWwtZ3B1IgorCWRlcGVuZHMgb24gQlIyX1BB
Q0tBR0VfT05FVlBMX0FSQ0hfU1VQUE9SVFMgIyBvbmV2cGwKKwlkZXBlbmRzIG9uIEJSMl9JTlNU
QUxMX0xJQlNURENQUCAjIG9uZXZwbAorCWRlcGVuZHMgb24gIUJSMl9TVEFUSUNfTElCUyAjIG9u
ZXZwbAorCWRlcGVuZHMgb24gQlIyX1RPT0xDSEFJTl9HQ0NfQVRfTEVBU1RfNyAjIG9uZXZwbAor
CWRlcGVuZHMgb24gQlIyX1RPT0xDSEFJTl9IQVNfU1lOQ18xICMgaW50ZWwtbWVkaWFkcml2ZXIg
LT4gbWVzYTNkCisJZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX0hBU19USFJFQURTICMgb25ldnBs
CisJZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX0hBU19USFJFQURTX05QVEwgIyBpbnRlbC1tZWRp
YWRyaXZlciAtPiBtZXNhM2QKKwlzZWxlY3QgQlIyX1BBQ0tBR0VfSU5URUxfTUVESUFEUklWRVIg
IyBydW50aW1lCisJc2VsZWN0IEJSMl9QQUNLQUdFX0xJQlZBCisJc2VsZWN0IEJSMl9QQUNLQUdF
X09ORVZQTAorCWhlbHAKKwkgIEludGVswq4gb25lVlBMIEdQVSBSdW50aW1lIGlzIGEgUnVudGlt
ZSBpbXBsZW1lbnRhdGlvbiBvZgorCSAgb25lVlBMIEFQSSBmb3IgSW50ZWwgR2VuIEdQVXMsIHN0
YXJ0aW5nIHdpdGggVGlnZXIgTGFrZS4KKworCSAgaHR0cHM6Ly9naXRodWIuY29tL29uZWFwaS1z
cmMvb25lVlBMLWludGVsLWdwdQorCitjb21tZW50ICJvbmV2cGwtaW50ZWwtZ3B1IG5lZWRzIGEg
dG9vbGNoYWluIHcvIGR5bmFtaWMgbGlicmFyeSwgZ2NjID49IDcsIEMrKywgTlBUTCIKKwlkZXBl
bmRzIG9uIEJSMl9QQUNLQUdFX09ORVZQTF9BUkNIX1NVUFBPUlRTCisJZGVwZW5kcyBvbiBCUjJf
VE9PTENIQUlOX0hBU19TWU5DXzEKKwlkZXBlbmRzIG9uIEJSMl9TVEFUSUNfTElCUyB8fCAhQlIy
X1RPT0xDSEFJTl9HQ0NfQVRfTEVBU1RfNyB8fCBcCisJCSFCUjJfSU5TVEFMTF9MSUJTVERDUFAg
fHwgIUJSMl9UT09MQ0hBSU5fSEFTX1RIUkVBRFMKZGlmZiAtLWdpdCBhL3BhY2thZ2Uvb25ldnBs
LWludGVsLWdwdS9vbmV2cGwtaW50ZWwtZ3B1Lmhhc2ggYi9wYWNrYWdlL29uZXZwbC1pbnRlbC1n
cHUvb25ldnBsLWludGVsLWdwdS5oYXNoCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAw
MDAwMDAuLjA3YTViZjBjMjQKLS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdlL29uZXZwbC1pbnRl
bC1ncHUvb25ldnBsLWludGVsLWdwdS5oYXNoCkBAIC0wLDAgKzEsMyBAQAorIyBMb2NhbGx5IGNv
bXB1dGVkCitzaGEyNTYgIDNkNzNhOTc4NzA4YWZiOTY4MWJiYzUxNTk1NzA0NmI4NjY3ZDBlMmJh
MTZiODJjMDU5NWJiY2FlMDY4OWFkNjggIG9uZXZwbC1pbnRlbC1ncHUtMjMuMi4yLnRhci5negor
c2hhMjU2ICBjMzFjM2NjNWZkNjZkMTI1MGRiY2ExYzNkOTAxMWE5Zjg3NDUzNzQ0MmFjNzFjOGRl
ODBmMmYwZmVkMTNmMjk3ICBMSUNFTlNFCmRpZmYgLS1naXQgYS9wYWNrYWdlL29uZXZwbC1pbnRl
bC1ncHUvb25ldnBsLWludGVsLWdwdS5tayBiL3BhY2thZ2Uvb25ldnBsLWludGVsLWdwdS9vbmV2
cGwtaW50ZWwtZ3B1Lm1rCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjIx
NzkzOWQwYTYKLS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdlL29uZXZwbC1pbnRlbC1ncHUvb25l
dnBsLWludGVsLWdwdS5tawpAQCAtMCwwICsxLDEzIEBACisjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IworIworIyBvbmV2cGwtaW50ZWwtZ3B1CisjCisjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIworCitP
TkVWUExfSU5URUxfR1BVX1ZFUlNJT04gPSAyMy4yLjIKK09ORVZQTF9JTlRFTF9HUFVfU0lURSA9
ICQoY2FsbCBnaXRodWIsb25lYXBpLXNyYyxvbmVWUEwtaW50ZWwtZ3B1LGludGVsLW9uZXZwbC0k
KE9ORVZQTF9JTlRFTF9HUFVfVkVSU0lPTikpCitPTkVWUExfSU5URUxfR1BVX0xJQ0VOU0UgPSBN
SVQKK09ORVZQTF9JTlRFTF9HUFVfTElDRU5TRV9GSUxFUyA9IExJQ0VOU0UKK09ORVZQTF9JTlRF
TF9HUFVfREVQRU5ERU5DSUVTID0gbGlidmEgb25ldnBsCisKKyQoZXZhbCAkKGNtYWtlLXBhY2th
Z2UpKQotLSAKMi4zOS4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
