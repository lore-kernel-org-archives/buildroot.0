From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  3 Mar 2015 13:44:04 -0300
Subject: [Buildroot] [PATCH] gcc: make branding unconditional
Message-ID: <1425401044-7977-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We don't support older versions that can't handle it any more.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gcc/gcc.mk | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

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
-- 
2.0.5
