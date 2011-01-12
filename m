From: =?UTF-8?q?Daniel=20Nystr=C3=B6m?= <daniel.nystrom@timeterminal.se>
Date: Wed, 12 Jan 2011 12:03:14 +0100
Subject: [Buildroot] [PATCH 1/2] liberation: add support for custom target
	directory
Message-ID: <1294830195-11438-1-git-send-email-daniel.nystrom@timeterminal.se>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Daniel Nystr?m <daniel.nystrom@timeterminal.se>
---
 package/liberation/Config.in     |    9 +++++++++
 package/liberation/liberation.mk |    2 +-
 2 files changed, 10 insertions(+), 1 deletions(-)

diff --git a/package/liberation/Config.in b/package/liberation/Config.in
index 48d4195..9295b4e 100644
--- a/package/liberation/Config.in
+++ b/package/liberation/Config.in
@@ -5,3 +5,12 @@ config BR2_PACKAGE_LIBERATION
 	  three most commonly used fonts on Microsoft systems:
 	  Times New Roman, Arial, and Courier New.
 
+if BR2_PACKAGE_LIBERATION
+
+config BR2_PACKAGE_LIBERATION_INSTALL_DIR
+	string "Install directory"
+	default "/usr/share/fonts/liberation"
+	help
+	  Target directory where the fonts should be installed
+
+endif
diff --git a/package/liberation/liberation.mk b/package/liberation/liberation.mk
index 89987d6..53b817d 100644
--- a/package/liberation/liberation.mk
+++ b/package/liberation/liberation.mk
@@ -7,7 +7,7 @@ LIBERATION_VERSION = 1.06.0.20100721
 LIBERATION_SITE = http://www.fedorahosted.org/releases/l/i/liberation-fonts
 LIBERATION_SOURCE = liberation-fonts-ttf-$(LIBERATION_VERSION).tar.gz
 
-LIBERATION_TARGET_DIR = $(TARGET_DIR)/usr/share/fonts/liberation
+LIBERATION_TARGET_DIR = $(TARGET_DIR)/$(BR2_PACKAGE_LIBERATION_INSTALL_DIR)
 
 define LIBERATION_INSTALL_TARGET_CMDS
 	mkdir -p $(LIBERATION_TARGET_DIR)
-- 
1.7.1
