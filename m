From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Nov 2017 22:23:06 +0100
Subject: [Buildroot] [git commit branch/2017.02.x] postgresql: security bump
 to version 9.6.6
Message-ID: <20171126213911.914C180FB8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7c83f9db9bf760f59cb2cf08100c5da2e9331bc1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Fixes the following security issues:

CVE-2017-12172: Start scripts permit database administrator to modify
root-owned files.

CVE-2017-15098: Memory disclosure in JSON functions.

CVE-2017-15099: INSERT ... ON CONFLICT DO UPDATE fails to enforce SELECT
privileges.

See the announcement for more details:
https://www.postgresql.org/about/news/1801/

While we're at it, also add a hash for the license file.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit b97353f2b50add10971e8477ad0b4cede9244578)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/postgresql/postgresql.hash | 6 ++++--
 package/postgresql/postgresql.mk   | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index 62ce9a7..e628389 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,2 +1,4 @@
-# From https://ftp.postgresql.org/pub/source/v9.6.5/postgresql-9.6.5.tar.bz2.sha256
-sha256 06da12a7e3dddeb803962af8309fa06da9d6989f49e22865335f0a14bad0744c  postgresql-9.6.5.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v9.6.6/postgresql-9.6.6.tar.bz2.sha256
+sha256 399cdffcb872f785ba67e25d275463d74521566318cfef8fe219050d063c8154  postgresql-9.6.6.tar.bz2
+# License file, Locally calculated
+sha256 7dc8de32741ad1b03e21710771b55a1b9d460671d47f28a8840f917e38c66676  COPYRIGHT
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 7adb957..50ce212 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 9.6.5
+POSTGRESQL_VERSION = 9.6.6
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = http://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
