From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 20 May 2019 11:16:40 +0200
Subject: [Buildroot] [git commit branch/next] package/x265: bump to version
 3.0
Message-ID: <20190520091115.0D50D880D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1b4e58d8029bfaefa689f56c1ff156449269c84f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Remove second patch (already in version)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...mitives.patch => 0002-arm-asm-primitives.patch} |  0
 package/x265/0002-fix-build-error-on-ppc64le.patch | 23 ----------------------
 package/x265/x265.hash                             |  2 +-
 package/x265/x265.mk                               |  2 +-
 4 files changed, 2 insertions(+), 25 deletions(-)

diff --git a/package/x265/0003-arm-asm-primitives.patch b/package/x265/0002-arm-asm-primitives.patch
similarity index 100%
rename from package/x265/0003-arm-asm-primitives.patch
rename to package/x265/0002-arm-asm-primitives.patch
diff --git a/package/x265/0002-fix-build-error-on-ppc64le.patch b/package/x265/0002-fix-build-error-on-ppc64le.patch
deleted file mode 100644
index ca034477eb..0000000000
--- a/package/x265/0002-fix-build-error-on-ppc64le.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-# HG changeset patch
-# User Jayashree <jayashree.c@multicorewareinc.com>
-# Date 1527224165 -19800
-# Node ID 4504219210793536d921ee4e0b3058698c630bf4
-# Parent  cc2c5e46f3c87d27e3602af30b06ba6a0fbe2704
-Fix build error on on ppc64le
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
-
-Upstream status: commit 450421921
-
-diff --git a/source/common/param.cpp b/source/common/param.cpp
---- a/source/common/param.cpp
-+++ b/source/common/param.cpp
-@@ -633,7 +633,7 @@
-         if (bValueWasNull)
-             p->cpuid = atobool(value);
-         else
--            p->cpuid = parseCpuName(value, bError);
-+            p->cpuid = parseCpuName(value, bError, false);
- #endif
-     }
-     OPT("fps")
diff --git a/package/x265/x265.hash b/package/x265/x265.hash
index 61e6181199..16ca5d3ce6 100644
--- a/package/x265/x265.hash
+++ b/package/x265/x265.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256 6e59f9afc0c2b87a46f98e33b5159d56ffb3558a49d8e3d79cb7fdc6b7aaa863  x265_2.8.tar.gz
+sha256 c5b9fc260cabbc4a81561a448f4ce9cad7218272b4011feabc3a6b751b2f0662  x265_3.0.tar.gz
 sha256 d8afb1bcc7a2cfc603683b168d6987ef0a48e59e0da3693bf55c5d33b67e2b49  COPYING
diff --git a/package/x265/x265.mk b/package/x265/x265.mk
index fe317d09d0..4e3b3bfa8e 100644
--- a/package/x265/x265.mk
+++ b/package/x265/x265.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-X265_VERSION = 2.8
+X265_VERSION = 3.0
 X265_SOURCE = x265_$(X265_VERSION).tar.gz
 X265_SITE = https://bitbucket.org/multicoreware/x265/downloads
 X265_LICENSE = GPL-2.0+
