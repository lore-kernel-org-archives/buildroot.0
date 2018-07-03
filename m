From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed,  4 Jul 2018 00:22:35 +0200
Subject: [Buildroot] [PATCH 1/1] boost: graph needs regex
Message-ID: <20180703222235.14643-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

output/host/usr/bin/m68k-linux-readelf -d output/staging/usr/lib/libboost_graph.so

Dynamic section at offset 0x47f00 contains 28 entries:
  Tag        Type                         Name/Value
 0x00000001 (NEEDED)                     Shared library: [libboost_regex.so.1.67.0]

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/boost/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index d0c759a122..5ed2470b94 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -156,6 +156,7 @@ config BR2_PACKAGE_BOOST_FILESYSTEM
 
 config BR2_PACKAGE_BOOST_GRAPH
 	bool "boost-graph"
+	select BR2_PACKAGE_BOOST_REGEX
 	help
 	  The BGL graph interface and graph components are generic, in
 	  the same sense as the the Standard Template Library (STL).
-- 
2.14.1
