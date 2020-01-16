From: Vincent Fazio <vfazio@xes-inc.com>
Date: Thu, 16 Jan 2020 13:38:52 -0600
Subject: [Buildroot] [PATCH 4/4] package/*: migrate GIT_SUBMODULES to
 DL_FEATURES
In-Reply-To: <20200116193852.17683-1-vfazio@xes-inc.com>
References: <20200116193852.17683-1-vfazio@xes-inc.com>
Message-ID: <20200116193852.17683-4-vfazio@xes-inc.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update the submodule test package as well.

Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
---
 package/azure-iot-sdk-c/azure-iot-sdk-c.mk                      | 2 +-
 package/brickd/brickd.mk                                        | 2 +-
 package/c-capnproto/c-capnproto.mk                              | 2 +-
 package/gstreamer1/gst1-interpipe/gst1-interpipe.mk             | 2 +-
 package/gstreamer1/gst1-shark/gst1-shark.mk                     | 2 +-
 .../package/git-submodule-enabled/git-submodule-enabled.mk      | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/azure-iot-sdk-c/azure-iot-sdk-c.mk b/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
index 8b3f670399..ec28010cfd 100644
--- a/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
+++ b/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
@@ -7,7 +7,7 @@
 AZURE_IOT_SDK_C_VERSION = 2018-12-13
 AZURE_IOT_SDK_C_SITE = https://github.com/Azure/azure-iot-sdk-c
 AZURE_IOT_SDK_C_SITE_METHOD = git
-AZURE_IOT_SDK_C_GIT_SUBMODULES = YES
+AZURE_IOT_SDK_C_DL_FEATURES = submodules
 AZURE_IOT_SDK_C_LICENSE = MIT
 AZURE_IOT_SDK_C_LICENSE_FILES = LICENSE
 AZURE_IOT_SDK_C_INSTALL_STAGING = YES
diff --git a/package/brickd/brickd.mk b/package/brickd/brickd.mk
index 7fe28daf78..682273b31b 100644
--- a/package/brickd/brickd.mk
+++ b/package/brickd/brickd.mk
@@ -7,7 +7,7 @@
 BRICKD_VERSION = ev3dev-stretch/1.2.1
 BRICKD_SITE = https://github.com/ev3dev/brickd
 BRICKD_SITE_METHOD = git
-BRICKD_GIT_SUBMODULES = YES
+BRICKD_DL_FEATURES = submodules
 
 BRICKD_LICENSE = GPL-2.0
 BRICKD_LICENSE_FILES = LICENSE.txt
diff --git a/package/c-capnproto/c-capnproto.mk b/package/c-capnproto/c-capnproto.mk
index c144a4becc..538430095c 100644
--- a/package/c-capnproto/c-capnproto.mk
+++ b/package/c-capnproto/c-capnproto.mk
@@ -7,7 +7,7 @@
 C_CAPNPROTO_VERSION = 9053ebe6eeb2ae762655b982e27c341cb568366d
 C_CAPNPROTO_SITE = https://github.com/opensourcerouting/c-capnproto.git
 C_CAPNPROTO_SITE_METHOD = git
-C_CAPNPROTO_GIT_SUBMODULES = YES
+C_CAPNPROTO_DL_FEATURES = submodules
 C_CAPNPROTO_LICENSE = MIT
 C_CAPNPROTO_LICENSE_FILES = COPYING
 C_CAPNPROTO_INSTALL_STAGING = YES
diff --git a/package/gstreamer1/gst1-interpipe/gst1-interpipe.mk b/package/gstreamer1/gst1-interpipe/gst1-interpipe.mk
index 87e5f2e5d2..5a125726d3 100644
--- a/package/gstreamer1/gst1-interpipe/gst1-interpipe.mk
+++ b/package/gstreamer1/gst1-interpipe/gst1-interpipe.mk
@@ -8,7 +8,7 @@ GST1_INTERPIPE_VERSION = 9af5b40d106f35ce75f8baa5efc8c59fc5f7eda1
 GST1_INTERPIPE_SITE = https://github.com/RidgeRun/gst-interpipe
 GST1_INTERPIPE_SITE_METHOD = git
 # fetch gst-interpipe/common sub module
-GST1_INTERPIPE_GIT_SUBMODULES = YES
+GST1_INTERPIPE_DL_FEATURES = submodules
 
 GST1_INTERPIPE_LICENSE = LGPL-2.1
 GST1_INTERPIPE_LICENSE_FILES = COPYING
diff --git a/package/gstreamer1/gst1-shark/gst1-shark.mk b/package/gstreamer1/gst1-shark/gst1-shark.mk
index 6dc702b482..1cd0681c85 100644
--- a/package/gstreamer1/gst1-shark/gst1-shark.mk
+++ b/package/gstreamer1/gst1-shark/gst1-shark.mk
@@ -7,7 +7,7 @@
 GST1_SHARK_VERSION = v0.6.1
 GST1_SHARK_SITE =  https://github.com/RidgeRun/gst-shark.git
 GST1_SHARK_SITE_METHOD = git
-GST1_SHARK_GIT_SUBMODULES = YES
+GST1_SHARK_DL_FEATURES = submodules
 
 GST1_SHARK_LICENSE = LGPL-2.1+
 GST1_SHARK_LICENSE_FILES = COPYING
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-submodule-enabled/git-submodule-enabled.mk b/support/testing/tests/download/br2-external/git-refs/package/git-submodule-enabled/git-submodule-enabled.mk
index 48a42f5e8a..90cddbc434 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-submodule-enabled/git-submodule-enabled.mk
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-submodule-enabled/git-submodule-enabled.mk
@@ -6,6 +6,6 @@
 
 GIT_SUBMODULE_ENABLED_VERSION = a9dbc1e23c45e8e1b88c0448763f54d714eb6f8f
 GIT_SUBMODULE_ENABLED_SITE = git://localhost:$(GITREMOTE_PORT_NUMBER)/repo.git
-GIT_SUBMODULE_ENABLED_GIT_SUBMODULES = YES
+GIT_SUBMODULE_ENABLED_DL_FEATURES = submodules
 
 $(eval $(generic-package))
-- 
2.25.0
