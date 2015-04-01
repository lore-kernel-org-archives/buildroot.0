From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Apr 2015 22:53:18 +0200
Subject: [Buildroot] [git commit] package/uclibc: drop
	BR2_TOOLCHAIN_BUILDROOT_LARGEFILE
Message-ID: <20150401205856.6028781918@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f526c75f3994acdd58c80afc15aba0789917502f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Kill the option to build the non-largefile variant and remove the hidden
option since it's now unused.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/uclibc/Config.in |    5 -----
 package/uclibc/uclibc.mk |    7 -------
 2 files changed, 0 insertions(+), 12 deletions(-)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index e440559..fdf8351 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -86,11 +86,6 @@ config BR2_UCLIBC_CONFIG
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
index 2b5a642..72a46d9 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -190,16 +190,9 @@ endif
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
