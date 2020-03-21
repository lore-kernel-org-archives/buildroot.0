From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 21 Mar 2020 15:27:17 +0100
Subject: [Buildroot] [git commit] configs/stm32mp157: use common genimage
 config file for stm32mp157 boards
Message-ID: <20200321141447.D0B2F834E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7f82e0933abe3fe8eaf92d4d943e1d8d6b64eb39
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It will be useful for the upcoming introducing stm32mp157a dk2 board.

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../{stm32mp157c-dk2 => common/stm32mp157}/genimage.cfg                 | 0
 configs/stm32mp157c_dk2_defconfig                                       | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/stmicroelectronics/stm32mp157c-dk2/genimage.cfg b/board/stmicroelectronics/common/stm32mp157/genimage.cfg
similarity index 100%
rename from board/stmicroelectronics/stm32mp157c-dk2/genimage.cfg
rename to board/stmicroelectronics/common/stm32mp157/genimage.cfg
diff --git a/configs/stm32mp157c_dk2_defconfig b/configs/stm32mp157c_dk2_defconfig
index 273eda46a0..25a96fa276 100644
--- a/configs/stm32mp157c_dk2_defconfig
+++ b/configs/stm32mp157c_dk2_defconfig
@@ -3,7 +3,7 @@ BR2_cortex_a7=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
 BR2_ROOTFS_OVERLAY="board/stmicroelectronics/stm32mp157c-dk2/overlay/"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/stmicroelectronics/stm32mp157c-dk2/genimage.cfg"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/stmicroelectronics/common/stm32mp157/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.7"
