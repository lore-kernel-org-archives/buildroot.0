From: Adam Duskett <aduskett@gmail.com>
Date: Mon, 19 Feb 2018 07:46:49 -0500
Subject: [Buildroot] [PATCH next] waf: bump to 2.0.6
Message-ID: <20180219124649.26007-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add license information and remove trailing slash from site.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/waf/waf.hash | 6 ++++--
 package/waf/waf.mk   | 6 ++++--
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/package/waf/waf.hash b/package/waf/waf.hash
index 9d610b2c1e..f01432ebfb 100644
--- a/package/waf/waf.hash
+++ b/package/waf/waf.hash
@@ -1,3 +1,5 @@
 # Locally computed
-sha1    33d170c738ed8c92dda2945b445272972f558244                          waf-1.9.5
-sha256  101f14e0f47a6410c00b8feda094948516cd3989491c56eb8268907fcd164909  waf-1.9.5
+sha1    41ccc3bea6e7b709cb1e005f6d4082462dbc4538                          waf-2.0.6
+sha256  65f1490fe28518626c060be80e81f82550846b98025dadc78ccfb12c16564609  waf-2.0.6
+# License
+sha256  65f1490fe28518626c060be80e81f82550846b98025dadc78ccfb12c16564609  waf
diff --git a/package/waf/waf.mk b/package/waf/waf.mk
index e7ac891b39..9b621ecc97 100644
--- a/package/waf/waf.mk
+++ b/package/waf/waf.mk
@@ -4,9 +4,11 @@
 #
 ################################################################################
 
-WAF_VERSION = 1.9.5
+WAF_VERSION = 2.0.6
 WAF_SOURCE = waf-$(WAF_VERSION)
-WAF_SITE = https://waf.io/
+WAF_SITE = https://waf.io
+WAF_LICENSE = Thomas Nagy
+WAF_LICENSE_FILES = waf
 
 define HOST_WAF_EXTRACT_CMDS
 	$(INSTALL) -D -m 0755 $(DL_DIR)/waf-$(WAF_VERSION) $(@D)/waf
-- 
2.14.3
