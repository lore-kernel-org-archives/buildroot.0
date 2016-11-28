From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 28 Nov 2016 19:53:51 +0100
Subject: [Buildroot] [PATCH v1] postgresql: fix
	pgac_cv_snprintf_long_long_int_modifier
Message-ID: <1480359231-29949-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Supplementary change the pgac_cv_snprintf_long_long_int_modifier from
complete format '%lld' to modifier 'll' version only (forgotten in commit
02c43157ab09f6fe4078fd1145fc9d403d66c089 ([1])).

Fixes Bug 9451 ([2]).

[1] https://git.buildroot.net/buildroot/commit/?id=02c43157ab09f6fe4078fd1145fc9d403d66c089
[2] https://bugs.busybox.net/show_bug.cgi?id=9451

Reported-by: Daniel <dde@innovaphone.com>
Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/postgresql/postgresql.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index d46e8c0..786ef48 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -13,7 +13,7 @@ POSTGRESQL_INSTALL_STAGING = YES
 POSTGRESQL_CONFIG_SCRIPTS = pg_config
 POSTGRESQL_CONF_ENV = \
 	ac_cv_type_struct_sockaddr_in6=yes \
-	pgac_cv_snprintf_long_long_int_modifier="%lld" \
+	pgac_cv_snprintf_long_long_int_modifier="ll" \
 	pgac_cv_snprintf_size_t_support=yes
 POSTGRESQL_CONF_OPTS = --disable-rpath
 
-- 
2.8.1
