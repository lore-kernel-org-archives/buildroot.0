From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Mar 2015 22:52:37 +0100
Subject: [Buildroot] [git commit] sox: disable ssp when unavailable
Message-ID: <20150317215244.A97D08181B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e62bf3c0a91e6ae8e66d8d51d1d3955ce69a0421
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It seems autodetection isn't good. Fixes:
http://autobuild.buildroot.net/results/885/885c7daec7b727d8a7cf47c7576f0e79d4a5ddf8/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sox/sox.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

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
 
