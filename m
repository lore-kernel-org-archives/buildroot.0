From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Jul 2009 09:13:44 +0200
Subject: [Buildroot] [git commit] matchbox: fix dependencies
Message-ID: <20090725071548.B097477713@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=d776138bfff0d0c2c6e8332960ec8d70ee6e9e0b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A dependency on BR2_PACKAGE_XORG7 is enough, no need to depend on
BR2_PACKAGE_XORG_XSERVER.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/matchbox/Config.in |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/matchbox/Config.in b/package/matchbox/Config.in
index b57a4a2..afa5684 100644
--- a/package/matchbox/Config.in
+++ b/package/matchbox/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_MATCHBOX
 	bool "MatchBox Window Manager"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_FONTCONFIG
 	select BR2_PACKAGE_XLIB_LIBXDAMAGE
-- 
1.6.3.3
