From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 19 Apr 2016 19:00:45 +0200
Subject: [Buildroot] [PATCH v4 1/1] package/freeswitch: select OpenCV
	modules needed for mod_cv
Message-ID: <1461085245-30787-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/ffd/ffd572d7bb68d8ed46ce76b2af824503c587449f/
http://autobuild.buildroot.net/results/e53/e53e356451aa4541a76e26722fd71051896e774b/
http://autobuild.buildroot.net/results/564/5649ff1b50a1eaafbd0e1a329bff87a65ce18da0/
http://autobuild.buildroot.net/results/c60/c60f97c6aafb1a94cb4ce344953598eae8b4a912/
http://autobuild.buildroot.net/results/c1a/c1ac61f9a77635962babdb6bfb31dbecb7f4d439/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v4: add more suboptions (Samuel)
v3: add more suboptions
v2: select the required suboption instead of checking for its existance
    in freeswitch.mk (Thomas)

 package/freeswitch/Config.in | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/package/freeswitch/Config.in b/package/freeswitch/Config.in
index 1350b2b..cef3fd4 100644
--- a/package/freeswitch/Config.in
+++ b/package/freeswitch/Config.in
@@ -7,6 +7,17 @@ menuconfig BR2_PACKAGE_FREESWITCH
 	depends on BR2_USE_WCHAR # libuuid
 	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_JPEG
+	# src/mod/applications/mod_cv/mod_cv.cpp includes cv.h
+	select BR2_PACKAGE_OPENCV_LIB_CALIB3D if BR2_PACKAGE_OPENCV
+	select BR2_PACKAGE_OPENCV_LIB_CONTRIB if BR2_PACKAGE_OPENCV
+	select BR2_PACKAGE_OPENCV_LIB_FEATURES2D if BR2_PACKAGE_OPENCV
+	select BR2_PACKAGE_OPENCV_LIB_FLANN if BR2_PACKAGE_OPENCV
+	select BR2_PACKAGE_OPENCV_LIB_IMGPROC if BR2_PACKAGE_OPENCV
+	select BR2_PACKAGE_OPENCV_LIB_LEGACY if BR2_PACKAGE_OPENCV
+	select BR2_PACKAGE_OPENCV_LIB_OBJDETECT if BR2_PACKAGE_OPENCV
+	select BR2_PACKAGE_OPENCV_LIB_VIDEO if BR2_PACKAGE_OPENCV
+	# src/mod/applications/mod_cv/mod_cv.cpp includes highgui.h
+	select BR2_PACKAGE_OPENCV_LIB_HIGHGUI if BR2_PACKAGE_OPENCV
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_PCRE
 	select BR2_PACKAGE_SPEEX
-- 
2.8.0.rc3
