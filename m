From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 12 Oct 2014 20:21:00 +0200
Subject: [Buildroot] [PATCH] xbmc: use github call
Message-ID: <1413138060-1146-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/xbmc/xbmc.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/xbmc/xbmc.mk b/package/xbmc/xbmc.mk
index 0101ad7..966dbb3 100644
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
-- 
2.1.1
