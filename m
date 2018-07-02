From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 2 Jul 2018 09:02:48 +0200
Subject: [Buildroot] [git commit] boost: test needs system and timer
Message-ID: <20180702114540.B779C812AE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3ad3c41213694ab22f27ae518263a6eb1961adb6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

output/host/usr/bin/m68k-linux-readelf -d output/staging/usr/lib/libboost_prg_exec_monitor.so

Dynamic section at offset 0xdef8 contains 29 entries:
  Tag        Type                         Name/Value
 0x00000001 (NEEDED)                     Shared library: [libboost_timer.so.1.67.0]
 0x00000001 (NEEDED)                     Shared library: [libboost_system.so.1.67.0]

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/boost/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 1dc7924a2f..c0da58475e 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -289,6 +289,8 @@ config BR2_PACKAGE_BOOST_SYSTEM
 config BR2_PACKAGE_BOOST_TEST
 	bool "boost-test"
 	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_BOOST_SYSTEM
+	select BR2_PACKAGE_BOOST_TIMER
 	help
 	  Support for simple program testing, full unit testing, and for
 	  program execution monitoring.
