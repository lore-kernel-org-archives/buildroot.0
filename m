From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Dec 2014 00:09:35 +0100
Subject: [Buildroot] [git commit] xbmc: use github call
Message-ID: <20141207231120.97256800E4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ac9b407643eae883ddc52674c3f235dcb3850084
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/xbmc/xbmc.mk |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/package/xbmc/xbmc.mk b/package/xbmc/xbmc.mk
index 03362c2..91d6bef 100644
--- a/package/xbmc/xbmc.mk
+++ b/package/xbmc/xbmc.mk
@@ -5,8 +5,7 @@
 ################################################################################
 
 XBMC_VERSION = 13.2-Gotham
-XBMC_SOURCE = $(XBMC_VERSION).tar.gz
-XBMC_SITE = https://github.com/xbmc/xbmc/archive
+XBMC_SITE = $(call github,xbmc,xbmc,$(XBMC_VERSION))
 XBMC_LICENSE = GPLv2
 XBMC_LICENSE_FILES = LICENSE.GPL
 # XBMC needs host-sdl_image (and therefore host-sdl) for a host tools it builds
