From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun,  4 Mar 2012 14:03:14 +0100
Subject: [Buildroot] [PATCH v2 1/3] Add target to print buildroot version
Message-ID: <1330866196-5360-1-git-send-email-arnout@mind.be>
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
 .topdeps |    1 +
 .topmsg  |    7 +++++++
 Makefile |    5 ++++-
 3 files changed, 12 insertions(+), 1 deletions(-)
 create mode 100644 .topdeps
 create mode 100644 .topmsg

diff --git a/.topdeps b/.topdeps
new file mode 100644
index 0000000..1f7391f
--- /dev/null
+++ b/.topdeps
@@ -0,0 +1 @@
+master
diff --git a/.topmsg b/.topmsg
new file mode 100644
index 0000000..b431fc4
--- /dev/null
+++ b/.topmsg
@@ -0,0 +1,7 @@
+From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
+Subject: [PATCH] Add target to print buildroot version
+
+It's convenient to have a target to print the buildroot version, for use
+in external scripts calling buildroot.
+
+Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
