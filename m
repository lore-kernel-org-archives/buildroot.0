From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 13 Nov 2011 21:32:57 +0100
Subject: [Buildroot] [git commit] target gdb: depend on thread support
Message-ID: <20111113203427.5C0928F314@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=096c185c19d66c6904109b621e14a6ef44c7d9ac
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Compiling gdb for the target requires thread support in the C library,
otherwise:

/home/test/outputs/test-888/toolchain/gdb-7.3.1/gdb/gdb_thread_db.h:37:21: fatal error: pthread.h: No such file or directory

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/gdb/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/toolchain/gdb/Config.in b/toolchain/gdb/Config.in
index af6e56a..8a02255 100644
--- a/toolchain/gdb/Config.in
+++ b/toolchain/gdb/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_GDB
 	bool "Build gdb debugger for the Target"
 	select BR2_PACKAGE_NCURSES
 	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_sh && !BR2_sh64
 	help
 	    Build the full gdb debugger to run on the target.
