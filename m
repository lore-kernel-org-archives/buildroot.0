From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 Mar 2015 21:19:04 +0100
Subject: [Buildroot] [git commit] wine: Add dependency check for ALSA
Message-ID: <20150305201926.1AB878179B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=81230a5b3a27e315f0ba1334d7ab257812b7ab69
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.org/results/018/018391c5e70d33bc0b5745ad7a2a273efa9be0d7/

Signed-off-by: Andr?? Hentschel <nerv@dawncrow.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/wine/wine.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/wine/wine.mk b/package/wine/wine.mk
index 926ac99..47c7259 100644
--- a/package/wine/wine.mk
+++ b/package/wine/wine.mk
@@ -29,6 +29,13 @@ ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
 WINE_CONF_OPTS += TARGETFLAGS="-b $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PREFIX))"
 endif
 
+ifeq ($(BR2_PACKAGE_ALSA_LIB)$(BR2_PACKAGE_ALSA_LIB_SEQ),yy)
+WINE_CONF_OPTS += --with-alsa
+WINE_DEPENDENCIES += alsa-lib
+else
+WINE_CONF_OPTS += --without-alsa
+endif
+
 ifeq ($(BR2_PACKAGE_CUPS),y)
 WINE_CONF_OPTS += --with-cups
 WINE_DEPENDENCIES += cups
