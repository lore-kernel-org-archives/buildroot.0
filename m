From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Sep 2010 19:41:51 +0200
Subject: [Buildroot] [PATCH 05/74] libungif: convert old-style hook to
	new-style hook
In-Reply-To: <cover.1284312638.git.thomas.petazzoni@free-electrons.com>
References: <cover.1284312638.git.thomas.petazzoni@free-electrons.com>
Message-ID: <90710e0c228c29a9e871db331dd84524c9e510ea.1284312638.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
1.7.0.4
