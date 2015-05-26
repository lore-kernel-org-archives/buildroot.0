From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 26 May 2015 16:45:57 -0300
Subject: [Buildroot] [PATCH] postgresql: security bump to version 9.4.2
Message-ID: <1432669557-32262-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
CVE-2015-3165 (denial of service)
CVE-2015-3166 (information disclosure)
CVE-2015-3167 (side-channel key exposure)

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/postgresql/postgresql.hash | 4 ++--
 package/postgresql/postgresql.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index ea2be3e..2f8de30 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,2 +1,2 @@
-# From https://ftp.postgresql.org/pub/source/v9.4.1/postgresql-9.4.1.tar.bz2.sha256
-sha256	29ddb77c820095b8f52e5455e9c6c6c20cf979b0834ed1986a8857b84888c3a6  postgresql-9.4.1.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v9.4.2/postgresql-9.4.2.tar.bz2.sha256
+sha256	81fda191c165ba1d25d75cd0166ece5abdcb4a7f5eca01b349371e279ebb4d11  postgresql-9.4.2.tar.bz2
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index eda547c..d4895a0 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 9.4.1
+POSTGRESQL_VERSION = 9.4.2
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = http://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
-- 
2.3.6
