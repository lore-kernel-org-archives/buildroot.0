From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 13 Mar 2020 16:44:30 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/postgresql:
 security bump to version 12.2
Message-ID: <20200313154252.890CD90ADF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6832ceea1e0fdb46c4fafda9819d7ca444ac0d23
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

Fixes the following security issues:

- CVE-2020-1720: ALTER ... DEPENDS ON EXTENSION is missing authorization checks
  https://www.postgresql.org/about/news/2011/

Update the license hash for a change in copyright years:
-Portions Copyright (c) 1996-2019, PostgreSQL Global Development Group
+Portions Copyright (c) 1996-2020, PostgreSQL Global Development Group

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 832ff93c897d12f618cca94d46ef94ab7975a2e2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/postgresql/postgresql.hash | 10 +++++-----
 package/postgresql/postgresql.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index 5acdc957f2..7cb0c67d63 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,7 +1,7 @@
-# From https://ftp.postgresql.org/pub/source/v12.1/postgresql-12.1.tar.bz2.md5
-md5 2ee1bd4ec5f49363a3f456f07e599b41  postgresql-12.1.tar.bz2
-# From https://ftp.postgresql.org/pub/source/v12.1/postgresql-12.1.tar.bz2.sha256
-sha256 a09bf3abbaf6763980d0f8acbb943b7629a8b20073de18d867aecdb7988483ed  postgresql-12.1.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v12.2/postgresql-12.2.tar.bz2.md5
+md5  a88ceea8ecf2741307f663e4539b58b7  postgresql-12.2.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v12.2/postgresql-12.2.tar.bz2.sha256
+sha256  ad1dcc4c4fc500786b745635a9e1eba950195ce20b8913f50345bb7d5369b5de  postgresql-12.2.tar.bz2
 
 # License file, Locally calculated
-sha256	c4c86d683970b22b9fab53320ee1b3a30ef4e8223122b4fb6be53ea62ecee8b3  COPYRIGHT
+sha256	739e5d454d81d31a482469338b7c856f1f5c6b4cdda1551cea6f0f6d18eef62c  COPYRIGHT
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 858cd6975e..7808bd9c37 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 12.1
+POSTGRESQL_VERSION = 12.2
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = https://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
