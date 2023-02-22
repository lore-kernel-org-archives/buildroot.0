Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF0DBC636D6
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 22:22:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 817A660E3E;
	Wed, 22 Feb 2023 22:22:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 817A660E3E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i3YeFmlSZtWj; Wed, 22 Feb 2023 22:22:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 857726122A;
	Wed, 22 Feb 2023 22:22:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 857726122A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B44FA1BF3D2
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 22:22:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8EE5F419D0
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 22:22:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8EE5F419D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SZ6oiUl8ul1u for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 22:22:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 449CA419C9
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 22:22:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 449CA419C9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 331C4868E8; Wed, 22 Feb 2023 22:22:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 22 Feb 2023 23:22:11 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: f78c5cb5cae93a9e63dad4361d78e1787759382f
X-Git-Newrev: 463d0dd49454669e7d72179319aeb967686c129e
X-Patchwork-Hint: ignore
Message-Id: <20230222222235.331C4868E8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/wine: bump to version
 8.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0312880124024163313=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0312880124024163313==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=463d0dd49454669e7d72179319aeb967686c129e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Multiple library checks are obsolete, either due to removal or due to built-in solutions.

License file changed due to update of copyright year.

Signed-off-by: André Zwing <nerv@dawncrow.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...codeca-avoid-mpg123-functions-with-suffix.patch | 21 -------------
 ...p3dmod-avoid-mpg123-functions-with-suffix.patch | 21 -------------
 package/wine/wine.hash                             |  4 +--
 package/wine/wine.mk                               | 35 ++--------------------
 4 files changed, 5 insertions(+), 76 deletions(-)

diff --git a/package/wine/0001-l3codeca-avoid-mpg123-functions-with-suffix.patch b/package/wine/0001-l3codeca-avoid-mpg123-functions-with-suffix.patch
deleted file mode 100644
index 8332db4b38..0000000000
--- a/package/wine/0001-l3codeca-avoid-mpg123-functions-with-suffix.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-commit 75b70efdaa2d4baa064271098878b79f66df155f
-Author: André Zwing <nerv@dawncrow.de>
-Date:   Sat May 21 17:53:07 2022 +0200
-
-    l3codeca.acm: Avoid mpg123 functions with suffix.
-
-[Upstream commit: https://source.winehq.org/git/wine.git/commit/75b70efdaa2d4baa064271098878b79f66df155f]
-Signed-off-by: André Zwing <nerv@dawncrow.de>
-
-diff --git a/dlls/l3codeca.acm/Makefile.in b/dlls/l3codeca.acm/Makefile.in
-index 451794b2624..31765766d4e 100644
---- a/dlls/l3codeca.acm/Makefile.in
-+++ b/dlls/l3codeca.acm/Makefile.in
-@@ -1,6 +1,7 @@
- MODULE    = l3codeca.acm
- IMPORTS   = $(MPG123_PE_LIBS) winmm user32 kernelbase
- EXTRAINCL = $(MPG123_PE_CFLAGS)
-+EXTRADEFS = -DMPG123_NO_LARGENAME
- 
- C_SRCS = \
-        mpegl3.c
diff --git a/package/wine/0002-mp3dmod-avoid-mpg123-functions-with-suffix.patch b/package/wine/0002-mp3dmod-avoid-mpg123-functions-with-suffix.patch
deleted file mode 100644
index 16f2ba2898..0000000000
--- a/package/wine/0002-mp3dmod-avoid-mpg123-functions-with-suffix.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-commit 8d441659f7c7ae359e06a99e7abaae57792356a0
-Author: André Zwing <nerv@dawncrow.de>
-Date:   Sat May 21 17:53:07 2022 +0200
-
-    mp3dmod: Avoid mpg123 functions with suffix.
-
-[Upstream commit: https://source.winehq.org/git/wine.git/commit/8d441659f7c7ae359e06a99e7abaae57792356a0]
-Signed-off-by: André Zwing <nerv@dawncrow.de>
-
-diff --git a/dlls/mp3dmod/Makefile.in b/dlls/mp3dmod/Makefile.in
-index dabbb1dfeae..3ba343a4d34 100644
---- a/dlls/mp3dmod/Makefile.in
-+++ b/dlls/mp3dmod/Makefile.in
-@@ -1,6 +1,7 @@
- MODULE    = mp3dmod.dll
- IMPORTS   = $(MPG123_PE_LIBS) dmoguids msdmo ole32 uuid wmcodecdspuuid kernelbase
- EXTRAINCL = $(MPG123_PE_CFLAGS)
-+EXTRADEFS = -DMPG123_NO_LARGENAME
- 
- C_SRCS = \
-        mp3dmod.c
diff --git a/package/wine/wine.hash b/package/wine/wine.hash
index 9a7a1c342a..b87964da12 100644
--- a/package/wine/wine.hash
+++ b/package/wine/wine.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  5b43e27d5c085cb18f97394e46180310d5eef7c1d91c6895432a3889b2de086b  wine-7.0.tar.xz
+sha256  0272c20938f8721ae4510afaa8b36037457dd57661e4d664231079b9e91c792e  wine-8.0.tar.xz
 # Locally calculated
 sha256  e237fa56668030e928551ddd60f05df5fe957f75eab874bbd017e085ed722e7c  COPYING.LIB
-sha256  7c360930e51d56c8fa12fe1df8ed348ac77a9ad73f9582a303919469399b3ce4  LICENSE
+sha256  793d045546467c8f49e35fbd6e02859e57e78f8bb53571e8200bffd0e966dfa8  LICENSE
diff --git a/package/wine/wine.mk b/package/wine/wine.mk
index a1c65bef4e..a629bf0dd6 100644
--- a/package/wine/wine.mk
+++ b/package/wine/wine.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-WINE_VERSION = 7.0
+WINE_VERSION = 8.0
 WINE_SOURCE = wine-$(WINE_VERSION).tar.xz
-WINE_SITE = https://dl.winehq.org/wine/source/7.0
+WINE_SITE = https://dl.winehq.org/wine/source/8.0
 WINE_LICENSE = LGPL-2.1+
 WINE_LICENSE_FILES = COPYING.LIB LICENSE
 WINE_CPE_ID_VENDOR = winehq
@@ -27,7 +27,6 @@ WINE_CONF_OPTS = \
 	--without-mingw \
 	--without-opencl \
 	--without-oss \
-	--without-vkd3d \
 	--without-vulkan
 
 # Wine uses a wrapper around gcc, and uses the value of --host to
@@ -131,20 +130,6 @@ else
 WINE_CONF_OPTS += --without-v4l2
 endif
 
-ifeq ($(BR2_PACKAGE_OPENAL),y)
-WINE_CONF_OPTS += --with-openal
-WINE_DEPENDENCIES += openal
-else
-WINE_CONF_OPTS += --without-openal
-endif
-
-ifeq ($(BR2_PACKAGE_OPENLDAP),y)
-WINE_CONF_OPTS += --with-ldap
-WINE_DEPENDENCIES += openldap
-else
-WINE_CONF_OPTS += --without-ldap
-endif
-
 ifeq ($(BR2_PACKAGE_MESA3D_OSMESA_GALLIUM),y)
 WINE_CONF_OPTS += --with-osmesa
 WINE_DEPENDENCIES += mesa3d
@@ -266,19 +251,8 @@ endif
 
 # Wine only needs the host tools to be built, so cut-down the
 # build time by building just what we need.
-HOST_WINE_TOOLS = \
-	tools \
-	tools/sfnt2fon \
-	tools/widl \
-	tools/winebuild \
-	tools/winegcc \
-	tools/wmc \
-	tools/wrc
-
 define HOST_WINE_BUILD_CMDS
-	$(foreach t, $(HOST_WINE_TOOLS),
-		$(HOST_MAKE_ENV) $(MAKE) -C $(@D)/$(t)
-	)
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) __tooldeps__
 endef
 
 # Wine only needs its host variant to be built, not that it is
@@ -304,10 +278,8 @@ HOST_WINE_CONF_OPTS += \
 	--without-gssapi \
 	--without-gstreamer \
 	--without-krb5 \
-	--without-ldap \
 	--without-mingw \
 	--without-netapi \
-	--without-openal \
 	--without-opencl \
 	--without-opengl \
 	--without-osmesa \
@@ -318,7 +290,6 @@ HOST_WINE_CONF_OPTS += \
 	--without-sdl \
 	--without-usb \
 	--without-v4l2 \
-	--without-vkd3d \
 	--without-vulkan \
 	--without-x \
 	--without-xcomposite \

--===============0312880124024163313==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0312880124024163313==--
