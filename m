From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  1 Aug 2014 11:04:50 -0300
Subject: [Buildroot] [PATCH] musl: bump to version 1.1.4
Message-ID: <1406901890-22799-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The gcc 4.9.x breakage is now handled by musl itself.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/musl/musl.mk | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/package/musl/musl.mk b/package/musl/musl.mk
index 53c97d5..63607f9 100644
--- a/package/musl/musl.mk
+++ b/package/musl/musl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MUSL_VERSION = 1.1.3
+MUSL_VERSION = 1.1.4
 MUSL_SITE = http://www.musl-libc.org/releases
 MUSL_LICENSE = MIT
 MUSL_LICENSE_FILES = COPYRIGHT
@@ -18,12 +18,6 @@ MUSL_ADD_TOOLCHAIN_DEPENDENCY = NO
 
 MUSL_INSTALL_STAGING = YES
 
-# gcc constant folding bug with weak aliases workaround
-# See http://www.openwall.com/lists/musl/2014/05/15/1
-ifeq ($(BR2_GCC_VERSION_4_9_X),y)
-MUSL_EXTRA_CFLAGS += -fno-toplevel-reorder
-endif
-
 # We need to run the musl configure script prior to building the
 # gcc-intermediate, so that we can call the install-headers step and
 # get the crt<X>.o built. However, we need to call it again after
-- 
1.8.5.5
