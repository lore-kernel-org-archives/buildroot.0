From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Apr 2015 22:59:20 +0200
Subject: [Buildroot] [git commit] package/uclibc: default to Y for IPv6
Message-ID: <20150422210724.CEA2C81D89@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5cb8996e08a7b3014e3fbbf253c60140cf6e7212
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove the option to disable IPv6 support in uclibc and associated
logic.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/uclibc/Config.in |    6 ++----
 package/uclibc/uclibc.mk |    4 ----
 2 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index a48e2ec..51a1668 100644
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
