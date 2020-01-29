From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 29 Jan 2020 20:49:23 +0100
Subject: [Buildroot] [git commit] package/libpjsip: add bcg729 optional
 dependency
Message-ID: <20200129194011.DA6DC842EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3fe4a3603cf58f397eaafe2d5ea24ebf75ff018d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libpjsip/libpjsip.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index 84919fdc10..b89249a6e5 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -49,6 +49,13 @@ LIBPJSIP_CONF_OPTS = \
 # so we want to use it.
 LIBPJSIP_CONF_OPTS += --enable-epoll
 
+ifeq ($(BR2_PACKAGE_BCG729),y)
+LIBPJSIP_DEPENDENCIES += bcg729
+LIBPJSIP_CONF_OPTS += --with-bcg729=$(STAGING_DIR)/usr
+else
+LIBPJSIP_CONF_OPTS += --disable-bcg729
+endif
+
 ifeq ($(BR2_PACKAGE_LIBGSM),y)
 LIBPJSIP_CONF_OPTS += \
 	--enable-gsm-codec \
