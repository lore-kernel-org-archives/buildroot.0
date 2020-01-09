From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 9 Jan 2020 18:21:46 +0100
Subject: [Buildroot] [git commit] package/gnuradio: use ENABLE_ORC
Message-ID: <20200109171259.C8A8B88315@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d09e6ab5c397d1ab0724bdbd875e07aae51b0d66
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use ENABLE_ORC to explicitly enable or disable ORC

This option is available since version 3.7.4 and
https://github.com/gnuradio/gnuradio/commit/085c35a375468179929b690a0d7f037dc6ef23bf

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/gnuradio/gnuradio.mk | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/gnuradio/gnuradio.mk b/package/gnuradio/gnuradio.mk
index f6c3def1e4..7ee44f26ae 100644
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
