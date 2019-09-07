From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 7 Sep 2019 23:19:35 +0200
Subject: [Buildroot] [git commit] package/json-for-modern-cpp: fixup the 'v'
 prefix in the version
Message-ID: <20190907211721.ECA348D3F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=20c7a4e50bfa794b57947e654c2557299e1dda3d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In order for the json-for-modern-cpp version to match what is given by
release-monitoring.org, the 'v' prefix should be encoded in
JSON_FOR_MODERN_CPP_SITE and not JSON_FOR_MODERN_CPP_VERSION.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/json-for-modern-cpp/json-for-modern-cpp.hash | 2 +-
 package/json-for-modern-cpp/json-for-modern-cpp.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/json-for-modern-cpp/json-for-modern-cpp.hash b/package/json-for-modern-cpp/json-for-modern-cpp.hash
index 2097d2902c..039edc8e92 100644
--- a/package/json-for-modern-cpp/json-for-modern-cpp.hash
+++ b/package/json-for-modern-cpp/json-for-modern-cpp.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256	d51a3a8d3efbb1139d7608e28782ea9efea7e7933157e8ff8184901efd8ee760	json-v3.7.0.tar.gz
+sha256	d51a3a8d3efbb1139d7608e28782ea9efea7e7933157e8ff8184901efd8ee760	json-3.7.0.tar.gz
 sha256	7400586ce89c6a2cc65f6ca46997da5d356a230673d3a211e040b783f23578a1	LICENSE.MIT
diff --git a/package/json-for-modern-cpp/json-for-modern-cpp.mk b/package/json-for-modern-cpp/json-for-modern-cpp.mk
index 59484d9576..04a8d4eb3c 100644
--- a/package/json-for-modern-cpp/json-for-modern-cpp.mk
+++ b/package/json-for-modern-cpp/json-for-modern-cpp.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-JSON_FOR_MODERN_CPP_VERSION = v3.7.0
+JSON_FOR_MODERN_CPP_VERSION = 3.7.0
 JSON_FOR_MODERN_CPP_SOURCE = json-$(JSON_FOR_MODERN_CPP_VERSION).tar.gz
-JSON_FOR_MODERN_CPP_SITE = $(call github,nlohmann,json,$(JSON_FOR_MODERN_CPP_VERSION))
+JSON_FOR_MODERN_CPP_SITE = $(call github,nlohmann,json,v$(JSON_FOR_MODERN_CPP_VERSION))
 JSON_FOR_MODERN_CPP_LICENSE = MIT
 JSON_FOR_MODERN_CPP_LICENSE_FILES = LICENSE.MIT
 JSON_FOR_MODERN_CPP_INSTALL_STAGING = YES
