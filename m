From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 13 Feb 2021 18:40:11 +0100
Subject: [Buildroot] [RFC v1 4/6] package/double-conversion: bump version to
 3c6d2c2
In-Reply-To: <20210213174013.32584-1-ps.report@gmx.net>
References: <20210213174013.32584-1-ps.report@gmx.net>
Message-ID: <20210213174013.32584-5-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Notes:
  - squash with previous patch
  - fix the remaining BR2_nds32 case
---
 package/double-conversion/Config.in              | 4 +---
 package/double-conversion/double-conversion.hash | 2 +-
 package/double-conversion/double-conversion.mk   | 6 ++++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/double-conversion/Config.in b/package/double-conversion/Config.in
index 8c590fbde6..cab6192357 100644
--- a/package/double-conversion/Config.in
+++ b/package/double-conversion/Config.in
@@ -1,8 +1,6 @@
 config BR2_PACKAGE_DOUBLE_CONVERSION
 	bool "double-conversion"
-	# note: BR2_microblazeel/BR2_nios2/BR2_xtensa was added post v3.1.5 already
-	depends on !BR2_nds32 && !BR2_microblazeel && !BR2_nios2
-	depends on !BR2_xtensa
+	depends on !BR2_nds32
 	depends on BR2_INSTALL_LIBSTDCPP
 	help
 	  Provides binary-decimal and decimal-binary routines for
diff --git a/package/double-conversion/double-conversion.hash b/package/double-conversion/double-conversion.hash
index 65411a8982..fa5e3480da 100644
--- a/package/double-conversion/double-conversion.hash
+++ b/package/double-conversion/double-conversion.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  a63ecb93182134ba4293fd5f22d6e08ca417caafa244afaa751cbfddf6415b13  double-conversion-3.1.5.tar.gz
+sha256  025e4cd3f02408df4fe8a6a0526bea69b4bc9c5536bd37dadcecec7aad568593  double-conversion-3c6d2c2ec99340bf05aa0fef7842bbaf6af4d830.tar.gz
 sha256  4af93c12062c58058378de2397dc1c92bbff9ddfb1d583a01c84127557ce97ca  COPYING
diff --git a/package/double-conversion/double-conversion.mk b/package/double-conversion/double-conversion.mk
index c8db5104f0..df74f5936d 100644
--- a/package/double-conversion/double-conversion.mk
+++ b/package/double-conversion/double-conversion.mk
@@ -4,8 +4,10 @@
 #
 ################################################################################
 
-DOUBLE_CONVERSION_VERSION = 3.1.5
-DOUBLE_CONVERSION_SITE = $(call github,google,double-conversion,v$(DOUBLE_CONVERSION_VERSION))
+# use git latest instead of lat release v3.1.5 to enable additioanal
+# cpu archs
+DOUBLE_CONVERSION_VERSION = 3c6d2c2ec99340bf05aa0fef7842bbaf6af4d830
+DOUBLE_CONVERSION_SITE = $(call github,google,double-conversion,$(DOUBLE_CONVERSION_VERSION))
 DOUBLE_CONVERSION_LICENSE = BSD-3-Clause
 DOUBLE_CONVERSION_LICENSE_FILES = COPYING
 DOUBLE_CONVERSION_INSTALL_STAGING = YES
-- 
2.30.0
