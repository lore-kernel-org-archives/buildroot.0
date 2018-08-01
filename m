From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  1 Aug 2018 08:14:47 +0200
Subject: [Buildroot] [PATCH 1/1] package/lttng-tools: bump version to 2.10.5
Message-ID: <20180801061447.28214-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added sha256 and license hashes, switched _SITE to https.

This bump includes
https://github.com/lttng/lttng-tools/commit/b4cf0332cc1164684bbc708b6c46c1d69a15b847
which fixes a musl build error:
http://autobuild.buildroot.net/results/09d/09d6d5e2d1c50dbd6c026e12aa245fc90687eb19/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/lttng-tools/lttng-tools.hash | 11 ++++++++---
 package/lttng-tools/lttng-tools.mk   |  4 ++--
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/package/lttng-tools/lttng-tools.hash b/package/lttng-tools/lttng-tools.hash
index 9756570f90..f6c01b7dec 100644
--- a/package/lttng-tools/lttng-tools.hash
+++ b/package/lttng-tools/lttng-tools.hash
@@ -1,3 +1,8 @@
-# From https://lttng.org/files/lttng-tools/lttng-tools-2.10.4.tar.bz2.{md5,sha1}
-md5 fb053baad7f5dc888880386525294659  lttng-tools-2.10.4.tar.bz2
-sha1 5cf77ad0d443a93d31ce54ceb3d64a7bb2b0db94  lttng-tools-2.10.4.tar.bz2
+# From https://lttng.org/files/lttng-tools/lttng-tools-2.10.5.tar.bz2.{md5,sha1}
+md5 50e07676d5eb5d6cf4ece804863a6f74  lttng-tools-2.10.5.tar.bz2
+sha1 68790d44529a3b29896c35bb2350e8a0e1226264  lttng-tools-2.10.5.tar.bz2
+# Locally computed
+sha256 a4868078ef961e83dc236c4f24fd848161bfa755344b064dece62c4c81a07411  lttng-tools-2.10.5.tar.bz2
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  gpl-2.0.txt
+sha256 051be1f11b508ef7bb839994f6b58be19a827c56bd9bddfe36d77d3d4be55abe  lgpl-2.1.txt
+sha256 f07515677547da5f3ee2396bdf491affc1accd5e4765a5378b6e1e98392fd5e7  LICENSE
diff --git a/package/lttng-tools/lttng-tools.mk b/package/lttng-tools/lttng-tools.mk
index 452c944f3d..ce07ce4b52 100644
--- a/package/lttng-tools/lttng-tools.mk
+++ b/package/lttng-tools/lttng-tools.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LTTNG_TOOLS_VERSION = 2.10.4
-LTTNG_TOOLS_SITE = http://lttng.org/files/lttng-tools
+LTTNG_TOOLS_VERSION = 2.10.5
+LTTNG_TOOLS_SITE = https://lttng.org/files/lttng-tools
 LTTNG_TOOLS_SOURCE = lttng-tools-$(LTTNG_TOOLS_VERSION).tar.bz2
 LTTNG_TOOLS_INSTALL_STAGING = YES
 LTTNG_TOOLS_LICENSE = GPL-2.0+, LGPL-2.1+ (include/lttng/*, src/lib/lttng-ctl/*)
-- 
2.18.0
