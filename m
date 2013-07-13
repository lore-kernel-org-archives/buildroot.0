From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Jul 2013 00:27:28 +0200
Subject: [Buildroot] [PATCHv2 05/25] package/uclibc: ARM OABI is no longer
	supported
In-Reply-To: <1373754468-7527-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1373754468-7527-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1373754468-7527-6-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/uclibc/Config.in | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index e508342..b9917a7 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -90,7 +90,7 @@ config BR2_TOOLCHAIN_BUILDROOT_LOCALE
 
 choice
 	prompt "Thread library implementation"
-	default BR2_PTHREADS_NATIVE if !BR2_ARM_OABI && !(BR2_avr32 || BR2_xtensa)
+	default BR2_PTHREADS_NATIVE if !(BR2_avr32 || BR2_xtensa)
 	default BR2_PTHREADS_OLD
 	help
 	  Use this option to select the thread library implementation
@@ -114,7 +114,6 @@ choice
 	config BR2_PTHREADS_NATIVE
 		bool "Native POSIX Threading (NPTL)"
 		select BR2_TOOLCHAIN_HAS_THREADS
-		depends on !BR2_ARM_OABI
 		depends on !BR2_x86_i386
 		depends on !BR2_avr32
 		depends on !BR2_xtensa
@@ -186,7 +185,6 @@ config BR2_UCLIBC_ARM_TYPE
 config BR2_UCLIBC_ARM_ABI
 	string
 	depends on BR2_UCLIBC_TARGET_ARCH = "arm"
-	default OABI if BR2_ARM_OABI
 	default EABI if BR2_ARM_EABI
 
 config BR2_UCLIBC_ARM_BX
-- 
1.8.1.2
