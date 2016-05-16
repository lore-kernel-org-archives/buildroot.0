From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 May 2016 00:12:57 +0200
Subject: [Buildroot] [PATCH 4/9] gdb: switch to 7.10 as the default version
In-Reply-To: <1463436782-17051-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1463436782-17051-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1463436782-17051-5-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

7.11 is around, 7.10 has already seen a point release, so it's time to
make 7.10 the default version for gdb.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gdb/Config.in.host | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 35eb418..46e00f6 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -27,7 +27,7 @@ choice
 	prompt "GDB debugger Version"
 	depends on !BR2_arc
 	depends on !BR2_microblaze
-	default BR2_GDB_VERSION_7_9
+	default BR2_GDB_VERSION_7_10
 	help
 	  Select the version of gdb you wish to use.
 
@@ -54,6 +54,6 @@ config BR2_GDB_VERSION
 	default "arc-2016.03-rc2-gdb" if BR2_arc
 	default "6be65fb56ea6694a9260733a536a023a1e2d4d57" if BR2_microblaze
 	default "7.8.2"	   if BR2_GDB_VERSION_7_8
-	default "7.9.1"    if BR2_GDB_VERSION_7_9 || !BR2_PACKAGE_HOST_GDB
-	default "7.10.1"   if BR2_GDB_VERSION_7_10
+	default "7.9.1"    if BR2_GDB_VERSION_7_9
+	default "7.10.1"   if BR2_GDB_VERSION_7_10 || !BR2_PACKAGE_HOST_GDB
 	default "7.11"	   if BR2_GDB_VERSION_7_11
-- 
2.7.4
