From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 26 Nov 2013 21:51:41 -0300
Subject: [Buildroot] [PATCH 2/2] qemu/mips64-malta: switch to eglibc
In-Reply-To: <1385513501-23157-1-git-send-email-gustavo@zacarias.com.ar>
References: <1385513501-23157-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1385513501-23157-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It's tested to be far more stable than uClibc.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 board/qemu/mips64-malta/readme.txt  | 2 --
 configs/qemu_mips64_malta_defconfig | 3 +--
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/board/qemu/mips64-malta/readme.txt b/board/qemu/mips64-malta/readme.txt
index 4fa8a19..b655922 100644
--- a/board/qemu/mips64-malta/readme.txt
+++ b/board/qemu/mips64-malta/readme.txt
@@ -6,6 +6,4 @@ The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer. No keyboard support has been
 enabled.
 
-This configuration is known to be flaky.
-
 Tested with QEMU 1.6.1
diff --git a/configs/qemu_mips64_malta_defconfig b/configs/qemu_mips64_malta_defconfig
index e1295dd..011b9c6 100644
--- a/configs/qemu_mips64_malta_defconfig
+++ b/configs/qemu_mips64_malta_defconfig
@@ -3,8 +3,7 @@ BR2_mips64=y
 BR2_MIPS_NABI64=y
 
 # Toolchain
-# uClibc dynamic loader seems broken for mips64
-BR2_PREFER_STATIC_LIB=y
+BR2_TOOLCHAIN_BUILDROOT_EGLIBC=y
 
 # Filesystem
 BR2_TARGET_ROOTFS_EXT2=y
-- 
1.8.3.2
