Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC23EC2A076
	for <buildroot@archiver.kernel.org>; Sun,  4 Jan 2026 13:06:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9007406CA;
	Sun,  4 Jan 2026 13:06:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DBCJFLtYAZ69; Sun,  4 Jan 2026 13:06:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD9A5406B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767532006;
	bh=xz8IZP3RD/5x+lTWRkdJI3v98ZDfQNmz4J5386Y9y2Q=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=iDgl1re6C5M7tGM5QmZcyDzOrMeP5eh8XhQV7fgSPG1s0sNMv4J1oM+QRs+eFunE9
	 pB2F09Y4oePLF0Zf04D7o6YB9s1l0NUGC0MS/zQpSIK/rMHPvvApOH03NlgVGh8PtM
	 1D2FsQ3Vf+v94VuU4olRB2uOqAMOe1R7E+ffq0ldxGjd1pbvkcGdJsl6BWj+CUUEwv
	 R7CDJ73o0ukc7ubhbnTzDmivCO5epAarqSiKPdU0AdkArYw/B+/d3hicZ0HcTND8Lj
	 4fIa9yPXzh5II7tKyDFNw4DAoiMocwW6MQ7xPGY2pcyJWmT8ZN63MUgWY+pBtpkn0w
	 2S62iHRsgnXQA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD9A5406B0;
	Sun,  4 Jan 2026 13:06:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0CC8A249
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 13:06:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5EFC0405AA
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 13:06:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tLG9Qtzaa9V8 for <buildroot@buildroot.org>;
 Sun,  4 Jan 2026 13:06:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 758E340391
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 758E340391
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 13:06:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5FF7288245; Sun,  4 Jan 2026 13:06:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 4 Jan 2026 14:00:16 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 73e9b996fb22205f966bacee4b556afb8afeeb79
X-Git-Newrev: f0977e4b818aed8ea2bc3e94c031e98bcd1991a9
X-Patchwork-Hint: ignore
Message-Id: <20260104130636.5FF7288245@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freeswitch: fixup dependency on
 OpenCV4
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f0977e4b818aed8ea2bc3e94c031e98bcd1991a9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The recent changes in freeswitch following the removal of OpenCV 3.x
in commit
a6db6af9ffa7134b1f132dfd07dd53e7138e86b6 ("package/freeswitch: remove
optional dependency to opencv3") caused some invalid dependencies.

Indeed, the new logic selects BR2_PACKAGE_OPENCV4_LIB_OBJDETECT as
soon as BR2_PACKAGE_OPENCV4 is enabled, without worrying about the
dependencies of BR2_PACKAGE_OPENCV4_LIB_OBJDETECT.

This causes the following Kconfig warning:

WARNING: unmet direct dependencies detected for BR2_PACKAGE_OPENCV4_LIB_OBJDETECT
  Depends on [n]: BR2_PACKAGE_OPENCV4 [=y] && !BR2_TOOLCHAIN_USES_UCLIBC [=n] && BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS [=y] && BR2_TOOLCHAIN_GCC_AT_LEAST_8 [=n]
  Selected by [y]:
  - BR2_PACKAGE_FREESWITCH [=y] && BR2_INSTALL_LIBSTDCPP [=y] && !BR2_STATIC_LIBS [=n] && BR2_TOOLCHAIN_HAS_THREADS [=y] && BR2_USE_MMU [=y] && BR2_USE_WCHAR [=y] && BR2_PACKAGE_OPENCV4 [=y]

Since freeswitch as no visible sub-options to select extra features
and we wanted to keep it this way, we introduce a hidden sub-option
that informs freeswitch.mk whether OpenCV 4 support is usable. It
makes it easier to express the dependencies that are needed for this
OpenCV 4 to be usable.

Fixes: a6db6af9ffa7134b1f132dfd07dd53e7138e86b6 ("package/freeswitch: remove optional dependency to opencv3")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/freeswitch/Config.in     | 18 +++++++++++++-----
 package/freeswitch/freeswitch.mk |  2 +-
 2 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/package/freeswitch/Config.in b/package/freeswitch/Config.in
index f636024f32..3633a29903 100644
--- a/package/freeswitch/Config.in
+++ b/package/freeswitch/Config.in
@@ -9,11 +9,6 @@ config BR2_PACKAGE_FREESWITCH
 	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_JPEG
-	# src/mod/applications/mod_cv/mod_cv.cpp includes
-	# highgui.h, imgproc.hpp & objdetect.hpp
-	select BR2_PACKAGE_OPENCV4_LIB_HIGHGUI if BR2_PACKAGE_OPENCV4
-	select BR2_PACKAGE_OPENCV4_LIB_IMGPROC if BR2_PACKAGE_OPENCV4
-	select BR2_PACKAGE_OPENCV4_LIB_OBJDETECT if BR2_PACKAGE_OPENCV4
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_PCRE
 	select BR2_PACKAGE_SOFIA_SIP
@@ -33,6 +28,19 @@ config BR2_PACKAGE_FREESWITCH
 
 	  https://www.freeswitch.org
 
+config BR2_PACKAGE_FREESWITCH_OPENCV4
+	bool
+	default y
+	depends on BR2_PACKAGE_OPENCV4
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC # objdetect
+	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # objdetect
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # objdetect
+	# src/mod/applications/mod_cv/mod_cv.cpp includes
+	# highgui.h, imgproc.hpp & objdetect.hpp
+	select BR2_PACKAGE_OPENCV4_LIB_HIGHGUI
+	select BR2_PACKAGE_OPENCV4_LIB_IMGPROC
+	select BR2_PACKAGE_OPENCV4_LIB_OBJDETECT
+
 comment "freeswitch needs a toolchain w/ C++, dynamic library, threads, wchar"
 	depends on BR2_USE_MMU
 	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS \
diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index 81a25b3fe2..7e5dc3d872 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -278,7 +278,7 @@ FREESWITCH_DEPENDENCIES += libsoundtouch
 FREESWITCH_ENABLED_MODULES += applications/mod_soundtouch
 endif
 
-ifeq ($(BR2_PACKAGE_OPENCV4),y)
+ifeq ($(BR2_PACKAGE_FREESWITCH_OPENCV4),y)
 FREESWITCH_DEPENDENCIES += opencv4
 FREESWITCH_ENABLED_MODULES += applications/mod_cv
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
