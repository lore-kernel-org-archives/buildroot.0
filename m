From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 20 Jan 2013 21:20:24 +0100
Subject: [Buildroot] [git commit] xapp_xinit/xdm: only makes sense if there
	is an X server
Message-ID: <20130120202433.1DBAC82750@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1a111ffd21473c4862c1ce3404c103ac3a46372d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: also add dependency for xdm (which selects xinit)]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/xapp_xdm/Config.in   |    2 ++
 package/x11r7/xapp_xinit/Config.in |    2 ++
 2 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/x11r7/xapp_xdm/Config.in b/package/x11r7/xapp_xdm/Config.in
index b1c50d5..c962993 100644
--- a/package/x11r7/xapp_xdm/Config.in
+++ b/package/x11r7/xapp_xdm/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_XAPP_XDM
 	bool "xdm"
+	# Runtime dependency: can't start an X server unless there is one
+	depends on BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_XAPP_XINIT
 	select BR2_PACKAGE_XAPP_SESSREG
 	select BR2_PACKAGE_XAPP_XRDB
diff --git a/package/x11r7/xapp_xinit/Config.in b/package/x11r7/xapp_xinit/Config.in
index 9ac2817..30981c3 100644
--- a/package/x11r7/xapp_xinit/Config.in
+++ b/package/x11r7/xapp_xinit/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_XAPP_XINIT
 	bool "xinit"
+	# Runtime dependency: can't start an X server unless there is one
+	depends on BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_XAPP_XAUTH
 	select BR2_PACKAGE_XLIB_LIBX11
 	help
