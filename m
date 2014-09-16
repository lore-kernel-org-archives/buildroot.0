From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 Sep 2014 22:21:37 +0200
Subject: [Buildroot] [git commit] gdb: remove version 7.6
Message-ID: <20140916210715.E1BB19D6B9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5d82540353d63980298623f32f3e6752ab324432
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that the default version has changed to 7.7, we can get rid of the
older gdb 7.6 version.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gdb/Config.in.host |    5 -----
 1 files changed, 0 insertions(+), 5 deletions(-)

diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index d34aec6..fe3f90e 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -31,10 +31,6 @@ choice
 		depends on BR2_avr32
 		bool "gdb 6.7.1-avr32-2.1.5"
 
-	config BR2_GDB_VERSION_7_6
-		bool "gdb 7.6.x"
-		depends on !BR2_powerpc64le
-
 	config BR2_GDB_VERSION_7_7
 		bool "gdb 7.7.x"
 
@@ -53,6 +49,5 @@ config BR2_GDB_VERSION
                                    (!BR2_PACKAGE_HOST_GDB && BR2_avr32)
 	default "arc-2014.08-gdb" if BR2_arc
 	default "6be65fb56ea6694a9260733a536a023a1e2d4d57" if BR2_microblaze
-	default "7.6.2"    if BR2_GDB_VERSION_7_6
 	default "7.7.1"    if BR2_GDB_VERSION_7_7 || !BR2_PACKAGE_HOST_GDB
 	default "7.8"	   if BR2_GDB_VERSION_7_8
