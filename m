From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 14 May 2012 22:36:53 +0200
Subject: [Buildroot] [git commit] gdb: not available on avr32
Message-ID: <20120514203718.9B8D196CE4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ef10335f6f678052e7751fd8e03903c9f713789a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.org/results/1c6cfa7f069e2b7d8a7dacf76fbf95b7909fb37a/build-end.log.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/gdb/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/gdb/Config.in b/toolchain/gdb/Config.in
index c9c54b8..fd6956b 100644
--- a/toolchain/gdb/Config.in
+++ b/toolchain/gdb/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_GDB
 	select BR2_PACKAGE_NCURSES
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on !BR2_sh && !BR2_sh64
+	depends on !BR2_sh && !BR2_sh64 && !BR2_avr32
 	help
 	    Build the full gdb debugger to run on the target.
 
