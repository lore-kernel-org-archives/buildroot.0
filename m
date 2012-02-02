From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 2 Feb 2012 09:07:23 +0100
Subject: [Buildroot] [git commit] toolchain-buildroot: enable / default to
	NPTL fr uClibc 0.9.33 as well
Message-ID: <20120202090835.CBAF79099E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8ed392f3d649ef373f2cebce3b4dbab60a867a4e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/toolchain-buildroot/Config.in.2 |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/toolchain/toolchain-buildroot/Config.in.2 b/toolchain/toolchain-buildroot/Config.in.2
index e3fe337..7f2f68f 100644
--- a/toolchain/toolchain-buildroot/Config.in.2
+++ b/toolchain/toolchain-buildroot/Config.in.2
@@ -68,7 +68,7 @@ config BR2_TOOLCHAIN_BUILDROOT_USE_SSP
 
 choice
 	prompt "Thread library implementation"
-	default BR2_PTHREADS_NATIVE if (BR2_UCLIBC_VERSION_SNAPSHOT || BR2_UCLIBC_VERSION_0_9_32) && !BR2_ARM_OABI
+	default BR2_PTHREADS_NATIVE if (!BR2_UCLIBC_VERSION_0_9_31) && !BR2_ARM_OABI
 	default BR2_PTHREADS_OLD
 	help
 	  Use this option to select the thread library implementation
@@ -91,7 +91,7 @@ choice
 	config BR2_PTHREADS_NATIVE
 		bool "Native POSIX Threading (NPTL)"
 	        select BR2_TOOLCHAIN_HAS_THREADS
-		depends on BR2_UCLIBC_VERSION_SNAPSHOT || BR2_UCLIBC_VERSION_0_9_32
+		depends on !BR2_UCLIBC_VERSION_0_9_31
 		depends on !BR2_ARM_OABI
 		depends on !BR2_x86_i386
 endchoice
