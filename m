From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 25 Apr 2013 22:55:48 +0200
Subject: [Buildroot] [git commit] integrator926: Update the defconfig
Message-ID: <20130425214004.25E319B843@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=74bdc4b9ddf6d4d2ecdd238715dcbf14292b8829
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

the integrator926 defconfig has not been updated for quite some time,
and is still asking for very old linux and u-boot releases. Now that
these versions aren't present in Buildroot anymore, they default to a
newer release, where, in the u-boot case, the defconfig name has
changed, leading to a build failure.

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 configs/integrator926_defconfig |   11 +++++++----
 1 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/configs/integrator926_defconfig b/configs/integrator926_defconfig
index e596d33..e63f455 100644
--- a/configs/integrator926_defconfig
+++ b/configs/integrator926_defconfig
@@ -4,13 +4,16 @@ BR2_arm926t=y
 
 # Bootloader
 BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BOARDNAME="cp926ejs"
-BR2_TARGET_UBOOT_2010_06=y
+BR2_TARGET_UBOOT_BOARDNAME="integratorcp_cm926ejs"
+
+# Lock down headers to avoid breaking with new defaults
+BR2_KERNEL_HEADERS_VERSION=y
+BR2_DEFAULT_KERNEL_VERSION="2.6.35"
 
 # Kernel
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_2_6_35=
-BR2_LINUX_KERNEL_USE_DEFCONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="2.6.35"
 BR2_LINUX_KERNEL_DEFCONFIG="integrator"
 
 # Filesystem
