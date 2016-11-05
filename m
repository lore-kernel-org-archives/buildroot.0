From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Nov 2016 11:54:55 +0100
Subject: [Buildroot] [git commit] configs/nanopi-neo: use a more
	conventional kernel
Message-ID: <20161105105500.22F4C817AD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=97e8db6868bbceb9f46a9fece69492238345b32e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It turns out that linux-4.9-rc3 has all that is needed for the NanoPi
NEO, so use that rather than the franken-kernel I assembled.

Reported-by: Maxime Ripard <maxime.ripard@free-electrons.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/nanopi_neo_defconfig | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/configs/nanopi_neo_defconfig b/configs/nanopi_neo_defconfig
index 2f4ea37..ba4534a 100644
--- a/configs/nanopi_neo_defconfig
+++ b/configs/nanopi_neo_defconfig
@@ -11,11 +11,10 @@ BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the NanoPi NEO"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/nanopi-neo/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/nanopi-neo/post-image.sh"
 
-# Use a special kernel tree until all support finally lands upstream
+# Use a -rc kernel to get the DTS
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_GIT=y
-BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/yann-morin-1998/linux"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="4.9-rc3-sunxi-next-2016-11-02"
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9-rc3"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h3-nanopi-neo"
