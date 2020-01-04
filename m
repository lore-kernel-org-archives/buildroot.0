From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  4 Jan 2020 19:30:58 +0100
Subject: [Buildroot] [PATCH 1/2] package/gnuradio: use ENABLE_ORC
Message-ID: <20200104183059.2366937-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use ENABLE_ORC to explicitly enable or disable ORC

This option is available since version 3.7.4 and
https://github.com/gnuradio/gnuradio/commit/085c35a375468179929b690a0d7f037dc6ef23bf

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gnuradio/gnuradio.mk | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/gnuradio/gnuradio.mk b/package/gnuradio/gnuradio.mk
index 9a989ad117..5b5da56b87 100644
--- a/package/gnuradio/gnuradio.mk
+++ b/package/gnuradio/gnuradio.mk
@@ -18,10 +18,6 @@ GNURADIO_DEPENDENCIES = \
 	host-swig \
 	boost
 
-ifeq ($(BR2_PACKAGE_ORC),y)
-GNURADIO_DEPENDENCIES += orc
-endif
-
 GNURADIO_CONF_OPTS = \
 	-DENABLE_DEFAULT=OFF \
 	-DENABLE_VOLK=ON \
@@ -53,6 +49,13 @@ ifeq ($(BR2_ARM_CPU_HAS_NEON),)
 GNURADIO_CONF_OPTS += -Dhave_mfpu_neon=0
 endif
 
+ifeq ($(BR2_PACKAGE_ORC),y)
+GNURADIO_DEPENDENCIES += orc
+GNURADIO_CONF_OPTS += -DENABLE_ORC=ON
+else
+GNURADIO_CONF_OPTS += -DENABLE_ORC=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_GNURADIO_ANALOG),y)
 GNURADIO_CONF_OPTS += -DENABLE_GR_ANALOG=ON
 else
-- 
2.24.0
