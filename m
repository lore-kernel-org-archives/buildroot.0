From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 May 2014 10:30:04 +0200
Subject: [Buildroot] [PATCH] jack2: requires MMU support
Message-ID: <1400315404-29308-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

jack2 uses fork(), so it's not available on non-MMU architectures.

Fixes:

  http://autobuild.buildroot.org/results/0d4/0d441bf1831b2a657b466e44c29423c45c07decd/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/jack2/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/jack2/Config.in b/package/jack2/Config.in
index a1669ee..6908455 100644
--- a/package/jack2/Config.in
+++ b/package/jack2/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_JACK2
 	bool "jack2"
 	depends on BR2_LARGEFILE # libsndfile
 	depends on BR2_TOOLCHAIN_HAS_THREADS # alsa-lib
+	depends on BR2_USE_MMU # fork()
 	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_LIBSAMPLERATE
 	select BR2_PACKAGE_LIBSNDFILE
@@ -20,5 +21,6 @@ config BR2_PACKAGE_JACK2
 	  http://jackaudio.org/
 
 comment "jack2 needs a toolchain w/ largefile, threads, C++"
+	depends on BR2_USE_MMU
 	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_INSTALL_LIBSTDCPP
-- 
1.9.3
