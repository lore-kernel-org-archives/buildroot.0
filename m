From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Jul 2014 22:08:24 +0200
Subject: [Buildroot] [git commit] xbmc: Add lame support
Message-ID: <20140723200905.3D2F69D2CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9249f90bf6097b169f4a4fa5fcebf7819bdde1c4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/xbmc/xbmc.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/xbmc/xbmc.mk b/package/xbmc/xbmc.mk
index 32507fb..dbc12f2 100644
--- a/package/xbmc/xbmc.mk
+++ b/package/xbmc/xbmc.mk
@@ -79,6 +79,13 @@ else
 XBMC_CONF_OPT += --disable-alsa
 endif
 
+ifeq ($(BR2_PACKAGE_LAME),y)
+XBMC_DEPENDENCIES += lame
+XBMC_CONF_OPT += --enable-libmp3lame
+else
+XBMC_CONF_OPT += --disable-libmp3lame
+endif
+
 ifeq ($(BR2_PACKAGE_XBMC_LIBUSB),y)
 XBMC_DEPENDENCIES += libusb-compat
 XBMC_CONF_OPT += --enable-libusb
