Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED338C25B4E
	for <buildroot@archiver.kernel.org>; Sun, 22 Jan 2023 06:41:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28AAA4161C;
	Sun, 22 Jan 2023 06:41:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 28AAA4161C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sgPA-Wj0yasK; Sun, 22 Jan 2023 06:41:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A757D4162D;
	Sun, 22 Jan 2023 06:41:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A757D4162D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 77BF51BF5E9
 for <buildroot@lists.busybox.net>; Sun, 22 Jan 2023 06:41:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 52E3040242
 for <buildroot@lists.busybox.net>; Sun, 22 Jan 2023 06:41:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 52E3040242
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fbIRJv4LHJMr for <buildroot@lists.busybox.net>;
 Sun, 22 Jan 2023 06:41:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B0E940137
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7B0E940137
 for <buildroot@buildroot.org>; Sun, 22 Jan 2023 06:41:20 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A7433FF804
 for <buildroot@buildroot.org>; Sun, 22 Jan 2023 06:41:17 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sun, 22 Jan 2023 06:41:17 -0000
Message-Id: <20230122064123.52E3040242@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1674369677; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=opZJfpBTkwsM4UIMtiQz7LGizY2Zgxk/IOuTXwJCL7A=;
 b=KxjiMXHlE3N92nKDz60vbSJb/JkUshjkpnUAvXQalZGfY71tkBvEIgQI1+7x58pH9kYb+7
 wADhVj4jwV7fznDmIsfzEXO6ho+FpMrWme7femc3Nthqga1/y32mAd+qwHt1k3djgURcBX
 Ko+wBQ2NEwUr7ReAF7pdtd3bZmknCl8U3J2ArsopaNNAZoaHXhTnFEpoyzng5Pb/OhubX4
 ImFe09TdSxkU4fUtRm3NEErfmA8R4aKOdGQFxo01mWbepBsbzcPGmChHS7BcoL33WZ2vLG
 9GhN/oPTwd82P5p49/HoY44X19XhAZKOQ7l944cBjcV5+LiHKwKDHEAJagYgLA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KxjiMXHl
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-01-21
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

Autobuild statistics for 2023-01-21
===================================

      branch |  OK | NOK | TIM | TOT |
    master   | 127 | 199 |  0  | 326 |

Classification of failures by reason for master
-----------------------------------------------

               host-fwup-1.9.1 | 21
                   bash-5.2.15 | 17
                    fwup-1.9.1 | 13
                     xz-5.2.10 | 7 
         host-sentry-cli-2.8.0 | 6 
                 wolfssl-5.5.3 | 6 
                  xxhash-0.8.1 | 6 
            host-binutils-2.38 | 5 
                    pixz-1.0.7 | 5 
                   gvfs-1.48.1 | 4 
                host-go-1.19.5 | 4 
              hyperfine-1.14.0 | 4 
                   linux-6.1.5 | 4 
         python-greenlet-2.0.1 | 4 
                    bat-0.19.0 | 3 
                    brltty-6.5 | 3 
                gerbera-1.10.0 | 3 
  gobject-introspection-1.72.0 | 3 
      linux-5.10.145-cip17-rt7 | 3 
                    opkg-0.4.5 | 3 
                   pcre2-10.42 | 3 
                  assimp-5.2.5 | 2 
casync-0efa7abffe5fffbde8c4... | 2 
                    dust-0.8.1 | 2 
glibc-2.36-81-g4f4d7a13edfd... | 2 
            host-binutils-2.37 | 2 
                  jack2-1.9.21 | 2 
             libgpg-error-1.46 | 2 
          modem-manager-1.20.4 | 2 
                    norm-1.5.8 | 2 
              traceroute-2.1.0 | 2 
                 uclibc-1.0.42 | 2 
                     ace-7.0.6 | 1 
                  boost-1.80.0 | 1 
                bpftool-v7.1.0 | 1 
                  check-0.15.2 | 1 
             dahdi-linux-3.2.0 | 1 
                 dhcp-4.4.3-P1 | 1 
                elfutils-0.186 | 1 
                 fdk-aac-2.0.2 | 1 
               fftw-quad-3.3.8 | 1 
             fontconfig-2.13.1 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
                glorytun-0.3.4 | 1 
                     gmp-6.2.1 | 1 
gummiboot-2bcd919c681c952eb... | 1 
            host-binutils-2.39 | 1 
         host-gcc-final-10.4.0 | 1 
         host-gcc-final-11.3.0 | 1 
       host-gcc-initial-10.4.0 | 1 
              host-rust-1.66.1 | 1 
                ipmiutil-3.1.8 | 1 
                  kexec-2.0.25 | 1 
                       kmod-30 | 1 
              libgcrypt-1.10.1 | 1 
               libglib2-2.72.3 | 1 
                libglvnd-1.4.0 | 1 
                   libnss-3.87 | 1 
        ltp-testsuite-20220930 | 1 
                  mender-3.4.0 | 1 
                 nerdctl-1.0.0 | 1 
                  netsurf-3.10 | 1 
           optee-client-3.19.0 | 1 
                    opus-1.3.1 | 1 
                   perl-5.36.0 | 1 
                    php-8.1.14 | 1 
                     ply-2.3.0 | 1 
           proxychains-ng-4.16 | 1 
            python-bunch-1.0.1 | 1 
           python-numpy-1.23.5 | 1 
toolchain-external-codescap... | 1 
                tpm2-tss-3.1.0 | 1 
uqmi-0a19b5b77140465c29e2af... | 1 
           v4l2loopback-0.12.7 | 1 
               valgrind-3.19.0 | 1 
                xenomai-3.0.10 | 1 
               xfsprogs-5.14.2 | 1 
                  zabbix-5.4.9 | 1 
                    zstd-1.5.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |           ace-7.0.6            | NOK | http://autobuild.buildroot.net/results/36c6accf66e0b763e6732389485c1311f2aa8bb5 |     
    or1k     |          assimp-5.2.5          | NOK | http://autobuild.buildroot.net/results/39cba8cdc7ebeeec2efc4a19132da9638db745cc | ORPH
    mips     |          assimp-5.2.5          | NOK | http://autobuild.buildroot.net/results/14f8624fa4defa55c39abd091254ab920b2cbb30 | ORPH
   armeb     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/2a1a696d11c3938b527dae5a50a7fc18374f5553 | ORPH
   sparc     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/96f8502ddb39e89076df77835d07eed077fd9b54 | ORPH
   arceb     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/6fd9fb31f67344fcca8f1d7d875f7fabdf227d80 | ORPH
   armeb     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/8f0b500436890181816b8b3eb24ff6e244b9c8fb | ORPH
   mipsel    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/900da2e9eaacd188518cf1cf9563fe1859d9b0ba | ORPH
   arceb     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/51369b80674c2edbc76a51edb8938ea44ef763d4 | ORPH
    arc      |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/f71e71ed4dc1b94e61da9f0b521bb91ff49d54c6 | ORPH
    or1k     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/a04c2b6755293af077298915ec9d20352aca37a5 | ORPH
 aarch64_be  |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/0a00ee470f0e003fd568442ff3c727b4bf2c3576 | ORPH
 aarch64_be  |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/b158e5d5a109a07851d243f1aee71416ef0c5767 | ORPH
 aarch64_be  |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/55db178c1bee01ace1be74ee33a8690241be6ffc | ORPH
    m68k     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/8b0abf1a02ba15daefd5897a7260327a0ea0ce3a | ORPH
   armeb     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/802fab50b4501884fb18a6bd737dd68480e3b5d3 | ORPH
   sparc     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/f48789c1827e6b91968f9ffdfb5792084a629f76 | ORPH
  aarch64    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/eee7002d40c80ea1eaf6ab7ac7d78098844daf69 | ORPH
   arceb     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/9f3e87da22c5162b72543ba4f642f2e079e3c03e | ORPH
   xtensa    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/3e1391bf93e3efd0ea7249e2aa4f30416d98b30e | ORPH
powerpc64le  |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/234b09e815093c5b84150f74658140de061c75f8 |     
   x86_64    |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/492c942840a04b8d88aaf818180be9b580ae8093 |     
powerpc64le  |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/ad69142052d750d590e5dcd477341c8573d127e4 |     
   arceb     |          boost-1.80.0          | NOK | http://autobuild.buildroot.net/results/f9e0a4e7cd5dbfb1d25a04ed1d944caed676738f |     
  sparc64    |         bpftool-v7.1.0         | NOK | http://autobuild.buildroot.net/results/f350c25e4b9ac2add7f611b0460a5bb23677b7f2 |     
powerpc64le  |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/159d3caff0ba060437bbb158208d0f39283fedc2 |     
   mipsel    |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/861d184486005ec2c16b12ab7956cdd079f3d595 |     
  powerpc    |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/2c5caf2ba9f3287ca356b176590690b399b2575d |     
  mips64el   | casync-0efa7abffe5fffbde8c4... | NOK | http://autobuild.buildroot.net/results/94a65c1c15ea87bb7220dc503fd632075cb9a1cc |     
microblazeel | casync-0efa7abffe5fffbde8c4... | NOK | http://autobuild.buildroot.net/results/bf0ddbbff726943ed34a99139edb5177fc7b7e01 |     
   nios2     |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/96ee29705918a84e7fa5f5eafa84feccd5d87e4c | ORPH
  riscv64    |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/ac5355a3bc936a93aa19e67fb2a1500ced25d0d7 |     
    sh4      |         dhcp-4.4.3-P1          | NOK | http://autobuild.buildroot.net/results/41541435f18cb995e47eafa38cc68e664c067cdb | ORPH
  sparc64    |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/6c5213eb92ba6a2adf06217b6ec44533fa8ad842 | ORPH
powerpc64le  |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/2de323b9f2c5471b00de98271c0357a5f41574af | ORPH
    arc      |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/04216478a3f4042fbde51cadee4f373f8d728473 | ORPH
    i686     |         fdk-aac-2.0.2          | NOK | http://autobuild.buildroot.net/results/6dd603f577a551318d4501eb3a087cc430d831ba |     
powerpc64le  |        fftw-quad-3.3.8         | NOK | http://autobuild.buildroot.net/results/16cbbf5599013399b6f4dc25d79a9792624dd7b8 | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/cbab9f88f83eb608341f2995fb4d3c779a10ab4d | ORPH
   xtensa    | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/991cd6e0b212dc4d8beea4e4fbaa6a51e2158016 |     
 microblaze  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/7bbb5ca05e65575a76230bb4b5009a37fe7aa68f |     
   s390x     | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/9abc118bdea9b871276341f4356900a88ac82725 |     
   x86_64    | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/6392506112bae164b9cc46f999719b4538d35d57 |     
  sparc64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/7c158b114ee044db0c2a2d8b5f64872f489e83d6 |     
microblazeel |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/d58bd656e5247bc0e2eeb7f15eda45b8d91d9d04 |     
    mips     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/bf6a46bb2cef9ab19edc696096cd357ee4ab8f01 |     
   s390x     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/fe909cfbb0543dfdf59037265430f83e00598702 |     
 microblaze  |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/4fdd3fbd8e0f6105ae386a28a80b2eebb0779ec1 |     
   s390x     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/9810b8484fc4e0b6eebcfc798ea6ab0befcc5c33 |     
   x86_64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/b54ba73d0e19bebdd17e7898baee5ac94815b038 |     
  mips64el   |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/b082d4f3adc4390ec4454db8a631a21390d4cbb2 |     
   arceb     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/16b76925e3f4487fa1b9a1dfa74401ac850c1b4f |     
powerpc64le  |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/fb2dbf684e67e378788926d4f1c9171823ed9aed |     
   mipsel    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/897ad1f07960d64dfd5526fc7b783e81b5f97f72 |     
   s390x     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/f5759449a70fe877e0fd46051d27bc3acc8cdb25 |     
    i686     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/3eaf1b7530e4ab5bd549fb9f237684009f16e09a |     
  sparc64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/feb13da8179197b644fa3a49f80c12131b3407fe |     
microblazeel |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/0f57b355aa524acce169a2dc14b8498cb9379de9 |     
   mipsel    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/c4053cd6bb468280c42df9c3bca122a1fec777a4 |     
 powerpc64   | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/1d221419b2f21a09e3c55d077f3fb706c11f0408 |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/2542742421475ea1a8aa22c16eca8b2ebbb85200 |     
    or1k     |         glorytun-0.3.4         | NOK | http://autobuild.buildroot.net/results/325a4178aa91e0e43b0b50605168e85ed9bae2af |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/66e5a98687bcd86793524748f2b19af46a6d3cc9 | ORPH
powerpc64le  |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/40ceddac67d93a651bc64cb01c87dd8ca1e82b7b | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/c2450a266d969c28e4accbf85cf8da12bfcb74bd | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/6a3b2fb997a7e816b5240c380fb91607f8a532b7 | ORPH
   x86_64    | gummiboot-2bcd919c681c952eb... | NOK | http://autobuild.buildroot.net/results/c96ca617b21b3acaeb9c388849d1c7ac968bb980 |     
   s390x     |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/b88dddd285c86a5f6b0f2ad22ef0f2cc4594f5bf | ORPH
  sparc64    |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/a9da1f0c800f4869c065b70b3504e8b8f97bf8ba | ORPH
  aarch64    |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/0b2c4f093f85a6b963a73eadf28fcda482113257 | ORPH
    i686     |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/3b64e1ba14396bfa6f01901740805740e7809263 | ORPH
   nios2     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/f5a6b0b9bee4564ec8245b1b9e3230723ef02897 |     
microblazeel |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/09c5914a024a343f9e7861fa4cc61ca6706a3e4b |     
  aarch64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/f713bc0db3801bd54fb058e5067b31feb67c1574 |     
  powerpc    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/c4e06910f026b7cf40945663097ddcbd31256c24 |     
   armeb     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/754250d5508a9b76d424bd7e20afaa8aa4e45b78 |     
  aarch64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/986a7e68fb89d5a9eda8f0822c28205a3b8c30a8 |     
    mips     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/e5c1165ea786aaa373c53e3e8e761ad611ffd6e8 |     
 powerpc64   |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/98d21ca6edd0798f909c90fbe96f675760bf787b |     
 aarch64_be  |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/c7f8697b0185f524c0f8038a046654ce202f73a9 |     
    arm      |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/bb2f8a0864384030f1baa39f0e670050becc8872 |     
   mips64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/b6b1d8a6bc11ebd623dabee4a691a4a32b51c2d0 |     
    sh4      |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/7ab825c8296af519ff524a95dcfa5c9d3562278d |     
   s390x     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/d94a9020884cbf3b1aa25a8c05a1ee488df8f69d |     
 aarch64_be  |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/334d39f38e8459bd1829c6bd819e47ae1f523bd1 |     
  mips64el   |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/27215ca6935c5a17bfe3eb9f67578d6dd395ffe4 |     
    sh4a     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/73a4ff6ae5085a4ad5f9be746c98d1ef0e786a4e |     
    or1k     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/96443f301a35903135f9f22489d928ec53b5b619 |     
    sh4      |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/4a63fb1d6d68756f539b7d74430ea9e651125e27 |     
   xtensa    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/a1f0d18479e65b681d8ab53661496e9e70bcddf2 |     
   sparc     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/ee5e16debf73df2370fb45e551f2cc8acd965cb5 |     
   armeb     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/b3752974f85304c9bc06506c949a8a5f2f81b98a |     
   mipsel    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/ac24b7ac24215bb24e455f7bccaa6d238ddd6c32 |     
   mips64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/838bb5097a43925e3406fabf727fc993f16b8ab6 |     
    arm      |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/bb92c0cb1da7968024653229eabee7a732fc2d5f |     
 aarch64_be  |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/33042276889a674651605daaef0580c47b357b75 |     
    or1k     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/5c3d36eb0ce5f474f994f561dedfffa9d94ec19c |     
  riscv32    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/124569c09b50b5d898a4bbdc8495d1a392b856d9 |     
  powerpc    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/cbb1a0b850ba1d4dd9d4fc55afe41a0382d5f708 |     
  aarch64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/6234410a654c5e3e1ab6dd8f399dec6f354f91f4 |     
 microblaze  |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/4765064b24da0f7a746fa76133bc1332646d3562 |     
    arm      |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/309df0f9cadee9f3c92b1a40e878b97fca999d33 |     
   sparc     |    host-gcc-initial-10.4.0     | NOK | http://autobuild.buildroot.net/results/4314b921894223a9abd43a1d70983287d94268b8 |     
   mips64    |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/c7928e50f6d375fbfcef9e7334771c371f5c0ee5 |     
  aarch64    |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/5e7c87e2772907fb8fff4ad4f760f77c043d1514 |     
powerpc64le  |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/39d3a6da55ebaf17726594b8ee4067bac02f8a67 |     
   mips64    |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/f609453072921b7cf18aee13642238c96ef2bbe5 |     
   x86_64    |        host-rust-1.66.1        | NOK | http://autobuild.buildroot.net/results/6aebb65a7f2c58ef306c6d62c088534366623f1c |     
microblazeel |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/4a12859561987d8fc507dfdb29e241c1681f16e0 |     
powerpc64le  |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/70782bf489eb65c719f4ff91b1b23d04de934bc7 |     
   armeb     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/7f1f8798cfc8d0d105b23d2d5b023fb03154cb7a |     
   x86_64    |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/b1fd088b8c8292570a1ec658b13f721e5ff85e3b |     
   mips64    |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/d75402ff69d25c725b9368558c1e4da84c5235a1 |     
   x86_64    |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/1ad5b4dcaa5b345c40c6a2af9e4316bff930a4cb |     
   x86_64    |        hyperfine-1.14.0        | NOK | http://autobuild.buildroot.net/results/9323b65df5d379efad919be2752c613ff2abb2c0 | ORPH
    i686     |        hyperfine-1.14.0        | NOK | http://autobuild.buildroot.net/results/a8ad09e15711e895db9f75a157c5817e1335932a | ORPH
 powerpc64   |        hyperfine-1.14.0        | NOK | http://autobuild.buildroot.net/results/2e9a1f7fd67c2ad5d61dc71e45bab746ea77c3ac | ORPH
  sparc64    |        hyperfine-1.14.0        | NOK | http://autobuild.buildroot.net/results/aee88b6c9a592ccc65b225073bea21eb88304618 | ORPH
   x86_64    |         ipmiutil-3.1.8         | NOK | http://autobuild.buildroot.net/results/448413810d94118a1e9315b180c5427d66ac3a8a |     
    i686     |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/3cf821c5259c3ec3669de67415c14495bfa20e74 |     
   s390x     |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/ce87e3d233900ceab01956460c9db23c342ce23f |     
   armeb     |          kexec-2.0.25          | NOK | http://autobuild.buildroot.net/results/a9c2abdd216901ae60b79a2e1ef45f2df7708756 | ORPH
  aarch64    |            kmod-30             | NOK | http://autobuild.buildroot.net/results/394143a305e3da1d959a87209826830efde590a6 |     
    arm      |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/e8da7711f3197dfb04cc3e08a5c406d05545fb38 | ORPH
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/b0225dbd5940da0aea30774f3d55ce9cb3c18c55 |     
   armeb     |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/2fce2a7c75e50dcbeb0794835d2fef8b52c1bda5 | ORPH
 aarch64_be  |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/e9be90d7d52cb8723b1074efd9eb1e32d7fe3bc2 | ORPH
 aarch64_be  |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/9eb0681a74e94d0543cbfd1588baf3462a6a4cc3 | ORPH
    or1k     |          libnss-3.87           | NOK | http://autobuild.buildroot.net/results/fc6af84b9513b879b67c3c1fffca3ed3c026cc63 |     
    m68k     |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/09fc013d109ac0e58adc800df3f6592f5cca3c3d | ORPH
  mips64el   |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/1b691ad0d80749604f6a632b8b93f3d36e4daf1f | ORPH
  powerpc    |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/5e4dd4cbec4e72bedbcdb0bf93adeeb55a4c47fe | ORPH
    mips     |          linux-6.1.5           | NOK | http://autobuild.buildroot.net/results/a2685162be26b7a4c9c8cb2a9a192f5371783dea | ORPH
   xtensa    |          linux-6.1.5           | NOK | http://autobuild.buildroot.net/results/d9cbb27f955891c31fe3e70818246c7ff59ea965 | ORPH
powerpc64le  |          linux-6.1.5           | NOK | http://autobuild.buildroot.net/results/6971e1cab655382a73197ba678ae5c42edd1dce5 | ORPH
  powerpc    |          linux-6.1.5           | NOK | http://autobuild.buildroot.net/results/534f4d3d51343d66a0721d4491e13f110bbc7a1e | ORPH
  powerpc    |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/52e7013cdedf3dab7103357793e2d05e43404c82 |     
   s390x     |          mender-3.4.0          | NOK | http://autobuild.buildroot.net/results/1da481efa0e0100550fa47efdfc20ef430380fe1 |     
   mips64    |      modem-manager-1.20.4      | NOK | http://autobuild.buildroot.net/results/7fd8de3d7d8486cab1ea5151e5126020e437a296 |     
    or1k     |      modem-manager-1.20.4      | NOK | http://autobuild.buildroot.net/results/3ba2f45031371754e1e60b57953cd06acc54dbad |     
powerpc64le  |         nerdctl-1.0.0          | NOK | http://autobuild.buildroot.net/results/944ae45373eeea3bdabfad619b91ae15fde1c7ce |     
 aarch64_be  |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/8f9cd3f062df6c1f00ae9c7fbe15585993a657e9 |     
  sparc64    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/b473e3e6ac5c33d0643f6e02b235b97cb1f0c199 | ORPH
   s390x     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/662bdc4bfba4685f3ac6564f6e19a0282065d0ed | ORPH
   arceb     |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/02a2dde5e13fb671425bbc96521f9395ea2489cb | ORPH
   mipsel    |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/843eebf7f89be32e11ff2964de0d2f697e480c88 | ORPH
  powerpc    |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/512a78437aa2d09d8191c0bc7d8ae3cd56054ba4 | ORPH
   mipsel    |      optee-client-3.19.0       | NOK | http://autobuild.buildroot.net/results/f9a1b9d999c8a5855704c250662b0637097b0c9d |     
   armeb     |           opus-1.3.1           | NOK | http://autobuild.buildroot.net/results/92c9c4efb7007ca7580fc616e42a646a07050bb4 | ORPH
   sparc     |          pcre2-10.42           | NOK | http://autobuild.buildroot.net/results/a4b21d179386a48b81134161858089450b5a45f0 | ORPH
   sparc     |          pcre2-10.42           | NOK | http://autobuild.buildroot.net/results/6a0b8c20a187799a3c41a9e328d44c72f5c0e923 | ORPH
   sparc     |          pcre2-10.42           | NOK | http://autobuild.buildroot.net/results/df021ba2296f031ace71bcbe2efa2fa154d2268a | ORPH
    sh4a     |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/af8a328700430f043b7cf6e3bd900ed8a4bfcba5 |     
    arm      |           php-8.1.14           | NOK | http://autobuild.buildroot.net/results/3b94ad140dc71c1cc3c327d313961d1cfc8160a3 |     
 powerpc64   |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/d450a94a4246d7f50c8bf198c7a522b7a070ced7 |     
   nios2     |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/043e3061b5719488eee573048ea73c6fdcb99568 |     
   nios2     |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/232a0ff18d0a63d0a0e48c6a2f166a934ae586a7 |     
    or1k     |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/201d22a2ef374c0766a75d7d45555e218d07c82e |     
 aarch64_be  |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/15601bb702e8c4eac4bf4f86f15fd3a5a03d1ffb |     
  aarch64    |           ply-2.3.0            | NOK | http://autobuild.buildroot.net/results/17ce44f61118cdeb87828e0bb31b8208a5e3182d |     
 aarch64_be  |      proxychains-ng-4.16       | NOK | http://autobuild.buildroot.net/results/0937b5a799a4bd4f9e2bfcc13a0155b9155a5755 | ORPH
    arm      |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/dab4bb778f1091dbc05753de5f449728d826729b |     
    arm      |     python-greenlet-2.0.1      | NOK | http://autobuild.buildroot.net/results/b199626ba4f19947db157840e8ebcb05b9c58153 |     
 powerpc64   |     python-greenlet-2.0.1      | NOK | http://autobuild.buildroot.net/results/58eab697ac9b6a91ef4f64d3fdf786a27c8d4af1 |     
    arm      |     python-greenlet-2.0.1      | NOK | http://autobuild.buildroot.net/results/546f0a10b415c1acb2c0cb389b632080ce1f363e |     
   x86_64    |     python-greenlet-2.0.1      | NOK | http://autobuild.buildroot.net/results/3353f1d1f63b52e2c0c1e9285682fb2c596cf521 |     
    mips     |      python-numpy-1.23.5       | NOK | http://autobuild.buildroot.net/results/f7fd31cf13065ef591d720988bb7f249df7f389a |     
   mips64    | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/d66c46df2c66fa7138f59643c75ec22050fb8b39 | ORPH
 aarch64_be  |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/0e5354819e2acc92047fa87e2671ab3f22b3c754 | ORPH
    sh4      |        traceroute-2.1.0        | NOK | http://autobuild.buildroot.net/results/c9bfa2b9ae05df0ce175e219158f6e0491d3cf3b |     
    mips     |        traceroute-2.1.0        | NOK | http://autobuild.buildroot.net/results/73e8dc847a1f810297c8d2391aa2792b0f504404 |     
  riscv64    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/c6d301580408c2d0923df00e759d9b0f49810045 |     
  riscv64    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/f272c2f6b0567f06fbcafdd92046c4a85060f157 |     
    m68k     | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/c18ca8eddcfbe60e686316983061734ffb85f558 | ORPH
  sparc64    |      v4l2loopback-0.12.7       | NOK | http://autobuild.buildroot.net/results/2ba9cb5ba7a1abd82019ad1062bbfb8563bb8072 |     
  powerpc    |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/771b835c3cadeba6abc090c7426e37f93d3a50bd | ORPH
    arm      |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/46d9d8855b02f1398fc3c2ea7d7514e4483bd864 |     
  riscv32    |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/71f731dc4222762aa4676a6d5482c66a83e81086 |     
    arm      |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/8bed6889ab3cd23e7126495c0546be2d0ec117f9 |     
  mips64el   |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/160f4720f4f274a737810caacc3fb043138c29c1 |     
   armeb     |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/4afcc40175d914f619000e3a2cf9603ba557824e |     
   armeb     |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/088e10a1c18454b53da0caa34c2d75982e40afc1 |     
  mips64el   |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/1dbc20f83719e59499aab3adbd6988b39d53dc45 |     
  mips64el   |        xfsprogs-5.14.2         | NOK | http://autobuild.buildroot.net/results/72f3c7aeb8741c8f37bbd54625448c75366ee6d3 | ORPH
    arm      |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/bb809afc54850869d843307f42cc8a0375ec436a | ORPH
 microblaze  |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/8383217a161b44bac1faf382e783c38f05fd85be | ORPH
    mips     |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/991e09882f3b2c903a36ca2f4db3ebb1b474df65 | ORPH
  aarch64    |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/e47bde18bf3257c8895e6850ca7d1496e3c383b3 | ORPH
   mipsel    |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/ed32bd856b7dcac33a93df284b622ea5708e4962 | ORPH
   mips64    |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/09a62c2909c946d4fc9e9365eb955096f39358c0 | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/532409bf24b54ff185b68eb2be7435452521751e | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/39a6815152ddd4306b49429f75b463f05c63e694 | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/75cc2497a6eef4021ad01a0eb59abb8bab767557 | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/0b087bf6006a30f7b48dacda9cc7e0f225551699 | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/445412e529c20c675e46dac9c8afbb8f17b7da5f | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/5451379802152aece133bcc96b6925cd1c907e64 | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/090962bec41561e318daea70849f62685faa510b | ORPH
   mipsel    |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/0dd96cba853856b31a3b949d8f8fb8f651d452b3 |     
microblazeel |           zstd-1.5.2           | NOK | http://autobuild.buildroot.net/results/3c0dee431b115f7f8e2ee54197287a3245dcc129 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
