From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  4 Jun 2016 18:30:50 +0200
Subject: [Buildroot] [PATCH 4/8 v3] package/busybox: use the generic help
	rules
In-Reply-To: <cover.1465056706.git.yann.morin.1998@free.fr>
References: <cover.1465056706.git.yann.morin.1998@free.fr>
Message-ID: <5538f5b71eb9c9755f23a574f131ec84f11546ea.1465056706.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile                   | 3 ---
 package/busybox/busybox.mk | 5 +++++
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 65f5a65..f5ae613 100644
--- a/Makefile
+++ b/Makefile
@@ -941,9 +941,6 @@ help:
 		@echo $(sep) \
 		@echo '$($(p)_NAME):' $(sep) \
 		$($(p)_HELP_CMDS)$(sep))
-ifeq ($(BR2_PACKAGE_BUSYBOX),y)
-	@echo '  busybox-menuconfig     - Run BusyBox menuconfig'
-endif
 ifeq ($(BR2_LINUX_KERNEL),y)
 	@echo '  linux-menuconfig       - Run Linux kernel menuconfig'
 	@echo '  linux-savedefconfig    - Run Linux kernel savedefconfig'
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index c7fb8b4..5d46e5a 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -10,6 +10,11 @@ BUSYBOX_SOURCE = busybox-$(BUSYBOX_VERSION).tar.bz2
 BUSYBOX_LICENSE = GPLv2
 BUSYBOX_LICENSE_FILES = LICENSE
 
+define BUSYBOX_HELP_CMDS
+	$(call print-help,busybox-menuconfig,Run BusyBox menuconfig)
+	$(call print-help,busybox-nconfig,Run BusyBox nconfig)
+endef
+
 BUSYBOX_CFLAGS = \
 	$(TARGET_CFLAGS)
 
-- 
2.7.4
