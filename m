Return-Path: <SRS0=/juA=P6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EAFFC433F5
	for <buildroot@archiver.kernel.org>; Thu, 11 Nov 2021 20:05:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB59661264
	for <buildroot@archiver.kernel.org>; Thu, 11 Nov 2021 20:05:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AB59661264
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83B114059C;
	Thu, 11 Nov 2021 20:05:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WLQTXZphwIhe; Thu, 11 Nov 2021 20:05:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D364A4059B;
	Thu, 11 Nov 2021 20:05:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2743D1BF44A
 for <buildroot@lists.busybox.net>; Thu, 11 Nov 2021 20:04:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1774081BF5
 for <buildroot@lists.busybox.net>; Thu, 11 Nov 2021 20:04:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gtJ5mXw08H3q for <buildroot@lists.busybox.net>;
 Thu, 11 Nov 2021 20:04:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1C67B8176E
 for <buildroot@buildroot.org>; Thu, 11 Nov 2021 20:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1636661081;
 bh=Z1Uq9hznvOQ65ZL8HQbZ2qh+GEDQx9f+fmxi5UVSRdc=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=ZWhDF+XA+nx+XYTA/Ry/2GWYNUY375a6ti27AzbGvlsBKQRK+6sg4w60vyMCd6qtX
 kjgjO4zDMsHfE+GzqYhyukIdfXM8vK8cAeHMKoEjmLt3ggpNnwH05lDjJO5ZfrlpCM
 mO4i4wt9SMlzhCYeXZTdCQ3TRDAlmOxVYQ8BIKWM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.16]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M89Gt-1mpusE2yLT-005Jn2; Thu, 11
 Nov 2021 21:04:41 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Thu, 11 Nov 2021 21:04:37 +0100
Message-Id: <20211111200439.15379-5-ps.report@gmx.net>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211111200439.15379-1-ps.report@gmx.net>
References: <20211111200439.15379-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:DUp0z9HpWlcBXdlQMGT8+Ihat+2+sGZ1Y/cbzPXRQxCcHiwxUaY
 6l0IXeNq9j3lI3ya+bcOSWbTIkmInLZV4dd1ypdVd7n3CpnLqGHIJZTk1L9i8CYYt6b44L1
 W2Pa1DL+RZ4hcna/5DEcjTKOyxDinzo3vekHtMJg160BS+G15tQq8NbEAof4CkLQKohZLnP
 yMPXwqe8wm9XGpaGXZSSQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:JgRiRsEteG4=:Y1qN7F7wyQ+dbVB8R3YErq
 tWSIgPvyK22hM/FU8lPQlwQSTtupj3STIcjjNUPcRerYJjJoRYyi9oFTddrHGxtO9hvCpqXPC
 gdfA+z7ZgpC2VTZ/DFKfysdE7kX39IoZOf28nutTrfh6XOZf/pAP3Mh4ZdgzB+P45hbUqhJuN
 SuDxEPM6ypUZkUsZknOjSNwm66BkVzMXTPslrGdG9HIsGHs7mBpXhSAKeWG2nC48KMy3kJ1OR
 pyPOec21jjFY0KUfVQn4FSejOMJBesg/NzjMWwxpv6+SVq97yh6aj8uM+EySCOIvuOJBvQnBj
 S4GHrgVxB0OK35x3f1Ktui45/ZN0ONkoH+D4WnmpH0Ggx/sSkvtKzyZZF6wVStE6I+PYsxyNW
 74S28XaWFi/nAFrcAlFhTyEWLQhpR4X6nCMw5ZcLga1irsxStND3vN3pZCm20jqhoItOtloQ8
 fhtypAxyvMwUdsukaXkZF7omKUDewXiYh0M01GxY+1b4Y6zuOHcjrPStLpzJAzw/y+uGkuLWW
 aMmSbFf077DNdiwXlYCy5PrRf1Y4a1wf7H9nnt/GWBKTGbwqtAwcDAKIffmTd1kRzDy0gd9m1
 X8Ai8W6fT9mxx2oF62jR9+DyDCkLQHuScpATZXkyqws4ijFJuO1MfNsmv2hYVMHQueRi4JLKQ
 DQSHaQavWGmLuj4IGmUDrPwFNQDa82x80SRNKbIlmUWvbbx6TX5o4dd6ayq0Enq/OwnsHhj4j
 aFtsBPMZmkUeQj5Qs6eVxYLxCX85eBu/I0DqFbVim4awsXmWGq/wbiqrsqtB5UwW/sTZJyLzs
 aRctWG8VCyvd8Eqt9wcbowfjSXGisz6vWcpye+Z9cxqFYJrohCpvG9E8AG91ZNQzWBbo2ne6y
 4l+rxtIv8CDZ2onN2EOv15650+LEQsDMi64WV6Ncf/ZOCpfGIvPqJR2v/HD2ro0/5hdChldoR
 g9r4gH/TOGW8C55e8ieTTFDpocaeXphLHSG4Wb4C7pKOe9hsKexyX8Z+Jm8mVIFq7GnVRgjV+
 SzHUw61M06PxLablo9l8bjMZc2Ts9JLdqxIXmsaaXODsplg8jEBnCcKvMcfCLdnrOngmStJa9
 Po9t0776cAbVw4=
Subject: [Buildroot] [PATCH/next v1 5/7] package/rpi-wifi-firmware: bump
 version to 3888ba2
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
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog (since 883b726):

  - 3e020f7 Add 43436S firmware
            Future Zero 2 W boards will have an alternative version of 43436
            that should have different firmware, named brcmfmac43436s-sdio.

  - 3888ba2 Merge pull request #18 from HiassofT/43436S

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/rpi-wifi-firmware/rpi-wifi-firmware.hash | 2 +-
 package/rpi-wifi-firmware/rpi-wifi-firmware.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rpi-wifi-firmware/rpi-wifi-firmware.hash b/package/rpi-wifi-firmware/rpi-wifi-firmware.hash
index 3bd62306eb..09cd197dd8 100644
--- a/package/rpi-wifi-firmware/rpi-wifi-firmware.hash
+++ b/package/rpi-wifi-firmware/rpi-wifi-firmware.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  0e7fcfe75a8990815a184dc55f8fdf5d0644d351a15a7aef865ff90ff4ca8eb4  rpi-wifi-firmware-883b72628de1d7efa45b421da0cbf175ac2374f8.tar.gz
+sha256  9bd61431d42322eb0610bd7eed218da255c4472efc203be4332a0872bb562ade  rpi-wifi-firmware-3888ba29898bb3f056d5f1eb283cb8de4c533bef.tar.gz
 sha256  b16056fc91b82a0e3e8de8f86c2dac98201aa9dc3cbd33e8d38f1b087fcec30d  LICENCE.broadcom_bcm43xx
diff --git a/package/rpi-wifi-firmware/rpi-wifi-firmware.mk b/package/rpi-wifi-firmware/rpi-wifi-firmware.mk
index 582e0aa8f5..a467f2c7b4 100644
--- a/package/rpi-wifi-firmware/rpi-wifi-firmware.mk
+++ b/package/rpi-wifi-firmware/rpi-wifi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_WIFI_FIRMWARE_VERSION = 883b72628de1d7efa45b421da0cbf175ac2374f8
+RPI_WIFI_FIRMWARE_VERSION = 3888ba29898bb3f056d5f1eb283cb8de4c533bef
 RPI_WIFI_FIRMWARE_SITE = $(call github,LibreELEC,brcmfmac_sdio-firmware-rpi,$(RPI_WIFI_FIRMWARE_VERSION))
 RPI_WIFI_FIRMWARE_LICENSE = PROPRIETARY
 RPI_WIFI_FIRMWARE_LICENSE_FILES = LICENCE.broadcom_bcm43xx
-- 
2.33.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
