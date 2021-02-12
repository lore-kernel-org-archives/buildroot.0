From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 12 Feb 2021 18:34:16 +0100
Subject: [Buildroot] [PATCH 1/1] package/postgresql: security bump version
 to 13.2
Message-ID: <20210212173416.40398-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes:
https://www.postgresql.org/about/news/postgresql-132-126-1111-1016-9621-and-9525-released-2165/

Fixes CVE-2021-3393 & CVE-2021-20229.

Updated license hash due to copyright year bump:
https://git.postgresql.org/gitweb/?p=postgresql.git;a=commitdiff;h=c09f6882d6f78bde26fcc1e1a3da11c274de596a

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/postgresql/postgresql.hash | 6 +++---
 package/postgresql/postgresql.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index ef676cccc4..7dfe194837 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,5 +1,5 @@
-# From https://ftp.postgresql.org/pub/source/v13.1/postgresql-13.1.tar.bz2.sha256
-sha256  12345c83b89aa29808568977f5200d6da00f88a035517f925293355432ffe61f  postgresql-13.1.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v13.2/postgresql-13.2.tar.bz2.sha256
+sha256  5fd7fcd08db86f5b2aed28fcfaf9ae0aca8e9428561ac547764c2a2b0f41adfc  postgresql-13.2.tar.bz2
 
 # License file, Locally calculated
-sha256  739e5d454d81d31a482469338b7c856f1f5c6b4cdda1551cea6f0f6d18eef62c  COPYRIGHT
+sha256  31ccadc0a70e8e0e8a35c5833567b64388dfe34987d962e1911554e271294105  COPYRIGHT
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 76d1202de0..9206c62462 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 13.1
+POSTGRESQL_VERSION = 13.2
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = https://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
-- 
2.29.2
