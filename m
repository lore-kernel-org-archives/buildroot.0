From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Apr 2015 21:41:29 +0200
Subject: [Buildroot] [git commit] pciutils: bump to version 3.3.1
Message-ID: <20150409194213.8B8DD819A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=52a12b7b1e0e98b02d0c6e55424c2f71d73b3ab0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pciutils/pciutils.hash |    2 +-
 package/pciutils/pciutils.mk   |   11 +++++++++--
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/package/pciutils/pciutils.hash b/package/pciutils/pciutils.hash
index 89da715..cc901d1 100644
--- a/package/pciutils/pciutils.hash
+++ b/package/pciutils/pciutils.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/software/utils/pciutils/sha256sums.asc
-sha256	413395d4bdc66fdedd6c993ed9083d1dd73812bf2a679d320f73de35c7801301	pciutils-3.3.0.tar.xz
+sha256	514a3bdb77e4cdbe9e970e1885af46e0ba2011bf97364368c455ade0edd4e3a9	pciutils-3.3.1.tar.xz
diff --git a/package/pciutils/pciutils.mk b/package/pciutils/pciutils.mk
index 5df3a17..1410738 100644
--- a/package/pciutils/pciutils.mk
+++ b/package/pciutils/pciutils.mk
@@ -4,13 +4,20 @@
 #
 ################################################################################
 
-PCIUTILS_VERSION = 3.3.0
+PCIUTILS_VERSION = 3.3.1
 PCIUTILS_SITE = $(BR2_KERNEL_MIRROR)/software/utils/pciutils
 PCIUTILS_SOURCE = pciutils-$(PCIUTILS_VERSION).tar.xz
 PCIUTILS_INSTALL_STAGING = YES
 PCIUTILS_LICENSE = GPLv2+
 PCIUTILS_LICENSE_FILES = COPYING
 
+ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
+PCIUTILS_DEPENDENCIES += udev
+PCIUTILS_MAKE_OPTS += HWDB=yes
+else
+PCIUTILS_MAKE_OPTS += HWDB=no
+endif
+
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 PCIUTILS_ZLIB=yes
 PCIUTILS_DEPENDENCIES += zlib
@@ -33,7 +40,7 @@ else
 PCIUTILS_SHARED=yes
 endif
 
-PCIUTILS_MAKE_OPTS = \
+PCIUTILS_MAKE_OPTS += \
 	CC="$(TARGET_CC)" \
 	HOST="$(KERNEL_ARCH)-linux" \
 	OPT="$(TARGET_CFLAGS)" \
