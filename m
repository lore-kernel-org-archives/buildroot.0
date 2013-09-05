From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 5 Sep 2013 09:47:06 +0200
Subject: [Buildroot] [git commit] calao_usb_a9g20_lpw_defconfig: lock to
	kernel 3.10.x
Message-ID: <20130905084829.5BEF59B708@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=acdff25a9666380da014f6f3e304530d02d8d81f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The calao defconfig fails to build with 3.11, so lock the kernel version
to the last version known to build.

For details, see:
http://jenkins.free-electrons.com/job/buildroot/config=calao_usb_a9g20_lpw_defconfig/105

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 configs/calao_usb_a9g20_lpw_defconfig |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/configs/calao_usb_a9g20_lpw_defconfig b/configs/calao_usb_a9g20_lpw_defconfig
index 4a644da..cf114d9 100644
--- a/configs/calao_usb_a9g20_lpw_defconfig
+++ b/configs/calao_usb_a9g20_lpw_defconfig
@@ -10,6 +10,8 @@ BR2_TARGET_BAREBOX=y
 BR2_TARGET_BAREBOX_CUSTOM_PATCH_DIR="board/calao/usb-a9g20-lpw/"
 BR2_TARGET_BAREBOX_BOARD_DEFCONFIG="usb_a9g20"
 BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.10.10"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/calao/usb-a9g20-lpw/linux-3.4.4.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
