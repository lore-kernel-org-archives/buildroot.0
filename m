From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 13 Apr 2019 16:06:52 +0200
Subject: [Buildroot] [git commit] package/pure-ftpd: add optional postgresql
 dependency
Message-ID: <20190413143605.788628D413@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=be82ad9b45ebdfd268598d7b61ed55cc8565ee20
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/pure-ftpd/pure-ftpd.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/pure-ftpd/pure-ftpd.mk b/package/pure-ftpd/pure-ftpd.mk
index aed528b981..a9268b4446 100644
--- a/package/pure-ftpd/pure-ftpd.mk
+++ b/package/pure-ftpd/pure-ftpd.mk
@@ -47,6 +47,13 @@ else
 PURE_FTPD_CONF_OPTS += --without-tls
 endif
 
+ifeq ($(BR2_PACKAGE_POSTGRESQL),y)
+PURE_FTPD_CONF_OPTS += --with-pgsql=$(STAGING_DIR)/usr
+PURE_FTPD_DEPENDENCIES += postgresql
+else
+PURE_FTPD_CONF_OPTS += --without-pgsql
+endif
+
 ifeq ($(BR2_TOOLCHAIN_SUPPORTS_PIE),)
 PURE_FTPD_CONF_ENV += ax_cv_check_cflags___fPIE=no ax_cv_check_ldflags___fPIE=no
 endif
