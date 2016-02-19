From: Lee Jones <lee.jones@linaro.org>
Date: Fri, 19 Feb 2016 17:09:04 +0000
Subject: [Buildroot] [PATCH 8/9] boards: stm32f469-disco: Add OpenOCD patch
	to supply a new config
In-Reply-To: <1455901745-18486-1-git-send-email-lee.jones@linaro.org>
References: <1455901745-18486-1-git-send-email-lee.jones@linaro.org>
Message-ID: <1455901745-18486-9-git-send-email-lee.jones@linaro.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

At the time of submission, OpenOCD does not support the STM32f469.
This patch adds a new configuration file which provides some board
specifics required to correctly handle the stm32f469-disco dev
board.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 .../patches/openocd/0.9.0/0001-add-config.patch    | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 board/stmicroelectronics/stm32/stm32f469-disco/patches/openocd/0.9.0/0001-add-config.patch

diff --git a/board/stmicroelectronics/stm32/stm32f469-disco/patches/openocd/0.9.0/0001-add-config.patch b/board/stmicroelectronics/stm32/stm32f469-disco/patches/openocd/0.9.0/0001-add-config.patch
new file mode 100644
index 0000000..4404807
--- /dev/null
+++ b/board/stmicroelectronics/stm32/stm32f469-disco/patches/openocd/0.9.0/0001-add-config.patch
@@ -0,0 +1,37 @@
+From 26045588f462476cee356d15a24944d6c26befb4 Mon Sep 17 00:00:00 2001
+From: Maxime Coquelin <mcoquelin.stm32@gmail.com>
+Date: Sat, 24 Oct 2015 00:13:38 +0200
+Subject: [PATCH 1/1] tcl: add STM32F469 discovery board config
+
+Change-Id: Iad7ee06330b3259ea0ce0d174dfdade6785913eb
+Signed-off-by: Maxime Coquelin <mcoquelin.stm32@gmail.com>
+Reviewed-on: http://openocd.zylin.com/3043
+Tested-by: jenkins
+Reviewed-by: Antonio Borneo <borneo.antonio@gmail.com>
+Reviewed-by: Freddie Chopin <freddie.chopin@gmail.com>
+---
+ tcl/board/stm32f469discovery.cfg | 12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+ create mode 100644 tcl/board/stm32f469discovery.cfg
+
+diff --git a/tcl/board/stm32f469discovery.cfg b/tcl/board/stm32f469discovery.cfg
+new file mode 100644
+index 0000000..eecfe33
+--- /dev/null
++++ b/tcl/board/stm32f469discovery.cfg
+@@ -0,0 +1,12 @@
++#
++# This is an STM32F469 discovery board with a single STM32F469NI chip.
++# http://www.st.com/web/catalog/tools/FM116/CL1620/SC959/SS1532/LN1848/PF262395
++#
++
++source [find interface/stlink-v2-1.cfg]
++
++transport select hla_swd
++
++source [find target/stm32f4x.cfg]
++
++reset_config srst_only
+-- 
+1.9.1
+
-- 
1.9.1
