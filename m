From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Mar 2019 22:22:10 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] package/mariadb: security
 bump to version 10.1.38
Message-ID: <20190327212050.87649819DE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f1553bc0adc404db52837003dc70489148f5a296
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Release notes:
https://mariadb.com/kb/en/library/mariadb-10138-release-notes/

Fixes the following security vulnerabilities:

CVE-2019-2529 - Vulnerability in the MySQL Server component of Oracle MySQL
(subcomponent: Server: Optimizer).  Supported versions that are affected are
5.6.42 and prior, 5.7.24 and prior and 8.0.13 and prior.  Easily exploitable
vulnerability allows low privileged attacker with network access via
multiple protocols to compromise MySQL Server.  Successful attacks of this
vulnerability can result in unauthorized ability to cause a hang or
frequently repeatable crash (complete DOS) of MySQL Server.

CVE-2019-2537 - Vulnerability in the MySQL Server component of Oracle MySQL
(subcomponent: Server: DDL).  Supported versions that are affected are
5.6.42 and prior, 5.7.24 and prior and 8.0.13 and prior.  Easily exploitable
vulnerability allows high privileged attacker with network access via
multiple protocols to compromise MySQL Server.  Successful attacks of this
vulnerability can result in unauthorized ability to cause a hang or
frequently repeatable crash (complete DOS) of MySQL Server.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mariadb/mariadb.hash | 10 +++++-----
 package/mariadb/mariadb.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/mariadb/mariadb.hash b/package/mariadb/mariadb.hash
index 7730ae0cb0..461f40bfc5 100644
--- a/package/mariadb/mariadb.hash
+++ b/package/mariadb/mariadb.hash
@@ -1,8 +1,8 @@
-# From https://downloads.mariadb.org/mariadb/10.1.37/
-md5 123b37bec63ddca19260e45f0f2276bb  mariadb-10.1.37.tar.gz
-sha1 35e9c15b5532c2e7c746b1e7452952053d7d5b5a  mariadb-10.1.37.tar.gz
-sha256 8cd516b0a7f7aa36a7c1d6e687dbbad8c0b08c92d5fd60c6e691b19a6cab4d46  mariadb-10.1.37.tar.gz
-sha512 b7c35cd67ad265ce2e3a4db20a2ae2b78745db96dc70a211f027a39b6dbb3dc900991c2ee1021ee6a97d12489c3e2a70252e2adf348a458af38b99c3de5a4f25  mariadb-10.1.37.tar.gz
+# From https://downloads.mariadb.org/mariadb/10.1.38/
+md5 edf8bee4854a464f214e6c24c5d28625  mariadb-10.1.38.tar.gz
+sha1 1474b3a9ad402c848cff6ef6a79856dc405806b1  mariadb-10.1.38.tar.gz
+sha256 caf1f4fc237d143343995b6625375aef911dfc366433645d400727e7063f077f  mariadb-10.1.38.tar.gz
+sha512 184582f3a902a989ba3d9c4d21288c014c8b469adbbb4cbabc621c5006022cef29baed8c1140ed4476b124da83b76dfa414295ed0c3374be826e75aca953a77b  mariadb-10.1.38.tar.gz
 
 # Hash for license files
 sha256 d89f09a82da1666d389916bba8c21278d3ef5ac43c2139587234576a128428d4  README
diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
index 4e1c4addb8..89d66a2acb 100644
--- a/package/mariadb/mariadb.mk
+++ b/package/mariadb/mariadb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MARIADB_VERSION = 10.1.37
+MARIADB_VERSION = 10.1.38
 MARIADB_SITE = https://downloads.mariadb.org/interstitial/mariadb-$(MARIADB_VERSION)/source
 MARIADB_LICENSE = GPL-2.0 (server), GPL-2.0 with FLOSS exception (GPL client library), LGPL-2.0 (LGPL client library)
 # Tarball no longer contains LGPL license text
