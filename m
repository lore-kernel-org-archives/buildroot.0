From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 13 Nov 2011 21:31:39 +0100
Subject: [Buildroot] [git commit] gdb: do not allow native gdb on SuperH
	architecture
Message-ID: <20111113203426.936538F314@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=33b8c556afbe7bf544fee4e0e7263bb4b9284ac1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The gdb debugger does not have support for running as the native
debugger on the SuperH architecture:

 configure: error: "*** Gdb does not support native target sh4-unknown-linux-gnu"

See also http://lists.debian.org/debian-superh/2010/04/msg00000.html.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/gdb/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/toolchain/gdb/Config.in b/toolchain/gdb/Config.in
index e593698..af6e56a 100644
--- a/toolchain/gdb/Config.in
+++ b/toolchain/gdb/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_GDB
 	bool "Build gdb debugger for the Target"
 	select BR2_PACKAGE_NCURSES
 	depends on BR2_USE_WCHAR
+	depends on !BR2_sh && !BR2_sh64
 	help
 	    Build the full gdb debugger to run on the target.
 
