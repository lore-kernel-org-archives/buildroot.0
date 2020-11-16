From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Nov 2020 22:23:03 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/postgresql:
 security bump to version 12.5
Message-ID: <20201116211335.9D0C886696@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=25a0727fa176a11d6bbc3f5bd51b7ab560deff48
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Fix the following CVEs:
- CVE-2020-25695: Multiple features escape "security restricted
  operation" sandbox
- CVE-2020-25694: Reconnection can downgrade connection security
  settings
- CVE-2020-25696: psql's \gset allows overwriting specially treated
  variables

https://www.postgresql.org/about/news/postgresql-131-125-1110-1015-9620-and-9524-released-2111

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 8e68f00b91126191b642401d13e2be973ce91e8e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/postgresql/postgresql.hash | 8 ++++----
 package/postgresql/postgresql.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index 4e410d187a..64fa220714 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,7 +1,7 @@
-# From https://ftp.postgresql.org/pub/source/v12.4/postgresql-12.4.tar.bz2.md5
-md5  80ebbf0e55193b123760e5f8e48c6cff  postgresql-12.4.tar.bz2
-# From https://ftp.postgresql.org/pub/source/v12.4/postgresql-12.4.tar.bz2.sha256
-sha256  bee93fbe2c32f59419cb162bcc0145c58da9a8644ee154a30b9a5ce47de606cc  postgresql-12.4.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v12.5/postgresql-12.5.tar.bz2.md5
+md5  f19e48090bbd59ea81826b5fd99e7e97  postgresql-12.5.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v12.5/postgresql-12.5.tar.bz2.sha256
+sha256  bd0d25341d9578b5473c9506300022de26370879581f5fddd243a886ce79ff95  postgresql-12.5.tar.bz2
 
 # License file, Locally calculated
 sha256  739e5d454d81d31a482469338b7c856f1f5c6b4cdda1551cea6f0f6d18eef62c  COPYRIGHT
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 3630b5a385..4c5f200bdf 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 12.4
+POSTGRESQL_VERSION = 12.5
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = https://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
