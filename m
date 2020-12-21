From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 21 Dec 2020 14:40:49 +0100
Subject: [Buildroot] [git commit branch/2020.08.x] package/sqlcipher:
 security bump to version 4.4.2
Message-ID: <20201221132717.F2989881A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=22cf9bf4868e94c3f8702e6de0e26d878acf0b31
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

Fix CVE-2020-27207: Zetetic SQLCipher 4.x before 4.4.1 has a
use-after-free, related to sqlcipher_codec_pragma and sqlite3Strlen30 in
sqlite3.c. A remote denial of service attack can be performed. For
example, a SQL injection can be used to execute the crafted SQL command
sequence. After that, some unexpected RAM data is read.

https://www.zetetic.net/blog/2020/11/25/sqlcipher-442-release

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit f38893f8dd7c9fb13b14cf4fe471eb62d345c5f0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sqlcipher/sqlcipher.hash | 2 +-
 package/sqlcipher/sqlcipher.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sqlcipher/sqlcipher.hash b/package/sqlcipher/sqlcipher.hash
index c37db7a20a..96a6a74013 100644
--- a/package/sqlcipher/sqlcipher.hash
+++ b/package/sqlcipher/sqlcipher.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  fccb37e440ada898902b294d02cde7af9e8706b185d77ed9f6f4d5b18b4c305f  sqlcipher-4.3.0.tar.gz
+sha256  87458e0e16594b3ba6c7a1f046bc1ba783d002d35e0e7b61bb6b7bb862f362a7  sqlcipher-4.4.2.tar.gz
 sha256  3eee3c7964a9becc94d747bd36703d31fc86eb994680b06a61bfd4f2661eaac8  LICENSE
diff --git a/package/sqlcipher/sqlcipher.mk b/package/sqlcipher/sqlcipher.mk
index 14290745aa..5a9a77c1ee 100644
--- a/package/sqlcipher/sqlcipher.mk
+++ b/package/sqlcipher/sqlcipher.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQLCIPHER_VERSION = 4.3.0
+SQLCIPHER_VERSION = 4.4.2
 SQLCIPHER_SITE = $(call github,sqlcipher,sqlcipher,v$(SQLCIPHER_VERSION))
 SQLCIPHER_LICENSE = BSD-3-Clause
 SQLCIPHER_LICENSE_FILES = LICENSE
