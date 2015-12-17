From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Dec 2015 23:56:31 +0100
Subject: [Buildroot] [git commit] package/libevas-generic-loaders: bump to
	version 1.15.0
Message-ID: <20151217230816.4B5A5803E2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=98d58b7c282bd3283f57b840554a81d2df93e53c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use the newly added libefl package wich provide a new version
of libeina.

Also, update the upstream url and add a hash file.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libevas-generic-loaders/Config.in                    |  3 +--
 package/libevas-generic-loaders/libevas-generic-loaders.hash |  2 ++
 package/libevas-generic-loaders/libevas-generic-loaders.mk   | 10 ++++++----
 3 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/package/libevas-generic-loaders/Config.in b/package/libevas-generic-loaders/Config.in
index f42f8a6..65ced8a 100644
--- a/package/libevas-generic-loaders/Config.in
+++ b/package/libevas-generic-loaders/Config.in
@@ -1,14 +1,13 @@
 config BR2_PACKAGE_LIBEVAS_GENERIC_LOADERS
 	bool "libevas generic loaders"
 	depends on BR2_PACKAGE_EFL
-	select BR2_PACKAGE_LIBEINA
 	select BR2_PACKAGE_ZLIB
 	help
 	  These are additional "generic" loaders for Evas that are
 	  stand-alone executables that evas may run from its generic
 	  loader module.
 
-	  http://trac.enlightenment.org/e/wiki/Evas_Generic_Loaders
+	  https://www.enlightenment.org/
 
 if BR2_PACKAGE_LIBEVAS_GENERIC_LOADERS
 
diff --git a/package/libevas-generic-loaders/libevas-generic-loaders.hash b/package/libevas-generic-loaders/libevas-generic-loaders.hash
new file mode 100644
index 0000000..32723ba
--- /dev/null
+++ b/package/libevas-generic-loaders/libevas-generic-loaders.hash
@@ -0,0 +1,2 @@
+# From https://download.enlightenment.org/rel/libs/evas_generic_loaders/evas_generic_loaders-1.15.0.tar.xz.sha256
+sha256	1e539e4d4d4e1590345caeb7fdd84f47ec7cd63bb76b6b7107a87420a401fd7f	evas_generic_loaders-1.15.0.tar.xz
diff --git a/package/libevas-generic-loaders/libevas-generic-loaders.mk b/package/libevas-generic-loaders/libevas-generic-loaders.mk
index ac6b1cc..47dfa9a 100644
--- a/package/libevas-generic-loaders/libevas-generic-loaders.mk
+++ b/package/libevas-generic-loaders/libevas-generic-loaders.mk
@@ -4,17 +4,19 @@
 #
 ################################################################################
 
-LIBEVAS_GENERIC_LOADERS_VERSION = 1.7.10
-LIBEVAS_GENERIC_LOADERS_SOURCE = evas_generic_loaders-$(LIBEVAS_GENERIC_LOADERS_VERSION).tar.bz2
-LIBEVAS_GENERIC_LOADERS_SITE = http://download.enlightenment.org/releases
+LIBEVAS_GENERIC_LOADERS_VERSION = 1.15.0
+LIBEVAS_GENERIC_LOADERS_SOURCE = evas_generic_loaders-$(LIBEVAS_GENERIC_LOADERS_VERSION).tar.xz
+LIBEVAS_GENERIC_LOADERS_SITE = http://download.enlightenment.org/rel/libs/evas_generic_loaders
 LIBEVAS_GENERIC_LOADERS_LICENSE = GPLv2
 LIBEVAS_GENERIC_LOADERS_LICENSE_FILES = COPYING
 
 LIBEVAS_GENERIC_LOADERS_INSTALL_STAGING = YES
 
-LIBEVAS_GENERIC_LOADERS_DEPENDENCIES = libeina zlib
+LIBEVAS_GENERIC_LOADERS_DEPENDENCIES = host-pkgconf libefl zlib
 
 # For now, we only support the SVG loader
+# poppler >= 0.32 is not supported by the current version of
+# libevas-generic-loaders.
 LIBEVAS_GENERIC_LOADERS_CONF_OPTS += \
 	--disable-poppler \
 	--disable-spectre \
