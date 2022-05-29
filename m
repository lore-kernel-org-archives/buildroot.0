Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD9B7C433EF
	for <buildroot@archiver.kernel.org>; Sun, 29 May 2022 19:22:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B60D843CF;
	Sun, 29 May 2022 19:22:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H9KN0cNTkAy1; Sun, 29 May 2022 19:22:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4ABFA83DFC;
	Sun, 29 May 2022 19:22:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 447401BF3C3
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 19:22:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3262F41A04
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 19:22:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TsUCU60ZkR-d for <buildroot@lists.busybox.net>;
 Sun, 29 May 2022 19:21:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 918F441A00
 for <buildroot@buildroot.org>; Sun, 29 May 2022 19:21:55 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id e2so12140755wrc.1
 for <buildroot@buildroot.org>; Sun, 29 May 2022 12:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P/6DCufUlg0fv5moCmvPyF2aFUyQ0heEmu/SWXJ+6sU=;
 b=iUrq77O4yr+apCcp2NUTXQz4mM5jU5q5G30/w/s/4AWA2nYrFcF8I4yoOm1Mkn3Fb0
 /VVaQnicZ4Ckd9dMYQWudfu8u9lTqB7xt6EOfGWQNH92eqF2Jg/OM8/nZBwLedSmUhUO
 llU86Fav3gD3VOs6zf/Mzu2meI/jbKUg5H2MuKlxy4Vjz0bZ+VMg6GGyGadYxtMHPLLl
 MAt8SP2pM+eDK/9/F+vxWoohyIYXJp9br3Q0SJVJm+xmPuypH639Oh4d4JP3zDa4P5Bx
 fHXplIecZvYroTOa72KrSTG9xTb+eYlLndXz6Raibh7087njURgwzWlox27v0IyF4ghr
 u+Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P/6DCufUlg0fv5moCmvPyF2aFUyQ0heEmu/SWXJ+6sU=;
 b=XAirAdsWayzGZRV71j7+M3fFBYsPH2cdIcNMGWJcak1i1dFK1XfYy8jgfjVjJS1oyF
 wdK9HvNgwma5RMLnwoHNxSyspUlsaR1DgYQ/7Yawwn/pglO2eDbRj9f0SYVG24fft7WZ
 H04dGP+ytZHfbextdYNSadMdnmaV/tpFpCshG/olQ9vo0fDy9sVROeMqWDBnic2NV+Kk
 2aB4fK0NJgJQt15OK5DoPRWvGsz4EdMEL0seEi4UwNErif07yr/R0U4rrelnlmZBIfoR
 ntQ/1sxyf2HRYSi0TcieglWbdldmneWXU4QWAUFbrRG2HIIfuhQ4IESRiY1tUn4sUonr
 ki+A==
X-Gm-Message-State: AOAM533Z3SLVrsvq9LBdAdJ7gnnnlrtqaSyPvvPDALoKRCieIyzB/0Ni
 rZoynFJMlTrZftqomviSgUyUUVr5pd0=
X-Google-Smtp-Source: ABdhPJy9t5IjzxFbNJWuZ1nqLX5l32n+tU3iV5JgJ0awTkz3tVH9FcBGrig+ibd09pZzoE+Yd+0qpw==
X-Received: by 2002:a05:6000:1843:b0:20e:6a9c:afa1 with SMTP id
 c3-20020a056000184300b0020e6a9cafa1mr42152951wri.218.1653852113261; 
 Sun, 29 May 2022 12:21:53 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 bw30-20020a0560001f9e00b0020ffa2799f4sm6889582wrb.73.2022.05.29.12.21.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 May 2022 12:21:52 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 29 May 2022 21:19:22 +0200
Message-Id: <20220529191922.2349752-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] fs/squashfs: fix
 BR2_TARGET_ROOTFS_SQUASHFS_BS_8K
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix typo BR2_TARGET_ROOTFS_SQUASHFS_BS_84K
-> BR2_TARGET_ROOTFS_SQUASHFS_BS_8K added by commit
555f8dfd6ef893463ce19d5ee242afd6b83cb450 and raising the following build
failure:

/nvmedata/autobuild/instance-0/output-1/host/bin/mksquashfs: -b invalid block size

Fixes:
 - http://autobuild.buildroot.org/results/927f070dfc1a800e57ca6619f062940641837db9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 fs/squashfs/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/squashfs/Config.in b/fs/squashfs/Config.in
index 0e8de2fd3a..21322a2246 100644
--- a/fs/squashfs/Config.in
+++ b/fs/squashfs/Config.in
@@ -46,7 +46,7 @@ endchoice
 config BR2_TARGET_ROOTFS_SQUASHFS_BS
 	string
 	default "4K" if BR2_TARGET_ROOTFS_SQUASHFS_BS_4K
-	default "8K" if BR2_TARGET_ROOTFS_SQUASHFS_BS_84K
+	default "8K" if BR2_TARGET_ROOTFS_SQUASHFS_BS_8K
 	default "16K" if BR2_TARGET_ROOTFS_SQUASHFS_BS_16K
 	default "32K" if BR2_TARGET_ROOTFS_SQUASHFS_BS_32K
 	default "64K" if BR2_TARGET_ROOTFS_SQUASHFS_BS_64K
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
