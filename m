From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Wed, 14 Dec 2016 14:40:57 +0100
Subject: [Buildroot] [PATCH 2/3] package/gdb: switch to 7.11 as the default
	version
In-Reply-To: <20161214134058.29826-1-joerg.krause@embedded.rocks>
References: <20161214134058.29826-1-joerg.krause@embedded.rocks>
Message-ID: <20161214134058.29826-2-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

7.12 is around, 7.11 has already seen a point release, so it's time to
make 7.11 the default version for gdb.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
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
-- 
2.10.2
