From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 14 Apr 2020 10:25:28 -0500
Subject: [Buildroot] [PATCH v3 8/8] package/selinux-python: bump to version
 3.0
In-Reply-To: <20200414152528.20758-1-matthew.weber@rockwellcollins.com>
References: <20200414152528.20758-1-matthew.weber@rockwellcollins.com>
Message-ID: <20200414152528.20758-9-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---
Changes v2 -> v3
 - Matt switched over the versioning to use dates
---
 package/selinux-python/selinux-python.hash | 9 ++++-----
 package/selinux-python/selinux-python.mk   | 8 +++++---
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/package/selinux-python/selinux-python.hash b/package/selinux-python/selinux-python.hash
index 8cbac37016..0b8873d115 100644
--- a/package/selinux-python/selinux-python.hash
+++ b/package/selinux-python/selinux-python.hash
@@ -1,5 +1,4 @@
-# https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256 3650b5393b0d1790cac66db00e34f059aa91c23cfe3c2559676594e295d75fde selinux-python-2.9.tar.gz
-
-# Hash for license file
-sha256 204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994 COPYING
+# Generated locally as upstream releases in artifact
+# files under a overall YYYYMMDD dated selinux release
+sha256 4cc134210d8cca6c410b7b8c91993e10c6d5b077102ed27e6976bb6d9e483f0d selinux-python-20191204.tar.gz
+sha256 204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994 python/COPYING
diff --git a/package/selinux-python/selinux-python.mk b/package/selinux-python/selinux-python.mk
index 978bee7c88..9e1d320046 100644
--- a/package/selinux-python/selinux-python.mk
+++ b/package/selinux-python/selinux-python.mk
@@ -4,10 +4,12 @@
 #
 ################################################################################
 
-SELINUX_PYTHON_VERSION = 2.9
-SELINUX_PYTHON_SITE = https://github.com/SELinuxProject/selinux/releases/download/20190315
+SELINUX_PYTHON_VERSION = $(LIBSELINUX_VERSION)
+SELINUX_PYTHON_SITE = $(LIBSELINUX_SITE)
 SELINUX_PYTHON_LICENSE = GPL-2.0
-SELINUX_PYTHON_LICENSE_FILES = COPYING
+SELINUX_PYTHON_LICENSE_FILES = python/COPYING
+
+SELINUX_PYTHON_SUBDIR = $(@D)/$(SELINUX_PYTHON_NAME)
 
 SELINUX_PYTHON_MAKE_OPTS += \
 	$(TARGET_CONFIGURE_OPTS) \
-- 
2.17.1
