From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 7 Apr 2014 00:35:46 +0200
Subject: [Buildroot] [git commit] xserver_xorg-server: add optional
	libunwind support
Message-ID: <20140406223628.882F39C550@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f4826ed56163ca4c2b84257a65636b01717a8f2c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../xserver_xorg-server/xserver_xorg-server.mk     |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index dd4e280..0db1657 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -138,6 +138,12 @@ ifeq ($(BR2_PACKAGE_FREETYPE),y)
 XSERVER_XORG_SERVER_DEPENDENCIES += freetype
 endif
 
+ifeq ($(BR2_PACKAGE_LIBUNWIND),y)
+XSERVER_XORG_SERVER_DEPENDENCIES += libunwind
+else
+XSERVER_XORG_SERVER_CONF_OPT += --disable-libunwind
+endif
+
 ifeq ($(BR2_PACKAGE_XPROTO_RECORDPROTO),y)
 XSERVER_XORG_SERVER_DEPENDENCIES += xproto_recordproto
 XSERVER_XORG_SERVER_CONF_OPT += --enable-record
