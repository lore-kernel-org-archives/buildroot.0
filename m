From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Apr 2019 16:11:26 +0200
Subject: [Buildroot] [git commit] package/postgresql: fix build with NLS
Message-ID: <20190420140655.EA2718E81A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=45384e84669f1c1d634ee3f7d34b2f75b25775c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/0d35378b8bdcfffb0cefd264c95ca3617034559b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
