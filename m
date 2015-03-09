From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 9 Mar 2015 22:51:31 +0100
Subject: [Buildroot] [git commit] minnowboard_max_defconfig: bump kernel to
	3.19.1
Message-ID: <20150309215153.BDFA480E5B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e30fdfa9e199dcd80d6d018652a001819f377207
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../{linux-3.18.config => linux-3.19.config}       |    1 -
 configs/minnowboard_max_defconfig                  |   10 +++++-----
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/board/minnowboard-max/linux-3.18.config b/board/minnowboard-max/linux-3.19.config
similarity index 97%
rename from board/minnowboard-max/linux-3.18.config
rename to board/minnowboard-max/linux-3.19.config
index d13f492..abb7fdc 100644
--- a/board/minnowboard-max/linux-3.18.config
+++ b/board/minnowboard-max/linux-3.19.config
@@ -3,7 +3,6 @@ CONFIG_SMP=y
 CONFIG_X86_INTEL_LPSS=y
 CONFIG_MATOM=y
 CONFIG_EFI=y
-CONFIG_PM_RUNTIME=y
 CONFIG_CPU_FREQ=y
 CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND=y
 CONFIG_X86_INTEL_PSTATE=y
diff --git a/configs/minnowboard_max_defconfig b/configs/minnowboard_max_defconfig
index e8bd0ab..d370f6f 100644
--- a/configs/minnowboard_max_defconfig
+++ b/configs/minnowboard_max_defconfig
@@ -6,10 +6,10 @@ BR2_x86_atom=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/minnowboard-max/post-build.sh"
 
-# Lock to 3.18 headers to avoid breaking with newer kernels
+# Lock to 3.19 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.18.1"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y
+BR2_DEFAULT_KERNEL_VERSION="3.19.1"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_19=y
 
 # Needed for ethernet
 BR2_PACKAGE_LINUX_FIRMWARE=y
@@ -18,9 +18,9 @@ BR2_PACKAGE_LINUX_FIRMWARE_RTL_8169=y
 # Linux kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.18.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.19.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/minnowboard-max/linux-3.18.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/minnowboard-max/linux-3.19.config"
 
 # Bootloader
 BR2_TARGET_GRUB2=y
