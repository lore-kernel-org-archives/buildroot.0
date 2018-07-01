From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  1 Jul 2018 21:17:32 +0200
Subject: [Buildroot] [PATCH 1/1] boost: random needs system
Message-ID: <20180701191732.11154-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

output/host/usr/bin/m68k-linux-readelf -d output/staging/usr/lib/libboost_random.so

Dynamic section at offset 0x5f20 contains 24 entries:
  Tag        Type                         Name/Value
 0x00000001 (NEEDED)                     Shared library: [libboost_system.so.1.67.0]

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/boost/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index c68093412f..e9f1579abf 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -253,6 +253,7 @@ config BR2_PACKAGE_BOOST_PYTHON
 
 config BR2_PACKAGE_BOOST_RANDOM
 	bool "boost-random"
+	select BR2_PACKAGE_BOOST_SYSTEM
 	help
 	  A complete system for random number generation.
 
-- 
2.14.1
