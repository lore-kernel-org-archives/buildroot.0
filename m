From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 4 Sep 2017 08:43:29 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] mariadb: security bump
	version to 10.1.26
Message-ID: <20170904205600.C397581EC5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e0b2bd6dff25e79043851e26e7c38899ed4c79d0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Release notes: https://mariadb.com/kb/en/mariadb-10126-release-notes/
Changelog: https://mariadb.com/kb/en/mariadb-10126-changelog/

Fixes the following security vulnerabilities:

CVE-2017-3636 - Vulnerability in the MySQL Server component of Oracle MySQL
(subcomponent: Client programs). Supported versions that are affected are
5.5.56 and earlier and 5.6.36 and earlier. Easily exploitable vulnerability
allows low privileged attacker with logon to the infrastructure where MySQL
Server executes to compromise MySQL Server. Successful attacks of this
vulnerability can result in unauthorized update, insert or delete access to
some of MySQL Server accessible data as well as unauthorized read access to
a subset of MySQL Server accessible data and unauthorized ability to cause
a partial denial of service (partial DOS) of MySQL Server.

CVE-2017-3641 - Vulnerability in the MySQL Server component of Oracle MySQL
(subcomponent: Server: DML). Supported versions that are affected are
5.5.56 and earlier, 5.6.36 and earlier and 5.7.18 and earlier. Easily
exploitable vulnerability allows high privileged attacker with network
access via multiple protocols to compromise MySQL Server. Successful
attacks of this vulnerability can result in unauthorized ability to cause
a hang or frequently repeatable crash (complete DOS) of MySQL Server.

CVE-2017-3653 - Vulnerability in the MySQL Server component of Oracle MySQL
(subcomponent: Server: DDL). Supported versions that are affected are
5.5.56 and earlier, 5.6.36 and earlier and 5.7.18 and earlier. Difficult
to exploit vulnerability allows low privileged attacker with network access
via multiple protocols to compromise MySQL Server. Successful attacks of
this vulnerability can result in unauthorized update, insert or delete
access to some of MySQL Server accessible data.

Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit ff0cf723b7cb0aa621aa81f171814be63b179a4b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mariadb/mariadb.hash | 4 ++--
 package/mariadb/mariadb.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mariadb/mariadb.hash b/package/mariadb/mariadb.hash
index 4ef3551..fd5625c 100644
--- a/package/mariadb/mariadb.hash
+++ b/package/mariadb/mariadb.hash
@@ -1,5 +1,5 @@
-# From https://downloads.mariadb.org/mariadb/10.1.25/
-sha256 7205ecaa6f1bc16335ad88faa5c46be52b3ac628a5e795cb942a3f4335b2a0d6  mariadb-10.1.25.tar.gz
+# From https://downloads.mariadb.org/mariadb/10.1.26/
+sha256 ba88b1cb9967dea2909938a34ba89373b162b0d83e5c98a0f1c94540156bf73d  mariadb-10.1.26.tar.gz
 
 # Hash for license files
 sha256 69ce89a0cadbe35a858398c258be93c388715e84fc0ca04e5a1fd1aa9770dd3a  README
diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
index d2d55b5..86b3a23 100644
--- a/package/mariadb/mariadb.mk
+++ b/package/mariadb/mariadb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MARIADB_VERSION = 10.1.25
+MARIADB_VERSION = 10.1.26
 MARIADB_SITE = https://downloads.mariadb.org/interstitial/mariadb-$(MARIADB_VERSION)/source
 MARIADB_LICENSE = GPLv2 (server), GPLv2 with FLOSS exception (GPL client library), LGPLv2 (LGPL client library)
 # Tarball no longer contains LGPL license text
