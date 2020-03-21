From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 21 Mar 2020 16:36:17 +0100
Subject: [Buildroot] [git commit] package/rcw: add missing host-python
 dependency
Message-ID: <20200321152413.A88D283848@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cd5efaeb67ba65c2706d60d742334a521343635f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The rcw tool that compiles RCW sources file need host-python

Signed-off-by: Laurent Hartanerot <laurent.hartanerot@atos.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
