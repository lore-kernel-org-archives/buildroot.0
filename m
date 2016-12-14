From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Wed, 14 Dec 2016 14:40:56 +0100
Subject: [Buildroot] [PATCH 1/3] package/gdb: add support for gdb 7.12
Message-ID: <20161214134058.29826-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gdb 7.12 was released on October 2016, it's time to include it in
Buildroot, which this commit does.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/gdb/Config.in.host | 4 ++++
 package/gdb/gdb.hash       | 1 +
 2 files changed, 5 insertions(+)

diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 4c8d902..2d4631e 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -48,6 +48,9 @@ choice
 	config BR2_GDB_VERSION_7_11
 		bool "gdb 7.11.x"
 
+	config BR2_GDB_VERSION_7_12
+		bool "gdb 7.12.x"
+
 endchoice
 
 endif
@@ -61,3 +64,4 @@ config BR2_GDB_VERSION
 	default "7.9.1"    if BR2_GDB_VERSION_7_9
 	default "7.10.1"   if BR2_GDB_VERSION_7_10 || !BR2_PACKAGE_HOST_GDB
 	default "7.11.1"   if BR2_GDB_VERSION_7_11
+	default "7.12"     if BR2_GDB_VERSION_7_12
diff --git a/package/gdb/gdb.hash b/package/gdb/gdb.hash
index c91373b..a44aaa3 100644
--- a/package/gdb/gdb.hash
+++ b/package/gdb/gdb.hash
@@ -2,6 +2,7 @@
 sha512	eebdf88b24e52e792b8a4b89ea85790de72b462a7810b44975fdf4232c068f353b15506071f450102a9d4bcecdde8e93dc3748a10699b7f73f3e04fb2d9d8414	gdb-7.9.1.tar.xz
 sha512	17a5138277a31685a5c2a841cb47ed9bc4626ea617b8ca77750513b300299f4fbbffe504958b5372de610dcb952c679cf8fa9c1bdadd380294fbf59b6e366010	gdb-7.10.1.tar.xz
 sha512  f80ec6c8a0f0b54c8b945666e875809174402b7e121efb378ebac931a91f9a1cc0048568f8e2f42ae8ae2392ff8d144c2e51d41c7398935017450aaf29838360	gdb-7.11.1.tar.xz
+sha512  f610338b3a24dfb387c295431d806a0c1375e8ce51b8dd8bbfd2efc4612d0c0ed40ad4393508afca0071eca70688f62bc4f199da5e75ad16f64d91c3bc046033	gdb-7.12.tar.xz
 
 # Locally calculated (fetched from Github)
 sha512  0a467091d4b01fbecabb4b8da1cb743025c70e7f4874a0b5c8fa2ec623569a39bde6762b91806de0be6e63711aeb6909715cfbe43860de73d8aec6159a9f10a7	gdb-6be65fb56ea6694a9260733a536a023a1e2d4d57.tar.gz
-- 
2.10.2
