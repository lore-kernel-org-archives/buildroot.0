From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 13 Mar 2012 13:10:29 +0100
Subject: [Buildroot] [git commit] Add target to print buildroot version
Message-ID: <20120313130006.0825090D7E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2b91ab7a20cf17db16cf3c8a93ef4e50dfb585b7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It's convenient to have a target to print the buildroot version, for use
in external scripts calling buildroot.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: Luca Ceresoli <luca@lucaceresoli.net>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
