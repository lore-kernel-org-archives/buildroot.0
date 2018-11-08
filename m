From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 8 Nov 2018 20:55:19 +0100
Subject: [Buildroot] [git commit] postgresql: security bump to version 11.1
Message-ID: <20181108195605.01224816B2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f680e57e48c8e1f909b781a6d1789e99a6457db8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security issue:

CVE-2018-16850: SQL injection in pg_upgrade and pg_dump, via CREATE TRIGGER
...  REFERENCING

For more details, see the advisory:

https://www.postgresql.org/about/news/1905/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/postgresql/postgresql.hash | 8 ++++----
 package/postgresql/postgresql.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index 40c128c221..28d4a988d2 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,7 +1,7 @@
-# From https://ftp.postgresql.org/pub/source/v11.0/postgresql-11.0.tar.bz2.md5
-md5 338ede84c0443db02ff6e8c4c8cbc5e9  postgresql-11.0.tar.bz2
-# From https://ftp.postgresql.org/pub/source/v11.0/postgresql-11.0.tar.bz2.sha256
-sha256 bf9bba03d0c3902c188af12e454b35343c4a9bf9e377ec2fe50132efb44ef36b  postgresql-11.0.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v11.1/postgresql-11.1.tar.bz2.md5
+md5 5e45f6d5b859cc76b5d62f1e328e9711  postgresql-11.1.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v11.1/postgresql-11.1.tar.bz2.sha256
+sha256 90815e812874831e9a4bf6e1136bf73bc2c5a0464ef142e2dfea40cda206db08  postgresql-11.1.tar.bz2
 
 # License file, Locally calculated
 sha256	24cfc70cf16b3a23242c49ffce39510683bdd48cbedb8a46fe03976ee5f5c21e	COPYRIGHT
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 2754526684..c4ba0daa17 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 11.0
+POSTGRESQL_VERSION = 11.1
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = http://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
