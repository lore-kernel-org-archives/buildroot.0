From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 26 Jul 2015 20:55:41 +0200
Subject: [Buildroot] [RFC 31/37] package/libefreet: remove package
In-Reply-To: <1437936947-17632-1-git-send-email-romain.naour@openwide.fr>
References: <1437936947-17632-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1437936947-17632-32-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Libefreet is now available in efl package.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 Config.in.legacy               |  7 +++++++
 package/Config.in              |  1 -
 package/libefreet/Config.in    | 15 ---------------
 package/libefreet/libefreet.mk | 17 -----------------
 4 files changed, 7 insertions(+), 33 deletions(-)
 delete mode 100644 package/libefreet/Config.in
 delete mode 100644 package/libefreet/libefreet.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index f623a5c..28e5e20 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -107,6 +107,13 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2015.08"
 
+config BR2_PACKAGE_LIBEFREET
+	bool "libefreet package has been removed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_EFL
+	help
+	  The libefreet package has been removed with the efl bump to 1.14.
+
 config BR2_PACKAGE_LIBEIO
 	bool "libeio package has been removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 308c05f..622eae0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -244,7 +244,6 @@ endif
 	source "package/imagemagick/Config.in"
 	source "package/libecore/Config.in"
 	source "package/libeet/Config.in"
-	source "package/libefreet/Config.in"
 	source "package/libeina/Config.in"
 	source "package/libedbus/Config.in"
 	source "package/libelementary/Config.in"
diff --git a/package/libefreet/Config.in b/package/libefreet/Config.in
deleted file mode 100644
index 75e5955..0000000
--- a/package/libefreet/Config.in
+++ /dev/null
@@ -1,15 +0,0 @@
-config BR2_PACKAGE_LIBEFREET
-	bool "libefreet"
-	select BR2_PACKAGE_LIBEINA
-	select BR2_PACKAGE_LIBEET
-	select BR2_PACKAGE_LIBECORE
-	depends on BR2_USE_MMU # efl
-	depends on BR2_USE_WCHAR # efl
-	help
-	  Efreet is a library designed to help apps work with several of the
-	  Freedesktop.org standards regarding Icons, Desktop files and Menus.
-
-	  http://trac.enlightenment.org/e/wiki/Efreet
-
-comment "libefreet needs a toolchain w/ wchar"
-	depends on !BR2_USE_WCHAR
diff --git a/package/libefreet/libefreet.mk b/package/libefreet/libefreet.mk
deleted file mode 100644
index 65dbd12..0000000
--- a/package/libefreet/libefreet.mk
+++ /dev/null
@@ -1,17 +0,0 @@
-################################################################################
-#
-# libefreet
-#
-################################################################################
-
-LIBEFREET_VERSION = 1.7.10
-LIBEFREET_SOURCE = efreet-$(LIBEFREET_VERSION).tar.bz2
-LIBEFREET_SITE = http://download.enlightenment.org/releases
-LIBEFREET_LICENSE = BSD-2c
-LIBEFREET_LICENSE_FILES = COPYING
-
-LIBEFREET_INSTALL_STAGING = YES
-
-LIBEFREET_DEPENDENCIES = libeina libeet libecore
-
-$(eval $(autotools-package))
-- 
2.4.3
