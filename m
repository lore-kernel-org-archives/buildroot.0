From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Jun 2016 11:22:49 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/boost: boost-metaparse depends
	on boost-test
Message-ID: <1466328169-12236-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The boost metaparse library depends on the test library:
https://github.com/boostorg/metaparse/blob/master/build/Jamfile.v2

The test library itself depends on MMU, therefore we need to propagate
the dependency, fixes

http://autobuild.buildroot.net/results/02f/02f98a50340ecae01f723ad48c2d54d9e28388f8/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: added blank line above s-o-b

 package/boost/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index fae4b5f..0cc9a58 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -115,6 +115,8 @@ config BR2_PACKAGE_BOOST_MATH
 	bool "boost-math"
 
 config BR2_PACKAGE_BOOST_METAPARSE
+	depends on BR2_USE_MMU # boost-test
+	select BR2_PACKAGE_BOOST_TEST
 	bool "boost-metaparse"
 
 config BR2_PACKAGE_BOOST_MPI
-- 
2.8.1
