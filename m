From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  1 Jul 2018 21:16:44 +0200
Subject: [Buildroot] [PATCH 1/1] boost: timer needs chrono and system
Message-ID: <20180701191644.11050-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

output/host/usr/bin/m68k-linux-readelf -d output/staging/usr/lib/libboost_timer.so

Dynamic section at offset 0x5ef8 contains 29 entries:
  Tag        Type                         Name/Value
 0x00000001 (NEEDED)                     Shared library: [libboost_chrono.so.1.67.0]
 0x00000001 (NEEDED)                     Shared library: [libboost_system.so.1.67.0]

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/boost/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index f026416ea7..c9ae3f1fcc 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -301,6 +301,8 @@ config BR2_PACKAGE_BOOST_THREAD
 
 config BR2_PACKAGE_BOOST_TIMER
 	bool "boost-timer"
+	select BR2_PACKAGE_BOOST_CHRONO
+	select BR2_PACKAGE_BOOST_SYSTEM
 	help
 	  Event timer, progress timer, and progress display classes.
 
-- 
2.14.1
