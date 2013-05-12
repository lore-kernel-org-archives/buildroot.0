From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 12 May 2013 21:26:44 +0200
Subject: [Buildroot] [git commit] lttng-tools: needs largefile support
Message-ID: <20130512192744.13C489A089@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e5726eb4986f33a1c6af276973efeaa35980097c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/ba2674c2f5bb33304dbbdf2f0ad0ca5ecfdc11aa/

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/lttng-tools/Config.in |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/lttng-tools/Config.in b/package/lttng-tools/Config.in
index 4f86e77..6773475 100644
--- a/package/lttng-tools/Config.in
+++ b/package/lttng-tools/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_LTTNG_TOOLS
 	select BR2_PACKAGE_POPT
 	# liburcu only works on some architectures and requires thread support
 	depends on BR2_arm || BR2_armeb || BR2_i386 || BR2_powerpc || BR2_x86_64
+	depends on BR2_LARGEFILE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  Userspace utilities for the LTTng 2.0 tracing
@@ -23,6 +24,6 @@ config BR2_PACKAGE_LTTNG_TOOLS
 
 	  http://lttng.org
 
-comment "lttng-tools needs threads support"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+comment "lttng-tools needs LARGEFILE and threads support"
+	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
 
