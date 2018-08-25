From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 25 Aug 2018 08:37:02 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/botan: needs boost libraries
 filesystem and system
Message-ID: <20180825063702.4593-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Without them the build fails:

/home/naourr/work/instance-0/output/host/lib/gcc/arm-buildroot-linux-mu
 sleabihf/7.3.0/../../../../arm-buildroot-linux-musleabihf/bin/ld:
  cannot find -lboost_filesystem
/home/naourr/work/instance-0/output/host/lib/gcc/arm-buildroot-linux-mu
 sleabihf/7.3.0/../../../../arm-buildroot-linux-musleabihf/bin/ld:
  cannot find -lboost_system

Bug was introduced in next branch by commit
https://git.buildroot.net/buildroot/commit/?h=next&id=031f5c04d9de5a21d3bc49f3849af3e6593fa1a8

Fixes
http://autobuild.buildroot.net/results/cb9/cb90f4ed4d130a2ab6f6d085708a482a51d7dc91/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/botan/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/botan/Config.in b/package/botan/Config.in
index 6fe818bc6d..a152e11117 100644
--- a/package/botan/Config.in
+++ b/package/botan/Config.in
@@ -11,6 +11,8 @@ config BR2_PACKAGE_BOTAN
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_PACKAGE_BOTAN_ARCH_SUPPORTS
+	select BR2_PACKAGE_BOOST_FILESYSTEM if BR2_PACKAGE_BOOST
+	select BR2_PACKAGE_BOOST_SYSTEM if BR2_PACKAGE_BOOST
 	help
 	  Botan is a crypto library for C++
 
-- 
2.18.0
