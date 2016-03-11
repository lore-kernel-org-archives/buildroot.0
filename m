From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 11 Mar 2016 18:41:14 +0100
Subject: [Buildroot] [PATCH 6/9 v2] package/busybox: use the generic help
	rules
In-Reply-To: <cover.1457717002.git.yann.morin.1998@free.fr>
References: <cover.1457717002.git.yann.morin.1998@free.fr>
Message-ID: <49567b66fb40db8c650b7e17fd9cd9fcff6aa671.1457717002.git.yann.morin.1998@free.fr>
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
index fd953b2..43fa20e 100644
--- a/Makefile
+++ b/Makefile
@@ -935,9 +935,6 @@ help-internal:
 	@echo '  <pkg>-reconfigure      - Restart the build from the configure step'
 	@echo '  <pkg>-rebuild          - Restart the build from the build step'
 	@$(call print-help,$(PACKAGE_HELP))
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
