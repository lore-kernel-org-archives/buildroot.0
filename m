From: Laurent Hartanerot <laurent.hartanerot@gmail.com>
Date: Thu, 19 Mar 2020 10:30:57 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/rcw: add missing host-python
 dependency
In-Reply-To: <20200319065650.28486-1-laurent.hartanerot@gmail.com>
References: <20200319065650.28486-1-laurent.hartanerot@gmail.com>
Message-ID: <20200319093057.11386-1-laurent.hartanerot@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Laurent Hartanerot <laurent.hartanerot@atos.net>

The rcw tool that compiles RCW sources file need host-python

Signed-off-by: Laurent Hartanerot <laurent.hartanerot@atos.net>
---
 package/rcw/rcw.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/rcw/rcw.mk b/package/rcw/rcw.mk
index 81e22fff93..dbfeae7b21 100644
--- a/package/rcw/rcw.mk
+++ b/package/rcw/rcw.mk
@@ -10,6 +10,8 @@ RCW_SITE_METHOD = git
 RCW_LICENSE = BSD-3-Clause
 RCW_LICENSE_FILES = LICENSE
 
+HOST_RCW_DEPENDENCIES = host-python
+
 RCW_FILES = $(call qstrip,$(BR2_PACKAGE_HOST_RCW_CUSTOM_PATH))
 
 ifneq ($(RCW_FILES),)
@@ -39,7 +41,9 @@ endef
 HOST_RCW_POST_PATCH_HOOKS += HOST_RCW_ADD_CUSTOM_RCW_FILES
 
 define HOST_RCW_BUILD_CMDS
-	python $(@D)/rcw.py -i $(@D)/custom_board/rcw/$(RCW_PROJECT) -I $(@D)/custom_board -o $(@D)/PBL.bin
+	$(HOST_DIR)/bin/python $(@D)/rcw.py \
+		-i $(@D)/custom_board/rcw/$(RCW_PROJECT) \
+		-I $(@D)/custom_board -o $(@D)/PBL.bin
 endef
 
 define HOST_RCW_INSTALL_DELIVERY_FILE
-- 
2.20.1
