From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Thu,  6 Mar 2014 10:42:29 +0100
Subject: [Buildroot] [PATCH v2 4/4] linux: remove dirs dependency
In-Reply-To: <1394098949-31981-1-git-send-email-fabio.porcedda@gmail.com>
References: <1394098949-31981-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1394098949-31981-5-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The "dirs" dependency is redundant because now the "generic-package"
infrastructure add automatically the "dirs" dependency so just remove
the redundant references.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 linux/linux.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 3d52e69..e270705 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -302,12 +302,12 @@ include $(sort $(wildcard linux/linux-ext-*.mk))
 $(eval $(generic-package))
 
 ifeq ($(BR2_LINUX_KERNEL),y)
-linux-menuconfig linux-xconfig linux-gconfig linux-nconfig linux26-menuconfig linux26-xconfig linux26-gconfig linux26-nconfig: dirs linux-configure
+linux-menuconfig linux-xconfig linux-gconfig linux-nconfig linux26-menuconfig linux26-xconfig linux26-gconfig linux26-nconfig: linux-configure
 	$(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) \
 		$(subst linux-,,$(subst linux26-,,$@))
 	rm -f $(LINUX_DIR)/.stamp_{built,target_installed,images_installed}
 
-linux-savedefconfig linux26-savedefconfig: dirs linux-configure
+linux-savedefconfig linux26-savedefconfig: linux-configure
 	$(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) \
 		$(subst linux-,,$(subst linux26-,,$@))
 
-- 
1.8.3.2
