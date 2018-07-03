From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 3 Jul 2018 21:42:52 +0200
Subject: [Buildroot] [git commit] boost: fiber needs filesystem and system
Message-ID: <20180703194034.DAD5C81387@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f7407d1f09110702504081d98be677627efa6bd7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-readelf -d output/staging/usr/lib/libboost_fiber.so

Dynamic section at offset 0x44ee8 contains 31 entries:
  Tag        Type                         Name/Value
 0x00000001 (NEEDED)                     Shared library: [libboost_context.so.1.67.0]
 0x00000001 (NEEDED)                     Shared library: [libboost_filesystem.so.1.67.0]
 0x00000001 (NEEDED)                     Shared library: [libboost_system.so.1.67.0]

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/boost/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index bacefacab1..aef0303094 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -134,6 +134,8 @@ config BR2_PACKAGE_BOOST_FIBER
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-context
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_85180
 	select BR2_PACKAGE_BOOST_CONTEXT
+	select BR2_PACKAGE_BOOST_FILESYSTEM
+	select BR2_PACKAGE_BOOST_SYSTEM
 	help
 	  C++11 userland threads library.
 
