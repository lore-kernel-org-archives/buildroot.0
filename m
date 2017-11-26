From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Nov 2017 22:13:44 +0100
Subject: [Buildroot] [git commit branch/2017.08.x] usb_modeswitch: update
 config.guess / config.sub
Message-ID: <20171126213856.17FC8803EC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=560bb7b4090bb23f6265f841fb3b6c11ac6f4014
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.08.x

Fixes:
http://autobuild.buildroot.net/results/fbe/fbe21bd173e6566dd93dddd58d4a848de8a3465e/

The build system of the embedded jimtcl copy doesn't use autotools, but does
use an old version of gnuconfig which doesn't know all the architectures
supported by Buildroot, so update config.guess / config.sub like we do in
pkg-autotools.mk

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 90d86994f86fec8578772a8a7465bf912c69e1ca)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/usb_modeswitch/usb_modeswitch.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/usb_modeswitch/usb_modeswitch.mk b/package/usb_modeswitch/usb_modeswitch.mk
index ea08de2..c67d4cd 100644
--- a/package/usb_modeswitch/usb_modeswitch.mk
+++ b/package/usb_modeswitch/usb_modeswitch.mk
@@ -20,6 +20,12 @@ USB_MODESWITCH_BUILD_TARGETS = script
 USB_MODESWITCH_INSTALL_TARGETS = install-script
 endif
 
+# build system of embedded jimtcl doesn't use autotools, but does use
+# an old version of gnuconfig which doesn't know all the architectures
+# supported by Buildroot, so update config.guess / config.sub like we
+# do in pkg-autotools.mk
+USB_MODESWITCH_POST_PATCH_HOOKS += UPDATE_CONFIG_HOOK
+
 define USB_MODESWITCH_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
 		CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE -Wall -I." \
