From: Adam Duskett <aduskett@gmail.com>
Date: Sat,  3 Mar 2018 12:59:23 -0500
Subject: [Buildroot] [PATCH 2018.02 1/1] postgresql: security bump to 10.3
Message-ID: <20180303175923.29865-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Helps mitigate CVE-2018-1058

see: https://www.postgresql.org/docs/current/static/release-10-3.html for more
bugfixes.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/postgresql/postgresql.hash | 4 ++--
 package/postgresql/postgresql.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index bf3d2a8733..533c398d59 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,5 +1,5 @@
-# From https://ftp.postgresql.org/pub/source/v10.2/postgresql-10.2.tar.bz2.sha256
-sha256	fe32009b62ddb97f7f014307ce9d0edb6972f5a698e63cb531088e147d145bad	postgresql-10.2.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v10.3/postgresql-10.3.tar.bz2.sha256
+sha256	6ea268780ee35e88c65cdb0af7955ad90b7d0ef34573867f223f14e43467931a	postgresql-10.3.tar.bz2
 
 # License file, Locally calculated
 sha256	24cfc70cf16b3a23242c49ffce39510683bdd48cbedb8a46fe03976ee5f5c21e	COPYRIGHT
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 4b2bca714b..c6b689a146 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 10.2
+POSTGRESQL_VERSION = 10.3
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = http://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
-- 
2.14.3
