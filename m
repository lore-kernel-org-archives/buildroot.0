From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 Jun 2018 23:17:39 +0200
Subject: [Buildroot] [git commit] gstreamer1-editing-services: bump to 1.14.1
Message-ID: <20180626211527.760B182DDD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9d291ff00c000ceb8d5968d783134cb5ffb16536
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- change legacy select BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_AUDIOMIXER to
  new select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_AUDIOMIXER

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gstreamer1/gstreamer1-editing-services/Config.in              | 3 +--
 .../gstreamer1-editing-services/gstreamer1-editing-services.hash      | 4 ++--
 .../gstreamer1-editing-services/gstreamer1-editing-services.mk        | 3 +--
 3 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/package/gstreamer1/gstreamer1-editing-services/Config.in b/package/gstreamer1/gstreamer1-editing-services/Config.in
index 716a4e5ef7..fe46870491 100644
--- a/package/gstreamer1/gstreamer1-editing-services/Config.in
+++ b/package/gstreamer1/gstreamer1-editing-services/Config.in
@@ -3,15 +3,14 @@ config BR2_PACKAGE_GSTREAMER1_EDITING_SERVICES
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_GST1_PLUGINS_BASE
 	select BR2_PACKAGE_GST1_PLUGINS_GOOD
-	select BR2_PACKAGE_GST1_PLUGINS_BAD
 	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_AUDIOCONVERT # runtime
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_AUDIOMIXER # runtime
 	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_AUDIORESAMPLE # runtime
 	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOCONVERT # runtime
 	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOTESTSRC # runtime
 	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOSCALE # runtime
 	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VOLUME # runtime
 	select BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_IMAGEFREEZE # runtime
-	select BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_AUDIOMIXER # runtime
 	help
 	  GStreamer Editing Services is a high-level library for
 	  facilitating the creation of audio/video non-linear editors.
diff --git a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash
index ddf9cecaed..c738db6f88 100644
--- a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash
+++ b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash
@@ -1,5 +1,5 @@
-# From https://gstreamer.freedesktop.org/src/gstreamer-editing-services/gstreamer-editing-services-1.12.4.tar.xz.sha256sum
-sha256 bd7eaa2c9572db9e7e535064024b6f69250de864fe8a5d5be86fa8c7edacca0c  gstreamer-editing-services-1.12.4.tar.xz
+# From https://gstreamer.freedesktop.org/src/gstreamer-editing-services/gstreamer-editing-services-1.14.1.tar.xz.sha256sum
+sha256 7e7c0962f39388cdf81b5e0d9f768eb15e30f58b346fd79f1ea778979eae113e gstreamer-editing-services-1.14.1.tar.xz
 
 # Hashes for license files:
 sha256 f445dc78b88496f7e20c7a2a461b95baba5865c8919b8289ac24ac0a80c6ce7a COPYING
diff --git a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk
index 9b5a93eb75..215582bf15 100644
--- a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk
+++ b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GSTREAMER1_EDITING_SERVICES_VERSION = 1.12.4
+GSTREAMER1_EDITING_SERVICES_VERSION = 1.14.1
 GSTREAMER1_EDITING_SERVICES_SOURCE = gstreamer-editing-services-$(GSTREAMER1_EDITING_SERVICES_VERSION).tar.xz
 GSTREAMER1_EDITING_SERVICES_SITE = http://gstreamer.freedesktop.org/src/gstreamer-editing-services
 GSTREAMER1_EDITING_SERVICES_LICENSE = LGPL-2.0+
@@ -15,7 +15,6 @@ GSTREAMER1_EDITING_SERVICES_DEPENDENCIES = \
 	gstreamer1 \
 	gst1-plugins-base \
 	gst1-plugins-good \
-	gst1-plugins-bad \
 	$(if $(BR2_PACKAGE_GST1_VALIDATE),gst1-validate) \
 	libxml2
 
