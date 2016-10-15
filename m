From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Oct 2016 22:34:08 +0200
Subject: [Buildroot] [git commit] configs/arm_juno: use official kernel
	tarball
Message-ID: <20161015205123.1377981DD3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=51ec1dc27e7d0bd47226f124d4791e9f6cd3cbcf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since commit
0924208839336f1a1bb29eb1a627005ba6b9065d ("configs/arm_juno: use 4.6
mainline kernel"), we're using a mainline kernel for the ARM Juno
board. But we're still fetching it from a Git repository, which is not
really efficient, so let's switch to use a tarball instead.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/arm_juno_defconfig | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/configs/arm_juno_defconfig b/configs/arm_juno_defconfig
index 8bc3a7a..811524f 100644
--- a/configs/arm_juno_defconfig
+++ b/configs/arm_juno_defconfig
@@ -3,9 +3,8 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_6=y
 BR2_TARGET_GENERIC_HOSTNAME="juno-buildroot"
 BR2_TARGET_GENERIC_ISSUE="Welcome to SNPS Juno by Buildroot"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_GIT=y
-BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="v4.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.6"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/arm/juno/linux-juno-defconfig"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
