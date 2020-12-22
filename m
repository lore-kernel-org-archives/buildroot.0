From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 22 Dec 2020 11:50:25 +0100
Subject: [Buildroot] [git commit branch/2020.11.x]
 configs/chromebook_elm_defconfig: use linux headers same as kernel (5.9
 series)
Message-ID: <20201222103540.F16B6884F6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ededbaab79bc6457564c7bd8e0ed3595bf7a5190
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

Use linux headers same as kernel (5.9 series).

Fixes:

  - https://gitlab.com/buildroot.org/buildroot/-/jobs/917539050

  Incorrect selection of kernel headers: expected 5.10.x, got 5.9.x

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 9e67e9e51d25a22b46c0eef54f323946a1ff59f2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
