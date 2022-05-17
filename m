Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8E11C433EF
	for <buildroot@archiver.kernel.org>; Tue, 17 May 2022 04:44:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3DDE940C4F;
	Tue, 17 May 2022 04:44:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OlOultt1aQkc; Tue, 17 May 2022 04:44:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 42F5040408;
	Tue, 17 May 2022 04:44:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C95DF1BF2A3
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 04:44:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C540960B6A
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 04:44:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X2DcezzDSmbL for <buildroot@lists.busybox.net>;
 Tue, 17 May 2022 04:44:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0E86860B1B
 for <buildroot@buildroot.org>; Tue, 17 May 2022 04:44:34 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E1BC320008
 for <buildroot@buildroot.org>; Tue, 17 May 2022 04:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1652762672; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=nsIDqeGHPJS7ZKy35dKB0rDy3pJNnRO1PABl/H3VX9Y=;
 b=dagn6JwjwUejHobEMYhpnYV9LY/DtNufufiIJAglZgkiZMGJntSAQSbtPHYmSg2mTFZtjQ
 qmh3ovnVTv1KW3VHcWHUsb7VGpTn+HCBM0jyg3U47VOzMYsEHeCUZCcTwKf1Y2hJl+A5+N
 +ZCX5WZ1zcL6V02YH9T6R+Jqu/byyPvPUe/eH9ojwPza1mN7dXHdTQw1pFUx8wyYks5UPC
 TrToawpTQSF5cdOwyYNumrBNxT78O0gnkjn6IGl57RM2d5yrS+vtq1fNWWrfpWLB+W0x9E
 LOx4PBQZkhapMrLhT9RAQBP1WpmdgahTtoz+qaDwBa5kFot9qhco2dzzDrP/0A==
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Tue, 17 May 2022 04:44:31 -0000
Message-Id: <20220517044437.C540960B6A@smtp3.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-05-16
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

Autobuild statistics for 2022-05-16
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  | 26  |  8  |  0  | 34  |
    master   | 158 | 210 |  0  | 368 |

Classification of failures by reason for master
-----------------------------------------------

           optee-client-3.17.0 | 22
         host-gcc-final-10.3.0 | 20
                 uclibc-1.0.40 | 12
glibc-2.35-6-g491f2ef1f0ff8... | 11
             libopenssl-1.1.1o | 9 
          host-gcc-final-9.4.0 | 7 
               protobuf-3.20.1 | 6 
    toolchain-external-bootlin | 6 
                       unknown | 6 
              swupdate-2022.05 | 5 
       linux-5.10.104-cip3-rt3 | 4 
                     refpolicy | 4 
                 zlib-ng-2.0.6 | 4 
              alsa-lib-1.2.6.1 | 3 
                busybox-1.35.0 | 3 
                host-go-1.18.2 | 3 
              libostree-2022.3 | 3 
                  netsurf-3.10 | 3 
               pipewire-0.3.50 | 3 
toolchain-external-bootlin-... | 3 
                xenomai-custom | 3 
  gobject-introspection-1.70.0 | 2 
               gocryptfs-2.2.1 | 2 
       host-gcc-initial-10.3.0 | 2 
               libglib2-2.70.4 | 2 
                libressl-3.5.2 | 2 
                  linux-5.17.7 | 2 
                mongodb-4.2.18 | 2 
                  ndisc6-1.0.5 | 2 
                nodejs-16.15.0 | 2 
                   perl-5.34.1 | 2 
                  sudo-1.9.8p2 | 2 
                     ace-7.0.6 | 1 
                    apg-2.3.0b | 1 
                     aufs-util | 1 
                 augeas-1.12.0 | 1 
                    bird-2.0.8 | 1 
                bitcoin-0.21.2 | 1 
                  boost-1.79.0 | 1 
               collectd-5.12.0 | 1 
docker-proxy-339b972b464ee3... | 1 
                   eigen-3.4.0 | 1 
                elfutils-0.186 | 1 
fs/cramfs/cramfs.mk:46: /nv... | 1 
fs/romfs/romfs.mk:32: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
              host-delve-1.8.0 | 1 
         host-gcc-final-11.3.0 | 1 
host-gdb-arc-2020.09-releas... | 1 
host-google-breakpad-c85eb4... | 1 
host-pahole-73383b3a39afe86... | 1 
              host-rust-1.60.0 | 1 
                ipmiutil-3.1.8 | 1 
                  kexec-2.0.23 | 1 
     kvm-unit-tests-2022-03-08 | 1 
                  libftdi1-1.5 | 1 
                   libnss-3.78 | 1 
                 libusb-1.0.25 | 1 
                 libwpe-1.12.0 | 1 
                libzlib-1.2.12 | 1 
           linux-5.10.104-cip3 | 1 
         multipath-tools-0.8.9 | 1 
                    musl-1.2.3 | 1 
                   ncurses-6.1 | 1 
                    ne10-1.2.1 | 1 
                  octave-7.1.0 | 1 
                    opus-1.3.1 | 1 
                 pixman-0.40.0 | 1 
                    pppd-2.4.9 | 1 
            python-ujson-5.2.0 | 1 
                rng-tools-6.15 | 1 
rtl8189es-39c17661136da48f8... | 1 
rtl8723bs-11ab92d8ccd71c80f... | 1 
                    ruby-3.1.0 | 1 
       shadowsocks-libev-3.3.5 | 1 
                   uacme-1.7.1 | 1 
                 wavemon-0.9.4 | 1 
                       xenomai | 1 
                    zstd-1.5.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |           ace-7.0.6            | NOK | http://autobuild.buildroot.net/results/2dd6d61af4abbc9b58d40770abce9328e647bac7 |     
    or1k     |        alsa-lib-1.2.6.1        | NOK | http://autobuild.buildroot.net/results/0200cbd674c5986973b094aeea527fa86c78df80 |     
    m68k     |        alsa-lib-1.2.6.1        | NOK | http://autobuild.buildroot.net/results/9655edd1b726f0a5e95dad938ce995715dfe8cda |     
    m68k     |        alsa-lib-1.2.6.1        | NOK | http://autobuild.buildroot.net/results/ff3b2b93999d14b6b3bf142827cd30be9d1024c2 |     
    sh4a     |           apg-2.3.0b           | NOK | http://autobuild.buildroot.net/results/b9a80ac20bbbcf8f4a232c2143c81d5064bf760f |     
    or1k     |           aufs-util            | NOK | http://autobuild.buildroot.net/results/3d0d0c81f67347968f554e007bd59f4026e3fbf7 |     
  riscv64    |         augeas-1.12.0          | NOK | http://autobuild.buildroot.net/results/0585ec8cd0579db15c39ce83d4e35fc1985e7ffa |     
  mips64el   |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/5fb9a4585d59eee3403e88df0765c64122c9ff11 |     
   mipsel    |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/821d1710933e7244d6bf17544e670982d570d055 |     
    arc      |          boost-1.79.0          | NOK | http://autobuild.buildroot.net/results/eb8d145e38b0ea1238b6c50b2fbf0a9ddc47d91b |     
    m68k     |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/adf6341cb94656bbc1532ad3148b1f9d55bbb097 | ORPH
    m68k     |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/338f6d8f959809e732f5f5e0d28df10a81aa5915 | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/1b44fa2c2de161dec2ead97b6db57c6b82648941 | ORPH
    arm      |        collectd-5.12.0         | NOK | http://autobuild.buildroot.net/results/1659d847a6c3919da282243a15c8d2ccac2380d9 |     
   x86_64    | docker-proxy-339b972b464ee3... | NOK | http://autobuild.buildroot.net/results/789e54fe3efb537c47a0b0f290461f0d8b6ab01d |     
  powerpc    |          eigen-3.4.0           | NOK | http://autobuild.buildroot.net/results/0289bb8ef567134d6616791fdaac044fcf66dccb |     
   arceb     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/1c375919263a355a44b15350a3937afd786b960b | ORPH
    or1k     | fs/cramfs/cramfs.mk:46: /nv... | NOK | http://autobuild.buildroot.net/results/44b80987bfd4ae938c7e72652a8097c7490c8f7e |     
   armeb     | fs/romfs/romfs.mk:32: /home... | NOK | http://autobuild.buildroot.net/results/f0e9bb7a5cd2aaf1550e0b3cfaa8d9d676e3ffba |     
    mips     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/d8e99866441319c4767a3d1ae26f5e507c91d6be |     
    sh4a     | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/2124fcea6463f71db162d401442ca9c86b483d01 |     
   mips64    | glibc-2.35-6-g491f2ef1f0ff8... | NOK | http://autobuild.buildroot.net/results/9942eabea9a062e2a2ac218bd3dd84c7b599f413 |     
 powerpc64   | glibc-2.35-6-g491f2ef1f0ff8... | NOK | http://autobuild.buildroot.net/results/4efb9e210abf9ff14d93101df30cde3f5aea7625 |     
powerpc64le  | glibc-2.35-6-g491f2ef1f0ff8... | NOK | http://autobuild.buildroot.net/results/92c2b45a6b703b2b957b779a667c37aec5d93bf5 |     
 powerpc64   | glibc-2.35-6-g491f2ef1f0ff8... | NOK | http://autobuild.buildroot.net/results/50924c9eb048f11bd06104a465221ea23b498425 |     
powerpc64le  | glibc-2.35-6-g491f2ef1f0ff8... | NOK | http://autobuild.buildroot.net/results/215869e0a8c61db9ad9d756738d0433b0efd1952 |     
   s390x     | glibc-2.35-6-g491f2ef1f0ff8... | NOK | http://autobuild.buildroot.net/results/46a985a5945e523783ea9602bb1ca33738f449d5 |     
  powerpc    | glibc-2.35-6-g491f2ef1f0ff8... | NOK | http://autobuild.buildroot.net/results/c4c298d3822675f0bb7d4ccbf93d096e69dad468 |     
powerpc64le  | glibc-2.35-6-g491f2ef1f0ff8... | NOK | http://autobuild.buildroot.net/results/d1e3fa1d98525486b58fefe87aaacbdd241affdb |     
 powerpc64   | glibc-2.35-6-g491f2ef1f0ff8... | NOK | http://autobuild.buildroot.net/results/c42c1de1613cb833592c5edcfa9b110a4293e591 |     
powerpc64le  | glibc-2.35-6-g491f2ef1f0ff8... | NOK | http://autobuild.buildroot.net/results/c200aa8432c00a1576e64eab593fe746eeae0429 |     
   armeb     | glibc-2.35-6-g491f2ef1f0ff8... | NOK | http://autobuild.buildroot.net/results/78fb246112b7e9f38ea2d248000b3bd221757639 |     
    or1k     |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/70112d2a4576ce5f7b747b0910b3ba4a33a05963 | ORPH
   x86_64    |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/ab1f8a2549e87beccf522ebe54d455994de170f5 | ORPH
  riscv64    |        gocryptfs-2.2.1         | NOK | http://autobuild.buildroot.net/results/6e3c764e9fd22cbdf5b5e362de0bbf4a29530938 |     
   x86_64    |        gocryptfs-2.2.1         | NOK | http://autobuild.buildroot.net/results/4d5a77147d022615e23543128a9c3221896dadd9 |     
    arm      |        host-delve-1.8.0        | NOK | http://autobuild.buildroot.net/results/11fedfd0935a2b366966b10936259f80e2639495 |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/ca7f15263b1d0c1d8ec5cb273d48b5e355bef2ea |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/bc53609298162416eb91a54c809b5fdbb24f285d |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/afb1a94fa5afedfaa432b17ec2701df45f704800 |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/4e39c813379cff23830205c329cf68cec463fc5a |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/b452d354a66495c7ed9ea84ede228df70c5a28fa |     
  riscv32    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/6f27ce87c3c1141cc77fcaf90734af7557f426cd |     
  riscv32    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/b71958f88c568209a393645642e4745c5e74042e |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/19886e8f316811fb43a04fa6b8a77abf2b42302d |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/037ffefbff69152278273069d781cc16d1f38ff9 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/060b16dd54320aab106d46596e9780b04f379cf6 |     
    i586     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/e5aafd19807066dfea386c4de2441bff143b1ca3 |     
  riscv32    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/882d9e4ec23802ccef9c1eb951e1403dae9012e9 |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/2e5e49eca93dc3a5bd6521aeb46c956c207547b2 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/5856879a77b0e047624ae572fbc49c3aecdd8689 |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/d419994b47a95ee801a9944033152a37fbe7d3e3 |     
    i686     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/caa1865b2cd71fdb9cc3fc33e8ec0777b456edde |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/6d883aa66b97125e2c13a4296d8f9e819b57668e |     
  powerpc    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/99b1d8c74360986c3739b5e217c7e2a6400554c8 |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/a4b110fcd8cd9d7b087a6f49551783aa1e28894c |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/1955fe4c515cf584684822b8c2f2eb6b66e021bb |     
   s390x     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/907088db6a61af91d8aaede629a6f5171d038708 |     
   s390x     |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/0d6ddf02bb19f5341f21912030585e88227d7f94 |     
  sparc64    |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/3d3ee8856c3d395f0cfc1ac8e8868cee1a4a1807 |     
  riscv32    |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/7668105162e4a5dc1de6c92f905e6b8ffdcd460e |     
   nios2     |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/9d5585a88a5d35bb8e0cdc2c30c4f84b0426a292 |     
   nios2     |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/a36b904191bcd4b995db271b19820e2cef4dcc1d |     
  sparc64    |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/d6df15c95fa4b97584205f55d975da559a5f823f |     
   nios2     |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/059e3b7fac7eeab4648caffb218bddc726ff2179 |     
   armeb     |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/5d9d8b47fec8977019f26d764a73efa587e4c368 |     
    arc      |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/27c1837c4164f2e5a8638016568b5105f9b9fd2a |     
   arceb     | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/8d525723082af63e9ac4b99fada4cd54002ff89b | ORPH
    i586     |         host-go-1.18.2         | NOK | http://autobuild.buildroot.net/results/8815ec5777199913d1c3e86d8d9a2ac0a3bd88fe |     
  mips64el   |         host-go-1.18.2         | NOK | http://autobuild.buildroot.net/results/1dba23fe9c2e7e700c1ca3ac252ff8a6158d755b |     
  mips64el   |         host-go-1.18.2         | NOK | http://autobuild.buildroot.net/results/5ce8876b2854d4a57084680c9b737945ee503dee |     
    mips     | host-google-breakpad-c85eb4... | NOK | http://autobuild.buildroot.net/results/424e119b9c28f2cb55e679389224643a66a728a7 |     
   x86_64    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/cc556f0cb7ed2a794f59d13b18e86cf75e707ba6 |     
    i686     |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/b1422a3bde1065cf746d21152f057c4037ef43f6 |     
    i686     |         ipmiutil-3.1.8         | NOK | http://autobuild.buildroot.net/results/d27facee4752b649d1f664f723eabc6ee7d51809 |     
   armeb     |          kexec-2.0.23          | NOK | http://autobuild.buildroot.net/results/757904d0d0d968d36b3a9347a524d3392a8e11b6 | ORPH
 aarch64_be  |   kvm-unit-tests-2022-03-08    | NOK | http://autobuild.buildroot.net/results/294c07adae1d42167e602efe143ff11b08316398 |     
   sparc     |          libftdi1-1.5          | NOK | http://autobuild.buildroot.net/results/5fe10f2f0e39030ca438f529fa9e20bb47918e2a |     
    arc      |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/c7d0246a04f652c521a2daca46c960daac0fef10 |     
   arceb     |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/739292db7ef878aecc5db8a97f9ada44d30ec99d |     
  aarch64    |          libnss-3.78           | NOK | http://autobuild.buildroot.net/results/44502a14b9424c047d0921279555beb1fcd30761 |     
    arc      |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/b62a9b0877fa909df16d6e65eb997ec7c4d82171 |     
   sparc     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/11006039bbe3e3ab08b9eda5769f58a83b4c70cb |     
   sparc     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/d78b8b9b1bf4cec2f00fc04c8c886389d84569fd |     
   xtensa    |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/6c9adb9240b4545d91e88efb79cdc75b0a01e990 |     
   arceb     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/9033df470116865cf278a7799715a65c2d5768c2 |     
 aarch64_be  |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/b9c3e5caa543582b0ab57e5f46214e724cbb8319 |     
   sparc     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/b5a02db3f27edde0a017588f01549e9efef622db |     
    arc      |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/dbc99d825c7103ad399d087ec886047022e535fe |     
    m68k     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/350290de4a4f938ecf62507799a2482bf4474a28 |     
   x86_64    |        libostree-2022.3        | NOK | http://autobuild.buildroot.net/results/e9236772eebf9f3ac45e70dfa4fc3bd4b5e29bf9 |     
  sparc64    |        libostree-2022.3        | NOK | http://autobuild.buildroot.net/results/37b4a182f9a7a6f2b9e0d50163683aca1222b9e6 |     
  riscv64    |        libostree-2022.3        | NOK | http://autobuild.buildroot.net/results/46213f6a531f7e9933d22eadf70502e6acbe6f71 |     
   x86_64    |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/52f0eebbc23034965cd568483569078a8196a27b | ORPH
   sparc     |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/3e56acc00e5a6c4076ce4046464dc710905b8ce8 | ORPH
    arm      |         libusb-1.0.25          | NOK | http://autobuild.buildroot.net/results/73e8f97c87b1fd06113e4459bdb191ba4f30f2ef |     
 powerpc64   |         libwpe-1.12.0          | NOK | http://autobuild.buildroot.net/results/9bd4701646ede41664e7acf9d29284e5c7f9be26 |     
    m68k     |         libzlib-1.2.12         | NOK | http://autobuild.buildroot.net/results/0dcee7c3cbb400a74dbd1f3e7fc1f8b14ec19e0b | ORPH
   mips64    |      linux-5.10.104-cip3       | NOK | http://autobuild.buildroot.net/results/43723f57c215d4dad161c79179f72b2cb8d364a2 | ORPH
   mipsel    |    linux-5.10.104-cip3-rt3     | NOK | http://autobuild.buildroot.net/results/2c82c51c0b3b8ebeec3c6dcb0de23dc750b1d193 | ORPH
   mips64    |    linux-5.10.104-cip3-rt3     | NOK | http://autobuild.buildroot.net/results/e52202faccb62d6241c97c5ace548f49ce3b5ea8 | ORPH
    arm      |    linux-5.10.104-cip3-rt3     | NOK | http://autobuild.buildroot.net/results/2e88f89063702d47bc4ffb9bc6cd4ad0761b573d | ORPH
   mips64    |    linux-5.10.104-cip3-rt3     | NOK | http://autobuild.buildroot.net/results/60a86c8c93fb1a8f2094513d1b96968c599a66e9 | ORPH
powerpc64le  |          linux-5.17.7          | NOK | http://autobuild.buildroot.net/results/a2a737ea15f477d9257cb7fd74fa362a8b272c05 | ORPH
   s390x     |          linux-5.17.7          | NOK | http://autobuild.buildroot.net/results/2f996605a554fcc833356700a43f02c95ec664be | ORPH
    arm      |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/ccc3245b881871772fc05552c6e8848c6ccad60b |     
    arm      |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/222258cc803f05ef40a475a0eee5283d0aa80a40 |     
    i686     |     multipath-tools-0.8.9      | NOK | http://autobuild.buildroot.net/results/e2fc757bd6130aa3476e0c40e7a771ca9de20f15 |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/735f64ca7740ea2df98f041eccc86716d335ce94 |     
  riscv64    |          ncurses-6.1           | NOK | http://autobuild.buildroot.net/results/88b719e33afd2ef545491a49e030dfb47b967000 | ORPH
    arm      |          ndisc6-1.0.5          | NOK | http://autobuild.buildroot.net/results/ccb6afb4013e8b71295f30115de2a3fd37e2db9e | ORPH
    arm      |          ndisc6-1.0.5          | NOK | http://autobuild.buildroot.net/results/a67144a7b67c352471b45c1944c22bcf67ac7454 | ORPH
  aarch64    |           ne10-1.2.1           | NOK | http://autobuild.buildroot.net/results/ad7edb63a626ada05f1723f8fd5ef3d412a03853 |     
    mips     |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/ac31e376c19fc22024bd480b4cb3016e67ab35fd |     
  sparc64    |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/93dd64a265e24ef06d1f0cea6e8e65cde2447640 |     
    mips     |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/0d893423f2991f9782a988d8076991b8efd91a1e |     
   x86_64    |         nodejs-16.15.0         | NOK | http://autobuild.buildroot.net/results/0176acf22f41f89ff5026baac8b7f40b5962260e |     
   x86_64    |         nodejs-16.15.0         | NOK | http://autobuild.buildroot.net/results/a23056f8c68ba186a0b090c7b1a1b019d259f438 |     
  aarch64    |          octave-7.1.0          | NOK | http://autobuild.buildroot.net/results/23ae19fcc55f76bc3b493d28965f6979897a0474 |     
 powerpc64   |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/22c47b1cd927c1554ade93759e69eccb02826ac5 |     
  aarch64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/705dd1d48da959fd44a6cd50d8340a22d75de55d |     
   x86_64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/7436fd9289263b2fa3065e161fb27f2a014ff170 |     
   nios2     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/c138f12238a4c6aee682c75d503b9c52cad9876f |     
   sparc     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/ac980974b3887092269ea800cccbabef179ccfe9 |     
    or1k     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/dd07ab6ddc4651e6a450bc707e8ef44c8a6cce8e |     
   nios2     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/6e4cbd1032bb87f1189ce443761311d97fca9b17 |     
   arceb     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/10e3f496bf512cb637c05078008daba3d4f61a35 |     
    i686     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/50d0192453d424f8b267aecc1a3ad9219b86cfe5 |     
   x86_64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/d2f3c199bff071b3444b039e60efed62894ad47f |     
    i686     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/f8d5b3dede6338091a18b431f3318ca4b19f46f7 |     
    m68k     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/b7a2e4651bbe4aa741f253cb6ed8e4b450671896 |     
 aarch64_be  |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/2711f507b4ef0ebb92ad0c15e013069c41739f19 |     
    or1k     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/841a3f8a0d967442ea3684748fadea31657bf618 |     
   s390x     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/e46378aa24d8d4544555211a17c0463a12b6d1a3 |     
  riscv32    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/230d3327ee3f1cebcb10e5a0066916118e57d2a6 |     
   arceb     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/d3ccf2681976fa28d11679382f6d31ab6069fd47 |     
   armeb     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/cbffc30aa0c3ad3687760b0eb38f858612e219a3 |     
microblazeel |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/f390072b8ac8ef96aa3f363b8aadb7322952b53e |     
  mips64el   |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/e9b91899c218598a231c8098895192ead7b6a8d7 |     
  mips64el   |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/9c17dd04957cafa07c2b4bdba147c858bc9b1faa |     
    arc      |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/6598766ba0a23b5747b9767cfa5bfd47182f6a53 |     
   armeb     |           opus-1.3.1           | NOK | http://autobuild.buildroot.net/results/18345584794c15114b53ffb5e48e4cf94173e09b | ORPH
  aarch64    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/9cf6e1ae01f0ae94a9f5413f7927278e17d1ebdb |     
 aarch64_be  |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/d8bc7367516273018a1dc04c7e9573c825bcf0d6 |     
  mips64el   |        pipewire-0.3.50         | NOK | http://autobuild.buildroot.net/results/867e3247728032121854c388625a966884ae3fee |     
  mips64el   |        pipewire-0.3.50         | NOK | http://autobuild.buildroot.net/results/19235fb3f13cf11a26ae428c9e11abf4e61f316b |     
    arm      |        pipewire-0.3.50         | NOK | http://autobuild.buildroot.net/results/a4dfc675171f90867e7adb012a07886493cd8e9b |     
    sh4a     |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/018783fd83646a8a0ac0ea505615977196f52d8b |     
 powerpc64   |           pppd-2.4.9           | NOK | http://autobuild.buildroot.net/results/78d07dc5ef70235410969d10193c85768035a3b1 | ORPH
   nios2     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/b978f6eab90bce2f82bb10b5bf85682adcbd10f0 |     
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/e00203922fb9e61b9998cdbc9e5c759caeb6f5ba |     
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/0606d038ba28420dd43171c2c8410fac2da49bc0 |     
microblazeel |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/4021ac297cd63a2779372db0f1253b6d66479151 |     
    m68k     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/4604fae085b5d8a8aa2eb6b6db16d7aee8fcfcb6 |     
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/3f8869bb5f4c29af751269a599cc1e22b454cad3 |     
    arc      |       python-ujson-5.2.0       | NOK | http://autobuild.buildroot.net/results/d0e81818935ec78e9543feac5464681d6ed7f46b |     
    i686     |           refpolicy            | NOK | http://autobuild.buildroot.net/results/1b352b5b736ecd8f1f69b6953236fa9ac108e875 |     
   arceb     |           refpolicy            | NOK | http://autobuild.buildroot.net/results/0dd4971fbb6f0d6953c16802032f362df8e6c201 |     
   mipsel    |           refpolicy            | NOK | http://autobuild.buildroot.net/results/340f8c75c3915c28f471fe1b94f24018bbb3f1ae |     
    i586     |           refpolicy            | NOK | http://autobuild.buildroot.net/results/49188513a24eadb634e509abfed84f4c868d007c |     
  mips64el   |         rng-tools-6.15         | NOK | http://autobuild.buildroot.net/results/a3eeb666c5a768bf7852a75d094e80776850fb6a |     
    arc      | rtl8189es-39c17661136da48f8... | NOK | http://autobuild.buildroot.net/results/011eb59615b8d98aa485456446b541d4a3ec03f5 |     
  aarch64    | rtl8723bs-11ab92d8ccd71c80f... | NOK | http://autobuild.buildroot.net/results/2e1ed4a24407c52a90cbb35ef4353ac7030de1a9 |     
  riscv64    |           ruby-3.1.0           | NOK | http://autobuild.buildroot.net/results/965be8df28bb039e3645e9b4aeb2acb2d8ae95a8 |     
 microblaze  |    shadowsocks-libev-3.3.5     | NOK | http://autobuild.buildroot.net/results/b2bae2038779af0dfd955fe6a991a853556d9f4e |     
  mips64el   |          sudo-1.9.8p2          | NOK | http://autobuild.buildroot.net/results/bbae7b5f1c5411859cce855d0d0876eaaa3645e4 | ORPH
   mips64    |          sudo-1.9.8p2          | NOK | http://autobuild.buildroot.net/results/4a99bcb1d57013f68eb86451372118aff1fa6c0c | ORPH
   mipsel    |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/b03293aa6234313c48068c385cd5d50a8752198a |     
    m68k     |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/6bef7408617033f295fa6ded1a4aee313148f5bb |     
microblazeel |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/44218ca5441141f52e1b455739805fd0404b3d12 |     
microblazeel |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/94460f1a272d1e6c1ead14b2c8f3b6936d703fe9 |     
    arm      |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/4ce5468cc79fadc823fe8671f8d20295ce7c1890 |     
   nios2     |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/4580a645f30db9998ae9a460f57da695fd3f5a4e |     
   nios2     |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/1632931a75147a77044dd09add8be8c16fe538c0 |     
  sparc64    |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/b8e6d7d4dd4cd65eb5dc22b774f6f0227b374ecb |     
   mips64    |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/57d7bffa2538abd47dcc37e1c89e026d764d5d27 |     
   mips64    |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/1f6c99f28d75f3f9320380ed940c5fab839f1fd9 |     
   mips64    |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/111e7206db1f79007c1b4322c80938302830949c |     
   armeb     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/04b89579fdb998aeed34216341e0a62bc013bd3d | ORPH
  riscv64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/e22f550115df231f5ef36e18f0beb3562454676b | ORPH
   armeb     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/82847cc184157f83a6bb3846ec1ff0e7abbf34af | ORPH
  mips64el   |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/b358c6be4f2b4f2cb91cfda673b49c83a72fbdd9 |     
  riscv64    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/7f4f5d86b9c92b2ae5e52062453dc8c912ab8a0e |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/d102005486fedaf71ac3d7974fb5c931d633b484 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/ffa542d20cd866f22b667b26ce95341515ec0b3e |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/fa74eb6c8d343166fa58f8d3784a472d2061d8da |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/a50b7bd74fd7051c97b4594a7981058861d01323 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/960bc5f9a6ccdfe5d090a4e0a38f37aa7ef4314f |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/b1e5064398d5f2db7f1f8895a79613aab5915260 |     
   arceb     |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/c95f60bedc073bdda721170e1933be4b6fd96c03 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/ce824cac9cf7245bd7cd639dc9c8c0cddcc6148c |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/939b97a9045c9a0c516c14767069d8b3ea9c20cb |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/cfe776c5132da72851cc2b0e10f018f49838fd0d |     
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/4cae1538201f5d0747cb9a665cc48aed3dd3a4b9 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/365fa0a153e10dd8e3a54a804bc8d7c22c538389 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/99d08e674cf2e0b508e27ecf332204ebf9b17746 |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/3de6c9bd9635dce9b735cef34e2340a34c597cd2 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/8e81c21997dc96768aef847d810f6d0457b16726 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/fe26b9d881dfd1cf70df1e2cc8303f6d4acc6a8c |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/58613187e4da532f3b24957de82a80598a439c39 |     
    arm      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/ed02e87c07a215d017836dda9c7af7b8881aff53 |     
   mipsel    |            xenomai             | NOK | http://autobuild.buildroot.net/results/84b0c44ea2376b67b3e2447163947981573f9972 |     
microblazeel |         xenomai-custom         | NOK | http://autobuild.buildroot.net/results/41f601dfb875cfe16f14707cdfe40465a2e4e921 |     
  riscv64    |         xenomai-custom         | NOK | http://autobuild.buildroot.net/results/0c7b620e14ec99a1402a02fb2d6c751d1d4f3680 |     
 powerpc64   |         xenomai-custom         | NOK | http://autobuild.buildroot.net/results/bfc071694b86cbbcb6cdf28654192778b3bd819f |     
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/225bb25b026099ea51c0d232fb11bee9413ed332 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/3b122e064c81b5f0f7c1b17671078b5c01084c11 | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/5642318039c011fba1ea317e74a2d83f484f8fb9 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/711e21f4cb50512b3497e5d0fdb6551805c2589b | ORPH
 microblaze  |           zstd-1.5.2           | NOK | http://autobuild.buildroot.net/results/ba40a64db05eda373af08527aedb6dee2c299799 |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

                       frr-8.1 | 2 
                  exempi-2.6.1 | 1 
                     file-5.41 | 1 
              host-delve-1.8.0 | 1 
                 opencv4-4.5.5 | 1 
               sdl2_ttf-2.0.18 | 1 
tvheadend-1295dd2be863f5beb... | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/40da5ed447428121362f1e99512a4f74b6d9a9f4 |     
    i586     |           file-5.41            | NOK | http://autobuild.buildroot.net/results/b2cf56c6964235b234157a6d7c4273f3ff6da74b | ORPH
    arc      |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/c50455d2cb11a89ae9072109b8c6277b75360c93 |     
  mips64el   |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/7ae48c9f9be7abf461dd9ad1474f36239a7e2403 |     
    arm      |        host-delve-1.8.0        | NOK | http://autobuild.buildroot.net/results/bffdc8df13abadfcbce3efa165ede6091a1275f7 |     
    m68k     |         opencv4-4.5.5          | NOK | http://autobuild.buildroot.net/results/ae826da01f11df4544954a5b5d2e0f2680d93a95 |     
    arm      |        sdl2_ttf-2.0.18         | NOK | http://autobuild.buildroot.net/results/1707b6a6462bf05067f34d18663d774d27824392 |     
  riscv64    | tvheadend-1295dd2be863f5beb... | NOK | http://autobuild.buildroot.net/results/13038f162cf354c3c79eb286f9c15cb6568c2834 |     


Gitlab CI results for 2022-05-16
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
            TestLibshdata | https://gitlab.com/buildroot.org/buildroot/-/jobs/2459840941  | ORPH 
                  TestOci | https://gitlab.com/buildroot.org/buildroot/-/jobs/2459840886  | ORPH 
           TestPythonAvro | https://gitlab.com/buildroot.org/buildroot/-/jobs/2463744651  | ORPH 
       TestPythonPy3Flask | https://gitlab.com/buildroot.org/buildroot/-/jobs/2459841071  | ORPH 
...honPy3FlaskExpectsJson | https://gitlab.com/buildroot.org/buildroot/-/jobs/2459841072  | ORPH 
...thonPy3ServiceIdentity | https://gitlab.com/buildroot.org/buildroot/-/jobs/2459841098  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
