From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 27 Mar 2019 17:37:20 +0100
Subject: [Buildroot] [PATCH 1/1] package/pure-ftpd: add optional openldap
 dependency
Message-ID: <20190327163720.23339-1-fontaine.fabrice@gmail.com>
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
index 2fd68de971..8a71ea3b24 100644
--- a/package/pure-ftpd/pure-ftpd.mk
+++ b/package/pure-ftpd/pure-ftpd.mk
@@ -31,6 +31,13 @@ ifeq ($(BR2_PACKAGE_LIBSODIUM),y)
 PURE_FTPD_DEPENDENCIES += libsodium
 endif
 
+ifeq ($(BR2_PACKAGE_OPENLDAP),y)
+PURE_FTPD_CONF_OPTS += --with-ldap
+PURE_FTPD_DEPENDENCIES += openldap
+else
+PURE_FTPD_CONF_OPTS += --without-ldap
+endif
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 PURE_FTPD_CONF_OPTS += --with-tls
 PURE_FTPD_DEPENDENCIES += host-pkgconf openssl
-- 
2.14.1
