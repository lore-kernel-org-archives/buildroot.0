Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89892CAC587
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 19:36:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 52BE66F517;
	Thu, 11 Sep 2025 19:36:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8fKRepBak-oq; Thu, 11 Sep 2025 19:36:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 573436E4CB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 573436E4CB;
	Thu, 11 Sep 2025 19:36:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D8122735
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:36:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 13B8B41F32
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:36:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6Iii31LyJpYL for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 19:36:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5A77A404C2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5A77A404C2
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:36:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 49878842FC; Thu, 11 Sep 2025 19:36:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Sep 2025 21:28:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7e5c50584a29cfc5a5dc2b3e1fd2a5a6c5844843
X-Git-Newrev: 52eed57d80a2c96579d785414b3b7e4055f7a6bd
X-Patchwork-Hint: ignore
Message-Id: <20250911193626.49878842FC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cwiid: remove wmgui support,
 needs libgtk2
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

commit: https://git.buildroot.net/buildroot/commit/?id=52eed57d80a2c96579d785414b3b7e4055f7a6bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As we're about to remove libgtk2, let's drop the wmgui support from
cwiid, which is libgtk2 only.

Note that cwiid hasn't seen a commit in the past 16 years, so there's
no real hope to see wmgui fixed to have support for a more recent Gtk
version. And perhaps this separately calls for removing cwiid
entirely from Buildroot.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 Config.in.legacy        |  7 +++++++
 package/cwiid/Config.in | 14 --------------
 package/cwiid/cwiid.mk  |  9 +--------
 3 files changed, 8 insertions(+), 22 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 895e42fc30..b150e40206 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2025.11"
 
+config BR2_PACKAGE_CWIID_WMGUI
+	bool "cwiid wmgui has been removed"
+	select BR2_LEGACY
+	help
+	  The wmgui part of cwiid required libgtk2, which has been
+	  removed from Buildroot.
+
 config BR2_LINUX_KERNEL_EXT_AUFS
 	bool "Aufs Filesystem Module patch has been removed"
 	select BR2_LEGACY
diff --git a/package/cwiid/Config.in b/package/cwiid/Config.in
index 44148eb188..0c1a97402a 100644
--- a/package/cwiid/Config.in
+++ b/package/cwiid/Config.in
@@ -14,20 +14,6 @@ config BR2_PACKAGE_CWIID
 
 	  https://github.com/abstrakraft/cwiid
 
-if BR2_PACKAGE_CWIID
-config BR2_PACKAGE_CWIID_WMGUI
-	bool "wmgui"
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libgtk2 -> pango -> harfbuzz
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libgtk2 -> pango -> harfbuzz
-	depends on BR2_PACKAGE_XORG7 # libgtk2
-	depends on BR2_USE_WCHAR # libgtk2 -> libglib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libgtk2 -> libglib2
-	depends on BR2_USE_MMU # libgtk2 -> libglib2
-	depends on BR2_INSTALL_LIBSTDCPP # libgtk2 -> pango
-	select BR2_PACKAGE_LIBGLIB2
-	select BR2_PACKAGE_LIBGTK2
-endif
-
 comment "cwiid needs a toolchain w/ dynamic lib, threads, wchar, headers >= 3.18"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR || \
diff --git a/package/cwiid/cwiid.mk b/package/cwiid/cwiid.mk
index a11c56c0aa..e552da3b46 100644
--- a/package/cwiid/cwiid.mk
+++ b/package/cwiid/cwiid.mk
@@ -17,13 +17,6 @@ CWIID_DEPENDENCIES = host-pkgconf host-bison host-flex bluez5_utils
 # Disable python support. This disables the 2 following things:
 #   - wminput Python plugin support
 #   - cwiid Python module
-CWIID_CONF_OPTS = --without-python --disable-ldconfig
-
-ifeq ($(BR2_PACKAGE_CWIID_WMGUI),y)
-CWIID_DEPENDENCIES += libgtk2 libglib2
-CWIID_CONF_OPTS += --enable-wmgui
-else
-CWIID_CONF_OPTS += --disable-wmgui
-endif
+CWIID_CONF_OPTS = --without-python --disable-ldconfig --disable-wmgui
 
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
