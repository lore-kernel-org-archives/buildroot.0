From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon,  3 Dec 2018 08:30:43 +0100
Subject: [Buildroot] [PATCH 2/2] atk: bump to version 2.30.0
In-Reply-To: <20181203073043.21021-1-fontaine.fabrice@gmail.com>
References: <20181203073043.21021-1-fontaine.fabrice@gmail.com>
Message-ID: <20181203073043.21021-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Switch to meson-package
- Remove ATK_INSTALL_STAGING_OPTS and host-pkgconf: not needed anymore
- Add hash for license file
- This bump fix the issue with glib 2.58.1 (because meson does not use
  pkgconfig to find glib-genmarshal):
  /bin/bash: /usr/bin/glib-genmarshal: No such file or directory

Fixes:
 - http://autobuild.buildroot.org/results/23cf5227c21365cda0babf1922425f8adaa97fba

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/atk/atk.hash | 7 +++++--
 package/atk/atk.mk   | 9 ++++-----
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/package/atk/atk.hash b/package/atk/atk.hash
index 80aeecaee9..911e65fcc7 100644
--- a/package/atk/atk.hash
+++ b/package/atk/atk.hash
@@ -1,2 +1,5 @@
-# From http://ftp.gnome.org/pub/gnome/sources/atk/2.28/atk-2.28.1.sha256sum
-sha256 cd3a1ea6ecc268a2497f0cd018e970860de24a6d42086919d6bf6c8e8d53f4fc atk-2.28.1.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/atk/2.30/atk-2.30.0.sha256sum
+sha256 dd4d90d4217f2a0c1fee708a555596c2c19d26fef0952e1ead1938ab632c027b atk-2.30.0.tar.xz
+
+# Hash for license file
+sha256 d245807f90032872d1438d741ed21e2490e1175dc8aa3afa5ddb6c8e529b58e5 COPYING
diff --git a/package/atk/atk.mk b/package/atk/atk.mk
index babb00d244..228b24a7da 100644
--- a/package/atk/atk.mk
+++ b/package/atk/atk.mk
@@ -4,14 +4,13 @@
 #
 ################################################################################
 
-ATK_VERSION_MAJOR = 2.28
-ATK_VERSION = $(ATK_VERSION_MAJOR).1
+ATK_VERSION_MAJOR = 2.30
+ATK_VERSION = $(ATK_VERSION_MAJOR).0
 ATK_SOURCE = atk-$(ATK_VERSION).tar.xz
 ATK_SITE = http://ftp.gnome.org/pub/gnome/sources/atk/$(ATK_VERSION_MAJOR)
 ATK_LICENSE = LGPL-2.0+
 ATK_LICENSE_FILES = COPYING
 ATK_INSTALL_STAGING = YES
-ATK_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) LDFLAGS=-L$(STAGING_DIR)/usr/lib install
-ATK_DEPENDENCIES = libglib2 host-pkgconf
+ATK_DEPENDENCIES = libglib2
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
-- 
2.14.1
