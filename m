From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Tue,  3 Mar 2015 09:41:11 +0100
Subject: [Buildroot] [PATCH 1/5] e2fsprogs: change tarball compression to xz
Message-ID: <1425372075-22985-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also update hash file

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/e2fsprogs/e2fsprogs.hash | 2 +-
 package/e2fsprogs/e2fsprogs.mk   | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

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
-- 
1.9.1
