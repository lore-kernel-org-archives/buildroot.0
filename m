Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 680A9C433EF
	for <buildroot@archiver.kernel.org>; Fri, 28 Jan 2022 07:08:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA2A2606E7;
	Fri, 28 Jan 2022 07:08:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cFH1x6Tw6Gac; Fri, 28 Jan 2022 07:08:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BBDB860AD1;
	Fri, 28 Jan 2022 07:08:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B1C371BF3BC
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 07:08:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9FB3F410CB
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 07:08:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rndfU4te6z7r for <buildroot@lists.busybox.net>;
 Fri, 28 Jan 2022 07:08:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C4AF2402A9
 for <buildroot@buildroot.org>; Fri, 28 Jan 2022 07:08:22 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 287EF240005
 for <buildroot@buildroot.org>; Fri, 28 Jan 2022 07:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1643353701; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=P2ZzeUuwWA8UYbmRkLoJPGLLdskzU+SHriEQkMp7vW4=;
 b=Z8DqIAud3viyEYPaGeu8Wtb1Th268yjXRedQuyDjLABxfoQsJpCbkPAUUwbS+lpftY7ZPy
 EIOVH7gDAkEMdtR024E4jwlY7QlN/E5odf6NOyhiyJL7dw+1OHfmQFjhtuySrbx/FWqLaq
 MYsYeEuO9E+aDXuuKsppu4hBuI/YgQMAzm/K3t6tPB+CEYNyA4y4o+7CN1gk5azo4ruBMW
 HEf3LvUEeQmyplNGlIJqbMqQ8AAKYSofxhZUP/0CRpaREbyqcQB0vT9vSbsXfFPmINFIH9
 JvoL3/9raMuY1x756OvyyWyIO60E2OPEwtaeznJBQRWhVvXBRKOHT81/STVMUw==
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Fri, 28 Jan 2022 07:08:20 -0000
Message-Id: <20220128070824.9FB3F410CB@smtp4.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-01-27
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

Autobuild statistics for 2022-01-27
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 51  | 14  |  0  | 65  |
  2021.11.x  | 21  |  7  |  0  | 28  |
    master   | 85  | 44  |  0  | 129 |

Classification of failures by reason for master
-----------------------------------------------

                 htpdate-1.3.3 | 5 
                  rygel-0.40.2 | 5 
                       unknown | 5 
                       frr-8.1 | 4 
                   guile-3.0.7 | 2 
              host-delve-1.8.0 | 2 
                log4cxx-0.12.0 | 2 
                rtorrent-0.9.8 | 2 
                    bird-2.0.8 | 1 
             bluez5_utils-5.63 | 1 
              cryptsetup-2.4.2 | 1 
                  dnsmasq-2.86 | 1 
 glslsandbox-player-2021.08.24 | 1 
                 hiawatha-11.1 | 1 
                 jasper-2.0.28 | 1 
                mongodb-4.2.18 | 1 
               mongrel2-1.13.0 | 1 
                   mp4v2-5.0.1 | 1 
                nodejs-14.18.3 | 1 
pistache-f2f5a50fbfb5b8ef6c... | 1 
               pulseview-0.4.2 | 1 
                     vdr-2.6.0 | 1 
                    vlc-3.0.16 | 1 
                 wavemon-0.9.4 | 1 
                  xvisor-0.3.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/5a1a94efe3eab09050ab56caec88b411cae451ed |     
    arm      |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/1e52863f27ef19b2555d5bf360812e1cb4a48725 |     
microblazeel |        cryptsetup-2.4.2        | NOK | http://autobuild.buildroot.net/results/dc74e318564f642bd8fddcca2721a650f21af3c5 |     
    arm      |          dnsmasq-2.86          | NOK | http://autobuild.buildroot.net/results/9c09a31cef5abfeaf774c025df678a33c18aad5e |     
  mips64el   |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/6fc95af66fd39481fac5c0e06a46f7a56c931d64 |     
  mips64el   |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/bf6d2615526a84e91110bce13f57779478a285e9 |     
    arc      |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/8b700fe2442a56fd47c8a01a8ba1a2dd57f65a8f |     
  mips64el   |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/bc109f875ced91c99aeecf7a102f1453b99d1270 |     
    arc      | glslsandbox-player-2021.08.24  | NOK | http://autobuild.buildroot.net/results/8c153d9082b0193ca4db6f2a7f879e49f27dff2f |     
    arm      |          guile-3.0.7           | NOK | http://autobuild.buildroot.net/results/6ff930a94023e3b4b787c99d10ea3bb4b606b4b7 | ORPH
    arm      |          guile-3.0.7           | NOK | http://autobuild.buildroot.net/results/2dfbb7f8de52247fbce64037deaabec5f06c75a4 | ORPH
    arm      |         hiawatha-11.1          | NOK | http://autobuild.buildroot.net/results/ec6ca34a8b00204ee5f14cda17a3f38a95e509a1 |     
    arm      |        host-delve-1.8.0        | NOK | http://autobuild.buildroot.net/results/ba9d5d02f0394abcd1c346d716812bf5f86da452 |     
    arm      |        host-delve-1.8.0        | NOK | http://autobuild.buildroot.net/results/4fecb2e4d8de4669f52ceaa25771468de2f2b9d8 |     
    arc      |         htpdate-1.3.3          | NOK | http://autobuild.buildroot.net/results/2084229fd67cc7d340c3e64ab2836825e629f817 |     
  riscv64    |         htpdate-1.3.3          | NOK | http://autobuild.buildroot.net/results/f1034de5ebc2fc2c49711820077d0b6e5e13aea5 |     
   nios2     |         htpdate-1.3.3          | NOK | http://autobuild.buildroot.net/results/e800b73900ae957436f7b93db00706e7f157b188 |     
  powerpc    |         htpdate-1.3.3          | NOK | http://autobuild.buildroot.net/results/28cc14f488c92ff982271a03795b44d9a241e6fb |     
  riscv64    |         htpdate-1.3.3          | NOK | http://autobuild.buildroot.net/results/f0b64c97e7333ba9ce2276d76ae139d44ab8b0f5 |     
   x86_64    |         jasper-2.0.28          | NOK | http://autobuild.buildroot.net/results/4e965c07f607bc75e980e613267cedc1c4febd91 |     
   x86_64    |         log4cxx-0.12.0         | NOK | http://autobuild.buildroot.net/results/8d49ab7cd9952f6a13bdd330e875012d0601f1d2 |     
   s390x     |         log4cxx-0.12.0         | NOK | http://autobuild.buildroot.net/results/ea0cd0ef5a6c625072504e6c631af77808628578 |     
   x86_64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/cfedb7f6432dd1ed1f4d4000541b5c76de65f5d4 |     
    mips     |        mongrel2-1.13.0         | NOK | http://autobuild.buildroot.net/results/fb95b2472a6e7c60115048fbf1c6e1d19d09fa3c |     
    arm      |          mp4v2-5.0.1           | NOK | http://autobuild.buildroot.net/results/b2d4e16a7984528b8179abe4774aced433a7572c | ORPH
   mipsel    |         nodejs-14.18.3         | NOK | http://autobuild.buildroot.net/results/b2e204a84747949d7b0c1422f2c2310fc03fbdd4 |     
   nios2     | pistache-f2f5a50fbfb5b8ef6c... | NOK | http://autobuild.buildroot.net/results/0e7b74c5a07ced2bbae1a0a8c7d7ba26dfa04031 | ORPH
    sh4      |        pulseview-0.4.2         | NOK | http://autobuild.buildroot.net/results/f5f51d043d088256ed455c205d8355ddcc1f6f8f |     
    m68k     |         rtorrent-0.9.8         | NOK | http://autobuild.buildroot.net/results/8dfad4391d8c89cf2448cf32bb6635d2a870d5f1 | ORPH
   x86_64    |         rtorrent-0.9.8         | NOK | http://autobuild.buildroot.net/results/c8e77d3a44bdf4b241ead03f773b9695718d5570 | ORPH
  aarch64    |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/a5aa04382491043ddc6c79126668041a5b39b855 |     
   x86_64    |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/d58f5f005db0a82c430deecdc6a38da84e2f25c3 |     
    arm      |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/deeda871e1b6ed50cf0b2ccc354fe6ae27886cc4 |     
   mipsel    |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/a4576f1a9cb5a2485c8e58fc0f638315c6f6317c |     
  riscv64    |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/ef595d1ec24bcd565da3f80ca2781a0e830cc9ab |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/97b6dff3278abe3909cf92c9e31604bf3eb6e955 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/bb64b1ec66cc5eed4e33d84e3bed6dfdf8c4a22a |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/e308a4103ccc05cfe1d7ddda2162163930c55056 |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/34d04685f7438baa019ed49f5ec7e90c82a4022c |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/339c5e66414d83025051e6389f25f432b6d73fe6 |     
    m68k     |           vdr-2.6.0            | NOK | http://autobuild.buildroot.net/results/427830ab64583961552038dc98cec5a4da35b83e |     
    arm      |           vlc-3.0.16           | NOK | http://autobuild.buildroot.net/results/fbfa6428d05c9c26cdded044cb560583f8aad1a9 |     
  powerpc    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/93963b2602145bafac21349a46e274638f87b36a |     
    arm      |          xvisor-0.3.1          | NOK | http://autobuild.buildroot.net/results/c63e8279de9f033aacb94f4bac1cbceb33d2d949 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 2 
monkey-f54856ce250c4e257354... | 2 
              asterisk-16.21.1 | 1 
              libostree-2020.8 | 1 
               libtheora-1.1.1 | 1 
                 mesa3d-20.3.5 | 1 
                  ndisc6-1.0.4 | 1 
                 openal-1.20.1 | 1 
               openldap-2.4.59 | 1 
   openvmtools-10.3.5-10430147 | 1 
           uboot-tools-2020.04 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |        asterisk-16.21.1        | NOK | http://autobuild.buildroot.net/results/51014e9a47cad500dc075f98cfeba4802f8c8cf4 |     
    m68k     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/bdaab2422c3e9187b18a1ed791d7f91c45e51ca1 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/36fe55fa88d2dd2472d1761a76fd40f228faeb73 |     
    mips     |        libostree-2020.8        | NOK | http://autobuild.buildroot.net/results/14f1cff870f5322350810d8a2729fd2a47a2e7b3 |     
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/7ac2c2c43c51f597caafe8350aa3239da2a9166d | ORPH
    arm      |         mesa3d-20.3.5          | NOK | http://autobuild.buildroot.net/results/4e882b11ee3debaa9b74ea15acf85bc9f161419a |     
    arm      | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/e4bb49b02ecb5482155f2026b527ef68981172fe |     
    arm      | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/803b992736c3b75985a679bd586f1054f57cd39c |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/19244f86c21a334cf395b6c2f72daac61782f342 | ORPH
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/a0a98d274ca48139d2b044ce09f02ef99bc2be7b |     
  riscv32    |        openldap-2.4.59         | NOK | http://autobuild.buildroot.net/results/e3f8ecbdd3d5755f1daf840f26869fb3f24951ca |     
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/026acc7d45f1836f0bde034d0edb51f38d4ed873 |     
    arm      |      uboot-tools-2020.04       | NOK | http://autobuild.buildroot.net/results/9e7938479794fba5eaf22b42b69f57112b68a16d |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/8af4e0d735069ccceac76fdc1b02d1c378cbab10 |     


Classification of failures by reason for 2021.11.x
--------------------------------------------------

              host-erlang-22.2 | 5 
                log4cxx-0.12.0 | 1 
                       unknown | 1 


Detail of failures for 2021.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/0b5ce47d0d1e94016065913b11c2720d50969f47 |     
   x86_64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/10a8920847fc2df0f82bb89d62d81ca24de8328c |     
   x86_64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/d22b59163b0666ab33012acbeb2fd6fa7fa30127 |     
   mipsel    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/1bee2e1ad6bee97f0c4cf572fb320cc6a005e9cd |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/564eabd8125899113e960fdcdd19157bad20ea67 |     
   xtensa    |         log4cxx-0.12.0         | NOK | http://autobuild.buildroot.net/results/9d38cc6d8af874d61390b2daa5eb53f7e1d4e225 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/d39a15f1a2cf4d0e730ddc6e992037468e94a677 |     


Gitlab CI results for 2022-01-27
================================


-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
