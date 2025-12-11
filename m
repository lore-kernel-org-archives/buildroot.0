Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72384D41D7E
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 19:30:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 345B74111D;
	Thu, 11 Dec 2025 19:30:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SsGQ1gObXhOL; Thu, 11 Dec 2025 19:30:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 539C24110B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765481403;
	bh=BYJ98mLrS84+iIxr7GfjcSprq4QrntTLpulSKyRewmY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=od1yynFu1c3xkz5knjP2YJebDZIkQ9ivX071f8ZfXz/jWnSSZLLcrgSqc9x/xCY1w
	 3uL8jviL7CAGIevsfZYJ9OS0NiKbsrwbwQrGwO1tpnYN2WviFxDNG4WgyYAAzZg+Ke
	 wbt3i0f+t3JTxcucrdo7VHwbagMP2wVqaj5KmjESfUl6gQnu1eeFAIl+gXskma8A3s
	 CuS4uzqde5U9vS6kNmM3Hphh2Bg2VTArCe+cggio3X73h2zDnaF+36I+2zy4rWdFSA
	 IrROzx4lrjIcG/OrIskofg9ujqyGCsZj3VuWxNsiM5IbXQ2wY5WTCfoV/KsSEFuHPX
	 UfRU5z2s3FyqQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 539C24110B;
	Thu, 11 Dec 2025 19:30:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 42FBD2C1
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:29:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1985340F2B
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:29:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3t75fZjWon8k for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 19:29:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B696410C0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5B696410C0
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:29:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5A94886BE5; Thu, 11 Dec 2025 19:29:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Dec 2025 10:56:40 +0100
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: 1d13662a5fe393530abeb5896fc52168e1b5730b
X-Git-Newrev: e5722ae60666ddfd683ef13f956981f297786244
X-Patchwork-Hint: ignore
Message-Id: <20251211192954.5A94886BE5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x]
 package/x11r7/xdriver_xf86-video-intel: update SITE
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

commit: https://git.buildroot.net/buildroot/commit/?id=e5722ae60666ddfd683ef13f956981f297786244
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

Updated URL of git server, tarball hash is unchanged.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 8c2947eaa5e34c4407a3fa142fbaa051d0e141ec)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
index 879abdd74d..ddd66598a6 100644
--- a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
+++ b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 XDRIVER_XF86_VIDEO_INTEL_VERSION = 31486f40f8e8f8923ca0799aea84b58799754564
-XDRIVER_XF86_VIDEO_INTEL_SITE = git://anongit.freedesktop.org/xorg/driver/xf86-video-intel
+XDRIVER_XF86_VIDEO_INTEL_SITE = https://gitlab.freedesktop.org/xorg/driver/xf86-video-intel.git
+XDRIVER_XF86_VIDEO_INTEL_SITE_METHOD = git
 XDRIVER_XF86_VIDEO_INTEL_LICENSE = MIT
 XDRIVER_XF86_VIDEO_INTEL_LICENSE_FILES = COPYING
 XDRIVER_XF86_VIDEO_INTEL_AUTORECONF = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
