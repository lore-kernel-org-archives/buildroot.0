Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBC06CDB47E
	for <buildroot@archiver.kernel.org>; Sun, 15 Oct 2023 18:54:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9587D41497;
	Sun, 15 Oct 2023 18:54:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9587D41497
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9VpKB8jv6yEs; Sun, 15 Oct 2023 18:54:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6FD82414BB;
	Sun, 15 Oct 2023 18:54:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6FD82414BB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2075C1BF83A
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 18:53:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EDC1C81E04
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 18:53:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EDC1C81E04
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4ahXN7HiqtSJ for <buildroot@lists.busybox.net>;
 Sun, 15 Oct 2023 18:53:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 68F9B81E00
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 18:53:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 68F9B81E00
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 55B21852E0; Sun, 15 Oct 2023 18:53:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Oct 2023 20:50:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0aaeae26f69be2e3e0586dbb6d7243e229239f25
X-Git-Newrev: a7736afacaefc9250f8e68825e42c8f7c229b410
X-Patchwork-Hint: ignore
Message-Id: <20231015185349.55B21852E0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/opencv4-contrib: properly note
 dependencies between modules
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5599190286139981520=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5599190286139981520==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=a7736afacaefc9250f8e68825e42c8f7c229b410
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also, add myself to the DEVELOPERS file

Signed-off-by: Woodrow Douglass <wdouglass@carnegierobotics.com>
[Arnout: fix typo BR2_PACKAGE_OPENCV4_LIB_OBJDETECCT]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 DEVELOPERS                        |  4 ++++
 package/opencv4-contrib/Config.in | 20 ++++++++++++++++++++
 package/opencv4/opencv4.mk        |  9 ++++++---
 3 files changed, 30 insertions(+), 3 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 01e9777be6..57015e245e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3101,6 +3101,10 @@ F:	package/python-pyusb/
 N:	Wojciech Niziński <niziak@spox.org>
 F:	package/fwup/
 
+N:	Woodrow Douglass <wdouglass@carnegierobotics.com>
+F:	package/opencv4
+F:	package/opencv4-contrib
+
 N:	Xuanhao Shi <X15000177@gmail.com>
 F:	board/ti/am62x-sk/
 F:	board/ti/am64x-sk/
diff --git a/package/opencv4-contrib/Config.in b/package/opencv4-contrib/Config.in
index 9800333035..851241ce5e 100644
--- a/package/opencv4-contrib/Config.in
+++ b/package/opencv4-contrib/Config.in
@@ -17,6 +17,7 @@ config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_ALPHAMAT
 
 config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_ARUCO
 	bool "aruco"
+	select BR2_PACKAGE_OPENCV4_LIB_CALIB3D
 	help
 	  ArUco and ChArUco Markers -- Augmented reality ArUco marker
 	  and "ChARUco" markers where ArUco markers embedded inside the
@@ -29,6 +30,7 @@ config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_BARCODE
 
 config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_BGSEGM
 	bool "bgsegm"
+	select BR2_PACKAGE_OPENCV4_LIB_VIDEO
 	help
 	  Background segmentation algorithm combining statistical
 	  background image estimation and per-pixel Bayesian
@@ -43,6 +45,7 @@ config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_BIOINSPIRED
 
 config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_CCALIB
 	bool "ccalib"
+	select BR2_PACKAGE_OPENCV4_LIB_HIGHGUI
 	help
 	  Custom Calibration -- Patterns for 3D reconstruction,
 	  omnidirectional camera calibration, random pattern calibration
@@ -71,6 +74,7 @@ config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_DATASETS
 
 config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_DNN_OBJDETECT
 	bool "dnn_objdetect"
+	select BR2_PACKAGE_OPENCV4_LIB_DNN
 	help
 	  Object Detection using CNNs -- Implements compact CNN Model
 	  for object detection. Trained using Caffe but uses
@@ -78,6 +82,7 @@ config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_DNN_OBJDETECT
 
 config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_DNN_SUPERRES
 	bool "dnn_superres"
+	select BR2_PACKAGE_OPENCV4_LIB_DNN
 	help
 	  Superresolution using CNNs -- Contains four trained
 	  convolutional neural networks to upscale images.
@@ -90,12 +95,14 @@ config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_DNNS_EASILY_FOOLED
 
 config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_DPM
 	bool "dpm"
+	select BR2_PACKAGE_OPENCV4_LIB_OBJDETECT
 	help
 	  Deformable Part Model -- Felzenszwalb's Cascade with
 	  deformable parts object recognition code.
 
 config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_FACE
 	bool "face"
+	select BR2_PACKAGE_OPENCV4_LIB_OBJDETECT
 	help
 	  Face Recognition -- Face recognition techniques: Eigen, Fisher
 	  and Local Binary Pattern Histograms LBPH methods.
@@ -165,6 +172,7 @@ config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_MCC
 
 config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_OPTFLOW
 	bool "optflow"
+	select BR2_PACKAGE_OPENCV4_LIB_VIDEO
 	help
 	  Optical Flow -- Algorithms for running and evaluating
 	  deepflow, simpleflow, sparsetodenseflow and motion
@@ -219,6 +227,11 @@ config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_SALIENCY
 
 config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_SFM
 	bool "sfm"
+	select BR2_PACKAGE_OPENCV4_LIB_IMGPROC
+	select BR2_PACKAGE_OPENCV4_LIB_IMGCODECS
+	select BR2_PACKAGE_EIGEN
+	select BR2_PACKAGE_GLOG
+	select BR2_PACKAGE_GFLAGS
 	help
 	  Structure from Motion -- This module contains algorithms
 	  to perform 3d reconstruction from 2d images. The core of
@@ -231,6 +244,7 @@ config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_SHAPE
 
 config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_STEREO
 	bool "stereo"
+	select BR2_PACKAGE_OPENCV4_CONTRIB_LIB_TRACKING
 	help
 	  Stereo Correspondence -- Stereo matching done with different
 	  descriptors: Census / CS-Census / MCT / BRIEF / MV and dense
@@ -244,6 +258,7 @@ config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_STRUCTURED_LIGHT
 
 config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_SUPERRES
 	bool "superres"
+	select BR2_PACKAGE_OPENCV4_LIB_VIDEO
 	help
 	  Super Resolution
 
@@ -262,12 +277,15 @@ config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_TEXT
 
 config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_TRACKING
 	bool "tracking"
+	select BR2_PACKAGE_OPENCV4_LIB_VIDEO
 	help
 	  Vision Based Object Tracking -- Use and/or evaluate different
 	  visual object tracking techniques.
 
 config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_VIDEOSTAB
 	bool "videostab"
+	select BR2_PACKAGE_OPENCV4_LIB_VIDEO
+	select BR2_PACKAGE_OPENCV4_LIB_PHOTO
 	help
 	  Video Stabilization
 
@@ -299,6 +317,7 @@ config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_XIMGPROC
 
 config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_XOBJDETECT
 	bool "xobjdetect"
+	select BR2_PACKAGE_OPENCV4_LIB_OBJDETECT
 	help
 	  Boosted 2D Object Detection -- Uses a Waldboost cascade and
 	  local binary patterns computed as integral features for 2D
@@ -306,6 +325,7 @@ config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_XOBJDETECT
 
 config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_XPHOTO
 	bool "xphoto"
+	select BR2_PACKAGE_OPENCV4_LIB_PHOTO
 	help
 	  Extra Computational Photography -- Additional photo processing
 	  algorithms: Color balance / Denoising / Inpainting.
diff --git a/package/opencv4/opencv4.mk b/package/opencv4/opencv4.mk
index a665793ad9..2a05de42fb 100644
--- a/package/opencv4/opencv4.mk
+++ b/package/opencv4/opencv4.mk
@@ -203,12 +203,10 @@ OPENCV4_CONF_OPTS += \
 	-DINSTALL_PYTHON_EXAMPLES=OFF \
 	-DINSTALL_TO_MANGLED_PATHS=OFF
 
-# Disabled features (mostly because they are not available in Buildroot), but
-# - eigen: OpenCV does not use it, not take any benefit from it.
+# Disabled features (mostly because they are not available in Buildroot)
 OPENCV4_CONF_OPTS += \
 	-DWITH_1394=OFF \
 	-DWITH_CLP=OFF \
-	-DWITH_EIGEN=OFF \
 	-DWITH_GDAL=OFF \
 	-DWITH_GPHOTO2=OFF \
 	-DWITH_GSTREAMER_0_10=OFF \
@@ -284,6 +282,11 @@ OPENCV4_CONF_OPTS += \
 	-DBUILD_opencv_xphoto=$(if $(BR2_PACKAGE_OPENCV4_CONTRIB_LIB_XPHOTO),ON,OFF)
 endif
 
+ifeq ($(BR2_PACKAGE_OPENCV4_CONTRIB_LIB_SFM),y)
+OPENCV4_DEPENDENCIES += eigen glog gflags
+OPENCV4_CONF_OPTS += -DWITH_EIGEN=ON
+endif
+
 ifeq ($(BR2_PACKAGE_OPENCV4_JPEG2000_WITH_JASPER),y)
 OPENCV4_CONF_OPTS += -DWITH_JASPER=ON
 OPENCV4_DEPENDENCIES += jasper

--===============5599190286139981520==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5599190286139981520==--
