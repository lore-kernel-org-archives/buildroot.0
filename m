From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Date: Wed, 29 Feb 2012 14:51:34 +0100
Subject: [Buildroot] [PATCH 1/1] avr32/defconfig: use current stable kernel
	instead of the old 2.6.35
Message-ID: <1330523494-20886-1-git-send-email-plagnioj@jcrosoft.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop the patch for kernel >= 3.3

Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
---
HI,

	Can we have this for this release

Best Regards,
J.
 configs/atngw100_defconfig                         |    4 +--
 ...1-avr32-select-generic-atomic64_t-support.patch |   33 ++++++++++++++++++++
 2 files changed, 34 insertions(+), 3 deletions(-)
 create mode 100644 linux/linux-3.2.5-0001-avr32-select-generic-atomic64_t-support.patch

diff --git a/configs/atngw100_defconfig b/configs/atngw100_defconfig
index 5373b44..57e39bd 100644
--- a/configs/atngw100_defconfig
+++ b/configs/atngw100_defconfig
@@ -18,7 +18,5 @@ BR2_TARGET_UBOOT_2010_09=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="2.6.35"
-BR2_LINUX_KERNEL_USE_DEFCONFIG=y
+BR2_LINUX_KERNEL_PATCH="linux/linux-3.2.5-0001-avr32-select-generic-atomic64_t-support.patch"
 BR2_LINUX_KERNEL_DEFCONFIG="atngw100"
diff --git a/linux/linux-3.2.5-0001-avr32-select-generic-atomic64_t-support.patch b/linux/linux-3.2.5-0001-avr32-select-generic-atomic64_t-support.patch
new file mode 100644
index 0000000..95f2cf9
--- /dev/null
+++ b/linux/linux-3.2.5-0001-avr32-select-generic-atomic64_t-support.patch
@@ -0,0 +1,33 @@
+From 31e0017e6f6fb5cfdfaf932c1f98c9bef8d57688 Mon Sep 17 00:00:00 2001
+From: Fabio Baltieri <fabio.baltieri@gmail.com>
+Date: Fri, 3 Feb 2012 15:37:14 -0800
+Subject: [PATCH 1/1] avr32: select generic atomic64_t support
+
+Enable use of the generic atomic64 implementation on AVR32 platforms.
+Without this the kernel fails to build as the architecture does not
+provide its version.
+
+Signed-off-by: Fabio Baltieri <fabio.baltieri@gmail.com>
+Acked-by: Hans-Christian Egtvedt <egtvedt@samfundet.no>
+Cc: Haavard Skinnemoen <hskinnemoen@gmail.com>
+Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
+Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
+---
+ arch/avr32/Kconfig |    1 +
+ 1 files changed, 1 insertions(+), 0 deletions(-)
+
+diff --git a/arch/avr32/Kconfig b/arch/avr32/Kconfig
+index 197e96f..3dea7231 100644
+--- a/arch/avr32/Kconfig
++++ b/arch/avr32/Kconfig
+@@ -8,6 +8,7 @@ config AVR32
+ 	select HAVE_KPROBES
+ 	select HAVE_GENERIC_HARDIRQS
+ 	select GENERIC_IRQ_PROBE
++	select GENERIC_ATOMIC64
+ 	select HARDIRQS_SW_RESEND
+ 	select GENERIC_IRQ_SHOW
+ 	select ARCH_HAVE_NMI_SAFE_CMPXCHG
+-- 
+1.7.7
+
-- 
1.7.7
