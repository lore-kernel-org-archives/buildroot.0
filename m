From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 13 Dec 2020 10:45:48 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/flare-engine:
 require sdl2_image with png support
Message-ID: <20201213094828.9918381617@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6fe2623f0acf6c16539c1ee11216e39f1656fbad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

flare-engine fail to start if sdl2_image library is build without
libpng support.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 6c4328a5abae7a89103e1cd399c73dba4bbac63c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/flare-engine/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/flare-engine/Config.in b/package/flare-engine/Config.in
index cdcb018948..d08b740af3 100644
--- a/package/flare-engine/Config.in
+++ b/package/flare-engine/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_FLARE_ENGINE
 	bool "flare-engine"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_STATIC_LIBS # SDL2
+	select BR2_PACKAGE_LIBPNG # SDL2_IMAGE needs libpng support
 	select BR2_PACKAGE_SDL2
 	select BR2_PACKAGE_SDL2_IMAGE
 	select BR2_PACKAGE_SDL2_MIXER
