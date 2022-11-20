Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 188F8C433FE
	for <buildroot@archiver.kernel.org>; Sun, 20 Nov 2022 22:33:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6CF8A40138;
	Sun, 20 Nov 2022 22:33:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6CF8A40138
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5gZYWtLNCZXk; Sun, 20 Nov 2022 22:33:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 07AC84032E;
	Sun, 20 Nov 2022 22:33:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 07AC84032E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 621161BF3DE
 for <buildroot@lists.busybox.net>; Sun, 20 Nov 2022 22:33:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 37BCD60C04
 for <buildroot@lists.busybox.net>; Sun, 20 Nov 2022 22:33:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 37BCD60C04
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5_4oTjuap4Rn for <buildroot@lists.busybox.net>;
 Sun, 20 Nov 2022 22:33:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8009760B09
Received: from 011.lax.mailroute.net (011.lax.mailroute.net [199.89.1.14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8009760B09
 for <buildroot@buildroot.org>; Sun, 20 Nov 2022 22:33:18 +0000 (UTC)
Received: from localhost (011.lax.mailroute.net [127.0.0.1])
 by 011.lax.mailroute.net (Postfix) with ESMTP id 4NFlfP6Dvpz2lHwJ;
 Sun, 20 Nov 2022 22:33:17 +0000 (UTC)
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([199.89.1.14])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10026)
 with LMTP id 5cG7a_nOL3CX; Sun, 20 Nov 2022 22:32:54 +0000 (UTC)
Received: from mail.carnegierobotics.com (unknown [72.22.26.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by 011.lax.mailroute.net (Postfix) with ESMTPS id 4NFldx6C1sz2lHSc;
 Sun, 20 Nov 2022 22:32:53 +0000 (UTC)
Received: from CRL-PGH-EX19-1.crl.local (10.1.7.176) by
 CRL-PGH-EX19-1.crl.local (10.1.7.176) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.858.15; Sun, 20 Nov 2022 17:32:52 -0500
Received: from CRL-PGH-EX19-1.crl.local ([fe80::81d6:ea84:15d9:67d4]) by
 CRL-PGH-EX19-1.crl.local ([fe80::81d6:ea84:15d9:67d4%7]) with mapi id
 15.02.0858.015; Sun, 20 Nov 2022 17:32:52 -0500
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Thread-Topic: [Buildroot] [PATCH 1/1] package/opencv4: add support for
 opencv4_contrib repository for extra modules
Thread-Index: AQHY+1a2Z9l4ELzEwEy15Wb6AOVama5H5IcAgACEmAY=
Date: Sun, 20 Nov 2022 22:32:52 +0000
Message-ID: <f820be819c6a474bbde0c9c2f89b09a0@carnegierobotics.com>
References: <20221117173454.21159-1-wdouglass@carnegierobotics.com>,
 <20221120093724.GV2123054@scaer>
In-Reply-To: <20221120093724.GV2123054@scaer>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [173.233.9.13]
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 carnegierobotics.com; h=mime-version:content-type:content-type
 :content-language:accept-language:in-reply-to:references
 :message-id:date:date:subject:subject:from:from:received
 :received:received:received; s=mr01; t=1668983574; x=1671575575;
 bh=XY8L1LfFiJEMU6e9Rj8DZX6RmqJl9DZh4LkJPoRvubM=; b=Ee0/OcZ6aDoX
 TLN/4IOrzHfn0iQjWxn1RYEzJz3SdPqHXrYLTWr8AtbHvDicR9/AbdYQUH9xt8MS
 Eza+ExNWRPFrzfbo+jwGHpKtMPqDD+bPlEO6S94Q9r4XqTFd+deJQGC1UriuD4mY
 6CFH7fykkNopHxJOxsiVC0mMgkurMrVbPXYfOGukSKxFSI6gyfXzJxGW3hd286cC
 pL09aboeo0T/ebEBEgGUy0HMMDhPjsVifltit2VFoh7BD19qutR8JxFUEcyswkMu
 q8BtRcqIM77IaESfamXXvDRKaeRVdyIlXSOfTCjlxtk3yYY99DgdciJIGXRQbZob
 YjpKoZ5g8Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=carnegierobotics.com header.i=@carnegierobotics.com
 header.a=rsa-sha256 header.s=mr01 header.b=Ee0/OcZ6
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============7987301578165071140=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7987301578165071140==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_f820be819c6a474bbde0c9c2f89b09a0carnegieroboticscom_"

--_000_f820be819c6a474bbde0c9c2f89b09a0carnegieroboticscom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Yann, All,


Thanks! Is there a link where I can see the output of the autobuilders? I'm=
 happy to help fix anything that I'm breaking here.


Woody

________________________________
From: Yann E. MORIN <yann.morin.1998@free.fr>
Sent: Sunday, November 20, 2022 4:37:24 AM
To: Woody Douglass
Cc: buildroot@buildroot.org; Fabrice Fontaine; Thomas Petazzoni
Subject: Re: [Buildroot] [PATCH 1/1] package/opencv4: add support for openc=
v4_contrib repository for extra modules

Woodrow, All,

On 2022-11-17 12:34 -0500, Woodrow Douglass via buildroot spake thusly:
> This adds a separate opencv4_contrib package to manage
> downloading/unpacking that repository. These extra modules
> are useful for a lot of applications, but not necessary
> for minimal installs, so they are all given dedicated Kconfig
> options
>
> It's important to note that the opencv4-contrib package
> downloads extra source that is compiled as a part of
> the opencv4 package. This is why it is a dependency
> of opencv4, and not the other way around

I just added a little comment in opencv4-contrib.mk as a reminder of
the situation.

That makes for a lot of options, and I was wondering if some may had
external dependencies. But I guess the autobulders will eventually tell
us so...

> Signed-off-by: Woodrow Douglass <wdouglass@carnegierobotics.com>

Applied to next, thanks.

Regards,
Yann E. MORIN.

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
> index aef80f9ab0..57f868530e 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1593,6 +1593,7 @@ menu "Graphics"
>        source "package/opencl-clhpp/Config.in"
>        source "package/opencv3/Config.in"
>        source "package/opencv4/Config.in"
> +     source "package/opencv4-contrib/Config.in"
>        source "package/opengl/Config.in"
>        source "package/openjpeg/Config.in"
>        source "package/pango/Config.in"
> diff --git a/package/opencv4-contrib/Config.in b/package/opencv4-contrib/=
Config.in
> new file mode 100644
> index 0000000000..9800333035
> --- /dev/null
> +++ b/package/opencv4-contrib/Config.in
> @@ -0,0 +1,313 @@
> +menuconfig BR2_PACKAGE_OPENCV4_CONTRIB
> +     bool "opencv4-contrib"
> +     depends on BR2_PACKAGE_OPENCV4
> +     help
> +       OpenCV (Open Source Computer Vision) is a library of
> +       programming functions for real time computer vision.
> +
> +       http://opencv.org/
> +
> +if BR2_PACKAGE_OPENCV4_CONTRIB
> +
> +config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_ALPHAMAT
> +     bool "alphamat"
> +     help
> +       Computer Vision based Alpha Matting -- Given an input image
> +       and a trimap, generate an alpha matte.
> +
> +config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_ARUCO
> +     bool "aruco"
> +     help
> +       ArUco and ChArUco Markers -- Augmented reality ArUco marker
> +       and "ChARUco" markers where ArUco markers embedded inside the
> +       white areas of the checker board.
> +
> +config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_BARCODE
> +     bool "barcode"
> +     help
> +       Barcode detecting and decoding methods.
> +
> +config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_BGSEGM
> +     bool "bgsegm"
> +     help
> +       Background segmentation algorithm combining statistical
> +       background image estimation and per-pixel Bayesian
> +       segmentation.
> +
> +config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_BIOINSPIRED
> +     bool "bioinspired"
> +     help
> +       Biological Vision -- Biologically inspired vision model:
> +       minimize noise and luminance variance, transient event
> +       segmentation, high dynamic range tone mapping methods.
> +
> +config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_CCALIB
> +     bool "ccalib"
> +     help
> +       Custom Calibration -- Patterns for 3D reconstruction,
> +       omnidirectional camera calibration, random pattern calibration
> +       and multi-camera calibration.
> +
> +config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_CNN_3DOBJ
> +     bool "cnn_3dobj"
> +     help
> +       Deep Object Recognition and Pose -- Uses Caffe Deep Neural Net
> +       library to build, train and test a CNN model of visual object
> +       recognition and pose.
> +
> +config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_CVV
> +     bool "cvv"
> +     help
> +       Computer Vision Debugger -- Simple code that you can add
> +       to your program that pops up a GUI allowing you to
> +       interactively and visually debug computer vision programs.
> +
> +config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_DATASETS
> +     bool "datasets"
> +     help
> +       Datasets Reader -- Code for reading existing computer vision
> +       databases and samples of using the readers to train, test and
> +       run using that dataset's data.
> +
> +config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_DNN_OBJDETECT
> +     bool "dnn_objdetect"
> +     help
> +       Object Detection using CNNs -- Implements compact CNN Model
> +       for object detection. Trained using Caffe but uses
> +       opencv_dnn module.
> +
> +config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_DNN_SUPERRES
> +     bool "dnn_superres"
> +     help
> +       Superresolution using CNNs -- Contains four trained
> +       convolutional neural networks to upscale images.
> +
> +config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_DNNS_EASILY_FOOLED
> +     bool "dnns_easily_fooled"
> +     help
> +       Subvert DNNs -- This code can use the activations in a
> +       network to fool the networks into recognizing something else.
> +
> +config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_DPM
> +     bool "dpm"
> +     help
> +       Deformable Part Model -- Felzenszwalb's Cascade with
> +       deformable parts object recognition code.
> +
> +config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_FACE
> +     bool "face"
> +     help
> +       Face Recognition -- Face recognition techniques: Eigen, Fisher
> +       and Local Binary Pattern Histograms LBPH methods.
> +
> +config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_FREETYPE
> +     bool "freetype"
> +     help
> +       Drawing text using freetype and harfbuzz.
> +
> +config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_FUZZY
> +     bool "fuzzy"
> +     help
> +       Fuzzy Logic in Vision -- Fuzzy logic image transform and
> +       inverse; Fuzzy image processing.
> +
> +config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_HDF
> +     bool "hdf"
> +     help
> +       Hierarchical Data Storage -- This module contains I/O
> +       routines for Hierarchical Data Format:
> +       https://en.m.wikipedia.org/wiki/Hierarchical_Data_Format
> +       meant to store large amounts of data.
> +
> +config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_HFS
> +     bool "hfs"
> +     help
> +       Hierarchical Feature Selection for Efficient Image
> +       Segmentation -- This module contains an efficient
> +       algorithm to segment an image.
> +
> +config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_IMG_HASH
> +     bool "img_hash"
> +     help
> +       This module contains algorithms to extract hash of an
> +       image allowing to efficiently estimate similarity between
> +       images.
> +
> +config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_INTENSITY_TRANSFORM
> +     bool "intensity_transform"
> +     help
> +       The module brings implementations of intensity transformation
> +       algorithms to adjust image contrast.
> +
> +config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_JULIA
> +     bool "julia"
> +     help
> +       Julia language wrappers with samples and tests.
> +
> +config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_LINE_DESCRIPTOR
> +     bool "line_descriptor"
> +     help
> +       Line Segment Extract and Match -- Methods of extracting,
> +       describing and matching line segments using binary
> +       descriptors.
> +
> +config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_MATLAB
> +     bool "matlab"
> +     help
> +       Matlab Interface -- OpenCV Matlab Mex wrapper code generator
> +       for certain opencv core modules.
> +
> +config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_MCC
> +     bool "mcc"
> +     help
> +       Macbeth Color Chart detector -- Find and return color patch
> +       location in MacBeth color calibration charts.
> +
> +config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_OPTFLOW
> +     bool "optflow"
> +     help
> +       Optical Flow -- Algorithms for running and evaluating
> +       deepflow, simpleflow, sparsetodenseflow and motion
> +       templates (silhouette flow).
> +
> +config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_OVIS
> +     bool "ovis"
> +     help
> +       OGRE 3D Visualiser -- allows you to render 3D data using
> +       the OGRE 3D engine.
> +
> +config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_PHASE_UNWRAPPING
> +     bool "phase_unwrapping"
> +     help
> +       Quality-guided phase unwrapping.
> +
> +config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_PLOT
> +     bool "plot"
> +     help
> +       Plotting -- The plot module allows you to easily plot data
> +       in 1D or 2D.
> +
> +config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_QUALITY
> +     bool "quality"
> +     help
> +       Image Quality Analysis (IQA) API.
> +
> +config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_RAPID
> +     bool "rapid"
> +     help
> +       Silhouette based 3D object tracking.
> +
> +config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_REG
> +     bool "reg"
> +     help
> +       Image Registration -- Pixels based image registration for
> +       precise alignment. Follows the paper "Image Alignment and
> +       Stitching: A Tutorial", by Richard Szeliski.
> +
> +config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_RGBD
> +     bool "rgbd"
> +     help
> +       RGB-Depth Processing module -- Linemod 3D object recognition;
> +       Fast surface normals and 3D plane finding. 3D visual odometry.
> +       3d reconstruction using KinectFusion.
> +
> +config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_SALIENCY
> +     bool "saliency"
> +     help
> +       Saliency API -- Where humans would look in a scene. Has
> +       routines for static, motion and "objectness" saliency.
> +
> +config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_SFM
> +     bool "sfm"
> +     help
> +       Structure from Motion -- This module contains algorithms
> +       to perform 3d reconstruction from 2d images. The core of
> +       the module is a light version of Libmv.
> +
> +config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_SHAPE
> +     bool "shape"
> +     help
> +       Shape Distance and Matching
> +
> +config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_STEREO
> +     bool "stereo"
> +     help
> +       Stereo Correspondence -- Stereo matching done with different
> +       descriptors: Census / CS-Census / MCT / BRIEF / MV and dense
> +       stereo correspondence using Quasi Dense Stereo method.
> +
> +config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_STRUCTURED_LIGHT
> +     bool "structured_light"
> +     help
> +       Structured Light Use -- How to generate and project gray code
> +       patterns and use them to find dense depth in a scene.
> +
> +config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_SUPERRES
> +     bool "superres"
> +     help
> +       Super Resolution
> +
> +config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_SURFACE_MATCHING
> +     bool "surface_matching"
> +     help
> +       Point Pair Features -- Implements 3d object detection and
> +       localization using multimodal point pair features.
> +
> +config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_TEXT
> +     bool "text"
> +     help
> +       Scene Text Detection and Recognition -- This module contains
> +       algorithms to perform text detection, words segmentation and
> +       text recognition in a visual scene.
> +
> +config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_TRACKING
> +     bool "tracking"
> +     help
> +       Vision Based Object Tracking -- Use and/or evaluate different
> +       visual object tracking techniques.
> +
> +config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_VIDEOSTAB
> +     bool "videostab"
> +     help
> +       Video Stabilization
> +
> +config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_VIZ
> +     bool "viz"
> +     help
> +       3D Visualizer
> +
> +config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_WECHAT_QRCODE
> +     bool "wechat_qrcode"
> +     help
> +       WeChat QR code detector for detecting and parsing QR code.
> +
> +config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_XFEATURES2D
> +     bool "xfeatures2d"
> +     help
> +       Features2D extra -- Extra 2D Features Framework containing
> +       experimental and non-free 2D feature detector/descriptor
> +       algorithms. SURF, BRIEF, Censure, Freak, LUCID, Daisy,
> +       Self-similar.
> +
> +config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_XIMGPROC
> +     bool "ximgproc"
> +     help
> +       Extended Image Processing -- Structured Forests / Domain
> +       Transform Filter / Guided Filter / Adaptive Manifold Filter
> +       / Joint Bilateral Filter / Superpixels / Ridge Detection
> +       Filter.
> +
> +config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_XOBJDETECT
> +     bool "xobjdetect"
> +     help
> +       Boosted 2D Object Detection -- Uses a Waldboost cascade and
> +       local binary patterns computed as integral features for 2D
> +       object detection.
> +
> +config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_XPHOTO
> +     bool "xphoto"
> +     help
> +       Extra Computational Photography -- Additional photo processing
> +       algorithms: Color balance / Denoising / Inpainting.
> +
> +endif
> diff --git a/package/opencv4-contrib/opencv4-contrib.hash b/package/openc=
v4-contrib/opencv4-contrib.hash
> new file mode 100644
> index 0000000000..4f15162e50
> --- /dev/null
> +++ b/package/opencv4-contrib/opencv4-contrib.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated
> +sha256  1777d5fd2b59029cf537e5fd6f8aa68d707075822f90bde683fcde086f85f7a7=
  opencv4-contrib-4.6.0.tar.gz
> +sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30=
  LICENSE
> diff --git a/package/opencv4-contrib/opencv4-contrib.mk b/package/opencv4=
-contrib/opencv4-contrib.mk
> new file mode 100644
> index 0000000000..58dbe27e28
> --- /dev/null
> +++ b/package/opencv4-contrib/opencv4-contrib.mk
> @@ -0,0 +1,13 @@
> +########################################################################=
########
> +#
> +# opencv4-contrib
> +#
> +########################################################################=
########
> +
> +OPENCV4_CONTRIB_VERSION =3D 4.6.0
> +OPENCV4_CONTRIB_SITE =3D $(call github,opencv,opencv_contrib,$(OPENCV4_C=
ONTRIB_VERSION))
> +OPENCV4_CONTRIB_INSTALL_TARGET =3D FALSE
> +OPENCV4_CONTRIB_LICENSE =3D Apache-2.0
> +OPENCV4_CONTRIB_LICENSE_FILES =3D LICENSE
> +
> +$(eval $(generic-package))
> diff --git a/package/opencv4/opencv4.mk b/package/opencv4/opencv4.mk
> index ef15c6d911..a665793ad9 100644
> --- a/package/opencv4/opencv4.mk
> +++ b/package/opencv4/opencv4.mk
> @@ -82,11 +82,6 @@ OPENCV4_CONF_OPTS +=3D \
>  #   - viz: missing VTK dependency
>  #   - world: all-in-one module
>  #
> -# * Contrib modules from [1] are disabled:
> -#   - opencv_contrib package is not available in Buildroot;
> -#   - OPENCV_EXTRA_MODULES_PATH is not set.
> -#
> -# [1] https://github.com/Itseez/opencv_contrib
>  OPENCV4_CONF_OPTS +=3D \
>        -DBUILD_opencv_androidcamera=3DOFF \
>        -DBUILD_opencv_apps=3DOFF \
> @@ -232,6 +227,63 @@ OPENCV4_CONF_OPTS +=3D \
>
>  OPENCV4_DEPENDENCIES +=3D host-pkgconf zlib
>
> +ifeq ($(BR2_PACKAGE_OPENCV4_CONTRIB),y)
> +# OPENCV4 depends on OPENCV4_CONTRIB, and not the other way around.
> +# The modules in OPENCV4_CONTRIB get built as part of the build
> +# process for OPENCV4, so the source needs to be unpacked already
> +OPENCV4_DEPENDENCIES +=3D opencv4-contrib
> +OPENCV4_CONF_OPTS +=3D \
> +     -DOPENCV_EXTRA_MODULES_PATH=3D$(OPENCV4_CONTRIB_DIR)/modules \
> +     -DBUILD_opencv_alphamat=3D$(if $(BR2_PACKAGE_OPENCV4_CONTRIB_LIB_AL=
PHAMAT),ON,OFF) \
> +     -DBUILD_opencv_aruco=3D$(if $(BR2_PACKAGE_OPENCV4_CONTRIB_LIB_ARUCO=
),ON,OFF) \
> +     -DBUILD_opencv_barcode=3D$(if $(BR2_PACKAGE_OPENCV4_CONTRIB_LIB_BAR=
CODE),ON,OFF) \
> +     -DBUILD_opencv_bgsegm=3D$(if $(BR2_PACKAGE_OPENCV4_CONTRIB_LIB_BGSE=
GM),ON,OFF) \
> +     -DBUILD_opencv_bioinspired=3D$(if $(BR2_PACKAGE_OPENCV4_CONTRIB_LIB=
_BIOINSPIRED),ON,OFF) \
> +     -DBUILD_opencv_ccalib=3D$(if $(BR2_PACKAGE_OPENCV4_CONTRIB_LIB_CCAL=
IB),ON,OFF) \
> +     -DBUILD_opencv_cnn_3dobj=3D$(if $(BR2_PACKAGE_OPENCV4_CONTRIB_LIB_C=
NN_3DOBJ),ON,OFF) \
> +     -DBUILD_opencv_cvv=3D$(if $(BR2_PACKAGE_OPENCV4_CONTRIB_LIB_CVV),ON=
,OFF) \
> +     -DBUILD_opencv_datasets=3D$(if $(BR2_PACKAGE_OPENCV4_CONTRIB_LIB_DA=
TASETS),ON,OFF) \
> +     -DBUILD_opencv_dnn_objdetect=3D$(if $(BR2_PACKAGE_OPENCV4_CONTRIB_L=
IB_DNN_OBJDETECT),ON,OFF) \
> +     -DBUILD_opencv_dnn_superres=3D$(if $(BR2_PACKAGE_OPENCV4_CONTRIB_LI=
B_DNN_SUPERRES),ON,OFF) \
> +     -DBUILD_opencv_dnns_easily_fooled=3D$(if $(BR2_PACKAGE_OPENCV4_CONT=
RIB_LIB_DNNS_EASILY_FOOLED),ON,OFF) \
> +     -DBUILD_opencv_dpm=3D$(if $(BR2_PACKAGE_OPENCV4_CONTRIB_LIB_DPM),ON=
,OFF) \
> +     -DBUILD_opencv_face=3D$(if $(BR2_PACKAGE_OPENCV4_CONTRIB_LIB_FACE),=
ON,OFF) \
> +     -DBUILD_opencv_freetype=3D$(if $(BR2_PACKAGE_OPENCV4_CONTRIB_LIB_FR=
EETYPE),ON,OFF) \
> +     -DBUILD_opencv_fuzzy=3D$(if $(BR2_PACKAGE_OPENCV4_CONTRIB_LIB_FUZZY=
),ON,OFF) \
> +     -DBUILD_opencv_hdf=3D$(if $(BR2_PACKAGE_OPENCV4_CONTRIB_LIB_HDF),ON=
,OFF) \
> +     -DBUILD_opencv_hfs=3D$(if $(BR2_PACKAGE_OPENCV4_CONTRIB_LIB_HFS),ON=
,OFF) \
> +     -DBUILD_opencv_img_hash=3D$(if $(BR2_PACKAGE_OPENCV4_CONTRIB_LIB_IM=
G_HASH),ON,OFF) \
> +     -DBUILD_opencv_intensity_transform=3D$(if $(BR2_PACKAGE_OPENCV4_CON=
TRIB_LIB_INTENSITY_TRANSFORM),ON,OFF) \
> +     -DBUILD_opencv_julia=3D$(if $(BR2_PACKAGE_OPENCV4_CONTRIB_LIB_JULIA=
),ON,OFF) \
> +     -DBUILD_opencv_line_descriptor=3D$(if $(BR2_PACKAGE_OPENCV4_CONTRIB=
_LIB_LINE_DESCRIPTOR),ON,OFF) \
> +     -DBUILD_opencv_matlab=3D$(if $(BR2_PACKAGE_OPENCV4_CONTRIB_LIB_MATL=
AB),ON,OFF) \
> +     -DBUILD_opencv_mcc=3D$(if $(BR2_PACKAGE_OPENCV4_CONTRIB_LIB_MCC),ON=
,OFF) \
> +     -DBUILD_opencv_optflow=3D$(if $(BR2_PACKAGE_OPENCV4_CONTRIB_LIB_OPT=
FLOW),ON,OFF) \
> +     -DBUILD_opencv_ovis=3D$(if $(BR2_PACKAGE_OPENCV4_CONTRIB_LIB_OVIS),=
ON,OFF) \
> +     -DBUILD_opencv_phase_unwrapping=3D$(if $(BR2_PACKAGE_OPENCV4_CONTRI=
B_LIB_PHASE_UNWRAPPING),ON,OFF) \
> +     -DBUILD_opencv_plot=3D$(if $(BR2_PACKAGE_OPENCV4_CONTRIB_LIB_PLOT),=
ON,OFF) \
> +     -DBUILD_opencv_quality=3D$(if $(BR2_PACKAGE_OPENCV4_CONTRIB_LIB_QUA=
LITY),ON,OFF) \
> +     -DBUILD_opencv_rapid=3D$(if $(BR2_PACKAGE_OPENCV4_CONTRIB_LIB_RAPID=
),ON,OFF) \
> +     -DBUILD_opencv_reg=3D$(if $(BR2_PACKAGE_OPENCV4_CONTRIB_LIB_REG),ON=
,OFF) \
> +     -DBUILD_opencv_rgbd=3D$(if $(BR2_PACKAGE_OPENCV4_CONTRIB_LIB_RGBD),=
ON,OFF) \
> +     -DBUILD_opencv_saliency=3D$(if $(BR2_PACKAGE_OPENCV4_CONTRIB_LIB_SA=
LIENCY),ON,OFF) \
> +     -DBUILD_opencv_sfm=3D$(if $(BR2_PACKAGE_OPENCV4_CONTRIB_LIB_SFM),ON=
,OFF) \
> +     -DBUILD_opencv_shape=3D$(if $(BR2_PACKAGE_OPENCV4_CONTRIB_LIB_SHAPE=
),ON,OFF) \
> +     -DBUILD_opencv_stereo=3D$(if $(BR2_PACKAGE_OPENCV4_CONTRIB_LIB_STER=
EO),ON,OFF) \
> +     -DBUILD_opencv_structured_light=3D$(if $(BR2_PACKAGE_OPENCV4_CONTRI=
B_LIB_STRUCTURED_LIGHT),ON,OFF) \
> +     -DBUILD_opencv_superres=3D$(if $(BR2_PACKAGE_OPENCV4_CONTRIB_LIB_SU=
PERRES),ON,OFF) \
> +     -DBUILD_opencv_surface_matching=3D$(if $(BR2_PACKAGE_OPENCV4_CONTRI=
B_LIB_SURFACE_MATCHING),ON,OFF) \
> +     -DBUILD_opencv_text=3D$(if $(BR2_PACKAGE_OPENCV4_CONTRIB_LIB_TEXT),=
ON,OFF) \
> +     -DBUILD_opencv_tracking=3D$(if $(BR2_PACKAGE_OPENCV4_CONTRIB_LIB_TR=
ACKING),ON,OFF) \
> +     -DBUILD_opencv_videostab=3D$(if $(BR2_PACKAGE_OPENCV4_CONTRIB_LIB_V=
IDEOSTAB),ON,OFF) \
> +     -DBUILD_opencv_viz=3D$(if $(BR2_PACKAGE_OPENCV4_CONTRIB_LIB_VIZ),ON=
,OFF) \
> +     -DBUILD_opencv_wechat_qrcode=3D$(if $(BR2_PACKAGE_OPENCV4_CONTRIB_L=
IB_WECHAT_QRCODE),ON,OFF) \
> +     -DBUILD_opencv_xfeatures2d=3D$(if $(BR2_PACKAGE_OPENCV4_CONTRIB_LIB=
_XFEATURES2D),ON,OFF) \
> +     -DBUILD_opencv_ximgproc=3D$(if $(BR2_PACKAGE_OPENCV4_CONTRIB_LIB_XI=
MGPROC),ON,OFF) \
> +     -DBUILD_opencv_xobjdetect=3D$(if $(BR2_PACKAGE_OPENCV4_CONTRIB_LIB_=
XOBJDETECT),ON,OFF) \
> +     -DBUILD_opencv_xphoto=3D$(if $(BR2_PACKAGE_OPENCV4_CONTRIB_LIB_XPHO=
TO),ON,OFF)
> +endif
> +
>  ifeq ($(BR2_PACKAGE_OPENCV4_JPEG2000_WITH_JASPER),y)
>  OPENCV4_CONF_OPTS +=3D -DWITH_JASPER=3DON
>  OPENCV4_DEPENDENCIES +=3D jasper
> --
> 2.20.1
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

--
.-----------------.--------------------.------------------.----------------=
----.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspira=
cy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___           =
    |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is =
no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspirac=
y.  |
'------------------------------^-------^------------------^----------------=
----'

--_000_f820be819c6a474bbde0c9c2f89b09a0carnegieroboticscom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><style><!-- .EmailQuote { margin-left: 1pt; pad=
ding-left: 4pt; border-left: #800000 2px solid; } --></style>
</head>
<body>
<meta content=3D"text/html; charset=3DUTF-8">
<style type=3D"text/css" style=3D"">
<!--
p
	{margin-top:0;
	margin-bottom:0}
-->
</style>
<div dir=3D"ltr">
<div id=3D"x_divtagdefaultwrapper" dir=3D"ltr" style=3D"font-size:12pt; col=
or:#000000; font-family:Calibri,Helvetica,sans-serif">
<p>Yann, All,</p>
<p><br>
</p>
<p>Thanks! Is there a link where I can see the output of the autobuilders? =
I'm happy to help fix anything that I'm breaking here.</p>
<p><br>
</p>
<p>Woody</p>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Yann E. MORIN &lt;y=
ann.morin.1998@free.fr&gt;<br>
<b>Sent:</b> Sunday, November 20, 2022 4:37:24 AM<br>
<b>To:</b> Woody Douglass<br>
<b>Cc:</b> buildroot@buildroot.org; Fabrice Fontaine; Thomas Petazzoni<br>
<b>Subject:</b> Re: [Buildroot] [PATCH 1/1] package/opencv4: add support fo=
r opencv4_contrib repository for extra modules</font>
<div>&nbsp;</div>
</div>
</div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText">Woodrow, All,<br>
<br>
On 2022-11-17 12:34 -0500, Woodrow Douglass via buildroot spake thusly:<br>
&gt; This adds a separate opencv4_contrib package to manage<br>
&gt; downloading/unpacking that repository. These extra modules<br>
&gt; are useful for a lot of applications, but not necessary<br>
&gt; for minimal installs, so they are all given dedicated Kconfig<br>
&gt; options<br>
&gt; <br>
&gt; It's important to note that the opencv4-contrib package<br>
&gt; downloads extra source that is compiled as a part of<br>
&gt; the opencv4 package. This is why it is a dependency<br>
&gt; of opencv4, and not the other way around<br>
<br>
I just added a little comment in opencv4-contrib.mk as a reminder of<br>
the situation.<br>
<br>
That makes for a lot of options, and I was wondering if some may had<br>
external dependencies. But I guess the autobulders will eventually tell<br>
us so...<br>
<br>
&gt; Signed-off-by: Woodrow Douglass &lt;wdouglass@carnegierobotics.com&gt;=
<br>
<br>
Applied to next, thanks.<br>
<br>
Regards,<br>
Yann E. MORIN.<br>
<br>
&gt; ---<br>
&gt;&nbsp; package/Config.in&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 1 &#43;<br>
&gt;&nbsp; package/opencv4-contrib/Config.in&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 313 &#43;&#43;&#43;&#43;&#43;&#43;&#4=
3;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;<br>
&gt;&nbsp; package/opencv4-contrib/opencv4-contrib.hash |&nbsp;&nbsp; 3 &#4=
3;<br>
&gt;&nbsp; package/opencv4-contrib/opencv4-contrib.mk&nbsp;&nbsp; |&nbsp; 1=
3 &#43;<br>
&gt;&nbsp; package/opencv4/opencv4.mk&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nb=
sp; 62 &#43;&#43;&#43;-<br>
&gt;&nbsp; 5 files changed, 387 insertions(&#43;), 5 deletions(-)<br>
&gt;&nbsp; create mode 100644 package/opencv4-contrib/Config.in<br>
&gt;&nbsp; create mode 100644 package/opencv4-contrib/opencv4-contrib.hash<=
br>
&gt;&nbsp; create mode 100644 package/opencv4-contrib/opencv4-contrib.mk<br=
>
&gt; <br>
&gt; diff --git a/package/Config.in b/package/Config.in<br>
&gt; index aef80f9ab0..57f868530e 100644<br>
&gt; --- a/package/Config.in<br>
&gt; &#43;&#43;&#43; b/package/Config.in<br>
&gt; @@ -1593,6 &#43;1593,7 @@ menu &quot;Graphics&quot;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; source &quot;package/opencl-=
clhpp/Config.in&quot;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; source &quot;package/opencv3=
/Config.in&quot;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; source &quot;package/opencv4=
/Config.in&quot;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; source &quot;package/opencv4-contrib/Con=
fig.in&quot;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; source &quot;package/opengl/=
Config.in&quot;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; source &quot;package/openjpe=
g/Config.in&quot;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; source &quot;package/pango/C=
onfig.in&quot;<br>
&gt; diff --git a/package/opencv4-contrib/Config.in b/package/opencv4-contr=
ib/Config.in<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..9800333035<br>
&gt; --- /dev/null<br>
&gt; &#43;&#43;&#43; b/package/opencv4-contrib/Config.in<br>
&gt; @@ -0,0 &#43;1,313 @@<br>
&gt; &#43;menuconfig BR2_PACKAGE_OPENCV4_CONTRIB<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; bool &quot;opencv4-contrib&quot;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; depends on BR2_PACKAGE_OPENCV4<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; help<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; OpenCV (Open Source Computer=
 Vision) is a library of<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; programming functions for re=
al time computer vision.<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"http://opencv.org=
/">http://opencv.org/</a><br>
&gt; &#43;<br>
&gt; &#43;if BR2_PACKAGE_OPENCV4_CONTRIB<br>
&gt; &#43;<br>
&gt; &#43;config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_ALPHAMAT<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; bool &quot;alphamat&quot;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; help<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Computer Vision based Alpha =
Matting -- Given an input image<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; and a trimap, generate an al=
pha matte.<br>
&gt; &#43;<br>
&gt; &#43;config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_ARUCO<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; bool &quot;aruco&quot;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; help<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ArUco and ChArUco Markers --=
 Augmented reality ArUco marker<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; and &quot;ChARUco&quot; mark=
ers where ArUco markers embedded inside the<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; white areas of the checker b=
oard.<br>
&gt; &#43;<br>
&gt; &#43;config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_BARCODE<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; bool &quot;barcode&quot;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; help<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Barcode detecting and decodi=
ng methods.<br>
&gt; &#43;<br>
&gt; &#43;config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_BGSEGM<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; bool &quot;bgsegm&quot;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; help<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Background segmentation algo=
rithm combining statistical<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; background image estimation =
and per-pixel Bayesian<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; segmentation.<br>
&gt; &#43;<br>
&gt; &#43;config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_BIOINSPIRED<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; bool &quot;bioinspired&quot;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; help<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Biological Vision -- Biologi=
cally inspired vision model:<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; minimize noise and luminance=
 variance, transient event<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; segmentation, high dynamic r=
ange tone mapping methods.<br>
&gt; &#43;<br>
&gt; &#43;config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_CCALIB<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; bool &quot;ccalib&quot;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; help<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Custom Calibration -- Patter=
ns for 3D reconstruction,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; omnidirectional camera calib=
ration, random pattern calibration<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; and multi-camera calibration=
.<br>
&gt; &#43;<br>
&gt; &#43;config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_CNN_3DOBJ<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; bool &quot;cnn_3dobj&quot;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; help<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Deep Object Recognition and =
Pose -- Uses Caffe Deep Neural Net<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; library to build, train and =
test a CNN model of visual object<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; recognition and pose.<br>
&gt; &#43;<br>
&gt; &#43;config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_CVV<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; bool &quot;cvv&quot;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; help<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Computer Vision Debugger -- =
Simple code that you can add<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; to your program that pops up=
 a GUI allowing you to<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; interactively and visually d=
ebug computer vision programs.<br>
&gt; &#43;<br>
&gt; &#43;config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_DATASETS<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; bool &quot;datasets&quot;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; help<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Datasets Reader -- Code for =
reading existing computer vision<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; databases and samples of usi=
ng the readers to train, test and<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; run using that dataset's dat=
a.<br>
&gt; &#43;<br>
&gt; &#43;config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_DNN_OBJDETECT<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; bool &quot;dnn_objdetect&quot;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; help<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Object Detection using CNNs =
-- Implements compact CNN Model<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for object detection. Traine=
d using Caffe but uses<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; opencv_dnn module.<br>
&gt; &#43;<br>
&gt; &#43;config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_DNN_SUPERRES<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; bool &quot;dnn_superres&quot;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; help<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Superresolution using CNNs -=
- Contains four trained<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; convolutional neural network=
s to upscale images.<br>
&gt; &#43;<br>
&gt; &#43;config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_DNNS_EASILY_FOOLED<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; bool &quot;dnns_easily_fooled&quot;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; help<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Subvert DNNs -- This code ca=
n use the activations in a<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; network to fool the networks=
 into recognizing something else.<br>
&gt; &#43;<br>
&gt; &#43;config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_DPM<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; bool &quot;dpm&quot;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; help<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Deformable Part Model -- Fel=
zenszwalb's Cascade with<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; deformable parts object reco=
gnition code.<br>
&gt; &#43;<br>
&gt; &#43;config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_FACE<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; bool &quot;face&quot;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; help<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Face Recognition -- Face rec=
ognition techniques: Eigen, Fisher<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; and Local Binary Pattern His=
tograms LBPH methods.<br>
&gt; &#43;<br>
&gt; &#43;config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_FREETYPE<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; bool &quot;freetype&quot;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; help<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Drawing text using freetype =
and harfbuzz.<br>
&gt; &#43;<br>
&gt; &#43;config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_FUZZY<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; bool &quot;fuzzy&quot;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; help<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Fuzzy Logic in Vision -- Fuz=
zy logic image transform and<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; inverse; Fuzzy image process=
ing.<br>
&gt; &#43;<br>
&gt; &#43;config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_HDF<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; bool &quot;hdf&quot;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; help<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Hierarchical Data Storage --=
 This module contains I/O<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; routines for Hierarchical Da=
ta Format:<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"https://en.m.wiki=
pedia.org/wiki/Hierarchical_Data_Format">https://en.m.wikipedia.org/wiki/Hi=
erarchical_Data_Format</a><br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; meant to store large amounts=
 of data.<br>
&gt; &#43;<br>
&gt; &#43;config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_HFS<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; bool &quot;hfs&quot;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; help<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Hierarchical Feature Selecti=
on for Efficient Image<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Segmentation -- This module =
contains an efficient<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; algorithm to segment an imag=
e.<br>
&gt; &#43;<br>
&gt; &#43;config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_IMG_HASH<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; bool &quot;img_hash&quot;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; help<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; This module contains algorit=
hms to extract hash of an<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; image allowing to efficientl=
y estimate similarity between<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; images.<br>
&gt; &#43;<br>
&gt; &#43;config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_INTENSITY_TRANSFORM<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; bool &quot;intensity_transform&quot;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; help<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; The module brings implementa=
tions of intensity transformation<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; algorithms to adjust image c=
ontrast.<br>
&gt; &#43;<br>
&gt; &#43;config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_JULIA<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; bool &quot;julia&quot;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; help<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Julia language wrappers with=
 samples and tests.<br>
&gt; &#43;<br>
&gt; &#43;config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_LINE_DESCRIPTOR<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; bool &quot;line_descriptor&quot;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; help<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Line Segment Extract and Mat=
ch -- Methods of extracting,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; describing and matching line=
 segments using binary<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; descriptors.<br>
&gt; &#43;<br>
&gt; &#43;config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_MATLAB<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; bool &quot;matlab&quot;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; help<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Matlab Interface -- OpenCV M=
atlab Mex wrapper code generator<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for certain opencv core modu=
les.<br>
&gt; &#43;<br>
&gt; &#43;config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_MCC<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; bool &quot;mcc&quot;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; help<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Macbeth Color Chart detector=
 -- Find and return color patch<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; location in MacBeth color ca=
libration charts.<br>
&gt; &#43;<br>
&gt; &#43;config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_OPTFLOW<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; bool &quot;optflow&quot;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; help<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Optical Flow -- Algorithms f=
or running and evaluating<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; deepflow, simpleflow, sparse=
todenseflow and motion<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; templates (silhouette flow).=
<br>
&gt; &#43;<br>
&gt; &#43;config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_OVIS<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; bool &quot;ovis&quot;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; help<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; OGRE 3D Visualiser -- allows=
 you to render 3D data using<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; the OGRE 3D engine.<br>
&gt; &#43;<br>
&gt; &#43;config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_PHASE_UNWRAPPING<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; bool &quot;phase_unwrapping&quot;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; help<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Quality-guided phase unwrapp=
ing.<br>
&gt; &#43;<br>
&gt; &#43;config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_PLOT<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; bool &quot;plot&quot;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; help<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Plotting -- The plot module =
allows you to easily plot data<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; in 1D or 2D.<br>
&gt; &#43;<br>
&gt; &#43;config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_QUALITY<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; bool &quot;quality&quot;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; help<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Image Quality Analysis (IQA)=
 API.<br>
&gt; &#43;<br>
&gt; &#43;config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_RAPID<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; bool &quot;rapid&quot;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; help<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Silhouette based 3D object t=
racking.<br>
&gt; &#43;<br>
&gt; &#43;config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_REG<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; bool &quot;reg&quot;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; help<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Image Registration -- Pixels=
 based image registration for<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; precise alignment. Follows t=
he paper &quot;Image Alignment and<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Stitching: A Tutorial&quot;,=
 by Richard Szeliski.<br>
&gt; &#43;<br>
&gt; &#43;config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_RGBD<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; bool &quot;rgbd&quot;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; help<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; RGB-Depth Processing module =
-- Linemod 3D object recognition;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Fast surface normals and 3D =
plane finding. 3D visual odometry.<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3d reconstruction using Kine=
ctFusion.<br>
&gt; &#43;<br>
&gt; &#43;config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_SALIENCY<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; bool &quot;saliency&quot;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; help<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Saliency API -- Where humans=
 would look in a scene. Has<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; routines for static, motion =
and &quot;objectness&quot; saliency.<br>
&gt; &#43;<br>
&gt; &#43;config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_SFM<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; bool &quot;sfm&quot;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; help<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Structure from Motion -- Thi=
s module contains algorithms<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; to perform 3d reconstruction=
 from 2d images. The core of<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; the module is a light versio=
n of Libmv.<br>
&gt; &#43;<br>
&gt; &#43;config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_SHAPE<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; bool &quot;shape&quot;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; help<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Shape Distance and Matching<=
br>
&gt; &#43;<br>
&gt; &#43;config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_STEREO<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; bool &quot;stereo&quot;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; help<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Stereo Correspondence -- Ste=
reo matching done with different<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; descriptors: Census / CS-Cen=
sus / MCT / BRIEF / MV and dense<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; stereo correspondence using =
Quasi Dense Stereo method.<br>
&gt; &#43;<br>
&gt; &#43;config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_STRUCTURED_LIGHT<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; bool &quot;structured_light&quot;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; help<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Structured Light Use -- How =
to generate and project gray code<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; patterns and use them to fin=
d dense depth in a scene.<br>
&gt; &#43;<br>
&gt; &#43;config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_SUPERRES<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; bool &quot;superres&quot;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; help<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Super Resolution<br>
&gt; &#43;<br>
&gt; &#43;config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_SURFACE_MATCHING<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; bool &quot;surface_matching&quot;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; help<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Point Pair Features -- Imple=
ments 3d object detection and<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; localization using multimoda=
l point pair features.<br>
&gt; &#43;<br>
&gt; &#43;config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_TEXT<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; bool &quot;text&quot;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; help<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Scene Text Detection and Rec=
ognition -- This module contains<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; algorithms to perform text d=
etection, words segmentation and<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; text recognition in a visual=
 scene.<br>
&gt; &#43;<br>
&gt; &#43;config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_TRACKING<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; bool &quot;tracking&quot;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; help<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Vision Based Object Tracking=
 -- Use and/or evaluate different<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; visual object tracking techn=
iques.<br>
&gt; &#43;<br>
&gt; &#43;config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_VIDEOSTAB<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; bool &quot;videostab&quot;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; help<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Video Stabilization<br>
&gt; &#43;<br>
&gt; &#43;config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_VIZ<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; bool &quot;viz&quot;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; help<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3D Visualizer<br>
&gt; &#43;<br>
&gt; &#43;config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_WECHAT_QRCODE<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; bool &quot;wechat_qrcode&quot;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; help<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WeChat QR code detector for =
detecting and parsing QR code.<br>
&gt; &#43;<br>
&gt; &#43;config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_XFEATURES2D<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; bool &quot;xfeatures2d&quot;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; help<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Features2D extra -- Extra 2D=
 Features Framework containing<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; experimental and non-free 2D=
 feature detector/descriptor<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; algorithms. SURF, BRIEF, Cen=
sure, Freak, LUCID, Daisy,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Self-similar.<br>
&gt; &#43;<br>
&gt; &#43;config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_XIMGPROC<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; bool &quot;ximgproc&quot;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; help<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Extended Image Processing --=
 Structured Forests / Domain<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Transform Filter / Guided Fi=
lter / Adaptive Manifold Filter<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; / Joint Bilateral Filter / S=
uperpixels / Ridge Detection<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Filter.<br>
&gt; &#43;<br>
&gt; &#43;config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_XOBJDETECT<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; bool &quot;xobjdetect&quot;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; help<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Boosted 2D Object Detection =
-- Uses a Waldboost cascade and<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; local binary patterns comput=
ed as integral features for 2D<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; object detection.<br>
&gt; &#43;<br>
&gt; &#43;config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_XPHOTO<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; bool &quot;xphoto&quot;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; help<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Extra Computational Photogra=
phy -- Additional photo processing<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; algorithms: Color balance / =
Denoising / Inpainting.<br>
&gt; &#43;<br>
&gt; &#43;endif<br>
&gt; diff --git a/package/opencv4-contrib/opencv4-contrib.hash b/package/op=
encv4-contrib/opencv4-contrib.hash<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..4f15162e50<br>
&gt; --- /dev/null<br>
&gt; &#43;&#43;&#43; b/package/opencv4-contrib/opencv4-contrib.hash<br>
&gt; @@ -0,0 &#43;1,3 @@<br>
&gt; &#43;# Locally calculated<br>
&gt; &#43;sha256&nbsp; 1777d5fd2b59029cf537e5fd6f8aa68d707075822f90bde683fc=
de086f85f7a7&nbsp; opencv4-contrib-4.6.0.tar.gz<br>
&gt; &#43;sha256&nbsp; cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb00=
3417bc523d30&nbsp; LICENSE<br>
&gt; diff --git a/package/opencv4-contrib/opencv4-contrib.mk b/package/open=
cv4-contrib/opencv4-contrib.mk<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..58dbe27e28<br>
&gt; --- /dev/null<br>
&gt; &#43;&#43;&#43; b/package/opencv4-contrib/opencv4-contrib.mk<br>
&gt; @@ -0,0 &#43;1,13 @@<br>
&gt; &#43;#################################################################=
###############<br>
&gt; &#43;#<br>
&gt; &#43;# opencv4-contrib<br>
&gt; &#43;#<br>
&gt; &#43;#################################################################=
###############<br>
&gt; &#43;<br>
&gt; &#43;OPENCV4_CONTRIB_VERSION =3D 4.6.0<br>
&gt; &#43;OPENCV4_CONTRIB_SITE =3D $(call github,opencv,opencv_contrib,$(OP=
ENCV4_CONTRIB_VERSION))<br>
&gt; &#43;OPENCV4_CONTRIB_INSTALL_TARGET =3D FALSE<br>
&gt; &#43;OPENCV4_CONTRIB_LICENSE =3D Apache-2.0<br>
&gt; &#43;OPENCV4_CONTRIB_LICENSE_FILES =3D LICENSE<br>
&gt; &#43;<br>
&gt; &#43;$(eval $(generic-package))<br>
&gt; diff --git a/package/opencv4/opencv4.mk b/package/opencv4/opencv4.mk<b=
r>
&gt; index ef15c6d911..a665793ad9 100644<br>
&gt; --- a/package/opencv4/opencv4.mk<br>
&gt; &#43;&#43;&#43; b/package/opencv4/opencv4.mk<br>
&gt; @@ -82,11 &#43;82,6 @@ OPENCV4_CONF_OPTS &#43;=3D \<br>
&gt;&nbsp; #&nbsp;&nbsp; - viz: missing VTK dependency<br>
&gt;&nbsp; #&nbsp;&nbsp; - world: all-in-one module<br>
&gt;&nbsp; #<br>
&gt; -# * Contrib modules from [1] are disabled:<br>
&gt; -#&nbsp;&nbsp; - opencv_contrib package is not available in Buildroot;=
<br>
&gt; -#&nbsp;&nbsp; - OPENCV_EXTRA_MODULES_PATH is not set.<br>
&gt; -#<br>
&gt; -# [1] <a href=3D"https://github.com/Itseez/opencv_contrib">https://gi=
thub.com/Itseez/opencv_contrib</a><br>
&gt;&nbsp; OPENCV4_CONF_OPTS &#43;=3D \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -DBUILD_opencv_androidcamera=
=3DOFF \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -DBUILD_opencv_apps=3DOFF \<=
br>
&gt; @@ -232,6 &#43;227,63 @@ OPENCV4_CONF_OPTS &#43;=3D \<br>
&gt;&nbsp; <br>
&gt;&nbsp; OPENCV4_DEPENDENCIES &#43;=3D host-pkgconf zlib<br>
&gt;&nbsp; <br>
&gt; &#43;ifeq ($(BR2_PACKAGE_OPENCV4_CONTRIB),y)<br>
&gt; &#43;# OPENCV4 depends on OPENCV4_CONTRIB, and not the other way aroun=
d.<br>
&gt; &#43;# The modules in OPENCV4_CONTRIB get built as part of the build<b=
r>
&gt; &#43;# process for OPENCV4, so the source needs to be unpacked already=
<br>
&gt; &#43;OPENCV4_DEPENDENCIES &#43;=3D opencv4-contrib<br>
&gt; &#43;OPENCV4_CONF_OPTS &#43;=3D \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; -DOPENCV_EXTRA_MODULES_PATH=3D$(OPENCV4_=
CONTRIB_DIR)/modules \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; -DBUILD_opencv_alphamat=3D$(if $(BR2_PAC=
KAGE_OPENCV4_CONTRIB_LIB_ALPHAMAT),ON,OFF) \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; -DBUILD_opencv_aruco=3D$(if $(BR2_PACKAG=
E_OPENCV4_CONTRIB_LIB_ARUCO),ON,OFF) \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; -DBUILD_opencv_barcode=3D$(if $(BR2_PACK=
AGE_OPENCV4_CONTRIB_LIB_BARCODE),ON,OFF) \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; -DBUILD_opencv_bgsegm=3D$(if $(BR2_PACKA=
GE_OPENCV4_CONTRIB_LIB_BGSEGM),ON,OFF) \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; -DBUILD_opencv_bioinspired=3D$(if $(BR2_=
PACKAGE_OPENCV4_CONTRIB_LIB_BIOINSPIRED),ON,OFF) \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; -DBUILD_opencv_ccalib=3D$(if $(BR2_PACKA=
GE_OPENCV4_CONTRIB_LIB_CCALIB),ON,OFF) \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; -DBUILD_opencv_cnn_3dobj=3D$(if $(BR2_PA=
CKAGE_OPENCV4_CONTRIB_LIB_CNN_3DOBJ),ON,OFF) \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; -DBUILD_opencv_cvv=3D$(if $(BR2_PACKAGE_=
OPENCV4_CONTRIB_LIB_CVV),ON,OFF) \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; -DBUILD_opencv_datasets=3D$(if $(BR2_PAC=
KAGE_OPENCV4_CONTRIB_LIB_DATASETS),ON,OFF) \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; -DBUILD_opencv_dnn_objdetect=3D$(if $(BR=
2_PACKAGE_OPENCV4_CONTRIB_LIB_DNN_OBJDETECT),ON,OFF) \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; -DBUILD_opencv_dnn_superres=3D$(if $(BR2=
_PACKAGE_OPENCV4_CONTRIB_LIB_DNN_SUPERRES),ON,OFF) \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; -DBUILD_opencv_dnns_easily_fooled=3D$(if=
 $(BR2_PACKAGE_OPENCV4_CONTRIB_LIB_DNNS_EASILY_FOOLED),ON,OFF) \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; -DBUILD_opencv_dpm=3D$(if $(BR2_PACKAGE_=
OPENCV4_CONTRIB_LIB_DPM),ON,OFF) \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; -DBUILD_opencv_face=3D$(if $(BR2_PACKAGE=
_OPENCV4_CONTRIB_LIB_FACE),ON,OFF) \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; -DBUILD_opencv_freetype=3D$(if $(BR2_PAC=
KAGE_OPENCV4_CONTRIB_LIB_FREETYPE),ON,OFF) \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; -DBUILD_opencv_fuzzy=3D$(if $(BR2_PACKAG=
E_OPENCV4_CONTRIB_LIB_FUZZY),ON,OFF) \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; -DBUILD_opencv_hdf=3D$(if $(BR2_PACKAGE_=
OPENCV4_CONTRIB_LIB_HDF),ON,OFF) \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; -DBUILD_opencv_hfs=3D$(if $(BR2_PACKAGE_=
OPENCV4_CONTRIB_LIB_HFS),ON,OFF) \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; -DBUILD_opencv_img_hash=3D$(if $(BR2_PAC=
KAGE_OPENCV4_CONTRIB_LIB_IMG_HASH),ON,OFF) \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; -DBUILD_opencv_intensity_transform=3D$(i=
f $(BR2_PACKAGE_OPENCV4_CONTRIB_LIB_INTENSITY_TRANSFORM),ON,OFF) \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; -DBUILD_opencv_julia=3D$(if $(BR2_PACKAG=
E_OPENCV4_CONTRIB_LIB_JULIA),ON,OFF) \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; -DBUILD_opencv_line_descriptor=3D$(if $(=
BR2_PACKAGE_OPENCV4_CONTRIB_LIB_LINE_DESCRIPTOR),ON,OFF) \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; -DBUILD_opencv_matlab=3D$(if $(BR2_PACKA=
GE_OPENCV4_CONTRIB_LIB_MATLAB),ON,OFF) \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; -DBUILD_opencv_mcc=3D$(if $(BR2_PACKAGE_=
OPENCV4_CONTRIB_LIB_MCC),ON,OFF) \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; -DBUILD_opencv_optflow=3D$(if $(BR2_PACK=
AGE_OPENCV4_CONTRIB_LIB_OPTFLOW),ON,OFF) \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; -DBUILD_opencv_ovis=3D$(if $(BR2_PACKAGE=
_OPENCV4_CONTRIB_LIB_OVIS),ON,OFF) \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; -DBUILD_opencv_phase_unwrapping=3D$(if $=
(BR2_PACKAGE_OPENCV4_CONTRIB_LIB_PHASE_UNWRAPPING),ON,OFF) \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; -DBUILD_opencv_plot=3D$(if $(BR2_PACKAGE=
_OPENCV4_CONTRIB_LIB_PLOT),ON,OFF) \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; -DBUILD_opencv_quality=3D$(if $(BR2_PACK=
AGE_OPENCV4_CONTRIB_LIB_QUALITY),ON,OFF) \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; -DBUILD_opencv_rapid=3D$(if $(BR2_PACKAG=
E_OPENCV4_CONTRIB_LIB_RAPID),ON,OFF) \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; -DBUILD_opencv_reg=3D$(if $(BR2_PACKAGE_=
OPENCV4_CONTRIB_LIB_REG),ON,OFF) \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; -DBUILD_opencv_rgbd=3D$(if $(BR2_PACKAGE=
_OPENCV4_CONTRIB_LIB_RGBD),ON,OFF) \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; -DBUILD_opencv_saliency=3D$(if $(BR2_PAC=
KAGE_OPENCV4_CONTRIB_LIB_SALIENCY),ON,OFF) \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; -DBUILD_opencv_sfm=3D$(if $(BR2_PACKAGE_=
OPENCV4_CONTRIB_LIB_SFM),ON,OFF) \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; -DBUILD_opencv_shape=3D$(if $(BR2_PACKAG=
E_OPENCV4_CONTRIB_LIB_SHAPE),ON,OFF) \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; -DBUILD_opencv_stereo=3D$(if $(BR2_PACKA=
GE_OPENCV4_CONTRIB_LIB_STEREO),ON,OFF) \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; -DBUILD_opencv_structured_light=3D$(if $=
(BR2_PACKAGE_OPENCV4_CONTRIB_LIB_STRUCTURED_LIGHT),ON,OFF) \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; -DBUILD_opencv_superres=3D$(if $(BR2_PAC=
KAGE_OPENCV4_CONTRIB_LIB_SUPERRES),ON,OFF) \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; -DBUILD_opencv_surface_matching=3D$(if $=
(BR2_PACKAGE_OPENCV4_CONTRIB_LIB_SURFACE_MATCHING),ON,OFF) \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; -DBUILD_opencv_text=3D$(if $(BR2_PACKAGE=
_OPENCV4_CONTRIB_LIB_TEXT),ON,OFF) \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; -DBUILD_opencv_tracking=3D$(if $(BR2_PAC=
KAGE_OPENCV4_CONTRIB_LIB_TRACKING),ON,OFF) \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; -DBUILD_opencv_videostab=3D$(if $(BR2_PA=
CKAGE_OPENCV4_CONTRIB_LIB_VIDEOSTAB),ON,OFF) \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; -DBUILD_opencv_viz=3D$(if $(BR2_PACKAGE_=
OPENCV4_CONTRIB_LIB_VIZ),ON,OFF) \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; -DBUILD_opencv_wechat_qrcode=3D$(if $(BR=
2_PACKAGE_OPENCV4_CONTRIB_LIB_WECHAT_QRCODE),ON,OFF) \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; -DBUILD_opencv_xfeatures2d=3D$(if $(BR2_=
PACKAGE_OPENCV4_CONTRIB_LIB_XFEATURES2D),ON,OFF) \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; -DBUILD_opencv_ximgproc=3D$(if $(BR2_PAC=
KAGE_OPENCV4_CONTRIB_LIB_XIMGPROC),ON,OFF) \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; -DBUILD_opencv_xobjdetect=3D$(if $(BR2_P=
ACKAGE_OPENCV4_CONTRIB_LIB_XOBJDETECT),ON,OFF) \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; -DBUILD_opencv_xphoto=3D$(if $(BR2_PACKA=
GE_OPENCV4_CONTRIB_LIB_XPHOTO),ON,OFF)<br>
&gt; &#43;endif<br>
&gt; &#43;<br>
&gt;&nbsp; ifeq ($(BR2_PACKAGE_OPENCV4_JPEG2000_WITH_JASPER),y)<br>
&gt;&nbsp; OPENCV4_CONF_OPTS &#43;=3D -DWITH_JASPER=3DON<br>
&gt;&nbsp; OPENCV4_DEPENDENCIES &#43;=3D jasper<br>
&gt; -- <br>
&gt; 2.20.1<br>
&gt; <br>
&gt; _______________________________________________<br>
&gt; buildroot mailing list<br>
&gt; buildroot@buildroot.org<br>
&gt; <a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot">htt=
ps://lists.buildroot.org/mailman/listinfo/buildroot</a><br>
<br>
-- <br>
.-----------------.--------------------.------------------.----------------=
----.<br>
|&nbsp; Yann E. MORIN&nbsp; | Real-Time Embedded | /&quot;\ ASCII RIBBON | =
Erics' conspiracy: |<br>
| &#43;33 662 376 056 | Software&nbsp; Designer | \ / CAMPAIGN&nbsp;&nbsp;&=
nbsp;&nbsp; |&nbsp; ___&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<br>
| &#43;33 561 099 427 `------------.-------:&nbsp; X&nbsp; AGAINST&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; |&nbsp; \e/&nbsp; There is no&nbsp; |<br>
| <a href=3D"http://ymorin.is-a-geek.org/">http://ymorin.is-a-geek.org/</a>=
 | _/*\_ | / \ HTML MAIL&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; v&nbsp;&nbsp; cons=
piracy.&nbsp; |<br>
'------------------------------^-------^------------------^----------------=
----'<br>
</div>
</span></font>
</body>
</html>

--_000_f820be819c6a474bbde0c9c2f89b09a0carnegieroboticscom_--

--===============7987301578165071140==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7987301578165071140==--
