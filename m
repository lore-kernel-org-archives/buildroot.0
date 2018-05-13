From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 May 2018 23:21:28 +0200
Subject: [Buildroot] [git commit] gst1-plugins-bad: rework license type
 construction
Message-ID: <20180513212050.164458D2E7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=782deb7a4db68229fa38489ac598f312e4a4df49
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use "GST1_PLUGINS_BAD_LICENSE := $(GST1_PLUGINS_BAD_LICENSE), xxxx" construct
so that the list of licenses is presented as a comma-separated list.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index 9f7cd9777e..b001c33592 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -11,7 +11,7 @@ GST1_PLUGINS_BAD_INSTALL_STAGING = YES
 # Unknown and GPL licensed plugins will append to GST1_PLUGINS_BAD_LICENSE and
 # GST1_PLUGINS_BAD_LICENSE_FILES if enabled.
 GST1_PLUGINS_BAD_LICENSE_FILES = COPYING.LIB
-GST1_PLUGINS_BAD_LICENSE = LGPL-2.0+, LGPL-2.1+
+GST1_PLUGINS_BAD_LICENSE := LGPL-2.0+, LGPL-2.1+
 
 GST1_PLUGINS_BAD_CONF_OPTS = \
 	--disable-examples \
@@ -771,13 +771,13 @@ endif
 
 # Add GPL license if GPL licensed plugins enabled.
 ifeq ($(GST1_PLUGINS_BAD_HAS_GPL_LICENSE),y)
-GST1_PLUGINS_BAD_LICENSE += GPL
+GST1_PLUGINS_BAD_LICENSE := $(GST1_PLUGINS_BAD_LICENSE), GPL
 GST1_PLUGINS_BAD_LICENSE_FILES += COPYING
 endif
 
 # Add Unknown license if Unknown licensed plugins enabled.
 ifeq ($(GST1_PLUGINS_BAD_HAS_UNKNOWN_LICENSE),y)
-GST1_PLUGINS_BAD_LICENSE += UNKNOWN
+GST1_PLUGINS_BAD_LICENSE := $(GST1_PLUGINS_BAD_LICENSE), UNKNOWN
 endif
 
 # Use the following command to extract license info for plugins.
