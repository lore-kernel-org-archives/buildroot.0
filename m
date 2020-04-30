From: Ryan Barnett <ryanbarnett3@gmail.com>
Date: Wed, 29 Apr 2020 21:25:05 -0500
Subject: [Buildroot] [PATCH] package/json-c: bump to version 0.14
Message-ID: <20200430022505.6767-1-ryanbarnett3@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* Switch to cmake infrastructure
* Update hash file to two space format

Results of test-pkg:

  $ ./utils/test-pkg -c json-c.config -p json-c
                             br-arm-full [1/6]: OK
                  br-arm-cortex-a9-glibc [2/6]: OK
                   br-arm-cortex-m4-full [3/6]: OK
                          br-x86-64-musl [4/6]: OK
                      br-arm-full-static [5/6]: OK
                            sourcery-arm [6/6]: OK
  6 builds, 0 skipped, 0 build failed, 0 legal-info failed

Signed-off-by: Ryan Barnett <ryanbarnett3@gmail.com>
---
 package/json-c/json-c.hash |  4 ++--
 package/json-c/json-c.mk   | 14 +++-----------
 2 files changed, 5 insertions(+), 13 deletions(-)

diff --git a/package/json-c/json-c.hash b/package/json-c/json-c.hash
index 0e03007476..28715418e5 100644
--- a/package/json-c/json-c.hash
+++ b/package/json-c/json-c.hash
@@ -1,4 +1,4 @@
 # From https://github.com/json-c/json-c/wiki
-sha256 b87e608d4d3f7bfdd36ef78d56d53c74e66ab278d318b71e6002a369d36f4873  json-c-0.13.1.tar.gz
+sha256  b377de08c9b23ca3b37d9a9828107dff1de5ce208ff4ebb35005a794f30c6870  json-c-0.14.tar.gz
 # Locally calculated
-sha256 74c1e6ca5eba76b54d0ad00d4815c8315c1b3bc45ff99de61d103dc92486284c  COPYING
+sha256  74c1e6ca5eba76b54d0ad00d4815c8315c1b3bc45ff99de61d103dc92486284c  COPYING
diff --git a/package/json-c/json-c.mk b/package/json-c/json-c.mk
index 2788fe563b..3e17effdad 100644
--- a/package/json-c/json-c.mk
+++ b/package/json-c/json-c.mk
@@ -4,19 +4,11 @@
 #
 ################################################################################
 
-JSON_C_VERSION = 0.13.1
+JSON_C_VERSION = 0.14
 JSON_C_SITE = https://s3.amazonaws.com/json-c_releases/releases
 JSON_C_INSTALL_STAGING = YES
 JSON_C_LICENSE = MIT
 JSON_C_LICENSE_FILES = COPYING
 
-# update config.h.in timestamp to avoid autoheader run
-define JSON_C_UPDATE_CONFIG_TIMESTAMP
-	touch $(@D)/config.h.in
-endef
-
-JSON_C_POST_EXTRACT_HOOKS += JSON_C_UPDATE_CONFIG_TIMESTAMP
-HOST_JSON_C_POST_EXTRACT_HOOKS += JSON_C_UPDATE_CONFIG_TIMESTAMP
-
-$(eval $(autotools-package))
-$(eval $(host-autotools-package))
+$(eval $(cmake-package))
+$(eval $(host-cmake-package))
-- 
2.17.1
