From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 23 Jun 2019 21:19:51 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] package/mpd: drop tremor
 select
Message-ID: <20190623192005.637FF818E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9f4dcbe4660719f2013e2886354b9f3d75e41002
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

Drop tremor select added by commit
d428dddf680b067c13ba9a08bfd502c7286cffe7

Indeed, nowadays, mpd can be built successfully even if there is no
input plugin selected.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 5d4ee34c39a23089496db8445c6d91b137745b41)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mpd/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index d3844391a2..20a7421481 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -9,7 +9,6 @@ menuconfig BR2_PACKAGE_MPD
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # exception_ptr
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
-	select BR2_PACKAGE_MPD_TREMOR if !(BR2_PACKAGE_MPD_MAD || BR2_PACKAGE_MPD_MPG123 || BR2_PACKAGE_MPD_VORBIS || BR2_PACKAGE_MPD_WAVPACK || BR2_PACKAGE_MPD_FLAC || BR2_PACKAGE_MPD_MUSEPACK || BR2_PACKAGE_MPD_FFMPEG)
 	help
 	  MPD is a flexible, powerful, server-side application
 	  for playing music. Through plugins and libraries
