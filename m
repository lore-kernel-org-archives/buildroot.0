From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 18 Apr 2016 17:11:15 +0200
Subject: [Buildroot] [PATCH v2 2/2] package/opencv: module objdetect depends
	on imgproc
In-Reply-To: <1460992275-383-1-git-send-email-bernd.kuhls@t-online.de>
References: <1460992275-383-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1460992275-383-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The mod_cv module of Freeswitch depends on the objdetect module from
opencv, as noted by Samuel:
http://lists.busybox.net/pipermail/buildroot/2016-April/158902.html

Checking for opencv support in Freeswitch should only include the
direct dependency, objdetect in this case, and not inter-module
dependencies.
This patch reflects the dependency of objdetect on imgproc.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: initial release (Samuel)

 package/opencv/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/opencv/Config.in b/package/opencv/Config.in
index 8bc6c34..d87ca00 100644
--- a/package/opencv/Config.in
+++ b/package/opencv/Config.in
@@ -75,6 +75,7 @@ config BR2_PACKAGE_OPENCV_LIB_NONFREE
 config BR2_PACKAGE_OPENCV_LIB_OBJDETECT
 	bool "objdetect"
 	default y
+	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
 	help
 	  Include opencv_objdetect module into the OpenCV build.
 
-- 
2.8.0.rc3
