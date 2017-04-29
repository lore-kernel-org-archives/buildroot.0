From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Apr 2017 11:59:14 +0200
Subject: [Buildroot] [git commit] package/kodi-audiodecoder-timidity: bump
	version
Message-ID: <20170429101426.D74FF818B3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=781af1dbaa5df9bd3836aefab7cc0f365ed1a781
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

kodi-platform is not a dependency anymore:
https://github.com/notspiff/audiodecoder.timidity/commit/b7ae86ad860b562f08ab02d9e87a546d99f1bb51

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kodi-audiodecoder-timidity/Config.in                       | 1 -
 package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.hash | 2 +-
 package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.mk   | 4 ++--
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/kodi-audiodecoder-timidity/Config.in b/package/kodi-audiodecoder-timidity/Config.in
index 8f604ad..3372dc5 100644
--- a/package/kodi-audiodecoder-timidity/Config.in
+++ b/package/kodi-audiodecoder-timidity/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_KODI_AUDIODECODER_TIMIDITY
 	bool "kodi-audiodecoder-timidity"
-	select BR2_PACKAGE_KODI_PLATFORM
 	help
 	  Timidity decoder addon for Kodi
 
diff --git a/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.hash b/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.hash
index d4af019..5711b87 100644
--- a/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.hash
+++ b/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 2e220b7d279fce73ff289536cd9e94b159ae648514fb8b423977dddb99c50e85 kodi-audiodecoder-timidity-a84559da92aa67744069fc9e9dc885732588c8ce.tar.gz
+sha256 83a740010dc7fa01101da370c74e79287ebd67bd28d27125e4372abe2fb3bb47  kodi-audiodecoder-timidity-v1.1.1.tar.gz
diff --git a/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.mk b/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.mk
index 0d5f6ef..e4a97fa 100644
--- a/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.mk
+++ b/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-KODI_AUDIODECODER_TIMIDITY_VERSION = a84559da92aa67744069fc9e9dc885732588c8ce
+KODI_AUDIODECODER_TIMIDITY_VERSION = v1.1.1
 KODI_AUDIODECODER_TIMIDITY_SITE = $(call github,notspiff,audiodecoder.timidity,$(KODI_AUDIODECODER_TIMIDITY_VERSION))
 KODI_AUDIODECODER_TIMIDITY_LICENSE = GPL-2.0+
 KODI_AUDIODECODER_TIMIDITY_LICENSE_FILES = src/TimidityCodec.cpp
-KODI_AUDIODECODER_TIMIDITY_DEPENDENCIES = kodi-platform
+KODI_AUDIODECODER_TIMIDITY_DEPENDENCIES = kodi
 
 $(eval $(cmake-package))
