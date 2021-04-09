From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 9 Apr 2021 22:46:18 +0200
Subject: [Buildroot] [git commit] package/kodi-pvr-iptvsimple: bump version
 to 7.6.1-Matrix
Message-ID: <20210409202421.82CE580577@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=25135631d22e5c581984a0006847df5a5ea790bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
https://github.com/kodi-pvr/pvr.iptvsimple/blob/Matrix/pvr.iptvsimple/changelog.txt

Upstream added a dependency to xz:
https://github.com/kodi-pvr/pvr.iptvsimple/commit/8f19dac9a5f394d44a16fcfa4235ea8c11e9cc96

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/kodi-pvr-iptvsimple/Config.in                | 1 +
 package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash | 2 +-
 package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk   | 4 ++--
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/kodi-pvr-iptvsimple/Config.in b/package/kodi-pvr-iptvsimple/Config.in
index 00f4d115bf..2f5a208bad 100644
--- a/package/kodi-pvr-iptvsimple/Config.in
+++ b/package/kodi-pvr-iptvsimple/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_KODI_PVR_IPTVSIMPLE
 	select BR2_PACKAGE_KODI_INPUTSTREAM_FFMPEGDIRECT # runtime
 	select BR2_PACKAGE_KODI_INPUTSTREAM_RTMP # runtime
 	select BR2_PACKAGE_PUGIXML
+	select BR2_PACKAGE_XZ
 	select BR2_PACKAGE_ZLIB
 	help
 	  IPTV Live TV and Radio PVR client addon for Kodi
diff --git a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash
index 4a9b45999d..767f77cca8 100644
--- a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash
+++ b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  97cd991b9b6688db1956e853c0af9df7c20cfd645d348f72df2ad1bfc9c23528  kodi-pvr-iptvsimple-7.6.0-Matrix.tar.gz
+sha256  0bffd09eba7cf758a818607562b4dec53f4a20acb7a8b43dd0a1499e92cb3057  kodi-pvr-iptvsimple-7.6.1-Matrix.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
index 51575e76a9..cf8d755766 100644
--- a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
+++ b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-KODI_PVR_IPTVSIMPLE_VERSION = 7.6.0-Matrix
+KODI_PVR_IPTVSIMPLE_VERSION = 7.6.1-Matrix
 KODI_PVR_IPTVSIMPLE_SITE = $(call github,kodi-pvr,pvr.iptvsimple,$(KODI_PVR_IPTVSIMPLE_VERSION))
 KODI_PVR_IPTVSIMPLE_LICENSE = GPL-2.0+
 KODI_PVR_IPTVSIMPLE_LICENSE_FILES = LICENSE.md
-KODI_PVR_IPTVSIMPLE_DEPENDENCIES = kodi pugixml zlib
+KODI_PVR_IPTVSIMPLE_DEPENDENCIES = kodi pugixml xz zlib
 
 $(eval $(cmake-package))
