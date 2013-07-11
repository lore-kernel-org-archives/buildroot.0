From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 11 Jul 2013 07:14:44 +0200
Subject: [Buildroot] [git commit] toolchain-external: fix bfin external
	toolchain download
Message-ID: <20130711052645.AB86E99ABA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=24262cd5614345675640f64908bac10a97e72259
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.org/results/7d0/7d0eee796407880a4554474e5affbe98b8caa271/

Commit 1cbffbd (eliminate double slashes caused by FOO_SITE ending in
a slash) added a double replacement for the special bfin external
toolchain download, breaking it.

Fix it by removing the 2nd replacement.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/toolchain-external/ext-tool.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index b8d77ad..8d9f458 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -319,10 +319,10 @@ endif
 # components than usual.
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R1)$(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2),y)
 $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE_1):
-	$(call DOWNLOAD,$(TOOLCHAIN_EXTERNAL_SITE_1:/=:/=)/$(TOOLCHAIN_EXTERNAL_SOURCE_1))
+	$(call DOWNLOAD,$(TOOLCHAIN_EXTERNAL_SITE_1:/=)/$(TOOLCHAIN_EXTERNAL_SOURCE_1))
 
 $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE_2):
-	$(call DOWNLOAD,$(TOOLCHAIN_EXTERNAL_SITE_2:/=:/=)/$(TOOLCHAIN_EXTERNAL_SOURCE_2))
+	$(call DOWNLOAD,$(TOOLCHAIN_EXTERNAL_SITE_2:/=)/$(TOOLCHAIN_EXTERNAL_SOURCE_2))
 
 $(TOOLCHAIN_EXTERNAL_DIR)/.extracted: $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE_1) $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE_2)
 	mkdir -p $(@D)
