From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 4 Oct 2013 22:05:21 +0200
Subject: [Buildroot] [git commit] atstk100x_defconfig: use kernel 3.9.x like
	atngw100
Message-ID: <20131004200844.0B5CF9B940@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3a91e8f8a31a0455471065584663046c0072204e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And lock kernel headers to match.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/atstk100x_defconfig |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/configs/atstk100x_defconfig b/configs/atstk100x_defconfig
index fe7e498..f73497c 100644
--- a/configs/atstk100x_defconfig
+++ b/configs/atstk100x_defconfig
@@ -1,6 +1,10 @@
 # Architecture
 BR2_avr32=y
 
+# Lock to same version as kernel
+BR2_KERNEL_HEADERS_VERSION=y
+BR2_DEFAULT_KERNEL_VERSION="3.9.11"
+
 # U-Boot
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="atstk1002"
@@ -10,7 +14,7 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2010.09"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="2.6.35"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.9.11"
 BR2_LINUX_KERNEL_USE_DEFCONFIG=y
 BR2_LINUX_KERNEL_DEFCONFIG="atstk1002"
 
