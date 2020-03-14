From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Mar 2020 19:32:54 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/pure-ftpd: add
 optional mysql dependency
Message-ID: <20200314182116.DC11783B74@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8222b1dc5c0438735475f89d2cf7c33410abd786
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit f5c906c5985879a5c5a3a8f99c243205ec853f41)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pure-ftpd/pure-ftpd.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/pure-ftpd/pure-ftpd.mk b/package/pure-ftpd/pure-ftpd.mk
index 1b8328c86b..2d69efe3f9 100644
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
