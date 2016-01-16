From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 16 Jan 2016 23:36:54 +0100
Subject: [Buildroot] [PATCH 02/80 v1] package/alsa-utils: use 'menuconfig'
	instead of 'config'+'menu'
In-Reply-To: <cover.1452983019.git.yann.morin.1998@free.fr>
References: <cover.1452983019.git.yann.morin.1998@free.fr>
Message-ID: <4862be3b3302f02ec01c991a06fd38786343eaf2.1452983019.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop the now useless comment.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
Changes RFC -> v1:
  - drop comment  (Arnout)
---
 package/alsa-utils/Config.in | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/package/alsa-utils/Config.in b/package/alsa-utils/Config.in
index 82f3ad6..ea3c5bd 100644
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
@@ -89,6 +88,4 @@ config BR2_PACKAGE_ALSA_UTILS_SPEAKER_TEST
 	bool "speaker-test"
 	select BR2_PACKAGE_ALSA_LIB_PCM
 
-endmenu
-
 endif
-- 
1.9.1
