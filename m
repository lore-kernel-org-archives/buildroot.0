From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  1 May 2020 14:05:07 +0200
Subject: [Buildroot] [PATCH 1/1] package/jbig2dec: security bump to version
 0.18
Message-ID: <20200501120507.2197851-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Fix CVE-2020-12268: jbig2_image_compose in jbig2_image.c in Artifex
  jbig2dec before 0.18 has a heap-based buffer overflow.
- Add JBIG2DEC_AUTORECONF=YES otherwise build will fail because
  install-sh has been removed from the tarball
- Update indentation of hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/jbig2dec/jbig2dec.hash | 6 +++---
 package/jbig2dec/jbig2dec.mk   | 6 ++++--
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/jbig2dec/jbig2dec.hash b/package/jbig2dec/jbig2dec.hash
index eb2b674443..86584b19a6 100644
--- a/package/jbig2dec/jbig2dec.hash
+++ b/package/jbig2dec/jbig2dec.hash
@@ -1,7 +1,7 @@
-# https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs927/MD5SUMS
+# https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs952/MD5SUMS
 # and SHA512SUMS are missing the hashes for this file.
 # Locally computed:
-sha256 a4f6bf15d217e7816aa61b92971597c801e81f0a63f9fe1daee60fb88e0f0602  jbig2dec-0.16.tar.gz
+sha256  9e19775237350e299c422b7b91b0c045e90ffa4ba66abf28c8fb5eb005772f5e  jbig2dec-0.18.tar.gz
 
 # Hash for license files:
-sha256 1bf5258afe453934484fd0cea97508b72301633a6a78b0ae8a9ee44ac78f26d9  LICENSE
+sha256  1bf5258afe453934484fd0cea97508b72301633a6a78b0ae8a9ee44ac78f26d9  LICENSE
diff --git a/package/jbig2dec/jbig2dec.mk b/package/jbig2dec/jbig2dec.mk
index 5ac5b87a72..08ef89bfcb 100644
--- a/package/jbig2dec/jbig2dec.mk
+++ b/package/jbig2dec/jbig2dec.mk
@@ -4,10 +4,12 @@
 #
 ################################################################################
 
-JBIG2DEC_VERSION = 0.16
-JBIG2DEC_SITE = https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs927
+JBIG2DEC_VERSION = 0.18
+JBIG2DEC_SITE = https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs952
 JBIG2DEC_LICENSE = AGPL-3.0+
 JBIG2DEC_LICENSE_FILES = LICENSE
 JBIG2DEC_INSTALL_STAGING = YES
+# tarball is missing install-sh, install.sh, or shtool
+JBIG2DEC_AUTORECONF = YES
 
 $(eval $(autotools-package))
-- 
2.26.2
