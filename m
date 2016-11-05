From: Dagg Stompler <daggs@gmx.com>
Date: Sat,  5 Nov 2016 17:40:42 +0200
Subject: [Buildroot] [PATCH v6] kodi: allow enablement of libamcodec as
	codec if selected
Message-ID: <20161105154042.11063-1-daggs@gmx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

allow usage of amcodec if kodi is built and libamcodec is selected

Signed-off-by: Dagg Stompler <daggs@gmx.com>
---

v5 -> v6:
 - simplify patch so it will fit kodi 17 too (Thomas Petazzoni)
 - allow multiple codecs enabled.

v4 -> v5:
 - add description and signed off to the kodi patch. (Thomas Petazzoni).

v3 -> v4:
 - properly define the includes for amcodec when cross compiling.

v2 -> v3:
 - fix change after kodi.mk was changed.

v1 -> v2:
 - fixed mail title and comment

 package/kodi/kodi.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index e0361da..4682d3f 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -113,6 +113,12 @@ KODI_DEPENDENCIES += imx-vpuwrap
 KODI_CONF_OPTS += --enable-codec=imxvpu
 endif
 
+ifeq ($(BR2_PACKAGE_LIBAMCODEC),y)
+KODI_DEPENDENCIES += libamcodec
+KODI_CONF_OPTS += --enable-codec=amcodec
+KODI_CONF_ENV += INCLUDES="-I$(STAGING_DIR)/usr/include/amcodec"
+endif
+
 ifeq ($(BR2_PACKAGE_LIBCAP),y)
 KODI_CONF_OPTS += --enable-libcap
 KODI_DEPENDENCIES += libcap
-- 
2.10.2
