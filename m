From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 13 Mar 2020 16:53:09 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/postgresql:
 security bump to version 11.7
Message-ID: <20200313154239.1C3E690B0E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1e01e7577a04c54a1bd0c28fb2acd9b8be376bca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes the following security issues:

- CVE-2020-1720: ALTER ... DEPENDS ON EXTENSION is missing authorization checks
  https://www.postgresql.org/about/news/2011/

Update the license hash for a change in copyright years:
-Portions Copyright (c) 1996-2019, PostgreSQL Global Development Group
+Portions Copyright (c) 1996-2020, PostgreSQL Global Development Group

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/postgresql/postgresql.hash | 10 +++++-----
 package/postgresql/postgresql.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index 4c78ad68b3..bf065693a2 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,7 +1,7 @@
-# From https://ftp.postgresql.org/pub/source/v11.6/postgresql-11.6.tar.bz2.md5
-md5 8e3462b342caf6f2265126674dde26da  postgresql-11.6.tar.bz2
-# From https://ftp.postgresql.org/pub/source/v11.6/postgresql-11.6.tar.bz2.sha256
-sha256 49924f7ff92965fdb20c86e0696f2dc9f8553e1563124ead7beedf8910c13170  postgresql-11.6.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v11.7/postgresql-11.7.tar.bz2.md5
+md5 1cf8e7533b103e2aa9de6e76d477f67d  postgresql-11.7.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v11.7/postgresql-11.7.tar.bz2.sha256
+sha256 324ae93a8846fbb6a25d562d271bc441ffa8794654c5b2839384834de220a313  postgresql-11.7.tar.bz2
 
 # License file, Locally calculated
-sha256	c4c86d683970b22b9fab53320ee1b3a30ef4e8223122b4fb6be53ea62ecee8b3  COPYRIGHT
+sha256	739e5d454d81d31a482469338b7c856f1f5c6b4cdda1551cea6f0f6d18eef62c  COPYRIGHT
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 4209cde344..c244493b22 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 11.6
+POSTGRESQL_VERSION = 11.7
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = https://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
