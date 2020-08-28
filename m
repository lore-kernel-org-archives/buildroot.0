From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Aug 2020 19:42:39 +0200
Subject: [Buildroot] [git commit branch/2020.05.x] package/json-c: bump
 version to 0.14
Message-ID: <20200828174515.048EA818F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f8d49a154daef720bec8ffed2d0222a92ad4348f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

Notes:

- json-c now uses cmake instead of autoconf
- This version also brings support to the much welcomed feature for
  parsing uint64_t types

Signed-off-by: Christopher Pelloux <git@chp.io>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 7b4581cca8676b44dc278d391575fdc22c2ecc1f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/json-c/json-c.hash |  2 +-
 package/json-c/json-c.mk   | 14 +++-----------
 2 files changed, 4 insertions(+), 12 deletions(-)

diff --git a/package/json-c/json-c.hash b/package/json-c/json-c.hash
index 0e03007476..93eaff67c3 100644
--- a/package/json-c/json-c.hash
+++ b/package/json-c/json-c.hash
@@ -1,4 +1,4 @@
 # From https://github.com/json-c/json-c/wiki
-sha256 b87e608d4d3f7bfdd36ef78d56d53c74e66ab278d318b71e6002a369d36f4873  json-c-0.13.1.tar.gz
+sha256 b377de08c9b23ca3b37d9a9828107dff1de5ce208ff4ebb35005a794f30c6870  json-c-0.14.tar.gz
 # Locally calculated
 sha256 74c1e6ca5eba76b54d0ad00d4815c8315c1b3bc45ff99de61d103dc92486284c  COPYING
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
