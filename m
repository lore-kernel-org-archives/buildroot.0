From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 17 Apr 2020 13:17:30 +0200
Subject: [Buildroot] [git commit] package/sysrepo: drop unneeded dependencies
Message-ID: <20200417110610.C45438EE42@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=20cc566e5ad07c92537593e27f850e695701deac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The following dependencies are no longer needed:
- libev
- libavl
- protobuf-c

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/sysrepo/Config.in  | 5 -----
 package/sysrepo/sysrepo.mk | 4 ++--
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/package/sysrepo/Config.in b/package/sysrepo/Config.in
index 31f817faa1..8de141efc2 100644
--- a/package/sysrepo/Config.in
+++ b/package/sysrepo/Config.in
@@ -5,13 +5,9 @@ config BR2_PACKAGE_SYSREPO
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86" # host-protobuf
-	select BR2_PACKAGE_LIBAVL
-	select BR2_PACKAGE_LIBEV
 	select BR2_PACKAGE_LIBYANG
 	select BR2_PACKAGE_PCRE
 	select BR2_PACKAGE_PCRE_UCP
-	select BR2_PACKAGE_PROTOBUF_C
 	help
 	  Sysrepo is an YANG-based configuration and operational state
 	  data store for Unix/Linux applications.
@@ -31,4 +27,3 @@ comment "sysrepo needs a toolchain w/ C++, NPTL, dynamic library, gcc >= 4.8"
 	depends on BR2_USE_MMU
 	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP \
 		|| !BR2_TOOLCHAIN_HAS_THREADS_NPTL
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
diff --git a/package/sysrepo/sysrepo.mk b/package/sysrepo/sysrepo.mk
index 0ca4d2591e..67290dad4f 100644
--- a/package/sysrepo/sysrepo.mk
+++ b/package/sysrepo/sysrepo.mk
@@ -9,8 +9,8 @@ SYSREPO_SITE = $(call github,sysrepo,sysrepo,v$(SYSREPO_VERSION))
 SYSREPO_INSTALL_STAGING = YES
 SYSREPO_LICENSE = Apache-2.0
 SYSREPO_LICENSE_FILES = LICENSE
-SYSREPO_DEPENDENCIES = libev libavl libyang pcre protobuf-c host-sysrepo
-HOST_SYSREPO_DEPENDENCIES = host-libev host-libavl host-libyang host-pcre host-protobuf-c
+SYSREPO_DEPENDENCIES = libyang pcre host-sysrepo
+HOST_SYSREPO_DEPENDENCIES = host-libyang host-pcre
 
 SYSREPO_CONF_OPTS = \
 	-DCMAKE_BUILD_TYPE=Release \
