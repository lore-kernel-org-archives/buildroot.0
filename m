From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 6 Mar 2018 12:11:43 +0100
Subject: [Buildroot] [git commit branch/2017.02.x] postgresql: security bump
 to 9.6.8
Message-ID: <20180306111204.D9B098225F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=45d13b7833bf3b050b30557989ddf9a265adc364
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Helps mitigate CVE-2018-1058

see: https://www.postgresql.org/about/news/1834/ for more information bugfixes.
Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/postgresql/postgresql.hash | 4 ++--
 package/postgresql/postgresql.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index 092e852d10..1d7133f7e0 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,4 +1,4 @@
-# From https://ftp.postgresql.org/pub/source/v9.6.7/postgresql-9.6.7.tar.bz2.sha256
-sha256 2ebe3df3c1d1eab78023bdc3ffa55a154aa84300416b075ef996598d78a624c6  postgresql-9.6.7.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v9.6.8/postgresql-9.6.8.tar.bz2.sha256
+sha256 eafdb3b912e9ec34bdd28b651d00226a6253ba65036cb9a41cad2d9e82e3eb70  postgresql-9.6.8.tar.bz2
 # License file, Locally calculated
 sha256 24cfc70cf16b3a23242c49ffce39510683bdd48cbedb8a46fe03976ee5f5c21e  COPYRIGHT
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 86f79c05ee..92cfe4ec4f 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 9.6.7
+POSTGRESQL_VERSION = 9.6.8
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = http://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
