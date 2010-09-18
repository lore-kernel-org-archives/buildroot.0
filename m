From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Sat, 18 Sep 2010 19:59:44 +0200
Subject: [Buildroot] [PATCH 2/7] package: modifications to work with new
	libtool policy
In-Reply-To: <1284832789-22631-1-git-send-email-llandwerlin@gmail.com>
References: <1284832789-22631-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1284832789-22631-3-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 package/bash/bash.mk         |    2 ++
 package/directfb/directfb.mk |    2 --
 package/expat/expat.mk       |    1 +
 package/freetype/freetype.mk |    1 +
 package/jpeg/jpeg.mk         |    1 +
 package/ncurses/ncurses.mk   |    1 +
 6 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/bash/bash.mk b/package/bash/bash.mk
index d7bb699..3d815e2 100644
--- a/package/bash/bash.mk
+++ b/package/bash/bash.mk
@@ -6,6 +6,8 @@
 
 BASH_VERSION = 4.1
 BASH_SITE = $(BR2_GNU_MIRROR)/bash
+BASH_AUTORECONF = NO
+
 BASH_DEPENDENCIES = ncurses
 
 # Save the old sh file/link if there is one and symlink bash->sh
diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
index ccb0c5a..d01ef9f 100644
--- a/package/directfb/directfb.mk
+++ b/package/directfb/directfb.mk
@@ -7,8 +7,6 @@ DIRECTFB_VERSION_MAJOR:=1.4
 DIRECTFB_VERSION:=1.4.3
 DIRECTFB_SITE:=http://www.directfb.org/downloads/Core/DirectFB-$(DIRECTFB_VERSION_MAJOR)
 DIRECTFB_SOURCE:=DirectFB-$(DIRECTFB_VERSION).tar.gz
-DIRECTFB_AUTORECONF = NO
-DIRECTFB_LIBTOOL_PATCH = NO
 DIRECTFB_INSTALL_STAGING = YES
 DIRECTFB_INSTALL_TARGET = YES
 
diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index 5d68e36..ae725fd 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -7,6 +7,7 @@
 EXPAT_VERSION = 2.0.1
 EXPAT_SOURCE = expat-$(EXPAT_VERSION).tar.gz
 EXPAT_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/expat
+EXPAT_AUTORECONF = NO
 EXPAT_LIBTOOL_PATCH = NO
 EXPAT_INSTALL_STAGING = YES
 EXPAT_INSTALL_TARGET = YES
diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index 5a88cca..99f6998 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -7,6 +7,7 @@ FREETYPE_VERSION = 2.3.12
 FREETYPE_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/freetype
 FREETYPE_SOURCE = freetype-$(FREETYPE_VERSION).tar.bz2
 FREETYPE_LIBTOOL_PATCH = NO
+FREETYPE_AUTORECONF = NO
 FREETYPE_INSTALL_STAGING = YES
 FREETYPE_INSTALL_TARGET = YES
 FREETYPE_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
diff --git a/package/jpeg/jpeg.mk b/package/jpeg/jpeg.mk
index 9a4512c..b2e1c7b 100644
--- a/package/jpeg/jpeg.mk
+++ b/package/jpeg/jpeg.mk
@@ -27,6 +27,7 @@ JPEG_INSTALL_STAGING = YES
 JPEG_INSTALL_TARGET = YES
 JPEG_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 JPEG_LIBTOOL_PATCH = NO
+JPEG_AUTORECONF = NO
 JPEG_CONF_OPT = --without-x --enable-shared --enable-static
 
 define JPEG_REMOVE_USELESS_TOOLS
diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index 0a49887..70b3e09 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -27,6 +27,7 @@ NCURSES_VERSION = 5.7
 NCURSES_SITE = $(BR2_GNU_MIRROR)/ncurses
 NCURSES_SOURCE = ncurses-$(NCURSES_VERSION).tar.gz
 NCURSES_INSTALL_STAGING = YES
+NCURSES_AUTORECONF = NO
 
 NCURSES_CONF_OPT = \
 	--with-shared \
-- 
1.7.1
