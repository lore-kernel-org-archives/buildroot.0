From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 16 Aug 2014 00:32:04 +0200
Subject: [Buildroot] [git commit] package/matchbox: Depends on MMU
Message-ID: <20140815225509.999379D462@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7502da865b512078cf5094ce750ffeffb57aabcf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes matchbox-panel:
http://autobuild.buildroot.net/results/8d5/8d5ad404fab7ec2a501972ba9c08b0109e420b80/

and matchbox-desktop:
mbdesktop_win_plugin.o: In function `mbdesktop_win_plugin_load':
/home/br/br/output/build/matchbox-desktop-0.9.1/src/mbdesktop_win_plugin.c:22: undefined reference to `_fork'

and matchbox-wm:
matchbox-remote.o: In function `mbcommand':
/home/fli4l/br3/output/build/matchbox-wm-1.2/src/matchbox-remote.c:147: undefined reference to `_fork'

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/matchbox/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/matchbox/Config.in b/package/matchbox/Config.in
index da02df3..b70133e 100644
--- a/package/matchbox/Config.in
+++ b/package/matchbox/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_MATCHBOX
 	bool "MatchBox Window Manager"
 	depends on BR2_PACKAGE_XORG7
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_FONTCONFIG
 	select BR2_PACKAGE_EXPAT
 	select BR2_PACKAGE_XLIB_LIBXEXT
