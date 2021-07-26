Return-Path: <SRS0=wdlY=MS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C33E0C432BE
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 21:53:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 888D860F37
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 21:53:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 888D860F37
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B7ED837AD;
	Mon, 26 Jul 2021 21:53:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fdVLHfD12rNt; Mon, 26 Jul 2021 21:53:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B82558379C;
	Mon, 26 Jul 2021 21:53:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D61241BF2F1
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 21:53:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C60044033B
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 21:53:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZQU9Iryau0pc for <buildroot@lists.busybox.net>;
 Mon, 26 Jul 2021 21:53:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B28E2400F0
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 21:53:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id D06D88903F; Mon, 26 Jul 2021 21:19:02 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 26 Jul 2021 23:53:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d625a1e21412f1a788bff548c94abcdf7ec25442
X-Git-Newrev: 06879a25e287a4b4cdc0e721a62d3bfb182933b5
X-Patchwork-Hint: ignore
Message-Id: <20210726211902.D06D88903F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] toolchain: remove binutils bug 21464
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=06879a25e287a4b4cdc0e721a62d3bfb182933b5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This bug has been fixed upstream and backported to buildroot binutils
package. So let's remove it from toolchain/Config.in and from packages
that are affected by it:
- libgeos
- postgis
- protobuf

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libgeos/Config.in  | 4 +---
 package/postgis/Config.in  | 4 +---
 package/protobuf/Config.in | 1 -
 toolchain/Config.in        | 6 ------
 4 files changed, 2 insertions(+), 13 deletions(-)

diff --git a/package/libgeos/Config.in b/package/libgeos/Config.in
index 86a1cddcf3..124e2da661 100644
--- a/package/libgeos/Config.in
+++ b/package/libgeos/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_LIBGEOS
 	bool "libgeos"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
-	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_21464
 	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
 	help
 	  GEOS (Geometry Engine - Open Source) is a C++ port of the
@@ -13,7 +12,6 @@ config BR2_PACKAGE_LIBGEOS
 
 	  https://trac.osgeo.org/geos
 
-comment "libgeos needs a toolchain w/ C++, wchar, not binutils bug 21464, 27597"
+comment "libgeos needs a toolchain w/ C++, wchar, not binutils bug 27597"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
-		   BR2_TOOLCHAIN_HAS_BINUTILS_BUG_21464 || \
 		   BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
diff --git a/package/postgis/Config.in b/package/postgis/Config.in
index 04705f7e16..78c52ea7b2 100644
--- a/package/postgis/Config.in
+++ b/package/postgis/Config.in
@@ -6,7 +6,6 @@ config BR2_PACKAGE_POSTGIS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11, proj
 	depends on BR2_TOOLCHAIN_HAS_THREADS # proj
 	depends on BR2_USE_WCHAR # libgeos, proj
-	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_21464 # libgeos
 	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597 # libgeos
 	select BR2_PACKAGE_LIBGEOS
 	select BR2_PACKAGE_PROJ
@@ -20,9 +19,8 @@ config BR2_PACKAGE_POSTGIS
 
 	  https://postgis.net/
 
-comment "postgis needs a toolchain w/ C++, threads, wchar, gcc >= 4.7, not binutils bug 21464, 27597"
+comment "postgis needs a toolchain w/ C++, threads, wchar, gcc >= 4.7, not binutils bug 27597"
 	depends on !BR2_microblazeel && !BR2_microblazebe # ICE
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 || \
 		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \
-		BR2_TOOLCHAIN_HAS_BINUTILS_BUG_21464 || \
 		BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
diff --git a/package/protobuf/Config.in b/package/protobuf/Config.in
index 30050950aa..46c820b9cf 100644
--- a/package/protobuf/Config.in
+++ b/package/protobuf/Config.in
@@ -24,7 +24,6 @@ config BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
 	default y if BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on BR2_USE_MMU # fork()
-	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_21464
 
 config BR2_PACKAGE_PROTOBUF
 	bool "protobuf"
diff --git a/toolchain/Config.in b/toolchain/Config.in
index 03375e0c52..255832edc9 100644
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
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
