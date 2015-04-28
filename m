From: Floris Bos <bos@je-eigen-domein.nl>
Date: Tue, 28 Apr 2015 16:34:35 +0200
Subject: [Buildroot] [PATCH v2 5/5] barebox: add option to specify config
	fragments
In-Reply-To: <1430231675-8613-1-git-send-email-bos@je-eigen-domein.nl>
References: <1430231675-8613-1-git-send-email-bos@je-eigen-domein.nl>
Message-ID: <1430231675-8613-5-git-send-email-bos@je-eigen-domein.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
---
 boot/barebox/Config.in  | 6 ++++++
 boot/barebox/barebox.mk | 1 +
 2 files changed, 7 insertions(+)

diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
index 48431bd..dbe79e9 100644
--- a/boot/barebox/Config.in
+++ b/boot/barebox/Config.in
@@ -91,6 +91,12 @@ config BR2_TARGET_BAREBOX_CUSTOM_CONFIG_FILE
 	help
 	  Path to the barebox configuration file
 
+config BR2_TARGET_BAREBOX_CONFIG_FRAGMENT_FILES
+	string "Additional configuration fragment files"
+	help
+	  A space-separated list of configuration fragment files,
+	  that will be merged to the main Barebox configuration file.
+
 config BR2_TARGET_BAREBOX_BAREBOXENV
 	bool "bareboxenv tool in target"
 	help
diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index 54f52bb..5095ffa 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -60,6 +60,7 @@ BAREBOX_SOURCE_CONFIG = $(call qstrip,$(BR2_TARGET_BAREBOX_CUSTOM_CONFIG_FILE))
 endif
 
 BAREBOX_KCONFIG_FILE = $(BAREBOX_SOURCE_CONFIG)
+BAREBOX_KCONFIG_FRAGMENT_FILES = $(call qstrip,$(BR2_TARGET_BAREBOX_CONFIG_FRAGMENT_FILES))
 BAREBOX_KCONFIG_EDITORS = menuconfig xconfig gconfig nconfig
 BAREBOX_KCONFIG_OPTS = $(BAREBOX_MAKE_FLAGS)
 
-- 
2.1.4
