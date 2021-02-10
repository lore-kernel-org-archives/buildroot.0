From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 10 Feb 2021 10:00:47 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] package/sox: drop
 unrecognized options
Message-ID: <20210210085153.C198283900@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9af206254d2caec3485cda1028ce4c3560ff7f27
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

ffmpeg has been dropped since version 14.4.2 (back in 2013) and
https://sourceforge.net/p/sox/code/ci/5ae4049727d4f29036ad541bde5863c850aa7755

--disable-gomp has also been removed since version 14.4.1 (back in 2012)
and
https://sourceforge.net/p/sox/code/ci/84eaacb54fd2e61154ccd95328d8a8ec5096eae1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 98298134276e00232afc3433418cebf5f809ddd6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sox/sox.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/sox/sox.mk b/package/sox/sox.mk
index 013ccbbcf4..e2e8d1da94 100644
--- a/package/sox/sox.mk
+++ b/package/sox/sox.mk
@@ -13,8 +13,6 @@ SOX_LICENSE_FILES = LICENSE.GPL LICENSE.LGPL
 
 SOX_CONF_OPTS = \
 	--with-distro="Buildroot" \
-	--without-ffmpeg \
-	--disable-gomp \
 	--disable-stack-protector
 
 ifeq ($(BR2_PACKAGE_ALSA_LIB_PCM),y)
