From: Michael Roth <mroth@nessie.de>
Date: Wed, 23 Sep 2009 09:34:08 +0200
Subject: [Buildroot] [git commit master] Move download directory 'dl' back
	to the top hierachy of buildroot
Message-ID: <20090923073603.99695777AB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=416323e93442646e344a4e914776520c5e552fa0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Michael Roth <mroth@nessie.de>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index a8a5858..176992c 100644
--- a/Makefile
+++ b/Makefile
@@ -232,7 +232,7 @@ $(if $(BASE_DIR),, $(error output directory "$(O)" does not exist))
 
 DL_DIR=$(call qstrip,$(BR2_DL_DIR))
 ifeq ($(DL_DIR),)
-DL_DIR:=$(BASE_DIR)/dl
+DL_DIR:=$(TOPDIR)/dl
 endif
 
 BUILD_DIR:=$(BASE_DIR)/build
@@ -443,7 +443,7 @@ dirclean: $(TARGETS_DIRCLEAN)
 	rm -rf $(STAGING_DIR) $(TARGET_DIR) $(IMAGE) $(BUILD_DIR)/.root $(STAMP_DIR)
 
 distclean:
-ifeq ($(DL_DIR),$(BASE_DIR)/dl)
+ifeq ($(DL_DIR),$(TOPDIR)/dl)
 	rm -rf $(DL_DIR)
 endif
 	rm -rf $(TOOLCHAIN_DIR) $(BUILD_DIR) $(BINARIES_DIR) \
-- 
1.6.3.3
