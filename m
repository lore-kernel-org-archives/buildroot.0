From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Date: Tue,  5 Aug 2014 14:14:13 +0100
Subject: [Buildroot] [PATCH] gdb: don't block building on AArch64 systems
Message-ID: <1407244453-3082-1-git-send-email-alex.bennee@linaro.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There is no real reason to disable the building of GDB. I suspect the
original patch (be084204) which added the restriction did so not
realising that AArch64 has had thread support in it's toolchain for some
time.

Signed-off-by: Alex Benn?e <alex.bennee@linaro.org>
---
 package/gdb/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gdb/Config.in b/package/gdb/Config.in
index cc2469e..bfbc8d8 100644
--- a/package/gdb/Config.in
+++ b/package/gdb/Config.in
@@ -1,5 +1,5 @@
 comment "gdb/gdbserver needs a toolchain w/ threads, threads debug"
-	depends on !BR2_aarch64 && !BR2_nios2
+	depends on !BR2_nios2
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 
 config BR2_PACKAGE_GDB
@@ -10,7 +10,7 @@ config BR2_PACKAGE_GDB
 	select BR2_PACKAGE_GDB_SERVER if \
 	       (!BR2_PACKAGE_GDB_DEBUGGER && !BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY)
 	depends on BR2_TOOLCHAIN_HAS_THREADS && BR2_TOOLCHAIN_HAS_THREADS_DEBUG
-	depends on !BR2_aarch64 && !BR2_nios2
+	depends on !BR2_nios2
 	help
 	  GDB, the GNU Project debugger, allows you to see what is
 	  going on `inside' another program while it executes -- or
-- 
2.0.4
