From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 29 Sep 2015 23:01:31 +0300
Subject: [Buildroot] [PATCH 1/2] postgresql: disable rpath
Message-ID: <b782d1949e86cb4f2479ffac8fc47dffda0d1b9f.1443556892.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The linker -rpath option causes the linker to search for libraries in host
directories.

Should fix:
http://autobuild.buildroot.net/results/2cc/2cca5f8d8a8cd1bf9bbbc8c955aec477839e059f/
http://autobuild.buildroot.net/results/da6/da61d30791f216033971d679c84704d0fc0c3de0/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/postgresql/postgresql.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 382f3209ee22..2bad6b4d0547 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -15,6 +15,7 @@ POSTGRESQL_CONF_ENV = ac_cv_type_struct_sockaddr_in6=yes \
 		      pgac_cv_snprintf_long_long_int_format="%lld" \
 		      pgac_cv_snprintf_size_t_support=yes
 POSTGRESQL_AUTORECONF = YES
+POSTGRESQL_CONF_OPTS = --disable-rpath
 
 ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
 # PostgreSQL does not build against uClibc with locales
-- 
2.5.3
