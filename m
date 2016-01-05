From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 5 Jan 2016 09:03:36 +0100
Subject: [Buildroot] [git commit] xapp_xcompmgr: select xlib_libXrender
Message-ID: <20160105080408.9287681EF8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=286182d0d3727f48f477f9dbaad8b4d319104329
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/969/9690a67083f31070e27c95b053fc0fd389fd373a/

libXrender is added to _DEPENDENCIES, but not selected at the kconfig level.
While we're at it, sort the selects alphabetically and drop the double
libxfixes select.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xapp_xcompmgr/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xapp_xcompmgr/Config.in b/package/x11r7/xapp_xcompmgr/Config.in
index a2e1db5..b46014d 100644
--- a/package/x11r7/xapp_xcompmgr/Config.in
+++ b/package/x11r7/xapp_xcompmgr/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_XAPP_XCOMPMGR
 	bool "xcompmgr"
 	select BR2_PACKAGE_XLIB_LIBXCOMPOSITE
-	select BR2_PACKAGE_XLIB_LIBXFIXES
+	select BR2_PACKAGE_XLIB_LIBXDAMAGE
 	select BR2_PACKAGE_XLIB_LIBXEXT
 	select BR2_PACKAGE_XLIB_LIBXFIXES
-	select BR2_PACKAGE_XLIB_LIBXDAMAGE
+	select BR2_PACKAGE_XLIB_LIBXRENDER
 	help
 	  xcompmgr is a sample compositing manager that enables basic
 	  eye-candy effects.
