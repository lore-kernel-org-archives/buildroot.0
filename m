From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 5 Sep 2013 10:54:14 +0200
Subject: [Buildroot] [git commit] calao_usb_a9263_defconfig: lock to kernel
	3.10.x
Message-ID: <20130905085436.EC0549B462@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=104b90c2fb33e4162c2613dc0ffae9663833f7a2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The calao defconfig fails to build with 3.11, so lock the kernel version
to the last version known to build.

For details, see:
http://jenkins.free-electrons.com/job/buildroot/config=calao_usb_a9263_defconfig/105

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 configs/calao_usb_a9263_defconfig |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/configs/calao_usb_a9263_defconfig b/configs/calao_usb_a9263_defconfig
index 422f35e..8dc948a 100644
--- a/configs/calao_usb_a9263_defconfig
+++ b/configs/calao_usb_a9263_defconfig
@@ -9,6 +9,8 @@ BR2_TARGET_AT91BOOTSTRAP_NANDFLASH=y
 BR2_TARGET_BAREBOX=y
 BR2_TARGET_BAREBOX_BOARD_DEFCONFIG="usb_a9263"
 BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.10.10"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/calao/usb-a9263/linux-3.4.4.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
