From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 2 Jul 2018 09:02:50 +0200
Subject: [Buildroot] [git commit] boost: contract needs system
Message-ID: <20180702114540.C779880121@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c33ae99b26a7bea9d448e515942559aab65b7d14
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-readelf -d output/staging/usr/lib/libboost_contract.so

Dynamic section at offset 0x19f00 contains 28 entries:
  Tag        Type                         Name/Value
 0x00000001 (NEEDED)                     Shared library: [libboost_system.so.1.67.0]

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/boost/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index f8eb9422f9..cfad03f55a 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -90,6 +90,7 @@ config BR2_PACKAGE_BOOST_CONTRACT
 	bool "boost-contract"
 	# pthread_condattr_setclock
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	select BR2_PACKAGE_BOOST_SYSTEM
 	help
 	  Contract programming for C++.
 
