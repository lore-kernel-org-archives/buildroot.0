Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A59AC021A9
	for <buildroot@archiver.kernel.org>; Mon, 17 Feb 2025 20:31:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46AF660E74;
	Mon, 17 Feb 2025 20:31:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hfzUCPL3dRdz; Mon, 17 Feb 2025 20:31:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E80D60886
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E80D60886;
	Mon, 17 Feb 2025 20:31:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C6D0DE
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 20:31:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1AEBF40729
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 20:31:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cn2aB_tULCol for <buildroot@buildroot.org>;
 Mon, 17 Feb 2025 20:31:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0092C408E2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0092C408E2
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 20:31:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DE1AB8771B; Mon, 17 Feb 2025 20:31:07 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 17 Feb 2025 21:28:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0ee5c51d6a615e698c2d58cdca3c335878cf26f9
X-Git-Newrev: ef3d171e50fb6aec9d1477356b07036cadc2409c
X-Patchwork-Hint: ignore
Message-Id: <20250217203107.DE1AB8771B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libosmium: bump version to 2.21.0
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ef3d171e50fb6aec9d1477356b07036cadc2409c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release-notes: https://github.com/osmcode/libosmium/releases/tag/v2.21.0

Bump minimal GCC version to 5. (Switched to C++14 as minimum requirement)
https://github.com/osmcode/libosmium/commit/a83fbf8852b00e57bf30fe3f69c37f575726c7d7

Remove support for projection using the Proj library
https://github.com/osmcode/libosmium/commit/711721cb1f37dff18bcfb2e5fbd7667c7a22bbf0

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libosmium/Config.in      | 6 +++---
 package/libosmium/libosmium.hash | 2 +-
 package/libosmium/libosmium.mk   | 6 +-----
 3 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/package/libosmium/Config.in b/package/libosmium/Config.in
index 825e2b7e33..c2e905cd37 100644
--- a/package/libosmium/Config.in
+++ b/package/libosmium/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_LIBOSMIUM
 	bool "libosmium"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # C++14
 	depends on BR2_TOOLCHAIN_HAS_THREADS # boost
 	depends on BR2_USE_WCHAR # boost
 	select BR2_PACKAGE_BOOST
@@ -13,6 +13,6 @@ config BR2_PACKAGE_LIBOSMIUM
 
 	  https://osmcode.org/libosmium/
 
-comment "libosmium needs a toolchain w/ C++, wchar, threads, gcc >= 4.7"
+comment "libosmium needs a toolchain w/ C++, wchar, threads, gcc >= 5"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 || !BR2_TOOLCHAIN_HAS_THREADS
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_5 || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libosmium/libosmium.hash b/package/libosmium/libosmium.hash
index 37bcdd267c..82657d7fe7 100644
--- a/package/libosmium/libosmium.hash
+++ b/package/libosmium/libosmium.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  3d3e0873c6aaabb3b2ef4283896bebf233334891a7a49f4712af30ca6ed72477  libosmium-2.20.0.tar.gz
+sha256  5a222e555865f742102d2802a7ad7ef91d6e1c8944c097c70a924214e079c858  libosmium-2.21.0.tar.gz
 sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE
diff --git a/package/libosmium/libosmium.mk b/package/libosmium/libosmium.mk
index c39e7d0152..e5392b06e9 100644
--- a/package/libosmium/libosmium.mk
+++ b/package/libosmium/libosmium.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOSMIUM_VERSION = 2.20.0
+LIBOSMIUM_VERSION = 2.21.0
 LIBOSMIUM_SITE = $(call github,osmcode,libosmium,v$(LIBOSMIUM_VERSION))
 LIBOSMIUM_LICENSE = BSL-1.0
 LIBOSMIUM_LICENSE_FILES = LICENSE
@@ -23,10 +23,6 @@ ifeq ($(BR2_PACKAGE_LIBGEOS),y)
 LIBOSMIUM_DEPENDENCIES += libgeos
 endif
 
-ifeq ($(BR2_PACKAGE_PROJ),y)
-LIBOSMIUM_DEPENDENCIES += proj
-endif
-
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 LIBOSMIUM_DEPENDENCIES += zlib
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
