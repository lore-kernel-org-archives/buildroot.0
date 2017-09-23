From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 23 Sep 2017 19:20:18 +0200
Subject: [Buildroot] [git commit] package/asterisk: add optional neon
	dependency
Message-ID: <20170923171327.2B3B08103C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1cf7b3c78b26c52ed8b4b51966c6f1c3ed0742ee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/asterisk/asterisk.mk | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index 7ef449f..859129b 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -76,7 +76,6 @@ ASTERISK_CONF_OPTS = \
 	--without-misdn \
 	--without-mysqlclient \
 	--without-nbs \
-	--without-neon \
 	--without-neon29 \
 	--without-netsnmp \
 	--without-newt \
@@ -150,6 +149,15 @@ else
 ASTERISK_CONF_OPTS += --without-asound
 endif
 
+ifeq ($(BR2_PACKAGE_NEON),y)
+ASTERISK_DEPENDENCIES += neon
+ASTERISK_CONF_OPTS += --with-neon
+ASTERISK_CONF_ENV += \
+	ac_cv_path_CONFIG_NEON=$(STAGING_DIR)/usr/bin/neon-config
+else
+ASTERISK_CONF_OPTS += --without-neon
+endif
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 ASTERISK_DEPENDENCIES += openssl
 ASTERISK_CONF_OPTS += --with-ssl
