From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 29 Mar 2019 18:10:08 +0100
Subject: [Buildroot] [PATCH v2,1/1] package/scons: bump to version 3.0.5
Message-ID: <20190329171008.22433-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Add hash for license file
- scons now supports python2 and python3 so remove host-python2
  dependency

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Thomas Petazzoni):
 - drop python2 dependency

 package/scons/scons.hash | 3 ++-
 package/scons/scons.mk   | 6 ++----
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/scons/scons.hash b/package/scons/scons.hash
index b3cdea0d70..ed31301562 100644
--- a/package/scons/scons.hash
+++ b/package/scons/scons.hash
@@ -1,2 +1,3 @@
 # Locally computed:
-sha256  0b25218ae7b46a967db42f2a53721645b3d42874a65f9552ad16ce26d30f51f2  scons-2.5.1.tar.gz
+sha256  df676f23dc6d4bfa384fc389d95dcd21ab907e6349d4c848958ba4befb73c73e  scons-3.0.5.tar.gz
+sha256  c4248451b6a4cd09870de4fb82a857feb9f98174167b07500c19ed0263fd4db7  LICENSE.txt
diff --git a/package/scons/scons.mk b/package/scons/scons.mk
index 14be589e2b..f146fde904 100644
--- a/package/scons/scons.mk
+++ b/package/scons/scons.mk
@@ -4,18 +4,16 @@
 #
 ################################################################################
 
-SCONS_VERSION = 2.5.1
+SCONS_VERSION = 3.0.5
 SCONS_SITE = http://downloads.sourceforge.net/project/scons/scons/$(SCONS_VERSION)
 SCONS_LICENSE = MIT
 SCONS_LICENSE_FILES = LICENSE.txt
 SCONS_SETUP_TYPE = distutils
 
-HOST_SCONS_NEEDS_HOST_PYTHON = python2
-
 HOST_SCONS_INSTALL_OPTS = \
 	--install-lib=$(HOST_DIR)/lib/scons-$(SCONS_VERSION)
 
 $(eval $(host-python-package))
 
 # variables used by other packages
-SCONS = $(HOST_DIR)/bin/python2 $(HOST_DIR)/bin/scons $(if $(QUIET),-s)
+SCONS = $(HOST_DIR)/bin/python $(HOST_DIR)/bin/scons $(if $(QUIET),-s)
-- 
2.20.1
