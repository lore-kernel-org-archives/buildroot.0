From: Romain Naour <romain.naour@openwide.fr>
Date: Mon,  7 Dec 2015 22:29:27 +0100
Subject: [Buildroot] [PATCH v7 25/33] package/efl/libembryo: remove package
In-Reply-To: <1449523775-6582-1-git-send-email-romain.naour@openwide.fr>
References: <1449523775-6582-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1449523775-6582-26-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Libembryo is now available in efl package.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
v6: Improve lecacy help text (Yann E.Morin)
v5: remove libembryo directory
v4: update Config.in to use libefl
v3: update legacy option for 2015.11
    update help text
---
 Config.in.legacy                   |  7 +++++++
 package/efl/Config.in              |  1 -
 package/efl/libembryo/Config.in    |  9 ---------
 package/efl/libembryo/libembryo.mk | 18 ------------------
 4 files changed, 7 insertions(+), 28 deletions(-)
 delete mode 100644 package/efl/libembryo/Config.in
 delete mode 100644 package/efl/libembryo/libembryo.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index da7e690..c161687 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -107,6 +107,13 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2016.02"
 
+config BR2_PACKAGE_LIBEMBRYO
+	bool "libembryo package has been removed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_EFL
+	help
+	  With EFL 1.15, libembryo is now provided by the libefl package.
+
 config BR2_PACKAGE_LIBEDJE
 	bool "libedje package has been removed"
 	select BR2_LEGACY
diff --git a/package/efl/Config.in b/package/efl/Config.in
index 417534c..2f6d94d 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -22,7 +22,6 @@ source "package/efl/libefl/Config.in"
 source "package/efl/libefreet/Config.in"
 source "package/efl/libeio/Config.in"
 source "package/efl/libevas/Config.in"
-source "package/efl/libembryo/Config.in"
 source "package/efl/libelementary/Config.in"
 source "package/efl/libedbus/Config.in"
 
diff --git a/package/efl/libembryo/Config.in b/package/efl/libembryo/Config.in
deleted file mode 100644
index 63c7064..0000000
--- a/package/efl/libembryo/Config.in
+++ /dev/null
@@ -1,9 +0,0 @@
-config BR2_PACKAGE_LIBEMBRYO
-	bool "libembryo"
-	select BR2_PACKAGE_LIBEINA
-	help
-	  Embryo is primarily a shared library that gives you an API
-	  to load and control interpreted programs compiled into an
-	  abstract machine bytecode that it understands.
-
-	  http://trac.enlightenment.org/e/wiki/Embryo
diff --git a/package/efl/libembryo/libembryo.mk b/package/efl/libembryo/libembryo.mk
deleted file mode 100644
index fc45e42..0000000
--- a/package/efl/libembryo/libembryo.mk
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
