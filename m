From: Adam Duskett <aduskett@gmail.com>
Date: Tue,  4 Feb 2020 02:33:18 -0800
Subject: [Buildroot] [PATCH v2 3/7] package/libsepol: bump version to 3.0
In-Reply-To: <20200204103322.428413-1-aduskett@gmail.com>
References: <20200204103322.428413-1-aduskett@gmail.com>
Message-ID: <20200204103322.428413-3-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Other changes:
  - Add policy version 32 as a default version of toolchains build with kernel
    headers 5.5 or later.

  - Add Help text for the above.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/libsepol/Config.in     | 3 ++-
 package/libsepol/libsepol.hash | 2 +-
 package/libsepol/libsepol.mk   | 4 ++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/libsepol/Config.in b/package/libsepol/Config.in
index 21d4d7865c..52c12bf290 100644
--- a/package/libsepol/Config.in
+++ b/package/libsepol/Config.in
@@ -11,6 +11,7 @@ if BR2_PACKAGE_LIBSEPOL
 
 config BR2_PACKAGE_LIBSEPOL_POLICY_VERSION
 	int "Policy version"
+	default 32 if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_5
 	default 31 if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_13
 	default 30 if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_3
 	default 29 if BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14
@@ -27,7 +28,7 @@ config BR2_PACKAGE_LIBSEPOL_POLICY_VERSION
 	  > 3.5 <= 3.14    28 (27 and 28 were added@the same time)
 	  > 3.14 <= 4.3    29
 	  > 4.3 <= 4.13    30
-	  > 4.13           31
+	  > 4.13 <= 5.5    31
 
 endif
 
diff --git a/package/libsepol/libsepol.hash b/package/libsepol/libsepol.hash
index 83eb63213e..a43d387a4f 100644
--- a/package/libsepol/libsepol.hash
+++ b/package/libsepol/libsepol.hash
@@ -1,5 +1,5 @@
 # From: https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256 a34b12b038d121e3e459b1cbaca3c9202e983137819c16baf63658390e3f1d5d  libsepol-2.9.tar.gz
+sha256 5b7ae1881909f1048b06f7a0c364c5c8a86ec12e0ec76e740fe9595a6033eb79  libsepol-3.0.tar.gz
 
 # Hash for license file
 sha256 6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING
diff --git a/package/libsepol/libsepol.mk b/package/libsepol/libsepol.mk
index 62b0744aa3..2d64c53bc3 100644
--- a/package/libsepol/libsepol.mk
+++ b/package/libsepol/libsepol.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBSEPOL_VERSION = 2.9
-LIBSEPOL_SITE = https://github.com/SELinuxProject/selinux/releases/download/20190315
+LIBSEPOL_VERSION = 3.0
+LIBSEPOL_SITE = https://github.com/SELinuxProject/selinux/releases/download/20191204
 LIBSEPOL_LICENSE = LGPL-2.1+
 LIBSEPOL_LICENSE_FILES = COPYING
 
-- 
2.24.1
