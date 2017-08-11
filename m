From: Dagg Stompler <daggs@gmx.com>
Date: Fri, 11 Aug 2017 14:05:49 +0300
Subject: [Buildroot] [PATCH v2] package/e2fsprogs: version bump for bug fix.
Message-ID: <20170811110549.6278-1-daggs@gmx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

when compiling host e2fsprogs on my system (gentoo amd64, glibc 2.25) the build fails with this error:
../lib/libext2fs.a(ismounted.o): In function `check_mntent_file':
ismounted.c:(.text+0x224): undefined reference to `major'

bumping versions fixes the issue (actual commit id 3fb715b55426875902dfef3056b2cf7335953178).

Signed-off-by: Dagg Stompler <daggs@gmx.com>
---

v1 -> v2:
   add commit reference (Baruch Siach)

 package/e2fsprogs/e2fsprogs.hash | 4 ++--
 package/e2fsprogs/e2fsprogs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/e2fsprogs/e2fsprogs.hash b/package/e2fsprogs/e2fsprogs.hash
index cf41e3a3d5..ac420dd825 100644
--- a/package/e2fsprogs/e2fsprogs.hash
+++ b/package/e2fsprogs/e2fsprogs.hash
@@ -1,2 +1,2 @@
-# From https://www.kernel.org/pub/linux/kernel/people/tytso/e2fsprogs/v1.43.4/sha256sums.asc
-sha256 54b3f21123a531a6a536b9cdcc21344b0122a72790dbe4dacc98e64db25e4a24  e2fsprogs-1.43.4.tar.xz
+# From https://www.kernel.org/pub/linux/kernel/people/tytso/e2fsprogs/v1.43.5/sha256sums.asc
+sha256 261f3d9ade383fbf032a19140c9c25e998cc0f71a1ae686614fb3ae0eb955a17  e2fsprogs-1.43.5.tar.xz
diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index 75e9213351..7627a1f589 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-E2FSPROGS_VERSION = 1.43.4
+E2FSPROGS_VERSION = 1.43.5
 E2FSPROGS_SOURCE = e2fsprogs-$(E2FSPROGS_VERSION).tar.xz
 E2FSPROGS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/people/tytso/e2fsprogs/v$(E2FSPROGS_VERSION)
 E2FSPROGS_LICENSE = GPL-2.0, MIT-like with advertising clause (libss and libet)
-- 
2.14.1
