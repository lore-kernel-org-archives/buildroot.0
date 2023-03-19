Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D8AFC6FD1F
	for <buildroot@archiver.kernel.org>; Sun, 19 Mar 2023 10:14:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DD6981A29;
	Sun, 19 Mar 2023 10:14:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2DD6981A29
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vFHbv6W0-nb2; Sun, 19 Mar 2023 10:14:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BD3081A16;
	Sun, 19 Mar 2023 10:14:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6BD3081A16
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DC8CE1BF3C1
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 10:14:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B79D1405C5
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 10:14:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B79D1405C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yFvcNT6aRGlu for <buildroot@lists.busybox.net>;
 Sun, 19 Mar 2023 10:14:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 30BD3400D7
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 30BD3400D7
 for <buildroot@buildroot.org>; Sun, 19 Mar 2023 10:14:24 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.208.48]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M5fIQ-1pb7I728T4-007GIq; Sun, 19
 Mar 2023 11:14:21 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Sun, 19 Mar 2023 11:14:19 +0100
Message-Id: <20230319101420.9440-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:kU5OEI6EAoruiJTNSMovfSnCzByoH6xHtuX/hVHOdWkTqMWsjw6
 nCVIFeHfU0xda2go6HgDYVgeTtGbPCFAkgonEgfzmxlzllX9I+TxjzbhD6CLYibaKoU0SoC
 ztHfMffQE7nGFAEmJOmcVHtvWa/Ft9S1XX8X6ZcfyWzrCE1+nhqAUZa+W1Ub7e5rKpk7BTT
 F6cqvT2FDQ2zdYt1OM9Rg==
UI-OutboundReport: notjunk:1;M01:P0:HAMsid8e0hY=;3lzCa04t90zoJ3rBYY4maCj+euL
 /3YNEvGXLgsiFB+95662NUOSOHJV0BHw8dlDNUWVw6mMOse/JQyG/FTpFpOp6sGNkKw1AtC81
 n4UXd8A43J1ju3J+LYvmsSZR1eC8XigBrqITpob0bkmzslMgFyWf3hPZsu+PEN4+1J3hOAJum
 X8tMCa+z/9XCq6YXUJQrQT8JtS/gRaJ4doru3WjYML1Xgx2GpHYDTMeFjihtl9f7zRb6wW30E
 XGiKWEUUqja3zqY92etEGdzLHdn6U2bQi8+WxAaeAJSrNnjRP/Td5/z7ESblXU9MDSlcJWHTd
 LZCc1vk3pruDpkiKad2mzxZual27hK2ckX0cFhmxkRSOVbgZpOKWtEZN3rw+qT6P0upZlwgYx
 eXX414FfqMmgC6UKVIXOK4xjJJtdiOn9q9lwR0Oo9etdtRHEdrgF54ED0UAPekANBZQOvEteJ
 TWphMiJfBYKyT5HbJgtU5po2/dSGWe9bLVb0TeZ/uWuG4K9LOP61YZ1EQ6YM5kM4Yn696h9uH
 rmVaGAVT/zMN7p/+E4fWLkmz1PGjDmt6QYf56/vb64HM9PdXjvQiBJSRlpMwcB8R7W4fG4Mi+
 YToThy13wL3Za9eCX4eBP1Ln1K7gEyr9kPegJzaQukBtxEUv+pm6d8xfaE0aPNfDD7u5h9NG6
 m8nqnV9lxSQtWqh73v9rQ+3r40DT6l87MdMgSc3XX5etgX3FEF6ramUos3LRV9JLdkzX1XQkR
 bFMDlVab2fDZp2MffqMowWzs7eG/ZYTr2N3j1IIgMLQTsLMxVIetFTiJ79Fm0LEWQdWV8bAzl
 +yfL3AJB9MIkMVHlF8p7F3n+ReURLa9QQWjkfniOYQCo1EnzqkRcG81taT8Qx2/5y5Ge74Ngv
 14PgbRKy9jfJKdFXVANkfl8kQ+5VC7hXmngz1xEi/d4Q2PM/CpIBP5DXT7bqB+053UiLmPOqQ
 QFd4wQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=s31663417; 
 t=1679220861; i=ps.report@gmx.net;
 bh=DYqxsA3PrkMgnvM0jcB9udFee1f9qbfXSqGrfgyG12c=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=EdbHYrYGAie5MaBjPaY24tMTVIxgG3ZeQbCXFcXFzXmzPrbTCP74TGbUSUCGxBHTh
 UK903BPEji5dcg3bVXitFg0F2i0GTr4kPIvcuUJY99N86oduBbg4nbwvEr7MwrKpKd
 s9/hnoHPNSPwUq3mV1zrdZGwPHCrCpOehmuFsyCJRGcXmcl1LvAWGi1FZoChZThZ6/
 K+Yv5XQ0Iuzjpqr6sgfwzxW1QU7IJhlHIwk8VedDy/XDZmvKmaH7kDX+jgtf4LjpY5
 yXQ3x9pf7U9upN02lTWPwg+Zbi3ZWdp1/x9LygNw8uLbLZa0+GDevfyvdFaDKshkzv
 0kr04yadwZonA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=EdbHYrYG
Subject: [Buildroot] [PATCH v1 1/2] package/qt6: bump version to 6.4.3
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
Cc: Jesse Van Gavere <jesseevg@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For details see [1].

[1] https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.4.3/release-note.md

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/qt6/qt6.mk                           | 2 +-
 package/qt6/qt6base/qt6base.hash             | 4 ++--
 package/qt6/qt6serialbus/qt6serialbus.hash   | 4 ++--
 package/qt6/qt6serialport/qt6serialport.hash | 4 ++--
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/qt6/qt6.mk b/package/qt6/qt6.mk
index 431bb8c9d3..1edb252c96 100644
--- a/package/qt6/qt6.mk
+++ b/package/qt6/qt6.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 QT6_VERSION_MAJOR = 6.4
-QT6_VERSION = $(QT6_VERSION_MAJOR).2
+QT6_VERSION = $(QT6_VERSION_MAJOR).3
 QT6_SOURCE_TARBALL_PREFIX = everywhere-src
 QT6_SITE = https://download.qt.io/archive/qt/$(QT6_VERSION_MAJOR)/$(QT6_VERSION)/submodules
 
diff --git a/package/qt6/qt6base/qt6base.hash b/package/qt6/qt6base/qt6base.hash
index 63af373836..cb111bd405 100644
--- a/package/qt6/qt6base/qt6base.hash
+++ b/package/qt6/qt6base/qt6base.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.4/6.4.2/submodules/qtbase-everywhere-src-6.4.2.tar.xz.sha256
-sha256  a88bc6cedbb34878a49a622baa79cace78cfbad4f95fdbd3656ddb21c705525d  qtbase-everywhere-src-6.4.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.4/6.4.3/submodules/qtbase-everywhere-src-6.4.3.tar.xz.sha256
+sha256  5087c9e5b0165e7bc3c1a4ab176b35d0cd8f52636aea903fa377bdba00891a60  qtbase-everywhere-src-6.4.3.tar.xz
 
 # Hashes for license files
 sha256  e3ba223bb1423f0aad8c3dfce0fe3148db48926d41e6fbc3afbbf5ff9e1c89cb  LICENSES/Apache-2.0.txt
diff --git a/package/qt6/qt6serialbus/qt6serialbus.hash b/package/qt6/qt6serialbus/qt6serialbus.hash
index be01f13363..98c8931962 100644
--- a/package/qt6/qt6serialbus/qt6serialbus.hash
+++ b/package/qt6/qt6serialbus/qt6serialbus.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.4/6.4.2/submodules/qtserialbus-everywhere-src-6.4.2.tar.xz.sha256
-sha256  604013657c7327899aa50748deb4bcb5e545ab37ff4964795b9e6f617d48bf1b  qtserialbus-everywhere-src-6.4.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.4/6.4.3/submodules/qtserialbus-everywhere-src-6.4.3.tar.xz.sha256
+sha256  b6446a7516d1f04e561c00f9c50ce4d39dad72150f067722ba759f00b4b34366  qtserialbus-everywhere-src-6.4.3.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6serialport/qt6serialport.hash b/package/qt6/qt6serialport/qt6serialport.hash
index 1eaa3d6150..9341978d86 100644
--- a/package/qt6/qt6serialport/qt6serialport.hash
+++ b/package/qt6/qt6serialport/qt6serialport.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.4/6.4.2/submodules/qtserialport-everywhere-src-6.4.2.tar.xz.sha256
-sha256  336d95919037800184b3c3de8ccb6f62954b20f3756c05adce8d5010504340fa  qtserialport-everywhere-src-6.4.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.4/6.4.3/submodules/qtserialport-everywhere-src-6.4.3.tar.xz.sha256
+sha256  5f97ad9067efa39a8a2a39fbbc1e03d2191f305733d9c2f3060f8017ecfc95de  qtserialport-everywhere-src-6.4.3.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
