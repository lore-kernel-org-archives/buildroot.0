From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 21 Oct 2018 00:10:56 +0200
Subject: [Buildroot] [PATCH 1/1] package/postgresql: bump version to 11.0
Message-ID: <20181020221056.10473-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes: https://www.postgresql.org/about/news/1894/

Added md5 hash provided by upstream.

To fix build errors "MAKELEVEL=0" is required by upstream in MAKE_OPTS:
https://www.postgresql-archive.org/BUG-15407-minor-build-depends-on-MAKELEVEL-being-0-at-top-Makefile-td6047685.html#a6047709

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/postgresql/postgresql.hash | 6 ++++--
 package/postgresql/postgresql.mk   | 4 +++-
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index a9cc93c76c..40c128c221 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,5 +1,7 @@
-# From https://ftp.postgresql.org/pub/source/v10.5/postgresql-10.5.tar.bz2.sha256
-sha256	6c8e616c91a45142b85c0aeb1f29ebba4a361309e86469e0fb4617b6a73c4011	postgresql-10.5.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v11.0/postgresql-11.0.tar.bz2.md5
+md5 338ede84c0443db02ff6e8c4c8cbc5e9  postgresql-11.0.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v11.0/postgresql-11.0.tar.bz2.sha256
+sha256 bf9bba03d0c3902c188af12e454b35343c4a9bf9e377ec2fe50132efb44ef36b  postgresql-11.0.tar.bz2
 
 # License file, Locally calculated
 sha256	24cfc70cf16b3a23242c49ffce39510683bdd48cbedb8a46fe03976ee5f5c21e	COPYRIGHT
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 540e1540ca..b86cff9e30 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 10.5
+POSTGRESQL_VERSION = 11.0
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = http://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
@@ -17,6 +17,8 @@ POSTGRESQL_CONF_ENV = \
 	pgac_cv_snprintf_size_t_support=yes
 POSTGRESQL_CONF_OPTS = --disable-rpath
 
+POSTGRESQL_MAKE_OPTS = MAKELEVEL=0
+
 ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
 # PostgreSQL does not build against uClibc with locales
 # enabled, due to an uClibc bug, see
-- 
2.19.1
