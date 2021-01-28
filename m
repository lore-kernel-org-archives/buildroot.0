From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Jan 2021 19:29:21 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] package/uboot-tools:
 resolve uboot env source file error
Message-ID: <20210128200058.4CA4F83846@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a1d3dd84210f044fdfd4bfc2dfa84af070ea2e3f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

If Target u-boot is not available, the host build of uboot-tools
requires user to provide u-boot environment source file.
This change resolves a missing parentheses and updates the comment
for the same.

Signed-off-by: Kalpesh Panchal <kalpesh.panchal@rockwellcollins.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 4419c3dafd14a1f9d3e3f2afa4dafe7629464126)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/uboot-tools/uboot-tools.mk | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index 6aa7cba2dd..db5da0b2a3 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -137,11 +137,11 @@ ifeq ($(BR_BUILDING),y)
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
