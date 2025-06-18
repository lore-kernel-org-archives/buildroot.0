Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DA8BC7115D
	for <buildroot@archiver.kernel.org>; Thu, 19 Jun 2025 13:48:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 581D26084F;
	Thu, 19 Jun 2025 13:48:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vbM4Tf3ZPKjd; Thu, 19 Jun 2025 13:48:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 61FBE60A78
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 61FBE60A78;
	Thu, 19 Jun 2025 13:48:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 116AB7B1
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 13:48:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 03E96608A6
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 13:48:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zfgURBUB6d_e for <buildroot@buildroot.org>;
 Thu, 19 Jun 2025 13:48:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF4E5605F0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EF4E5605F0
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 13:48:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DF8B483F7F; Thu, 19 Jun 2025 13:48:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 18 Jun 2025 11:08:42 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 8d7db3a217c754b8e3df91c1ffcb9a02856936f9
X-Git-Newrev: 47ec015ea12c34552b50694c671b226920aa5832
X-Patchwork-Hint: ignore
Message-Id: <20250619134845.DF8B483F7F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libebur128:
 remove package
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=47ec015ea12c34552b50694c671b226920aa5832
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

libebur128 was added to buildroot in July 2016 with commit
a32d29cd84789d7406022c7bb9861e5bda530013 to provide an external
dependency for ffmpeg.

ffmpeg removed this external dependency and switched to an internal
version in November 2016 with upstream commit
http://git.videolan.org/?p=ffmpeg.git;a=commitdiff;h=005d058f4230f3207ebcf1131df7426d4f57392f
which was first included in ffmpeg version 3.3.

Buildroot bumped ffmpeg to version 3.3 in April 2017 with commit
21d93a1351ca8d4e5185c22a81becdaf08a9bdd3 and forgot to remove the
dependency to libebur128.

This went unnoticed until libebur128 fails to build with cmake 4.x.
Upstream saw its last commit four years ago. Instead of fixing an
unused package we removed it from buildroot.

Fixes:
https://autobuild.buildroot.org/results/e629bd151cc539f01b909e44d07e17451a29ba27/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 6586a2b165f3f9bb29ebfa828e23848f85028ab4)
[thomas: backport Config.in.legacy to LTS branch]
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 Config.in.legacy                   |  8 ++++++++
 DEVELOPERS                         |  1 -
 package/Config.in                  |  1 -
 package/ffmpeg/ffmpeg.mk           |  4 ----
 package/libebur128/Config.in       | 13 -------------
 package/libebur128/libebur128.hash |  3 ---
 package/libebur128/libebur128.mk   | 13 -------------
 7 files changed, 8 insertions(+), 35 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 44ee749329..b1d03b3494 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -144,6 +144,14 @@ endif
 
 ###############################################################################
 
+comment "Legacy options removed in 2025.02.4"
+
+config BR2_PACKAGE_LIBEBUR128
+	bool "libebur128 has been removed"
+	select BR2_LEGACY
+	help
+	  The libebur128 package has been removed from Buildroot.
+
 comment "Legacy options removed in 2025.02"
 
 config BR2_PACKAGE_SQLITE_ENABLE_JSON1
diff --git a/DEVELOPERS b/DEVELOPERS
index 2bd3b9448d..155cd39ccc 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -411,7 +411,6 @@ F:	package/libdvbcsa/
 F:	package/libdvdcss/
 F:	package/libdvdnav/
 F:	package/libdvdread/
-F:	package/libebur128/
 F:	package/libfreeglut/
 F:	package/libfribidi/
 F:	package/libg7221/
diff --git a/package/Config.in b/package/Config.in
index 4a81a62ec4..fdd03d879c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1533,7 +1533,6 @@ menu "Audio/Sound"
 	source "package/libcodec2/Config.in"
 	source "package/libcue/Config.in"
 	source "package/libcuefile/Config.in"
-	source "package/libebur128/Config.in"
 	source "package/libg7221/Config.in"
 	source "package/libgsm/Config.in"
 	source "package/libid3tag/Config.in"
diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 5c00ba2dff..30cf7020de 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -243,10 +243,6 @@ FFMPEG_CONF_OPTS += --disable-openssl
 endif
 endif
 
-ifeq ($(BR2_PACKAGE_FFMPEG_GPL)$(BR2_PACKAGE_LIBEBUR128),yy)
-FFMPEG_DEPENDENCIES += libebur128
-endif
-
 ifeq ($(BR2_PACKAGE_LIBDRM),y)
 FFMPEG_CONF_OPTS += --enable-libdrm
 FFMPEG_DEPENDENCIES += libdrm
diff --git a/package/libebur128/Config.in b/package/libebur128/Config.in
deleted file mode 100644
index 0d68b39d53..0000000000
--- a/package/libebur128/Config.in
+++ /dev/null
@@ -1,13 +0,0 @@
-config BR2_PACKAGE_LIBEBUR128
-	bool "libebur128"
-	# build system has no support to disable shared linking
-	# leading to a build error with a static-only toolchain
-	depends on !BR2_STATIC_LIBS
-	help
-	  libebur128 is a library that implements the EBU R 128 standard
-	  for loudness normalization.
-
-	  https://github.com/jiixyj/libebur128
-
-comment "libebur128 needs a toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS
diff --git a/package/libebur128/libebur128.hash b/package/libebur128/libebur128.hash
deleted file mode 100644
index 9c8c9e0c31..0000000000
--- a/package/libebur128/libebur128.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed
-sha256  baa7fc293a3d4651e244d8022ad03ab797ca3c2ad8442c43199afe8059faa613  libebur128-1.2.6.tar.gz
-sha256  d6b4754bb67bdd08b97d5d11b2d7434997a371585a78fe77007149df3af8d09c  COPYING
diff --git a/package/libebur128/libebur128.mk b/package/libebur128/libebur128.mk
deleted file mode 100644
index b7272fa7e1..0000000000
--- a/package/libebur128/libebur128.mk
+++ /dev/null
@@ -1,13 +0,0 @@
-################################################################################
-#
-# libebur128
-#
-################################################################################
-
-LIBEBUR128_VERSION = 1.2.6
-LIBEBUR128_SITE = $(call github,jiixyj,libebur128,v$(LIBEBUR128_VERSION))
-LIBEBUR128_LICENSE = MIT
-LIBEBUR128_LICENSE_FILES = COPYING
-LIBEBUR128_INSTALL_STAGING = YES
-
-$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
