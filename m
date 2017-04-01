From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Apr 2017 14:45:26 +0200
Subject: [Buildroot] [git commit] xorriso: bump version to 1.4.6
Message-ID: <20170401124652.745318257D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=11359c5e3bfd2f4fc436c2d57c6c34768f108ff8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patch 0001-fix-musl-build is removed, as it has been applied upstream.

Signed-off-by: Beno??t Allard <benoit.allard@greenbone.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/xorriso/0001-fix-musl-build.patch | 20 --------------------
 package/xorriso/xorriso.hash              |  2 +-
 package/xorriso/xorriso.mk                |  2 +-
 3 files changed, 2 insertions(+), 22 deletions(-)

diff --git a/package/xorriso/0001-fix-musl-build.patch b/package/xorriso/0001-fix-musl-build.patch
deleted file mode 100644
index 86d251d..0000000
--- a/package/xorriso/0001-fix-musl-build.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Fix musl build
-
-Add missing header needed for ssize_t.
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Patch status: posted upstream
-(http://lists.gnu.org/archive/html/bug-xorriso/2016-05/msg00000.html)
-
-diff -Nuar xorriso-1.4.2-orig/libisofs/aaip_0_2.h xorriso-1.4.2/libisofs/aaip_0_2.h
---- xorriso-1.4.2-orig/libisofs/aaip_0_2.h	2015-11-28 16:41:33.000000000 +0200
-+++ xorriso-1.4.2/libisofs/aaip_0_2.h	2016-05-24 11:40:43.874191174 +0300
-@@ -16,6 +16,7 @@
- #ifndef Aaip_h_is_includeD
- #define Aaip_h_is_includeD yes
- 
-+#include <unistd.h>
- 
- /* --------------------------------- Encoder ---------------------------- */
- 
diff --git a/package/xorriso/xorriso.hash b/package/xorriso/xorriso.hash
index 3c2a726..f1ee9d6 100644
--- a/package/xorriso/xorriso.hash
+++ b/package/xorriso/xorriso.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 2843beded1aa4c678706e96fdf9cc5e4b34430b559bdf5bc35df5202125004b3 xorriso-1.4.2.tar.gz
+sha256 526f728c7eee6f8c4b69fbf391789e6c80806197c2861cf5922cf7cfe1035784 xorriso-1.4.6.tar.gz
diff --git a/package/xorriso/xorriso.mk b/package/xorriso/xorriso.mk
index be19322..cc4c627 100644
--- a/package/xorriso/xorriso.mk
+++ b/package/xorriso/xorriso.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XORRISO_VERSION = 1.4.2
+XORRISO_VERSION = 1.4.6
 XORRISO_SITE = $(BR2_GNU_MIRROR)/xorriso
 XORRISO_LICENSE = GPLv3+
 XORRISO_LICENSE_FILES = COPYING COPYRIGHT
