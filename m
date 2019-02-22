From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Feb 2019 13:17:45 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] package/postgresql: bump
 to version 10.7
Message-ID: <20190222121632.D03C18B8D0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2746e6e90bae35cd65aaef761a6f448a07e90388
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Fixes a long standing fsync issue and a number of other bugs:
https://www.postgresql.org/docs/10/release-10-7.html

https://wiki.postgresql.org/wiki/Fsync_Errors

The hash of the license file is only changed due to a year update:

-Portions Copyright (c) 1996-2018, PostgreSQL Global Development Group
+Portions Copyright (c) 1996-2019, PostgreSQL Global Development Group

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/postgresql/postgresql.hash | 6 +++---
 package/postgresql/postgresql.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index 05f94b4c76..ca797f1442 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,5 +1,5 @@
-# From https://ftp.postgresql.org/pub/source/v10.6/postgresql-10.6.tar.bz2.sha256
-sha256	68a8276f08bda8fbefe562faaf8831cb20664a7a1d3ffdbbcc5b83e08637624b	postgresql-10.6.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v10.7/postgresql-10.7.tar.bz2.sha256
+sha256	bfed1065380c1bba927bfe51f23168471373f26e3324cbad859269cc32733ede	postgresql-10.7.tar.bz2
 
 # License file, Locally calculated
-sha256	24cfc70cf16b3a23242c49ffce39510683bdd48cbedb8a46fe03976ee5f5c21e	COPYRIGHT
+sha256	c4c86d683970b22b9fab53320ee1b3a30ef4e8223122b4fb6be53ea62ecee8b3	COPYRIGHT
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 66af8fe5a9..883461fe98 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 10.6
+POSTGRESQL_VERSION = 10.7
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = http://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
