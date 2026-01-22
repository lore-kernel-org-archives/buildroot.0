Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5D61D3F083
	for <buildroot@archiver.kernel.org>; Wed, 28 Jan 2026 17:20:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9AEBB40910;
	Wed, 28 Jan 2026 17:20:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X_OEJ1Bk1SCk; Wed, 28 Jan 2026 17:20:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 93851408BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769620840;
	bh=f8T8mm67TOakSo7FOqn3ndu1sDXHUS55si/vcSieslE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=o10H4iczkaUueSqFdxuWIDMqU7KUt6kQoMHu7jYocai+/ys3l9qxfQVasjbKxeErI
	 9HAimVCBEKRzTFgJ0FNYbD1Zygnt77Tseyfyi3QnSIpXkFGoQei5LiIoHkQ+2JUQDR
	 ooJ3Omgdo0QIN4LrH0MJHuPu5gcvDilI+MPcxdPOA5eaqOt6tSSWkH60yUr89+WQvl
	 nPYKaJVOQ/TVYrSrkAHZQUXAMwEz2MRylmE5Csbar3Ru9C25G3DVhmeBeRTT2vE7xm
	 V1l9QgSHiFdt1WZIj7hn28MBlZcqEM6MUS7d2joW4WqiSRgKwfnFgNK6NcxsD4flmf
	 R1nAEBe5SuyzA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93851408BA;
	Wed, 28 Jan 2026 17:20:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 758B51AD
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 17:20:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 66CB860788
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 17:20:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EpSiYZXyoYXw for <buildroot@buildroot.org>;
 Wed, 28 Jan 2026 17:20:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C026060784
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C026060784
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 17:20:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B925C80749; Wed, 28 Jan 2026 17:20:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Jan 2026 15:52:29 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 9b695b085a3a61bccf4cd4f2d921ca1caa7d550d
X-Git-Newrev: 2c43fb5577f34e17fb950acd2ddf7c7f04ac875c
X-Patchwork-Hint: ignore
Message-Id: <20260128172037.B925C80749@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libgphoto2:
 remove optional dependency to lockdev
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

commit: https://git.buildroot.net/buildroot/commit/?id=2c43fb5577f34e17fb950acd2ddf7c7f04ac875c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

The lockdev package is unmaintainted and will be removed from buildroot.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 5f9d8b6e54f51bb1b3cc8f8e659267e9f9e3540a)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libgphoto2/libgphoto2.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/libgphoto2/libgphoto2.mk b/package/libgphoto2/libgphoto2.mk
index c1d5352c00..f849014bca 100644
--- a/package/libgphoto2/libgphoto2.mk
+++ b/package/libgphoto2/libgphoto2.mk
@@ -53,8 +53,4 @@ else
 LIBGPHOTO2_CONF_OPTS += --with-gdlib=no
 endif
 
-ifeq ($(BR2_PACKAGE_LOCKDEV),y)
-LIBGPHOTO2_DEPENDENCIES += lockdev
-endif
-
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
