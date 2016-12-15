From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 15 Dec 2016 14:58:20 +0100
Subject: [Buildroot] [git commit] package/gdb: switch to 7.11 as the default
	version
Message-ID: <20161215135953.283CE8079F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d2a80cbf827affb001bb148953edf253c2f6bc1b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

7.12 is around, 7.11 has already seen a point release, so it's time to
make 7.11 the default version for gdb.

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gdb/Config.in.host | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 2d4631e..3b2e279 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -35,7 +35,7 @@ choice
 	prompt "GDB debugger Version"
 	depends on !BR2_arc
 	depends on !BR2_microblaze
-	default BR2_GDB_VERSION_7_10
+	default BR2_GDB_VERSION_7_11
 	help
 	  Select the version of gdb you wish to use.
 
@@ -62,6 +62,6 @@ config BR2_GDB_VERSION
 	default "arc-2016.09-rc2-gdb" if BR2_arc
 	default "6be65fb56ea6694a9260733a536a023a1e2d4d57" if BR2_microblaze
 	default "7.9.1"    if BR2_GDB_VERSION_7_9
-	default "7.10.1"   if BR2_GDB_VERSION_7_10 || !BR2_PACKAGE_HOST_GDB
-	default "7.11.1"   if BR2_GDB_VERSION_7_11
+	default "7.10.1"   if BR2_GDB_VERSION_7_10
+	default "7.11.1"   if BR2_GDB_VERSION_7_11 || !BR2_PACKAGE_HOST_GDB
 	default "7.12"     if BR2_GDB_VERSION_7_12
