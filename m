Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AEE0CAC58E
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 21:14:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5DA5442681;
	Thu, 11 Sep 2025 21:14:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 80njA9CxJxyo; Thu, 11 Sep 2025 21:14:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 80B8042671
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 80B8042671;
	Thu, 11 Sep 2025 21:14:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 146B492E
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 21:14:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0600B82213
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 21:14:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sXO9QNwrx1Fw for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 21:14:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 56EE482205
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 56EE482205
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 21:14:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 44C1F842FC; Thu, 11 Sep 2025 21:14:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Sep 2025 22:34:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 02369c8bbb6f3d1588ac2cab10710c975d46bd43
X-Git-Newrev: 5b6b80bfc5237ab4f4e35c081fdac1376efdd396
X-Patchwork-Hint: ignore
Message-Id: <20250911211447.44C1F842FC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/yad: drop support for gtk2
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

commit: https://git.buildroot.net/buildroot/commit/?id=5b6b80bfc5237ab4f4e35c081fdac1376efdd396
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As we're about to remove libgtk2, we need to first drop support for
gtk2 in yad. It continues to support gtk3.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[Arnout: simply .mk file: BR2_PACKAGE_LIBGTK3_X11 is always true]
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/yad/Config.in |  8 +++-----
 package/yad/yad.mk    | 12 ++----------
 2 files changed, 5 insertions(+), 15 deletions(-)

diff --git a/package/yad/Config.in b/package/yad/Config.in
index 300525ee3c..4a140f63d7 100644
--- a/package/yad/Config.in
+++ b/package/yad/Config.in
@@ -1,13 +1,11 @@
 config BR2_PACKAGE_YAD
 	bool "yad"
-	depends on BR2_PACKAGE_XORG7
-	depends on BR2_PACKAGE_LIBGTK2 || BR2_PACKAGE_LIBGTK3_X11
+	depends on BR2_PACKAGE_LIBGTK3_X11
 	help
 	  YAD (yet another dialog) is a tool for create graphical
 	  dialogs from shell scripts.
 
 	  http://sourceforge.net/projects/yad-dialog/
 
-comment "yad needs libgtk2 or libgtk3 w/ X11 backend"
-	depends on BR2_PACKAGE_XORG7
-	depends on !BR2_PACKAGE_LIBGTK2 && !BR2_PACKAGE_LIBGTK3_X11
+comment "yad needs libgtk3 w/ X11 backend"
+	depends on !BR2_PACKAGE_LIBGTK3_X11
diff --git a/package/yad/yad.mk b/package/yad/yad.mk
index 15788efac0..b40220f9ad 100644
--- a/package/yad/yad.mk
+++ b/package/yad/yad.mk
@@ -9,16 +9,8 @@ YAD_SOURCE = yad-$(YAD_VERSION).tar.xz
 YAD_SITE = http://sourceforge.net/projects/yad-dialog/files
 YAD_LICENSE = GPL-3.0
 YAD_LICENSE_FILES = COPYING
-YAD_DEPENDENCIES = host-intltool host-pkgconf $(TARGET_NLS_DEPENDENCIES)
+YAD_DEPENDENCIES = host-intltool host-pkgconf libgtk3 $(TARGET_NLS_DEPENDENCIES)
 YAD_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
-YAD_CONF_OPTS = --enable-html=no
-
-ifeq ($(BR2_PACKAGE_LIBGTK3_X11),y)
-YAD_DEPENDENCIES += libgtk3
-YAD_CONF_OPTS += --with-gtk=gtk3
-else
-YAD_DEPENDENCIES += libgtk2
-YAD_CONF_OPTS += --with-gtk=gtk2
-endif
+YAD_CONF_OPTS = --enable-html=no --with-gtk=gtk3
 
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
