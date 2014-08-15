From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 16 Aug 2014 00:32:26 +0200
Subject: [Buildroot] [git commit] xapp_rstart: Depends on MMU
Message-ID: <20140815225509.A64519D462@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3d13ab8ecc6103bd42244cf7133fed5f90e129e5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
  CCLD   rstartd.real
auth.o: In function `_do_auth':
auth.c:(.text+0x6a): undefined reference to `_fork'
server.o: In function `_detach':
server.c:(.text+0x80a): undefined reference to `_fork'

To reproduce use this defconfig
http://autobuild.buildroot.net/results/8d5/8d5ad404fab7ec2a501972ba9c08b0109e420b80/defconfig

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xapp_rstart/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/x11r7/xapp_rstart/Config.in b/package/x11r7/xapp_rstart/Config.in
index 1bf61b3..3c1d5a9 100644
--- a/package/x11r7/xapp_rstart/Config.in
+++ b/package/x11r7/xapp_rstart/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_XAPP_RSTART
 	bool "rstart"
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_XLIB_LIBX11
 	help
 	  X.Org rstart application
