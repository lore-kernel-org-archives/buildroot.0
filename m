From: aduskett at gmail.com <aduskett@gmail.com>
Date: Tue, 21 Jul 2020 13:49:58 -0700
Subject: [Buildroot] [PATCH 1/1] package/{openjdk,
 openjdk-bin}: bump to version 14.0.2+12
Message-ID: <20200721204958.3089846-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/openjdk-bin/openjdk-bin.hash                          | 2 +-
 package/openjdk-bin/openjdk-bin.mk                            | 4 ++--
 .../{14.0.1+7 => 14.0.2+12}/0001-fix-gcc-10-support.patch     | 0
 package/openjdk/openjdk.hash                                  | 2 +-
 package/openjdk/openjdk.mk                                    | 4 ++--
 5 files changed, 6 insertions(+), 6 deletions(-)
 rename package/openjdk/{14.0.1+7 => 14.0.2+12}/0001-fix-gcc-10-support.patch (100%)

diff --git a/package/openjdk-bin/openjdk-bin.hash b/package/openjdk-bin/openjdk-bin.hash
index ab12323599..4828048029 100644
--- a/package/openjdk-bin/openjdk-bin.hash
+++ b/package/openjdk-bin/openjdk-bin.hash
@@ -1,5 +1,5 @@
 # From https://github.com/AdoptOpenJDK/openjdk14-binaries/releases
-sha256  9ddf9b35996fbd784a53fff3e0d59920a7d5acf1a82d4c8d70906957ac146cd1  OpenJDK14U-jdk_x64_linux_hotspot_14.0.1_7.tar.gz
+sha256  7d5ee7e06909b8a99c0d029f512f67b092597aa5b0e78c109bd59405bbfa74fe  OpenJDK14U-jdk_x64_linux_hotspot_14.0.2_12.tar.gz
 
 # From https://github.com/AdoptOpenJDK/openjdk11-binaries/releases
 sha256  6e4cead158037cb7747ca47416474d4f408c9126be5b96f9befd532e0a762b47  OpenJDK11U-jdk_x64_linux_hotspot_11.0.8_10.tar.gz
diff --git a/package/openjdk-bin/openjdk-bin.mk b/package/openjdk-bin/openjdk-bin.mk
index 1c20137d2f..dd5b87fd9e 100644
--- a/package/openjdk-bin/openjdk-bin.mk
+++ b/package/openjdk-bin/openjdk-bin.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 ifeq ($(BR2_OPENJDK_VERSION_LATEST),y)
-HOST_OPENJDK_BIN_VERSION_MAJOR = 14.0.1
-HOST_OPENJDK_BIN_VERSION_MINOR = 7
+HOST_OPENJDK_BIN_VERSION_MAJOR = 14.0.2
+HOST_OPENJDK_BIN_VERSION_MINOR = 12
 HOST_OPENJDK_BIN_VERSION = $(HOST_OPENJDK_BIN_VERSION_MAJOR)_$(HOST_OPENJDK_BIN_VERSION_MINOR)
 HOST_OPENJDK_BIN_SOURCE = OpenJDK14U-jdk_x64_linux_hotspot_$(HOST_OPENJDK_BIN_VERSION).tar.gz
 HOST_OPENJDK_BIN_SITE = https://github.com/AdoptOpenJDK/openjdk14-binaries/releases/download/jdk-$(HOST_OPENJDK_BIN_VERSION_MAJOR)%2B$(HOST_OPENJDK_BIN_VERSION_MINOR)
diff --git a/package/openjdk/14.0.1+7/0001-fix-gcc-10-support.patch b/package/openjdk/14.0.2+12/0001-fix-gcc-10-support.patch
similarity index 100%
rename from package/openjdk/14.0.1+7/0001-fix-gcc-10-support.patch
rename to package/openjdk/14.0.2+12/0001-fix-gcc-10-support.patch
diff --git a/package/openjdk/openjdk.hash b/package/openjdk/openjdk.hash
index 9e3f189a1f..6acfa22435 100644
--- a/package/openjdk/openjdk.hash
+++ b/package/openjdk/openjdk.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  301203cbda9c40a5fc496b3299806995ac4833b39c6d2e8470fd85a35461afd4  jdk-14.0.1+7.tar.gz
+sha256  dfb3607f1b675458f29a185a40f1dbbf896439cf33b3aa0f3d89df297e604935  jdk-14.0.2+12.tar.gz
 sha256  7fc124b5e20428cd5df42d78b001abc663558b0881e66a5def0892b98265b6e9  jdk-11.0.8+10.tar.gz
 sha256  4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  LICENSE
diff --git a/package/openjdk/openjdk.mk b/package/openjdk/openjdk.mk
index 85a433d8d9..80e1fc1aac 100644
--- a/package/openjdk/openjdk.mk
+++ b/package/openjdk/openjdk.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 ifeq ($(BR2_OPENJDK_VERSION_LATEST),y)
-OPENJDK_VERSION_MAJOR = 14.0.1
-OPENJDK_VERSION_MINOR = 7
+OPENJDK_VERSION_MAJOR = 14.0.2
+OPENJDK_VERSION_MINOR = 12
 OPENJDK_VERSION = $(OPENJDK_VERSION_MAJOR)+$(OPENJDK_VERSION_MINOR)
 OPENJDK_SOURCE = jdk-$(OPENJDK_VERSION).tar.gz
 OPENJDK_SITE = https://hg.openjdk.java.net/jdk-updates/jdk14u/archive
-- 
2.26.2
