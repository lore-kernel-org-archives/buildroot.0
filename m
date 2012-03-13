From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 13 Mar 2012 13:08:07 +0100
Subject: [Buildroot] [git commit] atngw100_defconfig: drop atomic64_t patch
	as it is now upstream
Message-ID: <20120313120857.0D8D690D5F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b204ace147efd73356d2df9da57c24d7c066488c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since 3.2.10.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 configs/atngw100_defconfig                         |    1 -
 ...1-avr32-select-generic-atomic64_t-support.patch |   33 --------------------
 2 files changed, 0 insertions(+), 34 deletions(-)

diff --git a/configs/atngw100_defconfig b/configs/atngw100_defconfig
index 57e39bd..9ab6c03 100644
--- a/configs/atngw100_defconfig
+++ b/configs/atngw100_defconfig
@@ -18,5 +18,4 @@ BR2_TARGET_UBOOT_2010_09=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_PATCH="linux/linux-3.2.5-0001-avr32-select-generic-atomic64_t-support.patch"
 BR2_LINUX_KERNEL_DEFCONFIG="atngw100"
diff --git a/linux/linux-3.2.5-0001-avr32-select-generic-atomic64_t-support.patch b/linux/linux-3.2.5-0001-avr32-select-generic-atomic64_t-support.patch
deleted file mode 100644
index 95f2cf9..0000000
--- a/linux/linux-3.2.5-0001-avr32-select-generic-atomic64_t-support.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 31e0017e6f6fb5cfdfaf932c1f98c9bef8d57688 Mon Sep 17 00:00:00 2001
-From: Fabio Baltieri <fabio.baltieri@gmail.com>
-Date: Fri, 3 Feb 2012 15:37:14 -0800
-Subject: [PATCH 1/1] avr32: select generic atomic64_t support
-
-Enable use of the generic atomic64 implementation on AVR32 platforms.
-Without this the kernel fails to build as the architecture does not
-provide its version.
-
-Signed-off-by: Fabio Baltieri <fabio.baltieri@gmail.com>
-Acked-by: Hans-Christian Egtvedt <egtvedt@samfundet.no>
-Cc: Haavard Skinnemoen <hskinnemoen@gmail.com>
-Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
-Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
----
- arch/avr32/Kconfig |    1 +
- 1 files changed, 1 insertions(+), 0 deletions(-)
-
-diff --git a/arch/avr32/Kconfig b/arch/avr32/Kconfig
-index 197e96f..3dea7231 100644
---- a/arch/avr32/Kconfig
-+++ b/arch/avr32/Kconfig
-@@ -8,6 +8,7 @@ config AVR32
- 	select HAVE_KPROBES
- 	select HAVE_GENERIC_HARDIRQS
- 	select GENERIC_IRQ_PROBE
-+	select GENERIC_ATOMIC64
- 	select HARDIRQS_SW_RESEND
- 	select GENERIC_IRQ_SHOW
- 	select ARCH_HAVE_NMI_SAFE_CMPXCHG
--- 
-1.7.7
-
