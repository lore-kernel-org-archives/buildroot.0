From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 Mar 2017 11:48:32 +0100
Subject: [Buildroot] [PATCH] mariadb: security bump to version 10.1.22
Message-ID: <20170315104832.6755-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

CVE-2017-3302 - C client library for MySQL (libmysqlclient.so) has
use-after-free defect which can cause crash of applications using that MySQL
client.

CVE-2017-3313 - Difficult to exploit vulnerability allows low privileged
attacker with logon to the infrastructure where MySQL Server executes to
compromise MySQL Server.  Successful attacks of this vulnerability can
result in unauthorized access to critical data or complete access to all
MySQL Server accessible data.

And a number of important, but non-security related fixes:

MDEV-11842: Fix a 10.1.21 regression with failed INSERT, BEFORE INSERT
triggers, and columns with no default value

MDEV-12075: Fix a 10.1.21 regression in the InnoDB data file extension code

For details, see the release notes:
https://mariadb.com/kb/en/mariadb/mariadb-10122-release-notes/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mariadb/mariadb.hash | 7 ++-----
 package/mariadb/mariadb.mk   | 2 +-
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/package/mariadb/mariadb.hash b/package/mariadb/mariadb.hash
index 3d6520f34..afcf37803 100644
--- a/package/mariadb/mariadb.hash
+++ b/package/mariadb/mariadb.hash
@@ -1,5 +1,2 @@
-# From https://downloads.mariadb.org/mariadb/10.1.21/
-sha1 f9ccaa9881b98eeef68f4dbcf5ab9653c903819f  mariadb-10.1.21.tar.gz
-
-# Locally computed
-sha256 5a816355781ea22a6c65a436d8162f19bd292ec90e2b7d9499c031ae4a659490  mariadb-10.1.21.tar.gz
+# From https://downloads.mariadb.org/mariadb/10.1.22/
+sha256 bcb0572e7ad32cea9740a21e9255f733bdf60a5561ffbda317c22dd12b3966ce  mariadb-10.1.22.tar.gz
diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
index aa4afc5b5..8c7375a3a 100644
--- a/package/mariadb/mariadb.mk
+++ b/package/mariadb/mariadb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MARIADB_VERSION = 10.1.21
+MARIADB_VERSION = 10.1.22
 MARIADB_SITE = https://downloads.mariadb.org/interstitial/mariadb-$(MARIADB_VERSION)/source
 MARIADB_LICENSE = GPLv2 (server), GPLv2 with FLOSS exception (GPL client library), LGPLv2 (LGPL client library)
 MARIADB_LICENSE_FILES = README COPYING COPYING.LESSER
-- 
2.11.0
