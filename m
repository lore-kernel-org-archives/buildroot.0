From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu,  3 Apr 2014 21:01:23 +0200
Subject: [Buildroot] [PATCH v4 28/37] xbmc: Add xbmc-send script to send
	commands to xbmc service
In-Reply-To: <1396551692-12371-1-git-send-email-bernd.kuhls@t-online.de>
References: <1396551692-12371-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1396551692-12371-29-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

http://wiki.xbmc.org/index.php?title=List_of_built-in_functions

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/xbmc/xbmc.mk |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/xbmc/xbmc.mk b/package/xbmc/xbmc.mk
index 59255a4..d51bc18 100644
--- a/package/xbmc/xbmc.mk
+++ b/package/xbmc/xbmc.mk
@@ -153,6 +153,12 @@ define XBMC_INSTALL_BR_WRAPPER
 endef
 XBMC_POST_INSTALL_TARGET_HOOKS += XBMC_INSTALL_BR_WRAPPER
 
+define XBMC_INSTALL_XBMC_SEND
+	$(INSTALL) -D $(@D)/tools/EventClients/lib/python/xbmcclient.py $(TARGET_DIR)/usr/lib/python2.7/xbmcclient.py
+	$(INSTALL) -D "$(@D)/tools/EventClients/Clients/XBMC Send/xbmc-send.py" $(TARGET_DIR)/usr/bin/xbmc-send
+endef
+XBMC_POST_INSTALL_TARGET_HOOKS += XBMC_INSTALL_XBMC_SEND
+
 # When run from a startup script, XBMC has no $HOME where to store its
 # configuration, so ends up storing it in /.xbmc  (yes, at the root of
 # the rootfs). This is a problem for read-only filesystems. But we can't
-- 
1.7.10.4
