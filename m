From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 2 Nov 2012 20:56:31 +0100
Subject: [Buildroot] [git commit] fluxbox: select xmodmap
Message-ID: <20121102231429.1DB88999E0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0f12f2902372658a657f3df306b16a4a5be4888b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fluxbox uses xmodmap in its startup script.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/fluxbox/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/fluxbox/Config.in b/package/fluxbox/Config.in
index e4d6c37..588e83b 100644
--- a/package/fluxbox/Config.in
+++ b/package/fluxbox/Config.in
@@ -3,6 +3,8 @@ config BR2_PACKAGE_FLUXBOX
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_XLIB_LIBX11
+	# Runtime dependency, needed by startup script
+	select BR2_PACKAGE_XAPP_XMODMAP
 	help
 	  The Fluxbox lightweight window manager for X
 
