From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 17 Nov 2020 21:17:03 +0100
Subject: [Buildroot] [PATCH/next 6/6] package/linphone: bump to version 4.4.8
In-Reply-To: <20201117201703.137790-1-fontaine.fabrice@gmail.com>
References: <20201117201703.137790-1-fontaine.fabrice@gmail.com>
Message-ID: <20201117201703.137790-6-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Set GIT_EXECUTABLE to OFF to avoid the following build failure:

CMake Error at /home/fabrice/br-test-pkg/br-arm-cortex-a9-glibc/host/arm-buildroot-linux-gnueabihf/sysroot/usr/share/bctoolbox/cmake/bctoolboxCMakeUtils.cmake:162 (message):
  invalid git describe version: ''
Call Stack (most recent call first):
  CMakeLists.txt:125 (bc_compute_lib_version)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/linphone/linphone.hash | 2 +-
 package/linphone/linphone.mk   | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/linphone/linphone.hash b/package/linphone/linphone.hash
index 9aa03078d2..6d456ac9c9 100644
--- a/package/linphone/linphone.hash
+++ b/package/linphone/linphone.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256  bfb195845ae23311667d5631c470310a63818fe46029cea2f1b77a5ed84e6e21  linphone-4.3.1.tar.gz
+sha256  9956f6785a787041328da000cee5fcc1e41d6f17956ffe5e0402fac0f9a9676b  linphone-4.4.8.tar.gz
 # Locally computed
 sha256  1b3782ccad7b8614100cda30d3faf42fc39f2e97932908c543005053b654ca68  LICENSE.txt
diff --git a/package/linphone/linphone.mk b/package/linphone/linphone.mk
index 9fd69670e5..bb79e2f782 100644
--- a/package/linphone/linphone.mk
+++ b/package/linphone/linphone.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINPHONE_VERSION = 4.3.1
+LINPHONE_VERSION = 4.4.8
 LINPHONE_SITE = \
 	https://gitlab.linphone.org/BC/public/liblinphone/-/archive/$(LINPHONE_VERSION)
 LINPHONE_CONF_OPTS = \
@@ -18,7 +18,8 @@ LINPHONE_CONF_OPTS = \
 	-DENABLE_TUTORIALS=OFF \
 	-DENABLE_UNIT_TESTS=OFF \
 	-DENABLE_VCARD=OFF \
-	-DENABLE_VIDEO=OFF
+	-DENABLE_VIDEO=OFF \
+	-DGIT_EXECUTABLE=OFF
 LINPHONE_INSTALL_STAGING = YES
 LINPHONE_DEPENDENCIES = \
 	belle-sip \
-- 
2.29.2
