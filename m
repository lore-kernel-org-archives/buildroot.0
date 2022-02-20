Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E28FC433EF
	for <buildroot@archiver.kernel.org>; Sun, 20 Feb 2022 20:52:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B2AB9400C8;
	Sun, 20 Feb 2022 20:52:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id arlAPwlia2z1; Sun, 20 Feb 2022 20:52:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 780D6404C5;
	Sun, 20 Feb 2022 20:52:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 23BC91BF4E6
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 20:52:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 12CFC4037A
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 20:52:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l9eN_bQXldCo for <buildroot@lists.busybox.net>;
 Sun, 20 Feb 2022 20:52:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2CDB240356
 for <buildroot@buildroot.org>; Sun, 20 Feb 2022 20:52:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 67ABF83483; Sun, 20 Feb 2022 20:44:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 20 Feb 2022 21:52:27 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 75361a9aba042799040591fb84192802b137fc3a
X-Git-Newrev: 057e89c9c596cb876379757cb530fdb8a8d42bf3
X-Patchwork-Hint: ignore
Message-Id: <20220220204447.67ABF83483@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/webkitgtk: security bump to 2.34.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=057e89c9c596cb876379757cb530fdb8a8d42bf3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update to a new major release which brings in improvements, a number of
new features, and security fixes. Release notes:

  https://webkitgtk.org/2021/09/22/webkitgtk2.34.0-released.html
  https://webkitgtk.org/2021/10/21/webkitgtk2.34.1-released.html
  https://webkitgtk.org/2021/11/24/webkitgtk2.34.2-released.html
  https://webkitgtk.org/2021/12/20/webkitgtk2.34.3-released.html
  https://webkitgtk.org/2022/01/21/webkitgtk2.34.4-released.html
  https://webkitgtk.org/2022/02/09/webkitgtk2.34.5-released.html
  https://webkitgtk.org/2022/02/17/webkitgtk2.34.6-released.html

Security advisories:

  https://webkitgtk.org/security/WSA-2021-0007.html
  https://webkitgtk.org/security/WSA-2022-0001.html
  https://webkitgtk.org/security/WSA-2022-0002.html
  https://webkitgtk.org/security/WSA-2022-0003.html

Some of the new features require additional dependencies: HTTP/2
requires libsoup3, which is not yet packaged in Buildroot, and
disabled at the moment (with -DUSE_SOUP2=ON, to keep using libsoup2);
and the color management support needs LCMS2 (which will be enabled
in a follow-up patch.)

Options SILENCE_CROSS_COMPILATION_NOTICES and ENABLE_GRAPHICS_CONTEXT_GL
do not exist anymore, and their usage is dropped.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/webkitgtk/webkitgtk.hash |  8 ++++----
 package/webkitgtk/webkitgtk.mk   | 14 +++++---------
 2 files changed, 9 insertions(+), 13 deletions(-)

diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
index 7cb6c90b21..82c210c8f9 100644
--- a/package/webkitgtk/webkitgtk.hash
+++ b/package/webkitgtk/webkitgtk.hash
@@ -1,7 +1,7 @@
-# From https://webkitgtk.org/releases/webkitgtk-2.32.4.tar.xz.sums
-md5  51a167e5d03bacf30c5c588e6aa23143  webkitgtk-2.32.4.tar.xz
-sha1  f7255ffb488e727e9e250e0dae9f192266f50f01  webkitgtk-2.32.4.tar.xz
-sha256  00ce2d3f798d7bc5e9039d9059f0c3c974d51de38c8b716f00e94452a177d3fd  webkitgtk-2.32.4.tar.xz
+# From https://webkitgtk.org/releases/webkitgtk-2.34.6.tar.xz.sums
+md5  a5eeedd02f5b4bba8bd891b92dc743d4  webkitgtk-2.34.6.tar.xz
+sha1  bb82517289baf9c858fa406d1d845274f81e25cb  webkitgtk-2.34.6.tar.xz
+sha256  6bc8fd034aad0432a2459ce4fc7ee25ad65a4924c618bf8d93b52b0c1a84c1f6  webkitgtk-2.34.6.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 4d5d0b89e2..eaf98900ef 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBKITGTK_VERSION = 2.32.4
+WEBKITGTK_VERSION = 2.34.6
 WEBKITGTK_SITE = https://www.webkitgtk.org/releases
 WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
 WEBKITGTK_INSTALL_STAGING = YES
@@ -24,10 +24,11 @@ WEBKITGTK_CONF_OPTS = \
 	-DENABLE_MINIBROWSER=ON \
 	-DENABLE_SPELLCHECK=ON \
 	-DPORT=GTK \
-	-DSILENCE_CROSS_COMPILATION_NOTICES=ON \
+	-DUSE_LCMS=OFF \
 	-DUSE_LIBNOTIFY=OFF \
 	-DUSE_LIBHYPHEN=OFF \
 	-DUSE_OPENJPEG=ON \
+	-DUSE_SOUP2=ON \
 	-DUSE_WOFF2=ON \
 	-DUSE_WPE_RENDERER=OFF
 
@@ -74,7 +75,6 @@ ifeq ($(BR2_PACKAGE_LIBGTK3_X11),y)
 WEBKITGTK_CONF_OPTS += \
 	-DENABLE_ACCELERATED_2D_CANVAS=ON \
 	-DENABLE_GLES2=OFF \
-	-DENABLE_GRAPHICS_CONTEXT_GL=ON \
 	-DENABLE_X11_TARGET=ON
 WEBKITGTK_DEPENDENCIES += libgl \
 	xlib_libXcomposite xlib_libXdamage xlib_libXrender xlib_libXt
@@ -90,15 +90,11 @@ else # !X11
 WEBKITGTK_DEPENDENCIES += libegl
 # GLESv2 support is optional though
 ifeq ($(BR2_PACKAGE_HAS_LIBGLES),y)
-WEBKITGTK_CONF_OPTS += \
-	-DENABLE_GLES2=ON \
-	-DENABLE_GRAPHICS_CONTEXT_GL=ON
+WEBKITGTK_CONF_OPTS += -DENABLE_GLES2=ON
 WEBKITGTK_DEPENDENCIES += libgles
 else
 # Disable general OpenGL (shading) if there's no GLESv2
-WEBKITGTK_CONF_OPTS += \
-	-DENABLE_GLES2=OFF \
-	-DENABLE_GRAPHICS_CONTEXT_GL=OFF
+WEBKITGTK_CONF_OPTS += -DENABLE_GLES2=OFF
 endif
 # We must explicitly state the wayland target
 ifeq ($(BR2_PACKAGE_LIBGTK3_WAYLAND),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
