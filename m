From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 9 Nov 2020 21:21:45 +0100
Subject: [Buildroot] [git commit branch/next] package/postgresql: drop
 unrecognized variables
Message-ID: <20201109200832.8BAA381F6E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3b615593b96b2d350fae4b3d4145c60715dfcc22
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

pgac_cv_snprintf_long_long_int_modifier has been dropped since version
11.0 and
https://github.com/postgres/postgres/commit/b929614f5e867c70721b3db31d3dec6cb35e1eb5

pgac_cv_snprintf_size_t_support has been dropped since version 12.0 and
https://github.com/postgres/postgres/commit/96bf88d52711ad3a0a4cc2d1d9cb0e2acab85e63

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/postgresql/postgresql.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 3630b5a385..d984235249 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -13,8 +13,6 @@ POSTGRESQL_INSTALL_STAGING = YES
 POSTGRESQL_CONFIG_SCRIPTS = pg_config
 POSTGRESQL_CONF_ENV = \
 	ac_cv_type_struct_sockaddr_in6=yes \
-	pgac_cv_snprintf_long_long_int_modifier="ll" \
-	pgac_cv_snprintf_size_t_support=yes \
 	LIBS=$(TARGET_NLS_LIBS)
 POSTGRESQL_CONF_OPTS = --disable-rpath
 POSTGRESQL_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
