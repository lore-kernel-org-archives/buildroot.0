From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Fri, 14 Jun 2019 23:03:43 +0200
Subject: [Buildroot] [PATCH 24/27] package/tvheadend: re-enable package on
 microblaze
In-Reply-To: <20190614210346.121013-1-giulio.benetti@micronovasrl.com>
References: <20190614210346.121013-1-giulio.benetti@micronovasrl.com>
Message-ID: <20190614210346.121013-25-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Package tvheadend has been disabled on microblaze with this commit:
https://git.buildroot.net/buildroot/commit/?id=e1a59357e4dfe8fe9c9119d4b2bc9e4ec36eb3d0
but commit log says that build failure is due to "some assertion
failure in binutils", that is true. But those assertion failures in
binutils are caused by package's Makefile itself that has been fixed by
previous patch. So re-enable package for microblaze.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 package/tvheadend/Config.in | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/tvheadend/Config.in b/package/tvheadend/Config.in
index 5db644400c..909d955c02 100644
--- a/package/tvheadend/Config.in
+++ b/package/tvheadend/Config.in
@@ -1,12 +1,10 @@
 comment "tvheadend needs a toolchain w/ NPTL, headers >= 3.2, dynamic library"
-	depends on !BR2_microblazeel
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
 		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2 || BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 
 config BR2_PACKAGE_TVHEADEND
 	bool "tvheadend"
-	depends on !BR2_microblazeel # assertion failure in binutils
 	depends on !BR2_STATIC_LIBS # dladdr()
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
-- 
2.17.1
