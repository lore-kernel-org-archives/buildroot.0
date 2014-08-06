From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Date: Wed,  6 Aug 2014 09:42:14 +0100
Subject: [Buildroot] [PATCH V2] gdb: allow building on AArch64 systems
Message-ID: <1407314534-5536-1-git-send-email-alex.bennee@linaro.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gdb has had AArch64 support since 7.6 which is now the default minimum
version of GDB in the tree. Older versions are now legacy.

Signed-off-by: Alex Benn?e <alex.bennee@linaro.org>

---

v2:
  - reword commit.
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
