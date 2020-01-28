From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Jan 2020 16:01:25 +0100
Subject: [Buildroot] [git commit] package/libpjsip: add libsamplerate support
Message-ID: <20200128145211.C1BDE83D30@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cdf39726c2ec346d6aeea90f0273a13d026b9c2c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libpjsip/libpjsip.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index f5c51fadf3..2e6c5abf08 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -36,7 +36,6 @@ LIBPJSIP_CONF_OPTS = \
 	--disable-g711-codec \
 	--disable-l16-codec \
 	--disable-g722-codec \
-	--disable-libsamplerate \
 	--disable-sdl \
 	--disable-ffmpeg \
 	--disable-v4l2 \
@@ -71,6 +70,13 @@ else
 LIBPJSIP_CONF_OPTS += --disable-ssl
 endif
 
+ifeq ($(BR2_PACKAGE_LIBSAMPLERATE),y)
+LIBPJSIP_DEPENDENCIES += libsamplerate
+LIBPJSIP_CONF_OPTS += --enable-libsamplerate
+else
+LIBPJSIP_CONF_OPTS += --disable-libsamplerate
+endif
+
 ifeq ($(BR2_PACKAGE_OPUS),y)
 LIBPJSIP_DEPENDENCIES += opus
 LIBPJSIP_CONF_OPTS += --with-opus=$(STAGING_DIR)/usr
