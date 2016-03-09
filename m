From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  9 Mar 2016 23:22:23 +0100
Subject: [Buildroot] [PATCH 4/8] package/busybox: use the generic help rules
In-Reply-To: <cover.1457561521.git.yann.morin.1998@free.fr>
References: <cover.1457561521.git.yann.morin.1998@free.fr>
Message-ID: <4b71c3a47cadeed2b63cf9101062772b57017049.1457561521.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: J?r?me Pouiller <jezz@sysmic.org>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile                   | 3 ---
 package/busybox/busybox.mk | 2 ++
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 72935b0..8134a14 100644
--- a/Makefile
+++ b/Makefile
@@ -933,9 +933,6 @@ help:
 	@echo '  <pkg>-reconfigure      - Restart the build from the configure step'
 	@echo '  <pkg>-rebuild          - Restart the build from the build step'
 	@$(call HELP_RULE,$(PACKAGE_HELP))
-ifeq ($(BR2_PACKAGE_BUSYBOX),y)
-	@echo '  busybox-menuconfig     - Run BusyBox menuconfig'
-endif
 ifeq ($(BR2_LINUX_KERNEL),y)
 	@echo '  linux-menuconfig       - Run Linux kernel menuconfig'
 	@echo '  linux-savedefconfig    - Run Linux kernel savedefconfig'
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 7c904c8..135f2e1 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -10,6 +10,8 @@ BUSYBOX_SOURCE = busybox-$(BUSYBOX_VERSION).tar.bz2
 BUSYBOX_LICENSE = GPLv2
 BUSYBOX_LICENSE_FILES = LICENSE
 
+BUSYBOX_HELP = "busybox-menuconfig : Run BusyBox menuconfig"
+
 BUSYBOX_CFLAGS = \
 	$(TARGET_CFLAGS)
 
-- 
1.9.1
