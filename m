From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 26 Apr 2019 14:36:34 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/postgresql: fix
 build with NLS
Message-ID: <20190426130223.03B9681470@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d5e2773aff5b45cb7d0c3216a35d50dd4eea1e72
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes:
 - http://autobuild.buildroot.org/results/0d35378b8bdcfffb0cefd264c95ca3617034559b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 45384e84669f1c1d634ee3f7d34b2f75b25775c4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/postgresql/postgresql.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index c7e9f526fc..8f01460109 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -14,8 +14,10 @@ POSTGRESQL_CONFIG_SCRIPTS = pg_config
 POSTGRESQL_CONF_ENV = \
 	ac_cv_type_struct_sockaddr_in6=yes \
 	pgac_cv_snprintf_long_long_int_modifier="ll" \
-	pgac_cv_snprintf_size_t_support=yes
+	pgac_cv_snprintf_size_t_support=yes \
+	LIBS=$(TARGET_NLS_LIBS)
 POSTGRESQL_CONF_OPTS = --disable-rpath
+POSTGRESQL_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 
 # https://www.postgresql.org/docs/11/static/install-procedure.html:
 # "If you want to invoke the build from another makefile rather than
