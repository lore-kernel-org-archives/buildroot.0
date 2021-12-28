Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBE53C433F5
	for <buildroot@archiver.kernel.org>; Tue, 28 Dec 2021 21:02:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 841A4400BA;
	Tue, 28 Dec 2021 21:02:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L0fYDpV6K9KU; Tue, 28 Dec 2021 21:02:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7A7974023F;
	Tue, 28 Dec 2021 21:02:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CF6491BF9AC
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 21:02:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BF3138134B
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 21:02:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cdZ5_HlhxTol for <buildroot@lists.busybox.net>;
 Tue, 28 Dec 2021 21:02:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D6A6581339
 for <buildroot@buildroot.org>; Tue, 28 Dec 2021 21:02:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id BE7E582BDC; Tue, 28 Dec 2021 20:56:26 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 28 Dec 2021 21:47:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 33de45c0672d44ae544cfb5f56dc60ec809322d3
X-Git-Newrev: b6922313937712a89841b58d3b355edd53754bca
X-Patchwork-Hint: ignore
Message-Id: <20211228205626.BE7E582BDC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/opencv4: bump to version 4.5.5
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b6922313937712a89841b58d3b355edd53754bca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch (already in version)

https://github.com/opencv/opencv/wiki/ChangeLog#version455

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...eoio-src-cap_ffmpeg_impl.hpp-fix-build-wi.patch | 52 ----------------------
 package/opencv4/opencv4.hash                       |  2 +-
 package/opencv4/opencv4.mk                         |  2 +-
 3 files changed, 2 insertions(+), 54 deletions(-)

diff --git a/package/opencv4/0001-modules-videoio-src-cap_ffmpeg_impl.hpp-fix-build-wi.patch b/package/opencv4/0001-modules-videoio-src-cap_ffmpeg_impl.hpp-fix-build-wi.patch
deleted file mode 100644
index 6d5d6d0647..0000000000
--- a/package/opencv4/0001-modules-videoio-src-cap_ffmpeg_impl.hpp-fix-build-wi.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 4c92a2869b9a8f736a12ba859b74e5cadce62387 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 12 Nov 2021 09:50:17 +0100
-Subject: [PATCH] modules/videoio/src/cap_ffmpeg_impl.hpp: fix build with gcc
- 4.8
-
-Fix the following build failure with gcc 4.8:
-
-In file included from /home/buildroot/autobuild/instance-3/output-1/build/opencv4-4.5.4/modules/videoio/src/cap_ffmpeg_impl.hpp:100:0,
-                 from /home/buildroot/autobuild/instance-3/output-1/build/opencv4-4.5.4/modules/videoio/src/cap_ffmpeg.cpp:50:
-/home/buildroot/autobuild/instance-3/output-1/build/opencv4-4.5.4/modules/videoio/src/cap_ffmpeg_hw.hpp: In constructor 'HWAccelIterator::HWAccelIterator(cv::VideoAccelerationType, bool, AVDictionary*)':
-/home/buildroot/autobuild/instance-3/output-1/build/opencv4-4.5.4/modules/videoio/src/cap_ffmpeg_hw.hpp:939:23: error: use of deleted function 'std::basic_istringstream<char>& std::basic_istringstream<char>::operator=(const std::basic_istringstream<char>&)'
-             s_stream_ = std::istringstream(accel_list);
-                       ^
-In file included from /home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/arm-none-linux-gnueabi/include/c++/4.8.3/complex:45:0,
-                 from /home/buildroot/autobuild/instance-3/output-1/build/opencv4-4.5.4/modules/core/include/opencv2/core/cvstd.inl.hpp:47,
-                 from /home/buildroot/autobuild/instance-3/output-1/build/opencv4-4.5.4/modules/core/include/opencv2/core.hpp:3306,
-                 from /home/buildroot/autobuild/instance-3/output-1/build/opencv4-4.5.4/modules/videoio/include/opencv2/videoio.hpp:46,
-                 from /home/buildroot/autobuild/instance-3/output-1/build/opencv4-4.5.4/modules/videoio/src/precomp.hpp:57,
-                 from /home/buildroot/autobuild/instance-3/output-1/build/opencv4-4.5.4/modules/videoio/src/cap_ffmpeg.cpp:42:
-/home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/arm-none-linux-gnueabi/include/c++/4.8.3/sstream:272:11: note: 'std::basic_istringstream<char>& std::basic_istringstream<char>::operator=(const std::basic_istringstream<char>&)' is implicitly deleted because the default definition would be ill-formed:
-     class basic_istringstream : public basic_istream<_CharT, _Traits>
-           ^
-/home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/arm-none-linux-gnueabi/include/c++/4.8.3/sstream:272:11: error: use of deleted function 'std::basic_istream<char>& std::basic_istream<char>::operator=(const std::basic_istream<char>&)'
-
-Fixes:
- - http://autobuild.buildroot.org/results/60f8846b435dafda0ced412d59ffe15bdff0810d
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/opencv/opencv/commit/4c92a2869b9a8f736a12ba859b74e5cadce62387]
----
- modules/videoio/src/cap_ffmpeg_impl.hpp | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/modules/videoio/src/cap_ffmpeg_impl.hpp b/modules/videoio/src/cap_ffmpeg_impl.hpp
-index d393b73ff4a2..76e1b855b7c8 100644
---- a/modules/videoio/src/cap_ffmpeg_impl.hpp
-+++ b/modules/videoio/src/cap_ffmpeg_impl.hpp
-@@ -93,6 +93,12 @@ extern "C" {
- }
- #endif
- 
-+// GCC 4.x compilation bug. Details: https://github.com/opencv/opencv/issues/20292
-+#if (defined(__GNUC__) && __GNUC__ < 5) && !defined(__clang__)
-+#undef USE_AV_HW_CODECS
-+#define USE_AV_HW_CODECS 0
-+#endif
-+
- //#define USE_AV_HW_CODECS 0
- #ifndef USE_AV_HW_CODECS
- #if LIBAVUTIL_VERSION_MAJOR >= 56 // FFMPEG 4.0+
diff --git a/package/opencv4/opencv4.hash b/package/opencv4/opencv4.hash
index 791ebe3d35..6d43138be8 100644
--- a/package/opencv4/opencv4.hash
+++ b/package/opencv4/opencv4.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c20bb83dd790fc69df9f105477e24267706715a9d3c705ca1e7f613c7b3bad3d  opencv4-4.5.4.tar.gz
+sha256  a1cfdcf6619387ca9e232687504da996aaa9f7b5689986b8331ec02cb61d28ad  opencv4-4.5.5.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/opencv4/opencv4.mk b/package/opencv4/opencv4.mk
index 1859b866dd..e75f7144de 100644
--- a/package/opencv4/opencv4.mk
+++ b/package/opencv4/opencv4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENCV4_VERSION = 4.5.4
+OPENCV4_VERSION = 4.5.5
 OPENCV4_SITE = $(call github,opencv,opencv,$(OPENCV4_VERSION))
 OPENCV4_INSTALL_STAGING = YES
 OPENCV4_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
