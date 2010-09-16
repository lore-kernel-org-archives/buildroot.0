From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Sep 2010 13:36:00 +0200
Subject: [Buildroot] [git commit master 1/1] libungif: convert old-style
	hook to new-style hook
Message-ID: <20100916113822.3F42B8AB99@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=90710e0c228c29a9e871db331dd84524c9e510ea
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libungif/libungif.mk |   10 ++++++----
 1 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/libungif/libungif.mk b/package/libungif/libungif.mk
index 466a72c..d8dc814 100644
--- a/package/libungif/libungif.mk
+++ b/package/libungif/libungif.mk
@@ -17,8 +17,10 @@ LIBUNGIF_BINS = gif2epsn gif2ps gif2rgb gif2x11 gifasm gifbg gifburst gifclip \
 		gifrsize gifspnge giftext gifwedge icon2gif raw2gif rgb2gif   \
 		text2gif
 
-$(eval $(call AUTOTARGETS,package,libungif))
-
-$(LIBUNGIF_HOOK_POST_INSTALL):
+define LIBUNGIF_BINS_CLEANUP
 	rm -f $(addprefix $(TARGET_DIR)/usr/bin/,$(LIBUNGIF_BINS))
-	touch $@
+endef
+
+LIBUNGIF_POST_INSTALL_TARGET_HOOKS += LIBUNGIF_BINS_CLEANUP
+
+$(eval $(call AUTOTARGETS,package,libungif))
-- 
1.7.1
