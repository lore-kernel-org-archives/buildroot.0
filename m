From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Mar 2015 22:51:36 +0100
Subject: [Buildroot] [git commit] e2fsprogs: change tarball compression to xz
Message-ID: <20150304215153.E0D5B80F41@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ad5d9cb3d4e19dd85654639d45ce7c36fee30484
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also update hash file

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/e2fsprogs/e2fsprogs.hash |    2 +-
 package/e2fsprogs/e2fsprogs.mk   |    1 +
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/e2fsprogs/e2fsprogs.hash b/package/e2fsprogs/e2fsprogs.hash
index 89c3fd8..8384296 100644
--- a/package/e2fsprogs/e2fsprogs.hash
+++ b/package/e2fsprogs/e2fsprogs.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/kernel/people/tytso/e2fsprogs/v1.42.12/sha256sums.asc
-sha256	8c790e8708dbb7c766c88c8152c2bf2d0628937e9dd6571eef8f59080d0fb58a	e2fsprogs-1.42.12.tar.gz
+sha256 6dadcd3b759195150d20154ab9d6516e3b3cbb35d66d461f55ae94a2854e7de8 e2fsprogs-1.42.12.tar.xz
diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index b4f0950..fd77638 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -5,6 +5,7 @@
 ################################################################################
 
 E2FSPROGS_VERSION = 1.42.12
+E2FSPROGS_SOURCE = e2fsprogs-$(E2FSPROGS_VERSION).tar.xz
 E2FSPROGS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/people/tytso/e2fsprogs/v$(E2FSPROGS_VERSION)
 E2FSPROGS_LICENSE = GPLv2, libuuid BSD-3c, libss and libet MIT-like with advertising clause
 E2FSPROGS_LICENSE_FILES = COPYING lib/uuid/COPYING lib/ss/mit-sipb-copyright.h lib/et/internal.h
