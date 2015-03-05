From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 Mar 2015 21:18:35 +0100
Subject: [Buildroot] [git commit] linux: clarify kernel configuration entries
Message-ID: <20150305201842.9C54281807@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=18215323070ee00240879429224511af43bbc14d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE can either be a complete
.config file or a defconfig file, it can be confusing to the user
whether to choose BR2_LINUX_KERNEL_USE_DEFCONFIG or
BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG.

To avoid that confusion, clarify Kconfig entry messages for in-tree
defconfig and custom (def)config files.

Signed-off-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/Config.in |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 95c847b..36d7691 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -140,10 +140,10 @@ choice
 	default BR2_LINUX_KERNEL_USE_DEFCONFIG
 
 config BR2_LINUX_KERNEL_USE_DEFCONFIG
-	bool "Using a defconfig"
+	bool "Using an in-tree defconfig file"
 
 config BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG
-	bool "Using a custom config file"
+	bool "Using a custom (def)config file"
 
 endchoice
 
@@ -161,6 +161,9 @@ config BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE
 	help
 	  Path to the kernel configuration file
 
+	  Note: this can be a defconfig file or a complete .config file,
+	  which can later be saved back with make linux-update-(def)config.
+
 #
 # Binary format
 #
