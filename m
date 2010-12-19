From: =?UTF-8?q?Bj=C3=B8rn=20Forsman?= <bjorn.forsman@gmail.com>
Date: Sun, 19 Dec 2010 19:37:28 +0100
Subject: [Buildroot] [PATCH 1/2] linux: support 'make linux26-nconfig'
Message-ID: <1292783849-8766-1-git-send-email-bjorn.forsman@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bj?rn Forsman <bjorn.forsman@gmail.com>
---
 linux/linux.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 23b89cf..6636a35 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -159,7 +159,7 @@ $(LINUX26_DIR)/.stamp_installed: $(LINUX26_DIR)/.stamp_compiled
 
 linux26: host-module-init-tools $(LINUX26_DEPENDENCIES) $(LINUX26_DIR)/.stamp_installed
 
-linux26-menuconfig linux26-xconfig linux26-gconfig: dirs $(LINUX26_DIR)/.stamp_configured
+linux26-menuconfig linux26-xconfig linux26-gconfig linux26-nconfig: dirs $(LINUX26_DIR)/.stamp_configured
 	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) $(subst linux26-,,$@)
 
 # Support for rebuilding the kernel after the initramfs file list has
-- 
1.7.1
