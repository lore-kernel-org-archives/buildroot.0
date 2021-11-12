Return-Path: <SRS0=pZJ6=P7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B73AC433F5
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 13:14:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64D746102A
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 13:14:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 64D746102A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37D7040417;
	Fri, 12 Nov 2021 13:14:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K8AtLIiLO6dI; Fri, 12 Nov 2021 13:14:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 941D04041D;
	Fri, 12 Nov 2021 13:14:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3B4CA1BF405
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 13:13:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2B95E81C20
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 13:13:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 00XNVInHPvgj for <buildroot@lists.busybox.net>;
 Fri, 12 Nov 2021 13:13:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4268C80ECF
 for <buildroot@buildroot.org>; Fri, 12 Nov 2021 13:13:17 +0000 (UTC)
Received: (Authenticated sender: herve.codina@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPA id 9C34C200002;
 Fri, 12 Nov 2021 13:13:15 +0000 (UTC)
From: Herve Codina <herve.codina@bootlin.com>
To: buildroot@buildroot.org
Date: Fri, 12 Nov 2021 14:12:58 +0100
Message-Id: <20211112131258.2671293-6-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211112131258.2671293-1-herve.codina@bootlin.com>
References: <20211112131258.2671293-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 5/5]
 support/testing/tests/package/test_libshdata: new test
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
Cc: =?UTF-8?q?Herv=C3=A9=20Codina?= <herve.codina@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyBuZXcgdGVzdCBlbnN1cmVzIHRoYXQgbGlicmFyaWVzIGFuZCBiaW5hcmllcyBnZW5lcmF0
ZWQKdXNpbmcgUGFycm90IEFsY2hlbXkgYnVpbGQgc3lzdGVtIGFyZSBjb3JyZWN0LgpJbmRlZWQs
IHRoZSB0ZXN0IHVzZXMgbGlic2hkYXRhLXN0cmVzcy4KVGhpcyBiaW5hcnkgZGVwZW5kcyBvbiBs
aWJzaGRhdGEuCmxpYnNoZGF0YSBkZXBlbmRzIG9uIGxpYmZ1dGlscyBhbmQgbGliZnV0aWxzIGRl
cGVuZHMgb24gdWxvZy4KQWxsIG9mIHRoZXNlIGJpbmFyaWVzIGFuZCBsaWJyYXJpZXMgYXJlIGJ1
aWx0IHVzaW5nIEFsY2hlbXkuCgpTaWduZWQtb2ZmLWJ5OiBIZXJ2ZSBDb2RpbmEgPGhlcnZlLmNv
ZGluYUBib290bGluLmNvbT4KLS0tCkNoYW5nZWQgdjEgLT4gdjI6CiAgbm9uZQoKIERFVkVMT1BF
UlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxICsKIC4uLi90ZXN0aW5n
L3Rlc3RzL3BhY2thZ2UvdGVzdF9saWJzaGRhdGEucHkgICB8IDI1ICsrKysrKysrKysrKysrKysr
KysKIDIgZmlsZXMgY2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0
IHN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfbGlic2hkYXRhLnB5CgpkaWZmIC0t
Z2l0IGEvREVWRUxPUEVSUyBiL0RFVkVMT1BFUlMKaW5kZXggNDYxYzk4N2I5NC4uNGEwMzA4NjY1
MyAxMDA2NDQKLS0tIGEvREVWRUxPUEVSUworKysgYi9ERVZFTE9QRVJTCkBAIC0xMTU4LDYgKzEx
NTgsNyBAQCBGOglwYWNrYWdlL2xpYnNoZGF0YS8KIEY6CXBhY2thZ2UvbHVhLWF1Z2Vhcy8KIEY6
CXBhY2thZ2UvdWxvZy8KIEY6CXN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfZHRi
b2NmZy5weQorRjoJc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9saWJzaGRhdGEu
cHkKIEY6CXN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfbHVhX2F1Z2Vhcy5weQog
CiBOOglIZXJ2w6kgQ29kaW5hIDxoZXJ2ZS5jb2RpbmFAYm9vdGxpbi5jb20+CmRpZmYgLS1naXQg
YS9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X2xpYnNoZGF0YS5weSBiL3N1cHBv
cnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfbGlic2hkYXRhLnB5Cm5ldyBmaWxlIG1vZGUg
MTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjgwYjAzMmFjNjkKLS0tIC9kZXYvbnVsbAorKysgYi9z
dXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X2xpYnNoZGF0YS5weQpAQCAtMCwwICsx
LDI1IEBACitpbXBvcnQgb3MKKworaW1wb3J0IGluZnJhLmJhc2V0ZXN0CisKKworY2xhc3MgVGVz
dExpYnNoZGF0YShpbmZyYS5iYXNldGVzdC5CUlRlc3QpOgorICAgIGNvbmZpZyA9IGluZnJhLmJh
c2V0ZXN0LkJBU0lDX1RPT0xDSEFJTl9DT05GSUcgKyBcCisgICAgICAgICIiIgorICAgICAgICBC
UjJfUEFDS0FHRV9MSUJTSERBVEE9eQorICAgICAgICBCUjJfUEFDS0FHRV9MSUJTSERBVEFfU1RS
RVNTPXkKKyAgICAgICAgQlIyX1RBUkdFVF9ST09URlNfQ1BJTz15CisgICAgICAgICMgQlIyX1RB
UkdFVF9ST09URlNfVEFSIGlzIG5vdCBzZXQKKyAgICAgICAgIiIiCisKKyAgICBkZWYgdGVzdF9y
dW4oc2VsZik6CisgICAgICAgIGltZyA9IG9zLnBhdGguam9pbihzZWxmLmJ1aWxkZGlyLCAiaW1h
Z2VzIiwgInJvb3Rmcy5jcGlvIikKKyAgICAgICAgc2VsZi5lbXVsYXRvci5ib290KGFyY2g9ImFy
bXY1IiwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgIGtlcm5lbD0iYnVpbHRpbiIsCisgICAg
ICAgICAgICAgICAgICAgICAgICAgICBvcHRpb25zPVsiLWluaXRyZCIsIGltZ10pCisgICAgICAg
IHNlbGYuZW11bGF0b3IubG9naW4oKQorCisgICAgICAgICMgSnVzdCBydW4gbGlic2hkYXRhLXN0
cmVzcy4KKyAgICAgICAgIyBUaGlzIGVuc3VyZXMgdGhhdCBsaWJyYXJ5IGFyZSB3ZWxsIGNvbXBp
bGVkIGFuZCB0aGF0IGFsbCBkZXBlbmRlbmNpZXMKKyAgICAgICAgIyBhcmUgbWV0IHVzaW5nIFBh
cnJvdCBBbGNoZW15IGJ1aWxkIHN5c3RlbS4KKyAgICAgICAgc2VsZi5hc3NlcnRSdW5PaygibGli
c2hkYXRhLXN0cmVzcyIpCi0tIAoyLjMxLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
