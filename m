From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 19 Dec 2012 10:19:56 +0100
Subject: [Buildroot] [git commit] gdb: Needs threads support
Message-ID: <20121219092608.51E039A396@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dd436d46fed1228bdb417c4b5fec0122696efa41
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.org/results/480ee3efd8ffe8043329fec173ef8187bd54e0fb/build-end.log

[Peter: correct autobuilder URL]
Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/gdb/Config.in |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

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
