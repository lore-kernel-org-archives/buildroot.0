Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CED6CC6FD1D
	for <buildroot@archiver.kernel.org>; Tue, 21 Mar 2023 06:34:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 21BED400E7;
	Tue, 21 Mar 2023 06:34:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 21BED400E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZcoO-lX6MsSm; Tue, 21 Mar 2023 06:34:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 866B64018E;
	Tue, 21 Mar 2023 06:34:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 866B64018E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1245F1BF398
 for <buildroot@lists.busybox.net>; Tue, 21 Mar 2023 06:34:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D70B6812FC
 for <buildroot@lists.busybox.net>; Tue, 21 Mar 2023 06:34:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D70B6812FC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DroKhCxVSe78 for <buildroot@lists.busybox.net>;
 Tue, 21 Mar 2023 06:33:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3830F812E4
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3830F812E4
 for <buildroot@buildroot.org>; Tue, 21 Mar 2023 06:33:58 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 731B91BF203
 for <buildroot@buildroot.org>; Tue, 21 Mar 2023 06:33:55 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Tue, 21 Mar 2023 06:33:55 -0000
Message-Id: <20230321063401.D70B6812FC@smtp1.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1679380435; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=I3QQqz5P7CvvOFcFaTzCNRLtvGpUE1UGT5jvw5qUHIg=;
 b=CrG5rUvN60d8d+EPjE59VjgevNZ34Fxh9yepvBXhGOBs2b13IYat7trz5mUDeUmPFj+2M2
 isSQt2oCyS60qle3yj6b6OEUJ+QcDUbjGgNLgPqDLvdxcbRShXjZejwDSB7Nk/zFyItu1P
 TetGcXajrpBPQWLzRjOzHpfKQdirCzwEO32KggiINnJRaIhHam235eyk7+609vNViwMhRY
 dB8NHd1BPwuQ/8frz7LBJXShhsGqW7EPAnmD0hUrh+0KI7nwG2WEmkf13UJgJlihQhfU9s
 o86J9wpJU7gLpmlYsklTIydv+UUXx0CU24bjJ8CSmb1IkGjZN8jyzDldvOheTA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CrG5rUvN
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-03-20
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

Autobuild statistics for 2023-03-20
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  | 21  | 10  |  0  | 31  |
    master   | 216 | 148 |  2  | 366 |

Classification of failures by reason for master
-----------------------------------------------

  gobject-introspection-1.72.0 | 8 
             bluez5_utils-5.66 | 7 
            host-binutils-2.38 | 7 
                  linux-6.1.14 | 7 
                host-go-1.19.7 | 6 
                   perl-5.36.0 | 6 
                elfutils-0.186 | 5 
glibc-2.36-81-g4f4d7a13edfd... | 5 
              host-rust-1.68.0 | 5 
               libglib2-2.72.3 | 5 
                  snmppp-3.5.0 | 4 
                       unknown | 3 
                    brltty-6.5 | 2 
                  cairo-1.16.0 | 2 
                 dc3dd-7.2.641 | 2 
                   duma-2.5.15 | 2 
               fftw-quad-3.3.8 | 2 
                     file-5.43 | 2 
             fontconfig-2.13.1 | 2 
         gobject-introspection | 2 
            host-binutils-2.39 | 2 
     host-moby-buildkit-0.11.2 | 2 
                    ola-0.10.9 | 2 
                     php-8.2.3 | 2 
    python-cryptography-39.0.1 | 2 
                    qemu-7.2.0 | 2 
                 uclibc-1.0.42 | 2 
               valgrind-3.19.0 | 2 
                 wolfssl-5.5.3 | 2 
               zxing-cpp-1.4.0 | 2 
                  assimp-5.2.5 | 1 
                    bat-0.19.0 | 1 
                  bind-9.16.38 | 1 
                  boost-1.80.0 | 1 
                   bullet-3.21 | 1 
                 coremark-1.01 | 1 
             dahdi-linux-3.2.0 | 1 
                  ffmpeg-4.4.3 | 1 
fs/axfs/axfs.mk:32: /home/a... | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/romfs/romfs.mk:32: /tmp/... | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
fs/ubi/ubi.mk:51: /tmp/inst... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
                 fwts-22.09.00 | 1 
            ghostscript-9.56.1 | 1 
                     gmp-6.2.1 | 1 
                 highway-1.0.3 | 1 
               host-zstd-1.5.4 | 1 
               ipmitool-1_8_19 | 1 
kvmtool-f77d646ba01d04be5aa... | 1 
              libuhttpd-3.14.1 | 1 
          linux-5.10.162-cip24 | 1 
                    musl-1.2.3 | 1 
                nodejs-16.18.1 | 1 
            ocf-linux-20171122 | 1 
                    olsr-0.9.8 | 1 
on2-8170-modules-73b08061d3... | 1 
               openblas-0.3.21 | 1 
           openpowerlink-2.7.1 | 1 
                 openssh-9.1p1 | 1 
                     pv-1.6.20 | 1 
           python-orjson-3.8.4 | 1 
           python-pyicu-2.10.2 | 1 
ripgrep-af6b6c543b224d348a8... | 1 
                    sdl-1.2.15 | 1 
             stress-ng-0.15.04 | 1 
toolchain-external-codescap... | 1 
              traceroute-2.1.0 | 1 
ulog-0389d243352255f6182326... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          assimp-5.2.5          | NOK | http://autobuild.buildroot.net/results/ff841211cf5b6ea00688fb97b11d7b133d8693e2 | ORPH
   mipsel    |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/eb7bb8c5adef3a9c9794156176ac5e115845f395 |     
    sh4      |          bind-9.16.38          | NOK | http://autobuild.buildroot.net/results/a505d6d40490bb42aba511df1ba3dafd9d019c48 | ORPH
powerpc64le  |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/e04e0b1fcf9390565ce880204ea417523c75f80e |     
    mips     |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/35dbadb6efb523ec11aeeaf0d11027fe39b7de70 |     
   x86_64    |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/5d7901c02db21a66ae70a18f1c1784d3417676c4 |     
   mips64    |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/87478ad51266aae4cac547e9f3cc1e829d154563 |     
   mipsel    |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/248beacf561468a4a50d02d50cea184eebe35d25 |     
  aarch64    |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/c3d3863bda1f6392e273b9aff3526ebeadee089d |     
   mips64    |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/5ffc18a90d321b344e257e851bb3666ff0594b0f |     
   arceb     |          boost-1.80.0          | NOK | http://autobuild.buildroot.net/results/df88b5583b9f47222234c7919a25820e4ef8891b |     
    mips     |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/0430c870fa1458fe24841871277f863a34357336 |     
   nios2     |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/fbfabb4d7f73fe8f4471af5c95f5e932ffd78874 |     
   xtensa    |          bullet-3.21           | NOK | http://autobuild.buildroot.net/results/4d8411db1cc914b7e2b9716f3c2d0908d8264dca |     
   xtensa    |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/ef7be9a690e5bd15614f06435dc2b17d5255432b |     
   xtensa    |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/2d2c2bfb5c862fb1269d5d13b70dbcf8e8ee6803 |     
    sh4      |         coremark-1.01          | NOK | http://autobuild.buildroot.net/results/cc86a84e14d4c62c945b482389c5c5456075a6ae |     
    i686     |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/4c679d99bb38d16b3cc271b3fdcc919c7c7018c2 |     
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/95da4646d8bec837422f8ec64c9780e64bf3ab34 | ORPH
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/1c2c0a9877529da3f528c031a7af9018b3c76bcd | ORPH
    i686     |          duma-2.5.15           | NOK | http://autobuild.buildroot.net/results/e0eebf0612eec7368e861d0de37dceca87117413 | ORPH
    sh4      |          duma-2.5.15           | NOK | http://autobuild.buildroot.net/results/308f7e037f0b759aa86cdad1583da4d815d2b1cb | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/9e048fc80676c3fd6cc5a99f7c70c9391ed64a2c | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/1cca3e4a0e795913491ff42916afedf095c7beeb | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/2ed9c253d1221e37469911087c28316e7b11e7f9 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/ae6685befcb1c0349a6034a11620c80804755ac6 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/f20fabbd30fbc807aa6e2a2497546337bb80c373 | ORPH
    arm      |          ffmpeg-4.4.3          | NOK | http://autobuild.buildroot.net/results/60e88f1590902f4fde87314ae5caf8b471da3dd5 |     
powerpc64le  |        fftw-quad-3.3.8         | NOK | http://autobuild.buildroot.net/results/53b357c9fda0cb08dd02fb1e02104104b30248f3 | ORPH
powerpc64le  |        fftw-quad-3.3.8         | NOK | http://autobuild.buildroot.net/results/e31e2e8318327684a1a151077ead8aa6171d056a | ORPH
    i686     |           file-5.43            | NOK | http://autobuild.buildroot.net/results/c0d552f80d58f446f35fd77ae9340b98438f687c | ORPH
  mips64el   |           file-5.43            | NOK | http://autobuild.buildroot.net/results/408e52217cfa76c47f8cb2eb44190371c6919d0a | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/79db620325fa4a948e5a32b75d557a412d1bfc75 | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/00ca5ff47e45fec006f6af4810a51e4a2e67c17d | ORPH
  mips64el   | fs/axfs/axfs.mk:32: /home/a... | NOK | http://autobuild.buildroot.net/results/4b5865d1c04e7b4ef1609fcf69d986a3d6899a6b |     
   armeb     | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/afe8922c6816709233c440862af49b70b23b96c0 |     
powerpc64le  | fs/romfs/romfs.mk:32: /tmp/... | NOK | http://autobuild.buildroot.net/results/55503aec57a78d0e8f21f8888fe409f21a3dfa51 |     
  riscv32    | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/c505cf1ea242d135a38baf52aa43a0003c7c8e46 |     
  powerpc    | fs/ubi/ubi.mk:51: /tmp/inst... | NOK | http://autobuild.buildroot.net/results/53a8a9f3e4b0deee3cd48d557ae266004bed7e21 |     
microblazeel | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/d0ca11b73acfa1c4e989fece04ac69003cd4056f |     
   sparc     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/3434c42684268094c6a7edde4dbb10c7d1f20a33 |     
   nios2     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/e3b261ac8cf0f6773c0d72e71b37699246b2409a |     
    or1k     | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/bcf7847b781bc811de86f4e4984a0f02a0bb7a06 |     
 aarch64_be  | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/e6640501a7c8a7b84c293858d9430f55e2c2abae |     
    sh4      | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/839fd91ffb7000ef809e66f981ca5af59c4ae62f |     
 powerpc64   | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/e8aa5a9b7210ef3e56c58e92a20a65220665f198 |     
    i686     |         fwts-22.09.00          | NOK | http://autobuild.buildroot.net/results/20c44cb7619f5f730e02bed07f9bcb68ee0d1a28 |     
   sh4aeb    |       ghostscript-9.56.1       | NOK | http://autobuild.buildroot.net/results/91d7893b39e9ff1d8f50f9a935da9998f95a8019 |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/b9380e1a12b3cec21a7665a0fea2d51a96403972 |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/fece896aaa7e976e2691f7c6fd159fbedc0d0aa8 |     
powerpc64le  | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/7df120feab7b50bd96a557b39f4979f85a2c3342 |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/07032e4dcf36ca58ada15b2c912c5f557f1eb2f5 |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/ffeb6b5b4ba922b3153291094cee0eab97a0d322 |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/8faed24a5a90bba3965eec42ae126108cbe84ede | ORPH
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/d86f10192b37acc7cb834cf53d1427dbc4d59aa2 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/4f21a4197fd9688ae9797efcc83d4c366b5e3707 |     
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/2eea83e7a9dbf567c42ef674c2baa6c42a701c8e | ORPH
 microblaze  |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/0a2cc2f9f074b3a87ec94bd9e5e3640927903b19 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/93f553f734a1fa8d0f9dfd6a79d0cccd2d1a016a | ORPH
 microblaze  |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/153a7a0f24367251d0e06bea9da3e34259454942 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/b1d946b063c15958c48097aee807d92cc791382c | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/94579ca59eff0a0c90b0ee0b7034edb8640a14df | ORPH
   nios2     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/f5c29fae11904ac15952ffef9b9a3a3e2e26919e | ORPH
   armeb     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/019b1e7943b5e9958addb61ce61e0c73cbc4851f | ORPH
   armeb     |         highway-1.0.3          | NOK | http://autobuild.buildroot.net/results/fbd4378d29a121cdab364d116167ab51e31ad368 |     
 powerpc64   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/a3aa284b534a4477956fd2ed238ca103faeacf93 |     
    or1k     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/4d122da0c6d1ec53c1988aa83a35374fac507157 |     
  riscv32    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/fd3f95eb06c3ab44d89f97a3f897343e30741ede |     
   mipsel    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/cde6cfbcc7faf8ef543f543298a01b403b3a8307 |     
  powerpc    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/95c3087cf703ff61633846c33cde6170a5463a7b |     
microblazeel |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/64ad8c1a4a02eddfa28035732a4806fb69d403eb |     
   s390x     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/baec614ae2e1ebae67514fb4b321ae9ee37274b8 |     
  riscv64    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/055fa907712f644cfa1e7d821a319675e9ae55df |     
    mips     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/7cc4f3195f7038094ebf8d976924377dc9846702 |     
    i686     |         host-go-1.19.7         | NOK | http://autobuild.buildroot.net/results/1d717ac603f13173cdb8048a05b1c30dd8cb7f30 |     
  mips64el   |         host-go-1.19.7         | NOK | http://autobuild.buildroot.net/results/4141b8c69c85672f8a8a7fb1697c834b0597388c |     
  mips64el   |         host-go-1.19.7         | NOK | http://autobuild.buildroot.net/results/2e246643193cc1e5d33542a569fc4fdf92c31bfe |     
   mips64    |         host-go-1.19.7         | NOK | http://autobuild.buildroot.net/results/e3eb730f7f72edd12f1a674be9b880042fb079c2 |     
   mips64    |         host-go-1.19.7         | NOK | http://autobuild.buildroot.net/results/7a3a9d1213141f55531dca3d51fbd5e02ff5bcc4 |     
  mips64el   |         host-go-1.19.7         | NOK | http://autobuild.buildroot.net/results/7962d67c3e08479df9f2ca151ec1c173c172dcdf |     
  riscv64    |   host-moby-buildkit-0.11.2    | NOK | http://autobuild.buildroot.net/results/592384eb7435a241c9c70918c9436275e0275053 |     
  aarch64    |   host-moby-buildkit-0.11.2    | NOK | http://autobuild.buildroot.net/results/edd13575f503bd9bdd8891d303f8fbdd272494f4 |     
powerpc64le  |        host-rust-1.68.0        | NOK | http://autobuild.buildroot.net/results/eb3bed69716ccd19d6a08797ebdba47b22e372bb |     
powerpc64le  |        host-rust-1.68.0        | NOK | http://autobuild.buildroot.net/results/f69e4d818bf4eabc6fa1062d5ced7cdd906fc823 |     
   x86_64    |        host-rust-1.68.0        | NOK | http://autobuild.buildroot.net/results/bd1a5bb571f42c8c6712326be935d7b0e9067aa7 |     
powerpc64le  |        host-rust-1.68.0        | NOK | http://autobuild.buildroot.net/results/5641f78315bf119b3fedd0d40485c6bed3ec5356 |     
  sparc64    |        host-rust-1.68.0        | NOK | http://autobuild.buildroot.net/results/ba4be2352d8b3983d3a44dc1fd4d0650a724d633 |     
powerpc64le  |        host-zstd-1.5.4         | NOK | http://autobuild.buildroot.net/results/0902da9603b6910cd63e7ef7aa16ad8b5a4755fc |     
    or1k     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/1ea9a00953af3fdea09b9c16e4a467252663be45 |     
   x86_64    | kvmtool-f77d646ba01d04be5aa... | NOK | http://autobuild.buildroot.net/results/1d43ddea4d0269bca06def8bda6d49a5dd2ce00c | ORPH
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/d7830cbc49c10829153e5876619dd8d06d8a9002 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/d73cb12dc4c3d575c5c25233f78f11b68634637a |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/90cc402b06f782a568b9b52ce2659959872b0a83 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/88aed166af54fea9b77279902bbe3a0b4e21262a |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/bccd1a7d576ae6e4d6a957fd3198f06bb0c87b1e |     
   mips64    |        libuhttpd-3.14.1        | NOK | http://autobuild.buildroot.net/results/7d9f52206db5ce49f314e573085b360382c2ffd3 |     
   nios2     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/bd37df55e9dce71554d62814179f013930d608a8 | ORPH
   mipsel    |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/4f6f5a65decf73f5291c3b6f0bf091be353b4033 | ORPH
   mipsel    |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/6de98622fe474f91862b41a79b239239e9df5014 | ORPH
    mips     |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/f876cf8612dc030b40ad0baca94697de51391c0b | ORPH
    mips     |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/11bff3cb217e574c2c03c65f297eaadabbfb1db0 | ORPH
    arc      |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/37b1da58be05545932083c697a350941cddeb5e1 | ORPH
  sparc64    |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/10cea7a7949acd238be45a0d22915a4b082a2c28 | ORPH
  powerpc    |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/f1b8b09fef19a1bdd65e6fd2e6c2423ab5650eba | ORPH
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/d23d0358f74d9979cf6c68c5baa4a646f0d2712b |     
    i686     |         nodejs-16.18.1         | NOK | http://autobuild.buildroot.net/results/63fad3ee97d450b499820607b7b5a8226b090bd6 |     
   sparc     |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/30a69e77ee65551ff29946b816f40a0785409e9d | ORPH
   sparc     |           ola-0.10.9           | NOK | http://autobuild.buildroot.net/results/c6a2740d668cf66b987fe29d2a52903e0eb1fdf5 |     
  sparc64    |           ola-0.10.9           | NOK | http://autobuild.buildroot.net/results/aaa5f2ac68931337c4c74d1b66e53edcfa1cd53c |     
   nios2     |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/6b51244d7a3e57c07b875c010d0a4e30b3256882 | ORPH
    arm      | on2-8170-modules-73b08061d3... | NOK | http://autobuild.buildroot.net/results/b64c66421f83b9b073daad848f38f077074f7d59 | ORPH
  mips64el   |        openblas-0.3.21         | NOK | http://autobuild.buildroot.net/results/94b0301911bf3dab057dab3594131be81b8b8e76 | ORPH
   x86_64    |      openpowerlink-2.7.1       | NOK | http://autobuild.buildroot.net/results/8c471a148787af5ed649b82b7256f267b2feb921 |     
    m68k     |         openssh-9.1p1          | NOK | http://autobuild.buildroot.net/results/fec37d09f952fc24ea7ae85d46f345bfa2f4850b | ORPH
   xtensa    |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/3626ba0c5bec76997d777d8d1d266cc9fc9064c3 |     
  sparc64    |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/6561bfecc638a908171822425d66dcbd4f20d64f |     
    m68k     |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/40dd10fe5ea2180c8b035e67b67f0a54191675ff |     
    mips     |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/30ba5ebb59e25ed2cc9bbde2adfe16ab6ea999c0 |     
  sparc64    |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/bd5a9a9de2c74486e35d25044b634fd7a8a75e5f |     
   mips64    |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/27b373e9e2501f4fdf6e42044e1c09650278ecf1 |     
   sh4eb     |           php-8.2.3            | NOK | http://autobuild.buildroot.net/results/4d2d4f4644f6769c24ed0b524257922ceb2a938e |     
   armeb     |           php-8.2.3            | NOK | http://autobuild.buildroot.net/results/0f542b1448cf0de326b59d6dfb40e43650f5ada6 |     
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/61e14e92df094cdd5056852f67442844f05c229e | ORPH
   armeb     |   python-cryptography-39.0.1   | NOK | http://autobuild.buildroot.net/results/5f321bc661fa4c716f4f922faa9b12fbbb5edb28 |     
   armeb     |   python-cryptography-39.0.1   | NOK | http://autobuild.buildroot.net/results/57d86ea40293ac42e94d8b3a6e452f6aa90905a2 |     
    mips     |      python-orjson-3.8.4       | NOK | http://autobuild.buildroot.net/results/a1370b0f93be17595f6657f9a1465858593f9779 |     
    arc      |      python-pyicu-2.10.2       | NOK | http://autobuild.buildroot.net/results/c32038046d17ee63f7a1b7a3b05790bc30c17b80 |     
   mipsel    |           qemu-7.2.0           | NOK | http://autobuild.buildroot.net/results/01c8e1861db460bd0d89faafa8601534fc2a37f1 |     
   x86_64    |           qemu-7.2.0           | NOK | http://autobuild.buildroot.net/results/f8343beddbb7662e0a126a5e9b802009394436c5 |     
   mipsel    | ripgrep-af6b6c543b224d348a8... | NOK | http://autobuild.buildroot.net/results/efdb349c89c2b2f877f24235534157b6915f534e |     
    sh4a     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/d357580cc9290d0af3f4a14c550cf962ef4dcc73 | ORPH
    mips     |          snmppp-3.5.0          | NOK | http://autobuild.buildroot.net/results/b5318773ff6a2e8618dbaeaf5a9593d4f7a44251 |     
  aarch64    |          snmppp-3.5.0          | NOK | http://autobuild.buildroot.net/results/8e438344867eec06dd56f48d3e1245e57c280da2 |     
   arceb     |          snmppp-3.5.0          | NOK | http://autobuild.buildroot.net/results/8ef3e4407a51c53c15e530606227338761dd905b |     
   nios2     |          snmppp-3.5.0          | NOK | http://autobuild.buildroot.net/results/f57783046f7ace8a4b07d454fbce3b5ad8049b88 |     
   xtensa    |       stress-ng-0.15.04        | NOK | http://autobuild.buildroot.net/results/e8f5b0fde6bb4f4328bae46d6a265945d8d85cb0 |     
    mips     | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/557b2153091527608c764308353d708669274ccd | ORPH
 microblaze  |        traceroute-2.1.0        | NOK | http://autobuild.buildroot.net/results/1d68400470c00d1f2148bcf21a83de254ace051b |     
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/79f5f0b10a30d9f15c29b608fa5bf992995e53d5 |     
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/ffba1fb9edc119f65556e39f5a3ab5c0c2b4bca1 |     
  mips64el   | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/34dabc91a9d9138ed6daba12e66a446695dbf11f |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/eee66b1314c7e3f2fcc541f3801464f586cfd215 |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/1d2ed00fa00aca391308cbaef2690ee8a4c2601b |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/6327a7ae838f955fe5b4a7b2dc7b9d8f775f4fcb |     
   mips64    |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/fd16fd9d4c49b983b5bf0a6365c6cd5dd61ef809 | ORPH
  mips64el   |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/9232d3223e9783e9f7baf9b30b727f8f853ff60a | ORPH
   mipsel    |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/befeb4edec7c70048ccd96eed72c723fe2013943 |     
  mips64el   |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/835193f8af10d0c4147dd6fbccdd4c8232d73c8f |     
 microblaze  |        zxing-cpp-1.4.0         | NOK | http://autobuild.buildroot.net/results/d54202b17b832ca477e84a8e8395875d41b38d23 |     
    i686     |        zxing-cpp-1.4.0         | NOK | http://autobuild.buildroot.net/results/c0c1dc2ee31b2d8acb70af64591df3fda0f1a6f1 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                host-go-1.19.7 | 2 
              host-rust-1.67.0 | 2 
           crucible-2022.05.25 | 1 
                   flann-1.9.2 | 1 
            host-binutils-2.39 | 1 
               libvorbis-1.3.7 | 1 
                netdata-1.33.1 | 1 
                    qemu-7.2.0 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |      crucible-2022.05.25       | NOK | http://autobuild.buildroot.net/results/901ea1788ed79f48b5921cf6709f9731a137a4ef |     
    or1k     |          flann-1.9.2           | NOK | http://autobuild.buildroot.net/results/968c6b6fc5ed8735e867f06ee30841e62985b7ac |     
    sh4a     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/b7a30f24239378992d248de06a3a4c4306de16cc |     
powerpc64le  |         host-go-1.19.7         | NOK | http://autobuild.buildroot.net/results/8035e7ba1e00dac6006ce80e5a44464e77fa5b97 |     
  mips64el   |         host-go-1.19.7         | NOK | http://autobuild.buildroot.net/results/73d238e85f160988729aeefcd4ce084dd6b6bb7a |     
powerpc64le  |        host-rust-1.67.0        | NOK | http://autobuild.buildroot.net/results/8432046f3422c0afbad0826cd64d6663efebd0ca |     
   x86_64    |        host-rust-1.67.0        | NOK | http://autobuild.buildroot.net/results/e5f5a687a6b2a3b24e980abc29417b6ddd5cb9be |     
  powerpc    |        libvorbis-1.3.7         | NOK | http://autobuild.buildroot.net/results/e98d122f94106df3785eea5667979c54bc01cbde |     
    or1k     |         netdata-1.33.1         | NOK | http://autobuild.buildroot.net/results/0c41e02f2ed0befa0aa9a77217c119432d881720 |     
    mips     |           qemu-7.2.0           | NOK | http://autobuild.buildroot.net/results/8969315ab2fd8382ceee393d38fce9f1253261f8 |     


Gitlab CI results for 2023-03-20
================================

Detail of defconfig failures for 2022.02.11
-------------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
         qemu_arm_versatile_nommu | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836252  | ORPH 
                qemu_m68k_mcf5208 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836255  |      
                 qemu_nios2_10m50 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836267  |      
           qemu_xtensa_lx60_nommu | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836288  |      


Detail of runtime-test failures for 2022.02.11
----------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
        DetectBadArchTest | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836296  | ORPH 
          TestATFVexpress | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836290  | ORPH 
                 TestAtop | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836367  | ORPH 
         TestCheckPackage | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836758  |      
           TestCrudiniPy3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836370  | ORPH 
        TestDockerCompose | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836371  | ORPH 
             TestDropbear | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836372  | ORPH 
              TestDtbocfg | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836373  | ORPH 
                 TestEdk2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836291  | ORPH 
             TestExecline | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836374  | ORPH 
                 TestExt2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836321  | ORPH 
               TestExt2r1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836323  | ORPH 
                 TestExt3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836326  | ORPH 
                 TestExt4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836327  | ORPH 
...rch64GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836556  | ORPH 
...tlinAarch64GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836557  | ORPH 
...arch64MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836558  | ORPH 
...otlinAarch64MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836559  | ORPH 
...ch64UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836560  | ORPH 
...linAarch64UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836561  | ORPH 
...h64beGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836563  | ORPH 
...inAarch64beGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836564  | ORPH 
...64beUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836565  | ORPH 
...nAarch64beUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836566  | ORPH 
...750dUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836567  | ORPH 
...nArcle750dUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836568  | ORPH 
...ehs38GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836569  | ORPH 
...inArclehs38GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836570  | ORPH 
...hs38UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836571  | ORPH 
...nArclehs38UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836572  | ORPH 
...5eabiGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836573  | ORPH 
...inArmv5eabiGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836574  | ORPH 
...v5eabiMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836575  | ORPH 
...linArmv5eabiMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836576  | ORPH 
...eabiUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836578  | ORPH 
...nArmv5eabiUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836579  | ORPH 
...abihfGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836580  | ORPH 
...Armv6eabihfGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836581  | ORPH 
...eabihfMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836582  | ORPH 
...nArmv6eabihfMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836583  | ORPH 
...bihfUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836585  | ORPH 
...rmv6eabihfUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836586  | ORPH 
...abihfGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836588  | ORPH 
...Armv7eabihfGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836589  | ORPH 
...eabihfMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836590  | ORPH 
...nArmv7eabihfMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836591  | ORPH 
...bihfUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836592  | ORPH 
...rmv7eabihfUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836593  | ORPH 
...mv7mUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836594  | ORPH 
...tlinArmv7mUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836595  | ORPH 
...8xxxUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836596  | ORPH 
...nM68k68xxxUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836597  | ORPH 
...fireUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836598  | ORPH 
...8kcoldfireUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836599  | ORPH 
...azebeGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836600  | ORPH 
...icroblazebeGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836602  | ORPH 
...lazebeMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836603  | ORPH 
...MicroblazebeMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836604  | ORPH 
...zebeUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836605  | ORPH 
...croblazebeUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836606  | ORPH 
...azeelGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836607  | ORPH 
...icroblazeelGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836608  | ORPH 
...lazeelMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836609  | ORPH 
...MicroblazeelMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836610  | ORPH 
...zeelUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836611  | ORPH 
...croblazeelUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836612  | ORPH 
...ips32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836613  | ORPH 
...otlinMips32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836614  | ORPH 
...Mips32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836615  | ORPH 
...ootlinMips32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836616  | ORPH 
...ps32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836617  | ORPH 
...tlinMips32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836618  | ORPH 
...s32elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836619  | ORPH 
...linMips32elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836620  | ORPH 
...ps32elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836621  | ORPH 
...tlinMips32elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836622  | ORPH 
...32elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836623  | ORPH 
...inMips32elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836624  | ORPH 
...2r5elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836625  | ORPH 
...nMips32r5elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836626  | ORPH 
...32r5elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836627  | ORPH 
...inMips32r5elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836628  | ORPH 
...r5elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836629  | ORPH 
...Mips32r5elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836630  | ORPH 
...2r6elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836631  | ORPH 
...nMips32r6elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836632  | ORPH 
...32r6elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836633  | ORPH 
...inMips32r6elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836634  | ORPH 
...r6elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836635  | ORPH 
...Mips32r6elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836636  | ORPH 
...eln32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836637  | ORPH 
...Mips64eln32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836639  | ORPH 
...4eln32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836640  | ORPH 
...nMips64eln32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836642  | ORPH 
...ln32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836643  | ORPH 
...ips64eln32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836645  | ORPH 
...64n32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836646  | ORPH 
...inMips64n32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836647  | ORPH 
...s64n32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836648  | ORPH 
...linMips64n32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836649  | ORPH 
...4n32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836650  | ORPH 
...nMips64n32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836651  | ORPH 
...eln32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836652  | ORPH 
...ps64r6eln32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836653  | ORPH 
...6eln32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836654  | ORPH 
...ips64r6eln32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836656  | ORPH 
...ln32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836658  | ORPH 
...s64r6eln32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836660  | ORPH 
...Nios2GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836661  | ORPH 
...ootlinNios2GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836662  | ORPH 
...enriscMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836663  | ORPH 
...tlinOpenriscMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836664  | ORPH 
...riscUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836665  | ORPH 
...inOpenriscUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836666  | ORPH 
...440fpGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836667  | ORPH 
...owerpc440fpGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836668  | ORPH 
...c440fpMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836669  | ORPH 
...Powerpc440fpMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836670  | ORPH 
...40fpUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836671  | ORPH 
...werpc440fpUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836672  | ORPH 
...e5500GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836673  | ORPH 
...erpc64e5500GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836674  | ORPH 
...e6500GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836675  | ORPH 
...erpc64e6500GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836676  | ORPH 
...4e6500MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836677  | ORPH 
...werpc64e6500MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836678  | ORPH 
...ower8GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836679  | ORPH 
...c64lepower8GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836680  | ORPH 
...power8MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836681  | ORPH 
...pc64lepower8MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836682  | ORPH 
...ower8GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836683  | ORPH 
...rpc64power8GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836684  | ORPH 
...power8MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836685  | ORPH 
...erpc64power8MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836686  | ORPH 
...300c3GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836687  | ORPH 
...werpce300c3GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836688  | ORPH 
...e300c3MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836689  | ORPH 
...owerpce300c3MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836690  | ORPH 
...00c3UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836692  | ORPH 
...erpce300c3UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836693  | ORPH 
...500mcGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836695  | ORPH 
...werpce500mcGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836696  | ORPH 
...e500mcMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836697  | ORPH 
...owerpce500mcMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836698  | ORPH 
...00mcUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836699  | ORPH 
...erpce500mcUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836700  | ORPH 
...lp32dGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836701  | ORPH 
...lp64dGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836702  | ORPH 
...iscv64lp64dGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836703  | ORPH 
...4lp64dMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836704  | ORPH 
...Riscv64lp64dMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836705  | ORPH 
...p64dUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836706  | ORPH 
...scv64lp64dUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836707  | ORPH 
...Shsh4GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836708  | ORPH 
...ootlinShsh4GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836709  | ORPH 
...nShsh4MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836710  | ORPH 
...BootlinShsh4MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836711  | ORPH 
...hsh4UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836712  | ORPH 
...otlinShsh4UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836713  | ORPH 
...h4aebGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836714  | ORPH 
...linShsh4aebGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836715  | ORPH 
...sh4aebMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836716  | ORPH 
...tlinShsh4aebMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836717  | ORPH 
...arc64GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836718  | ORPH 
...tlinSparc64GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836719  | ORPH 
...rcv8UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836720  | ORPH 
...linSparcv8UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836721  | ORPH 
...X8664GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836722  | ORPH 
...ootlinX8664GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836723  | ORPH 
...nX8664MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836724  | ORPH 
...BootlinX8664MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836725  | ORPH 
...8664UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836726  | ORPH 
...otlinX8664UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836727  | ORPH 
...orei7GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836729  | ORPH 
...X8664corei7GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836730  | ORPH 
...corei7MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836731  | ORPH 
...nX8664corei7MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836732  | ORPH 
...rei7UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836733  | ORPH 
...8664corei7UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836734  | ORPH 
...664v2GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836735  | ORPH 
...8664v2MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836736  | ORPH 
...64v2UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836737  | ORPH 
...664v3GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836738  | ORPH 
...8664v3MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836739  | ORPH 
...64v3UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836740  | ORPH 
...664v4GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836741  | ORPH 
...8664v4MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836742  | ORPH 
...64v4UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836743  | ORPH 
...core2GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836744  | ORPH 
...linX86core2GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836745  | ORPH 
...6core2MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836746  | ORPH 
...tlinX86core2MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836747  | ORPH 
...ore2UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836748  | ORPH 
...inX86core2UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836749  | ORPH 
...6i686GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836750  | ORPH 
...tlinX86i686GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836751  | ORPH 
...86i686MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836752  | ORPH 
...otlinX86i686MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836753  | ORPH 
...i686UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836754  | ORPH 
...linX86i686UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836755  | ORPH 
...lx60UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836756  | ORPH 
...Xtensalx60UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836757  | ORPH 
...ToolchainBuildrootMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836548  | ORPH 
...olchainBuildrootuClibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836549  | ORPH 
...xternalToolchainCCache | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836550  | ORPH 
...ernalToolchainCtngMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836551  | ORPH 
...rnalToolchainLinaroArm | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836552  | ORPH 
...ToolchainSourceryArmv4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836553  | ORPH 
...ToolchainSourceryArmv5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836554  | ORPH 
...ToolchainSourceryArmv7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836555  | ORPH 
                 TestF2FS | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836329  | ORPH 
     TestFileCapabilities | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836297  | ORPH 
       TestFortifyConserv | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836298  | ORPH 
          TestFortifyNone | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836299  | ORPH 
               TestGdbArc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836375  | ORPH 
        TestGdbFullTarget | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836376  | ORPH 
  TestGdbHostGdbTarget11x | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836377  | ORPH 
   TestGdbHostGdbTarget9x | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836378  | ORPH 
  TestGdbHostGdbserver11x | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836379  | ORPH 
   TestGdbHostGdbserver9x | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836380  | ORPH 
       TestGdbHostOnly11x | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836381  | ORPH 
        TestGdbHostOnly9x | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836382  | ORPH 
...GdbHostOnlyAllFeatures | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836383  | ORPH 
   TestGdbHostOnlyDefault | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836384  | ORPH 
        TestGdbserverOnly | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836385  | ORPH 
              TestGitHash | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836314  | ORPH 
               TestGitHub | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836316  | ORPH 
               TestGitLab | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836317  | ORPH 
              TestGitRefs | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836315  | ORPH 
     TestGlibcAllTimezone | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836311  | ORPH 
...DefaultLimitedTimezone | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836312  | ORPH 
              TestGlxinfo | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836386  | ORPH 
           TestGst1Python | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836387  | ORPH 
        TestHostBmapTools | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836368  | ORPH 
           TestIPythonPy3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836388  | ORPH 
  TestInitSystemBusyboxRo | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836351  | ORPH 
...InitSystemBusyboxRoNet | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836352  | ORPH 
  TestInitSystemBusyboxRw | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836353  | ORPH 
...InitSystemBusyboxRwNet | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836354  | ORPH 
       TestInitSystemNone | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836355  | ORPH 
...InitSystemOpenrcRoFull | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836356  | ORPH 
...InitSystemOpenrcRwFull | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836357  | ORPH 
...nitSystemSystemdRoFull | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836358  | ORPH 
...ystemSystemdRoIfupdown | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836359  | ORPH 
...ystemSystemdRoNetworkd | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836360  | ORPH 
...nitSystemSystemdRwFull | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836361  | ORPH 
...ystemSystemdRwIfupdown | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836362  | ORPH 
...ystemSystemdRwNetworkd | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836363  | ORPH 
      TestIso9660Grub2EFI | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836332  | ORPH 
 TestIso9660Grub2External | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836335  | ORPH 
...0Grub2ExternalCompress | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836336  | ORPH 
   TestIso9660Grub2Hybrid | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836338  | ORPH 
 TestIso9660Grub2Internal | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836339  | ORPH 
...so9660SyslinuxExternal | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836341  | ORPH 
...slinuxExternalCompress | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836342  | ORPH 
...so9660SyslinuxInternal | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836344  | ORPH 
                TestJffs2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836346  | ORPH 
            TestLibshdata | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836390  | ORPH 
                  TestLua | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836395  | ORPH 
              TestLuaHttp | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836414  | ORPH 
           TestLuaInotify | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836419  | ORPH 
              TestLuaLPeg | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836391  | ORPH 
          TestLuaLsqlite3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836393  | ORPH 
         TestLuaLuaArgon2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836397  | ORPH 
         TestLuaLuaAugeas | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836399  | ORPH 
           TestLuaLuaCffi | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836402  | ORPH 
        TestLuaLuaCqueues | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836404  | ORPH 
          TestLuaLuaExpat | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836435  | ORPH 
     TestLuaLuaFileSystem | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836437  | ORPH 
             TestLuaLuaGD | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836411  | ORPH 
           TestLuaLuaLdap | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836439  | ORPH 
          TestLuaLuaLyaml | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836426  | ORPH 
          TestLuaLuaPosix | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836443  | ORPH 
           TestLuaLuaSDL2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836428  | ORPH 
            TestLuaLuaSec | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836445  | ORPH 
         TestLuaLuaSocket | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836447  | ORPH 
           TestLuaLuacURL | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836407  | ORPH 
           TestLuaLuaossl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836441  | ORPH 
         TestLuaLuasyslog | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836449  | ORPH 
           TestLuaLuazlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836432  | ORPH 
             TestLuaLunix | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836423  | ORPH 
             TestLuaLzlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836453  | ORPH 
             TestLuaRings | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836533  | ORPH 
              TestLuaUtf8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836430  | ORPH 
               TestLuajit | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836396  | ORPH 
           TestLuajitHttp | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836417  | ORPH 
        TestLuajitInotify | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836421  | ORPH 
           TestLuajitLPeg | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836392  | ORPH 
       TestLuajitLsqlite3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836394  | ORPH 
      TestLuajitLuaArgon2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836398  | ORPH 
      TestLuajitLuaAugeas | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836400  | ORPH 
     TestLuajitLuaCqueues | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836405  | ORPH 
       TestLuajitLuaExpat | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836436  | ORPH 
  TestLuajitLuaFileSystem | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836438  | ORPH 
          TestLuajitLuaGD | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836412  | ORPH 
        TestLuajitLuaLdap | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836440  | ORPH 
       TestLuajitLuaLyaml | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836427  | ORPH 
       TestLuajitLuaPosix | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836444  | ORPH 
        TestLuajitLuaSDL2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836429  | ORPH 
         TestLuajitLuaSec | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836446  | ORPH 
      TestLuajitLuaSocket | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836448  | ORPH 
        TestLuajitLuacURL | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836409  | ORPH 
        TestLuajitLuaossl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836442  | ORPH 
      TestLuajitLuasyslog | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836450  | ORPH 
        TestLuajitLuazlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836433  | ORPH 
          TestLuajitLunix | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836425  | ORPH 
          TestLuajitRings | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836534  | ORPH 
       TestLuajitTurbolua | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836544  | ORPH 
           TestLuajitUtf8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836431  | ORPH 
                 TestLuvi | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836451  | ORPH 
                  TestLxc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836452  | ORPH 
               TestMender | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836454  | ORPH 
              TestNetdata | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836455  | ORPH 
           TestNoTimezone | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836313  | ORPH 
                  TestOci | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836347  | ORPH 
              TestOpenJdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836456  | ORPH 
         TestOpenSshGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836457  | ORPH 
        TestOpenSshuClibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836458  | ORPH 
                 TestOpkg | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836459  | ORPH 
                 TestPerl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836460  | ORPH 
        TestPerlClassLoad | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836461  | ORPH 
         TestPerlDBDmysql | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836462  | ORPH 
     TestPerlEncodeDetect | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836463  | ORPH 
          TestPerlGDGraph | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836464  | ORPH 
       TestPerlHTMLParser | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836465  | ORPH 
TestPerlIOSocketMulticast | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836466  | ORPH 
      TestPerlIOSocketSSL | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836467  | ORPH 
 TestPerlLWPProtocolhttps | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836469  | ORPH 
         TestPerlMailDKIM | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836470  | ORPH 
              TestPerlX10 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836472  | ORPH 
        TestPerlXMLLibXML | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836473  | ORPH 
       TestPerllibwwwperl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836468  | ORPH 
              TestPhpApcu | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836474  | ORPH 
            TestPhpLuaLua | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836475  | ORPH 
         TestPhpLuaLuajit | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836476  | ORPH 
               TestPhpPam | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836477  | ORPH 
          TestPhpPeclDbus | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836478  | ORPH 
          TestPolkitInitd | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836479  | ORPH 
        TestPolkitSystemd | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836480  | ORPH 
          TestPostScripts | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836304  | ORPH 
         TestProsodyLua51 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836481  | ORPH 
        TestProsodyLuajit | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836482  | ORPH 
         TestPy3BmapTools | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836369  | ORPH 
              TestPyNdiff | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836517  | ORPH 
              TestPython3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836483  | ORPH 
         TestPythonAugeas | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836487  | ORPH 
           TestPythonAvro | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836490  | ORPH 
     TestPythonPy3Aexpect | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836484  | ORPH 
        TestPythonPy3Argh | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836485  | ORPH 
       TestPythonPy3Attrs | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836486  | ORPH 
    TestPythonPy3Autobahn | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836488  | ORPH 
     TestPythonPy3Automat | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836489  | ORPH 
   TestPythonPy3Bitstring | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836491  | ORPH 
       TestPythonPy3Boto3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836492  | ORPH 
    TestPythonPy3Botocore | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836493  | ORPH 
         TestPythonPy3Can | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836494  | ORPH 
        TestPythonPy3Cbor | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836495  | ORPH 
       TestPythonPy3Click | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836496  | ORPH 
   TestPythonPy3Colorzero | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836497  | ORPH 
  TestPythonPy3Constantly | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836498  | ORPH 
    TestPythonPy3Crossbar | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836499  | ORPH 
TestPythonPy3Cryptography | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836500  | ORPH 
    TestPythonPy3DBusNext | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836501  | ORPH 
      TestPythonPy3Distro | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836502  | ORPH 
      TestPythonPy3Django | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836503  | ORPH 
       TestPythonPy3Flask | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836504  | ORPH 
...honPy3FlaskExpectsJson | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836505  | ORPH 
         TestPythonPy3Git | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836506  | ORPH 
      TestPythonPy3Gitdb2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836507  | ORPH 
       TestPythonPy3GnuPG | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836508  | ORPH 
     TestPythonPy3Gobject | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836509  | ORPH 
    TestPythonPy3Gpiozero | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836510  | ORPH 
 TestPythonPy3Incremental | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836511  | ORPH 
    TestPythonPy3Iptables | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836512  | ORPH 
    TestPythonPy3Libftdi1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836389  | ORPH 
     TestPythonPy3Passlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836513  | ORPH 
     TestPythonPy3Pexpect | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836514  | ORPH 
      TestPythonPy3Pynacl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836516  | ORPH 
      TestPythonPy3Pytest | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836518  | ORPH 
...PythonPy3PytestAsyncio | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836519  | ORPH 
      TestPythonPy3Pyyaml | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836520  | ORPH 
         TestPythonPy3RSA | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836522  | ORPH 
     TestPythonPy3RpiGpio | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836521  | ORPH 
...thonPy3ServiceIdentity | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836524  | ORPH 
      TestPythonPy3Smmap2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836525  | ORPH 
        TestPythonPy3Treq | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836526  | ORPH 
     TestPythonPy3Twisted | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836527  | ORPH 
       TestPythonPy3Txaio | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836528  | ORPH 
    TestPythonPy3Txtorcon | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836529  | ORPH 
      TestPythonPy3Ubjson | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836530  | ORPH 
...y3UnitTestXmlReporting | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836531  | ORPH 
         TestPythonPybind | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836515  | ORPH 
                TestRedis | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836532  | ORPH 
                TestRelro | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836300  | ORPH 
         TestRelroPartial | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836301  | ORPH 
         TestRootPassword | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836305  | ORPH 
        TestRootfsOverlay | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836306  | ORPH 
                 TestRust | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836535  | ORPH 
              TestRustBin | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836536  | ORPH 
                   TestS6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836537  | ORPH 
         TestS6Networking | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836538  | ORPH 
      TestS6PortableUtils | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836539  | ORPH 
                 TestS6Rc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836540  | ORPH 
                  TestSCP | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836319  | ORPH 
     TestSELinuxCustomGit | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836307  | ORPH 
  TestSELinuxExtraModules | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836308  | ORPH 
...ELinuxExtraModulesDirs | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836309  | ORPH 
       TestSELinuxPackage | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836310  | ORPH 
   TestSELinuxSystemdExt4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836364  | ORPH 
...SELinuxSystemdSquashfs | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836366  | ORPH 
                 TestSFTP | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836320  | ORPH 
             TestSquashfs | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836348  | ORPH 
              TestSspNone | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836302  | ORPH 
            TestSspStrong | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836303  | ORPH 
                 TestSudo | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836541  | ORPH 
       TestSysLinuxX86EFI | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836292  | ORPH 
TestSysLinuxX86LegacyBios | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836293  | ORPH 
    TestSysLinuxX86_64EFI | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836294  | ORPH 
...sLinuxX86_64LegacyBios | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836295  | ORPH 
             TestSyslogNg | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836542  | ORPH 
                 TestTmux | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836543  | ORPH 
                  TestUbi | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836349  | ORPH 
TestUbootOpensslPkgConfig | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836545  | ORPH 
               TestYaffs2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836350  | ORPH 
             TestZfsGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836546  | ORPH 
            TestZfsUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3961836547  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
