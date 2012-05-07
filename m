From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  7 May 2012 14:08:12 +0200
Subject: [Buildroot] [PATCH] libdvdnav: requires pkg-config
Message-ID: <1336392493-3695-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.org/results/ababd836c7e7c3e63b3c7825244a56e30462c56d/build-end.log.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libdvdnav/libdvdnav.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libdvdnav/libdvdnav.mk b/package/libdvdnav/libdvdnav.mk
index f69f238..1c38904 100644
--- a/package/libdvdnav/libdvdnav.mk
+++ b/package/libdvdnav/libdvdnav.mk
@@ -10,7 +10,7 @@ LIBDVDNAV_SITE = http://dvdnav.mplayerhq.hu/releases
 LIBDVDNAV_AUTORECONF = YES
 LIBDVDNAV_INSTALL_STAGING = YES
 
-LIBDVDNAV_DEPENDENCIES = libdvdread
+LIBDVDNAV_DEPENDENCIES = libdvdread host-pkg-config
 
 # By default libdvdnav tries to find dvdread-config in $PATH. Because
 # of cross compilation, we prefer using pkg-config.
-- 
1.7.9.5
