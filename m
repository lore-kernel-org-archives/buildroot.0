Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A14A4C19F28
	for <buildroot@archiver.kernel.org>; Wed,  3 Aug 2022 15:43:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F3536610C1;
	Wed,  3 Aug 2022 15:42:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F3536610C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fAGpvYmM6YOg; Wed,  3 Aug 2022 15:42:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F8EC610B8;
	Wed,  3 Aug 2022 15:42:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F8EC610B8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A6A6B1BF3D1
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 15:42:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8EAFA610B8
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 15:42:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8EAFA610B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FMCe2bsmKAtD for <buildroot@lists.busybox.net>;
 Wed,  3 Aug 2022 15:42:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6526E60D67
Received: from hutie.ust.cz (unknown [IPv6:2a03:3b40:fe:f0::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6526E60D67
 for <buildroot@buildroot.org>; Wed,  3 Aug 2022 15:42:53 +0000 (UTC)
From: =?utf-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Message-Id: <A46AAF2E-D74E-4308-A9B3-3B18C3E1CD09@cutebit.org>
Date: Wed, 3 Aug 2022 17:42:48 +0200
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cutebit.org; s=mail; 
 t=1659541369; bh=jPmb/0K8UaxroIDsFnea4fTq4+SwLYKjkECoXFxhQrE=;
 h=From:Subject:Date:Cc:To;
 b=BVSVFHqTn6V63d0Jz1VTZd3cjgRuv+GnpBZbqPDvdowiopv+/zqYi3HNBhB+VRCnj
 Q61xPcZnSqjRpWzA16Lol1ApP0+rwF0aax9jWotF2vfQ2tqWqE/tL6qpYPrT+BE2eg
 /qeXR5mwcNrsMy9IT1DD5IGvFNlLRmjxeo1JN0g0=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=cutebit.org header.i=@cutebit.org
 header.a=rsa-sha256 header.s=mail header.b=BVSVFHqT
Subject: [Buildroot] [PATCH 1/1 RESEND] package/python-construct: new package
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
Cc: =?utf-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Y29uc3RydWN0IGlzIGEgUHl0aG9uIGxpYnJhcnkgZm9yIGRlY2xhcmF0aXZlIHNlcmlhbGl6YXRp
b24vCmRlc2VyaWFsaXphdGlvbiBvZiBzdHJ1Y3R1cmVkIGJpbmFyeSBkYXRhLgoKU2lnbmVkLW9m
Zi1ieTogTWFydGluIFBvdmnFoWVyIDxwb3ZpaytsaW5AY3V0ZWJpdC5vcmc+Ci0tLQpJIGRvbid0
IGtub3cgaWYgeW91IHNldCBhIGJhciBmb3IgdGhlIGluY2x1c2lvbiBvZiBwYWNrYWdlcyBpbgpi
dWlsZHJvb3QsIGJ1dCBJIHRoaW5rIGJ5IGl0cyBuYXR1cmUgY29uc3RydWN0IG1ha2VzIGZvciBh
IHVzZWZ1bApwYWNrYWdlIG9uIGVtYmVkZGVkIHN5c3RlbXMuCgpERVZFTE9QRVJTICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDMgKysrCnBhY2thZ2UvQ29uZmlnLmluICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMSArCnBhY2thZ2UvcHl0aG9uLWNvbnN0cnVj
dC9Db25maWcuaW4gICAgICAgICAgICAgfCAgNiArKysrKysKcGFja2FnZS9weXRob24tY29uc3Ry
dWN0L3B5dGhvbi1jb25zdHJ1Y3QuaGFzaCB8ICA1ICsrKysrCnBhY2thZ2UvcHl0aG9uLWNvbnN0
cnVjdC9weXRob24tY29uc3RydWN0Lm1rICAgfCAxNSArKysrKysrKysrKysrKysKNSBmaWxlcyBj
aGFuZ2VkLCAzMCBpbnNlcnRpb25zKCspCmNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3B5dGhv
bi1jb25zdHJ1Y3QvQ29uZmlnLmluCmNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3B5dGhvbi1j
b25zdHJ1Y3QvcHl0aG9uLWNvbnN0cnVjdC5oYXNoCmNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdl
L3B5dGhvbi1jb25zdHJ1Y3QvcHl0aG9uLWNvbnN0cnVjdC5tawoKZGlmZiAtLWdpdCBhL0RFVkVM
T1BFUlMgYi9ERVZFTE9QRVJTCmluZGV4IDYzYmI4MGZjOWQuLmE5MWU1NjZiZGQgMTAwNjQ0Ci0t
LSBhL0RFVkVMT1BFUlMKKysrIGIvREVWRUxPUEVSUwpAQCAtMTkyNCw2ICsxOTI0LDkgQEAgRjoJ
cGFja2FnZS90c2xpYi8KRjoJcGFja2FnZS94MTFyNy94ZHJpdmVyX3hmODYtaW5wdXQtdHNsaWIv
CkY6CXBhY2thZ2UveDExdm5jLwoKK046ICBNYXJ0aW4gUG92acWhZXIgPHBvdmlrK2xpbkBjdXRl
Yml0Lm9yZz4KK0Y6ICBwYWNrYWdlL3B5dGhvbi1jb25zdHJ1Y3QvCisKTjoJTWFzYWhpcm8gWWFt
YWRhIDx5YW1hZGEubWFzYWhpcm9Ac29jaW9uZXh0LmNvbT4KRjoJYm9hcmQvYXJtL2ZvdW5kYXRp
b24tdjgvCkY6CWNvbmZpZ3MvYXJtX2ZvdW5kYXRpb252OF9kZWZjb25maWcKZGlmZiAtLWdpdCBh
L3BhY2thZ2UvQ29uZmlnLmluIGIvcGFja2FnZS9Db25maWcuaW4KaW5kZXggNjE3ODNiYTQwMC4u
NzY2M2NlMGZiZiAxMDA2NDQKLS0tIGEvcGFja2FnZS9Db25maWcuaW4KKysrIGIvcGFja2FnZS9D
b25maWcuaW4KQEAgLTk5MCw2ICs5OTAsNyBAQCBtZW51ICJFeHRlcm5hbCBweXRob24gbW9kdWxl
cyIKCXNvdXJjZSAicGFja2FnZS9weXRob24tY29sb3J6ZXJvL0NvbmZpZy5pbiIKCXNvdXJjZSAi
cGFja2FnZS9weXRob24tY29uZmlnc2hlbGwtZmIvQ29uZmlnLmluIgoJc291cmNlICJwYWNrYWdl
L3B5dGhvbi1jb25zdGFudGx5L0NvbmZpZy5pbiIKKwlzb3VyY2UgInBhY2thZ2UvcHl0aG9uLWNv
bnN0cnVjdC9Db25maWcuaW4iCglzb3VyY2UgInBhY2thZ2UvcHl0aG9uLWNvdWNoZGIvQ29uZmln
LmluIgoJc291cmNlICJwYWNrYWdlL3B5dGhvbi1jcmF5b25zL0NvbmZpZy5pbiIKCXNvdXJjZSAi
cGFja2FnZS9weXRob24tY3JjMTYvQ29uZmlnLmluIgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRo
b24tY29uc3RydWN0L0NvbmZpZy5pbiBiL3BhY2thZ2UvcHl0aG9uLWNvbnN0cnVjdC9Db25maWcu
aW4KbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uYWNlNDdjOTk4OQotLS0g
L2Rldi9udWxsCisrKyBiL3BhY2thZ2UvcHl0aG9uLWNvbnN0cnVjdC9Db25maWcuaW4KQEAgLTAs
MCArMSw2IEBACitjb25maWcgQlIyX1BBQ0tBR0VfUFlUSE9OX0NPTlNUUlVDVAorCWJvb2wgInB5
dGhvbi1jb25zdHJ1Y3QiCisJaGVscAorCSAgQSBwb3dlcmZ1bCBkZWNsYXJhdGl2ZSBzeW1tZXRy
aWMgcGFyc2VyL2J1aWxkZXIgZm9yIGJpbmFyeSBkYXRhLgorCisJICBodHRwczovL2NvbnN0cnVj
dC5yZWFkdGhlZG9jcy5pby8KZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9uLWNvbnN0cnVjdC9w
eXRob24tY29uc3RydWN0Lmhhc2ggYi9wYWNrYWdlL3B5dGhvbi1jb25zdHJ1Y3QvcHl0aG9uLWNv
bnN0cnVjdC5oYXNoCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjJjM2I4
OTgxMjEKLS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdlL3B5dGhvbi1jb25zdHJ1Y3QvcHl0aG9u
LWNvbnN0cnVjdC5oYXNoCkBAIC0wLDAgKzEsNSBAQAorIyBtZDUsIHNoYTI1NiBmcm9tIGh0dHBz
Oi8vcHlwaS5vcmcvcHJvamVjdC9jb25zdHJ1Y3QKK21kNSAgZTQyNmQzZGQxNTY2MDY2ZTRlZjFh
MDNmZTQ3NGRlYzAgIGNvbnN0cnVjdC0yLjEwLjY4LnRhci5neiAKK3NoYTI1NiAgN2IyYTNmZDhl
NWY1OTdhNWFhMWQ2MTRjM2JkNTE2ZmEwNjVkYjAxNzA0YzcyYTFlZmFhZWVjNmVmMjNkOGI0NSAg
Y29uc3RydWN0LTIuMTAuNjgudGFyLmd6IAorIyBMb2NhbGx5IGNvbXB1dGVkIHNoYTI1NiBjaGVj
a3N1bXMKK3NoYTI1NiAgMTU1MmQ3MGFjZmQwZDNmZTQ2NGNlMTNkMzAxMTNkZGM2ZmU0YmFjMjFl
NTIyMTJhY2M5ODUwOWUzY2MxYThmNCAgTElDRU5TRQpkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRo
b24tY29uc3RydWN0L3B5dGhvbi1jb25zdHJ1Y3QubWsgYi9wYWNrYWdlL3B5dGhvbi1jb25zdHJ1
Y3QvcHl0aG9uLWNvbnN0cnVjdC5tawpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAw
MDAwLi5kYjhkYzBjZjI2Ci0tLSAvZGV2L251bGwKKysrIGIvcGFja2FnZS9weXRob24tY29uc3Ry
dWN0L3B5dGhvbi1jb25zdHJ1Y3QubWsKQEAgLTAsMCArMSwxNSBAQAorIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMKKyMKKyMgcHl0aG9uLWNvbnN0cnVjdAorIworIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMKKworUFlUSE9OX0NPTlNUUlVDVF9WRVJTSU9OID0gMi4xMC42OAorUFlUSE9OX0NPTlNUUlVD
VF9TT1VSQ0UgPSBjb25zdHJ1Y3QtJChQWVRIT05fQ09OU1RSVUNUX1ZFUlNJT04pLnRhci5negor
UFlUSE9OX0NPTlNUUlVDVF9TSVRFID0gaHR0cHM6Ly9maWxlcy5weXRob25ob3N0ZWQub3JnL3Bh
Y2thZ2VzL2UwL2I3L2E0YTAzMmU5NGJjZmRmZjQ4MWYyZTZmZWNkNDcyNzk0ZDlkYTA5ZjQ3NGEy
MTg1ZWQzM2IyYzdjYWQ2NAorUFlUSE9OX0NPTlNUUlVDVF9TRVRVUF9UWVBFID0gc2V0dXB0b29s
cworUFlUSE9OX0NPTlNUUlVDVF9MSUNFTlNFID0gTUlUCitQWVRIT05fQ09OU1RSVUNUX0xJQ0VO
U0VfRklMRVMgPSBMSUNFTlNFCitQWVRIT05fQ09OU1RSVUNUX0RFUEVOREVOQ0lFUyA9IGhvc3Qt
cHl0aG9uLXNldHVwdG9vbHMtc2NtCisKKyQoZXZhbCAkKHB5dGhvbi1wYWNrYWdlKSkKLS0gCjIu
MzcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
