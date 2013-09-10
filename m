From: Ryan Coe <bluemrp9@gmail.com>
Date: Tue, 10 Sep 2013 14:58:35 -0700
Subject: [Buildroot] [PATCH 1/1] linux: update depmod path for install to
	target
Message-ID: <1378850315-22371-1-git-send-email-bluemrp9@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
---
 linux/linux.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 649d06b..1650143 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -274,7 +274,7 @@ define LINUX_INSTALL_TARGET_CMDS
 	# directories, not relevant on the target
 	@if grep -q "CONFIG_MODULES=y" $(@D)/.config; then 	\
 		$(TARGET_MAKE_ENV) $(MAKE1) $(LINUX_MAKE_FLAGS) -C $(@D) 		\
-			DEPMOD="$(HOST_DIR)/usr/sbin/depmod" modules_install ;		\
+			DEPMOD="$(HOST_DIR)/sbin/depmod" modules_install ;		\
 		rm -f $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/build ;		\
 		rm -f $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/source ;	\
 	fi
-- 
1.8.1.2
