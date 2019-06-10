From: Ryan Coe <bluemrp9@gmail.com>
Date: Mon, 10 Jun 2019 06:47:49 -0700
Subject: [Buildroot] [PATCH 1/1] package/mariadb: security bump to version
 10.3.15
Message-ID: <20190610134749.4356-1-bluemrp9@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes:
https://mariadb.com/kb/en/library/mariadb-10315-release-notes/

Changelog:
https://mariadb.com/kb/en/mariadb-10315-changelog/

Fixes the following security vulnerabilities:

CVE-2019-2614 - Vulnerability in the MySQL Server component of Oracle MySQL
(subcomponent: Server: Replication). Supported versions that are affected
are 5.6.43 and prior, 5.7.25 and prior and 8.0.15 and prior. Difficult to
exploit vulnerability allows high privileged attacker with network access
via multiple protocols to compromise MySQL Server. Successful attacks of
this vulnerability can result in unauthorized ability to cause a hang or
frequently repeatable crash (complete DOS) of MySQL Server.

CVE-2019-2627 - Vulnerability in the MySQL Server component of Oracle MySQL
(subcomponent: Server: Security: Privileges). Supported versions that are
affected are 5.6.43 and prior, 5.7.25 and prior and 8.0.15 and prior.
Easily exploitable vulnerability allows high privileged attacker with
network access via multiple protocols to compromise MySQL Server.
Successful attacks of this vulnerability can result in unauthorized ability
to cause a hang or frequently repeatable crash (complete DOS) of MySQL
Server.

CVE-2019-2628 - Vulnerability in the MySQL Server component of Oracle MySQL
(subcomponent: InnoDB). Supported versions that are affected are 5.7.25 and
prior and 8.0.15 and prior. Easily exploitable vulnerability allows high
privileged attacker with network access via multiple protocols to
compromise MySQL Server. Successful attacks of this vulnerability can
result in unauthorized ability to cause a hang or frequently repeatable
crash (complete DOS) of MySQL Server.

Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
---
 package/mariadb/mariadb.hash | 10 +++++-----
 package/mariadb/mariadb.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/mariadb/mariadb.hash b/package/mariadb/mariadb.hash
index db24f7bb9b..857005695d 100644
--- a/package/mariadb/mariadb.hash
+++ b/package/mariadb/mariadb.hash
@@ -1,8 +1,8 @@
-# From https://downloads.mariadb.org/mariadb/10.3.13
-md5 603ce42e35b9a688f2cca05275acb5cb  mariadb-10.3.13.tar.gz
-sha1 08467885412184e99b835732913d445fd2c4b1b3  mariadb-10.3.13.tar.gz
-sha256 b2aa857ef5b84f85a7ea60a1eac7b34c0ca5151c71a0d44ce2d7fb028d71459a  mariadb-10.3.13.tar.gz
-sha512 3cbd93291aa43b235e5b81d953ea69fb32df54fb518f922f69b5485952f01fae693c77b0efac37f414ed7ff132d3b58f899812bdb7be8a5b344c3640e2c3a0dd  mariadb-10.3.13.tar.gz
+# From https://downloads.mariadb.org/mariadb/10.3.15
+md5 08edd8b5060a181e6dd3c6aac23218cd  mariadb-10.3.15.tar.gz
+sha1 134f6a1ee6bf3048580eca945a51cb3c9bda7cbe  mariadb-10.3.15.tar.gz
+sha256 27f391a54d544f93850d4edfb3ef1b4cf24f8e27e61e51727b0e7d31bb4d6968  mariadb-10.3.15.tar.gz
+sha512 35332ac32cba27fef1b4ddd2209236853f4309756fd121fbdbd2b6be0651e817cedc80e276b89ccfa4bc76760811434fab45a4d380d0ebd500c7d9bd7377fe93  mariadb-10.3.15.tar.gz
 
 # Hash for license files
 sha256 43f4b5b13cecbbdb04a180cbf6c2bd64237819d1a32165b7d475c1b392e6a8d1  README.md
diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
index 356dd29af3..cfb08eb664 100644
--- a/package/mariadb/mariadb.mk
+++ b/package/mariadb/mariadb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MARIADB_VERSION = 10.3.13
+MARIADB_VERSION = 10.3.15
 MARIADB_SITE = https://downloads.mariadb.org/interstitial/mariadb-$(MARIADB_VERSION)/source
 MARIADB_LICENSE = GPL-2.0 (server), GPL-2.0 with FLOSS exception (GPL client library), LGPL-2.0 (LGPL client library)
 # Tarball no longer contains LGPL license text
-- 
2.17.1
