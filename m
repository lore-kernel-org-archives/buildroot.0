From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 20 Jun 2016 22:47:12 +0200
Subject: [Buildroot] [git commit] package/boost: boost-metaparse depends on
	boost-test
Message-ID: <20160620205603.09C3881D8B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=052b46c6dcd689e8dc2e7dbe6e334a62c53e1bd1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The boost metaparse library depends on the test library:
https://github.com/boostorg/metaparse/blob/master/build/Jamfile.v2

The test library itself depends on MMU, therefore we need to propagate
the dependency, fixes

http://autobuild.buildroot.net/results/02f/02f98a50340ecae01f723ad48c2d54d9e28388f8/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
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
