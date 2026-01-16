Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3287C98301
	for <buildroot@archiver.kernel.org>; Fri, 16 Jan 2026 20:58:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C138A615BA;
	Fri, 16 Jan 2026 20:58:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G0a9NY4nA43l; Fri, 16 Jan 2026 20:58:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2AAA861571
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768597081;
	bh=uMwCpM/+7c7uteKeLBAV9DOaWMb4lvd1V03LQ5cTXVk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KROuiw8y/WgX6D3cxlSscz9A0eE7fp0HxW7I4TRZc0CBFfkrhNNxnB1japcs79dF2
	 BGezABi4vRYuDpGz69kCl3Ps0QfmZQ8uLWai1su3PPNNkIDRYG/PP78lwp5a9MlNEP
	 Cqi9buT788aqxn/aIwmLHj0Wx3A/nMajpXJ9eknSiWtZqjgJyaKS7WW2t1XicY3O5/
	 yH3ukkHZIlFuO1PlZtQ8FS6Xi5DIxwFKW2lc6Oh63xvJcKE4vw5X5WM1TtxQofq1YC
	 sUfYm82mSvO3HwnNbUfCbe33DxLMuu8DAug+qKd23ZtWhPMV9J3a/sVOv/DOmMjxu6
	 TENYGzSQ+xxnQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2AAA861571;
	Fri, 16 Jan 2026 20:58:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 12F7B160
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 20:57:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3BD41615AA
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 20:57:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GQIxmJY1Zh2W for <buildroot@buildroot.org>;
 Fri, 16 Jan 2026 20:57:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 142BC615AE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 142BC615AE
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 20:57:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0CBDB88695; Fri, 16 Jan 2026 20:57:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 Jan 2026 21:55:50 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e1ef4e191bf5cd94db019412dd3dd3bf5ee15f80
X-Git-Newrev: 5f9d8b6e54f51bb1b3cc8f8e659267e9f9e3540a
X-Patchwork-Hint: ignore
Message-Id: <20260116205749.0CBDB88695@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libgphoto2: remove optional
 dependency to lockdev
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

commit: https://git.buildroot.net/buildroot/commit/?id=5f9d8b6e54f51bb1b3cc8f8e659267e9f9e3540a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The lockdev package is unmaintainted and will be removed from buildroot.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libgphoto2/libgphoto2.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/libgphoto2/libgphoto2.mk b/package/libgphoto2/libgphoto2.mk
index 851eb401a1..95c0190ee6 100644
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
