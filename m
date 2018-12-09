From: Romain Naour <romain.naour@gmail.com>
Date: Sun,  9 Dec 2018 22:43:48 +0100
Subject: [Buildroot] [PATCH] package/gcc: remove unused
 HOST_GCC_FAKE_TESTSUITE
Message-ID: <20181209214348.31564-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

HOST_GCC_FAKE_TESTSUITE was removed since commit [1].

[1] 545ca6a0f2f4e0d8b3812949476ac2856264b83c

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/gcc/gcc-final/gcc-final.mk     | 1 -
 package/gcc/gcc-initial/gcc-initial.mk | 1 -
 2 files changed, 2 deletions(-)

diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index cbde56ce1c..37b645d252 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -15,7 +15,6 @@ HOST_GCC_FINAL_DEPENDENCIES = \
 	$(BR_LIBC)
 
 HOST_GCC_FINAL_EXCLUDES = $(HOST_GCC_EXCLUDES)
-HOST_GCC_FINAL_POST_EXTRACT_HOOKS += HOST_GCC_FAKE_TESTSUITE
 
 ifneq ($(ARCH_XTENSA_OVERLAY_FILE),)
 HOST_GCC_FINAL_POST_EXTRACT_HOOKS += HOST_GCC_XTENSA_OVERLAY_EXTRACT
diff --git a/package/gcc/gcc-initial/gcc-initial.mk b/package/gcc/gcc-initial/gcc-initial.mk
index d5d925a3d9..1decca8259 100644
--- a/package/gcc/gcc-initial/gcc-initial.mk
+++ b/package/gcc/gcc-initial/gcc-initial.mk
@@ -16,7 +16,6 @@ HOST_GCC_INITIAL_DL_SUBDIR = gcc
 HOST_GCC_INITIAL_DEPENDENCIES = $(HOST_GCC_COMMON_DEPENDENCIES)
 
 HOST_GCC_INITIAL_EXCLUDES = $(HOST_GCC_EXCLUDES)
-HOST_GCC_INITIAL_POST_EXTRACT_HOOKS += HOST_GCC_FAKE_TESTSUITE
 
 ifneq ($(ARCH_XTENSA_OVERLAY_FILE),)
 HOST_GCC_INITIAL_POST_EXTRACT_HOOKS += HOST_GCC_XTENSA_OVERLAY_EXTRACT
-- 
2.14.5
