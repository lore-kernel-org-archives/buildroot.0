From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Jun 2016 21:56:34 +0200
Subject: [Buildroot] [git commit] package/busybox: use the generic help rules
Message-ID: <20160607201335.922E58074E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9f4f9c7440d589f7e68a61ae1771ac84be100dd4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
[Thomas: don't use a helper.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile                   | 3 ---
 package/busybox/busybox.mk | 4 ++++
 2 files changed, 4 insertions(+), 3 deletions(-)

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
index c7fb8b4..08d8e64 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -10,6 +10,10 @@ BUSYBOX_SOURCE = busybox-$(BUSYBOX_VERSION).tar.bz2
 BUSYBOX_LICENSE = GPLv2
 BUSYBOX_LICENSE_FILES = LICENSE
 
+define BUSYBOX_HELP_CMDS
+	@echo '  busybox-menuconfig     - Run BusyBox menuconfig'
+endef
+
 BUSYBOX_CFLAGS = \
 	$(TARGET_CFLAGS)
 
