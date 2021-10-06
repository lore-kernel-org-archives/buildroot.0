Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A70B8C433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 21:38:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C2E9611C6
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 21:38:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0C2E9611C6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CAFC940955;
	Wed,  6 Oct 2021 21:38:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CG01gXACXCsa; Wed,  6 Oct 2021 21:38:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4291040952;
	Wed,  6 Oct 2021 21:38:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 558901BF9AF
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 21:37:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 41D098418F
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 21:37:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8UprvXjPPeNM for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 21:37:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 92D2D84153
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 21:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1633556250;
 bh=iFxyzM8IspM2ydL8hgcFOdTeWdQRSh9Xf2O3HSDosZY=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=VVAtY30vpE8nr0OBWR+R5V7zs0G/Q4m1kc3KXlyM9xCCLjANbcwth00we/xmP0Y2a
 i/t975dqrbB7WQZrEXMT5xlel+3BKmOBcwyc2w8yw0wYh0HcjL/9e7l9bOHbEHcVPz
 0jvMjPHumukm9q2NeyHfVH5GycBe3e7dYucg92Vw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.251]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MacOW-1n4pKS2D5m-00c6eI; Wed, 06 Oct 2021 23:37:30 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Wed,  6 Oct 2021 23:37:27 +0200
Message-Id: <20211006213728.1069-4-ps.report@gmx.net>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211006213728.1069-1-ps.report@gmx.net>
References: <20211006213728.1069-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:+rrHd0Awu2V7ExabF3Xr+IaHVnnByxOhabCO+xen5B/nAE653kA
 VeJuh+tme1DPj/7S4iDNxPAyoGqOVGPeK8PRDjlsq0Bn3ORZApHQ6L0P4efEBt53B5ovNV6
 gS48eSpzPqq011qTTGn9yPTtRMDQaek02izOqXuBIkUH0DKRTcTHb0HQAfLi7pLAWQl28tq
 K/ftkaVmp1ZXm6sRqkbeQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:vo0uvM27xgU=:v7ZDAu/ze5eC9SVKYgfSJb
 gg0/SrMNRipCu0iKwBgQWc2V4OTrz99WCMXuGT9QD5nR8m5gOiJ0Jy2bMj9nupFbA3UaPsLTw
 V4AuzWWz2EJhFjGUHw+essCzOQurn7KUoSiKZ4AOeYP4KdBgpBjXLBEVTpNqXbCup6Qe0+WSx
 3I61ok11d9XfuJNnugv8D1MlKl2tOEXbIWqntIa+/39YkYCTh553WNo7h7Z3iGDrZ/qNkwJ1D
 TnI085zsGztn7b9+UX76Q+6oyiHk8v4bqwoGdXb/HQbovk1Q1uq4NYIizj7p9PLnyVFhf1Bab
 9XaKcFknyNbZkmHq90tMqixKVODXwqY2eX9HQ/SeQF2q+e8ON1Y6eQiP27rjrZO6jOrOe7vFZ
 HTkQHGXUbkT2vxw5wYFSWr0UGPf+1JS1UrwV2m5zLHY0QqgW/4BDcTCUmGLWvSxvvwvC+6TI1
 R7zV3qK39G5E7MUiDVvED4LHVvcHUzJqcR7CQu8T1qwlJMMS9TkdFdmm8IjsmDE2rC8pyLbu7
 sEJ5+wGwWQUd/cy/yQa1cF4xmSqxSQwnD18AjCZzsDtb2o8qLQl27qOP4QJ+UFDVdTfByl36q
 /sCmWW6L4tAIQKE5M5d7sIpdCNR0RtyzfvJJVaHVzhVCbIKJ5G0FLBImdtBrv9DW4vgZWVRyf
 i4XZb7xw91aWwVhNEKs/ZaChD8UVI4ex5Qoy9o2CoPW4PvMp9sUGEWa9+IeD7G08wCAfplEe3
 PGAv0VeucfGtx2E5PMaP6Bq7M3CzPtEL/QBawmKOtfNyc6YiSudD2SqYt74KX38QvvSvJDrtk
 J4e8myHn9kwcTOLQ3LNRDhbk4Qn8jUh2/sCBCC/9o28lQoTFFyjDaHFYn2O26mK4yy9dpzUVL
 SFCmalOf3YyS986UYctdmR1yA07ab0KNkOAB3S81rjTixLA87qyUyRbwsOmwy2nJi1jmso25S
 7/aY2Rf6psJG5GrEl1rZJmTpDipYmiKJypaawYUSFx5sI0GF7PTHcNkTm2ilrWoKNtunVfF7O
 vx90wkf/tT9Yj6X+RDxxhe4BV/oUaFrx+Vm3J/zUVo+0r9PGCWjBF+ug8rX7XqaNOzS3PWOUL
 nnaU8Y4StTl678=
Subject: [Buildroot] [PATCH v2 4/5] package/rpi-bt-firmware: bump version to
 883b726
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
Cc: Vincent Fazio <vfazio@xes-inc.com>,
 Arthur Courtel <arthur.courtel@smile.fr>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
  - Update CYW43455 bluetooth firmware,
    Second Spectra fix for CYW43455 (CVE-2020-10370)

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/rpi-bt-firmware/rpi-bt-firmware.hash | 2 +-
 package/rpi-bt-firmware/rpi-bt-firmware.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rpi-bt-firmware/rpi-bt-firmware.hash b/package/rpi-bt-firmware/rpi-bt-firmware.hash
index 2520c91cff..3f37d964d0 100644
--- a/package/rpi-bt-firmware/rpi-bt-firmware.hash
+++ b/package/rpi-bt-firmware/rpi-bt-firmware.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  ae665baa465a09dddf7f4bdec67e108a74b2a3787550cc9ee53c2bea9651f327  rpi-bt-firmware-4c47758bed7cd547dff3618a1739dcf64b5a52a7.tar.gz
+sha256  0e7fcfe75a8990815a184dc55f8fdf5d0644d351a15a7aef865ff90ff4ca8eb4  rpi-bt-firmware-883b72628de1d7efa45b421da0cbf175ac2374f8.tar.gz
 sha256  b16056fc91b82a0e3e8de8f86c2dac98201aa9dc3cbd33e8d38f1b087fcec30d  LICENCE.broadcom_bcm43xx
diff --git a/package/rpi-bt-firmware/rpi-bt-firmware.mk b/package/rpi-bt-firmware/rpi-bt-firmware.mk
index f63564de99..13358b4fda 100644
--- a/package/rpi-bt-firmware/rpi-bt-firmware.mk
+++ b/package/rpi-bt-firmware/rpi-bt-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_BT_FIRMWARE_VERSION = 4c47758bed7cd547dff3618a1739dcf64b5a52a7
+RPI_BT_FIRMWARE_VERSION = 883b72628de1d7efa45b421da0cbf175ac2374f8
 RPI_BT_FIRMWARE_SITE = $(call github,LibreELEC,brcmfmac_sdio-firmware-rpi,$(RPI_BT_FIRMWARE_VERSION))
 RPI_BT_FIRMWARE_LICENSE = PROPRIETARY
 RPI_BT_FIRMWARE_LICENSE_FILES = LICENCE.broadcom_bcm43xx
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
