Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96204C05027
	for <buildroot@archiver.kernel.org>; Thu, 26 Jan 2023 06:50:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0105E403E0;
	Thu, 26 Jan 2023 06:50:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0105E403E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8vWaeY1pTbDo; Thu, 26 Jan 2023 06:49:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 10D5F405D2;
	Thu, 26 Jan 2023 06:49:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 10D5F405D2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4D5721BF83E
 for <buildroot@lists.busybox.net>; Thu, 26 Jan 2023 06:49:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0EF9281C93
 for <buildroot@lists.busybox.net>; Thu, 26 Jan 2023 06:49:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0EF9281C93
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8jD6tdN36q33 for <buildroot@lists.busybox.net>;
 Thu, 26 Jan 2023 06:49:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F7A481C81
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6F7A481C81
 for <buildroot@buildroot.org>; Thu, 26 Jan 2023 06:49:52 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 120AAE000B
 for <buildroot@buildroot.org>; Thu, 26 Jan 2023 06:49:34 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Thu, 26 Jan 2023 06:49:34 -0000
Message-Id: <20230126064955.0EF9281C93@smtp1.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1674715775; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=kXx/hb16xHZtoxLREatNpdXjYerUvKLcSX1o9xZz+VQ=;
 b=PkSpD3TN/BqrxDqMh/DnfnzBcgOYmamP9u/Qdmb159TTvAneNe/D69+sb4R38hcCm/FObI
 D7VzhUXw4Vx7aThCkTYjoXjMlGgcvsB15Cbwwj6RJQLR54t5Gw0EnYVn6h2xQJtRl6Hafm
 rqrGXbwu4SaKiXtKGFDZf307tcbebZsENEtFGawX9N2x3LPmM03j9xUvFyBDISbH937GHG
 FVPdT+3oSUP0D2wn+XdRjs2YtPLScZJHc2MOMzILVXwrnGtJy2x+uPX6RruO0r6s5KYQ5+
 anhHRK1HYYT3zFPug81GmhfMr1UwktozjTZ+dVJ/PlBt6EblTIvkSQ+KphPFcA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PkSpD3TN
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-01-25
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

Autobuild statistics for 2023-01-25
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  6  |  4  |  0  | 10  |
  2022.11.x  |  3  |  3  |  0  |  6  |
    master   | 118 | 211 |  0  | 329 |

Classification of failures by reason for master
-----------------------------------------------

                   bash-5.2.15 | 15
               host-fwup-1.9.1 | 15
                    fwup-1.9.1 | 11
                    opkg-0.4.5 | 7 
            host-binutils-2.38 | 6 
                    norm-1.5.8 | 6 
                  xxhash-0.8.1 | 6 
                  zabbix-5.4.9 | 6 
                    bat-0.19.0 | 5 
                elfutils-0.186 | 5 
                host-go-1.19.5 | 5 
                    pixz-1.0.7 | 5 
            python-bunch-1.0.1 | 5 
                     xz-5.2.10 | 5 
                   ethtool-6.1 | 4 
glibc-2.36-81-g4f4d7a13edfd... | 4 
                   linux-6.1.5 | 4 
    python-cryptography-39.0.0 | 4 
                    dust-0.8.1 | 3 
  gobject-introspection-1.72.0 | 3 
                   gvfs-1.48.1 | 3 
         host-sentry-cli-2.8.0 | 3 
                     ace-7.0.6 | 2 
             dahdi-linux-3.2.0 | 2 
                     efivar-38 | 2 
                  ffmpeg-4.4.3 | 2 
               fftw-quad-3.3.8 | 2 
             fontconfig-2.13.1 | 2 
            host-binutils-2.39 | 2 
              host-rust-1.66.1 | 2 
                  jack2-1.9.21 | 2 
                  kexec-2.0.25 | 2 
             libgpg-error-1.46 | 2 
                 nerdctl-1.0.0 | 2 
ripgrep-af6b6c543b224d348a8... | 2 
uqmi-0a19b5b77140465c29e2af... | 2 
                    zstd-1.5.2 | 2 
android-tools-4.2.2+git2013... | 1 
                  bind-9.16.33 | 1 
                    brltty-6.5 | 1 
             cni-plugins-1.1.1 | 1 
                 coremark-1.01 | 1 
           crucible-2022.05.25 | 1 
                cryptopp-8.6.0 | 1 
             f2fs-tools-1.15.0 | 1 
                     file-5.43 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
fs/ubi/ubi.mk:51: /tmp/inst... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
                gerbera-1.10.0 | 1 
                     gmp-6.2.1 | 1 
            host-binutils-2.37 | 1 
       host-gcc-initial-11.3.0 | 1 
              host-pahole-1.24 | 1 
    host-python-maturin-0.14.9 | 1 
               host-runc-1.1.4 | 1 
              hyperfine-1.14.0 | 1 
               ipmitool-1_8_19 | 1 
                ipmiutil-3.1.8 | 1 
      libabseil-cpp-20220623.1 | 1 
               libcap-ng-0.8.3 | 1 
              libgcrypt-1.10.1 | 1 
               libglib2-2.72.3 | 1 
              libostree-2022.7 | 1 
                    musl-1.2.3 | 1 
            ocf-linux-20171122 | 1 
                 openal-1.22.0 | 1 
           optee-client-3.19.0 | 1 
                    php-8.1.14 | 1 
                protobuf-21.12 | 1 
                  ramsmp-3.5.0 | 1 
                   rsync-3.2.7 | 1 
        s6-linux-utils-2.6.0.0 | 1 
                    sdl-1.2.15 | 1 
toolchain-external-codescap... | 1 
             uccp420wlan-6.9.1 | 1 
                 uclibc-1.0.42 | 1 
ulog-0389d243352255f6182326... | 1 
                 wolfssl-5.5.3 | 1 
                xenomai-3.0.10 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |           ace-7.0.6            | NOK | http://autobuild.buildroot.net/results/3f48711843e6cb905ea4479afda8ebb558e8d689 |     
    mips     |           ace-7.0.6            | NOK | http://autobuild.buildroot.net/results/9965a72700c35b947520f82830f9a2eed7610d9e |     
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/8ef5c6a144550631b725ac6b19b59fff12df8bb7 |     
 aarch64_be  |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/789d58be1774ba03a017e57e29179775486c972a | ORPH
    arc      |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/cc3a1c76ab9f85c0b58409052ca678961135172f | ORPH
    or1k     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/061e53d796381c20e4a7983829b1175466163b66 | ORPH
    arm      |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/a15ccbab70a80390be9597914bc619e8f17bb339 | ORPH
    or1k     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/ebc685a834e8634acb4f79080fcb5d0ad5ef261d | ORPH
    m68k     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/435f275829dbd56c38ae449227d0089265d394ad | ORPH
   sparc     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/17fecb294d703146564ca51ebe33c836216095fa | ORPH
    arm      |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/2aa9b13a9fdad526eddf38955e9bf3b9131d7ce1 | ORPH
   arceb     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/31ca5e5d70c777e715fc48e529b698fb8dc207ee | ORPH
   sparc     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/bd229a7744727235a19cf834b9da8ffcc289225d | ORPH
    m68k     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/4daf8aa8253c56c7cc674ce230eb63b1935172f3 | ORPH
   mips64    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/cec564da0e7674a40c144fc8df4093741e6247ba | ORPH
   sparc     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/c598464e65a5f7a9cd41641f070674e4bdea23ee | ORPH
    m68k     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/80b7827f06dc3bf5ab1af3f7a9b2cd03342ac6ba | ORPH
microblazeel |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/2cfec8d34d8bbb8dd07b42486205f164e1d05406 | ORPH
  sparc64    |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/29f2575bb1453067f31ff34648accb664f828e02 |     
powerpc64le  |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/fdc50ef702fb3291f395342da31d9db0c0085a3f |     
powerpc64le  |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/2751bf455d5032f924191c48646d559f4ab994e2 |     
powerpc64le  |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/443595ba59268a1250c6835fc3191afe35141fe8 |     
   armeb     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/d750a48ea2f898e2c2bee5eae6f1c7ad7e5d2e16 |     
    sh4      |          bind-9.16.33          | NOK | http://autobuild.buildroot.net/results/a360e776663b9291075914f93849e617b941178e | ORPH
   mipsel    |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/e974b0dd4522c0142fb9a527296523b85a4ecc7c |     
   x86_64    |       cni-plugins-1.1.1        | NOK | http://autobuild.buildroot.net/results/db89d39bd7388659c01f53276d4b03897f6aa9af |     
   armeb     |         coremark-1.01          | NOK | http://autobuild.buildroot.net/results/4a2c6353b34b752cfebdef27fc7e73312c6fec2f |     
  aarch64    |      crucible-2022.05.25       | NOK | http://autobuild.buildroot.net/results/9fd4db5b881edd4455751667b5f127c42809cb72 |     
   armeb     |         cryptopp-8.6.0         | NOK | http://autobuild.buildroot.net/results/5143794208293d1825fb0ece41c8c021706a439c |     
   armeb     |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/4acafd9214f3f6e98235749ce45103d1656b63d9 |     
 aarch64_be  |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/d0751a5476f762fd2d42722923414c13a6305d26 |     
 powerpc64   |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/ce9e2b44e0f079ac5e4e3ca09a8a827c96369bee | ORPH
    arm      |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/16216ffe72c583449594e2d8a943365559f024a7 | ORPH
  aarch64    |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/4db0acd12da75979b677a4acc15d8116fa2629f4 | ORPH
   x86_64    |           efivar-38            | NOK | http://autobuild.buildroot.net/results/aef2694d7fe6370e440e2958b741f9bebdb45a82 |     
    i686     |           efivar-38            | NOK | http://autobuild.buildroot.net/results/d4e8726cabc2f74c08f7a1446fd0d71d332837b8 |     
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/9ebc994392280c8ed2ad4a8a83b28854c7f060b5 | ORPH
    arc      |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/1f25fb183211be29b368399734930da42879ddae | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/14b3fd1dad5314cf98d3beba1ccc4efd1c09288c | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/d74b86602cc9d2480e3fd6803de77dda4fe0ae1c | ORPH
   arceb     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/e46b6f19bb415cad9df00dd71e9a0df7bfc2a426 | ORPH
   arceb     |          ethtool-6.1           | NOK | http://autobuild.buildroot.net/results/bb20dd167297357ed9f02eab40c4ad2622836d4c |     
 microblaze  |          ethtool-6.1           | NOK | http://autobuild.buildroot.net/results/eafd07dddfe7e8b714fc3fcaf77a2d7150694ee2 |     
   mips64    |          ethtool-6.1           | NOK | http://autobuild.buildroot.net/results/a97c95adc56d71a0dd5d162a6669fe7c037aa33c |     
  sparc64    |          ethtool-6.1           | NOK | http://autobuild.buildroot.net/results/00fdfc46bc370bdc44e8fc53ad9a162b8cbed290 |     
    or1k     |       f2fs-tools-1.15.0        | NOK | http://autobuild.buildroot.net/results/0029e860df23bf52ca771b4cc6fc486d11e65289 |     
    arc      |          ffmpeg-4.4.3          | NOK | http://autobuild.buildroot.net/results/58a2469ff9abb17ed22bcb0317b3a64cef67471d |     
    arm      |          ffmpeg-4.4.3          | NOK | http://autobuild.buildroot.net/results/c999c89fb7853697064bada9ae6fd928731f9c41 |     
 powerpc64   |        fftw-quad-3.3.8         | NOK | http://autobuild.buildroot.net/results/bc4d70a368b6f814e150a6f3019859261482098b | ORPH
powerpc64le  |        fftw-quad-3.3.8         | NOK | http://autobuild.buildroot.net/results/435083305ec9d1c48ab1d0073af26f8de88ad542 | ORPH
   mipsel    |           file-5.43            | NOK | http://autobuild.buildroot.net/results/0ac415a2c380f992670cf02ed936f1d614982e54 | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/c1ecf89d8a884fd05f3a17c89feaa801874bfd59 | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/e5e11119ac6ffcb7c8bcd37e840f1afdc69c6a7e | ORPH
    mips     | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/b94325bcba272e2622bb44aac66b0abf7a41e1dc |     
   mips64    | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/bc4af94d994d066f4d50160de5c0b57ce6792a77 |     
    sh4      | fs/ubi/ubi.mk:51: /tmp/inst... | NOK | http://autobuild.buildroot.net/results/5e8d873dd183d58772937029491b58ace9a330cb |     
powerpc64le  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/bcfa83fafece4615b66770e9d3432032e10a874f |     
   mipsel    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/7e5da134585787878869c230795a2f83fbe76864 |     
powerpc64le  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/77e6a93b7c58120255ff8aa4809a101a56127441 |     
  powerpc    | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/be0ee46ac0cb0b4d75f952729f2baa63be0e58f9 |     
   s390x     | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/3fee58cc5162cf798e88fb3082a01c1e21955a5b |     
    i686     | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/5042faa4d5937fedd263c84d7794c91cd0d352b4 |     
  powerpc    | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/6d50e44a7a590dbe95c834923b1225078b58a77d |     
  powerpc    | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/5703088f03e69899cdc056aa0c99a8f4d6964662 |     
    arc      |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/ad34c43c2c891dcb2d80890b2949d6f38651fa7d |     
    i586     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/eb4c21f451ff742aae260311fd617b063a3e3587 |     
  aarch64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/79dfa8a7d695eb8248324a8a2f95ff178911abf7 |     
powerpc64le  |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/7d030744c1d1d4a97f0123c362f19fa1b696f9ca |     
microblazeel |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/d309f46a7f3df8735d163a84a1f5c4e44c018997 |     
powerpc64le  |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/eea23982bc65ccbce7e940253ee91a1abec7e4db |     
powerpc64le  |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/f6b265d66d64725719c0f8c6c1cd03928ff44d34 |     
  mips64el   |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/8ecedb6da1a6d68c80f7ac860ff1d650e3efc6fc |     
  aarch64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/7403eba3f3dddb14d5c412f69807e504fa37e9ba |     
 aarch64_be  |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/d13f8032fce884fa787b0500ed5ee27b77fd0fec |     
  mips64el   |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/335c99ab90e847dbe9f14f9db79de1c4aa00584d |     
powerpc64le  |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/e8c3464c9d37be6e74ce4a61dd950a4c7715b098 |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/2963aea99e02675f1d9f2957e5eb8ccb5889957c |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/c705a93ea2542032f890d95e4b4ae061d464dbd3 |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/401498facfb63ae934073eae0f7e631b371ff7c9 |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/ed5e5107c494a1840a634884bff32bba8ec0dd66 |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/155edc3d79732de141f15ec5d5631bca8baa1fc3 | ORPH
   s390x     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/cc20f87982dee5d72c9ee9b10322d1d6cbfcbdc5 | ORPH
    or1k     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/f7d4bc1a7a741ea91ae13259e61678a93d3f5adb | ORPH
   s390x     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/bb41e8088e56d6f397e84e7ae067979a056e256e | ORPH
 powerpc64   |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/c0189cbea198e78b6f507ac51c1be1cd5256d4c6 | ORPH
   mips64    |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/4d2dff034762c7e96b73ccc78280bc51a43daf1a | ORPH
  sparc64    |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/4ea760fe55e606ca44f87de9ba4b1852915ec4f1 | ORPH
    or1k     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/3fe643e7f4aeac34afc07aee3a3b8f74db6405f6 |     
  mips64el   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/36c51fcc19fdb46d01c93dac35660bd75167c6f7 |     
 powerpc64   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/acb01845740ef5307743e95365197c453f3c1786 |     
 powerpc64   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/b3a3a97aec094576c5adc2201197697eef8bf337 |     
  aarch64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/1005ce3dc2aed13e956a3f3100129d4a70466ca1 |     
    or1k     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/5248af6239ac4a9601885f1f04b72e238fcf55f7 |     
    i686     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/2efdd004f80403d1f6d561d391063504a9957532 |     
   s390x     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/ec9da2d454b12df03f3be9235aff10eb7c0f3411 |     
  powerpc    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/3f7a158260626a68e26f749f86967a8b4165b708 |     
  mips64el   |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/d7d2c4f6cf55abec86d278ede7d333514959b457 |     
   mipsel    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/fc0471df7b64da35f98ddb66d675010459e83fc9 |     
    arm      |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/9d88cc060b4935dd8ab40da1dfa9f70feaff77d0 |     
 aarch64_be  |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/13b76d59a1c91a5db622086727bad1286c779b9e |     
   s390x     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/e523856c02ecc12da9ed43b3fe8ce7fe270ec8f8 |     
 powerpc64   |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/1567b86447e73acb66472f5fcdb45e80e870a9a9 |     
powerpc64le  |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/397866e3184082ec1096d50acf7bf786bfde262b |     
   nios2     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/7a4e31533e820cffa06db42875574bb972ac8baf |     
  mips64el   |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/fb74c80eb0700c568ee01231885a396b354d9d1f |     
powerpc64le  |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/5ad7083e22359d44b84d08c057f78ea6a66a6a51 |     
   sh4aeb    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/d86beedaad3077af3177250433e5a3671a33ca8d |     
   mips64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/bd7d24e62ce9aa474a371f460039aef977a471e8 |     
   armeb     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/1be365915d5ac7b4f81f72e62eb1fe358fbc4ee5 |     
   mipsel    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/80d278ca84ec2d690994963647257d1e9aac547f |     
  sparc64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/4fa8546a80daab3754fa8064c47eecf00408bfd9 |     
    arm      |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/4cd0c6c0c32fff779c45fad52a0b422f3a38d143 |     
  mips64el   |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/cbe51544f7fc8864f99905d7e549ae28ef53b0e9 |     
  mips64el   |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/dfe2c4c244f56f79a863544605054d1a35c188a6 |     
  riscv64    |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/7862a16661cd960cf44826661a63cd236bf7e633 |     
   mips64    |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/7ba5e94cc0a4c76300da4ddc58ebc1951f7c8f96 |     
   mips64    |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/0965dbebd231f6eb420f39495b0d4e674ed34f19 |     
   mipsel    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/f459736e02104b1057e56e45de912e38a062e089 |     
  sparc64    |   host-python-maturin-0.14.9   | NOK | http://autobuild.buildroot.net/results/97cbb4312b0c23d3a044053dc82d6ab5d2848872 |     
  aarch64    |        host-runc-1.1.4         | NOK | http://autobuild.buildroot.net/results/f07b35ba9aec7632b5a80c3a125698de3d58fa47 |     
   x86_64    |        host-rust-1.66.1        | NOK | http://autobuild.buildroot.net/results/b13fb24a3a801e4171d9fef1c308e1da769ac82f |     
  aarch64    |        host-rust-1.66.1        | NOK | http://autobuild.buildroot.net/results/7b7c58d5e2abd414741fa4fb5221ebba13d8b0a6 |     
    sh4      |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/bb651e5c32cbdca959655e4f708e497b0802a33d |     
microblazeel |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/948756dee0ea4cb7c6c32964abc3c0bb9d20f1c4 |     
 aarch64_be  |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/c2d816050bb29e3d77622b8700b007f42cb8d952 |     
 powerpc64   |        hyperfine-1.14.0        | NOK | http://autobuild.buildroot.net/results/415303ba02b1a077028bbc4e4593a1452ea4c330 | ORPH
    or1k     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/39f36abdd0ddfaf196d374571546312af9af4934 |     
    i686     |         ipmiutil-3.1.8         | NOK | http://autobuild.buildroot.net/results/18ae826b3f11cfae42079e4d343a9fe2068b3544 |     
    i686     |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/0ec787798ddcff3814f703499c767cdb7a73d5a5 |     
 aarch64_be  |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/d09d10a417b1f2cba083c1351c4f95e659bda2e8 |     
    sh4a     |          kexec-2.0.25          | NOK | http://autobuild.buildroot.net/results/d7f537dbe541f1b9b0754f681c8b0c8b59aa8ef2 | ORPH
   armeb     |          kexec-2.0.25          | NOK | http://autobuild.buildroot.net/results/b63182bc7b1f7d1cd720dd9490d84120540ebb8a | ORPH
powerpc64le  |    libabseil-cpp-20220623.1    | NOK | http://autobuild.buildroot.net/results/1e70fb0a1eeb3fd41bd7236ed595bc0b7de5dd96 |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/da56cd762152720ad8f4f56608012a85e39b1168 |     
   armeb     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/310dc70ceaaa567d9fcf85777c25f166e93bcde5 | ORPH
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/5d950fdb5ed52237cf8a762dd19f8d7f69514ec7 |     
  aarch64    |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/374ebbdd81f675e7ede9661140938e5604d56a70 | ORPH
 aarch64_be  |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/4a1e1b31d8658f1360c4e20ab576dc5cb13e3e99 | ORPH
    m68k     |        libostree-2022.7        | NOK | http://autobuild.buildroot.net/results/6239d3ac52386ed25355b2844d025ff02ae2aafc |     
   nios2     |          linux-6.1.5           | NOK | http://autobuild.buildroot.net/results/8019d7c84948173cf7fd4cdb44c240256efbcc2b | ORPH
   mips64    |          linux-6.1.5           | NOK | http://autobuild.buildroot.net/results/04bce990fb1f845b5b1d00719e1dff6c1eadeec7 | ORPH
    mips     |          linux-6.1.5           | NOK | http://autobuild.buildroot.net/results/eddd2debb0b6c9c08b02ad87c472cd13511eecfe | ORPH
  mips64el   |          linux-6.1.5           | NOK | http://autobuild.buildroot.net/results/267cd3ff4aecbfd5e3058a281216d95e04be3edb | ORPH
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/484e98530a8a0bb4d13c5744422fcfa39438f4fd |     
  riscv64    |         nerdctl-1.0.0          | NOK | http://autobuild.buildroot.net/results/6c41132d28b056fe8cce492acc35171c97df4cbd |     
    arm      |         nerdctl-1.0.0          | NOK | http://autobuild.buildroot.net/results/9b692f13b90f0b3a36c259ae55c8cb4ebe66e9bf |     
   xtensa    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/6a0ede2f34f9d8d3628f80b430f5be5f3e0ea8de | ORPH
    mips     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/3cef87f3c3d239990200e5e1875bd2ccddad557c | ORPH
  sparc64    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/1f5adfc7698fb42e2677c7e54dbb932396974d5d | ORPH
 aarch64_be  |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/10910b5158f5ee554544fb3dd3353b4ed42d8f63 | ORPH
   mipsel    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/df2893848acfbb5ce180f89ea9c0db74b9166568 | ORPH
    or1k     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/15e341838040aa0143e57c976ac7ed8f6ab471a2 | ORPH
   x86_64    |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/47d94c32f9f6d152308c86b9b672928cb00ee72e | ORPH
    mips     |         openal-1.22.0          | NOK | http://autobuild.buildroot.net/results/df61cf2af96c31375fcf5eb52a85d1a0fd05e7a3 |     
   armeb     |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/19c814641c6803cc9510538bca573bb38d97b40c | ORPH
   nios2     |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/6a2c0a2d4484990a06830de5eb1052c622df8ee4 | ORPH
    or1k     |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/3211582d4e72f20346ce02a7b76796ed3d86435f | ORPH
  mips64el   |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/d5106f8d66832ed1c4799854a9ccc3a71402c02d | ORPH
    mips     |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/fa40c6742e789f46554953f51d5cfe1c8565d201 | ORPH
  sparc64    |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/f8e31aa3d4fcdb9ada027d5caf9694b6b7d7c172 | ORPH
 aarch64_be  |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/e3458e96247dbebc6160b311a84f3d661f053b16 | ORPH
   arceb     |      optee-client-3.19.0       | NOK | http://autobuild.buildroot.net/results/2fd077e2aa16587d6fd942e86a63f81a5c799bd9 |     
 microblaze  |           php-8.1.14           | NOK | http://autobuild.buildroot.net/results/93d6109874a402039dff73cdb6a54e9764ca12bd |     
powerpc64le  |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/a8c119b5d46a8d441b6ee659959abdf1793ccb04 |     
 aarch64_be  |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/a231b314913ac69c84e564904aea9d46ddbcab8b |     
  sparc64    |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/cc92c2359d5569302a8c17dbb6ae8ce1aa2bc0a0 |     
powerpc64le  |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/c04cbd1b26d46a7702b87fc54afe90bdc7c25b6b |     
   sh4aeb    |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/5635f58562f6ed71bd51cae10f81b528a15e2257 |     
    m68k     |         protobuf-21.12         | NOK | http://autobuild.buildroot.net/results/c88aad78f231a680db8ca5fae73e7730ad70d8dc |     
powerpc64le  |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/5f3bb0edb936de1c9da95427647d0bf51f34239a |     
powerpc64le  |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/d0da434926fd6055088fcc5012dc16a3c580cee0 |     
  sparc64    |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/7d1c0723c49b1e349b602c6e0a825c0098d07e88 |     
  sparc64    |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/542bfb4e0bf9dfbb4adc8e67e2b8e251fb6cdcf1 |     
  mips64el   |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/abb7f1b30ccedd8113f8184cd08ef1f3d7fb56ca |     
    arm      |   python-cryptography-39.0.0   | NOK | http://autobuild.buildroot.net/results/20dd64d458d63626a87ba8e4aa43216ba9f2e100 |     
  mips64el   |   python-cryptography-39.0.0   | NOK | http://autobuild.buildroot.net/results/c74f256ed888f58cdafedf1a1e448d19db9df945 |     
    i686     |   python-cryptography-39.0.0   | NOK | http://autobuild.buildroot.net/results/09941da37782734073ff1111e3424b7eb8ae7238 |     
powerpc64le  |   python-cryptography-39.0.0   | NOK | http://autobuild.buildroot.net/results/e90062c244334c9493152426304b64e612702053 |     
   sh4aeb    |          ramsmp-3.5.0          | NOK | http://autobuild.buildroot.net/results/8a757d922e7c377eeacb9c27c16e597135362115 |     
   armeb     | ripgrep-af6b6c543b224d348a8... | NOK | http://autobuild.buildroot.net/results/537043072bc2765add3ff0ea1211c67898989a6e |     
   x86_64    | ripgrep-af6b6c543b224d348a8... | NOK | http://autobuild.buildroot.net/results/a4e56aa0fe57b1e45f53c227cba60045015f5fd3 |     
    arc      |          rsync-3.2.7           | NOK | http://autobuild.buildroot.net/results/e815cd2832eb95be4b9612786254f4f791b6c50e |     
    mips     |     s6-linux-utils-2.6.0.0     | NOK | http://autobuild.buildroot.net/results/4e17efa02437a15b026dca6df7c1055a7b91dd88 |     
    sh4a     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/dd51897a8b44a291907fae8af52ad047c7fd86fb | ORPH
   mips64    | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/b38a04cb26e4411b9537048acc69777cc18e9a9a | ORPH
   sh4eb     |       uccp420wlan-6.9.1        | NOK | http://autobuild.buildroot.net/results/12b873fcd282e4ec572c7b38ac7c19133c554ceb | ORPH
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/81d361ac62ce97b0c323704545bccbacc39897a0 |     
    i686     | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/3c10106e82ba1513f17d837026562ecdc1e84835 |     
powerpc64le  | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/701cd8f458de4cd07f45c990cd5f26adbc383177 | ORPH
 powerpc64   | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/4ea6da6ccc711176be57848351a72c8146dec535 | ORPH
    arm      |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/1155290583363c0f96eb58380e7b0ab3c56d2f94 |     
 microblaze  |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/de4b58712d47b9fc0b3cc5e95ec976530d897880 |     
   mips64    |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/7a2e25542c403a913bd9abe5b4269aea915a8b27 | ORPH
    or1k     |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/5a975aa8b0615394455ac2e7d0d632554539dba9 | ORPH
microblazeel |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/820df1cb01dbbb5712f4b9a40cd5628eaf9799f6 | ORPH
microblazeel |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/a3ccd1ea0fc4e83434d52a0a9b0eba7ea2a6979e | ORPH
   mips64    |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/a674fb8c501c9c9b2a1b1fb795f729b4a074e3b0 | ORPH
 aarch64_be  |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/891b0a7fa1254fbb11aa37d176ea2f5bdfe40caa | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/ac48725072f62470aa6569f41d2c0b19e014154c | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/fcd52a8bcf0267b03e19dd406137b015396e97e2 | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/b28a9db23384b18772f3b10279b640c5e3f0cd0d | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/18850faf659c210eb886908007678d580884054e | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/c2c291b8ec485d1645cd84bc03439add44def6fd | ORPH
microblazeel |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/7158869c1a75b6fd89bcd525bffd5f269d237714 |     
  aarch64    |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/2ac2a4e8182b6b3695063972fad5a4ab24507b62 |     
  sparc64    |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/fdbabf551c7ffaf3f2e13a5be817ca7073f0ce4c |     
    sh4      |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/085291c55deae25199b29df8992c4a712cc7760d |     
  mips64el   |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/9c2ed335ac842a5393fdea28ab8dff5795e85534 |     
  sparc64    |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/0611b47f7654c3f12a33c53a595d568b0f69f0c7 |     
 microblaze  |           zstd-1.5.2           | NOK | http://autobuild.buildroot.net/results/f23b558171ac5c1483fea487a99df329677e82b6 |     
microblazeel |           zstd-1.5.2           | NOK | http://autobuild.buildroot.net/results/673d490dcc8573ca76f4a192789cb808cc2caf8d |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

            igd2-for-linux-2.1 | 2 
                       frr-8.1 | 1 
         linux-headers-5.15.87 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/9ec0662d2b3b0e6f31c99c1bfa15c95bcd753451 |     
   nios2     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/c676739c549de94794a2f39bbcb037544c630a35 |     
  riscv32    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/7a6f7d94f559f7fb14711204631f6605f10cc47a |     
    arc      |     linux-headers-5.15.87      | NOK | http://autobuild.buildroot.net/results/5b560f8d760089895e3b6076aa27c073123c20a6 | ORPH


Classification of failures by reason for 2022.11.x
--------------------------------------------------

                gerbera-1.10.0 | 1 
             lirc-tools-0.10.2 | 1 
            micropython-1.19.1 | 1 


Detail of failures for 2022.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/7c81825b5ef939dea942e91f17c91455cd9a6981 |     
    arm      |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/9e32b0753f9342db3baec2c2456444fb626a1e28 | ORPH
  aarch64    |       micropython-1.19.1       | NOK | http://autobuild.buildroot.net/results/5bd03991852ec18465443d4e66f906b6af03eadb |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

