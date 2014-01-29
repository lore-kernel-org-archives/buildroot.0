From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 29 Jan 2014 22:37:01 +0100
Subject: [Buildroot] [git commit] libusb: do not depend on host-udev for
	host variant
Message-ID: <20140129213720.2BD249C6CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8c13f9e82ee897e643ee0d28f9eb4ce91449c769
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 25926af5 disabled udev support for the host variant, but forgot to
remove it from the (implicit) host dependencies.

Also reordered things to keep the HOST_* definitions together.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libusb/libusb.mk |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/package/libusb/libusb.mk b/package/libusb/libusb.mk
index ffb39ba..a8ff74c 100644
--- a/package/libusb/libusb.mk
+++ b/package/libusb/libusb.mk
@@ -8,12 +8,15 @@ LIBUSB_VERSION_MAJOR = 1.0
 LIBUSB_VERSION = $(LIBUSB_VERSION_MAJOR).18
 LIBUSB_SOURCE = libusb-$(LIBUSB_VERSION).tar.bz2
 LIBUSB_SITE = http://downloads.sourceforge.net/project/libusb/libusb-$(LIBUSB_VERSION_MAJOR)/libusb-$(LIBUSB_VERSION)
-HOST_LIBUSB_CONF_OPT = --disable-udev
 LIBUSB_LICENSE = LGPLv2.1+
 LIBUSB_LICENSE_FILES = COPYING
 LIBUSB_DEPENDENCIES = host-pkgconf
 LIBUSB_INSTALL_STAGING = YES
 
+# Avoid the discovery of udev for the host variant
+HOST_LIBUSB_CONF_OPT = --disable-udev
+HOST_LIBUSB_DEPENDENCIES = host-pkgconf
+
 ifeq ($(BR2_avr32),y)
 LIBUSB_CONF_OPT += --disable-timerfd
 endif
