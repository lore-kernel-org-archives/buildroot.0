From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  5 Nov 2017 19:46:49 +0100
Subject: [Buildroot] [PATCH 2/2] package/freerdp: always uses pkg-config
In-Reply-To: <cover.1509907598.git.yann.morin.1998@free.fr>
References: <cover.1509907598.git.yann.morin.1998@free.fr>
Message-ID: <f3ea53ecff0ea344fcc64197b75f4ee5be1ac09c.1509907598.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, we only deopend on host-pkgconf for gstreamer-0.x

However, we also need it at least for gstreamer-1.x and waylabnd, too.

Make it a mandatory dependency, no matter what.

Partially fixes:
    http://autobuild.buildroot.org/results/81a/81aa66ddd88919295ccb5f34b527b737627263a7/
    http://autobuild.buildroot.org/results/bdf/bdfe233ade36a56d0f65ef3c3d1698fca548beed/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/freerdp/freerdp.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index d6320de4c2..d5524c63ef 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -6,7 +6,7 @@
 
 FREERDP_VERSION = 2.0.0-rc0
 FREERDP_SITE = $(call github,FreeRDP,FreeRDP,$(FREERDP_VERSION))
-FREERDP_DEPENDENCIES = libglib2 openssl zlib
+FREERDP_DEPENDENCIES = libglib2 openssl zlib host-pkgconf
 FREERDP_LICENSE = Apache-2.0
 FREERDP_LICENSE_FILES = LICENSE
 
@@ -16,7 +16,7 @@ FREERDP_CONF_OPTS = -DWITH_MANPAGES=OFF -Wno-dev
 
 ifeq ($(BR2_PACKAGE_FREERDP_GSTREAMER),y)
 FREERDP_CONF_OPTS += -DWITH_GSTREAMER_0_10=ON
-FREERDP_DEPENDENCIES += gstreamer gst-plugins-base libxml2 host-pkgconf
+FREERDP_DEPENDENCIES += gstreamer gst-plugins-base libxml2
 else
 FREERDP_CONF_OPTS += -DWITH_GSTREAMER_0_10=OFF
 endif
-- 
2.11.0
