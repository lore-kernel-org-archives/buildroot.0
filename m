From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun,  6 Dec 2015 16:03:16 -0300
Subject: [Buildroot] [PATCH] gcc: bump 5.x series to version 5.3.0
Message-ID: <1449428596-26365-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

201-libgcc-remove-unistd-header.patch is upstream so remove it.

Also remove host-cloog dependency since it's not required any more.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gcc/5.2.0/201-libgcc-remove-unistd-header.patch    | 14 --------------
 package/gcc/{5.2.0 => 5.3.0}/100-uclibc-conf.patch         |  0
 ...-config.gcc-fix-typo-for-powerpc-e6500-cpu_is_64b.patch |  0
 package/gcc/{5.2.0 => 5.3.0}/301-missing-execinfo_h.patch  |  0
 .../gcc/{5.2.0 => 5.3.0}/810-arm-softfloat-libgcc.patch    |  0
 package/gcc/{5.2.0 => 5.3.0}/830-arm_unbreak_armv4t.patch  |  0
 .../840-microblaze-enable-dwarf-eh-support.patch           |  0
 .../gcc/{5.2.0 => 5.3.0}/850-libstdcxx-uclibc-c99.patch    |  0
 package/gcc/{5.2.0 => 5.3.0}/860-cilk-wchar.patch          |  0
 .../870-xtensa-add-mauto-litpools-option.patch             |  0
 .../871-xtensa-reimplement-register-spilling.patch         |  0
 ...nsa-use-unwind-dw2-fde-dip-instead-of-unwind-dw2-.patch |  0
 .../{5.2.0 => 5.3.0}/873-xtensa-fix-_Unwind_GetCFA.patch   |  0
 .../900-libitm-fixes-for-musl-support.patch                |  0
 .../901-fixincludes-update-for-musl-support.patch          |  0
 package/gcc/{5.2.0 => 5.3.0}/902-unwind-fix-for-musl.patch |  0
 ...03-libstdc++-libgfortran-gthr-workaround-for-musl.patch |  0
 package/gcc/{5.2.0 => 5.3.0}/904-musl-libc-config.patch    |  0
 .../gcc/{5.2.0 => 5.3.0}/905-add-musl-support-to-gcc.patch |  0
 package/gcc/{5.2.0 => 5.3.0}/906-mips-musl-support.patch   |  0
 package/gcc/{5.2.0 => 5.3.0}/907-x86-musl-support.patch    |  0
 package/gcc/{5.2.0 => 5.3.0}/908-arm-musl-support.patch    |  0
 .../gcc/{5.2.0 => 5.3.0}/909-aarch64-musl-support.patch    |  0
 package/gcc/Config.in.host                                 |  2 +-
 package/gcc/gcc.hash                                       |  4 ++--
 package/gcc/gcc.mk                                         | 10 ++++++++--
 26 files changed, 11 insertions(+), 19 deletions(-)
 delete mode 100644 package/gcc/5.2.0/201-libgcc-remove-unistd-header.patch
 rename package/gcc/{5.2.0 => 5.3.0}/100-uclibc-conf.patch (100%)
 rename package/gcc/{5.2.0 => 5.3.0}/120-gcc-config.gcc-fix-typo-for-powerpc-e6500-cpu_is_64b.patch (100%)
 rename package/gcc/{5.2.0 => 5.3.0}/301-missing-execinfo_h.patch (100%)
 rename package/gcc/{5.2.0 => 5.3.0}/810-arm-softfloat-libgcc.patch (100%)
 rename package/gcc/{5.2.0 => 5.3.0}/830-arm_unbreak_armv4t.patch (100%)
 rename package/gcc/{5.2.0 => 5.3.0}/840-microblaze-enable-dwarf-eh-support.patch (100%)
 rename package/gcc/{5.2.0 => 5.3.0}/850-libstdcxx-uclibc-c99.patch (100%)
 rename package/gcc/{5.2.0 => 5.3.0}/860-cilk-wchar.patch (100%)
 rename package/gcc/{5.2.0 => 5.3.0}/870-xtensa-add-mauto-litpools-option.patch (100%)
 rename package/gcc/{5.2.0 => 5.3.0}/871-xtensa-reimplement-register-spilling.patch (100%)
 rename package/gcc/{5.2.0 => 5.3.0}/872-xtensa-use-unwind-dw2-fde-dip-instead-of-unwind-dw2-.patch (100%)
 rename package/gcc/{5.2.0 => 5.3.0}/873-xtensa-fix-_Unwind_GetCFA.patch (100%)
 rename package/gcc/{5.2.0 => 5.3.0}/900-libitm-fixes-for-musl-support.patch (100%)
 rename package/gcc/{5.2.0 => 5.3.0}/901-fixincludes-update-for-musl-support.patch (100%)
 rename package/gcc/{5.2.0 => 5.3.0}/902-unwind-fix-for-musl.patch (100%)
 rename package/gcc/{5.2.0 => 5.3.0}/903-libstdc++-libgfortran-gthr-workaround-for-musl.patch (100%)
 rename package/gcc/{5.2.0 => 5.3.0}/904-musl-libc-config.patch (100%)
 rename package/gcc/{5.2.0 => 5.3.0}/905-add-musl-support-to-gcc.patch (100%)
 rename package/gcc/{5.2.0 => 5.3.0}/906-mips-musl-support.patch (100%)
 rename package/gcc/{5.2.0 => 5.3.0}/907-x86-musl-support.patch (100%)
 rename package/gcc/{5.2.0 => 5.3.0}/908-arm-musl-support.patch (100%)
 rename package/gcc/{5.2.0 => 5.3.0}/909-aarch64-musl-support.patch (100%)

diff --git a/package/gcc/5.2.0/201-libgcc-remove-unistd-header.patch b/package/gcc/5.2.0/201-libgcc-remove-unistd-header.patch
deleted file mode 100644
index 20d1c06..0000000
--- a/package/gcc/5.2.0/201-libgcc-remove-unistd-header.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-Upstream status: In progress
-
-Index: b/libgcc/config/nios2/linux-atomic.c
-===================================================================
---- a/libgcc/config/nios2/linux-atomic.c
-+++ b/libgcc/config/nios2/linux-atomic.c
-@@ -20,7 +20,6 @@
- see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
- <http://www.gnu.org/licenses/>.  */
- 
--#include <asm/unistd.h>
- #define EFAULT  14
- #define EBUSY   16
- #define ENOSYS  38
diff --git a/package/gcc/5.2.0/100-uclibc-conf.patch b/package/gcc/5.3.0/100-uclibc-conf.patch
similarity index 100%
rename from package/gcc/5.2.0/100-uclibc-conf.patch
rename to package/gcc/5.3.0/100-uclibc-conf.patch
diff --git a/package/gcc/5.2.0/120-gcc-config.gcc-fix-typo-for-powerpc-e6500-cpu_is_64b.patch b/package/gcc/5.3.0/120-gcc-config.gcc-fix-typo-for-powerpc-e6500-cpu_is_64b.patch
similarity index 100%
rename from package/gcc/5.2.0/120-gcc-config.gcc-fix-typo-for-powerpc-e6500-cpu_is_64b.patch
rename to package/gcc/5.3.0/120-gcc-config.gcc-fix-typo-for-powerpc-e6500-cpu_is_64b.patch
diff --git a/package/gcc/5.2.0/301-missing-execinfo_h.patch b/package/gcc/5.3.0/301-missing-execinfo_h.patch
similarity index 100%
rename from package/gcc/5.2.0/301-missing-execinfo_h.patch
rename to package/gcc/5.3.0/301-missing-execinfo_h.patch
diff --git a/package/gcc/5.2.0/810-arm-softfloat-libgcc.patch b/package/gcc/5.3.0/810-arm-softfloat-libgcc.patch
similarity index 100%
rename from package/gcc/5.2.0/810-arm-softfloat-libgcc.patch
rename to package/gcc/5.3.0/810-arm-softfloat-libgcc.patch
diff --git a/package/gcc/5.2.0/830-arm_unbreak_armv4t.patch b/package/gcc/5.3.0/830-arm_unbreak_armv4t.patch
similarity index 100%
rename from package/gcc/5.2.0/830-arm_unbreak_armv4t.patch
rename to package/gcc/5.3.0/830-arm_unbreak_armv4t.patch
diff --git a/package/gcc/5.2.0/840-microblaze-enable-dwarf-eh-support.patch b/package/gcc/5.3.0/840-microblaze-enable-dwarf-eh-support.patch
similarity index 100%
rename from package/gcc/5.2.0/840-microblaze-enable-dwarf-eh-support.patch
rename to package/gcc/5.3.0/840-microblaze-enable-dwarf-eh-support.patch
diff --git a/package/gcc/5.2.0/850-libstdcxx-uclibc-c99.patch b/package/gcc/5.3.0/850-libstdcxx-uclibc-c99.patch
similarity index 100%
rename from package/gcc/5.2.0/850-libstdcxx-uclibc-c99.patch
rename to package/gcc/5.3.0/850-libstdcxx-uclibc-c99.patch
diff --git a/package/gcc/5.2.0/860-cilk-wchar.patch b/package/gcc/5.3.0/860-cilk-wchar.patch
similarity index 100%
rename from package/gcc/5.2.0/860-cilk-wchar.patch
rename to package/gcc/5.3.0/860-cilk-wchar.patch
diff --git a/package/gcc/5.2.0/870-xtensa-add-mauto-litpools-option.patch b/package/gcc/5.3.0/870-xtensa-add-mauto-litpools-option.patch
similarity index 100%
rename from package/gcc/5.2.0/870-xtensa-add-mauto-litpools-option.patch
rename to package/gcc/5.3.0/870-xtensa-add-mauto-litpools-option.patch
diff --git a/package/gcc/5.2.0/871-xtensa-reimplement-register-spilling.patch b/package/gcc/5.3.0/871-xtensa-reimplement-register-spilling.patch
similarity index 100%
rename from package/gcc/5.2.0/871-xtensa-reimplement-register-spilling.patch
rename to package/gcc/5.3.0/871-xtensa-reimplement-register-spilling.patch
diff --git a/package/gcc/5.2.0/872-xtensa-use-unwind-dw2-fde-dip-instead-of-unwind-dw2-.patch b/package/gcc/5.3.0/872-xtensa-use-unwind-dw2-fde-dip-instead-of-unwind-dw2-.patch
similarity index 100%
rename from package/gcc/5.2.0/872-xtensa-use-unwind-dw2-fde-dip-instead-of-unwind-dw2-.patch
rename to package/gcc/5.3.0/872-xtensa-use-unwind-dw2-fde-dip-instead-of-unwind-dw2-.patch
diff --git a/package/gcc/5.2.0/873-xtensa-fix-_Unwind_GetCFA.patch b/package/gcc/5.3.0/873-xtensa-fix-_Unwind_GetCFA.patch
similarity index 100%
rename from package/gcc/5.2.0/873-xtensa-fix-_Unwind_GetCFA.patch
rename to package/gcc/5.3.0/873-xtensa-fix-_Unwind_GetCFA.patch
diff --git a/package/gcc/5.2.0/900-libitm-fixes-for-musl-support.patch b/package/gcc/5.3.0/900-libitm-fixes-for-musl-support.patch
similarity index 100%
rename from package/gcc/5.2.0/900-libitm-fixes-for-musl-support.patch
rename to package/gcc/5.3.0/900-libitm-fixes-for-musl-support.patch
diff --git a/package/gcc/5.2.0/901-fixincludes-update-for-musl-support.patch b/package/gcc/5.3.0/901-fixincludes-update-for-musl-support.patch
similarity index 100%
rename from package/gcc/5.2.0/901-fixincludes-update-for-musl-support.patch
rename to package/gcc/5.3.0/901-fixincludes-update-for-musl-support.patch
diff --git a/package/gcc/5.2.0/902-unwind-fix-for-musl.patch b/package/gcc/5.3.0/902-unwind-fix-for-musl.patch
similarity index 100%
rename from package/gcc/5.2.0/902-unwind-fix-for-musl.patch
rename to package/gcc/5.3.0/902-unwind-fix-for-musl.patch
diff --git a/package/gcc/5.2.0/903-libstdc++-libgfortran-gthr-workaround-for-musl.patch b/package/gcc/5.3.0/903-libstdc++-libgfortran-gthr-workaround-for-musl.patch
similarity index 100%
rename from package/gcc/5.2.0/903-libstdc++-libgfortran-gthr-workaround-for-musl.patch
rename to package/gcc/5.3.0/903-libstdc++-libgfortran-gthr-workaround-for-musl.patch
diff --git a/package/gcc/5.2.0/904-musl-libc-config.patch b/package/gcc/5.3.0/904-musl-libc-config.patch
similarity index 100%
rename from package/gcc/5.2.0/904-musl-libc-config.patch
rename to package/gcc/5.3.0/904-musl-libc-config.patch
diff --git a/package/gcc/5.2.0/905-add-musl-support-to-gcc.patch b/package/gcc/5.3.0/905-add-musl-support-to-gcc.patch
similarity index 100%
rename from package/gcc/5.2.0/905-add-musl-support-to-gcc.patch
rename to package/gcc/5.3.0/905-add-musl-support-to-gcc.patch
diff --git a/package/gcc/5.2.0/906-mips-musl-support.patch b/package/gcc/5.3.0/906-mips-musl-support.patch
similarity index 100%
rename from package/gcc/5.2.0/906-mips-musl-support.patch
rename to package/gcc/5.3.0/906-mips-musl-support.patch
diff --git a/package/gcc/5.2.0/907-x86-musl-support.patch b/package/gcc/5.3.0/907-x86-musl-support.patch
similarity index 100%
rename from package/gcc/5.2.0/907-x86-musl-support.patch
rename to package/gcc/5.3.0/907-x86-musl-support.patch
diff --git a/package/gcc/5.2.0/908-arm-musl-support.patch b/package/gcc/5.3.0/908-arm-musl-support.patch
similarity index 100%
rename from package/gcc/5.2.0/908-arm-musl-support.patch
rename to package/gcc/5.3.0/908-arm-musl-support.patch
diff --git a/package/gcc/5.2.0/909-aarch64-musl-support.patch b/package/gcc/5.3.0/909-aarch64-musl-support.patch
similarity index 100%
rename from package/gcc/5.2.0/909-aarch64-musl-support.patch
rename to package/gcc/5.3.0/909-aarch64-musl-support.patch
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 78eb50b..57cafa4 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -113,7 +113,7 @@ config BR2_GCC_VERSION
 	default "4.7.4"     if BR2_GCC_VERSION_4_7_X
 	default "4.8.5"     if BR2_GCC_VERSION_4_8_X
 	default "4.9.3"     if BR2_GCC_VERSION_4_9_X
-	default "5.2.0"     if BR2_GCC_VERSION_5_X
+	default "5.3.0"     if BR2_GCC_VERSION_5_X
 	default "arc-2015.06" if BR2_GCC_VERSION_4_8_ARC
 
 config BR2_EXTRA_GCC_CONFIG_OPTIONS
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index 763f19f..0a05151 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -6,7 +6,7 @@ sha512  dfcb737073191e628231031a3571ec77ee760a59377630f4a6e4fdfa66f9ddad39fde47e
 sha512  47fdfeca0c0a624cdec9c4ae47137d056c918d5c386d4b96985bb3c8172aba377cb66cbcc30e80832fd244a7d98f562c20198056915c70cfef0977545073a8ea  gcc-4.8.5.tar.bz2
 # From ftp://gcc.gnu.org/pub/gcc/releases/gcc-4.9.3/sha512.sum
 sha512  9ac57377a6975fc7adac704ec81355262b9f537def6955576753b87715470a20ee6a2a3144a79cc8fcba3443f7b44c7337d79d704b522d053f54f79aa6b442df  gcc-4.9.3.tar.bz2
-# From ftp://gcc.gnu.org/pub/gcc/releases/gcc-5.2.0/sha512.sum
-sha512  844120349ec04465dcea52d8ec747f1cbbc9d76a39fe3d8ef5e6b93614e63d718862d60d0a1c1cbf59ffc7815562287d0a2e536a6b220cebcd0b8de4ba35e715   gcc-5.2.0.tar.bz2
+# From ftp://gcc.gnu.org/pub/gcc/releases/gcc-5.3.0/sha512.sum
+sha512  d619847383405fd389f5a2d7225f97fedb01f81478dbb8339047ccba7561a5c20045ab500a8744bffd19ea51892ce09fc37f862f2cfcb42de0f0f8cd8f8da37a  gcc-5.3.0.tar.bz2
 # No hash for the ARC variant, comes from the github-helper:
 none  xxx  gcc-arc-2015.06.tar.gz
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index b9551e8..77f3c69 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -169,9 +169,15 @@ HOST_GCC_COMMON_DEPENDENCIES += host-mpc
 HOST_GCC_COMMON_CONF_OPTS += --with-mpc=$(HOST_DIR)/usr
 endif
 
+# gcc 5 doesn't need cloog any more, see
+# https://gcc.gnu.org/gcc-5/changes.html
 ifeq ($(BR2_GCC_ENABLE_GRAPHITE),y)
-HOST_GCC_COMMON_DEPENDENCIES += host-isl host-cloog
-HOST_GCC_COMMON_CONF_OPTS += --with-isl=$(HOST_DIR)/usr --with-cloog=$(HOST_DIR)/usr
+HOST_GCC_COMMON_DEPENDENCIES += host-isl
+HOST_GCC_COMMON_CONF_OPTS += --with-isl=$(HOST_DIR)/usr
+ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_5),)
+HOST_GCC_COMMON_DEPENDENCIES += host-cloog
+HOST_GCC_COMMON_CONF_OPTS += --with-cloog=$(HOST_DIR)/usr
+endif
 else
 HOST_GCC_COMMON_CONF_OPTS += --without-isl --without-cloog
 endif
-- 
2.4.10
