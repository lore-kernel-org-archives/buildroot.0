From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Jan 2021 22:15:01 +0100
Subject: [Buildroot] [git commit] package/uboot-tools: resolve uboot env
 source file error
Message-ID: <20210125205520.428C5812F0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4419c3dafd14a1f9d3e3f2afa4dafe7629464126
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If Target u-boot is not available, the host build of uboot-tools
requires user to provide u-boot environment source file.
This change resolves a missing parentheses and updates the comment
for the same.

Signed-off-by: Kalpesh Panchal <kalpesh.panchal@rockwellcollins.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/uboot-tools/uboot-tools.mk | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index 1313107e0e..10cbd1cdd9 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -139,11 +139,11 @@ ifeq ($(BR_BUILDING),y)
 ifeq ($(call qstrip,$(BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SIZE)),)
 $(error Please provide U-Boot environment size (BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SIZE setting))
 endif
-# If U-Boot is available, ENVIMAGE_SOURCE is optional because the default can
-# be taken from U-Boot.
+# If U-Boot is not available, ENVIMAGE_SOURCE must be provided by user,
+# otherwise it is optional because the default can be taken from U-Boot
 ifeq ($(BR2_TARGET_UBOOT),)
-ifeq ($(call qstrip,$(BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SOURCE),)
-$(error Please provide U-Boot environment file BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SOURCE setting))
+ifeq ($(call qstrip,$(BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SOURCE)),)
+$(error Please provide U-Boot environment file (BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SOURCE setting))
 endif
 endif #BR2_TARGET_UBOOT
 endif #BR_BUILDING
