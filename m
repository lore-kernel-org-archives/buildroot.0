From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 2 Jul 2018 09:02:47 +0200
Subject: [Buildroot] [git commit] boost: timer needs chrono and system
Message-ID: <20180702114540.AFBE4812AE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=48f869f3147d1aafffb3e46717b375badc8d9225
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

output/host/usr/bin/m68k-linux-readelf -d output/staging/usr/lib/libboost_timer.so

Dynamic section at offset 0x5ef8 contains 29 entries:
  Tag        Type                         Name/Value
 0x00000001 (NEEDED)                     Shared library: [libboost_chrono.so.1.67.0]
 0x00000001 (NEEDED)                     Shared library: [libboost_system.so.1.67.0]

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/boost/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 12eb98ae21..1dc7924a2f 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -300,6 +300,8 @@ config BR2_PACKAGE_BOOST_THREAD
 
 config BR2_PACKAGE_BOOST_TIMER
 	bool "boost-timer"
+	select BR2_PACKAGE_BOOST_CHRONO
+	select BR2_PACKAGE_BOOST_SYSTEM
 	help
 	  Event timer, progress timer, and progress display classes.
 
