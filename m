Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17C39C001DE
	for <buildroot@archiver.kernel.org>; Tue,  8 Aug 2023 06:41:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 968D2405EC;
	Tue,  8 Aug 2023 06:41:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 968D2405EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Amv9QA8CFZkf; Tue,  8 Aug 2023 06:41:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ACD3440A96;
	Tue,  8 Aug 2023 06:41:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ACD3440A96
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E42041BF309
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 06:41:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BCE7B401F3
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 06:41:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BCE7B401F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PWe-SUidzK3y for <buildroot@lists.busybox.net>;
 Tue,  8 Aug 2023 06:41:24 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3174F40A07
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 06:41:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3174F40A07
Received: from fli4l.lan.fli4l (p4fd6c649.dip0.t-ipconnect.de [79.214.198.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 28BB7A4C0C84;
 Tue,  8 Aug 2023 08:41:09 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52880)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qTGOy-00040z-2f;
 Tue, 08 Aug 2023 08:41:08 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  8 Aug 2023 08:41:07 +0200
Message-Id: <20230808064107.29318-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230808064107.29318-1-bernd@kuhls.net>
References: <20230808064107.29318-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ---
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1691476869;
 bh=YzwGaK2Cli22zAvzms53Sy1GMDzGusFJ/dzg/nc3ZbY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CTE2Qz29xdqBfPpQpGu1pt5K/3Yx4GX7vsJHVpLS8PAHIQ/JcMjx+HU3QgHXRA1Vw
 KYKZtI39DHv9TR7sxJqWiauvB7KtH6YT83k8eygTkRwOOhSsMC4i51Mxp8Ngqad16y
 Px8egXCbjyxptZmK5sp079l5dHV4XlVB1El6t9xEMmkQkbFyNZc80NeFxj1FgmhVE/
 jI3/gcCqdeUYlLph9v+gIBrn77AbcyW/LFXwF4Oh9FL819qlQHOrG5lNTBPRVSdNhY
 gQ1AV5E4vZw8X8XHQ4P/UMQXv6zJRhjvGB4KajR7fJnmjR7jMi4SuD6CimJz3A+W0y
 yjX89k7qJQTvQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=CTE2Qz29
Subject: [Buildroot] [PATCH/next v4 2/2] package/onevpl-intel-gpu: new
 package
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
eTogQmVybmQgS3VobHMgPGJlcm5kQGt1aGxzLm5ldD4KLS0tCnY0OiBidW1wIHRvIDIzLjMuMQp2
MzogYnVtcCB0byAyMy4zLjAKdjI6IGJ1bXAgdG8gMjMuMi40CgogREVWRUxPUEVSUyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEgKwogcGFja2FnZS9Db25maWcuaW4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEgKwogcGFja2FnZS9vbmV2cGwtaW50ZWwtZ3B1
L0NvbmZpZy5pbiAgICAgICAgICAgIHwgMjMgKysrKysrKysrKysrKysrKysrKwogLi4uL29uZXZw
bC1pbnRlbC1ncHUvb25ldnBsLWludGVsLWdwdS5oYXNoICAgIHwgIDMgKysrCiBwYWNrYWdlL29u
ZXZwbC1pbnRlbC1ncHUvb25ldnBsLWludGVsLWdwdS5tayAgfCAxMyArKysrKysrKysrKwogNSBm
aWxlcyBjaGFuZ2VkLCA0MSBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2Fn
ZS9vbmV2cGwtaW50ZWwtZ3B1L0NvbmZpZy5pbgogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2Uv
b25ldnBsLWludGVsLWdwdS9vbmV2cGwtaW50ZWwtZ3B1Lmhhc2gKIGNyZWF0ZSBtb2RlIDEwMDY0
NCBwYWNrYWdlL29uZXZwbC1pbnRlbC1ncHUvb25ldnBsLWludGVsLWdwdS5tawoKZGlmZiAtLWdp
dCBhL0RFVkVMT1BFUlMgYi9ERVZFTE9QRVJTCmluZGV4IGViNzAzZDUyYzcuLjdiNjAxMGE1NTYg
MTAwNjQ0Ci0tLSBhL0RFVkVMT1BFUlMKKysrIGIvREVWRUxPUEVSUwpAQCAtNDE4LDYgKzQxOCw3
IEBAIEY6CXBhY2thZ2UvbXBnMTIzLwogRjoJcGFja2FnZS9udHAvCiBGOglwYWNrYWdlL251dC8K
IEY6CXBhY2thZ2Uvb25ldnBsLworRjoJcGFja2FnZS9vbmV2cGwtaW50ZWwtZ3B1LwogRjoJcGFj
a2FnZS9vcHVzLwogRjoJcGFja2FnZS9wY2l1dGlscy8KIEY6CXBhY2thZ2UvcGVybC1jcnlwdC1v
cGVuc3NsLWd1ZXNzLwpkaWZmIC0tZ2l0IGEvcGFja2FnZS9Db25maWcuaW4gYi9wYWNrYWdlL0Nv
bmZpZy5pbgppbmRleCA1OGU2NTNkY2Q5Li4xNjE3Zjc0ODhhIDEwMDY0NAotLS0gYS9wYWNrYWdl
L0NvbmZpZy5pbgorKysgYi9wYWNrYWdlL0NvbmZpZy5pbgpAQCAtMTY0Myw2ICsxNjQzLDcgQEAg
bWVudSAiR3JhcGhpY3MiCiAJc291cmNlICJwYWNrYWdlL2xpYndwZS9Db25maWcuaW4iCiAJc291
cmNlICJwYWNrYWdlL21lbnUtY2FjaGUvQ29uZmlnLmluIgogCXNvdXJjZSAicGFja2FnZS9vbmV2
cGwvQ29uZmlnLmluIgorCXNvdXJjZSAicGFja2FnZS9vbmV2cGwtaW50ZWwtZ3B1L0NvbmZpZy5p
biIKIAlzb3VyY2UgInBhY2thZ2Uvb3BlbmNsLWNsaHBwL0NvbmZpZy5pbiIKIAlzb3VyY2UgInBh
Y2thZ2Uvb3BlbmN2My9Db25maWcuaW4iCiAJc291cmNlICJwYWNrYWdlL29wZW5jdjQvQ29uZmln
LmluIgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9vbmV2cGwtaW50ZWwtZ3B1L0NvbmZpZy5pbiBiL3Bh
Y2thZ2Uvb25ldnBsLWludGVsLWdwdS9Db25maWcuaW4KbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5k
ZXggMDAwMDAwMDAwMC4uYTBjYTllM2Q3ZAotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2Uvb25l
dnBsLWludGVsLWdwdS9Db25maWcuaW4KQEAgLTAsMCArMSwyMyBAQAorY29uZmlnIEJSMl9QQUNL
QUdFX09ORVZQTF9JTlRFTF9HUFUKKwlib29sICJvbmV2cGwtaW50ZWwtZ3B1IgorCWRlcGVuZHMg
b24gQlIyX1BBQ0tBR0VfT05FVlBMX0FSQ0hfU1VQUE9SVFMgIyBvbmV2cGwKKwlkZXBlbmRzIG9u
IEJSMl9JTlNUQUxMX0xJQlNURENQUCAjIG9uZXZwbAorCWRlcGVuZHMgb24gIUJSMl9TVEFUSUNf
TElCUyAjIG9uZXZwbAorCWRlcGVuZHMgb24gQlIyX1RPT0xDSEFJTl9HQ0NfQVRfTEVBU1RfNyAj
IG9uZXZwbAorCWRlcGVuZHMgb24gQlIyX1RPT0xDSEFJTl9IQVNfU1lOQ18xICMgaW50ZWwtbWVk
aWFkcml2ZXIgLT4gbWVzYTNkCisJZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX0hBU19USFJFQURT
ICMgb25ldnBsCisJZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX0hBU19USFJFQURTX05QVEwgIyBp
bnRlbC1tZWRpYWRyaXZlciAtPiBtZXNhM2QKKwlzZWxlY3QgQlIyX1BBQ0tBR0VfSU5URUxfTUVE
SUFEUklWRVIgIyBydW50aW1lCisJc2VsZWN0IEJSMl9QQUNLQUdFX0xJQlZBCisJc2VsZWN0IEJS
Ml9QQUNLQUdFX09ORVZQTAorCWhlbHAKKwkgIEludGVswq4gb25lVlBMIEdQVSBSdW50aW1lIGlz
IGEgUnVudGltZSBpbXBsZW1lbnRhdGlvbiBvZgorCSAgb25lVlBMIEFQSSBmb3IgSW50ZWwgR2Vu
IEdQVXMsIHN0YXJ0aW5nIHdpdGggVGlnZXIgTGFrZS4KKworCSAgaHR0cHM6Ly9naXRodWIuY29t
L29uZWFwaS1zcmMvb25lVlBMLWludGVsLWdwdQorCitjb21tZW50ICJvbmV2cGwtaW50ZWwtZ3B1
IG5lZWRzIGEgdG9vbGNoYWluIHcvIGR5bmFtaWMgbGlicmFyeSwgZ2NjID49IDcsIEMrKywgTlBU
TCIKKwlkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX09ORVZQTF9BUkNIX1NVUFBPUlRTCisJZGVwZW5k
cyBvbiBCUjJfVE9PTENIQUlOX0hBU19TWU5DXzEKKwlkZXBlbmRzIG9uIEJSMl9TVEFUSUNfTElC
UyB8fCAhQlIyX1RPT0xDSEFJTl9HQ0NfQVRfTEVBU1RfNyB8fCBcCisJCSFCUjJfSU5TVEFMTF9M
SUJTVERDUFAgfHwgIUJSMl9UT09MQ0hBSU5fSEFTX1RIUkVBRFMKZGlmZiAtLWdpdCBhL3BhY2th
Z2Uvb25ldnBsLWludGVsLWdwdS9vbmV2cGwtaW50ZWwtZ3B1Lmhhc2ggYi9wYWNrYWdlL29uZXZw
bC1pbnRlbC1ncHUvb25ldnBsLWludGVsLWdwdS5oYXNoCm5ldyBmaWxlIG1vZGUgMTAwNjQ0Cmlu
ZGV4IDAwMDAwMDAwMDAuLmZhOGU5Njk1OWIKLS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdlL29u
ZXZwbC1pbnRlbC1ncHUvb25ldnBsLWludGVsLWdwdS5oYXNoCkBAIC0wLDAgKzEsMyBAQAorIyBM
b2NhbGx5IGNvbXB1dGVkCitzaGEyNTYgIDUxMDUyYjJjYjBjMWQwZTYyOGFhMWUwNGIxOWZmZGNk
NTA5ODk5M2M2YzM2ODA0NWE3OWQ4N2QyMWNhNGViZTUgIG9uZXZwbC1pbnRlbC1ncHUtMjMuMy4x
LnRhci5negorc2hhMjU2ICBjMzFjM2NjNWZkNjZkMTI1MGRiY2ExYzNkOTAxMWE5Zjg3NDUzNzQ0
MmFjNzFjOGRlODBmMmYwZmVkMTNmMjk3ICBMSUNFTlNFCmRpZmYgLS1naXQgYS9wYWNrYWdlL29u
ZXZwbC1pbnRlbC1ncHUvb25ldnBsLWludGVsLWdwdS5tayBiL3BhY2thZ2Uvb25ldnBsLWludGVs
LWdwdS9vbmV2cGwtaW50ZWwtZ3B1Lm1rCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAw
MDAwMDAuLjMzYjMyYjVkOTQKLS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdlL29uZXZwbC1pbnRl
bC1ncHUvb25ldnBsLWludGVsLWdwdS5tawpAQCAtMCwwICsxLDEzIEBACisjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIworIworIyBvbmV2cGwtaW50ZWwtZ3B1CisjCisjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIworCitPTkVWUExfSU5URUxfR1BVX1ZFUlNJT04gPSAyMy4zLjEKK09ORVZQTF9JTlRFTF9H
UFVfU0lURSA9ICQoY2FsbCBnaXRodWIsb25lYXBpLXNyYyxvbmVWUEwtaW50ZWwtZ3B1LGludGVs
LW9uZXZwbC0kKE9ORVZQTF9JTlRFTF9HUFVfVkVSU0lPTikpCitPTkVWUExfSU5URUxfR1BVX0xJ
Q0VOU0UgPSBNSVQKK09ORVZQTF9JTlRFTF9HUFVfTElDRU5TRV9GSUxFUyA9IExJQ0VOU0UKK09O
RVZQTF9JTlRFTF9HUFVfREVQRU5ERU5DSUVTID0gbGlidmEgb25ldnBsCisKKyQoZXZhbCAkKGNt
YWtlLXBhY2thZ2UpKQotLSAKMi4zOS4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
