From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Mar 2016 17:59:49 +0100
Subject: [Buildroot] [git commit] xdriver_xf86-video-ati: needs dri3proto
	for glamor
Message-ID: <20160320165954.5220380746@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c7110480e02df1c91313028f1b5ae0e8c059b46c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We need to match xserver here, since we need glamor support there in
order to enable it here, hence need to match the dependencies.
For xserver it needs dri3proto+libepoxy, however if only libepoxy is
present then glamor would be disabled for the server but enabled for the
driver, leading to build failure.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
index 3dd3d07..09af05a 100644
--- a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
+++ b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
@@ -22,7 +22,7 @@ XDRIVER_XF86_VIDEO_ATI_DEPENDENCIES = \
 	xproto_xproto \
 	xserver_xorg-server
 
-ifeq ($(BR2_PACKAGE_LIBEPOXY),y)
+ifeq ($(BR2_PACKAGE_XPROTO_DRI3PROTO)$(BR2_PACKAGE_LIBEPOXY),yy)
 XDRIVER_XF86_VIDEO_ATI_CONF_OPTS = --enable-glamor
 else
 XDRIVER_XF86_VIDEO_ATI_CONF_OPTS = --disable-glamor
