From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 13 Oct 2020 13:23:33 +0200
Subject: [Buildroot] [git commit] package/daq: bump version to 2.0.7
Message-ID: <20201013112035.B1C328F307@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c1f820bd88a5c3c01846eaccc31544eb7d4a0e26
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Add a comment about autoreconf
- Update indentation in hash file

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
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
