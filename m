Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B97EC433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 13:26:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E11984C84;
	Mon, 25 Jul 2022 13:26:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E11984C84
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7wU_2XdOF7hc; Mon, 25 Jul 2022 13:26:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA8F38319F;
	Mon, 25 Jul 2022 13:26:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA8F38319F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CA6BC1BF3EE
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 13:26:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B17FF60E58
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 13:26:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B17FF60E58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 47yFs0fdOIDH for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 13:26:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CBFB260E2F
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CBFB260E2F
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 13:26:16 +0000 (UTC)
Received: from vfazio2.xes-mad.com (vfazio2.xes-mad.com [10.52.16.113])
 by mail.xes-mad.com (Postfix) with ESMTP id 2F8DE201F1;
 Mon, 25 Jul 2022 08:26:15 -0500 (CDT)
From: Vincent Fazio <vfazio@xes-inc.com>
To: buildroot@buildroot.org
Date: Mon, 25 Jul 2022 08:25:52 -0500
Message-Id: <20220725132552.24631-1-vfazio@xes-inc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220620190115.541032-2-vfazio@xes-inc.com>
References: <20220620190115.541032-2-vfazio@xes-inc.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=xes-inc.com; s=mail; 
 t=1658755575; bh=LHTLEKf4nV5VTuKIfs/VlkRr7IeIrB7GPRueadvh3hk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Sg3AM/06PEMfXQZNSX1GeCZGSFEksbPl0mbW3hAc+6oqBEWIoczZO1wWl5pdGaVKi
 nPk0gwvTO++IO06LBe5HN1YIpC8wD6fFYSC2ckW7WB2lNEEQPOFmmSCOJ16II1oDng
 VYAYRm6jo+doNubuyycoSsGztJiwGNzf8wJEHIHc=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com
 header.a=rsa-sha256 header.s=mail header.b=Sg3AM/06
Subject: [Buildroot] [PATCH v2 2/2] package/nvidia-driver: bump version to
 390.151
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
 Vincent Fazio <vfazio@xes-inc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Adds support for Linux kernel 5.17.

Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
---
Changes v1 -> v2:
  - use proper hash for x86 driver package

 package/nvidia-driver/nvidia-driver.hash | 4 ++--
 package/nvidia-driver/nvidia-driver.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nvidia-driver/nvidia-driver.hash b/package/nvidia-driver/nvidia-driver.hash
index 7f2248d0f9..b14e7ae194 100644
--- a/package/nvidia-driver/nvidia-driver.hash
+++ b/package/nvidia-driver/nvidia-driver.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256 51adb28f0ed4548f35a88a93ad6767ebd807fa14f418bf5e51a6d63a3ff7f275  NVIDIA-Linux-x86-390.132.run
-sha256 b6b4b8af37e78e026c9ebdf4a5c64ea412dfcb710931dd028c22dac228de659d  NVIDIA-Linux-x86_64-390.132-no-compat32.run
+sha256 94e399b459659c12b1344e8c8f4f5eee1ed5915ff459fc8bb831c9e1d44677db  NVIDIA-Linux-x86-390.151.run
+sha256 6e4fd2258465f5d5527fe80abd46de925a30348b4a84658498a6d75caf42c47c  NVIDIA-Linux-x86_64-390.151-no-compat32.run
 sha256 bd28b0c5aeeb00eb11d3ec6f6f3449d4b3a40100914258332734a53527997526  LICENSE
diff --git a/package/nvidia-driver/nvidia-driver.mk b/package/nvidia-driver/nvidia-driver.mk
index ec070e3ca6..f1217b00aa 100644
--- a/package/nvidia-driver/nvidia-driver.mk
+++ b/package/nvidia-driver/nvidia-driver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NVIDIA_DRIVER_VERSION = 390.132
+NVIDIA_DRIVER_VERSION = 390.151
 NVIDIA_DRIVER_SUFFIX = $(if $(BR2_x86_64),_64)
 NVIDIA_DRIVER_SITE = http://download.nvidia.com/XFree86/Linux-x86$(NVIDIA_DRIVER_SUFFIX)/$(NVIDIA_DRIVER_VERSION)
 NVIDIA_DRIVER_SOURCE = NVIDIA-Linux-x86$(NVIDIA_DRIVER_SUFFIX)-$(NVIDIA_DRIVER_VERSION)$(if $(BR2_x86_64),-no-compat32).run
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
