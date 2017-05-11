From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 May 2017 17:51:37 +0200
Subject: [Buildroot] [git commit] postgresql: bump version to 9.6.3
	(security)
Message-ID: <20170511155143.6AD2082795@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e2bb446ff50c3bd346beca07d5e7f3dc11591a1c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Three security vulnerabilities have been closed by this release:

CVE-2017-7484: selectivity estimators bypass SELECT privilege checks
CVE-2017-7485: libpq ignores PGREQUIRESSL environment variable
CVE-2017-7486: pg_user_mappings view discloses foreign server passwords

More details: https://www.postgresql.org/about/news/1746/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/postgresql/postgresql.hash | 4 ++--
 package/postgresql/postgresql.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index 1524a34..c65edf7 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,2 +1,2 @@
-# From https://ftp.postgresql.org/pub/source/v9.6.2/postgresql-9.6.2.tar.bz2.sha256
-sha256 0187b5184be1c09034e74e44761505e52357248451b0c854dddec6c231fe50c9  postgresql-9.6.2.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v9.6.3/postgresql-9.6.3.tar.bz2.sha256
+sha256 1645b3736901f6d854e695a937389e68ff2066ce0cde9d73919d6ab7c995b9c6  postgresql-9.6.3.tar.bz2
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index e07afc9..62b41cb 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 9.6.2
+POSTGRESQL_VERSION = 9.6.3
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = http://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
