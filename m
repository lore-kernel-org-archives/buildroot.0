From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 23 Feb 2020 22:22:28 +0100
Subject: [Buildroot] [git commit branch/next]
 package/kodi-visualisation-fishbmc: remove opengl dependency
Message-ID: <20200223211052.441818160F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fef10aee3de6912897cc5477831b6e175ce4777c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The addon can also be used with OpenGLES:
https://github.com/xbmc/visualization.fishbmc/blob/Leia/CMakeLists.txt

Updated project URL forgotten in
https://git.buildroot.net/buildroot/commit/?id=4726e93c63d51fe287c62628a9c71c04517d727c

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kodi-visualisation-fishbmc/Config.in | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/package/kodi-visualisation-fishbmc/Config.in b/package/kodi-visualisation-fishbmc/Config.in
index 9e2eabbdbc..66c1565bd7 100644
--- a/package/kodi-visualisation-fishbmc/Config.in
+++ b/package/kodi-visualisation-fishbmc/Config.in
@@ -1,10 +1,6 @@
 config BR2_PACKAGE_KODI_VISUALISATION_FISHBMC
 	bool "kodi-visualisation-fishbmc"
-	depends on BR2_PACKAGE_HAS_LIBGL
 	help
 	  Fische visualiser for Kodi
 
-	  https://github.com/notspiff/visualization.fishbmc
-
-comment "kodi-visualisation-fishbmc needs OpenGL"
-	depends on !BR2_PACKAGE_HAS_LIBGL
+	  https://github.com/xbmc/visualization.fishbmc
