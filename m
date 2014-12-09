From: Thierry Bultel <tbultel@free.fr>
Date: Tue,  9 Dec 2014 16:09:19 +0100
Subject: [Buildroot] [PATCH 1/1] xterm: add support for 256 colors
Message-ID: <1418137759-12514-1-git-send-email-tbultel@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thierry Bultel <tbultel@free.fr>
---
 package/xterm/Config.in | 9 +++++++++
 package/xterm/xterm.mk  | 4 ++++
 2 files changed, 13 insertions(+)

diff --git a/package/xterm/Config.in b/package/xterm/Config.in
index e17d2c6..7dd4311 100644
--- a/package/xterm/Config.in
+++ b/package/xterm/Config.in
@@ -8,3 +8,12 @@ config BR2_PACKAGE_XTERM
 	  xterm terminal emulator
 
 	  http://invisible-island.net/xterm/
+
+if BR2_PACKAGE_XTERM
+
+config BR2_PACKAGE_XTERM_256_COLOR
+	bool "xterm 256 colors"
+	help
+	   enable 256-color support
+	
+endif
diff --git a/package/xterm/xterm.mk b/package/xterm/xterm.mk
index 9c6bd21..11d6cf4 100644
--- a/package/xterm/xterm.mk
+++ b/package/xterm/xterm.mk
@@ -12,4 +12,8 @@ XTERM_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) install
 XTERM_LICENSE = MIT
 XTERM_LICENSE_FILES = version.c
 
+ifeq ($(BR2_PACKAGE_XTERM_256_COLOR),y)
+XTERM_CONF_OPTS += --enable-256-color
+endif
+
 $(eval $(autotools-package))
-- 
1.9.1
