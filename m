From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Sep 2019 22:17:45 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] package/postgresql:
 security bump version to 11.5
Message-ID: <20190902201402.B793A8A44D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b28d5d170134464026e965ee74fbe6229e515a65
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

Release notes: https://www.postgresql.org/about/news/1960/

Switch POSTGRESQL_SITE to https.

Fixes CVE-2019-10208, CVE-2019-10209, CVE-2019-10210 & CVE-2019-10211.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 7ea64484d4dcd5e2e95d903eddf166cdbbcad485)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/postgresql/postgresql.hash | 8 ++++----
 package/postgresql/postgresql.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index d70ed7428d..7a427e629e 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,7 +1,7 @@
-# From https://ftp.postgresql.org/pub/source/v11.4/postgresql-11.4.tar.bz2.md5
-md5 dab5eed8a5f9204bf2f03a209eead4c3  postgresql-11.4.tar.bz2
-# From https://ftp.postgresql.org/pub/source/v11.4/postgresql-11.4.tar.bz2.sha256
-sha256 02802ddffd1590805beddd1e464dd28a46a41a5f1e1df04bab4f46663195cc8b  postgresql-11.4.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v11.5/postgresql-11.5.tar.bz2.md5
+md5 580da94f6d85046ff2a228785ab2cc89  postgresql-11.5.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v11.5/postgresql-11.5.tar.bz2.sha256
+sha256 7fdf23060bfc715144cbf2696cf05b0fa284ad3eb21f0c378591c6bca99ad180  postgresql-11.5.tar.bz2
 
 # License file, Locally calculated
 sha256	c4c86d683970b22b9fab53320ee1b3a30ef4e8223122b4fb6be53ea62ecee8b3  COPYRIGHT
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index ae4b525a6e..6ce8b3b6ce 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 11.4
+POSTGRESQL_VERSION = 11.5
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
-POSTGRESQL_SITE = http://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
+POSTGRESQL_SITE = https://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
 POSTGRESQL_LICENSE_FILES = COPYRIGHT
 POSTGRESQL_INSTALL_STAGING = YES
