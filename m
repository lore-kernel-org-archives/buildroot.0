Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D77DC77B7C
	for <buildroot@archiver.kernel.org>; Thu,  4 May 2023 07:08:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 054AF41DDE;
	Thu,  4 May 2023 07:08:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 054AF41DDE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mDn9RXsbRLqS; Thu,  4 May 2023 07:08:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1DC6D41DDA;
	Thu,  4 May 2023 07:08:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1DC6D41DDA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E01C21BF3C8
 for <buildroot@lists.busybox.net>; Thu,  4 May 2023 07:08:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B7FAA4033C
 for <buildroot@lists.busybox.net>; Thu,  4 May 2023 07:08:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B7FAA4033C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ifXgaNgzjC8o for <buildroot@lists.busybox.net>;
 Thu,  4 May 2023 07:08:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A4922402F4
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A4922402F4
 for <buildroot@buildroot.org>; Thu,  4 May 2023 07:08:21 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-64115e652eeso10391483b3a.0
 for <buildroot@buildroot.org>; Thu, 04 May 2023 00:08:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683184100; x=1685776100;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9pAYRFwBzgjSGCiwDRuscm2R5kkzWxMEmbTfuJzqtcw=;
 b=B/WZQ633CU+2rwbhx0+yIBLQOdz/Nra72PEB+JrfB5UGBF51fi57+2OR/6EDomZK+s
 m6R/PmUb5gCV+kbuhaPGq8hR3//ArkqRztdjq0tx6eJKAtynKkg5/uSEBPsiBFevri2Q
 cdaOdagYT96/1gnBgsgxEgwbdHHZ4OnzjuGqE99zLrcadOFXLUivoXjh1hdyO/s23IL6
 oDmjZ7Pf4F5zNfmLizCbFoJrh+GXc6ZD46LRHMCk7W6tBsJA+qD1ONB1gTiMOKMnwBqN
 EPSI6b2ahY9ifRLXzyWAE2vHowbXXsnqcekryaGiO2y81Pq90+vYlboX4EiRIJUsQ+r+
 v+Kg==
X-Gm-Message-State: AC+VfDw/AAJYLeBhjYk3EQqyQRI8PiXDyHzNUy7IqnCnt8oMf6CZRxiq
 hZIe4oA3a3E+rAGq9zOUXfcx3A1iydSia6vS9M6lJeqdqBM=
X-Google-Smtp-Source: ACHHUZ40etHKdurAVwaIJbEXohPNOtF43C+Eo/YZ+AR1STVJbQ3zwVoKBp3IC++NWvCz6GRCyrs1Vg==
X-Received: by 2002:a05:6a20:938b:b0:f2:2185:8575 with SMTP id
 x11-20020a056a20938b00b000f221858575mr1206022pzh.23.1683184100582; 
 Thu, 04 May 2023 00:08:20 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 w2-20020a62c702000000b0063d3fbf4783sm24579763pfg.80.2023.05.04.00.08.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 00:08:19 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu,  4 May 2023 00:08:15 -0700
Message-Id: <20230504070815.3390348-1-christian@aperture.us>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1683184100; x=1685776100;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9pAYRFwBzgjSGCiwDRuscm2R5kkzWxMEmbTfuJzqtcw=;
 b=s/Ovo6rH9iOpgT8l39CwErivhWaHG17eXhPMQ4Few+EIINyZEUoPS5x8kyT3dF0vrl
 u83GsC+lclKCm+GRd/grpYnHZmAN1BZB1SMTDB3Qye+O5/law0hJhL37gWsxGhkupw6C
 L628YErt34f41puO+ASnlidVo2oLV2XKFhbDxRYp+IhFnhSoX+OaCU+laWQHdFXvfRts
 ggeIoAPSQ3gktPP6yBaAPJUm9A1yDNRaohbJtF7UZo89UJaDuuFGWIdCkToA3ThylzJr
 ZNIewpj99cZcBmrNYookMRlStA2lx5eO9rPVhQ62TnbAoeiABRQ93RqYrtpzWq+lOe69
 PKQA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=s/Ovo6rH
Subject: [Buildroot] [PATCH 1/1] package/fuse-overlayfs: bump version to 1.11
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Christian Stewart <christian@aperture.us>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/containers/fuse-overlayfs/releases/tag/v1.11

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/fuse-overlayfs/fuse-overlayfs.hash | 2 +-
 package/fuse-overlayfs/fuse-overlayfs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fuse-overlayfs/fuse-overlayfs.hash b/package/fuse-overlayfs/fuse-overlayfs.hash
index aa5438755e..d83d3e3125 100644
--- a/package/fuse-overlayfs/fuse-overlayfs.hash
+++ b/package/fuse-overlayfs/fuse-overlayfs.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  4351eaed7cf26a5012c14c6e0fc883ef65a7b5dcc95ba129ce485904106c25a9  fuse-overlayfs-1.10.tar.gz
+sha256  d5558cd419c8d46bdc958064cb97f963d1ea793866414c025906ec15033512ed  fuse-overlayfs-v1.11.tar.gz
 # Locally computed
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/fuse-overlayfs/fuse-overlayfs.mk b/package/fuse-overlayfs/fuse-overlayfs.mk
index 1633d3bd41..4db2ccd7d5 100644
--- a/package/fuse-overlayfs/fuse-overlayfs.mk
+++ b/package/fuse-overlayfs/fuse-overlayfs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FUSE_OVERLAYFS_VERSION = 1.10
+FUSE_OVERLAYFS_VERSION = 1.11
 FUSE_OVERLAYFS_SITE = $(call github,containers,fuse-overlayfs,v$(FUSE_OVERLAYFS_VERSION))
 FUSE_OVERLAYFS_LICENSE = GPL-3.0
 FUSE_OVERLAYFS_LICENSE_FILES = COPYING
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
