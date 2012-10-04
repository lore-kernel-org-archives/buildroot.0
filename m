From: spdawson at gmail.com <spdawson@gmail.com>
Date: Thu,  4 Oct 2012 13:11:39 +0100
Subject: [Buildroot] [PATCH] lcdproc: add support for menus
Message-ID: <1349352700-7036-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/lcdproc/Config.in  |    6 ++++++
 package/lcdproc/lcdproc.mk |    4 ++++
 2 files changed, 10 insertions(+)

diff --git a/package/lcdproc/Config.in b/package/lcdproc/Config.in
index 7261105..820f4ea 100644
--- a/package/lcdproc/Config.in
+++ b/package/lcdproc/Config.in
@@ -12,3 +12,9 @@ config BR2_PACKAGE_LCDPROC_DRIVERS
 	depends on BR2_PACKAGE_LCDPROC
 	help
 	  Specify a comma-separated list of lcdproc drivers to be built
+
+config BR2_PACKAGE_LCDPROC_MENUS
+	bool "Menu support"
+	depends on BR2_PACKAGE_LCDPROC
+	help
+	  Enable support for lcdproc menus
diff --git a/package/lcdproc/lcdproc.mk b/package/lcdproc/lcdproc.mk
index 7fd8a44..7914c85 100644
--- a/package/lcdproc/lcdproc.mk
+++ b/package/lcdproc/lcdproc.mk
@@ -12,6 +12,10 @@ LCDPROC_MAKE = $(MAKE1)
 
 LCDPROC_CONF_OPT = --enable-drivers=$(BR2_PACKAGE_LCDPROC_DRIVERS)
 
+ifeq ($(BR2_PACKAGE_LCDPROC_MENUS),y)
+LCDPROC_CONF_OPT += --enable-lcdproc-menus
+endif
+
 LCDPROC_DEPENDENCIES = ncurses
 
 $(eval $(autotools-package))
-- 
1.7.9.5
