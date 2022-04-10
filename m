Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 543B8C433EF
	for <buildroot@archiver.kernel.org>; Sun, 10 Apr 2022 15:08:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D32782ED2;
	Sun, 10 Apr 2022 15:08:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1N8bCUWpoUcr; Sun, 10 Apr 2022 15:08:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0DA58329D;
	Sun, 10 Apr 2022 15:08:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A02B31BF990
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 15:08:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9D5AD607C9
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 15:08:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tcDk9ZmWGglv for <buildroot@lists.busybox.net>;
 Sun, 10 Apr 2022 15:08:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D1A41607A4
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 15:08:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 0D64E83874; Sun, 10 Apr 2022 14:58:54 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 10 Apr 2022 16:53:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 00a9d2d45f23b4a88bc083fe35bd9209e4c527c4
X-Git-Newrev: d9ac22b7e2565ec678b244701b92009701856583
X-Patchwork-Hint: ignore
Message-Id: <20220410145854.0D64E83874@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/webkitgtk: bump to version 2.36.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=d9ac22b7e2565ec678b244701b92009701856583
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update to a new major release which brings in improvements and a few new
features. Release notes:

  https://webkitgtk.org/2022/03/21/webkitgtk2.36.0-released.html

None of the new features need additional dependencies. The build option
USE_SYSTEMD has been renamed to ENABLE_JOURNALD_LOG, though.

While at it, remove setting the ENABLE_PLUGIN_PROCESS_GTK2 option.
Support for NPAPI plug-ins has been dropped already in 2.32.x and the
option has been a no-op for a long time, see:

  https://perezdecastro.org/2020/webkitgtk-npapi-sunsetting.html
  https://webkitgtk.org/2021/03/26/webkitgtk2.32.0-released.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/webkitgtk/webkitgtk.hash |  8 ++++----
 package/webkitgtk/webkitgtk.mk   | 13 +++----------
 2 files changed, 7 insertions(+), 14 deletions(-)

diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
index 82c210c8f9..38068745ee 100644
--- a/package/webkitgtk/webkitgtk.hash
+++ b/package/webkitgtk/webkitgtk.hash
@@ -1,7 +1,7 @@
-# From https://webkitgtk.org/releases/webkitgtk-2.34.6.tar.xz.sums
-md5  a5eeedd02f5b4bba8bd891b92dc743d4  webkitgtk-2.34.6.tar.xz
-sha1  bb82517289baf9c858fa406d1d845274f81e25cb  webkitgtk-2.34.6.tar.xz
-sha256  6bc8fd034aad0432a2459ce4fc7ee25ad65a4924c618bf8d93b52b0c1a84c1f6  webkitgtk-2.34.6.tar.xz
+# From https://webkitgtk.org/releases/webkitgtk-2.36.0.tar.xz.sums
+md5  1e3fe866ab6e41e7ec3deb80bd5b3a85  webkitgtk-2.36.0.tar.xz
+sha1  5b90bc59c2f442223de1a4d9dc8ff604888abb3c  webkitgtk-2.36.0.tar.xz
+sha256  b877cca1f105235f5dd57c7ac2b2c2be3c6b691ff444f93925c7254cf156c64d  webkitgtk-2.36.0.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 36e4b8943b..8d8f083ea2 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBKITGTK_VERSION = 2.34.6
+WEBKITGTK_VERSION = 2.36.0
 WEBKITGTK_SITE = https://www.webkitgtk.org/releases
 WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
 WEBKITGTK_INSTALL_STAGING = YES
@@ -84,13 +84,6 @@ WEBKITGTK_CONF_OPTS += \
 	-DENABLE_X11_TARGET=ON
 WEBKITGTK_DEPENDENCIES += libgl \
 	xlib_libXcomposite xlib_libXdamage xlib_libXrender xlib_libXt
-# It can use libgtk2 for npapi plugins
-ifeq ($(BR2_PACKAGE_LIBGTK2),y)
-WEBKITGTK_CONF_OPTS += -DENABLE_PLUGIN_PROCESS_GTK2=ON
-WEBKITGTK_DEPENDENCIES += libgtk2
-else
-WEBKITGTK_CONF_OPTS += -DENABLE_PLUGIN_PROCESS_GTK2=OFF
-endif
 else # !X11
 # GTK3-BROADWAY/WAYLAND needs at least EGL
 WEBKITGTK_DEPENDENCIES += libegl
@@ -115,10 +108,10 @@ WEBKITGTK_CONF_OPTS += -DUSE_GSTREAMER_GL=OFF
 endif
 
 ifeq ($(BR2_INIT_SYSTEMD),y)
-WEBKITGTK_CONF_OPTS += -DUSE_SYSTEMD=ON
+WEBKITGTK_CONF_OPTS += -DENABLE_JOURNALD_LOG=ON
 WEBKITGTK_DEPENDENCIES += systemd
 else
-WEBKITGTK_CONF_OPTS += -DUSE_SYSTEMD=OFF
+WEBKITGTK_CONF_OPTS += -DENABLE_JOURNALD_LOG=OFF
 endif
 
 # JIT is not supported for MIPS r6, but the WebKit build system does not
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
