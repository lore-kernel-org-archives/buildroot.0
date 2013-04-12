From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Fri, 12 Apr 2013 11:46:42 +0200
Subject: [Buildroot] [PATCH] integrator926: Update the defconfig
Message-ID: <1365760002-21814-1-git-send-email-maxime.ripard@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

the integrator926 defconfig has not been updated for quite some time,
and is still asking for very old linux and u-boot releases. Now that
these versions aren't present in Buildroot anymore, they default to a
newer release, where, in the u-boot case, the defconfig name has
changed, leading to a build failure.

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 configs/integrator926_defconfig |    5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/configs/integrator926_defconfig b/configs/integrator926_defconfig
index e596d33..e1a084c 100644
--- a/configs/integrator926_defconfig
+++ b/configs/integrator926_defconfig
@@ -4,13 +4,10 @@ BR2_arm926t=y
 
 # Bootloader
 BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BOARDNAME="cp926ejs"
-BR2_TARGET_UBOOT_2010_06=y
+BR2_TARGET_UBOOT_BOARDNAME="integratorcp_cm926ejs"
 
 # Kernel
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_2_6_35=
-BR2_LINUX_KERNEL_USE_DEFCONFIG=y
 BR2_LINUX_KERNEL_DEFCONFIG="integrator"
 
 # Filesystem
-- 
1.7.10.4
