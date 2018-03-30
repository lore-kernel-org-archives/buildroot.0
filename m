From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 30 Mar 2018 10:57:14 +0300
Subject: [Buildroot] [PATCH] libunistring: bump to version 0.9.9
Message-ID: <f4e7a79ad539740d5d57f80b7ee87a527f621c25.1522396634.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop --{enable,disable}-threads; threading support is detected
automatically.

Add GPLv3 license file.

Add license files hash.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/libunistring/libunistring.hash |  6 +++++-
 package/libunistring/libunistring.mk   | 10 ++--------
 2 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/package/libunistring/libunistring.hash b/package/libunistring/libunistring.hash
index 15e35cb81c56..8a5da7782d33 100644
--- a/package/libunistring/libunistring.hash
+++ b/package/libunistring/libunistring.hash
@@ -1,2 +1,6 @@
 # Locally calculated after checking pgp signature
-sha256	2e3764512aaf2ce598af5a38818c0ea23dedf1ff5460070d1b6cee5c3336e797	libunistring-0.9.7.tar.xz
+# https://ftp.gnu.org/gnu/libunistring/libunistring-0.9.9.tar.xz.sig
+sha256	a4d993ecfce16cf503ff7579f5da64619cee66226fb3b998dafb706190d9a833	libunistring-0.9.9.tar.xz
+# Locally calculated
+sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	COPYING
+sha256	a853c2ffec17057872340eee242ae4d96cbf2b520ae27d903e1b2fef1a5f9d1c	COPYING.LIB
diff --git a/package/libunistring/libunistring.mk b/package/libunistring/libunistring.mk
index 9340e79937f9..929b52ebd5ba 100644
--- a/package/libunistring/libunistring.mk
+++ b/package/libunistring/libunistring.mk
@@ -4,18 +4,12 @@
 #
 ################################################################################
 
-LIBUNISTRING_VERSION = 0.9.7
+LIBUNISTRING_VERSION = 0.9.9
 LIBUNISTRING_SITE = $(BR2_GNU_MIRROR)/libunistring
 LIBUNISTRING_SOURCE = libunistring-$(LIBUNISTRING_VERSION).tar.xz
 LIBUNISTRING_INSTALL_STAGING = YES
 LIBUNISTRING_LICENSE = LGPL-3.0+ or GPL-2.0
-LIBUNISTRING_LICENSE_FILES = COPYING.LIB
-
-ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
-LIBUNISTRING_CONF_OPTS += --enable-threads=posix
-else
-LIBUNISTRING_CONF_OPTS += --disable-threads
-endif
+LIBUNISTRING_LICENSE_FILES = COPYING COPYING.LIB
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.16.2
