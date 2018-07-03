From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 3 Jul 2018 21:42:55 +0200
Subject: [Buildroot] [git commit] boost: add selects for log
Message-ID: <20180703194034.EF19E846DE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=11843ec75cfd7c6b3bc20c230e1ede3cd0a54db9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

log needs atomic, chrono, thread, date_time, filesystem, system and
regex

output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-readelf -d output/staging/usr/lib/libboost_log.so

Dynamic section at offset 0xb9ed0 contains 34 entries:
  Tag        Type                         Name/Value
 0x00000001 (NEEDED)                     Shared library: [libboost_atomic.so.1.67.0]
 0x00000001 (NEEDED)                     Shared library: [libboost_chrono.so.1.67.0]
 0x00000001 (NEEDED)                     Shared library: [libboost_thread.so.1.67.0]
 0x00000001 (NEEDED)                     Shared library: [libboost_date_time.so.1.67.0]
 0x00000001 (NEEDED)                     Shared library: [libboost_filesystem.so.1.67.0]
 0x00000001 (NEEDED)                     Shared library: [libboost_system.so.1.67.0]
 0x00000001 (NEEDED)                     Shared library: [libboost_regex.so.1.67.0]

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/boost/Config.in | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index f989a7448b..d0c759a122 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -200,6 +200,13 @@ config BR2_PACKAGE_BOOST_LOG
 	# for some reason, uClibc on PowerPC fails to build the boost
 	# log module
 	depends on !(BR2_powerpc && BR2_TOOLCHAIN_USES_UCLIBC)
+	select BR2_PACKAGE_BOOST_ATOMIC
+	select BR2_PACKAGE_BOOST_CHRONO
+	select BR2_PACKAGE_BOOST_DATE_TIME
+	select BR2_PACKAGE_BOOST_FILESYSTEM
+	select BR2_PACKAGE_BOOST_REGEX
+	select BR2_PACKAGE_BOOST_SYSTEM
+	select BR2_PACKAGE_BOOST_THREAD
 	help
 	  Logging library.
 
