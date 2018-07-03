From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed,  4 Jul 2018 00:23:15 +0200
Subject: [Buildroot] [PATCH 1/1] boost: thread needs system
Message-ID: <20180703222315.14696-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-readelf -d output/staging/usr/lib/libboost_thread.so

Dynamic section at offset 0x21f00 contains 28 entries:
  Tag        Type                         Name/Value
 0x00000001 (NEEDED)                     Shared library: [libboost_system.so.1.67.0]

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/boost/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 5ed2470b94..68b1128818 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -310,6 +310,7 @@ config BR2_PACKAGE_BOOST_TEST
 
 config BR2_PACKAGE_BOOST_THREAD
 	bool "boost-thread"
+	select BR2_PACKAGE_BOOST_SYSTEM
 	help
 	  Portable C++ multi-threading. C++11, C++14.
 
-- 
2.14.1
