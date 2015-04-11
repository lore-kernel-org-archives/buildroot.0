From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 11 Apr 2015 09:17:32 -0300
Subject: [Buildroot] [PATCH 04/14] toolchain: remove IPv6 selects
In-Reply-To: <1428754662-27829-1-git-send-email-gustavo@zacarias.com.ar>
References: <1428754662-27829-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1428754662-27829-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There's no need for toolchains or the user to declare IPv6 support since
it's now mandatory.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 toolchain/Config.in                    |  2 --
 toolchain/toolchain-external/Config.in | 11 -----------
 2 files changed, 13 deletions(-)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 32a00a9..a851ce4 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -9,7 +9,6 @@ config BR2_TOOLCHAIN
 # Should be selected for glibc or eglibc
 config BR2_TOOLCHAIN_USES_GLIBC
 	bool
-	select BR2_INET_IPV6
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_TOOLCHAIN_HAS_THREADS
@@ -23,7 +22,6 @@ config BR2_TOOLCHAIN_USES_UCLIBC
 
 config BR2_TOOLCHAIN_USES_MUSL
 	bool
-	select BR2_INET_IPV6
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_TOOLCHAIN_HAS_THREADS
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 3b7f40b..a8949c5 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -780,7 +780,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_INET_IPV6
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_USE_WCHAR
 	select BR2_TOOLCHAIN_HAS_THREADS
@@ -797,7 +796,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_INET_IPV6
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_USE_WCHAR
 	select BR2_TOOLCHAIN_HAS_THREADS
@@ -814,7 +812,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_INET_IPV6
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_USE_WCHAR
 	select BR2_TOOLCHAIN_HAS_THREADS
@@ -1145,14 +1142,6 @@ endchoice
 
 if BR2_TOOLCHAIN_EXTERNAL_CUSTOM_UCLIBC
 
-config BR2_TOOLCHAIN_EXTERNAL_INET_IPV6
-	bool "Toolchain has IPv6 support?"
-	select BR2_INET_IPV6
-	help
-	  Select this option if your external toolchain supports
-	  IPv6. If you don't know, leave the default value, Buildroot
-	  will tell you if it's correct or not.
-
 config BR2_TOOLCHAIN_EXTERNAL_WCHAR
 	bool "Toolchain has WCHAR support?"
 	select BR2_USE_WCHAR
-- 
2.0.5
