From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 26 Jul 2015 20:55:46 +0200
Subject: [Buildroot] [RFC 36/37] package/libeina: remove package
In-Reply-To: <1437936947-17632-1-git-send-email-romain.naour@openwide.fr>
References: <1437936947-17632-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1437936947-17632-37-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Libeina is now available in efl package.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 Config.in.legacy           |  7 +++++++
 package/Config.in          |  1 -
 package/libeina/Config.in  | 12 ------------
 package/libeina/libeina.mk | 18 ------------------
 4 files changed, 7 insertions(+), 31 deletions(-)
 delete mode 100644 package/libeina/Config.in
 delete mode 100644 package/libeina/libeina.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index ee70260..f354b83 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -107,6 +107,13 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2015.08"
 
+config BR2_PACKAGE_LIBEINA
+	bool "libeina package has been removed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_EFL
+	help
+	  The libeina package has been removed with the efl bump to 1.14.
+
 config BR2_PACKAGE_LIBEET
 	bool "libeet package has been removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 167f710..15c5196 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -242,7 +242,6 @@ endif
 	source "package/fbv/Config.in"
 	source "package/freerdp/Config.in"
 	source "package/imagemagick/Config.in"
-	source "package/libeina/Config.in"
 	source "package/libelementary/Config.in"
 	source "package/libevas-generic-loaders/Config.in"
 	source "package/linux-fusion/Config.in"
diff --git a/package/libeina/Config.in b/package/libeina/Config.in
deleted file mode 100644
index 13a74eb..0000000
--- a/package/libeina/Config.in
+++ /dev/null
@@ -1,12 +0,0 @@
-config BR2_PACKAGE_LIBEINA
-	bool "libeina"
-	depends on BR2_USE_MMU # efl
-	depends on BR2_USE_WCHAR # efl
-	
-	help
-	  Eina is a tiny library to handle data types (list, hash, etc.)
-
-	  http://trac.enlightenment.org/e/wiki/Eina
-
-comment "libeina needs a toolchain w/ wchar"
-	depends on !BR2_USE_WCHAR
diff --git a/package/libeina/libeina.mk b/package/libeina/libeina.mk
deleted file mode 100644
index ae9f1c6..0000000
--- a/package/libeina/libeina.mk
+++ /dev/null
@@ -1,18 +0,0 @@
-################################################################################
-#
-# libeina
-#
-################################################################################
-
-LIBEINA_VERSION = 1.7.10
-LIBEINA_SOURCE = eina-$(LIBEINA_VERSION).tar.bz2
-LIBEINA_SITE = http://download.enlightenment.org/releases
-LIBEINA_LICENSE = LGPLv2.1+
-LIBEINA_LICENSE_FILES = COPYING
-
-LIBEINA_INSTALL_STAGING = YES
-
-LIBEINA_DEPENDENCIES = host-pkgconf
-
-$(eval $(autotools-package))
-$(eval $(host-autotools-package))
-- 
2.4.3
