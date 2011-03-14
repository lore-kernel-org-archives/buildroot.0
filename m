From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 14 Mar 2011 23:36:43 +0100
Subject: [Buildroot] [git commit master 1/1] xterm: fix dependencies and
	bump to version 267
Message-ID: <20110314223657.CA39F90015@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=25e5ee52c018d2f9f811d61711682ff1a1fd2477
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/xterm/Config.in |    1 +
 package/xterm/xterm.mk  |    8 ++++----
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/xterm/Config.in b/package/xterm/Config.in
index 9473fad..99c89cf 100644
--- a/package/xterm/Config.in
+++ b/package/xterm/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_XTERM
 	bool "xterm"
+	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_XLIB_LIBXAW
 	depends on BR2_PACKAGE_XORG7
 	help
diff --git a/package/xterm/xterm.mk b/package/xterm/xterm.mk
index 8952e24..ab3fc10 100644
--- a/package/xterm/xterm.mk
+++ b/package/xterm/xterm.mk
@@ -4,10 +4,10 @@
 #
 #############################################################
 
-XTERM_VERSION:=262
-XTERM_SOURCE:=xterm-$(XTERM_VERSION).tgz
-XTERM_SITE:=ftp://invisible-island.net/xterm
-XTERM_DEPENDENCIES = xserver_xorg-server xlib_libXaw
+XTERM_VERSION = 267
+XTERM_SOURCE = xterm-$(XTERM_VERSION).tgz
+XTERM_SITE = ftp://invisible-island.net/xterm
+XTERM_DEPENDENCIES = ncurses xserver_xorg-server xlib_libXaw
 XTERM_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
 $(eval $(call AUTOTARGETS,package,xterm))
-- 
1.7.3.4
