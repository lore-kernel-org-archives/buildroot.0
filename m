From: Baruch Siach <baruch@tkos.co.il>
Date: Sun,  3 Dec 2017 21:34:39 +0200
Subject: [Buildroot] [PATCH 2/2] Revert "trinity: add optional dependency on
 btrfs-progs"
In-Reply-To: <6ad09d50510868507c76a49ae5b0df26dc24f46e.1512329679.git.baruch@tkos.co.il>
References: <6ad09d50510868507c76a49ae5b0df26dc24f46e.1512329679.git.baruch@tkos.co.il>
Message-ID: <56865396f4479cc462155a8662fcbadc0caaa17e.1512329679.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This reverts commit a81782a3f5dc08bb8d740acb1e6d361022f62f96.

The trinity package does not use btrfs-progs, only btrfs kernel headers.

Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/trinity/trinity.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/trinity/trinity.mk b/package/trinity/trinity.mk
index 61565d073d1a..b75c46943efe 100644
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
-- 
2.15.0
