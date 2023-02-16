Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86E6AC61DA4
	for <buildroot@archiver.kernel.org>; Thu, 16 Feb 2023 10:08:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2FC4060F3C;
	Thu, 16 Feb 2023 10:08:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2FC4060F3C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Cxy-8RvX2f2H; Thu, 16 Feb 2023 10:08:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 52A9960F2A;
	Thu, 16 Feb 2023 10:08:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 52A9960F2A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5C7CA1BF333
 for <buildroot@lists.busybox.net>; Thu, 16 Feb 2023 10:08:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3854840297
 for <buildroot@lists.busybox.net>; Thu, 16 Feb 2023 10:08:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3854840297
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WFTtNVAV0TSD for <buildroot@lists.busybox.net>;
 Thu, 16 Feb 2023 10:08:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 256484023F
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp2.osuosl.org (Postfix) with ESMTP id 256484023F
 for <buildroot@buildroot.org>; Thu, 16 Feb 2023 10:08:02 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 423CD1042;
 Thu, 16 Feb 2023 02:08:44 -0800 (PST)
Received: from localhost.localdomain (X72Y076X74.nice.arm.com [10.34.129.33])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id
 D841F3F703; Thu, 16 Feb 2023 02:08:00 -0800 (PST)
From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>
To: buildroot@buildroot.org
Date: Thu, 16 Feb 2023 11:07:50 +0100
Message-Id: <20230216100751.446662-1-vincent.stehle@arm.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] configs/qemu_arm_ebbr: bump linux to 6.1.12
 and u-boot to 2023.01
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
Cc: Romain Naour <romain.naour@gmail.com>,
 =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>,
 Etienne Carriere <etienne.carriere@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

LSBCdW1wIExpbnV4IGtlcm5lbCB2ZXJzaW9uIHRvIDYuMS4xMi4KLSBCdW1wIFUtQm9vdCB2ZXJz
aW9uIHRvIDIwMjMuMDEgYW5kIGZvbGxvdyBDT05GSUdfU1lTX1RFWFRfQkFTRSByZW5hbWluZy4K
ClNpZ25lZC1vZmYtYnk6IFZpbmNlbnQgU3RlaGzDqSA8dmluY2VudC5zdGVobGVAYXJtLmNvbT4K
Q2M6IFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQGdtYWlsLmNvbT4KLS0tCiBib2FyZC9xZW11
L2FybS1lYmJyL3UtYm9vdC5mcmFnbWVudCB8IDIgKy0KIGNvbmZpZ3MvcWVtdV9hcm1fZWJicl9k
ZWZjb25maWcgICAgIHwgNiArKystLS0KIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCsp
LCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2JvYXJkL3FlbXUvYXJtLWViYnIvdS1ib290
LmZyYWdtZW50IGIvYm9hcmQvcWVtdS9hcm0tZWJici91LWJvb3QuZnJhZ21lbnQKaW5kZXggYmZj
MzgyY2RlOS4uNjZmZTkxMGYxNiAxMDA2NDQKLS0tIGEvYm9hcmQvcWVtdS9hcm0tZWJici91LWJv
b3QuZnJhZ21lbnQKKysrIGIvYm9hcmQvcWVtdS9hcm0tZWJici91LWJvb3QuZnJhZ21lbnQKQEAg
LTMxLDUgKzMxLDUgQEAgQ09ORklHX1BBUlRJVElPTl9UWVBFX0dVSUQ9eQogQ09ORklHX1JOR19P
UFRFRT15CiBDT05GSUdfUlRDX0VNVUxBVElPTj15CiBDT05GSUdfU0NNSV9GSVJNV0FSRT15Ci1D
T05GSUdfU1lTX1RFWFRfQkFTRT0weDYwMDAwMDAwCiBDT05GSUdfVEVFPXkKK0NPTkZJR19URVhU
X0JBU0U9MHg2MDAwMDAwMApkaWZmIC0tZ2l0IGEvY29uZmlncy9xZW11X2FybV9lYmJyX2RlZmNv
bmZpZyBiL2NvbmZpZ3MvcWVtdV9hcm1fZWJicl9kZWZjb25maWcKaW5kZXggZjNlMmQ0MmE1NC4u
OGZiYjMwNjliYyAxMDA2NDQKLS0tIGEvY29uZmlncy9xZW11X2FybV9lYmJyX2RlZmNvbmZpZwor
KysgYi9jb25maWdzL3FlbXVfYXJtX2ViYnJfZGVmY29uZmlnCkBAIC03LDEyICs3LDEyIEBAIEJS
Ml9ST09URlNfUE9TVF9JTUFHRV9TQ1JJUFQ9ImJvYXJkL3FlbXUvcG9zdC1pbWFnZS5zaCBib2Fy
ZC9xZW11L2FybS1lYmJyL3Bvc3QtCiBCUjJfUk9PVEZTX1BPU1RfU0NSSVBUX0FSR1M9IiQoQlIy
X0RFRkNPTkZJRykgLWMgYm9hcmQvcWVtdS9hcm0tZWJici9nZW5pbWFnZS5jZmciCiAKICMgTGlu
dXggaGVhZGVycwotQlIyX1BBQ0tBR0VfSE9TVF9MSU5VWF9IRUFERVJTX0NVU1RPTV82XzA9eQor
QlIyX1BBQ0tBR0VfSE9TVF9MSU5VWF9IRUFERVJTX0NVU1RPTV82XzE9eQogCiAjIEtlcm5lbAog
QlIyX0xJTlVYX0tFUk5FTD15CiBCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9OPXkKLUJS
Ml9MSU5VWF9LRVJORUxfQ1VTVE9NX1ZFUlNJT05fVkFMVUU9IjYuMC45IgorQlIyX0xJTlVYX0tF
Uk5FTF9DVVNUT01fVkVSU0lPTl9WQUxVRT0iNi4xLjEyIgogQlIyX0xJTlVYX0tFUk5FTF9VU0Vf
QVJDSF9ERUZBVUxUX0NPTkZJRz15CiBCUjJfTElOVVhfS0VSTkVMX0NPTkZJR19GUkFHTUVOVF9G
SUxFUz0iYm9hcmQvcWVtdS9hcm0tZWJici9saW51eC5mcmFnbWVudCIKIApAQCAtNDIsNyArNDIs
NyBAQCBCUjJfVEFSR0VUX09QVEVFX09TX1BMQVRGT1JNPSJ2ZXhwcmVzcy1xZW11X3ZpcnQiCiBC
UjJfVEFSR0VUX1VCT09UPXkKIEJSMl9UQVJHRVRfVUJPT1RfQlVJTERfU1lTVEVNX0tDT05GSUc9
eQogQlIyX1RBUkdFVF9VQk9PVF9DVVNUT01fVkVSU0lPTj15Ci1CUjJfVEFSR0VUX1VCT09UX0NV
U1RPTV9WRVJTSU9OX1ZBTFVFPSIyMDIyLjEwIgorQlIyX1RBUkdFVF9VQk9PVF9DVVNUT01fVkVS
U0lPTl9WQUxVRT0iMjAyMy4wMSIKIEJSMl9UQVJHRVRfVUJPT1RfQk9BUkRfREVGQ09ORklHPSJx
ZW11X2FybSIKIEJSMl9UQVJHRVRfVUJPT1RfQ09ORklHX0ZSQUdNRU5UX0ZJTEVTPSJib2FyZC9x
ZW11L2FybS1lYmJyL3UtYm9vdC5mcmFnbWVudCIKIEJSMl9UQVJHRVRfVUJPT1RfTkVFRFNfT1BF
TlNTTD15Ci0tIAoyLjM5LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
