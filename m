From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 29 Apr 2018 20:00:21 +0200
Subject: [Buildroot] [PATCH 1/1] libmatroska: bump to version 1.4.9
Message-ID: <20180429180021.19938-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Use tar.xz (tar.bz2 is not available since 1.4.8)
- Use cmake infrastructure (autotools has been removed)
- Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libmatroska/libmatroska.hash | 3 ++-
 package/libmatroska/libmatroska.mk   | 6 +++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/libmatroska/libmatroska.hash b/package/libmatroska/libmatroska.hash
index 275af63995..e42a9b2824 100644
--- a/package/libmatroska/libmatroska.hash
+++ b/package/libmatroska/libmatroska.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256	d3efaa9f6d3964351a05bea0f848a8d5dc570e4791f179816ce9a93730296bd7	libmatroska-1.4.4.tar.bz2
+sha256	38a61dd5d87c070928b5deb3922b63b2b83c09e2e4a10f9393eecb6afa9795c8	libmatroska-1.4.9.tar.xz
+sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551	LICENSE.LGPL
diff --git a/package/libmatroska/libmatroska.mk b/package/libmatroska/libmatroska.mk
index 18ea505af0..b8d0d84d35 100644
--- a/package/libmatroska/libmatroska.mk
+++ b/package/libmatroska/libmatroska.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-LIBMATROSKA_VERSION = 1.4.4
-LIBMATROSKA_SOURCE = libmatroska-$(LIBMATROSKA_VERSION).tar.bz2
+LIBMATROSKA_VERSION = 1.4.9
+LIBMATROSKA_SOURCE = libmatroska-$(LIBMATROSKA_VERSION).tar.xz
 LIBMATROSKA_SITE = http://dl.matroska.org/downloads/libmatroska
 LIBMATROSKA_INSTALL_STAGING = YES
 LIBMATROSKA_LICENSE = LGPL-2.1+
 LIBMATROSKA_LICENSE_FILES = LICENSE.LGPL
 LIBMATROSKA_DEPENDENCIES = libebml host-pkgconf
 
-$(eval $(autotools-package))
+$(eval $(cmake-package))
-- 
2.14.1
