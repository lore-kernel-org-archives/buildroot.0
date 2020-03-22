From: Laurent Hartanerot <laurent.hartanerot@gmail.com>
Date: Sun, 22 Mar 2020 11:31:43 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/rcw : bump to LSDK-19.09
In-Reply-To: <20200318071427.347-1-laurent.hartanerot@gmail.com>
References: <20200318071427.347-1-laurent.hartanerot@gmail.com>
Message-ID: <20200322103143.18772-1-laurent.hartanerot@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Laurent Hartanerot <laurent.hartanerot@atos.net>

Upgrade python to python3 : "Only Python versions 3.0+ are supported"

Signed-off-by: Laurent Hartanerot <laurent.hartanerot@atos.net>
---
 package/rcw/rcw.hash | 2 +-
 package/rcw/rcw.mk   | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/rcw/rcw.hash b/package/rcw/rcw.hash
index 7de1ec659a..76b6373942 100644
--- a/package/rcw/rcw.hash
+++ b/package/rcw/rcw.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 1421ada9fec10b12ff21cd9ad82f0a835b191cb2dde80f03547764574b1346c3 rcw-LSDK-18.12.tar.gz
+sha256 b69a6a8b187ba794e0af716a509ced2bbac83da0f6e94b5c7331a34619db21b1 rcw-LSDK-19.09.tar.gz
 sha256 a531b3146425e592db17a51ff39c4801cb01fb4055ffdaada0572decc0655bcd LICENSE
diff --git a/package/rcw/rcw.mk b/package/rcw/rcw.mk
index dbfeae7b21..928135abfc 100644
--- a/package/rcw/rcw.mk
+++ b/package/rcw/rcw.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################
 
-RCW_VERSION = LSDK-18.12
+RCW_VERSION = LSDK-19.09
 RCW_SITE = https://source.codeaurora.org/external/qoriq/qoriq-components/rcw
 RCW_SITE_METHOD = git
 RCW_LICENSE = BSD-3-Clause
 RCW_LICENSE_FILES = LICENSE
 
-HOST_RCW_DEPENDENCIES = host-python
+HOST_RCW_DEPENDENCIES = host-python3
 
 RCW_FILES = $(call qstrip,$(BR2_PACKAGE_HOST_RCW_CUSTOM_PATH))
 
@@ -41,7 +41,7 @@ endef
 HOST_RCW_POST_PATCH_HOOKS += HOST_RCW_ADD_CUSTOM_RCW_FILES
 
 define HOST_RCW_BUILD_CMDS
-	$(HOST_DIR)/bin/python $(@D)/rcw.py \
+	$(HOST_DIR)/bin/python3 $(@D)/rcw.py \
 		-i $(@D)/custom_board/rcw/$(RCW_PROJECT) \
 		-I $(@D)/custom_board -o $(@D)/PBL.bin
 endef
-- 
2.20.1
