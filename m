From: spdawson at gmail.com <spdawson@gmail.com>
Date: Sat, 13 Apr 2013 18:53:55 +0100
Subject: [Buildroot] [PATCH v2] ofono: bump to version 1.12
Message-ID: <1365875635-13462-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 v2: Define _GNU_SOURCE in CFLAGS, as suggested by Peter Korsgaard

 package/ofono/ofono.mk |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

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
-- 
1.7.10.4
