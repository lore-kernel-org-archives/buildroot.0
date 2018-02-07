From: Adam Duskett <aduskett@gmail.com>
Date: Wed,  7 Feb 2018 16:23:55 -0500
Subject: [Buildroot] [RFCv2 3/3] gstreamer1: support gobject-introspection
In-Reply-To: <20180207212355.7464-1-aduskett@gmail.com>
References: <20180207212355.7464-1-aduskett@gmail.com>
Message-ID: <20180207212355.7464-4-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/gstreamer1/gstreamer1/gstreamer1.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/gstreamer1/gstreamer1/gstreamer1.mk b/package/gstreamer1/gstreamer1/gstreamer1.mk
index ea9f29a4f3..022676ca23 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.mk
+++ b/package/gstreamer1/gstreamer1/gstreamer1.mk
@@ -31,4 +31,9 @@ GSTREAMER1_DEPENDENCIES = \
 	libglib2 \
 	$(if $(BR2_PACKAGE_LIBUNWIND),libunwind)
 
+ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
+GSTREAMER1_DEPENDENCIES += gobject-introspection
+TARGET_MAKE_ENV += GIR_EXTRA_LIBS_PATH="$(@D)/gst/.libs:$(@D)/libs/gst/base/.libs"
+endif
+
 $(eval $(autotools-package))
-- 
2.14.3
