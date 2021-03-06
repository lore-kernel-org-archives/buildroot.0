From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 6 Mar 2021 22:56:49 +0100
Subject: [Buildroot] [git commit] package/kodi-pvr-stalker: bump version to
 7.1.0-Matrix
Message-ID: <20210308072138.905598896D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=269e9548cdb8335ecae9d5f6028faaaf27782ef0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch dependency to kodi after upstream removed the dependency to
kodi-platform:
https://github.com/kodi-pvr/pvr.stalker/commit/8cee21986877bd4d324d078203e2bd9101e794ec
https://github.com/kodi-pvr/pvr.stalker/commit/e30167549bbd7a33b2aca4bdc93ddf9e2b83c442

Switch license file to LICENSE.md.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kodi-pvr-stalker/Config.in             | 1 -
 package/kodi-pvr-stalker/kodi-pvr-stalker.hash | 4 ++--
 package/kodi-pvr-stalker/kodi-pvr-stalker.mk   | 6 +++---
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/kodi-pvr-stalker/Config.in b/package/kodi-pvr-stalker/Config.in
index d334d0c2cb..f82d5a497f 100644
--- a/package/kodi-pvr-stalker/Config.in
+++ b/package/kodi-pvr-stalker/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_KODI_PVR_STALKER
 	bool "kodi-pvr-stalker"
 	select BR2_PACKAGE_JSONCPP
-	select BR2_PACKAGE_KODI_PLATFORM
 	select BR2_PACKAGE_LIBXML2
 	help
 	  A PVR Client that connects Kodi to Stalker Middleware
diff --git a/package/kodi-pvr-stalker/kodi-pvr-stalker.hash b/package/kodi-pvr-stalker/kodi-pvr-stalker.hash
index cc129d90ec..545af9ec7e 100644
--- a/package/kodi-pvr-stalker/kodi-pvr-stalker.hash
+++ b/package/kodi-pvr-stalker/kodi-pvr-stalker.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  03eb428f21d6b8526b6671278b60ac6dc5a761a515af27172d8ac5c814cc3f65  kodi-pvr-stalker-3.4.10-Leia.tar.gz
-sha256  f9fa34b2caa07376a7a976c1f0b1b9761b37449afd4ceb1e7afa283492054237  debian/copyright
+sha256  bce055008d0ae7212924f41753970e3176a218f6a45bd76b202463a43be3d192  kodi-pvr-stalker-7.1.0-Matrix.tar.gz
+sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-stalker/kodi-pvr-stalker.mk b/package/kodi-pvr-stalker/kodi-pvr-stalker.mk
index 0ae41171a9..5ca466981c 100644
--- a/package/kodi-pvr-stalker/kodi-pvr-stalker.mk
+++ b/package/kodi-pvr-stalker/kodi-pvr-stalker.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-KODI_PVR_STALKER_VERSION = 3.4.10-Leia
+KODI_PVR_STALKER_VERSION = 7.1.0-Matrix
 KODI_PVR_STALKER_SITE = $(call github,kodi-pvr,pvr.stalker,$(KODI_PVR_STALKER_VERSION))
 KODI_PVR_STALKER_LICENSE = GPL-2.0+
-KODI_PVR_STALKER_LICENSE_FILES = debian/copyright
-KODI_PVR_STALKER_DEPENDENCIES = jsoncpp kodi-platform libxml2
+KODI_PVR_STALKER_LICENSE_FILES = LICENSE.md
+KODI_PVR_STALKER_DEPENDENCIES = jsoncpp kodi libxml2
 
 $(eval $(cmake-package))
