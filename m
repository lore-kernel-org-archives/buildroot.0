From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 21 Aug 2020 00:01:20 +0200
Subject: [Buildroot] [git commit]
 package/gstreamer1/gstreamer1-editing-services: disable introspection
Message-ID: <20200820220341.BF20181F02@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cc88590b49848a474088a17189e1b83f8a683a07
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable introspection as it raises a build failure with autotools.
It could be enabled after bumping to upcoming 1.18.x and switching to
messon. We can't switch now as version 1.16.2 don't allow to disable
examples/tools through meson

Fixes:
 - http://autobuild.buildroot.org/results/36eb875fba2847b32df05f31d8f8ca9f0ecde36f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../gstreamer1-editing-services/gstreamer1-editing-services.mk        | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk
index e2bb747d0a..4b0b61e877 100644
--- a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk
+++ b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk
@@ -18,7 +18,9 @@ GSTREAMER1_EDITING_SERVICES_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_GST1_VALIDATE),gst1-validate) \
 	libxml2
 
-GSTREAMER1_EDITING_SERVICES_CONF_OPTS = --disable-benchmarks
+GSTREAMER1_EDITING_SERVICES_CONF_OPTS = \
+	--disable-benchmarks \
+	--disable-introspection
 
 # examples need GTK2/3 with X11 backend
 ifneq ($(BR2_PACKAGE_LIBGTK2)$(BR2_PACKAGE_LIBGTK3_X11),)
