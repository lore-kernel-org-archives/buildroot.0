From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Mar 2013 21:44:08 +0100
Subject: [Buildroot] [PATCH] mediastreamer: add missing host-gettext
	dependencies and other fixes
Message-ID: <1364244248-29780-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.org/results/5e6c465c56f85a3017900613facc6e54c85d32da/build-end.log.

While we're at it, add the usual comment header block at the beginning
of the file, as well as licensing informations.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mediastreamer/mediastreamer.mk |   10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/mediastreamer/mediastreamer.mk b/package/mediastreamer/mediastreamer.mk
index b324126..6a0664e 100644
--- a/package/mediastreamer/mediastreamer.mk
+++ b/package/mediastreamer/mediastreamer.mk
@@ -1,9 +1,17 @@
+#############################################################
+#
+# mediastreamer
+#
+#############################################################
+
 MEDIASTREAMER_VERSION = 2.8.2
 MEDIASTREAMER_SITE = http://download.savannah.nongnu.org/releases/linphone/mediastreamer
 MEDIASTREAMER_INSTALL_STAGING = YES
-MEDIASTREAMER_DEPENDENCIES = host-intltool host-pkgconf ortp
+MEDIASTREAMER_DEPENDENCIES = host-intltool host-pkgconf ortp host-gettext
 # tests fail linking on some architectures, so disable them
 MEDIASTREAMER_CONF_OPT = --disable-tests
+MEDIASTREAMER_LICENSE = GPLv2+
+MEDIASTREAMER_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_ALSA_LIB_MIXER)$(BR2_PACKAGE_ALSA_LIB_PCM),yy)
 MEDIASTREAMER_CONF_OPT += --enable-alsa
-- 
1.7.9.5
