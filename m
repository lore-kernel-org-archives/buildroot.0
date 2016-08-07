From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  7 Aug 2016 22:44:34 +0200
Subject: [Buildroot] [PATCH 1/3] defconfigs/kb9202: fix headers version
In-Reply-To: <cover.1470602446.git.yann.morin.1998@free.fr>
References: <cover.1470602446.git.yann.morin.1998@free.fr>
Message-ID: <2d9222ae09209c62ad4d5dbadfff61060fc6a563.1470602446.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
    https://travis-ci.org/buildroot/buildroot-defconfig-testing/jobs/150333697

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 configs/kb9202_defconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/configs/kb9202_defconfig b/configs/kb9202_defconfig
index c38adbf..0aea0eb 100644
--- a/configs/kb9202_defconfig
+++ b/configs/kb9202_defconfig
@@ -5,7 +5,8 @@ BR2_arm920t=y
 # Filesystem
 BR2_TARGET_ROOTFS_TAR=y
 
-# Linux headers same as kernel, a 2.6 series (so, no option selected)
+# Linux headers same as kernel, a 2.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_REALLY_OLD=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
-- 
2.7.4
