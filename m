From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 30 Jul 2019 23:35:00 +0200
Subject: [Buildroot] [git commit] package/libebml: bump version to 1.3.9
Message-ID: <20190730213404.EFDB18868B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b927970a605e697a0b2a6ca7477de4573bdc8790
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patch applied upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...bmlSInteger-Use-limits-instead-of-climits.patch | 28 ----------------------
 package/libebml/libebml.hash                       |  2 +-
 package/libebml/libebml.mk                         |  2 +-
 3 files changed, 2 insertions(+), 30 deletions(-)

diff --git a/package/libebml/0001-EbmlSInteger-Use-limits-instead-of-climits.patch b/package/libebml/0001-EbmlSInteger-Use-limits-instead-of-climits.patch
deleted file mode 100644
index d6e906fe7b..0000000000
--- a/package/libebml/0001-EbmlSInteger-Use-limits-instead-of-climits.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From e46906b80e7662fb78d305f576412f9fa4a22218 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Hugo=20Beauz=C3=A9e-Luyssen?= <hugo@beauzee.fr>
-Date: Mon, 23 Apr 2018 12:05:42 +0200
-Subject: [PATCH] EbmlSInteger: Use <limits> instead of <climits>
-
-The former is the proper header to use for std::numerical_limits
-
-Retrieved from:
-https://github.com/Matroska-Org/libebml/commit/e46906b80e7662fb78d305f576412f9fa4a22218
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/EbmlSInteger.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/EbmlSInteger.cpp b/src/EbmlSInteger.cpp
-index 33f3637..b930f7d 100644
---- a/src/EbmlSInteger.cpp
-+++ b/src/EbmlSInteger.cpp
-@@ -33,7 +33,7 @@
-   \author Moritz Bunkus <moritz @ bunkus.org>
- */
- #include <cassert>
--#include <climits>
-+#include <limits>
- 
- #include "ebml/EbmlSInteger.h"
- 
diff --git a/package/libebml/libebml.hash b/package/libebml/libebml.hash
index 6daa4746c2..30945548c5 100644
--- a/package/libebml/libebml.hash
+++ b/package/libebml/libebml.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	1e5a7a7820c493aa62b0f35e15b4233c792cc03458c55ebdfa7a6521e4b43e9e	libebml-1.3.6.tar.xz
+sha256	c6b6c6cd8b20a46203cb5dce636883aef68beb2846f1e4103b660a7da2c9c548	libebml-1.3.9.tar.xz
 sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551	LICENSE.LGPL
diff --git a/package/libebml/libebml.mk b/package/libebml/libebml.mk
index 3c34462738..770fda5dae 100644
--- a/package/libebml/libebml.mk
+++ b/package/libebml/libebml.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBEBML_VERSION = 1.3.6
+LIBEBML_VERSION = 1.3.9
 LIBEBML_SOURCE = libebml-$(LIBEBML_VERSION).tar.xz
 LIBEBML_SITE = http://dl.matroska.org/downloads/libebml
 LIBEBML_INSTALL_STAGING = YES
