From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Dec 2016 14:13:08 +0100
Subject: [Buildroot] [git commit] package/x11r7/xserver_xorg-server:
	Explicitly disable glamor support when dependencies are not met
Message-ID: <20161217131708.797CE7FAFA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3f1c48afa52bc1bedd575a220a6ddc00259d6907
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/b48/b48074089da770463f7ffcc27e385ac59456edc5/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 48cd2a7..30fb05b 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -224,6 +224,8 @@ XSERVER_XORG_SERVER_CONF_OPTS += --enable-dri3
 ifeq ($(BR2_PACKAGE_HAS_LIBGL)$(BR2_PACKAGE_LIBEPOXY),yy)
 XSERVER_XORG_SERVER_DEPENDENCIES += libepoxy
 XSERVER_XORG_SERVER_CONF_OPTS += --enable-glamor
+else
+XSERVER_XORG_SERVER_CONF_OPTS += --disable-glamor
 endif
 else
 XSERVER_XORG_SERVER_CONF_OPTS += --disable-dri3 --disable-glamor
