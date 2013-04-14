From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 14 Apr 2013 23:27:40 +0200
Subject: [Buildroot] [git commit] ofono: bump to version 1.12
Message-ID: <20130414214636.B3A5E9B6AD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2d1882ed5705d137e06d5420a10007ff1fcd4564
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ofono/ofono.mk |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/package/ofono/ofono.mk b/package/ofono/ofono.mk
index e552eac..5410c98 100644
--- a/package/ofono/ofono.mk
+++ b/package/ofono/ofono.mk
@@ -3,7 +3,7 @@
 # ofono
 #
 #############################################################
-OFONO_VERSION = 1.7
+OFONO_VERSION = 1.12
 OFONO_SITE = $(BR2_KERNEL_MIRROR)/linux/network/ofono
 OFONO_DEPENDENCIES = \
 	host-pkgconf \
@@ -14,6 +14,10 @@ OFONO_DEPENDENCIES = \
 
 OFONO_CONF_OPT = --disable-test
 
+# N.B. Qualcomm QMI modem support requires O_CLOEXEC; so
+# make sure that it is defined.
+OFONO_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE"
+
 ifeq ($(BR2_PACKAGE_UDEV),y)
 	OFONO_CONF_OPT += --enable-udev
 	OFONO_DEPENDENCIES += udev
