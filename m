From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 16 Nov 2014 20:44:19 +0100
Subject: [Buildroot] [RFC/PATCH v6 06/17] Rename xbmc-pvr-addons to
	kodi-pvr-addons - part I - move files
In-Reply-To: <1416167070-27299-1-git-send-email-bernd.kuhls@t-online.de>
References: <1416167070-27299-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1416167070-27299-7-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In a first step to bump version to Helix move the package
to its new directory. Because git will not recognize the moved
files due to many upcoming changes to variable names the move
is done in this seperate commit.

The "Rename xbmc-pvr-addons to kodi-pvr-addons"-patch is split into
two parts for easier review, please apply both patches in one commit.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/{xbmc-pvr-addons => kodi-pvr-addons}/Config.in               |    0
 .../xbmc-pvr-addons.mk => kodi-pvr-addons/kodi-pvr-addons.mk}        |    0
 package/kodi/Config.in                                               |    2 +-
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename package/{xbmc-pvr-addons => kodi-pvr-addons}/Config.in (100%)
 rename package/{xbmc-pvr-addons/xbmc-pvr-addons.mk => kodi-pvr-addons/kodi-pvr-addons.mk} (100%)

diff --git a/package/xbmc-pvr-addons/Config.in b/package/kodi-pvr-addons/Config.in
similarity index 100%
rename from package/xbmc-pvr-addons/Config.in
rename to package/kodi-pvr-addons/Config.in
diff --git a/package/xbmc-pvr-addons/xbmc-pvr-addons.mk b/package/kodi-pvr-addons/kodi-pvr-addons.mk
similarity index 100%
rename from package/xbmc-pvr-addons/xbmc-pvr-addons.mk
rename to package/kodi-pvr-addons/kodi-pvr-addons.mk
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 2dcd8b3..c7c7f5b 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -238,6 +238,6 @@ config BR2_PACKAGE_KODI_WAVPACK
 comment "Kodi addons"
 
 source "package/xbmc-addon-xvdr/Config.in"
-source "package/xbmc-pvr-addons/Config.in"
+source "package/kodi-pvr-addons/Config.in"
 
 endif # BR2_PACKAGE_KODI
-- 
1.7.10.4
