From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 9 Feb 2012 23:33:02 +0100
Subject: [Buildroot] [git commit] bzip2: add so.1 link
Message-ID: <20120209223422.ECAAC909AB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e8850ffdd5cd0c70832f73c69749203abfe83e5f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In addition to the .so link add a .so.1 link for the target rootfs.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
