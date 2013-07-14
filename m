From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 14 Jul 2013 22:12:13 +0200
Subject: [Buildroot] [git commit] package/uclibc: ARM OABI is no longer
	supported
Message-ID: <20130714204246.896AA9A49D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d854bd531e67b37929203c4a33acf907c9b88eb1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/uclibc/Config.in |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

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
