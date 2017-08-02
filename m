From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Aug 2017 21:39:25 +0200
Subject: [Buildroot] [git commit] cloog: remove package
Message-ID: <20170802193535.46C58821F0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=64fdc8c0ff7d01c98f8fc9c02eae6458ae4f086b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This host-only package was used to enable graphite support in GCC 4.9,
but Buildroot no longer supports Graphite optimizations in GCC 4.9
(only GCC >= 5.x is supported). Therefore, we can remove the cloog
package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS               |  1 -
 package/cloog/cloog.hash |  2 --
 package/cloog/cloog.mk   | 17 -----------------
 3 files changed, 20 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index ece87e2..3ea8944 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1602,7 +1602,6 @@ F:	package/tovid/
 F:	package/xorriso/
 
 N:	Steve Thomas <scjthm@live.com>
-F:	package/cloog/
 F:	package/isl/
 
 N:	Steven Noonan <steven@uplinklabs.net>
diff --git a/package/cloog/cloog.hash b/package/cloog/cloog.hash
deleted file mode 100644
index 7368c9e..0000000
--- a/package/cloog/cloog.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally computed
-sha256	325adf3710ce2229b7eeb9e84d3b539556d093ae860027185e7af8a8b00a750e	cloog-0.18.4.tar.gz
diff --git a/package/cloog/cloog.mk b/package/cloog/cloog.mk
deleted file mode 100644
index a2a1f6b..0000000
--- a/package/cloog/cloog.mk
+++ /dev/null
@@ -1,17 +0,0 @@
-################################################################################
-#
-# cloog
-#
-################################################################################
-
-CLOOG_VERSION = 0.18.4
-CLOOG_SITE = http://www.bastoul.net/cloog/pages/download
-CLOOG_LICENSE = LGPL-2.1+
-HOST_CLOOG_DEPENDENCIES = host-gmp host-isl
-# Our libtool patch doesn't apply, and since this package is only
-# built for the host, we don't really care about it.
-CLOOG_LIBTOOL_PATCH = NO
-
-HOST_CLOOG_CONF_OPTS = --with-isl=system --with-polylib=no
-
-$(eval $(host-autotools-package))
