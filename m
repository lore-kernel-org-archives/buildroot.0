From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 14 Apr 2020 10:25:27 -0500
Subject: [Buildroot] [PATCH v3 7/8] package/checkpolicy: bump version to 3.0
In-Reply-To: <20200414152528.20758-1-matthew.weber@rockwellcollins.com>
References: <20200414152528.20758-1-matthew.weber@rockwellcollins.com>
Message-ID: <20200414152528.20758-8-matthew.weber@rockwellcollins.com>
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
 package/checkpolicy/checkpolicy.hash | 9 ++++-----
 package/checkpolicy/checkpolicy.mk   | 8 +++++---
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/package/checkpolicy/checkpolicy.hash b/package/checkpolicy/checkpolicy.hash
index 9e77b9b027..1d20ad3eca 100644
--- a/package/checkpolicy/checkpolicy.hash
+++ b/package/checkpolicy/checkpolicy.hash
@@ -1,5 +1,4 @@
-# https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256 a946c32b284532447857e4c48830f8816867c61220c8c08bdd32e6f691335f8e  checkpolicy-2.9.tar.gz
-
-# Hash for license file
-sha256 204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  COPYING
+# Generated locally as upstream releases in artifact
+# files under a overall YYYYMMDD dated selinux release
+sha256 4cc134210d8cca6c410b7b8c91993e10c6d5b077102ed27e6976bb6d9e483f0d checkpolicy-20191204.tar.gz
+sha256 204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994 checkpolicy/COPYING
diff --git a/package/checkpolicy/checkpolicy.mk b/package/checkpolicy/checkpolicy.mk
index 8f1ec72549..a4b31718f7 100644
--- a/package/checkpolicy/checkpolicy.mk
+++ b/package/checkpolicy/checkpolicy.mk
@@ -4,13 +4,15 @@
 #
 ################################################################################
 
-CHECKPOLICY_VERSION = 2.9
-CHECKPOLICY_SITE = https://github.com/SELinuxProject/selinux/releases/download/20190315
+CHECKPOLICY_VERSION = $(LIBSELINUX_VERSION)
+CHECKPOLICY_SITE = $(LIBSELINUX_SITE)
 CHECKPOLICY_LICENSE = GPL-2.0
-CHECKPOLICY_LICENSE_FILES = COPYING
+CHECKPOLICY_LICENSE_FILES = $(CHECKPOLICY_NAME)/COPYING
 
 CHECKPOLICY_DEPENDENCIES = libselinux flex host-flex host-bison
 
+CHECKPOLICY_SUBDIR = $(@D)/$(CHECKPOLICY_NAME)
+
 CHECKPOLICY_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS) \
 	LEX="$(HOST_DIR)/bin/flex" \
 	YACC="$(HOST_DIR)/bin/bison -y"
-- 
2.17.1
