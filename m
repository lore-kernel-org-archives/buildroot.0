From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Apr 2015 22:42:47 +0200
Subject: [Buildroot] [git commit] toolchain: remove LARGEFILE selects
Message-ID: <20150401205855.C81D97F911@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=152d6414cad38a5bec1756a7b8d3b32487812492
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There's no need for toolchains or the user to declare largefile support
since it's now mandatory.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/Config.in                    |    2 --
 toolchain/toolchain-external/Config.in |   14 --------------
 2 files changed, 0 insertions(+), 16 deletions(-)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index efb77f8..32a00a9 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -9,7 +9,6 @@ config BR2_TOOLCHAIN
 # Should be selected for glibc or eglibc
 config BR2_TOOLCHAIN_USES_GLIBC
 	bool
-	select BR2_LARGEFILE
 	select BR2_INET_IPV6
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -24,7 +23,6 @@ config BR2_TOOLCHAIN_USES_UCLIBC
 
 config BR2_TOOLCHAIN_USES_MUSL
 	bool
-	select BR2_LARGEFILE
 	select BR2_INET_IPV6
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 8b0f09b..3b7f40b 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -635,7 +635,6 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH2A_201103
 	depends on BR2_sh2a
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
-	select BR2_LARGEFILE
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_USE_WCHAR
 	select BR2_TOOLCHAIN_HAS_THREADS
@@ -655,7 +654,6 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH2A_201009
 	depends on BR2_sh2a
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
-	select BR2_LARGEFILE
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_USE_WCHAR
 	select BR2_TOOLCHAIN_HAS_THREADS
@@ -782,7 +780,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_LARGEFILE
 	select BR2_INET_IPV6
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_USE_WCHAR
@@ -800,7 +797,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_LARGEFILE
 	select BR2_INET_IPV6
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_USE_WCHAR
@@ -818,7 +814,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_LARGEFILE
 	select BR2_INET_IPV6
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_USE_WCHAR
@@ -885,7 +880,6 @@ config BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_2014_12
 	depends on BR2_HOSTARCH = "x86_64"
 	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_LARGEFILE
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_ENABLE_LOCALE
 	select BR2_USE_WCHAR
@@ -1151,14 +1145,6 @@ endchoice
 
 if BR2_TOOLCHAIN_EXTERNAL_CUSTOM_UCLIBC
 
-config BR2_TOOLCHAIN_EXTERNAL_LARGEFILE
-	bool "Toolchain has large file support?"
-	select BR2_LARGEFILE
-	help
-	  Select this option if your external toolchain supports
-	  largefile. If you don't know, leave the default value,
-	  Buildroot will tell you if it's correct or not.
-
 config BR2_TOOLCHAIN_EXTERNAL_INET_IPV6
 	bool "Toolchain has IPv6 support?"
 	select BR2_INET_IPV6
