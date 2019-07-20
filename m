From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Jul 2019 18:45:20 +0200
Subject: [Buildroot] [git commit] package/dovecot: add linux-pam optional
 dependency
Message-ID: <20190720192839.7F67A8370B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9ff28a441080df49a4b33e80f8f50f5aa0c16ef0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/bba0d54cab164d77caf7161596b22602875a7a85

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/dovecot/dovecot.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/dovecot/dovecot.mk b/package/dovecot/dovecot.mk
index e4573e63f4..5a04b314ec 100644
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
