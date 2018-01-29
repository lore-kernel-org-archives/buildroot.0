From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 29 Jan 2018 22:31:41 +0100
Subject: [Buildroot] [git commit branch/2017.02.x] mariadb: security bump
 version to 10.1.30
Message-ID: <20180129213708.F31EF88014@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=96c3b3455c82a8557aac4716b7507bf76c90b849
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Release notes: https://mariadb.com/kb/en/mariadb-10130-release-notes/
Changelog: https://mariadb.com/kb/en/mariadb-10130-changelog/

Fixes the following security vulnerability:

CVE-2017-15365 - Replication in sql/event_data_objects.cc occurs before ACL
checks.

Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit ca1f2d266ddba2f530731e91ebbf792638cee8bb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mariadb/mariadb.hash | 4 ++--
 package/mariadb/mariadb.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mariadb/mariadb.hash b/package/mariadb/mariadb.hash
index fcca9be6e4..f8e1c6ce10 100644
--- a/package/mariadb/mariadb.hash
+++ b/package/mariadb/mariadb.hash
@@ -1,5 +1,5 @@
-# From https://downloads.mariadb.org/mariadb/10.1.29/
-sha256 73bbd5602f52ab5aa4d83f465134871b6c87bda25371d098f6da5a3d98517ed4  mariadb-10.1.29.tar.gz
+# From https://downloads.mariadb.org/mariadb/10.1.30/
+sha256 173a5e5a24819e0a469c3bd09b5c98491676c37c6095882a2ea34c5af0996c88  mariadb-10.1.30.tar.gz
 
 # Hash for license files
 sha256 69ce89a0cadbe35a858398c258be93c388715e84fc0ca04e5a1fd1aa9770dd3a  README
diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
index 97a1b034e0..dc88696e34 100644
--- a/package/mariadb/mariadb.mk
+++ b/package/mariadb/mariadb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MARIADB_VERSION = 10.1.29
+MARIADB_VERSION = 10.1.30
 MARIADB_SITE = https://downloads.mariadb.org/interstitial/mariadb-$(MARIADB_VERSION)/source
 MARIADB_LICENSE = GPLv2 (server), GPLv2 with FLOSS exception (GPL client library), LGPLv2 (LGPL client library)
 # Tarball no longer contains LGPL license text
