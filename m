From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon,  2 Apr 2018 13:11:34 +0200
Subject: [Buildroot] [PATCH 1/1] mpd: add optional libmpdclient dependency
Message-ID: <20180402111134.23776-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mpd/mpd.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index f50e3d90c7..e1569b64cf 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -31,6 +31,13 @@ else
 MPD_CONF_OPTS += --disable-icu
 endif
 
+ifeq ($(BR2_PACKAGE_LIBMPDCLIENT),y)
+MPD_DEPENDENCIES += libmpdclient
+MPD_CONF_OPTS += --enable-libmpdclient
+else
+MPD_CONF_OPTS += --disable-libmpdclient
+endif
+
 ifeq ($(BR2_PACKAGE_MPD_ALSA),y)
 MPD_DEPENDENCIES += alsa-lib
 MPD_CONF_OPTS += --enable-alsa
-- 
2.14.1
