From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 02 Aug 2012 19:52:43 -0000
Subject: [Buildroot] [git commit branch/next] toolchain/crosstool-NG:
	disable decimal floats
Message-ID: <20120802195232.3D18C96AE7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cb30e130519fcb50e1a2e0d7a02aa628e52ed24c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../crosstool-ng.config-eglibc                     |    4 ++--
 .../crosstool-ng.config-glibc                      |    4 ++--
 .../crosstool-ng.config-uClibc                     |    4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.config-eglibc b/toolchain/toolchain-crosstool-ng/crosstool-ng.config-eglibc
index cbad52a..58cdff2 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.config-eglibc
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.config-eglibc
@@ -294,8 +294,8 @@ CT_CC_LANG_CXX=y
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
index e57a91d..db724ab 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.config-glibc
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.config-glibc
@@ -294,8 +294,8 @@ CT_CC_LANG_CXX=y
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
index c115096..5f1ee7e 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.config-uClibc
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.config-uClibc
@@ -293,8 +293,8 @@ CT_CC_LANG_CXX=y
 # gcc other options
 #
 CT_CC_ENABLE_CXX_FLAGS=""
-CT_CC_CORE_EXTRA_CONFIG_ARRAY=""
-CT_CC_EXTRA_CONFIG_ARRAY=""
+CT_CC_CORE_EXTRA_CONFIG_ARRAY="--disable-decimal-float"
+CT_CC_EXTRA_CONFIG_ARRAY="--disable-decimal-float"
 CT_CC_STATIC_LIBSTDCXX=y
 
 #
