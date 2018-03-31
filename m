From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 31 Mar 2018 18:34:58 +0200
Subject: [Buildroot] [PATCH 1/1] package/dovecot: add optional support for
 libsodium
Message-ID: <20180331163458.11893-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/dovecot/dovecot.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/dovecot/dovecot.mk b/package/dovecot/dovecot.mk
index 8e775be5f7..1a10b30e16 100644
--- a/package/dovecot/dovecot.mk
+++ b/package/dovecot/dovecot.mk
@@ -57,6 +57,13 @@ else
 DOVECOT_CONF_OPTS += --without-libcap
 endif
 
+ifeq ($(BR2_PACKAGE_LIBSODIUM),y)
+DOVECOT_CONF_OPTS += --with-sodium
+DOVECOT_DEPENDENCIES += libsodium
+else
+DOVECOT_CONF_OPTS += --without-sodium
+endif
+
 ifeq ($(BR2_PACKAGE_DOVECOT_MYSQL),y)
 DOVECOT_CONF_ENV += MYSQL_CONFIG="$(STAGING_DIR)/usr/bin/mysql_config"
 DOVECOT_CONF_OPTS += --with-mysql
-- 
2.14.2
