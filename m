From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 9 Apr 2018 21:19:30 +0200
Subject: [Buildroot] [git commit] linux: bump default to version 4.16
Message-ID: <20180409191938.DBAD18820B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1b9faedf32be26d9c983c573ccd98f57fc6f6569
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added host-bison and host-flex as dependencies after upstream removed
pre-generated files and switched over to build-time generation, for
details see:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=033dba2ec06c47a9fe1b190bc3281058fb20738d
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=29c833061c1d8c2d1d23a62e7061561eadd76cdb

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Tested-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 linux/Config.in | 4 ++--
 linux/linux.mk  | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 43bff6fa09..d52af66e5c 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -26,7 +26,7 @@ choice
 	prompt "Kernel version"
 
 config BR2_LINUX_KERNEL_LATEST_VERSION
-	bool "Latest version (4.15)"
+	bool "Latest version (4.16)"
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	bool "Latest CIP SLTS version (v4.4.112-cip18)"
@@ -116,7 +116,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "4.15.16" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "4.16" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "v4.4.112-cip18" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
diff --git a/linux/linux.mk b/linux/linux.mk
index 7609a15f23..9e646baffc 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -62,7 +62,7 @@ LINUX_PATCHES = $(call qstrip,$(BR2_LINUX_KERNEL_PATCH))
 LINUX_PATCH = $(filter ftp://% http://% https://%,$(LINUX_PATCHES))
 
 LINUX_INSTALL_IMAGES = YES
-LINUX_DEPENDENCIES += host-kmod
+LINUX_DEPENDENCIES += host-bison host-flex host-kmod
 
 # host tools needed for kernel compression
 ifeq ($(BR2_LINUX_KERNEL_LZ4),y)
