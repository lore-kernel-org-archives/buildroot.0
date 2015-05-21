From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 May 2015 23:50:49 +0200
Subject: [Buildroot] [git commit branch/next] barebox: add option to specify
	config fragments
Message-ID: <20150521215059.59F027FDC6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7241aee4ed7d85659a0eb0f369d8a3a44ffc176e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/barebox/Config.in  |    6 ++++++
 boot/barebox/barebox.mk |    1 +
 2 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
index a250f3b..53d8013 100644
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
index 294acbd..7e53037 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -64,6 +64,7 @@ BAREBOX_SOURCE_CONFIG = $(call qstrip,$(BR2_TARGET_BAREBOX_CUSTOM_CONFIG_FILE))
 endif
 
 BAREBOX_KCONFIG_FILE = $(BAREBOX_SOURCE_CONFIG)
+BAREBOX_KCONFIG_FRAGMENT_FILES = $(call qstrip,$(BR2_TARGET_BAREBOX_CONFIG_FRAGMENT_FILES))
 BAREBOX_KCONFIG_EDITORS = menuconfig xconfig gconfig nconfig
 BAREBOX_KCONFIG_OPTS = $(BAREBOX_MAKE_FLAGS)
 
