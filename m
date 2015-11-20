From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 20 Nov 2015 13:00:50 -0300
Subject: [Buildroot] [PATCH] libgtk3: mark wayland support as broken
Message-ID: <1448035250-17182-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As discussed on the list it requires a matching XDG runtime API level
which is currently not the case (wayland/weston newer than libgtk3 at
the moment). It doesn't normall exhibit build failures, but it fails at
runtime regardless.

Also fixes:
http://autobuild.buildroot.net/results/aae/aae4266c16189b295cc7ceb60000c504ebb60752/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libgtk3/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libgtk3/Config.in b/package/libgtk3/Config.in
index cdc3b2d..02c7aaf 100644
--- a/package/libgtk3/Config.in
+++ b/package/libgtk3/Config.in
@@ -40,6 +40,8 @@ config BR2_PACKAGE_LIBGTK3_X11
 config BR2_PACKAGE_LIBGTK3_WAYLAND
 	bool "GDK Wayland backend"
 	default y
+	# Needs a libgtk3 bump to match API level
+	depends on BROKEN
 	depends on BR2_PACKAGE_WAYLAND
 	select BR2_PACKAGE_LIBXKBCOMMON
 	help
-- 
2.4.10
