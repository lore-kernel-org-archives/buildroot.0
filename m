From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 16 Nov 2012 22:25:40 +0100
Subject: [Buildroot] [git commit] gdb: not available on aarch64 for the
	target
Message-ID: <20121116212646.0A71B99FD7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b392a68308d587162e8cf9bf52ede5e8d3dcd2c7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes

  http://autobuild.buildroot.org/results/d32a0fb1584a125cccde521a3960fb87ff7e2de6/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/gdb/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/gdb/Config.in b/toolchain/gdb/Config.in
index ca0c821..50aafdf 100644
--- a/toolchain/gdb/Config.in
+++ b/toolchain/gdb/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_GDB
 	bool "Build gdb debugger for the Target"
 	select BR2_PACKAGE_NCURSES
 	depends on BR2_USE_WCHAR
-	depends on !BR2_sh && !BR2_sh64 && !BR2_avr32 && !BR2_microblaze && !BR2_bfin
+	depends on !BR2_sh && !BR2_sh64 && !BR2_avr32 && !BR2_microblaze && !BR2_bfin && !BR2_aarch64
 	# The newest versions of gdb require thread debugging in the
 	# toolchain. The only cases for which this is not needed is if
 	# we use gdb 6.8 (marked deprecated)
