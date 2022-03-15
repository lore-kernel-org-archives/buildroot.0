Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24CB3C433EF
	for <buildroot@archiver.kernel.org>; Tue, 15 Mar 2022 21:51:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D4E5C8431F;
	Tue, 15 Mar 2022 21:51:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vrCXHYV3jT6U; Tue, 15 Mar 2022 21:51:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D982A8431B;
	Tue, 15 Mar 2022 21:51:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DEEE81BF9AA
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 21:50:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9E26140154
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 21:50:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U1cYx8_cUoCO for <buildroot@lists.busybox.net>;
 Tue, 15 Mar 2022 21:50:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 96A6A40360
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 21:50:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 9ADEB8412D; Tue, 15 Mar 2022 21:41:47 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 15 Mar 2022 22:27:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b081717ad6b865b6278940678e432b4a4d07222d
X-Git-Newrev: cbcbd66b0f241184288232972d9cd9d03c9f0ce1
X-Patchwork-Hint: ignore
Message-Id: <20220315214147.9ADEB8412D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xscreensaver: bump to version 6.03
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

commit: https://git.buildroot.net/buildroot/commit/?id=cbcbd66b0f241184288232972d9cd9d03c9f0ce1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

xlib_libXft and xlib_libXi are now mandatory

https://www.jwz.org/xscreensaver/changelog.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/xscreensaver/Config.in         |  2 ++
 package/xscreensaver/xscreensaver.hash |  2 +-
 package/xscreensaver/xscreensaver.mk   | 18 +++---------------
 3 files changed, 6 insertions(+), 16 deletions(-)

diff --git a/package/xscreensaver/Config.in b/package/xscreensaver/Config.in
index 10b2b7012c..48eefdfa70 100644
--- a/package/xscreensaver/Config.in
+++ b/package/xscreensaver/Config.in
@@ -14,6 +14,8 @@ config BR2_PACKAGE_XSCREENSAVER
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_JPEG
 	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXFT
+	select BR2_PACKAGE_XLIB_LIBXI
 	select BR2_PACKAGE_XLIB_LIBXT
 	help
 	  XScreenSaver is the standard screen saver collection shipped
diff --git a/package/xscreensaver/xscreensaver.hash b/package/xscreensaver/xscreensaver.hash
index 26ecd8bbbf..27ef7d8f00 100644
--- a/package/xscreensaver/xscreensaver.hash
+++ b/package/xscreensaver/xscreensaver.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  7016df6736ba0126a68c1f35abcf411a695fe93bc01a18ebd9df46c9a9f4d50d  xscreensaver-5.45.tar.gz
+sha256  328d51797352acf58ca5bab49e76fbf26034e7cad785f651ea11ce7b43fba25a  xscreensaver-6.03.tar.gz
 sha256  8a03451ba5c4c9af669b53e47e50c38c149b9e152d3d627809b962da7b760bbd  hacks/screenhack.h
 sha256  56db580415bb313a4a82c5e08f106304904d15d42faf8e6ab14b34e14e2087a5  hacks/glx/chessmodels.h
diff --git a/package/xscreensaver/xscreensaver.mk b/package/xscreensaver/xscreensaver.mk
index 46dedc3211..0a91d22d14 100644
--- a/package/xscreensaver/xscreensaver.mk
+++ b/package/xscreensaver/xscreensaver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XSCREENSAVER_VERSION = 5.45
+XSCREENSAVER_VERSION = 6.03
 XSCREENSAVER_SITE = https://www.jwz.org/xscreensaver
 
 # N.B. GPL-2.0+ code (in the hacks/glx subdirectory) is not currently built.
@@ -20,6 +20,8 @@ XSCREENSAVER_DEPENDENCIES = \
 	libgtk2 \
 	libxml2 \
 	xlib_libX11 \
+	xlib_libXft \
+	xlib_libXi \
 	xlib_libXt \
 	$(TARGET_NLS_DEPENDENCIES) \
 	host-intltool
@@ -51,20 +53,6 @@ else
 XSCREENSAVER_CONF_OPTS += --with-systemd=no
 endif
 
-ifeq ($(BR2_PACKAGE_XLIB_LIBXFT),y)
-XSCREENSAVER_CONF_OPTS += --with-xft=yes
-XSCREENSAVER_DEPENDENCIES += xlib_libXft
-else
-XSCREENSAVER_CONF_OPTS += --with-xft=no
-endif
-
-ifeq ($(BR2_PACKAGE_XLIB_LIBXI),y)
-XSCREENSAVER_CONF_OPTS += --with-xinput-ext=yes
-XSCREENSAVER_DEPENDENCIES += xlib_libXi
-else
-XSCREENSAVER_CONF_OPTS += --with-xinput-ext=no
-endif
-
 ifeq ($(BR2_PACKAGE_XLIB_LIBXINERAMA),y)
 XSCREENSAVER_CONF_OPTS += --with-xinerama-ext=yes
 XSCREENSAVER_DEPENDENCIES += xlib_libXinerama
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
