From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 4 Jul 2019 08:22:51 +0200
Subject: [Buildroot] [git commit] package/e2fsprogs: bump version to 1.45.2
Message-ID: <20190704062422.81EE08A359@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=92ebd24be9708a28e7d15f27080f847f371d0558
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
http://e2fsprogs.sourceforge.net/e2fsprogs-release.html#1.45.2

Disabled crond support for host build.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/e2fsprogs/e2fsprogs.hash | 4 ++--
 package/e2fsprogs/e2fsprogs.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/e2fsprogs/e2fsprogs.hash b/package/e2fsprogs/e2fsprogs.hash
index 7619e26275..c7d57a5f82 100644
--- a/package/e2fsprogs/e2fsprogs.hash
+++ b/package/e2fsprogs/e2fsprogs.hash
@@ -1,5 +1,5 @@
-# From https://www.kernel.org/pub/linux/kernel/people/tytso/e2fsprogs/v1.44.5/sha256sums.asc
-sha256 ba5eb3069d69160d96818bb9700de9ab5a8458d9add1fd85d427c0000d34c5b9  e2fsprogs-1.44.5.tar.xz
+# From https://www.kernel.org/pub/linux/kernel/people/tytso/e2fsprogs/v1.45.2/sha256sums.asc
+sha256 4952c9ae91e36d762e13cc5b9e8f7eeb5453e4aee4cd9b7402e73f2d4e65e009  e2fsprogs-1.45.2.tar.xz
 # Locally calculated
 sha256 5da5ef153e559c1d990d4c3eedbedd4442db892d37eae1f35fff069de8ec9020  NOTICE
 sha256 032989b508f1a72ebee5b3417e55d06d473f9ee203e45ab11864a7e49cdec63d  lib/ss/mit-sipb-copyright.h
diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index f5785ab4f2..a78417e7e7 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-E2FSPROGS_VERSION = 1.44.5
+E2FSPROGS_VERSION = 1.45.2
 E2FSPROGS_SOURCE = e2fsprogs-$(E2FSPROGS_VERSION).tar.xz
 E2FSPROGS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/people/tytso/e2fsprogs/v$(E2FSPROGS_VERSION)
 E2FSPROGS_LICENSE = GPL-2.0, MIT-like with advertising clause (libss and libet)
@@ -28,7 +28,8 @@ HOST_E2FSPROGS_CONF_OPTS = \
 	--disable-libuuid \
 	--disable-testio-debug \
 	--enable-symlink-install \
-	--enable-elf-shlibs
+	--enable-elf-shlibs \
+	--with-crond-dir=no
 
 # Set the binary directories to "/bin" and "/sbin", as busybox does,
 # so that we do not end up with two versions of e2fs tools.
