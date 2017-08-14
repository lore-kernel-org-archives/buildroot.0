From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Aug 2017 22:27:41 +0200
Subject: [Buildroot] [git commit] configs/ci20: update kernel and u-boot
Message-ID: <20170814202903.8428B81DE8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0b9c2095ad3443ed17299fb0f9fe13fde76328d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Unbreak failing defconfig.
Resulting kernel and rootfs booted on ci20 device.

While at it, drop the useless BR2_TARGET_UBOOT_VERSION variable, this
variable is a hidden variable, so it is useless to mention it in a
defconfig.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
[Thomas: drop BR2_TARGET_UBOOT_VERSION.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/ci20_defconfig | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/configs/ci20_defconfig b/configs/ci20_defconfig
index ecf3007..6de6394 100644
--- a/configs/ci20_defconfig
+++ b/configs/ci20_defconfig
@@ -13,7 +13,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyS4"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/MIPS/CI20_linux.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="fbf929bc733b82b15f6996d4262a45870f19d214"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="7dff33297116643485ca37141d804eddd793e834"
 BR2_LINUX_KERNEL_DEFCONFIG="ci20"
 
 # u-boot
@@ -22,8 +22,7 @@ BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY=y
 BR2_TARGET_UBOOT_BOARDNAME="ci20_mmc"
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/MIPS/CI20_u-boot"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="a4f583551d0025eb957ee5c9cb68657a429e4914"
-BR2_TARGET_UBOOT_VERSION="a4f583551d0025eb957ee5c9cb68657a429e4914"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="dd3c1b95dac7d10b2ca5806f65e5c1050d7dd0fa"
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/u-boot-spl.bin"
