From: Lee Jones <lee.jones@linaro.org>
Date: Fri, 19 Feb 2016 17:09:02 +0000
Subject: [Buildroot] [PATCH 6/9] boards: stm32f469-disco: Add kernel patch
	to set RAM address to 0
In-Reply-To: <1455901745-18486-1-git-send-email-lee.jones@linaro.org>
References: <1455901745-18486-1-git-send-email-lee.jones@linaro.org>
Message-ID: <1455901745-18486-7-git-send-email-lee.jones@linaro.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

At the time of submission, the Mainline kernel does not currently
support the STM32f469.  This patch adds a new config fragment which
we can use to adjust the start of RAM address to 0.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 .../kernel/0003-kernel-config-frag-ram.patch       | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 board/stmicroelectronics/stm32/stm32f469-disco/patches/kernel/0003-kernel-config-frag-ram.patch

diff --git a/board/stmicroelectronics/stm32/stm32f469-disco/patches/kernel/0003-kernel-config-frag-ram.patch b/board/stmicroelectronics/stm32/stm32f469-disco/patches/kernel/0003-kernel-config-frag-ram.patch
new file mode 100644
index 0000000..f137956
--- /dev/null
+++ b/board/stmicroelectronics/stm32/stm32f469-disco/patches/kernel/0003-kernel-config-frag-ram.patch
@@ -0,0 +1,28 @@
+From 4cb65563325bee1886329b97ce3e2b0b90106bdd Mon Sep 17 00:00:00 2001
+From: Lee Jones <lee.jones@linaro.org>
+Date: Tue, 16 Feb 2016 13:56:13 +0000
+Subject: [PATCH 2/3] ARM: configs: Add new config fragment to change RAM start
+ point
+
+Rather than duplicate a defconfig for each difference
+between platforms, we can choose to pick a basic defconfig and
+manipulate it at run-time using config fragments.  Here we're
+adding a new fragment to over-ride the RAM start point to 0x0.
+
+Cc: Arnd Bergmann <arnd@arndb.de>
+Signed-off-by: Lee Jones <lee.jones@linaro.org>
+---
+ arch/arm/configs/dram_0x00000000.config | 1 +
+ 1 file changed, 1 insertion(+)
+ create mode 100644 arch/arm/configs/dram_0x00000000.config
+
+diff --git a/arch/arm/configs/dram_0x00000000.config b/arch/arm/configs/dram_0x00000000.config
+new file mode 100644
+index 0000000..db96dcb
+--- /dev/null
++++ b/arch/arm/configs/dram_0x00000000.config
+@@ -0,0 +1 @@
++CONFIG_DRAM_BASE=0x00000000
+-- 
+1.9.1
+
-- 
1.9.1
