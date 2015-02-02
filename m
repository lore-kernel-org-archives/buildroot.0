From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Feb 2015 21:42:48 +0100
Subject: [Buildroot] [git commit] matchbox-panel: remove redundant hash lines
Message-ID: <20150202204306.8FFF78011C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e1c985a3cc1b96f800ef58bc1deb1167673e43f3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/matchbox/matchbox-panel/matchbox-panel.mk |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

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
