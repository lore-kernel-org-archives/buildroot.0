From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Jun 2015 23:10:21 +0200
Subject: [Buildroot] [git commit] package/matchbox-panel: add support for
	dnotify
Message-ID: <20150609211053.1862D7FEE8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a18788d388cc9d531272d6ca73cce13fd118594d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Using dnotify, matchbox-panel can automatically reload its menu.
dnotify requires a kernel >=2.4, which we can consider to be
virtually for granted.

So, forcibly use dnotify.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Reviewed-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/matchbox-panel/matchbox-panel.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/matchbox-panel/matchbox-panel.mk b/package/matchbox-panel/matchbox-panel.mk
index a5da780..e71337c 100644
--- a/package/matchbox-panel/matchbox-panel.mk
+++ b/package/matchbox-panel/matchbox-panel.mk
@@ -11,7 +11,7 @@ MATCHBOX_PANEL_SITE = http://downloads.yoctoproject.org/releases/matchbox/matchb
 MATCHBOX_PANEL_LICENSE = GPLv2+
 MATCHBOX_PANEL_LICENSE_FILES = COPYING
 MATCHBOX_PANEL_DEPENDENCIES = matchbox-lib
-MATCHBOX_PANEL_CONF_OPTS = --enable-expat
+MATCHBOX_PANEL_CONF_OPTS = --enable-expat --enable-dnotify
 
 ifeq ($(BR2_PACKAGE_MATCHBOX_STARTUP_MONITOR),y)
 MATCHBOX_PANEL_CONF_OPTS += --enable-startup-notification
