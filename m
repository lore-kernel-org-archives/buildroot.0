From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 10 Mar 2011 10:44:32 -0300
Subject: [Buildroot] [PATCH 2/5] xterm: fix dependencies and bump to version
	267
In-Reply-To: <1299764675-23308-1-git-send-email-gustavo@zacarias.com.ar>
References: <1299764675-23308-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1299764675-23308-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
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
