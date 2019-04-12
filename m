From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 12 Apr 2019 22:59:30 +0200
Subject: [Buildroot] [PATCH 3/3] package/pure-ftpd: add optional mysql
 dependency
In-Reply-To: <20190412205930.10268-1-fontaine.fabrice@gmail.com>
References: <20190412205930.10268-1-fontaine.fabrice@gmail.com>
Message-ID: <20190412205930.10268-3-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/pure-ftpd/pure-ftpd.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/pure-ftpd/pure-ftpd.mk b/package/pure-ftpd/pure-ftpd.mk
index a9268b4446..93ad57c3f3 100644
--- a/package/pure-ftpd/pure-ftpd.mk
+++ b/package/pure-ftpd/pure-ftpd.mk
@@ -30,6 +30,13 @@ ifeq ($(BR2_PACKAGE_LIBSODIUM),y)
 PURE_FTPD_DEPENDENCIES += libsodium
 endif
 
+ifeq ($(BR2_PACKAGE_MYSQL),y)
+PURE_FTPD_CONF_OPTS += --with-mysql=$(STAGING_DIR)/usr
+PURE_FTPD_DEPENDENCIES += mysql
+else
+PURE_FTPD_CONF_OPTS += --without-mysql
+endif
+
 ifeq ($(BR2_PACKAGE_OPENLDAP),y)
 PURE_FTPD_CONF_OPTS += --with-ldap
 PURE_FTPD_DEPENDENCIES += openldap
-- 
2.14.1
