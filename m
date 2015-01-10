From: =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause@posteo.de>
Date: Sat, 10 Jan 2015 14:47:27 +0100
Subject: [Buildroot] [PATCH v2 8/8]
	docs/manual/configure-other-components.txt: Add uboot documentation
In-Reply-To: <1420897647-25001-1-git-send-email-jkrause@posteo.de>
References: <1420897647-25001-1-git-send-email-jkrause@posteo.de>
Message-ID: <1420897647-25001-9-git-send-email-jkrause@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add documentation for U-Boots Kconfig configuration.

Signed-off-by: J?rg Krause <jkrause@posteo.de>
---
Changes v1 -> v2:
  - Rewrite help text with regard of configuration only available for
      newer U-Boot versions
---
 docs/manual/configure-other-components.txt | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/docs/manual/configure-other-components.txt b/docs/manual/configure-other-components.txt
index deb1fa2..1ad56e5 100644
--- a/docs/manual/configure-other-components.txt
+++ b/docs/manual/configure-other-components.txt
@@ -50,3 +50,22 @@ kernel. The corresponding configuration variables are
 +BR2_TARGET_BAREBOX_USE_CUSTOM_CONFIG+ and
 +BR2_TARGET_BAREBOX_USE_DEFCONFIG+. To open the configuration editor,
 use +make barebox-menuconfig+.
+
+U-Boot::
++
+Configuration of U-Boot requires version 2014.10 or newer. Additionaly,
++BR2_TARGET_UBOOT_USE_KBUILD_KCONFIG+ has to be enabled by the user. This
+is done by default for the latest U-Boot version.
++
+If you already have a custom U-Boot configuration file, you can directly
+specify this file in the Buildroot configuration, by selecting
++BR2_TARGET_UBOOT_USE_CUSTOM_CONFIG+.
++
+If you do not yet have a custom U-Boot configuration file, you can either
+start by specifying a board name in the Buildroot configuration, using
++BR2_TARGET_UBOOT_BOARDNAME+, or start by creating an empty file and
+specifying it as custom configuration file, using
++BR2_TARGET_UBOOT_USE_CUSTOM_CONFIG+.
++
+To make subsequent changes to the configuration, use +make
+uboot-menuconfig+ to open the U-Boot configuration editor.
-- 
2.2.1
