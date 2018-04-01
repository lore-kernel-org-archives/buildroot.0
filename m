From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 2 Apr 2018 00:44:24 +0200
Subject: [Buildroot] [git commit] mpv: enable cdda support through
 libcdio-paranoia
Message-ID: <20180401224437.C3E4F83832@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cc22fb65c3942b40c165ad7a2e1ec4796fa08a8d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mpv/mpv.mk | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/mpv/mpv.mk b/package/mpv/mpv.mk
index f38a6b916f..b8260213b7 100644
--- a/package/mpv/mpv.mk
+++ b/package/mpv/mpv.mk
@@ -20,7 +20,6 @@ MPV_CONF_OPTS = \
 	--prefix=/usr \
 	--disable-android \
 	--disable-caca \
-	--disable-cdda \
 	--disable-cocoa \
 	--disable-coreaudio \
 	--disable-cuda-hwaccel \
@@ -99,6 +98,14 @@ else
 MPV_CONF_OPTS += --disable-libbluray
 endif
 
+# libcdio-paranoia
+ifeq ($(BR2_PACKAGE_LIBCDIO_PARANOIA),y)
+MPV_CONF_OPTS += --enable-cdda
+MPV_DEPENDENCIES += libcdio-paranoia
+else
+MPV_CONF_OPTS += --disable-cdda
+endif
+
 # libdvdnav
 ifeq ($(BR2_PACKAGE_LIBDVDNAV),y)
 MPV_CONF_OPTS += --enable-dvdnav
