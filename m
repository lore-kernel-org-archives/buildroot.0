From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 17 Mar 2015 13:48:38 -0300
Subject: [Buildroot] [PATCH v2 14/15] package/uclibc: drop
	BR2_TOOLCHAIN_BUILDROOT_LARGEFILE
In-Reply-To: <1426610919-11901-1-git-send-email-gustavo@zacarias.com.ar>
References: <1426610919-11901-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1426610919-11901-15-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Kill the option to build the non-largefile variant and remove the hidden
option since it's now unused.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/uclibc/Config.in | 5 -----
 package/uclibc/uclibc.mk | 7 -------
 2 files changed, 12 deletions(-)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index a180227..58c6884 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -89,11 +89,6 @@ config BR2_UCLIBC_CONFIG
 	  See also docs/README in this package.
 	  If unsure, use the default.
 
-config BR2_TOOLCHAIN_BUILDROOT_LARGEFILE
-	bool
-	select BR2_LARGEFILE
-	default y
-
 config BR2_TOOLCHAIN_BUILDROOT_INET_IPV6
 	bool "Enable IPv6 support"
 	select BR2_INET_IPV6
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 3a8f191..13994ad 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -229,16 +229,9 @@ endif
 # Largefile
 #
 
-ifeq ($(BR2_TOOLCHAIN_BUILDROOT_LARGEFILE),y)
 define UCLIBC_LARGEFILE_CONFIG
 	$(call KCONFIG_ENABLE_OPT,UCLIBC_HAS_LFS,$(@D)/.config)
 endef
-else
-define UCLIBC_LARGEFILE_CONFIG
-	$(call KCONFIG_DISABLE_OPT,UCLIBC_HAS_LFS,$(@D)/.config)
-	$(call KCONFIG_DISABLE_OPT,UCLIBC_HAS_FOPEN_LARGEFILE_MODE,$(@D)/.config)
-endef
-endif
 
 #
 # MMU
-- 
2.0.5
