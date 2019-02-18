From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Feb 2019 23:10:51 +0100
Subject: [Buildroot] [git commit] package/postgresql: bump to version 11.2
Message-ID: <20190218221002.A48068B7F0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d04a1efcb56cbdc9b906d375fdebe30f00c9d752
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes a long standing fsync issue and a number of other bugs:
https://www.postgresql.org/docs/11/release-11-2.html

https://wiki.postgresql.org/wiki/Fsync_Errors

The hash of the license file is only changed due to a year update:

-Portions Copyright (c) 1996-2018, PostgreSQL Global Development Group
+Portions Copyright (c) 1996-2019, PostgreSQL Global Development Group

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Reviewed-by: Peter Seiderer <ps.report@gmx.net>
[Thomas: update commit log to explain why the license file hash has
changed, as repoted by Peter Seiderer]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/postgresql/postgresql.hash | 10 +++++-----
 package/postgresql/postgresql.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index 28d4a988d2..c4d7ab55bb 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,7 +1,7 @@
-# From https://ftp.postgresql.org/pub/source/v11.1/postgresql-11.1.tar.bz2.md5
-md5 5e45f6d5b859cc76b5d62f1e328e9711  postgresql-11.1.tar.bz2
-# From https://ftp.postgresql.org/pub/source/v11.1/postgresql-11.1.tar.bz2.sha256
-sha256 90815e812874831e9a4bf6e1136bf73bc2c5a0464ef142e2dfea40cda206db08  postgresql-11.1.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v11.2/postgresql-11.2.tar.bz2.md5
+md5 19d43be679cb0d55363feb8926af3a0f  postgresql-11.2.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v11.2/postgresql-11.2.tar.bz2.sha256
+sha256 2676b9ce09c21978032070b6794696e0aa5a476e3d21d60afc036dc0a9c09405  postgresql-11.2.tar.bz2
 
 # License file, Locally calculated
-sha256	24cfc70cf16b3a23242c49ffce39510683bdd48cbedb8a46fe03976ee5f5c21e	COPYRIGHT
+sha256	c4c86d683970b22b9fab53320ee1b3a30ef4e8223122b4fb6be53ea62ecee8b3  COPYRIGHT
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index fefbcf5f06..c7e9f526fc 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 11.1
+POSTGRESQL_VERSION = 11.2
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = http://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
