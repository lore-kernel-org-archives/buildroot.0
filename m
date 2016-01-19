From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Jan 2016 22:22:54 +0100
Subject: [Buildroot] [git commit] package/alsa-utils: use 'menuconfig'
	instead of 'config'+'menu'
Message-ID: <20160119212303.9E0C77FC1B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=47996624b5ebc929ab1e0a244ed39c8e10cb5cd1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop the now useless comment.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/alsa-utils/Config.in | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/package/alsa-utils/Config.in b/package/alsa-utils/Config.in
index 9b8e8c0..b58e658 100644
--- a/package/alsa-utils/Config.in
+++ b/package/alsa-utils/Config.in
@@ -2,7 +2,7 @@ comment "alsa-utils needs a toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU # fork
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
 
-config BR2_PACKAGE_ALSA_UTILS
+menuconfig BR2_PACKAGE_ALSA_UTILS
 	bool "alsa-utils"
 	depends on BR2_USE_MMU # fork
 	depends on BR2_TOOLCHAIN_HAS_THREADS # alsa-lib
@@ -16,7 +16,6 @@ config BR2_PACKAGE_ALSA_UTILS
 	  http://www.alsa-project.org/
 
 if BR2_PACKAGE_ALSA_UTILS
-menu "ALSA utils selection"
 
 config BR2_PACKAGE_ALSA_UTILS_ALSACONF
 	bool "alsaconf"
@@ -92,6 +91,4 @@ config BR2_PACKAGE_ALSA_UTILS_SPEAKER_TEST
 	bool "speaker-test"
 	select BR2_PACKAGE_ALSA_LIB_PCM
 
-endmenu
-
 endif
