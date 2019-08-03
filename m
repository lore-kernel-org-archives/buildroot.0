From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  3 Aug 2019 21:36:27 +0200
Subject: [Buildroot] [PATCH v5 10/25] package/kodi-audiodecoder-*: mass
 version bump
In-Reply-To: <20190803193642.17892-1-bernd.kuhls@t-online.de>
References: <20190803193642.17892-1-bernd.kuhls@t-online.de>
Message-ID: <20190803193642.17892-11-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changed _SITE after upstream relocated all audio decoders to xbmc repos
https://github.com/xbmc/repo-binary-addons/commit/4c900f6835889ce45ba4daaf0387bb5eb13db065

Changed dependency from kodi-platform to kodi itself, the dependency to
kodi-platform was removed upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-audiodecoder-modplug/Config.in                 | 3 +--
 .../kodi-audiodecoder-modplug.hash                          | 2 +-
 .../kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk  | 6 +++---
 package/kodi-audiodecoder-nosefart/Config.in                | 3 +--
 .../kodi-audiodecoder-nosefart.hash                         | 2 +-
 .../kodi-audiodecoder-nosefart.mk                           | 6 +++---
 package/kodi-audiodecoder-sidplay/Config.in                 | 3 +--
 .../kodi-audiodecoder-sidplay.hash                          | 2 +-
 .../kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.mk  | 6 +++---
 package/kodi-audiodecoder-snesapu/Config.in                 | 3 +--
 .../kodi-audiodecoder-snesapu.hash                          | 2 +-
 .../kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.mk  | 6 +++---
 package/kodi-audiodecoder-stsound/Config.in                 | 3 +--
 .../kodi-audiodecoder-stsound.hash                          | 2 +-
 .../kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.mk  | 6 +++---
 package/kodi-audiodecoder-timidity/Config.in                | 2 +-
 .../kodi-audiodecoder-timidity.hash                         | 2 +-
 .../kodi-audiodecoder-timidity.mk                           | 4 ++--
 package/kodi-audiodecoder-vgmstream/Config.in               | 3 +--
 .../kodi-audiodecoder-vgmstream.hash                        | 2 +-
 .../kodi-audiodecoder-vgmstream.mk                          | 6 +++---
 21 files changed, 34 insertions(+), 40 deletions(-)

diff --git a/package/kodi-audiodecoder-modplug/Config.in b/package/kodi-audiodecoder-modplug/Config.in
index 026997319e..856ca8beb1 100644
--- a/package/kodi-audiodecoder-modplug/Config.in
+++ b/package/kodi-audiodecoder-modplug/Config.in
@@ -1,8 +1,7 @@
 config BR2_PACKAGE_KODI_AUDIODECODER_MODPLUG
 	bool "kodi-audiodecoder-modplug"
-	select BR2_PACKAGE_KODI_PLATFORM
 	select BR2_PACKAGE_LIBMODPLUG
 	help
 	  Modplug decoder addon for Kodi
 
-	  https://github.com/notspiff/audiodecoder.modplug
+	  https://github.com/xbmc/audiodecoder.modplug
diff --git a/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.hash b/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.hash
index 6a0607e83d..280d238e43 100644
--- a/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.hash
+++ b/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 8be4f8c6324bf790069e42c963e14733c53fcdc27548f21f4822b178f47b8177  kodi-audiodecoder-modplug-1.1.0.tar.gz
+sha256 8ff4eacab4baedeaafcd1ce755347de69e5ac309530843762e94e20489e9af2f  kodi-audiodecoder-modplug-97b53af55b46b320461855560cffbcce48c29db0.tar.gz
diff --git a/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk b/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk
index fb7003f093..3ba9d22778 100644
--- a/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk
+++ b/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-KODI_AUDIODECODER_MODPLUG_VERSION = 1.1.0
-KODI_AUDIODECODER_MODPLUG_SITE = $(call github,notspiff,audiodecoder.modplug,v$(KODI_AUDIODECODER_MODPLUG_VERSION))
+KODI_AUDIODECODER_MODPLUG_VERSION = 97b53af55b46b320461855560cffbcce48c29db0
+KODI_AUDIODECODER_MODPLUG_SITE = $(call github,xbmc,audiodecoder.modplug,$(KODI_AUDIODECODER_MODPLUG_VERSION))
 KODI_AUDIODECODER_MODPLUG_LICENSE = GPL-2.0+
 KODI_AUDIODECODER_MODPLUG_LICENSE_FILES = src/ModplugCodec.cpp
-KODI_AUDIODECODER_MODPLUG_DEPENDENCIES = kodi-platform libmodplug
+KODI_AUDIODECODER_MODPLUG_DEPENDENCIES = kodi libmodplug
 
 $(eval $(cmake-package))
diff --git a/package/kodi-audiodecoder-nosefart/Config.in b/package/kodi-audiodecoder-nosefart/Config.in
index 96591aae5c..bb56a3d6d4 100644
--- a/package/kodi-audiodecoder-nosefart/Config.in
+++ b/package/kodi-audiodecoder-nosefart/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_KODI_AUDIODECODER_NOSEFART
 	bool "kodi-audiodecoder-nosefart"
-	select BR2_PACKAGE_KODI_PLATFORM
 	help
 	  Nosefart decoder addon for Kodi
 
-	  https://github.com/notspiff/audiodecoder.nosefart
+	  https://github.com/xbmc/audiodecoder.nosefart
diff --git a/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.hash b/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.hash
index 670e324ee4..a6d7229f30 100644
--- a/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.hash
+++ b/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 444cc85f4618daa5147a63633db3f300123d5e33b1b5894e7036fa9243e8a535  kodi-audiodecoder-nosefart-1.1.0.tar.gz
+sha256 5677b4ad542cee713a376f34d0401b37f78a2687746ccbac4222b9582a2d6a4f  kodi-audiodecoder-nosefart-86b73e130dc09e2cae500ce81504bef567bc6cee.tar.gz
diff --git a/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.mk b/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.mk
index 5e008198ca..a5675292f7 100644
--- a/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.mk
+++ b/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-KODI_AUDIODECODER_NOSEFART_VERSION = 1.1.0
-KODI_AUDIODECODER_NOSEFART_SITE = $(call github,notspiff,audiodecoder.nosefart,v$(KODI_AUDIODECODER_NOSEFART_VERSION))
+KODI_AUDIODECODER_NOSEFART_VERSION = 86b73e130dc09e2cae500ce81504bef567bc6cee
+KODI_AUDIODECODER_NOSEFART_SITE = $(call github,xbmc,audiodecoder.nosefart,$(KODI_AUDIODECODER_NOSEFART_VERSION))
 KODI_AUDIODECODER_NOSEFART_LICENSE = GPL-2.0+
 KODI_AUDIODECODER_NOSEFART_LICENSE_FILES = src/NSFCodec.cpp
-KODI_AUDIODECODER_NOSEFART_DEPENDENCIES = kodi-platform
+KODI_AUDIODECODER_NOSEFART_DEPENDENCIES = kodi
 
 $(eval $(cmake-package))
diff --git a/package/kodi-audiodecoder-sidplay/Config.in b/package/kodi-audiodecoder-sidplay/Config.in
index ae99afa9e0..eca4160a90 100644
--- a/package/kodi-audiodecoder-sidplay/Config.in
+++ b/package/kodi-audiodecoder-sidplay/Config.in
@@ -1,8 +1,7 @@
 config BR2_PACKAGE_KODI_AUDIODECODER_SIDPLAY
 	bool "kodi-audiodecoder-sidplay"
-	select BR2_PACKAGE_KODI_PLATFORM
 	select BR2_PACKAGE_LIBSIDPLAY2
 	help
 	  Sidplay decoder addon for Kodi
 
-	  https://github.com/notspiff/audiodecoder.sidplay
+	  https://github.com/xbmc/audiodecoder.sidplay
diff --git a/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.hash b/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.hash
index 97c5f28fc7..d659fb7b0b 100644
--- a/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.hash
+++ b/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 527b188679add8043e8cd691af9735b6fe8bd6935ad8ac8312b459d6f160cdac  kodi-audiodecoder-sidplay-1.1.0.tar.gz
+sha256 70779ce519453a6976ec36972e08877a5658786e5bd39e62f6ff8b367b1cc899  kodi-audiodecoder-sidplay-64dca58eea2c44e8962f128bac3226da67b6f835.tar.gz
diff --git a/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.mk b/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.mk
index 8dc827a666..ffe09ad26c 100644
--- a/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.mk
+++ b/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-KODI_AUDIODECODER_SIDPLAY_VERSION = 1.1.0
-KODI_AUDIODECODER_SIDPLAY_SITE = $(call github,notspiff,audiodecoder.sidplay,v$(KODI_AUDIODECODER_SIDPLAY_VERSION))
+KODI_AUDIODECODER_SIDPLAY_VERSION = 64dca58eea2c44e8962f128bac3226da67b6f835
+KODI_AUDIODECODER_SIDPLAY_SITE = $(call github,xbmc,audiodecoder.sidplay,$(KODI_AUDIODECODER_SIDPLAY_VERSION))
 KODI_AUDIODECODER_SIDPLAY_LICENSE = GPL-2.0+
 KODI_AUDIODECODER_SIDPLAY_LICENSE_FILES = src/SIDCodec.cpp
-KODI_AUDIODECODER_SIDPLAY_DEPENDENCIES = host-pkgconf kodi-platform libsidplay2
+KODI_AUDIODECODER_SIDPLAY_DEPENDENCIES = host-pkgconf kodi libsidplay2
 
 $(eval $(cmake-package))
diff --git a/package/kodi-audiodecoder-snesapu/Config.in b/package/kodi-audiodecoder-snesapu/Config.in
index 0cb572fec3..2c3bb15d2f 100644
--- a/package/kodi-audiodecoder-snesapu/Config.in
+++ b/package/kodi-audiodecoder-snesapu/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_KODI_AUDIODECODER_SNESAPU
 	bool "kodi-audiodecoder-snesapu"
-	select BR2_PACKAGE_KODI_PLATFORM
 	help
 	  SPC decoder addon for Kodi
 
-	  https://github.com/notspiff/audiodecoder.snesapu
+	  https://github.com/xbmc/audiodecoder.snesapu
diff --git a/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.hash b/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.hash
index 877b7a7f9c..8599794c2d 100644
--- a/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.hash
+++ b/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 20d85822d0c01223903b5e5472a1d029fa4931c2a9ac4d399345c4363fa8f905  kodi-audiodecoder-snesapu-1.1.0.tar.gz
+sha256 9abcd4fc02a9a6d5d8976ff0c888668aa31161db48516fe6f9cfe709fc9b9d2d  kodi-audiodecoder-snesapu-5cb318335a3b93ea7cf6b6e94ef781839c9dd9e4.tar.gz
diff --git a/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.mk b/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.mk
index df7a8f09b9..91a80a71ce 100644
--- a/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.mk
+++ b/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-KODI_AUDIODECODER_SNESAPU_VERSION = 1.1.0
-KODI_AUDIODECODER_SNESAPU_SITE = $(call github,notspiff,audiodecoder.snesapu,v$(KODI_AUDIODECODER_SNESAPU_VERSION))
+KODI_AUDIODECODER_SNESAPU_VERSION = 5cb318335a3b93ea7cf6b6e94ef781839c9dd9e4
+KODI_AUDIODECODER_SNESAPU_SITE = $(call github,xbmc,audiodecoder.snesapu,$(KODI_AUDIODECODER_SNESAPU_VERSION))
 KODI_AUDIODECODER_SNESAPU_LICENSE = GPL-2.0+
 KODI_AUDIODECODER_SNESAPU_LICENSE_FILES = src/SPCCodec.cpp
-KODI_AUDIODECODER_SNESAPU_DEPENDENCIES = kodi-platform
+KODI_AUDIODECODER_SNESAPU_DEPENDENCIES = kodi
 
 $(eval $(cmake-package))
diff --git a/package/kodi-audiodecoder-stsound/Config.in b/package/kodi-audiodecoder-stsound/Config.in
index 6be216a2c7..2001e481cd 100644
--- a/package/kodi-audiodecoder-stsound/Config.in
+++ b/package/kodi-audiodecoder-stsound/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_KODI_AUDIODECODER_STSOUND
 	bool "kodi-audiodecoder-stsound"
-	select BR2_PACKAGE_KODI_PLATFORM
 	help
 	  YM decoder addon for Kodi
 
-	  https://github.com/notspiff/audiodecoder.stsound
+	  https://github.com/xbmc/audiodecoder.stsound
diff --git a/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.hash b/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.hash
index 2d70e085d9..6e840a4950 100644
--- a/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.hash
+++ b/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 c9b6e98d544712f7cec3cf18f866ccaed2fbcd20410179259ae0455ffa967ca4  kodi-audiodecoder-stsound-1.1.0.tar.gz
+sha256 dd391f2fb569514730c2ccf6968abf4bb5e1a17068e50728dc431d9efe74e6f5  kodi-audiodecoder-stsound-00d94df7c4414cc90abd0d5114df95a1aa7d9191.tar.gz
diff --git a/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.mk b/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.mk
index f49c614bb2..53155a9a72 100644
--- a/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.mk
+++ b/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-KODI_AUDIODECODER_STSOUND_VERSION = 1.1.0
-KODI_AUDIODECODER_STSOUND_SITE = $(call github,notspiff,audiodecoder.stsound,v$(KODI_AUDIODECODER_STSOUND_VERSION))
+KODI_AUDIODECODER_STSOUND_VERSION = 00d94df7c4414cc90abd0d5114df95a1aa7d9191
+KODI_AUDIODECODER_STSOUND_SITE = $(call github,xbmc,audiodecoder.stsound,$(KODI_AUDIODECODER_STSOUND_VERSION))
 KODI_AUDIODECODER_STSOUND_LICENSE = GPL-2.0+
 KODI_AUDIODECODER_STSOUND_LICENSE_FILES = src/YMCodec.cpp
-KODI_AUDIODECODER_STSOUND_DEPENDENCIES = kodi-platform
+KODI_AUDIODECODER_STSOUND_DEPENDENCIES = kodi
 
 $(eval $(cmake-package))
diff --git a/package/kodi-audiodecoder-timidity/Config.in b/package/kodi-audiodecoder-timidity/Config.in
index 3372dc5c05..ad3caf1e42 100644
--- a/package/kodi-audiodecoder-timidity/Config.in
+++ b/package/kodi-audiodecoder-timidity/Config.in
@@ -3,4 +3,4 @@ config BR2_PACKAGE_KODI_AUDIODECODER_TIMIDITY
 	help
 	  Timidity decoder addon for Kodi
 
-	  https://github.com/notspiff/audiodecoder.timidity
+	  https://github.com/xbmc/audiodecoder.timidity
diff --git a/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.hash b/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.hash
index 34260e9449..e8d5500504 100644
--- a/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.hash
+++ b/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 83a740010dc7fa01101da370c74e79287ebd67bd28d27125e4372abe2fb3bb47  kodi-audiodecoder-timidity-1.1.1.tar.gz
+sha256 3d6ab2fdadb5540410e464462d72ef8ffff8c1cd381171a31245f2edebb84a68  kodi-audiodecoder-timidity-a430ed4ec93cf832e5874a9e08faf294332b6685.tar.gz
diff --git a/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.mk b/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.mk
index a4847e0289..daca8e1656 100644
--- a/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.mk
+++ b/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-KODI_AUDIODECODER_TIMIDITY_VERSION = 1.1.1
-KODI_AUDIODECODER_TIMIDITY_SITE = $(call github,notspiff,audiodecoder.timidity,v$(KODI_AUDIODECODER_TIMIDITY_VERSION))
+KODI_AUDIODECODER_TIMIDITY_VERSION = a430ed4ec93cf832e5874a9e08faf294332b6685
+KODI_AUDIODECODER_TIMIDITY_SITE = $(call github,xbmc,audiodecoder.timidity,$(KODI_AUDIODECODER_TIMIDITY_VERSION))
 KODI_AUDIODECODER_TIMIDITY_LICENSE = GPL-2.0+
 KODI_AUDIODECODER_TIMIDITY_LICENSE_FILES = src/TimidityCodec.cpp
 KODI_AUDIODECODER_TIMIDITY_DEPENDENCIES = kodi
diff --git a/package/kodi-audiodecoder-vgmstream/Config.in b/package/kodi-audiodecoder-vgmstream/Config.in
index ebf83df23b..440edc7cf6 100644
--- a/package/kodi-audiodecoder-vgmstream/Config.in
+++ b/package/kodi-audiodecoder-vgmstream/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_KODI_AUDIODECODER_VGMSTREAM
 	bool "kodi-audiodecoder-vgmstream"
-	select BR2_PACKAGE_KODI_PLATFORM
 	help
 	  VGM decoder addon for Kodi
 
-	  https://github.com/notspiff/audiodecoder.vgmstream
+	  https://github.com/xbmc/audiodecoder.vgmstream
diff --git a/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.hash b/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.hash
index f4cf51aa21..eb6943dca4 100644
--- a/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.hash
+++ b/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 40cd4f7f143c9313a4437854e31c460046af47bd709364439f0e370ec464af0d  kodi-audiodecoder-vgmstream-1.1.0.tar.gz
+sha256 51785e7ad70236c333cb8899b7c0904bd997b56e05b993f6d37ad508b7dcd58b  kodi-audiodecoder-vgmstream-954a097e03a474735d69a65d09f8ffc3b28fa2e9.tar.gz
diff --git a/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.mk b/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.mk
index e89602117e..5efc25522d 100644
--- a/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.mk
+++ b/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-KODI_AUDIODECODER_VGMSTREAM_VERSION = 1.1.0
-KODI_AUDIODECODER_VGMSTREAM_SITE = $(call github,notspiff,audiodecoder.vgmstream,v$(KODI_AUDIODECODER_VGMSTREAM_VERSION))
+KODI_AUDIODECODER_VGMSTREAM_VERSION = 954a097e03a474735d69a65d09f8ffc3b28fa2e9
+KODI_AUDIODECODER_VGMSTREAM_SITE = $(call github,xbmc,audiodecoder.vgmstream,$(KODI_AUDIODECODER_VGMSTREAM_VERSION))
 KODI_AUDIODECODER_VGMSTREAM_LICENSE = GPL-2.0+
 KODI_AUDIODECODER_VGMSTREAM_LICENSE_FILES = src/VGMCodec.cpp
-KODI_AUDIODECODER_VGMSTREAM_DEPENDENCIES = kodi-platform
+KODI_AUDIODECODER_VGMSTREAM_DEPENDENCIES = kodi
 
 $(eval $(cmake-package))
-- 
2.20.1
