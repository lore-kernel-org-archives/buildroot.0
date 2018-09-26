From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 26 Sep 2018 20:17:05 +0200
Subject: [Buildroot] [PATCH 1/1] irqbalance: ui needs ncurses
Message-ID: <20180926181705.26046-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/227543e9760dedeeb4360de49e09baebed98f894

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
-- 
2.17.1
