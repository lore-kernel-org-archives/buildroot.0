From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 8 Sep 2018 23:55:22 +0200
Subject: [Buildroot] [git commit] package/botan: needs boost libraries
 filesystem and system
Message-ID: <20180908220410.3C7EC837F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=18cae7c686ab43184ebb081165c93ba5ef3b6701
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/botan/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/botan/Config.in b/package/botan/Config.in
index 3632a1a1c2..a242a38efc 100644
--- a/package/botan/Config.in
+++ b/package/botan/Config.in
@@ -12,6 +12,8 @@ config BR2_PACKAGE_BOTAN
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_PACKAGE_BOTAN_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::future
+	select BR2_PACKAGE_BOOST_FILESYSTEM if BR2_PACKAGE_BOOST
+	select BR2_PACKAGE_BOOST_SYSTEM if BR2_PACKAGE_BOOST
 	help
 	  Botan is a crypto library for C++
 
