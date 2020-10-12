From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 12 Oct 2020 18:19:59 +0200
Subject: [Buildroot] [PATCH v2,2/3] package/daq: bump version to 2.0.7
In-Reply-To: <20201012162000.2750557-1-fontaine.fabrice@gmail.com>
References: <20201012162000.2750557-1-fontaine.fabrice@gmail.com>
Message-ID: <20201012162000.2750557-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Add a comment about autoreconf
- Update indentation in hash file

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Yann E. Morin):
 - Add comment about autoreconf (the suggested DAQ_TOUCH_AUTOSTUFF does
   not work). Moreover, it should be noted that snort3 is still in beta
   stage and a patch is available here:
   https://patchwork.ozlabs.org/project/buildroot/patch/20200420144536.708646-2-fontaine.fabrice at gmail.com/

 package/daq/daq.hash | 6 ++++--
 package/daq/daq.mk   | 3 ++-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/daq/daq.hash b/package/daq/daq.hash
index 6a0cb5ed07..0fa1edecc2 100644
--- a/package/daq/daq.hash
+++ b/package/daq/daq.hash
@@ -1,5 +1,7 @@
+# From https://www.snort.org/downloads/snort/md5s
+md5  ea796f001d1b00302e4e69e337ab2460  daq-2.0.7.tar.gz
 # Locally computed:
-sha256 d41da5f7793e66044e6927dd868c0525e7ee4ec1a3515bf74ef9a30cd9273af0  daq-2.0.6.tar.gz
+sha256  bdc4e5a24d1ea492c39ee213a63c55466a2e8114b6a9abed609927ae13a7705e  daq-2.0.7.tar.gz
 
 # Hash for license files:
-sha256 07f28289c09fd9eb5a6ff7bc710ff40363601b1bbc6f3637d8ed412150e90819  COPYING
+sha256  07f28289c09fd9eb5a6ff7bc710ff40363601b1bbc6f3637d8ed412150e90819  COPYING
diff --git a/package/daq/daq.mk b/package/daq/daq.mk
index 06983c0b6d..8a5394a63c 100644
--- a/package/daq/daq.mk
+++ b/package/daq/daq.mk
@@ -4,13 +4,14 @@
 #
 ################################################################################
 
-DAQ_VERSION = 2.0.6
+DAQ_VERSION = 2.0.7
 DAQ_SITE = https://www.snort.org/downloads/snort
 DAQ_LICENSE = GPL-2.0
 DAQ_LICENSE_FILES = COPYING
 DAQ_INSTALL_STAGING = YES
 DAQ_DEPENDENCIES = host-bison host-flex
 # 0002-parallel-grammar.patch
+# 2.0.7 needs autoreconf due to configure being older than configure.ac
 DAQ_AUTORECONF = YES
 
 # disable ipq module as libipq is deprecated
-- 
2.28.0
