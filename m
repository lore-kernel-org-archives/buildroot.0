From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 12 Mar 2020 23:39:36 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/sqlcipher:
 security bump to version 4.3.0
Message-ID: <20200313065149.799AB907C0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5259a50dcb172a3c6aa9de53dd774d8f0c07d60e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

From https://www.zetetic.net/blog/2019/08/14/defcon-sqlite-attacks:

"We strongly recommend that all applications upgrade to SQLCipher 4.2.0
to take advantage of the latest security updates, especially if an
application interacts with non-encrypted databases using SQLCipher."

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit b9440e8def9ab77482b059436749242d14fd5da6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sqlcipher/sqlcipher.hash | 2 +-
 package/sqlcipher/sqlcipher.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sqlcipher/sqlcipher.hash b/package/sqlcipher/sqlcipher.hash
index 9216668536..c37db7a20a 100644
--- a/package/sqlcipher/sqlcipher.hash
+++ b/package/sqlcipher/sqlcipher.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  2f803017378c7479cb791be59b7bad8392a15acddbcc094e4433581fe421f4ca  sqlcipher-v4.0.1.tar.gz
+sha256  fccb37e440ada898902b294d02cde7af9e8706b185d77ed9f6f4d5b18b4c305f  sqlcipher-4.3.0.tar.gz
 sha256  3eee3c7964a9becc94d747bd36703d31fc86eb994680b06a61bfd4f2661eaac8  LICENSE
diff --git a/package/sqlcipher/sqlcipher.mk b/package/sqlcipher/sqlcipher.mk
index a16d94d1dc..14290745aa 100644
--- a/package/sqlcipher/sqlcipher.mk
+++ b/package/sqlcipher/sqlcipher.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SQLCIPHER_VERSION = v4.0.1
-SQLCIPHER_SITE = $(call github,sqlcipher,sqlcipher,$(SQLCIPHER_VERSION))
+SQLCIPHER_VERSION = 4.3.0
+SQLCIPHER_SITE = $(call github,sqlcipher,sqlcipher,v$(SQLCIPHER_VERSION))
 SQLCIPHER_LICENSE = BSD-3-Clause
 SQLCIPHER_LICENSE_FILES = LICENSE
 SQLCIPHER_DEPENDENCIES = host-pkgconf openssl host-tcl
