Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3D03C433EF
	for <buildroot@archiver.kernel.org>; Sun,  2 Jan 2022 21:04:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71D1E40219;
	Sun,  2 Jan 2022 21:04:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l3oRzPwFEXVU; Sun,  2 Jan 2022 21:04:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC67140216;
	Sun,  2 Jan 2022 21:04:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DA1031BF3E8
 for <buildroot@lists.busybox.net>; Sun,  2 Jan 2022 21:04:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CE91240216
 for <buildroot@lists.busybox.net>; Sun,  2 Jan 2022 21:04:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0SdTxTshZMY2 for <buildroot@lists.busybox.net>;
 Sun,  2 Jan 2022 21:04:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0642.aruba.it (smtpcmd0642.aruba.it [62.149.156.42])
 by smtp4.osuosl.org (Postfix) with ESMTP id 924444014A
 for <buildroot@buildroot.org>; Sun,  2 Jan 2022 21:04:12 +0000 (UTC)
Received: from localhost.localdomain ([146.241.138.59])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 481RnpR0TVJjR481SnuFeb; Sun, 02 Jan 2022 22:04:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1641157450; bh=KOAN7yupji0ebuSmqCp6mQyYd+9Gbt0zpVtR2NtXCqw=;
 h=From:To:Subject:Date:MIME-Version;
 b=HKOedAGbD3L9aJ/XvbU9ba+g+rg/3J/QEYKVeS2TWnqsJ2aQjMJn7fZTwSE6jAb0L
 ggtjwB7jUL3W/yCz8Aoa3ssnfQJ064tP+Es8R97pI48HcHpun1Tvlqk82F0TEkfjss
 ALYMJ+dHHlOJTHZuo6u/RmEtYckmQ4vZiEqYSKsIFvRKQ+9gCMHQzyuhg79jF9V9cr
 I3y9ngjPgTf1Y8KyazqxDDmoTPtXtJPrKCQgISqwITKWRVGIJQe3fvy8EAVBysUcrL
 UnuyAEAGgOW6GALVgQmIizr2w9Z8Y/iMpqcuJ7sA3HJdl+1GT4XgERGnk9UsOEkKyG
 P/7w0rHPuAxVg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  2 Jan 2022 22:04:08 +0100
Message-Id: <20220102210408.221439-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220102210408.221439-1-giulio.benetti@benettiengineering.com>
References: <20220102210408.221439-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfNj4EHr0vxuQ7ekO66WWqVv3hOH/j2VUrotJkrpE/WdBfxSzGtVt31wl6a7XTbeeWJ+IRekyTz+d076XZUnjLXrTEuXUHWxbMpCnMNnFxwYoxbhWZff/
 +AVACUYq0ynCDIgku5WRrxCp42mquBPXmK0oTsiCw4jVBlSTUEaokW1iaz9om5sVQ+PrtKV2PhrL4VO7VH5aRDYNJYB18ptnozvHa34w7sl0vtXyFXcjsAsx
 FEXzZq+Y36LoRJiCMQaWYS5UxLCXz+nKZCotfgL6G/4eaP9YOYv9BK53vHPo+gjyVPaJ5CYRhoSgoDlIWo0AIBxP9rt8ERJ5iNL7nwHdrjLENO/bwpb+fm/x
 p+T/5j4z0aip3CNVwCIy8rKFhfEzEGHyNAX+Nuzd6qlSnKFLXoDTKXgoeOcyoUXBNGrmMqIU
Subject: [Buildroot] [PATCH 2/2] toolchain: remove binutils bug 21464
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Binutils bug 21464 is not present anymore in Buildroot so let's remove it
and its depends on in libgeos and postgis packages.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libgeos/Config.in | 4 +---
 package/postgis/Config.in | 4 +---
 toolchain/Config.in       | 6 ------
 3 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/package/libgeos/Config.in b/package/libgeos/Config.in
index 5e861ab010..8411627d43 100644
--- a/package/libgeos/Config.in
+++ b/package/libgeos/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_LIBGEOS
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_21464
 	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
 	help
 	  GEOS (Geometry Engine - Open Source) is a C++ port of the
@@ -14,8 +13,7 @@ config BR2_PACKAGE_LIBGEOS
 
 	  https://trac.osgeo.org/geos
 
-comment "libgeos needs a toolchain w/ C++, wchar, threads not binutils bug 21464, 27597"
+comment "libgeos needs a toolchain w/ C++, wchar, threads not binutils bug 27597"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		   !BR2_TOOLCHAIN_HAS_THREADS || \
-		   BR2_TOOLCHAIN_HAS_BINUTILS_BUG_21464 || \
 		   BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
diff --git a/package/postgis/Config.in b/package/postgis/Config.in
index f4d913ece7..405c5c723a 100644
--- a/package/postgis/Config.in
+++ b/package/postgis/Config.in
@@ -5,7 +5,6 @@ config BR2_PACKAGE_POSTGIS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11, proj
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libgeos, proj
 	depends on BR2_USE_WCHAR # libgeos, proj
-	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_21464 # libgeos
 	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597 # libgeos
 	select BR2_PACKAGE_LIBGEOS
 	select BR2_PACKAGE_PROJ
@@ -19,8 +18,7 @@ config BR2_PACKAGE_POSTGIS
 
 	  https://postgis.net/
 
-comment "postgis needs a toolchain w/ C++, threads, wchar, gcc >= 4.7, not binutils bug 21464, 27597"
+comment "postgis needs a toolchain w/ C++, threads, wchar, gcc >= 4.7, not binutils bug 27597"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 || \
 		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \
-		BR2_TOOLCHAIN_HAS_BINUTILS_BUG_21464 || \
 		BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
diff --git a/toolchain/Config.in b/toolchain/Config.in
index 140d07ca38..fd005f4740 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -71,12 +71,6 @@ source "package/gdb/Config.in.host"
 
 comment "Toolchain Generic Options"
 
-# https://sourceware.org/bugzilla/show_bug.cgi?id=21464
-# Affect toolchains built with binutils 2.31.1, still not fixed.
-config BR2_TOOLCHAIN_HAS_BINUTILS_BUG_21464
-	bool
-	default y if BR2_or1k
-
 # https://sourceware.org/bugzilla/show_bug.cgi?id=27597
 # Affect toolchains built with binutils 2.36.1, still not fixed.
 config BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
