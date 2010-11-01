From: Malte Starostik <m-starostik@versanet.de>
Date: Mon,  1 Nov 2010 01:05:55 +0100
Subject: [Buildroot] [PATCH] Add linux26-nconfig target
Message-ID: <1288569955-2507-1-git-send-email-m-starostik@versanet.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Works just like linux26-menuconfig et al.

Signed-off-by: Malte Starostik <m-starostik@versanet.de>
---
 linux/linux.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 7f7bb05..9a66282 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -138,7 +138,7 @@ $(LINUX26_DIR)/.stamp_installed: $(LINUX26_DIR)/.stamp_compiled
 
 linux26: host-module-init-tools $(LINUX26_DEPENDENCIES) $(LINUX26_DIR)/.stamp_installed
 
-linux26-menuconfig linux26-xconfig linux26-gconfig: dirs $(LINUX26_DIR)/.stamp_configured
+linux26-menuconfig linux26-xconfig linux26-gconfig linux26-nconfig: dirs $(LINUX26_DIR)/.stamp_configured
 	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) $(subst linux26-,,$@)
 
 # Support for rebuilding the kernel after the initramfs file list has
-- 
1.7.2.2
