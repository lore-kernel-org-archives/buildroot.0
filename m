From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 20 Feb 2021 09:58:47 +0100
Subject: [Buildroot] [PATCH/next 28/54] package/kodi-pvr-vbox: bump version
 to 8.1.0-Matrix
In-Reply-To: <20210220085913.888324-1-bernd.kuhls@t-online.de>
References: <20210220085913.888324-1-bernd.kuhls@t-online.de>
Message-ID: <20210220085913.888324-29-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Switch dependency to kodi after upstream removed the dependency to
kodi-platform:
https://github.com/kodi-pvr/pvr.vbox/commit/29bd329feb6a0b007299636d61f66b9efb526e5f
https://github.com/kodi-pvr/pvr.vbox/commit/b007646f4389ce81f30ca60bdd7b7323e552ee22

Switch license file to LICENSE.md.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-pvr-vbox/Config.in          | 1 -
 package/kodi-pvr-vbox/kodi-pvr-vbox.hash | 4 ++--
 package/kodi-pvr-vbox/kodi-pvr-vbox.mk   | 6 +++---
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/kodi-pvr-vbox/Config.in b/package/kodi-pvr-vbox/Config.in
index c1c22c10d1..202e3c66e8 100644
--- a/package/kodi-pvr-vbox/Config.in
+++ b/package/kodi-pvr-vbox/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_KODI_PVR_VBOX
 	bool "kodi-pvr-vbox"
-	select BR2_PACKAGE_KODI_PLATFORM
 	help
 	  Kodi PVR addon for interfacing with VBox Communications XTi TV
 	  Gateway
diff --git a/package/kodi-pvr-vbox/kodi-pvr-vbox.hash b/package/kodi-pvr-vbox/kodi-pvr-vbox.hash
index b753b994a1..dc186f63f1 100644
--- a/package/kodi-pvr-vbox/kodi-pvr-vbox.hash
+++ b/package/kodi-pvr-vbox/kodi-pvr-vbox.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  98aadcf3d0109a7dc5f85b4e5473d595039b59c46b0686a2fbda88ff7631ee0c  kodi-pvr-vbox-4.7.0-Leia.tar.gz
-sha256  f535b79e33bdf4d270f8aed3fdcb92f807981f808d7f5e3c053c088e5ccf553b  debian/copyright
+sha256  b30548dfbf892f7bedbf191b5a9d93fa978fb794f897268876a1e607518e15af  kodi-pvr-vbox-8.1.0-Matrix.tar.gz
+sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-vbox/kodi-pvr-vbox.mk b/package/kodi-pvr-vbox/kodi-pvr-vbox.mk
index b10bfc5b85..9ce667d496 100644
--- a/package/kodi-pvr-vbox/kodi-pvr-vbox.mk
+++ b/package/kodi-pvr-vbox/kodi-pvr-vbox.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-KODI_PVR_VBOX_VERSION = 4.7.0-Leia
+KODI_PVR_VBOX_VERSION = 8.1.0-Matrix
 KODI_PVR_VBOX_SITE = $(call github,kodi-pvr,pvr.vbox,$(KODI_PVR_VBOX_VERSION))
 KODI_PVR_VBOX_LICENSE = GPL-2.0+
-KODI_PVR_VBOX_LICENSE_FILES = debian/copyright
-KODI_PVR_VBOX_DEPENDENCIES = kodi-platform
+KODI_PVR_VBOX_LICENSE_FILES = LICENSE.md
+KODI_PVR_VBOX_DEPENDENCIES = kodi
 
 $(eval $(cmake-package))
-- 
2.29.2
