From: Christian Stewart <christian@paral.in>
Date: Sat, 15 Apr 2017 13:33:20 -0400
Subject: [Buildroot] [PATCH 1/1] rtl8821au: bump to latest
Message-ID: <20170415173320.14802-1-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Two CFLAGS are added: -Wno-unused-function and -Wno-unused-variable.

These warnings are disabled due to several unused functions and
variables in the codebase that cause build failures with the
-Wall -Werror flags enabled in rtl8821au.

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/rtl8821au/rtl8821au.hash | 2 +-
 package/rtl8821au/rtl8821au.mk   | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/rtl8821au/rtl8821au.hash b/package/rtl8821au/rtl8821au.hash
index 01f22cc..f35d579 100644
--- a/package/rtl8821au/rtl8821au.hash
+++ b/package/rtl8821au/rtl8821au.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 6e4334b0718b2ac611bf8b4d7a493b016bdb1c24daa7b459f091b92b6fd961c7  rtl8821au-c33ddb05a77741d2a9c9b974ad0cf0fa26d17b6e.tar.gz
+sha256 23889fe4bf518dbadcbfac613f64a74bbce177267d9337a98843e4e7de8f1896  rtl8821au-b018b446fb0729fa659e7eead475d6c13f192642.tar.gz
diff --git a/package/rtl8821au/rtl8821au.mk b/package/rtl8821au/rtl8821au.mk
index 5f39bc5..0847a52 100644
--- a/package/rtl8821au/rtl8821au.mk
+++ b/package/rtl8821au/rtl8821au.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8821AU_VERSION = c33ddb05a77741d2a9c9b974ad0cf0fa26d17b6e
+RTL8821AU_VERSION = b018b446fb0729fa659e7eead475d6c13f192642
 RTL8821AU_SITE = $(call github,abperiasamy,rtl8812AU_8821AU_linux,$(RTL8821AU_VERSION))
 RTL8821AU_LICENSE = GPL-2.0
 RTL8821AU_LICENSE_FILES = COPYING
@@ -12,7 +12,8 @@ RTL8821AU_LICENSE_FILES = COPYING
 RTL8821AU_MODULE_MAKE_OPTS = \
 	CONFIG_RTL8812AU_8821AU=m \
 	KVER=$(LINUX_VERSION_PROBED) \
-	USER_EXTRA_CFLAGS=-DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN
+	USER_EXTRA_CFLAGS="-DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN \
+		-Wno-unused-variable -Wno-unused-function"
 
 $(eval $(kernel-module))
 $(eval $(generic-package))
-- 
2.10.2
