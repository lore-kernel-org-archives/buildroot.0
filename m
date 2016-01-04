From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 4 Jan 2016 16:19:19 +0100
Subject: [Buildroot] [git commit] xapp_xbacklight: select xcb-util package
Message-ID: <20160104151955.7A2FB826C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1a0368e6fe711c7b57bd7a5315c0f11b3aab77d0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

xapp_xbacklight depends on the xcb-utils package but doesn't select it.
Fixes:

http://autobuild.buildroot.net/results/d96/d96aa77e02954bef6fb6e9d244fbf9d1e939a374/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xapp_xbacklight/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/x11r7/xapp_xbacklight/Config.in b/package/x11r7/xapp_xbacklight/Config.in
index 9756235..5764056 100644
--- a/package/x11r7/xapp_xbacklight/Config.in
+++ b/package/x11r7/xapp_xbacklight/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_XAPP_XBACKLIGHT
 	bool "xbacklight"
+	select BR2_PACKAGE_XCB_UTIL
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXRANDR
 	select BR2_PACKAGE_XLIB_LIBXRENDER
