From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 30 Sep 2015 00:32:04 +0200
Subject: [Buildroot] [git commit] postgresql: disable rpath
Message-ID: <20150929223556.D5ED981D65@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b70f2f96d3c32c19761be6df57e16e9d5b6bdfef
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The linker -rpath option causes the linker to search for libraries in host
directories.

Should fix:
http://autobuild.buildroot.net/results/2cc/2cca5f8d8a8cd1bf9bbbc8c955aec477839e059f/
http://autobuild.buildroot.net/results/da6/da61d30791f216033971d679c84704d0fc0c3de0/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/postgresql/postgresql.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 382f320..2bad6b4 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -15,6 +15,7 @@ POSTGRESQL_CONF_ENV = ac_cv_type_struct_sockaddr_in6=yes \
 		      pgac_cv_snprintf_long_long_int_format="%lld" \
 		      pgac_cv_snprintf_size_t_support=yes
 POSTGRESQL_AUTORECONF = YES
+POSTGRESQL_CONF_OPTS = --disable-rpath
 
 ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
 # PostgreSQL does not build against uClibc with locales
