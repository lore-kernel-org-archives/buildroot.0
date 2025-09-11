Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E103ACAC594
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 20:22:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AAEEF419EB;
	Thu, 11 Sep 2025 20:22:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aH8VnhxuVzCz; Thu, 11 Sep 2025 20:22:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BAA2F418B9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BAA2F418B9;
	Thu, 11 Sep 2025 20:22:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id DF1D5234
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 20:22:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9617F6F5B2
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 20:22:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cd9CfWdwd5WO for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 20:22:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF1896E5F7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CF1896E5F7
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 20:22:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C9F618442D; Thu, 11 Sep 2025 20:22:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Sep 2025 22:18:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fbc812a35bce8cf21f942a8e08f245ce4bb56528
X-Git-Newrev: 565344aba2114ab7ae84c705342577760f039b5a
X-Patchwork-Hint: ignore
Message-Id: <20250911202207.C9F618442D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/opencv4: drop optional dependency
 on libgtk2
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

commit: https://git.buildroot.net/buildroot/commit/?id=565344aba2114ab7ae84c705342577760f039b5a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As we're about to remove libgtk2, we need to drop libgtk2 support
from opencv4. gtk3 support remains in place.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: Woodrow Douglass <wdouglass@carnegierobotics.com>
[Arnout: add legacy handling]
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 Config.in.legacy           |  7 +++++++
 package/opencv4/Config.in  |  9 ---------
 package/opencv4/opencv4.mk | 14 ++++----------
 3 files changed, 11 insertions(+), 19 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 691e36ccd0..93fca81436 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2025.11"
 
+config BR2_PACKAGE_OPENCV4_WITH_GTK
+	bool "opencv4 gtk support has been removed"
+	select BR2_LEGACY
+	help
+	  Due to the removal of libgtk2, the gtk support of opencv4
+	  has been removed. gtk3 support is still available.
+
 config BR2_PACKAGE_OPENCV3_WITH_GTK
 	bool "opencv3 gtk support has been removed"
 	select BR2_LEGACY
diff --git a/package/opencv4/Config.in b/package/opencv4/Config.in
index f71ceba2c5..a553411e1a 100644
--- a/package/opencv4/Config.in
+++ b/package/opencv4/Config.in
@@ -81,15 +81,6 @@ choice
 config BR2_PACKAGE_OPENCV4_GUI_NONE
 	bool "none"
 
-config BR2_PACKAGE_OPENCV4_WITH_GTK
-	bool "gtk2"
-	depends on BR2_PACKAGE_LIBGTK2
-
-comment "gtk2 support needs libgtk2"
-	depends on BR2_USE_MMU # libgtk2 -> glib2
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on !BR2_PACKAGE_LIBGTK2
-
 config BR2_PACKAGE_OPENCV4_WITH_GTK3
 	bool "gtk3"
 	depends on BR2_PACKAGE_LIBGTK3
diff --git a/package/opencv4/opencv4.mk b/package/opencv4/opencv4.mk
index 01f70dfe49..d3df1a39f7 100644
--- a/package/opencv4/opencv4.mk
+++ b/package/opencv4/opencv4.mk
@@ -211,6 +211,7 @@ OPENCV4_CONF_OPTS += \
 	-DWITH_GDAL=OFF \
 	-DWITH_GPHOTO2=OFF \
 	-DWITH_GSTREAMER_0_10=OFF \
+	-DWITH_GTK_2_X=OFF \
 	-DWITH_LAPACK=OFF \
 	-DWITH_MATLAB=OFF \
 	-DWITH_OPENCL=OFF \
@@ -316,18 +317,11 @@ else
 OPENCV4_CONF_OPTS += -DWITH_GSTREAMER=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_OPENCV4_WITH_GTK)$(BR2_PACKAGE_OPENCV4_WITH_GTK3),)
-OPENCV4_CONF_OPTS += -DWITH_GTK=OFF -DWITH_GTK_2_X=OFF
-endif
-
-ifeq ($(BR2_PACKAGE_OPENCV4_WITH_GTK),y)
-OPENCV4_CONF_OPTS += -DWITH_GTK=ON -DWITH_GTK_2_X=ON
-OPENCV4_DEPENDENCIES += libgtk2
-endif
-
 ifeq ($(BR2_PACKAGE_OPENCV4_WITH_GTK3),y)
-OPENCV4_CONF_OPTS += -DWITH_GTK=ON -DWITH_GTK_2_X=OFF
+OPENCV4_CONF_OPTS += -DWITH_GTK=ON
 OPENCV4_DEPENDENCIES += libgtk3
+else
+OPENCV4_CONF_OPTS += -DWITH_GTK=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_OPENCV4_WITH_JPEG),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
