From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:56:47 -0000
Subject: [Buildroot] [git commit branch/next]
	package/x11r7/xdriver_xf86-video-ati: Add optional support
	for glamor
Message-ID: <20150808105637.12AF77F97E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=daa433bff6d2d9934705feacd3619a7618d13ae5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

xserver_xorg-server depends on libepoxy for glamor support, therefore we
use this package as an indicator whether glamor support is present.

Fixes https://bugs.busybox.net/show_bug.cgi?id=8171

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../xdriver_xf86-video-ati.mk                      |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
index 15807c2..cba9e76 100644
--- a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
+++ b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
@@ -22,4 +22,10 @@ XDRIVER_XF86_VIDEO_ATI_DEPENDENCIES = \
 	xproto_xproto \
 	xserver_xorg-server
 
+ifeq ($(BR2_PACKAGE_LIBEPOXY),y)
+XDRIVER_XF86_VIDEO_ATI_CONF_OPTS = --enable-glamor
+else
+XDRIVER_XF86_VIDEO_ATI_CONF_OPTS = --disable-glamor
+endif
+
 $(eval $(autotools-package))
