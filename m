From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Nov 2017 22:24:06 +0100
Subject: [Buildroot] [git commit branch/2017.08.x] postgresql: security bump
 to version 9.6.5
Message-ID: <20171126213856.738578125D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aa66d51954126b6471ad9e3b34083ebd76233ba3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.08.x

Fixes the following security issues (9.6.4):

CVE-2017-7546: Empty password accepted in some authentication methods
CVE-2017-7547: The "pg_user_mappings" catalog view discloses passwords to users lacking server privileges
CVE-2017-7548: lo_put() function ignores ACLs

For more info, see https://www.postgresql.org/about/news/1772/

[Peter: extend commit message with security fixes info]
Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 95e284bd2732390eb34cb72c798032fd7ac8920c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/postgresql/postgresql.hash | 4 ++--
 package/postgresql/postgresql.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index c65edf7..62ce9a7 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,2 +1,2 @@
-# From https://ftp.postgresql.org/pub/source/v9.6.3/postgresql-9.6.3.tar.bz2.sha256
-sha256 1645b3736901f6d854e695a937389e68ff2066ce0cde9d73919d6ab7c995b9c6  postgresql-9.6.3.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v9.6.5/postgresql-9.6.5.tar.bz2.sha256
+sha256 06da12a7e3dddeb803962af8309fa06da9d6989f49e22865335f0a14bad0744c  postgresql-9.6.5.tar.bz2
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 62b41cb..7adb957 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 9.6.3
+POSTGRESQL_VERSION = 9.6.5
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = http://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
