From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Aug 2019 16:00:59 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] package/openjdk{,
 -bin}: security bump to version 12.0.2_10
Message-ID: <20190820135758.CB639827E8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4079090a9508a720e6ae644667ad1fe33ee15ece
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

Fixes the following security issues:

CVE-2019-7317 CVE-2019-2821 CVE-2019-2769 CVE-2019-2762 CVE-2019-2745
CVE-2019-2816 CVE-2019-2842 CVE-2019-2786 CVE-2019-2818 CVE-2019-2766
CVE-2019-6129

For details. see the advisory:
https://openjdk.java.net/groups/vulnerability/advisories/2019-07-16

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 3d1fe8b0f75084d5c2557eb8cf01c69ebb36f43b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openjdk-bin/openjdk-bin.hash | 2 +-
 package/openjdk-bin/openjdk-bin.mk   | 4 ++--
 package/openjdk/openjdk.hash         | 2 +-
 package/openjdk/openjdk.mk           | 4 ++--
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/openjdk-bin/openjdk-bin.hash b/package/openjdk-bin/openjdk-bin.hash
index 1fab6e07a8..dc0476ca2d 100644
--- a/package/openjdk-bin/openjdk-bin.hash
+++ b/package/openjdk-bin/openjdk-bin.hash
@@ -1,5 +1,5 @@
 # From https://github.com/AdoptOpenJDK/openjdk12-binaries/releases
-sha256	dd3fdf3771a05a010029c1cf1aef516928eab55d6f5eb019008875e9ccbc8337	OpenJDK12U-jdk_x64_linux_hotspot_12.0.1_12.tar.gz
+sha256  1202f536984c28d68681d51207a84b6c76e5998579132d3fe1b8085aa6a5f21e	OpenJDK12U-jdk_x64_linux_hotspot_12.0.2_10.tar.gz
 
 # Locally calculated
 sha256	4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726	legal/java.prefs/LICENSE
diff --git a/package/openjdk-bin/openjdk-bin.mk b/package/openjdk-bin/openjdk-bin.mk
index 383842d280..80b69b7a0e 100644
--- a/package/openjdk-bin/openjdk-bin.mk
+++ b/package/openjdk-bin/openjdk-bin.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-HOST_OPENJDK_BIN_VERSION_MAJOR = 12.0.1
-HOST_OPENJDK_BIN_VERSION_MINOR = 12
+HOST_OPENJDK_BIN_VERSION_MAJOR = 12.0.2
+HOST_OPENJDK_BIN_VERSION_MINOR = 10
 HOST_OPENJDK_BIN_VERSION = $(HOST_OPENJDK_BIN_VERSION_MAJOR)_$(HOST_OPENJDK_BIN_VERSION_MINOR)
 HOST_OPENJDK_BIN_SOURCE = OpenJDK12U-jdk_x64_linux_hotspot_$(HOST_OPENJDK_BIN_VERSION).tar.gz
 HOST_OPENJDK_BIN_SITE = https://github.com/AdoptOpenJDK/openjdk12-binaries/releases/download/jdk-$(HOST_OPENJDK_BIN_VERSION_MAJOR)%2B$(HOST_OPENJDK_BIN_VERSION_MINOR)
diff --git a/package/openjdk/openjdk.hash b/package/openjdk/openjdk.hash
index f4eecf5dcd..00d080aa3f 100644
--- a/package/openjdk/openjdk.hash
+++ b/package/openjdk/openjdk.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 47cfd6d8430d862869c42c5841bbaaa303a811fea8229baa10ac03b58e259af2  openjdk-12.0.1+12.tar.gz
+sha256 5f73d86ed516173965b27754f1bb21374ccb1194a17c2d89d8018280ce5ffa78  openjdk-12.0.2+10.tar.gz
 sha256 4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  LICENSE
diff --git a/package/openjdk/openjdk.mk b/package/openjdk/openjdk.mk
index 2f3292ef6d..ea2555edcc 100644
--- a/package/openjdk/openjdk.mk
+++ b/package/openjdk/openjdk.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-OPENJDK_VERSION_MAJOR = 12.0.1
-OPENJDK_VERSION_MINOR = 12
+OPENJDK_VERSION_MAJOR = 12.0.2
+OPENJDK_VERSION_MINOR = 10
 OPENJDK_VERSION = $(OPENJDK_VERSION_MAJOR)+$(OPENJDK_VERSION_MINOR)
 OPENJDK_SITE = $(call github,AdoptOpenJDK,openjdk-jdk12u,jdk-$(OPENJDK_VERSION))
 OPENJDK_LICENSE = GPL-2.0+ with exception
