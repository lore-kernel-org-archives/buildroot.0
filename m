From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 29 Aug 2015 17:43:21 +0200
Subject: [Buildroot] [git commit branch/next] gdb: use 7.9 by default
Message-ID: <20150829154406.58B317FADC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=863ec57d809e572641d90e6ac4ee57b6115c6114
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Now that we have added 7.10, let's switch to 7.9 as the default gdb
version.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gdb/Config.in.host |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 7b05796..b66e742 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -27,7 +27,7 @@ choice
 	prompt "GDB debugger Version"
 	depends on !BR2_arc
 	depends on !BR2_microblaze
-	default BR2_GDB_VERSION_7_8
+	default BR2_GDB_VERSION_7_9
 	help
 	  Select the version of gdb you wish to use.
 
@@ -55,6 +55,6 @@ config BR2_GDB_VERSION
 	default "arc-2015.06-gdb" if BR2_arc
 	default "6be65fb56ea6694a9260733a536a023a1e2d4d57" if BR2_microblaze
 	default "7.7.1"    if BR2_GDB_VERSION_7_7
-	default "7.8.2"	   if BR2_GDB_VERSION_7_8 || !BR2_PACKAGE_HOST_GDB
-	default "7.9.1"    if BR2_GDB_VERSION_7_9
+	default "7.8.2"	   if BR2_GDB_VERSION_7_8
+	default "7.9.1"    if BR2_GDB_VERSION_7_9 || !BR2_PACKAGE_HOST_GDB
 	default "7.10"     if BR2_GDB_VERSION_7_10
