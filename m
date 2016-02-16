From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 16 Feb 2016 13:02:38 -0300
Subject: [Buildroot] [PATCH] postgresql: security bump to version 9.4.6
Message-ID: <1455638558-1805-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
CVE-2016-0766 - privilege escalation issue for users of PL/Java.
CVE-2016-0773 - issue with regular expression (regex) parsing. Prior
code allowed users to pass in expressions which included out-of-range
Unicode characters, triggering a backend crash. This issue is critical
for PostgreSQL systems with untrusted users or which generate regexes
based on user input.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/postgresql/postgresql.hash | 4 ++--
 package/postgresql/postgresql.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index 97bb56d..9015e99 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,2 +1,2 @@
-# From https://ftp.postgresql.org/pub/source/v9.4.5/postgresql-9.4.5.tar.bz2.sha256
-sha256	b87c50c66b6ea42a9712b5f6284794fabad0616e6ae420cf0f10523be6d94a39  postgresql-9.4.5.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v9.4.6/postgresql-9.4.6.tar.bz2.sha256
+sha256	cbce1f4d01a6142c5d8bebe125623c5198ec04f363da7dd3d3b3a4100b4140a6  postgresql-9.4.6.tar.bz2
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index a42fe73..444c1b1 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 9.4.5
+POSTGRESQL_VERSION = 9.4.6
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = http://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
-- 
2.4.10
