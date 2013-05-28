From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 28 May 2013 20:50:15 +0200
Subject: [Buildroot] [git commit] gdb: apply post-patch hook on both the
	host and target builds
Message-ID: <20130602212102.047C69A6D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=adaff0dfeac2964c8cc15d9d9b900d7f69abc23c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When a Xtensa specific patch needs to be applied, it should be applied
both when doing the target and the host build.

This change is part of the effort to remove the differences between
host and target post-extract and post-patch hooks, that are
problematic for the out-of-tree support.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gdb/gdb.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

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
 
