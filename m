From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon,  2 Jul 2018 23:18:45 +0200
Subject: [Buildroot] [PATCH 1/1] boost: add selects for wave
Message-ID: <20180702211845.13144-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

wave needs filesystem, thread, date_time, chrono and system

output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-readelf -d output/staging/usr/lib/libboost_wave.so

Dynamic section at offset 0x143edc contains 32 entries:
  Tag        Type                         Name/Value
 0x00000001 (NEEDED)                     Shared library: [libboost_filesystem.so.1.67.0]
 0x00000001 (NEEDED)                     Shared library: [libboost_thread.so.1.67.0]
 0x00000001 (NEEDED)                     Shared library: [libboost_date_time.so.1.67.0]
 0x00000001 (NEEDED)                     Shared library: [libboost_chrono.so.1.67.0]
 0x00000001 (NEEDED)                     Shared library: [libboost_system.so.1.67.0]

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/boost/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index e3347c41af..f70364f84f 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -320,6 +320,11 @@ config BR2_PACKAGE_BOOST_WAVE
 	# limitation of assembler for coldfire
 	# error: Tried to convert PC relative branch to absolute jump
 	depends on !BR2_m68k_cf
+	select BR2_PACKAGE_BOOST_CHRONO
+	select BR2_PACKAGE_BOOST_DATE_TIME
+	select BR2_PACKAGE_BOOST_FILESYSTEM
+	select BR2_PACKAGE_BOOST_SYSTEM
+	select BR2_PACKAGE_BOOST_THREAD
 	help
 	  The Boost.Wave library is a Standards conformant, and highly
 	  configurable implementation of the mandated C99/C++
-- 
2.14.1
