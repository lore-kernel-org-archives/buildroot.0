From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 13 Apr 2019 16:07:22 +0200
Subject: [Buildroot] [git commit] package/pure-ftpd: add optional mysql
 dependency
Message-ID: <20190413143605.7ECF88E168@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f5c906c5985879a5c5a3a8f99c243205ec853f41
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
