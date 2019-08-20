From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Aug 2019 16:00:27 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] package/openjdk and
 package/openjdk-bin: bump to version 12.0.1+12
Message-ID: <20190820135758.C2A86827E8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4c5750db2b873a165dffba22294e8937d164c16c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
[Arnout: rebase after change of version formatting]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 7e99d1de50a9b98fb976e8074dd25740cd6440cc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openjdk-bin/openjdk-bin.hash | 2 +-
 package/openjdk-bin/openjdk-bin.mk   | 4 ++--
 package/openjdk/openjdk.hash         | 2 +-
 package/openjdk/openjdk.mk           | 8 ++++----
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/openjdk-bin/openjdk-bin.hash b/package/openjdk-bin/openjdk-bin.hash
index 63ed5874c4..1fab6e07a8 100644
--- a/package/openjdk-bin/openjdk-bin.hash
+++ b/package/openjdk-bin/openjdk-bin.hash
@@ -1,5 +1,5 @@
 # From https://github.com/AdoptOpenJDK/openjdk12-binaries/releases
-sha256	4739064dc439a05487744cce0ba951cb544ed5e796f6c699646e16c09da5dd6a	OpenJDK12U-jdk_x64_linux_hotspot_12_33.tar.gz
+sha256	dd3fdf3771a05a010029c1cf1aef516928eab55d6f5eb019008875e9ccbc8337	OpenJDK12U-jdk_x64_linux_hotspot_12.0.1_12.tar.gz
 
 # Locally calculated
 sha256	4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726	legal/java.prefs/LICENSE
diff --git a/package/openjdk-bin/openjdk-bin.mk b/package/openjdk-bin/openjdk-bin.mk
index d2e0c2fd3b..383842d280 100644
--- a/package/openjdk-bin/openjdk-bin.mk
+++ b/package/openjdk-bin/openjdk-bin.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-HOST_OPENJDK_BIN_VERSION_MAJOR = 12
-HOST_OPENJDK_BIN_VERSION_MINOR = 33
+HOST_OPENJDK_BIN_VERSION_MAJOR = 12.0.1
+HOST_OPENJDK_BIN_VERSION_MINOR = 12
 HOST_OPENJDK_BIN_VERSION = $(HOST_OPENJDK_BIN_VERSION_MAJOR)_$(HOST_OPENJDK_BIN_VERSION_MINOR)
 HOST_OPENJDK_BIN_SOURCE = OpenJDK12U-jdk_x64_linux_hotspot_$(HOST_OPENJDK_BIN_VERSION).tar.gz
 HOST_OPENJDK_BIN_SITE = https://github.com/AdoptOpenJDK/openjdk12-binaries/releases/download/jdk-$(HOST_OPENJDK_BIN_VERSION_MAJOR)%2B$(HOST_OPENJDK_BIN_VERSION_MINOR)
diff --git a/package/openjdk/openjdk.hash b/package/openjdk/openjdk.hash
index 91d0f1dbce..f4eecf5dcd 100644
--- a/package/openjdk/openjdk.hash
+++ b/package/openjdk/openjdk.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 de278328668bdaf35d50d0319d15d64d195ddd8a0de9c6fde3a6c9ca10135a92  openjdk-jdk-12+33.tar.gz
+sha256 47cfd6d8430d862869c42c5841bbaaa303a811fea8229baa10ac03b58e259af2  openjdk-12.0.1+12.tar.gz
 sha256 4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  LICENSE
diff --git a/package/openjdk/openjdk.mk b/package/openjdk/openjdk.mk
index 91a00870c5..2f3292ef6d 100644
--- a/package/openjdk/openjdk.mk
+++ b/package/openjdk/openjdk.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-OPENJDK_VERSION_MAJOR = 12
-OPENJDK_VERSION_MINOR = 33
-OPENJDK_VERSION = jdk-$(OPENJDK_VERSION_MAJOR)+$(OPENJDK_VERSION_MINOR)
-OPENJDK_SITE = $(call github,AdoptOpenJDK,openjdk-jdk12u,$(OPENJDK_VERSION))
+OPENJDK_VERSION_MAJOR = 12.0.1
+OPENJDK_VERSION_MINOR = 12
+OPENJDK_VERSION = $(OPENJDK_VERSION_MAJOR)+$(OPENJDK_VERSION_MINOR)
+OPENJDK_SITE = $(call github,AdoptOpenJDK,openjdk-jdk12u,jdk-$(OPENJDK_VERSION))
 OPENJDK_LICENSE = GPL-2.0+ with exception
 OPENJDK_LICENSE_FILES = LICENSE
 
