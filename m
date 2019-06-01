From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  1 Jun 2019 16:34:55 +0200
Subject: [Buildroot] [PATCH v3,1/2] package/mpd: drop tremor select
Message-ID: <20190601143456.23326-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop tremor select added by commit
d428dddf680b067c13ba9a08bfd502c7286cffe7

Indeed, nowadays, mpd can be built successfully even if there is no
input plugin selected

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v2 -> v3 (after review of Thomas Petazzoni):
 - Move drop of tremor select in a dedicated patch
 - Remove BR2_SOFT_FLOAT dependency and make both options mutually
   exclusive

Changes v1 -> v2 (after review of Thomas Petazzoni):
 - Drop default and replace it by a dependency on BR2_SOFT_FLOAT or
   !BR2_SOFT_FLOAT

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
-- 
2.20.1
