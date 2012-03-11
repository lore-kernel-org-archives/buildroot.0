From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 11 Mar 2012 12:16:39 +0100
Subject: [Buildroot] [PATCH v2] Add target to print buildroot version
Message-ID: <1331464599-6283-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It's convenient to have a target to print the buildroot version, for use
in external scripts calling buildroot.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: Luca Ceresoli <luca@lucaceresoli.net>
---
v2: Add Luca's Acked-by

 Makefile |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index d508888..30099d9 100644
--- a/Makefile
+++ b/Makefile
@@ -48,7 +48,7 @@ export BR2_VERSION_FULL:=$(BR2_VERSION)$(shell $(TOPDIR)/support/scripts/setloca
 noconfig_targets:=menuconfig nconfig gconfig xconfig config oldconfig randconfig \
 	defconfig %_defconfig savedefconfig allyesconfig allnoconfig silentoldconfig release \
 	randpackageconfig allyespackageconfig allnopackageconfig \
-	source-check
+	source-check print-version
 
 # Strip quotes and then whitespaces
 qstrip=$(strip $(subst ",,$(1)))
@@ -721,6 +721,9 @@ release:
 	bzip2 -9 -c < $(OUT).tar > $(OUT).tar.bz2
 	rm -rf $(OUT) $(OUT).tar
 
+print-version:
+	@echo $(BR2_VERSION_FULL)
+
 ################################################################################
 # GENDOC -- generates the make targets needed to build a specific type of
 #           asciidoc documentation.
-- 
tg: (dca6e03..) t/print-version (depends on: master)
