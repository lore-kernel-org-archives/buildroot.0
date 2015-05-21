From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 May 2015 23:42:48 +0200
Subject: [Buildroot] [git commit] linux: add option to specify config
	fragments
Message-ID: <20150601220248.AC9C081D62@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=87bd1e3724d6ffbe868a6c38fdb2b56ae20cabbd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Gergely Imreh <imrehg@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/Config.in |    6 ++++++
 linux/linux.mk  |    1 +
 2 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index f2d4652..30e38e4 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -164,6 +164,12 @@ config BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE
 	  Note: this can be a defconfig file or a complete .config file,
 	  which can later be saved back with make linux-update-(def)config.
 
+config BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES
+	string "Additional configuration fragment files"
+	help
+	  A space-separated list of kernel configuration fragment files,
+	  that will be merged to the main kernel configuration file.
+
 #
 # Binary format
 #
diff --git a/linux/linux.mk b/linux/linux.mk
index c765954..eca1450 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -182,6 +182,7 @@ KERNEL_SOURCE_CONFIG = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE))
 endif
 
 LINUX_KCONFIG_FILE = $(KERNEL_SOURCE_CONFIG)
+LINUX_KCONFIG_FRAGMENT_FILES = $(call qstrip,$(BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES))
 LINUX_KCONFIG_EDITORS = menuconfig xconfig gconfig nconfig
 LINUX_KCONFIG_OPTS = $(LINUX_MAKE_FLAGS)
 
