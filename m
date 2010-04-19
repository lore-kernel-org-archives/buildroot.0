From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 19 Apr 2010 11:05:30 +0200
Subject: [Buildroot] [git commit master] toolchain/gdb: target-gdb needs
	wchar support in toolchain
Message-ID: <20100419090622.5D56F8B6C9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=816e724a460bcd4b64d4f9cbfd812f90a85efd94
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For the embedded readline/gettext stuff.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/gdb/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/toolchain/gdb/Config.in b/toolchain/gdb/Config.in
index 0e17ff6..e383949 100644
--- a/toolchain/gdb/Config.in
+++ b/toolchain/gdb/Config.in
@@ -3,9 +3,13 @@ comment "Gdb Options"
 config BR2_PACKAGE_GDB
 	bool "Build gdb debugger for the Target"
 	select BR2_PACKAGE_NCURSES
+	depends on BR2_USE_WCHAR
 	help
 	    Build the full gdb debugger to run on the target.
 
+comment "Gdb debugger for the target needs WCHAR support in toolchain"
+	depends on !BR2_USE_WHCAR
+
 config BR2_PACKAGE_GDB_SERVER
 	bool "Build gdb server for the Target"
 	help
-- 
1.6.3.3
