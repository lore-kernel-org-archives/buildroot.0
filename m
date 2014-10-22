From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Oct 2014 22:38:18 +0200
Subject: [Buildroot] [git commit] package/upmpdcli: bump to version 0.8.5
Message-ID: <20141022204021.CFF38B0644@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=483a6ff2dc64861966a08cb0f3d57a4c462e6ae3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: J??rg Krause <jkrause@posteo.de>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/upmpdcli/Config.in   |    8 +++-----
 package/upmpdcli/upmpdcli.mk |    6 +++---
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/upmpdcli/Config.in b/package/upmpdcli/Config.in
index f28c775..84649d2 100644
--- a/package/upmpdcli/Config.in
+++ b/package/upmpdcli/Config.in
@@ -1,12 +1,10 @@
 config BR2_PACKAGE_UPMPDCLI
 	bool "upmpdcli"
-	select BR2_PACKAGE_EXPAT
-	select BR2_PACKAGE_LIBCURL
-	select BR2_PACKAGE_LIBUPNP
 	select BR2_PACKAGE_LIBMPDCLIENT
+	select BR2_PACKAGE_LIBUPNPP
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_LARGEFILE # libupnp
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libupnp
+	depends on BR2_LARGEFILE # libupnpp -> libupnp
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libupnpp -> libupnp
 	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1 # Too old gcc
 	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1 # Ditto
 	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2 # Ditto
diff --git a/package/upmpdcli/upmpdcli.mk b/package/upmpdcli/upmpdcli.mk
index 547752a..a90e8bd 100644
--- a/package/upmpdcli/upmpdcli.mk
+++ b/package/upmpdcli/upmpdcli.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-UPMPDCLI_VERSION = 0.8.3
+UPMPDCLI_VERSION = 0.8.5
 UPMPDCLI_SITE = http://www.lesbonscomptes.com/upmpdcli/downloads
 UPMPDCLI_LICENSE = GPLv2+
 UPMPDCLI_LICENSE_FILES = COPYING
-UPMPDCLI_DEPENDENCIES = expat libcurl libupnp libmpdclient
+UPMPDCLI_DEPENDENCIES = libmpdclient libupnpp
 
 # Upmpdcli only runs if user upmpdcli exists
 define UPMPDCLI_USERS
@@ -20,7 +20,7 @@ define UPMPDCLI_INSTALL_INIT_SYSV
 endef
 
 define UPMPDCLI_INSTALL_CONF_FILE
-	$(INSTALL) -D -m 0755 $(@D)/upmpd/upmpdcli.conf $(TARGET_DIR)/etc/upmpdcli.conf
+	$(INSTALL) -D -m 0755 $(@D)/src/upmpdcli.conf $(TARGET_DIR)/etc/upmpdcli.conf
 endef
 
 UPMPDCLI_POST_INSTALL_TARGET_HOOKS += UPMPDCLI_INSTALL_CONF_FILE
