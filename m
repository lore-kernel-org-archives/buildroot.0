From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Tue, 28 Sep 2010 14:52:15 +0300
Subject: [Buildroot] [PATCH] xterm: should select libXaw and bump to latest
	version
Message-ID: <20100928115214.10039.12962.stgit@localhost6.localdomain6>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---

 package/xterm/Config.in |    1 +
 package/xterm/xterm.mk  |    4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/xterm/Config.in b/package/xterm/Config.in
index da3e9fe..9473fad 100644
--- a/package/xterm/Config.in
+++ b/package/xterm/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_XTERM
 	bool "xterm"
+	select BR2_PACKAGE_XLIB_LIBXAW
 	depends on BR2_PACKAGE_XORG7
 	help
 	  xterm terminal emulator
diff --git a/package/xterm/xterm.mk b/package/xterm/xterm.mk
index b07eda4..8952e24 100644
--- a/package/xterm/xterm.mk
+++ b/package/xterm/xterm.mk
@@ -4,10 +4,10 @@
 #
 #############################################################
 
-XTERM_VERSION:=259
+XTERM_VERSION:=262
 XTERM_SOURCE:=xterm-$(XTERM_VERSION).tgz
 XTERM_SITE:=ftp://invisible-island.net/xterm
-XTERM_DEPENDENCIES = xserver_xorg-server
+XTERM_DEPENDENCIES = xserver_xorg-server xlib_libXaw
 XTERM_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
 $(eval $(call AUTOTARGETS,package,xterm))
