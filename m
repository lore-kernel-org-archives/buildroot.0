From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun,  4 Mar 2012 00:45:06 +0100
Subject: [Buildroot] [PATCH 1/2] Add target to print buildroot version
In-Reply-To: <1330818307-22115-1-git-send-email-arnout@mind.be>
References: <1330818307-22115-1-git-send-email-arnout@mind.be>
Message-ID: <1330818307-22115-2-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

It's convenient to have a target to print the buildroot version, for use
in external scripts calling buildroot.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
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
1.7.9.1
