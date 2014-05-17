From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 17 May 2014 23:25:04 +0200
Subject: [Buildroot] [git commit] package/x11r7/xserver_xorg-server: Udev
	kms support depends on libdrm
Message-ID: <20140517213137.117AF9CC58@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9d50fe608f968a5cc81ec859259f6304c3bf83c6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/18c/18c554d148fc00f85690c1638976dd6d0d7ff219/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../xserver_xorg-server/xserver_xorg-server.mk     |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 284d602..cae3ba0 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -127,6 +127,13 @@ endif
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
 XSERVER_XORG_SERVER_DEPENDENCIES += udev
 XSERVER_XORG_SERVER_CONF_OPT += --enable-config-udev
+# udev kms support depends on libdrm
+ifeq ($(BR2_PACKAGE_LIBDRM),y)
+XSERVER_XORG_SERVER_DEPENDENCIES += libdrm
+XSERVER_XORG_SERVER_CONF_OPT += --enable-config-udev-kms
+else
+XSERVER_XORG_SERVER_CONF_OPT += --disable-config-udev-kms
+endif
 else
 ifeq ($(BR2_PACKAGE_DBUS),y)
 XSERVER_XORG_SERVER_DEPENDENCIES += dbus
