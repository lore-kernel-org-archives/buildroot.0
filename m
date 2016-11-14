From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Nov 2016 23:48:12 +0100
Subject: [Buildroot] [git commit] package/gdb: disable simulator support for
	microblaze
Message-ID: <20161114224817.D635E818BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9c49afdad67f421f03b1acfc5ed48150c4b36a65
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The gdb simulator seems missing with the Xilinx fork of gdb.
Disable it for microblaze since only the Xilinx version of gdb is
currently available.

Fixes:
http://autobuild.buildroot.net/results/907/9079dad3f138c313a6abb40825baf4d9683a2422

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Waldemar Brodkorb <mail@waldemar-brodkorb.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
 
