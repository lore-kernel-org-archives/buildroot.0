From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed,  4 Jul 2018 00:23:54 +0200
Subject: [Buildroot] [PATCH 1/1] boost: type_erasure needs chrono, system,
 thread
Message-ID: <20180703222354.14748-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-readelf -d output/staging/usr/lib/libboost_type_erasure.so

Dynamic section at offset 0xcef0 contains 30 entries:
  Tag        Type                         Name/Value
 0x00000001 (NEEDED)                     Shared library: [libboost_thread.so.1.67.0]
 0x00000001 (NEEDED)                     Shared library: [libboost_chrono.so.1.67.0]
 0x00000001 (NEEDED)                     Shared library: [libboost_system.so.1.67.0]

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/boost/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 68b1128818..5977bba63d 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -323,6 +323,9 @@ config BR2_PACKAGE_BOOST_TIMER
 
 config BR2_PACKAGE_BOOST_TYPE_ERASURE
 	bool "boost-type_erasure"
+	select BR2_PACKAGE_BOOST_CHRONO
+	select BR2_PACKAGE_BOOST_SYSTEM
+	select BR2_PACKAGE_BOOST_THREAD
 	help
 	  Runtime polymorphism based on concepts.
 
-- 
2.14.1
