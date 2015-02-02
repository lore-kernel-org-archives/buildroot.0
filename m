From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon,  2 Feb 2015 15:38:57 +0100
Subject: [Buildroot] [PATCH 1/4] matchbox-panel: specify optional dependency
	on wireless_tools
Message-ID: <1422887940-31198-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Make sure build is reproducible and doesn't depend on the order.

There is no corresponding configure option, but configure looks for
iwlib.h

Cc: Jean-Paul Etienne <fractalclone@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/matchbox/matchbox-panel/matchbox-panel.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/matchbox/matchbox-panel/matchbox-panel.mk b/package/matchbox/matchbox-panel/matchbox-panel.mk
index 72ee286..9b3b6ac9 100644
--- a/package/matchbox/matchbox-panel/matchbox-panel.mk
+++ b/package/matchbox/matchbox-panel/matchbox-panel.mk
@@ -22,6 +22,10 @@ else
 MATCHBOX_PANEL_CONF_OPTS += --disable-startup-notification
 endif
 
+ifeq ($(BR2_PACKAGE_WIRELESS_TOOLS),y)
+MATCHBOX_PANEL_DEPENDENCIES += wireless_tools
+endif
+
 ################################################################################
 
 $(eval $(autotools-package))
-- 
2.1.4
