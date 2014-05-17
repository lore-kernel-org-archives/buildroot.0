From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 May 2014 10:30:57 +0200
Subject: [Buildroot] [PATCH] jack2: not available on ARC
Message-ID: <1400315457-29378-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ARC lacks some compiler intrinsics to build jack2.

Fixes:

  http://autobuild.buildroot.org/results/c21/c218be876d3abf7a8e212b6d526595bfd835e1c5/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/jack2/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/jack2/Config.in b/package/jack2/Config.in
index 6908455..a443f58 100644
--- a/package/jack2/Config.in
+++ b/package/jack2/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_JACK2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # alsa-lib
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_arc # missing compiler intrinsics
 	select BR2_PACKAGE_LIBSAMPLERATE
 	select BR2_PACKAGE_LIBSNDFILE
 	select BR2_PACKAGE_ALSA_LIB
@@ -22,5 +23,6 @@ config BR2_PACKAGE_JACK2
 
 comment "jack2 needs a toolchain w/ largefile, threads, C++"
 	depends on BR2_USE_MMU
+	depends on !BR2_arc
 	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_INSTALL_LIBSTDCPP
-- 
1.9.3
