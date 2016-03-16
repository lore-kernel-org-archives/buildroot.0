From: Niranjan Reddy <niranjan.reddy@rockwellcollins.com>
Date: Wed, 16 Mar 2016 17:17:20 +0530
Subject: [Buildroot] [ PATCH Selinux v11] skeleton: busybox individual apps
	no symlink
Message-ID: <1458128840-15190-1-git-send-email-niranjan.reddy@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Matt Weber <matthew.weber@rockwellcollins.com>

Ignore the creation of a symlink when individual binaries are
used.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/skeleton/skeleton.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/skeleton/skeleton.mk b/package/skeleton/skeleton.mk
index 7618835..dacda15 100644
--- a/package/skeleton/skeleton.mk
+++ b/package/skeleton/skeleton.mk
@@ -201,10 +201,12 @@ define SKELETON_SYSTEM_BIN_SH
 	rm -f $(TARGET_DIR)/bin/sh
 endef
 else
+ifeq ($(BR2_PACKAGE_BUSYBOX_INDIVIDUAL_BINARIES),)
 define SKELETON_SYSTEM_BIN_SH
 	ln -sf $(SKELETON_TARGET_GENERIC_BIN_SH) $(TARGET_DIR)/bin/sh
 endef
 endif
+endif
 TARGET_FINALIZE_HOOKS += SKELETON_SYSTEM_BIN_SH
 
 ifeq ($(BR2_TARGET_GENERIC_GETTY),y)
-- 
2.5.0
