From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 26 Oct 2019 10:45:55 +0200
Subject: [Buildroot] [PATCH 3/9] package: get rid of remnants of using := in
 LICENSE
In-Reply-To: <cover.1572079551.git.yann.morin.1998@free.fr>
References: <cover.1572079551.git.yann.morin.1998@free.fr>
Message-ID: <318f477c19ea77637bbf47ae1ab28bbc0669560f.1572079551.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There is no longer any reason to assign to LICENSE using an
immediate assignment. There was even no reason to use it
either in the first assignment.

Drop it.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk | 2 +-
 package/libidn2/libidn2.mk                              | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index 59eb332e57..856db88e49 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -11,7 +11,7 @@ GST1_PLUGINS_BAD_INSTALL_STAGING = YES
 # Additional plugin licenses will be appended to GST1_PLUGINS_BAD_LICENSE and
 # GST1_PLUGINS_BAD_LICENSE_FILES if enabled.
 GST1_PLUGINS_BAD_LICENSE_FILES = COPYING.LIB
-GST1_PLUGINS_BAD_LICENSE := LGPL-2.0+, LGPL-2.1+
+GST1_PLUGINS_BAD_LICENSE = LGPL-2.0+, LGPL-2.1+
 
 GST1_PLUGINS_BAD_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
 
diff --git a/package/libidn2/libidn2.mk b/package/libidn2/libidn2.mk
index bd6c559d04..5e05634942 100644
--- a/package/libidn2/libidn2.mk
+++ b/package/libidn2/libidn2.mk
@@ -6,7 +6,7 @@
 
 LIBIDN2_VERSION = 2.2.0
 LIBIDN2_SITE = $(BR2_GNU_MIRROR)/libidn
-LIBIDN2_LICENSE := GPL-2.0+ or LGPL-3.0+ (library)
+LIBIDN2_LICENSE = GPL-2.0+ or LGPL-3.0+ (library)
 LIBIDN2_LICENSE_FILES = COPYING COPYINGv2 COPYING.LESSERv3 COPYING.unicode
 LIBIDN2_DEPENDENCIES = \
 	host-pkgconf \
-- 
2.20.1
