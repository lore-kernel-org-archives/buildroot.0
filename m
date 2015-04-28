From: Floris Bos <bos@je-eigen-domein.nl>
Date: Tue, 28 Apr 2015 16:34:32 +0200
Subject: [Buildroot] [PATCH v2 2/5] linux: add option to specify config
	fragments
In-Reply-To: <1430231675-8613-1-git-send-email-bos@je-eigen-domein.nl>
References: <1430231675-8613-1-git-send-email-bos@je-eigen-domein.nl>
Message-ID: <1430231675-8613-2-git-send-email-bos@je-eigen-domein.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
---
 linux/Config.in | 6 ++++++
 linux/linux.mk  | 1 +
 2 files changed, 7 insertions(+)

diff --git a/linux/Config.in b/linux/Config.in
index 0ab9f26..ac483c1 100644
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
index 0c348da..694061e 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -175,6 +175,7 @@ KERNEL_SOURCE_CONFIG = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE))
 endif
 
 LINUX_KCONFIG_FILE = $(KERNEL_SOURCE_CONFIG)
+LINUX_KCONFIG_FRAGMENT_FILES = $(call qstrip,$(BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES))
 LINUX_KCONFIG_EDITORS = menuconfig xconfig gconfig nconfig
 LINUX_KCONFIG_OPTS = $(LINUX_MAKE_FLAGS)
 
-- 
2.1.4
