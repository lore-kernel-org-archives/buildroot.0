From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 14 Oct 2012 20:14:39 +0200
Subject: [Buildroot] [git commit] gdb: target gdb not available on microblaze
Message-ID: <20121014182021.0D5ED9985F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4e5f63a569c00ec97869b1b21410047ffd837813
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes

  http://autobuild.buildroot.org/results/5950c95ca12721dd910ad72fe52bfa9ac45a5120/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/gdb/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
 
