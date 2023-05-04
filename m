Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43BBCC77B78
	for <buildroot@archiver.kernel.org>; Thu,  4 May 2023 05:33:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 810D1614AE;
	Thu,  4 May 2023 05:33:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 810D1614AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GxoFuPnJo_0l; Thu,  4 May 2023 05:33:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3037761499;
	Thu,  4 May 2023 05:33:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3037761499
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 38D251BF3D5
 for <buildroot@lists.busybox.net>; Thu,  4 May 2023 05:33:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D6AFA41DBB
 for <buildroot@lists.busybox.net>; Thu,  4 May 2023 05:33:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D6AFA41DBB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6XiZTFt0rzsk for <buildroot@lists.busybox.net>;
 Thu,  4 May 2023 05:33:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 601A54013C
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 601A54013C
 for <buildroot@buildroot.org>; Thu,  4 May 2023 05:33:01 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7B59C60002
 for <buildroot@buildroot.org>; Thu,  4 May 2023 05:32:58 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Thu, 04 May 2023 05:32:58 -0000
Message-Id: <20230504053302.D6AFA41DBB@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1683178378; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vpGveZnwBAjIZS6bSlG7jiqit60c4EXWB8yzXPsRFR8=;
 b=aOuZSR8FKYfliqm1Xv8/+0tCFSdMSFPxR+m5dIaei8yLRlcPGE7e0+cEUgR+cQi0VZPpjy
 hsPuJg2UYu7lVcTGGf+u7m4mrwimoWJqlkxDsgxohbXqV7jT2Zg1+Bipncb1ngr6dOy4io
 aKrz4B71Hh+hs/5+AW6Kl2++/KhhQAWMNDAmd0OuoFpklQZEEP0aOd9FDOaao2+oOk7t0I
 yOhDJgX5X5XFCMX9FRPRew5aO1SoeypAqGcOtrcT6dvM5bwaT5IQ6WHrsBIWyxp/8d4MCL
 DusJZx049LdPa3fm5wKf2xlGvrJraQd+5sYjvFgxo3DTK9PLOxMLUygCqx9/eQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=aOuZSR8F
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-05-03
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

Autobuild statistics for 2023-05-03
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  4  |  3  |  0  |  7  |
    master   | 14  | 27  |  0  | 41  |

Classification of failures by reason for master
-----------------------------------------------

               host-qemu-7.2.0 | 5 
              host-rust-1.68.2 | 3 
            host-binutils-2.38 | 2 
     linux-5.10.162-cip24-rt10 | 2 
                       unknown | 2 
         argp-standalone-1.4.1 | 1 
                  assimp-5.2.5 | 1 
                busybox-1.36.0 | 1 
           crucible-2022.05.25 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
                     gmp-6.2.1 | 1 
            host-binutils-2.37 | 1 
         host-gcc-final-10.4.0 | 1 
                host-go-1.19.8 | 1 
               libglib2-2.76.1 | 1 
          linux-5.10.162-cip24 | 1 
                  linux-6.1.26 | 1 
                python3-3.11.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |     argp-standalone-1.4.1      | NOK | http://autobuild.buildroot.net/results/aa9aae564314c6bb904a6573a556d2fc58219297 | ORPH
    mips     |          assimp-5.2.5          | NOK | http://autobuild.buildroot.net/results/56558d29b3d7f8118eaf83b28fff2a16329f6346 | ORPH
   mipsel    |         busybox-1.36.0         | NOK | http://autobuild.buildroot.net/results/88a895605f0932341d545f9ed58bc40c3ace9a7c | ORPH
powerpc64le  |      crucible-2022.05.25       | NOK | http://autobuild.buildroot.net/results/b2f8742118f3a552cbd0bd130dfb31dc4414a331 |     
    arm      | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/6b28eb3061ce3262384128c9c38caa60267bebf3 |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/6a3dcc881322fccc30e396a1e14a4a58cbc03c69 | ORPH
   sh4aeb    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/a5a526aef00a1f5fd702f7a3862dca95187f8ab7 |     
powerpc64le  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/95a872990eaae75ec5d9180ea0227b5fee1f056d |     
powerpc64le  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/ba9a300aeb5b585499af1f5a997adc3ba31ea4da |     
   sparc     |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/522c27a04d6e55fa2c21da911fb1492b0be442bb |     
    arm      |         host-go-1.19.8         | NOK | http://autobuild.buildroot.net/results/b7da7350e35cced8b8e680e2b1c1c0a02fc2fa0d |     
    sh4      |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/2aeff503a964c5a56f14b2a10a624a7f72d6a584 |     
    sh4a     |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/8cc930817b37dd917754d15af244c37973aab1cf |     
    i686     |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/cf989383be8ed7ecbd8d7faacf7d51837d81df62 |     
powerpc64le  |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/bc56f253fe7748794f7c5d9b2ed4c047b2bba1dc |     
  sparc64    |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/1d14c97fe92492549715cd0c69d3004b30daa9b8 |     
powerpc64le  |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/7675d4aaee90d82b115eaf669d9c45c1fd7c91c6 |     
   mipsel    |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/9a3e5c2d3e5c25cd6d3cd5aaebce001f19ba0574 |     
 powerpc64   |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/1696fa76d2c008556014ec5e82ec966c0bcc7a3d |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/0092a703c0b1b433eb66777c8a747c46de7da285 |     
  powerpc    |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/b76b4a13a8962ccee15c4b580d46ab5edf073ea2 | ORPH
   nios2     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/d7ab8972dad3daee90b8c9cf6f748d2ebc3fc9bc | ORPH
  aarch64    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/58d0c49fc444d13c7b84731b061820e8afdf5f16 | ORPH
  powerpc    |          linux-6.1.26          | NOK | http://autobuild.buildroot.net/results/5714e48646c9a5d4e82ef6da9b31249b26c47266 | ORPH
    arc      |         python3-3.11.2         | NOK | http://autobuild.buildroot.net/results/afa8cf705750dbb25ecb1c2390463fd695c22b4b |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/549641cffe1646d313a15d1dc33d551c6473f2e7 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/e780e87cc669d11f9137b5872bccc44a5652ab18 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

host-gdb-arc-2020.09-releas... | 1 
               host-qemu-7.2.0 | 1 
      libabseil-cpp-20220623.1 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/ac208a9dd91c8382fa675dd063ffc2bde1e71f9b | ORPH
 microblaze  |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/1d9e5545905ca3cfeb63708051110795f6cc3a8c |     
  mips64el   |    libabseil-cpp-20220623.1    | NOK | http://autobuild.buildroot.net/results/db94103ce468090f76e0bcd7b5ebb6a01a899445 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
