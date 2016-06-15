From: Vlad Zakharov <Vladislav.Zakharov@synopsys.com>
Date: Wed, 15 Jun 2016 13:28:21 +0300
Subject: [Buildroot] [PATCH] host-gdb: Forbid simulator for ARC
Message-ID: <1465986501-16710-1-git-send-email-vzakhar@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Forbid BR2_PACKAGE_HOST_GDB_SIM selection for ARC architectures.
Simulator isn't supported by ARC.

Fixes: http://autobuild.buildroot.net/results/4a1/4a1cd9a0beaff34830fd0f0ec47c30eda0a42d54//
Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>
---
 package/gdb/Config.in.host | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 7b319f5..004c53c 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -25,6 +25,7 @@ config BR2_PACKAGE_HOST_GDB_PYTHON
 
 config BR2_PACKAGE_HOST_GDB_SIM
 	bool "Simulator support"
+  	depends on !BR2_arc
 	help
 	  This option enables the simulator support in the cross gdb.
 
-- 
2.5.5
