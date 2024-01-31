Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F09AEC48285
	for <buildroot@archiver.kernel.org>; Wed, 31 Jan 2024 06:51:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4008E41E77;
	Wed, 31 Jan 2024 06:51:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4008E41E77
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XOedHK_eT3ug; Wed, 31 Jan 2024 06:51:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E8C741E8D;
	Wed, 31 Jan 2024 06:51:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E8C741E8D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7AA1D1BF846
 for <buildroot@lists.busybox.net>; Wed, 31 Jan 2024 06:51:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 07DAA6146D
 for <buildroot@lists.busybox.net>; Wed, 31 Jan 2024 06:51:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07DAA6146D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fA3d4L8kNVpI for <buildroot@lists.busybox.net>;
 Wed, 31 Jan 2024 06:51:34 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1C2F06146A
 for <buildroot@buildroot.org>; Wed, 31 Jan 2024 06:51:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C2F06146A
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5515AE0009
 for <buildroot@buildroot.org>; Wed, 31 Jan 2024 06:51:31 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Wed, 31 Jan 2024 06:51:31 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20240131065136.07DAA6146D@smtp3.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1706683891; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=3zvxprdTLSFav87+rFZFW3uG7XOr+Eo79Ey/nsUCykg=;
 b=hP1+DB8I80a+nQWma/ATS2NiKergIFgLO/bU6QiV71KAxA4BVCgYyLqb3VDrkdpnWAr6hy
 4V0XLgbG8bQ/agAjhmdnX9DS2E+vvAWg88JHE2//tMVhnZW8OxKN0BgaU9Yn5q0JOUTRN6
 /Zvjyx9D6u23ZKGThRDK5jfbdC5edT6IONnIEwVtTB1B2K0XyCgvhtLo2Pg3pFWB3moMEu
 GhMJ8WoyyaDB14eHoX8uyJNvfaDt/fHONFPCJ1lN/Evj2oIY9G1v5cultZTzmEL4wtrP7j
 WORM8MFcR5rFRIJ017UaQfsRC85xJKvmH6Mi7hUrRSiDlCC+jP/+bQ1i95Cmqg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hP1+DB8I
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-01-30
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

Hello,

Autobuild statistics for 2024-01-30
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  1  |  3  |  0  |  4  |
  2023.11.x  |  5  |  3  |  0  |  8  |
    master   | 47  | 53  |  0  | 100 |

Classification of failures by reason for master
-----------------------------------------------

                elfutils-0.189 | 5 
        host-sentry-cli-2.20.3 | 5 
                libressl-3.8.2 | 5 
                  axel-2.17.12 | 4 
                  stunnel-5.71 | 4 
                       unknown | 3 
glibc-2.38-27-g750a45a78390... | 2 
  gobject-introspection-1.76.1 | 2 
          linux-5.10.162-cip24 | 2 
                  linux-6.6.13 | 2 
                    attr-2.5.2 | 1 
             batman-adv-2023.1 | 1 
  binutils-arc-2023.09-release | 1 
                    brltty-6.6 | 1 
check-11970a7e112dfe243a2e6... | 1 
                 dc3dd-7.2.641 | 1 
              host-rust-1.74.1 | 1 
                libselinux-3.5 | 1 
               libunwind-1.6.2 | 1 
                   linux-tools | 1 
         lttng-modules-2.13.10 | 1 
                memtest86-6.20 | 1 
                    ngrep-1.47 | 1 
on2-8170-modules-73b08061d3... | 1 
                 openssh-9.6p1 | 1 
   python-pydantic-core-2.14.5 | 1 
                    qemu-8.1.1 | 1 
                 sudo-1.9.15p5 | 1 
           uboot-tools-2021.07 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |           attr-2.5.2           | NOK | http://autobuild.buildroot.net/results/943b598a5c47f61f8492a283c1c8d7fcef847357 |     
   mips64    |          axel-2.17.12          | NOK | http://autobuild.buildroot.net/results/d56ecc4625b8367b0ecabb161893a38046b982c4 |     
   armeb     |          axel-2.17.12          | NOK | http://autobuild.buildroot.net/results/feb4e8f02e4b24faebc0fdb8af39c99e453d02ef |     
   mipsel    |          axel-2.17.12          | NOK | http://autobuild.buildroot.net/results/f852bf92f12f7bc4f8a40f4f3edcc635b6fc1d5b |     
   mips64    |          axel-2.17.12          | NOK | http://autobuild.buildroot.net/results/a8c00442bc296353c75e393896abe9883b093a57 |     
   mipsel    |       batman-adv-2023.1        | NOK | http://autobuild.buildroot.net/results/35731f3f5f8b16fb3f65300329fd9097f85c72b7 |     
   arceb     |  binutils-arc-2023.09-release  | NOK | http://autobuild.buildroot.net/results/6e9a923c7f9c751d561de543288e0e5dd9ce2ac5 |     
    arc      |           brltty-6.6           | NOK | http://autobuild.buildroot.net/results/8cb8661888903ae974bfba2e051097d90289a9ad |     
   arceb     | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/237bca63854a9f80f6781d8294dd97f58ba687fc | ORPH
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/c983f6b79257ba12d809b18bd7790d374260934d | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/25c801e41624cf3391e0886d50927a319e6fc969 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/19522970f2da3efa05581368d0b40d2868630d94 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/0e0a7ac507c6a8d9ed64e6c4617809c7322b9051 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/bb0ee7f1eb915346d4997d92dc5fbab14f60d61b | ORPH
   mipsel    |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/ad894a3bb97e4556f912fafbc4eac758ca8f27da | ORPH
  powerpc    | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/e87a5142d865259e011c3810b60b95366ccb7226 |     
powerpc64le  | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/2d40dc536e5d4387de30198bb56b61b1e5d13e2c |     
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/092abb1714211b9dc67ba6d012481f2f1eccd909 | ORPH
   nios2     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/dfb71c50edb3a45208fc7dfbed672e5369129244 | ORPH
powerpc64le  |        host-rust-1.74.1        | NOK | http://autobuild.buildroot.net/results/4e76b172b57964fe18c8c2924a9c47b8cefe2bed |     
powerpc64le  |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/99da9b8cd3e41f0eb987c663ffbf0d6f68ff6f6e |     
  aarch64    |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/e358fa082a7c0bcd35bae577111fd16abb243627 |     
   armeb     |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/59b8d7694a6a792d65391c0bb649af980d551c02 |     
    i686     |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/6d5725b064dab0006b857909a37adbaf09204479 |     
    mips     |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/f70a305afcfada9ba264b2ca60ee63f23483f4b9 |     
   mipsel    |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/97273bf49b4be864827f3f50c936660a7a87096b | ORPH
   arceb     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/890b3222bbc8ed6b1bf66c7df8e9912ee95ce990 | ORPH
    or1k     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/0b6a512dc1fa8bd3aeb27ce084baeb59c50b351e | ORPH
   mipsel    |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/a33ad66aa4974db061e76831e63a4faf5f7553c0 | ORPH
   mips64    |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/c7aa201948fda1990d15c257f19e7fd6e276c21d | ORPH
   nios2     |         libselinux-3.5         | NOK | http://autobuild.buildroot.net/results/c05c17c0111b3ae267974da3e214e1ce8322f282 |     
  powerpc    |        libunwind-1.6.2         | NOK | http://autobuild.buildroot.net/results/1b2f8d47160f9e3914b9a3a9f9bacdbc049db506 | ORPH
   nios2     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/21bfcd8df98c88e570deba24268a6a9efcfdf97b | ORPH
    i686     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/90ed89a38f160d9aae3ec53ec5ff1c03e01a840a | ORPH
  mips64el   |          linux-6.6.13          | NOK | http://autobuild.buildroot.net/results/a433d6dd351f3fb2602ee9e8ab52911fd9d7b588 | ORPH
    sh4a     |          linux-6.6.13          | NOK | http://autobuild.buildroot.net/results/8c2b9309264145ad693174179c471cbfe6520ad9 | ORPH
   x86_64    |          linux-tools           | NOK | http://autobuild.buildroot.net/results/2126d04d5ef26ff6e65206fbe540a46e68f1a81f | ORPH
 powerpc64   |     lttng-modules-2.13.10      | NOK | http://autobuild.buildroot.net/results/7c00a0cbc823df0a747a8192ded6ef56de843c02 |     
   x86_64    |         memtest86-6.20         | NOK | http://autobuild.buildroot.net/results/1c0838f8c2eea32508cb570119f6263bcba76dd8 |     
    arc      |           ngrep-1.47           | NOK | http://autobuild.buildroot.net/results/71762c2cc9c35076b615b71755ea1238ef4d88d7 |     
   armeb     | on2-8170-modules-73b08061d3... | NOK | http://autobuild.buildroot.net/results/c822d288f0bc72a29885d8fad6556be5785a6b16 | ORPH
powerpc64le  |         openssh-9.6p1          | NOK | http://autobuild.buildroot.net/results/5826a2cd29af7f89828533b906cc4e13731d865b | ORPH
    arm      |  python-pydantic-core-2.14.5   | NOK | http://autobuild.buildroot.net/results/1678a2670c0dd54220703595414aac49a4b69092 |     
   mipsel    |           qemu-8.1.1           | NOK | http://autobuild.buildroot.net/results/0c5f74c1643200f7131a2d6d643d9269e0082abc |     
    arm      |          stunnel-5.71          | NOK | http://autobuild.buildroot.net/results/dfb827f1bf5a4f574bf14f84b907527b3ab7dd56 |     
 aarch64_be  |          stunnel-5.71          | NOK | http://autobuild.buildroot.net/results/b98f4c581d57ec6a5dd96959caaa961637350d3a |     
   armeb     |          stunnel-5.71          | NOK | http://autobuild.buildroot.net/results/2268b162ba81c064aae880c09d60298fbfd6d2f2 |     
   x86_64    |          stunnel-5.71          | NOK | http://autobuild.buildroot.net/results/bef5fd41d784ce6204fc601d13f5e48944cc4207 |     
   mips64    |         sudo-1.9.15p5          | NOK | http://autobuild.buildroot.net/results/403394b9c830778407fb9468e525b241ed532484 | ORPH
    arc      |      uboot-tools-2021.07       | NOK | http://autobuild.buildroot.net/results/8fc5dc380f8f40474edbd2083e1ebb4c4a695e3e | ORPH
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/d8ed024be248188cd15c09021aab6b871242d4b1 |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/a2fdc2a8237a5bf58f63d9259d5d76fefc463133 |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/6a247753ec6bfa420d83a4fcbcfe607ece2fa1d3 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                       unknown | 2 
                 raptor-2.0.15 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |         raptor-2.0.15          | NOK | http://autobuild.buildroot.net/results/8a7b6840eb1d6d5e134eefacd0951a6b4ed425c5 | ORPH
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/13084ab45dd3e1eb5eff32f1ae336d7177817105 |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.net/results/4c3aadf6bdf331ccd04e3a81bf62c56284f1e889 |     


Classification of failures by reason for 2023.11.x
--------------------------------------------------

                    bat-0.23.0 | 1 
                libressl-3.8.2 | 1 
ulog-0389d243352255f6182326... | 1 


Detail of failures for 2023.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     |           bat-0.23.0           | NOK | http://autobuild.buildroot.net/results/a8a64d80ea31f1542c973065eff759ddcc6fe182 |     
   mips64    |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/3f66385934a4d161357225f89650b11121776057 | ORPH
   mipsel    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/7fda8ee1006cc14632cc5df1d09c0988f36cdce0 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
