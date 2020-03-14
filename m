From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Mar 2020 19:32:47 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/pure-ftpd: add
 optional postgresql dependency
Message-ID: <20200314182116.D395183B74@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=79c3da4b7bc5934061c04dae218c8b97e7f5f156
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit be82ad9b45ebdfd268598d7b61ed55cc8565ee20)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pure-ftpd/pure-ftpd.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/pure-ftpd/pure-ftpd.mk b/package/pure-ftpd/pure-ftpd.mk
index be71f16108..1b8328c86b 100644
--- a/package/pure-ftpd/pure-ftpd.mk
+++ b/package/pure-ftpd/pure-ftpd.mk
@@ -45,6 +45,13 @@ else
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
