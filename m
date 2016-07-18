From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Jul 2016 23:12:32 +0200
Subject: [Buildroot] [git commit] package/jemalloc: needs threads
Message-ID: <20160718211253.A328880468@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6ebd430ef010e0e8f35899d0d7a2c03d4fbb4140
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
    http://autobuild.buildroot.org/results/73c437fb932a30bae17653173e8ce35cc91757ef/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/jemalloc/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/jemalloc/Config.in b/package/jemalloc/Config.in
index f5ee950..b1b92bb 100644
--- a/package/jemalloc/Config.in
+++ b/package/jemalloc/Config.in
@@ -12,12 +12,13 @@ config BR2_PACKAGE_JEMALLOC
 	bool "jemalloc"
 	depends on BR2_PACKAGE_JEMALLOC_ARCH_SUPPORTS
 	depends on !BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  This library providing a malloc(3) implementation that emphasizes
 	  fragmentation avoidance and scalable concurrency support.
 
 	  http://www.canonware.com/jemalloc/
 
-comment "jemalloc needs a toolchain w/ dynamic library"
+comment "jemalloc needs a toolchain w/ dynamic library, threads"
 	depends on BR2_PACKAGE_JEMALLOC_ARCH_SUPPORTS
-	depends on BR2_STATIC_LIBS
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
