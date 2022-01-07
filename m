Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 208F3C433EF
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 18:16:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 830FB404BF;
	Fri,  7 Jan 2022 18:16:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iLsh9GVDyK0l; Fri,  7 Jan 2022 18:16:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7DF5C400E5;
	Fri,  7 Jan 2022 18:16:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 065371C115D
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 18:15:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E7A57400E5
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 18:15:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v6Tc84ypwl7O for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 18:15:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C1BD940002
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 18:15:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 4685783493; Fri,  7 Jan 2022 18:09:39 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Fri, 7 Jan 2022 19:15:43 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3a1f18a85784da3e4243b1c54a18fa88f02a8a00
X-Git-Newrev: 55fcba2a7c41d29f3f93bb37eec1264af4b45fb0
X-Patchwork-Hint: ignore
Message-Id: <20220107180939.4685783493@busybox.osuosl.org>
Subject: [Buildroot] [git commit] toolchain: remove binutils bug 21464
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=55fcba2a7c41d29f3f93bb37eec1264af4b45fb0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Binutils bug 21464 is not present anymore in Buildroot so let's remove it
and its depends on in libgeos and postgis packages.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
