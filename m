From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Jul 2020 15:20:07 +0200
Subject: [Buildroot] [git commit] package/bridge-utils: bump to version 1.7
Message-ID: <20200714132047.4314386130@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=026b97381ec5fbd93cad0f552246d8044c96b1a6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Update site to get latest release
- Add a deprecated note in Config.in:
  https://git.kernel.org/pub/scm/linux/kernel/git/shemminger/bridge-utils.git/commit/?id=ab8a2cc330253321be7bc69dea88bfaa3d48415e
- Drop patch, not needed since:
  https://git.kernel.org/pub/scm/linux/kernel/git/shemminger/bridge-utils.git/commit/?id=7b421143d1427e17380ff5bf93ef8fc718428c83
- Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/bridge-utils/0001-build-system.patch | 11 -----------
 package/bridge-utils/Config.in               |  4 ++++
 package/bridge-utils/bridge-utils.hash       |  6 ++----
 package/bridge-utils/bridge-utils.mk         |  6 +++---
 4 files changed, 9 insertions(+), 18 deletions(-)

diff --git a/package/bridge-utils/0001-build-system.patch b/package/bridge-utils/0001-build-system.patch
deleted file mode 100644
index f44737750b..0000000000
--- a/package/bridge-utils/0001-build-system.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- bridge-utils-0.9.6/libbridge/Makefile.in.dist	2004-03-01 20:55:52.000000000 -0600
-+++ bridge-utils-0.9.6/libbridge/Makefile.in	2004-03-01 20:56:23.000000000 -0600
-@@ -5,7 +5,7 @@
- RANLIB=@RANLIB@
- 
- CC=@CC@
--CFLAGS = -Wall -g $(KERNEL_HEADERS)
-+CFLAGS = -Wall -g @CFLAGS@ $(KERNEL_HEADERS)
- 
- prefix=@prefix@
- exec_prefix=@exec_prefix@
diff --git a/package/bridge-utils/Config.in b/package/bridge-utils/Config.in
index bc614b0758..de5883f063 100644
--- a/package/bridge-utils/Config.in
+++ b/package/bridge-utils/Config.in
@@ -4,4 +4,8 @@ config BR2_PACKAGE_BRIDGE_UTILS
 	  Manage ethernet bridging; a way to connect networks together
 	  to form a larger network.
 
+	  This utility is DEPRECATED. No new features will ever be
+	  added. Instead use the bridge command from the iproute2
+	  package which supports more features.
+
 	  https://git.kernel.org/cgit/linux/kernel/git/shemminger/bridge-utils.git/
diff --git a/package/bridge-utils/bridge-utils.hash b/package/bridge-utils/bridge-utils.hash
index 5658116f88..ccf71704b8 100644
--- a/package/bridge-utils/bridge-utils.hash
+++ b/package/bridge-utils/bridge-utils.hash
@@ -1,5 +1,3 @@
-# From https://www.kernel.org/pub/linux/utils/net/bridge-utils/sha256sums.asc
-sha256 cc67efb5d5fb8928a6569b3fade2b4042ec17da04678dab127d96b46489e26c8 bridge-utils-1.6.tar.xz
-
 # locally computed
-sha256 995a31f60a9ddb4c609214cc7d17ca94cc3cbc7f37e1e64dba81e7f8ea9d4f91  COPYING
+sha256  4b9b12f31d147320dea931f1041b8a69d84741ddb92cf35ea1f896b67da98b7c  bridge-utils-1.7.tar.gz
+sha256  995a31f60a9ddb4c609214cc7d17ca94cc3cbc7f37e1e64dba81e7f8ea9d4f91  COPYING
diff --git a/package/bridge-utils/bridge-utils.mk b/package/bridge-utils/bridge-utils.mk
index 2519227471..9d63b3ef30 100644
--- a/package/bridge-utils/bridge-utils.mk
+++ b/package/bridge-utils/bridge-utils.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-BRIDGE_UTILS_VERSION = 1.6
-BRIDGE_UTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/net/bridge-utils
-BRIDGE_UTILS_SOURCE = bridge-utils-1.6.tar.xz
+BRIDGE_UTILS_VERSION = 1.7
+BRIDGE_UTILS_SITE = \
+	https://git.kernel.org/pub/scm/linux/kernel/git/shemminger/bridge-utils.git/snapshot
 BRIDGE_UTILS_AUTORECONF = YES
 BRIDGE_UTILS_LICENSE = GPL-2.0+
 BRIDGE_UTILS_LICENSE_FILES = COPYING
