From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Mar 2015 21:58:43 +0100
Subject: [Buildroot] [git commit] gcc: make branding unconditional
Message-ID: <20150303212044.1374A7FF09@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7f2a52ef83e7989a3afc7e7bdfca166168fd98bd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We don't support older versions that can't handle it any more.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gcc/gcc.mk |   11 +++--------
 1 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 477f846..ffac15c 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -91,7 +91,9 @@ HOST_GCC_COMMON_CONF_OPTS = \
 	--disable-libssp \
 	--disable-multilib \
 	--with-gmp=$(HOST_DIR)/usr \
-	--with-mpfr=$(HOST_DIR)/usr
+	--with-mpfr=$(HOST_DIR)/usr \
+	--with-pkgversion="Buildroot $(BR2_VERSION_FULL)" \
+	--with-bugurl="http://bugs.buildroot.net/"
 
 # Don't build documentation. It takes up extra space / build time,
 # and sometimes needs specific makeinfo versions to work
@@ -206,13 +208,6 @@ ifneq ($(GCC_TARGET_MODE),)
 HOST_GCC_COMMON_CONF_OPTS += --with-mode=$(GCC_TARGET_MODE)
 endif
 
-# Branding works on >= 4.3
-ifneq ($(findstring x4.2.,x$(GCC_VERSION)),x4.2.)
-HOST_GCC_COMMON_CONF_OPTS += \
-	--with-pkgversion="Buildroot $(BR2_VERSION_FULL)" \
-	--with-bugurl="http://bugs.buildroot.net/"
-endif
-
 # Enable proper double/long double for SPE ABI
 ifeq ($(BR2_powerpc_SPE),y)
 HOST_GCC_COMMON_CONF_OPTS += \
