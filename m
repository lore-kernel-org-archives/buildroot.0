From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 27 Aug 2020 19:26:44 +0200
Subject: [Buildroot] [PATCH 1/1] package/json-c: security bump to version
 0.15
Message-ID: <20200827172644.140369-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix CVE-2020-12762: json-c through 0.14 has an integer overflow and
out-of-bounds write via a large JSON file, as demonstrated by
printbuf_memappend.

Also update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/json-c/json-c.hash | 4 ++--
 package/json-c/json-c.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/json-c/json-c.hash b/package/json-c/json-c.hash
index 93eaff67c3..a20d370eb0 100644
--- a/package/json-c/json-c.hash
+++ b/package/json-c/json-c.hash
@@ -1,4 +1,4 @@
 # From https://github.com/json-c/json-c/wiki
-sha256 b377de08c9b23ca3b37d9a9828107dff1de5ce208ff4ebb35005a794f30c6870  json-c-0.14.tar.gz
+sha256  b8d80a1ddb718b3ba7492916237bbf86609e9709fb007e7f7d4322f02341a4c6  json-c-0.15.tar.gz
 # Locally calculated
-sha256 74c1e6ca5eba76b54d0ad00d4815c8315c1b3bc45ff99de61d103dc92486284c  COPYING
+sha256  74c1e6ca5eba76b54d0ad00d4815c8315c1b3bc45ff99de61d103dc92486284c  COPYING
diff --git a/package/json-c/json-c.mk b/package/json-c/json-c.mk
index 3e17effdad..5e27c9b23b 100644
--- a/package/json-c/json-c.mk
+++ b/package/json-c/json-c.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JSON_C_VERSION = 0.14
+JSON_C_VERSION = 0.15
 JSON_C_SITE = https://s3.amazonaws.com/json-c_releases/releases
 JSON_C_INSTALL_STAGING = YES
 JSON_C_LICENSE = MIT
-- 
2.28.0
