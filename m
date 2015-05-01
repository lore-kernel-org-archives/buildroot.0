From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  1 May 2015 10:57:34 -0300
Subject: [Buildroot] [PATCH] leveldb: disable for blackfin
Message-ID: <1430488654-4983-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/f79/f7930231cadeef7ccb0df6acf41b62c2c6fd1e02/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/leveldb/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/leveldb/Config.in b/package/leveldb/Config.in
index af097e5..b583c3b 100644
--- a/package/leveldb/Config.in
+++ b/package/leveldb/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_LEVELDB
 	bool "leveldb"
+	# Missing/broken atomic pointer support
+	depends on !BR2_bfin
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_SNAPPY
@@ -10,4 +12,5 @@ config BR2_PACKAGE_LEVELDB
 	  https://github.com/google/leveldb
 
 comment "leveldb needs a toolchain w/ C++, threads"
+	depends on !BR2_bfin
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.0.5
