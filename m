From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 15 Aug 2019 23:29:49 +0200
Subject: [Buildroot] [git commit] package/batman-adv: bump to version 2019.3
Message-ID: <20190815212931.95D0981699@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5020cf0ae0298afb6e6f02c347e7bd476fc424ce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Add license files and their hash
- Fix build with latest kernel

This bump should also close
https://bugs.buildroot.org/show_bug.cgi?id=10861

Fixes:
 - No autobuilder failures

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/batman-adv/batman-adv.hash | 10 +++++++---
 package/batman-adv/batman-adv.mk   |  4 +++-
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/package/batman-adv/batman-adv.hash b/package/batman-adv/batman-adv.hash
index 0599b919be..dabbec8120 100644
--- a/package/batman-adv/batman-adv.hash
+++ b/package/batman-adv/batman-adv.hash
@@ -1,3 +1,7 @@
-# From https://downloads.open-mesh.org/batman/stable/sources/batman-adv/batman-adv-2017.0.1.tar.gz.{md5,sha1}
-md5  ce14f7f1bbc037691bbbc611e16f0360         batman-adv-2017.0.1.tar.gz
-sha1 593cecc015b876caa5b21fbb4d0f6186742a1abb batman-adv-2017.0.1.tar.gz
+# From https://downloads.open-mesh.org/batman/stable/sources/batman-adv/batman-adv-2019.3.tar.gz.{md5,sha1}
+md5  39345688ddf12a542853b2318325f07b         batman-adv-2019.3.tar.gz
+sha1 202539c0cbf4604f6c8e9d427b338d4e807bd220 batman-adv-2019.3.tar.gz
+
+# Hash for license files
+sha256 cecbf53d1148e13256ac29f8b900655b7fc8dc12d59939a95bc2323ea1747025 LICENSES/preferred/GPL-2.0
+sha256 323c587d0ccf10e376f8bf9a7f31fb4ca6078105194b42e0b1e0ee2bc9bde71f LICENSES/preferred/MIT
diff --git a/package/batman-adv/batman-adv.mk b/package/batman-adv/batman-adv.mk
index 2cebe13562..3f48e62051 100644
--- a/package/batman-adv/batman-adv.mk
+++ b/package/batman-adv/batman-adv.mk
@@ -4,13 +4,15 @@
 #
 ################################################################################
 
-BATMAN_ADV_VERSION = 2017.0.1
+BATMAN_ADV_VERSION = 2019.3
 BATMAN_ADV_SITE = https://downloads.open-mesh.org/batman/stable/sources/batman-adv
 BATMAN_ADV_LICENSE = GPL-2.0, MIT (batman_adv.h)
+BATMAN_ADV_LICENSE_FILES = LICENSES/preferred/GPL-2.0 LICENSES/preferred/MIT
 
 # Bridge Loop Avoidance, Distributed Arp Table are always enabled
 BATMAN_ADV_CFLAGS = \
 	-I$(@D)/compat-include/ \
+	-I$(@D)/include/ \
 	-include $(@D)/compat.h \
 	-DBATADV_SOURCE_VERSION=\"\\\"$(BATMAN_ADV_VERSION)\\\"\"
 BATMAN_ADV_MODULE_MAKE_OPTS = \
