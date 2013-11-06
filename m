From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed,  6 Nov 2013 23:59:55 +0100
Subject: [Buildroot] [PATCH] gcc: use generic infrastructure for patches
In-Reply-To: <527AB58A.9050506@mind.be>
References: <527AB58A.9050506@mind.be>
Message-ID: <1383778795-15262-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This solves the patch error for gcc snapshots.

Also sneak in an extra condition when applying the powerpc softfloat patch,
so that the error is really fixed.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
The powerpc patch could be converted to link-with-math-lib.patch.powerpc,
but since we're deprecating the *.patch.$(ARCH) pattern I choose to keep
this special treatment.

I didn't want to bother with splitting this patch for the powerpc stuff.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/gcc/gcc-final/4.2.2-avr32-2.1.5          | 1 +
 package/gcc/gcc-final/4.3.6                      | 1 +
 package/gcc/gcc-final/4.4.7                      | 1 +
 package/gcc/gcc-final/4.5.4                      | 1 +
 package/gcc/gcc-final/4.6.4                      | 1 +
 package/gcc/gcc-final/4.7.3                      | 1 +
 package/gcc/gcc-final/4.8-arc                    | 1 +
 package/gcc/gcc-final/4.8.2                      | 1 +
 package/gcc/gcc-final/gcc-final.mk               | 2 +-
 package/gcc/gcc-initial/4.2.2-avr32-2.1.5        | 1 +
 package/gcc/gcc-initial/4.3.6                    | 1 +
 package/gcc/gcc-initial/4.4.7                    | 1 +
 package/gcc/gcc-initial/4.5.4                    | 1 +
 package/gcc/gcc-initial/4.6.4                    | 1 +
 package/gcc/gcc-initial/4.7.3                    | 1 +
 package/gcc/gcc-initial/4.8-arc                  | 1 +
 package/gcc/gcc-initial/4.8.2                    | 1 +
 package/gcc/gcc-initial/gcc-initial.mk           | 2 +-
 package/gcc/gcc-intermediate/4.2.2-avr32-2.1.5   | 1 +
 package/gcc/gcc-intermediate/4.3.6               | 1 +
 package/gcc/gcc-intermediate/4.4.7               | 1 +
 package/gcc/gcc-intermediate/4.5.4               | 1 +
 package/gcc/gcc-intermediate/4.6.4               | 1 +
 package/gcc/gcc-intermediate/4.7.3               | 1 +
 package/gcc/gcc-intermediate/4.8-arc             | 1 +
 package/gcc/gcc-intermediate/4.8.2               | 1 +
 package/gcc/gcc-intermediate/gcc-intermediate.mk | 2 +-
 package/gcc/gcc.mk                               | 9 +++------
 28 files changed, 30 insertions(+), 9 deletions(-)
 create mode 120000 package/gcc/gcc-final/4.2.2-avr32-2.1.5
 create mode 120000 package/gcc/gcc-final/4.3.6
 create mode 120000 package/gcc/gcc-final/4.4.7
 create mode 120000 package/gcc/gcc-final/4.5.4
 create mode 120000 package/gcc/gcc-final/4.6.4
 create mode 120000 package/gcc/gcc-final/4.7.3
 create mode 120000 package/gcc/gcc-final/4.8-arc
 create mode 120000 package/gcc/gcc-final/4.8.2
 create mode 120000 package/gcc/gcc-initial/4.2.2-avr32-2.1.5
 create mode 120000 package/gcc/gcc-initial/4.3.6
 create mode 120000 package/gcc/gcc-initial/4.4.7
 create mode 120000 package/gcc/gcc-initial/4.5.4
 create mode 120000 package/gcc/gcc-initial/4.6.4
 create mode 120000 package/gcc/gcc-initial/4.7.3
 create mode 120000 package/gcc/gcc-initial/4.8-arc
 create mode 120000 package/gcc/gcc-initial/4.8.2
 create mode 120000 package/gcc/gcc-intermediate/4.2.2-avr32-2.1.5
 create mode 120000 package/gcc/gcc-intermediate/4.3.6
 create mode 120000 package/gcc/gcc-intermediate/4.4.7
 create mode 120000 package/gcc/gcc-intermediate/4.5.4
 create mode 120000 package/gcc/gcc-intermediate/4.6.4
 create mode 120000 package/gcc/gcc-intermediate/4.7.3
 create mode 120000 package/gcc/gcc-intermediate/4.8-arc
 create mode 120000 package/gcc/gcc-intermediate/4.8.2

diff --git a/package/gcc/gcc-final/4.2.2-avr32-2.1.5 b/package/gcc/gcc-final/4.2.2-avr32-2.1.5
new file mode 120000
index 0000000..032c9e3
--- /dev/null
+++ b/package/gcc/gcc-final/4.2.2-avr32-2.1.5
@@ -0,0 +1 @@
+../4.2.2-avr32-2.1.5
\ No newline at end of file
diff --git a/package/gcc/gcc-final/4.3.6 b/package/gcc/gcc-final/4.3.6
new file mode 120000
index 0000000..e1c481e
--- /dev/null
+++ b/package/gcc/gcc-final/4.3.6
@@ -0,0 +1 @@
+../4.3.6
\ No newline at end of file
diff --git a/package/gcc/gcc-final/4.4.7 b/package/gcc/gcc-final/4.4.7
new file mode 120000
index 0000000..a7ca0e2
--- /dev/null
+++ b/package/gcc/gcc-final/4.4.7
@@ -0,0 +1 @@
+../4.4.7
\ No newline at end of file
diff --git a/package/gcc/gcc-final/4.5.4 b/package/gcc/gcc-final/4.5.4
new file mode 120000
index 0000000..b758df2
--- /dev/null
+++ b/package/gcc/gcc-final/4.5.4
@@ -0,0 +1 @@
+../4.5.4
\ No newline at end of file
diff --git a/package/gcc/gcc-final/4.6.4 b/package/gcc/gcc-final/4.6.4
new file mode 120000
index 0000000..d4c8b47
--- /dev/null
+++ b/package/gcc/gcc-final/4.6.4
@@ -0,0 +1 @@
+../4.6.4
\ No newline at end of file
diff --git a/package/gcc/gcc-final/4.7.3 b/package/gcc/gcc-final/4.7.3
new file mode 120000
index 0000000..6c32215
--- /dev/null
+++ b/package/gcc/gcc-final/4.7.3
@@ -0,0 +1 @@
+../4.7.3
\ No newline at end of file
diff --git a/package/gcc/gcc-final/4.8-arc b/package/gcc/gcc-final/4.8-arc
new file mode 120000
index 0000000..4f63276
--- /dev/null
+++ b/package/gcc/gcc-final/4.8-arc
@@ -0,0 +1 @@
+../4.8-arc
\ No newline at end of file
diff --git a/package/gcc/gcc-final/4.8.2 b/package/gcc/gcc-final/4.8.2
new file mode 120000
index 0000000..27736e8
--- /dev/null
+++ b/package/gcc/gcc-final/4.8.2
@@ -0,0 +1 @@
+../4.8.2
\ No newline at end of file
diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index b396382..409ac97 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -18,7 +18,7 @@ ifneq ($(call qstrip, $(BR2_XTENSA_CORE_NAME)),)
 HOST_GCC_FINAL_POST_EXTRACT_CMDS += HOST_GCC_FINAL_XTENSA_OVERLAY_EXTRACT
 endif
 
-HOST_GCC_FINAL_POST_PATCH_HOOKS += HOST_GCC_APPLY_PATCHES
+HOST_GCC_FINAL_POST_PATCH_HOOKS += HOST_GCC_APPLY_POWERPC_PATCH
 
 # gcc doesn't support in-tree build, so we create a 'build'
 # subdirectory in the gcc sources, and build from there.
diff --git a/package/gcc/gcc-initial/4.2.2-avr32-2.1.5 b/package/gcc/gcc-initial/4.2.2-avr32-2.1.5
new file mode 120000
index 0000000..032c9e3
--- /dev/null
+++ b/package/gcc/gcc-initial/4.2.2-avr32-2.1.5
@@ -0,0 +1 @@
+../4.2.2-avr32-2.1.5
\ No newline at end of file
diff --git a/package/gcc/gcc-initial/4.3.6 b/package/gcc/gcc-initial/4.3.6
new file mode 120000
index 0000000..e1c481e
--- /dev/null
+++ b/package/gcc/gcc-initial/4.3.6
@@ -0,0 +1 @@
+../4.3.6
\ No newline at end of file
diff --git a/package/gcc/gcc-initial/4.4.7 b/package/gcc/gcc-initial/4.4.7
new file mode 120000
index 0000000..a7ca0e2
--- /dev/null
+++ b/package/gcc/gcc-initial/4.4.7
@@ -0,0 +1 @@
+../4.4.7
\ No newline at end of file
diff --git a/package/gcc/gcc-initial/4.5.4 b/package/gcc/gcc-initial/4.5.4
new file mode 120000
index 0000000..b758df2
--- /dev/null
+++ b/package/gcc/gcc-initial/4.5.4
@@ -0,0 +1 @@
+../4.5.4
\ No newline at end of file
diff --git a/package/gcc/gcc-initial/4.6.4 b/package/gcc/gcc-initial/4.6.4
new file mode 120000
index 0000000..d4c8b47
--- /dev/null
+++ b/package/gcc/gcc-initial/4.6.4
@@ -0,0 +1 @@
+../4.6.4
\ No newline at end of file
diff --git a/package/gcc/gcc-initial/4.7.3 b/package/gcc/gcc-initial/4.7.3
new file mode 120000
index 0000000..6c32215
--- /dev/null
+++ b/package/gcc/gcc-initial/4.7.3
@@ -0,0 +1 @@
+../4.7.3
\ No newline at end of file
diff --git a/package/gcc/gcc-initial/4.8-arc b/package/gcc/gcc-initial/4.8-arc
new file mode 120000
index 0000000..4f63276
--- /dev/null
+++ b/package/gcc/gcc-initial/4.8-arc
@@ -0,0 +1 @@
+../4.8-arc
\ No newline at end of file
diff --git a/package/gcc/gcc-initial/4.8.2 b/package/gcc/gcc-initial/4.8.2
new file mode 120000
index 0000000..27736e8
--- /dev/null
+++ b/package/gcc/gcc-initial/4.8.2
@@ -0,0 +1 @@
+../4.8.2
\ No newline at end of file
diff --git a/package/gcc/gcc-initial/gcc-initial.mk b/package/gcc/gcc-initial/gcc-initial.mk
index 0eb492f..6a1ec3c 100644
--- a/package/gcc/gcc-initial/gcc-initial.mk
+++ b/package/gcc/gcc-initial/gcc-initial.mk
@@ -16,7 +16,7 @@ ifneq ($(call qstrip, $(BR2_XTENSA_CORE_NAME)),)
 HOST_GCC_INITIAL_POST_EXTRACT_CMDS += HOST_GCC_XTENSA_OVERLAY_EXTRACT
 endif
 
-HOST_GCC_INITIAL_POST_PATCH_HOOKS += HOST_GCC_APPLY_PATCHES
+HOST_GCC_INITIAL_POST_PATCH_HOOKS += HOST_GCC_APPLY_POWERPC_PATCH
 
 # gcc doesn't support in-tree build, so we create a 'build'
 # subdirectory in the gcc sources, and build from there.
diff --git a/package/gcc/gcc-intermediate/4.2.2-avr32-2.1.5 b/package/gcc/gcc-intermediate/4.2.2-avr32-2.1.5
new file mode 120000
index 0000000..032c9e3
--- /dev/null
+++ b/package/gcc/gcc-intermediate/4.2.2-avr32-2.1.5
@@ -0,0 +1 @@
+../4.2.2-avr32-2.1.5
\ No newline at end of file
diff --git a/package/gcc/gcc-intermediate/4.3.6 b/package/gcc/gcc-intermediate/4.3.6
new file mode 120000
index 0000000..e1c481e
--- /dev/null
+++ b/package/gcc/gcc-intermediate/4.3.6
@@ -0,0 +1 @@
+../4.3.6
\ No newline at end of file
diff --git a/package/gcc/gcc-intermediate/4.4.7 b/package/gcc/gcc-intermediate/4.4.7
new file mode 120000
index 0000000..a7ca0e2
--- /dev/null
+++ b/package/gcc/gcc-intermediate/4.4.7
@@ -0,0 +1 @@
+../4.4.7
\ No newline at end of file
diff --git a/package/gcc/gcc-intermediate/4.5.4 b/package/gcc/gcc-intermediate/4.5.4
new file mode 120000
index 0000000..b758df2
--- /dev/null
+++ b/package/gcc/gcc-intermediate/4.5.4
@@ -0,0 +1 @@
+../4.5.4
\ No newline at end of file
diff --git a/package/gcc/gcc-intermediate/4.6.4 b/package/gcc/gcc-intermediate/4.6.4
new file mode 120000
index 0000000..d4c8b47
--- /dev/null
+++ b/package/gcc/gcc-intermediate/4.6.4
@@ -0,0 +1 @@
+../4.6.4
\ No newline at end of file
diff --git a/package/gcc/gcc-intermediate/4.7.3 b/package/gcc/gcc-intermediate/4.7.3
new file mode 120000
index 0000000..6c32215
--- /dev/null
+++ b/package/gcc/gcc-intermediate/4.7.3
@@ -0,0 +1 @@
+../4.7.3
\ No newline at end of file
diff --git a/package/gcc/gcc-intermediate/4.8-arc b/package/gcc/gcc-intermediate/4.8-arc
new file mode 120000
index 0000000..4f63276
--- /dev/null
+++ b/package/gcc/gcc-intermediate/4.8-arc
@@ -0,0 +1 @@
+../4.8-arc
\ No newline at end of file
diff --git a/package/gcc/gcc-intermediate/4.8.2 b/package/gcc/gcc-intermediate/4.8.2
new file mode 120000
index 0000000..27736e8
--- /dev/null
+++ b/package/gcc/gcc-intermediate/4.8.2
@@ -0,0 +1 @@
+../4.8.2
\ No newline at end of file
diff --git a/package/gcc/gcc-intermediate/gcc-intermediate.mk b/package/gcc/gcc-intermediate/gcc-intermediate.mk
index f47e4be..c0bf6fc 100644
--- a/package/gcc/gcc-intermediate/gcc-intermediate.mk
+++ b/package/gcc/gcc-intermediate/gcc-intermediate.mk
@@ -18,7 +18,7 @@ ifneq ($(call qstrip, $(BR2_XTENSA_CORE_NAME)),)
 HOST_GCC_INTERMEDIATE_POST_EXTRACT_CMDS += HOST_GCC_XTENSA_OVERLAY_EXTRACT
 endif
 
-HOST_GCC_INTERMEDIATE_POST_PATCH_HOOKS += HOST_GCC_APPLY_PATCHES
+HOST_GCC_INTERMEDIATE_POST_PATCH_HOOKS += HOST_GCC_APPLY_POWERPC_PATCH
 
 # gcc doesn't support in-tree build, so we create a 'build'
 # subdirectory in the gcc sources, and build from there.
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 0c0cc99..bddceba 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -43,16 +43,13 @@ endef
 ifeq ($(ARCH),powerpc)
 ifneq ($(BR2_SOFT_FLOAT),)
 define HOST_GCC_APPLY_POWERPC_PATCH
-	support/scripts/apply-patches.sh $(@D) package/gcc/$(GCC_VERSION) powerpc-link-with-math-lib.patch.conditional
+	if [ -e package/gcc/$(GCC_VERSION)/powerpc-link-with-math-lib.patch.conditional ]; then \
+		support/scripts/apply-patches.sh $(@D) package/gcc/$(GCC_VERSION) powerpc-link-with-math-lib.patch.conditional; \
+	fi
 endef
 endif
 endif
 
-define HOST_GCC_APPLY_PATCHES
-	support/scripts/apply-patches.sh $(@D) package/gcc/$(GCC_VERSION) \*.patch
-	$(HOST_GCC_APPLY_POWERPC_PATCH)
-endef
-
 #
 # Custom extract command to save disk space
 #
-- 
1.8.4.rc3
