Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1E2DC61DA4
	for <buildroot@archiver.kernel.org>; Thu, 23 Feb 2023 18:09:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 03150821B9;
	Thu, 23 Feb 2023 18:09:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 03150821B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n2tXHEzC4qZO; Thu, 23 Feb 2023 18:09:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 309F0821BD;
	Thu, 23 Feb 2023 18:09:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 309F0821BD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 120E31BF2BD
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 18:09:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E032381B23
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 18:09:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E032381B23
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TtG3TZm1NJO4 for <buildroot@lists.busybox.net>;
 Thu, 23 Feb 2023 18:09:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5530C81975
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5530C81975
 for <buildroot@buildroot.org>; Thu, 23 Feb 2023 18:09:02 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 23CCF14BF;
 Thu, 23 Feb 2023 10:09:44 -0800 (PST)
Received: from localhost.localdomain (X72Y076X74.nice.arm.com [10.34.129.9])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 73E8D3F587;
 Thu, 23 Feb 2023 10:09:00 -0800 (PST)
From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>
To: buildroot@buildroot.org
Date: Thu, 23 Feb 2023 19:08:47 +0100
Message-Id: <20230223180847.2512056-3-vincent.stehle@arm.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230223180847.2512056-1-vincent.stehle@arm.com>
References: <20230223180847.2512056-1-vincent.stehle@arm.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] configs/arm_foundationv8: bump to Linux
 6.1.13
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
Cc: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

LSBCdW1wIExpbnV4IGtlcm5lbCB0byB2Ni4xLjEzIGFuZCBpbmNyZWFzZSB0aGUgcm9vdGZzIHNp
emUgYWNjb3JkaW5nbHkuCi0gQnVtcCB0aGUgRlZQIGluIHRoZSByZWFkbWUgdG8gdmVyc2lvbiAx
MS4yMCBidWlsZCAxNSBhbmQgdXBkYXRlIHRoZQogIGNvbW1hbmQgbGluZS4KClNpZ25lZC1vZmYt
Ynk6IFZpbmNlbnQgU3RlaGzDqSA8dmluY2VudC5zdGVobGVAYXJtLmNvbT4KQ2M6IE1hc2FoaXJv
IFlhbWFkYSA8eWFtYWRhLm1hc2FoaXJvQHNvY2lvbmV4dC5jb20+Ci0tLQogYm9hcmQvYXJtL2Zv
dW5kYXRpb24tdjgvcmVhZG1lLnR4dCB8IDQgKystLQogY29uZmlncy9hcm1fZm91bmRhdGlvbnY4
X2RlZmNvbmZpZyB8IDcgKysrKy0tLQogMiBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyks
IDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYm9hcmQvYXJtL2ZvdW5kYXRpb24tdjgvcmVh
ZG1lLnR4dCBiL2JvYXJkL2FybS9mb3VuZGF0aW9uLXY4L3JlYWRtZS50eHQKaW5kZXggYjUxMDZm
MDE1ZS4uY2IwZmUwOGI4NyAxMDA2NDQKLS0tIGEvYm9hcmQvYXJtL2ZvdW5kYXRpb24tdjgvcmVh
ZG1lLnR4dAorKysgYi9ib2FyZC9hcm0vZm91bmRhdGlvbi12OC9yZWFkbWUudHh0CkBAIC0zLDE0
ICszLDE0IEBAIEFSTSBzb2Z0d2FyZSBzaW11bGF0b3Igb2YgdGhlIEFBcmNoNjQgYXJjaGl0ZWN0
dXJlLgogCiBGaXJzdCwgb25lIGhhcyB0byBkb3dubG9hZCB0aGUgQUFyY2g2NCBzb2Z0d2FyZSBz
aW11bGF0b3IgZnJvbToKIAotICBodHRwczovL3NpbHZlci5hcm0uY29tL2Rvd25sb2FkL2Rvd25s
b2FkLnRtP3B2PTQ4MDcxODYKKyAgaHR0cHM6Ly9hcm1rZWlsLmJsb2IuY29yZS53aW5kb3dzLm5l
dC9kZXZlbG9wZXIvRmlsZXMvZG93bmxvYWRzL2Vjb3N5c3RlbS1tb2RlbHMvRm91bmRhdGlvbl9Q
bGF0Zm9ybV8xMS4yMF8xNV9MaW51eDY0LnRnegogCiBUaGVuLCB1c2UgdGhlIGFybV9mb3VuZGF0
aW9udjhfZGVmY29uZmlnIGNvbmZpZ3VyYXRpb24gdG8gYnVpbGQgeW91cgogQnVpbGRyb290IHN5
c3RlbS4KIAogRmluYWxseSwgYm9vdCB5b3VyIHN5c3RlbSB3aXRoOgogCi0gJHtMT0NBVElPTl9P
Rl9GT1VOREFUSU9OVjhfU0lNVUxBVE9SfS9tb2RlbHMvTGludXg2NF9HQ0MtNi40L0ZvdW5kYXRp
b25fUGxhdGZvcm0gXAorICR7TE9DQVRJT05fT0ZfRk9VTkRBVElPTlY4X1NJTVVMQVRPUn0vbW9k
ZWxzL0xpbnV4NjRfR0NDLTkuMy9Gb3VuZGF0aW9uX1BsYXRmb3JtIFwKICAgICAtLWltYWdlIG91
dHB1dC9pbWFnZXMvbGludXgtc3lzdGVtLmF4ZiBcCiAgICAgLS1ibG9jay1kZXZpY2Ugb3V0cHV0
L2ltYWdlcy9yb290ZnMuZXh0MiBcCiAgICAgLS1uZXR3b3JrPW5hdCBcCmRpZmYgLS1naXQgYS9j
b25maWdzL2FybV9mb3VuZGF0aW9udjhfZGVmY29uZmlnIGIvY29uZmlncy9hcm1fZm91bmRhdGlv
bnY4X2RlZmNvbmZpZwppbmRleCAzYzYzZjVkYzc2Li4xMDJmZThmZDA5IDEwMDY0NAotLS0gYS9j
b25maWdzL2FybV9mb3VuZGF0aW9udjhfZGVmY29uZmlnCisrKyBiL2NvbmZpZ3MvYXJtX2ZvdW5k
YXRpb252OF9kZWZjb25maWcKQEAgLTEsMTUgKzEsMTYgQEAKIEJSMl9hYXJjaDY0PXkKLSMgTGlu
dXggaGVhZGVycyBzYW1lIGFzIGtlcm5lbCwgYSA1LjE2IHNlcmllcwotQlIyX1BBQ0tBR0VfSE9T
VF9MSU5VWF9IRUFERVJTX0NVU1RPTV81XzE2PXkKKyMgTGludXggaGVhZGVycyBzYW1lIGFzIGtl
cm5lbCwgYSA2LjEgc2VyaWVzCitCUjJfUEFDS0FHRV9IT1NUX0xJTlVYX0hFQURFUlNfQ1VTVE9N
XzZfMT15CiBCUjJfVEFSR0VUX0dFTkVSSUNfR0VUVFlfUE9SVD0idHR5QU1BMCIKIEJSMl9MSU5V
WF9LRVJORUw9eQogQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVkVSU0lPTj15Ci1CUjJfTElOVVhf
S0VSTkVMX0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSI1LjE2LjIwIgorQlIyX0xJTlVYX0tFUk5FTF9D
VVNUT01fVkVSU0lPTl9WQUxVRT0iNi4xLjEzIgogQlIyX0xJTlVYX0tFUk5FTF9VU0VfQVJDSF9E
RUZBVUxUX0NPTkZJRz15CiBCUjJfTElOVVhfS0VSTkVMX0RUU19TVVBQT1JUPXkKIEJSMl9MSU5V
WF9LRVJORUxfSU5UUkVFX0RUU19OQU1FPSJhcm0vZm91bmRhdGlvbi12OC1naWN2My1wc2NpIgog
QlIyX0xJTlVYX0tFUk5FTF9ORUVEU19IT1NUX09QRU5TU0w9eQogQlIyX1RBUkdFVF9ST09URlNf
RVhUMj15CitCUjJfVEFSR0VUX1JPT1RGU19FWFQyX1NJWkU9IjEyOE0iCiAjIEJSMl9UQVJHRVRf
Uk9PVEZTX1RBUiBpcyBub3Qgc2V0CiBCUjJfVEFSR0VUX0JPT1RfV1JBUFBFUl9BQVJDSDY0PXkK
IEJSMl9UQVJHRVRfQk9PVF9XUkFQUEVSX0FBUkNINjRfRFRTPSJhcm0vZm91bmRhdGlvbi12OC1n
aWN2My1wc2NpIgotLSAKMi4zOS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
