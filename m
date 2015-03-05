From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 Mar 2015 21:17:35 +0100
Subject: [Buildroot] [git commit] cups: fix dependency check for libX11
Message-ID: <20150305201752.C3B7581807@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4554ed568dd945b75edd4e20f886871c5f978cc8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Andr?? Hentschel <nerv@dawncrow.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cups/cups.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index cc87574..b6a0663 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -34,7 +34,7 @@ else
 	CUPS_CONF_OPTS += --disable-dbus
 endif
 
-ifeq ($(BR2_PACKAGE_XORG7),y)
+ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
 	CUPS_DEPENDENCIES += xlib_libX11
 endif
 
