From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 11 Apr 2015 09:17:41 -0300
Subject: [Buildroot] [PATCH 13/14] package/uclibc: drop
	BR2_TOOLCHAIN_BUILDROOT_INET_IPV6
In-Reply-To: <1428754662-27829-1-git-send-email-gustavo@zacarias.com.ar>
References: <1428754662-27829-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1428754662-27829-13-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Kill the option to build the non-IPv6 variant and remove the hidden
option since it's now unused.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/uclibc/Config.in | 4 ----
 package/uclibc/uclibc.mk | 4 ----
 2 files changed, 8 deletions(-)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index 5bd9098..4d464a6 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -86,10 +86,6 @@ config BR2_UCLIBC_CONFIG
 	  See also docs/README in this package.
 	  If unsure, use the default.
 
-config BR2_TOOLCHAIN_BUILDROOT_INET_IPV6
-	bool
-	default y
-
 config BR2_TOOLCHAIN_BUILDROOT_INET_RPC
 	bool "Enable RPC support"
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 72a46d9..07ff8e5 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -212,11 +212,7 @@ endif
 # IPv6
 #
 
-ifeq ($(BR2_TOOLCHAIN_BUILDROOT_INET_IPV6),y)
 UCLIBC_IPV6_CONFIG = $(call KCONFIG_ENABLE_OPT,UCLIBC_HAS_IPV6,$(@D)/.config)
-else
-UCLIBC_IPV6_CONFIG = $(call KCONFIG_DISABLE_OPT,UCLIBC_HAS_IPV6,$(@D)/.config)
-endif
 
 #
 # RPC
-- 
2.0.5
