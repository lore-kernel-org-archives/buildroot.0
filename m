From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 4 Jul 2018 22:31:18 +0200
Subject: [Buildroot] [git commit] boost: type_erasure needs chrono, system,
 thread
Message-ID: <20180704202919.65B8787780@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=892e006d7f069c55ea6fe447141e629456db645a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-readelf -d output/staging/usr/lib/libboost_type_erasure.so

Dynamic section at offset 0xcef0 contains 30 entries:
  Tag        Type                         Name/Value
 0x00000001 (NEEDED)                     Shared library: [libboost_thread.so.1.67.0]
 0x00000001 (NEEDED)                     Shared library: [libboost_chrono.so.1.67.0]
 0x00000001 (NEEDED)                     Shared library: [libboost_system.so.1.67.0]

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
 
