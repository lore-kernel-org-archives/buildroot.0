From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 13 Feb 2020 19:41:48 +0100
Subject: [Buildroot] [PATCH 1/1] package/sqlcipher: security bump to version
 4.3.0
Message-ID: <20200213184148.2090807-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From https://www.zetetic.net/blog/2019/08/14/defcon-sqlite-attacks:

"We strongly recommend that all applications upgrade to SQLCipher 4.2.0
to take advantage of the latest security updates, especially if an
application interacts with non-encrypted databases using SQLCipher."

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/sqlcipher/sqlcipher.hash | 2 +-
 package/sqlcipher/sqlcipher.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sqlcipher/sqlcipher.hash b/package/sqlcipher/sqlcipher.hash
index 7ebfc23f75..c37db7a20a 100644
--- a/package/sqlcipher/sqlcipher.hash
+++ b/package/sqlcipher/sqlcipher.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  2f803017378c7479cb791be59b7bad8392a15acddbcc094e4433581fe421f4ca  sqlcipher-4.0.1.tar.gz
+sha256  fccb37e440ada898902b294d02cde7af9e8706b185d77ed9f6f4d5b18b4c305f  sqlcipher-4.3.0.tar.gz
 sha256  3eee3c7964a9becc94d747bd36703d31fc86eb994680b06a61bfd4f2661eaac8  LICENSE
diff --git a/package/sqlcipher/sqlcipher.mk b/package/sqlcipher/sqlcipher.mk
index d4f7a19973..14290745aa 100644
--- a/package/sqlcipher/sqlcipher.mk
+++ b/package/sqlcipher/sqlcipher.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQLCIPHER_VERSION = 4.0.1
+SQLCIPHER_VERSION = 4.3.0
 SQLCIPHER_SITE = $(call github,sqlcipher,sqlcipher,v$(SQLCIPHER_VERSION))
 SQLCIPHER_LICENSE = BSD-3-Clause
 SQLCIPHER_LICENSE_FILES = LICENSE
-- 
2.24.1
