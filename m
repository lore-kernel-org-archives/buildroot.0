From: Adam Duskett <aduskett@gmail.com>
Date: Fri,  3 Nov 2017 09:27:50 -0400
Subject: [Buildroot] [PATCH 1/1] boost: fix fiber module without flag
Message-ID: <20171103132750.19364-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_FILESYSTEM),,fiber) needs to be
BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_FIBER),,fiber) which was
causing the following build errors:
http://autobuild.buildroot.net/results/c8b/c8b58bf37b565e7a4dd7959e0d9c1cec993758ba/build-end.log
http://autobuild.buildroot.net/results/df6/df6f9d51ee766a6f8fca986cdc7476d148dad53e/build-end.log
http://autobuild.buildroot.net/results/fec/fecc16df052ac5b14d3b15e174c7026dfcc8fd33/build-end.log

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/boost/boost.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 750b40f7d2..864a07f789 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -26,7 +26,7 @@ BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_CONTEXT),,context)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_COROUTINE),,coroutine)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_DATE_TIME),,date_time)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_EXCEPTION),,exception)
-BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_FILESYSTEM),,fiber)
+BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_FIBER),,fiber)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_FILESYSTEM),,filesystem)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_GRAPH),,graph)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_GRAPH_PARALLEL),,graph_parallel)
-- 
2.13.6
