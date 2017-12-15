From: Carlos Santos <casantos@datacom.ind.br>
Date: Fri, 15 Dec 2017 11:47:59 -0200
Subject: [Buildroot] [PATCH 1/2] iqvlinux: bump to version 1.2.0.3
Message-ID: <20171215134800.29328-1-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add hashes for license files.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
 package/iqvlinux/Config.in     | 9 ++++++---
 package/iqvlinux/iqvlinux.hash | 9 +++++----
 package/iqvlinux/iqvlinux.mk   | 7 ++++---
 3 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/package/iqvlinux/Config.in b/package/iqvlinux/Config.in
index 8959955745..73804ac02a 100644
--- a/package/iqvlinux/Config.in
+++ b/package/iqvlinux/Config.in
@@ -2,8 +2,11 @@ config BR2_PACKAGE_IQVLINUX
 	bool "iqvlinux"
 	depends on BR2_LINUX_KERNEL
 	help
-	  Intel Ethernet Adapter Debug Driver for Linux (iqvlinux),
-	  which supports kernel versions 2.6.x up through 4.0.x.
+	  Intel Ethernet Adapter Debug Driver for Linux (iqvlinux).
+
+	  Officially supports kernel versions 2.6.x up through 4.0.x but
+	  the Buildroot package contains a patch to allow it to be built
+	  on newer kernel versions.
 
 	  This debug driver supports all Intel's networking Tools based
 	  on the SDK version 2.19.36.0 or higher which support Intel
@@ -12,7 +15,7 @@ config BR2_PACKAGE_IQVLINUX
 	  Note: This driver requires PCI support to be enabled
 	  (i.e. CONFIG_PCI).
 
-	  http://sourceforge.net/projects/e1000/files/iqvlinux/
+	  https://sourceforge.net/projects/e1000/files/iqvlinux/
 
 comment "iqvlinux needs a Linux kernel to be built"
 	depends on !BR2_LINUX_KERNEL
diff --git a/package/iqvlinux/iqvlinux.hash b/package/iqvlinux/iqvlinux.hash
index ddf57b712c..11195f1d71 100644
--- a/package/iqvlinux/iqvlinux.hash
+++ b/package/iqvlinux/iqvlinux.hash
@@ -1,5 +1,6 @@
-# From http://sourceforge.net/projects/e1000/files/iqvlinux/1.1.5.3/
-sha1	bd94416e4364015dbbd78a22e51080bf7ea81fac	iqvlinux.tar.gz
-md5	fb6a2a4dc122d39070fcb06985c97a05	iqvlinux.tar.gz
 # locally computed
-sha256	8cb19f3bfe040100a13bb2d05cb2b54f2b259e55cef23f8cc5aa6f2f31e98bec	iqvlinux.tar.gz
+sha256	4020a661940ba6d50f24654b90a41280eb8eccf00061fe6d105c654d3d97d551  iqvlinux.tar.gz
+sha256	386086e232db4708770f717595d4f83188f776aa6e7313cd12fb039e869f494b  COPYING
+sha256	beded926a8f18aad5d911daf581759e2b25697588034d2b29033ae1a929506ff  src/linux/driver/files.txt
+sha256	ecf93b9b739fc82f7b87b34f8c6411dfdd271234af2fe45212293d9df2b654b3  inc/linux/files.txt
+sha256	0a309350c1b32be72479e8fe08f7f6bbbad2e8c3d9a1cbcad3d482ea48a236ad  inc/files.txt
diff --git a/package/iqvlinux/iqvlinux.mk b/package/iqvlinux/iqvlinux.mk
index 165c7c4687..abf061f13d 100644
--- a/package/iqvlinux/iqvlinux.mk
+++ b/package/iqvlinux/iqvlinux.mk
@@ -4,13 +4,14 @@
 #
 ################################################################################
 
-IQVLINUX_VERSION = 1.1.5.3
-IQVLINUX_SITE = http://sourceforge.net/projects/e1000/files/iqvlinux/$(IQVLINUX_VERSION)
+IQVLINUX_VERSION = 1.2.0.3
+IQVLINUX_SITE = https://downloads.sourceforge.net/project/e1000/iqvlinux/$(IQVLINUX_VERSION)
 IQVLINUX_SOURCE = iqvlinux.tar.gz
 
 IQVLINUX_LICENSE = GPL-2.0, BSD-3-Clause
 IQVLINUX_LICENSE_FILES = \
-	COPYING src/linux/driver/files.txt \
+	COPYING \
+	src/linux/driver/files.txt \
 	inc/linux/files.txt inc/files.txt
 
 IQVLINUX_MODULE_MAKE_OPTS = NALDIR=$(@D) KSRC=$(LINUX_DIR) CC=$(TARGET_CC)
-- 
2.14.3
