From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Jul 2014 20:41:16 +0200
Subject: [Buildroot] [PATCH] libva: needs shared library support
Message-ID: <1406140876-3957-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

  http://autobuild.buildroot.org/results/565/5655d1ee3f3b7503187d2e131d239cdde86683fb/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libva/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/libva/Config.in b/package/libva/Config.in
index 9d63b52..05369c5 100644
--- a/package/libva/Config.in
+++ b/package/libva/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_LIBVA
 	select BR2_PACKAGE_XLIB_LIBXFIXES if BR2_PACKAGE_XORG7
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm/libpthread-stubs
 	depends on BR2_LARGEFILE # libdrm
+	depends on !BR2_PREFER_STATIC_LIB
 	help
 	  The main motivation for VA-API (Video Acceleration API) is to enable
 	  hardware accelerated video decode/encode at various entry-points (VLD,
@@ -14,5 +15,6 @@ config BR2_PACKAGE_LIBVA
 
 	  http://www.freedesktop.org/wiki/Software/vaapi/
 
-comment "libva needs a toolchain w/ largefile, threads"
-	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
+comment "libva needs a toolchain w/ largefile, threads, dynamic library"
+	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_PREFER_STATIC_LIB
-- 
2.0.0
