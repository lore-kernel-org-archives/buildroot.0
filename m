From: Paul Jones <paul@pauljones.id.au>
Date: Sat, 22 May 2010 16:25:45 +1000
Subject: [Buildroot] [PATCH] xkeyboard-config: Depends on intltool
Message-ID: <1274509545-18385-1-git-send-email-paul@pauljones.id.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Paul Jones <peejay@peejay-ubuntu.(none)>

Signed-off-by: Paul Jones <paul@pauljones.id.au>
---
 package/x11r7/xkeyboard-config/Config.in           |    1 +
 package/x11r7/xkeyboard-config/xkeyboard-config.mk |    1 +
 2 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/x11r7/xkeyboard-config/Config.in b/package/x11r7/xkeyboard-config/Config.in
index 8e27dac..a84679c 100644
--- a/package/x11r7/xkeyboard-config/Config.in
+++ b/package/x11r7/xkeyboard-config/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_XKEYBOARD_CONFIG
 	bool "xkeyboard-config"
 	select BR2_PACKAGE_XAPP_XKBCOMP
+	select BR2_PACKAGE_INTLTOOL
 	help
 	  keyboard configuration database for X
 
diff --git a/package/x11r7/xkeyboard-config/xkeyboard-config.mk b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
index 9c9c8b5..3cbfba2 100644
--- a/package/x11r7/xkeyboard-config/xkeyboard-config.mk
+++ b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
@@ -10,6 +10,7 @@ XKEYBOARD_CONFIG_AUTORECONF = NO
 XKEYBOARD_CONFIG_INSTALL_STAGING = NO
 XKEYBOARD_CONFIG_INSTALL_TARGET = YES
 XKEYBOARD_CONFIG_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
+XKEYBOARD_CONFIG_DEPENDENCIES = intltool
 
 XKEYBOARD_CONFIG_CONF_OPT = GMSGFMT=/usr/bin/msgfmt
 
-- 
1.7.0.4
