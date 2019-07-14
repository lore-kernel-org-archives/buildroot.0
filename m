From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 14 Jul 2019 15:54:40 +0200
Subject: [Buildroot] [git commit] package/ding-libs: adjust version variable
Message-ID: <20190714135314.09B37828E8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ed917897116e9488a2598364b21a81d04fc99ca1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package uses dashes as the version separator while
release-monitoring uses dots. As the <pkg>_VERSION is used to match
against release-monitoring, this patch changes the version variable to
use dots instead.

Signed-off-by: Victor Huesca <victor.huesca@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ding-libs/ding-libs.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ding-libs/ding-libs.mk b/package/ding-libs/ding-libs.mk
index e9508ccf9e..976f5728ea 100644
--- a/package/ding-libs/ding-libs.mk
+++ b/package/ding-libs/ding-libs.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-DING_LIBS_VERSION = 0_4_0
-DING_LIBS_SOURCE = ding_libs-$(DING_LIBS_VERSION).tar.xz
+DING_LIBS_VERSION = 0.4.0
+DING_LIBS_SOURCE = ding_libs-$(subst .,_,$(DING_LIBS_VERSION)).tar.xz
 DING_LIBS_SITE = https://git.fedorahosted.org/cgit/ding-libs.git/snapshot
 DING_LIBS_DEPENDENCIES = host-pkgconf \
 	$(TARGET_NLS_DEPENDENCIES) \
