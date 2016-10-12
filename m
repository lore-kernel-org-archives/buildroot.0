From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 12 Oct 2016 20:17:27 -0300
Subject: [Buildroot] [PATCH] postgresql: security bump to version 9.5.4
Message-ID: <1476314247-26581-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
CVE-2016-5423 - CASE/WHEN with inlining can cause untrusted pointer
dereference (bsc#993454).
CVE-2016-5424 - Fix client programs' handling of special characters in
database and role names (bsc#993453).

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/postgresql/postgresql.hash | 4 ++--
 package/postgresql/postgresql.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index 4dde589..0d54890 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,2 +1,2 @@
-# From https://ftp.postgresql.org/pub/source/v9.5.3/postgresql-9.5.3.tar.bz2.sha256
-sha256 7385c01dc58acba8d7ac4e6ad42782bd7c0b59272862a3a3d5fe378d4503a0b4  postgresql-9.5.3.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v9.5.4/postgresql-9.5.4.tar.bz2.sha256
+sha256 cf5e571164ad66028ecd7dd8819e3765470d45bcd440d258b686be7e69c76ed0  postgresql-9.5.4.tar.bz2
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 8edefb7..7179bbe 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 9.5.3
+POSTGRESQL_VERSION = 9.5.4
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = http://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
-- 
2.7.3
