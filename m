From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 25 Jan 2021 22:56:45 +0100
Subject: [Buildroot] [git commit] package/xfsprogs: bump version to 5.10.0
Message-ID: <20210125213804.A415780288@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5c216c043b7732bdd78723e129221c1468a75581
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://www.spinics.net/lists/linux-xfs/msg47553.html

Added dependency to inih:
https://www.spinics.net/lists/linux-xfs/msg47554.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/xfsprogs/Config.in     | 1 +
 package/xfsprogs/xfsprogs.hash | 2 +-
 package/xfsprogs/xfsprogs.mk   | 4 ++--
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/xfsprogs/Config.in b/package/xfsprogs/Config.in
index 024cde9fe6..b8e07cc83d 100644
--- a/package/xfsprogs/Config.in
+++ b/package/xfsprogs/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_XFSPROGS
 	bool "xfsprogs"
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_INIH
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
diff --git a/package/xfsprogs/xfsprogs.hash b/package/xfsprogs/xfsprogs.hash
index 79f953b33c..b379839e7e 100644
--- a/package/xfsprogs/xfsprogs.hash
+++ b/package/xfsprogs/xfsprogs.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/utils/fs/xfs/xfsprogs/sha256sums.asc
-sha256  8ef46ed9e6bb927f407f541dc4324857c908ddf1374265edc910d23724048c6b  xfsprogs-5.8.0.tar.xz
+sha256  e04017e46d43e4d54b9a560fd7cea922520f8f6ef882404969d20cd4e5c790e9  xfsprogs-5.10.0.tar.xz
 
 # Hash for license files
 sha256  f6b78c087c3ebdf0f3c13415070dd480a3f35d8fc76f3d02180a407c1c812f79  LICENSES/GPL-2.0
diff --git a/package/xfsprogs/xfsprogs.mk b/package/xfsprogs/xfsprogs.mk
index bfaf9fd712..71d02278e9 100644
--- a/package/xfsprogs/xfsprogs.mk
+++ b/package/xfsprogs/xfsprogs.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################
 
-XFSPROGS_VERSION = 5.8.0
+XFSPROGS_VERSION = 5.10.0
 XFSPROGS_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/fs/xfs/xfsprogs
 XFSPROGS_SOURCE = xfsprogs-$(XFSPROGS_VERSION).tar.xz
 XFSPROGS_LICENSE = GPL-2.0, GPL-2.0+, LGPL-2.1 (libhandle, few headers)
 XFSPROGS_LICENSE_FILES = LICENSES/GPL-2.0 LICENSES/LGPL-2.1
 
-XFSPROGS_DEPENDENCIES = util-linux
+XFSPROGS_DEPENDENCIES = inih util-linux
 
 XFSPROGS_CONF_ENV = ac_cv_header_aio_h=yes ac_cv_lib_rt_lio_listio=yes PLATFORM="linux"
 XFSPROGS_CONF_OPTS = \
