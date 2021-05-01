From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 1 May 2021 14:15:58 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/openjdk{,
 -bin}: security bump to version 11.0.11_9
Message-ID: <20210501115434.750BF8654B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e64c007a27a3e54d50be3356fba72d03958f1c17
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Fixes the following security issues:

CVE-2020-14779, CVE-2020-14781, CVE-2020-14782, CVE-2020-14792,
CVE-2020-14796, CVE-2020-14797, CVE-2020-14798, CVE-2020-14803,
CVE-2021-2161, CVE-2021-2163

For details. see the advisories:
https://openjdk.java.net/groups/vulnerability/advisories/2020-10-20
https://openjdk.java.net/groups/vulnerability/advisories/2021-01-19
https://openjdk.java.net/groups/vulnerability/advisories/2021-04-20

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 5871e278f87387439fd8f424a5be04c76c9e261d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openjdk-bin/openjdk-bin.hash | 2 +-
 package/openjdk-bin/openjdk-bin.mk   | 4 ++--
 package/openjdk/openjdk.hash         | 2 +-
 package/openjdk/openjdk.mk           | 4 ++--
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/openjdk-bin/openjdk-bin.hash b/package/openjdk-bin/openjdk-bin.hash
index 4828048029..a08aa16d47 100644
--- a/package/openjdk-bin/openjdk-bin.hash
+++ b/package/openjdk-bin/openjdk-bin.hash
@@ -2,7 +2,7 @@
 sha256  7d5ee7e06909b8a99c0d029f512f67b092597aa5b0e78c109bd59405bbfa74fe  OpenJDK14U-jdk_x64_linux_hotspot_14.0.2_12.tar.gz
 
 # From https://github.com/AdoptOpenJDK/openjdk11-binaries/releases
-sha256  6e4cead158037cb7747ca47416474d4f408c9126be5b96f9befd532e0a762b47  OpenJDK11U-jdk_x64_linux_hotspot_11.0.8_10.tar.gz
+sha256  e99b98f851541202ab64401594901e583b764e368814320eba442095251e78cb  OpenJDK11U-jdk_x64_linux_hotspot_11.0.11_9.tar.gz
 
 # Locally calculated
 sha256  4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  legal/java.prefs/LICENSE
diff --git a/package/openjdk-bin/openjdk-bin.mk b/package/openjdk-bin/openjdk-bin.mk
index dd5b87fd9e..61e7ecac4c 100644
--- a/package/openjdk-bin/openjdk-bin.mk
+++ b/package/openjdk-bin/openjdk-bin.mk
@@ -11,8 +11,8 @@ HOST_OPENJDK_BIN_VERSION = $(HOST_OPENJDK_BIN_VERSION_MAJOR)_$(HOST_OPENJDK_BIN_
 HOST_OPENJDK_BIN_SOURCE = OpenJDK14U-jdk_x64_linux_hotspot_$(HOST_OPENJDK_BIN_VERSION).tar.gz
 HOST_OPENJDK_BIN_SITE = https://github.com/AdoptOpenJDK/openjdk14-binaries/releases/download/jdk-$(HOST_OPENJDK_BIN_VERSION_MAJOR)%2B$(HOST_OPENJDK_BIN_VERSION_MINOR)
 else
-HOST_OPENJDK_BIN_VERSION_MAJOR = 11.0.8
-HOST_OPENJDK_BIN_VERSION_MINOR = 10
+HOST_OPENJDK_BIN_VERSION_MAJOR = 11.0.11
+HOST_OPENJDK_BIN_VERSION_MINOR = 9
 HOST_OPENJDK_BIN_VERSION = $(HOST_OPENJDK_BIN_VERSION_MAJOR)_$(HOST_OPENJDK_BIN_VERSION_MINOR)
 HOST_OPENJDK_BIN_SOURCE = OpenJDK11U-jdk_x64_linux_hotspot_$(HOST_OPENJDK_BIN_VERSION).tar.gz
 HOST_OPENJDK_BIN_SITE = https://github.com/AdoptOpenJDK/openjdk11-binaries/releases/download/jdk-$(HOST_OPENJDK_BIN_VERSION_MAJOR)%2B$(HOST_OPENJDK_BIN_VERSION_MINOR)
diff --git a/package/openjdk/openjdk.hash b/package/openjdk/openjdk.hash
index 6acfa22435..05a0c12c45 100644
--- a/package/openjdk/openjdk.hash
+++ b/package/openjdk/openjdk.hash
@@ -1,4 +1,4 @@
 # Locally computed
 sha256  dfb3607f1b675458f29a185a40f1dbbf896439cf33b3aa0f3d89df297e604935  jdk-14.0.2+12.tar.gz
-sha256  7fc124b5e20428cd5df42d78b001abc663558b0881e66a5def0892b98265b6e9  jdk-11.0.8+10.tar.gz
+sha256  c8b9d92028f6e46d94bde65ebce3b593fdcc0d1ca1fa00482f38815ed37c92a1  jdk-11.0.11+9.tar.gz
 sha256  4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  LICENSE
diff --git a/package/openjdk/openjdk.mk b/package/openjdk/openjdk.mk
index 80e1fc1aac..6ed5085fdb 100644
--- a/package/openjdk/openjdk.mk
+++ b/package/openjdk/openjdk.mk
@@ -11,8 +11,8 @@ OPENJDK_VERSION = $(OPENJDK_VERSION_MAJOR)+$(OPENJDK_VERSION_MINOR)
 OPENJDK_SOURCE = jdk-$(OPENJDK_VERSION).tar.gz
 OPENJDK_SITE = https://hg.openjdk.java.net/jdk-updates/jdk14u/archive
 else
-OPENJDK_VERSION_MAJOR = 11.0.8
-OPENJDK_VERSION_MINOR = 10
+OPENJDK_VERSION_MAJOR = 11.0.11
+OPENJDK_VERSION_MINOR = 9
 OPENJDK_VERSION = $(OPENJDK_VERSION_MAJOR)+$(OPENJDK_VERSION_MINOR)
 OPENJDK_SOURCE = jdk-$(OPENJDK_VERSION).tar.gz
 OPENJDK_SITE = https://hg.openjdk.java.net/jdk-updates/jdk11u/archive
