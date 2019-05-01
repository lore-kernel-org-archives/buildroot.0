From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 1 May 2019 14:56:02 +0200
Subject: [Buildroot] [git commit] package/gerbera: fix build with latest
 exiv2
Message-ID: <20190501125938.33DA783D7E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fc32ff878b10dab55c02234ec92f92cb594c8cfa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

After the bump to exiv2 0.27.1 a build error due to missing header
inclusion appeared.

Fixes:
http://autobuild.buildroot.net/results/3831acf7f4c5a9f1a404e0ced3d6bec7a2249601/
http://autobuild.buildroot.net/results/de0545462c6017fe54acc284b914b9fa8b0172d8/

The patch is waiting merge into the mainline
https://github.com/gerbera/gerbera/pull/457

Signed-off-by: Nicolas Serafini <nicolas.serafini@sensefly.com>
[Arnout: include as a patch instead of downloading it, due to hash]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...Use-exiv2-header-that-include-all-headers.patch | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/package/gerbera/0001-Use-exiv2-header-that-include-all-headers.patch b/package/gerbera/0001-Use-exiv2-header-that-include-all-headers.patch
new file mode 100644
index 0000000000..43de125e65
--- /dev/null
+++ b/package/gerbera/0001-Use-exiv2-header-that-include-all-headers.patch
@@ -0,0 +1,29 @@
+From c6692a857262af7ef13a95feef8fe7633790458f Mon Sep 17 00:00:00 2001
+From: Nicolas Serafini <serafini.nicolas@gmail.com>
+Date: Wed, 1 May 2019 10:24:47 +0200
+Subject: [PATCH] Use exiv2 header that include all headers
+
+With latest exiv2 0.27.1 there is a build error
+exiv2_handler.cc:179:21: error: 'AnyError' in namespace 'Exiv2' does not name a type
+
+Signed-off-by: Nicolas Serafini <serafini.nicolas@gmail.com>
+[Arnout: retrieved from https://github.com/gerbera/gerbera/pull/457]
+Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
+---
+ src/metadata/exiv2_handler.cc | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/src/metadata/exiv2_handler.cc b/src/metadata/exiv2_handler.cc
+index f3a35d48..7f8c89bd 100644
+--- a/src/metadata/exiv2_handler.cc
++++ b/src/metadata/exiv2_handler.cc
+@@ -31,8 +31,7 @@
+ /// \brief Implementeation of the Exiv2Handler class.
+ 
+ #ifdef HAVE_EXIV2
+-#include <exiv2/exif.hpp>
+-#include <exiv2/image.hpp>
++#include <exiv2/exiv2.hpp>
+ 
+ #include "config_manager.h"
+ #include "exiv2_handler.h"
