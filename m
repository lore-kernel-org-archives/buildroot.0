From: Adam Duskett <aduskett@gmail.com>
Date: Fri,  9 Feb 2018 07:22:12 -0500
Subject: [Buildroot] [PATCH 1/1] postgresql: security bump to 9.6.7
Message-ID: <20180209122212.27292-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

from https://www.postgresql.org/about/news/1829/

Fixes:
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
index e62838911e..4e4bccae13 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,4 +1,4 @@
-# From https://ftp.postgresql.org/pub/source/v9.6.6/postgresql-9.6.6.tar.bz2.sha256
-sha256 399cdffcb872f785ba67e25d275463d74521566318cfef8fe219050d063c8154  postgresql-9.6.6.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v9.6.7/postgresql-9.6.7.tar.bz2.sha256
+sha256 2ebe3df3c1d1eab78023bdc3ffa55a154aa84300416b075ef996598d78a624c6  postgresql-9.6.7.tar.bz2
 # License file, Locally calculated
 sha256 7dc8de32741ad1b03e21710771b55a1b9d460671d47f28a8840f917e38c66676  COPYRIGHT
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 50ce212c1c..86f79c05ee 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 9.6.6
+POSTGRESQL_VERSION = 9.6.7
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = http://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
-- 
2.14.3
