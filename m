From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Feb 2015 21:42:48 +0100
Subject: [Buildroot] [git commit] matchbox-panel: specify optional
	dependency on wireless_tools
Message-ID: <20150202204306.861258011C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2e19805610cf55107b304f73e8288f12edfb76ca
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Make sure build is reproducible and doesn't depend on the order.

There is no corresponding configure option, but configure looks for
iwlib.h

Cc: Jean-Paul Etienne <fractalclone@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/matchbox/matchbox-panel/matchbox-panel.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

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
