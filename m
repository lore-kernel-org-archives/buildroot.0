From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 3 May 2018 23:04:03 +0200
Subject: [Buildroot] [git commit] gst1-plugins-bad: conditionally add gpl
 license
Message-ID: <20180503210421.71C2C8B602@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2bbb6b800143b87608cc68351036ae4ccf649c1b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, GST1_PLUGINS_BAD_LICENSE_FILES starts out set to
both the GPL COPYING file and the LGPL COPYING.LIB file, but
the GST1_PLUGINS_BAD_LICENSE handling only claims LGPL, and
then intelligently adds GPL if needed.  This change moves the
GPL file addition to the same conditional clause so that the
GPL file is included in the legal-info location only if GPL
code is actually used.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index 83cb94be81..9f7cd9777e 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -8,9 +8,9 @@ GST1_PLUGINS_BAD_VERSION = 1.12.4
 GST1_PLUGINS_BAD_SOURCE = gst-plugins-bad-$(GST1_PLUGINS_BAD_VERSION).tar.xz
 GST1_PLUGINS_BAD_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-bad
 GST1_PLUGINS_BAD_INSTALL_STAGING = YES
-GST1_PLUGINS_BAD_LICENSE_FILES = COPYING COPYING.LIB
-# Unknown and GPL licensed plugins will append to GST1_PLUGINS_BAD_LICENSE if
-# enabled.
+# Unknown and GPL licensed plugins will append to GST1_PLUGINS_BAD_LICENSE and
+# GST1_PLUGINS_BAD_LICENSE_FILES if enabled.
+GST1_PLUGINS_BAD_LICENSE_FILES = COPYING.LIB
 GST1_PLUGINS_BAD_LICENSE = LGPL-2.0+, LGPL-2.1+
 
 GST1_PLUGINS_BAD_CONF_OPTS = \
@@ -772,6 +772,7 @@ endif
 # Add GPL license if GPL licensed plugins enabled.
 ifeq ($(GST1_PLUGINS_BAD_HAS_GPL_LICENSE),y)
 GST1_PLUGINS_BAD_LICENSE += GPL
+GST1_PLUGINS_BAD_LICENSE_FILES += COPYING
 endif
 
 # Add Unknown license if Unknown licensed plugins enabled.
