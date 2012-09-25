From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 25 Sep 2012 20:31:20 +0200
Subject: [Buildroot] [git commit] x11r7: xserver_xorg-server: Amend record
	proto selection
Message-ID: <20120925195200.8ED1D99712@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=50c0a71d3a792a91b0c49933e27a14cf762f52d5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Record proto is not really required. It can be disabled.

Signed-off-by: Valentine Barshak <gvaxon@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/xserver_xorg-server/Config.in        |    1 -
 .../xserver_xorg-server/xserver_xorg-server.mk     |    3 ++-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
index 7d2f2de..02c2828 100644
--- a/package/x11r7/xserver_xorg-server/Config.in
+++ b/package/x11r7/xserver_xorg-server/Config.in
@@ -35,7 +35,6 @@ config BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_XPROTO_INPUTPROTO
 	select BR2_PACKAGE_XPROTO_KBPROTO
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_RECORDPROTO
 	select BR2_PACKAGE_XPROTO_RENDERPROTO
 	select BR2_PACKAGE_XPROTO_RESOURCEPROTO
 	select BR2_PACKAGE_XPROTO_VIDEOPROTO
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 80431b4..631dee8 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -39,7 +39,6 @@ XSERVER_XORG_SERVER_DEPENDENCIES = 	\
 	xproto_inputproto 		\
 	xproto_kbproto 			\
 	xproto_randrproto 		\
-	xproto_recordproto 		\
 	xproto_renderproto 		\
 	xproto_resourceproto 		\
 	xproto_videoproto 		\
@@ -122,6 +121,8 @@ endif
 ifeq ($(BR2_PACKAGE_XPROTO_RECORDPROTO),y)
 XSERVER_XORG_SERVER_DEPENDENCIES += xproto_recordproto
 XSERVER_XORG_SERVER_CONF_OPT += --enable-record
+else
+XSERVER_XORG_SERVER_CONF_OPT += --disable-record
 endif
 
 ifneq ($(BR2_PACKAGE_XLIB_LIBXVMC),y)
