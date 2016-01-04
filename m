From: Romain Naour <romain.naour@gmail.com>
Date: Mon,  4 Jan 2016 01:11:50 +0100
Subject: [Buildroot] [PATCH 6/6] package/x11r7/xapp_xbacklight: select
	xcb-util package.
In-Reply-To: <1451866310-10246-1-git-send-email-romain.naour@gmail.com>
References: <1451866310-10246-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1451866310-10246-6-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

xapp_xbacklight depends on xcb-util but doesn't select it
in Config.in. so the build is trigged at Makefile level.

Since 28f67899e54f15c6e48484ea2976c3e431756bcb, the build
stop if a package build is trigged at Makefile level without
being selected at Config.in level.

Also select libxcb to avoid an unmet dependency.

Fixes:
http://autobuild.buildroot.net/results/b78/b7817fe2dd39334578a45bd6029a360fdf528aca

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/x11r7/xapp_xbacklight/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/x11r7/xapp_xbacklight/Config.in b/package/x11r7/xapp_xbacklight/Config.in
index 9756235..ce62c9b 100644
--- a/package/x11r7/xapp_xbacklight/Config.in
+++ b/package/x11r7/xapp_xbacklight/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_XAPP_XBACKLIGHT
 	bool "xbacklight"
+	select BR2_PACKAGE_LIBXCB # xcb-util
+	select BR2_PACKAGE_XCB_UTIL
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXRANDR
 	select BR2_PACKAGE_XLIB_LIBXRENDER
-- 
2.4.3
