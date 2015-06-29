From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue, 30 Jun 2015 00:05:22 +0200
Subject: [Buildroot] [PATCH 3/4] olimex_a20_olinuxino_lime: rename board dir
	to remove _lime suffix
In-Reply-To: <1435615523-21039-1-git-send-email-luca@lucaceresoli.net>
References: <1435615523-21039-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1435615523-21039-3-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The files in board/olimex/a20_olinuxino_lime/ work with minimal or no
modifications for the Olimex A20-OLinuXino-Micro board, whose support is
going to be added in a later commit.

Rename the directory to clarify it's not restricted to the Lime anymore.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 board/olimex/{a20_olinuxino_lime => a20_olinuxino}/boot-mali.cmd | 0
 board/olimex/{a20_olinuxino_lime => a20_olinuxino}/boot.cmd      | 0
 board/olimex/{a20_olinuxino_lime => a20_olinuxino}/post-build.sh | 0
 board/olimex/{a20_olinuxino_lime => a20_olinuxino}/readme.txt    | 0
 configs/olimex_a20_olinuxino_lime_defconfig                      | 4 ++--
 configs/olimex_a20_olinuxino_lime_mali_defconfig                 | 4 ++--
 6 files changed, 4 insertions(+), 4 deletions(-)
 rename board/olimex/{a20_olinuxino_lime => a20_olinuxino}/boot-mali.cmd (100%)
 rename board/olimex/{a20_olinuxino_lime => a20_olinuxino}/boot.cmd (100%)
 rename board/olimex/{a20_olinuxino_lime => a20_olinuxino}/post-build.sh (100%)
 rename board/olimex/{a20_olinuxino_lime => a20_olinuxino}/readme.txt (100%)

diff --git a/board/olimex/a20_olinuxino_lime/boot-mali.cmd b/board/olimex/a20_olinuxino/boot-mali.cmd
similarity index 100%
rename from board/olimex/a20_olinuxino_lime/boot-mali.cmd
rename to board/olimex/a20_olinuxino/boot-mali.cmd
diff --git a/board/olimex/a20_olinuxino_lime/boot.cmd b/board/olimex/a20_olinuxino/boot.cmd
similarity index 100%
rename from board/olimex/a20_olinuxino_lime/boot.cmd
rename to board/olimex/a20_olinuxino/boot.cmd
diff --git a/board/olimex/a20_olinuxino_lime/post-build.sh b/board/olimex/a20_olinuxino/post-build.sh
similarity index 100%
rename from board/olimex/a20_olinuxino_lime/post-build.sh
rename to board/olimex/a20_olinuxino/post-build.sh
diff --git a/board/olimex/a20_olinuxino_lime/readme.txt b/board/olimex/a20_olinuxino/readme.txt
similarity index 100%
rename from board/olimex/a20_olinuxino_lime/readme.txt
rename to board/olimex/a20_olinuxino/readme.txt
diff --git a/configs/olimex_a20_olinuxino_lime_defconfig b/configs/olimex_a20_olinuxino_lime_defconfig
index 62f0a4cfc797..33bc10eacce4 100644
--- a/configs/olimex_a20_olinuxino_lime_defconfig
+++ b/configs/olimex_a20_olinuxino_lime_defconfig
@@ -13,8 +13,8 @@ BR2_TARGET_GENERIC_HOSTNAME="a20-olinuxino"
 BR2_TARGET_GENERIC_ISSUE="Welcome to OLinuXino!"
 BR2_TARGET_GENERIC_GETTY=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/olimex/a20_olinuxino_lime/post-build.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="board/olimex/a20_olinuxino_lime/boot.cmd $(TARGET_DIR)/boot"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/olimex/a20_olinuxino/post-build.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="board/olimex/a20_olinuxino/boot.cmd $(TARGET_DIR)/boot"
 
 # Kernel
 BR2_LINUX_KERNEL=y
diff --git a/configs/olimex_a20_olinuxino_lime_mali_defconfig b/configs/olimex_a20_olinuxino_lime_mali_defconfig
index dde39ad07472..2a9fa2bf59b8 100644
--- a/configs/olimex_a20_olinuxino_lime_mali_defconfig
+++ b/configs/olimex_a20_olinuxino_lime_mali_defconfig
@@ -13,8 +13,8 @@ BR2_TARGET_GENERIC_HOSTNAME="a20-olinuxino"
 BR2_TARGET_GENERIC_ISSUE="Welcome to OLinuXino!"
 BR2_TARGET_GENERIC_GETTY=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/olimex/a20_olinuxino_lime/post-build.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="board/olimex/a20_olinuxino_lime/boot-mali.cmd $(TARGET_DIR)/boot"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/olimex/a20_olinuxino/post-build.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="board/olimex/a20_olinuxino/boot-mali.cmd $(TARGET_DIR)/boot"
 
 # Kernel
 BR2_LINUX_KERNEL=y
-- 
1.9.1
