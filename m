From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Jan 2015 09:47:55 +0100
Subject: [Buildroot] [git commit] xserver_xorg-server: Remove unused null
	root cursor option
Message-ID: <20150126085506.98EB3805D7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1c341192071b6940c5c168bdd95b1cd7600dc5f7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream removed this configure option back in 2010 (for server 1.8):

http://cgit.freedesktop.org/xorg/xserver/commit/?id=60b6477f6dc005a1b052be8c5

So this hasn't done anything since 759d548e3e5 (xserver_xorg-server: bump
version).

Don't add any Config.in.legacy for this as it as been broken for so long any
way.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xserver_xorg-server/Config.in        |    5 -----
 .../xserver_xorg-server/xserver_xorg-server.mk     |    6 ------
 2 files changed, 0 insertions(+), 11 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
index bf9f820..40e3d84 100644
--- a/package/x11r7/xserver_xorg-server/Config.in
+++ b/package/x11r7/xserver_xorg-server/Config.in
@@ -90,11 +90,6 @@ config BR2_PACKAGE_XSERVER_XORG_SERVER_KDRIVE
 
 endchoice
 
-config BR2_PACKAGE_XSERVER_XORG_SERVER_NULL_CURSOR
-	bool "Null root cursor"
-	help
-	  Don't display root cursor.
-
 config BR2_PACKAGE_XSERVER_XORG_SERVER_AIGLX
 	bool "Enable AIGLX Extension"
 	help
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 5baa515..a9b9921 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -112,12 +112,6 @@ else
 XSERVER_XORG_SERVER_CONF_OPTS += --disable-dri --disable-glx
 endif
 
-ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER_NULL_CURSOR),y)
-XSERVER_XORG_SERVER_CONF_OPTS += --enable-null-root-cursor
-else
-XSERVER_XORG_SERVER_CONF_OPTS += --disable-null-root-cursor
-endif
-
 ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER_AIGLX),y)
 XSERVER_XORG_SERVER_CONF_OPTS += --enable-aiglx
 else
