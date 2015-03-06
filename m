From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  6 Mar 2015 14:53:05 -0300
Subject: [Buildroot] [PATCH] sox: disable ssp when unavailable
Message-ID: <1425664385-24497-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It seems autodetection isn't good. Fixes:
http://autobuild.buildroot.net/results/885/885c7daec7b727d8a7cf47c7576f0e79d4a5ddf8/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/sox/sox.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/sox/sox.mk b/package/sox/sox.mk
index cd5fbb6..f4d1608 100644
--- a/package/sox/sox.mk
+++ b/package/sox/sox.mk
@@ -8,7 +8,8 @@ SOX_VERSION = 14.4.2
 SOX_SITE = http://downloads.sourceforge.net/project/sox/sox/$(SOX_VERSION)
 SOX_SOURCE = sox-$(SOX_VERSION).tar.bz2
 SOX_DEPENDENCIES = host-pkgconf
-SOX_CONF_OPTS = --with-distro="Buildroot" --without-ffmpeg --disable-gomp
+SOX_CONF_OPTS = --with-distro="Buildroot" --without-ffmpeg --disable-gomp \
+	$(if $(BR2_TOOLCHAIN_HAS_SSP),,--disable-stack-protector)
 SOX_LICENSE = GPLv2+ (sox binary), LGPLv2.1+ (libraries)
 SOX_LICENSE_FILES = LICENSE.GPL LICENSE.LGPL
 
-- 
2.0.5
