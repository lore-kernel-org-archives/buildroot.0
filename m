From: Nicholas Sielicki <sielicki@yandex.com>
Date: Sat,  2 Sep 2017 03:10:32 -0500
Subject: [Buildroot] [PATCH] configs/galileo: CONFIG_LBDAF=y
Message-ID: <20170902081032.24935-1-sielicki@yandex.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Kernel help-text states, "The ext4 filesystem requires that this feature
be enabled <...> otherwise, it will refuse to mount in the read-write
mode any filesystems that use the huge_file feature, which is enabled by
default by mke2fs.ext4."

If the rootfs is to be (re)mounted rw at boot, this must be set for the
system to successfully come up.

Signed-off-by: Nicholas Sielicki <sielicki@yandex.com>
---
 board/intel/galileo/linux-3.14.config | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/intel/galileo/linux-3.14.config b/board/intel/galileo/linux-3.14.config
index 58564da9e..e7aa9cf23 100644
--- a/board/intel/galileo/linux-3.14.config
+++ b/board/intel/galileo/linux-3.14.config
@@ -28,7 +28,7 @@ CONFIG_EMBEDDED=y
 CONFIG_JUMP_LABEL=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
-# CONFIG_LBDAF is not set
+CONFIG_LBDAF=y
 CONFIG_PARTITION_ADVANCED=y
 CONFIG_BSD_DISKLABEL=y
 # CONFIG_ZONE_DMA is not set
-- 
2.14.1
