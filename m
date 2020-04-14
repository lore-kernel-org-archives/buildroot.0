From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 14 Apr 2020 10:25:26 -0500
Subject: [Buildroot] [PATCH v3 6/8] package/semodule-utils: bump version to
 3.0
In-Reply-To: <20200414152528.20758-1-matthew.weber@rockwellcollins.com>
References: <20200414152528.20758-1-matthew.weber@rockwellcollins.com>
Message-ID: <20200414152528.20758-7-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <aduskett@gmail.com>

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---
Changes v2 -> v3
 - Matt switched over the versioning to use dates
---
 package/semodule-utils/semodule-utils.hash | 9 ++++-----
 package/semodule-utils/semodule-utils.mk   | 8 +++++---
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/package/semodule-utils/semodule-utils.hash b/package/semodule-utils/semodule-utils.hash
index 386b442618..5f34178a8c 100644
--- a/package/semodule-utils/semodule-utils.hash
+++ b/package/semodule-utils/semodule-utils.hash
@@ -1,5 +1,4 @@
-# https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256 8083679ee634570f6e9a18632f2c2862b9134fa308b689b2e1952a369ae5d907 semodule-utils-2.9.tar.gz
-
-# Hash for license file
-sha256 204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994 COPYING
+# Generated locally as upstream releases in artifact
+# files under a overall YYYYMMDD dated selinux release
+sha256 4cc134210d8cca6c410b7b8c91993e10c6d5b077102ed27e6976bb6d9e483f0d semodule-utils-20191204.tar.gz
+sha256 204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994 semodule-utils/COPYING
diff --git a/package/semodule-utils/semodule-utils.mk b/package/semodule-utils/semodule-utils.mk
index 7102dbc5e0..c7d26a2857 100644
--- a/package/semodule-utils/semodule-utils.mk
+++ b/package/semodule-utils/semodule-utils.mk
@@ -4,12 +4,14 @@
 #
 ################################################################################
 
-SEMODULE_UTILS_VERSION = 2.9
-SEMODULE_UTILS_SITE = https://github.com/SELinuxProject/selinux/releases/download/20190315
+SEMODULE_UTILS_VERSION = $(LIBSELINUX_VERSION)
+SEMODULE_UTILS_SITE = $(LIBSELINUX_SITE)
 SEMODULE_UTILS_LICENSE = GPL-2.0
-SEMODULE_UTILS_LICENSE_FILES = COPYING
+SEMODULE_UTILS_LICENSE_FILES = $(SEMODULE_UTILS_NAME)/COPYING
 SEMODULE_UTILS_DEPENDENCIES = libsepol
 
+SEMODULE_UTILS_SUBDIR = $(@D)/$(SEMODULE_UTILS_NAME)
+
 SEMODULE_UTILS_MAKE_OPTS += \
 	$(TARGET_CONFIGURE_OPTS) \
 	LIBSEPOLA=$(STAGING_DIR)/usr/lib/libsepol.a
-- 
2.17.1
