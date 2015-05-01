From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 May 2015 16:22:55 +0200
Subject: [Buildroot] [git commit] leveldb: disable for blackfin
Message-ID: <20150501142306.91AEB7FA75@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4cc236784e5783fef0fd7bf9437e55a38cc8c291
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/f79/f7930231cadeef7ccb0df6acf41b62c2c6fd1e02/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/leveldb/Config.in |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

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
