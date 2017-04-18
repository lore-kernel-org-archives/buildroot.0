From: Vlad Zakharov <Vladislav.Zakharov@synopsys.com>
Date: Tue, 18 Apr 2017 18:40:39 +0300
Subject: [Buildroot] [PATCH] arc: remove patch for linux vdk defconfig
Message-ID: <1492530039-3194-1-git-send-email-vzakhar@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The patch for linux vdk defconfig introduced ARC_SMP_HALT_ON_RESET
config symbol. In fact that is not required as this symbol is enabled by
default if ARC_UBOOT_SUPPORT config symbol is set (and it is set in
vdk configs).

Also this commit fixes build failure, pointed us by Arnout:
https://gitlab.com/buildroot.org/buildroot/builds/14419270

Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>
---
 .../linux/0001-arc-vdk-Disable-halt-on-reset.patch | 32 ----------------------
 1 file changed, 32 deletions(-)
 delete mode 100644 board/synopsys/vdk/patches/linux/0001-arc-vdk-Disable-halt-on-reset.patch

diff --git a/board/synopsys/vdk/patches/linux/0001-arc-vdk-Disable-halt-on-reset.patch b/board/synopsys/vdk/patches/linux/0001-arc-vdk-Disable-halt-on-reset.patch
deleted file mode 100644
index 7ff7814..0000000
--- a/board/synopsys/vdk/patches/linux/0001-arc-vdk-Disable-halt-on-reset.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 1e248a880ee46921f85213da32b18f6becf07078 Mon Sep 17 00:00:00 2001
-From: Alexey Brodkin <abrodkin@synopsys.com>
-Date: Tue, 31 Jan 2017 19:00:29 +0300
-Subject: [PATCH 1/3] arc: vdk: Disable halt on reset
-
-In recent VDKs ARC cores are configured as "run on reset"
-which made existing kernel configuration outdated to effect that
-slave cores never start execution of the code keeping only master
-online.
-
-With that fix we're again in sync with VDK platform.
-
-Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
----
- arch/arc/configs/vdk_hs38_smp_defconfig | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/arch/arc/configs/vdk_hs38_smp_defconfig b/arch/arc/configs/vdk_hs38_smp_defconfig
-index 969b206d6c67..00036e814dc1 100644
---- a/arch/arc/configs/vdk_hs38_smp_defconfig
-+++ b/arch/arc/configs/vdk_hs38_smp_defconfig
-@@ -15,6 +15,7 @@ CONFIG_ARC_PLAT_AXS10X=y
- CONFIG_AXS103=y
- CONFIG_ISA_ARCV2=y
- CONFIG_SMP=y
-+# CONFIG_ARC_SMP_HALT_ON_RESET is not set
- # CONFIG_ARC_HAS_GFRC is not set
- CONFIG_ARC_UBOOT_SUPPORT=y
- CONFIG_ARC_BUILTIN_DTB_NAME="vdk_hs38_smp"
--- 
-2.7.4
-
-- 
2.7.4
