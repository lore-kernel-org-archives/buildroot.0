Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26201C48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 22:23:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51BBC420E4;
	Tue,  6 Feb 2024 22:23:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iKWolVxYWI85; Tue,  6 Feb 2024 22:22:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 068304209B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 068304209B;
	Tue,  6 Feb 2024 22:22:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B10D91BF276
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 22:22:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AA11B833C9
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 22:22:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dOG-W73JVOSl for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 22:22:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6ACF58339C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6ACF58339C
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 22:22:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 55E6B87481; Tue,  6 Feb 2024 22:22:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Feb 2024 23:21:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 84fd8580aaaa346176e43df35823b78fd3fa686a
X-Git-Newrev: bd8b5d18507b9e01075fa6f90b981e79b400e3f8
X-Patchwork-Hint: ignore
Message-Id: <20240206222231.55E6B87481@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pygame: drop package
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
Content-Type: multipart/mixed; boundary="===============6565235035996925827=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6565235035996925827==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=bd8b5d18507b9e01075fa6f90b981e79b400e3f8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The python-pygame package has not recieved any update since
Sun May 1 22:15:17 2016 (commit: a9ec96e545102ae5ccd4280323d35360b0a5072d)

Also, this package no longer builds properly against python 3.12.0. Receiving
the following error when building:

```
src/surface.c:2812:14: error: invalid type argument of unary ‘*’ (have
‘int’)
 2812 |         ch = *PyUnicode_AS_UNICODE (obj);
      |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~
src/surface.c: In function ‘PySurface_Blit’:
```

If someone wants to re-introduce this package at a later date they are more
than welcome to do so!

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy                         |   7 ++
 DEVELOPERS                               |   1 -
 package/Config.in                        |   1 -
 package/python-pygame/Config.in          |  50 --------------
 package/python-pygame/python-pygame.hash |   3 -
 package/python-pygame/python-pygame.mk   | 111 -------------------------------
 6 files changed, 7 insertions(+), 166 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 9421d07aa1..208f8347c4 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2024.02"
 
+config BR2_PACKAGE_PYTHON_PYGAME
+	bool "python-pygame removed"
+	select BR2_LEGACY
+	help
+	  python-pygame has been removed due to being abandoned and
+	  the old version no longer building with python 3.12.0.
+
 config BR2_KERNEL_HEADERS_4_14
 	bool "kernel headers version 4.14.x are no longer supported"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 376a1662d9..cf98d56aa1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1704,7 +1704,6 @@ F:	package/libcddb/
 F:	package/libmodbus/
 F:	package/ltris/
 F:	package/opentyrian/
-F:	package/python-pygame/
 
 N:	Julien Corjon <corjon.j@ecagroup.com>
 F:	package/qt5/
diff --git a/package/Config.in b/package/Config.in
index b48f9eb1c7..e10fbd8b35 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1259,7 +1259,6 @@ menu "External python modules"
 	source "package/python-pydyf/Config.in"
 	source "package/python-pyelftools/Config.in"
 	source "package/python-pyftpdlib/Config.in"
-	source "package/python-pygame/Config.in"
 	source "package/python-pygments/Config.in"
 	source "package/python-pyhamcrest/Config.in"
 	source "package/python-pyicu/Config.in"
diff --git a/package/python-pygame/Config.in b/package/python-pygame/Config.in
deleted file mode 100644
index 57eb020742..0000000000
--- a/package/python-pygame/Config.in
+++ /dev/null
@@ -1,50 +0,0 @@
-config BR2_PACKAGE_PYTHON_PYGAME
-	bool "python-pygame"
-	select BR2_PACKAGE_SDL
-	help
-	  Pygame is a cross-platfrom library designed to make it easy
-	  to write multimedia software, such as games, in
-	  Python. Pygame requires the Python language and SDL
-	  multimedia library.
-	  It can also make use of several other popular libraries.
-
-	  http://www.pygame.org/
-
-if BR2_PACKAGE_PYTHON_PYGAME
-config BR2_PACKAGE_PYTHON_PYGAME_IMAGE
-	bool "pygame.image"
-	select BR2_PACKAGE_SDL_IMAGE
-	select BR2_PACKAGE_SDL_IMAGE_PNG
-	select BR2_PACKAGE_SDL_IMAGE_JPEG
-	help
-	  pygame module for loading, saving and transfering images.
-	  Will autoselect sdl_image with png and jpeg support.
-
-config BR2_PACKAGE_PYTHON_PYGAME_EXAMPLES
-	bool "pygame.examples"
-	help
-	  Include examples.
-	  Selecting this option adds about 1.5 MB to the target file
-	  system.
-
-config BR2_PACKAGE_PYTHON_PYGAME_FONT
-	bool "pygame.font"
-	select BR2_PACKAGE_SDL_TTF
-	help
-	  pygame module for loading and rendering fonts.
-	  Will autoselect sdl_ttf.
-
-config BR2_PACKAGE_PYTHON_PYGAME_MIXER
-	bool "pygame.mixer"
-	select BR2_PACKAGE_SDL_MIXER
-	help
-	  pygame module for loading and playing sounds.
-	  Will autoselect sdl_mixer.
-
-config BR2_PACKAGE_PYTHON_PYGAME_SCRAP
-	bool "pygame.scrap"
-	depends on BR2_PACKAGE_SDL_X11
-	help
-	  pygame module for clipboard support (X11 needed)
-
-endif
diff --git a/package/python-pygame/python-pygame.hash b/package/python-pygame/python-pygame.hash
deleted file mode 100644
index c0496515e2..0000000000
--- a/package/python-pygame/python-pygame.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed
-sha256  f95a7dd68ea294d415e36e068d2f533c5a01c67773452d14a535c5c7455681fe  pygame-d61ea8eabd56.tar.gz
-sha256  a190dc9c8043755d90f8b0a75fa66b9e42d4af4c980bf5ddc633f0124db3cee7  LGPL
diff --git a/package/python-pygame/python-pygame.mk b/package/python-pygame/python-pygame.mk
deleted file mode 100644
index 84fd6df4e2..0000000000
--- a/package/python-pygame/python-pygame.mk
+++ /dev/null
@@ -1,111 +0,0 @@
-################################################################################
-#
-# python-pygame
-#
-################################################################################
-
-# stable 1.9.1 release requires V4L which has been wiped out of recent Linux
-# kernels, so use latest mercurial revision until next stable release is out.
-PYTHON_PYGAME_VERSION = d61ea8eabd56
-PYTHON_PYGAME_SOURCE = pygame-$(PYTHON_PYGAME_VERSION).tar.gz
-PYTHON_PYGAME_SITE = https://bitbucket.org/pygame/pygame
-PYTHON_PYGAME_SITE_METHOD = hg
-PYTHON_PYGAME_SETUP_TYPE = setuptools
-PYTHON_PYGAME_LICENSE = LGPL-2.1+
-PYTHON_PYGAME_LICENSE_FILES = LGPL
-
-ifeq ($(BR2_PACKAGE_PYTHON_PYGAME_IMAGE),y)
-PYTHON_PYGAME_OPT_DEPENDS += sdl_image
-endif
-
-ifeq ($(BR2_PACKAGE_PYTHON_PYGAME_FONT),y)
-PYTHON_PYGAME_OPT_DEPENDS += sdl_ttf
-endif
-
-ifeq ($(BR2_PACKAGE_PYTHON_PYGAME_MIXER),y)
-PYTHON_PYGAME_OPT_DEPENDS += sdl_mixer
-endif
-
-PYTHON_PYGAME_DEPENDENCIES = sdl $(PYTHON_PYGAME_OPT_DEPENDS)
-
-ifneq ($(BR2_PACKAGE_PYTHON_PYGAME_IMAGE),y)
-define PYTHON_PYGAME_UNCONFIGURE_IMAGE
-	$(SED) 's/^imageext/#imageext/' $(@D)/Setup
-endef
-endif
-
-ifneq ($(BR2_PACKAGE_PYTHON_PYGAME_FONT),y)
-define PYTHON_PYGAME_UNCONFIGURE_FONT
-	$(SED) 's/^font/#font/' $(@D)/Setup
-endef
-endif
-
-ifneq ($(BR2_PACKAGE_PYTHON_PYGAME_MIXER),y)
-define PYTHON_PYGAME_UNCONFIGURE_MIXER
-	$(SED) 's/^mixer/#mixer/g' $(@D)/Setup
-endef
-endif
-
-# Both require numpy or numeric python module
-define PYTHON_PYGAME_UNCONFIGURE_SNDARRAY
-	$(SED) 's/^_numericsndarray/#_numericsndarray/' $(@D)/Setup
-endef
-
-define PYTHON_PYGAME_UNCONFIGURE_SURFARRAY
-	$(SED) 's/^_numericsurfarray/#_numericsurfarray/' $(@D)/Setup
-endef
-
-# Requires smpeg
-define PYTHON_PYGAME_UNCONFIGURE_MOVIE
-	$(SED) 's/^movie/#movie/' $(@D)/Setup
-endef
-
-ifneq ($(BR2_PACKAGE_PYTHON_PYGAME_SCRAP),y)
-define PYTHON_PYGAME_UNCONFIGURE_SCRAP
-	$(SED) 's/^scrap/#scrap/' $(@D)/Setup
-endef
-endif
-
-define PYTHON_PYGAME_UNCONFIGURE_FREETYPE
-	$(SED) 's/^_freetype/#_freetype/' $(@D)/Setup
-endef
-
-PYTHON_PYGAME_SDL_FLAGS = `$(STAGING_DIR)/usr/bin/sdl-config --cflags`
-PYTHON_PYGAME_SDL_FLAGS += `$(STAGING_DIR)/usr/bin/sdl-config --libs`
-
-# Pygame needs a Setup file where options should be commented out if
-# dependencies are not available
-define PYTHON_PYGAME_CONFIGURE_CMDS
-	cp -f $(@D)/Setup.in $(@D)/Setup
-	$(SED) "s~^SDL = ~SDL = $(PYTHON_PYGAME_SDL_FLAGS) \n#~" $(@D)/Setup
-	$(SED) 's/^pypm/#pypm/' $(@D)/Setup
-	$(PYTHON_PYGAME_UNCONFIGURE_IMAGE)
-	$(PYTHON_PYGAME_UNCONFIGURE_FONT)
-	$(PYTHON_PYGAME_UNCONFIGURE_MIXER)
-	$(PYTHON_PYGAME_UNCONFIGURE_SNDARRAY)
-	$(PYTHON_PYGAME_UNCONFIGURE_SURFARRAY)
-	$(PYTHON_PYGAME_UNCONFIGURE_MOVIE)
-	$(PYTHON_PYGAME_UNCONFIGURE_SCRAP)
-	$(PYTHON_PYGAME_UNCONFIGURE_FREETYPE)
-endef
-
-define PYTHON_PYGAME_REMOVE_DOC
-	rm -rf $(TARGET_DIR)/usr/lib/python*/site-packages/pygame/docs
-endef
-
-PYTHON_PYGAME_POST_INSTALL_TARGET_HOOKS += PYTHON_PYGAME_REMOVE_DOC
-
-define PYTHON_PYGAME_REMOVE_TESTS
-	rm -rf $(TARGET_DIR)/usr/lib/python*/site-packages/pygame/tests
-endef
-
-PYTHON_PYGAME_POST_INSTALL_TARGET_HOOKS += PYTHON_PYGAME_REMOVE_TESTS
-
-ifneq ($(BR2_PACKAGE_PYTHON_PYGAME_EXAMPLES),y)
-define PYTHON_PYGAME_REMOVE_EXAMPLES
-	rm -rf $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/pygame/examples
-endef
-PYTHON_PYGAME_POST_INSTALL_TARGET_HOOKS += PYTHON_PYGAME_REMOVE_EXAMPLES
-endif
-
-$(eval $(python-package))

--===============6565235035996925827==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6565235035996925827==--
