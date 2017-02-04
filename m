From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  4 Feb 2017 12:44:51 +0100
Subject: [Buildroot] [PATCH v3 38/38] package/kodi.*: Add -DOVERRIDE_PATHS=1
	to all binary addons
In-Reply-To: <20170204114451.20935-1-bernd.kuhls@t-online.de>
References: <20170204114451.20935-1-bernd.kuhls@t-online.de>
Message-ID: <20170204114451.20935-39-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Needed after https://github.com/xbmc/xbmc/pull/10359

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-adsp-basic/kodi-adsp-basic.mk                             | 1 +
 package/kodi-adsp-freesurround/kodi-adsp-freesurround.mk               | 1 +
 package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk         | 1 +
 package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.mk       | 1 +
 package/kodi-audiodecoder-opus/kodi-audiodecoder-opus.mk               | 1 +
 package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.mk         | 1 +
 package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.mk         | 1 +
 package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.mk         | 1 +
 package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.mk       | 1 +
 package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.mk     | 1 +
 package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk               | 1 +
 package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk               | 1 +
 package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk           | 1 +
 package/kodi-audioencoder-wav/kodi-audioencoder-wav.mk                 | 1 +
 package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk         | 1 +
 package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.mk                 | 1 +
 package/kodi-pvr-argustv/kodi-pvr-argustv.mk                           | 1 +
 package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk                           | 1 +
 package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk                       | 1 +
 package/kodi-pvr-filmon/kodi-pvr-filmon.mk                             | 1 +
 package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk                       | 1 +
 package/kodi-pvr-hts/kodi-pvr-hts.mk                                   | 1 +
 package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk                     | 1 +
 package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.mk | 1 +
 package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk                             | 1 +
 package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk                           | 1 +
 package/kodi-pvr-njoy/kodi-pvr-njoy.mk                                 | 1 +
 package/kodi-pvr-pctv/kodi-pvr-pctv.mk                                 | 1 +
 package/kodi-pvr-stalker/kodi-pvr-stalker.mk                           | 1 +
 package/kodi-pvr-vbox/kodi-pvr-vbox.mk                                 | 1 +
 package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk                         | 1 +
 package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk                             | 1 +
 package/kodi-pvr-wmc/kodi-pvr-wmc.mk                                   | 1 +
 package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.mk       | 1 +
 package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk       | 1 +
 package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.mk     | 1 +
 package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk           | 1 +
 package/kodi-screensaver-crystalmorph/kodi-screensaver-crystalmorph.mk | 1 +
 package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.mk       | 1 +
 package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.mk | 2 +-
 package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.mk         | 1 +
 package/kodi-screensaver-planestate/kodi-screensaver-planestate.mk     | 1 +
 package/kodi-screensaver-pyro/kodi-screensaver-pyro.mk                 | 1 +
 package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk                 | 1 +
 package/kodi-screensaver-stars/kodi-screensaver-stars.mk               | 1 +
 package/kodi-skin-confluence/kodi-skin-confluence.mk                   | 1 +
 package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk       | 1 +
 package/kodi-visualisation-fountain/kodi-visualisation-fountain.mk     | 1 +
 package/kodi-visualisation-goom/kodi-visualisation-goom.mk             | 2 +-
 package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk   | 1 +
 package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk     | 1 +
 package/kodi-visualisation-waveforhue/kodi-visualisation-waveforhue.mk | 1 +
 package/kodi-visualisation-waveform/kodi-visualisation-waveform.mk     | 1 +
 53 files changed, 53 insertions(+), 2 deletions(-)

diff --git a/package/kodi-adsp-basic/kodi-adsp-basic.mk b/package/kodi-adsp-basic/kodi-adsp-basic.mk
index 08cc61f09..d490c0ba4 100644
--- a/package/kodi-adsp-basic/kodi-adsp-basic.mk
+++ b/package/kodi-adsp-basic/kodi-adsp-basic.mk
@@ -11,5 +11,6 @@ KODI_ADSP_BASIC_SITE = $(call github,kodi-adsp,adsp.basic,$(KODI_ADSP_BASIC_VERS
 KODI_ADSP_BASIC_LICENSE = GPLv3+
 KODI_ADSP_BASIC_LICENSE_FILES = LICENSE.md
 KODI_ADSP_BASIC_DEPENDENCIES = libplatform kodi-platform
+KODI_ADSP_BASIC_CONF_OPTS = -DOVERRIDE_PATHS=1
 
 $(eval $(cmake-package))
diff --git a/package/kodi-adsp-freesurround/kodi-adsp-freesurround.mk b/package/kodi-adsp-freesurround/kodi-adsp-freesurround.mk
index 799cda579..f09ab7ae0 100644
--- a/package/kodi-adsp-freesurround/kodi-adsp-freesurround.mk
+++ b/package/kodi-adsp-freesurround/kodi-adsp-freesurround.mk
@@ -11,5 +11,6 @@ KODI_ADSP_FREESURROUND_SITE = $(call github,kodi-adsp,adsp.freesurround,$(KODI_A
 KODI_ADSP_FREESURROUND_LICENSE = GPLv3+
 KODI_ADSP_FREESURROUND_LICENSE_FILES = LICENSE.md
 KODI_ADSP_FREESURROUND_DEPENDENCIES = libplatform kodi-platform
+KODI_ADSP_FREESURROUND_CONF_OPTS = -DOVERRIDE_PATHS=1
 
 $(eval $(cmake-package))
diff --git a/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk b/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk
index a40744812..ee2399540 100644
--- a/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk
+++ b/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk
@@ -9,5 +9,6 @@ KODI_AUDIODECODER_MODPLUG_SITE = $(call github,notspiff,audiodecoder.modplug,$(K
 KODI_AUDIODECODER_MODPLUG_LICENSE = GPLv2+
 KODI_AUDIODECODER_MODPLUG_LICENSE_FILES = src/ModplugCodec.cpp
 KODI_AUDIODECODER_MODPLUG_DEPENDENCIES = kodi-platform libmodplug
+KODI_AUDIODECODER_MODPLUG_CONF_OPTS = -DOVERRIDE_PATHS=1
 
 $(eval $(cmake-package))
diff --git a/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.mk b/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.mk
index 9e8a734b3..cacdf3da9 100644
--- a/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.mk
+++ b/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.mk
@@ -9,5 +9,6 @@ KODI_AUDIODECODER_NOSEFART_SITE = $(call github,notspiff,audiodecoder.nosefart,$
 KODI_AUDIODECODER_NOSEFART_LICENSE = GPLv2+
 KODI_AUDIODECODER_NOSEFART_LICENSE_FILES = src/NSFCodec.cpp
 KODI_AUDIODECODER_NOSEFART_DEPENDENCIES = kodi-platform
+KODI_AUDIODECODER_NOSEFART_CONF_OPTS = -DOVERRIDE_PATHS=1
 
 $(eval $(cmake-package))
diff --git a/package/kodi-audiodecoder-opus/kodi-audiodecoder-opus.mk b/package/kodi-audiodecoder-opus/kodi-audiodecoder-opus.mk
index 41ed9ef0f..444a68122 100644
--- a/package/kodi-audiodecoder-opus/kodi-audiodecoder-opus.mk
+++ b/package/kodi-audiodecoder-opus/kodi-audiodecoder-opus.mk
@@ -9,5 +9,6 @@ KODI_AUDIODECODER_OPUS_SITE = $(call github,notspiff,audiodecoder.opus,$(KODI_AU
 KODI_AUDIODECODER_OPUS_LICENSE = GPLv2+
 KODI_AUDIODECODER_OPUS_LICENSE_FILES = src/OpusCodec.cpp
 KODI_AUDIODECODER_OPUS_DEPENDENCIES = kodi-platform libogg opus opusfile
+KODI_AUDIODECODER_OPUS_CONF_OPTS = -DOVERRIDE_PATHS=1
 
 $(eval $(cmake-package))
diff --git a/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.mk b/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.mk
index 826b255cb..a26d1405b 100644
--- a/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.mk
+++ b/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.mk
@@ -9,5 +9,6 @@ KODI_AUDIODECODER_SIDPLAY_SITE = $(call github,notspiff,audiodecoder.sidplay,$(K
 KODI_AUDIODECODER_SIDPLAY_LICENSE = GPLv2+
 KODI_AUDIODECODER_SIDPLAY_LICENSE_FILES = src/SIDCodec.cpp
 KODI_AUDIODECODER_SIDPLAY_DEPENDENCIES = host-pkgconf kodi-platform libsidplay2
+KODI_AUDIODECODER_SIDPLAY_CONF_OPTS = -DOVERRIDE_PATHS=1
 
 $(eval $(cmake-package))
diff --git a/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.mk b/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.mk
index 6d7cfb251..0e855792a 100644
--- a/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.mk
+++ b/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.mk
@@ -9,5 +9,6 @@ KODI_AUDIODECODER_SNESAPU_SITE = $(call github,notspiff,audiodecoder.snesapu,$(K
 KODI_AUDIODECODER_SNESAPU_LICENSE = GPLv2+
 KODI_AUDIODECODER_SNESAPU_LICENSE_FILES = src/SPCCodec.cpp
 KODI_AUDIODECODER_SNESAPU_DEPENDENCIES = kodi-platform
+KODI_AUDIODECODER_SNESAPU_CONF_OPTS = -DOVERRIDE_PATHS=1
 
 $(eval $(cmake-package))
diff --git a/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.mk b/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.mk
index d5af5276a..1f2d3fe1e 100644
--- a/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.mk
+++ b/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.mk
@@ -9,5 +9,6 @@ KODI_AUDIODECODER_STSOUND_SITE = $(call github,notspiff,audiodecoder.stsound,$(K
 KODI_AUDIODECODER_STSOUND_LICENSE = GPLv2+
 KODI_AUDIODECODER_STSOUND_LICENSE_FILES = src/YMCodec.cpp
 KODI_AUDIODECODER_STSOUND_DEPENDENCIES = kodi-platform
+KODI_AUDIODECODER_STSOUND_CONF_OPTS = -DOVERRIDE_PATHS=1
 
 $(eval $(cmake-package))
diff --git a/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.mk b/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.mk
index cc2f586f8..7da860544 100644
--- a/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.mk
+++ b/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.mk
@@ -9,5 +9,6 @@ KODI_AUDIODECODER_TIMIDITY_SITE = $(call github,notspiff,audiodecoder.timidity,$
 KODI_AUDIODECODER_TIMIDITY_LICENSE = GPLv2+
 KODI_AUDIODECODER_TIMIDITY_LICENSE_FILES = src/TimidityCodec.cpp
 KODI_AUDIODECODER_TIMIDITY_DEPENDENCIES = kodi
+KODI_AUDIODECODER_TIMIDITY_CONF_OPTS = -DOVERRIDE_PATHS=1
 
 $(eval $(cmake-package))
diff --git a/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.mk b/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.mk
index 6358f0638..a5f7d1dc5 100644
--- a/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.mk
+++ b/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.mk
@@ -9,5 +9,6 @@ KODI_AUDIODECODER_VGMSTREAM_SITE = $(call github,notspiff,audiodecoder.vgmstream
 KODI_AUDIODECODER_VGMSTREAM_LICENSE = GPLv2+
 KODI_AUDIODECODER_VGMSTREAM_LICENSE_FILES = src/VGMCodec.cpp
 KODI_AUDIODECODER_VGMSTREAM_DEPENDENCIES = kodi-platform
+KODI_AUDIODECODER_VGMSTREAM_CONF_OPTS = -DOVERRIDE_PATHS=1
 
 $(eval $(cmake-package))
diff --git a/package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk b/package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk
index 4835b0c10..172c1cdda 100644
--- a/package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk
+++ b/package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk
@@ -9,5 +9,6 @@ KODI_AUDIOENCODER_FLAC_SITE = $(call github,xbmc,audioencoder.flac,$(KODI_AUDIOE
 KODI_AUDIOENCODER_FLAC_LICENSE = GPLv2+
 KODI_AUDIOENCODER_FLAC_LICENSE_FILES = src/EncoderFlac.cpp
 KODI_AUDIOENCODER_FLAC_DEPENDENCIES = flac kodi libogg host-pkgconf
+KODI_AUDIOENCODER_FLAC_CONF_OPTS = -DOVERRIDE_PATHS=1
 
 $(eval $(cmake-package))
diff --git a/package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk b/package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk
index 8b1b7cffd..30bed55a2 100644
--- a/package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk
+++ b/package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk
@@ -10,6 +10,7 @@ KODI_AUDIOENCODER_LAME_LICENSE = GPLv2+
 KODI_AUDIOENCODER_LAME_LICENSE_FILES = src/EncoderLame.cpp
 KODI_AUDIOENCODER_LAME_DEPENDENCIES = kodi lame
 KODI_AUDIOENCODER_LAME_CONF_OPTS += \
+	-DOVERRIDE_PATHS=1 \
 	-DLAME_INCLUDE_DIRS=$(STAGING_DIR)/usr/include
 
 $(eval $(cmake-package))
diff --git a/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk b/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk
index 5bb4e5ef1..0ae983864 100644
--- a/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk
+++ b/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk
@@ -9,5 +9,6 @@ KODI_AUDIOENCODER_VORBIS_SITE = $(call github,xbmc,audioencoder.vorbis,$(KODI_AU
 KODI_AUDIOENCODER_VORBIS_LICENSE = GPLv2+
 KODI_AUDIOENCODER_VORBIS_LICENSE_FILES = src/EncoderVorbis.cpp
 KODI_AUDIOENCODER_VORBIS_DEPENDENCIES = kodi libogg libvorbis host-pkgconf
+KODI_AUDIOENCODER_VORBIS_CONF_OPTS = -DOVERRIDE_PATHS=1
 
 $(eval $(cmake-package))
diff --git a/package/kodi-audioencoder-wav/kodi-audioencoder-wav.mk b/package/kodi-audioencoder-wav/kodi-audioencoder-wav.mk
index 1e5635833..328c9b880 100644
--- a/package/kodi-audioencoder-wav/kodi-audioencoder-wav.mk
+++ b/package/kodi-audioencoder-wav/kodi-audioencoder-wav.mk
@@ -9,5 +9,6 @@ KODI_AUDIOENCODER_WAV_SITE = $(call github,xbmc,audioencoder.wav,$(KODI_AUDIOENC
 KODI_AUDIOENCODER_WAV_LICENSE = GPLv2+
 KODI_AUDIOENCODER_WAV_LICENSE_FILES = src/EncoderWav.cpp
 KODI_AUDIOENCODER_WAV_DEPENDENCIES = kodi
+KODI_AUDIOENCODER_WAV_CONF_OPTS = -DOVERRIDE_PATHS=1
 
 $(eval $(cmake-package))
diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
index bd3c34c0c..3098019ad 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
@@ -9,5 +9,6 @@ KODI_INPUTSTREAM_ADAPTIVE_SITE = $(call github,peak3d,inputstream.adaptive,$(KOD
 KODI_INPUTSTREAM_ADAPTIVE_LICENSE = GPLv2+
 KODI_INPUTSTREAM_ADAPTIVE_LICENSE_FILES = src/main.cpp
 KODI_INPUTSTREAM_ADAPTIVE_DEPENDENCIES = libplatform kodi-platform
+KODI_INPUTSTREAM_ADAPTIVE_CONF_OPTS = -DOVERRIDE_PATHS=1
 
 $(eval $(cmake-package))
diff --git a/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.mk b/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.mk
index c19fe562e..771b00d70 100644
--- a/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.mk
+++ b/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.mk
@@ -9,5 +9,6 @@ KODI_INPUTSTREAM_RTMP_SITE = $(call github,notspiff,inputstream.rtmp,$(KODI_INPU
 KODI_INPUTSTREAM_RTMP_LICENSE = GPLv2+
 KODI_INPUTSTREAM_RTMP_LICENSE_FILES = src/RTMPStream.cpp
 KODI_INPUTSTREAM_RTMP_DEPENDENCIES = kodi rtmpdump
+KODI_INPUTSTREAM_RTMP_CONF_OPTS = -DOVERRIDE_PATHS=1
 
 $(eval $(cmake-package))
diff --git a/package/kodi-pvr-argustv/kodi-pvr-argustv.mk b/package/kodi-pvr-argustv/kodi-pvr-argustv.mk
index 58aae06a3..9293c23b7 100644
--- a/package/kodi-pvr-argustv/kodi-pvr-argustv.mk
+++ b/package/kodi-pvr-argustv/kodi-pvr-argustv.mk
@@ -11,5 +11,6 @@ KODI_PVR_ARGUSTV_SITE = $(call github,kodi-pvr,pvr.argustv,$(KODI_PVR_ARGUSTV_VE
 KODI_PVR_ARGUSTV_LICENSE = GPLv2+
 KODI_PVR_ARGUSTV_LICENSE_FILES = src/client.h
 KODI_PVR_ARGUSTV_DEPENDENCIES = jsoncpp kodi-platform
+KODI_PVR_ARGUSTV_CONF_OPTS = -DOVERRIDE_PATHS=1
 
 $(eval $(cmake-package))
diff --git a/package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk b/package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk
index 44ed2b048..3b741006f 100644
--- a/package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk
+++ b/package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk
@@ -11,5 +11,6 @@ KODI_PVR_DVBLINK_SITE = $(call github,kodi-pvr,pvr.dvblink,$(KODI_PVR_DVBLINK_VE
 KODI_PVR_DVBLINK_LICENSE = GPLv2+
 KODI_PVR_DVBLINK_LICENSE_FILES = src/client.h
 KODI_PVR_DVBLINK_DEPENDENCIES = kodi-platform tinyxml2
+KODI_PVR_DVBLINK_CONF_OPTS = -DOVERRIDE_PATHS=1
 
 $(eval $(cmake-package))
diff --git a/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk b/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk
index 95f3d2f45..24d0bacd7 100644
--- a/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk
+++ b/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk
@@ -11,5 +11,6 @@ KODI_PVR_DVBVIEWER_SITE = $(call github,kodi-pvr,pvr.dvbviewer,$(KODI_PVR_DVBVIE
 KODI_PVR_DVBVIEWER_LICENSE = GPLv2+
 KODI_PVR_DVBVIEWER_LICENSE_FILES = src/client.h
 KODI_PVR_DVBVIEWER_DEPENDENCIES = kodi-platform
+KODI_PVR_DVBVIEWER_CONF_OPTS = -DOVERRIDE_PATHS=1
 
 $(eval $(cmake-package))
diff --git a/package/kodi-pvr-filmon/kodi-pvr-filmon.mk b/package/kodi-pvr-filmon/kodi-pvr-filmon.mk
index be1792ea3..fd4e2a060 100644
--- a/package/kodi-pvr-filmon/kodi-pvr-filmon.mk
+++ b/package/kodi-pvr-filmon/kodi-pvr-filmon.mk
@@ -11,5 +11,6 @@ KODI_PVR_FILMON_SITE = $(call github,kodi-pvr,pvr.filmon,$(KODI_PVR_FILMON_VERSI
 KODI_PVR_FILMON_LICENSE = GPLv2+
 KODI_PVR_FILMON_LICENSE_FILES = src/client.h
 KODI_PVR_FILMON_DEPENDENCIES = jsoncpp kodi-platform
+KODI_PVR_FILMON_CONF_OPTS = -DOVERRIDE_PATHS=1
 
 $(eval $(cmake-package))
diff --git a/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk b/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk
index b2612c7ff..35638c8d3 100644
--- a/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk
+++ b/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk
@@ -11,5 +11,6 @@ KODI_PVR_HDHOMERUN_SITE = $(call github,kodi-pvr,pvr.hdhomerun,$(KODI_PVR_HDHOME
 KODI_PVR_HDHOMERUN_LICENSE = GPLv2+
 KODI_PVR_HDHOMERUN_LICENSE_FILES = src/client.h
 KODI_PVR_HDHOMERUN_DEPENDENCIES = jsoncpp kodi-platform libhdhomerun
+KODI_PVR_HDHOMERUN_CONF_OPTS = -DOVERRIDE_PATHS=1
 
 $(eval $(cmake-package))
diff --git a/package/kodi-pvr-hts/kodi-pvr-hts.mk b/package/kodi-pvr-hts/kodi-pvr-hts.mk
index 6b53641d2..364361154 100644
--- a/package/kodi-pvr-hts/kodi-pvr-hts.mk
+++ b/package/kodi-pvr-hts/kodi-pvr-hts.mk
@@ -11,5 +11,6 @@ KODI_PVR_HTS_SITE = $(call github,kodi-pvr,pvr.hts,$(KODI_PVR_HTS_VERSION))
 KODI_PVR_HTS_LICENSE = GPLv2+
 KODI_PVR_HTS_LICENSE_FILES = src/client.h
 KODI_PVR_HTS_DEPENDENCIES = kodi-platform
+KODI_PVR_HTS_CONF_OPTS = -DOVERRIDE_PATHS=1
 
 $(eval $(cmake-package))
diff --git a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
index 0613f5cf1..1d281ce30 100644
--- a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
+++ b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
@@ -11,5 +11,6 @@ KODI_PVR_IPTVSIMPLE_SITE = $(call github,kodi-pvr,pvr.iptvsimple,$(KODI_PVR_IPTV
 KODI_PVR_IPTVSIMPLE_LICENSE = GPLv2+
 KODI_PVR_IPTVSIMPLE_LICENSE_FILES = src/client.h
 KODI_PVR_IPTVSIMPLE_DEPENDENCIES = kodi-platform
+KODI_PVR_IPTVSIMPLE_CONF_OPTS = -DOVERRIDE_PATHS=1
 
 $(eval $(cmake-package))
diff --git a/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.mk b/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.mk
index 6565dda04..bdda36bc3 100644
--- a/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.mk
+++ b/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.mk
@@ -11,5 +11,6 @@ KODI_PVR_MEDIAPORTAL_TVSERVER_SITE = $(call github,kodi-pvr,pvr.mediaportal.tvse
 KODI_PVR_MEDIAPORTAL_TVSERVER_LICENSE = GPLv2+
 KODI_PVR_MEDIAPORTAL_TVSERVER_LICENSE_FILES = src/client.h
 KODI_PVR_MEDIAPORTAL_TVSERVER_DEPENDENCIES = kodi-platform
+KODI_PVR_MEDIAPORTAL_TVSERVER_CONF_OPTS = -DOVERRIDE_PATHS=1
 
 $(eval $(cmake-package))
diff --git a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
index ebb770ca8..5bd62d07e 100644
--- a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
+++ b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
@@ -11,5 +11,6 @@ KODI_PVR_MYTHTV_SITE = $(call github,janbar,pvr.mythtv,$(KODI_PVR_MYTHTV_VERSION
 KODI_PVR_MYTHTV_LICENSE = GPLv2+
 KODI_PVR_MYTHTV_LICENSE_FILES = src/client.h
 KODI_PVR_MYTHTV_DEPENDENCIES = kodi-platform
+KODI_PVR_MYTHTV_CONF_OPTS = -DOVERRIDE_PATHS=1
 
 $(eval $(cmake-package))
diff --git a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk
index aa40f021c..2ee6abbaf 100644
--- a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk
+++ b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk
@@ -11,5 +11,6 @@ KODI_PVR_NEXTPVR_SITE = $(call github,kodi-pvr,pvr.nextpvr,$(KODI_PVR_NEXTPVR_VE
 KODI_PVR_NEXTPVR_LICENSE = GPLv2+
 KODI_PVR_NEXTPVR_LICENSE_FILES = src/client.h
 KODI_PVR_NEXTPVR_DEPENDENCIES = kodi-platform
+KODI_PVR_NEXTPVR_CONF_OPTS = -DOVERRIDE_PATHS=1
 
 $(eval $(cmake-package))
diff --git a/package/kodi-pvr-njoy/kodi-pvr-njoy.mk b/package/kodi-pvr-njoy/kodi-pvr-njoy.mk
index e2695d6da..a479f1028 100644
--- a/package/kodi-pvr-njoy/kodi-pvr-njoy.mk
+++ b/package/kodi-pvr-njoy/kodi-pvr-njoy.mk
@@ -11,5 +11,6 @@ KODI_PVR_NJOY_SITE = $(call github,kodi-pvr,pvr.njoy,$(KODI_PVR_NJOY_VERSION))
 KODI_PVR_NJOY_LICENSE = GPLv2+
 KODI_PVR_NJOY_LICENSE_FILES = src/client.h
 KODI_PVR_NJOY_DEPENDENCIES = kodi-platform
+KODI_PVR_NJOY_CONF_OPTS = -DOVERRIDE_PATHS=1
 
 $(eval $(cmake-package))
diff --git a/package/kodi-pvr-pctv/kodi-pvr-pctv.mk b/package/kodi-pvr-pctv/kodi-pvr-pctv.mk
index 3d30ade50..2fb6fee6d 100644
--- a/package/kodi-pvr-pctv/kodi-pvr-pctv.mk
+++ b/package/kodi-pvr-pctv/kodi-pvr-pctv.mk
@@ -11,5 +11,6 @@ KODI_PVR_PCTV_SITE = $(call github,kodi-pvr,pvr.pctv,$(KODI_PVR_PCTV_VERSION))
 KODI_PVR_PCTV_LICENSE = GPLv2+
 KODI_PVR_PCTV_LICENSE_FILES = src/client.h
 KODI_PVR_PCTV_DEPENDENCIES = jsoncpp kodi-platform
+KODI_PVR_PCTV_CONF_OPTS = -DOVERRIDE_PATHS=1
 
 $(eval $(cmake-package))
diff --git a/package/kodi-pvr-stalker/kodi-pvr-stalker.mk b/package/kodi-pvr-stalker/kodi-pvr-stalker.mk
index 9a8b2aa32..e032fed39 100644
--- a/package/kodi-pvr-stalker/kodi-pvr-stalker.mk
+++ b/package/kodi-pvr-stalker/kodi-pvr-stalker.mk
@@ -11,5 +11,6 @@ KODI_PVR_STALKER_SITE = $(call github,kodi-pvr,pvr.stalker,$(KODI_PVR_STALKER_VE
 KODI_PVR_STALKER_LICENSE = GPLv2+
 KODI_PVR_STALKER_LICENSE_FILES = src/client.h
 KODI_PVR_STALKER_DEPENDENCIES = jsoncpp kodi-platform
+KODI_PVR_STALKER_CONF_OPTS = -DOVERRIDE_PATHS=1
 
 $(eval $(cmake-package))
diff --git a/package/kodi-pvr-vbox/kodi-pvr-vbox.mk b/package/kodi-pvr-vbox/kodi-pvr-vbox.mk
index 5b36acb57..de900ad25 100644
--- a/package/kodi-pvr-vbox/kodi-pvr-vbox.mk
+++ b/package/kodi-pvr-vbox/kodi-pvr-vbox.mk
@@ -11,5 +11,6 @@ KODI_PVR_VBOX_SITE = $(call github,kodi-pvr,pvr.vbox,$(KODI_PVR_VBOX_VERSION))
 KODI_PVR_VBOX_LICENSE = GPLv2+
 KODI_PVR_VBOX_LICENSE_FILES = src/client.h
 KODI_PVR_VBOX_DEPENDENCIES = kodi-platform
+KODI_PVR_VBOX_CONF_OPTS = -DOVERRIDE_PATHS=1
 
 $(eval $(cmake-package))
diff --git a/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk b/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk
index f8f7818a4..373f6b440 100644
--- a/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk
+++ b/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk
@@ -11,5 +11,6 @@ KODI_PVR_VDR_VNSI_SITE = $(call github,kodi-pvr,pvr.vdr.vnsi,$(KODI_PVR_VDR_VNSI
 KODI_PVR_VDR_VNSI_LICENSE = GPLv2+
 KODI_PVR_VDR_VNSI_LICENSE_FILES = src/client.h
 KODI_PVR_VDR_VNSI_DEPENDENCIES = kodi-platform
+KODI_PVR_VDR_VNSI_CONF_OPTS = -DOVERRIDE_PATHS=1
 
 $(eval $(cmake-package))
diff --git a/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk b/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk
index 4a3f1ce69..37d614bd5 100644
--- a/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk
+++ b/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk
@@ -11,5 +11,6 @@ KODI_PVR_VUPLUS_SITE = $(call github,kodi-pvr,pvr.vuplus,$(KODI_PVR_VUPLUS_VERSI
 KODI_PVR_VUPLUS_LICENSE = GPLv2+
 KODI_PVR_VUPLUS_LICENSE_FILES = src/client.h
 KODI_PVR_VUPLUS_DEPENDENCIES = kodi-platform
+KODI_PVR_VUPLUS_CONF_OPTS = -DOVERRIDE_PATHS=1
 
 $(eval $(cmake-package))
diff --git a/package/kodi-pvr-wmc/kodi-pvr-wmc.mk b/package/kodi-pvr-wmc/kodi-pvr-wmc.mk
index 7f72ebfc6..4b55a71c3 100644
--- a/package/kodi-pvr-wmc/kodi-pvr-wmc.mk
+++ b/package/kodi-pvr-wmc/kodi-pvr-wmc.mk
@@ -11,5 +11,6 @@ KODI_PVR_WMC_SITE = $(call github,kodi-pvr,pvr.wmc,$(KODI_PVR_WMC_VERSION))
 KODI_PVR_WMC_LICENSE = GPLv2+
 KODI_PVR_WMC_LICENSE_FILES = src/client.h
 KODI_PVR_WMC_DEPENDENCIES = kodi-platform
+KODI_PVR_WMC_CONF_OPTS = -DOVERRIDE_PATHS=1
 
 $(eval $(cmake-package))
diff --git a/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.mk b/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.mk
index b753d7532..a99a02ae9 100644
--- a/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.mk
+++ b/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.mk
@@ -9,5 +9,6 @@ KODI_SCREENSAVER_ASTEROIDS_SITE = $(call github,notspiff,screensaver.asteroids,$
 KODI_SCREENSAVER_ASTEROIDS_LICENSE = GPLv2+
 KODI_SCREENSAVER_ASTEROIDS_LICENSE_FILES = src/main.cpp
 KODI_SCREENSAVER_ASTEROIDS_DEPENDENCIES = kodi
+KODI_SCREENSAVER_ASTEROIDS_CONF_OPTS = -DOVERRIDE_PATHS=1
 
 $(eval $(cmake-package))
diff --git a/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk b/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk
index b8c3a2adf..264774149 100644
--- a/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk
+++ b/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk
@@ -7,5 +7,6 @@
 KODI_SCREENSAVER_ASTERWAVE_VERSION = v1.1.0
 KODI_SCREENSAVER_ASTERWAVE_SITE = $(call github,notspiff,screensaver.asterwave,$(KODI_SCREENSAVER_ASTERWAVE_VERSION))
 KODI_SCREENSAVER_ASTERWAVE_DEPENDENCIES = kodi libglu libsoil
+KODI_SCREENSAVER_ASTERWAVE_CONF_OPTS = -DOVERRIDE_PATHS=1
 
 $(eval $(cmake-package))
diff --git a/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.mk b/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.mk
index 8ca578fcb..ec60d07a5 100644
--- a/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.mk
+++ b/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.mk
@@ -9,5 +9,6 @@ KODI_SCREENSAVER_BIOGENESIS_SITE = $(call github,notspiff,screensaver.biogenesis
 KODI_SCREENSAVER_BIOGENESIS_LICENSE = GPLv2+
 KODI_SCREENSAVER_BIOGENESIS_LICENSE_FILES = src/Life.cpp
 KODI_SCREENSAVER_BIOGENESIS_DEPENDENCIES = kodi
+KODI_SCREENSAVER_BIOGENESIS_CONF_OPTS = -DOVERRIDE_PATHS=1
 
 $(eval $(cmake-package))
diff --git a/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk b/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk
index 14c47ad5e..719888183 100644
--- a/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk
+++ b/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk
@@ -9,5 +9,6 @@ KODI_SCREENSAVER_CPBLOBS_SITE = $(call github,notspiff,screensaver.cpblobs,$(KOD
 KODI_SCREENSAVER_CPBLOBS_LICENSE = GPLv2
 KODI_SCREENSAVER_CPBLOBS_LICENSE_FILES = LICENSE
 KODI_SCREENSAVER_CPBLOBS_DEPENDENCIES = kodi libsoil
+KODI_SCREENSAVER_CPBLOBS_CONF_OPTS = -DOVERRIDE_PATHS=1
 
 $(eval $(cmake-package))
diff --git a/package/kodi-screensaver-crystalmorph/kodi-screensaver-crystalmorph.mk b/package/kodi-screensaver-crystalmorph/kodi-screensaver-crystalmorph.mk
index c6471db90..211f8aff1 100644
--- a/package/kodi-screensaver-crystalmorph/kodi-screensaver-crystalmorph.mk
+++ b/package/kodi-screensaver-crystalmorph/kodi-screensaver-crystalmorph.mk
@@ -9,5 +9,6 @@ KODI_SCREENSAVER_CRYSTALMORPH_SITE = $(call github,notspiff,screensaver.crystalm
 KODI_SCREENSAVER_CRYSTALMORPH_LICENSE = GPLv2+
 KODI_SCREENSAVER_CRYSTALMORPH_LICENSE_FILES = src/Fractal.cpp
 KODI_SCREENSAVER_CRYSTALMORPH_DEPENDENCIES = kodi
+KODI_SCREENSAVER_CRYSTALMORPH_CONF_OPTS = -DOVERRIDE_PATHS=1
 
 $(eval $(cmake-package))
diff --git a/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.mk b/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.mk
index baad4a3fa..c513f0227 100644
--- a/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.mk
+++ b/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.mk
@@ -9,5 +9,6 @@ KODI_SCREENSAVER_GREYNETIC_SITE = $(call github,notspiff,screensaver.greynetic,$
 KODI_SCREENSAVER_GREYNETIC_LICENSE = GPLv2+
 KODI_SCREENSAVER_GREYNETIC_LICENSE_FILES = src/GreyNetic.cpp
 KODI_SCREENSAVER_GREYNETIC_DEPENDENCIES = kodi
+KODI_SCREENSAVER_GREYNETIC_CONF_OPTS = -DOVERRIDE_PATHS=1
 
 $(eval $(cmake-package))
diff --git a/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.mk b/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.mk
index 1da96695a..6693bf48b 100644
--- a/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.mk
+++ b/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.mk
@@ -8,7 +8,7 @@ KODI_SCREENSAVER_MATRIXTRAILS_VERSION = v1.1.0
 KODI_SCREENSAVER_MATRIXTRAILS_SITE = $(call github,notspiff,screensaver.matrixtrails,$(KODI_SCREENSAVER_MATRIXTRAILS_VERSION))
 KODI_SCREENSAVER_MATRIXTRAILS_LICENSE = GPLv2+
 KODI_SCREENSAVER_MATRIXTRAILS_LICENSE_FILES = src/matrixtrails.cpp
-
 KODI_SCREENSAVER_MATRIXTRAILS_DEPENDENCIES = kodi libsoil
+KODI_SCREENSAVER_MATRIXTRAILS_CONF_OPTS = -DOVERRIDE_PATHS=1
 
 $(eval $(cmake-package))
diff --git a/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.mk b/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.mk
index 71395b9b8..1ba31765e 100644
--- a/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.mk
+++ b/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.mk
@@ -9,5 +9,6 @@ KODI_SCREENSAVER_PINGPONG_SITE = $(call github,notspiff,screensaver.pingpong,$(K
 KODI_SCREENSAVER_PINGPONG_LICENSE = GPLv2+
 KODI_SCREENSAVER_PINGPONG_LICENSE_FILES = src/readme.txt
 KODI_SCREENSAVER_PINGPONG_DEPENDENCIES = kodi
+KODI_SCREENSAVER_PINGPONG_CONF_OPTS = -DOVERRIDE_PATHS=1
 
 $(eval $(cmake-package))
diff --git a/package/kodi-screensaver-planestate/kodi-screensaver-planestate.mk b/package/kodi-screensaver-planestate/kodi-screensaver-planestate.mk
index 0e90ffc5d..f64f7b23d 100644
--- a/package/kodi-screensaver-planestate/kodi-screensaver-planestate.mk
+++ b/package/kodi-screensaver-planestate/kodi-screensaver-planestate.mk
@@ -7,5 +7,6 @@
 KODI_SCREENSAVER_PLANESTATE_VERSION = 5341406dd05439a1a0245ab3f6d1a8964461d0e5
 KODI_SCREENSAVER_PLANESTATE_SITE = $(call github,notspiff,screensaver.planestate,$(KODI_SCREENSAVER_PLANESTATE_VERSION))
 KODI_SCREENSAVER_PLANESTATE_DEPENDENCIES = kodi libsoil
+KODI_SCREENSAVER_PLANESTATE_CONF_OPTS = -DOVERRIDE_PATHS=1
 
 $(eval $(cmake-package))
diff --git a/package/kodi-screensaver-pyro/kodi-screensaver-pyro.mk b/package/kodi-screensaver-pyro/kodi-screensaver-pyro.mk
index 7ed9acfb8..7e1577636 100644
--- a/package/kodi-screensaver-pyro/kodi-screensaver-pyro.mk
+++ b/package/kodi-screensaver-pyro/kodi-screensaver-pyro.mk
@@ -9,5 +9,6 @@ KODI_SCREENSAVER_PYRO_SITE = $(call github,notspiff,screensaver.pyro,$(KODI_SCRE
 KODI_SCREENSAVER_PYRO_LICENSE = GPLv2+
 KODI_SCREENSAVER_PYRO_LICENSE_FILES = src/Pyro.cpp
 KODI_SCREENSAVER_PYRO_DEPENDENCIES = kodi
+KODI_SCREENSAVER_PYRO_CONF_OPTS = -DOVERRIDE_PATHS=1
 
 $(eval $(cmake-package))
diff --git a/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk b/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk
index 8ae899b6d..47de96546 100644
--- a/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk
+++ b/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk
@@ -9,5 +9,6 @@ KODI_SCREENSAVER_RSXS_SITE = $(call github,notspiff,screensavers.rsxs,$(KODI_SCR
 KODI_SCREENSAVER_RSXS_LICENSE = GPLv3
 KODI_SCREENSAVER_RSXS_LICENSE_FILES = lib/rsxs-1.0/COPYING
 KODI_SCREENSAVER_RSXS_DEPENDENCIES = kodi libpng xlib_libXmu
+KODI_SCREENSAVER_RSXS_CONF_OPTS = -DOVERRIDE_PATHS=1
 
 $(eval $(cmake-package))
diff --git a/package/kodi-screensaver-stars/kodi-screensaver-stars.mk b/package/kodi-screensaver-stars/kodi-screensaver-stars.mk
index b49377220..7929422e8 100644
--- a/package/kodi-screensaver-stars/kodi-screensaver-stars.mk
+++ b/package/kodi-screensaver-stars/kodi-screensaver-stars.mk
@@ -9,5 +9,6 @@ KODI_SCREENSAVER_STARS_SITE = $(call github,notspiff,screensaver.stars,$(KODI_SC
 KODI_SCREENSAVER_STARS_LICENSE = GPLv2+
 KODI_SCREENSAVER_STARS_LICENSE_FILES = src/StarField.cpp
 KODI_SCREENSAVER_STARS_DEPENDENCIES = kodi
+KODI_SCREENSAVER_STARS_CONF_OPTS = -DOVERRIDE_PATHS=1
 
 $(eval $(cmake-package))
diff --git a/package/kodi-skin-confluence/kodi-skin-confluence.mk b/package/kodi-skin-confluence/kodi-skin-confluence.mk
index 84e75ed5b..8ea6269a5 100644
--- a/package/kodi-skin-confluence/kodi-skin-confluence.mk
+++ b/package/kodi-skin-confluence/kodi-skin-confluence.mk
@@ -9,6 +9,7 @@ KODI_SKIN_CONFLUENCE_SITE = $(call github,xbmc,skin.confluence,$(KODI_SKIN_CONFL
 KODI_SKIN_CONFLUENCE_LICENSE = GPLv2+
 KODI_SKIN_CONFLUENCE_LICENSE_FILES = LICENSE.txt
 KODI_SKIN_CONFLUENCE_DEPENDENCIES = kodi
+KODI_SKIN_CONFLUENCE_CONF_OPTS = -DOVERRIDE_PATHS=1
 
 ifeq ($(BR2_PACKAGE_KODI_TEXTUREPACKER),y)
 define KODI_SKIN_CONFLUENCE_BUILD_CMDS
diff --git a/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk b/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk
index 3f2ce1a41..90107f108 100644
--- a/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk
+++ b/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk
@@ -9,5 +9,6 @@ KODI_VISUALISATION_FISHBMC_SITE = $(call github,notspiff,visualization.fishbmc,$
 KODI_VISUALISATION_FISHBMC_LICENSE = GPLv2+
 KODI_VISUALISATION_FISHBMC_LICENSE_FILES = visualization.fishbmc/LICENSE
 KODI_VISUALISATION_FISHBMC_DEPENDENCIES = kodi
+KODI_VISUALISATION_FISHBMC_CONF_OPTS = -DOVERRIDE_PATHS=1
 
 $(eval $(cmake-package))
diff --git a/package/kodi-visualisation-fountain/kodi-visualisation-fountain.mk b/package/kodi-visualisation-fountain/kodi-visualisation-fountain.mk
index af250eaa1..390b78d46 100644
--- a/package/kodi-visualisation-fountain/kodi-visualisation-fountain.mk
+++ b/package/kodi-visualisation-fountain/kodi-visualisation-fountain.mk
@@ -7,5 +7,6 @@
 KODI_VISUALISATION_FOUNTAIN_VERSION = faf49ac0acde558e925fa0a3eb3dbb49606278b4
 KODI_VISUALISATION_FOUNTAIN_SITE = $(call github,notspiff,visualization.fountain,$(KODI_VISUALISATION_FOUNTAIN_VERSION))
 KODI_VISUALISATION_FOUNTAIN_DEPENDENCIES = kodi libsoil
+KODI_VISUALISATION_FOUNTAIN_CONF_OPTS = -DOVERRIDE_PATHS=1
 
 $(eval $(cmake-package))
diff --git a/package/kodi-visualisation-goom/kodi-visualisation-goom.mk b/package/kodi-visualisation-goom/kodi-visualisation-goom.mk
index 7099cbef7..00769711f 100644
--- a/package/kodi-visualisation-goom/kodi-visualisation-goom.mk
+++ b/package/kodi-visualisation-goom/kodi-visualisation-goom.mk
@@ -8,7 +8,7 @@ KODI_VISUALISATION_GOOM_VERSION = v1.1.0
 KODI_VISUALISATION_GOOM_SITE = $(call github,notspiff,visualization.goom,$(KODI_VISUALISATION_GOOM_VERSION))
 KODI_VISUALISATION_GOOM_LICENSE = GPLv2+
 KODI_VISUALISATION_GOOM_LICENSE_FILES = src/Main.cpp
-
 KODI_VISUALISATION_GOOM_DEPENDENCIES = kodi
+KODI_VISUALISATION_GOOM_CONF_OPTS = -DOVERRIDE_PATHS=1
 
 $(eval $(cmake-package))
diff --git a/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk b/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk
index d90afab0e..b6d0bec2c 100644
--- a/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk
+++ b/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk
@@ -9,5 +9,6 @@ KODI_VISUALISATION_SHADERTOY_SITE = $(call github,notspiff,visualization.shadert
 KODI_VISUALISATION_SHADERTOY_LICENSE = GPLv2+
 KODI_VISUALISATION_SHADERTOY_LICENSE_FILES = src/main.cpp
 KODI_VISUALISATION_SHADERTOY_DEPENDENCIES = kodi libplatform
+KODI_VISUALISATION_SHADERTOY_CONF_OPTS = -DOVERRIDE_PATHS=1
 
 $(eval $(cmake-package))
diff --git a/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk b/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk
index 20fcce829..60b9050c3 100644
--- a/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk
+++ b/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk
@@ -9,5 +9,6 @@ KODI_VISUALISATION_SPECTRUM_SITE = $(call github,notspiff,visualization.spectrum
 KODI_VISUALISATION_SPECTRUM_LICENSE = GPLv2+
 KODI_VISUALISATION_SPECTRUM_LICENSE_FILES = COPYING
 KODI_VISUALISATION_SPECTRUM_DEPENDENCIES = kodi
+KODI_VISUALISATION_SPECTRUM_CONF_OPTS = -DOVERRIDE_PATHS=1
 
 $(eval $(cmake-package))
diff --git a/package/kodi-visualisation-waveforhue/kodi-visualisation-waveforhue.mk b/package/kodi-visualisation-waveforhue/kodi-visualisation-waveforhue.mk
index 21840f18b..b6022b54d 100644
--- a/package/kodi-visualisation-waveforhue/kodi-visualisation-waveforhue.mk
+++ b/package/kodi-visualisation-waveforhue/kodi-visualisation-waveforhue.mk
@@ -9,5 +9,6 @@ KODI_VISUALISATION_WAVEFORHUE_SITE = $(call github,hardyt,visualization.waveforh
 KODI_VISUALISATION_WAVEFORHUE_LICENSE = GPLv2+
 KODI_VISUALISATION_WAVEFORHUE_LICENSE_FILES = COPYING
 KODI_VISUALISATION_WAVEFORHUE_DEPENDENCIES = kodi
+KODI_VISUALISATION_WAVEFORHUE_CONF_OPTS = -DOVERRIDE_PATHS=1
 
 $(eval $(cmake-package))
diff --git a/package/kodi-visualisation-waveform/kodi-visualisation-waveform.mk b/package/kodi-visualisation-waveform/kodi-visualisation-waveform.mk
index 0d9f0f064..0344eb566 100644
--- a/package/kodi-visualisation-waveform/kodi-visualisation-waveform.mk
+++ b/package/kodi-visualisation-waveform/kodi-visualisation-waveform.mk
@@ -9,5 +9,6 @@ KODI_VISUALISATION_WAVEFORM_SITE = $(call github,notspiff,visualization.waveform
 KODI_VISUALISATION_WAVEFORM_LICENSE = GPLv2+
 KODI_VISUALISATION_WAVEFORM_LICENSE_FILES = COPYING
 KODI_VISUALISATION_WAVEFORM_DEPENDENCIES = kodi
+KODI_VISUALISATION_WAVEFORM_CONF_OPTS = -DOVERRIDE_PATHS=1
 
 $(eval $(cmake-package))
-- 
2.11.0
