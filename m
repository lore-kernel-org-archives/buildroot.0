From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue,  8 Jun 2021 08:01:30 +0200
Subject: [Buildroot] [PATCH v3 1/3] package/intel-gmmlib: bump version to
 21.1.3
Message-ID: <20210608060132.8727-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added patch to remove hardening-related flags.
Reformatted hashes.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v3: added patch to drop hardening-related flags
v2: no changes

 .../0001-Drop-hardening-related-flags.patch   | 28 +++++++++++++++++++
 package/intel-gmmlib/intel-gmmlib.hash        |  4 +--
 package/intel-gmmlib/intel-gmmlib.mk          |  2 +-
 3 files changed, 31 insertions(+), 3 deletions(-)
 create mode 100644 package/intel-gmmlib/0001-Drop-hardening-related-flags.patch

diff --git a/package/intel-gmmlib/0001-Drop-hardening-related-flags.patch b/package/intel-gmmlib/0001-Drop-hardening-related-flags.patch
new file mode 100644
index 0000000000..581afd9066
--- /dev/null
+++ b/package/intel-gmmlib/0001-Drop-hardening-related-flags.patch
@@ -0,0 +1,28 @@
+From 1528980ee15e9589a7e27ec6d12a33cd8aab57b4 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Tue, 8 Jun 2021 07:51:40 +0200
+Subject: [PATCH] Drop hardening-related flags
+
+These will be set by Buildroot depending on toolchain capabilities and
+global Buildroot options.
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ Source/GmmLib/Linux.cmake | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/Source/GmmLib/Linux.cmake b/Source/GmmLib/Linux.cmake
+index 1a09bc4..b28fc1b 100644
+--- a/Source/GmmLib/Linux.cmake
++++ b/Source/GmmLib/Linux.cmake
+@@ -62,7 +62,6 @@ SET (GMMLIB_COMPILER_FLAGS_COMMON
+     -DUSE_SSE3
+     -DUSE_SSSE3
+     # Other common flags
+-    -fstack-protector
+     -fdata-sections
+     -ffunction-sections
+     -fmessage-length=0
+-- 
+2.29.2
+
diff --git a/package/intel-gmmlib/intel-gmmlib.hash b/package/intel-gmmlib/intel-gmmlib.hash
index 1e8baba6c7..02d5cfef1a 100644
--- a/package/intel-gmmlib/intel-gmmlib.hash
+++ b/package/intel-gmmlib/intel-gmmlib.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 bb874b41c499abb8f6253b1834e93a02ed9744de71f2503ee9cd4100af7c1860  intel-gmmlib-19.4.1.tar.gz
-sha256 b61d639c5d84ec710ffcf5600ac92f8a4ace66670c1f9bd921f3bde671d36033  LICENSE.md
+sha256  c459a95243075296c72a40674c449ffcc314ed6d21ad0291c1603dbc11f4a74e  intel-gmmlib-21.1.3.tar.gz
+sha256  b61d639c5d84ec710ffcf5600ac92f8a4ace66670c1f9bd921f3bde671d36033  LICENSE.md
diff --git a/package/intel-gmmlib/intel-gmmlib.mk b/package/intel-gmmlib/intel-gmmlib.mk
index 517fc09131..9114a2a521 100644
--- a/package/intel-gmmlib/intel-gmmlib.mk
+++ b/package/intel-gmmlib/intel-gmmlib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_GMMLIB_VERSION = 19.4.1
+INTEL_GMMLIB_VERSION = 21.1.3
 INTEL_GMMLIB_SITE = https://github.com/intel/gmmlib/archive
 INTEL_GMMLIB_LICENSE = MIT
 INTEL_GMMLIB_LICENSE_FILES = LICENSE.md
-- 
2.29.2
