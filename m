From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 25 Aug 2010 17:30:38 +0200
Subject: [Buildroot] [git commit master 1/1] Config.in: mark
	BR2_CONFIG_CACHE as experimental and disable by default
Message-ID: <20100825153147.4915689016@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b680672ad1b1c45e23cf89ddb217616274d68dee
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As it is known to break with certain package combinations.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                              |    4 ++++
 Config.in                            |    6 ++++--
 configs/arm_nptl_toolchain_defconfig |    2 +-
 configs/arm_toolchain_defconfig      |    2 +-
 configs/at91sam9261ek_defconfig      |    2 +-
 configs/at91sam9261ek_ext_defconfig  |    2 +-
 configs/at91sam9263ek_defconfig      |    2 +-
 configs/at91sam9263ek_ext_defconfig  |    2 +-
 configs/atngw100_defconfig           |    2 +-
 9 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/CHANGES b/CHANGES
index 49aae0e..5658b61 100644
--- a/CHANGES
+++ b/CHANGES
@@ -8,6 +8,10 @@
 	Mark CRIS architecture as deprecated, as it is discontinued
 	upstream.
 
+	Marked shared config.cache as experimental and disabled by
+	default as it is known to break with certain package
+	combinations.
+
 	Toolchain: fixed gcc 4.2.x build after uClibc NPTL support got
 	added.
 
diff --git a/Config.in b/Config.in
index 52ea6d6..4c26078 100644
--- a/Config.in
+++ b/Config.in
@@ -267,9 +267,11 @@ config BR2_HAVE_DEVFILES
 menu "Advanced"
 
 config BR2_CONFIG_CACHE
-	bool "Use a central configure cache file"
-	default y
+	bool "Use a central configure cache file (EXPERIMENTAL)"
 	help
+	  Notice: This is experimental and known to break with certain
+	  package combinations.
+
 	  This determines if a central config cache is used by
 	  packages, reducing the configure time for packages as each
 	  one caches its findings.
diff --git a/configs/arm_nptl_toolchain_defconfig b/configs/arm_nptl_toolchain_defconfig
index 6506a25..02e6844 100644
--- a/configs/arm_nptl_toolchain_defconfig
+++ b/configs/arm_nptl_toolchain_defconfig
@@ -155,7 +155,7 @@ BR2_OPTIMIZE_2=y
 #
 # Advanced
 #
-BR2_CONFIG_CACHE=y
+# BR2_CONFIG_CACHE is not set
 
 #
 # Toolchain
diff --git a/configs/arm_toolchain_defconfig b/configs/arm_toolchain_defconfig
index 21be539..bd6f3e2 100644
--- a/configs/arm_toolchain_defconfig
+++ b/configs/arm_toolchain_defconfig
@@ -161,7 +161,7 @@ BR2_TOPDIR_SUFFIX=""
 BR2_ROOTFS_PREFIX="rootfs"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
-BR2_CONFIG_CACHE=y
+# BR2_CONFIG_CACHE is not set
 # BR2_ENABLE_DEBUG is not set
 BR2_STRIP_strip=y
 # BR2_STRIP_sstrip is not set
diff --git a/configs/at91sam9261ek_defconfig b/configs/at91sam9261ek_defconfig
index d0b803c..0a1fc51 100644
--- a/configs/at91sam9261ek_defconfig
+++ b/configs/at91sam9261ek_defconfig
@@ -182,7 +182,7 @@ BR2_TOPDIR_SUFFIX=""
 BR2_ROOTFS_PREFIX="at91sam9261ek-NAND"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
-BR2_CONFIG_CACHE=y
+# BR2_CONFIG_CACHE is not set
 # BR2_ENABLE_DEBUG is not set
 BR2_STRIP_strip=y
 # BR2_STRIP_sstrip is not set
diff --git a/configs/at91sam9261ek_ext_defconfig b/configs/at91sam9261ek_ext_defconfig
index c9a79cc..6ebe9fd 100644
--- a/configs/at91sam9261ek_ext_defconfig
+++ b/configs/at91sam9261ek_ext_defconfig
@@ -183,7 +183,7 @@ BR2_TOPDIR_SUFFIX=""
 BR2_ROOTFS_PREFIX="at91sam9261ek-NAND"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
-BR2_CONFIG_CACHE=y
+# BR2_CONFIG_CACHE is not set
 # BR2_ENABLE_DEBUG is not set
 BR2_STRIP_strip=y
 # BR2_STRIP_sstrip is not set
diff --git a/configs/at91sam9263ek_defconfig b/configs/at91sam9263ek_defconfig
index 80f4c5c..d293108 100644
--- a/configs/at91sam9263ek_defconfig
+++ b/configs/at91sam9263ek_defconfig
@@ -180,7 +180,7 @@ BR2_TOPDIR_SUFFIX=""
 BR2_ROOTFS_PREFIX="at91sam9263ek-NAND"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
-BR2_CONFIG_CACHE=y
+# BR2_CONFIG_CACHE is not set
 # BR2_ENABLE_DEBUG is not set
 BR2_STRIP_strip=y
 # BR2_STRIP_sstrip is not set
diff --git a/configs/at91sam9263ek_ext_defconfig b/configs/at91sam9263ek_ext_defconfig
index 3f6c3b8..843b0fb 100644
--- a/configs/at91sam9263ek_ext_defconfig
+++ b/configs/at91sam9263ek_ext_defconfig
@@ -182,7 +182,7 @@ BR2_TOPDIR_SUFFIX=""
 BR2_ROOTFS_PREFIX="at91sam9263ek-NAND"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
-BR2_CONFIG_CACHE=y
+# BR2_CONFIG_CACHE is not set
 # BR2_ENABLE_DEBUG is not set
 BR2_STRIP_strip=y
 # BR2_STRIP_sstrip is not set
diff --git a/configs/atngw100_defconfig b/configs/atngw100_defconfig
index 1fcf31b..50c376b 100644
--- a/configs/atngw100_defconfig
+++ b/configs/atngw100_defconfig
@@ -109,7 +109,7 @@ BR2_OPTIMIZE_S=y
 #
 # Advanced
 #
-BR2_CONFIG_CACHE=y
+# BR2_CONFIG_CACHE is not set
 
 #
 # Toolchain
-- 
1.7.1
