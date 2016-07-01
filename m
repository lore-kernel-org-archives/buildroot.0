From: Samuel Martin <s.martin49@gmail.com>
Date: Fri,  1 Jul 2016 18:29:13 +0200
Subject: [Buildroot] [PATCH v2 08/15] package/gcc: used
	BR2_TOOLCHAIN_HAS_FORTRAN instead of BR2_TOOLCHAIN_BUILDROOT_FORTRAN
In-Reply-To: <20160701162920.19632-1-s.martin49@gmail.com>
References: <20160701162920.19632-1-s.martin49@gmail.com>
Message-ID: <20160701162920.19632-9-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

---
changes v1->v2:
- none
---
 package/gcc/gcc-final/gcc-final.mk | 4 ++--
 package/gcc/gcc.mk                 | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index f13bc36..4eb3639 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -54,7 +54,7 @@ endef
 # Languages supported by the cross-compiler
 GCC_FINAL_CROSS_LANGUAGES-y = c
 GCC_FINAL_CROSS_LANGUAGES-$(BR2_INSTALL_LIBSTDCPP) += c++
-GCC_FINAL_CROSS_LANGUAGES-$(BR2_TOOLCHAIN_BUILDROOT_FORTRAN) += fortran
+GCC_FINAL_CROSS_LANGUAGES-$(BR2_TOOLCHAIN_HAS_FORTRAN) += fortran
 GCC_FINAL_CROSS_LANGUAGES = $(subst $(space),$(comma),$(GCC_FINAL_CROSS_LANGUAGES-y))
 
 HOST_GCC_FINAL_CONF_OPTS = \
@@ -161,7 +161,7 @@ ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
 HOST_GCC_FINAL_USR_LIBS += libstdc++
 endif
 
-ifeq ($(BR2_TOOLCHAIN_BUILDROOT_FORTRAN),y)
+ifeq ($(BR2_TOOLCHAIN_HAS_FORTRAN),y)
 HOST_GCC_FINAL_USR_LIBS += libgfortran
 # fortran needs quadmath on x86 and x86_64
 ifeq ($(BR2_I386)$(BR2_x86_64),y)
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index ff92bbc..9a8efad 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -111,7 +111,7 @@ ifeq ($(BR2_USE_WCHAR),)
 HOST_GCC_COMMON_CONF_OPTS += --disable-libquadmath
 else
 # fortran needs quadmath on x86 and x86_64
-ifeq ($(BR2_TOOLCHAIN_BUILDROOT_FORTRAN)$(BR2_I386)$(BR2_x86_64),yy)
+ifeq ($(BR2_TOOLCHAIN_HAS_FORTRAN)$(BR2_I386)$(BR2_x86_64),yy)
 HOST_GCC_COMMON_CONF_OPTS += --enable-libquadmath
 endif
 endif
-- 
2.9.0
