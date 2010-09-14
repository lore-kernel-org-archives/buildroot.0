From: Martin Banky <martin.banky@gmail.com>
Date: Mon, 13 Sep 2010 20:40:36 -0700
Subject: [Buildroot] [PATCH 09/21] gmp: bump to 5.0.1
In-Reply-To: <1284435648-15238-1-git-send-email-Martin.Banky@gmail.com>
References: <1284435648-15238-1-git-send-email-Martin.Banky@gmail.com>
Message-ID: <1284435648-15238-9-git-send-email-Martin.Banky@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
---
 CHANGES               |    2 +-
 package/gmp/Config.in |    2 +-
 package/gmp/gmp.mk    |    6 +++---
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/CHANGES b/CHANGES
index 94a86e8..2185758 100644
--- a/CHANGES
+++ b/CHANGES
@@ -9,7 +9,7 @@
 
 	Updated/fixed packages: alsa-lib, alsa-utils, autoconf, automake,
 	berkeleydb, bison, busybox, ccache, dropbear, fakeroot, genext2fs,
-	iptables, kismet, openvpn, qt, usbutils
+	gmp, iptables, kismet, openvpn, qt, usbutils
 
 	Removed packages: dillo, libglib12, libgtk12, microwin, pcmcia
 
diff --git a/package/gmp/Config.in b/package/gmp/Config.in
index 74596f8..9520506 100644
--- a/package/gmp/Config.in
+++ b/package/gmp/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_LIBGMP
 	help
 	  GNU Multiple Precision Arithmetic Library.
 
-	  http://www.swox.com/gmp/
+	  http://gmplib.org/
 
 
 config BR2_PACKAGE_LIBGMP_HEADERS
diff --git a/package/gmp/gmp.mk b/package/gmp/gmp.mk
index a3488b8..4efd88b 100644
--- a/package/gmp/gmp.mk
+++ b/package/gmp/gmp.mk
@@ -3,7 +3,7 @@
 # gmp
 #
 #############################################################
-GMP_VERSION:=4.2.4
+GMP_VERSION:=5.0.1
 GMP_SOURCE:=gmp-$(GMP_VERSION).tar.bz2
 GMP_SITE:=$(BR2_GNU_MIRROR)/gmp
 GMP_CAT:=$(BZCAT)
@@ -11,7 +11,7 @@ GMP_DIR:=$(TOOLCHAIN_DIR)/gmp-$(GMP_VERSION)
 GMP_TARGET_DIR:=$(BUILD_DIR)/gmp-$(GMP_VERSION)
 GMP_BINARY:=libgmp$(LIBTGTEXT)
 GMP_HOST_BINARY:=libgmp$(HOST_LIBEXT)
-GMP_LIBVERSION:=3.4.4
+GMP_LIBVERSION:=10.0.1
 
 # this is a workaround for a bug in GMP, please see
 # http://gmplib.org/list-archives/gmp-devel/2006-April/000618.html
@@ -32,7 +32,7 @@ $(GMP_DIR)/.unpacked: $(DL_DIR)/$(GMP_SOURCE)
 
 $(GMP_TARGET_DIR)/.configured: $(GMP_DIR)/.unpacked
 	mkdir -p $(GMP_TARGET_DIR)
-	(cd $(GMP_TARGET_DIR); rm -rf config.cache; \
+	(cd $(GMP_TARGET_DIR); rm -rf config.cache; cp $(GMP_DIR)/longlong.h $(GMP_DIR)/gmp-impl.h ./; \
 		$(TARGET_CONFIGURE_OPTS) \
 		$(TARGET_CONFIGURE_ARGS) \
 		$(GMP_CPP_FLAGS) \
-- 
1.7.2.3
