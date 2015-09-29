From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 30 Sep 2015 00:30:21 +0200
Subject: [Buildroot] [git commit] ipmiutil: needs dynamic library support
Message-ID: <20150929223556.C6F0981D69@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=670095b4739c898a8f270b003ee19294206d91f6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ipmiutil builds libipmiutil.so unconditionally.

Fixes:
http://autobuild.buildroot.net/results/e31/e31d94847cad9216aad839c2fbb312e9ea0ae75e/
http://autobuild.buildroot.net/results/5f3/5f3f32473186e6fa3a165b263f682047af8e291e/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ipmiutil/Config.in |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/ipmiutil/Config.in b/package/ipmiutil/Config.in
index a2a898b..9eb5452 100644
--- a/package/ipmiutil/Config.in
+++ b/package/ipmiutil/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_IPMIUTIL
 	bool "ipmiutil"
 	depends on BR2_USE_MMU
+	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_x86_64 || BR2_i386
 	help
@@ -11,7 +12,7 @@ config BR2_PACKAGE_IPMIUTIL
 
 	  http://ipmiutil.sourceforge.net/
 
-comment "ipmiutil needs a toolchain w/ threads"
+comment "ipmiutil needs a toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
 	depends on BR2_x86_64 || BR2_i386
