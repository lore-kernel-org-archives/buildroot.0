From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Mar 2015 19:33:33 +0200
Subject: [Buildroot] [PATCH 19/35] fs: add rootfs dependencies to PACKAGES
In-Reply-To: <1427650429-9293-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1427650429-9293-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1427650429-9293-20-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The logic for creating most of the filesystem images requires a
certain number of host packages to be built. However, those packages
are not currently listed in the global PACKAGES variables, and they
are not dependencies of any other package listed in the PACKAGES
variable.

While it does not have any practical implications, it makes sense to
have those packages listed in the global PACKAGES variable, which this
commit implements.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 fs/common.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/common.mk b/fs/common.mk
index cac127f..41ee86d 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -106,6 +106,7 @@ rootfs-$(1): $$(BINARIES_DIR)/rootfs.$(1) $$(ROOTFS_$(2)_POST_TARGETS)
 
 ifeq ($$(BR2_TARGET_ROOTFS_$(2)),y)
 TARGETS_ROOTFS += rootfs-$(1)
+PACKAGES += $$(ROOTFS_$(2)_DEPENDENCIES)
 endif
 endef
 
-- 
2.1.0
