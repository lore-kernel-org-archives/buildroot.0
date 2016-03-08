From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  8 Mar 2016 23:30:43 +0100
Subject: [Buildroot] [PATCH] gcc: drop gcc 4.5 specific code
Message-ID: <1457476243-9401-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We have removed gcc 4.5 support since a long time, so this commit
removes dead code that was only used when building a toolchain based
on gcc 4.5.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/gcc.mk | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 07883d0..0fb73c9 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -97,15 +97,6 @@ HOST_GCC_COMMON_CONF_ENV = \
 GCC_COMMON_TARGET_CFLAGS = $(TARGET_CFLAGS)
 GCC_COMMON_TARGET_CXXFLAGS = $(TARGET_CXXFLAGS)
 
-# http://gcc.gnu.org/bugzilla/show_bug.cgi?id=43810
-# Workaround until it's fixed in 4.5.4 or later
-ifeq ($(ARCH),powerpc)
-ifeq ($(findstring x4.5.,x$(GCC_VERSION)),x4.5.)
-GCC_COMMON_TARGET_CFLAGS = $(filter-out -Os,$(GCC_COMMON_TARGET_CFLAGS))
-GCC_COMMON_TARGET_CXXFLAGS = $(filter-out -Os,$(GCC_COMMON_TARGET_CXXFLAGS))
-endif
-endif
-
 # Xtensa libgcc can't be built with -mauto-litpools
 # because of the trick used to generate .init/.fini sections.
 ifeq ($(BR2_xtensa),y)
-- 
2.6.4
