From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 24 Aug 2011 15:01:18 +0200
Subject: [Buildroot] [git commit] configs: remove arm toolchain defconfigs
Message-ID: <20110824130214.877F88CA86@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=480a6c3b01319afb641237da28b40983e1530cbe
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

nptl is default nowadays, and configurations were pretty much random
anyway.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 configs/arm_nptl_toolchain_defconfig |   17 -----------------
 configs/arm_toolchain_defconfig      |   15 ---------------
 2 files changed, 0 insertions(+), 32 deletions(-)
 delete mode 100644 configs/arm_nptl_toolchain_defconfig
 delete mode 100644 configs/arm_toolchain_defconfig

diff --git a/configs/arm_nptl_toolchain_defconfig b/configs/arm_nptl_toolchain_defconfig
deleted file mode 100644
index 8100073..0000000
--- a/configs/arm_nptl_toolchain_defconfig
+++ /dev/null
@@ -1,17 +0,0 @@
-# Architecture
-BR2_arm=y
-BR2_arm926t=y
-
-# Toolchain options
-BR2_LARGEFILE=y
-BR2_INET_IPV6=y
-BR2_INET_RPC=y
-BR2_ENABLE_LOCALE=y
-BR2_USE_WCHAR=y
-BR2_PTHREADS_NATIVE=y
-BR2_INSTALL_LIBSTDCPP=y
-
-# No package
-# BR2_PACKAGE_BUSYBOX is not set
-
-# No filesystem (toolchain only)
diff --git a/configs/arm_toolchain_defconfig b/configs/arm_toolchain_defconfig
deleted file mode 100644
index 8bc97c9..0000000
--- a/configs/arm_toolchain_defconfig
+++ /dev/null
@@ -1,15 +0,0 @@
-# Architecture
-BR2_arm=y
-
-# Common Toolchain Options
-BR2_LARGEFILE=y
-BR2_INET_IPV6=y
-BR2_INET_RPC=y
-BR2_ENABLE_LOCALE=y
-BR2_USE_WCHAR=y
-BR2_INSTALL_LIBSTDCPP=y
-
-# No package
-# BR2_PACKAGE_BUSYBOX is not set
-
-# No filesystem (toolchain only)
-- 
1.7.3.4
