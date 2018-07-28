From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Jul 2018 23:09:22 +0200
Subject: [Buildroot] [git commit] package/x11r7/xdriver_xf86-video-savage:
 add patch to fix X.org server 1.20.0 build
Message-ID: <20180728211152.37593800F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=96604ada8f58c6dc612cafafe8479747fb6b3779
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0002-xorg-xserver120.patch                     | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/package/x11r7/xdriver_xf86-video-savage/0002-xorg-xserver120.patch b/package/x11r7/xdriver_xf86-video-savage/0002-xorg-xserver120.patch
new file mode 100644
index 0000000000..4c695960d1
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-savage/0002-xorg-xserver120.patch
@@ -0,0 +1,23 @@
+Fix build with modular-xorg-server-1.20
+
+Downloaded from
+http://cvsweb.netbsd.org/bsdweb.cgi/pkgsrc/x11/xf86-video-savage/patches/patch-src_savage__driver.c?rev=1.3&content-type=text/x-cvsweb-markup
+
+Patch was sent upstream by Thomas Klausner <wiz@netbsd.org>:
+https://lists.x.org/archives/xorg-devel/2018-May/056952.html
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+--- a/src/savage_driver.c.orig	2017-01-17 22:43:40.000000000 +0000
++++ b/src/savage_driver.c
+@@ -2034,8 +2034,10 @@ static Bool SavagePreInit(ScrnInfoPtr pS
+     xf86DrvMsg(pScrn->scrnIndex, X_PROBED, "Detected current MCLK value of %1.3f MHz\n",
+ 	       mclk / 1000.0);
+ 
++#if 0
+     pScrn->maxHValue = 2048 << 3;	/* 11 bits of h_total 8-pixel units */
+     pScrn->maxVValue = 2048;		/* 11 bits of v_total */
++#endif
+     pScrn->virtualX = pScrn->display->virtualX;
+     pScrn->virtualY = pScrn->display->virtualY;
+ 
