From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Wed, 19 Dec 2012 08:28:14 +0100
Subject: [Buildroot] [PATCH] gdb: Needs threads support
Message-ID: <1355902094-7555-1-git-send-email-maxime.ripard@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.org/results/5a502f16ad94a410ca21c9a7f223d6c12086bbb5/build-end.log

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 toolchain/gdb/Config.in |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/toolchain/gdb/Config.in b/toolchain/gdb/Config.in
index 50aafdf..6a8e48e 100644
--- a/toolchain/gdb/Config.in
+++ b/toolchain/gdb/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_GDB
 	bool "Build gdb debugger for the Target"
 	select BR2_PACKAGE_NCURSES
 	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_sh && !BR2_sh64 && !BR2_avr32 && !BR2_microblaze && !BR2_bfin && !BR2_aarch64
 	# The newest versions of gdb require thread debugging in the
 	# toolchain. The only cases for which this is not needed is if
@@ -15,8 +16,8 @@ config BR2_PACKAGE_GDB
 	help
 	    Build the full gdb debugger to run on the target.
 
-comment "Gdb debugger for the target needs WCHAR support in toolchain"
-	depends on !BR2_USE_WCHAR
+comment "Gdb for the target needs WCHAR and threads support in toolchain"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_GDB_SERVER
 	bool "Build gdb server for the Target"
-- 
1.7.9.5
