From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Oct 2019 08:24:07 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/e2fsprogs: bump
 version to 1.45.2
Message-ID: <20191001062217.A40FF8385D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=10a6504eb7b2df54bbeffc70b0bf38b8c6031b48
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Release notes:
http://e2fsprogs.sourceforge.net/e2fsprogs-release.html#1.45.2

Disabled crond support for host build.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 92ebd24be9708a28e7d15f27080f847f371d0558)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/e2fsprogs/e2fsprogs.hash | 4 ++--
 package/e2fsprogs/e2fsprogs.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/e2fsprogs/e2fsprogs.hash b/package/e2fsprogs/e2fsprogs.hash
index e2790336e7..c7d57a5f82 100644
--- a/package/e2fsprogs/e2fsprogs.hash
+++ b/package/e2fsprogs/e2fsprogs.hash
@@ -1,5 +1,5 @@
-# From https://www.kernel.org/pub/linux/kernel/people/tytso/e2fsprogs/v1.44.6/sha256sums.asc
-sha256 883ae736d5a1cd954ff40a11a6743cd5913322a7685b10c8ed757eab5298ee90  e2fsprogs-1.44.6.tar.xz
+# From https://www.kernel.org/pub/linux/kernel/people/tytso/e2fsprogs/v1.45.2/sha256sums.asc
+sha256 4952c9ae91e36d762e13cc5b9e8f7eeb5453e4aee4cd9b7402e73f2d4e65e009  e2fsprogs-1.45.2.tar.xz
 # Locally calculated
 sha256 5da5ef153e559c1d990d4c3eedbedd4442db892d37eae1f35fff069de8ec9020  NOTICE
 sha256 032989b508f1a72ebee5b3417e55d06d473f9ee203e45ab11864a7e49cdec63d  lib/ss/mit-sipb-copyright.h
diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index 50397097d7..a78417e7e7 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-E2FSPROGS_VERSION = 1.44.6
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
