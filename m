Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C8D7EE499A
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 18:12:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2270F4084B;
	Tue, 30 Dec 2025 18:12:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YWbCfMGeZ-cZ; Tue, 30 Dec 2025 18:12:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 522C1403F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767118373;
	bh=H+mXniZYm+QTQ25K7fSlCWMadCD7pxfAHcC32/51clU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=oAniLQ0suyvPBISQ478Z0Y3V8TG1TfbsgYSMpj6xbziAeFXVY3QCs9/cMcsrCKlAh
	 41MQHwcEOlo9+4QE8QRmOFxrwpVCodeaPR6k+FvmKiu0ac1C3KQKXeafJKQmFg8gtT
	 VomhE2f83YBo3DK3hl+lxJ4BU97YoTfVGqNlZANT7kOEM6RFVuLn5VBA/m2vahP4Fn
	 0K7+vGp9N8wKorULdvBsAP9v0gUIH4iaxBS4aaW0QcKxYwtUM1j3FNKc1arbIgLsq8
	 swZz5KoIsF3FLbQYcjD0dT4r3agUuPE18TyPhrIuQRQJcHNSus+Kpyrl+nkVROzSgR
	 kg0HbduePLfNA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 522C1403F4;
	Tue, 30 Dec 2025 18:12:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7F725177
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 18:12:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7C3F8403F3
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 18:12:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dj-trLc3br9x for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 18:12:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4428B403F5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4428B403F5
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 18:12:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 433EC87C40; Tue, 30 Dec 2025 18:12:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Dec 2025 19:12:14 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 51718796be81d337fe8474e6899d9c6ac39d1014
X-Git-Newrev: a6db6af9ffa7134b1f132dfd07dd53e7138e86b6
X-Patchwork-Hint: ignore
Message-Id: <20251230181235.433EC87C40@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freeswitch: remove optional
 dependency to opencv3
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

commit: https://git.buildroot.net/buildroot/commit/?id=a6db6af9ffa7134b1f132dfd07dd53e7138e86b6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

OpenCV3 is unmaintained and will be removed from buildroot.

Select needed OpenCV4 modules in Config.in and adjust freeswitch.mk.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/freeswitch/Config.in     | 6 +++---
 package/freeswitch/freeswitch.mk | 7 +------
 2 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/package/freeswitch/Config.in b/package/freeswitch/Config.in
index 80d18e064d..f636024f32 100644
--- a/package/freeswitch/Config.in
+++ b/package/freeswitch/Config.in
@@ -11,9 +11,9 @@ config BR2_PACKAGE_FREESWITCH
 	select BR2_PACKAGE_JPEG
 	# src/mod/applications/mod_cv/mod_cv.cpp includes
 	# highgui.h, imgproc.hpp & objdetect.hpp
-	select BR2_PACKAGE_OPENCV3_LIB_HIGHGUI if BR2_PACKAGE_OPENCV3
-	select BR2_PACKAGE_OPENCV3_LIB_IMGPROC if BR2_PACKAGE_OPENCV3
-	select BR2_PACKAGE_OPENCV3_LIB_OBJDETECT if BR2_PACKAGE_OPENCV3
+	select BR2_PACKAGE_OPENCV4_LIB_HIGHGUI if BR2_PACKAGE_OPENCV4
+	select BR2_PACKAGE_OPENCV4_LIB_IMGPROC if BR2_PACKAGE_OPENCV4
+	select BR2_PACKAGE_OPENCV4_LIB_OBJDETECT if BR2_PACKAGE_OPENCV4
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_PCRE
 	select BR2_PACKAGE_SOFIA_SIP
diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index 58ebc22298..81a25b3fe2 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -278,12 +278,7 @@ FREESWITCH_DEPENDENCIES += libsoundtouch
 FREESWITCH_ENABLED_MODULES += applications/mod_soundtouch
 endif
 
-ifeq ($(BR2_PACKAGE_OPENCV3),y)
-FREESWITCH_DEPENDENCIES += opencv3
-FREESWITCH_ENABLED_MODULES += applications/mod_cv
-endif
-
-ifeq ($(BR2_PACKAGE_OPENCV4_LIB_HIGHGUI)$(BR2_PACKAGE_OPENCV4_LIB_IMGPROC)$(BR2_PACKAGE_OPENCV4_LIB_OBJDETECT),yyy)
+ifeq ($(BR2_PACKAGE_OPENCV4),y)
 FREESWITCH_DEPENDENCIES += opencv4
 FREESWITCH_ENABLED_MODULES += applications/mod_cv
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
