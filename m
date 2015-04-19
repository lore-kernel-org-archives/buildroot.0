From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 19 Apr 2015 09:39:53 -0300
Subject: [Buildroot] [PATCH v2 02/11] package/uclibc: default to Y for IPv6
In-Reply-To: <1429447202-13722-1-git-send-email-gustavo@zacarias.com.ar>
References: <1429447202-13722-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1429447202-13722-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove the option to disable IPv6 support in uclibc and associated
logic.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/uclibc/Config.in | 6 ++----
 package/uclibc/uclibc.mk | 4 ----
 2 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index fdf8351..c4b4a5c 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -87,11 +87,9 @@ config BR2_UCLIBC_CONFIG
 	  If unsure, use the default.
 
 config BR2_TOOLCHAIN_BUILDROOT_INET_IPV6
-	bool "Enable IPv6 support"
+	bool
 	select BR2_INET_IPV6
-	help
-	  Enable this option if you want your toolchain to support
-	  IPv6.
+	default y
 
 config BR2_TOOLCHAIN_BUILDROOT_INET_RPC
 	bool "Enable RPC support"
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
