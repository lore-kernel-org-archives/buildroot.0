From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 8 Dec 2019 22:56:12 +0100
Subject: [Buildroot] [git commit] package/sysrepo: libnetconf2 is not needed
Message-ID: <20191208214757.45A1B82901@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dd271b031d5994977483c1adcdd0a393a13d6234
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The libnetconf2 library is a dependency of Netopeer2. Sysrepo does not
have a NETCONF server or a NETCONF client, so it does not use this
library.

Signed-off-by: Jan Kundr??t <jan.kundrat@cesnet.cz>
Acked-by: Heiko Thiery <heiko.thiery@kontron.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sysrepo/Config.in  | 3 +--
 package/sysrepo/sysrepo.mk | 4 ++--
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/sysrepo/Config.in b/package/sysrepo/Config.in
index 18a09e0c57..31f817faa1 100644
--- a/package/sysrepo/Config.in
+++ b/package/sysrepo/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_SYSREPO
 	bool "sysrepo"
-	depends on BR2_USE_MMU # libnetconf2
+	depends on BR2_USE_MMU
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
@@ -8,7 +8,6 @@ config BR2_PACKAGE_SYSREPO
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86" # host-protobuf
 	select BR2_PACKAGE_LIBAVL
 	select BR2_PACKAGE_LIBEV
-	select BR2_PACKAGE_LIBNETCONF2
 	select BR2_PACKAGE_LIBYANG
 	select BR2_PACKAGE_PCRE
 	select BR2_PACKAGE_PCRE_UCP
diff --git a/package/sysrepo/sysrepo.mk b/package/sysrepo/sysrepo.mk
index 49c908d62d..216e517526 100644
--- a/package/sysrepo/sysrepo.mk
+++ b/package/sysrepo/sysrepo.mk
@@ -9,8 +9,8 @@ SYSREPO_SITE = $(call github,sysrepo,sysrepo,v$(SYSREPO_VERSION))
 SYSREPO_INSTALL_STAGING = YES
 SYSREPO_LICENSE = Apache-2.0
 SYSREPO_LICENSE_FILES = LICENSE
-SYSREPO_DEPENDENCIES = libev libnetconf2 libavl libyang pcre protobuf-c host-sysrepo
-HOST_SYSREPO_DEPENDENCIES = host-libev host-libnetconf2 host-libavl host-libyang host-pcre host-protobuf-c
+SYSREPO_DEPENDENCIES = libev libavl libyang pcre protobuf-c host-sysrepo
+HOST_SYSREPO_DEPENDENCIES = host-libev host-libavl host-libyang host-pcre host-protobuf-c
 
 SYSREPO_CONF_OPTS = \
 	-DIS_DEVELOPER_CONFIGURATION=OFF \
