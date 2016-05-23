From: Damien Lanson <damien@kal-host.com>
Date: Mon, 23 May 2016 18:17:35 +0200
Subject: [Buildroot] [PATCH 1/1] package/dmidecode: bump to version 3.0
Message-ID: <1464020255-13640-1-git-send-email-damien@kal-host.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Damien Lanson <damien@kal-host.com>
---
 package/dmidecode/0001-build-system-fixes.patch |    6 +++---
 package/dmidecode/dmidecode.hash                |    4 ++--
 package/dmidecode/dmidecode.mk                  |    3 ++-
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/dmidecode/0001-build-system-fixes.patch b/package/dmidecode/0001-build-system-fixes.patch
index 275f9df..00897f8 100644
--- a/package/dmidecode/0001-build-system-fixes.patch
+++ b/package/dmidecode/0001-build-system-fixes.patch
@@ -21,10 +21,10 @@ Index: b/Makefile
 +override CFLAGS  += \
 +	-W -Wall -Wshadow -Wstrict-prototypes -Wpointer-arith -Wcast-qual \
 +        -Wcast-align -Wwrite-strings -Wmissing-prototypes -Winline -Wundef
- #CFLAGS += -DBIGENDIAN
- #CFLAGS += -DALIGNMENT_WORKAROUND
  
-@@ -23,7 +24,7 @@
+ # Let lseek and mmap support 64-bit wide offsets
+ CFLAGS += -D_FILE_OFFSET_BITS=64
+@@ -27,7 +28,7 @@ CFLAGS += -O2
  #CFLAGS += -g
  
  # Pass linker flags here
diff --git a/package/dmidecode/dmidecode.hash b/package/dmidecode/dmidecode.hash
index 7098ed0..307c306 100644
--- a/package/dmidecode/dmidecode.hash
+++ b/package/dmidecode/dmidecode.hash
@@ -1,2 +1,2 @@
-# Locally calculated after checking pgp signature
-sha256	5a8214b99c1762f4510bd92baa279336e5fed6e5cd2e418d46d95a4ecc783922	dmidecode-2.12.tar.gz
+# http://http.debian.net/debian/pool/main/d/dmidecode/dmidecode_3.0-2.dsc
+sha256	7ec35bb193729c1d593a1460b59d82d24b89102ab23fd0416e6cf4325d077e45	dmidecode-3.0.tar.xz
diff --git a/package/dmidecode/dmidecode.mk b/package/dmidecode/dmidecode.mk
index 06ac19b..4298d88 100644
--- a/package/dmidecode/dmidecode.mk
+++ b/package/dmidecode/dmidecode.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-DMIDECODE_VERSION = 2.12
+DMIDECODE_VERSION = 3.0
+DMIDECODE_SOURCE = dmidecode-$(DMIDECODE_VERSION).tar.xz
 DMIDECODE_SITE = http://download.savannah.gnu.org/releases/dmidecode
 DMIDECODE_LICENSE = GPLv2+
 DMIDECODE_LICENSE_FILES = LICENSE
-- 
1.7.10.4
