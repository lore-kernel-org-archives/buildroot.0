Return-Path: <SRS0=/juA=P6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C19D6C433F5
	for <buildroot@archiver.kernel.org>; Thu, 11 Nov 2021 20:04:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13FEE61264
	for <buildroot@archiver.kernel.org>; Thu, 11 Nov 2021 20:04:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 13FEE61264
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 93DE7401FE;
	Thu, 11 Nov 2021 20:04:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ngCB9craeZiP; Thu, 11 Nov 2021 20:04:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A073B40226;
	Thu, 11 Nov 2021 20:04:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 555D01BF44A
 for <buildroot@lists.busybox.net>; Thu, 11 Nov 2021 20:04:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 420E481CAD
 for <buildroot@lists.busybox.net>; Thu, 11 Nov 2021 20:04:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZeU_M9aYHgUK for <buildroot@lists.busybox.net>;
 Thu, 11 Nov 2021 20:04:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1879681BF5
 for <buildroot@buildroot.org>; Thu, 11 Nov 2021 20:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1636661080;
 bh=pQkzhAdWzLrUnkq8u0EhFJLs3WlF9YnO/p3yqFgfbQE=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=lV2dNrNDWg63/xidC0cNPWPFkoGm1TSO6CWjaMxg3Po79dInJFd8+4fveSgMlLsp5
 pRYvSJ2K9FQadF//zNM28LTm5D1m8abMPkbKNDYkRzr18ctgLrn09bALTMW+iSoTnE
 jeuCF3oVJepTSPF7HaqVTHtJ4a2h4Ss37fe7LEDQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.16]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MatRT-1mAHb9242F-00cQcm; Thu, 11
 Nov 2021 21:04:40 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Thu, 11 Nov 2021 21:04:34 +0100
Message-Id: <20211111200439.15379-2-ps.report@gmx.net>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211111200439.15379-1-ps.report@gmx.net>
References: <20211111200439.15379-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:uEi+xUvDaJaPhIkqvSpI32rjUCIP1nBmXyznaG1Ihpi460+9N80
 w1qSOykfxcilzYIHjdRG35FmN+7fqiND0KJTnKr/EkRKFHMWM+LWhPuAn5vm6Su3RUIaMpy
 LpTzVJaPVcq1JB9UcU0tvdm6zuKy1yeo0m9W7FIqVebO+DtSwAPs7ZzrKXC2x+1VcdeBKdX
 YfIy4mW3AEslipVIO04NQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:kxNvmaCl+To=:0zZd1W1VQhdiPYO4uMZfrf
 7Rd3h0MXrwOBYwk032nF3SJYKHvDvhIIjHHN1YH4Vlms0vgSsAM3RVNxEY6PBswEOMeQws//l
 ckdhAAWhuliq/ZHzDFngCKp9AoYJk6xS857GY1AqokvbzFJsPwocr2yuHAPDMNdA99Zb7PSrL
 X5zkkFPZokqtr5noo/XeEo+1tTzJlYsBrm1hhglALmFir83PlFVJT/T+InO1ijhNJl+JQDyd4
 MEAyp05VUaNzuPdf4wK6bTH0hoTgF9E5rbQTgBI0Mc+Lp066bTt8iqh/LRc5zvgqZBiqlcvR3
 8ak6OyPgMlNRieIUsEfrNMSyYaBEZN0Y4rm5mWP8u7cv+oc8Cv6YUUAqv3coVA7qxbqC9zNsu
 KbzvbPaK8+DuX4v8udRY+XyJcU2117ij7zCvn2QGBCV2ZcLdCe2kaA+qWqM9F+dF9AduoIs3B
 fsxjM1gOoANfYls7FVQb1UYSnO/K10C/0TWKqTncZCgfStw8t/VSQ8RxsyEXvJptmSnylpJ/6
 BNs/3n1KpJmLhp5geTMtkLs0retOW178d7MhHPEamQcyNRDfBxcbgCb6P761tQBKTV54l3S6p
 vCHgCR+K/EglFEbWbGf58Xzdoq8nbHqxz3KroU1465e9qlleBGPCWxWhCs7g7CPbEUC7CcldR
 49JFvtTbrCYMwgU/zRds1UB8B7Nj2gilFqPgDZ0FmOHXjbxtJ/ThjDl13nVT94INSxoqrpNKb
 OYA6f31z3mOcvNCgbaYJIkP3lvaimQoaGaHU9WK+NO7b/RLGcLEhrm7chXN1QcCee8m2dqJdP
 yp7SX5JS2H+fSq37OwlBcFYqzsDgjnS6cgYNif7/aa9wocwlsoWTaBAxDkLcbE4xcbLVtPNV4
 sIpXoqr0lgRskNwpLvlWvO/1uBiK7BcRetlVkHBpsQK8Jlo2wED5ydMVWyyTQ59qFDpT9PmJz
 E/+RidBKsSF4EqHhrwlz0OifNbg8xyiuM+T1085iVdyXSnUJo6Rd4Mnp1YgIWZ2FNqJbMM4aR
 WIstBrcVQ3Q9l+KVra/zaHNWMhJqo4HAQ2aBS67uV7Txv0qq24E9TnC1A3AaMOuFfoboXHogP
 RAiK+EA2+7FswU=
Subject: [Buildroot] [PATCH/next v1 2/7] package/rpi-firmware: bump version
 to fa9a006
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

Changelog (since ):

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/rpi-firmware/rpi-firmware.hash | 2 +-
 package/rpi-firmware/rpi-firmware.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rpi-firmware/rpi-firmware.hash b/package/rpi-firmware/rpi-firmware.hash
index 0ff7a73a37..7cbfd1b249 100644
--- a/package/rpi-firmware/rpi-firmware.hash
+++ b/package/rpi-firmware/rpi-firmware.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  80af5efb51677edb7af6746a553dc2d8ad3f532ff44e4b7263f1e12d4bf72ffd  rpi-firmware-2ef3800b1b71c0e30c2a61ecad6e007ae96ea342.tar.gz
+sha256  a079a31fc80a23421589edcacef94faa713b12d3e77b92710ae2594c8d549477  rpi-firmware-fa9a00624e7d5d3dcdb297dff132dc32cc2d9a25.tar.gz
 sha256  c7283ff51f863d93a275c66e3b4cb08021a5dd4d8c1e7acc47d872fbe52d3d6b  boot/LICENCE.broadcom
diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index 3a4741a0ff..5e8b0379ba 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_FIRMWARE_VERSION = 2ef3800b1b71c0e30c2a61ecad6e007ae96ea342
+RPI_FIRMWARE_VERSION = fa9a00624e7d5d3dcdb297dff132dc32cc2d9a25
 RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
 RPI_FIRMWARE_LICENSE = BSD-3-Clause
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
-- 
2.33.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
