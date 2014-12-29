From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 29 Dec 2014 15:58:28 +0100
Subject: [Buildroot] [git commit] gdb: bump to 7.8.1
Message-ID: <20141229150127.4FD19807AA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=af72ee80eb7dfb6c64831ddccc603cefaebb6df2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit bumps to 7.8.1, and updates the logic to use .tar.xz
tarballs so that it applies to all 7.8.x versions.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gdb/Config.in.host |    2 +-
 package/gdb/gdb.mk         |    4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 1e20cd2..e8402b7 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -55,4 +55,4 @@ config BR2_GDB_VERSION
 	default "arc-2014.08-gdb" if BR2_arc
 	default "6be65fb56ea6694a9260733a536a023a1e2d4d57" if BR2_microblaze
 	default "7.7.1"    if BR2_GDB_VERSION_7_7 || !BR2_PACKAGE_HOST_GDB
-	default "7.8"	   if BR2_GDB_VERSION_7_8
+	default "7.8.1"	   if BR2_GDB_VERSION_7_8
diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index aa22193..24084b8 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -23,7 +23,9 @@ ifeq ($(GDB_VERSION),6.7.1-avr32-2.1.5)
 GDB_SITE = ftp://www.at91.com/pub/buildroot
 endif
 
-ifeq ($(GDB_VERSION),7.8)
+# Starting from 7.8.x, bz2 tarballs no longer available, use .tar.xz
+# instead.
+ifneq ($(filter 7.8.%,$(GDB_VERSION)),)
 GDB_SOURCE = gdb-$(GDB_VERSION).tar.xz
 endif
 
