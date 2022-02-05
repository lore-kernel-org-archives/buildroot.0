Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E40AC433F5
	for <buildroot@archiver.kernel.org>; Sat,  5 Feb 2022 14:43:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E855260B72;
	Sat,  5 Feb 2022 14:43:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f9QfBnslr1Kd; Sat,  5 Feb 2022 14:43:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3FCB06080A;
	Sat,  5 Feb 2022 14:43:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4C3C51BF33C
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 14:43:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 421DA81CAD
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 14:43:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dlxsDovaDHUr for <buildroot@lists.busybox.net>;
 Sat,  5 Feb 2022 14:43:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 17BA881CA3
 for <buildroot@buildroot.org>; Sat,  5 Feb 2022 14:43:12 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id F1C4FFF805;
 Sat,  5 Feb 2022 14:43:10 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1nGMHO-0007gS-8n; Sat, 05 Feb 2022 15:43:10 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat,  5 Feb 2022 15:43:04 +0100
Message-Id: <20220205144306.29481-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/rauc: d-bus support is optional
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
Cc: Andrey Yurovsky <yurovsky@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QXMgcG9pbnRlZCBvdXQgYnkgSmFuIEzDvGJiZSwgRC1CdXMgc3VwcG9ydCBpcyBvcHRpb25hbDoK
Cj4gWW91IGNhbiBidWlsZCB3aXRob3V0IEQtQnVzICguL2NvbmZpZ3VyZSAtLWRpc2FibGUtc2Vy
dmljZSkuCgpTbyBkcm9wIGl0IGZyb20gdGhlIHJlcXVpcmVkIGRlcGVuZGVuY2llcyBhbmQgYWRk
IGEgUkFVQ19EQlVTIHN1YiBvcHRpb24KbGlrZSBpdCBpcyBkb25lIGZvciBuZXR3b3JrL2pzb24u
CgpTaWduZWQtb2ZmLWJ5OiBQZXRlciBLb3JzZ2FhcmQgPHBldGVyQGtvcnNnYWFyZC5jb20+Ci0t
LQogcGFja2FnZS9yYXVjL0NvbmZpZy5pbiB8IDggKysrKysrKy0KIHBhY2thZ2UvcmF1Yy9yYXVj
Lm1rICAgfCA5ICsrKysrKysrLQogMiBmaWxlcyBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvcmF1Yy9Db25maWcuaW4gYi9wYWNr
YWdlL3JhdWMvQ29uZmlnLmluCmluZGV4IDY3NmZmNDJiNTEuLmI0ZjdiODE5NDggMTAwNjQ0Ci0t
LSBhL3BhY2thZ2UvcmF1Yy9Db25maWcuaW4KKysrIGIvcGFja2FnZS9yYXVjL0NvbmZpZy5pbgpA
QCAtNSw3ICs1LDYgQEAgY29uZmlnIEJSMl9QQUNLQUdFX1JBVUMKIAlkZXBlbmRzIG9uIEJSMl9V
U0VfV0NIQVIgIyBnbGliMgogCXNlbGVjdCBCUjJfUEFDS0FHRV9MSUJHTElCMgogCXNlbGVjdCBC
UjJfUEFDS0FHRV9PUEVOU1NMCi0Jc2VsZWN0IEJSMl9QQUNLQUdFX0RCVVMKIAlzZWxlY3QgQlIy
X1BBQ0tBR0VfU1FVQVNIRlMgIyBydW4tdGltZSBkZXBlbmRlbmN5CiAJc2VsZWN0IEJSMl9QQUNL
QUdFX1VCT09UX1RPT0xTIGlmIEJSMl9UQVJHRVRfVUJPT1QgIyBydW4tdGltZSBkZXBlbmRlbmN5
CiAJc2VsZWN0IEJSMl9QQUNLQUdFX1VCT09UX1RPT0xTX0ZXUFJJTlRFTlYgaWYgQlIyX1RBUkdF
VF9VQk9PVApAQCAtMTksNiArMTgsMTMgQEAgY29uZmlnIEJSMl9QQUNLQUdFX1JBVUMKIAogaWYg
QlIyX1BBQ0tBR0VfUkFVQwogCitjb25maWcgQlIyX1BBQ0tBR0VfUkFVQ19EQlVTCisJYm9vbCAi
ZGJ1cyBzdXBwb3J0IgorCXNlbGVjdCBCUjJfUEFDS0FHRV9EQlVTCisJaGVscAorCSAgVGhpcyBv
cHRpb24gZW5hYmxlcyBzdXBwb3J0IGZvciBjb250cm9sbGluZyByYXVjIHRocm91Z2gKKwkgIEQt
QnVzLgorCiBjb25maWcgQlIyX1BBQ0tBR0VfUkFVQ19ORVRXT1JLCiAJYm9vbCAibmV0d29yayBz
dXBwb3J0IgogCXNlbGVjdCBCUjJfUEFDS0FHRV9MSUJDVVJMCmRpZmYgLS1naXQgYS9wYWNrYWdl
L3JhdWMvcmF1Yy5tayBiL3BhY2thZ2UvcmF1Yy9yYXVjLm1rCmluZGV4IDRmYjNkZGRlM2UuLjk5
ZWZjMTZjMmYgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvcmF1Yy9yYXVjLm1rCisrKyBiL3BhY2thZ2Uv
cmF1Yy9yYXVjLm1rCkBAIC0xMCw3ICsxMCwxNCBAQCBSQVVDX1NPVVJDRSA9IHJhdWMtJChSQVVD
X1ZFUlNJT04pLnRhci54egogUkFVQ19MSUNFTlNFID0gTEdQTC0yLjEKIFJBVUNfTElDRU5TRV9G
SUxFUyA9IENPUFlJTkcKIFJBVUNfQ1BFX0lEX1ZFTkRPUiA9IHBlbmd1dHJvbml4Ci1SQVVDX0RF
UEVOREVOQ0lFUyA9IGhvc3QtcGtnY29uZiBvcGVuc3NsIGxpYmdsaWIyIGRidXMKK1JBVUNfREVQ
RU5ERU5DSUVTID0gaG9zdC1wa2djb25mIG9wZW5zc2wgbGliZ2xpYjIKKworaWZlcSAoJChCUjJf
UEFDS0FHRV9SQVVDX0RCVVMpLHkpCitSQVVDX0NPTkZfT1BUUyArPSAtLWVuYWJsZS1zZXJ2aWNl
CitSQVVDX0RFUEVOREVOQ0lFUyArPSBkYnVzCitlbHNlCitSQVVDX0NPTkZfT1BUUyArPSAtLWRp
c2FibGUtc2VydmljZQorZW5kaWYKIAogaWZlcSAoJChCUjJfUEFDS0FHRV9SQVVDX05FVFdPUksp
LHkpCiBSQVVDX0NPTkZfT1BUUyArPSAtLWVuYWJsZS1uZXR3b3JrCi0tIAoyLjIwLjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
