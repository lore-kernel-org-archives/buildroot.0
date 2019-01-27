From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 27 Jan 2019 16:59:39 -0200
Subject: [Buildroot] [PATCH 4/8] package/usb_modeswitch: drop unicode space
 in comment
In-Reply-To: <20190127185943.1136-1-ricardo.martincoski@gmail.com>
References: <20190127185943.1136-1-ricardo.martincoski@gmail.com>
Message-ID: <20190127185943.1136-5-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit "a554109af8 package/usb_modeswitch: disable parallel build" added
a unicode space in a comment. Replace it with a normal ASCII space for
consistency with elsewhere.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
Before this patch:
$ file package/usb_modeswitch/usb_modeswitch.mk
package/usb_modeswitch/usb_modeswitch.mk: UTF-8 Unicode text

After this patch:
$ file package/usb_modeswitch/usb_modeswitch.mk
package/usb_modeswitch/usb_modeswitch.mk: ASCII text
---
 package/usb_modeswitch/usb_modeswitch.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/usb_modeswitch/usb_modeswitch.mk b/package/usb_modeswitch/usb_modeswitch.mk
index bb0d6ab1bf..8b93e086e3 100644
--- a/package/usb_modeswitch/usb_modeswitch.mk
+++ b/package/usb_modeswitch/usb_modeswitch.mk
@@ -1,29 +1,29 @@
 ################################################################################
 #
 # usb_modeswitch
 #
 ################################################################################
 
 USB_MODESWITCH_VERSION = 2.5.2
 USB_MODESWITCH_SOURCE = usb-modeswitch-$(USB_MODESWITCH_VERSION).tar.bz2
 USB_MODESWITCH_SITE = http://www.draisberghof.de/usb_modeswitch
 USB_MODESWITCH_DEPENDENCIES = libusb
 USB_MODESWITCH_LICENSE = GPL-2.0+
 USB_MODESWITCH_LICENSE_FILES = COPYING
-#?Package does not build in parallel due to improper make rules
+# Package does not build in parallel due to improper make rules
 USB_MODESWITCH_MAKE = $(MAKE1)
 
 USB_MODESWITCH_BUILD_TARGETS = static
 USB_MODESWITCH_INSTALL_TARGETS = install-static
 
 ifeq ($(BR2_PACKAGE_TCL)$(BR2_PACKAGE_TCL_SHLIB_ONLY),y)
 USB_MODESWITCH_DEPENDENCIES += tcl
 USB_MODESWITCH_BUILD_TARGETS = script
 USB_MODESWITCH_INSTALL_TARGETS = install-script
 endif
 
 # build system of embedded jimtcl doesn't use autotools, but does use
 # an old version of gnuconfig which doesn't know all the architectures
 # supported by Buildroot, so update config.guess / config.sub like we
 # do in pkg-autotools.mk
 USB_MODESWITCH_POST_PATCH_HOOKS += UPDATE_CONFIG_HOOK
-- 
2.17.1
