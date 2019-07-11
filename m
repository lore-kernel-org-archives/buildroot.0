From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 11 Jul 2019 18:58:38 +0200
Subject: [Buildroot] [PATCH 1/1] package/dovecot: add linux-pam optional
 dependency
Message-ID: <20190711165838.9033-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/bba0d54cab164d77caf7161596b22602875a7a85

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/dovecot/dovecot.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/dovecot/dovecot.mk b/package/dovecot/dovecot.mk
index 78bc41bff2..b13bbc429d 100644
--- a/package/dovecot/dovecot.mk
+++ b/package/dovecot/dovecot.mk
@@ -64,6 +64,13 @@ else
 DOVECOT_CONF_OPTS += --without-sodium
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
+DOVECOT_CONF_OPTS += --with-pam
+DOVECOT_DEPENDENCIES += linux-pam
+else
+DOVECOT_CONF_OPTS += --without-pam
+endif
+
 ifeq ($(BR2_PACKAGE_DOVECOT_MYSQL),y)
 DOVECOT_CONF_ENV += MYSQL_CONFIG="$(STAGING_DIR)/usr/bin/mysql_config"
 DOVECOT_CONF_OPTS += --with-mysql
-- 
2.20.1
