From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 Nov 2018 21:14:47 +0100
Subject: [Buildroot] [git commit branch/2018.08.x] mariadb: security bump to
 version 10.1.37
Message-ID: <20181125201150.0B246882B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4b17d87030f86247acfcd02b4b5607e69e5210b2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.08.x

Fixes the following security vulnerabilities:

CVE-2018-3282: Vulnerability in the MySQL Server component of Oracle MySQL
(subcomponent: Server: Storage Engines).  Supported versions that are
affected are 5.5.61 and prior, 5.6.41 and prior, 5.7.23 and prior and 8.0.12
and prior.  Easily exploitable vulnerability allows high privileged attacker
with network access via multiple protocols to compromise MySQL Server.
Successful attacks of this vulnerability can result in unauthorized ability
to cause a hang or frequently repeatable crash (complete DOS) of MySQL
Server.

CVE-2016-9843: The crc32_big function in crc32.c in zlib 1.2.8 might allow
context-dependent attackers to have unspecified impact via vectors involving
big-endian CRC calculation.

CVE-2018-3174: Vulnerability in the MySQL Server component of Oracle MySQL
(subcomponent: Client programs).  Supported versions that are affected are
5.5.61 and prior, 5.6.41 and prior, 5.7.23 and prior and 8.0.12 and prior.
Difficult to exploit vulnerability allows high privileged attacker with
logon to the infrastructure where MySQL Server executes to compromise MySQL
Server.  While the vulnerability is in MySQL Server, attacks may
significantly impact additional products.  Successful attacks of this
vulnerability can result in unauthorized ability to cause a hang or
frequently repeatable crash (complete DOS) of MySQL Server.

CVE-2018-3143: Vulnerability in the MySQL Server component of Oracle MySQL
(subcomponent: InnoDB).  Supported versions that are affected are 5.6.41 and
prior, 5.7.23 and prior and 8.0.12 and prior.  Easily exploitable
vulnerability allows low privileged attacker with network access via
multiple protocols to compromise MySQL Server.  Successful attacks of this
vulnerability can result in unauthorized ability to cause a hang or
frequently repeatable crash (complete DOS) of MySQL Server.

CVE-2018-3156: Vulnerability in the MySQL Server component of Oracle MySQL
(subcomponent: InnoDB).  Supported versions that are affected are 5.6.41 and
prior, 5.7.23 and prior and 8.0.12 and prior.  Easily exploitable
vulnerability allows low privileged attacker with network access via
multiple protocols to compromise MySQL Server.  Successful attacks of this
vulnerability can result in unauthorized ability to cause a hang or
frequently repeatable crash (complete DOS) of MySQL Server.

CVE-2018-3251: Vulnerability in the MySQL Server component of Oracle MySQL
(subcomponent: InnoDB).  Supported versions that are affected are 5.6.41 and
prior, 5.7.23 and prior and 8.0.12 and prior.  Easily exploitable
vulnerability allows low privileged attacker with network access via
multiple protocols to compromise MySQL Server.  Successful attacks of this
vulnerability can result in unauthorized ability to cause a hang or
frequently repeatable crash (complete DOS) of MySQL Server.

The README has gotten a few extra URLs added, so update the sha256 to match.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mariadb/mariadb.hash | 12 ++++++------
 package/mariadb/mariadb.mk   |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/mariadb/mariadb.hash b/package/mariadb/mariadb.hash
index e4736465e0..7730ae0cb0 100644
--- a/package/mariadb/mariadb.hash
+++ b/package/mariadb/mariadb.hash
@@ -1,9 +1,9 @@
-# From https://downloads.mariadb.org/mariadb/10.1.35/
-md5 935f401314ff08a4177beb70fed6055c  mariadb-10.1.35.tar.gz
-sha1 d322f0da17f4de475832dd534657eba5a936f77b  mariadb-10.1.35.tar.gz
-sha256 9e91d985ed4f662126e3e5791fe91ec8a2f44ec811113c2b6fbc72fa14553c4d  mariadb-10.1.35.tar.gz
-sha512 88e6049f3bbc3aa047e108f91a2c4f335758e80f25bfa2974b5f8c2e13f5758824d7835dece021b515c531e5641b9998e4de92256ad4b47b7f694da99bd471aa  mariadb-10.1.35.tar.gz
+# From https://downloads.mariadb.org/mariadb/10.1.37/
+md5 123b37bec63ddca19260e45f0f2276bb  mariadb-10.1.37.tar.gz
+sha1 35e9c15b5532c2e7c746b1e7452952053d7d5b5a  mariadb-10.1.37.tar.gz
+sha256 8cd516b0a7f7aa36a7c1d6e687dbbad8c0b08c92d5fd60c6e691b19a6cab4d46  mariadb-10.1.37.tar.gz
+sha512 b7c35cd67ad265ce2e3a4db20a2ae2b78745db96dc70a211f027a39b6dbb3dc900991c2ee1021ee6a97d12489c3e2a70252e2adf348a458af38b99c3de5a4f25  mariadb-10.1.37.tar.gz
 
 # Hash for license files
-sha256 69ce89a0cadbe35a858398c258be93c388715e84fc0ca04e5a1fd1aa9770dd3a  README
+sha256 d89f09a82da1666d389916bba8c21278d3ef5ac43c2139587234576a128428d4  README
 sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
index fa0b1485d5..4e1c4addb8 100644
--- a/package/mariadb/mariadb.mk
+++ b/package/mariadb/mariadb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MARIADB_VERSION = 10.1.35
+MARIADB_VERSION = 10.1.37
 MARIADB_SITE = https://downloads.mariadb.org/interstitial/mariadb-$(MARIADB_VERSION)/source
 MARIADB_LICENSE = GPL-2.0 (server), GPL-2.0 with FLOSS exception (GPL client library), LGPL-2.0 (LGPL client library)
 # Tarball no longer contains LGPL license text
