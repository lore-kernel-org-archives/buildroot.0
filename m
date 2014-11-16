From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 16 Nov 2014 20:44:24 +0100
Subject: [Buildroot] [RFC/PATCH v6 11/17] package/kodi-addon-xvdr: Bump
	version for Helix-compatibility
In-Reply-To: <1416167070-27299-1-git-send-email-bernd.kuhls@t-online.de>
References: <1416167070-27299-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1416167070-27299-12-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-addon-xvdr/0001-xbmc-rebrand.patch |   19 +++++++++++++++++++
 package/kodi-addon-xvdr/kodi-addon-xvdr.mk      |    4 ++--
 2 files changed, 21 insertions(+), 2 deletions(-)
 create mode 100644 package/kodi-addon-xvdr/0001-xbmc-rebrand.patch

diff --git a/package/kodi-addon-xvdr/0001-xbmc-rebrand.patch b/package/kodi-addon-xvdr/0001-xbmc-rebrand.patch
new file mode 100644
index 0000000..6e87b79
--- /dev/null
+++ b/package/kodi-addon-xvdr/0001-xbmc-rebrand.patch
@@ -0,0 +1,19 @@
+Update for Kodi
+
+Ported from OpenELEC:
+https://github.com/OpenELEC/OpenELEC.tv/blob/master/packages/mediacenter/kodi-addon-xvdr/patches/kodi-addon-xvdr-xbmc-rebrand.patch
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -Naur xbmc-addon-xvdr-2bf2563/configure.ac xbmc-addon-xvdr-2bf2563.patch/configure.ac
+--- xbmc-addon-xvdr-2bf2563/configure.ac	2014-10-18 22:02:18.000000000 +0200
++++ xbmc-addon-xvdr-2bf2563.patch/configure.ac	2014-10-20 03:03:20.525526996 +0200
+@@ -6,7 +6,7 @@
+ AC_INIT([xbmc-addon-xvdr], [MAJOR.MINOR.MICRO], [alexander.pipelka at gmail.com])
+ 
+ AC_CONFIG_AUX_DIR(autotools)
+-AC_PREFIX_DEFAULT(/usr/lib/xbmc)
++AC_PREFIX_DEFAULT(/usr/lib/kodi)
+ 
+ AC_CANONICAL_HOST
+ AC_CANONICAL_TARGET
diff --git a/package/kodi-addon-xvdr/kodi-addon-xvdr.mk b/package/kodi-addon-xvdr/kodi-addon-xvdr.mk
index 14b08fe..e05510c 100644
--- a/package/kodi-addon-xvdr/kodi-addon-xvdr.mk
+++ b/package/kodi-addon-xvdr/kodi-addon-xvdr.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-# This cset is on master. When a Gotham branch is made, we should
+# This cset is on master. When a Helix branch is made, we should
 # follow it, as incompatible changes in the plugins API can happen
 # on the master branch.
-KODI_ADDON_XVDR_VERSION = 82b5093ad33847f97a978cb620c9a87d2dbcf7eb
+KODI_ADDON_XVDR_VERSION = 328fa653b821a4edc1256a13833f30a4483e2819
 KODI_ADDON_XVDR_SITE = $(call github,pipelka,xbmc-addon-xvdr,$(KODI_ADDON_XVDR_VERSION))
 KODI_ADDON_XVDR_LICENSE = GPLv2+
 KODI_ADDON_XVDR_LICENSE_FILES = COPYING
-- 
1.7.10.4
