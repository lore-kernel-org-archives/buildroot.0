From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 2 Apr 2018 10:26:02 +0200
Subject: [Buildroot] [git commit] iqvlinux: bump to version 1.2.0.3
Message-ID: <20180402085924.D6898838E0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c5d4c907aff95334f3a073f3fbac65b91ffc5f26
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package is really annoying since the archive name doesn't contain
the version (iqvlinux.tar.gz), so we have added an
iqvlinux-1.2.0.3.tar.gz tarball on sources.buildroot.net. The package
will try to download iqvlinux-1.2.0.3.tar.gz from the upstream
sourceforge location, which will fail, and then fallback to the backup
mirror, where it will successfully find iqvlinux-1.2.0.3.tar.gz.

Also add hashes for license files.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
[Thomas: don't add custom logic for download, use
iqvlinux-1.2.0.3.tar.gz, which is hosted on sources.buildroot.net.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/iqvlinux/Config.in     |  2 +-
 package/iqvlinux/iqvlinux.hash |  9 +++++----
 package/iqvlinux/iqvlinux.mk   | 10 +++++++---
 3 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/package/iqvlinux/Config.in b/package/iqvlinux/Config.in
index 8959955745..09502d141e 100644
--- a/package/iqvlinux/Config.in
+++ b/package/iqvlinux/Config.in
@@ -12,7 +12,7 @@ config BR2_PACKAGE_IQVLINUX
 	  Note: This driver requires PCI support to be enabled
 	  (i.e. CONFIG_PCI).
 
-	  http://sourceforge.net/projects/e1000/files/iqvlinux/
+	  https://sourceforge.net/projects/e1000/files/iqvlinux/
 
 comment "iqvlinux needs a Linux kernel to be built"
 	depends on !BR2_LINUX_KERNEL
diff --git a/package/iqvlinux/iqvlinux.hash b/package/iqvlinux/iqvlinux.hash
index ddf57b712c..20d612ddc5 100644
--- a/package/iqvlinux/iqvlinux.hash
+++ b/package/iqvlinux/iqvlinux.hash
@@ -1,5 +1,6 @@
-# From http://sourceforge.net/projects/e1000/files/iqvlinux/1.1.5.3/
-sha1	bd94416e4364015dbbd78a22e51080bf7ea81fac	iqvlinux.tar.gz
-md5	fb6a2a4dc122d39070fcb06985c97a05	iqvlinux.tar.gz
 # locally computed
-sha256	8cb19f3bfe040100a13bb2d05cb2b54f2b259e55cef23f8cc5aa6f2f31e98bec	iqvlinux.tar.gz
+sha256	4020a661940ba6d50f24654b90a41280eb8eccf00061fe6d105c654d3d97d551  iqvlinux-1.2.0.3.tar.gz
+sha256	386086e232db4708770f717595d4f83188f776aa6e7313cd12fb039e869f494b  COPYING
+sha256	beded926a8f18aad5d911daf581759e2b25697588034d2b29033ae1a929506ff  src/linux/driver/files.txt
+sha256	ecf93b9b739fc82f7b87b34f8c6411dfdd271234af2fe45212293d9df2b654b3  inc/linux/files.txt
+sha256	0a309350c1b32be72479e8fe08f7f6bbbad2e8c3d9a1cbcad3d482ea48a236ad  inc/files.txt
diff --git a/package/iqvlinux/iqvlinux.mk b/package/iqvlinux/iqvlinux.mk
index 165c7c4687..d6d445e666 100644
--- a/package/iqvlinux/iqvlinux.mk
+++ b/package/iqvlinux/iqvlinux.mk
@@ -4,9 +4,13 @@
 #
 ################################################################################
 
-IQVLINUX_VERSION = 1.1.5.3
-IQVLINUX_SITE = http://sourceforge.net/projects/e1000/files/iqvlinux/$(IQVLINUX_VERSION)
-IQVLINUX_SOURCE = iqvlinux.tar.gz
+# The upstream tarball is just named iqvlinux.tar.gz, which we cannot
+# use because it doesn't contain a version number. Therefore, the
+# download from the upstream site will fail, and fallback to the
+# backup mirror, where we have added an iqvlinux-1.2.0.3.tar.gz
+# tarball.
+IQVLINUX_VERSION = 1.2.0.3
+IQVLINUX_SITE = https://downloads.sourceforge.net/project/e1000/iqvlinux/$(IQVLINUX_VERSION)
 
 IQVLINUX_LICENSE = GPL-2.0, BSD-3-Clause
 IQVLINUX_LICENSE_FILES = \
