From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 7 Dec 2020 22:55:48 +0100
Subject: [Buildroot] [git commit] package/flare-engine: require sdl2_image
 with png support
Message-ID: <20201207214009.359958177A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6c4328a5abae7a89103e1cd399c73dba4bbac63c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

flare-engine fail to start if sdl2_image library is build without
libpng support.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
