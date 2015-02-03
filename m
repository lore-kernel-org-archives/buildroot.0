From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Feb 2015 14:23:09 +0100
Subject: [Buildroot] [git commit] mjpegtools: uses fork(), needs mmu
Message-ID: <20150203132331.AA39980DEB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=75a38ba86ac00544028aa9f645e4c9febdd77498
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mjpegtools/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/mjpegtools/Config.in b/package/mjpegtools/Config.in
index f5d2208..6a36109 100644
--- a/package/mjpegtools/Config.in
+++ b/package/mjpegtools/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_MJPEGTOOLS
 	bool "mjpegtools"
 	select BR2_PACKAGE_JPEG
+	depends on BR2_USE_MMU # fork
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
@@ -12,4 +13,5 @@ config BR2_PACKAGE_MJPEGTOOLS
 	  http://mjpeg.sourceforge.net
 
 comment "mjpegtools needs a toolchain w/ C++, threads"
+	depends on BR2_USE_MMU
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
