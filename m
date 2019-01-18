From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 18 Jan 2019 15:56:36 +0100
Subject: [Buildroot] [git commit branch/2018.11.x] package/mariadb: security
 bump version to 10.3.11
Message-ID: <20190118145609.5B2108CA6C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dbce1c346c7e85dbb0884dd5cec973c8707b1661
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.11.x

Remove 0002-cmake-fix-ucontext-dection.path as it is now upstream.

Hash updated for README.md because upstream changed bug report links.

Release notes: https://mariadb.com/kb/en/mariadb-10311-release-notes/
Changelog: https://mariadb.com/kb/en/mariadb-10311-changelog/

Fixes the following security vulnerabilities:

CVE-2018-3282 - Vulnerability in the MySQL Server component of Oracle MySQL
(subcomponent: Server: Storage Engines). Supported versions that are affected
are 5.5.61 and prior, 5.6.41 and prior, 5.7.23 and prior and 8.0.12 and prior.
Easily exploitable vulnerability allows high privileged attacker with network
access via multiple protocols to compromise MySQL Server. Successful attacks
of this vulnerability can result in unauthorized ability to cause a hang or
frequently repeatable crash (complete DOS) of MySQL Server.

CVE-2016-9843 - The crc32_big function in crc32.c in zlib 1.2.8 might allow
context-dependent attackers to have unspecified impact via vectors involving
big-endian CRC calculation.

CVE-2018-3174 - Vulnerability in the MySQL Server component of Oracle MySQL
(subcomponent: Client programs). Supported versions that are affected are
5.5.61 and prior, 5.6.41 and prior, 5.7.23 and prior and 8.0.12 and prior.
Difficult to exploit vulnerability allows high privileged attacker with logon
to the infrastructure where MySQL Server executes to compromise MySQL Server.
While the vulnerability is in MySQL Server, attacks may significantly impact
additional products. Successful attacks of this vulnerability can result in
unauthorized ability to cause a hang or frequently repeatable crash (complete
DOS) of MySQL Server.

CVE-2018-3143 - Vulnerability in the MySQL Server component of Oracle MySQL
(subcomponent: InnoDB). Supported versions that are affected are 5.6.41 and
prior, 5.7.23 and prior and 8.0.12 and prior. Easily exploitable vulnerability
allows low privileged attacker with network access via multiple protocols to
compromise MySQL Server. Successful attacks of this vulnerability can result
in unauthorized ability to cause a hang or frequently repeatable crash
(complete DOS) of MySQL Server.

CVE-2018-3156 - Vulnerability in the MySQL Server component of Oracle MySQL
(subcomponent: InnoDB). Supported versions that are affected are 5.6.41 and
prior, 5.7.23 and prior and 8.0.12 and prior. Easily exploitable vulnerability
allows low privileged attacker with network access via multiple protocols to
compromise MySQL Server. Successful attacks of this vulnerability can result
in unauthorized ability to cause a hang or frequently repeatable crash
(complete DOS) of MySQL Server.

CVE-2018-3251 - Vulnerability in the MySQL Server component of Oracle MySQL
(subcomponent: InnoDB). Supported versions that are affected are 5.6.41 and
prior, 5.7.23 and prior and 8.0.12 and prior. Easily exploitable vulnerability
allows low privileged attacker with network access via multiple protocols to
compromise MySQL Server. Successful attacks of this vulnerability can result
in unauthorized ability to cause a hang or frequently repeatable crash
(complete DOS) of MySQL Server.

CVE-2018-3185 - Vulnerability in the MySQL Server component of Oracle MySQL
(subcomponent: InnoDB). Supported versions that are affected are 5.7.23 and
prior and 8.0.12 and prior. Easily exploitable vulnerability allows high
privileged attacker with network access via multiple protocols to compromise
MySQL Server. Successful attacks of this vulnerability can result in
unauthorized ability to cause a hang or frequently repeatable crash (complete
DOS) of MySQL Server as well as unauthorized update, insert or delete access
to some of MySQL Server accessible data. CVSS 3.0 Base Score 5.5 (Integrity
and Availability impacts).

CVE-2018-3277 - Vulnerability in the MySQL Server component of Oracle MySQL
(subcomponent: InnoDB). Supported versions that are affected are 5.7.23 and
prior and 8.0.12 and prior. Easily exploitable vulnerability allows high
privileged attacker with network access via multiple protocols to compromise
MySQL Server. Successful attacks of this vulnerability can result in
unauthorized ability to cause a hang or frequently repeatable crash (complete
DOS) of MySQL Server.

CVE-2018-3162 - Vulnerability in the MySQL Server component of Oracle MySQL
(subcomponent: InnoDB). Supported versions that are affected are 5.7.23 and
prior and 8.0.12 and prior. Easily exploitable vulnerability allows high
privileged attacker with network access via multiple protocols to compromise
MySQL Server. Successful attacks of this vulnerability can result in
unauthorized ability to cause a hang or frequently repeatable crash (complete
DOS) of MySQL Server.

CVE-2018-3173 - Vulnerability in the MySQL Server component of Oracle MySQL
(subcomponent: InnoDB). Supported versions that are affected are 5.7.23 and
prior and 8.0.12 and prior. Easily exploitable vulnerability allows high
privileged attacker with network access via multiple protocols to compromise
MySQL Server. Successful attacks of this vulnerability can result in
unauthorized ability to cause a hang or frequently repeatable crash (complete
DOS) of MySQL Server.

CVE-2018-3200 - Vulnerability in the MySQL Server component of Oracle MySQL
(subcomponent: InnoDB). Supported versions that are affected are 5.7.23 and
prior and 8.0.12 and prior. Easily exploitable vulnerability allows high
privileged attacker with network access via multiple protocols to compromise
MySQL Server. Successful attacks of this vulnerability can result in
unauthorized ability to cause a hang or frequently repeatable crash (complete
DOS) of MySQL Server.

CVE-2018-3284 - Vulnerability in the MySQL Server component of Oracle MySQL
(subcomponent: InnoDB). Supported versions that are affected are 5.7.23 and
prior and 8.0.12 and prior. Difficult to exploit vulnerability allows high
privileged attacker with network access via multiple protocols to compromise
MySQL Server. Successful attacks of this vulnerability can result in
unauthorized ability to cause a hang or frequently repeatable crash (complete
DOS) of MySQL Server.

Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 44755a82bda38d08f148f7742f655c1ab92bf0fc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0002-cmake-fix-ucontext-detection.patch        | 44 ----------------------
 package/mariadb/mariadb.hash                       | 12 +++---
 package/mariadb/mariadb.mk                         |  2 +-
 3 files changed, 7 insertions(+), 51 deletions(-)

diff --git a/package/mariadb/0002-cmake-fix-ucontext-detection.patch b/package/mariadb/0002-cmake-fix-ucontext-detection.patch
deleted file mode 100644
index fff43e821e..0000000000
--- a/package/mariadb/0002-cmake-fix-ucontext-detection.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 3c8d309616295045745e778000c0185eec4b21d9 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Sun, 7 Oct 2018 14:25:59 +0200
-Subject: [PATCH] cmake: fix ucontext detection
-
-On some archs uclibc does not provide the ucontext structure despite
-providing ucontext.h, for details see
-https://git.buildroot.net/buildroot/commit/?id=f1cbfeea95e6287c7a666aafc182ffa318eff262
-
-This patch improves the detection of ucontext by making sure that
-HAVE_UCONTEXT_H is only set when makecontext() was found.
-
-Patch sent upstream: https://github.com/MariaDB/server/pull/878
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- configure.cmake | 10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/configure.cmake b/configure.cmake
-index d840dd4e565..a5df355ac42 100644
---- a/configure.cmake
-+++ b/configure.cmake
-@@ -986,12 +986,12 @@ CHECK_STRUCT_HAS_MEMBER("struct sockaddr_in6" sin6_len
- 
- SET(CMAKE_EXTRA_INCLUDE_FILES) 
- 
--CHECK_INCLUDE_FILE(ucontext.h HAVE_UCONTEXT_H)
--IF(NOT HAVE_UCONTEXT_H)
--  CHECK_INCLUDE_FILE(sys/ucontext.h HAVE_UCONTEXT_H)
-+CHECK_INCLUDE_FILE(ucontext.h HAVE_FILE_UCONTEXT_H)
-+IF(NOT HAVE_FILE_UCONTEXT_H)
-+  CHECK_INCLUDE_FILE(sys/ucontext.h HAVE_FILE_UCONTEXT_H)
- ENDIF()
--IF(HAVE_UCONTEXT_H)
--  CHECK_FUNCTION_EXISTS(makecontext HAVE_UCONTEXT_H)
-+IF(HAVE_FILE_UCONTEXT_H)
-+  CHECK_FUNCTION_EXISTS(makecontext HAVE_UCONTEXT_H)
- ENDIF()
- 
- CHECK_STRUCT_HAS_MEMBER("struct timespec" tv_sec "time.h" STRUCT_TIMESPEC_HAS_TV_SEC)
--- 
-2.19.0
-
diff --git a/package/mariadb/mariadb.hash b/package/mariadb/mariadb.hash
index 5b01b03dfc..f68eb40224 100644
--- a/package/mariadb/mariadb.hash
+++ b/package/mariadb/mariadb.hash
@@ -1,9 +1,9 @@
-# From https://downloads.mariadb.org/mariadb/10.3.10
-md5 a63e00179d5e09b63bf71860a19a5507  mariadb-10.3.10.tar.gz
-sha1 187b3e3d7bcc6a4b03a2ca79b8d1930a6fcc76b2  mariadb-10.3.10.tar.gz
-sha256 57767c048982811c7ab21d8527f6f36aa897386e8c7235f11b5505a924d68eda  mariadb-10.3.10.tar.gz
-sha512 dee7789dff359a6352ceacb2db6bcb4730940e9458adda4e23894f9bfa0a7ff8c238060bffca58a60b662275e52a31ea1784d51fae114312b003c024e9412b31  mariadb-10.3.10.tar.gz
+# From https://downloads.mariadb.org/mariadb/10.3.11
+md5 e13ab133060886cda814d68ebd1dc27b  mariadb-10.3.11.tar.gz
+sha1 7b75d7ec06642f26ce197e07f5ba16283061cc87  mariadb-10.3.11.tar.gz
+sha256 211655b794c9d5397ba3be6c90737eac02e882f296268299239db47ba328f1b2  mariadb-10.3.11.tar.gz
+sha512 1adc1f9bbabf848726c669a7a0ab01257ba31882758b53fbf3b1316f2295670dba1c3d1f3292d7c1a749c701504588694a55d020839e690595897b0e20435298  mariadb-10.3.11.tar.gz
 
 # Hash for license files
-sha256 5baa5057c525cacc9f7814215582ac150e5bb0b0007aa8f6ebc50a5c1b7a496d  README.md
+sha256 a298aaf95cb7e594d15b29ae6b5a9ee22a2be4344379fd29304df4e0f19f695a  README.md
 sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
index 06d6365fab..e17649209a 100644
--- a/package/mariadb/mariadb.mk
+++ b/package/mariadb/mariadb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MARIADB_VERSION = 10.3.10
+MARIADB_VERSION = 10.3.11
 MARIADB_SITE = https://downloads.mariadb.org/interstitial/mariadb-$(MARIADB_VERSION)/source
 MARIADB_LICENSE = GPL-2.0 (server), GPL-2.0 with FLOSS exception (GPL client library), LGPL-2.0 (LGPL client library)
 # Tarball no longer contains LGPL license text
