Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1EE0C8303F
	for <buildroot@archiver.kernel.org>; Thu, 28 Aug 2025 12:31:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 768E160A9B;
	Thu, 28 Aug 2025 12:31:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tc_O4sb_XYny; Thu, 28 Aug 2025 12:31:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC1EA60DA7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC1EA60DA7;
	Thu, 28 Aug 2025 12:31:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8C54C17D
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 12:31:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7270F40A08
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 12:31:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2Whnf0kB1ZIh for <buildroot@buildroot.org>;
 Thu, 28 Aug 2025 12:31:42 +0000 (UTC)
X-Greylist: delayed 512 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 28 Aug 2025 12:31:42 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7BD9D409A3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7BD9D409A3
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.140.110.172;
 helo=foss.arm.com; envelope-from=vincent.stehle@arm.com; receiver=<UNKNOWN> 
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7BD9D409A3
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 12:31:42 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A77901688;
 Thu, 28 Aug 2025 05:23:01 -0700 (PDT)
Received: from debian (MacBookPro.nice.Arm.com [10.34.111.20])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 87D7E3F694;
 Thu, 28 Aug 2025 05:23:09 -0700 (PDT)
From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>,
 =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>
Date: Thu, 28 Aug 2025 14:23:06 +0200
Message-ID: <20250828122306.2223870-1-vincent.stehle@arm.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=arm.com
Subject: [Buildroot] [PATCH] configs/qemu_{arm,
 aarch64}_ebbr: linux needs host python3
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U3RhcnRpbmcgd2l0aCBMaW51eCA2LjEwLCB0aGUgYXJtIGFuZCBhcm02NCBhcmNoaXRlY3R1cmUg
ZGVmY29uZmlncyBuZWVkCnB5dGhvbjMgdG8gYnVpbGQuIFsxXQoKQWRkIHRoZSBtaXNzaW5nIGRl
cGVuZGVuY2llcyB0byBmaXggdGhlIGZvbGxvd2luZyBidWlsZCBlcnJvcjoKCiAgL2Jpbi9zaDog
MTogcHl0aG9uMzogbm90IGZvdW5kCiAgbWFrZVs3XTogKioqIFtkcml2ZXJzL2dwdS9kcm0vbXNt
L01ha2VmaWxlOjE4MjogZHJpdmVycy9ncHUvZHJtL21zbS9nZW5lcmF0ZWQvYTJ4eC54bWwuaF0g
RXJyb3IgMTI3CgpbMV0gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5l
bC9naXQvdG9ydmFsZHMvbGludXguZ2l0L2NvbW1pdC8/aD0wZmRkZDA0NWY4OGUzNGQ2MTYwNzg1
YTNhNWU1MDZkMzc0NTY2NDU0CgpTaWduZWQtb2ZmLWJ5OiBWaW5jZW50IFN0ZWhsw6kgPHZpbmNl
bnQuc3RlaGxlQGFybS5jb20+CkNjOiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBnbWFpbC5j
b20+Ci0tLQogY29uZmlncy9xZW11X2FhcmNoNjRfZWJicl9kZWZjb25maWcgfCAxICsKIGNvbmZp
Z3MvcWVtdV9hcm1fZWJicl9kZWZjb25maWcgICAgIHwgMSArCiAyIGZpbGVzIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2NvbmZpZ3MvcWVtdV9hYXJjaDY0X2ViYnJfZGVm
Y29uZmlnIGIvY29uZmlncy9xZW11X2FhcmNoNjRfZWJicl9kZWZjb25maWcKaW5kZXggODBlN2Mx
MDFlZS4uMDI5OWMyODU1YSAxMDA2NDQKLS0tIGEvY29uZmlncy9xZW11X2FhcmNoNjRfZWJicl9k
ZWZjb25maWcKKysrIGIvY29uZmlncy9xZW11X2FhcmNoNjRfZWJicl9kZWZjb25maWcKQEAgLTks
NiArOSw3IEBAIEJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1ZFUlNJT049eQogQlIyX0xJTlVYX0tF
Uk5FTF9DVVNUT01fVkVSU0lPTl9WQUxVRT0iNi4xMi4yNyIKIEJSMl9MSU5VWF9LRVJORUxfVVNF
X0FSQ0hfREVGQVVMVF9DT05GSUc9eQogQlIyX0xJTlVYX0tFUk5FTF9ORUVEU19IT1NUX09QRU5T
U0w9eQorQlIyX0xJTlVYX0tFUk5FTF9ORUVEU19IT1NUX1BZVEhPTjM9eQogQlIyX1BBQ0tBR0Vf
T1BURUVfQ0xJRU5UPXkKIEJSMl9UQVJHRVRfUk9PVEZTX0VYVDI9eQogQlIyX1RBUkdFVF9ST09U
RlNfRVhUMl80PXkKZGlmZiAtLWdpdCBhL2NvbmZpZ3MvcWVtdV9hcm1fZWJicl9kZWZjb25maWcg
Yi9jb25maWdzL3FlbXVfYXJtX2ViYnJfZGVmY29uZmlnCmluZGV4IGRjMWI5MTdlZjEuLmEzYWRi
NGMzODEgMTAwNjQ0Ci0tLSBhL2NvbmZpZ3MvcWVtdV9hcm1fZWJicl9kZWZjb25maWcKKysrIGIv
Y29uZmlncy9xZW11X2FybV9lYmJyX2RlZmNvbmZpZwpAQCAtMTEsNiArMTEsNyBAQCBCUjJfTElO
VVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSI2LjEyLjI3IgogQlIyX0xJTlVYX0tFUk5F
TF9VU0VfQVJDSF9ERUZBVUxUX0NPTkZJRz15CiBCUjJfTElOVVhfS0VSTkVMX0NPTkZJR19GUkFH
TUVOVF9GSUxFUz0iYm9hcmQvcWVtdS9hcm0tZWJici9saW51eC5mcmFnbWVudCIKIEJSMl9MSU5V
WF9LRVJORUxfTkVFRFNfSE9TVF9PUEVOU1NMPXkKK0JSMl9MSU5VWF9LRVJORUxfTkVFRFNfSE9T
VF9QWVRIT04zPXkKIEJSMl9QQUNLQUdFX09QVEVFX0NMSUVOVD15CiBCUjJfVEFSR0VUX1JPT1RG
U19FWFQyPXkKIEJSMl9UQVJHRVRfUk9PVEZTX0VYVDJfND15Ci0tIAoyLjUwLjEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
