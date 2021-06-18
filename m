From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 18 Jun 2021 21:22:34 +0200
Subject: [Buildroot] [PATCH 1/4] package/mpv: fix reproducible build issues
Message-ID: <20210618192237.808519-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Do not include the build date when creating reproducible builds.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mpv/mpv.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/mpv/mpv.mk b/package/mpv/mpv.mk
index 25ac783b52..30f377054f 100644
--- a/package/mpv/mpv.mk
+++ b/package/mpv/mpv.mk
@@ -28,6 +28,10 @@ MPV_CONF_OPTS = \
 	--disable-uchardet \
 	--disable-vapoursynth
 
+ifeq ($(BR2_REPRODUCIBLE),y)
+MPV_CONF_OPTS += --disable-build-date
+endif
+
 ifeq ($(BR2_STATIC_LIBS),y)
 MPV_CONF_OPTS += --disable-libmpv-shared --enable-libmpv-static
 else
-- 
2.30.2
