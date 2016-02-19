From: Lee Jones <lee.jones@linaro.org>
Date: Fri, 19 Feb 2016 17:09:05 +0000
Subject: [Buildroot] [PATCH 9/9] boards: stm32f469-disco: Add OpenOCD patch
	to support on-board flash chip
In-Reply-To: <1455901745-18486-1-git-send-email-lee.jones@linaro.org>
References: <1455901745-18486-1-git-send-email-lee.jones@linaro.org>
Message-ID: <1455901745-18486-10-git-send-email-lee.jones@linaro.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

At the time of submission, OpenOCD does not support the STM32f469.
This patch adds support for the STM32F469-DISCO's on-board flash
chip.  Without this patch there is no way to flash the board.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 .../patches/openocd/0.9.0/0002-flash-nor.patch     | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 board/stmicroelectronics/stm32/stm32f469-disco/patches/openocd/0.9.0/0002-flash-nor.patch

diff --git a/board/stmicroelectronics/stm32/stm32f469-disco/patches/openocd/0.9.0/0002-flash-nor.patch b/board/stmicroelectronics/stm32/stm32f469-disco/patches/openocd/0.9.0/0002-flash-nor.patch
new file mode 100644
index 0000000..068613c
--- /dev/null
+++ b/board/stmicroelectronics/stm32/stm32f469-disco/patches/openocd/0.9.0/0002-flash-nor.patch
@@ -0,0 +1,37 @@
+From 3e219648c80a27f0519003f3b088cbb846e255d8 Mon Sep 17 00:00:00 2001
+From: Maxime Coquelin <maxime.coquelin@st.com>
+Date: Sat, 24 Oct 2015 00:03:54 +0200
+Subject: [PATCH 1/1] flash/nor/stm32f2x: Add STM32F469 part
+
+Change-Id: I4e13ceb0ba954dc2fea059ddeef10109be938c9c
+Signed-off-by: Maxime Coquelin <mcoquelin.stm32@gmail.com>
+Reviewed-on: http://openocd.zylin.com/3042
+Tested-by: jenkins
+Reviewed-by: Freddie Chopin <freddie.chopin@gmail.com>
+---
+ src/flash/nor/stm32f2x.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/flash/nor/stm32f2x.c b/src/flash/nor/stm32f2x.c
+index 2130444..89fc75d 100644
+--- a/src/flash/nor/stm32f2x.c
++++ b/src/flash/nor/stm32f2x.c
+@@ -790,6 +790,7 @@ static int stm32x_probe(struct flash_bank *bank)
+ 		max_flash_size_in_kb = 1024;
+ 		break;
+ 	case 0x419:
++	case 0x434:
+ 		max_flash_size_in_kb = 2048;
+ 		break;
+ 	case 0x423:
+@@ -952,6 +953,7 @@ static int get_stm32x_info(struct flash_bank *bank, char *buf, int buf_size)
+ 
+ 	case 0x413:
+ 	case 0x419:
++	case 0x434:
+ 		device_str = "STM32F4xx";
+ 
+ 		switch (rev_id) {
+-- 
+1.9.1
+
-- 
1.9.1
