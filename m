From: Adam Duskett <aduskett@gmail.com>
Date: Mon, 19 Feb 2018 08:48:38 -0500
Subject: [Buildroot] [PATCH next v2] waf: bump to 2.0.6
Message-ID: <20180219134838.6073-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In addition:
- Download the tar.bz2 package instead of just the file. The tar
  includes waf-light which is needed to parse the license.

- Remove HOST_WAF_EXTRACT_CMDS as the make system can handle extracting
  the tar.bz2 automatically.

- Add license and license_files to waf.mk

- Add sha256sum hash for the license.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
Changes v1 -> v2:
  - Changed License to BSD-3-Clause (Baruch)
  - Use waf-light instead of waf for license file. (Baruch)

 package/waf/waf.hash |  6 ++++--
 package/waf/waf.mk   | 12 +++++-------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/package/waf/waf.hash b/package/waf/waf.hash
index 9d610b2c1e..3e887248d1 100644
--- a/package/waf/waf.hash
+++ b/package/waf/waf.hash
@@ -1,3 +1,5 @@
 # Locally computed
-sha1    33d170c738ed8c92dda2945b445272972f558244                          waf-1.9.5
-sha256  101f14e0f47a6410c00b8feda094948516cd3989491c56eb8268907fcd164909  waf-1.9.5
+sha1    dc5fe90642350c72f4934871f78b360d39419774                          waf-2.0.6.tar.bz2
+sha256  188d4cfc88b9e3555a197baf8a27c5f3ddeb632e2fea446416174410a804d4f3  waf-2.0.6.tar.bz2
+# License
+sha256  92bee884f4c2a302522a8322d38b720331c42da60b120f5bcd15958961b744e9  waf-light
diff --git a/package/waf/waf.mk b/package/waf/waf.mk
index e7ac891b39..039c7c4d4e 100644
--- a/package/waf/waf.mk
+++ b/package/waf/waf.mk
@@ -4,13 +4,11 @@
 #
 ################################################################################
 
-WAF_VERSION = 1.9.5
-WAF_SOURCE = waf-$(WAF_VERSION)
-WAF_SITE = https://waf.io/
-
-define HOST_WAF_EXTRACT_CMDS
-	$(INSTALL) -D -m 0755 $(DL_DIR)/waf-$(WAF_VERSION) $(@D)/waf
-endef
+WAF_VERSION = 2.0.6
+WAF_SOURCE = waf-$(WAF_VERSION).tar.bz2
+WAF_SITE = https://waf.io
+WAF_LICENSE = BSD-3-Clause
+WAF_LICENSE_FILES = waf-light
 
 define HOST_WAF_INSTALL_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/waf $(HOST_DIR)/bin/waf
-- 
2.14.3
