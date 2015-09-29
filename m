From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Sep 2015 19:39:45 +0200
Subject: [Buildroot] [git commit] libbluray: disable BD-Java
Message-ID: <20150929173951.C99F07F9FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7cc5e6daed2858bbfe020309e3834ee8db64e22b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

BD-Java requires host-ant which is not currently available in Buildroot.

Fixes:
http://autobuild.buildroot.net/results/e87/e8790359cc12d73a22a168a61f59215e50a58f0f/
http://autobuild.buildroot.net/results/bb3/bb33effb844fd6c06efa033cc3e3cb4b4495d1d5/
http://autobuild.buildroot.net/results/623/623de2013eba2bff2d0863968e76f299488f9f35/

and more.

Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libbluray/libbluray.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libbluray/libbluray.mk b/package/libbluray/libbluray.mk
index f6a501a..2e9268e 100644
--- a/package/libbluray/libbluray.mk
+++ b/package/libbluray/libbluray.mk
@@ -12,7 +12,7 @@ LIBBLURAY_LICENSE = LGPLv2.1+
 LIBBLURAY_LICENSE_FILES = COPYING
 LIBBLURAY_DEPENDENCIES = host-pkgconf
 
-LIBBLURAY_CONF_OPTS = --enable-udf
+LIBBLURAY_CONF_OPTS = --enable-udf --disable-bdjava
 
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
 LIBBLURAY_DEPENDENCIES += libiconv
