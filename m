From: Matt Johnson <mj1856@hotmail.com>
Date: Thu, 13 Jan 2011 21:21:59 -0700
Subject: [Buildroot] rubix: pass target cflags
Message-ID: <BAY145-w120285E8572BD44A195EABC2F30@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Matt Johnson <mj1856@hotmail.com>
---
 package/games/rubix/rubix.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)
diff --git a/package/games/rubix/rubix.mk b/package/games/rubix/rubix.mk
index 3440c23..7e3b34f 100644
--- a/package/games/rubix/rubix.mk
+++ b/package/games/rubix/rubix.mk
@@ -10,7 +10,7 @@ RUBIX_INSTALL_STAGING = NO
 RUBIX_INSTALL_TARGET = YES
 RUBIX_INSTALL_TARGET_OPT = GAMESDIR=$(TARGET_DIR)/usr/games install
 
-RUBIX_MAKE_OPT = CC="$(TARGET_CC)" XINC="-I$(STAGING_DIR)/usr/include/X11" XLIB="-L$(STAGING_DIR)/usr/lib -lX11"
+RUBIX_MAKE_OPT = CC="$(TARGET_CC) $(TARGET_CFLAGS)" XINC="-I$(STAGING_DIR)/usr/include/X11" XLIB="-L$(STAGING_DIR)/usr/lib -lX11"
 
 RUBIX_DEPENDENCIES = xserver_xorg-server
 
-- 
1.7.1
 
  		 	   		  
