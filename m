From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 26 Jul 2014 09:21:11 +0200
Subject: [Buildroot] [git commit] x11vnc: needs MMU
Message-ID: <20140726072125.22A919D301@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5ce13af54499357bdacdf47c38180830f48fe3d8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package needs MMU. Hence this commit adds the dependency on
BR2_USE_MMU

Fixes:

  http://autobuild.buildroot.net/results/b9d/b9d27977a231d186fe5289232f5d3995ec756266/

Signed-off-by: Yuvaraj Patil <yuvaraj.patil@wipro.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11vnc/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/x11vnc/Config.in b/package/x11vnc/Config.in
index 5693754..0909b9a 100644
--- a/package/x11vnc/Config.in
+++ b/package/x11vnc/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_X11VNC
 	bool "x11vnc"
 	depends on BR2_PACKAGE_XORG7
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_XLIB_LIBXT
 	select BR2_PACKAGE_XLIB_LIBXEXT
 	select BR2_PACKAGE_XLIB_LIBXTST
