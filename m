Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D792FE93700
	for <buildroot@archiver.kernel.org>; Thu,  5 Oct 2023 05:46:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2FCF28232B;
	Thu,  5 Oct 2023 05:46:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2FCF28232B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DBwI5MUoIcq8; Thu,  5 Oct 2023 05:46:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 521B282540;
	Thu,  5 Oct 2023 05:46:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 521B282540
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B15BB1BF41F
 for <buildroot@lists.busybox.net>; Thu,  5 Oct 2023 05:46:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8EE28408BC
 for <buildroot@lists.busybox.net>; Thu,  5 Oct 2023 05:46:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8EE28408BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IaisQ9S9mmDg for <buildroot@lists.busybox.net>;
 Thu,  5 Oct 2023 05:45:58 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3DBC240734
 for <buildroot@buildroot.org>; Thu,  5 Oct 2023 05:45:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3DBC240734
Received: by mail.gandi.net (Postfix) with ESMTPSA id 438BC1BF20C
 for <buildroot@buildroot.org>; Thu,  5 Oct 2023 05:45:55 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Thu, 05 Oct 2023 05:45:55 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20231005054600.8EE28408BC@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1696484755; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=GCZrv3tXAQ841zPNdb3bdRBs9rth249Q81fXM1GBVMY=;
 b=QfJxGgQ7lxrPX/866DapBrttzyNSAJXEXdGSsehe9f3hSh13z7hfFwor3caFBlX36MUJDu
 VvJP5rI7S09qSsG+z3lrgAMJx+jaDUYjS0tIpZ1vvwHQ8yztBlGbjNvrCwuJcocxstFXhS
 0+uXUm2zwjqGJsuFu9Bq6HUIC+sHtIujQFjC4WUGuUfFwqqWe7NqTB18bBw3Zaa/IQPKEW
 +NsmlYRn6Z0RX9y4eUFKc9BBC6BG2wE+dv+3tBk+7GXyEeE2RffJmrAoKsDB/MtXv0nLMB
 R9pgxjrmMYatuC9lTTHna4QdcaPuJlID0GVoeYks2erkFUbTc/mFPWttkvQ6uA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QfJxGgQ7
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-10-04
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

Autobuild statistics for 2023-10-04
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  | 22  | 11  |  0  | 33  |
  2023.08.x  | 16  | 10  |  0  | 26  |
    master   | 89  | 150 |  0  | 239 |

Classification of failures by reason for master
-----------------------------------------------

                 openrc-0.43.3 | 13
                       unknown | 12
              gcc-final-12.3.0 | 9 
               alsa-lib-1.2.10 | 8 
  gobject-introspection-1.76.1 | 8 
                  monit-5.33.0 | 8 
             alsa-utils-1.2.10 | 7 
                   bird-2.0.12 | 5 
         spirv-tools-1.3.261.1 | 4 
                   linux-6.5.5 | 3 
                   perl-5.36.1 | 3 
                     squid-6.2 | 3 
             util-linux-2.39.2 | 3 
                xenomai-3.0.10 | 3 
               apcupsd-3.14.14 | 2 
                elfutils-0.189 | 2 
                     frr-8.4.2 | 2 
              gcc-final-13.2.0 | 2 
                host-go-1.21.1 | 2 
              host-rust-1.71.1 | 2 
        host-sentry-cli-2.20.3 | 2 
               mariadb-10.11.4 | 2 
                 netsnmp-5.9.4 | 2 
                     pv-1.6.20 | 2 
                 tbb-2021.10.0 | 2 
android-tools-4.2.2+git2013... | 1 
                    brltty-6.5 | 1 
check-11970a7e112dfe243a2e6... | 1 
                 coreutils-9.3 | 1 
                    crun-1.8.4 | 1 
          cryptodev-linux-1.13 | 1 
                     efivar-38 | 1 
                   ethtool-6.5 | 1 
                  ffmpeg-4.4.4 | 1 
              fftw-quad-3.3.10 | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
              gcc-final-11.4.0 | 1 
 gcc-final-arc-2020.09-release | 1 
glibc-2.38-13-g92201f16cbcf... | 1 
 glslsandbox-player-2023.04.05 | 1 
google-breakpad-c85eb4a59b6... | 1 
         host-gcc-final-12.3.0 | 1 
      host-python-numpy-1.25.0 | 1 
              libarchive-3.7.2 | 1 
               libdeflate-1.18 | 1 
               libglib2-2.76.1 | 1 
               libgpgme-1.22.0 | 1 
              libostree-2023.6 | 1 
                libressl-3.7.3 | 1 
                libselinux-3.5 | 1 
   libtorrent-rasterbar-1.2.15 | 1 
               libunwind-1.6.2 | 1 
                   libzlib-1.3 | 1 
                  ntp-4.2.8p17 | 1 
                 ntpsec-1.2.2a | 1 
              open-iscsi-2.1.9 | 1 
                 openal-1.22.0 | 1 
pistache-3ec9d7c4f8b828fdd3... | 1 
                    pppd-2.5.0 | 1 
             strongswan-5.9.11 | 1 
                      tar-1.35 | 1 
                tpm2-tss-3.2.2 | 1 
                 wolfssl-5.6.3 | 1 
               xwayland-23.1.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/8d574b33c204eb416f11e16950c2736e0a6374bb |     
    arm      |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/9c7b4e49a32e94b78c51c09ce69b89fe904a2e66 |     
 microblaze  |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/7e4b22e5b30877795603cab2b2e190cf31978483 |     
  aarch64    |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/7bc6bcace3f4c57ecbd495fc5df51c661473c027 |     
  powerpc    |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/0a257d15d23344d794fa3ddbc0059186f7c3dbc6 |     
   x86_64    |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/8f61d942a8c70cfcb6067cef176fc49037290e3e |     
    mips     |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/f14a15fc1de19773bb8ef19fd8fef2f0fc050ed8 |     
    mips     |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/7e5410aa1286fd8f4c7ab1e27c7bd7053dfffe17 |     
   x86_64    |       alsa-utils-1.2.10        | NOK | http://autobuild.buildroot.net/results/d3199f29bd6b86fb49bcfa0fb8571edeb709adb2 |     
  aarch64    |       alsa-utils-1.2.10        | NOK | http://autobuild.buildroot.net/results/67674f7e719f94229defa15334612255191a4ea2 |     
   mips64    |       alsa-utils-1.2.10        | NOK | http://autobuild.buildroot.net/results/3eae8f23088c735c3b797338e182e5e66bf0f7b0 |     
    mips     |       alsa-utils-1.2.10        | NOK | http://autobuild.buildroot.net/results/36b9709f124f1771e6051580786202daf4642be7 |     
    sh4a     |       alsa-utils-1.2.10        | NOK | http://autobuild.buildroot.net/results/f9eb4db4b9f7c943bf660025c44b36e5c6167c3f |     
   sh4eb     |       alsa-utils-1.2.10        | NOK | http://autobuild.buildroot.net/results/92efbfd03c73b5e605e5b51823de6800134d3bb5 |     
   nios2     |       alsa-utils-1.2.10        | NOK | http://autobuild.buildroot.net/results/a7f858889f28c616c66c4ea0cb995c6594468ae9 |     
powerpc64le  | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/f1fa6bf6478da9a3d14f9720db23d6342da663a5 |     
   arceb     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/dda0f03aac3697251ef0c7e471fa5429b074e806 |     
    m68k     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/4c3981f391d011631ea80416a8dac879064ff2c0 |     
 aarch64_be  |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/cda2b79abb7c59d3a3cb04f1a2fc083124b957a8 |     
powerpc64le  |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/6b4c02269c1cb86abe383cd7982e19c363e4de91 |     
 aarch64_be  |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/69a22b1a688935abb00338e507e262bb4d0ccab4 |     
    or1k     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/a0e2e66d5d88e615b9a6bd4d120dcb281d1839ab |     
    sh4      |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/cfe901fe5912cb21745fee161e132a6c96fab512 |     
    arm      |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/e1113e26b54ae87b5b326b241ab4b79c685c812e |     
   arceb     | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/adc0778aeff3f20d609202b9738acde4ff1cb5f7 | ORPH
  powerpc    |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/4aa7d3fc5868fabb5d66836d9d023b3170779c6f | ORPH
   sparc     |           crun-1.8.4           | NOK | http://autobuild.buildroot.net/results/88527a3f8d0dcfe205ce597d83fdbb4f72144302 |     
   sh4eb     |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.net/results/cc390f1ecee63aa19f9191c6956dba84a3aa898b | ORPH
    i686     |           efivar-38            | NOK | http://autobuild.buildroot.net/results/27bf1067f04a191c23fac3d2e7224e8a92150832 |     
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/7fcba02cf46f055b5e7ce6f37e54473e9c9364b2 | ORPH
   nios2     |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/1ec9cbb424af93f596ff4d9d58ec1f39920d53f1 | ORPH
  mips64el   |          ethtool-6.5           | NOK | http://autobuild.buildroot.net/results/4bcd44fbb12b10241d5594db9fa514fab7d3e4f9 |     
    arc      |          ffmpeg-4.4.4          | NOK | http://autobuild.buildroot.net/results/86c5f7804bd1aa05357430b1a87902d095d2f4dc |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | http://autobuild.buildroot.net/results/baff574b5448cf220de5bc9a7ac3a3c59ffd0252 | ORPH
    arc      |           frr-8.4.2            | NOK | http://autobuild.buildroot.net/results/5942e79f769ec26b2bfc8207a732ff759a1e3c35 |     
   xtensa    |           frr-8.4.2            | NOK | http://autobuild.buildroot.net/results/7fd33ea64b75ef9153143a9b53740cc2897f7db3 |     
  aarch64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/55b794571565aa9dcd1149b461242a34a0cbf1a8 |     
    m68k     |        gcc-final-11.4.0        | NOK | http://autobuild.buildroot.net/results/f1b8e041584c4117be1058ce4cb03961f3ccdf25 |     
  riscv64    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/f6b57780a386e4d95bfa7e6c8926d3469f7b4a9d |     
  riscv64    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/4f5f2744842ab7c5228c13aa7f683c90186a3547 |     
  riscv64    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/f32835b7523fbb89e6f562b2d8f4c67257632852 |     
    m68k     |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/187a108f97a1636b5eb393e9f244f0211bf56875 |     
    m68k     |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/4be77a5feea57b4bc00cefe1386895031cc9f7c9 |     
  riscv64    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/bb1465cac9cecd459afa3dfa15eaaa897b00fb80 |     
  riscv64    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/7e1d86ccda1ae41bce62372c7501225211897e9e |     
   x86_64    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/8bed14e7bdac490c321814a9558edeef3484e703 |     
  riscv64    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/33425602e3d6b47294d67592de086023aa132046 |     
   arceb     |        gcc-final-13.2.0        | NOK | http://autobuild.buildroot.net/results/3d47b47b69a64787441d5f7f8e76a4a41ef01ead |     
    arc      |        gcc-final-13.2.0        | NOK | http://autobuild.buildroot.net/results/885c4dfba6feb54ba9e7019a07aba6c719ceead2 |     
    arc      | gcc-final-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/a259c9b18bdebcf7e1cf50f7f914d9b0a2eaf1cc |     
  powerpc    | glibc-2.38-13-g92201f16cbcf... | NOK | http://autobuild.buildroot.net/results/52392f2e34077823f32c45a087c8f6b39222a3b4 |     
    arm      | glslsandbox-player-2023.04.05  | NOK | http://autobuild.buildroot.net/results/f1efcee31b953d5aedf60ba3a1925b40cd5d5654 |     
   nios2     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/2c8f601f0beacf3d9c733b66c736e7590abe4a12 | ORPH
   nios2     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/eff1b1a17a25b894eed11d7c29f9e5945f7308e3 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/7b434d93326236883f892130cbc61bfa648bf798 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/2120e7c4b06836d977de9db259b3708f0dd23629 | ORPH
   nios2     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/e22cae378741a45ea396ea96fd7548b93753f3a6 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/5e19167b85b733b1f3b3dd72fc5f233066347c4e | ORPH
    i686     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/17e8e076cf1fe8a8829c67f674988005c1f55eaf | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/803cf9dc49d3d546016ebafe4af36ca62ddb4afe | ORPH
    mips     | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/fb0c7183966a5f5e9e9b1d02a0af7ace7770c812 |     
 microblaze  |     host-gcc-final-12.3.0      | NOK | http://autobuild.buildroot.net/results/7da5b40a6d915ee8a4941c51fe75bec54a83c77b |     
   mips64    |         host-go-1.21.1         | NOK | http://autobuild.buildroot.net/results/da95f59bc97fd89c3cf32a440f62740564d7a765 |     
  mips64el   |         host-go-1.21.1         | NOK | http://autobuild.buildroot.net/results/595bd3fcb1d3d953932bc9a02343e5c1633d6764 |     
   x86_64    |    host-python-numpy-1.25.0    | NOK | http://autobuild.buildroot.net/results/5082b0329fe78643e6b4f02922e5fce13c3e23be |     
   mipsel    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/71c398151fe6c578a15d3135b73e3ee79f6fe055 |     
 powerpc64   |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/54624637d049da170069b88e161c8f8f29d38773 |     
  powerpc    |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/623cc85483fe15a4e3f62e205a689bf5ff411093 |     
   nios2     |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/d922531d6d7ae8b9609ca340dbd9a94c1875ff8a |     
 microblaze  |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/5a5096eb6109e96021609861419b5af79dc7e50e |     
   armeb     |        libdeflate-1.18         | NOK | http://autobuild.buildroot.net/results/a9a33cec2d7e734f734119201a924f1d1cf18502 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/d4ad2dc960bcc91ce0c4ab1f8def8d4b6c18f0cd |     
    sh4a     |        libgpgme-1.22.0         | NOK | http://autobuild.buildroot.net/results/dcf4b8f0b804779fa408230e067191251c39df8b | ORPH
  sparc64    |        libostree-2023.6        | NOK | http://autobuild.buildroot.net/results/5c7e1e47c6eb43f7832ef7820ec2b5ac0f3c3696 |     
   armeb     |         libressl-3.7.3         | NOK | http://autobuild.buildroot.net/results/4e58db855863c8f76a212a7c3e74282ad4901b64 | ORPH
   nios2     |         libselinux-3.5         | NOK | http://autobuild.buildroot.net/results/294c36b4e2bc007cb7551d983c79047889181bab |     
    arm      |  libtorrent-rasterbar-1.2.15   | NOK | http://autobuild.buildroot.net/results/de33c8e94962d5ed61b1b3e8cc742d3d49dd0ff8 |     
    mips     |        libunwind-1.6.2         | NOK | http://autobuild.buildroot.net/results/dee2a9020cc6284bf6c60929fa717310929c65ca | ORPH
   mips64    |          libzlib-1.3           | NOK | http://autobuild.buildroot.net/results/a5e668048ec9078cf43ba1a3427c01983db9e416 | ORPH
    mips     |          linux-6.5.5           | NOK | http://autobuild.buildroot.net/results/be699cbc444ad80eae932dcb2f8be42baf01b04d | ORPH
   mipsel    |          linux-6.5.5           | NOK | http://autobuild.buildroot.net/results/6fff4d6c0986ae3691504bd3e22923629723e6bb | ORPH
    mips     |          linux-6.5.5           | NOK | http://autobuild.buildroot.net/results/c1f1906742a7645c90555e036a6cc0cc46f30c32 | ORPH
    or1k     |        mariadb-10.11.4         | NOK | http://autobuild.buildroot.net/results/a3a9cb7605fc0916c5feb26a1e94d41d1c5d3353 | ORPH
   mipsel    |        mariadb-10.11.4         | NOK | http://autobuild.buildroot.net/results/fa2e4a52c8047c620a96fb981d3053e4359ed443 | ORPH
    mips     |          monit-5.33.0          | NOK | http://autobuild.buildroot.net/results/e5b607a24e313344abda5e77c00368e8b6b2172f |     
    arm      |          monit-5.33.0          | NOK | http://autobuild.buildroot.net/results/6aa4fbe42617c9a1e2e7da3125d7149311f06734 |     
    arc      |          monit-5.33.0          | NOK | http://autobuild.buildroot.net/results/f9aa07c88be7882629ade7ea0af2a0db40f3be92 |     
   x86_64    |          monit-5.33.0          | NOK | http://autobuild.buildroot.net/results/6eb671eb5d97a0c18e87dab33e6021b9d9b0916a |     
 microblaze  |          monit-5.33.0          | NOK | http://autobuild.buildroot.net/results/23c92af7b7df94adb69530bf2f45604082f8c129 |     
   x86_64    |          monit-5.33.0          | NOK | http://autobuild.buildroot.net/results/446abd38f1ef836394fef34dc18932db26786d56 |     
    mips     |          monit-5.33.0          | NOK | http://autobuild.buildroot.net/results/30cf02547ed96f9660a5534ef9fe6c5418297d62 |     
 aarch64_be  |          monit-5.33.0          | NOK | http://autobuild.buildroot.net/results/7d7d3a759346efe7c94ce059d048b11cd659f0ec |     
 microblaze  |         netsnmp-5.9.4          | NOK | http://autobuild.buildroot.net/results/7d5944da62a33b9cade9eaf622c0ad7e53ba1b16 | ORPH
  powerpc    |         netsnmp-5.9.4          | NOK | http://autobuild.buildroot.net/results/e2be3ee2c7fcc5e3d870c18638fca24b1f21290d | ORPH
   sh4aeb    |          ntp-4.2.8p17          | NOK | http://autobuild.buildroot.net/results/2b2bdcc391dd76aaaa84ad8d1edb90df54abda3e |     
microblazeel |         ntpsec-1.2.2a          | NOK | http://autobuild.buildroot.net/results/f8b0173fa7f5abe55a7e224be0b8da78ddebc305 | ORPH
 aarch64_be  |        open-iscsi-2.1.9        | NOK | http://autobuild.buildroot.net/results/1830cdcd0ee8bc8f6aa2466efa01a39a630858ff |     
    mips     |         openal-1.22.0          | NOK | http://autobuild.buildroot.net/results/0812b4f36fedb5ed46a7fd40fe260567f1525176 | ORPH
   mips64    |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/e1967d006f9990de3dc6be4843f974dd5c6c02fb |     
    sh4a     |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/37922e62265de6ea9e4fd3eb666b9a02e647fe26 |     
   nios2     |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/c570c0e386b50d3c5f6351d4744a87715c388941 |     
 aarch64_be  |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/6b02f836024b7b4f6429780c2ccea5b044c4ce26 |     
   x86_64    |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/bdf21613f1253ca872e53b3eee458db4d62f994f |     
    sh4      |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/abdba77b093647930a70cd3e09a2a1e223767050 |     
 powerpc64   |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/ef1f51dd29cd6604ec0e5e0ed7176173940934a0 |     
   s390x     |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/39eb1e4068dcf260f38b523ac1082a1296e9de68 |     
 powerpc64   |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/17fcf3fae5e0f6d3548d7c2b9c261ebe9095288c |     
   x86_64    |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/0836ade0246dd35fc0b6e2726810984ac8dcd8fa |     
   s390x     |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/089de0a21086afdc94bae15ee0e0691ed1c83288 |     
  mips64el   |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/95eca9881d328fcc0fee76e71ff22a51d89a7955 |     
  powerpc    |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/cdfe94fc3d554a13ca6fa96c54bf89866a262add |     
   mips64    |          perl-5.36.1           | NOK | http://autobuild.buildroot.net/results/31819a663e6a11a09901cfcad4d73394da2eb6a2 |     
   arceb     |          perl-5.36.1           | NOK | http://autobuild.buildroot.net/results/99071d132f1ffa25acd4a03236b996985aa05ccb |     
   armeb     |          perl-5.36.1           | NOK | http://autobuild.buildroot.net/results/b71c129005d4d5056e49cd04482dd6baa291a780 |     
  riscv32    | pistache-3ec9d7c4f8b828fdd3... | NOK | http://autobuild.buildroot.net/results/81f7642c2dac449271c22e737b1b8e27150047ad | ORPH
  sparc64    |           pppd-2.5.0           | NOK | http://autobuild.buildroot.net/results/049d372da326becb6a7a8ddeffe5a5b936a78204 |     
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/07005d1e49eb10490d65e9d4bb8a1a091dd9602f | ORPH
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/af7031e2aff4f2a37090dc87b4414a833a9f310f | ORPH
    m68k     |     spirv-tools-1.3.261.1      | NOK | http://autobuild.buildroot.net/results/19342a49d5b807b96f3cb2e113d3cade146225f3 | ORPH
   mipsel    |     spirv-tools-1.3.261.1      | NOK | http://autobuild.buildroot.net/results/8469555f43c60739f23f32c61d4430c08553991c | ORPH
   nios2     |     spirv-tools-1.3.261.1      | NOK | http://autobuild.buildroot.net/results/404cdc0844f052e3aaf9a4f81420c51c4e2481e9 | ORPH
 aarch64_be  |     spirv-tools-1.3.261.1      | NOK | http://autobuild.buildroot.net/results/5d88549f5dff028459646283c276ff39a7d429cc | ORPH
   sparc     |           squid-6.2            | NOK | http://autobuild.buildroot.net/results/8b7cd69f3f7c0d966be98a2a359a9a6706f010ad | ORPH
   nios2     |           squid-6.2            | NOK | http://autobuild.buildroot.net/results/2a78ff4119005110ce82a9031271c794ddbe13ce | ORPH
    arc      |           squid-6.2            | NOK | http://autobuild.buildroot.net/results/bf405fa190c7c85842c16ab94d6af07c528000cb | ORPH
    sh4a     |       strongswan-5.9.11        | NOK | http://autobuild.buildroot.net/results/d6f70df6c5b4cd88d394c777c359274306b245b5 |     
    arm      |            tar-1.35            | NOK | http://autobuild.buildroot.net/results/d3f498fbffa8b533b8d914c426e7262cceca7cf6 | ORPH
    or1k     |         tbb-2021.10.0          | NOK | http://autobuild.buildroot.net/results/588418a71d4d052338df6cbcab30b25fb11482a6 |     
    arc      |         tbb-2021.10.0          | NOK | http://autobuild.buildroot.net/results/03686ddde96537fe40c68fa773441e2cf7486d36 |     
   mips64    |         tpm2-tss-3.2.2         | NOK | http://autobuild.buildroot.net/results/e4a3a43c8a79c96fc911ad95209824e4b8e2c1a7 | ORPH
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/e34c40fab3aebcc462b739a1120ac664866977f1 |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/8b81da3e1b0cabd7e83e2d849f06344adabb3ef8 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/5622d45cc25f1fef07a8d9e459002963589ab445 |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/d5d758a4f986cd7af6fc3128beb592a86e4f3f25 |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/b6e45c742f9648d975ced73cf0a6332206fb35d0 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/36eb257c3d72220af078ae5b60326911b5150f35 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/8e68b92ce0cd58e34b49fad946a806fbe5f49cf8 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/6f06ba0ace72dbd68d6ed83a8ed9ec175a730076 |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/86d2b931c0b9a7600f031e5c25783994d6fd1c85 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/ef035372812ce14e5566cc14a26b01f179e3383a |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/8992a40f37052bc87fad383bb664784c5d90b4dd |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/23f8b50a6d573516fe678272cc1c638030ea89c1 |     
   arceb     |       util-linux-2.39.2        | NOK | http://autobuild.buildroot.net/results/d0aa23a6355b95c66dd631043847209d5c39933d | ORPH
    arm      |       util-linux-2.39.2        | NOK | http://autobuild.buildroot.net/results/bdadd5653019f4def332dbd1233c7d05e9f46e21 | ORPH
    arm      |       util-linux-2.39.2        | NOK | http://autobuild.buildroot.net/results/136d20129bd63d23883a559ea520da0b699970f2 | ORPH
    arm      |         wolfssl-5.6.3          | NOK | http://autobuild.buildroot.net/results/449ff36fe62c51dc6046b3b1b8f61d858adb5bfc |     
    arm      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/b6c3b1961f185b5d6aad506b0b7be656e9b1abd4 |     
microblazeel |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/aa904080f91e664f2b9ff5ed222fe09a45f593e2 |     
  powerpc    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/6b1329d74614bb768ef92e19d7cc25deed0f45ed |     
 aarch64_be  |        xwayland-23.1.1         | NOK | http://autobuild.buildroot.net/results/d40b03e7f30b04484b21ec9e4860f40d50573f44 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                   bird-2.0.12 | 2 
              host-rust-1.67.1 | 2 
                elfutils-0.186 | 1 
                  linux-6.1.55 | 1 
               madplay-0.15.2b | 1 
                  motion-4.5.1 | 1 
           python-numpy-1.23.5 | 1 
                 uclibc-1.0.44 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/20ebfc26467750e0a0320f8d6a2d0af3a078ee13 |     
    mips     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/c5b41aba8f6e2d54f15b61d7a2828ffb638c69c8 |     
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/9fb238aafa5ff7a3c659932426728b95fc1e1295 | ORPH
 powerpc64   |        host-rust-1.67.1        | NOK | http://autobuild.buildroot.net/results/98e55f7c4540fa35f4add7452f294f2e86a4465f |     
   x86_64    |        host-rust-1.67.1        | NOK | http://autobuild.buildroot.net/results/d25983e276febd7d9accfb758d7f6c87a07fd7e7 |     
  powerpc    |          linux-6.1.55          | NOK | http://autobuild.buildroot.net/results/d0e8d97b300361f17ce17d759a5479eb8c7eac25 | ORPH
   armeb     |        madplay-0.15.2b         | NOK | http://autobuild.buildroot.net/results/091e1cfd7b4106b02844a665de29181822340fc7 | ORPH
  sparc64    |          motion-4.5.1          | NOK | http://autobuild.buildroot.net/results/92cc0c5a717ff53b742171bc3f9fdfb1d369e250 |     
    mips     |      python-numpy-1.23.5       | NOK | http://autobuild.buildroot.net/results/b0c9787ab704e77e2ebe7b33be886d7739e2382e |     
  riscv64    |         uclibc-1.0.44          | NOK | http://autobuild.buildroot.net/results/7d89f0c7a7c02ed59941174fb3dd860fc4f18de6 |     
    m68k     |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/0267af087a760dac688b99a2e7a83156ab90ec1d |     


Classification of failures by reason for 2023.08.x
--------------------------------------------------

                elfutils-0.189 | 3 
                   bird-2.0.12 | 2 
check-11970a7e112dfe243a2e6... | 1 
               lightning-2.2.2 | 1 
                mongodb-4.2.18 | 1 
                   perl-5.36.1 | 1 
             util-linux-2.39.1 | 1 


Detail of failures for 2023.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/e02186fa66aabd9e0f8402064c7c4d69acddd035 |     
  mips64el   |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/372ced650267fd5f6290976dc1bf81913de99a9c |     
   xtensa    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/1f37b938902b4f833ef1556e932a2a43c0a35eed | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/1e478f34073b978105d57823e643dc378d770aaa | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/8bc43430721b5a026306715d95147ba326a9081d | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/3145746b20c7cdba8d97199497b0d165efbbd396 | ORPH
  mips64el   |        lightning-2.2.2         | NOK | http://autobuild.buildroot.net/results/f951d91d2ca4647170a52499a243d45d13d3bced |     
  aarch64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/c1d71ddeeab618365ed44e885f2b4ccbbd813efc |     
microblazeel |          perl-5.36.1           | NOK | http://autobuild.buildroot.net/results/d1831bd358d7cf258f816c45641dbc238ccc4d1f |     
    m68k     |       util-linux-2.39.1        | NOK | http://autobuild.buildroot.net/results/7d336bdaf68d7da73ff199ea8856544435ecea4a | ORPH



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
