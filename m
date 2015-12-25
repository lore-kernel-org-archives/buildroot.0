From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 25 Dec 2015 22:24:37 +0100
Subject: [Buildroot] [PATCH 08/84 RFC] package/alsa-utils: use 'menuconfig'
	instead of 'config'+'menu'
In-Reply-To: <cover.1451076704.git.yann.morin.1998@free.fr>
References: <cover.1451076704.git.yann.morin.1998@free.fr>
Message-ID: <dfe3c11a00f2b3eec4b08215bf6e7210a2a8647c.1451076704.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/alsa-utils/Config.in | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/alsa-utils/Config.in b/package/alsa-utils/Config.in
index a08743e..762fcdf 100644
--- a/package/alsa-utils/Config.in
+++ b/package/alsa-utils/Config.in
@@ -2,7 +2,7 @@ comment "alsa-utils needs a toolchain w/ threads"
 	depends on BR2_USE_MMU # fork
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
 
-config BR2_PACKAGE_ALSA_UTILS
+menuconfig BR2_PACKAGE_ALSA_UTILS
 	bool "alsa-utils"
 	depends on BR2_USE_MMU # fork
 	depends on BR2_TOOLCHAIN_HAS_THREADS # alsa-lib
@@ -15,7 +15,8 @@ config BR2_PACKAGE_ALSA_UTILS
 	  http://www.alsa-project.org/
 
 if BR2_PACKAGE_ALSA_UTILS
-menu "ALSA utils selection"
+
+comment  "ALSA utils selection"
 
 config BR2_PACKAGE_ALSA_UTILS_ALSACONF
 	bool "alsaconf"
@@ -85,6 +86,4 @@ config BR2_PACKAGE_ALSA_UTILS_SPEAKER_TEST
 	select BR2_PACKAGE_ALSA_LIB_PCM
 	bool "speaker-test"
 
-endmenu
-
 endif
-- 
1.9.1
