From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 May 2015 16:21:55 +0200
Subject: [Buildroot] [git commit] wine: fix alsa-related build error
Message-ID: <20150501142305.BC1667FF1D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5c612d9b178e49eb3edad53e6f3615f1e8747223
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The fix from 81230a5b3a27e315f0ba1334d7ab257812b7ab69 is incomplete.
BR2_PACKAGE_ALSA_LIB_RAWMIDI is required as well. Fixes:
http://autobuild.buildroot.org/results/018/018391c5e70d33bc0b5745ad7a2a273efa9be0d7/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/wine/wine.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/wine/wine.mk b/package/wine/wine.mk
index a96060f..1ae038e 100644
--- a/package/wine/wine.mk
+++ b/package/wine/wine.mk
@@ -41,7 +41,7 @@ ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
 WINE_CONF_OPTS += TARGETFLAGS="-b $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PREFIX))"
 endif
 
-ifeq ($(BR2_PACKAGE_ALSA_LIB)$(BR2_PACKAGE_ALSA_LIB_SEQ),yy)
+ifeq ($(BR2_PACKAGE_ALSA_LIB)$(BR2_PACKAGE_ALSA_LIB_SEQ)$(BR2_PACKAGE_ALSA_LIB_RAWMIDI),yyy)
 WINE_CONF_OPTS += --with-alsa
 WINE_DEPENDENCIES += alsa-lib
 else
