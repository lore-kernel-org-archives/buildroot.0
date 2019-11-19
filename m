From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 Nov 2019 10:35:50 +0100
Subject: [Buildroot] [git commit branch/2019.08.x] package/kodi: share the
 download dir with helper programs
Message-ID: <20191119092824.C3C9B8F351@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8dd537aeca14efd52ef570b1d1dc6f2f67c9ce2f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

The two helper programs TexturePackager and JsonSchemaBuilder are built
out of the same source tree as Kodi, so to avoid downloading the same
archive three times, let's them share the same download directory.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit ce9a16fdfe4702e18c143e720aa1da5788de2ea0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
