From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed,  4 Jul 2018 00:24:30 +0200
Subject: [Buildroot] [PATCH 1/1] boost: coroutine needs chrono, system,
 thread
Message-ID: <20180703222430.14800-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-readelf -d output/staging/usr/lib/libboost_coroutine.so

Dynamic section at offset 0xdee8 contains 31 entries:
  Tag        Type                         Name/Value
 0x00000001 (NEEDED)                     Shared library: [libboost_chrono.so.1.67.0]
 0x00000001 (NEEDED)                     Shared library: [libboost_context.so.1.67.0]
 0x00000001 (NEEDED)                     Shared library: [libboost_thread.so.1.67.0]
 0x00000001 (NEEDED)                     Shared library: [libboost_system.so.1.67.0]

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/boost/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 5977bba63d..510ed336e4 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -101,7 +101,10 @@ config BR2_PACKAGE_BOOST_COROUTINE
 	bool "boost-coroutine"
 	depends on BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-context
+	select BR2_PACKAGE_BOOST_CHRONO
 	select BR2_PACKAGE_BOOST_CONTEXT
+	select BR2_PACKAGE_BOOST_SYSTEM
+	select BR2_PACKAGE_BOOST_THREAD
 	help
 	  deprecated coroutine library, the non-depricated coroutine2
 	  library is a header-only library and does not need to be
-- 
2.14.1
