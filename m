Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23F8CC47DD9
	for <buildroot@archiver.kernel.org>; Sat, 30 Mar 2024 06:43:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7735281008;
	Sat, 30 Mar 2024 06:43:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XbHLA3nFYACM; Sat, 30 Mar 2024 06:43:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C8E5F81518
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C8E5F81518;
	Sat, 30 Mar 2024 06:43:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0BA011BF311
 for <buildroot@lists.busybox.net>; Sat, 30 Mar 2024 06:43:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EC625405C7
 for <buildroot@lists.busybox.net>; Sat, 30 Mar 2024 06:43:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AqpO2-BUxQgP for <buildroot@lists.busybox.net>;
 Sat, 30 Mar 2024 06:43:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 580F9405AC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 580F9405AC
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 580F9405AC
 for <buildroot@buildroot.org>; Sat, 30 Mar 2024 06:43:41 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B09651BF20C
 for <buildroot@buildroot.org>; Sat, 30 Mar 2024 06:43:38 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sat, 30 Mar 2024 06:43:38 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1711781018; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=nSLHK6nNAc9AjIvRylTdo7uRs6eDTNFqFcG40xWl8Jo=;
 b=gflMO+zLutAISmtqp8dgWJ/3wAfwrM4o/fBNWFPduXSmLhJDSzJuiLGuSH1v+2A+iqWEvv
 nMHQ7PQ0MANk8NsB+2P4WLLXIB9cGGIZ+wRQvKxUI0yAvs25DheCLeFOHUrwLuxZKKtd/1
 OjfqiZqfugi4Ao+McdIwRuCuolw59vepENi420MYG2Zx0WhQL0oNaXWrn3TfOm2YBVOkM3
 vIXU2FC2HpDvbke2MC+xfhisEDUK+NeF9vR4/9aGeLWCs+HyoJGaiJHwrO3PZJADaCTu4i
 qb05wMW1FM0gyAFnAQXuA9cOx5Butwp8WxZhvidylqnJ54h4qoW019pigUH65A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gflMO+zL
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-03-29
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
Message-ID: <20240330064338.CB_pOFJNwZiIqz70wUA55zOSGKKkbJ0d8PGiayXNbhc@z>

Hello,

Autobuild statistics for 2024-03-29
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  8  |  6  |  0  | 14  |
  2023.11.x  |  5  |  7  |  0  | 12  |
  2024.02.x  |  3  |  2  |  0  |  5  |
    master   | 26  | 43  |  0  | 69  |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 5 
                 coreutils-9.3 | 3 
          libcamera-apps-1.2.1 | 3 
                libressl-3.8.2 | 3 
               apcupsd-3.14.14 | 2 
               asterisk-20.5.2 | 2 
dmenu-wayland-a380201dff5bf... | 2 
                   linux-6.8.1 | 2 
                privoxy-3.0.34 | 2 
                    bat-0.24.0 | 1 
                  bitcoin-26.0 | 1 
           crucible-2023.11.02 | 1 
                     crun-1.12 | 1 
             dahdi-linux-3.3.0 | 1 
                  davfs2-1.7.0 | 1 
                     dtc-1.7.0 | 1 
              fftw-quad-3.3.10 | 1 
  gobject-introspection-1.76.1 | 1 
   host-flutter-sdk-bin-3.19.4 | 1 
              libarchive-3.7.2 | 1 
               libglib2-2.76.1 | 1 
             libutempter-1.2.1 | 1 
                   linux-tools | 1 
                     php-8.3.4 | 1 
              php-xdebug-3.2.2 | 1 
         python-rpds-py-0.17.1 | 1 
                 systemd-254.9 | 1 
               tcf-agent-1.8.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/6f6aaf8ed7cd7ea078eb87ffe0f50c272eb56d38 |     
  aarch64    |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/e47fb6da0478a99671f54a8ad886bef684e971cb |     
  riscv64    |        asterisk-20.5.2         | NOK | http://autobuild.buildroot.net/results/d14079ca1587ae1bf7071c9d6015b52ea3c8ed75 |     
    or1k     |        asterisk-20.5.2         | NOK | http://autobuild.buildroot.net/results/4b66acb303cc852c49f28e4ce384638139cef7c8 |     
    i586     |           bat-0.24.0           | NOK | http://autobuild.buildroot.net/results/e1d1d08d9cda39f4d5de62f7fe73df80712b652c |     
    m68k     |          bitcoin-26.0          | NOK | http://autobuild.buildroot.net/results/65ffe58e5e2b6de5e07f7058d3f8182ef099ab46 |     
    arm      |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/b645c78fe01fdd17ce646d18d2ca9b979d53e552 | ORPH
microblazeel |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/080efbb78fb5f76fe687d884636e95c9872047af | ORPH
    sh4      |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/813742f5d582727d5cddedc676fcec9e6febbd3b | ORPH
  riscv64    |      crucible-2023.11.02       | NOK | http://autobuild.buildroot.net/results/c9e21f58d0cfefcd1a127df79f2f3d9271bfe6be |     
    arc      |           crun-1.12            | NOK | http://autobuild.buildroot.net/results/fb6cf6397822b3d993b90fad0cf9dc45b615484e |     
  sparc64    |       dahdi-linux-3.3.0        | NOK | http://autobuild.buildroot.net/results/9f7f574bf6f50d6372af151c5c784053303a7655 |     
  powerpc    |          davfs2-1.7.0          | NOK | http://autobuild.buildroot.net/results/84184b72f80f1f711c3d71284ed5fe10a93a67a8 | ORPH
    or1k     | dmenu-wayland-a380201dff5bf... | NOK | http://autobuild.buildroot.net/results/8be058ea0911aeceef5510b959616dc337ca1aba |     
  powerpc    | dmenu-wayland-a380201dff5bf... | NOK | http://autobuild.buildroot.net/results/f5ac4548af7c3c9bf8b1746e9c20953229881e47 |     
    arm      |           dtc-1.7.0            | NOK | http://autobuild.buildroot.net/results/c883a1b3ee37b6dacb7522941e82903cc6687f31 |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | http://autobuild.buildroot.net/results/6f27759f0268545fdd94535574ac88c14b3e7a7c | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/05ca4515b2d5eef02c5dbddc5b8bf60fe291dcf6 | ORPH
    or1k     |  host-flutter-sdk-bin-3.19.4   | NOK | http://autobuild.buildroot.net/results/e9994916d124533a3f824ad2268fdadf9eabb6a9 |     
powerpc64le  |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/310e692dd6b91bbd3ef10c5e8420ccc65397fecb |     
    i586     |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/33578878587f8d1fe7b0c85672339ea01d95fee8 |     
    i686     |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/ec3bdc58158b1e44b147813558cda8b3179eb0b5 |     
   sparc     |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/207aa1d219fe5f18eeddf9625bce0b5471c5afc8 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/d6cae039e34f363b740feca3cad7d9f3e04cf2f8 |     
   mipsel    |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/71ac13aca5572738bfbd38045fa84100db87858a | ORPH
  powerpc    |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/4496063701ffe3e41855926941626a3c993956e2 | ORPH
  mips64el   |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/096011e14917685f994401b9c6565eb6a740e7a6 | ORPH
    m68k     |       libutempter-1.2.1        | NOK | http://autobuild.buildroot.net/results/a1919124033b46c4cfe789bfb92d92b384aca99a |     
 aarch64_be  |          linux-6.8.1           | NOK | http://autobuild.buildroot.net/results/53c980f06e1f1a33c53e33193df803d111ebcd50 | ORPH
   x86_64    |          linux-6.8.1           | NOK | http://autobuild.buildroot.net/results/2fce39cf851780d4a07a13ad622efa676c267e5b | ORPH
   sparc     |          linux-tools           | NOK | http://autobuild.buildroot.net/results/26207734c29ad734af89ae993f591217ce138cf5 | ORPH
    arm      |           php-8.3.4            | NOK | http://autobuild.buildroot.net/results/a4ef648a9da50b26ed56d5d490e4cf5a1bfff970 |     
powerpc64le  |        php-xdebug-3.2.2        | NOK | http://autobuild.buildroot.net/results/0209b522baec3c88a2060e79f805552db79b2c70 |     
    arc      |         privoxy-3.0.34         | NOK | http://autobuild.buildroot.net/results/2422f5b35ae781b1a49a3c625e0b7a482880f8da |     
   s390x     |         privoxy-3.0.34         | NOK | http://autobuild.buildroot.net/results/e9bc99185bd75fa3e2fefcc2f84d9af185d1bad8 |     
    arm      |     python-rpds-py-0.17.1      | NOK | http://autobuild.buildroot.net/results/2ae1d21fc66ae22a3a7d09b0eb4c147fdb8a9a62 |     
   mipsel    |         systemd-254.9          | NOK | http://autobuild.buildroot.net/results/12b6c67a19308c2d0615fc9941219de478b7f161 |     
  powerpc    |        tcf-agent-1.8.0         | NOK | http://autobuild.buildroot.net/results/f9841efa0af2797b8bede3982d6f7244e9e4a688 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/f665636a41d55a4e0babec8b2980792b237ec946 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/0ad9867cba550854146dd14897c53cc98cd291c5 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/6457414dd4ac92fce511eb34f74f860663a8402d |     
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.net/results/2371db9ddd5461b0d220ce5424a45fe14d516916 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/667a8a9d522fa7e9f5d212c27057ddca88ac61c0 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                   bird-2.0.12 | 1 
 glslsandbox-player-2021.08.24 | 1 
               gupnp-av-0.14.0 | 1 
              host-rust-1.67.1 | 1 
         nftables-python-1.0.7 | 1 
               zxing-cpp-1.4.0 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/6308c53c53100a40da59ea4ab4b2fae580fce3f8 |     
    arm      | glslsandbox-player-2021.08.24  | NOK | http://autobuild.buildroot.net/results/ca0371f1607fef5013dc250dc26b1865327de35c |     
   mipsel    |        gupnp-av-0.14.0         | NOK | http://autobuild.buildroot.net/results/9609ccdd0e9efabcbbe169f82d71a2beb7c1c2f5 |     
powerpc64le  |        host-rust-1.67.1        | NOK | http://autobuild.buildroot.net/results/30d38fe2bf1e5e2689753627cb61d1e313a6e6e3 |     
   nios2     |     nftables-python-1.0.7      | NOK | http://autobuild.buildroot.net/results/5bc8fa768678ea99544b5e7625a23dc0a138aa48 |     
    arm      |        zxing-cpp-1.4.0         | NOK | http://autobuild.buildroot.net/results/014140f229a386007f12dccae2ec0d26fde3db74 |     


Classification of failures by reason for 2023.11.x
--------------------------------------------------

  binutils-arc-2020.09-release | 1 
                  cairo-1.16.0 | 1 
            freeswitch-1.10.11 | 1 
                 openssh-9.6p1 | 1 
                oprofile-1.4.0 | 1 
pistache-3ec9d7c4f8b828fdd3... | 1 
                sysrepo-2.2.36 | 1 


Detail of failures for 2023.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/ee6ebe33730e5c01f2c34b232937cf6aa3a1d853 |     
   xtensa    |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/01b2fa088698833d2a5d8cc7f4b75c2dd0f8ad26 |     
  aarch64    |       freeswitch-1.10.11       | NOK | http://autobuild.buildroot.net/results/23c9fa599f766d0a16a7936201ae11b4b2551391 |     
    mips     |         openssh-9.6p1          | NOK | http://autobuild.buildroot.net/results/152389585b8da9f5f11ab4ad490d81490dd92bbf | ORPH
    arm      |         oprofile-1.4.0         | NOK | http://autobuild.buildroot.net/results/2e61f51c791bbb5d0b09ac09d30eabc4c3838122 |     
    m68k     | pistache-3ec9d7c4f8b828fdd3... | NOK | http://autobuild.buildroot.net/results/3ffb2a89ba8785aa29539f9ad640a34fcf13fbd8 | ORPH
  riscv32    |         sysrepo-2.2.36         | NOK | http://autobuild.buildroot.net/results/0738368756106ec7e5ec5bf45077592dd01f03b1 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

dmenu-wayland-a380201dff5bf... | 1 
              fftw-quad-3.3.10 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    | dmenu-wayland-a380201dff5bf... | NOK | http://autobuild.buildroot.net/results/123de9869df62e7279e34004cf37baae46e674b4 |     
 powerpc64   |        fftw-quad-3.3.10        | NOK | http://autobuild.buildroot.net/results/315af177caf5572428140ed86c453336013691f1 | ORPH


Gitlab CI results for 2024-03-29
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
       acmesystems_aria_g25_128mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/6498277903  |      
       acmesystems_aria_g25_256mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/6498277904  |      
    acmesystems_arietta_g25_128mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/6498277905  |      
    acmesystems_arietta_g25_256mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/6498277910  |      
                   armadeus_apf27 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6498277919  |      
                   armadeus_apf28 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6498277921  |      
                   armadeus_apf51 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6498277924  |      
                  at91sam9260eknf | https://gitlab.com/buildroot.org/buildroot/-/jobs/6498277936  |      
                   at91sam9g20dfc | https://gitlab.com/buildroot.org/buildroot/-/jobs/6498277938  |      
                 at91sam9g45m10ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/6498277939  |      
                     at91sam9rlek | https://gitlab.com/buildroot.org/buildroot/-/jobs/6498277940  |      
                     at91sam9x5ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/6498277941  |      
                 at91sam9x5ek_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/6498277942  |      
                 at91sam9x5ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/6498277943  |      
             at91sam9x5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/6498277944  |      
                 atmel_sama5d3xek | https://gitlab.com/buildroot.org/buildroot/-/jobs/6498277955  |      
                        avenger96 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6498277961  |      
                 bananapi_m2_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/6498277968  |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/6498277971  | ORPH 
                   beagleboardx15 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6498277972  |      
                   beaglebone_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6498277975  |      
                          beaglev | https://gitlab.com/buildroot.org/buildroot/-/jobs/6498277978  |      
                      beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6498277980  |      
                  chromebook_snow | https://gitlab.com/buildroot.org/buildroot/-/jobs/6498277986  |      
                             ci20 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6498277987  |      
                      cubieboard2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6498277988  |      
            engicam_imx6qdl_icore | https://gitlab.com/buildroot.org/buildroot/-/jobs/6498277989  |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6498277992  |      
        engicam_imx6qdl_icore_rqs | https://gitlab.com/buildroot.org/buildroot/-/jobs/6498278001  |      
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/6498278002  |      
             engicam_imx6ul_isiot | https://gitlab.com/buildroot.org/buildroot/-/jobs/6498278004  |      
               freescale_imx28evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/6498278005  |      
           friendlyarm_nanopi_r2s | https://gitlab.com/buildroot.org/buildroot/-/jobs/6498278031  |      
                         imx23evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/6498278039  |      
                        imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/6498278064  |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/6498278068  |      
                         lego_ev3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6498278072  |      
                  mangopi_mq1rdw2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6498278078  |      
                          mx25pdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/6498278115  |      
                         mx6cubox | https://gitlab.com/buildroot.org/buildroot/-/jobs/6498278122  |      
              octavo_osd32mp1_brk | https://gitlab.com/buildroot.org/buildroot/-/jobs/6498278137  |      
              octavo_osd32mp1_red | https://gitlab.com/buildroot.org/buildroot/-/jobs/6498278139  |      
                        odroidxu4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6498278141  |      
          olimex_imx233_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/6498278150  |      
                    openblocks_a6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6498278155  |      
                    orangepi_lite | https://gitlab.com/buildroot.org/buildroot/-/jobs/6498278157  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6498278156  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/6498278160  |      
                      orangepi_pc | https://gitlab.com/buildroot.org/buildroot/-/jobs/6498278163  |      
                      orangepi_r1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6498278167  |      
                           pine64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6498278185  |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/6498278188  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/6509229828  | ORPH 
                raspberrypizero2w | https://gitlab.com/buildroot.org/buildroot/-/jobs/6509232201  |      
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/6509232478  |      
                           rock5b | https://gitlab.com/buildroot.org/buildroot/-/jobs/6509232669  |      
                           rock64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6509232704  |      
                       rock_pi_n8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6509232745  |      
                       sheevaplug | https://gitlab.com/buildroot.org/buildroot/-/jobs/6509233037  |      
             sipeed_licheepi_nano | https://gitlab.com/buildroot.org/buildroot/-/jobs/6509233225  |      
             sipeed_licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/6509233284  |      
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6509237693  |      
                 snps_arc700_nsim | https://gitlab.com/buildroot.org/buildroot/-/jobs/6509238513  | ORPH 
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6509242655  |      
                solidrun_clearfog | https://gitlab.com/buildroot.org/buildroot/-/jobs/6509243288  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6509246904  |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6509246994  |      
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6509247097  |      
                      visionfive2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6509247313  |      
                        wandboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/6509247509  |      
                        warpboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/6509247705  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
