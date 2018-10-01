From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Oct 2018 14:31:22 +0200
Subject: [Buildroot] [git commit] irqbalance: ui needs ncurses
Message-ID: <20181001123147.74B3C8A5B3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c32cd4b925fc596ee2db2bfd7a0c3faaeae06849
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/227543e9760dedeeb4360de49e09baebed98f894

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/irqbalance/irqbalance.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/irqbalance/irqbalance.mk b/package/irqbalance/irqbalance.mk
index 31f6a427c6..c7676e13cf 100644
--- a/package/irqbalance/irqbalance.mk
+++ b/package/irqbalance/irqbalance.mk
@@ -21,6 +21,9 @@ endif
 
 ifeq ($(BR2_PACKAGE_NCURSES_WCHAR),y)
 IRQBALANCE_DEPENDENCIES += ncurses
+IRQBALANCE_CONF_OPTS += --with-irqbalance-ui
+else
+IRQBALANCE_CONF_OPTS += --without-irqbalance-ui
 endif
 
 ifeq ($(BR2_PACKAGE_NUMACTL),y)
