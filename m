Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93A5DCDB47E
	for <buildroot@archiver.kernel.org>; Wed, 18 Oct 2023 05:35:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F2A8381EB5;
	Wed, 18 Oct 2023 05:35:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F2A8381EB5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N7HJKUh4e7zc; Wed, 18 Oct 2023 05:35:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10EB081F85;
	Wed, 18 Oct 2023 05:35:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10EB081F85
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CE1F61BF5DF
 for <buildroot@lists.busybox.net>; Wed, 18 Oct 2023 05:35:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A0BC54094C
 for <buildroot@lists.busybox.net>; Wed, 18 Oct 2023 05:35:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0BC54094C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uXx5eM2YIh5u for <buildroot@lists.busybox.net>;
 Wed, 18 Oct 2023 05:35:47 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 80E7340925
 for <buildroot@buildroot.org>; Wed, 18 Oct 2023 05:35:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 80E7340925
Received: by mail.gandi.net (Postfix) with ESMTPSA id C36C24000C
 for <buildroot@buildroot.org>; Wed, 18 Oct 2023 05:35:43 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Wed, 18 Oct 2023 05:35:43 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20231018053549.A0BC54094C@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1697607343; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vrZEg01qRm3Uds+x4hbbtv8j06VXRrSfbWIBBylf27M=;
 b=Owt2nCv1qCK+qNE/wEak41YGrMlnarc9Q8XoRSlWXoZlYrGbIYtK3A9i5iREb9OtmSU4Rm
 jRYokO3CSfcL/FJ1h+TzEMFE0kYZAr/Ft6i+1/YdKkldzAIO3AnUi/ysKLZGG92DTdkRfp
 LN5ghhlZkbVd7bB/SUHVXHj3ACDG+GG4p5rTjAQDnSQIT8DEpcVsMK6u32eVbmJYUhnN2S
 97Bay5eUupuBgKG7jfnX1174IZh6cCc3MbCfHm+RQgU5/cJ7uH0CY6drROJSYrDbclb2/W
 IiTCy5HLVYqh5QT9kIxglPCqxRgcCKm8fk7fPDTGrc4bMr+138Ag7cD289tvZA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Owt2nCv1
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-10-17
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

Autobuild statistics for 2023-10-17
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  | 15  | 11  |  0  | 26  |
  2023.08.x  |  9  |  9  |  0  | 18  |
    master   | 48  | 63  |  2  | 113 |

Classification of failures by reason for master
-----------------------------------------------

                   bird-2.0.12 | 8 
                 openrc-0.43.3 | 5 
               mariadb-10.11.4 | 4 
glibc-2.38-27-g750a45a78390... | 3 
                  monit-5.33.0 | 3 
              gcc-final-11.4.0 | 2 
              gcc-final-12.3.0 | 2 
              gcc-final-13.2.0 | 2 
         gobject-introspection | 2 
              host-rust-1.71.1 | 2 
                   linux-6.5.7 | 2 
          lttng-modules-2.13.7 | 2 
                       unknown | 2 
                    brltty-6.5 | 1 
check-11970a7e112dfe243a2e6... | 1 
                 coreutils-9.3 | 1 
                cryptopp-8.6.0 | 1 
             dahdi-linux-3.2.0 | 1 
              dropbear-2022.83 | 1 
                elfutils-0.189 | 1 
esp-hosted-11e90f185a5a9922... | 1 
                   ethtool-6.5 | 1 
                  ffmpeg-4.4.4 | 1 
 gcc-final-arc-2020.09-release | 1 
  gobject-introspection-1.76.1 | 1 
              libarchive-3.7.2 | 1 
               libglib2-2.76.1 | 1 
              libostree-2023.6 | 1 
                libselinux-3.5 | 1 
                libsoup-2.74.3 | 1 
          linux-5.10.162-cip24 | 1 
     linux-5.10.162-cip24-rt10 | 1 
              memcached-1.6.21 | 1 
         openfpgaloader-0.10.0 | 1 
         spirv-tools-1.3.261.1 | 1 
                 uclibc-1.0.44 | 1 
ulog-0389d243352255f6182326... | 1 
               valgrind-3.21.0 | 1 
                 wolfssl-5.6.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/9cb93e790b53b6d8460bbb3a81eaa4579711381f |     
powerpc64le  |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/c23bf9254bf1c5477025a36f2cf17c4bd09a908c |     
    or1k     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/dd1fcb671e6f304627601dd096f7e5bf4ff39d60 |     
    i686     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/3687317710577226b4a87be3615831cf08db2015 |     
    or1k     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/5f13e28af2cc8b74a33371a295ad9aaf52847524 |     
   armeb     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/3605668def4543cda4c6d91a76ef5ada71e42057 |     
  powerpc    |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/56e1bc17887fff96519ea608b01e0eead6e2621d |     
powerpc64le  |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/555db3515b160c4dd135edaa99c53f9288bfa291 |     
  powerpc    |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/ed907e0ffe1f5cde71026c33b05c72007f4c7133 |     
   mipsel    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/baeb81b7c685d099ec881df15655d4509faa2f26 | ORPH
   sparc     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/1323a5c7f80a4da127b3e45da74e00af1af0839b | ORPH
    or1k     |         cryptopp-8.6.0         | NOK | http://autobuild.buildroot.net/results/445beb3898716b7a5df0c9151b43efea8084117a |     
   mipsel    |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/43edc23fe2b08f3ba5bce8eaf998a0076673792e |     
    or1k     |        dropbear-2022.83        | NOK | http://autobuild.buildroot.net/results/68edd14f4f0fb708b5a771494b92357232d336db |     
    i686     |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/66fd0e43cc16f10efd43672eef53280ef1562dec | ORPH
    mips     | esp-hosted-11e90f185a5a9922... | NOK | http://autobuild.buildroot.net/results/c357d94cc35b152101da483a331eebabe18d26b6 |     
  aarch64    |          ethtool-6.5           | NOK | http://autobuild.buildroot.net/results/ee98ec3e29b139024ca0d7fbffa4c1ac9be19e9f |     
   mips64    |          ffmpeg-4.4.4          | NOK | http://autobuild.buildroot.net/results/e1f2afc664fef53f992fd184a0738b3837360cb2 |     
  aarch64    |        gcc-final-11.4.0        | NOK | http://autobuild.buildroot.net/results/3e7639d152261eaafdb6420d186aacb3e3e546ab |     
 aarch64_be  |        gcc-final-11.4.0        | NOK | http://autobuild.buildroot.net/results/44ff1f93bf5f53c6440199224687597806478acb |     
  riscv64    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/ce5bf893e0978c8531c3ac5766e0b0f39cd08131 |     
  riscv64    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/1d009bedd89ce0d8300833a805e449af2c93e5dd |     
  riscv64    |        gcc-final-13.2.0        | NOK | http://autobuild.buildroot.net/results/353d3b3d3d2e94ad95ec73b3274752af9af00d4c |     
    m68k     |        gcc-final-13.2.0        | NOK | http://autobuild.buildroot.net/results/a596dd4ddcdd7f06fbc9c5cebaaeb8ef2d89ef7e |     
   arceb     | gcc-final-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/ca31a71c64f156222925bf75c163cbbaaa06058a |     
powerpc64le  | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/5d6f9436e5c9921634b328f23101a77a9460ddfd |     
  powerpc    | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/f132eb9db4a20e31c039126f00a1921ad553cc76 |     
 powerpc64   | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/fe6c75f5247890057d4c61f02968a4f5596e42b2 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/5c35b996474be521c068616732ac9f963b2bc01c |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/17c53c1b6339e1f5ed4ceaa55a4764633743fc2d |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/5149763904f42a97eb8927aa49a7ca403c2ebec1 | ORPH
   armeb     |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/9cd717f9eaadfb3a9d5661d57d341f727b31f1d2 |     
   x86_64    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/c898b21dfd43c6e287fadc5f9e3769971aaf90c9 |     
   s390x     |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/16b1e59ee6cab7eca4fda1c0a43a014a8e4758f6 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/40b35a2bef5b832868362539fc72bdf22c7bfb0e |     
    or1k     |        libostree-2023.6        | NOK | http://autobuild.buildroot.net/results/33f1666c1b176c5926868432f5b87a8622f70883 |     
   nios2     |         libselinux-3.5         | NOK | http://autobuild.buildroot.net/results/c47bb8a5cc99eeec788ae799a240cd36412a1130 |     
   sparc     |         libsoup-2.74.3         | NOK | http://autobuild.buildroot.net/results/fe77ecd9c73be5c7ee25930ba7337bc78335994d |     
    m68k     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/24e7f51e38c8f9feaeac514b9d04925320388aa2 | ORPH
    or1k     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/597c7b6c908e908890011c920399647aa8da300a | ORPH
  riscv32    |          linux-6.5.7           | NOK | http://autobuild.buildroot.net/results/4eebf976f3c48743be5d8fa82838c0bf3bdf5c45 | ORPH
    sh4a     |          linux-6.5.7           | NOK | http://autobuild.buildroot.net/results/a3009afb6070281e28269e46caf4e99fc346ab47 | ORPH
microblazeel |      lttng-modules-2.13.7      | NOK | http://autobuild.buildroot.net/results/96f2881aa1aade7c842a27dedac83e107ba16d5b |     
powerpc64le  |      lttng-modules-2.13.7      | NOK | http://autobuild.buildroot.net/results/b4755adbc614120a5a4431048670384e543254cd |     
    mips     |        mariadb-10.11.4         | NOK | http://autobuild.buildroot.net/results/de1513435d7a2c7b393f367b2c2f60fdd5f7f206 | ORPH
 microblaze  |        mariadb-10.11.4         | NOK | http://autobuild.buildroot.net/results/f1afb674a625d67308029b22cc40d38f1f5b5356 | ORPH
   x86_64    |        mariadb-10.11.4         | NOK | http://autobuild.buildroot.net/results/cc434eda48639aadae2afddbb7ebf6463baef6ff | ORPH
    sh4      |        mariadb-10.11.4         | NOK | http://autobuild.buildroot.net/results/35d20b31fb1af6c5840ce7e62df04cf7f4fdb88a | ORPH
    m68k     |        memcached-1.6.21        | NOK | http://autobuild.buildroot.net/results/d5fbed23df10c38b425dce88dcfe07b0fb6f7000 | ORPH
   arceb     |          monit-5.33.0          | NOK | http://autobuild.buildroot.net/results/dc5a14feae9b5bd79a173af6cd6d83a29fb1d8e1 |     
  mips64el   |          monit-5.33.0          | NOK | http://autobuild.buildroot.net/results/58c02cf72b0f85f54b062e58926cce5af7fca163 |     
 microblaze  |          monit-5.33.0          | NOK | http://autobuild.buildroot.net/results/74c8065a9b93a6085de13fc526cdff9ae7a6571c |     
   mipsel    |     openfpgaloader-0.10.0      | NOK | http://autobuild.buildroot.net/results/e23d9065f9c3256c3e90ca8a67b6eeaf4ad82b3d |     
   nios2     |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/68393818f3c7e905fac8dac68fb2cf0462f2baf3 |     
   s390x     |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/e72f95cb535f711b803c6d9e449be94ab5d0af8c |     
   mipsel    |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/b3f6f29ef697b8fdaac523fe337a4e5d5b144445 |     
 powerpc64   |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/f025de4c0e5c28068de409394d5d9b7b7425df80 |     
powerpc64le  |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/8ef0e1091a311422585973b9ecffcf4f84dd6ee4 |     
   nios2     |     spirv-tools-1.3.261.1      | NOK | http://autobuild.buildroot.net/results/7a04bc68114d018ff4de19de2ab54efb7693c900 | ORPH
  riscv64    |         uclibc-1.0.44          | NOK | http://autobuild.buildroot.net/results/e93d25ba5f82ecac308452196a3e98257f546081 |     
powerpc64le  | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/84db880dd1a894935d99e5b52ccb2f70c4f6856a |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/a8bf8613a1e02e0206151e03838b7c759a09cd8b |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/61048944aed9006fc3f0058d15c91cf3ae187411 |     
    i586     |        valgrind-3.21.0         | NOK | http://autobuild.buildroot.net/results/7eaa22373ceb0a631064fb9588a3daaab5910447 | ORPH
   mipsel    |         wolfssl-5.6.3          | NOK | http://autobuild.buildroot.net/results/f8f48e36f32b21f99ef719b764c03d4bd965c2da |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

               libglib2-2.72.3 | 2 
           crucible-2022.05.25 | 1 
                elfutils-0.186 | 1 
             fontconfig-2.13.1 | 1 
                  linux-6.1.57 | 1 
                mongodb-4.2.18 | 1 
            ocf-linux-20171122 | 1 
                 openssh-9.3p2 | 1 
                python3-3.11.6 | 1 
                      tar-1.35 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |      crucible-2022.05.25       | NOK | http://autobuild.buildroot.net/results/c69c7c635d4d0cc5d3085a15edfbada3e6dfca84 |     
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/e63121bd591629bb334c11f7f5f8af97704cb6b9 | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/b63d52e16ba66ff7334616a5f3acc312b413521c | ORPH
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/7b0a419ef9b1ae7bc370a8b26e90d06d37a5934d |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/6e972f846ddecfa5fa1c292797f5e82eda6ec7fd |     
    arm      |          linux-6.1.57          | NOK | http://autobuild.buildroot.net/results/27576d036548e4726b3707faab1378a0a7b3e737 | ORPH
  aarch64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/e75529a8a02a1c8751b8459a603b676c1d7c3f7f |     
    or1k     |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/bff138ef0a2fc12b6271156270952a430c011e6a |     
  sparc64    |         openssh-9.3p2          | NOK | http://autobuild.buildroot.net/results/a909b59ef5a53bc62cacb4549f8319c33e52a057 | ORPH
   arceb     |         python3-3.11.6         | NOK | http://autobuild.buildroot.net/results/cbeaaae2c4c8d47a7512f76f7086bee4e18d6f1e |     
   xtensa    |            tar-1.35            | NOK | http://autobuild.buildroot.net/results/dbadda2062fcc91603aaf435bb062be6be4dfe1b | ORPH


Classification of failures by reason for 2023.08.x
--------------------------------------------------

              host-rust-1.71.1 | 2 
                  conmon-2.1.8 | 1 
           dmraid-1.0.0.rc16-3 | 1 
                    dust-0.8.1 | 1 
               libglib2-2.76.1 | 1 
               openblas-0.3.23 | 1 
         openfpgaloader-0.10.0 | 1 
                   p7zip-17.04 | 1 


Detail of failures for 2023.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          conmon-2.1.8          | NOK | http://autobuild.buildroot.net/results/f012f5dd30caf7dfd10449f0dc2c1f80e7d64d22 |     
   mips64    |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/4c25cb21dadfb157370a45c35897a13483384940 | ORPH
   mipsel    |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/01a324819e731e6d95a6cdc4465d58f4402ce408 | ORPH
   armeb     |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/dfbff283c33211f7b6d5ff8449cefdad9e5a8eb2 |     
   armeb     |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/12b2bb1633d02fe33d8c1ce9c6059b4e394ecb2e |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/758448141b8414939ab920922d9efd7321ee97de |     
    i686     |        openblas-0.3.23         | NOK | http://autobuild.buildroot.net/results/9f84d8d374cd39aa67638b25ccfd3ca7dff39126 |     
   xtensa    |     openfpgaloader-0.10.0      | NOK | http://autobuild.buildroot.net/results/7d7ab6bbe96aec04fb28a643692e61c4e0bf722e |     
   x86_64    |          p7zip-17.04           | NOK | http://autobuild.buildroot.net/results/0be58c26521f8072b69f64bacfdc40b216540d14 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
