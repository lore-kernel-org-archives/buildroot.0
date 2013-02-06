From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed,  6 Feb 2013 17:24:09 +0100
Subject: [Buildroot] [PATCH 1/5] ffmpeg: define license
Message-ID: <1360167853-7177-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---

This patch defines the license in a very simple way.

How about making it more "automagic", such as:

ifeq ($(BR2_PACKAGE_FFMPEG_GPL),y)
FFMPEG_LICENSE = LGPLv2.1+, GPLv2+, libjpeg license
FFMPEG_LICENSE_FILES = LICENSE COPYING.LGPLv2.1 COPYING.GPLv2
else
FFMPEG_LICENSE = LGPLv2.1+, libjpeg license
FFMPEG_LICENSE_FILES = LICENSE COPYING.LGPLv2.1
endif

---

 package/multimedia/ffmpeg/ffmpeg.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/multimedia/ffmpeg/ffmpeg.mk b/package/multimedia/ffmpeg/ffmpeg.mk
index b018ea0..ea43eeb 100644
--- a/package/multimedia/ffmpeg/ffmpeg.mk
+++ b/package/multimedia/ffmpeg/ffmpeg.mk
@@ -8,6 +8,8 @@ FFMPEG_VERSION = 0.8.12
 FFMPEG_SOURCE = ffmpeg-$(FFMPEG_VERSION).tar.bz2
 FFMPEG_SITE = http://ffmpeg.org/releases
 FFMPEG_INSTALL_STAGING = YES
+FFMPEG_LICENSE = LGPLv2.1+, GPLv2+ (optional components), libjpeg license
+FFMPEG_LICENSE_FILES = LICENSE COPYING.LGPLv2.1 COPYING.GPLv2
 
 FFMPEG_CONF_OPT = \
 	--prefix=/usr		\
-- 
1.7.10.4
