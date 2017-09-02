From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Sep 2017 20:14:14 +0200
Subject: [Buildroot] [git commit] configs/galileo: add CONFIG_LBDAF=y in the
	kernel configuration
Message-ID: <20170902180712.0932C81D43@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3b7d75748b333a3048fb3be5c6df1522feef9643
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Kernel help-text states, "The ext4 filesystem requires that this feature
be enabled <...> otherwise, it will refuse to mount in the read-write
mode any filesystems that use the huge_file feature, which is enabled by
default by mke2fs.ext4."

If the rootfs is to be (re)mounted rw at boot, this must be set for the
system to successfully come up.

Signed-off-by: Nicholas Sielicki <sielicki@yandex.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/intel/galileo/linux-3.14.config | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/intel/galileo/linux-3.14.config b/board/intel/galileo/linux-3.14.config
index 58564da..e7aa9cf 100644
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
