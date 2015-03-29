From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Mar 2015 14:47:53 +0200
Subject: [Buildroot] [git commit] gdb: switch default to 7.8.x
Message-ID: <20150329124810.DDACE7FD22@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=67ca095d8be819817769e848ccb66d74cef0fc82
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that we've got 7.9 added default to version 7.8.x

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gdb/Config.in.host |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index cda9d12..3a0baa1 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -27,7 +27,7 @@ choice
 	prompt "GDB debugger Version"
 	depends on !BR2_arc
 	depends on !BR2_microblaze
-	default BR2_GDB_VERSION_7_7
+	default BR2_GDB_VERSION_7_8
 	help
 	  Select the version of gdb you wish to use.
 
@@ -50,6 +50,6 @@ config BR2_GDB_VERSION
 	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_HOST_GDB
 	default "arc-2014.12-gdb" if BR2_arc
 	default "6be65fb56ea6694a9260733a536a023a1e2d4d57" if BR2_microblaze
-	default "7.7.1"    if BR2_GDB_VERSION_7_7 || !BR2_PACKAGE_HOST_GDB
-	default "7.8.2"	   if BR2_GDB_VERSION_7_8
+	default "7.7.1"    if BR2_GDB_VERSION_7_7
+	default "7.8.2"	   if BR2_GDB_VERSION_7_8 || !BR2_PACKAGE_HOST_GDB
 	default "7.9"      if BR2_GDB_VERSION_7_9
