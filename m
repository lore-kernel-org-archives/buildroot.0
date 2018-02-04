From: Romain Naour <romain.naour@gmail.com>
Date: Sun,  4 Feb 2018 22:48:16 +0100
Subject: [Buildroot] [PATCH 2/4] package/gdb: switch to 8.0 as the default
 version
In-Reply-To: <20180204214818.9869-1-romain.naour@gmail.com>
References: <20180204214818.9869-1-romain.naour@gmail.com>
Message-ID: <20180204214818.9869-2-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

8.1 is around, 8.0 has already seen a point release, so it's time to
make 8.0 the default version for gdb.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/gdb/Config.in.host | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 86f5953a7a..ec6abfa5c7 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -46,7 +46,7 @@ config BR2_PACKAGE_HOST_GDB_SIM
 
 choice
 	prompt "GDB debugger Version"
-	default BR2_GDB_VERSION_7_11
+	default BR2_GDB_VERSION_8_0
 	depends on !BR2_arc
 	help
 	  Select the version of gdb you wish to use.
@@ -83,8 +83,8 @@ config BR2_GDB_VERSION
 	string
 	default "arc-2017.09-release-gdb" if BR2_arc
 	default "7.10.1"   if BR2_GDB_VERSION_7_10
-	default "7.11.1"   if BR2_GDB_VERSION_7_11 || !BR2_PACKAGE_HOST_GDB
+	default "7.11.1"   if BR2_GDB_VERSION_7_11
 	default "7.12.1"   if BR2_GDB_VERSION_7_12
-	default "8.0.1"    if BR2_GDB_VERSION_8_0
+	default "8.0.1"    if BR2_GDB_VERSION_8_0 || !BR2_PACKAGE_HOST_GDB
 	default "8.1"      if BR2_GDB_VERSION_8_1
 	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_HOST_GDB
-- 
2.14.3
