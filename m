Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88C3DCAC58E
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 20:22:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A78B6E5F7;
	Thu, 11 Sep 2025 20:22:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FEiXTN_EzUWw; Thu, 11 Sep 2025 20:22:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D01E6F5B2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D01E6F5B2;
	Thu, 11 Sep 2025 20:22:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BCFBA234
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 20:22:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AD3B784C53
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 20:22:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f573khehLKib for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 20:22:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9B7284C58
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D9B7284C58
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 20:22:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D539A84440; Thu, 11 Sep 2025 20:22:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Sep 2025 22:20:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 565344aba2114ab7ae84c705342577760f039b5a
X-Git-Newrev: 0fd437511ea0ddb38765fe21de960988bc87cf3b
X-Patchwork-Hint: ignore
Message-Id: <20250911202207.D539A84440@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pinentry: remove gtk2 backend
 support
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0fd437511ea0ddb38765fe21de960988bc87cf3b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As we're about to remove libgtk2, we need to first remove support for
the gtk2 backend of pinentry, which this patch does.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 Config.in.legacy             |  7 +++++++
 package/pinentry/Config.in   | 22 ----------------------
 package/pinentry/pinentry.mk | 12 +++---------
 3 files changed, 10 insertions(+), 31 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 93fca81436..a177ad30f7 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2025.11"
 
+config BR2_PACKAGE_PINENTRY_GTK2
+	bool "gtk2 backend of pinentry has been removed"
+	select BR2_LEGACY
+	help
+	  Due to the removal of libgtk2, the gtk2 backend of pinentry
+	  has been removed.
+
 config BR2_PACKAGE_OPENCV4_WITH_GTK
 	bool "opencv4 gtk support has been removed"
 	select BR2_LEGACY
diff --git a/package/pinentry/Config.in b/package/pinentry/Config.in
index bd5e3af5a1..dc8c9724d7 100644
--- a/package/pinentry/Config.in
+++ b/package/pinentry/Config.in
@@ -6,7 +6,6 @@ menuconfig BR2_PACKAGE_PINENTRY
 	select BR2_PACKAGE_LIBGPG_ERROR
 	# At least one backend is needed to avoid build breakage
 	select BR2_PACKAGE_PINENTRY_NCURSES if \
-		!BR2_PACKAGE_PINENTRY_GTK2 && \
 		!BR2_PACKAGE_PINENTRY_QT5
 	help
 	  A collection of simple PIN or pass-phrase entry dialogs
@@ -46,27 +45,6 @@ config BR2_PACKAGE_PINENTRY_NCURSES
 	help
 	  The pinentry-ncurses tool
 
-config BR2_PACKAGE_PINENTRY_GTK2
-	bool "pinentry-gtk2"
-	depends on BR2_PACKAGE_XORG7
-	depends on BR2_USE_WCHAR
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_USE_MMU
-	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libgtk2 -> pango -> harfbuzz
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libgtk2 -> pango -> harfbuzz
-	select BR2_PACKAGE_LIBGTK2
-	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
-	help
-	  The pinentry-gtk2 tool
-
-comment "pinentry-gtk2 needs X and a toolchain w/ wchar, threads, C++, gcc >= 4.9"
-	depends on BR2_USE_MMU
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on !BR2_PACKAGE_XORG7 || !BR2_USE_WCHAR || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
-		!BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
-
 config BR2_PACKAGE_PINENTRY_QT5
 	bool "pinentry-qt5"
 	depends on BR2_INSTALL_LIBSTDCPP
diff --git a/package/pinentry/pinentry.mk b/package/pinentry/pinentry.mk
index 7482a93d02..ef17df7657 100644
--- a/package/pinentry/pinentry.mk
+++ b/package/pinentry/pinentry.mk
@@ -13,10 +13,12 @@ PINENTRY_DEPENDENCIES = \
 	libassuan libgpg-error \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv) \
 	host-pkgconf
+# --disable-libcap to avoid PAM dependency
 PINENTRY_CONF_OPTS += \
 	--with-libassuan-prefix=$(STAGING_DIR)/usr \
 	--with-libgpg-error-prefix=$(STAGING_DIR)/usr \
-	--without-libcap       # requires PAM
+	--without-libcap \
+	--disable-pinentry-gtk2
 
 # Force the path to "gpgrt-config" (from the libgpg-error package) to
 # avoid using the one on host, if present.
@@ -58,14 +60,6 @@ else
 PINENTRY_CONF_OPTS += --disable-ncurses
 endif
 
-# pinentry-gtk2 backend
-ifeq ($(BR2_PACKAGE_PINENTRY_GTK2),y)
-PINENTRY_CONF_OPTS += --enable-pinentry-gtk2
-PINENTRY_DEPENDENCIES += libgtk2
-else
-PINENTRY_CONF_OPTS += --disable-pinentry-gtk2
-endif
-
 # pinentry-qt5 backend
 ifeq ($(BR2_PACKAGE_PINENTRY_QT5),y)
 PINENTRY_CONF_OPTS += --enable-pinentry-qt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
