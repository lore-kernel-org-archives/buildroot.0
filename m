From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 13 Nov 2019 21:44:12 +0100
Subject: [Buildroot] [PATCH] package/kodi: share the download dir with
 helper programs
Message-ID: <20191113204412.27018-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The two helper programs TesturePackager and JsonSchemaBuilder are built
out of the same source tree as Kodi, so to avoid downloading the same
archive three times, let's them share the same download directory.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk | 1 +
 package/kodi-texturepacker/kodi-texturepacker.mk         | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk b/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk
index fcf4888a9c..713d415fed 100644
--- a/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk
+++ b/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk
@@ -9,6 +9,7 @@
 KODI_JSONSCHEMABUILDER_VERSION = 17.6-Krypton
 KODI_JSONSCHEMABUILDER_SITE = $(call github,xbmc,xbmc,$(KODI_JSONSCHEMABUILDER_VERSION))
 KODI_JSONSCHEMABUILDER_SOURCE = kodi-$(KODI_JSONSCHEMABUILDER_VERSION).tar.gz
+KODI_JSONSCHEMABUILDER_DL_SUBDIR = kodi
 KODI_JSONSCHEMABUILDER_LICENSE = GPL-2.0
 KODI_JSONSCHEMABUILDER_LICENSE_FILES = LICENSE.GPL
 HOST_KODI_JSONSCHEMABUILDER_SUBDIR = tools/depends/native/JsonSchemaBuilder
diff --git a/package/kodi-texturepacker/kodi-texturepacker.mk b/package/kodi-texturepacker/kodi-texturepacker.mk
index 31e3580aed..bb35252b94 100644
--- a/package/kodi-texturepacker/kodi-texturepacker.mk
+++ b/package/kodi-texturepacker/kodi-texturepacker.mk
@@ -9,6 +9,7 @@
 KODI_TEXTUREPACKER_VERSION = 17.6-Krypton
 KODI_TEXTUREPACKER_SITE = $(call github,xbmc,xbmc,$(KODI_TEXTUREPACKER_VERSION))
 KODI_TEXTUREPACKER_SOURCE = kodi-$(KODI_TEXTUREPACKER_VERSION).tar.gz
+KODI_TEXTUREPACKER_DL_SUBDIR = kodi
 KODI_TEXTUREPACKER_LICENSE = GPL-2.0
 KODI_TEXTUREPACKER_LICENSE_FILES = LICENSE.GPL
 HOST_KODI_TEXTUREPACKER_SUBDIR = tools/depends/native/TexturePacker
-- 
2.20.1
