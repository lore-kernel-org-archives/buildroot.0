From: aduskett at gmail.com <aduskett@gmail.com>
Date: Wed, 15 Jul 2020 16:29:48 -0700
Subject: [Buildroot] [PATCH 1/1] package/{openjdk,
 openjdk-bin}: bump to version 11.0.8+10
Message-ID: <20200715232948.1843405-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/openjdk-bin/openjdk-bin.hash                            | 2 +-
 package/openjdk-bin/openjdk-bin.mk                              | 2 +-
 .../{11.0.7+10 => 11.0.8+10}/0001-fix-gcc-10-support.patch      | 0
 package/openjdk/openjdk.hash                                    | 2 +-
 package/openjdk/openjdk.mk                                      | 2 +-
 5 files changed, 4 insertions(+), 4 deletions(-)
 rename package/openjdk/{11.0.7+10 => 11.0.8+10}/0001-fix-gcc-10-support.patch (100%)

diff --git a/package/openjdk-bin/openjdk-bin.hash b/package/openjdk-bin/openjdk-bin.hash
index 065eda0603..ab12323599 100644
--- a/package/openjdk-bin/openjdk-bin.hash
+++ b/package/openjdk-bin/openjdk-bin.hash
@@ -2,7 +2,7 @@
 sha256  9ddf9b35996fbd784a53fff3e0d59920a7d5acf1a82d4c8d70906957ac146cd1  OpenJDK14U-jdk_x64_linux_hotspot_14.0.1_7.tar.gz
 
 # From https://github.com/AdoptOpenJDK/openjdk11-binaries/releases
-sha256  ee60304d782c9d5654bf1a6b3f38c683921c1711045e1db94525a51b7024a2ca  OpenJDK11U-jdk_x64_linux_hotspot_11.0.7_10.tar.gz
+sha256  6e4cead158037cb7747ca47416474d4f408c9126be5b96f9befd532e0a762b47  OpenJDK11U-jdk_x64_linux_hotspot_11.0.8_10.tar.gz
 
 # Locally calculated
 sha256  4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  legal/java.prefs/LICENSE
diff --git a/package/openjdk-bin/openjdk-bin.mk b/package/openjdk-bin/openjdk-bin.mk
index b8110ab968..1c20137d2f 100644
--- a/package/openjdk-bin/openjdk-bin.mk
+++ b/package/openjdk-bin/openjdk-bin.mk
@@ -11,7 +11,7 @@ HOST_OPENJDK_BIN_VERSION = $(HOST_OPENJDK_BIN_VERSION_MAJOR)_$(HOST_OPENJDK_BIN_
 HOST_OPENJDK_BIN_SOURCE = OpenJDK14U-jdk_x64_linux_hotspot_$(HOST_OPENJDK_BIN_VERSION).tar.gz
 HOST_OPENJDK_BIN_SITE = https://github.com/AdoptOpenJDK/openjdk14-binaries/releases/download/jdk-$(HOST_OPENJDK_BIN_VERSION_MAJOR)%2B$(HOST_OPENJDK_BIN_VERSION_MINOR)
 else
-HOST_OPENJDK_BIN_VERSION_MAJOR = 11.0.7
+HOST_OPENJDK_BIN_VERSION_MAJOR = 11.0.8
 HOST_OPENJDK_BIN_VERSION_MINOR = 10
 HOST_OPENJDK_BIN_VERSION = $(HOST_OPENJDK_BIN_VERSION_MAJOR)_$(HOST_OPENJDK_BIN_VERSION_MINOR)
 HOST_OPENJDK_BIN_SOURCE = OpenJDK11U-jdk_x64_linux_hotspot_$(HOST_OPENJDK_BIN_VERSION).tar.gz
diff --git a/package/openjdk/11.0.7+10/0001-fix-gcc-10-support.patch b/package/openjdk/11.0.8+10/0001-fix-gcc-10-support.patch
similarity index 100%
rename from package/openjdk/11.0.7+10/0001-fix-gcc-10-support.patch
rename to package/openjdk/11.0.8+10/0001-fix-gcc-10-support.patch
diff --git a/package/openjdk/openjdk.hash b/package/openjdk/openjdk.hash
index 2279c8b971..9e3f189a1f 100644
--- a/package/openjdk/openjdk.hash
+++ b/package/openjdk/openjdk.hash
@@ -1,4 +1,4 @@
 # Locally computed
 sha256  301203cbda9c40a5fc496b3299806995ac4833b39c6d2e8470fd85a35461afd4  jdk-14.0.1+7.tar.gz
-sha256  d105471d06568e4659c21518d1bf42b8ebab5c70539e9777d570549a98ed2a8a  jdk-11.0.7+10.tar.gz
+sha256  7fc124b5e20428cd5df42d78b001abc663558b0881e66a5def0892b98265b6e9  jdk-11.0.8+10.tar.gz
 sha256  4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  LICENSE
diff --git a/package/openjdk/openjdk.mk b/package/openjdk/openjdk.mk
index 8ce740ebb7..85a433d8d9 100644
--- a/package/openjdk/openjdk.mk
+++ b/package/openjdk/openjdk.mk
@@ -11,7 +11,7 @@ OPENJDK_VERSION = $(OPENJDK_VERSION_MAJOR)+$(OPENJDK_VERSION_MINOR)
 OPENJDK_SOURCE = jdk-$(OPENJDK_VERSION).tar.gz
 OPENJDK_SITE = https://hg.openjdk.java.net/jdk-updates/jdk14u/archive
 else
-OPENJDK_VERSION_MAJOR = 11.0.7
+OPENJDK_VERSION_MAJOR = 11.0.8
 OPENJDK_VERSION_MINOR = 10
 OPENJDK_VERSION = $(OPENJDK_VERSION_MAJOR)+$(OPENJDK_VERSION_MINOR)
 OPENJDK_SOURCE = jdk-$(OPENJDK_VERSION).tar.gz
-- 
2.26.2
