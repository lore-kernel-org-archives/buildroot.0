Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FDF1C433FE
	for <buildroot@archiver.kernel.org>; Wed, 16 Nov 2022 12:46:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5FC760AEC;
	Wed, 16 Nov 2022 12:46:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B5FC760AEC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CvYtYr8TsN1v; Wed, 16 Nov 2022 12:46:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3720760B48;
	Wed, 16 Nov 2022 12:46:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3720760B48
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 84CCE1BF232
 for <buildroot@lists.busybox.net>; Wed, 16 Nov 2022 12:46:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4BF4740A06
 for <buildroot@lists.busybox.net>; Wed, 16 Nov 2022 12:46:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4BF4740A06
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ypLrPnEl6BlA for <buildroot@lists.busybox.net>;
 Wed, 16 Nov 2022 12:46:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 97D9840A04
Received: from 001.lax.mailroute.net (001.lax.mailroute.net [199.89.1.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 97D9840A04
 for <buildroot@buildroot.org>; Wed, 16 Nov 2022 12:46:49 +0000 (UTC)
Received: from localhost (001.lax.mailroute.net [127.0.0.1])
 by 001.lax.mailroute.net (Postfix) with ESMTP id 4NC2qX6MHsz1M8Ck;
 Wed, 16 Nov 2022 12:46:48 +0000 (UTC)
X-Virus-Scanned: by MailRoute
Received: from 001.lax.mailroute.net ([199.89.1.4])
 by localhost (001.lax [127.0.0.1]) (mroute_mailscanner, port 10026)
 with LMTP id C0rVrA0KknsM; Wed, 16 Nov 2022 12:46:40 +0000 (UTC)
Received: from mail.carnegierobotics.com (unknown [72.22.26.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by 001.lax.mailroute.net (Postfix) with ESMTPS id 4NC2qN1G9Fz1M873;
 Wed, 16 Nov 2022 12:46:40 +0000 (UTC)
Received: from CRL-PGH-EX19-1.crl.local (10.1.7.176) by
 CRL-PGH-EX19-1.crl.local (10.1.7.176) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.858.15; Wed, 16 Nov 2022 07:46:38 -0500
Received: from CRL-PGH-EX19-1.crl.local ([fe80::81d6:ea84:15d9:67d4]) by
 CRL-PGH-EX19-1.crl.local ([fe80::81d6:ea84:15d9:67d4%7]) with mapi id
 15.02.0858.015; Wed, 16 Nov 2022 07:46:38 -0500
To: "buildroot@buildroot.org" <buildroot@buildroot.org>,
 "woodrow@douglass.dev" <woodrow@douglass.dev>
Thread-Topic: [PATCH 1/1] package/opencv4: add support for opencv4_contrib
 repository for extra modules
Thread-Index: AQHY8Ef9QnHtVkLaVkWO5BBQiu7BVa5B5jEA
Date: Wed, 16 Nov 2022 12:46:38 +0000
Message-ID: <1fbe09c188cc2dc88bc2f638e5be66fd6d40948b.camel@carnegierobotics.com>
References: <20221104122046.8959-1-woodrow@douglass.dev>
In-Reply-To: <20221104122046.8959-1-woodrow@douglass.dev>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.30.5-1.1 
x-originating-ip: [173.233.9.13]
Content-ID: <79EDC3B7DC3E9641A8D9CE8154562293@crl.local>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 carnegierobotics.com; h=mime-version:content-transfer-encoding
 :content-id:content-type:content-type:user-agent
 :content-language:accept-language:in-reply-to:references
 :message-id:date:date:subject:subject:from:from:received
 :received:received:received; s=mr01; t=1668602800; x=1671194801;
 bh=xpIaeq47tzIWf+ljIRWSXdUTiamTxatBerP7ouljnxY=; b=nY9tpEW9Qtn0
 E4rZYZs/QGPzPv8fugszmZkL93l9xtD6prusrR67JNyx7Wdttgi2E9Kjjz/vYKvw
 bwjs+doC6XCjL/ml4egdGT/U+5K5YhQy44z6BogPsKZE+5zpDKCaByaRSCaQ9J6l
 /w+2vq2YjAMLIriwygA6rY6ddq+w6xYgP11YhxaVIf2NQFL83BrvBockkngUIJQi
 sBjYOanr+Mt2f2JTOUdzGApD1Yw2eLNPKUp99+MxKHL2iD3ZKlkbjKNJaP/LwveO
 fRT8ErvBBUGG3IHQn6vI+GHrlmf5cNA/qEhYP8+atU8mkLYFLHuLfhNMVQ0WnB5W
 buzX22jW+Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=carnegierobotics.com header.i=@carnegierobotics.com
 header.a=rsa-sha256 header.s=mr01 header.b=nY9tpEW9
Subject: Re: [Buildroot] [PATCH 1/1] package/opencv4: add support for
 opencv4_contrib repository for extra modules
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
From: Woody Douglass via buildroot <buildroot@buildroot.org>
Reply-To: Woody Douglass <wdouglass@carnegierobotics.com>
Cc: "fontaine.fabrice@gmail.com" <fontaine.fabrice@gmail.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

All,

Would you mind taking one more look at this? Did i get the formatting right the second time?

Thanks,
Woodrow Douglass

On Fri, 2022-11-04 at 08:20 -0400, Woody Douglass wrote:
> From: Woodrow Douglass <wdouglass@carnegierobotics.com>
> 
> This adds a separate opencv4_contrib package to manage
> downloading/unpacking that repository. These extra modules
> are useful for a lot of applications, but not necessary
> for minimal installs, so they are all given dedicated Kconfig
> options
> 
> Signed-off-by: Woodrow Douglass <wdouglass@carnegierobotics.com>
> ---
>  package/Config.in                            |   1 +
>  package/opencv4-contrib/Config.in            | 313 +++++++++++++++++++
>  package/opencv4-contrib/opencv4-contrib.hash |   3 +
>  package/opencv4-contrib/opencv4-contrib.mk   |  13 +
>  package/opencv4/opencv4.mk                   |  62 +++-
>  5 files changed, 387 insertions(+), 5 deletions(-)
>  create mode 100644 package/opencv4-contrib/Config.in
>  create mode 100644 package/opencv4-contrib/opencv4-contrib.hash
>  create mode 100644 package/opencv4-contrib/opencv4-contrib.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 238d7813f0..f03b5aad82 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1593,6 +1593,7 @@ menu "Graphics"
>  	source "package/opencl-clhpp/Config.in"
>  	source "package/opencv3/Config.in"
>  	source "package/opencv4/Config.in"
> +	source "package/opencv4-contrib/Config.in"
>  	source "package/opengl/Config.in"
>  	source "package/openjpeg/Config.in"
>  	source "package/pango/Config.in"
> diff --git a/package/opencv4-contrib/Config.in b/package/opencv4-contrib/Config.in
> new file mode 100644
> index 0000000000..9800333035
> --- /dev/null
> +++ b/package/opencv4-contrib/Config.in
> @@ -0,0 +1,313 @@
> +menuconfig BR2_PACKAGE_OPENCV4_CONTRIB
> +	bool "opencv4-contrib"
> +	depends on BR2_PACKAGE_OPENCV4
> +	help
> +	  OpenCV (Open Source Computer Vision) is a library of
> +	  programming functions for real time computer vision.
> +
> +	  http://opencv.org/
> +
> +if BR2_PACKAGE_OPENCV4_CONTRIB
> +
> +config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_ALPHAMAT
> +	bool "alphamat"
> +	help
> +	  Computer Vision based Alpha Matting -- Given an input image
> +	  and a trimap, generate an alpha matte.
> +
> +config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_ARUCO
> +	bool "aruco"
> +	help
> +	  ArUco and ChArUco Markers -- Augmented reality ArUco marker
> +	  and "ChARUco" markers where ArUco markers embedded inside the
> +	  white areas of the checker board.
> +
> +config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_BARCODE
> +	bool "barcode"
> +	help
> +	  Barcode detecting and decoding methods.
> +
> +config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_BGSEGM
> +	bool "bgsegm"
> +	help
> +	  Background segmentation algorithm combining statistical
> +	  background image estimation and per-pixel Bayesian
> +	  segmentation.
> +
> +config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_BIOINSPIRED
> +	bool "bioinspired"
> +	help
> +	  Biological Vision -- Biologically inspired vision model:
> +	  minimize noise and luminance variance, transient event
> +	  segmentation, high dynamic range tone mapping methods.
> +
> +config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_CCALIB
> +	bool "ccalib"
> +	help
> +	  Custom Calibration -- Patterns for 3D reconstruction,
> +	  omnidirectional camera calibration, random pattern calibration
> +	  and multi-camera calibration.
> +
> +config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_CNN_3DOBJ
> +	bool "cnn_3dobj"
> +	help
> +	  Deep Object Recognition and Pose -- Uses Caffe Deep Neural Net
> +	  library to build, train and test a CNN model of visual object
> +	  recognition and pose.
> +
> +config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_CVV
> +	bool "cvv"
> +	help
> +	  Computer Vision Debugger -- Simple code that you can add
> +	  to your program that pops up a GUI allowing you to
> +	  interactively and visually debug computer vision programs.
> +
> +config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_DATASETS
> +	bool "datasets"
> +	help
> +	  Datasets Reader -- Code for reading existing computer vision
> +	  databases and samples of using the readers to train, test and
> +	  run using that dataset's data.
> +
> +config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_DNN_OBJDETECT
> +	bool "dnn_objdetect"
> +	help
> +	  Object Detection using CNNs -- Implements compact CNN Model
> +	  for object detection. Trained using Caffe but uses
> +	  opencv_dnn module.
> +
> +config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_DNN_SUPERRES
> +	bool "dnn_superres"
> +	help
> +	  Superresolution using CNNs -- Contains four trained
> +	  convolutional neural networks to upscale images.
> +
> +config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_DNNS_EASILY_FOOLED
> +	bool "dnns_easily_fooled"
> +	help
> +	  Subvert DNNs -- This code can use the activations in a
> +	  network to fool the networks into recognizing something else.
> +
> +config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_DPM
> +	bool "dpm"
> +	help
> +	  Deformable Part Model -- Felzenszwalb's Cascade with
> +	  deformable parts object recognition code.
> +
> +config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_FACE
> +	bool "face"
> +	help
> +	  Face Recognition -- Face recognition techniques: Eigen, Fisher
> +	  and Local Binary Pattern Histograms LBPH methods.
> +
> +config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_FREETYPE
> +	bool "freetype"
> +	help
> +	  Drawing text using freetype and harfbuzz.
> +
> +config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_FUZZY
> +	bool "fuzzy"
> +	help
> +	  Fuzzy Logic in Vision -- Fuzzy logic image transform and
> +	  inverse; Fuzzy image processing.
> +
> +config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_HDF
> +	bool "hdf"
> +	help
> +	  Hierarchical Data Storage -- This module contains I/O
> +	  routines for Hierarchical Data Format:
> +	  https://en.m.wikipedia.org/wiki/Hierarchical_Data_Format
> +	  meant to store large amounts of data.
> +
> +config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_HFS
> +	bool "hfs"
> +	help
> +	  Hierarchical Feature Selection for Efficient Image
> +	  Segmentation -- This module contains an efficient
> +	  algorithm to segment an image.
> +
> +config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_IMG_HASH
> +	bool "img_hash"
> +	help
> +	  This module contains algorithms to extract hash of an
> +	  image allowing to efficiently estimate similarity between
> +	  images.
> +
> +config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_INTENSITY_TRANSFORM
> +	bool "intensity_transform"
> +	help
> +	  The module brings implementations of intensity transformation
> +	  algorithms to adjust image contrast.
> +
> +config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_JULIA
> +	bool "julia"
> +	help
> +	  Julia language wrappers with samples and tests.
> +
> +config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_LINE_DESCRIPTOR
> +	bool "line_descriptor"
> +	help
> +	  Line Segment Extract and Match -- Methods of extracting,
> +	  describing and matching line segments using binary
> +	  descriptors.
> +
> +config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_MATLAB
> +	bool "matlab"
> +	help
> +	  Matlab Interface -- OpenCV Matlab Mex wrapper code generator
> +	  for certain opencv core modules.
> +
> +config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_MCC
> +	bool "mcc"
> +	help
> +	  Macbeth Color Chart detector -- Find and return color patch
> +	  location in MacBeth color calibration charts.
> +
> +config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_OPTFLOW
> +	bool "optflow"
> +	help
> +	  Optical Flow -- Algorithms for running and evaluating
> +	  deepflow, simpleflow, sparsetodenseflow and motion
> +	  templates (silhouette flow).
> +
> +config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_OVIS
> +	bool "ovis"
> +	help
> +	  OGRE 3D Visualiser -- allows you to render 3D data using
> +	  the OGRE 3D engine.
> +
> +config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_PHASE_UNWRAPPING
> +	bool "phase_unwrapping"
> +	help
> +	  Quality-guided phase unwrapping.
> +
> +config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_PLOT
> +	bool "plot"
> +	help
> +	  Plotting -- The plot module allows you to easily plot data
> +	  in 1D or 2D.
> +
> +config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_QUALITY
> +	bool "quality"
> +	help
> +	  Image Quality Analysis (IQA) API.
> +
> +config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_RAPID
> +	bool "rapid"
> +	help
> +	  Silhouette based 3D object tracking.
> +
> +config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_REG
> +	bool "reg"
> +	help
> +	  Image Registration -- Pixels based image registration for
> +	  precise alignment. Follows the paper "Image Alignment and
> +	  Stitching: A Tutorial", by Richard Szeliski.
> +
> +config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_RGBD
> +	bool "rgbd"
> +	help
> +	  RGB-Depth Processing module -- Linemod 3D object recognition;
> +	  Fast surface normals and 3D plane finding. 3D visual odometry.
> +	  3d reconstruction using KinectFusion.
> +
> +config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_SALIENCY
> +	bool "saliency"
> +	help
> +	  Saliency API -- Where humans would look in a scene. Has
> +	  routines for static, motion and "objectness" saliency.
> +
> +config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_SFM
> +	bool "sfm"
> +	help
> +	  Structure from Motion -- This module contains algorithms
> +	  to perform 3d reconstruction from 2d images. The core of
> +	  the module is a light version of Libmv.
> +
> +config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_SHAPE
> +	bool "shape"
> +	help
> +	  Shape Distance and Matching
> +
> +config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_STEREO
> +	bool "stereo"
> +	help
> +	  Stereo Correspondence -- Stereo matching done with different
> +	  descriptors: Census / CS-Census / MCT / BRIEF / MV and dense
> +	  stereo correspondence using Quasi Dense Stereo method.
> +
> +config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_STRUCTURED_LIGHT
> +	bool "structured_light"
> +	help
> +	  Structured Light Use -- How to generate and project gray code
> +	  patterns and use them to find dense depth in a scene.
> +
> +config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_SUPERRES
> +	bool "superres"
> +	help
> +	  Super Resolution
> +
> +config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_SURFACE_MATCHING
> +	bool "surface_matching"
> +	help
> +	  Point Pair Features -- Implements 3d object detection and
> +	  localization using multimodal point pair features.
> +
> +config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_TEXT
> +	bool "text"
> +	help
> +	  Scene Text Detection and Recognition -- This module contains
> +	  algorithms to perform text detection, words segmentation and
> +	  text recognition in a visual scene.
> +
> +config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_TRACKING
> +	bool "tracking"
> +	help
> +	  Vision Based Object Tracking -- Use and/or evaluate different
> +	  visual object tracking techniques.
> +
> +config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_VIDEOSTAB
> +	bool "videostab"
> +	help
> +	  Video Stabilization
> +
> +config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_VIZ
> +	bool "viz"
> +	help
> +	  3D Visualizer
> +
> +config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_WECHAT_QRCODE
> +	bool "wechat_qrcode"
> +	help
> +	  WeChat QR code detector for detecting and parsing QR code.
> +
> +config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_XFEATURES2D
> +	bool "xfeatures2d"
> +	help
> +	  Features2D extra -- Extra 2D Features Framework containing
> +	  experimental and non-free 2D feature detector/descriptor
> +	  algorithms. SURF, BRIEF, Censure, Freak, LUCID, Daisy,
> +	  Self-similar.
> +
> +config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_XIMGPROC
> +	bool "ximgproc"
> +	help
> +	  Extended Image Processing -- Structured Forests / Domain
> +	  Transform Filter / Guided Filter / Adaptive Manifold Filter
> +	  / Joint Bilateral Filter / Superpixels / Ridge Detection
> +	  Filter.
> +
> +config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_XOBJDETECT
> +	bool "xobjdetect"
> +	help
> +	  Boosted 2D Object Detection -- Uses a Waldboost cascade and
> +	  local binary patterns computed as integral features for 2D
> +	  object detection.
> +
> +config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_XPHOTO
> +	bool "xphoto"
> +	help
> +	  Extra Computational Photography -- Additional photo processing
> +	  algorithms: Color balance / Denoising / Inpainting.
> +
> +endif
> diff --git a/package/opencv4-contrib/opencv4-contrib.hash b/package/opencv4-contrib/opencv4-contrib.hash
> new file mode 100644
> index 0000000000..9db112c9e9
> --- /dev/null
> +++ b/package/opencv4-contrib/opencv4-contrib.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated
> +sha256  a97c2eaecf7a23c6dbd119a609c6d7fae903e5f9ff5f1fe678933e01c67a6c11  opencv4-contrib-4.5.5.tar.gz
> +sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
> diff --git a/package/opencv4-contrib/opencv4-contrib.mk b/package/opencv4-contrib/opencv4-contrib.mk
> new file mode 100644
> index 0000000000..58dbe27e28
> --- /dev/null
> +++ b/package/opencv4-contrib/opencv4-contrib.mk
> @@ -0,0 +1,13 @@
> +################################################################################
> +#
> +# opencv4-contrib
> +#
> +################################################################################
> +
> +OPENCV4_CONTRIB_VERSION = 4.6.0
> +OPENCV4_CONTRIB_SITE = $(call github,opencv,opencv_contrib,$(OPENCV4_CONTRIB_VERSION))
> +OPENCV4_CONTRIB_INSTALL_TARGET = FALSE
> +OPENCV4_CONTRIB_LICENSE = Apache-2.0
> +OPENCV4_CONTRIB_LICENSE_FILES = LICENSE
> +
> +$(eval $(generic-package))
> diff --git a/package/opencv4/opencv4.mk b/package/opencv4/opencv4.mk
> index ef15c6d911..a665793ad9 100644
> --- a/package/opencv4/opencv4.mk
> +++ b/package/opencv4/opencv4.mk
> @@ -82,11 +82,6 @@ OPENCV4_CONF_OPTS += \
>  #   - viz: missing VTK dependency
>  #   - world: all-in-one module
>  #
> -# * Contrib modules from [1] are disabled:
> -#   - opencv_contrib package is not available in Buildroot;
> -#   - OPENCV_EXTRA_MODULES_PATH is not set.
> -#
> -# [1] https://github.com/Itseez/opencv_contrib
>  OPENCV4_CONF_OPTS += \
>  	-DBUILD_opencv_androidcamera=OFF \
>  	-DBUILD_opencv_apps=OFF \
> @@ -232,6 +227,63 @@ OPENCV4_CONF_OPTS += \
>  
>  OPENCV4_DEPENDENCIES += host-pkgconf zlib
>  
> +ifeq ($(BR2_PACKAGE_OPENCV4_CONTRIB),y)
> +# OPENCV4 depends on OPENCV4_CONTRIB, and not the other way around.
> +# The modules in OPENCV4_CONTRIB get built as part of the build
> +# process for OPENCV4, so the source needs to be unpacked already
> +OPENCV4_DEPENDENCIES += opencv4-contrib
> +OPENCV4_CONF_OPTS += \
> +	-DOPENCV_EXTRA_MODULES_PATH=$(OPENCV4_CONTRIB_DIR)/modules \
> +	-DBUILD_opencv_alphamat=$(if $(BR2_PACKAGE_OPENCV4_CONTRIB_LIB_ALPHAMAT),ON,OFF) \
> +	-DBUILD_opencv_aruco=$(if $(BR2_PACKAGE_OPENCV4_CONTRIB_LIB_ARUCO),ON,OFF) \
> +	-DBUILD_opencv_barcode=$(if $(BR2_PACKAGE_OPENCV4_CONTRIB_LIB_BARCODE),ON,OFF) \
> +	-DBUILD_opencv_bgsegm=$(if $(BR2_PACKAGE_OPENCV4_CONTRIB_LIB_BGSEGM),ON,OFF) \
> +	-DBUILD_opencv_bioinspired=$(if $(BR2_PACKAGE_OPENCV4_CONTRIB_LIB_BIOINSPIRED),ON,OFF) \
> +	-DBUILD_opencv_ccalib=$(if $(BR2_PACKAGE_OPENCV4_CONTRIB_LIB_CCALIB),ON,OFF) \
> +	-DBUILD_opencv_cnn_3dobj=$(if $(BR2_PACKAGE_OPENCV4_CONTRIB_LIB_CNN_3DOBJ),ON,OFF) \
> +	-DBUILD_opencv_cvv=$(if $(BR2_PACKAGE_OPENCV4_CONTRIB_LIB_CVV),ON,OFF) \
> +	-DBUILD_opencv_datasets=$(if $(BR2_PACKAGE_OPENCV4_CONTRIB_LIB_DATASETS),ON,OFF) \
> +	-DBUILD_opencv_dnn_objdetect=$(if $(BR2_PACKAGE_OPENCV4_CONTRIB_LIB_DNN_OBJDETECT),ON,OFF) \
> +	-DBUILD_opencv_dnn_superres=$(if $(BR2_PACKAGE_OPENCV4_CONTRIB_LIB_DNN_SUPERRES),ON,OFF) \
> +	-DBUILD_opencv_dnns_easily_fooled=$(if $(BR2_PACKAGE_OPENCV4_CONTRIB_LIB_DNNS_EASILY_FOOLED),ON,OFF) \
> +	-DBUILD_opencv_dpm=$(if $(BR2_PACKAGE_OPENCV4_CONTRIB_LIB_DPM),ON,OFF) \
> +	-DBUILD_opencv_face=$(if $(BR2_PACKAGE_OPENCV4_CONTRIB_LIB_FACE),ON,OFF) \
> +	-DBUILD_opencv_freetype=$(if $(BR2_PACKAGE_OPENCV4_CONTRIB_LIB_FREETYPE),ON,OFF) \
> +	-DBUILD_opencv_fuzzy=$(if $(BR2_PACKAGE_OPENCV4_CONTRIB_LIB_FUZZY),ON,OFF) \
> +	-DBUILD_opencv_hdf=$(if $(BR2_PACKAGE_OPENCV4_CONTRIB_LIB_HDF),ON,OFF) \
> +	-DBUILD_opencv_hfs=$(if $(BR2_PACKAGE_OPENCV4_CONTRIB_LIB_HFS),ON,OFF) \
> +	-DBUILD_opencv_img_hash=$(if $(BR2_PACKAGE_OPENCV4_CONTRIB_LIB_IMG_HASH),ON,OFF) \
> +	-DBUILD_opencv_intensity_transform=$(if $(BR2_PACKAGE_OPENCV4_CONTRIB_LIB_INTENSITY_TRANSFORM),ON,OFF) \
> +	-DBUILD_opencv_julia=$(if $(BR2_PACKAGE_OPENCV4_CONTRIB_LIB_JULIA),ON,OFF) \
> +	-DBUILD_opencv_line_descriptor=$(if $(BR2_PACKAGE_OPENCV4_CONTRIB_LIB_LINE_DESCRIPTOR),ON,OFF) \
> +	-DBUILD_opencv_matlab=$(if $(BR2_PACKAGE_OPENCV4_CONTRIB_LIB_MATLAB),ON,OFF) \
> +	-DBUILD_opencv_mcc=$(if $(BR2_PACKAGE_OPENCV4_CONTRIB_LIB_MCC),ON,OFF) \
> +	-DBUILD_opencv_optflow=$(if $(BR2_PACKAGE_OPENCV4_CONTRIB_LIB_OPTFLOW),ON,OFF) \
> +	-DBUILD_opencv_ovis=$(if $(BR2_PACKAGE_OPENCV4_CONTRIB_LIB_OVIS),ON,OFF) \
> +	-DBUILD_opencv_phase_unwrapping=$(if $(BR2_PACKAGE_OPENCV4_CONTRIB_LIB_PHASE_UNWRAPPING),ON,OFF) \
> +	-DBUILD_opencv_plot=$(if $(BR2_PACKAGE_OPENCV4_CONTRIB_LIB_PLOT),ON,OFF) \
> +	-DBUILD_opencv_quality=$(if $(BR2_PACKAGE_OPENCV4_CONTRIB_LIB_QUALITY),ON,OFF) \
> +	-DBUILD_opencv_rapid=$(if $(BR2_PACKAGE_OPENCV4_CONTRIB_LIB_RAPID),ON,OFF) \
> +	-DBUILD_opencv_reg=$(if $(BR2_PACKAGE_OPENCV4_CONTRIB_LIB_REG),ON,OFF) \
> +	-DBUILD_opencv_rgbd=$(if $(BR2_PACKAGE_OPENCV4_CONTRIB_LIB_RGBD),ON,OFF) \
> +	-DBUILD_opencv_saliency=$(if $(BR2_PACKAGE_OPENCV4_CONTRIB_LIB_SALIENCY),ON,OFF) \
> +	-DBUILD_opencv_sfm=$(if $(BR2_PACKAGE_OPENCV4_CONTRIB_LIB_SFM),ON,OFF) \
> +	-DBUILD_opencv_shape=$(if $(BR2_PACKAGE_OPENCV4_CONTRIB_LIB_SHAPE),ON,OFF) \
> +	-DBUILD_opencv_stereo=$(if $(BR2_PACKAGE_OPENCV4_CONTRIB_LIB_STEREO),ON,OFF) \
> +	-DBUILD_opencv_structured_light=$(if $(BR2_PACKAGE_OPENCV4_CONTRIB_LIB_STRUCTURED_LIGHT),ON,OFF) \
> +	-DBUILD_opencv_superres=$(if $(BR2_PACKAGE_OPENCV4_CONTRIB_LIB_SUPERRES),ON,OFF) \
> +	-DBUILD_opencv_surface_matching=$(if $(BR2_PACKAGE_OPENCV4_CONTRIB_LIB_SURFACE_MATCHING),ON,OFF) \
> +	-DBUILD_opencv_text=$(if $(BR2_PACKAGE_OPENCV4_CONTRIB_LIB_TEXT),ON,OFF) \
> +	-DBUILD_opencv_tracking=$(if $(BR2_PACKAGE_OPENCV4_CONTRIB_LIB_TRACKING),ON,OFF) \
> +	-DBUILD_opencv_videostab=$(if $(BR2_PACKAGE_OPENCV4_CONTRIB_LIB_VIDEOSTAB),ON,OFF) \
> +	-DBUILD_opencv_viz=$(if $(BR2_PACKAGE_OPENCV4_CONTRIB_LIB_VIZ),ON,OFF) \
> +	-DBUILD_opencv_wechat_qrcode=$(if $(BR2_PACKAGE_OPENCV4_CONTRIB_LIB_WECHAT_QRCODE),ON,OFF) \
> +	-DBUILD_opencv_xfeatures2d=$(if $(BR2_PACKAGE_OPENCV4_CONTRIB_LIB_XFEATURES2D),ON,OFF) \
> +	-DBUILD_opencv_ximgproc=$(if $(BR2_PACKAGE_OPENCV4_CONTRIB_LIB_XIMGPROC),ON,OFF) \
> +	-DBUILD_opencv_xobjdetect=$(if $(BR2_PACKAGE_OPENCV4_CONTRIB_LIB_XOBJDETECT),ON,OFF) \
> +	-DBUILD_opencv_xphoto=$(if $(BR2_PACKAGE_OPENCV4_CONTRIB_LIB_XPHOTO),ON,OFF)
> +endif
> +
>  ifeq ($(BR2_PACKAGE_OPENCV4_JPEG2000_WITH_JASPER),y)
>  OPENCV4_CONF_OPTS += -DWITH_JASPER=ON
>  OPENCV4_DEPENDENCIES += jasper
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
