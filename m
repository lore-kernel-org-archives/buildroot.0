From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 Sep 2014 22:20:41 +0200
Subject: [Buildroot] [git commit] gdb: add version 7.8
Message-ID: <20140916210715.D3FD49D6BA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=775cffcdc1b999755583cf4e8217a363dbd74c82
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds support for the 7.8 version of gdb. Note that the
tarball of this version is not available as a .tar.bz2, so we have to
add a special case and download the .tar.xz for this version.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gdb/Config.in.host |    4 ++++
 package/gdb/gdb.mk         |    4 ++++
 2 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 10d16b9..f51b5b1 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -39,6 +39,9 @@ choice
 	config BR2_GDB_VERSION_7_7
 		bool "gdb 7.7.x"
 
+	config BR2_GDB_VERSION_7_8
+		bool "gdb 7.8.x"
+
 endchoice
 
 endif
@@ -53,3 +56,4 @@ config BR2_GDB_VERSION
 	default "6be65fb56ea6694a9260733a536a023a1e2d4d57" if BR2_microblaze
 	default "7.6.2"    if BR2_GDB_VERSION_7_6 || !BR2_PACKAGE_HOST_GDB
 	default "7.7.1"    if BR2_GDB_VERSION_7_7 || BR2_powerpc64le
+	default "7.8"	   if BR2_GDB_VERSION_7_8
diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 85b7883..07f6ba3 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -23,6 +23,10 @@ ifeq ($(GDB_VERSION),6.7.1-avr32-2.1.5)
 GDB_SITE = ftp://www.at91.com/pub/buildroot
 endif
 
+ifeq ($(GDB_VERSION),7.8)
+GDB_SOURCE = gdb-$(GDB_VERSION).tar.xz
+endif
+
 GDB_SOURCE ?= gdb-$(GDB_VERSION).tar.bz2
 GDB_LICENSE = GPLv2+ LGPLv2+ GPLv3+ LGPLv3+
 GDB_LICENSE_FILES = COPYING COPYING.LIB COPYING3 COPYING3.LIB
