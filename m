From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 Apr 2021 12:16:29 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/mariadb: security
 bump to version 10.3.28
Message-ID: <20210403095643.914DA81963@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8e81ca5db99755a4392871ce1e1c24442f894950
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Fix CVE-2021-27928: A remote code execution issue was discovered in
MariaDB 10.2 before 10.2.37, 10.3 before 10.3.28, 10.4 before 10.4.18,
and 10.5 before 10.5.9; Percona Server through 2021-03-03; and the wsrep
patch through 2021-03-03 for MySQL. An untrusted search path leads to
eval injection, in which a database SUPER user can execute OS commands
after modifying wsrep_provider and wsrep_notify_cmd. NOTE: this does not
affect an Oracle product.

https://mariadb.com/kb/en/mariadb-10328-release-notes/
https://mariadb.com/kb/en/mariadb-10328-changelog/

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit f06339f3fcd309c70cfd4d0b3510ad3a3916e0df)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mariadb/mariadb.hash | 6 +++---
 package/mariadb/mariadb.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/mariadb/mariadb.hash b/package/mariadb/mariadb.hash
index a210dd9dad..26faf529c2 100644
--- a/package/mariadb/mariadb.hash
+++ b/package/mariadb/mariadb.hash
@@ -1,6 +1,6 @@
-# From https://downloads.mariadb.org/mariadb/10.3.27
-sha256  0dadc1650ab2ff40caab58210e93b106ae1e3d1a82e5b0fd92c795b8b43e4619  mariadb-10.3.27.tar.gz
-sha512  1ebfdfa3ef6e13e92615ac2fb6995362ca60fe78f57ff3cf9e384517f95eaf4c701e60fe0977b1eee73889cdfe3367720da9a9bae3dd1a09a4558114ba593369  mariadb-10.3.27.tar.gz
+# From https://downloads.mariadb.org/mariadb/10.3.28
+sha256  e8c912cae2e5800d0da364cc23437907ed4be767f2cbdf198cf3afc03db6a6a3  mariadb-10.3.28.tar.gz
+sha512  f6941bcc818f9b3640e4b5fdbdd3a32b45c62c04087e583f1f0e1c0258b09a21c7639abd1c902e183c057838308ad5eedc00ffee76d44a02043e8e349015fb20  mariadb-10.3.28.tar.gz
 
 # Hash for license files
 sha256  a4665c1189fe31e0bbc27e9b55439df7dad6e99805407fe58d78da7aabe678f8  README.md
diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
index 83965d0437..cd514ec632 100644
--- a/package/mariadb/mariadb.mk
+++ b/package/mariadb/mariadb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MARIADB_VERSION = 10.3.27
+MARIADB_VERSION = 10.3.28
 MARIADB_SITE = https://downloads.mariadb.org/interstitial/mariadb-$(MARIADB_VERSION)/source
 MARIADB_LICENSE = GPL-2.0 (server), GPL-2.0 with FLOSS exception (GPL client library), LGPL-2.0 (LGPL client library)
 # Tarball no longer contains LGPL license text
