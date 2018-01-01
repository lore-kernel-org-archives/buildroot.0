From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Jan 2018 13:45:07 +0100
Subject: [Buildroot] [git commit] ffmpeg: RaspberryPi support does not need
 rpi-firmware
Message-ID: <20180101144311.126F0838B7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ba2b4118fa847dfdbaeb4846590d3a9f51948676
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

rpi-userland provides the user-space blobs needed for OpenGL and al.,
rpi-firmware is not needed.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ffmpeg/ffmpeg.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index daa6dab..76c31f5 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -254,10 +254,10 @@ else
 FFMPEG_CONF_OPTS += --disable-vdpau
 endif
 
-ifeq ($(BR2_PACKAGE_RPI_FIRMWARE)$(BR2_PACKAGE_RPI_USERLAND),yy)
+ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
 FFMPEG_CONF_OPTS += --enable-mmal --enable-omx --enable-omx-rpi \
 	--extra-cflags=-I$(STAGING_DIR)/usr/include/IL
-FFMPEG_DEPENDENCIES += rpi-firmware rpi-userland
+FFMPEG_DEPENDENCIES += rpi-userland
 else
 FFMPEG_CONF_OPTS += --disable-mmal --disable-omx --disable-omx-rpi
 endif
