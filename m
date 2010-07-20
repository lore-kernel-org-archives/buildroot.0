From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 20 Jul 2010 08:45:45 +0200
Subject: [Buildroot] [git commit master 1/1] linux: linux26-{menu, x,
	g}config needs host-sed
Message-ID: <20100720064714.6470682B80@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=c9ff3273eb94078ad342d0a3e08e1757bced2afa
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Similar to how it's done for uclibc-menuconfig.

Reported-by: Paul Jones <paul@pauljones.id.au>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 linux/linux.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 593a1b4..a3e5a0c 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -137,7 +137,7 @@ $(LINUX26_DIR)/.stamp_installed: $(LINUX26_DIR)/.stamp_compiled
 
 linux26: host-module-init-tools $(LINUX26_DEPENDENCIES) $(LINUX26_DIR)/.stamp_installed
 
-linux26-menuconfig linux26-xconfig linux26-gconfig: $(LINUX26_DIR)/.stamp_configured
+linux26-menuconfig linux26-xconfig linux26-gconfig: host-sed dirs $(LINUX26_DIR)/.stamp_configured
 	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) $(subst linux26-,,$@)
 
 # Support for rebuilding the kernel after the initramfs file list has
-- 
1.7.1
