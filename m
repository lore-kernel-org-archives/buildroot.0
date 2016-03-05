From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Mar 2016 15:00:26 +0100
Subject: [Buildroot] [git commit] package/vlc: bump version to 2.2.2
Message-ID: <20160305140245.3074D81794@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e1b34f00b4991ca6353330c650f71bddee92fd12
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed two patches applied upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...opencv_wrapper-use-opencv2-style-includes.patch | 36 ----------------------
 ...cv_example-add-missing-include-statements.patch | 29 -----------------
 package/vlc/vlc.hash                               |  4 +--
 package/vlc/vlc.mk                                 |  2 +-
 4 files changed, 3 insertions(+), 68 deletions(-)

diff --git a/package/vlc/0008-opencv_wrapper-use-opencv2-style-includes.patch b/package/vlc/0008-opencv_wrapper-use-opencv2-style-includes.patch
deleted file mode 100644
index 0ce0206..0000000
--- a/package/vlc/0008-opencv_wrapper-use-opencv2-style-includes.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-Backport from: https://git.videolan.org/?p=vlc.git;a=commit;h=cc236e4652255902f2c2cee3b18f83367f35a8c7
-
-From cc236e4652255902f2c2cee3b18f83367f35a8c7 Mon Sep 17 00:00:00 2001
-From: Samuel Martin <s.martin49@gmail.com>
-Date: Sun, 24 May 2015 14:30:09 +0200
-Subject: [PATCH 8/9] opencv_wrapper: use opencv2-style includes
-
-If old opencv1-style legacy include directory is available, this change
-becomes purely cosmetic (maybe will compile a bit faster).
-It becomes an FTBFS fix when opencv1-style include directory is missing
-(i.e. from opencv-3.0).
-
-Signed-off-by: Samuel Martin <s.martin49@gmail.com>
-Signed-off-by: Jean-Baptiste Kempf <jb@videolan.org>
----
- modules/video_filter/opencv_wrapper.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/modules/video_filter/opencv_wrapper.c b/modules/video_filter/opencv_wrapper.c
-index e36e1a5..5d74241 100644
---- a/modules/video_filter/opencv_wrapper.c
-+++ b/modules/video_filter/opencv_wrapper.c
-@@ -39,8 +39,8 @@
- #include <vlc_image.h>
- #include "filter_picture.h"
- 
--#include <cxcore.h>
--#include <cv.h>
-+#include <opencv2/core/core_c.h>
-+#include <opencv2/core/types_c.h>
- 
- /*****************************************************************************
-  * Local prototypes
--- 
-2.4.2
-
diff --git a/package/vlc/0009-opencv_example-add-missing-include-statements.patch b/package/vlc/0009-opencv_example-add-missing-include-statements.patch
deleted file mode 100644
index 7b7f727..0000000
--- a/package/vlc/0009-opencv_example-add-missing-include-statements.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-Backport from: https://git.videolan.org/?p=vlc.git;a=commit;h=b82416d7000a993b33e903095a590fe32212a85e
-
-From b82416d7000a993b33e903095a590fe32212a85e Mon Sep 17 00:00:00 2001
-From: Samuel Martin <s.martin49@gmail.com>
-Date: Sun, 24 May 2015 14:30:10 +0200
-Subject: [PATCH 9/9] opencv_example: add missing #include statements
-
-Signed-off-by: Samuel Martin <s.martin49@gmail.com>
-Signed-off-by: Jean-Baptiste Kempf <jb@videolan.org>
----
- modules/video_filter/opencv_example.cpp | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/modules/video_filter/opencv_example.cpp b/modules/video_filter/opencv_example.cpp
-index ae3af05..998f286 100644
---- a/modules/video_filter/opencv_example.cpp
-+++ b/modules/video_filter/opencv_example.cpp
-@@ -41,6 +41,8 @@
- 
- #include <opencv2/core/core_c.h>
- #include <opencv2/core/core.hpp>
-+#include <opencv2/imgproc/imgproc_c.h>
-+#include <opencv2/imgproc/imgproc.hpp>
- #include <opencv2/objdetect/objdetect.hpp>
- 
- /*****************************************************************************
--- 
-2.4.2
-
diff --git a/package/vlc/vlc.hash b/package/vlc/vlc.hash
index ce124f3..6754b82 100644
--- a/package/vlc/vlc.hash
+++ b/package/vlc/vlc.hash
@@ -1,2 +1,2 @@
-# From http://download.videolan.org/pub/videolan/vlc/2.2.1/vlc-2.2.1.tar.xz.sha256
-sha256	543d9d7e378ec0fa1ee2e7f7f5acf8c456c7d0ecc32037171523197ef3cf1fcb	vlc-2.2.1.tar.xz
+# From http://download.videolan.org/pub/videolan/vlc/2.2.2/vlc-2.2.2.tar.xz.sha256
+sha256	9ad23128be16f9b40ed772961272cb0748ed8e4aa1bc79c129e589feebea5fb5	vlc-2.2.2.tar.xz
diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 8acdc4e..03e1d88 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VLC_VERSION = 2.2.1
+VLC_VERSION = 2.2.2
 VLC_SITE = http://get.videolan.org/vlc/$(VLC_VERSION)
 VLC_SOURCE = vlc-$(VLC_VERSION).tar.xz
 VLC_LICENSE = GPLv2+ LGPLv2.1+
