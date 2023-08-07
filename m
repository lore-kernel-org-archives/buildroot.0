Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08707C001DE
	for <buildroot@archiver.kernel.org>; Mon,  7 Aug 2023 21:35:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8FA44408FB;
	Mon,  7 Aug 2023 21:35:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8FA44408FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uJibsOKfAg-j; Mon,  7 Aug 2023 21:35:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D82E408F7;
	Mon,  7 Aug 2023 21:35:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D82E408F7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3180E1BF23C
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 21:34:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 17182408E9
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 21:34:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17182408E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ru0UO_YgOIbH for <buildroot@lists.busybox.net>;
 Mon,  7 Aug 2023 21:34:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CA341408EB
 for <buildroot@buildroot.org>; Mon,  7 Aug 2023 21:34:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA341408EB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B77908477B; Mon,  7 Aug 2023 21:34:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 7 Aug 2023 23:34:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 365f22960d9f024c7566290b133b65ed8ad21739
X-Git-Newrev: 02a199105d88b295cac5bbce3d48f896e5605300
X-Patchwork-Hint: ignore
Message-Id: <20230807213447.B77908477B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libheif: let's use
 BR2_TOOLCHAIN_HAS_BINUTILS_BUG_30730
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=02a199105d88b295cac5bbce3d48f896e5605300
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Let's use binutils bug define instead of architecture checking in packages.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kodi-imagedecoder-heif/Config.in | 4 ++--
 package/libheif/Config.in                | 6 ++----
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/package/kodi-imagedecoder-heif/Config.in b/package/kodi-imagedecoder-heif/Config.in
index 7cf2d1ef6e..d0950385a0 100644
--- a/package/kodi-imagedecoder-heif/Config.in
+++ b/package/kodi-imagedecoder-heif/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_KODI_IMAGEDECODER_HEIF
 	bool "kodi-imagedecoder-heif"
 	depends on BR2_INSTALL_LIBSTDCPP # libde265, libheif, tinyxml2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libde265
-	depends on !BR2_m68k_cf # libheif
+	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_30730 # libheif
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # libheif
 	select BR2_PACKAGE_LIBDE265
 	select BR2_PACKAGE_LIBHEIF
@@ -13,6 +13,6 @@ config BR2_PACKAGE_KODI_IMAGEDECODER_HEIF
 	  https://github.com/xbmc/imagedecoder.heif
 
 comment "kodi-imagedecoder-heif needs a toolchain w/ C++, threads, gcc >= 4.8"
-	depends on !BR2_m68k_cf # libheif
+	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_30730 # libheif
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
diff --git a/package/libheif/Config.in b/package/libheif/Config.in
index d0ea72430e..1452cf2718 100644
--- a/package/libheif/Config.in
+++ b/package/libheif/Config.in
@@ -1,8 +1,6 @@
 config BR2_PACKAGE_LIBHEIF
 	bool "libheif"
-	# avoid build error
-	# Internal error in emit_expr_encoded at dw2gencfi.c:215
-	depends on !BR2_m68k_cf
+	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_30730
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	help
@@ -11,5 +9,5 @@ config BR2_PACKAGE_LIBHEIF
 	  https://github.com/strukturag/libheif
 
 comment "libheif needs a toolchain w/ C++, gcc >= 4.8"
-	depends on !BR2_m68k_cf
+	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_30730
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
