From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 16 May 2021 13:05:36 +0200
Subject: [Buildroot] [PATCH 1/1] package/kodi: add CPE variables
Message-ID: <20210516110536.3773761-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:kodi:kodi is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Akodi%3Akodi

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/kodi/kodi.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 47d3bd75c5..a5c9db1d7e 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -6,10 +6,14 @@
 
 # When updating the version, please also update kodi-jsonschemabuilder
 # and kodi-texturepacker
-KODI_VERSION = 19.1-Matrix
+KODI_VERSION_MAJOR = 19.1
+KODI_VERSION_NAME = Matrix
+KODI_VERSION = $(KODI_VERSION_MAJOR)-$(KODI_VERSION_NAME)
 KODI_SITE = $(call github,xbmc,xbmc,$(KODI_VERSION))
 KODI_LICENSE = GPL-2.0
 KODI_LICENSE_FILES = LICENSE.md
+KODI_CPE_ID_VENDOR = kodi
+KODI_CPE_ID_VERSION = $(KODI_VERSION_MAJOR)
 # needed for binary addons
 KODI_INSTALL_STAGING = YES
 # kodi recommends building out-of-source
-- 
2.30.2
