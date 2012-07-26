From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 26 Jul 2012 16:18:37 -0300
Subject: [Buildroot] [PATCH] less: build after busybox
Message-ID: <1343330317-24730-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build less after busybox if it's enabled, since we prefer the full-blown
version over the light one if it's enabled (and busybox would overwrite
the link when built afterwards).

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/less/less.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/less/less.mk b/package/less/less.mk
index b758e46..c0ecf20 100644
--- a/package/less/less.mk
+++ b/package/less/less.mk
@@ -6,7 +6,8 @@
 
 LESS_VERSION = 444
 LESS_SITE = http://www.greenwoodsoftware.com/less
-LESS_DEPENDENCIES = ncurses
+# Build after busybox, full-blown is better
+LESS_DEPENDENCIES = ncurses $(if $(BR2_PACKAGE_BUSYBOX),busybox)
 
 define LESS_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0755 $(@D)/less $(TARGET_DIR)/usr/bin/less
-- 
1.7.8.6
