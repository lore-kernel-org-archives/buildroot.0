From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 26 Jul 2015 20:55:39 +0200
Subject: [Buildroot] [RFC 29/37] package/libembryo: remove package
In-Reply-To: <1437936947-17632-1-git-send-email-romain.naour@openwide.fr>
References: <1437936947-17632-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1437936947-17632-30-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Libembryo is now available in efl package.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 Config.in.legacy               |  7 +++++++
 package/Config.in              |  1 -
 package/libembryo/Config.in    | 14 --------------
 package/libembryo/libembryo.mk | 18 ------------------
 4 files changed, 7 insertions(+), 33 deletions(-)
 delete mode 100644 package/libembryo/Config.in
 delete mode 100644 package/libembryo/libembryo.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 0afbc27..f5c012f 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -107,6 +107,13 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2015.08"
 
+config BR2_PACKAGE_LIBEMBRYO
+	bool "libembryo package has been removed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_EFL
+	help
+	  The libembryo package has been removed with the efl bump to 1.14.
+
 config BR2_PACKAGE_LIBEDJE
 	bool "libedje package has been removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 7428d6a..9f98fc7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -249,7 +249,6 @@ endif
 	source "package/libeio/Config.in"
 	source "package/libedbus/Config.in"
 	source "package/libelementary/Config.in"
-	source "package/libembryo/Config.in"
 	source "package/libevas/Config.in"
 	source "package/libevas-generic-loaders/Config.in"
 	source "package/linux-fusion/Config.in"
diff --git a/package/libembryo/Config.in b/package/libembryo/Config.in
deleted file mode 100644
index 937876f..0000000
--- a/package/libembryo/Config.in
+++ /dev/null
@@ -1,14 +0,0 @@
-config BR2_PACKAGE_LIBEMBRYO
-	bool "libembryo"
-	select BR2_PACKAGE_LIBEINA
-	depends on BR2_USE_MMU # efl
-	depends on BR2_USE_WCHAR # efl
-	help
-	  Embryo is primarily a shared library that gives you an API
-	  to load and control interpreted programs compiled into an
-	  abstract machine bytecode that it understands.
-
-	  http://trac.enlightenment.org/e/wiki/Embryo
-
-comment "libembryo needs a toolchain w/ wchar"
-	depends on !BR2_USE_WCHAR
diff --git a/package/libembryo/libembryo.mk b/package/libembryo/libembryo.mk
deleted file mode 100644
index fc45e42..0000000
--- a/package/libembryo/libembryo.mk
+++ /dev/null
@@ -1,18 +0,0 @@
-################################################################################
-#
-# libembryo
-#
-################################################################################
-
-LIBEMBRYO_VERSION = 1.7.10
-LIBEMBRYO_SOURCE = embryo-$(LIBEMBRYO_VERSION).tar.bz2
-LIBEMBRYO_SITE = http://download.enlightenment.org/releases
-LIBEMBRYO_LICENSE = BSD-2c, Embryo license
-LIBEMBRYO_LICENSE_FILES = COPYING
-
-LIBEMBRYO_INSTALL_STAGING = YES
-
-LIBEMBRYO_DEPENDENCIES = host-pkgconf libeina
-
-$(eval $(autotools-package))
-$(eval $(host-autotools-package))
-- 
2.4.3
