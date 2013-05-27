From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 May 2013 01:03:45 +0200
Subject: [Buildroot] [PATCH] gdb: apply post-patch hook on both the host and
	target builds
Message-ID: <1369695825-5789-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When a Xtensa specific patch needs to be applied, it should be applied
both when doing the target and the host build.

This change is part of the effort to remove the differences between
host and target post-extract and post-patch hooks, that are
problematic for the out-of-tree support.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gdb/gdb.mk |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 398ef7b..5f4a753 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -48,6 +48,7 @@ define GDB_XTENSA_PRE_PATCH
 	tar xf $(BR2_XTENSA_OVERLAY_DIR)/xtensa_$(XTENSA_CORE_NAME).tar \
 		-C $(@D) --strip-components=1 gdb
 endef
+GDB_PRE_PATCH_HOOKS += GDB_XTENSA_PRE_PATCH
 HOST_GDB_PRE_PATCH_HOOKS += GDB_XTENSA_PRE_PATCH
 endif
 
-- 
1.7.9.5
