From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 14 Oct 2012 01:14:01 +0200
Subject: [Buildroot] [PATCH 03/13] linux: get default paths from
	BR2_PROJECT_DIR
In-Reply-To: <20121013231344.17317.92930.stgit@localhost>
References: <20121013231344.17317.92930.stgit@localhost>
Message-ID: <20121013231401.17317.59831.stgit@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
I'm not very happy with the default name 'linux.dts' for the device tree.
However, I haven't got a reasonable alternative.
---
 linux/Config.in |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/linux/Config.in b/linux/Config.in
index 257f934..cf8352d 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -121,6 +121,7 @@ config BR2_LINUX_KERNEL_DEFCONFIG
 config BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE
 	string "Configuration file path"
 	depends on BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG
+	default "$(PROJECT_DIR)/linux.config" if BR2_PROJECT_DIR != ""
 	help
 	  Path to the kernel configuration file
 
@@ -269,6 +270,7 @@ config BR2_LINUX_KERNEL_INTREE_DTS_NAME
 config BR2_LINUX_KERNEL_CUSTOM_DTS_PATH
 	string "Device Tree Source file path"
 	depends on BR2_LINUX_KERNEL_USE_CUSTOM_DTS
+	default "$(PROJECT_DIR)/linux.dts" if BR2_PROJECT_DIR != ""
 	help
 	  Path to the device tree source file
 
