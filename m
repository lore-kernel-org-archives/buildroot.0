From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 14 Nov 2016 23:05:34 +0100
Subject: [Buildroot] [PATCH] package/gdb: disable simulator support for
	microblaze
Message-ID: <1479161134-10097-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The gdb simulator seems missing with the Xilinx fork of gdb.
Disable it for microblaze since only the Xilinx version of gdb is
currently available.

Fixes:
http://autobuild.buildroot.net/results/907/9079dad3f138c313a6abb40825baf4d9683a2422

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Waldemar Brodkorb <mail@waldemar-brodkorb.de>
---
 package/gdb/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index b6eb41f..da6b30e 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -27,7 +27,7 @@ config BR2_PACKAGE_HOST_GDB_PYTHON
 
 config BR2_PACKAGE_HOST_GDB_SIM
 	bool "Simulator support"
-	depends on !BR2_arc
+	depends on !BR2_arc && !BR2_microblaze
 	help
 	  This option enables the simulator support in the cross gdb.
 
-- 
2.5.5
