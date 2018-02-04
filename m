From: Romain Naour <romain.naour@gmail.com>
Date: Sun,  4 Feb 2018 22:48:17 +0100
Subject: [Buildroot] [PATCH 3/4] package/gdb: remove 7.10
In-Reply-To: <20180204214818.9869-1-romain.naour@gmail.com>
References: <20180204214818.9869-1-romain.naour@gmail.com>
Message-ID: <20180204214818.9869-3-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that 8.1 has been added and 8.0 is the default version, let's
remove the old 7.10 release.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 Config.in.legacy           | 7 +++++++
 package/gdb/Config.in.host | 4 ----
 package/gdb/gdb.hash       | 1 -
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 60f9148234..9cfe961d11 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,13 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2018.02"
 
+config BR2_GDB_VERSION_7_10
+	bool "gdb 7.10 has been removed"
+	select BR2_LEGACY
+	help
+	  The 7.10 version of gdb has been removed. Use a newer version
+	  instead.
+
 config BR2_KERNEL_HEADERS_3_4
 	bool "kernel headers version 3.4.x are no longer supported"
 	select BR2_KERNEL_HEADERS_4_1
diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index ec6abfa5c7..9fe30e9eab 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -51,9 +51,6 @@ choice
 	help
 	  Select the version of gdb you wish to use.
 
-config BR2_GDB_VERSION_7_10
-	bool "gdb 7.10.x"
-
 config BR2_GDB_VERSION_7_11
 	bool "gdb 7.11.x"
 
@@ -82,7 +79,6 @@ endif
 config BR2_GDB_VERSION
 	string
 	default "arc-2017.09-release-gdb" if BR2_arc
-	default "7.10.1"   if BR2_GDB_VERSION_7_10
 	default "7.11.1"   if BR2_GDB_VERSION_7_11
 	default "7.12.1"   if BR2_GDB_VERSION_7_12
 	default "8.0.1"    if BR2_GDB_VERSION_8_0 || !BR2_PACKAGE_HOST_GDB
diff --git a/package/gdb/gdb.hash b/package/gdb/gdb.hash
index 3af72db23d..cb76dca198 100644
--- a/package/gdb/gdb.hash
+++ b/package/gdb/gdb.hash
@@ -1,5 +1,4 @@
 # From ftp://gcc.gnu.org/pub/gdb/releases/sha512.sum
-sha512	17a5138277a31685a5c2a841cb47ed9bc4626ea617b8ca77750513b300299f4fbbffe504958b5372de610dcb952c679cf8fa9c1bdadd380294fbf59b6e366010	gdb-7.10.1.tar.xz
 sha512  f80ec6c8a0f0b54c8b945666e875809174402b7e121efb378ebac931a91f9a1cc0048568f8e2f42ae8ae2392ff8d144c2e51d41c7398935017450aaf29838360	gdb-7.11.1.tar.xz
 sha512  0ac8d0a495103611ef41167a08313a010dce6ca4c6d827cbe8558a0c1a1a8a6bfa53f1b7704251289cababbfaaf9e075550cdf741a54d6cd9ca3433d910efcd8	gdb-7.12.1.tar.xz
 sha512  5eb328910033f0918058be2f92caebf1e8dfc6caa3c730d99d621627e53de3c1b43761c2f683d53555893253c2f06768cbf56cdea051a3d291ffb6cfae87b5e1	gdb-8.0.1.tar.xz
-- 
2.14.3
