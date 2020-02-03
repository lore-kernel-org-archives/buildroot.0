From: Adam Duskett <aduskett@gmail.com>
Date: Mon,  3 Feb 2020 05:29:48 -0800
Subject: [Buildroot] [PATCH 2/5] package/refpolicy: bump version to
 2.20190609
In-Reply-To: <20200203132951.1331252-1-aduskett@gmail.com>
References: <20200203132951.1331252-1-aduskett@gmail.com>
Message-ID: <20200203132951.1331252-2-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Other changes:
  - Depend on host-python3, as python2 support was removed.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/refpolicy/refpolicy.hash |  2 +-
 package/refpolicy/refpolicy.mk   | 13 ++++---------
 2 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/package/refpolicy/refpolicy.hash b/package/refpolicy/refpolicy.hash
index 856d8cb8a2..0c77b626cc 100644
--- a/package/refpolicy/refpolicy.hash
+++ b/package/refpolicy/refpolicy.hash
@@ -1,5 +1,5 @@
 # From https://github.com/SELinuxProject/refpolicy/releases
-sha256 ed620dc91c4e09eee6271b373f7c61a364a82ea57bd2dc86ca1f7075304e2843  refpolicy-2.20190201.tar.bz2
+sha256 67bd1213e9d014ada15512028bb7f35ef6610c2d209cc5117b8577474aa6147f  refpolicy-2.20190609.tar.bz2
 
 # Locally computed
 sha256 204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994 COPYING
diff --git a/package/refpolicy/refpolicy.mk b/package/refpolicy/refpolicy.mk
index 66bddd1aee..d13be18f73 100644
--- a/package/refpolicy/refpolicy.mk
+++ b/package/refpolicy/refpolicy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-REFPOLICY_VERSION = 2.20190201
+REFPOLICY_VERSION = 2.20190609
 REFPOLICY_SOURCE = refpolicy-$(REFPOLICY_VERSION).tar.bz2
-REFPOLICY_SITE = https://github.com/SELinuxProject/refpolicy/releases/download/RELEASE_2_20190201
+REFPOLICY_SITE = https://github.com/SELinuxProject/refpolicy/releases/download/RELEASE_2_20190609
 REFPOLICY_LICENSE = GPL-2.0
 REFPOLICY_LICENSE_FILES = COPYING
 REFPOLICY_INSTALL_STAGING = YES
@@ -14,18 +14,13 @@ REFPOLICY_DEPENDENCIES = \
 	host-m4 \
 	host-checkpolicy \
 	host-policycoreutils \
+	host-python3 \
 	host-setools \
 	host-gawk
 
-ifeq ($(BR2_PACKAGE_PYTHON3),y)
-REFPOLICY_DEPENDENCIES += host-python3
-else
-REFPOLICY_DEPENDENCIES += host-python
-endif
-
 # Cannot use multiple threads to build the reference policy
 REFPOLICY_MAKE = \
-	PYTHON=$(HOST_DIR)/usr/bin/python \
+	PYTHON=$(HOST_DIR)/usr/bin/python3 \
 	TEST_TOOLCHAIN=$(HOST_DIR) \
 	$(TARGET_MAKE_ENV) \
 	$(MAKE1)
-- 
2.24.1
