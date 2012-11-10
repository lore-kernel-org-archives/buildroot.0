From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Nov 2012 23:28:55 +0100
Subject: [Buildroot] [PATCH 1/2] toolchain/gdb: disable support of full gdb
	on target for blackfin
Message-ID: <1352586536-19621-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There is no support in gdb 6.6 for the Blackfin architecture, so
disallow this choice. This fixes the following build failure:

  http://autobuild.buildroot.org/results/e37db29810265a756833da163fda444d967d7874/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/gdb/Config.in |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/gdb/Config.in b/toolchain/gdb/Config.in
index 8acce1e..ca0c821 100644
--- a/toolchain/gdb/Config.in
+++ b/toolchain/gdb/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_GDB
 	bool "Build gdb debugger for the Target"
 	select BR2_PACKAGE_NCURSES
 	depends on BR2_USE_WCHAR
-	depends on !BR2_sh && !BR2_sh64 && !BR2_avr32 && !BR2_microblaze
+	depends on !BR2_sh && !BR2_sh64 && !BR2_avr32 && !BR2_microblaze && !BR2_bfin
 	# The newest versions of gdb require thread debugging in the
 	# toolchain. The only cases for which this is not needed is if
 	# we use gdb 6.8 (marked deprecated)
-- 
1.7.9.5
