From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  6 May 2010 20:20:06 +0200
Subject: [Buildroot] [PATCH 6/7] xapp_mkfontdir: enable for the host
In-Reply-To: <cover.1273169997.git.thomas.petazzoni@free-electrons.com>
References: <cover.1273169997.git.thomas.petazzoni@free-electrons.com>
Message-ID: <3be79ce2a5e05e0bac7bb130af1ad05d88a7d52a.1273169997.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When compiling xfonts, mkfontdir is needed for the host, therefore,
enable it.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xapp_mkfontdir/xapp_mkfontdir.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/x11r7/xapp_mkfontdir/xapp_mkfontdir.mk b/package/x11r7/xapp_mkfontdir/xapp_mkfontdir.mk
index ab9bf1b..443b44f 100644
--- a/package/x11r7/xapp_mkfontdir/xapp_mkfontdir.mk
+++ b/package/x11r7/xapp_mkfontdir/xapp_mkfontdir.mk
@@ -9,5 +9,7 @@ XAPP_MKFONTDIR_SOURCE = mkfontdir-$(XAPP_MKFONTDIR_VERSION).tar.bz2
 XAPP_MKFONTDIR_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_MKFONTDIR_AUTORECONF = NO
 XAPP_MKFONTDIR_DEPENDENCIES = xapp_mkfontscale
+HOST_XAPP_MKFONTDIR_DEPENDENCIES = host-xapp_mkfontscale
 
 $(eval $(call AUTOTARGETS,package/x11r7,xapp_mkfontdir))
+$(eval $(call AUTOTARGETS,package/x11r7,xapp_mkfontdir,host))
-- 
1.6.3.3
