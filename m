From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 25 Apr 2020 09:00:02 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/gcc: fix
 check-package
Message-ID: <20200425065639.F23098FC46@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=219da1fbd1ad2bc58f587bf67e93ed7b1883f44d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Commit dcaf6e75a (package/gcc: pass -Wno-error to debug builds)
introduced non-ASCII characters in a comment, copy-pasted from a
terminal output.

check-package does not like non-ASCII characters, and whines about
them.

Replace the fancy quotes by standard ASCII ones.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 2a6003ddd5a495f5e580a5dc05d71705fd4da27a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gcc/gcc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index fe7167b2f3..50f2a3fcb7 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -100,7 +100,7 @@ HOST_GCC_COMMON_CONF_ENV = \
 GCC_COMMON_TARGET_CFLAGS = $(TARGET_CFLAGS)
 GCC_COMMON_TARGET_CXXFLAGS = $(TARGET_CXXFLAGS)
 
-# used to fix ../../../../libsanitizer/libbacktrace/../../libbacktrace/elf.c:772:21: error: ???st.st_mode??? may be used uninitialized in this function [-Werror=maybe-uninitialized]
+# used to fix ../../../../libsanitizer/libbacktrace/../../libbacktrace/elf.c:772:21: error: 'st.st_mode' may be used uninitialized in this function [-Werror=maybe-uninitialized]
 ifeq ($(BR2_ENABLE_DEBUG),y)
 GCC_COMMON_TARGET_CFLAGS += -Wno-error
 endif
