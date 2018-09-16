From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Sep 2018 15:59:36 +0200
Subject: [Buildroot] [git commit] package/gdb: switch to 8.1 as the default
 version
Message-ID: <20180916141031.7A773882DD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1fc2b4395977059e418e0532ab093008de9f1bb4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

8.2 is around, 8.1 has already seen a point release, so it's time to
make 8.1 the default version for gdb.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gdb/Config.in.host | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index dce868816b..df8817d91d 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -45,7 +45,7 @@ config BR2_PACKAGE_HOST_GDB_SIM
 
 choice
 	prompt "GDB debugger Version"
-	default BR2_GDB_VERSION_8_0
+	default BR2_GDB_VERSION_8_1
 	depends on !BR2_arc
 	help
 	  Select the version of gdb you wish to use.
@@ -95,7 +95,7 @@ config BR2_GDB_VERSION
 	string
 	default "arc-2018.03-gdb" if BR2_arc
 	default "7.12.1"   if BR2_GDB_VERSION_7_12
-	default "8.0.1"    if BR2_GDB_VERSION_8_0 || !BR2_PACKAGE_HOST_GDB
-	default "8.1.1"    if BR2_GDB_VERSION_8_1
+	default "8.0.1"    if BR2_GDB_VERSION_8_0
+	default "8.1.1"    if BR2_GDB_VERSION_8_1 || !BR2_PACKAGE_HOST_GDB
 	default "8.2"      if BR2_GDB_VERSION_8_2
 	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_HOST_GDB
