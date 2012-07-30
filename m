From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Jul 2012 19:22:43 +0200
Subject: [Buildroot] [git commit branch/next] less: build after busybox
Message-ID: <20120802195302.90E6E8E8F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fe355d22785479a646b7875c8b0404ca5d6292e8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Build less after busybox if it's enabled, since we prefer the full-blown
version over the light one if it's enabled (and busybox would overwrite
the link when built afterwards).

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
