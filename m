Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3361FEE4992
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 18:12:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05BAA60BD9;
	Tue, 30 Dec 2025 18:12:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lLpUSeoGEnPe; Tue, 30 Dec 2025 18:12:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1FAD760BC1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767118367;
	bh=6wCeH51aEvKYGxSvqE/S3xyhrHBu85crn4PGJh9siD0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Koz4mCCJADxvYwKMiZct9Y8kK8ibmuP+kYM4ue3D/sGsBK7X29OUxTv+qIUQBTsXU
	 C/6w8iKadqD+sq+m3e0dNiufArFt94JQk4OYav4c3eVcWVrWctiNrUYJxlYfrGefX6
	 hq6gbEhfL/dYzdLX8DKnR/bMWejaVhyYOSnckSXuWOVlxKCGqjZ61cgHhgeQuBeG0/
	 i9GaPd9JkAzMQ8fck6DptLaAWOOHIbw+9jKDKJuO26wPNOpNdkHcHi6Fwh6urtrcwc
	 O+CiRYl4coeoP4HGLhDgJfpa9C1+5rJt+fpEzBavDs693pIgYGyXJI7WXd1DtVH0Cx
	 2UkGfMAci170g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1FAD760BC1;
	Tue, 30 Dec 2025 18:12:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 01F33177
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 18:12:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AF5E2403F3
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 18:12:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LWhWXhfz1r6a for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 18:12:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 60F90403FC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 60F90403FC
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 18:12:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6024587C40; Tue, 30 Dec 2025 18:12:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Dec 2025 19:12:17 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6ab3c9ea1885329c8f3fa53731bb0d1db15a3a9a
X-Git-Newrev: 28309d0a58ea2c898ee37fa3982c81c3fc380121
X-Patchwork-Hint: ignore
Message-Id: <20251230181235.6024587C40@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/vlc: remove optional dependency to
 opencv3
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=28309d0a58ea2c898ee37fa3982c81c3fc380121
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

OpenCV3 is unmaintained and will be removed from buildroot.

The package does not support OpenCV4:
https://code.videolan.org/videolan/vlc/-/merge_requests/927

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy      | 7 +++++++
 package/vlc/Config.in | 6 ------
 package/vlc/vlc.mk    | 8 +-------
 3 files changed, 8 insertions(+), 13 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 16807fa196..1d8ed9698d 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2026.02"
 
+config BR2_PACKAGE_VLC_OPENCV3_BACKEND
+	bool "opencv3 support in vlc has been removed"
+	select BR2_LEGACY
+	help
+	  OpenCV3 support in VLC has been reported, as OpenCV has been
+	  removed.
+
 config BR2_PACKAGE_CPPDB
 	bool "cppdb has been removed"
 	select BR2_LEGACY
diff --git a/package/vlc/Config.in b/package/vlc/Config.in
index 964b7660af..d2c1934f37 100644
--- a/package/vlc/Config.in
+++ b/package/vlc/Config.in
@@ -9,7 +9,6 @@ config BR2_PACKAGE_VLC
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
 	select BR2_PACKAGE_LIBVORBIS if BR2_PACKAGE_OPUS
-	select BR2_PACKAGE_VLC_OPENCV3_BACKEND if BR2_PACKAGE_OPENCV3
 	select BR2_PACKAGE_ZLIB if BR2_PACKAGE_TAGLIB
 	help
 	  VLC is a free and open source cross-platform multimedia player
@@ -18,11 +17,6 @@ config BR2_PACKAGE_VLC
 
 	  http://www.videolan.org/vlc/
 
-config BR2_PACKAGE_VLC_OPENCV3_BACKEND
-	bool
-	select BR2_PACKAGE_OPENCV3_LIB_IMGPROC
-	select BR2_PACKAGE_OPENCV3_LIB_OBJDETECT
-
 comment "vlc needs a toolchain w/ C++, dynamic library, wchar, threads, gcc >= 4.9, headers >= 3.7"
 	depends on !BR2_RISCV_32
 	depends on BR2_USE_MMU
diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 2a83b66c92..9091a7e7fa 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -72,6 +72,7 @@ VLC_CONF_OPTS += \
 	--disable-mtp \
 	--disable-mpc \
 	--disable-notify \
+	--disable-opencv \
 	--disable-projectm \
 	--disable-schroedinger \
 	--disable-shine \
@@ -211,13 +212,6 @@ else
 VLC_CONF_OPTS += --disable-gles2
 endif
 
-ifeq ($(BR2_PACKAGE_OPENCV3),y)
-VLC_CONF_OPTS += --enable-opencv
-VLC_DEPENDENCIES += opencv3
-else
-VLC_CONF_OPTS += --disable-opencv
-endif
-
 ifeq ($(BR2_PACKAGE_OPUS),y)
 VLC_CONF_OPTS += --enable-opus
 VLC_DEPENDENCIES += libvorbis opus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
