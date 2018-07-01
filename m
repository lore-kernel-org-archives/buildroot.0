From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  1 Jul 2018 15:52:40 +0200
Subject: [Buildroot] [PATCH v2,1/1] boost: filesystem needs system
Message-ID: <20180701135240.28152-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

output/host/usr/bin/m68k-linux-readelf -d output/staging/usr/lib/libboost_filesystem.so

Dynamic section at offset 0x17f00 contains 28 entries:
  Tag        Type                         Name/Value
 0x00000001 (NEEDED)                     Shared library: [libboost_system.so.1.67.0]

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Thomas Petazzoni):
 - Don't cut command output

 package/boost/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 02a4fd21d6..0523a978c1 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -146,6 +146,7 @@ comment "boost-fiber needs a toolchain not affected by GCC bug 64735, 85180"
 
 config BR2_PACKAGE_BOOST_FILESYSTEM
 	bool "boost-filesystem"
+	select BR2_PACKAGE_BOOST_SYSTEM
 	help
 	  The Boost Filesystem Library provides portable facilities to
 	  query and manipulate paths, files, and directories.
-- 
2.14.1
