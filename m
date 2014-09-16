From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 Sep 2014 22:21:06 +0200
Subject: [Buildroot] [git commit] gdb: switch to 7.7 as the default version
Message-ID: <20140916210715.DA4B89D6B9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9444a62c01a889a11a2eaadbf178cc30daa59730
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that gdb 7.8 is out, it's time to move to 7.7 as the default
version instead of 7.6.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gdb/Config.in.host |    7 +++----
 1 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index f51b5b1..d34aec6 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -23,8 +23,7 @@ choice
 	depends on !BR2_arc
 	depends on !BR2_microblaze
 	default BR2_GDB_VERSION_6_7_1_AVR32_2_1_5 if BR2_avr32
-	default BR2_GDB_VERSION_7_7 if BR2_powerpc64le
-	default BR2_GDB_VERSION_7_6
+	default BR2_GDB_VERSION_7_7
 	help
 	  Select the version of gdb you wish to use.
 
@@ -54,6 +53,6 @@ config BR2_GDB_VERSION
                                    (!BR2_PACKAGE_HOST_GDB && BR2_avr32)
 	default "arc-2014.08-gdb" if BR2_arc
 	default "6be65fb56ea6694a9260733a536a023a1e2d4d57" if BR2_microblaze
-	default "7.6.2"    if BR2_GDB_VERSION_7_6 || !BR2_PACKAGE_HOST_GDB
-	default "7.7.1"    if BR2_GDB_VERSION_7_7 || BR2_powerpc64le
+	default "7.6.2"    if BR2_GDB_VERSION_7_6
+	default "7.7.1"    if BR2_GDB_VERSION_7_7 || !BR2_PACKAGE_HOST_GDB
 	default "7.8"	   if BR2_GDB_VERSION_7_8
