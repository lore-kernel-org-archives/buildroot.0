From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 29 Mar 2021 22:49:03 +0200
Subject: [Buildroot] [PATCH 1/1] package/sqlcipher: security bump to version
 4.4.3
Message-ID: <20210329204903.320444-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix CVE-2021-3119: Zetetic SQLCipher 4.x before 4.4.3 has a NULL pointer
dereferencing issue related to sqlcipher_export in crypto.c and
sqlite3StrICmp in sqlite3.c. This may allow an attacker to perform a
remote denial of service attack. For example, an SQL injection can be
used to execute the crafted SQL command sequence, which causes a
segmentation fault.

https://github.com/sqlcipher/sqlcipher/blob/v4.4.3/CHANGELOG.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/sqlcipher/sqlcipher.hash | 2 +-
 package/sqlcipher/sqlcipher.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sqlcipher/sqlcipher.hash b/package/sqlcipher/sqlcipher.hash
index 96a6a74013..ddc78ef7d6 100644
--- a/package/sqlcipher/sqlcipher.hash
+++ b/package/sqlcipher/sqlcipher.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  87458e0e16594b3ba6c7a1f046bc1ba783d002d35e0e7b61bb6b7bb862f362a7  sqlcipher-4.4.2.tar.gz
+sha256  b8df69b998c042ce7f8a99f07cf11f45dfebe51110ef92de95f1728358853133  sqlcipher-4.4.3.tar.gz
 sha256  3eee3c7964a9becc94d747bd36703d31fc86eb994680b06a61bfd4f2661eaac8  LICENSE
diff --git a/package/sqlcipher/sqlcipher.mk b/package/sqlcipher/sqlcipher.mk
index 393d50b201..776e2d0dcf 100644
--- a/package/sqlcipher/sqlcipher.mk
+++ b/package/sqlcipher/sqlcipher.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQLCIPHER_VERSION = 4.4.2
+SQLCIPHER_VERSION = 4.4.3
 SQLCIPHER_SITE = $(call github,sqlcipher,sqlcipher,v$(SQLCIPHER_VERSION))
 SQLCIPHER_LICENSE = BSD-3-Clause
 SQLCIPHER_LICENSE_FILES = LICENSE
-- 
2.30.2
