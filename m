From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 2 Jul 2018 09:02:49 +0200
Subject: [Buildroot] [git commit] boost: random needs system
Message-ID: <20180702114540.BFB4980121@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a315d2c7fe5d6bfa186a5dd7c521f55905177ca1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

output/host/usr/bin/m68k-linux-readelf -d output/staging/usr/lib/libboost_random.so

Dynamic section at offset 0x5f20 contains 24 entries:
  Tag        Type                         Name/Value
 0x00000001 (NEEDED)                     Shared library: [libboost_system.so.1.67.0]

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/boost/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index c0da58475e..f8eb9422f9 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -252,6 +252,7 @@ config BR2_PACKAGE_BOOST_PYTHON
 
 config BR2_PACKAGE_BOOST_RANDOM
 	bool "boost-random"
+	select BR2_PACKAGE_BOOST_SYSTEM
 	help
 	  A complete system for random number generation.
 
