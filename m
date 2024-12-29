Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E9F8C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:47:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ABEA44FD02;
	Fri, 28 Feb 2025 16:47:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iCqoSB_dnFQg; Fri, 28 Feb 2025 16:47:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 82F724FCF9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 82F724FCF9;
	Fri, 28 Feb 2025 16:47:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1763E68
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:34:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1121F41A25
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TyFFZNYUdnYy for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 31A2A42474
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 31A2A42474
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2533A84C4E; Fri, 28 Feb 2025 16:29:52 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 29 Dec 2024 19:24:43 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d56765a3ffa3d4649b07c7db2ba47bc3e1ba5cab
X-Git-Newrev: 5d6f3baf0e01be13e0d46475f462b30bd7b002dd
X-Patchwork-Hint: ignore
Message-Id: <20250228162952.2533A84C4E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/qt5/qt5base: drop
 directfb graphics backend
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

commit: https://git.buildroot.net/buildroot/commit/?id=5d6f3baf0e01be13e0d46475f462b30bd7b002dd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

As we're about to remove the DirectFB package, let's drop the DirectFB
graphics backend in Qt5.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 Config.in.legacy               | 7 +++++++
 package/qt5/qt5base/Config.in  | 8 --------
 package/qt5/qt5base/qt5base.mk | 5 ++---
 3 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 124bb1ae44..76d656846e 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2025.02"
 
+config BR2_PACKAGE_QT5BASE_DIRECTFB
+	bool "qt5base directfb support removed"
+	select BR2_LEGACY
+	help
+	  The directfb support from qt5base is no longer available, as
+	  directfb is no longer packaged in Buildroot.
+
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DIRECTFB
 	bool "gstreamer directfb plugin removed"
 	select BR2_LEGACY
diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
index 16a17dfc27..c45b8c1591 100644
--- a/package/qt5/qt5base/Config.in
+++ b/package/qt5/qt5base/Config.in
@@ -128,7 +128,6 @@ config BR2_PACKAGE_QT5BASE_GUI
 	# At least one graphic backend must be enabled, so enable
 	# linuxfb if nothing is enabled.
 	select BR2_PACKAGE_QT5BASE_LINUXFB if \
-	       !BR2_PACKAGE_QT5BASE_DIRECTFB && \
 	       !BR2_PACKAGE_QT5BASE_XCB && \
 	       !BR2_PACKAGE_QT5BASE_EGLFS
 	help
@@ -195,13 +194,6 @@ config BR2_PACKAGE_QT5BASE_VULKAN
 config BR2_PACKAGE_QT5BASE_LINUXFB
 	bool "linuxfb support"
 
-config BR2_PACKAGE_QT5BASE_DIRECTFB
-	bool "directfb support"
-	depends on BR2_PACKAGE_DIRECTFB
-
-comment "directfb backend available if directfb is enabled"
-	depends on !BR2_PACKAGE_DIRECTFB
-
 config BR2_PACKAGE_QT5BASE_XCB
 	bool "X.org XCB support"
 	depends on BR2_PACKAGE_XORG7
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 3fd5d30251..add460c257 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -40,7 +40,8 @@ QT5BASE_CONFIGURE_OPTS += \
 	-system-pcre \
 	-no-pch \
 	-shared \
-	-no-feature-relocatable
+	-no-feature-relocatable \
+	-no-directfb
 
 # starting from version 5.9.0, -optimize-debug is enabled by default
 # for debug builds and it overrides -O* with -Og which is not what we
@@ -173,8 +174,6 @@ QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_WIDGETS),-widgets,-no-widge
 # We have to use --enable-linuxfb, otherwise Qt thinks that -linuxfb
 # is to add a link against the "inuxfb" library.
 QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_LINUXFB),--enable-linuxfb,-no-linuxfb)
-QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_DIRECTFB),-directfb,-no-directfb)
-QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_QT5BASE_DIRECTFB),directfb)
 
 ifeq ($(BR2_PACKAGE_LIBXKBCOMMON),y)
 QT5BASE_CONFIGURE_OPTS += -xkbcommon
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
