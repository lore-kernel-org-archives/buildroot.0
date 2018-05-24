From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 May 2018 22:22:22 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] gst1-plugins-bad: update
 plugin licenses
Message-ID: <20180524210450.CA80A825E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fb77c5bb755e1f87f77f046934e6d075d8b8a6bf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Update several of the licenses annotated in the gst1-plugins-bad.mk file.

1. Specify GPL-2.0 in license info.
* All of the *.[ch] that specify GPL also specify version 2 or later.

2. Remove GPL from audiovisualizers.
* Changlog notes move from GPL to LGPL. (2015-04-25)
* docs/plugins/inspect/plugin-audiovisualizers.xml claims "LGPL".
* All *.[ch] files under ./gst/audiovisualizers say "GNU Library General Public License".

3. Add GPL to yadif.
* Changelog notes that yadif is "GPL". (2013-02-07)
* docs/plugins/inspect/plugin-yadif.xml claims "GPL".
* All *.[ch] files under ./gst/yadif say "GNU General Public License" except for one "GNU Library General Public License".

4. Remove UNKNOWN from fdk_aac.
* docs/plugins/inspect/plugin-fdkaac.xml claims "LGPL".
* All *.[ch] files under ./ext/fdkaac say "GNU Lesser" or "GNU Library General Public License".

5. Add BSD-2c to dtls.
* docs/plugins/inspect/plugin-dtls.xml claims "BSD".
* All *.[ch] files under ./gst/dtls have BSD-2c text.

6. Add BSD-2c to openh264.
* Changelog notes that openh264 is "BSD-2". (2014-10-03)
* docs/plugins/inspect/plugin-openh264.xml claims "BSD".
* All *.[ch] files under ./ext/openh264 have BSD-2c text.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 34f256a9da690f66f8064a517564028b3be220f6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index b001c33592..90e2209a99 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -8,7 +8,7 @@ GST1_PLUGINS_BAD_VERSION = 1.12.4
 GST1_PLUGINS_BAD_SOURCE = gst-plugins-bad-$(GST1_PLUGINS_BAD_VERSION).tar.xz
 GST1_PLUGINS_BAD_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-bad
 GST1_PLUGINS_BAD_INSTALL_STAGING = YES
-# Unknown and GPL licensed plugins will append to GST1_PLUGINS_BAD_LICENSE and
+# Additional plugin licenses will be appended to GST1_PLUGINS_BAD_LICENSE and
 # GST1_PLUGINS_BAD_LICENSE_FILES if enabled.
 GST1_PLUGINS_BAD_LICENSE_FILES = COPYING.LIB
 GST1_PLUGINS_BAD_LICENSE := LGPL-2.0+, LGPL-2.1+
@@ -198,7 +198,6 @@ endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_AUDIOVISUALIZERS),y)
 GST1_PLUGINS_BAD_CONF_OPTS += --enable-audiovisualizers
-GST1_PLUGINS_BAD_HAS_GPL_LICENSE = y
 else
 GST1_PLUGINS_BAD_CONF_OPTS += --disable-audiovisualizers
 endif
@@ -514,6 +513,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_YADIF),y)
 GST1_PLUGINS_BAD_CONF_OPTS += --enable-yadif
+GST1_PLUGINS_BAD_HAS_GPL_LICENSE = y
 else
 GST1_PLUGINS_BAD_CONF_OPTS += --disable-yadif
 endif
@@ -585,7 +585,6 @@ endif
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_FDK_AAC),y)
 GST1_PLUGINS_BAD_CONF_OPTS += --enable-fdk_aac
 GST1_PLUGINS_BAD_DEPENDENCIES += fdk-aac
-GST1_PLUGINS_BAD_HAS_UNKNOWN_LICENSE = y
 else
 GST1_PLUGINS_BAD_CONF_OPTS += --disable-fdk_aac
 endif
@@ -632,6 +631,7 @@ endif
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DTLS),y)
 GST1_PLUGINS_BAD_CONF_OPTS += --enable-dtls
 GST1_PLUGINS_BAD_DEPENDENCIES += openssl
+GST1_PLUGINS_BAD_HAS_BSD2C_LICENSE = y
 else
 GST1_PLUGINS_BAD_CONF_OPTS += --disable-dtls
 endif
@@ -682,6 +682,7 @@ endif
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_OPENH264),y)
 GST1_PLUGINS_BAD_CONF_OPTS += --enable-openh264
 GST1_PLUGINS_BAD_DEPENDENCIES += libopenh264
+GST1_PLUGINS_BAD_HAS_BSD2C_LICENSE = y
 else
 GST1_PLUGINS_BAD_CONF_OPTS += --disable-openh264
 endif
@@ -771,10 +772,15 @@ endif
 
 # Add GPL license if GPL licensed plugins enabled.
 ifeq ($(GST1_PLUGINS_BAD_HAS_GPL_LICENSE),y)
-GST1_PLUGINS_BAD_LICENSE := $(GST1_PLUGINS_BAD_LICENSE), GPL
+GST1_PLUGINS_BAD_LICENSE := $(GST1_PLUGINS_BAD_LICENSE), GPL-2.0+
 GST1_PLUGINS_BAD_LICENSE_FILES += COPYING
 endif
 
+# Add BSD license if BSD licensed plugins enabled.
+ifeq ($(GST1_PLUGINS_BAD_HAS_BSD2C_LICENSE),y)
+GST1_PLUGINS_BAD_LICENSE := $(GST1_PLUGINS_BAD_LICENSE), BSD-2-Clause
+endif
+
 # Add Unknown license if Unknown licensed plugins enabled.
 ifeq ($(GST1_PLUGINS_BAD_HAS_UNKNOWN_LICENSE),y)
 GST1_PLUGINS_BAD_LICENSE := $(GST1_PLUGINS_BAD_LICENSE), UNKNOWN
