From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 6 Jun 2019 17:33:03 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/matchbox-panel:
 fix build with NLS
Message-ID: <20190606154048.20C107F881@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6918255ddeab64c9d471378a76880dbb2e1135a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes:
 - http://autobuild.buildroot.org/results/3e72c2c2baae3a70fb5145b1b09a1f3716e4bce2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 46668b157a84713b894fc171af071a85ea9e96b8)
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
