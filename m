From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Mar 2019 16:00:04 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/mariadb: security
 bump to version 10.3.13
Message-ID: <20190327145930.BEA30817E4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4716f1a94bf5e004106d4c2d03041fcbd35e15d7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Release notes:
https://mariadb.com/kb/en/library/mariadb-10313-release-notes/

Changelog:
https://mariadb.com/kb/en/mariadb-10313-changelog/

Fixes the following security vulnerabilities:

CVE-2019-2510 - Vulnerability in the MySQL Server component of Oracle MySQL
(subcomponent: InnoDB). Supported versions that are affected are 5.7.24 and
prior and 8.0.13 and prior. Easily exploitable vulnerability allows high
privileged attacker with network access via multiple protocols to compromise
MySQL Server. Successful attacks of this vulnerability can result in
unauthorized ability to cause a hang or frequently repeatable crash
(complete DOS) of MySQL Server.

CVE-2019-2537 - Vulnerability in the MySQL Server component of Oracle MySQL
(subcomponent: Server: DDL). Supported versions that are affected are 5.6.42
and prior, 5.7.24 and prior and 8.0.13 and prior. Easily exploitable
vulnerability allows high privileged attacker with network access via
multiple protocols to compromise MySQL Server. Successful attacks of this
vulnerability can result in unauthorized ability to cause a hang or
frequently repeatable crash (complete DOS) of MySQL Server.

Note that the hash for README.md changed due to Travis CI and Appveyor CI
updates.

Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit f389df2334750194b0a19cb5dff86739f2bf7e2d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mariadb/mariadb.hash | 12 ++++++------
 package/mariadb/mariadb.mk   |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/mariadb/mariadb.hash b/package/mariadb/mariadb.hash
index f68eb40224..db24f7bb9b 100644
--- a/package/mariadb/mariadb.hash
+++ b/package/mariadb/mariadb.hash
@@ -1,9 +1,9 @@
-# From https://downloads.mariadb.org/mariadb/10.3.11
-md5 e13ab133060886cda814d68ebd1dc27b  mariadb-10.3.11.tar.gz
-sha1 7b75d7ec06642f26ce197e07f5ba16283061cc87  mariadb-10.3.11.tar.gz
-sha256 211655b794c9d5397ba3be6c90737eac02e882f296268299239db47ba328f1b2  mariadb-10.3.11.tar.gz
-sha512 1adc1f9bbabf848726c669a7a0ab01257ba31882758b53fbf3b1316f2295670dba1c3d1f3292d7c1a749c701504588694a55d020839e690595897b0e20435298  mariadb-10.3.11.tar.gz
+# From https://downloads.mariadb.org/mariadb/10.3.13
+md5 603ce42e35b9a688f2cca05275acb5cb  mariadb-10.3.13.tar.gz
+sha1 08467885412184e99b835732913d445fd2c4b1b3  mariadb-10.3.13.tar.gz
+sha256 b2aa857ef5b84f85a7ea60a1eac7b34c0ca5151c71a0d44ce2d7fb028d71459a  mariadb-10.3.13.tar.gz
+sha512 3cbd93291aa43b235e5b81d953ea69fb32df54fb518f922f69b5485952f01fae693c77b0efac37f414ed7ff132d3b58f899812bdb7be8a5b344c3640e2c3a0dd  mariadb-10.3.13.tar.gz
 
 # Hash for license files
-sha256 a298aaf95cb7e594d15b29ae6b5a9ee22a2be4344379fd29304df4e0f19f695a  README.md
+sha256 43f4b5b13cecbbdb04a180cbf6c2bd64237819d1a32165b7d475c1b392e6a8d1  README.md
 sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
index e17649209a..356dd29af3 100644
--- a/package/mariadb/mariadb.mk
+++ b/package/mariadb/mariadb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MARIADB_VERSION = 10.3.11
+MARIADB_VERSION = 10.3.13
 MARIADB_SITE = https://downloads.mariadb.org/interstitial/mariadb-$(MARIADB_VERSION)/source
 MARIADB_LICENSE = GPL-2.0 (server), GPL-2.0 with FLOSS exception (GPL client library), LGPL-2.0 (LGPL client library)
 # Tarball no longer contains LGPL license text
