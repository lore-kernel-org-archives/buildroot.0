From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Dec 2017 23:09:13 +0100
Subject: [Buildroot] [git commit] Revert "trinity: add optional dependency
 on btrfs-progs"
Message-ID: <20171203220901.CBB747FE80@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=91bbfe34834ef9ec4dd80607fe218a198d5df4b6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit a81782a3f5dc08bb8d740acb1e6d361022f62f96.

The trinity package does not use btrfs-progs, only btrfs kernel headers.

Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/trinity/trinity.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/trinity/trinity.mk b/package/trinity/trinity.mk
index 61565d0..b75c469 100644
--- a/package/trinity/trinity.mk
+++ b/package/trinity/trinity.mk
@@ -10,10 +10,6 @@ TRINITY_SOURCE = trinity-$(TRINITY_VERSION).tar.xz
 TRINITY_LICENSE = GPL-2.0
 TRINITY_LICENSE_FILES = COPYING
 
-ifeq ($(BR2_PACKAGE_BTRFS_PROGS),y)
-TRINITY_DEPENDENCIES += btrfs-progs
-endif
-
 define TRINITY_CONFIGURE_CMDS
 	(cd $(@D); $(TARGET_CONFIGURE_OPTS) ./configure)
 endef
