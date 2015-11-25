From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Nov 2015 23:25:42 +0100
Subject: [Buildroot] [git commit] libgtk3: mark wayland support as broken
Message-ID: <20151125222649.BDC747F97D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f58a5d73abf2ff7b19f788c4776571fb08ffc391
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As discussed on the list it requires a matching XDG runtime API level
which is currently not the case (wayland/weston newer than libgtk3 at
the moment). It doesn't normall exhibit build failures, but it fails at
runtime regardless.

Also fixes:
http://autobuild.buildroot.net/results/aae/aae4266c16189b295cc7ceb60000c504ebb60752/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libgtk3/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

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
