From: Ryan Coe <bluemrp9@gmail.com>
Date: Mon, 19 Feb 2018 06:23:39 -0800
Subject: [Buildroot] [PATCH 1/1] mariadb: security bump version to 10.1.31
Message-ID: <20180219142339.2372-1-bluemrp9@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes: https://mariadb.com/kb/en/mariadb-10131-release-notes/
Changelog: https://mariadb.com/kb/en/mariadb-10131-changelog/

Fixes the following security vulnerabilities:

CVE-2018-2562 - Vulnerability in the MySQL Server component of Oracle MySQL
(subcomponent: Server : Partition). Supported versions that are affected are
5.5.58 and prior, 5.6.38 and prior and 5.7.19 and prior. Easily exploitable
vulnerability allows low privileged attacker with network access via multiple
protocols to compromise MySQL Server. Successful attacks of this vulnerability
can result in unauthorized ability to cause a hang or frequently repeatable
crash (complete DOS) of MySQL Server as well as unauthorized update, insert or
delete access to some of MySQL Server accessible data.

CVE-2018-2622 - Vulnerability in the MySQL Server component of Oracle MySQL
(subcomponent: Server: DDL). Supported versions that are affected are 5.5.58
and prior, 5.6.38 and prior and 5.7.20 and prior. Easily exploitable
vulnerability allows low privileged attacker with network access via multiple
protocols to compromise MySQL Server. Successful attacks of this vulnerability
can result in unauthorized ability to cause a hang or frequently repeatable
crash (complete DOS) of MySQL Server.

CVE-2018-2640 - Vulnerability in the MySQL Server component of Oracle MySQL
(subcomponent: Server: Optimizer). Supported versions that are affected are
5.5.58 and prior, 5.6.38 and prior and 5.7.20 and prior. Easily exploitable
vulnerability allows low privileged attacker with network access via multiple
protocols to compromise MySQL Server. Successful attacks of this vulnerability
can result in unauthorized ability to cause a hang or frequently repeatable
crash (complete DOS) of MySQL Server.

CVE-2018-2665 - Vulnerability in the MySQL Server component of Oracle MySQL
(subcomponent: Server: Optimizer). Supported versions that are affected are
5.5.58 and prior, 5.6.38 and prior and 5.7.20 and prior. Easily exploitable
vulnerability allows low privileged attacker with network access via multiple
protocols to compromise MySQL Server. Successful attacks of this vulnerability
can result in unauthorized ability to cause a hang or frequently repeatable
crash (complete DOS) of MySQL Server.

CVE-2018-2668 - Vulnerability in the MySQL Server component of Oracle MySQL
(subcomponent: Server: Optimizer). Supported versions that are affected are
5.5.58 and prior, 5.6.38 and prior and 5.7.20 and prior. Easily exploitable
vulnerability allows low privileged attacker with network access via multiple
protocols to compromise MySQL Server. Successful attacks of this vulnerability
can result in unauthorized ability to cause a hang or frequently repeatable
crash (complete DOS) of MySQL Server.

CVE-2018-2612 - Vulnerability in the MySQL Server component of Oracle MySQL
(subcomponent: InnoDB). Supported versions that are affected are 5.6.38 and
prior and 5.7.20 and prior. Easily exploitable vulnerability allows high
privileged attacker with network access via multiple protocols to compromise
MySQL Server. Successful attacks of this vulnerability can result in
unauthorized creation, deletion or modification access to critical data or all
MySQL Server accessible data and unauthorized ability to cause a hang or
frequently repeatable crash (complete DOS) of MySQL Server.

Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
---
 package/mariadb/mariadb.hash | 4 ++--
 package/mariadb/mariadb.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mariadb/mariadb.hash b/package/mariadb/mariadb.hash
index f8e1c6ce10..cc1e353ab7 100644
--- a/package/mariadb/mariadb.hash
+++ b/package/mariadb/mariadb.hash
@@ -1,5 +1,5 @@
-# From https://downloads.mariadb.org/mariadb/10.1.30/
-sha256 173a5e5a24819e0a469c3bd09b5c98491676c37c6095882a2ea34c5af0996c88  mariadb-10.1.30.tar.gz
+# From https://downloads.mariadb.org/mariadb/10.1.31/
+sha256 ab7641c2fe4e5289da6141766a9c3350e013def56fafd6f1377080bc8048b2e6  mariadb-10.1.31.tar.gz
 
 # Hash for license files
 sha256 69ce89a0cadbe35a858398c258be93c388715e84fc0ca04e5a1fd1aa9770dd3a  README
diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
index b406692b47..54eafc1702 100644
--- a/package/mariadb/mariadb.mk
+++ b/package/mariadb/mariadb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MARIADB_VERSION = 10.1.30
+MARIADB_VERSION = 10.1.31
 MARIADB_SITE = https://downloads.mariadb.org/interstitial/mariadb-$(MARIADB_VERSION)/source
 MARIADB_LICENSE = GPL-2.0 (server), GPL-2.0 with FLOSS exception (GPL client library), LGPL-2.0 (LGPL client library)
 # Tarball no longer contains LGPL license text
-- 
2.16.1
