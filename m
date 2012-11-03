From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  3 Nov 2012 18:47:49 +0100
Subject: [Buildroot] [PATCH 04/18] Rename BR2_INET_RPC to
	BR2_TOOLCHAIN_HAS_NATIVE_RPC
In-Reply-To: <cover.1351964808.git.thomas.petazzoni@free-electrons.com>
References: <cover.1351964808.git.thomas.petazzoni@free-electrons.com>
Message-ID: <df263474cae4ecb6cf8100906a8093bf2dab2c29.1351964808.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The BR2_INET_RPC has for a long time been a not very descriptive
configuration option name, and with the advent of non-RPC glibc
toolchains and the apparition of libtirpc, we really need to rename it
to something more sensible, BR2_TOOLCHAIN_HAS_NATIVE_RPC.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lmbench/Config.in                  |    4 ++--
 package/netkitbase/Config.in               |    4 ++--
 package/netkittelnet/Config.in             |    4 ++--
 package/nfs-utils/Config.in                |    4 ++--
 package/portmap/Config.in                  |    4 ++--
 package/quota/Config.in                    |    4 ++--
 package/samba/samba.mk                     |    2 +-
 package/xinetd/xinetd.mk                   |    2 +-
 toolchain/helpers.mk                       |    4 ++--
 toolchain/toolchain-buildroot/Config.in.2  |    2 +-
 toolchain/toolchain-common.in              |    2 +-
 toolchain/toolchain-crosstool-ng/Config.in |   10 +++++++---
 toolchain/toolchain-external/Config.in     |   14 +++++++-------
 toolchain/toolchain-external/ext-tool.mk   |    8 ++++----
 14 files changed, 36 insertions(+), 32 deletions(-)

diff --git a/package/lmbench/Config.in b/package/lmbench/Config.in
index c8423d1..70449b6 100644
--- a/package/lmbench/Config.in
+++ b/package/lmbench/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_LMBENCH
 	bool "lmbench"
 	# Uses pmap_set, pmap__unset, pmap_getport, etc.
-	depends on BR2_INET_RPC
+	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	help
 	  LMbench is a suite of simple, portable,
 	  ANSI/C microbenchmarks for UNIX/POSIX.
@@ -9,4 +9,4 @@ config BR2_PACKAGE_LMBENCH
 	  http://sourceforge.net/projects/lmbench/
 
 comment "lmbench requires a toolchain with RPC support"
-	depends on !BR2_INET_RPC
+	depends on !BR2_TOOLCHAIN_HAS_NATIVE_RPC
diff --git a/package/netkitbase/Config.in b/package/netkitbase/Config.in
index 725e500..75bd728 100644
--- a/package/netkitbase/Config.in
+++ b/package/netkitbase/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_NETKITBASE
 	bool "netkitbase"
-	depends on BR2_INET_RPC
+	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	help
 	  Old-style inetd.
 
 	  ftp://ftp.uk.linux.org/pub/linux/Networking/netkit/
 
 comment "netkitbase requires a toolchain with RPC support"
-        depends on !BR2_INET_RPC
+        depends on !BR2_TOOLCHAIN_HAS_NATIVE_RPC
diff --git a/package/netkittelnet/Config.in b/package/netkittelnet/Config.in
index 058d210..10eb022 100644
--- a/package/netkittelnet/Config.in
+++ b/package/netkittelnet/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_NETKITTELNET
 	bool "netkittelnet"
-	depends on BR2_INET_RPC
+	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_PACKAGE_NETKITBASE
 	help
 	  Standard Linux telnet client and server.
@@ -8,4 +8,4 @@ config BR2_PACKAGE_NETKITTELNET
 	  ftp://ftp.uk.linux.org/pub/linux/Networking/netkit/
 
 comment "netkittelnet requires a toolchain with RPC support"
-	depends on !BR2_INET_RPC
+	depends on !BR2_TOOLCHAIN_HAS_NATIVE_RPC
diff --git a/package/nfs-utils/Config.in b/package/nfs-utils/Config.in
index 67d25a7..c87502f 100644
--- a/package/nfs-utils/Config.in
+++ b/package/nfs-utils/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_NFS_UTILS
 	bool "nfs-utils"
-	depends on BR2_INET_RPC
+	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	depends on BR2_LARGEFILE
 	select BR2_PACKAGE_PORTMAP
 	help
@@ -11,7 +11,7 @@ config BR2_PACKAGE_NFS_UTILS
 	  http://sourceforge.net/projects/nfs
 
 comment "nfs-utils requires a toolchain with RPC and LARGEFILE support"
-	depends on !BR2_INET_RPC || !BR2_LARGEFILE
+	depends on !BR2_TOOLCHAIN_HAS_NATIVE_RPC || !BR2_LARGEFILE
 
 menu "NFS utilities selection"
 	depends on BR2_PACKAGE_NFS_UTILS
diff --git a/package/portmap/Config.in b/package/portmap/Config.in
index 5914357..f017cb6 100644
--- a/package/portmap/Config.in
+++ b/package/portmap/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_PORTMAP
 	bool "portmap"
-	depends on BR2_INET_RPC
+	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	help
 	  The standard portmapper for RPC services.
 
 	  http://neil.brown.name/portmap/
 
 comment "portmap requires a toolchain with RPC support"
-	depends on !BR2_INET_RPC
+	depends on !BR2_TOOLCHAIN_HAS_NATIVE_RPC
diff --git a/package/quota/Config.in b/package/quota/Config.in
index 3ad0b8c..a26f91f 100644
--- a/package/quota/Config.in
+++ b/package/quota/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_QUOTA
 	bool "quota"
-	depends on BR2_INET_RPC
+	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	depends on BR2_LARGEFILE
 	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_UTIL_LINUX
@@ -12,4 +12,4 @@ config BR2_PACKAGE_QUOTA
 	  http://sourceforge.net/projects/linuxquota/
 
 comment "quota requires a toolchain with RPC + LARGEFILE + WCHAR support"
-	depends on !(BR2_INET_RPC && BR2_LARGEFILE && BR2_USE_WCHAR)
+	depends on !(BR2_TOOLCHAIN_HAS_NATIVE_RPC && BR2_LARGEFILE && BR2_USE_WCHAR)
diff --git a/package/samba/samba.mk b/package/samba/samba.mk
index 7c06e14..7dd0a1d 100644
--- a/package/samba/samba.mk
+++ b/package/samba/samba.mk
@@ -51,7 +51,7 @@ SAMBA_CONF_OPT = \
 	\
 	--without-cluster-support \
 	--without-dnsupdate \
-	$(if $(BR2_INET_RPC),--with-sys-quotas,--without-sys-quotas) \
+	$(if $(BR2_TOOLCHAIN_HAS_NATIVE_RPC),--with-sys-quotas,--without-sys-quotas) \
 	--without-ads \
 	--without-ldap \
 	--with-included-iniparser \
diff --git a/package/xinetd/xinetd.mk b/package/xinetd/xinetd.mk
index 4fc2de9..a420425 100644
--- a/package/xinetd/xinetd.mk
+++ b/package/xinetd/xinetd.mk
@@ -9,7 +9,7 @@ XINETD_SITE          = http://www.xinetd.org
 XINETD_LICENSE       = xinetd license
 XINETD_LICENSE_FILES = COPYRIGHT
 
-ifneq ($(BR2_INET_RPC),y)
+ifneq ($(BR2_TOOLCHAIN_HAS_NATIVE_RPC),y)
 XINETD_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -DNO_RPC"
 endif
 
diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 497cfff..34e9c17 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -202,7 +202,7 @@ check_glibc = \
 	fi; \
 	$(call check_glibc_feature,BR2_LARGEFILE,Large file support) ;\
 	$(call check_glibc_feature,BR2_INET_IPV6,IPv6 support) ;\
-	$(call check_glibc_feature,BR2_INET_RPC,RPC support) ;\
+	$(call check_glibc_feature,BR2_TOOLCHAIN_HAS_NATIVE_RPC,RPC support) ;\
 	$(call check_glibc_feature,BR2_ENABLE_LOCALE,Locale support) ;\
 	$(call check_glibc_feature,BR2_USE_MMU,MMU support) ;\
 	$(call check_glibc_feature,BR2_USE_WCHAR,Wide char support)
@@ -248,7 +248,7 @@ check_uclibc = \
 	$(call check_uclibc_feature,__ARCH_USE_MMU__,BR2_USE_MMU,$${UCLIBC_CONFIG_FILE},MMU support) ;\
 	$(call check_uclibc_feature,__UCLIBC_HAS_LFS__,BR2_LARGEFILE,$${UCLIBC_CONFIG_FILE},Large file support) ;\
 	$(call check_uclibc_feature,__UCLIBC_HAS_IPV6__,BR2_INET_IPV6,$${UCLIBC_CONFIG_FILE},IPv6 support) ;\
-	$(call check_uclibc_feature,__UCLIBC_HAS_RPC__,BR2_INET_RPC,$${UCLIBC_CONFIG_FILE},RPC support) ;\
+	$(call check_uclibc_feature,__UCLIBC_HAS_RPC__,BR2_TOOLCHAIN_HAS_NATIVE_RPC,$${UCLIBC_CONFIG_FILE},RPC support) ;\
 	$(call check_uclibc_feature,__UCLIBC_HAS_LOCALE__,BR2_ENABLE_LOCALE,$${UCLIBC_CONFIG_FILE},Locale support) ;\
 	$(call check_uclibc_feature,__UCLIBC_HAS_WCHAR__,BR2_USE_WCHAR,$${UCLIBC_CONFIG_FILE},Wide char support) ;\
 	$(call check_uclibc_feature,__UCLIBC_HAS_THREADS__,BR2_TOOLCHAIN_HAS_THREADS,$${UCLIBC_CONFIG_FILE},Thread support) ;\
diff --git a/toolchain/toolchain-buildroot/Config.in.2 b/toolchain/toolchain-buildroot/Config.in.2
index 7580946..956ec2f 100644
--- a/toolchain/toolchain-buildroot/Config.in.2
+++ b/toolchain/toolchain-buildroot/Config.in.2
@@ -20,7 +20,7 @@ config BR2_TOOLCHAIN_BUILDROOT_INET_IPV6
 
 config BR2_TOOLCHAIN_BUILDROOT_INET_RPC
 	bool "Enable RPC support"
-	select BR2_INET_RPC
+	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	help
 	  Enable this option if you want your toolchain to support
 	  RPC (needed for NFS, for example).
diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index 10950ba..4c2a28b 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -11,7 +11,7 @@ config BR2_LARGEFILE
 config BR2_INET_IPV6
 	bool
 
-config BR2_INET_RPC
+config BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	bool
 
 config BR2_USE_WCHAR
diff --git a/toolchain/toolchain-crosstool-ng/Config.in b/toolchain/toolchain-crosstool-ng/Config.in
index 35ea2b1..9cd5ca5 100644
--- a/toolchain/toolchain-crosstool-ng/Config.in
+++ b/toolchain/toolchain-crosstool-ng/Config.in
@@ -14,7 +14,9 @@ config BR2_TOOLCHAIN_CTNG_eglibc
 	bool "eglibc"
 	select BR2_LARGEFILE
 	select BR2_INET_IPV6
-	select BR2_INET_RPC
+	# Our default ct-ng configuration uses eglibc 2.12, which has
+	# native RPC support
+	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_ENABLE_LOCALE
 	select BR2_USE_WCHAR
 
@@ -22,7 +24,9 @@ config BR2_TOOLCHAIN_CTNG_glibc
 	bool "glibc"
 	select BR2_LARGEFILE
 	select BR2_INET_IPV6
-	select BR2_INET_RPC
+	# Our default ct-ng configuration uses glibc 2.9, which has
+	# native RPC support
+	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_ENABLE_LOCALE
 	select BR2_USE_WCHAR
 
@@ -66,7 +70,7 @@ config BR2_TOOLCHAIN_CTNG_uClibc_INET_IPV6
 
 config BR2_TOOLCHAIN_CTNG_uClibc_INET_RPC
 	bool "Enable RPC support"
-	select BR2_INET_RPC
+	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	help
 	  Enable this option if you want your toolchain to support
 	  RPC (needed for NFS, for example).
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 105fb2a..8d3240a 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -450,7 +450,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH2A_201103
 	depends on BR2_sh2a
 	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
 	select BR2_LARGEFILE
-	select BR2_INET_RPC
+	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_USE_WCHAR
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
@@ -467,7 +467,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH2A_201009
 	depends on BR2_sh2a
 	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
 	select BR2_LARGEFILE
-	select BR2_INET_RPC
+	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_USE_WCHAR
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
@@ -528,7 +528,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R1
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_LARGEFILE
 	select BR2_INET_IPV6
-	select BR2_INET_RPC
+	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_USE_WCHAR
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
@@ -543,7 +543,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2011R1
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_LARGEFILE
 	select BR2_INET_IPV6
-	select BR2_INET_RPC
+	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_USE_WCHAR
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
@@ -558,7 +558,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2010RC1
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_LARGEFILE
 	select BR2_INET_IPV6
-	select BR2_INET_RPC
+	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_USE_WCHAR
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
@@ -668,7 +668,7 @@ config BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	bool
 	select BR2_LARGEFILE
 	select BR2_INET_IPV6
-	select BR2_INET_RPC
+	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_TOOLCHAIN_HAS_THREADS
@@ -722,7 +722,7 @@ config BR2_TOOLCHAIN_EXTERNAL_INET_IPV6
 
 config BR2_TOOLCHAIN_EXTERNAL_INET_RPC
 	bool "Toolchain has RPC support?"
-	select BR2_INET_RPC
+	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	help
 	  Select this option if your external toolchain supports
 	  RPC. If you don't know, leave the default value, Buildroot
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index 43d747c..459bc12 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -24,10 +24,10 @@
 #  the Buildroot configuration system knows whether the toolchain
 #  supports RPC, IPv6, locales, large files, etc. Unfortunately, these
 #  things cannot be detected automatically, since the value of these
-#  options (such as BR2_INET_RPC) are needed at configuration time
-#  because these options are used as dependencies for other
-#  options. And at configuration time, we are not able to retrieve the
-#  external toolchain configuration.
+#  options (such as BR2_TOOLCHAIN_HAS_NATIVE_RPC) are needed at
+#  configuration time because these options are used as dependencies
+#  for other options. And at configuration time, we are not able to
+#  retrieve the external toolchain configuration.
 #
 #  3. Copy the libraries needed at runtime to the target directory,
 #  $(TARGET_DIR). Obviously, things such as the C library, the dynamic
-- 
1.7.9.5
