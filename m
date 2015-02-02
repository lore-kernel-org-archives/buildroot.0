From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon,  2 Feb 2015 15:38:58 +0100
Subject: [Buildroot] [PATCH 2/4] matchbox-panel: remove redundant hash lines
In-Reply-To: <1422887940-31198-1-git-send-email-arnout@mind.be>
References: <1422887940-31198-1-git-send-email-arnout@mind.be>
Message-ID: <1422887940-31198-2-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/matchbox/matchbox-panel/matchbox-panel.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/matchbox/matchbox-panel/matchbox-panel.mk b/package/matchbox/matchbox-panel/matchbox-panel.mk
index 9b3b6ac9..d3efed9 100644
--- a/package/matchbox/matchbox-panel/matchbox-panel.mk
+++ b/package/matchbox/matchbox-panel/matchbox-panel.mk
@@ -13,8 +13,6 @@ MATCHBOX_PANEL_LICENSE_FILES = COPYING
 MATCHBOX_PANEL_DEPENDENCIES = matchbox-lib
 MATCHBOX_PANEL_CONF_OPTS = --enable-expat
 
-################################################################################
-
 ifeq ($(BR2_PACKAGE_STARTUP_NOTIFICATION),y)
 MATCHBOX_PANEL_CONF_OPTS += --enable-startup-notification
 MATCHBOX_PANEL_DEPENDENCIES += startup-notification matchbox-startup-monitor
@@ -26,6 +24,4 @@ ifeq ($(BR2_PACKAGE_WIRELESS_TOOLS),y)
 MATCHBOX_PANEL_DEPENDENCIES += wireless_tools
 endif
 
-################################################################################
-
 $(eval $(autotools-package))
-- 
2.1.4
