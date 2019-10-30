From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Wed, 30 Oct 2019 13:45:40 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/rauc: bump to v1.2
Message-ID: <20191030124540.220285-1-titouan.christophe@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
---
Changes v1 -> v2: dbus is now a compile time dependency
---
 package/rauc/Config.in | 2 +-
 package/rauc/rauc.hash | 4 ++--
 package/rauc/rauc.mk   | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/rauc/Config.in b/package/rauc/Config.in
index 456f8f382c..4a1516a595 100644
--- a/package/rauc/Config.in
+++ b/package/rauc/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_RAUC
 	depends on BR2_USE_WCHAR # glib2
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_OPENSSL
-	select BR2_PACKAGE_DBUS # run-time dependency
+	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_SQUASHFS # run-time dependency
 	help
 	  RAUC is the Robust Auto-Update Controller developed by
diff --git a/package/rauc/rauc.hash b/package/rauc/rauc.hash
index ad4f74409e..54760347c7 100644
--- a/package/rauc/rauc.hash
+++ b/package/rauc/rauc.hash
@@ -1,4 +1,4 @@
 # Locally calculated, after verifying against
-# https://github.com/rauc/rauc/releases/download/v1.1/rauc-1.1.tar.xz.asc
-sha256 e49086da3a72564806963d2309e8e2b255492fb314db61f84c9b4cebece98e3f rauc-1.1.tar.xz
+# https://github.com/rauc/rauc/releases/download/v1.2/rauc-1.2.tar.xz.asc
+sha256 224683fc1fac50ccb89128aa786445cd8e26bb25deafd4410e0807187376e661 rauc-1.2.tar.xz
 sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551 COPYING
diff --git a/package/rauc/rauc.mk b/package/rauc/rauc.mk
index 88a1006bc0..451d3c898b 100644
--- a/package/rauc/rauc.mk
+++ b/package/rauc/rauc.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-RAUC_VERSION = 1.1
+RAUC_VERSION = 1.2
 RAUC_SITE = https://github.com/rauc/rauc/releases/download/v$(RAUC_VERSION)
 RAUC_SOURCE = rauc-$(RAUC_VERSION).tar.xz
 RAUC_LICENSE = LGPL-2.1
 RAUC_LICENSE_FILES = COPYING
-RAUC_DEPENDENCIES = host-pkgconf openssl libglib2
+RAUC_DEPENDENCIES = host-pkgconf openssl libglib2 dbus
 
 ifeq ($(BR2_PACKAGE_RAUC_NETWORK),y)
 RAUC_CONF_OPTS += --enable-network
-- 
2.21.0
