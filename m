From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 18 Jul 2019 00:02:15 +0200
Subject: [Buildroot] [PATCH 1/1] package/hiawatha: depends on
 BR2_TOOLCHAIN_HAS_SYNC_4
Message-ID: <20190717220215.27168-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hiawatha uses __sync_add_and_fetch_ 4 and __sync_sub_and_fetch_4

Fixes:
 - http://autobuild.buildroot.org/results/396f3ec849229eea9298215fbb1e1aac9f48c677

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/hiawatha/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/hiawatha/Config.in b/package/hiawatha/Config.in
index 68e47fde87..8f1908f6f4 100644
--- a/package/hiawatha/Config.in
+++ b/package/hiawatha/Config.in
@@ -1,11 +1,13 @@
 comment "hiawatha needs a toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
 
 config BR2_PACKAGE_HIAWATHA
 	bool "hiawatha"
 	# needs fork()
 	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # __sync_*_4 intrisics
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_ZLIB
-- 
2.20.1
