From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 30 Jan 2020 11:21:30 +0100
Subject: [Buildroot] [git commit] package/libpjsip: add sound support
Message-ID: <20200130101225.BFEE58477A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ecbd31c3768bde5b244b09726501f69582d68d39
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libpjsip/libpjsip.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index b89249a6e5..a6012ba58b 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -25,7 +25,6 @@ LIBPJSIP_CONF_ENV = \
 	CFLAGS="$(LIBPJSIP_CFLAGS)"
 
 LIBPJSIP_CONF_OPTS = \
-	--disable-sound \
 	--disable-resample \
 	--disable-video \
 	--disable-g7221-codec \
@@ -49,6 +48,13 @@ LIBPJSIP_CONF_OPTS = \
 # so we want to use it.
 LIBPJSIP_CONF_OPTS += --enable-epoll
 
+ifeq ($(BR2_PACKAGE_ALSA_LIB_MIXER),y)
+LIBPJSIP_DEPENDENCIES += alsa-lib
+LIBPJSIP_CONF_OPTS += --enable-sound
+else
+LIBPJSIP_CONF_OPTS += --disable-sound
+endif
+
 ifeq ($(BR2_PACKAGE_BCG729),y)
 LIBPJSIP_DEPENDENCIES += bcg729
 LIBPJSIP_CONF_OPTS += --with-bcg729=$(STAGING_DIR)/usr
