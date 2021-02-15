From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 Feb 2021 15:00:42 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] package/postgresql:
 security bump to version 12.6
Message-ID: <20210215133919.98F218379F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9863d41ab3c532704a21bab080345aef2a320015
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

Fixes the following security issue:

- CVE-2021-3393: Partition constraint violation errors leak values of denied columns

A user having an UPDATE privilege on a partitioned table but lacking the
SELECT privilege on some column may be able to acquire denied-column values
from an error message.  This is similar to CVE-2014-8161, but the conditions
to exploit are more rare.

For more details, see the announcement:
https://www.postgresql.org/about/news/postgresql-132-126-1111-1016-9621-and-9525-released-2165/

Update the COPYRIGHT hash dur to a copyright year bump:
https://git.postgresql.org/gitweb/?p=postgresql.git;a=commitdiff;h=c09f6882d6f78bde26fcc1e1a3da11c274de596a

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/postgresql/postgresql.hash | 10 +++++-----
 package/postgresql/postgresql.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index 64fa220714..ccc1ac60e1 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,7 +1,7 @@
-# From https://ftp.postgresql.org/pub/source/v12.5/postgresql-12.5.tar.bz2.md5
-md5  f19e48090bbd59ea81826b5fd99e7e97  postgresql-12.5.tar.bz2
-# From https://ftp.postgresql.org/pub/source/v12.5/postgresql-12.5.tar.bz2.sha256
-sha256  bd0d25341d9578b5473c9506300022de26370879581f5fddd243a886ce79ff95  postgresql-12.5.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v12.6/postgresql-12.6.tar.bz2.md5
+md5  8a9cfd8956429d69a97114d3883a4b8e  postgresql-12.6.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v12.6/postgresql-12.6.tar.bz2.sha256
+sha256  df7dd98d5ccaf1f693c7e1d0d084e9fed7017ee248bba5be0167c42ad2d70a09  postgresql-12.6.tar.bz2
 
 # License file, Locally calculated
-sha256  739e5d454d81d31a482469338b7c856f1f5c6b4cdda1551cea6f0f6d18eef62c  COPYRIGHT
+sha256  31ccadc0a70e8e0e8a35c5833567b64388dfe34987d962e1911554e271294105  COPYRIGHT
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 85b767de72..a4a73bbae6 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 12.5
+POSTGRESQL_VERSION = 12.6
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = https://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
