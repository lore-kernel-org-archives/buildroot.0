Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96F27C64ED8
	for <buildroot@archiver.kernel.org>; Thu, 23 Feb 2023 20:15:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1384881DA0;
	Thu, 23 Feb 2023 20:15:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1384881DA0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1-6eHvoUC3XH; Thu, 23 Feb 2023 20:15:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A44F81D7D;
	Thu, 23 Feb 2023 20:15:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A44F81D7D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 473C81BF3E0
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 20:15:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2198581425
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 20:15:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2198581425
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z0JBCA5RDkZi for <buildroot@lists.busybox.net>;
 Thu, 23 Feb 2023 20:15:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1483B81424
Received: from server1.martb.eu (server1.martb.eu [IPv6:2a01:4f8:1c1c:816::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1483B81424
 for <buildroot@buildroot.org>; Thu, 23 Feb 2023 20:15:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 23 Feb 2023 21:15:11 +0100
Message-Id: <20230223201511.217372-2-contact@martb.dev>
In-Reply-To: <20230223201511.217372-1-contact@martb.dev>
References: <20230223201511.217372-1-contact@martb.dev>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=martb.dev; s=mail; t=1677183326;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dH7vyQVLjZlmCBRyvGk1I//0MQFNXNVNDepLW47ipcE=;
 b=hCU+uDsCjCR8BJO3lHnL+4nOelWikYwjByewQ+rfjioIgBcTYb7xI97NZdnP3mKJgnvQGA
 BEyna3+wSYWiJiRzPMjz4LLcsJGejY2n7+FnK63Fi6zjYwWa4ULhiQAJfiXHYojRdPHQBc
 I8OopdkkWfDgChlQH8NFOCnPHrq10hI=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=martb.dev header.i=@martb.dev
 header.a=rsa-sha256 header.s=mail header.b=hCU+uDsC
X-Mailman-Original-Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=martin@familie-boeh.de smtp.mailfrom=contact@martb.dev
Subject: [Buildroot] [PATCH 2/2] package/gnuradio: remove pybind target
 suffix when crosscompiling
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
From: =?utf-8?q?Martin_B=C3=B6h_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Martin=20B=C3=B6h?= <contact@martb.dev>
Cc: =?UTF-8?q?Martin=20B=C3=B6h?= <contact@martb.dev>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyBpcyByZXF1aXJlZCBhcyBweWJpbmQxMSB1c2VzIGhvc3QgcHl0aG9uMyBhbmQgdGhlcmVm
b3JlIHRoZSBob3N0IHBsYXRmb3JtIHN1ZmZpeGVzLgpXaXRob3V0IHRoaXMgY2hhbmdlIGdudXJh
ZGlvIGFuZCBhbGwgcGx1Z2lucyByZWx5aW5nIG9uIGl0cyBHclB5YmluZCBtYWNyb3MsIHVzZSB0
aGUgd3Jvbmcgc3VmZml4ZXMuClRoaXMgbGVhZHMgdG8gbW9kdWxlIGxvYWQgZmFpbHVyZXMgd2hl
biBjcm9zc2NvbXBpbGluZy4KClNlZToKLSBodHRwczovL2dpdGh1Yi5jb20vZ251cmFkaW8vZ251
cmFkaW8vaXNzdWVzLzU0NTUKLSBodHRwczovL2dpdGh1Yi5jb20vcHliaW5kL3B5YmluZDExL2lz
c3Vlcy8zNjQwCgpTaWduZWQtb2ZmLWJ5OiBNYXJ0aW4gQsO2aCA8Y29udGFjdEBtYXJ0Yi5kZXY+
Ci0tLQogLi4ubmQtcmVtb3ZlLXN1ZmZpeC13aGVuLWNyb3NzY29tcGlsaW5nLnBhdGNoIHwgNTYg
KysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDU2IGluc2VydGlvbnMoKykKIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2dudXJhZGlvLzAwMDEtZ3JQeUJpbmQtcmVtb3ZlLXN1
ZmZpeC13aGVuLWNyb3NzY29tcGlsaW5nLnBhdGNoCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9nbnVy
YWRpby8wMDAxLWdyUHlCaW5kLXJlbW92ZS1zdWZmaXgtd2hlbi1jcm9zc2NvbXBpbGluZy5wYXRj
aCBiL3BhY2thZ2UvZ251cmFkaW8vMDAwMS1nclB5QmluZC1yZW1vdmUtc3VmZml4LXdoZW4tY3Jv
c3Njb21waWxpbmcucGF0Y2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4u
MGFjNDM5NWU1OAotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2UvZ251cmFkaW8vMDAwMS1nclB5
QmluZC1yZW1vdmUtc3VmZml4LXdoZW4tY3Jvc3Njb21waWxpbmcucGF0Y2gKQEAgLTAsMCArMSw1
NiBAQAorRnJvbSBjNTg3NjBiMDAyYzFhOTU0YTlhYjYyODM1MjkwMGZjZDhlNmUxOTljIE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbTogPT9VVEYtOD9xP01hcnRpbj0yMEI9QzM9QjZoPz0g
PGNvbnRhY3RAbWFydGIuZGV2PgorRGF0ZTogV2VkLCAyMiBGZWIgMjAyMyAwMzowNTowOCArMDEw
MAorU3ViamVjdDogW1BBVENIXSBnclB5QmluZDogZml4IGludmFsaWQgc3VmZml4CisKK1RoaXMg
aXMgcmVxdWlyZWQgYXMgcHliaW5kMTEgdXNlcyBob3N0IHB5dGhvbjMgYW5kIHRoZXJlZm9yZSB0
aGUgaG9zdCBwbGF0Zm9ybSBzdWZmaXhlcy4KKy0tLQorIGNtYWtlL01vZHVsZXMvR3JQeWJpbmQu
Y21ha2UgfCAxOCArKysrKysrKysrKysrKysrKysKKyAxIGZpbGUgY2hhbmdlZCwgMTggaW5zZXJ0
aW9ucygrKQorCitkaWZmIC0tZ2l0IGEvY21ha2UvTW9kdWxlcy9HclB5YmluZC5jbWFrZSBiL2Nt
YWtlL01vZHVsZXMvR3JQeWJpbmQuY21ha2UKK2luZGV4IDVhNmZiNzYzMy4uYzJkZjE3YzJkIDEw
MDY0NAorLS0tIGEvY21ha2UvTW9kdWxlcy9HclB5YmluZC5jbWFrZQorKysrIGIvY21ha2UvTW9k
dWxlcy9HclB5YmluZC5jbWFrZQorQEAgLTgsNiArOCwxMiBAQCBtYWNybyhHUl9QWUJJTkRfTUFL
RSBuYW1lIHVwZGlyIGZpbHRlciBmaWxlcykKKyAgICAgICAgICAgICAgICAgICAgJHtDTUFLRV9D
VVJSRU5UX0JJTkFSWV9ESVJ9IENPUFlPTkxZKQorIAorICAgICBweWJpbmQxMV9hZGRfbW9kdWxl
KCR7bmFtZX1fcHl0aG9uICR7ZmlsZXN9KQorKyAgICAKKysgICAgIyBVc2Ugbm9ybWFsIC5zbyBz
dWZmaXggd2hlbiBjcm9zc2NvbXBpbGluZworKyAgICAjIFNlZSBodHRwczovL2dpdGh1Yi5jb20v
Z251cmFkaW8vZ251cmFkaW8vaXNzdWVzLzU0NTUKKysgICAgaWYgKENNQUtFX0NST1NTQ09NUElM
SU5HKQorKyAgICAgICAgc2V0X3RhcmdldF9wcm9wZXJ0aWVzKCR7bmFtZX1fcHl0aG9uIFBST1BF
UlRJRVMgU1VGRklYICIuc28iKQorKyAgICBlbmRpZigpCisgCisgICAgIHNldChNT0RVTEVfTkFN
RSAke25hbWV9KQorICAgICBpZigke25hbWV9IFNUUkVRVUFMIGdyKQorQEAgLTEzNSw2ICsxNDEs
MTIgQEAgbWFjcm8oR1JfUFlCSU5EX01BS0VfQ0hFQ0tfSEFTSCBuYW1lIHVwZGlyIGZpbHRlciBm
aWxlcykKKyAKKyAgICAgcHliaW5kMTFfYWRkX21vZHVsZSgke25hbWV9X3B5dGhvbiAke2ZpbGVz
fSkKKyAKKysgICAgIyBVc2Ugbm9ybWFsIC5zbyBzdWZmaXggd2hlbiBjcm9zc2NvbXBpbGluZwor
KyAgICAjIFNlZSBodHRwczovL2dpdGh1Yi5jb20vZ251cmFkaW8vZ251cmFkaW8vaXNzdWVzLzU0
NTUKKysgICAgaWYgKENNQUtFX0NST1NTQ09NUElMSU5HKQorKyAgICAgICAgc2V0X3RhcmdldF9w
cm9wZXJ0aWVzKCR7bmFtZX1fcHl0aG9uIFBST1BFUlRJRVMgU1VGRklYICIuc28iKQorKyAgICBl
bmRpZigpCisrCisgICAgIHNldChNT0RVTEVfTkFNRSAke25hbWV9KQorICAgICBpZigke25hbWV9
IFNUUkVRVUFMIGdyKQorICAgICAgICAgc2V0KE1PRFVMRV9OQU1FICJydW50aW1lIikKK0BAIC0y
ODYsNiArMjk4LDEyIEBAIG1hY3JvKEdSX1BZQklORF9NQUtFX09PVCBuYW1lIHVwZGlyIGZpbHRl
ciBmaWxlcykKKyAKKyAgICAgcHliaW5kMTFfYWRkX21vZHVsZSgke25hbWV9X3B5dGhvbiAke2Zp
bGVzfSkKKyAKKysgICAgIyBVc2Ugbm9ybWFsIC5zbyBzdWZmaXggd2hlbiBjcm9zc2NvbXBpbGlu
ZworKyAgICAjIFNlZSBodHRwczovL2dpdGh1Yi5jb20vZ251cmFkaW8vZ251cmFkaW8vaXNzdWVz
LzU0NTUKKysgICAgaWYgKENNQUtFX0NST1NTQ09NUElMSU5HKQorKyAgICAgICAgc2V0X3Rhcmdl
dF9wcm9wZXJ0aWVzKCR7bmFtZX1fcHl0aG9uIFBST1BFUlRJRVMgU1VGRklYICIuc28iKQorKyAg
ICBlbmRpZigpCisrCisgICAgIHNldChNT0RVTEVfTkFNRSAke25hbWV9KQorICAgICBpZigke25h
bWV9IFNUUkVRVUFMIGdyKQorICAgICAgICAgc2V0KE1PRFVMRV9OQU1FICJydW50aW1lIikKKy0t
IAorMi4zOS4xCisKLS0gCjIuMzkuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
