From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Aug 2014 21:31:51 +0200
Subject: [Buildroot] [git commit] xapp_xfs: needs MMU
Message-ID: <20140827193306.E9BA69D55F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f9a11a8fed00bf99d08822df2fdda4f7d9070f2c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.net/results/7a89f79499e167cc98449a045604d25d4fc88484/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xapp_xfs/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/x11r7/xapp_xfs/Config.in b/package/x11r7/xapp_xfs/Config.in
index e71d89f..8b72445 100644
--- a/package/x11r7/xapp_xfs/Config.in
+++ b/package/x11r7/xapp_xfs/Config.in
@@ -3,5 +3,6 @@ config BR2_PACKAGE_XAPP_XFS
 	select BR2_PACKAGE_XLIB_LIBFS
 	select BR2_PACKAGE_XLIB_LIBXFONT
 	select BR2_PACKAGE_XPROTO_FONTSPROTO
+	depends on BR2_USE_MMU # fork()
 	help
 	  X font server
