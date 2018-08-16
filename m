From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 16 Aug 2018 20:30:31 +0200
Subject: [Buildroot] [PATCH 1/1] boost: put back chrono select for coroutine
Message-ID: <20180816183031.13304-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

coroutine module does use chrono directly:

./libs/coroutine/performance/asymmetric/segmented/Jamfile.v2: <library>/boost/chrono//boost_chrono
./libs/coroutine/performance/asymmetric/Jamfile.v2: <library>/boost/chrono//boost_chrono
./libs/coroutine/performance/symmetric/segmented/Jamfile.v2: <library>/boost/chrono//boost_chrono
./libs/coroutine/performance/symmetric/Jamfile.v2: <library>/boost/chrono//boost_chrono

So put back select of chrono for coroutine

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/boost/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 66a954027c..334098ec5d 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -101,6 +101,7 @@ config BR2_PACKAGE_BOOST_COROUTINE
 	bool "boost-coroutine"
 	depends on BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-context
+	select BR2_PACKAGE_BOOST_CHRONO
 	select BR2_PACKAGE_BOOST_CONTEXT
 	select BR2_PACKAGE_BOOST_SYSTEM
 	select BR2_PACKAGE_BOOST_THREAD
-- 
2.14.1
