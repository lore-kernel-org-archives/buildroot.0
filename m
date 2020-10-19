From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 19 Oct 2020 23:34:27 +0200
Subject: [Buildroot] [PATCH 1/1] package/libraw: security bump to version
 0.20.2
Message-ID: <20201019213427.790231-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix CVE-2020-24890: libraw 20.0 has a null pointer dereference
vulnerability in parse_tiff_ifd in src/metadata/tiff.cpp, which may
result in context-dependent arbitrary code execution.

https://www.libraw.org/news/libraw-0-20-2-Release

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libraw/libraw.hash | 2 +-
 package/libraw/libraw.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libraw/libraw.hash b/package/libraw/libraw.hash
index e8117cd1f1..f2a01c277b 100644
--- a/package/libraw/libraw.hash
+++ b/package/libraw/libraw.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  1f0a383da2ce9f409087facd28261decbf6be72cc90c78cd003b0766e4d694a3  LibRaw-0.20.0.tar.gz
+sha256  dc1b486c2003435733043e4e05273477326e51c3ea554c6864a4eafaff1004a6  LibRaw-0.20.2.tar.gz
 sha256  eea173a556abac0370461e57e12aab266894ea6be3874c2be05fd87871f75449  LICENSE.LGPL
 sha256  0e3098d2d54a12434715f6679ea408d57da5e8d613c385c58ecc6fe5d30cc81f  LICENSE.CDDL
 sha256  313415f7f48f6cd3cc78856626aab4bbe97dbb1e9a11db9c25396ca8d0e76cd9  README.md
diff --git a/package/libraw/libraw.mk b/package/libraw/libraw.mk
index e33674e6f5..acfa4dbe37 100644
--- a/package/libraw/libraw.mk
+++ b/package/libraw/libraw.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBRAW_VERSION = 0.20.0
+LIBRAW_VERSION = 0.20.2
 LIBRAW_SOURCE = LibRaw-$(LIBRAW_VERSION).tar.gz
 LIBRAW_SITE = http://www.libraw.org/data
 LIBRAW_INSTALL_STAGING = YES
-- 
2.28.0
