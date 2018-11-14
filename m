From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 14 Nov 2018 23:18:25 +0100
Subject: [Buildroot] [git commit branch/2018.08.x] postgresql: security bump
 to version 10.6
Message-ID: <20181114221616.8F4C383644@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=519cfbd9497decc6ee87dd940da9e0092de2dc63
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.08.x

Fixes the following security issue:

CVE-2018-16850: SQL injection in pg_upgrade and pg_dump, via CREATE TRIGGER
...  REFERENCING

For more details, see the advisory:

https://www.postgresql.org/about/news/1905/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/postgresql/postgresql.hash | 4 ++--
 package/postgresql/postgresql.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index a9cc93c76c..05f94b4c76 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,5 +1,5 @@
-# From https://ftp.postgresql.org/pub/source/v10.5/postgresql-10.5.tar.bz2.sha256
-sha256	6c8e616c91a45142b85c0aeb1f29ebba4a361309e86469e0fb4617b6a73c4011	postgresql-10.5.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v10.6/postgresql-10.6.tar.bz2.sha256
+sha256	68a8276f08bda8fbefe562faaf8831cb20664a7a1d3ffdbbcc5b83e08637624b	postgresql-10.6.tar.bz2
 
 # License file, Locally calculated
 sha256	24cfc70cf16b3a23242c49ffce39510683bdd48cbedb8a46fe03976ee5f5c21e	COPYRIGHT
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 540e1540ca..72e1c7601b 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 10.5
+POSTGRESQL_VERSION = 10.6
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = http://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
