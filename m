Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71FCEC433EF
	for <buildroot@archiver.kernel.org>; Thu,  6 Jan 2022 22:58:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F2774297F;
	Thu,  6 Jan 2022 22:58:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YJETmmnsbU_q; Thu,  6 Jan 2022 22:58:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 825304035E;
	Thu,  6 Jan 2022 22:58:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 450741BF378
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 22:58:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 325F081407
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 22:58:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uvk5sq58IzE4 for <buildroot@lists.busybox.net>;
 Thu,  6 Jan 2022 22:58:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4C4FB813DD
 for <buildroot@buildroot.org>; Thu,  6 Jan 2022 22:58:12 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id q8so7605010wra.12
 for <buildroot@buildroot.org>; Thu, 06 Jan 2022 14:58:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9HtiOPFI0w12G2GLL81jcljm8bzRMQrsAEymnMcRQx4=;
 b=o/8N4MV+upuRTJVabvYMB/ab8jJ+hPaGU1Oj4kxCr2MTX0RMXV1schj4paN3Ig6Wh3
 AN4nIStcyj8Q5aHOcj53XPTOS3jezMt+NkgdVe7VKGLCr6/cm0mDtNlpOWrpG7n2RgmC
 /qt/oiKMGOlRXJP2rzb3GSBAt+75zJCRUuOEQpA2Zw2g5gms/0yi5eRrU5kjI4GrZ4DI
 o/oyaKsq3atOLT1Ezn4wA2wfwFAPHCGro8kuY7gbaUYmSqaTxbxdTMO3Z7pkiMKfGkEa
 9lbSOIiSKW0wwo7kFeDa12JZ953jl+L0c4uUkcbK38qJFmMHbEKC5RZ61pTYk2F9WF40
 NKIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9HtiOPFI0w12G2GLL81jcljm8bzRMQrsAEymnMcRQx4=;
 b=5dd++4jGK0PNzS0DfY7NxjmGTv6mya7IrBvve7kEhhZZiyZogB2soJTfsVR9l01Y3n
 bVLbOZtbUj4drmCrBAycXdaCmPxhFfco4PgAx1vlCTcwCqrNDJBhq57DKkAHTGq7svF9
 NjHl04cuyT24AE3psaa7Di7VkgVQNplEJ8hHnnKHw+KyUErqBSCeASQmg8JXF1j1v6wJ
 oWKbrUFjaUidkS7ICv2dQLbCkOwEGrU+TO+JZ81GZdQUBs7yWVrQnuL1LrUIxc33Nxx1
 Ga/n1Js3ZeRpUF39BzdMcAcQj8fFLQHPWRq6G5E5kBAmnJWaax4nMRUbiqIQkVRhAch/
 TQmA==
X-Gm-Message-State: AOAM530kuAq2SU5pHemOZFZNXzlM7x4QhevQIqpx694A3a17F94v9EFT
 HCD36DdNGO2zYhJWR8BPj3y4e7abSrs=
X-Google-Smtp-Source: ABdhPJyL8Ks6M+kEIa+0Yfx3zYFGqUaVP61MaC+XUCfvo018a26CWZj2CttddTmU9vLW+5ZRtRNJHg==
X-Received: by 2002:a5d:564f:: with SMTP id j15mr50855093wrw.366.1641509890485; 
 Thu, 06 Jan 2022 14:58:10 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id u10sm3286351wrs.28.2022.01.06.14.58.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 14:58:10 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  6 Jan 2022 23:56:47 +0100
Message-Id: <20220106225647.1162108-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libvdpau: bump to version 1.4
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
Cc: Damien Lanson <damien@kal-host.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update indentation in hash file (two spaces)

https://gitlab.freedesktop.org/vdpau/libvdpau/-/tags/1.4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libvdpau/libvdpau.hash | 7 +++----
 package/libvdpau/libvdpau.mk   | 2 +-
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/libvdpau/libvdpau.hash b/package/libvdpau/libvdpau.hash
index 0833d41bf4..653657322a 100644
--- a/package/libvdpau/libvdpau.hash
+++ b/package/libvdpau/libvdpau.hash
@@ -1,5 +1,4 @@
-# From https://lists.x.org/archives/xorg-announce/2019-August/003021.html
-sha256 b5a52eeac9417edbc396f26c40591ba5df0cd18285f68d84614ef8f06196e50e  libvdpau-1.3.tar.bz2
-sha512 c06c23062816e8b207d38d9d53df43a1b193bb9836b48bd6d79a63d76522e87d383c446285b9877fe9c99faa0d290da8a49ccbb58eefa138cc38d0929a8e1330  libvdpau-1.3.tar.bz2
 # Locally computed
-sha256 ce4af7294872ff07f6e82ae5f1f5eba926215b1e2fb6d55d64759de082458d61  COPYING
+sha256  4258824c5a4555ef31de0a7d82b3caf19e75a16a13949f1edafc5f6fb2d33f30  libvdpau-1.4.tar.bz2
+# Locally computed
+sha256  ce4af7294872ff07f6e82ae5f1f5eba926215b1e2fb6d55d64759de082458d61  COPYING
diff --git a/package/libvdpau/libvdpau.mk b/package/libvdpau/libvdpau.mk
index 63aecaf744..ae2f388855 100644
--- a/package/libvdpau/libvdpau.mk
+++ b/package/libvdpau/libvdpau.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVDPAU_VERSION = 1.3
+LIBVDPAU_VERSION = 1.4
 LIBVDPAU_SOURCE = libvdpau-$(LIBVDPAU_VERSION).tar.bz2
 LIBVDPAU_SITE = \
 	https://gitlab.freedesktop.org/vdpau/libvdpau/-/archive/$(LIBVDPAU_VERSION)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
