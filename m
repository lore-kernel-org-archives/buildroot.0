From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 5 Feb 2016 23:22:42 +0100
Subject: [Buildroot] [git commit] xdotool: needs MMU support
Message-ID: <20160205222251.64DEF8182E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5c8a9eec2708d93a7e1a581941cbf5c2f078a8f7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/d750919a0d5cfb624937c72253651a431212e238

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
