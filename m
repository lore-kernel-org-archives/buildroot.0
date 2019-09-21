From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 21 Sep 2019 21:28:18 +0200
Subject: [Buildroot] [PATCH v6 17/25] package/kodi-pvr-mediaportal-tvserver:
 bump version
In-Reply-To: <20190921192826.10143-1-bernd.kuhls@t-online.de>
References: <20190921192826.10143-1-bernd.kuhls@t-online.de>
Message-ID: <20190921192826.10143-18-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed patch, not needed anymore after PR 81.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...e555-remove-xlocale.h-from-Locale.hh.patch | 33 -------------------
 .../kodi-pvr-mediaportal-tvserver.hash        |  2 +-
 .../kodi-pvr-mediaportal-tvserver.mk          |  4 +--
 3 files changed, 2 insertions(+), 37 deletions(-)
 delete mode 100644 package/kodi-pvr-mediaportal-tvserver/0001-live555-remove-xlocale.h-from-Locale.hh.patch

diff --git a/package/kodi-pvr-mediaportal-tvserver/0001-live555-remove-xlocale.h-from-Locale.hh.patch b/package/kodi-pvr-mediaportal-tvserver/0001-live555-remove-xlocale.h-from-Locale.hh.patch
deleted file mode 100644
index 7abb153b0e..0000000000
--- a/package/kodi-pvr-mediaportal-tvserver/0001-live555-remove-xlocale.h-from-Locale.hh.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 64b264d141fd80991ac071c5370802e2d7394f6d Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Sun, 3 Dec 2017 22:17:12 +0100
-Subject: [PATCH] live555: remove xlocale.h from Locale.hh
-
-Fixes build error with glibc 2.26:
-https://sourceware.org/glibc/wiki/Release/2.26#Removal_of_.27xlocale.h.27
-
-Patch sent upstream:
-https://github.com/kodi-pvr/pvr.mediaportal.tvserver/pull/79
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- src/lib/live555/liveMedia/include/Locale.hh | 3 ---
- 1 file changed, 3 deletions(-)
-
-diff --git a/src/lib/live555/liveMedia/include/Locale.hh b/src/lib/live555/liveMedia/include/Locale.hh
-index b327948..c4b4f4a 100644
---- a/src/lib/live555/liveMedia/include/Locale.hh
-+++ b/src/lib/live555/liveMedia/include/Locale.hh
-@@ -43,9 +43,6 @@ along with this library; if not, write to the Free Software Foundation, Inc.,
- 
- #ifndef LOCALE_NOT_USED
- #include <locale.h>
--#ifndef XLOCALE_NOT_USED
--#include <xlocale.h> // because, on some systems, <locale.h> doesn't include <xlocale.h>; this makes sure that we get both
--#endif
- #endif
- 
- 
--- 
-2.11.0
-
diff --git a/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.hash b/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.hash
index 6eb0abfbaf..147033071f 100644
--- a/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.hash
+++ b/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 3f5c022f83636b3739f26c1a07166b498eac82e8081ed7551980f4bb27c6b56e  kodi-pvr-mediaportal-tvserver-2.4.19v2-Krypton.tar.gz
+sha256 6e3727d51230fcfe19e180f4fb3156d8fa5e387d080d21e5462fb170ab8ddeb3  kodi-pvr-mediaportal-tvserver-6d6974a6e46ff9a268500aafa30d256446ee2303.tar.gz
diff --git a/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.mk b/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.mk
index 99a318911e..e36833bd7a 100644
--- a/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.mk
+++ b/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.mk
@@ -4,9 +4,7 @@
 #
 ################################################################################
 
-# This cset is on the branch 'Krypton'
-# When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_MEDIAPORTAL_TVSERVER_VERSION = 2.4.19v2-Krypton
+KODI_PVR_MEDIAPORTAL_TVSERVER_VERSION = 6d6974a6e46ff9a268500aafa30d256446ee2303
 KODI_PVR_MEDIAPORTAL_TVSERVER_SITE = $(call github,kodi-pvr,pvr.mediaportal.tvserver,$(KODI_PVR_MEDIAPORTAL_TVSERVER_VERSION))
 KODI_PVR_MEDIAPORTAL_TVSERVER_LICENSE = GPL-2.0+
 KODI_PVR_MEDIAPORTAL_TVSERVER_LICENSE_FILES = src/client.h
-- 
2.20.1
