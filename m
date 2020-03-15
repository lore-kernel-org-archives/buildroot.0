From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Mar 2020 15:25:46 +0100
Subject: [Buildroot] [git commit] package/kodi-screensaver-pyro: bump
 version to 3.0.1-Leia
Message-ID: <20200315141419.DB43E805AA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7fc97af090e456b16c918b4d3010bd6a9b9f49de
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop 0001-Add-missing-stddef-include.patch as it is now upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-Add-missing-stddef-include.patch          | 25 ----------------------
 .../kodi-screensaver-pyro.hash                     |  4 ++--
 .../kodi-screensaver-pyro/kodi-screensaver-pyro.mk |  2 +-
 3 files changed, 3 insertions(+), 28 deletions(-)

diff --git a/package/kodi-screensaver-pyro/0001-Add-missing-stddef-include.patch b/package/kodi-screensaver-pyro/0001-Add-missing-stddef-include.patch
deleted file mode 100644
index c463d42d58..0000000000
--- a/package/kodi-screensaver-pyro/0001-Add-missing-stddef-include.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From e1dbe7822b35b889fdc5ea54114ad3f9669d440e Mon Sep 17 00:00:00 2001
-From: Rechi <Rechi@users.noreply.github.com>
-Date: Sun, 24 Mar 2019 10:55:44 +0100
-Subject: [PATCH] [fix] add missing stddef.h include for offsetof macro
-
-Downloaded from upstream commit in master branch:
-https://github.com/xbmc/screensaver.pyro/commit/e1dbe7822b35b889fdc5ea54114ad3f9669d440e
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- src/Pyro.cpp | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/Pyro.cpp b/src/Pyro.cpp
-index 3f873a2..6dfa764 100644
---- a/src/Pyro.cpp
-+++ b/src/Pyro.cpp
-@@ -34,6 +34,7 @@
- #include "Pyro.h"
- #include <stdio.h>
- #include <math.h>
-+#include <stddef.h>
- #include <stdlib.h>
- 
- #ifdef WIN32
diff --git a/package/kodi-screensaver-pyro/kodi-screensaver-pyro.hash b/package/kodi-screensaver-pyro/kodi-screensaver-pyro.hash
index fc41e80ee4..16a37d3161 100644
--- a/package/kodi-screensaver-pyro/kodi-screensaver-pyro.hash
+++ b/package/kodi-screensaver-pyro/kodi-screensaver-pyro.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  55f867b703e5cf409f8e0a8a2c34373f896feb990004b5901b4efaee905d42e5  kodi-screensaver-pyro-3.0.0-Leia.tar.gz
-sha256  b945c014a69091c728caa3fca547c2747911e61e1dd2cef9928cf92a6a45655f  src/Pyro.cpp
+sha256 cf9ed582b70460682175366641e6a00eaea085a1d3477a02710ba8398a1d17bd  kodi-screensaver-pyro-3.0.1-Leia.tar.gz
+sha256 b945c014a69091c728caa3fca547c2747911e61e1dd2cef9928cf92a6a45655f  src/Pyro.cpp
diff --git a/package/kodi-screensaver-pyro/kodi-screensaver-pyro.mk b/package/kodi-screensaver-pyro/kodi-screensaver-pyro.mk
index 7b3b63ab7f..880212ee72 100644
--- a/package/kodi-screensaver-pyro/kodi-screensaver-pyro.mk
+++ b/package/kodi-screensaver-pyro/kodi-screensaver-pyro.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_PYRO_VERSION = 3.0.0-Leia
+KODI_SCREENSAVER_PYRO_VERSION = 3.0.1-Leia
 KODI_SCREENSAVER_PYRO_SITE = $(call github,xbmc,screensaver.pyro,$(KODI_SCREENSAVER_PYRO_VERSION))
 KODI_SCREENSAVER_PYRO_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_PYRO_LICENSE_FILES = src/Pyro.cpp
