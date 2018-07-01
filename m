From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Jul 2018 21:08:01 +0200
Subject: [Buildroot] [git commit] boost: filesystem needs system
Message-ID: <20180701190504.A54A483D99@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a20893f827e74b9af2bc587ff36a903d016fd63e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

output/host/usr/bin/m68k-linux-readelf -d output/staging/usr/lib/libboost_filesystem.so

Dynamic section at offset 0x17f00 contains 28 entries:
  Tag        Type                         Name/Value
 0x00000001 (NEEDED)                     Shared library: [libboost_system.so.1.67.0]

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/boost/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index ac79bb345b..f5369d7cf2 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -145,6 +145,7 @@ comment "boost-fiber needs a toolchain not affected by GCC bug 64735, 85180"
 
 config BR2_PACKAGE_BOOST_FILESYSTEM
 	bool "boost-filesystem"
+	select BR2_PACKAGE_BOOST_SYSTEM
 	help
 	  The Boost Filesystem Library provides portable facilities to
 	  query and manipulate paths, files, and directories.
