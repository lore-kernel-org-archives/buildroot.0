From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 18 Jul 2019 20:26:50 +0200
Subject: [Buildroot] [git commit] package/hiawatha: depends on
 BR2_TOOLCHAIN_HAS_SYNC_4
Message-ID: <20190718182521.60B7A83AC0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b6140698f699d6dd63c15469f9b8b798eeaca7f5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since its version 10.9, hiawatha uses __sync_add_and_fetch_ 4 and
__sync_sub_and_fetch_4. hiawatha was bumped from 10.6 to 10.9 by
commit 93ca4f965264964bc944bbff4ef6160e4b4a1a63.

Fixes:
 - http://autobuild.buildroot.org/results/396f3ec849229eea9298215fbb1e1aac9f48c677

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
