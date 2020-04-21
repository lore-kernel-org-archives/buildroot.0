From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Apr 2020 21:35:33 +0200
Subject: [Buildroot] [git commit] package/unionfs: bump to 2.1
Message-ID: <20200421192149.420E68F126@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ae1364528ca6bf6825def54e84d86807bda1c133
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Dropped 0001-include-asm-ioctl.h-for-_IOC_SIZE.patch
 https://github.com/rpodgorny/unionfs-fuse/commit/dea8e4ddbef946b1ff53782dd1669daa44564173#diff-25d902c24283ab8cfbac54dfa101ad31

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-include-asm-ioctl.h-for-_IOC_SIZE.patch   | 26 ----------------------
 package/unionfs/unionfs.hash                       |  3 +--
 package/unionfs/unionfs.mk                         |  2 +-
 3 files changed, 2 insertions(+), 29 deletions(-)

diff --git a/package/unionfs/0001-include-asm-ioctl.h-for-_IOC_SIZE.patch b/package/unionfs/0001-include-asm-ioctl.h-for-_IOC_SIZE.patch
deleted file mode 100644
index f3d8fa15ad..0000000000
--- a/package/unionfs/0001-include-asm-ioctl.h-for-_IOC_SIZE.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From d33635fe940ff898e026d3fb77446e52f8f2bd3f Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Thu, 16 Feb 2017 14:59:30 -0300
-Subject: [PATCH] include asm/ioctl.h for _IOC_SIZE
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
- src/unionfs.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/unionfs.c b/src/unionfs.c
-index 5aed5ce..f6cd368 100644
---- a/src/unionfs.c
-+++ b/src/unionfs.c
-@@ -32,7 +32,7 @@
- #include <sys/types.h>
- #include <sys/time.h>
- #include <inttypes.h>
--#include <sys/ioctl.h>
-+#include <asm/ioctl.h>
- 
- #ifdef linux
- 	#include <sys/vfs.h>
--- 
-2.10.2
-
diff --git a/package/unionfs/unionfs.hash b/package/unionfs/unionfs.hash
index f4310b023d..7c4a9f4ffb 100644
--- a/package/unionfs/unionfs.hash
+++ b/package/unionfs/unionfs.hash
@@ -1,4 +1,3 @@
 # Locally computed
-sha256  f24d7dd64c678cefacbebf2727b61e3127b8ecb6bb9176d7117dd31503455643  unionfs-2.0.tar.gz
-sha256  976ca25b7706911f1a6e981c0fd236b607f497aa0b23d407825b0aad41f7c896  0001-include-asm-ioctl.h-for-_IOC_SIZE.patch
 sha256  f56a5579d670e18e0667700bc599acbc0b8217ca1f76b2adb3dad7d2953c4049  LICENSE
+sha256  c705072a33a18cbc73ffe799331d43410b6deef5d6f2042038f8fd3ab17b6e2e  unionfs-2.1.tar.gz
diff --git a/package/unionfs/unionfs.mk b/package/unionfs/unionfs.mk
index e8b295335d..12cd368fe3 100644
--- a/package/unionfs/unionfs.mk
+++ b/package/unionfs/unionfs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UNIONFS_VERSION = 2.0
+UNIONFS_VERSION = 2.1
 UNIONFS_SITE = $(call github,rpodgorny,unionfs-fuse,v$(UNIONFS_VERSION))
 UNIONFS_DEPENDENCIES = libfuse host-pkgconf
 UNIONFS_LICENSE = BSD-3-Clause
