From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 28 Dec 2020 21:10:23 +0100
Subject: [Buildroot] [PATCH 2/3] package/gdb: make gdb 9.2 the default
 version
In-Reply-To: <20201228201025.1882536-1-thomas.petazzoni@bootlin.com>
References: <20201228201025.1882536-1-thomas.petazzoni@bootlin.com>
Message-ID: <20201228201025.1882536-2-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that we have added gdb 10.1, let's switch to using gdb 9.2 as the
default version.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gdb/Config.in.host | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 3abc4f7d23..f4e1c6d9ba 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -63,7 +63,7 @@ config BR2_PACKAGE_HOST_GDB_SIM
 
 choice
 	prompt "GDB debugger Version"
-	default BR2_GDB_VERSION_8_3
+	default BR2_GDB_VERSION_9_2
 	depends on !BR2_arc
 	depends on !BR2_csky
 	help
@@ -90,8 +90,8 @@ config BR2_GDB_VERSION
 	string
 	default "arc-2020.09-release-gdb" if BR2_arc
 	default "4ecb98fbc2f94dbe01b69384afbc515107de73df" if BR2_csky
-	default "8.2.1"    if BR2_GDB_VERSION_8_2 || !BR2_PACKAGE_HOST_GDB
+	default "8.2.1"    if BR2_GDB_VERSION_8_2
 	default "8.3.1"    if BR2_GDB_VERSION_8_3
-	default "9.2"      if BR2_GDB_VERSION_9_2
+	default "9.2"      if BR2_GDB_VERSION_9_2 || !BR2_PACKAGE_HOST_GDB
 	default "10.1"	   if BR2_GDB_VERSION_10
 	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_HOST_GDB
-- 
2.29.2
