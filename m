From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Jul 2015 14:02:30 +0200
Subject: [Buildroot] [git commit] btrfs-progs: drop dependency on acl and
	attr
Message-ID: <20150706120241.2E17081784@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=16339adfcc1274df41772f0764f0a6471112a721
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

btrfs-progs does not depend on libacl since version v4.0.1:

  ab5984f btrfs-progs: convert: drop dependency on sys/acl.h
  https://git.kernel.org/cgit/linux/kernel/git/kdave/btrfs-progs.git/commit/?id=ab5984ff6cce6f12063720b6dafc1afcd6606853

Moreover, btrfs-progs does not depend on attr since version v3.14:

  b5fe148 btrfs-progs: include <sys/xattr.h> instead of <attr/xattr.h>
  https://git.kernel.org/cgit/linux/kernel/git/kdave/btrfs-progs.git/commit/?id=b5fe148715ea295e2b951ec6c90409b9d81978d8

Signed-off-by: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/btrfs-progs/Config.in      |    2 --
 package/btrfs-progs/btrfs-progs.mk |    2 +-
 2 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/package/btrfs-progs/Config.in b/package/btrfs-progs/Config.in
index 9a2bd6c..dc0fa81 100644
--- a/package/btrfs-progs/Config.in
+++ b/package/btrfs-progs/Config.in
@@ -3,8 +3,6 @@ config BR2_PACKAGE_BTRFS_PROGS
 	depends on BR2_USE_WCHAR # util-linux
 	depends on BR2_USE_MMU # util-linux
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	select BR2_PACKAGE_ACL
-	select BR2_PACKAGE_ATTR
 	select BR2_PACKAGE_E2FSPROGS
 	select BR2_PACKAGE_LZO
 	select BR2_PACKAGE_UTIL_LINUX
diff --git a/package/btrfs-progs/btrfs-progs.mk b/package/btrfs-progs/btrfs-progs.mk
index 0190baa..b8833a7 100644
--- a/package/btrfs-progs/btrfs-progs.mk
+++ b/package/btrfs-progs/btrfs-progs.mk
@@ -7,7 +7,7 @@
 BTRFS_PROGS_VERSION = 4.1
 BTRFS_PROGS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/people/kdave/btrfs-progs
 BTRFS_PROGS_SOURCE = btrfs-progs-v$(BTRFS_PROGS_VERSION).tar.xz
-BTRFS_PROGS_DEPENDENCIES = host-pkgconf acl attr e2fsprogs lzo util-linux zlib
+BTRFS_PROGS_DEPENDENCIES = host-pkgconf e2fsprogs lzo util-linux zlib
 BTRFS_PROGS_CONF_OPTS = --disable-backtrace
 BTRFS_PROGS_LICENSE = GPLv2
 BTRFS_PROGS_LICENSE_FILES = COPYING
