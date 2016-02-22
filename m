From: Lee Jones <lee.jones@linaro.org>
Date: Mon, 22 Feb 2016 18:59:16 +0000
Subject: [Buildroot] [PATCH v2 02/15] boards: stm32f469-disco: Add kernel
	patch to provide top compatible string
In-Reply-To: <1456167569-8713-1-git-send-email-lee.jones@linaro.org>
References: <1456167569-8713-1-git-send-email-lee.jones@linaro.org>
Message-ID: <1456167569-8713-3-git-send-email-lee.jones@linaro.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

At the time of submission, the Mainline kernel does not currently
support the STM32f469.  This patch ensures the correct DTB will be
matched on boot.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 .../kernel/0001-kernel-add-top-compatible.patch    | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 board/stmicroelectronics/stm32/stm32f469-disco/patches/kernel/0001-kernel-add-top-compatible.patch

diff --git a/board/stmicroelectronics/stm32/stm32f469-disco/patches/kernel/0001-kernel-add-top-compatible.patch b/board/stmicroelectronics/stm32/stm32f469-disco/patches/kernel/0001-kernel-add-top-compatible.patch
new file mode 100644
index 0000000..6f920a6
--- /dev/null
+++ b/board/stmicroelectronics/stm32/stm32f469-disco/patches/kernel/0001-kernel-add-top-compatible.patch
@@ -0,0 +1,25 @@
+From 6bd8bae3dd0631f8d23e63617dca289f162e6840 Mon Sep 17 00:00:00 2001
+From: Lee Jones <lee.jones@linaro.org>
+Date: Tue, 16 Feb 2016 14:04:17 +0000
+Subject: [PATCH 3/3] ARM: stm32: Identify a new board - STM32F469
+
+Signed-off-by: Lee Jones <lee.jones@linaro.org>
+---
+ arch/arm/mach-stm32/board-dt.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/arch/arm/mach-stm32/board-dt.c b/arch/arm/mach-stm32/board-dt.c
+index f2ad772..ceee477 100644
+--- a/arch/arm/mach-stm32/board-dt.c
++++ b/arch/arm/mach-stm32/board-dt.c
+@@ -10,6 +10,7 @@
+ 
+ static const char *const stm32_compat[] __initconst = {
+ 	"st,stm32f429",
++	"st,stm32f469",
+ 	NULL
+ };
+ 
+-- 
+1.9.1
+
-- 
1.9.1
