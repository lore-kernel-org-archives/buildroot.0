From: Adam Duskett <aduskett@gmail.com>
Date: Fri,  9 Feb 2018 07:02:31 -0500
Subject: [Buildroot] [PATCH 1/1] postgresql: security bump to 10.2
Message-ID: <20180209120231.10745-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

from https://www.postgresql.org/about/news/1829/

[1] CVE-2018-1052: Fix the processing of partition keys containing multiple
                   expressions

[2] CVE-2018-1053: Ensure that all temporary files made with "pg_upgrade" are
                   non-world-readable

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/postgresql/postgresql.hash | 4 ++--
 package/postgresql/postgresql.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index e2347701c1..2950470fb9 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,5 +1,5 @@
-# From https://ftp.postgresql.org/pub/source/v10.1/postgresql-10.1.tar.bz2.sha256
-sha256	3ccb4e25fe7a7ea6308dea103cac202963e6b746697366d72ec2900449a5e713	postgresql-10.1.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v10.2/postgresql-10.2.tar.bz2.sha256
+sha256	fe32009b62ddb97f7f014307ce9d0edb6972f5a698e63cb531088e147d145bad	postgresql-10.2.tar.bz2
 
 # License file, Locally calculated
 sha256	7dc8de32741ad1b03e21710771b55a1b9d460671d47f28a8840f917e38c66676	COPYRIGHT
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 4657489a53..4b2bca714b 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 10.1
+POSTGRESQL_VERSION = 10.2
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = http://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
-- 
2.14.3
