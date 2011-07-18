From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 18 Jul 2011 12:12:13 +0200
Subject: [Buildroot] [git commit] toolchain-buildroot: NPTL is only
	supported with EABI on ARM
Message-ID: <20110718101253.E8C548AC5A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=530890bb95a5073002fb5d0b63dcbcfb9f47fde1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

So hide option if OABI is selected.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/toolchain-buildroot/Config.in.2 |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/toolchain/toolchain-buildroot/Config.in.2 b/toolchain/toolchain-buildroot/Config.in.2
index 0c3a510..5df188f 100644
--- a/toolchain/toolchain-buildroot/Config.in.2
+++ b/toolchain/toolchain-buildroot/Config.in.2
@@ -78,7 +78,7 @@ config BR2_TOOLCHAIN_BUILDROOT_USE_SSP
 
 choice
 	prompt "Thread library implementation"
-	default BR2_PTHREADS_NATIVE if BR2_UCLIBC_VERSION_SNAPSHOT || BR2_UCLIBC_VERSION_0_9_32
+	default BR2_PTHREADS_NATIVE if (BR2_UCLIBC_VERSION_SNAPSHOT || BR2_UCLIBC_VERSION_0_9_32) && !BR2_ARM_OABI
 	default BR2_PTHREADS_OLD
 	help
 	  Use this option to select the thread library implementation
@@ -102,6 +102,7 @@ choice
 		bool "Native POSIX Threading (NPTL)"
 	        select BR2_TOOLCHAIN_HAS_THREADS
 		depends on BR2_UCLIBC_VERSION_SNAPSHOT || BR2_UCLIBC_VERSION_0_9_32
+		depends on !BR2_ARM_OABI
 		depends on !BR2_x86_i386
 endchoice
 
-- 
1.7.3.4
