From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 3 Feb 2020 14:12:30 +0100
Subject: [Buildroot] [git commit] package/{openjdk,
 openjdk-bin}: bump version to 13.0.2+8
Message-ID: <20200203130131.ACCA38866B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e1215b7bc0fc28603b363bec2aeaf60eaafd1f6c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Other changes:
  - Add --with-stdc++lib=dynamic to openjdk.mk or else openjdk will fail to
    build because it defaults to looking for a static libstdc++ library.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/openjdk-bin/openjdk-bin.hash | 2 +-
 package/openjdk-bin/openjdk-bin.mk   | 8 ++++----
 package/openjdk/openjdk.hash         | 2 +-
 package/openjdk/openjdk.mk           | 7 ++++---
 4 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/package/openjdk-bin/openjdk-bin.hash b/package/openjdk-bin/openjdk-bin.hash
index dc0476ca2d..3e4df59236 100644
--- a/package/openjdk-bin/openjdk-bin.hash
+++ b/package/openjdk-bin/openjdk-bin.hash
@@ -1,5 +1,5 @@
 # From https://github.com/AdoptOpenJDK/openjdk12-binaries/releases
-sha256  1202f536984c28d68681d51207a84b6c76e5998579132d3fe1b8085aa6a5f21e	OpenJDK12U-jdk_x64_linux_hotspot_12.0.2_10.tar.gz
+sha256  9ccc063569f19899fd08e41466f8c4cd4e05058abdb5178fa374cb365dcf5998	OpenJDK13U-jdk_x64_linux_hotspot_13.0.2_8.tar.gz
 
 # Locally calculated
 sha256	4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726	legal/java.prefs/LICENSE
diff --git a/package/openjdk-bin/openjdk-bin.mk b/package/openjdk-bin/openjdk-bin.mk
index 80b69b7a0e..e2525a5c3d 100644
--- a/package/openjdk-bin/openjdk-bin.mk
+++ b/package/openjdk-bin/openjdk-bin.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-HOST_OPENJDK_BIN_VERSION_MAJOR = 12.0.2
-HOST_OPENJDK_BIN_VERSION_MINOR = 10
+HOST_OPENJDK_BIN_VERSION_MAJOR = 13.0.2
+HOST_OPENJDK_BIN_VERSION_MINOR = 8
 HOST_OPENJDK_BIN_VERSION = $(HOST_OPENJDK_BIN_VERSION_MAJOR)_$(HOST_OPENJDK_BIN_VERSION_MINOR)
-HOST_OPENJDK_BIN_SOURCE = OpenJDK12U-jdk_x64_linux_hotspot_$(HOST_OPENJDK_BIN_VERSION).tar.gz
-HOST_OPENJDK_BIN_SITE = https://github.com/AdoptOpenJDK/openjdk12-binaries/releases/download/jdk-$(HOST_OPENJDK_BIN_VERSION_MAJOR)%2B$(HOST_OPENJDK_BIN_VERSION_MINOR)
+HOST_OPENJDK_BIN_SOURCE = OpenJDK13U-jdk_x64_linux_hotspot_$(HOST_OPENJDK_BIN_VERSION).tar.gz
+HOST_OPENJDK_BIN_SITE = https://github.com/AdoptOpenJDK/openjdk13-binaries/releases/download/jdk-$(HOST_OPENJDK_BIN_VERSION_MAJOR)%2B$(HOST_OPENJDK_BIN_VERSION_MINOR)
 HOST_OPENJDK_BIN_LICENSE = GPL-2.0+ with exception
 HOST_OPENJDK_BIN_LICENSE_FILES = legal/java.prefs/LICENSE legal/java.prefs/ASSEMBLY_EXCEPTION
 
diff --git a/package/openjdk/openjdk.hash b/package/openjdk/openjdk.hash
index beed7a34a2..ca282591ef 100644
--- a/package/openjdk/openjdk.hash
+++ b/package/openjdk/openjdk.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 b2bcad35656b00928683416f3480ad00363b00993eb711c3e1886e4fe77eefeb  jdk-12.0.2+10.tar.gz
+sha256 d38fb17795782dffe84e98f21f1d6293b0a45ea8f1e9c81e99cd71acac03a4e0  jdk-13.0.2+8.tar.gz
 sha256 4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  LICENSE
diff --git a/package/openjdk/openjdk.mk b/package/openjdk/openjdk.mk
index e95ece2eba..030a205228 100644
--- a/package/openjdk/openjdk.mk
+++ b/package/openjdk/openjdk.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-OPENJDK_VERSION_MAJOR = 12.0.2
-OPENJDK_VERSION_MINOR = 10
+OPENJDK_VERSION_MAJOR = 13.0.2
+OPENJDK_VERSION_MINOR = 8
 OPENJDK_VERSION = $(OPENJDK_VERSION_MAJOR)+$(OPENJDK_VERSION_MINOR)
 OPENJDK_SOURCE = jdk-$(OPENJDK_VERSION).tar.gz
-OPENJDK_SITE = https://hg.openjdk.java.net/jdk-updates/jdk12u/archive
+OPENJDK_SITE = https://hg.openjdk.java.net/jdk-updates/jdk13u/archive
 OPENJDK_LICENSE = GPL-2.0+ with exception
 OPENJDK_LICENSE_FILES = LICENSE
 
@@ -70,6 +70,7 @@ OPENJDK_CONF_OPTS = \
 	--enable-unlimited-crypto \
 	--openjdk-target=$(GNU_TARGET_NAME) \
 	--with-boot-jdk=$(HOST_DIR) \
+	--with-stdc++lib=dynamic \
 	--with-debug-level=release \
 	--with-devkit=$(HOST_DIR) \
 	--with-extra-cflags="$(TARGET_CFLAGS)" \
