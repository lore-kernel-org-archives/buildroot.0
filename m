From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Tue, 29 Jul 2008 11:16:47 +0200
Subject: [Buildroot] [PATCH 1/1] busybox: fix missing dependencies in
	unpacked and config rules
Message-ID: <1217323007-10041-1-git-send-email-hans-christian.egtvedt@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds depedency to host-sed and $(PROJECT_BUILD_DIR) when running
make busybox-config and busybox-unpacked.

Signed-off-by: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
---
 package/busybox/busybox.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index c616e45..969502b 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -127,9 +127,9 @@ busybox: uclibc $(TARGET_DIR)/bin/busybox
 
 busybox-source: $(DL_DIR)/$(BUSYBOX_SOURCE)
 
-busybox-unpacked: $(BUSYBOX_DIR)/.unpacked
+busybox-unpacked: host-sed $(PROJECT_BUILD_DIR) $(BUSYBOX_DIR)/.unpacked
 
-busybox-config: $(BUSYBOX_DIR)/.configured
+busybox-config: host-sed $(PROJECT_BUILD_DIR) $(BUSYBOX_DIR)/.configured
 
 busybox-menuconfig: host-sed $(PROJECT_BUILD_DIR) busybox-source $(BUSYBOX_DIR)/.configured
 	$(MAKE) __TARGET_ARCH=$(ARCH) -C $(BUSYBOX_DIR) menuconfig
-- 
1.5.4.3
