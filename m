From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 26 Apr 2014 11:33:21 +0200
Subject: [Buildroot] [git commit] gdb: not available on NIOS II
Message-ID: <20140426093441.3D2CA9CA0C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c2604b1dd5d45c5042765c608fc8ebf520fc0bae
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The mainline gdb does not have support for NIOS II, even just for
gdbserver.

Fixes:

  http://autobuild.buildroot.org/results/e57/e57aa016d6a73e59c404a7eb43c7bf5c16cbcbdc/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gdb/Config.in |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gdb/Config.in b/package/gdb/Config.in
index 5776a97..cc2469e 100644
--- a/package/gdb/Config.in
+++ b/package/gdb/Config.in
@@ -1,5 +1,5 @@
 comment "gdb/gdbserver needs a toolchain w/ threads, threads debug"
-	depends on !BR2_aarch64
+	depends on !BR2_aarch64 && !BR2_nios2
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 
 config BR2_PACKAGE_GDB
@@ -10,7 +10,7 @@ config BR2_PACKAGE_GDB
 	select BR2_PACKAGE_GDB_SERVER if \
 	       (!BR2_PACKAGE_GDB_DEBUGGER && !BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY)
 	depends on BR2_TOOLCHAIN_HAS_THREADS && BR2_TOOLCHAIN_HAS_THREADS_DEBUG
-	depends on !BR2_aarch64
+	depends on !BR2_aarch64 && !BR2_nios2
 	help
 	  GDB, the GNU Project debugger, allows you to see what is
 	  going on `inside' another program while it executes -- or
