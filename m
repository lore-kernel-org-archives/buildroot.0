Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7485FC433F5
	for <buildroot@archiver.kernel.org>; Wed,  6 Apr 2022 14:15:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 159B381D5A;
	Wed,  6 Apr 2022 14:15:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p3MpTzLIcJ1v; Wed,  6 Apr 2022 14:15:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D70E81C21;
	Wed,  6 Apr 2022 14:15:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6FBC71BF300
 for <buildroot@lists.busybox.net>; Wed,  6 Apr 2022 14:15:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 605A281B14
 for <buildroot@lists.busybox.net>; Wed,  6 Apr 2022 14:15:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zTL1sQVaFwqa for <buildroot@lists.busybox.net>;
 Wed,  6 Apr 2022 14:15:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7406881C67
 for <buildroot@busybox.net>; Wed,  6 Apr 2022 14:15:25 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id q19so3431855wrc.6
 for <buildroot@busybox.net>; Wed, 06 Apr 2022 07:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IQWRxqJ2P2IP+sShtAB9kErlqLY5OmvFSPZEalrABks=;
 b=MySosrRQQ2elUZpTHSK7r9feaOOUeU1ib5E+NTXykpl8fjnYC9co3yxatTHKpXecHk
 Jos283jUaex2+G8XD5wBXZBrIrUZ8AMYSreCrbR/CXik1c9DuITwfMoH4kNooWuDDOjC
 lulYAFk95v2aQd06rKneOzLV8Oqg1skY3RYgACcTqAGz28n9b+ez/bmtA1tHZ05FREZw
 QzlMKXYpyC8cf+VuQ9nuzGSpfsuXlSw5XhHwxZzLHaHjn3g2DiguT+iCYEK6pZXjD1BL
 +UllYIaxnZQjYNFQH1VRRWjqDqIk1obPr5KB2hzLTohHD9ugO9Se0+l3VO/qwDiebGSU
 efBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IQWRxqJ2P2IP+sShtAB9kErlqLY5OmvFSPZEalrABks=;
 b=QsIJB+9dd/QS+DBhIfwfCyvb4iNcTRI/p7vr11b93Twl8IE7zVCSes3H3HH2qhD7ZT
 ZsvJ1RqEhtKDyZGl6aJ9/dsPwPAUK3yJcqmGvA3zp7V3tuEjOSvyZecLjGBiH0fCvid8
 7JSubITEYXGQdZ8Y8X/BVwzZ/S71NNz0qYbyjXoW30ReQSXzs/uMhhbnvMVvp1/XbrNw
 fOIrF1JebfzCUBXbBs8pXyo9sh44SEMKqSVBgHqSj3wovwvpwgijBeD62prBg3cgVhkw
 zIlCiHDFE1uqQuUnQDthQdMKGR8JECMC8fkdtztmPtaMral5y0L+8bgndGKtn8mHABL7
 Y/bg==
X-Gm-Message-State: AOAM530l+X2HiCEnn5OvC3wDRf1zNlBePhOrJ3FxW5Z/r05p3YFaHDsW
 uFPpF2jxBrXw73K62c6iZEYd/6NjkZ8=
X-Google-Smtp-Source: ABdhPJz+EHrKmW2Dmog/2LjkSHrFKPT/OpS3EDh8jNRzq+8fSIdbD6U5Nb5xPUiTR0OcHLvCm2QtBg==
X-Received: by 2002:adf:e0ce:0:b0:1ef:706d:d6b9 with SMTP id
 m14-20020adfe0ce000000b001ef706dd6b9mr6975430wri.71.1649254523610; 
 Wed, 06 Apr 2022 07:15:23 -0700 (PDT)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 w12-20020adf8bcc000000b002060e3da33fsm9783770wra.66.2022.04.06.07.15.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 07:15:23 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed,  6 Apr 2022 16:05:35 +0200
Message-Id: <20220406140535.2569899-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] configs/olimex_stmp157: bump kernel version
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 configs/olimex_stmp157_olinuxino_lime_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/olimex_stmp157_olinuxino_lime_defconfig b/configs/olimex_stmp157_olinuxino_lime_defconfig
index 74e7f9ba6..f9b31bbdc 100644
--- a/configs/olimex_stmp157_olinuxino_lime_defconfig
+++ b/configs/olimex_stmp157_olinuxino_lime_defconfig
@@ -16,8 +16,8 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/stmp1_olinuxino/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/OLIMEX/linux-olimex.git"
-# branch release-20210821-v5.10.60
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="081be4c4c634cf9345b8bf59fe141a0236383ae4"
+# branch release-20220321-v5.10.105
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="82a1d20f488b895ffe817c5692a631237e257b7d"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/olimex/stmp1_olinuxino/linux.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
