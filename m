From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 19 Dec 2020 20:24:45 +0100
Subject: [Buildroot] [PATCH v1] configs/chromebook_elm_defconfig: use linux
 headers same as kernel (5.9 series)
Message-ID: <20201219192445.27681-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use linux headers same as kernel (5.9 series).

Fixes:

  - https://gitlab.com/buildroot.org/buildroot/-/jobs/917539050

  Incorrect selection of kernel headers: expected 5.10.x, got 5.9.x

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 configs/chromebook_elm_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/configs/chromebook_elm_defconfig b/configs/chromebook_elm_defconfig
index 05e82ffc31..4f82370fb9 100644
--- a/configs/chromebook_elm_defconfig
+++ b/configs/chromebook_elm_defconfig
@@ -9,6 +9,9 @@ BR2_GLOBAL_PATCH_DIR="board/chromebook/elm/patches/"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 
+# Linux headers same as kernel (5.9 series)
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_9=y
+
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-- 
2.29.2
