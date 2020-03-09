From: =?UTF-8?q?Andr=C3=A9=20Hentschel?= <nerv@dawncrow.de>
Date: Mon,  9 Mar 2020 22:31:49 +0100
Subject: [Buildroot] [PATCH] package/wine: bump to version 5.0
Message-ID: <20200309213149.26372-1-nerv@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
---
 package/wine/wine.hash | 4 ++--
 package/wine/wine.mk   | 6 ++++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/wine/wine.hash b/package/wine/wine.hash
index eeb30c9a9f..e6d0ef88ed 100644
--- a/package/wine/wine.hash
+++ b/package/wine/wine.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256 25026d9f98a5d62583b8a02c91b1adaca9a2ff000d54095bb274045379e00fda wine-4.0.3.tar.xz
+sha256 181550ba69a80b00c631f80c28ff7642264613bbecdb0c0fc04d6534866713b4 wine-5.0.tar.xz
 # Locally calculated
 sha256 e237fa56668030e928551ddd60f05df5fe957f75eab874bbd017e085ed722e7c COPYING.LIB
-sha256 d29132813288a9b6034a79c53b22dbb1b078c70cec5c9bb731ae574cf812aa54 LICENSE
+sha256 f3ca909e68d38c972e8ded5248b4745958dbb26f2e581ad73cfbedb6b0408e58 LICENSE
diff --git a/package/wine/wine.mk b/package/wine/wine.mk
index f315d90994..a4b6c6a15f 100644
--- a/package/wine/wine.mk
+++ b/package/wine/wine.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-WINE_VERSION = 4.0.3
+WINE_VERSION = 5.0
 WINE_SOURCE = wine-$(WINE_VERSION).tar.xz
-WINE_SITE = https://dl.winehq.org/wine/source/4.0
+WINE_SITE = https://dl.winehq.org/wine/source/5.0
 WINE_LICENSE = LGPL-2.1+
 WINE_LICENSE_FILES = COPYING.LIB LICENSE
 WINE_DEPENDENCIES = host-bison host-flex host-wine
@@ -19,6 +19,7 @@ WINE_CONF_OPTS = \
 	--disable-win64 \
 	--without-capi \
 	--without-coreaudio \
+	--without-faudio \
 	--without-gettext \
 	--without-gettextpo \
 	--without-gphoto \
@@ -357,6 +358,7 @@ HOST_WINE_CONF_OPTS += \
 	--without-capi \
 	--without-cms \
 	--without-coreaudio \
+	--without-faudio \
 	--without-cups \
 	--without-curses \
 	--without-dbus \
-- 
2.17.1
