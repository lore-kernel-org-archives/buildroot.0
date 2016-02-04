From: Erico Nunes <nunes.erico@gmail.com>
Date: Thu,  4 Feb 2016 21:19:41 -0200
Subject: [Buildroot] [PATCH 1/1] xdotool: needs MMU support
Message-ID: <1454627981-27595-1-git-send-email-nunes.erico@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/d750919a0d5cfb624937c72253651a431212e238

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
---
 package/xdotool/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/xdotool/Config.in b/package/xdotool/Config.in
index 4d5f590..4fb8a49 100644
--- a/package/xdotool/Config.in
+++ b/package/xdotool/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_XDOTOOL
 	bool "xdotool"
 	depends on BR2_PACKAGE_XORG7
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_XLIB_LIBXTST
 	select BR2_PACKAGE_XLIB_LIBXINERAMA
 	select BR2_PACKAGE_LIBXKBCOMMON
-- 
2.7.0
