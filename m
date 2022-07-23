Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61D23C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 16:59:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0EA8283EA0;
	Sat, 23 Jul 2022 16:59:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0EA8283EA0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HcZlu6PnktVk; Sat, 23 Jul 2022 16:59:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6CE1A83E91;
	Sat, 23 Jul 2022 16:59:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6CE1A83E91
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 50C721BF31A
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 16:57:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A42B584BF4
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 16:57:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A42B584BF4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g8WOwEseQMXO for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 16:57:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A0EA284BDB
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 16:57:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A0EA284BDB
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 64935847EF; Sat, 23 Jul 2022 16:44:12 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 18:57:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 825b56371601611b812faf532d0f10a61916882f
X-Git-Newrev: da6b2c2df0e8310c5176f39b54e93f43d17fb73e
X-Patchwork-Hint: ignore
Message-Id: <20220723164412.64935847EF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wine: bump to version 7.0
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
Content-Type: multipart/mixed; boundary="===============7583439348074546489=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7583439348074546489==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=da6b2c2df0e8310c5176f39b54e93f43d17fb73e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Multiple library checks are obsolete, either due to removal or due to built-in solutions.

License file changed due to update of copyright year.

Signed-off-by: André Zwing <nerv@dawncrow.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...codeca-avoid-mpg123-functions-with-suffix.patch | 21 +++++++
 ...p3dmod-avoid-mpg123-functions-with-suffix.patch | 21 +++++++
 package/wine/wine.hash                             |  4 +-
 package/wine/wine.mk                               | 68 +---------------------
 4 files changed, 46 insertions(+), 68 deletions(-)

diff --git a/package/wine/0001-l3codeca-avoid-mpg123-functions-with-suffix.patch b/package/wine/0001-l3codeca-avoid-mpg123-functions-with-suffix.patch
new file mode 100644
index 0000000000..8332db4b38
--- /dev/null
+++ b/package/wine/0001-l3codeca-avoid-mpg123-functions-with-suffix.patch
@@ -0,0 +1,21 @@
+commit 75b70efdaa2d4baa064271098878b79f66df155f
+Author: André Zwing <nerv@dawncrow.de>
+Date:   Sat May 21 17:53:07 2022 +0200
+
+    l3codeca.acm: Avoid mpg123 functions with suffix.
+
+[Upstream commit: https://source.winehq.org/git/wine.git/commit/75b70efdaa2d4baa064271098878b79f66df155f]
+Signed-off-by: André Zwing <nerv@dawncrow.de>
+
+diff --git a/dlls/l3codeca.acm/Makefile.in b/dlls/l3codeca.acm/Makefile.in
+index 451794b2624..31765766d4e 100644
+--- a/dlls/l3codeca.acm/Makefile.in
++++ b/dlls/l3codeca.acm/Makefile.in
+@@ -1,6 +1,7 @@
+ MODULE    = l3codeca.acm
+ IMPORTS   = $(MPG123_PE_LIBS) winmm user32 kernelbase
+ EXTRAINCL = $(MPG123_PE_CFLAGS)
++EXTRADEFS = -DMPG123_NO_LARGENAME
+ 
+ C_SRCS = \
+        mpegl3.c
diff --git a/package/wine/0002-mp3dmod-avoid-mpg123-functions-with-suffix.patch b/package/wine/0002-mp3dmod-avoid-mpg123-functions-with-suffix.patch
new file mode 100644
index 0000000000..16f2ba2898
--- /dev/null
+++ b/package/wine/0002-mp3dmod-avoid-mpg123-functions-with-suffix.patch
@@ -0,0 +1,21 @@
+commit 8d441659f7c7ae359e06a99e7abaae57792356a0
+Author: André Zwing <nerv@dawncrow.de>
+Date:   Sat May 21 17:53:07 2022 +0200
+
+    mp3dmod: Avoid mpg123 functions with suffix.
+
+[Upstream commit: https://source.winehq.org/git/wine.git/commit/8d441659f7c7ae359e06a99e7abaae57792356a0]
+Signed-off-by: André Zwing <nerv@dawncrow.de>
+
+diff --git a/dlls/mp3dmod/Makefile.in b/dlls/mp3dmod/Makefile.in
+index dabbb1dfeae..3ba343a4d34 100644
+--- a/dlls/mp3dmod/Makefile.in
++++ b/dlls/mp3dmod/Makefile.in
+@@ -1,6 +1,7 @@
+ MODULE    = mp3dmod.dll
+ IMPORTS   = $(MPG123_PE_LIBS) dmoguids msdmo ole32 uuid wmcodecdspuuid kernelbase
+ EXTRAINCL = $(MPG123_PE_CFLAGS)
++EXTRADEFS = -DMPG123_NO_LARGENAME
+ 
+ C_SRCS = \
+        mp3dmod.c
diff --git a/package/wine/wine.hash b/package/wine/wine.hash
index 083e3dd3eb..9a7a1c342a 100644
--- a/package/wine/wine.hash
+++ b/package/wine/wine.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  b493065f2f83ee429c62e2ec58698a3cf63ef78722e1b20765823152e8582c56  wine-6.0.tar.xz
+sha256  5b43e27d5c085cb18f97394e46180310d5eef7c1d91c6895432a3889b2de086b  wine-7.0.tar.xz
 # Locally calculated
 sha256  e237fa56668030e928551ddd60f05df5fe957f75eab874bbd017e085ed722e7c  COPYING.LIB
-sha256  111398f1be25b1ae1f124512fe61569e6b4555408e2feb9bc82f9fe57d39b302  LICENSE
+sha256  7c360930e51d56c8fa12fe1df8ed348ac77a9ad73f9582a303919469399b3ce4  LICENSE
diff --git a/package/wine/wine.mk b/package/wine/wine.mk
index c925a58632..5f4d2ef6e3 100644
--- a/package/wine/wine.mk
+++ b/package/wine/wine.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-WINE_VERSION = 6.0
+WINE_VERSION = 7.0
 WINE_SOURCE = wine-$(WINE_VERSION).tar.xz
-WINE_SITE = https://dl.winehq.org/wine/source/6.0
+WINE_SITE = https://dl.winehq.org/wine/source/7.0
 WINE_LICENSE = LGPL-2.1+
 WINE_LICENSE_FILES = COPYING.LIB LICENSE
 WINE_CPE_ID_VENDOR = winehq
@@ -21,12 +21,9 @@ WINE_CONF_OPTS = \
 	--disable-win64 \
 	--without-capi \
 	--without-coreaudio \
-	--without-faudio \
 	--without-gettext \
 	--without-gettextpo \
 	--without-gphoto \
-	--without-gsm \
-	--without-hal \
 	--without-mingw \
 	--without-opencl \
 	--without-oss \
@@ -99,20 +96,6 @@ else
 WINE_CONF_OPTS += --without-gstreamer
 endif
 
-ifeq ($(BR2_PACKAGE_JPEG),y)
-WINE_CONF_OPTS += --with-jpeg
-WINE_DEPENDENCIES += jpeg
-else
-WINE_CONF_OPTS += --without-jpeg
-endif
-
-ifeq ($(BR2_PACKAGE_LCMS2),y)
-WINE_CONF_OPTS += --with-cms
-WINE_DEPENDENCIES += lcms2
-else
-WINE_CONF_OPTS += --without-cms
-endif
-
 ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
 WINE_CONF_OPTS += --with-opengl
 WINE_DEPENDENCIES += libgl
@@ -134,13 +117,6 @@ else
 WINE_CONF_OPTS += --without-pcap
 endif
 
-ifeq ($(BR2_PACKAGE_LIBPNG),y)
-WINE_CONF_OPTS += --with-png
-WINE_DEPENDENCIES += libpng
-else
-WINE_CONF_OPTS += --without-png
-endif
-
 ifeq ($(BR2_PACKAGE_LIBUSB),y)
 WINE_CONF_OPTS += --with-usb
 WINE_DEPENDENCIES += libusb
@@ -155,29 +131,6 @@ else
 WINE_CONF_OPTS += --without-v4l2
 endif
 
-ifeq ($(BR2_PACKAGE_LIBXML2),y)
-WINE_CONF_OPTS += --with-xml
-WINE_DEPENDENCIES += libxml2
-WINE_CONF_ENV += XML2_CONFIG=$(STAGING_DIR)/usr/bin/xml2-config
-else
-WINE_CONF_OPTS += --without-xml
-endif
-
-ifeq ($(BR2_PACKAGE_LIBXSLT),y)
-WINE_CONF_OPTS += --with-xslt
-WINE_DEPENDENCIES += libxslt
-WINE_CONF_ENV += XSLT_CONFIG=$(STAGING_DIR)/usr/bin/xslt-config
-else
-WINE_CONF_OPTS += --without-xslt
-endif
-
-ifeq ($(BR2_PACKAGE_MPG123),y)
-WINE_CONF_OPTS += --with-mpg123
-WINE_DEPENDENCIES += mpg123
-else
-WINE_CONF_OPTS += --without-mpg123
-endif
-
 ifeq ($(BR2_PACKAGE_OPENAL),y)
 WINE_CONF_OPTS += --with-openal
 WINE_DEPENDENCIES += openal
@@ -228,13 +181,6 @@ else
 WINE_CONF_OPTS += --without-sdl
 endif
 
-ifeq ($(BR2_PACKAGE_TIFF),y)
-WINE_CONF_OPTS += --with-tiff
-WINE_DEPENDENCIES += tiff
-else
-WINE_CONF_OPTS += --without-tiff
-endif
-
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
 WINE_CONF_OPTS += --with-udev
 WINE_DEPENDENCIES += udev
@@ -349,23 +295,17 @@ HOST_WINE_CONF_OPTS += \
 	--disable-win16 \
 	--without-alsa \
 	--without-capi \
-	--without-cms \
 	--without-coreaudio \
-	--without-faudio \
 	--without-cups \
 	--without-dbus \
 	--without-fontconfig \
 	--without-gphoto \
 	--without-gnutls \
-	--without-gsm \
 	--without-gssapi \
 	--without-gstreamer \
-	--without-hal \
-	--without-jpeg \
 	--without-krb5 \
 	--without-ldap \
 	--without-mingw \
-	--without-mpg123 \
 	--without-netapi \
 	--without-openal \
 	--without-opencl \
@@ -374,10 +314,8 @@ HOST_WINE_CONF_OPTS += \
 	--without-oss \
 	--without-pcap \
 	--without-pulse \
-	--without-png \
 	--without-sane \
 	--without-sdl \
-	--without-tiff \
 	--without-usb \
 	--without-v4l2 \
 	--without-vkd3d \
@@ -388,12 +326,10 @@ HOST_WINE_CONF_OPTS += \
 	--without-xinerama \
 	--without-xinput \
 	--without-xinput2 \
-	--without-xml \
 	--without-xrandr \
 	--without-xrender \
 	--without-xshape \
 	--without-xshm \
-	--without-xslt \
 	--without-xxf86vm
 
 $(eval $(autotools-package))

--===============7583439348074546489==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7583439348074546489==--
