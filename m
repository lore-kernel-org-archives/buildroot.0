From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 7 Sep 2014 21:52:36 +0200
Subject: [Buildroot] [git commit] xapp_xf86dga: Needs MMU
Message-ID: <20140907195715.51EE49D5EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=873ce3fab3bb996fc1d75594142d640e18e835cd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/e76/e76b8ff1767f061587b630091174c58da599d5e3/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xapp_xf86dga/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/x11r7/xapp_xf86dga/Config.in b/package/x11r7/xapp_xf86dga/Config.in
index 769ebf6..8a13bd4 100644
--- a/package/x11r7/xapp_xf86dga/Config.in
+++ b/package/x11r7/xapp_xf86dga/Config.in
@@ -2,5 +2,6 @@ config BR2_PACKAGE_XAPP_XF86DGA
 	bool "xf86dga"
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXXF86DGA
+	depends on BR2_USE_MMU # fork()
 	help
 	  test program for the XFree86-DGA extension
