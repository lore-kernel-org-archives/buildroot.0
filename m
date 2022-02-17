Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17898C433EF
	for <buildroot@archiver.kernel.org>; Thu, 17 Feb 2022 23:09:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8130583FEE;
	Thu, 17 Feb 2022 23:09:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id di-yECZSr-Va; Thu, 17 Feb 2022 23:09:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ADC3683FA6;
	Thu, 17 Feb 2022 23:09:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 49A661C113E
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 23:09:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3EE2683FA6
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 23:09:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ipVlfWkBNSvD for <buildroot@lists.busybox.net>;
 Thu, 17 Feb 2022 23:09:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E5DA183FA5
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 23:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RTy4C65MF6ZJ6WTva3O6E0cV14Ht6HZMuzyZZmgdaFY=; b=slCZZE6QLjjf4rT0eaOL/1XFJO
 dLR0F+/ConwqKEZsXJTeRbU8rVEdSskTsMr3Xx38YZdrXFj7sDpRIPTg3yjbF1zBrAbUJNNV5p1Sz
 YPpt5qobUcVuDaAwGQcKhawD0nVJOBjInyVW8q3UXkNSNCgQ48xQQ+pon5brETSeXa9knBYzuS7ff
 KK1r+/wKg7hu9cfKL0F9bX8tHg/Lv1wiCOPj2xn+fHLceAo6FM3xIgjg6Qfb0rHZO5xNIrn+iMInw
 mwRsj9wpWKz2xkgehtEK5JA2o1+9ZkUiIN3cY67e6iZaetkMCnnEpUTC3t94THfZrlq7B3OJB1R7b
 RLcmMj0g==;
Received: from 91-153-34-133.elisa-laajakaista.fi ([91.153.34.133] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1nKpto-0003Ia-Vj; Fri, 18 Feb 2022 00:09:21 +0100
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id e0837857;
 Thu, 17 Feb 2022 23:09:08 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Fri, 18 Feb 2022 01:09:07 +0200
Message-Id: <20220217230908.1532564-1-aperez@igalia.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/webkitgtk: security bump to 2.34.6
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
Cc: Adrian Perez de Castro <aperez@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
index 16b925fe71..f4fc1e7838 100644
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
 	-DUSE_WOFF2=ON
 
 ifeq ($(BR2_PACKAGE_WEBKITGTK_SANDBOX),y)
@@ -73,7 +74,6 @@ ifeq ($(BR2_PACKAGE_LIBGTK3_X11),y)
 WEBKITGTK_CONF_OPTS += \
 	-DENABLE_ACCELERATED_2D_CANVAS=ON \
 	-DENABLE_GLES2=OFF \
-	-DENABLE_GRAPHICS_CONTEXT_GL=ON \
 	-DENABLE_X11_TARGET=ON
 WEBKITGTK_DEPENDENCIES += libgl \
 	xlib_libXcomposite xlib_libXdamage xlib_libXrender xlib_libXt
@@ -89,15 +89,11 @@ else # !X11
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
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
