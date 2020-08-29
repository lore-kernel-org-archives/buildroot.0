From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 29 Aug 2020 16:00:35 +0200
Subject: [Buildroot] [git commit] package/postgresql: security bump to
 version 12.4
Message-ID: <20200829135418.C2D398146C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=35ebee6510a19f87aa007b9302bff8d29e1add21
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Fix CVE-2020-14349: It was found that PostgreSQL versions before 12.4,
  before 11.9 and before 10.14 did not properly sanitize the search_path
  during logical replication. An authenticated attacker could use this
  flaw in an attack similar to CVE-2018-1058, in order to execute
  arbitrary SQL command in the context of the user used for replication.
- Fix CVE-2020-14350: It was found that some PostgreSQL extensions did
  not use search_path safely in their installation script. An attacker
  with sufficient privileges could use this flaw to trick an
  administrator into executing a specially crafted script, during the
  installation or update of such extension. This affects PostgreSQL
  versions before 12.4, before 11.9, before 10.14, before 9.6.19, and
  before 9.5.23.

https://www.postgresql.org/docs/12/release-12-4.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/postgresql/postgresql.hash | 8 ++++----
 package/postgresql/postgresql.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index ff3a76258e..4e410d187a 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,7 +1,7 @@
-# From https://ftp.postgresql.org/pub/source/v12.3/postgresql-12.3.tar.bz2.md5
-md5  a30c023dd7088e44d73be71af2ef404a  postgresql-12.3.tar.bz2
-# From https://ftp.postgresql.org/pub/source/v12.3/postgresql-12.3.tar.bz2.sha256
-sha256  94ed64a6179048190695c86ec707cc25d016056ce10fc9d229267d9a8f1dcf41  postgresql-12.3.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v12.4/postgresql-12.4.tar.bz2.md5
+md5  80ebbf0e55193b123760e5f8e48c6cff  postgresql-12.4.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v12.4/postgresql-12.4.tar.bz2.sha256
+sha256  bee93fbe2c32f59419cb162bcc0145c58da9a8644ee154a30b9a5ce47de606cc  postgresql-12.4.tar.bz2
 
 # License file, Locally calculated
 sha256  739e5d454d81d31a482469338b7c856f1f5c6b4cdda1551cea6f0f6d18eef62c  COPYRIGHT
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index c0bf199eb4..18c7b2ade4 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 12.3
+POSTGRESQL_VERSION = 12.4
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = https://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
