From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 9 Aug 2019 22:39:18 +0200
Subject: [Buildroot] [git commit] package/mpd: upnp needs curl
Message-ID: <20190809203651.A70E58E679@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c31203ae097bf14b56b0f07c2f5eecc26e1ceea2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since switch to meson-package, upnp requires curl:
https://github.com/MusicPlayerDaemon/MPD/commit/94592c14062d5afc9482d11baa401648082022c0

Fixes:
 - http://autobuild.buildroot.org/results/1276d4be7270be6feada5d5c8b9e31db563ccc97

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mpd/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index 84698b1702..69f2beeb7b 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -350,6 +350,7 @@ config BR2_PACKAGE_MPD_UPNP
 	bool "UPnP"
 	select BR2_PACKAGE_EXPAT
 	select BR2_PACKAGE_LIBUPNP18 if !BR2_PACKAGE_LIBUPNP
+	select BR2_PACKAGE_MPD_CURL
 	help
 	  Enable MPD UPnP client support.
 
