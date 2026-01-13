Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A315D30CC2
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 20:59:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F272360F44;
	Tue, 13 Jan 2026 20:59:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vROkzSdyYUyd; Tue, 13 Jan 2026 20:59:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A5A5960EE3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768337980;
	bh=Lp1UI0cB5tfTMCexTIJBMoVYoTYhTrOTy10hVQyKJPw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=bSaR1F2V8DPvLA2Lt5Yx8IbfWcNwKjd5AkhYEicceK+H7xMewpHIMDU7YRTtllBUx
	 pSGmvoQkdJD1oC3LcG2ntNkpwZ00i+8KDujCWkwmUvEFZvK/SKDnTgQuDajGmPdPHY
	 tQr4D9dYLWww0AxCsnLRjGC6TBGe6gvLNk8s6ukYa4zM5w5kdHYHjTjJT7zRpKApPo
	 8EiUgTwhFgdepjsnnrEHjiKUu4nLPXZT29n0XPXriFE2y0Qm6TxGBdX4SDl+Q1moih
	 3iK8wy4NXUNm6mCesfsZXa4m60YkJVBdxzGKFGRw4jKFujcBEjVfpNbcZKph5P/Pr8
	 s1wuu2JAKWRtA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5A5960EE3;
	Tue, 13 Jan 2026 20:59:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id DA12C231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:59:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DEF8340788
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EWyrlFUtj9I3 for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 20:58:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 10AFA4077E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 10AFA4077E
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0F6CD81382; Tue, 13 Jan 2026 20:58:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Jan 2026 21:37:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8f055850735dccf3264809277a47e809f8c97e8a
X-Git-Newrev: 75f47fe60df702d4f6cf406b2aa8d7df31ea49c0
X-Patchwork-Hint: ignore
Message-Id: <20260113205848.0F6CD81382@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xdriver_xf86-video-r128:
 bump version to 6.13.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=75f47fe60df702d4f6cf406b2aa8d7df31ea49c0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2024-October/003540.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.hash | 6 +++---
 package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.hash b/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.hash
index cf9b21ebe8..135bbccae0 100644
--- a/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.hash
+++ b/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-December/003275.html
-sha256  7d023c2b171f1664e43d12a1d21674079d8065536f82bb95b448bfce4981c741  xf86-video-r128-6.12.1.tar.xz
-sha512  18b2408fe68161c32f84c7147717f8e6c6377e81e9d59e2f098843c54cd0ae757aab5059568da8c71ef38100807d56ee22447417c236c1b3deea292bb676e700  xf86-video-r128-6.12.1.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-October/003540.html
+sha256  f20bed5ac201edd517fe0878dd2bcef78c8805c9f7faa3d0d7a4dba2e973f745  xf86-video-r128-6.13.0.tar.xz
+sha512  6eae2a4f3a563d00c357025ffd3206c2b20cd35327af21add052a28447da9c0f642569bfb423cacb8989995bc92fc73cddd96d673e64438d1d7569eb926fb2ae  xf86-video-r128-6.13.0.tar.xz
 # Locally computed
 sha256  69f7c71859dc8f51aabdbe7a9ee915a480933eb81658f8af2bf4c918e65afe8b  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.mk b/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.mk
index 49514e3d3a..0ae5cd169f 100644
--- a/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.mk
+++ b/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_R128_VERSION = 6.12.1
+XDRIVER_XF86_VIDEO_R128_VERSION = 6.13.0
 XDRIVER_XF86_VIDEO_R128_SOURCE = xf86-video-r128-$(XDRIVER_XF86_VIDEO_R128_VERSION).tar.xz
 XDRIVER_XF86_VIDEO_R128_SITE = https://xorg.freedesktop.org/archive/individual/driver
 XDRIVER_XF86_VIDEO_R128_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
