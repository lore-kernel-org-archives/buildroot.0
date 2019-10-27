From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 27 Oct 2019 09:35:26 +0100
Subject: [Buildroot] [PATCH 1/1] package/mcelog: bump to version 165
Message-ID: <20191027083526.16176-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Switch site to github
- Use new LICENSE file added in version 160 with
  https://github.com/andikleen/mcelog/commit/f402998fa6943f3c4c4a2903d1ac85bcd92df75f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mcelog/mcelog.hash | 3 ++-
 package/mcelog/mcelog.mk   | 7 +++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mcelog/mcelog.hash b/package/mcelog/mcelog.hash
index 1a9dd602dc..c323d681cc 100644
--- a/package/mcelog/mcelog.hash
+++ b/package/mcelog/mcelog.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256 d8f3dde21b2e0d76740f374385817c11b3fd69b095a186a6dd12c7b0ba0cca8f  mcelog-v153.tar.gz
+sha256 a18fdef9cfe2dfaefa09087c616c376a301dc87b1fa14a37476d97370962c668  mcelog-165.tar.gz
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/mcelog/mcelog.mk b/package/mcelog/mcelog.mk
index dca6a18c26..cedf474ac0 100644
--- a/package/mcelog/mcelog.mk
+++ b/package/mcelog/mcelog.mk
@@ -4,11 +4,10 @@
 #
 ################################################################################
 
-MCELOG_VERSION = v153
-MCELOG_SITE = $(BR2_KERNEL_MIRROR)/scm/utils/cpu/mce/mcelog.git
-MCELOG_SITE_METHOD = git
+MCELOG_VERSION = 165
+MCELOG_SITE = $(call github,andikleen,mcelog,v$(MCELOG_VERSION))
 MCELOG_LICENSE = GPL-2.0
-MCELOG_LICENSE_FILES = README.md
+MCELOG_LICENSE_FILES = LICENSE
 
 define MCELOG_BUILD_CMDS
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
-- 
2.23.0
