From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Feb 2015 22:52:56 +0100
Subject: [Buildroot] [git commit] btrfs-progs: fix static build with gettext
Message-ID: <20150219215728.548FB8177D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f31b251e101fa4a23afdfb24040fac6c97b7dfdb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gettext needs -pthread. Incidentally this change was also made in the package
Makefile itself for a different reason.

Also, drop -lm to match upstream change.

Fixes:
http://autobuild.buildroot.net/results/a53/a53f31355e955c734010922b47084605e13708ef/
http://autobuild.buildroot.net/results/43d/43deeeda31d9750b37e1f1058c3313a387843bee/

and more.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/btrfs-progs/btrfs-progs.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/btrfs-progs/btrfs-progs.mk b/package/btrfs-progs/btrfs-progs.mk
index c6c36cf..768660d 100644
--- a/package/btrfs-progs/btrfs-progs.mk
+++ b/package/btrfs-progs/btrfs-progs.mk
@@ -18,7 +18,7 @@ BTRFS_PROGS_MAKE_TARGET = static
 BTRFS_PROGS_MAKE_INSTALL_TARGET = install-static
 ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
 # Add -lintl for libuuid
-BTRFS_PROGS_MAKE_FLAGS += lib_LIBS="-luuid -lblkid -lm -lz -llzo2 -L. -lintl"
+BTRFS_PROGS_MAKE_FLAGS += lib_LIBS="-luuid -lblkid -lz -llzo2 -L. -lintl -pthread"
 endif
 else
 BTRFS_PROGS_MAKE_TARGET = all
