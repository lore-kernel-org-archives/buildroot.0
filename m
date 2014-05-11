From: Cody P Schafer <cody@linux.vnet.ibm.com>
Date: Sun, 11 May 2014 14:11:13 -0700
Subject: [Buildroot] [PATCH v2 2/2] package/gdb: add gdb 7.7.1
In-Reply-To: <1399842673-21261-1-git-send-email-cody@linux.vnet.ibm.com>
References: <1399842673-21261-1-git-send-email-cody@linux.vnet.ibm.com>
Message-ID: <1399842673-21261-2-git-send-email-cody@linux.vnet.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Cody P Schafer <cody@linux.vnet.ibm.com>
---
 package/gdb/Config.in.host | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index e853469..77c5459 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -19,7 +19,7 @@ choice
 	depends on !BR2_microblaze
 	default BR2_GDB_VERSION_6_6 if BR2_bfin
 	default BR2_GDB_VERSION_6_7_1_AVR32_2_1_5 if BR2_avr32
-	default BR2_GDB_VERSION_7_5
+	default BR2_GDB_VERSION_7_7
 	help
 	  Select the version of gdb you wish to use.
 
@@ -39,6 +39,10 @@ choice
 		bool "gdb 7.5.x"
 		depends on !BR2_bfin
 
+	config BR2_GDB_VERSION_7_7
+		bool "gdb 7.7.x"
+		depends on !BR2_bfin
+
 endchoice
 
 endif
@@ -54,4 +58,5 @@ config BR2_GDB_VERSION
 	default "arc-4.8-R3" if BR2_arc
 	default "6be65fb56ea6694a9260733a536a023a1e2d4d57" if BR2_microblaze
 	default "7.4.1"    if BR2_GDB_VERSION_7_4
-	default "7.5.1"    if BR2_GDB_VERSION_7_5 || !BR2_PACKAGE_HOST_GDB
+	default "7.5.1"    if BR2_GDB_VERSION_7_5
+	default "7.7.1"    if BR2_GDB_VERSION_7_7 || !BR2_PACKAGE_HOST_GDB
-- 
1.9.3
