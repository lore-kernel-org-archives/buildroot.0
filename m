Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80715CCA480
	for <buildroot@archiver.kernel.org>; Wed, 13 Jul 2022 05:33:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BC30E4114D;
	Wed, 13 Jul 2022 05:33:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC30E4114D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id swjCGfmh2xtN; Wed, 13 Jul 2022 05:33:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7BA7F41146;
	Wed, 13 Jul 2022 05:33:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7BA7F41146
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E378C1BF4DD
 for <buildroot@lists.busybox.net>; Wed, 13 Jul 2022 05:33:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BC14E410C7
 for <buildroot@lists.busybox.net>; Wed, 13 Jul 2022 05:33:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC14E410C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bIV6mvxYyWkV for <buildroot@lists.busybox.net>;
 Wed, 13 Jul 2022 05:33:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6942440A00
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6942440A00
 for <buildroot@buildroot.org>; Wed, 13 Jul 2022 05:33:04 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A8449240009
 for <buildroot@buildroot.org>; Wed, 13 Jul 2022 05:33:01 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Wed, 13 Jul 2022 05:33:01 -0000
Message-Id: <20220713053308.BC14E410C7@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1657690381; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=2b1CJzaITp16DPcYJKWm3JllI6pfgtPGG2m660jKGgA=;
 b=ilB/J3J7B6ZMo/FN4BbIv1vhTpfHs7ag4UmW2mXSfAev7HhX1zVixUleCzajuHfTbMlogc
 GfmNldmRQNTspmicVeotV+FevuaRFIn5HW6RB/0/2HaD/tu/0jAj1it2xNw4ArhLwcHnSP
 zBj108isRhaJqVcPGZMn3iZ2xDULaaWkPTS6t5VJX1PyELZ546lJJJggpw6PFKlehWed/O
 mNh0xwjQ/uoP1qgpBRQ1N6g3sJIdyuz9XmHkYGx7e/tlLxmQwW1pc4/XW2xWVSmAMpIpFX
 oyI1lfg8TH6OznMM/73KwXcRoH5RunPc6krLclVOKHPaaATKK8JPYkST5sQGhA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ilB/J3J7
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-07-12
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

Autobuild statistics for 2022-07-12
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  7  |  1  |  0  |  8  |
  2022.05.x  | 25  | 30  |  0  | 55  |
    master   | 125 | 195 |  0  | 320 |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 18
              alsa-utils-1.2.7 | 15
                speexdsp-1.2.1 | 15
                   speex-1.2.1 | 9 
                 libvpx-1.12.0 | 8 
             libopenssl-1.1.1q | 7 
                 zlib-ng-2.0.6 | 7 
glibc-2.35-96-g2c4fc8e5ca74... | 6 
host-pahole-73383b3a39afe86... | 4 
                     refpolicy | 4 
                 uclibc-1.0.41 | 4 
                busybox-1.35.0 | 3 
              host-rust-1.60.0 | 3 
           libfreeimage-3.18.0 | 3 
           linux-5.10.115-cip7 | 3 
                   tor-0.4.7.8 | 3 
/home/buildroot/autobuild/i... | 2 
                  acpid-2.0.33 | 2 
                  ffmpeg-4.4.2 | 2 
          host-gcc-final-9.4.0 | 2 
             host-gtest-1.12.0 | 2 
host-spirv-llvm-translator-... | 2 
                libcurl-7.84.0 | 2 
              libgcrypt-1.10.1 | 2 
                libressl-3.5.3 | 2 
       linux-5.10.109-cip5-rt4 | 2 
                nodejs-16.15.0 | 2 
                 pixman-0.40.0 | 2 
               protobuf-3.20.1 | 2 
           python-orjson-3.6.7 | 2 
              swupdate-2022.05 | 2 
                 wavemon-0.9.4 | 2 
/home/buildroot/autobuild/i... | 1 
              alsa-lib-1.2.7.2 | 1 
                arp-scan-1.9.7 | 1 
                    bat-0.19.0 | 1 
             berkeleydb-5.3.28 | 1 
                  bitwise-0.43 | 1 
                  cmocka-1.1.5 | 1 
                 coreutils-9.1 | 1 
dahdi-linux-5c840cf43838e06... | 1 
                 dash-0.5.11.5 | 1 
                     frr-8.2.2 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/jffs2/jffs2.mk:71: /home... | 1 
fs/jffs2/jffs2.mk:71: /home... | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
                     gmp-6.2.1 | 1 
               gocryptfs-2.2.1 | 1 
                   gstd-0.14.0 | 1 
                harfbuzz-4.4.0 | 1 
              host-delve-1.8.0 | 1 
host-gdb-arc-2020.09-releas... | 1 
            igh-ethercat-1.5.2 | 1 
                iptables-1.8.8 | 1 
libcamera-8a845ab078c3fe12a... | 1 
               libcap-ng-0.8.3 | 1 
             libstrophe-0.12.1 | 1 
               libvorbis-1.3.7 | 1 
                 linux-5.17.15 | 1 
make: *** Waiting for unfin... | 1 
                mongodb-4.2.18 | 1 
                    musl-1.2.3 | 1 
                  ntp-4.2.8p15 | 1 
                 omniorb-4.3.0 | 1 
                opencv3-3.4.17 | 1 
                    opus-1.3.1 | 1 
                   perl-5.34.1 | 1 
                     php-8.1.8 | 1 
                    pimd-2.3.2 | 1 
                    pppd-2.4.9 | 1 
           proxychains-ng-4.16 | 1 
rpi-userland-14b90ff9d9f031... | 1 
rtl8189es-39c17661136da48f8... | 1 
       shadowsocks-libev-3.3.5 | 1 
                   uacme-1.7.1 | 1 
uclibc-ng-test-0844445e7358... | 1 
ulog-0389d243352255f6182326... | 1 
                  vlc-3.0.17.4 | 1 
                wtfutil-0.41.0 | 1 
                xenomai-3.0.10 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/75955bbac1cfbaf993462f787b9e7486e1e3d14c |     
   mipsel    | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/5edc1a2906c6de6621946413fc557c1315372d34 |     
    or1k     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/2060314fd10081a8c349d08be9647be63ee8c02a |     
  mips64el   |          acpid-2.0.33          | NOK | http://autobuild.buildroot.net/results/ef496f0afd38c35dadba63f6509930e4c1fcbed9 | ORPH
  mips64el   |          acpid-2.0.33          | NOK | http://autobuild.buildroot.net/results/2bb2ce94d524505d78b6001f2b4565a5e5efac17 | ORPH
    m68k     |        alsa-lib-1.2.7.2        | NOK | http://autobuild.buildroot.net/results/5ef1f0901af9fc0a0916653170a354146993cd98 |     
    sh4      |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/def823c3c100d186dab3bfe05eb67e354d5dc333 |     
    arc      |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/b1773d01d255e424e11a659f4bf64cec4af2897a |     
  riscv64    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/6e7281857ebd1073e0538e02c17c7d8ea65343da |     
   s390x     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/112a03f7d125488fb986fd9a7322d0f6f7c9caaa |     
    arm      |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/48f3a920c0cd335fbf74e22baf1aed7ab080c2e4 |     
   x86_64    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/dc58a8f28d4153272a1352a63af248b570983c25 |     
    arc      |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/aa80c14c9a4371886ce115babd8b52264b04ac40 |     
  powerpc    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/90227076dcf644721436e3767cd7c93a2a80652d |     
  sparc64    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/5ee2051311754d8e00d13b63e303ffbadd9feb19 |     
    arm      |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/6db306a26bad7a30e811685a844f22a5502fd129 |     
   xtensa    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/303a19083b5b655d6375036ab4d693184c0436e4 |     
   sh4aeb    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/4879b3dd475794c1087eee49e5bcf60288810965 |     
   s390x     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/c875b23bd6805138821dc5274da6438070c06df2 |     
 microblaze  |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/6140ad3ca5d8b1592651a348224eb6ff97d14a74 |     
    sh4      |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/f5633709d1b0acb63f5e7070eb7a4129db631716 |     
    m68k     |         arp-scan-1.9.7         | NOK | http://autobuild.buildroot.net/results/ac341392623fff48789aa411c7c45a65692fc660 |     
    i686     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/58ea4d22ebe0b6eb8733fd1ac261026fa856330d |     
   sh4eb     |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/665a5f14857837accace4bec2c82ebe39002407f | ORPH
    m68k     |          bitwise-0.43          | NOK | http://autobuild.buildroot.net/results/8478e9e6f5cd756e3c5ee1c34eef0a33ebd8a222 |     
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/48c6c488ca9154916c344e2c9684581a5c7e3c68 | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/de9d78bb191ffb8737472cbbfca6d9f2ee4c7710 | ORPH
    m68k     |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/b36a88d5fb5a81acc6b290e12c414f9739f8efcd | ORPH
    arm      |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/918e239c7d56a4af02059c6a8bd8acdb02efc7aa |     
   sh4eb     |         coreutils-9.1          | NOK | http://autobuild.buildroot.net/results/51feb5822c5627d285469bf51eb1afa918a64a56 | ORPH
    or1k     | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/ccd0cd46a725bc2029c9f972a5143b7508f98c5d |     
   sh4aeb    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/46d613cef43faca114db10c5113529c0a0e2946f | ORPH
powerpc64le  |          ffmpeg-4.4.2          | NOK | http://autobuild.buildroot.net/results/48fbf14f98730452c7a5166f7154ddecab5185d4 |     
   armeb     |          ffmpeg-4.4.2          | NOK | http://autobuild.buildroot.net/results/699b46eeff56c6497ef0efbd53e1edc34e7c0c95 |     
  mips64el   |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/48dfbb09f39e16f933e19563933688ec85cf3722 |     
  powerpc    | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/7328ce7c9a3cba32afbd116190469be0e2043e46 |     
   mips64    | fs/jffs2/jffs2.mk:71: /home... | NOK | http://autobuild.buildroot.net/results/04d1cf2b0ca1207028ef3d2e468a5243b32bab26 |     
   sparc     | fs/jffs2/jffs2.mk:71: /home... | NOK | http://autobuild.buildroot.net/results/df29f4318a6218df3800703311cbc86825345129 |     
    sh4      | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/d336ef8870c94812d2d3c4a4b2c5c6fb5921daf0 |     
   mips64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/b2bc75826c5e06cbb06d0eb173fb7e1293fe3ed0 |     
   mips64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/cf2640c386e0759384886ca6f73d76fdaa9f7b4b |     
    sh4a     | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/208373252cab3a5fbf099ec8f00057c04d166ab2 |     
  riscv32    | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/d03f0ab19b3bb71b12d05365e6c1fd2d7114fc7f |     
  riscv32    | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/32d1a8d5d62c1084e1feafe53d8a69abf7a58658 |     
    or1k     | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/5b9d88799630b07c8f407050846325fde7a087d1 |     
    sh4a     | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/9ac8501f94140e20ede1efa026a23c9000f51bfc |     
  powerpc    | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/2e306cbc03db386b62d9ab2a45973738b66ff532 |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/79d53bf826c8061ee7a0cebe21d026733f73d203 | ORPH
powerpc64le  |        gocryptfs-2.2.1         | NOK | http://autobuild.buildroot.net/results/a1cfa9e9d87cfdffad89bc28bdbf78836a2b1104 |     
    arm      |          gstd-0.14.0           | NOK | http://autobuild.buildroot.net/results/ee7273913b3fae466a7169e76e9cdb83214d6f40 | ORPH
  mips64el   |         harfbuzz-4.4.0         | NOK | http://autobuild.buildroot.net/results/3fe7526b685368007ae0f66e15ef2b27d30d5063 |     
   mips64    |        host-delve-1.8.0        | NOK | http://autobuild.buildroot.net/results/c908e6e2f98970eaca3519c36730185273816bbb |     
    i686     |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/1146972b67516a98f505ee4633d9cc2786a17e08 |     
   x86_64    |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/0fd2204efd6e0e55acd2a3604b869077953b2abd |     
    arc      | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/7beafacb5519153b76b39c2424cf00dd5cf96d04 | ORPH
   nios2     |       host-gtest-1.12.0        | NOK | http://autobuild.buildroot.net/results/dece54e6f1f5cc7dfbe7841f4b29a5df5cab6666 |     
   xtensa    |       host-gtest-1.12.0        | NOK | http://autobuild.buildroot.net/results/6a8fb259760f84c67a3482cc5964c6610f9b70a4 |     
powerpc64le  | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/3526c4d6b5229a19661f70fe42b174df25c35e8d |     
    i686     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/617ccba48d445086a0b4ea04d6a7b097d840435a |     
  aarch64    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/c9809a40a62e497fa68b1d1f654d4a124f39d5c4 |     
    or1k     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/41803c7cdf05de4643c4ab5eaf90cf790b67c690 |     
   armeb     |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/43ab032bbec8a64d4e68de2c1b8ad62482d922cd |     
    mips     |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/2edaa4247182e90d128efc7203523f10d730333f |     
  aarch64    |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/05fb443d922e4d81a13e60718d53c40757c498e3 |     
   armeb     | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/fdf23585b5c21fff96a3aea9c603fd50d9a01ebb | ORPH
   armeb     | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/3077526f5827df678b6ded0089f2671a86313da8 | ORPH
  sparc64    |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/12452034e7727e0ffc5d2433cff5a55521d60fc1 |     
    i686     |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/4dc63f9a32fc448f707848b517e6a7a99d67caa5 | ORPH
  aarch64    | libcamera-8a845ab078c3fe12a... | NOK | http://autobuild.buildroot.net/results/725a4a1fef1be3aa821829af7b727a7e2515b2d9 |     
    or1k     |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/db2745edd2190ef7e2b6be516331426ea73bc4f8 |     
   sparc     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/8f5c1bf7e0d56762ec36927be0cc378deec44a19 |     
 microblaze  |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/6b7e743915dcd76d7ccaeee4d57dd35ed803668c |     
  aarch64    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/961b9653074d009d0be20f6cc5f9d8c1ebe217bf |     
   s390x     |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/5a5236c2c67cd746b5bd8461ed4fccae83981c18 |     
  riscv64    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/8b87fd44ed6899e9dfb13ae6210c9ed06f203419 |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/1301b99da5ba02ed59855d35dddddd9d78f4bd08 | ORPH
   armeb     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/a4b1b04b512f6b10ff1d592ecf4231eabf97ee11 | ORPH
   xtensa    |       libopenssl-1.1.1q        | NOK | http://autobuild.buildroot.net/results/b6a922a83099b79c637e2a1e8ea41140604b3b9c |     
    m68k     |       libopenssl-1.1.1q        | NOK | http://autobuild.buildroot.net/results/3370ef3334a5a0e2242bf90942ca39d4875e49b5 |     
    m68k     |       libopenssl-1.1.1q        | NOK | http://autobuild.buildroot.net/results/1e1a85c00a95a6184166ec29ea0a087c2239ab91 |     
   arceb     |       libopenssl-1.1.1q        | NOK | http://autobuild.buildroot.net/results/4522d8e9f5db49b17d378e63c63cc29852f34858 |     
  powerpc    |       libopenssl-1.1.1q        | NOK | http://autobuild.buildroot.net/results/c1243473f2fbf7b53c19d7ca33373b7d6c27e500 |     
    or1k     |       libopenssl-1.1.1q        | NOK | http://autobuild.buildroot.net/results/c2f2b7e04656c5402b6a7e4a2bb6cf3bc5eedfd7 |     
   arceb     |       libopenssl-1.1.1q        | NOK | http://autobuild.buildroot.net/results/8b5275a5f6087a3ae43ff2b3080c8460c4434777 |     
    m68k     |         libressl-3.5.3         | NOK | http://autobuild.buildroot.net/results/1481803dec0dedcbd392afb4250d57c462313fd5 | ORPH
   sparc     |         libressl-3.5.3         | NOK | http://autobuild.buildroot.net/results/507806a6f1f5e9cc288eb4c111b0286686f5bd56 | ORPH
   sparc     |       libstrophe-0.12.1        | NOK | http://autobuild.buildroot.net/results/fb4bb10f7f2819cf41c2101ab63a9a43c2aacee4 |     
  powerpc    |        libvorbis-1.3.7         | NOK | http://autobuild.buildroot.net/results/77d1b447564de39de8191f2b1f8f0c987966501d |     
 aarch64_be  |         libvpx-1.12.0          | NOK | http://autobuild.buildroot.net/results/8032c6842c6c06029cb697a355c3f7428922e558 |     
microblazeel |         libvpx-1.12.0          | NOK | http://autobuild.buildroot.net/results/6df315f42305ce05f6fffb6b65e4666b75758fa6 |     
   x86_64    |         libvpx-1.12.0          | NOK | http://autobuild.buildroot.net/results/54a1ef6b95026b1684ebd8d7c5a6ba4a071d1451 |     
   sparc     |         libvpx-1.12.0          | NOK | http://autobuild.buildroot.net/results/a99b660febd1d6525fdb27447779f3582b1fc38d |     
    mips     |         libvpx-1.12.0          | NOK | http://autobuild.buildroot.net/results/6b6ef5aebd59208ad0f3aafdf34734e985471d3a |     
    or1k     |         libvpx-1.12.0          | NOK | http://autobuild.buildroot.net/results/eb5fe51e5a4469782e32da540c6b76398098eed1 |     
  mips64el   |         libvpx-1.12.0          | NOK | http://autobuild.buildroot.net/results/279b3771de7760207f3112757a0f44379a900323 |     
   s390x     |         libvpx-1.12.0          | NOK | http://autobuild.buildroot.net/results/016c439634454e875c5136618c4d73e908c29ea7 |     
    arm      |    linux-5.10.109-cip5-rt4     | NOK | http://autobuild.buildroot.net/results/dc186fc385e7a34283366a939419d295e4275e54 | ORPH
   xtensa    |    linux-5.10.109-cip5-rt4     | NOK | http://autobuild.buildroot.net/results/79f32a7f9148990670453ce7801cd5a146f04407 | ORPH
 powerpc64   |      linux-5.10.115-cip7       | NOK | http://autobuild.buildroot.net/results/4daab35bbd9020eda1e944de7bcf5ff1ee3c611b | ORPH
    mips     |      linux-5.10.115-cip7       | NOK | http://autobuild.buildroot.net/results/5cf645eeceda30e9b4f2232ffbe7784d476d6ade | ORPH
microblazeel |      linux-5.10.115-cip7       | NOK | http://autobuild.buildroot.net/results/262fdaa693451cf1f56b5371b3ffaf95fc5cac15 | ORPH
   s390x     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/c628ac736cf9c5b1269a405fa67bbc32b7a736f5 | ORPH
  mips64el   | make: *** Waiting for unfin... | NOK | http://autobuild.buildroot.net/results/9426abc5d8f0b8963d62cc2ac94a9ba2f1470b8d |     
  aarch64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/0c0c0f8d97d08f5bd81020e11748eb36ba3697cd |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/bac4489b489f9b62b5f00be6a3aaac2db90e4ca1 |     
  aarch64    |         nodejs-16.15.0         | NOK | http://autobuild.buildroot.net/results/bfae65c7afedebebef4140458fe4ff488b6af728 |     
  aarch64    |         nodejs-16.15.0         | NOK | http://autobuild.buildroot.net/results/31e9c484d102e16351fbf05de586bdabd8a45009 |     
   sh4aeb    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/2bb065e02d2955dbde63dedade7a5349dbae7497 | ORPH
  sparc64    |         omniorb-4.3.0          | NOK | http://autobuild.buildroot.net/results/9f11d8bc0649b3f1bd994a7686d8e4a61f1bb422 |     
  aarch64    |         opencv3-3.4.17         | NOK | http://autobuild.buildroot.net/results/57b11c96462807792f531d78612ac6d225f97b91 |     
    arm      |           opus-1.3.1           | NOK | http://autobuild.buildroot.net/results/6b662c8ed47692fed49ca0a14c03b54586545980 | ORPH
microblazeel |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/a5232facf0059827747b929f041b2ff65636f1f5 |     
   sh4aeb    |           php-8.1.8            | NOK | http://autobuild.buildroot.net/results/4aafc7a2a06d8312c30e83c35a6c13bce3b04f03 |     
    arc      |           pimd-2.3.2           | NOK | http://autobuild.buildroot.net/results/7b3776af05fcc99049cd32bc9b4cf23d57d483d6 |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/255997248312fbc427c0406cc2f6034e108f17eb |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/7063a0a9f418e08c3b0c94ba2c67ab9e853f417b |     
  riscv32    |           pppd-2.4.9           | NOK | http://autobuild.buildroot.net/results/fd58f49222921d77a7c767f58219f93625a521f8 | ORPH
    m68k     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/8f9f9b3e7a0d470a32635204a9194c2e57fb3825 |     
   nios2     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/8ea028148758cf1c7eeb2d72fa304fd8f6428b2d |     
    mips     |      proxychains-ng-4.16       | NOK | http://autobuild.buildroot.net/results/8ed1481e29321ed3da40251f700cb3bd66f62c94 | ORPH
    i586     |      python-orjson-3.6.7       | NOK | http://autobuild.buildroot.net/results/191b598db73c4949884fc93abe28e2f23996f72b |     
    i586     |      python-orjson-3.6.7       | NOK | http://autobuild.buildroot.net/results/4e636bc816e6dde077dc4fbad297252bd1a3f204 |     
    arc      |           refpolicy            | NOK | http://autobuild.buildroot.net/results/2e17d00a0518c9cfbffdcf8edce434047566cd97 |     
    i686     |           refpolicy            | NOK | http://autobuild.buildroot.net/results/3dad3d059fae05505cbd25d6bb542ce3058d08d7 |     
  powerpc    |           refpolicy            | NOK | http://autobuild.buildroot.net/results/cd4df9c7d16c05194bb6dff886fc414f0b2db7db |     
powerpc64le  |           refpolicy            | NOK | http://autobuild.buildroot.net/results/b78d6d2e38e26f40a4f3a876285486748fc846e6 |     
    arm      | rpi-userland-14b90ff9d9f031... | NOK | http://autobuild.buildroot.net/results/501df70d97c3cb0ffce5dfcc046edd799e8be7b2 |     
   arceb     | rtl8189es-39c17661136da48f8... | NOK | http://autobuild.buildroot.net/results/4ce0be89e6b755b9d2d6e7236ece48e07eb7a060 |     
 microblaze  |    shadowsocks-libev-3.3.5     | NOK | http://autobuild.buildroot.net/results/c98cc60aada0f5afb8e183fa400a9994e4c3d5b5 |     
    or1k     |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/78d67f8def6a7be0568940a9c95f7f4ae54cb569 | ORPH
  sparc64    |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/343a534133f91075d434c529607e5556941b46c9 | ORPH
  mips64el   |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/88e2c1311ced9c4da7f15c55b838e5dc0e729dae | ORPH
   nios2     |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/944137f4c7dec897a271ff41bceee64b0c4ce60e | ORPH
   armeb     |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/835f6f021b2ca4b8c8e9d39fe413bbea68dd57a6 | ORPH
    mips     |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/52d3489d74b596dd8f5e5c59b043bf732e446f11 | ORPH
 powerpc64   |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/8f27298b66abf5efc811c156c6cf02f580a6c8cc | ORPH
   sparc     |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/0f74ddb914332353b00ee8ba2a153dd0f7a66044 | ORPH
   nios2     |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/95e18c03b15eb057905741aafcae7590b2b16db5 | ORPH
   s390x     |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/b2a8e6fd51e0f268e2df1883ec57fb1d6db8ab24 | ORPH
   xtensa    |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/62e3d95de199d37a958da4317a7161cc18fb03b1 | ORPH
    m68k     |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/c2629ef10c6d6fd2cf4daff940276596f8fbd907 | ORPH
 aarch64_be  |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/1f7cb7c8c6d91fa35efc43faf326238f62fcb9e4 | ORPH
    arc      |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/d89ece20ec2c9d7fc629691264f3f69a3b6113d2 | ORPH
   mipsel    |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/a4a82398d36e3e73871d228e55a7982a738eb4bd | ORPH
 aarch64_be  |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/948a28f724b279eb8feb660b4acaffb0af32ed21 | ORPH
   sh4eb     |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/c2f0e91b396a932a354e76decf16c6adb6ac3417 | ORPH
   x86_64    |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/6c71172b9820cb3ea4513f49b2d69d8c481ecbae | ORPH
 microblaze  |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/ba8001f73f5f95fc13aa01580b729921345cee33 | ORPH
    sh4a     |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/9d5f48807065a5e44976e777f8c8d079df730bcd | ORPH
   mipsel    |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/b4ac67f12a51f3403fa53d23d659e954fd7eec6c | ORPH
   nios2     |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/2adaa4cc10a2273dea66868ec111e94547f774bb | ORPH
   mipsel    |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/715c4e7f7ea232884e8968401bfc1a23441e0b77 | ORPH
   nios2     |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/e416c0142e7a5c90562659ceb10ae7e933235dcc | ORPH
microblazeel |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/f2a3609412efe005b66e3539d26c1d775cea64c6 |     
   mipsel    |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/a4bf0660a4d2bdb21f5c3fe06dabc3fc5e0fe9f3 |     
  riscv32    |          tor-0.4.7.8           | NOK | http://autobuild.buildroot.net/results/be0df86128592f866f79208b64f14c672bef96db |     
    m68k     |          tor-0.4.7.8           | NOK | http://autobuild.buildroot.net/results/48c711f3a3ed58a8b617fccb3951e659347eb181 |     
microblazeel |          tor-0.4.7.8           | NOK | http://autobuild.buildroot.net/results/6b5dc84ef5c0e08c77158bcd4010dedeb08759f8 |     
 powerpc64   |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/49f799f7acdf91893ae7082c1edd8f565b2a9bc7 |     
   armeb     |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/3884003a937491529900c9d95524217606fb50d1 |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/dfaebb5b6b28d5ec3acf2263a5cd64e8aaaa3fbf |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/35c399d4c3a3f16abf463dfd9876fe0d7c61962e |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/cc2f75e8ecfe1e89d2442d7bb43dda4a800a2dc8 |     
   mips64    | uclibc-ng-test-0844445e7358... | NOK | http://autobuild.buildroot.net/results/ce81cb71ce36295d364945cf68716c4993b9109b |     
  aarch64    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/ed7f03210c996314baadeaece40087faf64e7d0d |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/5d80d03edd07208e9b93820107f2d0c22072aa12 |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.net/results/906d0f372c96b06f7d0a889cdcb6e36ae77f5d8c |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/038b3d9da4f0abd3f226691bf9dc0f8c357ad279 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/5d5eb6eeeb36205ab1ecf88a8e8d7d7c31cfa254 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/3d517d3b5b4754a1a9c95b1382e53e8b374f3d46 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/0c245c51766f47ca9d88cc2ff833593488169455 |     
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.net/results/8497ee520c5f9889fa238811ff410321a76d44d1 |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/a84bc051d0ef4726a2c42554abcb131a36033820 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/fe0a99d2f502930f778e7064655fe388449d78d0 |     
   armeb     |            unknown             | NOK | http://autobuild.buildroot.net/results/3e173e4b0020f6fcfe7a623f0d27e2657f581a97 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/3e51bbd94a873fc0e1b6a2d636392ee1a860a4b0 |     
   armeb     |            unknown             | NOK | http://autobuild.buildroot.net/results/629aabd00cebcad980bf707a70642a67ad4472ca |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/303d93d9a27c1ee3850d0151a5ffbdbb651f122c |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/7846fe188c1886369a6d0787ed87588615cfd4d2 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/703eab69bc9b88a29a455992b5c947d96acc1d18 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/cf9d74ea9398e7e061c364f193eb5a5b6d206772 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/5ac5b51191e3ba850ca48f01bcf0c58454bc2c76 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/3e47a42038070db2f1542302b6cee0ce8d491d19 |     
   mipsel    |          vlc-3.0.17.4          | NOK | http://autobuild.buildroot.net/results/1518a9708a0308a6453dc2d05d69c666b96ca032 |     
 aarch64_be  |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/c866dcbfb7eb7cf33079f291b7d7844cbd9a9eec |     
   s390x     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/76c46151d0eaf2518a378b790cef73063ca4bfd6 |     
powerpc64le  |         wtfutil-0.41.0         | NOK | http://autobuild.buildroot.net/results/7eee584fb886eaa1a02d3c29df3c753228dedb52 |     
microblazeel |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/0aa67602e3d2fad3047b6f985e04318e2d5ed2ea |     
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/6dd8ba622ff24f233145d6d42be2d1b6a6b2ae7a | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/7c3dfc8c6f53553605f46d7f815298a9a1803dfe | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/f0bf53afdab7a9c31f86d813df9758c13d3fb473 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/fc8b13aece24fc6a4afcbb077be0feaee4871dff | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/fb3bdadb89f70d5e89f7a683f4907c283e4b4423 | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/b428743e7e7657b65bb48efb48021415731cbb44 | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/6bb306f4bfb5060e1720d4bca33fe458524cfff8 | ORPH


Classification of failures by reason for 2022.02.x
--------------------------------------------------

           libfreeimage-3.18.0 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/4a010de451f0b31fcb7bed28b871f461e3090f15 |     


Classification of failures by reason for 2022.05.x
--------------------------------------------------

host-pahole-73383b3a39afe86... | 4 
                busybox-1.35.0 | 2 
                 dash-0.5.11.5 | 2 
           libfreeimage-3.18.0 | 2 
               libglib2-2.70.4 | 2 
              swupdate-2022.05 | 2 
                elfutils-0.186 | 1 
              host-rust-1.60.0 | 1 
      libabseil-cpp-20211102.0 | 1 
                 libbsd-0.11.3 | 1 
               libsigrok-0.5.2 | 1 
           linux-5.10.115-cip7 | 1 
                 linux-5.17.13 | 1 
          moby-buildkit-0.10.0 | 1 
               protobuf-3.20.1 | 1 
rtl8189es-39c17661136da48f8... | 1 
rtl8812au-aircrack-ng-37e27... | 1 
                 systemd-250.4 | 1 
toolchain-external-codescap... | 1 
                 uclibc-1.0.41 | 1 
                       unknown | 1 
                  xvisor-0.3.1 | 1 


Detail of failures for 2022.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/c4d3caa35bd1ee53ddeac38bb4f215880d46d6ce | ORPH
    m68k     |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/854332402be9da4679105ff83c9cb4f211adc3ad | ORPH
  sparc64    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/5626ca8068c87e0d267495442a0a008d7a4d9479 | ORPH
   x86_64    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/62e7f41248a7e81a882a976df9c16a006bb87143 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/2051724bf124b74b076fdb906a652cfa76a05b74 | ORPH
 microblaze  | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/31ceaa4adfe8eb0978b43f19ca411d25977bbe13 |     
    mips     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/cc444d7b4dcdea4ec9c97d1b76aebbe72385bcb7 |     
    sh4a     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/9b7c3dfdd12487794823026c51546a3e635a8890 |     
 powerpc64   | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/41471b91accf8ce188bce70c24f61358588f4e44 |     
 powerpc64   |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/489ec66268b576c3394cd4691a5e73a8831a6938 |     
   mips64    |    libabseil-cpp-20211102.0    | NOK | http://autobuild.buildroot.net/results/62e60919c3ed7ec738e6f9b5f938129cb7cb78a8 |     
   sh4eb     |         libbsd-0.11.3          | NOK | http://autobuild.buildroot.net/results/d5bf59f82b478a5df45eb6b7a4493db4087adedd |     
  riscv64    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/3c5e71799892c6babbc2e83aceb1aa307c5d28e8 |     
    mips     |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/a0e2e7cb0979b8bfbe3af6a4fad3e5e23e61681e |     
    arc      |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/b7e146ad38c87ac64925f30227ad7a1fac64ba64 |     
    arc      |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/786f9ad2a96531566c8e6e39115b0714c51a27ad |     
    arc      |        libsigrok-0.5.2         | NOK | http://autobuild.buildroot.net/results/7e98a7be3f2652355a499c9b6928cfd76722082b |     
   mipsel    |      linux-5.10.115-cip7       | NOK | http://autobuild.buildroot.net/results/9cd48a5bc60c7ca8b965e8712f425990e45bd28f | ORPH
  mips64el   |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/b832c27ca4b027459a44420185141195507564a2 | ORPH
  aarch64    |      moby-buildkit-0.10.0      | NOK | http://autobuild.buildroot.net/results/6855fa8f4d02d10b931e2331243657903c65c101 |     
    sh4      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/bc68f8f9aa37be400982b9af5ecd523a6dd84439 |     
  sparc64    | rtl8189es-39c17661136da48f8... | NOK | http://autobuild.buildroot.net/results/7c76c60e8b671fe38daeaa5bed6a0c63f90982a8 |     
  riscv32    | rtl8812au-aircrack-ng-37e27... | NOK | http://autobuild.buildroot.net/results/38bd31326b49a96d94608658d2aea6627bcf991b |     
   x86_64    |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/073af2627dd347d81b3765584114c92eb5f50da6 |     
   x86_64    |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/f30a2d00f4c846d1ff4091c429af3f28065a8f13 |     
   s390x     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/cec8ed8c179ba22c1aee064804c9f4630f29d40c |     
  mips64el   | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/df80a1e097f06db0802e28f0bdacb0e936fd94e3 | ORPH
  riscv64    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/3c7d2d15483a36105a0a2b52423aa1c161bb91a1 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/d0fdd08b33bdb3f97d2030d03d095e588f02b827 |     
  riscv32    |          xvisor-0.3.1          | NOK | http://autobuild.buildroot.net/results/caebd7f0d81d486613e26db7ed0574f0be51317d |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

