From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 31 Mar 2019 23:00:44 +0200
Subject: [Buildroot] [PATCH 1/1] package/quota: add optional openldap
 dependency
Message-ID: <20190331210044.32577-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/quota/quota.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/quota/quota.mk b/package/quota/quota.mk
index cd24f2cab7..a7bb968910 100644
--- a/package/quota/quota.mk
+++ b/package/quota/quota.mk
@@ -28,4 +28,11 @@ ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
 QUOTA_DEPENDENCIES += libtirpc host-pkgconf
 endif
 
+ifeq ($(BR2_PACKAGE_OPENLDAP),y)
+QUOTA_DEPENDENCIES += openldap
+QUOTA_CONF_OPTS += --enable-ldapmail
+else
+QUOTA_CONF_OPTS += --disable-ldapmail
+endif
+
 $(eval $(autotools-package))
-- 
2.20.1
