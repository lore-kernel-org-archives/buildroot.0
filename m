Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 673EFC433EF
	for <buildroot@archiver.kernel.org>; Sat, 16 Jul 2022 05:32:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF8386F477;
	Sat, 16 Jul 2022 05:32:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF8386F477
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9myhUvP1rgTX; Sat, 16 Jul 2022 05:32:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 30A4960AF4;
	Sat, 16 Jul 2022 05:32:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 30A4960AF4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 048A41BF418
 for <buildroot@lists.busybox.net>; Sat, 16 Jul 2022 05:32:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9FEFD42842
 for <buildroot@lists.busybox.net>; Sat, 16 Jul 2022 05:32:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9FEFD42842
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OfoAISz-e4Tk for <buildroot@lists.busybox.net>;
 Sat, 16 Jul 2022 05:32:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D1AE42840
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1D1AE42840
 for <buildroot@buildroot.org>; Sat, 16 Jul 2022 05:32:35 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id CE7C5C000A
 for <buildroot@buildroot.org>; Sat, 16 Jul 2022 05:32:32 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sat, 16 Jul 2022 05:32:32 -0000
Message-Id: <20220716053239.9FEFD42842@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1657949553; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=d6HqEfAHe4JUFMqHsuqKsmadaDvtxbpdTtWN4+xhtvM=;
 b=Ntcl8VGFIIu6Ix/MLC4c0WUMCn2DzXdDmCPZR3g+DOW5j9LTNmrtbQULP/K0GxG3oy/ewL
 WRSuLZq/uoDccGkC9jQp3BL1Yy7ySTGPr0jMprImYK3CVbrz+QhVavyKU+Pc2BpepS0li5
 hcTle2m/7Mv9FVem4gfCoW47lhRTvmhZ+dI+OSC44TJiJJIyCLlyxU6VSlLl3WUQ07ALNE
 QI+U7jN0FpVf8Oc8GunqfvqCyimBXA9oealnIzsLAMjpqfzM4LhlukwuFS8sPpZJ5HXx+K
 68q+U5BglADuOpXLdjU1oPm4SEyjU2hwaU6aledPqOcluhOrZBErE+ZupM4vMA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Ntcl8VGF
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-07-15
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

Autobuild statistics for 2022-07-15
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  | 16  |  7  |  0  | 23  |
  2022.05.x  | 23  | 26  |  0  | 49  |
    master   | 140 | 193 |  0  | 333 |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 24
              alsa-utils-1.2.7 | 12
                 libvpx-1.12.0 | 8 
                   speex-1.2.1 | 7 
             libopenssl-1.1.1q | 6 
               protobuf-3.20.1 | 6 
glibc-2.35-96-g2c4fc8e5ca74... | 5 
host-pahole-73383b3a39afe86... | 4 
              host-rust-1.60.0 | 4 
           libfreeimage-3.18.0 | 4 
                speexdsp-1.2.1 | 4 
                 uclibc-1.0.41 | 4 
                 zlib-ng-2.0.6 | 4 
                busybox-1.35.0 | 3 
               gocryptfs-2.2.1 | 3 
           host-harfbuzz-4.4.0 | 3 
host-spirv-llvm-translator-... | 3 
                libcurl-7.84.0 | 3 
                     php-8.1.8 | 3 
                     refpolicy | 3 
              alsa-lib-1.2.7.2 | 2 
                     aufs-util | 2 
dahdi-linux-5c840cf43838e06... | 2 
                 dash-0.5.11.5 | 2 
                     frr-8.2.2 | 2 
fs/ubifs/ubifs.mk:49: /home... | 2 
                gnu-efi-3.0.10 | 2 
                host-go-1.18.3 | 2 
              jpeg-turbo-2.1.3 | 2 
                 linux-5.17.15 | 2 
                  ntp-4.2.8p15 | 2 
            quickjs-2021-03-27 | 2 
                   tor-0.4.7.8 | 2 
ulog-0389d243352255f6182326... | 2 
                     ace-7.0.6 | 1 
                  acpid-2.0.33 | 1 
                  bind-9.16.27 | 1 
                    bird-2.0.8 | 1 
                    brltty-6.4 | 1 
                 coreutils-9.1 | 1 
                    dhcp-4.4.3 | 1 
              e2fsprogs-1.46.5 | 1 
                 fdk-aac-2.0.2 | 1 
                    ficl-4.1.0 | 1 
             fontconfig-2.13.1 | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
gummiboot-2bcd919c681c952eb... | 1 
          host-gcc-final-9.4.0 | 1 
       host-gcc-initial-10.3.0 | 1 
       host-gcc-initial-11.3.0 | 1 
             host-gtest-1.12.0 | 1 
            igh-ethercat-1.5.2 | 1 
                iptables-1.8.8 | 1 
                  janet-1.22.0 | 1 
      libabseil-cpp-20211102.0 | 1 
               libcap-ng-0.8.3 | 1 
                libressl-3.5.3 | 1 
                libzlib-1.2.12 | 1 
       linux-5.10.109-cip5-rt4 | 1 
                    mutt-2.2.6 | 1 
                nodejs-16.15.0 | 1 
               openblas-0.3.20 | 1 
                    opus-1.3.1 | 1 
                   perl-5.34.1 | 1 
          perl-net-ssleay-1.85 | 1 
                 pixman-0.40.0 | 1 
               poppler-21.12.0 | 1 
           powerpc-utils-1.3.8 | 1 
                    pppd-2.4.9 | 1 
            python-sip-4.19.25 | 1 
rpi-userland-14b90ff9d9f031... | 1 
              rsyslog-8.2204.1 | 1 
rtl8189es-39c17661136da48f8... | 1 
rtl8812au-aircrack-ng-37e27... | 1 
              swupdate-2022.05 | 1 
               tcf-agent-1.7.0 | 1 
                tinifier-3.4.0 | 1 
                   uacme-1.7.1 | 1 
                 wavemon-0.9.4 | 1 
           wpa_supplicant-2.10 | 1 
                       xenomai | 1 
                xenomai-custom | 1 
                  zabbix-5.4.9 | 1 
                    zstd-1.5.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |           ace-7.0.6            | NOK | http://autobuild.buildroot.net/results/6c958b97fb902a39e7c31030e5dcfb63a27bd831 |     
  mips64el   |          acpid-2.0.33          | NOK | http://autobuild.buildroot.net/results/1b78c874be21011da40b685a782956fcaf44d632 | ORPH
    m68k     |        alsa-lib-1.2.7.2        | NOK | http://autobuild.buildroot.net/results/5e4261d5591c2457a95ec94f166effd43173631a |     
    m68k     |        alsa-lib-1.2.7.2        | NOK | http://autobuild.buildroot.net/results/fde16dd50f6b710a3a5ab61139a3448346fa95af |     
  powerpc    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/00c07aa5f7f30925bedc0fd42ce08116c0ec17b4 |     
   mipsel    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/2f857af041667db30353d13767366bfc06db592e |     
   x86_64    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/656219bfd44c6c45de642b8e8e41308bfe247404 |     
   sparc     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/530f1d50bb14c69feceea29851d9a2c90e9f043a |     
    i586     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/cff1a90dcb1601d604b85a8ddd3b25eed7f1f1e3 |     
  sparc64    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/ce3a65f32ab00796d132c1610f328ff107529d68 |     
   mips64    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/5ca2def0d915fea94435a548ac0d15ed6c4f04f2 |     
   nios2     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/2ca2cc79503389689d5362afb064ebfbd63089a9 |     
  mips64el   |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/68c558b225b90a8d713e9e5f979b16bf427c5917 |     
microblazeel |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/e0db0a0781cb6bb17d98323b92ab31045415f9b9 |     
  sparc64    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/5279924e11705b1034f5183e56f0239ba9a94ff4 |     
    arm      |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/49e7d8413853521b1c84274555c078a793da96c5 |     
   sparc     |           aufs-util            | NOK | http://autobuild.buildroot.net/results/82acd004c7928a6c226d45fb1b83298a364f3670 |     
   sparc     |           aufs-util            | NOK | http://autobuild.buildroot.net/results/230324ce9fa69bf0606235db7b506240016e45a3 |     
    sh4a     |          bind-9.16.27          | NOK | http://autobuild.buildroot.net/results/9847bf47258833dca04d55ac78becfaf7b49ee67 | ORPH
  powerpc    |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/13b932c46d7ed323d28eddbe911fb0891ddcb0f5 |     
powerpc64le  |           brltty-6.4           | NOK | http://autobuild.buildroot.net/results/704d288eaa60b765fa18e182ab8895046a51d665 |     
    m68k     |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/59b983d59077f006b1bedfd55d935f52888e23be | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/27d0202d4a9a5178fc4b78673204a38e75eb4241 | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/7f96d5d6dcb563d1059108b6b01086cfb427e7e3 | ORPH
    sh4a     |         coreutils-9.1          | NOK | http://autobuild.buildroot.net/results/c985e94b8aff260ef29409314bc155b3ab20cc5c | ORPH
 microblaze  | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/3037fe022f9c5f5ce2a70d3e94539bdd36e4ee34 |     
   armeb     | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/d9dfba1c9b08cdbea6e64a729e66e51f1b06f27a |     
   armeb     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/c704982a4f212e982f68682ac002099540e3b4ec | ORPH
    arc      |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/5868fc43459c5225366da08e09854b7dad286dc0 | ORPH
   xtensa    |           dhcp-4.4.3           | NOK | http://autobuild.buildroot.net/results/b0618e49969f270191997998de6dd66c727360a8 | ORPH
    or1k     |        e2fsprogs-1.46.5        | NOK | http://autobuild.buildroot.net/results/581756796b06676a88af91391c86b36a26e48efa | ORPH
   mipsel    |         fdk-aac-2.0.2          | NOK | http://autobuild.buildroot.net/results/6692c747b06ea002c0ecdfd4f14855ce77ad72e9 |     
   sh4aeb    |           ficl-4.1.0           | NOK | http://autobuild.buildroot.net/results/7c0350751cbd2e6632d73fa6e08b9fc028f3fee4 |     
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/019efcc3fc4897c755a9aea8882453601fae53f2 | ORPH
    arc      |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/2a5c41e5d13421c284b2ae64a10c0a052a65786b |     
    arc      |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/86b0b7059a8404913433e2015aa4eebe7e7a5f03 |     
    arm      | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/ef7bff8ad0b8993847f31f7ab90818974ced950c |     
   armeb     | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/b767219da210debae103801442410c6efe560234 |     
   s390x     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/9a2bd8ae41430244e1ce310c373a61a12a155dd1 |     
   s390x     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/d9bd6d73680e731263cec0509df8dace90200fce |     
 microblaze  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/4fbabb28ce3075a9371db0d9b97e0e514d086629 |     
  riscv32    | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/9fbef0ea6bcf27b4163e886ccce209d794b715ee |     
  riscv32    | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/cc1355a2a0b70d705cf096277cb06d8014125633 |     
  riscv32    | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/e6634bba209bb738d903c9eeda9e919d9fe132a0 |     
   nios2     | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/b7563eb5f1357fb65e5fff5c9abf06c7917ae19b |     
  riscv32    | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/66f159788ff9ba2916234bf9afb54cdb5408b110 |     
  mips64el   |         gnu-efi-3.0.10         | NOK | http://autobuild.buildroot.net/results/657b58e70f87c1fdba99a591e2793f6214452376 |     
  mips64el   |         gnu-efi-3.0.10         | NOK | http://autobuild.buildroot.net/results/4c82cedf1976069a031abe0d7bb474935d4a9beb |     
  riscv64    |        gocryptfs-2.2.1         | NOK | http://autobuild.buildroot.net/results/5e6c74d4d5faa4058259b395852dc38b166def49 |     
  riscv64    |        gocryptfs-2.2.1         | NOK | http://autobuild.buildroot.net/results/bbde650c0a9c878a33420ad0254ec77b18a5b6fc |     
  riscv64    |        gocryptfs-2.2.1         | NOK | http://autobuild.buildroot.net/results/690809cfe712295d58624d23735d4891e03fbe53 |     
   x86_64    | gummiboot-2bcd919c681c952eb... | NOK | http://autobuild.buildroot.net/results/0a0ebdf82f2cb942a50eba627898404507cedb4c |     
    i586     |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/ebdb749f4e629b2c8ecba843085051263948bea0 |     
    arm      |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/8776beb3a14c9424f32659444b3db8cb8171ac3e |     
   armeb     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/9d085d7facc7446105b1cbce621c8d0be79c46e2 |     
    i686     |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/2d491375eb5a280603d809c06a875429edd76793 |     
    i686     |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/ae367aa061c7cfc30167012c3465236e1a5c5961 |     
   x86_64    |       host-gtest-1.12.0        | NOK | http://autobuild.buildroot.net/results/d8d2fa836c5a48ce68138ab0c51b899b5393087c |     
   arceb     |      host-harfbuzz-4.4.0       | NOK | http://autobuild.buildroot.net/results/4483c21f3e187de6693b0e8bd25075dff8e2c7a6 |     
   arceb     |      host-harfbuzz-4.4.0       | NOK | http://autobuild.buildroot.net/results/147e185f67f4e617f2162f5c8788627344e91e96 |     
  powerpc    |      host-harfbuzz-4.4.0       | NOK | http://autobuild.buildroot.net/results/0ca1ba4fa59248467d2bbe0601e4b2d07c530d91 |     
  sparc64    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/05b07c90482ff8a0c2add217405d4d47afa833f6 |     
microblazeel | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/c0932ddf98fbfa07f5874844dda2990c71547345 |     
  aarch64    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/51d69132042837583510d45f6f3af57241ff21e1 |     
    arc      | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/d4516b5ae2f79f97b663e0004693e308fc6e6b45 |     
    arm      |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/1fbe53eacccf0d16e9a038425fb03238032206d5 |     
  aarch64    |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/28495fc9648795ce8a6deabaf1bf944f96847110 |     
   armeb     |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/210a4e1f39dcc64ac10a0a599df447dcaf936b5d |     
   s390x     |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/ede9bd6f17b1034da9e230aeed2ac30ce0453d2a |     
    i586     | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/42603402963493793f0b179b8b2075e89ac9c5ac | ORPH
    arm      | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/e507ab608fd324a343a697839259cf6309c5f8f6 | ORPH
   x86_64    | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/ab32ee30ab6c840636eb6b426ce4cadd4a6871c0 | ORPH
    i686     |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/8e8f8991e0d28facddd198fafec364c1dbc3e658 |     
    arm      |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/a0b3cd34e10cd4c09bd8fe4fdb779e619cf99feb | ORPH
microblazeel |          janet-1.22.0          | NOK | http://autobuild.buildroot.net/results/57aaa0ef21e4990fecafa5def21ceaa535c013ee |     
powerpc64le  |        jpeg-turbo-2.1.3        | NOK | http://autobuild.buildroot.net/results/903fd905b72208286fbb7dd29243723ba2db58da |     
powerpc64le  |        jpeg-turbo-2.1.3        | NOK | http://autobuild.buildroot.net/results/a6cd4d21a6d3e1364a3ed9efaa004a322b514bcd |     
   mips64    |    libabseil-cpp-20211102.0    | NOK | http://autobuild.buildroot.net/results/ab55b6ea1371c0ba72d6f33a62061e947ddb5b54 |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/df1baba71d9543ed98c7894d92432bd517de4912 |     
 microblaze  |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/ccf4f8db433da6386e756bfe004e6384d7968db5 |     
 microblaze  |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/3352a5c5ff3fa070151251afe7ffb039732d3179 |     
  riscv32    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/0a1ae350df2159970eb6af935fc6b83579e99557 |     
  mips64el   |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/eaa532425e47e677b62c8dcbbf60541aa77d7c3f |     
 powerpc64   |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/f2ad6fde5443133e44c598f6b2c52a24b3bac095 |     
  powerpc    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/9e5bbefa0614133bcd8d179ce0af572acea6efc1 |     
    sh4      |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/ce33382218e91ae063111a322f34af83810c0256 |     
    m68k     |       libopenssl-1.1.1q        | NOK | http://autobuild.buildroot.net/results/a023738a5f7e78edf796ef5ab19baa725cfbe4cb |     
    arc      |       libopenssl-1.1.1q        | NOK | http://autobuild.buildroot.net/results/150acbf5715659930986c265262e5877e1bdbce8 |     
 aarch64_be  |       libopenssl-1.1.1q        | NOK | http://autobuild.buildroot.net/results/7c1f238635e5ed4fb03468620d340eed93d4c8f6 |     
   sparc     |       libopenssl-1.1.1q        | NOK | http://autobuild.buildroot.net/results/e752e233593f164920c317f6057377f46a750a1e |     
   sparc     |       libopenssl-1.1.1q        | NOK | http://autobuild.buildroot.net/results/6b91ad5ac5f2bcb10ac87bdbcf84c2ed5b3f9796 |     
    m68k     |       libopenssl-1.1.1q        | NOK | http://autobuild.buildroot.net/results/30aa797153253eebcb082f747991072e2629eb9e |     
   sparc     |         libressl-3.5.3         | NOK | http://autobuild.buildroot.net/results/1826cf881f0c1b5e8b9d6da7a53addfdc46e8ba7 | ORPH
microblazeel |         libvpx-1.12.0          | NOK | http://autobuild.buildroot.net/results/14d8d6b27c0e10fb250f45dbebdffab110a8ac60 |     
 powerpc64   |         libvpx-1.12.0          | NOK | http://autobuild.buildroot.net/results/3134267f1ff64f8a8f913389bb2b0032b09e1b0c |     
 powerpc64   |         libvpx-1.12.0          | NOK | http://autobuild.buildroot.net/results/b539566fe814dd9af9b4917f2ec1830a8288412c |     
powerpc64le  |         libvpx-1.12.0          | NOK | http://autobuild.buildroot.net/results/13ce3b3d3f7ee4f07f27aba90e03724c17f39b57 |     
powerpc64le  |         libvpx-1.12.0          | NOK | http://autobuild.buildroot.net/results/e7f49b951c7da37e557c4da99ce2249934e6cc17 |     
  mips64el   |         libvpx-1.12.0          | NOK | http://autobuild.buildroot.net/results/0f94439b20fb9bbb0f7eb31cf284a2bfd5b11e4c |     
   arceb     |         libvpx-1.12.0          | NOK | http://autobuild.buildroot.net/results/ff490324f591bddfd4af5be6119cd1e6f8be83cb |     
microblazeel |         libvpx-1.12.0          | NOK | http://autobuild.buildroot.net/results/a000e69addabd24df747372d8b856dcfce15ae05 |     
    m68k     |         libzlib-1.2.12         | NOK | http://autobuild.buildroot.net/results/fa9dc5fe3b64f4c68c799fd9004a675c27ce437f | ORPH
 powerpc64   |    linux-5.10.109-cip5-rt4     | NOK | http://autobuild.buildroot.net/results/4abe76a323a14f92f005113dcb1326293a1c2498 | ORPH
powerpc64le  |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/1a1e8228526ece842c80ee54342ea4ec76dd9e46 | ORPH
   s390x     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/b70a0e80a524ced29e3c2ebae3cbe0a8df8e9330 | ORPH
    or1k     |           mutt-2.2.6           | NOK | http://autobuild.buildroot.net/results/456f8ef7dcddaf2d9c04084d472dfca64257db59 |     
  aarch64    |         nodejs-16.15.0         | NOK | http://autobuild.buildroot.net/results/75d7812b61722fd98e5f946ed823a1f79cb5563a |     
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/41f76ef0ad762c715cfa8c829637c33fedd2df0c | ORPH
    sh4      |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/d3134e9e9ea62d7ab7e7b28d83a5c479aeb29edd | ORPH
  mips64el   |        openblas-0.3.20         | NOK | http://autobuild.buildroot.net/results/43357d0be257b920594de11fdb98ad8fe78adf6e | ORPH
   armeb     |           opus-1.3.1           | NOK | http://autobuild.buildroot.net/results/785f94a68fd76d1ccfcb8d0c0bc75b6365caa9fd | ORPH
microblazeel |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/e64c83a09566ce8a89b14348432e415f532b0c06 |     
microblazeel |      perl-net-ssleay-1.85      | NOK | http://autobuild.buildroot.net/results/ac36b0edb852b2c1a2d8ca9a4a80e547e3414419 |     
 aarch64_be  |           php-8.1.8            | NOK | http://autobuild.buildroot.net/results/891536343a23d8397567e74378a889af2b67f2a3 |     
    or1k     |           php-8.1.8            | NOK | http://autobuild.buildroot.net/results/37692d1ac40e5643cde97a102742475d1c5ce98d |     
    sh4      |           php-8.1.8            | NOK | http://autobuild.buildroot.net/results/6ff95544751eb3a3a9c96fe03a9ec7f2eabe79d0 |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/baecdc3dbe25730b527bf14af012fc5cf33929ac |     
  riscv32    |        poppler-21.12.0         | NOK | http://autobuild.buildroot.net/results/1ab2cd84998552e1dab04fa10bdb8bd5eb01149c |     
powerpc64le  |      powerpc-utils-1.3.8       | NOK | http://autobuild.buildroot.net/results/16e140b90bb064c35d88d6106f11e4400e2a14aa | ORPH
 microblaze  |           pppd-2.4.9           | NOK | http://autobuild.buildroot.net/results/0d1fc027bb1ac5a960b3201143e830ce85e5eb1a | ORPH
microblazeel |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/e069887df5bb5bbdb4b9cbdb9a712b18abf80e0d |     
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/bb1cda5acc03127d186bb0c4043767372b07cd50 |     
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/0a1ee39876abef93b0853748a63a3066c3e0d37b |     
    m68k     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/9229207a59dfc6193d3996d260abc3d46afbcae5 |     
microblazeel |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/3a15487d406727d02555969bfc63ee3517896128 |     
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/2badaf610a65034c296b041225cca2bee7339c41 |     
  riscv64    |       python-sip-4.19.25       | NOK | http://autobuild.buildroot.net/results/6e6bbee714b10e0f04c9d17b7e0ecce057d21d2a |     
 microblaze  |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/f2fb4665ff3f908a0f45962479d5e6a4fcd914d9 |     
   armeb     |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/f44f1956de826429f7f760d19a71a1c239446936 |     
   xtensa    |           refpolicy            | NOK | http://autobuild.buildroot.net/results/60e1e3f1479e913cc9730b149afa4f0b05309b56 |     
   mips64    |           refpolicy            | NOK | http://autobuild.buildroot.net/results/e416b1e7928ba4ec1c25290f493a1b30c5a24360 |     
 aarch64_be  |           refpolicy            | NOK | http://autobuild.buildroot.net/results/40f8db4ce791deeb99b3de55292fe66ce3c302bd |     
    arm      | rpi-userland-14b90ff9d9f031... | NOK | http://autobuild.buildroot.net/results/8487c04ca00f5735b30acc197d6e890b5e1a198c |     
    arc      |        rsyslog-8.2204.1        | NOK | http://autobuild.buildroot.net/results/4454ae5321df0c04c9dee19693f3908e69fbf23d |     
   xtensa    | rtl8189es-39c17661136da48f8... | NOK | http://autobuild.buildroot.net/results/b46d3ed00f03330e590ea0b2da85b9a72dbd9386 |     
    or1k     | rtl8812au-aircrack-ng-37e27... | NOK | http://autobuild.buildroot.net/results/76af20123d7d83a5d28dc180217e9bc6bf0f9d77 |     
  powerpc    |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/867749372176fde7221643533449f8b1bd53e713 | ORPH
  riscv32    |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/0b948be7f71be4ba65e1aa1ba84c4ac05d5e6844 | ORPH
powerpc64le  |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/3487ad0ad3c40c200368978f417055de06e22628 | ORPH
 powerpc64   |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/4b6ae70cc5880cb21ac8d5aa0b03c56d15cfee5f | ORPH
    or1k     |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/144874bca07e4e91fa2a6442f456a041f4e6b69f | ORPH
    mips     |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/ef31f57ba91b11cd21a366026d8194dc14c39a88 | ORPH
  powerpc    |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/3c4aa6c749b84e0b3e1452551ddc6703faa56122 | ORPH
  mips64el   |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/fc54e3be6420d187976129f1d77465e103c8f177 | ORPH
   mipsel    |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/d6812547e5e57bc04460e34733245564be82b893 | ORPH
    sh4a     |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/b8b13358bf8a22eebf44f67e2aec5d0748d84ce5 | ORPH
    arc      |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/3f1e2f3206f78acda1aa518e094b5a99ef66017b | ORPH
  riscv64    |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/328535c15ddee2d198054091b89bc0a74e206ab3 |     
microblazeel |        tcf-agent-1.7.0         | NOK | http://autobuild.buildroot.net/results/1e9cdd098878baccdbd0bafd4f9fc93f7ed1ac97 |     
powerpc64le  |         tinifier-3.4.0         | NOK | http://autobuild.buildroot.net/results/dffc21d05c463cc1fd88a9587aaa6d9e7fc2838d |     
  aarch64    |          tor-0.4.7.8           | NOK | http://autobuild.buildroot.net/results/da7a41eb700e195ed7fed68766a0b82054d5f6f6 |     
  riscv64    |          tor-0.4.7.8           | NOK | http://autobuild.buildroot.net/results/a3475146a9a480e0037c7a6f648a4104bf94d490 |     
    sh4      |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/6bcffd5ec5a433e54a54277a435ffd26e53c3276 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/c054db6943ad0ac3f268061939a15c4b9e00de18 |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/b2bb574411936bc71b4ff52c044f3f3371755072 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/820a89dcb4ac0e332999af1ba539667c6b68c476 |     
  riscv64    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/277199a2c9c5dd8e4f5557b0bbfc20b22ba50f34 |     
   x86_64    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/d2807beb93731325f0761ffdfdce99fbb6c3613e |     
    arm      | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/dd9aafa2bd778c6bc0b5814a313a1e5ebfe7e39f |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/5407c5dc42a5978533309d64916f34cf272944d1 |     
    i586     |            unknown             | NOK | http://autobuild.buildroot.net/results/9b44eab548191da9f18a9530483b85e337a25804 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/49780a043823e11cdce747f1a17143cb860c9a48 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/5966f2fd29276c03aa163cf888ad1f06ad7526e1 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/5e8619514c16aed84bc7dc3c8bee204f707e9fb5 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/637d3808b46caa98b29c1690a1d28fbdea628406 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/bdeb2bcd3006bc3f1104ad3d426870ae5086728c |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/85bdabd8098114e740b8757bda76b940d1364610 |     
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.net/results/f2dbe45a8af4c24288bee74da4ec18c6636f7d0c |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/4507a233b56c4cfa1c1340e33270cc46cd8f956f |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/b42260c06adc924c9f42f8af13e667a4121a5dab |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/45372fb38b69a68069d9072854567969ac17240a |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/c2d4c2ddd2b0c7c4888a552a7203a1c8b0608517 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/a06c82befe79d8d8b9e4633e03e1f1295c4fcd48 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/05d1e1c8252bcb9f7a0aecbd4b651bf55adb173e |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/1616d654eaa89fbd4f200198190fc822af4e454f |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.net/results/73cdbe4087a391d5a36a1775e435cf169d432dc7 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/6e50060852097b4dc953ee677d2daa3b85cb19f3 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/4b5c0467ff12a60bd8e7fd9ff73b41772ecfb467 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/4da6a8a23cb8fa75fd897af04db33884b0b14238 |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.net/results/70f0c085144d540b85f2733b376a664964d14190 |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.net/results/857e5a47844815257e029dda8f7e76dbd3677750 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/4d217bbe7a46948ab1c5613feecc5e62f63c1efb |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/d85687b8826b3e085561626142c025bebd3a1d2a |     
    sh4      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/d35449ad46bd3c5b010ac7e7d360c2de0c050c59 |     
   sh4eb     |      wpa_supplicant-2.10       | NOK | http://autobuild.buildroot.net/results/ba9f730204af62fa96cd8bbf5eb288f3494bfcbb |     
 aarch64_be  |            xenomai             | NOK | http://autobuild.buildroot.net/results/23d5df4b4bfd672f83b39d6a132368b59f0d20ca |     
    m68k     |         xenomai-custom         | NOK | http://autobuild.buildroot.net/results/5d9f47450b02475394b7f7164e186db85d4b7a54 |     
   s390x     |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/0b7bf8660e0c6944f75479a2aa3b261dc8a9e767 |     
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/263c43470f011ab46cdf935bed56cc682f7a92be | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/bc69495c8e5ae0ac4cb8a783dca579d21371e9f6 | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/9010eaff3539ca496a90cc9a615fcab77fda1b0c | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/b9994efb72accbb76ccedcf6c18e8ac7facc29f1 | ORPH
microblazeel |           zstd-1.5.2           | NOK | http://autobuild.buildroot.net/results/e62ef031fbb639d39bdbea0b1c069da461feca02 |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

           libfreeimage-3.18.0 | 3 
                 uclibc-1.0.41 | 2 
                    bat-0.19.0 | 1 
               libgtk3-3.24.34 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i586     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/7557cd6a4270c5e2aa19901ff3530f72b584cb41 |     
   sparc     |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/c67954e901b0c4b7afbe43f6684a5b123dd6b96f |     
  sparc64    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/e6dcaf62820a2190b7d74bc7385bd7f82d2d623d |     
    arm      |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/6e5f7d1cf18e069be6041238f6f40e263dc981f3 |     
   x86_64    |        libgtk3-3.24.34         | NOK | http://autobuild.buildroot.net/results/94d44f16f6fe9d2273d8ff49d1b4ec968eaf885d |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/6c8e75fe492a748e003299a7ebf32d1995a90385 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/3ce8e4097526f3a6f7d39655a787388a41bf6bac |     


Classification of failures by reason for 2022.05.x
--------------------------------------------------

               protobuf-3.20.1 | 3 
           libfreeimage-3.18.0 | 2 
                 uclibc-1.0.41 | 2 
                       unknown | 2 
/home/buildroot/autobuild/i... | 1 
              alsa-lib-1.2.6.1 | 1 
                     frr-8.2.2 | 1 
               gocryptfs-2.2.1 | 1 
         host-gcc-final-10.3.0 | 1 
           libwebsockets-4.3.1 | 1 
                 linux-5.17.13 | 1 
        ltp-testsuite-20220121 | 1 
                   perl-5.34.1 | 1 
                      pigz-2.6 | 1 
                 pixman-0.40.0 | 1 
rpi-userland-14b90ff9d9f031... | 1 
rtl8723bs-11ab92d8ccd71c80f... | 1 
       shadowsocks-libev-3.3.5 | 1 
           uboot-tools-2021.07 | 1 
                xenomai-custom | 1 
             zynaddsubfx-3.0.6 | 1 


Detail of failures for 2022.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/5da429c024ba47a4cb925464e350b41b27cf9409 |     
    m68k     |        alsa-lib-1.2.6.1        | NOK | http://autobuild.buildroot.net/results/adb00e985acab4106587b2675ea9aa5c3f6dd3df |     
  mips64el   |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/d674045fc75fef8009666bf529c2cc956d0581a6 |     
  riscv64    |        gocryptfs-2.2.1         | NOK | http://autobuild.buildroot.net/results/a985e5f2f0204183d047fcb3209a8ff0d72c4dd2 |     
    i686     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/421912803d7923f341abcba9c7ee3d35a88ca5ba |     
   mipsel    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/24924aa9e27a77267896ff1f5635825e2d24d1c7 |     
   mipsel    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/356b300774e8b2ad6f1658fefb33e7cbe5cd3aef |     
  aarch64    |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/18ee2dfa5b17f14f66fd727b51f0a1719e0d7ae9 |     
  riscv32    |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/8cc072694aa8519c9fbbc9dd010123f4a7299022 | ORPH
   mips64    |     ltp-testsuite-20220121     | NOK | http://autobuild.buildroot.net/results/d10e7e1f96425cc9e9d28f2682b3f2e89b08d1e7 |     
    arm      |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/795b2c02d02c2e04747f4e190eee2a563fbadfbc |     
microblazeel |            pigz-2.6            | NOK | http://autobuild.buildroot.net/results/26fc7cd49bb3fb61ef4b53248d01768a2b05d92a |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/55481b96b4eca620651c8bd8a30de862ccdb7a27 |     
    sh4      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/e3bcb781e5e71a2840a9f9d7290f097116cc46d6 |     
microblazeel |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/57efef5505b3286baf94731fb015acc8303627fe |     
    or1k     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/1175c1ae1fe8735323302ab1d2623c88bdb8d4cd |     
    arm      | rpi-userland-14b90ff9d9f031... | NOK | http://autobuild.buildroot.net/results/e0d67ae2d2368e0e0b69f89cf17f646cf68e0465 |     
   arceb     | rtl8723bs-11ab92d8ccd71c80f... | NOK | http://autobuild.buildroot.net/results/56e9b0ba22aad29038e77abbcfe4debd65c31a3d |     
    or1k     |    shadowsocks-libev-3.3.5     | NOK | http://autobuild.buildroot.net/results/3002f90b6a68075ee910a57b8165cff0c4589572 |     
  powerpc    |      uboot-tools-2021.07       | NOK | http://autobuild.buildroot.net/results/87c9cbab441ae5e7021387dafc8e59ccf509b6f4 |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/aa241327ead1b99138f2a99f13e4092bcd9be7db |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/43f4a93ad701939ef7aa9f028a0fa2ed8f9b9098 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/bd37ba4b3838f4edfde78e4f2c7bfd43554e8684 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/b77dc6769d15f24e73ff5e1df562c30fc158df72 |     
    sh4      |         xenomai-custom         | NOK | http://autobuild.buildroot.net/results/2b27674577f3d83bdf27eb2773977d066a0a48e9 |     
  mips64el   |       zynaddsubfx-3.0.6        | NOK | http://autobuild.buildroot.net/results/1c089308e35111cceeb9bb20d40cc2c968bb2ead |     


Gitlab CI results for 2022-07-15
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                amarula_a64_relic | https://gitlab.com/buildroot.org/buildroot/-/jobs/2720000868  |      
                         arm_juno | https://gitlab.com/buildroot.org/buildroot/-/jobs/2720000890  |      
                aspeed_ast2500evb | https://gitlab.com/buildroot.org/buildroot/-/jobs/2720000894  |      
                      bananapi_m1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2720000924  |      
                 bananapi_m1_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/2720000925  |      
                 bananapi_m2_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/2720000927  |      
                     bananapi_m64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2720000930  |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/2720000931  |      
                     csky_gx6605s | https://gitlab.com/buildroot.org/buildroot/-/jobs/2720000945  |      
          freescale_imx6dlsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/2720000963  |      
              freescale_imx8mpevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/2720000978  |      
               freescale_p1025twr | https://gitlab.com/buildroot.org/buildroot/-/jobs/2720000987  |      
           friendlyarm_nanopi_a64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2720000999  |      
            friendlyarm_nanopi_m1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2720001002  | ORPH 
       friendlyarm_nanopi_m1_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/2720001003  | ORPH 
           friendlyarm_nanopi_neo | https://gitlab.com/buildroot.org/buildroot/-/jobs/2720001014  |      
          friendlyarm_nanopi_neo2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2720001009  |      
     friendlyarm_nanopi_neo_plus2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2720001017  |      
            friendlyarm_nanopi_r1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2720001019  |      
                          galileo | https://gitlab.com/buildroot.org/buildroot/-/jobs/2720001026  |      
                       imx8mmpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/2720001058  |      
                        imx8mpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/2720001060  |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/2720001065  |      
                    licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/2720001073  |      
        minnowboard_max-graphical | https://gitlab.com/buildroot.org/buildroot/-/jobs/2720001092  |      
              octavo_osd32mp1_red | https://gitlab.com/buildroot.org/buildroot/-/jobs/2720001116  |      
        olimex_a20_olinuxino_lime | https://gitlab.com/buildroot.org/buildroot/-/jobs/2720001125  |      
       olimex_a20_olinuxino_lime2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2720001124  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/2720001152  |      
                     orangepi_pc2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2720001153  |      
                    orangepi_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/2720001161  | ORPH 
                   orangepi_prime | https://gitlab.com/buildroot.org/buildroot/-/jobs/2720001164  |      
                     orangepi_win | https://gitlab.com/buildroot.org/buildroot/-/jobs/2720001170  |      
               orangepi_zero_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/2720001176  |      
                           pine64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2720001186  |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/2720001187  |      
                qemu_m68k_mcf5208 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2720001200  |      
            qemu_microblazebe_mmu | https://gitlab.com/buildroot.org/buildroot/-/jobs/2720001205  |      
            qemu_mips32r2el_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/2720001214  |      
                      qemu_x86_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2720001293  |      
           qemu_xtensa_lx60_nommu | https://gitlab.com/buildroot.org/buildroot/-/jobs/2720001301  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/2720001321  |      
               stm32f469_disco_sd | https://gitlab.com/buildroot.org/buildroot/-/jobs/2720001384  |      
              stm32mp157c_odyssey | https://gitlab.com/buildroot.org/buildroot/-/jobs/2720001388  |      
                            warp7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2720001400  |      
                        warpboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/2720001401  |      
                       zynq_zc706 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2720001404  |      
                zynqmp_kria_kv260 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2720001406  |      
                    zynqmp_zcu106 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2720001410  |      



-- 
http://autobuild.buildroot.net

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

