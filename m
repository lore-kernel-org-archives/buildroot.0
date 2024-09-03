Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58195CD37B5
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 22:50:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1CBDE80B2B;
	Tue,  3 Sep 2024 22:50:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PvU4fGDf3GGT; Tue,  3 Sep 2024 22:50:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2747280C28
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2747280C28;
	Tue,  3 Sep 2024 22:50:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BBE741BF576
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 22:50:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B67BE4047D
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 22:50:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rip14WJZ1gfE for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 22:50:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 949434010F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 949434010F
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 22:50:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8646686D89; Tue,  3 Sep 2024 22:50:16 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 4 Sep 2024 00:49:17 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: ec9a66d1bc8e6225d2a88a9d06081d3f1e95abf9
X-Git-Newrev: 713d63b613c67974c6b14a84bab77ea570893aa2
X-Patchwork-Hint: ignore
Message-Id: <20240903225016.8646686D89@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/webkitgtk: add option
 to enable MiniBrowser
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

commit: https://git.buildroot.net/buildroot/commit/?id=713d63b613c67974c6b14a84bab77ea570893aa2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add an option to enable building and installing the MiniBrowser program
included in the WebKitGTK source tree. This may be handy now that Midori
will no longer be packaged in Builroot. A post-install hook installs a
symbolic link to it into /usr/bin for convenience.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/webkitgtk/Config.in    |  5 +++++
 package/webkitgtk/webkitgtk.mk | 10 ++++++++++
 2 files changed, 15 insertions(+)

diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
index 8ee90dda1c..e6ab405cd5 100644
--- a/package/webkitgtk/Config.in
+++ b/package/webkitgtk/Config.in
@@ -139,4 +139,9 @@ config BR2_PACKAGE_WEBKITGTK_WEBDRIVER
 	  Enable support for WebDriver. This will build and install the
 	  WebKitWebDriver program in the target.
 
+config BR2_PACKAGE_WEBKITGTK_MINIBROWSER
+	bool "MiniBrowser"
+	help
+	  Example browser application included with WebKitGTK.
+
 endif
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 468fefab0e..19740b3b4e 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -61,6 +61,16 @@ else
 WEBKITGTK_CONF_OPTS += -DENABLE_WEBDRIVER=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_WEBKITGTK_MINIBROWSER),y)
+define WEBKITGTK_INSTALL_MINIBROWSER_SYMLINK
+	ln -sf ../libexec/webkit2gtk-4.1/MiniBrowser $(TARGET_DIR)/usr/bin/MiniBrowser
+endef
+WEBKITGTK_POST_INSTALL_TARGET_HOOKS += WEBKITGTK_INSTALL_MINIBROWSER_SYMLINK
+WEBKITGTK_CONF_OPTS += -DENABLE_MINIBROWSER=ON
+else
+WEBKITGTK_CONF_OPTS += -DENABLE_MINIBROWSER=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_LCMS2),y)
 WEBKITGTK_CONF_OPTS += -DUSE_LCMS=ON
 WEBKITGTK_DEPENDENCIES += lcms2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
