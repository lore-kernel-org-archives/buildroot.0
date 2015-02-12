From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 12 Feb 2015 21:53:27 +0100
Subject: [Buildroot] [git commit branch/next] xdriver_xf86-input-evdev: add
	optional mtdev support
Message-ID: <20150212205752.B85B7805B2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6eb0a96770d1af7649b972a850e8d24f89f8107d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Needed for multitouch handling.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../xdriver_xf86-input-evdev.mk                    |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk b/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk
index 5140301..edf2d48 100644
--- a/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk
+++ b/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk
@@ -15,6 +15,7 @@ XDRIVER_XF86_INPUT_EVDEV_DEPENDENCIES = \
 	xserver_xorg-server \
 	xproto_randrproto \
 	xproto_xproto \
-	udev
+	udev \
+	$(if $(BR2_PACKAGE_MTDEV),mtdev)
 
 $(eval $(autotools-package))
