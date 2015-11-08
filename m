From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  8 Nov 2015 18:44:33 +0100
Subject: [Buildroot] [PATCH 1/1]
	package/x11r7/xdriver_xf86-video-siliconmotion: Fix compile
	warnings being treated as error
In-Reply-To: <1447004673-18164-1-git-send-email-bernd.kuhls@t-online.de>
References: <1447004673-18164-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1447004673-18164-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/059/059d771cb39532dee73a5f50e24b3441005ed38b/
http://autobuild.buildroot.net/results/542/5429dd3f07430cf1487a8cfa82ba55e66a640473/
http://autobuild.buildroot.net/results/073/073105a692033665d31b2dc034eff2e0fdca7f10/
http://autobuild.buildroot.net/results/018/01805d60b8b046122d357e2559268e8a45dcf9d3/
and many others

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../xdriver_xf86-video-siliconmotion.mk                                 | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.mk b/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.mk
index 2aa22ae..f8ea403 100644
--- a/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.mk
+++ b/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.mk
@@ -11,4 +11,6 @@ XDRIVER_XF86_VIDEO_SILICONMOTION_LICENSE = MIT
 XDRIVER_XF86_VIDEO_SILICONMOTION_LICENSE_FILES = COPYING
 XDRIVER_XF86_VIDEO_SILICONMOTION_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xproto
 
+XDRIVER_XF86_VIDEO_SILICONMOTION_CONF_OPTS = --disable-selective-werror
+
 $(eval $(autotools-package))
-- 
2.6.2
