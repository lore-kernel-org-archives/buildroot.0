From: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Date: Tue, 18 Apr 2017 14:56:30 +0530
Subject: [Buildroot] [PATCH] trinity: needs __sync_val_compare_and_swap_4
Message-ID: <1492507590-2781-1-git-send-email-rahulbedarkar89@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

syscalls/futex.c uses sync_val_compare_and_swap(). So add dependency on
BR2_TOOLCHAIN_HAS_SYNC_4.

Fixes:
  http://autobuild.buildroot.net/results/17f/17f7fe79242a40ff3e588748230de7bf2a010941

Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
---
 package/trinity/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/trinity/Config.in b/package/trinity/Config.in
index 0ce1f9a..0fc737e 100644
--- a/package/trinity/Config.in
+++ b/package/trinity/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_TRINITY_ARCH_SUPPORTS
 	bool
 	default y
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # __sync_val_compare_and_swap_4
 	depends on BR2_aarch64 || BR2_arm || BR2_armeb || BR2_i386 || \
 		BR2_mips || BR2_mipsel || BR2_powerpc || BR2_powerpc64 || \
 		BR2_powerpc64le || BR2_sparc || BR2_x86_64
-- 
2.7.4
