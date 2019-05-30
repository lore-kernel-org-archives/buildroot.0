From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 31 May 2019 00:17:41 +0200
Subject: [Buildroot] [git commit] package/matchbox-panel: fix build with NLS
Message-ID: <20190530221751.B224D8E7B0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=46668b157a84713b894fc171af071a85ea9e96b8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/3e72c2c2baae3a70fb5145b1b09a1f3716e4bce2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/matchbox-panel/matchbox-panel.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/matchbox-panel/matchbox-panel.mk b/package/matchbox-panel/matchbox-panel.mk
index 344d8fde49..aaa7236824 100644
--- a/package/matchbox-panel/matchbox-panel.mk
+++ b/package/matchbox-panel/matchbox-panel.mk
@@ -10,7 +10,8 @@ MATCHBOX_PANEL_SOURCE = matchbox-panel-$(MATCHBOX_PANEL_VERSION).tar.bz2
 MATCHBOX_PANEL_SITE = http://downloads.yoctoproject.org/releases/matchbox/matchbox-panel/$(MATCHBOX_PANEL_VERSION_MAJOR)
 MATCHBOX_PANEL_LICENSE = GPL-2.0+
 MATCHBOX_PANEL_LICENSE_FILES = COPYING
-MATCHBOX_PANEL_DEPENDENCIES = matchbox-lib
+MATCHBOX_PANEL_DEPENDENCIES = matchbox-lib $(TARGET_NLS_DEPENDENCIES)
+MATCHBOX_PANEL_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
 MATCHBOX_PANEL_CONF_OPTS = --enable-expat --enable-dnotify
 
 ifeq ($(BR2_PACKAGE_MATCHBOX_STARTUP_MONITOR),y)
