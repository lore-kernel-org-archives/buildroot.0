From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 15 May 2012 23:15:50 +0200
Subject: [Buildroot] [PATCH] toolchain/crosstool-NG: disable decimal floats
Message-ID: <1337116550-12175-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Decimal floats were introduced circa gcc-4.2 or -4.3, and requires
the floating-point environement fenv.h in the C library.

The uClibc .config file used by crosstool-NG to build uClibc is the
same as used by the internal buildroot mechanism, and explcitly
disables fenv support.

The quick workaround is to simply disable decimal floats in all
crosstool-NG config files.

In the long run, it might be better to check this situation, and/or
add code and/or options in crosstool-NG to handle this (but it is
much more involved, and this workaround is sane).

Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
CC: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 .../crosstool-ng.config-eglibc                     |    4 ++--
 .../crosstool-ng.config-glibc                      |    4 ++--
 .../crosstool-ng.config-uClibc                     |    4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.config-eglibc b/toolchain/toolchain-crosstool-ng/crosstool-ng.config-eglibc
index c1ab679..4488d02 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.config-eglibc
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.config-eglibc
@@ -273,8 +273,8 @@ CT_CC_LANG_CXX=y
 # gcc other options
 #
 CT_CC_ENABLE_CXX_FLAGS=""
-CT_CC_CORE_EXTRA_CONFIG_ARRAY=""
-CT_CC_EXTRA_CONFIG_ARRAY=""
+CT_CC_CORE_EXTRA_CONFIG_ARRAY="--disable-decimal-float"
+CT_CC_EXTRA_CONFIG_ARRAY="--disable-decimal-float"
 CT_CC_STATIC_LIBSTDCXX=y
 
 #
diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.config-glibc b/toolchain/toolchain-crosstool-ng/crosstool-ng.config-glibc
index 4a555c7..46a636b 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.config-glibc
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.config-glibc
@@ -273,8 +273,8 @@ CT_CC_LANG_CXX=y
 # gcc other options
 #
 CT_CC_ENABLE_CXX_FLAGS=""
-CT_CC_CORE_EXTRA_CONFIG_ARRAY=""
-CT_CC_EXTRA_CONFIG_ARRAY=""
+CT_CC_CORE_EXTRA_CONFIG_ARRAY="--disable-decimal-float"
+CT_CC_EXTRA_CONFIG_ARRAY="--disable-decimal-float"
 CT_CC_STATIC_LIBSTDCXX=y
 
 #
diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.config-uClibc b/toolchain/toolchain-crosstool-ng/crosstool-ng.config-uClibc
index 0e442f0..437f455 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.config-uClibc
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.config-uClibc
@@ -272,8 +272,8 @@ CT_CC_LANG_CXX=y
 # gcc other options
 #
 CT_CC_ENABLE_CXX_FLAGS=""
-CT_CC_CORE_EXTRA_CONFIG_ARRAY=""
-CT_CC_EXTRA_CONFIG_ARRAY=""
+CT_CC_CORE_EXTRA_CONFIG_ARRAY="--disable-decimal-float"
+CT_CC_EXTRA_CONFIG_ARRAY="--disable-decimal-float"
 CT_CC_STATIC_LIBSTDCXX=y
 
 #
-- 
1.7.2.5
