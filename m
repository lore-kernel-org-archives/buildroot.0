From: Trevor Woerner <twoerner@gmail.com>
Date: Thu,  9 Feb 2012 17:25:13 -0500
Subject: [Buildroot] [PATCH bzip2] bzip2: add so.1 link
Message-ID: <1328826314-30424-1-git-send-email-twoerner@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Trevor Woerner <twoerner@gmail.com>

In addition to the .so link add a .so.1 link for the target rootfs.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 package/bzip2/bzip2.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/bzip2/bzip2.mk b/package/bzip2/bzip2.mk
index d3bb2b0..1bc4449 100644
--- a/package/bzip2/bzip2.mk
+++ b/package/bzip2/bzip2.mk
@@ -59,6 +59,7 @@ define BZIP2_INSTALL_TARGET_CMDS
 	cp $(@D)/libbz2.so.$(BZIP2_SONAME) $(TARGET_DIR)/usr/lib/
 	(cd $(TARGET_DIR)/usr/lib; \
 		ln -snf libbz2.so.$(BZIP2_SONAME) libbz2.so.1.0; \
+		ln -snf libbz2.so.$(BZIP2_SONAME) libbz2.so.1; \
 		ln -snf libbz2.so.$(BZIP2_SONAME) libbz2.so; \
 	)
 	(cd $(TARGET_DIR)/usr/bin; \
@@ -102,4 +103,4 @@ define HOST_BZIP2_INSTALL_CMDS
 endef
 
 $(eval $(call GENTARGETS))
-$(eval $(call GENTARGETS,host))
\ No newline at end of file
+$(eval $(call GENTARGETS,host))
-- 
1.7.9.GIT
