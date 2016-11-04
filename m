From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri,  4 Nov 2016 18:19:40 +0100
Subject: [Buildroot] [PATCH] configs/nanopi-neo: use a more conventional
	kernel
Message-ID: <1478279980-20767-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It turns out that linux-4.9-rc3 has all that is needed for the NanoPi
NEO, so use that rather than the franken-kernel I assembled.

Reported-by: Maxime Ripard <maxime.ripard@free-electrons.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
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
-- 
2.7.4
