Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E52F6C433EF
	for <buildroot@archiver.kernel.org>; Wed, 20 Jul 2022 05:34:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C04141968;
	Wed, 20 Jul 2022 05:34:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C04141968
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qxG3Ws7krzvQ; Wed, 20 Jul 2022 05:34:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 30B4341969;
	Wed, 20 Jul 2022 05:34:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 30B4341969
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1400A1BF957
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 05:34:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D54EB60C14
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 05:34:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D54EB60C14
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eQxRiYVUhOC9 for <buildroot@lists.busybox.net>;
 Wed, 20 Jul 2022 05:34:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E68060B30
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2E68060B30
 for <buildroot@buildroot.org>; Wed, 20 Jul 2022 05:34:14 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 43246100007
 for <buildroot@buildroot.org>; Wed, 20 Jul 2022 05:34:12 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Wed, 20 Jul 2022 05:34:12 -0000
Message-Id: <20220720053417.D54EB60C14@smtp3.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1658295252; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=q96MV6wc9mDlW2nnFdVP/hYHjOA1Z9rLW0WKIbrJ6fk=;
 b=B9FwQz7RjbUT76u5ynneozMg3eD7TQSiB2lutHMa7WTnkUIpidpGKlhE56PYlRyDtG1sb6
 /3Myo1fop88/vv845ZlAJ2M6t92yXCZR4whR0tC+zwJR0Y6sUbQZfLp2i38gAIoNuUHLUY
 3/AB87FehvXX5J6NA7KGnKRr+CNq19+jDqFvwuweee0u6/f5xU5hXnFf4OldVZllWn1MEz
 CKM4Kf5eKD6FWNIYeYe3NdqMtJMYo8x1/R3cIzjmBzltb9G0R8/pEkOLnNGDjfbfVtjTwL
 IYiAEb7MMEyl/s8xIjbHfHNq8d2/R6Zc5FaLP6OkMj8wr85/+6jT7HG7JkozyQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=B9FwQz7R
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-07-19
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

Autobuild statistics for 2022-07-19
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  | 20  |  5  |  0  | 25  |
  2022.05.x  | 32  | 23  |  0  | 55  |
    master   | 149 | 179 |  0  | 328 |

Classification of failures by reason for master
-----------------------------------------------

                speexdsp-1.2.1 | 14
                 linux-5.17.15 | 9 
                   speex-1.2.1 | 9 
                 libvpx-1.12.0 | 8 
host-pahole-73383b3a39afe86... | 7 
               protobuf-3.20.1 | 6 
             libopenssl-1.1.1q | 5 
                 uclibc-1.0.41 | 5 
                 dash-0.5.11.5 | 4 
glibc-2.35-96-g2c4fc8e5ca74... | 4 
                     php-8.1.8 | 4 
                 pixman-0.40.0 | 4 
                 zlib-ng-2.0.6 | 4 
dahdi-linux-5c840cf43838e06... | 3 
         host-gcc-final-10.3.0 | 3 
                     refpolicy | 3 
                   tor-0.4.7.8 | 3 
                   uacme-1.7.1 | 3 
              alsa-utils-1.2.7 | 2 
                busybox-1.35.0 | 2 
                host-go-1.18.3 | 2 
         host-protobuf-c-1.4.0 | 2 
           libfreeimage-3.18.0 | 2 
              libgcrypt-1.10.1 | 2 
               libglib2-2.72.3 | 2 
             libgpg-error-1.45 | 2 
                 libp11-0.4.12 | 2 
                   perl-5.34.1 | 2 
          perl-net-ssleay-1.85 | 2 
rtl8723bu-19b4bdc05483a1e79... | 2 
rtl8723ds-76146e85847beb242... | 2 
              swupdate-2022.05 | 2 
/home/buildroot/autobuild/i... | 1 
             18xx-ti-utils-8.8 | 1 
                  acpid-2.0.33 | 1 
              alsa-lib-1.2.7.2 | 1 
               apcupsd-3.14.14 | 1 
                  assimp-5.2.1 | 1 
                     aufs-util | 1 
                    bat-0.19.0 | 1 
             berkeleydb-5.3.28 | 1 
                    brltty-6.4 | 1 
              containerd-1.6.2 | 1 
                elfutils-0.186 | 1 
                  exempi-2.6.1 | 1 
                 fdk-aac-2.0.2 | 1 
                  ffmpeg-4.4.2 | 1 
                     file-5.41 | 1 
                flannel-0.14.0 | 1 
                     frr-8.2.2 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
  gobject-introspection-1.70.0 | 1 
               gocryptfs-2.2.1 | 1 
gummiboot-2bcd919c681c952eb... | 1 
         host-gcc-final-11.3.0 | 1 
          host-gcc-final-8.4.0 | 1 
          host-gcc-final-9.4.0 | 1 
           host-harfbuzz-4.4.0 | 1 
              host-rust-1.60.0 | 1 
host-spirv-llvm-translator-... | 1 
                   hwloc-2.7.0 | 1 
            igh-ethercat-1.5.2 | 1 
                iptables-1.8.8 | 1 
                  janet-1.22.0 | 1 
              jpeg-turbo-2.1.3 | 1 
kvmtool-f77d646ba01d04be5aa... | 1 
               libcap-ng-0.8.3 | 1 
                libselinux-3.3 | 1 
                    lv2-1.18.2 | 1 
             netsniff-ng-0.6.8 | 1 
                    opus-1.3.1 | 1 
                    pimd-2.3.2 | 1 
                    pppd-2.4.9 | 1 
           proxychains-ng-4.16 | 1 
qt5xmlpatterns-189e28d0aff1... | 1 
rpi-userland-14b90ff9d9f031... | 1 
                sg3_utils-1.47 | 1 
       shadowsocks-libev-3.3.5 | 1 
ulog-0389d243352255f6182326... | 1 
                       unknown | 1 
                 wavemon-0.9.4 | 1 
               xfsprogs-5.14.2 | 1 
                  zabbix-5.4.9 | 1 
                zerofree-1.1.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/a9f2574f353291c16a4621448ddef31738a5bf8f |     
    m68k     |       18xx-ti-utils-8.8        | NOK | http://autobuild.buildroot.net/results/ef978050c240526017009514651aa98e3a9457c1 |     
   mips64    |          acpid-2.0.33          | NOK | http://autobuild.buildroot.net/results/25635dcefe1c472840877ac3198976979a9729ca | ORPH
    or1k     |        alsa-lib-1.2.7.2        | NOK | http://autobuild.buildroot.net/results/606d31fb88ee3f60cc13019be9f098676ee75b90 |     
    mips     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/640062e76cd685221cb605d945d84de9aea86dcc |     
   xtensa    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/bf05816353ca14aa152ad9bcbe62e90d26665bc6 |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/902ef33a4aae3b5bcb70a85343ec893bd9c8ee7b |     
   nios2     |          assimp-5.2.1          | NOK | http://autobuild.buildroot.net/results/eccd820c328d0c1ae80d07a96e77c92df29ee8cc |     
    i686     |           aufs-util            | NOK | http://autobuild.buildroot.net/results/a806d227313235ac703d19ab265dafe19022bad7 |     
   mipsel    |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/51da500b4b6a8f77b0bb10391803fea023bf5acb |     
   sh4eb     |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/e7250a51b239c2cb35b13960707a7fb3288f2923 | ORPH
microblazeel |           brltty-6.4           | NOK | http://autobuild.buildroot.net/results/e3b2f8ed526144c797818a540c185bf71fd815c6 |     
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/a705e1507cffd7515a9abe001faa6ac4ca7d758d | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/4cad5e29253f8b670d3258574cae6685bdafa9fa | ORPH
  aarch64    |        containerd-1.6.2        | NOK | http://autobuild.buildroot.net/results/7fb6e8db839890794a9fec2b7a672dbec7376c89 |     
   arceb     | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/985c383f6698475d771d19da991d7854a9c3c851 |     
    arm      | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/c86b9423fc5c7f2eb8835c1adda4607f263e06e0 |     
   sparc     | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/96b1e72ee8bce857cd95a0206fbe963d77f39115 |     
   sh4aeb    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/faf74272cfec4c8bef50f15b21c713a3724e18b7 | ORPH
    sh4a     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/28ebc649929c7ac674b5336b25a98dd4892ef001 | ORPH
   sparc     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/82a05f2a9a8b037e9d10d1ca359cea40d16e4c63 | ORPH
   mips64    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/7f4607e57d5fe66c006445cb5c7328cdca49902a | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/39c8e7d1420e0c2ec5cdda2a18b8ae3901019900 | ORPH
    mips     |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/f8b6112c6fd3adcbc1804c319a7d934e833808dc |     
    arm      |         fdk-aac-2.0.2          | NOK | http://autobuild.buildroot.net/results/fdb3d6118042a35f8111b0b952d082487479ceaa |     
powerpc64le  |          ffmpeg-4.4.2          | NOK | http://autobuild.buildroot.net/results/526f748b042241b9ddf059ec6ce5d957a7176c72 |     
    arm      |           file-5.41            | NOK | http://autobuild.buildroot.net/results/45c7469a3b2e639c9b07994bd28027317058b5d7 | ORPH
  aarch64    |         flannel-0.14.0         | NOK | http://autobuild.buildroot.net/results/2dc0afc711fb49e4ac21cec195e63e2304088e98 |     
   xtensa    |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/c1ac1b5cdce617309543bdedf0f3e1d1c9e275f5 |     
    i586     | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/9305754d2c16f5b74ebf540a33df219c50442e4f |     
   mipsel    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/e1beaca6a7c96bd7900746bcde49a16e05e36ef1 |     
  powerpc    | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/f61a1bbf232751c441a808e6c1f960cca257cab8 |     
   nios2     | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/241016ae3cbbc96eca4770445b67c71604bba03a |     
  riscv32    | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/4da7fcc877accccb2d28a7cbd17c7face67a7f2e |     
    or1k     | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/f472be0384c5e40bd592f709781849bb2771ff8c |     
  sparc64    |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/1b2c2ae1d1136fcf3e54f0907133d28c9c57b352 | ORPH
   x86_64    |        gocryptfs-2.2.1         | NOK | http://autobuild.buildroot.net/results/fb72d87a522bcbae4305c9b8c6f0f070d9a3e514 |     
   x86_64    | gummiboot-2bcd919c681c952eb... | NOK | http://autobuild.buildroot.net/results/c860ec22a08fea12dd603aa67a56f3aae3ec37c6 |     
  riscv32    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/3964d743e5ac4d9b0070e42f64510fdae38b891e |     
    i686     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/cca707eedf238eee2746b665ccfc454a97bcb836 |     
  riscv64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/862202174adc37bf72065cf16124b3402306f136 |     
  riscv64    |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/80d505ce054f600a1a5decb5f55c633d90d024ed |     
  powerpc    |      host-gcc-final-8.4.0      | NOK | http://autobuild.buildroot.net/results/465d4ce154b243d0a67ccaaeec65c6b8985ee143 |     
   armeb     |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/5e61ce562c9aac0601e14d24823a8587b0a8766b |     
   mips64    |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/c9f083f71732f039818d11fbb8b47cb5ac3c7fdb |     
powerpc64le  |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/2728b7149a900ed2dd8ed497acd70cbfd94af043 |     
    sh4      |      host-harfbuzz-4.4.0       | NOK | http://autobuild.buildroot.net/results/48727eb482485255431aa57f61055756ff2b4ad3 |     
    sh4      | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/3cd255e3d5b70a8035b11ec8eadcaa6973b0393f |     
   armeb     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/4140d71ebe8ad5fee6faa8410390d92f4c0959ca |     
    mips     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/71376e40ef9bf4c5515eab33a53fc8f7c0ed8440 |     
    sh4a     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/debcf945d6eecbb4ff91aa06069b62d4890e525c |     
    arc      | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/851afd9d3456fac4c79e5e94a2104432dbb569a7 |     
   s390x     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/a232c0ee39d61f9045e923d59a12b5343d5080a5 |     
microblazeel | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/633d1768dd599e2617bab0a2cd926ca5d35630e2 |     
microblazeel |     host-protobuf-c-1.4.0      | NOK | http://autobuild.buildroot.net/results/8bd373a430258eb9e02570d40107f4ed34c93dac |     
  sparc64    |     host-protobuf-c-1.4.0      | NOK | http://autobuild.buildroot.net/results/418cbe45ca5a508522a59d45af2743ea53d9592a |     
    arm      |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/268509dd319147a0e04169fa19cc94c63d04e2d3 |     
    i686     | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/0069c172f3490d152c64c5936128eb33711fc57c | ORPH
   x86_64    |          hwloc-2.7.0           | NOK | http://autobuild.buildroot.net/results/b817a311e60709a7f900e53af12b4fd9066aa606 |     
 powerpc64   |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/253623dc9fc4f8d8840620dee73ecf8998b5603d |     
    i686     |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/1d0a4fbb663a0c93680342a74cf89d5491ed53d2 | ORPH
 microblaze  |          janet-1.22.0          | NOK | http://autobuild.buildroot.net/results/3569b655689f00ae6df1f75cf90b5308033550cf |     
powerpc64le  |        jpeg-turbo-2.1.3        | NOK | http://autobuild.buildroot.net/results/6bc1b0486e444d9370f088038f3543499d9f23bb |     
   x86_64    | kvmtool-f77d646ba01d04be5aa... | NOK | http://autobuild.buildroot.net/results/a805fb624877a93bf5de2000c07f528779ab75ab |     
    or1k     |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/e8b65759b2617093817ff035dca9bfce9af44049 |     
   x86_64    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/eca6a2779ee5b66c5a853822ca26f4cdc2662932 |     
  riscv64    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/6f0473fc467f247606ebf776333287a548c89fed |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/6ecce7ec2636ba4c0558f6776ad750187bde7f1a | ORPH
    i586     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/b0da19e3c6e4731278115e553c17d05f74f5feaa | ORPH
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/2f49a8e5d386f8fa887c5af90a0986f5ad9434ae |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/8575d9cdfb0e8e4f494e356f23bb333227664114 |     
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/25ca6f9bcf2aa9016a32b276ce9bad421d8fb742 | ORPH
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/a3560726f12eb9a65b1823733c5c48a1d6f5b11f | ORPH
   sparc     |       libopenssl-1.1.1q        | NOK | http://autobuild.buildroot.net/results/bed3fd5e16badf463ebd21f1fa9d9d487c8a13f6 |     
   arceb     |       libopenssl-1.1.1q        | NOK | http://autobuild.buildroot.net/results/4bd5906d53b0eec58c8ccde5c6305fb802d96bf8 |     
    arc      |       libopenssl-1.1.1q        | NOK | http://autobuild.buildroot.net/results/d854bff7a634d7d161a159f8420b50646a921e9d |     
    arc      |       libopenssl-1.1.1q        | NOK | http://autobuild.buildroot.net/results/d35b27dc0fa01294a17d69326e9c57b46a77a18e |     
 aarch64_be  |       libopenssl-1.1.1q        | NOK | http://autobuild.buildroot.net/results/8ddc3a99c01bf7f45e6c4876bb8e616303ca0a1f |     
    arm      |         libp11-0.4.12          | NOK | http://autobuild.buildroot.net/results/10263931e5e5b2fccd6e9846b3ab90000fedb373 | ORPH
 microblaze  |         libp11-0.4.12          | NOK | http://autobuild.buildroot.net/results/22adeb78ec4a807c362e6666825f50db6c0408f7 | ORPH
    or1k     |         libselinux-3.3         | NOK | http://autobuild.buildroot.net/results/177a4b941746335a0f1cf08a935111b7b218cb81 |     
 powerpc64   |         libvpx-1.12.0          | NOK | http://autobuild.buildroot.net/results/3419ab5c94053aa022487f8efa5b89ea765f876c |     
   x86_64    |         libvpx-1.12.0          | NOK | http://autobuild.buildroot.net/results/a96647195ce38ae47853bac4c33a778c80468af3 |     
   mipsel    |         libvpx-1.12.0          | NOK | http://autobuild.buildroot.net/results/547129f31fdf437f8a00ccad8c68b76076d9926b |     
   armeb     |         libvpx-1.12.0          | NOK | http://autobuild.buildroot.net/results/9aa5a61d0f0581e5c834d0cf0fd87fb6fcef9f92 |     
  aarch64    |         libvpx-1.12.0          | NOK | http://autobuild.buildroot.net/results/f87021d85b27902b41ae716155b974ccd850025f |     
   sh4eb     |         libvpx-1.12.0          | NOK | http://autobuild.buildroot.net/results/6d5cb13f9d8892cdbf1905de6b623186662eca65 |     
 microblaze  |         libvpx-1.12.0          | NOK | http://autobuild.buildroot.net/results/cd3968ca55d94b993ddc4b8eaa04fcc5c4720586 |     
    arm      |         libvpx-1.12.0          | NOK | http://autobuild.buildroot.net/results/d73de7dba1b0d9d7622fbf01bf255cc3968851d6 |     
    sh4a     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/d699a8616db2106e8cbdef0dec0a8008c5a1a903 | ORPH
  powerpc    |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/104101bb2cf6b504137f842ed93ed2197b647bc0 | ORPH
   arceb     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/7dec2fee29cb13ccbc90aba1745cc7cfad9121a9 | ORPH
   s390x     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/26c0b14ab83b8eecf4c24d3ffe3bc733750c25a5 | ORPH
   armeb     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/b1d88d5f98f0ff98f2d9d9400e383afdf713c1a1 | ORPH
 powerpc64   |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/79c17cf642c22125f1aa75abe257ffadbbcd46d7 | ORPH
   s390x     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/4b2cc8c86ce272a48292912b458ffeabbdcca018 | ORPH
   armeb     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/87812eab215b7c43f84a169c13238f9499fe3a84 | ORPH
  mips64el   |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/19b442f0c4033e72ecedb2371f057b335445a04e | ORPH
   x86_64    |           lv2-1.18.2           | NOK | http://autobuild.buildroot.net/results/219195c4efffcc42e8025b2e7504d445bbd4db93 |     
   mipsel    |       netsniff-ng-0.6.8        | NOK | http://autobuild.buildroot.net/results/ad08783ce5dcf5f8f582d98be9d2aeb624d6a5ad |     
   armeb     |           opus-1.3.1           | NOK | http://autobuild.buildroot.net/results/959013c1b76ec15507f1bdc28696e2f22c974520 | ORPH
    arm      |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/98c0c07af41de110300130ceb36b3ee267d6e123 |     
    or1k     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/2c30b34973c2396c2890187874e3cdb77d05711f |     
  riscv32    |      perl-net-ssleay-1.85      | NOK | http://autobuild.buildroot.net/results/1bcea5ab8f002beabd992c315d8ef973f6210d22 |     
   mipsel    |      perl-net-ssleay-1.85      | NOK | http://autobuild.buildroot.net/results/96b3237d3238841fdbc42866d3fd822207edbcc3 |     
    arm      |           php-8.1.8            | NOK | http://autobuild.buildroot.net/results/9790ee4b740cd547b586ea90276c1018fb5bd6c7 |     
    sh4      |           php-8.1.8            | NOK | http://autobuild.buildroot.net/results/9d3d40e9c30b3064b560df0390794213ef053a4e |     
    sh4a     |           php-8.1.8            | NOK | http://autobuild.buildroot.net/results/b4539a440850afe6fa4905fef14a5e14d422c002 |     
   sh4aeb    |           php-8.1.8            | NOK | http://autobuild.buildroot.net/results/bab83aaec7aa03821ebe2fb586328aec161afd78 |     
  powerpc    |           pimd-2.3.2           | NOK | http://autobuild.buildroot.net/results/4833e7d937827a715fba18a4b7085c1532debcc0 |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/7712ac9bd432f2b76aeb8ba9364c91a9f3809e82 |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/bb532bb68adc0f48e7bca1c8fdd6589b11ac5e69 |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/2d7fc89309488b9a8055601341a4a5459e64deac |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/1c615d8cfe046f2b9f0b9af31dfb06fa3fd49046 |     
  riscv32    |           pppd-2.4.9           | NOK | http://autobuild.buildroot.net/results/db40afe890a8be441c3b42b552c81135a810b33a | ORPH
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/201b0e6c9a23c1e867b7ab844845fec759b1d404 |     
    m68k     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/b5b1c4876dc3c152484be0d16e97b2bc61cf6b83 |     
    sh4      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/08e52ba166efafad22f6bf347ab7b5720ea66ef3 |     
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/a334d457ac352fe4311be2e77753059a386bb862 |     
   nios2     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/87e3392fcebe788a82c7d561bbb3f7b0b35aa3ef |     
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/6ace94c2e096e9d586e2874bbd09a76cb3ec15ae |     
  aarch64    |      proxychains-ng-4.16       | NOK | http://autobuild.buildroot.net/results/c166fc04a173cdd9b1bb1a91c2147a23abc808ee | ORPH
microblazeel | qt5xmlpatterns-189e28d0aff1... | NOK | http://autobuild.buildroot.net/results/7d1aa83a7938230d7236e67502aa4544d24fb393 |     
   mipsel    |           refpolicy            | NOK | http://autobuild.buildroot.net/results/140010039f225cb091ad7201620f2c9afa7e83f3 |     
    arc      |           refpolicy            | NOK | http://autobuild.buildroot.net/results/89d9ed1eb88cfe01b8ae70e4c0cfab88d0d72c0b |     
  sparc64    |           refpolicy            | NOK | http://autobuild.buildroot.net/results/afbfdf20854123823a53604d20dfbadfdf143c36 |     
    arm      | rpi-userland-14b90ff9d9f031... | NOK | http://autobuild.buildroot.net/results/c33cc86ad7f0581b9a8b333590019bbda8edc30c |     
  sparc64    | rtl8723bu-19b4bdc05483a1e79... | NOK | http://autobuild.buildroot.net/results/ec6fd9d50718e6fdadde39e941daa350946d83f4 | ORPH
    or1k     | rtl8723bu-19b4bdc05483a1e79... | NOK | http://autobuild.buildroot.net/results/d1022b8459ece14db3c47094ceab9bf61d7d2add | ORPH
   sparc     | rtl8723ds-76146e85847beb242... | NOK | http://autobuild.buildroot.net/results/224e8d73488ae5f4b385e6dc216672fa60b0f09d |     
    i586     | rtl8723ds-76146e85847beb242... | NOK | http://autobuild.buildroot.net/results/926aaf728d1a6e53b066945a7c731f7ce41ad28f |     
    m68k     |         sg3_utils-1.47         | NOK | http://autobuild.buildroot.net/results/9405ca864d5cbd8bc74e53b3f41f6d2083f378d5 |     
  riscv32    |    shadowsocks-libev-3.3.5     | NOK | http://autobuild.buildroot.net/results/e39ec0998d7827716896198ea7b9207974bb17ad |     
   sparc     |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/aa6e68b32a24105f32eae8a2f14993519fd6a3fe | ORPH
    sh4a     |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/107785be333a8647ba44d93f744bdd1f501d4b36 | ORPH
    arm      |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/4dab3e736508a08553993935d1a059591580c18d | ORPH
   mips64    |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/f195f82871536c1d7d533ee5bfdc94cf983e4295 | ORPH
   s390x     |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/f1c8fc93849db66e654253ad6e612027b2bfcaa7 | ORPH
    m68k     |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/bc6948a445e004ccda61db0489a5bf0c75320a96 | ORPH
 powerpc64   |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/02dff38151999b0e607036c63f2bfb3096e68f7a | ORPH
   armeb     |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/9ee2fcce540ce94ee1ffc0020f22c0dfefe6e804 | ORPH
    arc      |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/417e3c8456d4a261e44f8bf99ba4116e667b1ea8 | ORPH
   nios2     |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/6bac9529e6e776e6dcc595ba4eb20c43ff234944 | ORPH
 aarch64_be  |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/cb37c972211c459248d07ed6981f714f31d58eee | ORPH
   nios2     |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/79ac4b70c0bdac748a478cebecb4d0449cda2804 | ORPH
microblazeel |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/ca9ea8e82f0ed8f452b3c62d0adf22b9e3ed7ac9 | ORPH
   nios2     |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/8bac88dce31371d088ee0da6e3e0c784fd51ef9c | ORPH
    arc      |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/e65983064f7f3eb29949c9796eba9994621146cb | ORPH
   sparc     |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/16b9d60a042fe1b72144dd72108c0752c86e818e | ORPH
   x86_64    |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/8184cc657cdcba81b63c0b1cca9a3e864d8da0dd | ORPH
    mips     |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/2f8b6a449ce1007562b88ee8b0a5dd177f6e447b | ORPH
    or1k     |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/82249d1e5ed5c4522f1162c5146c78c510100bc3 | ORPH
    m68k     |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/4b70549a31010b74cc36edd91f0e60b2da4bf5aa | ORPH
   mips64    |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/17fc96e2cc9ac5b810cb067cdd00bea1a923d883 | ORPH
   sparc     |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/9fded4d723c81599c75e2aeab50c2ceb626837c7 | ORPH
  aarch64    |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/cd49104b4b1f8faa3b0c62bbc5d86b433f9c31c4 | ORPH
   mips64    |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/d279618ed485ecaf875d7cd039bfabb266668a5d |     
   xtensa    |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/f0c4e47dcd26dcf949df3c70701ce5784a84b6e5 |     
    arm      |          tor-0.4.7.8           | NOK | http://autobuild.buildroot.net/results/196d2c0554f1eaa42586ee867c91415de5ef3eed |     
  sparc64    |          tor-0.4.7.8           | NOK | http://autobuild.buildroot.net/results/cfcba16018bef1128c32ce889b0eb72b9fc09a5f |     
    arm      |          tor-0.4.7.8           | NOK | http://autobuild.buildroot.net/results/8634a59f19da37a473c4ae5b0e041a26f8e70bb8 |     
   xtensa    |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/d62dff37735b460cc1a268f5c7ca847e1bd26f8a |     
  powerpc    |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/87c0abce374689eae7358a509226ff08f5f80ecd |     
microblazeel |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/1291d1cf6bbdc8f8d441c5457befa7568b4ed93d |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/b570ccb08afcfeb9351611ad9b1c2c2485141b8c |     
    arc      |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/1b158077f7e853fb7a44a70307de57fd0c407782 |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/2162d98b36451ba68b468b7405c979444fdcbfd8 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/c934ee69d11bf8873e79ecf350aee4a8fce8520c |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/188db4b093b8bbedce05ddfd00d8d66c9e2890f8 |     
  sparc64    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/64feb07c25f4f5d1efc80383d785db18172b3af9 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/e328a1bcc0a4f9849d94e8cf71d574f7e7dd29e7 |     
   s390x     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/b1d4ae1de0042a9cb91122534a2be0153e2944f9 |     
   mipsel    |        xfsprogs-5.14.2         | NOK | http://autobuild.buildroot.net/results/407131b767fc8241e8f5f5001c0b5d4e2c488dea | ORPH
  aarch64    |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/433b34f1001dc563dacce449a59bf76d4024e9fa |     
powerpc64le  |         zerofree-1.1.1         | NOK | http://autobuild.buildroot.net/results/c91065879c9c2b1bd6fa4563f6f78f8449f629f5 |     
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/178197cd3326cee230c091a605f08d5bcada0334 | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/5b9b7e7cfd47d3f8f8c5fe2413ed5aa8eab82e42 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/209181444ddcb9d9be18d68edc45524509a66c62 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/2983025815c15f38babe4bdcb913727ba0a7a79c | ORPH


Classification of failures by reason for 2022.02.x
--------------------------------------------------

                 uclibc-1.0.41 | 3 
           libfreeimage-3.18.0 | 2 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/569b3382eb9aaef1228f769df70cc867ce8c488b |     
   s390x     |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/aad3eb7478e74b42b52e47effc26e04f3c676e91 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/4eb0f6262702d54fb6a531b85092a1c08819c186 |     
    arc      |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/a3090b6cef02a97c320467555f531462b0db0fe6 |     
    arm      |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/d71216edabe01cbe062471a4764d474988870bd5 |     


Classification of failures by reason for 2022.05.x
--------------------------------------------------

                 uclibc-1.0.41 | 3 
              swupdate-2022.05 | 2 
                       unknown | 2 
              alsa-lib-1.2.6.1 | 1 
                    bat-0.19.0 | 1 
              host-rust-1.60.0 | 1 
              libgcrypt-1.10.1 | 1 
                   libnss-3.78 | 1 
                 linux-5.17.13 | 1 
                nodejs-16.15.0 | 1 
               openpgm-5-3-128 | 1 
                    pppd-2.4.9 | 1 
               protobuf-3.20.1 | 1 
            quickjs-2021-03-27 | 1 
                     refpolicy | 1 
                   uacme-1.7.1 | 1 
               valgrind-3.19.0 | 1 
                       xenomai | 1 
               zziplib-0.13.72 | 1 


Detail of failures for 2022.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |        alsa-lib-1.2.6.1        | NOK | http://autobuild.buildroot.net/results/c6f6703a6580ab238b1aedf116cadb9ab2b8077b |     
   x86_64    |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/4f1b9433631cab62c8afb3dca3f2f6b4c834a4f4 |     
    arm      |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/89cb69d3202dd60d021fa1e8f928fb2d8c723398 |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/64da1f6f912c9acc427a8fed09c49e3be893a0ec | ORPH
    i586     |          libnss-3.78           | NOK | http://autobuild.buildroot.net/results/fa6efe3ff2b2b1cad1148309aed698204b90087c |     
    i686     |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/5a55da23867e03ac784d7aafd5a45b41daea0b82 | ORPH
    arm      |         nodejs-16.15.0         | NOK | http://autobuild.buildroot.net/results/695cf4983c2810a5de2907909205d164f8a1b9e1 |     
   s390x     |        openpgm-5-3-128         | NOK | http://autobuild.buildroot.net/results/4a54c74b907986971db21893eb3475a10007bf54 |     
 microblaze  |           pppd-2.4.9           | NOK | http://autobuild.buildroot.net/results/cdb8bd78453a55c84f63a50cf8d3dcd60492cae9 | ORPH
    m68k     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/e0ea44e4f12aeda040e976be4fa8b8584987430a |     
 microblaze  |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/6f7e161e4a3f10d938801b9fb27245f25ff5dbd7 |     
microblazeel |           refpolicy            | NOK | http://autobuild.buildroot.net/results/3207e4a0881f3eb948b7f6c4a42a5e2eb6f311f3 |     
    sh4      |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/aad51d9b6e4d2e24d0df1c6af2b965ad9860ffb6 |     
    arm      |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/0249caa806ea1641662be57ecb0fb92976d655df |     
    or1k     |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/650009f1c774bb8378cc5d69be3052a9272a5437 |     
  riscv64    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/114780253804a82f13df6a85d25d258706a485d7 |     
  riscv64    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/a0cd60962f91567012db6b0313d8a1c6630beca6 |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/f58a93553c6d6bd2b1f7db469a2ce9d93e858929 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/f3feee762437f631968a32f02219af05d356d3e3 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/769418866524c5cfafc70fb829d68c3d29b2fa8d |     
  mips64el   |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/9d6d8366f5294152aa0ca772309c9fb881fae5cb | ORPH
    m68k     |            xenomai             | NOK | http://autobuild.buildroot.net/results/e52800f67cc735d57a7af31b6d59815c56aeb283 |     
   xtensa    |        zziplib-0.13.72         | NOK | http://autobuild.buildroot.net/results/63e5a8d9c312207d6d744f244f6998ca6fc3cae6 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
