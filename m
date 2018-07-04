From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 4 Jul 2018 22:31:16 +0200
Subject: [Buildroot] [git commit] boost: graph needs regex
Message-ID: <20180704202919.5504187780@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d7c2cf8e199d5623f30ca8c847f105605ab6d9ef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

output/host/usr/bin/m68k-linux-readelf -d output/staging/usr/lib/libboost_graph.so

Dynamic section at offset 0x47f00 contains 28 entries:
  Tag        Type                         Name/Value
 0x00000001 (NEEDED)                     Shared library: [libboost_regex.so.1.67.0]

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
