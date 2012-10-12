From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Oct 2012 18:30:35 +0200
Subject: [Buildroot] [PATCH] gdb: target gdb not available on microblaze
Message-ID: <1350059435-4570-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes

  http://autobuild.buildroot.org/results/5950c95ca12721dd910ad72fe52bfa9ac45a5120/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/gdb/Config.in |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/gdb/Config.in b/toolchain/gdb/Config.in
index fd6956b..272e196 100644
--- a/toolchain/gdb/Config.in
+++ b/toolchain/gdb/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_GDB
 	select BR2_PACKAGE_NCURSES
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on !BR2_sh && !BR2_sh64 && !BR2_avr32
+	depends on !BR2_sh && !BR2_sh64 && !BR2_avr32 && !BR2_microblaze
 	help
 	    Build the full gdb debugger to run on the target.
 
-- 
1.7.9.5
