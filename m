From: Romain Izard <romain.izard.pro@gmail.com>
Date: Fri, 25 Mar 2016 11:17:29 +0100
Subject: [Buildroot] [PATCH 2/2] linux: use olddefconfig with defconfig files
In-Reply-To: <1458901049-3693-1-git-send-email-romain.izard.pro@gmail.com>
References: <1458901049-3693-1-git-send-email-romain.izard.pro@gmail.com>
Message-ID: <1458901049-3693-2-git-send-email-romain.izard.pro@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use the new option, as the linux kernel will not respect the
configuration saved by savedefconfig otherwise.

Signed-off-by: Romain Izard <romain.izard.pro@gmail.com>
---
 linux/linux.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index 7e20255..7e3d5f8 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -202,6 +202,7 @@ endif
 LINUX_KCONFIG_FRAGMENT_FILES = $(call qstrip,$(BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES))
 LINUX_KCONFIG_EDITORS = menuconfig xconfig gconfig nconfig
 LINUX_KCONFIG_OPTS = $(LINUX_MAKE_FLAGS)
+LINUX_KCONFIG_OLDDEFCONFIG = y
 
 # If no package has yet set it, set it from the Kconfig option
 LINUX_NEEDS_MODULES ?= $(BR2_LINUX_NEEDS_MODULES)
-- 
2.5.0
