Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C036C4345F
	for <buildroot@archiver.kernel.org>; Sun, 28 Apr 2024 03:56:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DEE8A409A7;
	Sun, 28 Apr 2024 03:56:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BeYzwE1PE0uG; Sun, 28 Apr 2024 03:56:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A5FD40994
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A5FD40994;
	Sun, 28 Apr 2024 03:56:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 023851BF2EA
 for <buildroot@lists.busybox.net>; Sun, 28 Apr 2024 03:55:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E88EF40994
 for <buildroot@lists.busybox.net>; Sun, 28 Apr 2024 03:55:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tT2pLAz-0JFz for <buildroot@lists.busybox.net>;
 Sun, 28 Apr 2024 03:55:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C58ED40992
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C58ED40992
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C58ED40992
 for <buildroot@buildroot.org>; Sun, 28 Apr 2024 03:55:56 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4144620003
 for <buildroot@buildroot.org>; Sun, 28 Apr 2024 03:55:54 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sun, 28 Apr 2024 03:55:54 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1714276554; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=43gH30mf2GgnwagoUkoUTBIiXcDI+ub6pYqXBFxYhf0=;
 b=WnMipNgj7Vh/P8G8lGKYl/nN9ejC+7/rngd8BShSxscbh8BOWWJcAoVxepl2XZMZ0Pt7Qh
 4KBGDqEyxXAN9bF7AXvT46oYSGe2pnzwgpJPrt+HF/mwvjbmSUf5hGegIDdEtOERjNi4S+
 AK/xOVFXFCRiQdMjnPpGBsB+TEqZBbxyhuDYcntcyWYDpm3htEsUCghcQtDfvOn2soDPix
 zQko6GCSOmhE+HwOGzfsXcDvLvoPnHdAbqiFBA8fQoxPKFRJQi1wlEa31GvvbLmEEYXXjx
 Nf/Vi5jaVLIdtKohVGPb5UWW45vs+8uyM6MoMBno6LA447In4FMMHohnzlAM9g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WnMipNgj
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-04-27
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>
Message-ID: <20240428035554._0kg2rdpwUPHktern8kFifMFUKSjf_3_imTVzsDrlsM@z>

Hello,

Autobuild statistics for 2024-04-27
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  4  | 11  |  0  | 15  |
    master   | 37  | 27  |  0  | 64  |

Classification of failures by reason for master
-----------------------------------------------

                libressl-3.8.4 | 5 
          libcamera-apps-1.2.1 | 2 
          linux-5.10.162-cip24 | 2 
               apcupsd-3.14.14 | 1 
             containerd-1.7.14 | 1 
                     efivar-39 | 1 
                    eza-0.18.8 | 1 
              fluent-bit-3.0.0 | 1 
glibc-2.39-5-ge0910f1d3278f... | 1 
     host-moby-buildkit-0.11.6 | 1 
                  jack2-1.9.22 | 1 
               libglib2-2.76.1 | 1 
                   linux-6.8.1 | 1 
                     mdadm-4.3 | 1 
pistache-3ec9d7c4f8b828fdd3... | 1 
                    proj-9.3.0 | 1 
         python-remi-2022.7.27 | 1 
                     shim-15.8 | 1 
              skalibs-2.12.0.1 | 1 
             stress-ng-0.17.07 | 1 
           uboot-tools-2021.07 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/4aee85146fd4cddbd909f821d0bd8bae3350ae9f |     
  riscv64    |       containerd-1.7.14        | NOK | http://autobuild.buildroot.net/results/8b4a8c52f970a93289b19ac85ce18fca6779cecf |     
    i586     |           efivar-39            | NOK | http://autobuild.buildroot.net/results/48fbc0b083ba8935685042849cb9e66c35bc3420 |     
   armeb     |           eza-0.18.8           | NOK | http://autobuild.buildroot.net/results/667410a2b6ffcb94a939e10382c1333ca6721c68 |     
    arm      |        fluent-bit-3.0.0        | NOK | http://autobuild.buildroot.net/results/23de104be9a776f2bed18ac52af9e7862bc91d56 |     
    sh4a     | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/47cf5e6fb6ebef2be9baf2dfc615b3fb41dc8e06 |     
    arm      |   host-moby-buildkit-0.11.6    | NOK | http://autobuild.buildroot.net/results/0299b9bc94d9efd3f595294925b377b976f45f44 |     
    m68k     |          jack2-1.9.22          | NOK | http://autobuild.buildroot.net/results/7886cdf95d23c7b9ad657dcc530cf282b9f7027c |     
powerpc64le  |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/acbaa886db67e20fdab8193b2610a8300c6da39f |     
powerpc64le  |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/16d998dbcc62d5bdca5e8f0b72a6acdbc3257136 |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/86219cd6b8a8145e62e524af2373860fdc190909 |     
   armeb     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/61eef6b7fa702a233dc9f73656bebf35593d032d | ORPH
    sh4      |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/2d60ad000620b496a628b42b45e78071d99ae758 | ORPH
    sh4a     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/ff24dbaee6eab910aad451bf359013c5b225233f | ORPH
   arceb     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/6f2d6f3d73d96c9ee7fc35c5ab8b954d0910ae93 | ORPH
   mips64    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/f902c936ad7ca7fb2c9926e95933084d18dcbb27 | ORPH
   armeb     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/8ed01405a83a15d1c18927188bc634669d27aa37 | ORPH
   xtensa    |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/237282d3f86899f2c253a7201783ac6b43aad9ff | ORPH
 powerpc64   |          linux-6.8.1           | NOK | http://autobuild.buildroot.net/results/7054f3da41c54602f848ff5b4cc9ba54f26b597f | ORPH
 aarch64_be  |           mdadm-4.3            | NOK | http://autobuild.buildroot.net/results/913c4cb18152a2a2974447cdf1da4f9d68152e07 | ORPH
    m68k     | pistache-3ec9d7c4f8b828fdd3... | NOK | http://autobuild.buildroot.net/results/7c811a69d5ffbea39ca82681b2bc67a966dc0137 | ORPH
 aarch64_be  |           proj-9.3.0           | NOK | http://autobuild.buildroot.net/results/008141ec9177cc936b87b97182ec9619f3fbe475 |     
   x86_64    |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/69498e2eb963bc6dfb612a17be67795ae808c4c3 |     
    arm      |           shim-15.8            | NOK | http://autobuild.buildroot.net/results/0a6ebdefb41b679d29317ca0af8232648d437e48 |     
    or1k     |        skalibs-2.12.0.1        | NOK | http://autobuild.buildroot.net/results/44a1ea33ca3435a40b731704667e288c982c5917 |     
    m68k     |       stress-ng-0.17.07        | NOK | http://autobuild.buildroot.net/results/d7d38dbb10f7f188da8dccc44a84a3c46a720bed |     
    arc      |      uboot-tools-2021.07       | NOK | http://autobuild.buildroot.net/results/4bec6539462f63964b482619ec698e12b01a7d5d | ORPH


Classification of failures by reason for 2024.02.x
--------------------------------------------------

               apcupsd-3.14.14 | 3 
          libcamera-apps-1.2.1 | 3 
                    bat-0.24.0 | 1 
                  clamav-1.0.5 | 1 
                libressl-3.8.2 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                    ncmpc-0.49 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/5d79f6037ec64f5df327eff0c850ea60a9663515 |     
  riscv32    |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/43d9c17a50add8dc0675f51adfb3a8d2b9a0fccd |     
  powerpc    |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/62843cdfb7aec92763f407392e99f6b107ffca75 |     
    arm      |           bat-0.24.0           | NOK | http://autobuild.buildroot.net/results/3ed5d3555b4cf6ffff7e8b0d63aa56655d1a9457 |     
    arm      |          clamav-1.0.5          | NOK | http://autobuild.buildroot.net/results/1ad700ad43e04946e648e203b7a715e7a45afb32 |     
   x86_64    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/4442cbe608ce7084e964205f7e53a6ce421aa705 |     
 powerpc64   |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/ec8f3d024a8b399cdd97203d44615e79ce96ab69 |     
  powerpc    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/fd8728c618840d0643efbe0db20bc4011615191f |     
   sh4aeb    |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/ee49256ef50c40e3ba7853ffa2219f43c89d3642 | ORPH
   xtensa    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/dd9bf7b01154767e9ae6d035417bf7241e7cf3c0 | ORPH
    m68k     |           ncmpc-0.49           | NOK | http://autobuild.buildroot.net/results/3bb21feedd8c8014dc0f327ac9dd52b650440028 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
