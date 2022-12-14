Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06D51C4332F
	for <buildroot@archiver.kernel.org>; Wed, 14 Dec 2022 06:41:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 507E0417CC;
	Wed, 14 Dec 2022 06:41:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 507E0417CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DyoWWkJEIoGh; Wed, 14 Dec 2022 06:41:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6784417D7;
	Wed, 14 Dec 2022 06:41:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E6784417D7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 93D121BF852
 for <buildroot@lists.busybox.net>; Wed, 14 Dec 2022 06:41:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 70007417D7
 for <buildroot@lists.busybox.net>; Wed, 14 Dec 2022 06:41:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70007417D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fNBkMtbSIw18 for <buildroot@lists.busybox.net>;
 Wed, 14 Dec 2022 06:41:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B056B417CC
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B056B417CC
 for <buildroot@buildroot.org>; Wed, 14 Dec 2022 06:41:47 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4D2DE40009
 for <buildroot@buildroot.org>; Wed, 14 Dec 2022 06:41:44 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Wed, 14 Dec 2022 06:41:44 -0000
Message-Id: <20221214064151.70007417D7@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1671000104; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=8SwcA3d1doCYGm5m7P7wLeLIumW9JPEtBHnazOman48=;
 b=IfXD/hxT7Wn8RNJ6DdjL9gXNBYSUuHb7q/etmSra4FbkMpLLCyJBLDogd8OSYr2oyttW5r
 bct6DChMgSdj5LnRTOgpea6ACwUutiyiGwqIhruaStIpYtkLdNPVe9BN8RSyO1qaW5vz+I
 RxARV1AIZgwEya5ZcqIlZAiID9RL5alS5fjl7it+Q2AvwfHHGteQth+8i90S5Sf7GsjNy0
 vEm3Lno51vIGge3QaIogFYeoarUnjSw+17CbPWCcRjVyEbjmt34nJEsOQrKs8tuV5Z+jJK
 5LYMtzV4M1ukpsmBj+kGshvqz5ikPq9GIcr8MGbIreR8/Ix53v3IZc1XyhbAkw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=IfXD/hxT
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-12-13
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

Autobuild statistics for 2022-12-13
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  8  |  3  |  0  | 11  |
  2022.08.x  | 13  | 26  |  0  | 39  |
    master   | 220 | 267 |  1  | 488 |

Classification of failures by reason for master
-----------------------------------------------

                   aubio-0.4.9 | 29
                  jack2-1.9.21 | 11
                      xz-5.2.7 | 10
              host-rust-1.65.0 | 8 
                       unknown | 8 
                  davfs2-1.7.0 | 7 
            host-binutils-2.38 | 7 
                host-go-1.19.4 | 7 
                    norm-1.5.8 | 7 
  gobject-introspection-1.72.0 | 6 
              host-pahole-1.24 | 6 
             libgpg-error-1.45 | 6 
            python-bunch-1.0.1 | 6 
                gerbera-1.10.0 | 5 
                    crun-1.7.2 | 4 
             fontconfig-2.13.1 | 4 
glibc-2.36-66-ga1dc0be03c9d... | 4 
            host-binutils-2.37 | 4 
                  linux-6.0.12 | 4 
                  sscep-0.10.0 | 4 
                     frr-8.3.1 | 3 
host-spirv-llvm-translator-... | 3 
           python-numpy-1.23.5 | 3 
/home/buildroot/autobuild/i... | 2 
                    dust-0.8.1 | 2 
               fftw-quad-3.3.8 | 2 
              gr-osmosdr-0.2.3 | 2 
      libabseil-cpp-20220623.1 | 2 
              libgcrypt-1.10.1 | 2 
               libglib2-2.72.3 | 2 
          linux-5.10.145-cip17 | 2 
      linux-5.10.145-cip17-rt7 | 2 
                   linux-tools | 2 
             lirc-tools-0.10.2 | 2 
                 nerdctl-1.0.0 | 2 
            ocf-linux-20171122 | 2 
           optee-client-3.19.0 | 2 
package/libmbim/libmbim.mk:... | 2 
                   perl-5.34.1 | 2 
    python-cryptography-38.0.4 | 2 
         python-greenlet-2.0.1 | 2 
                 uclibc-1.0.42 | 2 
               valgrind-3.19.0 | 2 
       vuejs-router-legal-info | 2 
                 wolfssl-5.5.3 | 2 
/home/buildroot/autobuild/i... | 1 
afboot-stm32-3566acd582e553... | 1 
                alsa-lib-1.2.8 | 1 
                    bat-0.19.0 | 1 
             batman-adv-2022.3 | 1 
                   bullet-3.21 | 1 
                  cairo-1.16.0 | 1 
                  check-0.15.2 | 1 
                cryptopp-8.6.0 | 1 
                 dc3dd-7.2.641 | 1 
                 dmalloc-5.6.5 | 1 
              dropbear-2022.83 | 1 
                elfutils-0.186 | 1 
                  ffmpeg-4.4.3 | 1 
                    flac-1.4.2 | 1 
                   flann-1.9.2 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
                 fwts-22.09.00 | 1 
         gobject-introspection | 1 
google-breakpad-c85eb4a59b6... | 1 
                 hddtemp-0.4.3 | 1 
            host-binutils-2.39 | 1 
host-gdb-arc-2020.09-releas... | 1 
    host-python-greenlet-2.0.1 | 1 
         host-sentry-cli-2.8.0 | 1 
              hyperfine-1.14.0 | 1 
               libcap-ng-0.8.3 | 1 
               libdeflate-1.12 | 1 
                libdnet-1.16.1 | 1 
                libdrm-2.4.114 | 1 
                libglvnd-1.4.0 | 1 
                libkcapi-1.4.0 | 1 
        liblog4c-localtime-1.0 | 1 
               libyang-2.0.194 | 1 
                  libzip-1.9.2 | 1 
            linux-fusion-9.0.3 | 1 
        lttng-babeltrace-1.5.7 | 1 
          lttng-modules-2.13.7 | 1 
         mxs-bootlets-10.12.01 | 1 
                  ndisc6-1.0.6 | 1 
             netsniff-ng-0.6.8 | 1 
                  ntp-4.2.8p15 | 1 
                  ntpsec-1_2_1 | 1 
              open62541-v1.3.3 | 1 
                 openal-1.22.0 | 1 
                 openssh-9.1p1 | 1 
               pcsc-lite-1.9.9 | 1 
                    php-8.1.12 | 1 
                     pv-1.6.20 | 1 
           python-bcrypt-4.0.1 | 1 
           python-pyicu-2.10.2 | 1 
            python-rtoml-0.8.0 | 1 
                    qemu-7.1.0 | 1 
rtl8192eu-94bce7798bbb18de6... | 1 
        s6-linux-utils-2.6.0.0 | 1 
              sigrok-cli-0.7.2 | 1 
                 sudo-1.9.11p2 | 1 
ti-sgx-km-cf7f48cb30abfd5df... | 1 
toolchain-external-codescap... | 1 
              traceroute-2.1.0 | 1 
ulog-0389d243352255f6182326... | 1 
                 wavemon-0.9.4 | 1 
wireguard-linux-compat-1.0.... | 1 
                  xvisor-0.3.1 | 1 
                  zabbix-5.4.9 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/98412184e3fedd23ede5861d740cb38948969b82 |     
powerpc64le  | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/d791090b38632ff1ed59a821de663686393337f5 |     
  riscv64    | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/efe340ac0a03a97ff51d47ce5e2b8277f2cfd816 |     
    arm      | afboot-stm32-3566acd582e553... | NOK | http://autobuild.buildroot.net/results/cb5b8d27a4d5d027b95287186a8b29f2aef0dc5f |     
    or1k     |         alsa-lib-1.2.8         | NOK | http://autobuild.buildroot.net/results/ee3201a4fe7d431165d131baf803313b9f62345b |     
  aarch64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/708f565d6c4202425e591432516afddf4d56f3da |     
    or1k     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/04286349ed933b76033331270c30c0b6f5577e2b |     
    arm      |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/c1ecc9fd736e5ea8f7060978cf49035b816490a2 |     
  sparc64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/aaa020d4b5c9c1d82238bd58603b1b05064be8f3 |     
   mips64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/74066964fb948d8992701151845c84f926193692 |     
    or1k     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/719494420074e25f3705f6071ccf2f8c00df761d |     
    m68k     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/1696ef532c2eb08ca9ae7d62d1d4ca617042f8a8 |     
   nios2     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/c6caa9b344356b8365aa463db7a2b49f8779a057 |     
   armeb     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/e47846f319a9f5b550f04cf40fd046e6ce0fa782 |     
  aarch64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/6c114c9d0487ddc785ebfe25a3c9c1c54ed81bca |     
    i686     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/0c26342b03b5e40d4de41d6e619ed2be0eefc64d |     
   sh4eb     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/0964f12ee0afd6cead063db3c27a8b9d6e8b0c22 |     
    mips     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/b8c638366687c101984cf863bec0fa4791a2e591 |     
   arceb     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/4c05e95eb5045593880856646d6523ebff44cc37 |     
    i686     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/69dd39b4b1eacc5ede34efe613a6223fd41c6885 |     
  aarch64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/d90c31ff71e017247b2e5c575834d60caf67e366 |     
 powerpc64   |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/e80115d2dd14c77ac75854ad9c0a6260d0d0901a |     
   sh4aeb    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/272f37a56dd91e7d39cc6088d2b0ca6060eea651 |     
  sparc64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/81d44d2a39c30f88d97e31f9d51fb5c2529dbca2 |     
   x86_64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/4abb6879e22972707f5e8b0efe4847dbb278d51f |     
   nios2     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/a027bcdd06aeed401355954466e8637309ba4847 |     
   armeb     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/bb99f129c8385dde736ffb1ffd89ee54aa040203 |     
   xtensa    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/9719825efab9e4f3c27a4b4cef4027a1ec8964de |     
   mips64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/63cb8715411b9d0026f0343b1e9844788b3028c8 |     
   sh4eb     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/8f9a340ed24972e26a6add345073f4ef2b47e0c3 |     
    sh4      |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/c27e3d92fbfb0fe86dc473f664b0952f0828677a |     
  sparc64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/9838376cae13a6da034777b7426b8a4e736a50d5 |     
 aarch64_be  |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/7fb02258680c6da14b152e7fcfac25c4cd84d2c4 |     
 powerpc64   |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/718a94c18beaed6f974c38afdafb2391eef49e7c |     
powerpc64le  |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/6b16efb99e8c62bf8adbee3c9c767d039412f462 |     
  mips64el   |       batman-adv-2022.3        | NOK | http://autobuild.buildroot.net/results/1c400790ab4259aeabfcb7e0a36b9291c50158af |     
  powerpc    |          bullet-3.21           | NOK | http://autobuild.buildroot.net/results/b6ccd7bde90a1926bac5855419196b869d5981f2 |     
  aarch64    |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/5be8844ca6f6019aa82f6a2b5dea47ddbd99a5c7 |     
 powerpc64   |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/df047695d9ff8b774f65b8ee23ac14ed345df4cf | ORPH
  riscv64    |           crun-1.7.2           | NOK | http://autobuild.buildroot.net/results/e2f3ae4fe5b1a14b42a541f0141811b1f20d7662 |     
  riscv64    |           crun-1.7.2           | NOK | http://autobuild.buildroot.net/results/b4d3905b1c615fd609445a17f19338e78b342676 |     
   sparc     |           crun-1.7.2           | NOK | http://autobuild.buildroot.net/results/7c38e23d1b23ab045c6f4fad255779f57e60b016 |     
    m68k     |           crun-1.7.2           | NOK | http://autobuild.buildroot.net/results/189cfcc8ac571ca1d13db6fe36a2e5bf581255ae |     
   armeb     |         cryptopp-8.6.0         | NOK | http://autobuild.buildroot.net/results/90b77baf512891138bc761982e78c35d49c30b9c |     
   sparc     |          davfs2-1.7.0          | NOK | http://autobuild.buildroot.net/results/6b41a8c35f843cea3abbf9cad25f6c88087959d8 | ORPH
    arc      |          davfs2-1.7.0          | NOK | http://autobuild.buildroot.net/results/3e1f16f1a4161a4d4c4faf39487bd1f858bce920 | ORPH
    m68k     |          davfs2-1.7.0          | NOK | http://autobuild.buildroot.net/results/3a9da771392d67a9662e231b4fc59ee028ffd80a | ORPH
   arceb     |          davfs2-1.7.0          | NOK | http://autobuild.buildroot.net/results/52b71a3ce39ebc95e8c943aee295dcd97a3e71ac | ORPH
   xtensa    |          davfs2-1.7.0          | NOK | http://autobuild.buildroot.net/results/46dd3b5fed47f594f64267d5fb3fbaff98d73b00 | ORPH
    arc      |          davfs2-1.7.0          | NOK | http://autobuild.buildroot.net/results/5313f3f3dd60307d6d01030f67cfc4e1c0af73e5 | ORPH
   sparc     |          davfs2-1.7.0          | NOK | http://autobuild.buildroot.net/results/c13225e5c524ce937fd7c11a354cf304c36869e5 | ORPH
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/b707af91a9d467e92983a2206f42ed23646f4951 | ORPH
  powerpc    |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/bbe664fb4aed5625e70dc49ec0c2cff78fb4eab0 | ORPH
    or1k     |        dropbear-2022.83        | NOK | http://autobuild.buildroot.net/results/00359e8692c6be97e4324f217e2926e17aa077cd |     
  sparc64    |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/15447575111aab342e47186103a78935732a23ce | ORPH
 powerpc64   |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/5ff16fb2d782021be7d28380d086a32ee42b134c | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/3718c3d136a97fde693ef12799ab0aba99af6169 | ORPH
    arm      |          ffmpeg-4.4.3          | NOK | http://autobuild.buildroot.net/results/516d2d03a6f0def2478beb17595e4fc64fc90647 |     
powerpc64le  |        fftw-quad-3.3.8         | NOK | http://autobuild.buildroot.net/results/f54949ff7736bb925ab79ca1a1c67257275bd84d | ORPH
powerpc64le  |        fftw-quad-3.3.8         | NOK | http://autobuild.buildroot.net/results/0658e51e2477c5f8df0bfa19957bc1e628273fbe | ORPH
    sh4a     |           flac-1.4.2           | NOK | http://autobuild.buildroot.net/results/df05e8979b03dc92910c7757e5c2212b1a416d63 |     
    arm      |          flann-1.9.2           | NOK | http://autobuild.buildroot.net/results/c20efb376194509506d7f400ea94e06198e0a8fc |     
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/58d9b0c3b72e3f90a53e367b734ae8d842976699 | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/c5e1807ce75e0331be022f0667102cbc888e3f2b | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/c4e7ccc1579d294876311550797cfdeda5ed6287 | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/2b3d5618d146f1b8713e4680e8694c7496d1c256 | ORPH
   arceb     |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/b3dc5479babe11e2c72ca1ffb206c77d5825d098 |     
  mips64el   |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/3f022ce3f9a1834e790310e2cea6bb61a80cc5a7 |     
  mips64el   |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/e933338ca51fe20702994ee8324c10674ed2848e |     
  sparc64    | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/1e148978ba80045977e090f6c27cba502c2a5fd5 |     
    arm      | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/515d7e4c32919fbe22f67d804794f54741c18b62 |     
   mips64    | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/860320dcac77f8d90b0bc5ed96990a24a0a1e6e3 |     
   mips64    | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/9e34eacc910da4ae924c269a056cbf3097ad3ec6 |     
    i686     |         fwts-22.09.00          | NOK | http://autobuild.buildroot.net/results/44d3f6237d350d8e36dffaff25f33b7ae4fe2162 |     
  aarch64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/f04d7e8aa8d53aa9aab2bb84239b56be97d52ab1 |     
    i686     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/be0dcb5e53e299f8327ffebcf3a82bdd663f04ae |     
   mipsel    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/e5f9a4e15aa59bdcd54c70fe0d3b4a2c461af0aa |     
   mipsel    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/e7abdddb92b181db14a822ffa8ac6600d896825c |     
 powerpc64   |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/93ab3a221fdc05870bc72ead7174de3062520eb4 |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/fd19c98595af2c6ea275d936343869dbcf691a9d |     
   arceb     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/f26f1a100e03750d6dd9385df71b26c3bd13a3f7 |     
    arc      | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/07743458ef2ef99928d9b4f0eff325aba416e641 |     
   arceb     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/907a884de48d4e18fc38970cecd6a728fd66811d |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/87ff8bbf642780c38eead4b439fd592c4574e3d8 |     
 powerpc64   |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/8b8a13d7e4d63ebd609c73e485190c8939a7752c | ORPH
powerpc64le  |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/c94d57daa52746d28fd02bddcfbd2248c241fbbe | ORPH
    mips     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/6228f81f91cbb6477b261769b609959e8eca8213 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/39147040c002e734961326264268d4ccf4833dad | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/0eba2ab4e097ea0a322687ac00ff1b0e9b19fbac | ORPH
   nios2     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/1a637e82c1ac1038e0ab7f94ed55663f4198ed75 | ORPH
    arm      | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/362f34d66ac5c6826ffe41020a434def82ba2d2f |     
  aarch64    |        gr-osmosdr-0.2.3        | NOK | http://autobuild.buildroot.net/results/4ebbcb9e4cee16efe37327084c6b171cedc3540c |     
   mipsel    |        gr-osmosdr-0.2.3        | NOK | http://autobuild.buildroot.net/results/656a650acaf76a23f51a776058c46deb9e244d48 |     
   arceb     |         hddtemp-0.4.3          | NOK | http://autobuild.buildroot.net/results/52428940034d59887e0172fbd8481943d86db13b |     
    m68k     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/801b099104fcdc8870b4e4ca46c152b45543def8 |     
  powerpc    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/a424803596dc9af21c0a3ec193201919e71a7532 |     
  aarch64    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/ca8abdab6bf8888cf0383fceae7425e6ba77bf37 |     
   nios2     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/4760c80aa3d25aeb6c037649cccc1250ff76d060 |     
microblazeel |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/0751e742341747e83701a1378a694f962e6052df |     
   armeb     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/591501e87594627de18cfcdc31ff55274076a8f5 |     
  powerpc    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/298938864a70b8c1c3b2d0864d8985835b3aa208 |     
  riscv64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/8c7738065a8629812f3267fdf4645a2db8904042 |     
   mips64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/efe512efc2caff3a3c1c708a046a7f79d14becc0 |     
  aarch64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/816e19a552124d9e2d923959e5775774d43f0458 |     
  powerpc    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/6b6af89fc9bdd90fa7a8f92af7e40aa3714a0a83 |     
   mips64    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/5796c48a93d048aa23817cd3eab699e8b97360c2 |     
   arceb     | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/610beb30b9ed1a0345d96cd7ee98a5549449b648 | ORPH
   mips64    |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/ff6f223dcc034b671ee71e9a3744f7fe55b2c535 |     
    i686     |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/8b0b709f9bb08ca4041640946f63ee3887ef2c96 |     
    i686     |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/6f71b0aa4fd41afd1419b63b0de516517c450534 |     
    i686     |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/805596fa122d34d4dad52bab2aa309dd91aba2ff |     
   mips64    |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/2b4edd8dc00281ffa422b373584524d9bd47ae77 |     
  mips64el   |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/4e76056175dca42c751ad21ddd5e08d054ad1474 |     
    i586     |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/d1687fc11ccfbc0572e979ef8c88ecdd2e6d828f |     
    m68k     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/5cb760538bb0e6ea8573229c0984b460fb1abcf8 |     
   mipsel    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/243df7d75adcf64553237c63ba6f67a41d77c4d7 |     
    or1k     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/4a13d7555c4d10c36e941acb86041271055acacb |     
  mips64el   |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/d56515001c807f4dffb699fce3a957f01c7f4bd6 |     
 powerpc64   |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/7d3187c501c3a0fa410388b1350c8c1c776d65de |     
  sparc64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/9b174ff868dc0acde84e443f64572d60f66c8eb4 |     
   nios2     |   host-python-greenlet-2.0.1   | NOK | http://autobuild.buildroot.net/results/e7ca25bd3ae3e86141a4461732ae2fa40d171009 |     
  sparc64    |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/46df6fd16048652c92e925c37106006284ff8dc7 |     
    mips     |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/48399946711a5e88740a1d716d7bf4d3543afe4e |     
  aarch64    |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/2eedff7d5a2fced1e2ab7c2216b044af1887ffe4 |     
  sparc64    |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/4273e4ab84503646c892949e5f63cdbefc0975eb |     
   x86_64    |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/f3617968f32527f76890d64674b3f3a3565b8d5f |     
    mips     |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/12549599b10b2e024b8b36003bf21dcb581178e2 |     
   x86_64    |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/556e7456a7fc73028e88d7cdf4b7048d39f596ed |     
   armeb     |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/4167028149d689f3e9ba96301e353e30329b7753 |     
 powerpc64   |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/5a540420e65a10b0948621181334f8ce1fe2323d |     
  aarch64    | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/f0c2cb3fc7ca71b72ef9c1fe3fe434bb68faf77c | ORPH
    arm      | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/e2771888f222a3bb4c9920cd9dfccc659ad10a1d | ORPH
   x86_64    | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/7f9b92a8792622f2046bba383f9eff22c229fd7c | ORPH
   mipsel    |        hyperfine-1.14.0        | NOK | http://autobuild.buildroot.net/results/70463babeca4ec857985ef208fd7349f199e9ba5 | ORPH
microblazeel |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/9deda4edc88921fdeffb4b8ff5fa64917298dd86 |     
  mips64el   |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/01c4a912cd48a1a308a6715fef2a2bcd74d0f863 |     
    m68k     |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/5b319546ac9daee0f01323f51aa9257eeed0c6d4 |     
  powerpc    |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/0fdf8fc8ca2ac95f4a178688d73704bdab491e05 |     
   xtensa    |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/ebd097cab20eea37dc07b0373fbe82cc88b84dc5 |     
 aarch64_be  |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/097635c06107d88fa2af6396dea57f7c2c8cd222 |     
microblazeel |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/837a031bc689c247df95da348445c1cd4771afba |     
 aarch64_be  |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/19177ec984ac13c5a12fb3ac78544e15b99c63a2 |     
powerpc64le  |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/15051cce05ae036d5b629b4d9a432fb6aecd7e8c |     
microblazeel |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/236cc06542b1424f0406eea7072ddeec69db27b0 |     
   nios2     |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/db08f5b8d91a658cf4103537119297aed0be6fbb |     
   mips64    |    libabseil-cpp-20220623.1    | NOK | http://autobuild.buildroot.net/results/d9c6ab5683ea054a06e8be8a7b4bca3b55597cdb |     
   mips64    |    libabseil-cpp-20220623.1    | NOK | http://autobuild.buildroot.net/results/066b3f2a39348a893c1d5e61a0bbba112f261e90 |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/dd6b72124a3d7747ebd2c80b92d68ccc3e051471 |     
  aarch64    |        libdeflate-1.12         | NOK | http://autobuild.buildroot.net/results/951d5a1a2959a0cc65ca7e52967ec07bc1cc00f1 |     
    i686     |         libdnet-1.16.1         | NOK | http://autobuild.buildroot.net/results/2479d3440863cf733d4f008d74f4241ab22d03f9 | ORPH
    arm      |         libdrm-2.4.114         | NOK | http://autobuild.buildroot.net/results/8b0b89100aeff554127387c78972ed3e1616c2c9 |     
   armeb     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/073384287fc6af3e9cc92e83b875dd266c34cc4e | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/1ecb088cdc6a01a53c77e48be2f594c5fd3c33e6 | ORPH
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/3048fb7e3bb1bd9d11fe834817c0f84785f3f866 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/9cbf10e8d10fb6a8d5314fe3d8c3029ed09daeb0 |     
   arceb     |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/0aa27234e3f2edc827b2f3e2a4fb096586b7d36c | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/29b4c89d905d83145c899ce0cc11b8048b428ac1 | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/c1503fbf1364483f00606650933ccbd9d4f7feb1 | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/f0529eafb85329fad037300d32c658e011875a87 | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/f0ca67f6178fd52f54964349064d406140529bce | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/e4914bd30f85bb59501e71e8e8088998bd0ddf17 | ORPH
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/a8e30c837553dec457dace34dfe924810a1df072 | ORPH
 microblaze  |         libkcapi-1.4.0         | NOK | http://autobuild.buildroot.net/results/7c8583f2ff78da01fd4223e0dd24ec217c5d497c |     
  riscv64    |     liblog4c-localtime-1.0     | NOK | http://autobuild.buildroot.net/results/d4a205c627d84a64a09a7953266b6f5cd4720c22 |     
    or1k     |        libyang-2.0.194         | NOK | http://autobuild.buildroot.net/results/2d807f7d6290908849d5c9c0db031da9b26b62d0 |     
    arc      |          libzip-1.9.2          | NOK | http://autobuild.buildroot.net/results/e14126eae7a8749faab807b87caf78627976bf1c |     
   mips64    |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/6b2bb9196e9c5a5e0c7d2413dc125493c42a2d6c | ORPH
  powerpc    |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/c18828fba701d1c6a5adaec1f6fc1bbe97b8fe69 | ORPH
   mipsel    |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/b6873caaf08d61e178faa8420560f0ce127373e2 | ORPH
 powerpc64   |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/d1d31d606a5f65ef301e85389ae613367cf61035 | ORPH
   x86_64    |          linux-6.0.12          | NOK | http://autobuild.buildroot.net/results/13537b6cbc101248e58d82bc1fff995ee53dff67 | ORPH
   mipsel    |          linux-6.0.12          | NOK | http://autobuild.buildroot.net/results/f154fdfee8bacc53a4fa92f792ac7b3862087c6d | ORPH
   mips64    |          linux-6.0.12          | NOK | http://autobuild.buildroot.net/results/2afc12cc500b2754cd0396deab88d30760820fd6 | ORPH
   nios2     |          linux-6.0.12          | NOK | http://autobuild.buildroot.net/results/6372c85d6bfdd47eb5e2b0ea18e5d997c32ad60b | ORPH
 powerpc64   |       linux-fusion-9.0.3       | NOK | http://autobuild.buildroot.net/results/0a2c094124667a326a69d4c0d7b654347939bacf | ORPH
   mips64    |          linux-tools           | NOK | http://autobuild.buildroot.net/results/75960a3d0e2dae7cbdc020a7405c93ed0ac6ac7e | ORPH
   x86_64    |          linux-tools           | NOK | http://autobuild.buildroot.net/results/4e758f8101c595740bba4c4c4d79b308bf62244a | ORPH
   nios2     |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/95e1631e7382ce095cb1c6a3dec823fd3b88b7ed | ORPH
   sparc     |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/f626e7b0deb4639e6b26b1f4ea778e90410ee0e9 | ORPH
    arc      |     lttng-babeltrace-1.5.7     | NOK | http://autobuild.buildroot.net/results/cb1b598a3e6d29b17955adec0d079014f10249b2 |     
 powerpc64   |      lttng-modules-2.13.7      | NOK | http://autobuild.buildroot.net/results/6c90c4cceb0f2a13415c62f1855348d32c7aa876 |     
    arm      |     mxs-bootlets-10.12.01      | NOK | http://autobuild.buildroot.net/results/2e441b97bd940005ac5f1e1605da1e95bbe79731 | ORPH
    arm      |          ndisc6-1.0.6          | NOK | http://autobuild.buildroot.net/results/5e7c964d80ef5f78472b1cb7d072f363892d87a6 | ORPH
   x86_64    |         nerdctl-1.0.0          | NOK | http://autobuild.buildroot.net/results/8557e13d4f82e79cc0ae32223da837a7046f0f89 |     
   x86_64    |         nerdctl-1.0.0          | NOK | http://autobuild.buildroot.net/results/09ef97697acc062fb7100e165ac9e446578de60c |     
 aarch64_be  |       netsniff-ng-0.6.8        | NOK | http://autobuild.buildroot.net/results/6dfdd317c239183ee4c9e7349c761dae736db2ee |     
  aarch64    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/feff2742c7a9dd2e64be587be202d0489ff4275e | ORPH
  riscv64    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/04cfb6542c5642bfee9495017d3b45eb8be68734 | ORPH
  aarch64    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/01bc62e1a4e6222ee097ab77efd5085a19459147 | ORPH
 aarch64_be  |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/043f6e23a1b4c2798c4ecb479c4dcc94e865510d | ORPH
  mips64el   |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/0ead6bb55b7153da6e228bab6deef6234c5ebd0b | ORPH
   mipsel    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/7de72ead0299072554bd5a8f7c43afe848d6baa4 | ORPH
   sparc     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/cba355a82ce31b2dc88ac56c97e87d19f2130c5d | ORPH
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/203d7533440833b62a42daac8ae5ffe5f950ee73 | ORPH
   xtensa    |          ntpsec-1_2_1          | NOK | http://autobuild.buildroot.net/results/8537b4008139c24b230b5e3ebd970a85874a1ba9 | ORPH
microblazeel |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/0714662789ac696f8a8aa57f60dff9fcb269c781 | ORPH
   xtensa    |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/d6f9aece795ef1e9425c2faddf702b074f1d27cd | ORPH
   mips64    |        open62541-v1.3.3        | NOK | http://autobuild.buildroot.net/results/2c46c6b58cd9b00616a666d517aff155a68688b3 | ORPH
    mips     |         openal-1.22.0          | NOK | http://autobuild.buildroot.net/results/4f8bc7f602fd7acc557dc1d0863d5c36203ba06c |     
    m68k     |         openssh-9.1p1          | NOK | http://autobuild.buildroot.net/results/173c547cde5a01d8d59f840d0029c0d944326da5 | ORPH
    arc      |      optee-client-3.19.0       | NOK | http://autobuild.buildroot.net/results/b8ecbaf4cece01f98f20cba3a16fc52a57af122d |     
 aarch64_be  |      optee-client-3.19.0       | NOK | http://autobuild.buildroot.net/results/fb56ad69c89a32dfcc1f6bf10cf3e002df87f675 |     
   s390x     | package/libmbim/libmbim.mk:... | NOK | http://autobuild.buildroot.net/results/f63bb8eceb76983cf162b3be82c2fba96f1a31bc |     
 microblaze  | package/libmbim/libmbim.mk:... | NOK | http://autobuild.buildroot.net/results/f7ae1e1ae5add481867f1857236ed2edd6df947e |     
    or1k     |        pcsc-lite-1.9.9         | NOK | http://autobuild.buildroot.net/results/f349f0d03282a4ccfec94d00dac4c7b43f7cd8b4 | ORPH
   arceb     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/447faa2a3f3a686a739943c1c019bf1e08dc0a11 |     
   arceb     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/f8a23bf70bc932c0b1b671bff919564f3fcb8075 |     
 microblaze  |           php-8.1.12           | NOK | http://autobuild.buildroot.net/results/eb46a236cbd1c36e0150065f1d85de325a2927d8 |     
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/ffc4741489218d56d9b0ea81b34e70afa62d59cf | ORPH
  aarch64    |      python-bcrypt-4.0.1       | NOK | http://autobuild.buildroot.net/results/dff352108682449b3ac95127eaa1051653a1f4d8 |     
 aarch64_be  |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/04ff8f0a418ca653d8efdc0a71de4a80ca8f9c4b |     
   nios2     |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/871342c3d26fa03bbfe5538a2547c43a85b11b33 |     
   armeb     |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/493b1a6f12c5855ac2edb09be224736ce15afc86 |     
  aarch64    |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/01525ce2d938fd51d31807bc8420396b4b2253e3 |     
  aarch64    |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/961e20c529881afdf5b71fe3f83528be37b870cc |     
  aarch64    |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/02a8511b41df3dbbd2c911deea226522a7f00688 |     
   x86_64    |   python-cryptography-38.0.4   | NOK | http://autobuild.buildroot.net/results/788322276ebcc84336af91d2855ca431db0cfa7f |     
powerpc64le  |   python-cryptography-38.0.4   | NOK | http://autobuild.buildroot.net/results/a73f196b4303b1d4e4f86e478b28c2b9c9e3e18a |     
    mips     |     python-greenlet-2.0.1      | NOK | http://autobuild.buildroot.net/results/da71a21ba750b49e8d47ee15a06c1b23f953dd81 |     
   x86_64    |     python-greenlet-2.0.1      | NOK | http://autobuild.buildroot.net/results/26c58e9045f93859e9cf9f695aee92b290f9e858 |     
   mipsel    |      python-numpy-1.23.5       | NOK | http://autobuild.buildroot.net/results/74ac02ce4a38025f0c3b3b7aa42ee80ecf9aad24 |     
   x86_64    |      python-numpy-1.23.5       | NOK | http://autobuild.buildroot.net/results/54eb013578697628c54f45a75a500b9592bdde60 |     
   mipsel    |      python-numpy-1.23.5       | NOK | http://autobuild.buildroot.net/results/433d699cdac4e234d56917c38fcc413333631ee6 |     
   nios2     |      python-pyicu-2.10.2       | NOK | http://autobuild.buildroot.net/results/e230513398aec24fd816470abd06823ab3b0dca5 |     
powerpc64le  |       python-rtoml-0.8.0       | NOK | http://autobuild.buildroot.net/results/d44c960150ea69d41d72071dda71f039711cb9b5 |     
  riscv32    |           qemu-7.1.0           | NOK | http://autobuild.buildroot.net/results/2f00f9b3ff0d36486cc1debb251cef0c65eb3a28 |     
    arc      | rtl8192eu-94bce7798bbb18de6... | NOK | http://autobuild.buildroot.net/results/d0bfacdf55af0db4cc32b18daee52949a7201ee4 |     
    mips     |     s6-linux-utils-2.6.0.0     | NOK | http://autobuild.buildroot.net/results/c975bf1f7eecf2be937c45b33d63d0b10bb7807f |     
microblazeel |        sigrok-cli-0.7.2        | NOK | http://autobuild.buildroot.net/results/ac5392da8ecc7f1e3997af95416a45cdf7decbb5 |     
    arc      |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/6c64c02caa52dfd70d2713c84dfec28231bbf424 |     
    or1k     |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/a806cfa2c4cddcee72652d7a6b0e7465f523bfee |     
   armeb     |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/34bd76e8e5e7df0db31918d610a0dadf531f369d |     
   arceb     |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/844c7dd79f69ef2ea8f293bb73a2d4b7533aa97c |     
   sparc     |         sudo-1.9.11p2          | NOK | http://autobuild.buildroot.net/results/d654500735118e0ccf13a695abef93dad854c7bb | ORPH
    arm      | ti-sgx-km-cf7f48cb30abfd5df... | NOK | http://autobuild.buildroot.net/results/99474a6f6fe4496d985cd4f0bd131123619d988b |     
  mips64el   | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/0d20fd3c48e4cd4f177019ce6d6e9325cc10ee91 | ORPH
    or1k     |        traceroute-2.1.0        | NOK | http://autobuild.buildroot.net/results/9e889f4ec9b8e7fcfd16c305c1c355829e47a75b |     
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/fc038ecfe11f1a1826fb414e924f8bc7aba8115c |     
  riscv64    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/c21ace70222681206fad6ef080d261b6f92c83a3 |     
   s390x     | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/462eeb89592e5e61660751a6e9f34461c645cd60 |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.net/results/45ad6f0a3ec41122aaa88bdc9e80d94ba31bcbc8 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/69cee710bb564180be73594d353f9d0819b434aa |     
   sh4eb     |            unknown             | NOK | http://autobuild.buildroot.net/results/a2ef6d3895463c5786556b976e1b4a53d1098875 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/d229b4f30d71ca70e7585f18d0ebdea96ecdeb2c |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/3dc291f0bceb3db755327a5bc3a6af866da39ba8 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/f768504dd3e09c92b285913d0c540ef9ff14e530 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/71ee76912940f04d71eacfa202b9dec190154e47 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/52d973a75dd8dde39412fd6c2fa15317fbe46af1 |     
   mips64    |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/d1ed17895e20991379930c4581fdf74a35658b1f | ORPH
   mipsel    |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/0df666be97416fe0229f3d24aa23131b14228936 | ORPH
  mips64el   |    vuejs-router-legal-info     | NOK | http://autobuild.buildroot.net/results/ee0fd0a8b0582667527ff544592d9b1538d21a88 |     
    i686     |    vuejs-router-legal-info     | NOK | http://autobuild.buildroot.net/results/98d4d522314422d36ec7e0cfef9a46787a2f6fe8 |     
   mipsel    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/1e66299726c6d6dea5ef522a9446d8648a778e76 | ORPH
   arceb     | wireguard-linux-compat-1.0.... | NOK | http://autobuild.buildroot.net/results/e56f28794051eb80e740a1b56974111296a04084 |     
    mips     |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/ad5ed0e2caa1a21c03e2c22cda4597cfbb152103 |     
    arm      |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/45dd9e7fe56a61ffb65d98fb92d699bcc6243304 |     
  aarch64    |          xvisor-0.3.1          | NOK | http://autobuild.buildroot.net/results/01fe541940960fea30f6b7a72c591659de449f8b |     
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/0b8a570166f0720be4f9a8e434d6985157e5eb13 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/9aa248f3b327903b80b6fe133cc03a0476089f37 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/d2cb07a91a064d3d87f003012430d12ed17aaf19 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/fbf2e5f98f933e28d51d57e98ee7b7d167ab0bf4 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/de93d07a89e7c9d9cd99f290b158496ec2a15791 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/3996e99be4dec023d1fe238687565f94e5ad638e | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/90e7ec31d8a3ba7fba7a8d541b3bf4bfdfb7edaf | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/2610204a93703c856718bac56b552aeaa8a8e622 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/82757a83cced19d58973a5625c23ef7c606262ee | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/85ff38d31f8c2bd266a5864d3f3515f9ce79d9d2 | ORPH
   mipsel    |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/c7fb34083244a8064aafe2549f8789d702129670 |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

             containerd-1.5.13 | 1 
            igd2-for-linux-2.1 | 1 
qt5webchannel-fa8b07105b5e2... | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |       containerd-1.5.13        | NOK | http://autobuild.buildroot.net/results/a263dbfe59e288d6289a9543503a818acf8d1ab5 |     
    i586     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/029cbc5fd270c5bc8c8eca6ecf4ca3c8871027fa |     
    mips     | qt5webchannel-fa8b07105b5e2... | NOK | http://autobuild.buildroot.net/results/bcb72e324b2c16c125480cfef95c48c4524869a9 |     


Classification of failures by reason for 2022.08.x
--------------------------------------------------

            igd2-for-linux-2.1 | 3 
host-pahole-73383b3a39afe86... | 2 
/home/buildroot/autobuild/i... | 1 
                    brltty-6.4 | 1 
dahdi-linux-5c840cf43838e06... | 1 
                 dhcp-4.4.3-P1 | 1 
                host-go-1.18.8 | 1 
               host-runc-1.1.4 | 1 
            igh-ethercat-1.5.2 | 1 
               libdcadec-0.2.0 | 1 
              libgcrypt-1.10.1 | 1 
               libglib2-2.72.3 | 1 
           linux-5.10.115-cip7 | 1 
                 linux-5.17.15 | 1 
                mongodb-4.2.18 | 1 
                  ntp-4.2.8p15 | 1 
              open62541-v1.3.2 | 1 
   openvmtools-11.3.5-18557794 | 1 
                 pixman-0.42.2 | 1 
                tealdeer-1.5.0 | 1 
                       unknown | 1 
                 wolfssl-5.5.3 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for 2022.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/1d7c5552984591dd5bdb72ac1a94da06c558902e |     
   mipsel    |           brltty-6.4           | NOK | http://autobuild.buildroot.net/results/df1022d4aadc08f5cfdf4d3b99528ec7a7a418f0 |     
powerpc64le  | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/9e53db8041ac1df8ae9c2c72e75cd013898a32f7 |     
   sh4aeb    |         dhcp-4.4.3-P1          | NOK | http://autobuild.buildroot.net/results/ddbc3433cb2b3ff8f89a8f8932fa1e3b3563450b | ORPH
   mips64    |         host-go-1.18.8         | NOK | http://autobuild.buildroot.net/results/dffd6c98f41a62cd42f105d2ba9919ceff52e4ab |     
    i686     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/eb322ff0798a5bb4e02a1e79942dcc2344652e47 |     
 aarch64_be  | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/3bb9affbd3deab36d1ed9fb9f22bad26392ee230 |     
    arm      |        host-runc-1.1.4         | NOK | http://autobuild.buildroot.net/results/cbd8d9bed4b043e4679a4e6718a9d34fb0136fcc |     
  mips64el   |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/9ad09cd24aea9aeeac38eaa273dc1f8944fd1816 |     
microblazeel |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/d81911062e2df033eb8120119d92c30273866c75 |     
  mips64el   |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/30fa1a041d0b2206e1439f54990522095c704c4d |     
   arceb     |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/b70c8ea6cae5e57b69dc385f9c4850375f54e81a |     
    arm      |        libdcadec-0.2.0         | NOK | http://autobuild.buildroot.net/results/20b035fc67b22f82bccb098ccd96b02674f93b37 |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/be8066b5ef9a967daaac01eb2a4d66a0c8d95446 | ORPH
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/fc183f9bcbb8e2ee30cd934b10617705a47470ea |     
   mips64    |      linux-5.10.115-cip7       | NOK | http://autobuild.buildroot.net/results/a6ce3414ff5921c8be66ffda5edbf7785a69f30b | ORPH
  mips64el   |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/11da75aab1d2d92b463b5753aaf306a7db3ce6f2 | ORPH
  aarch64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/c4d0c53d1f5336309bd1a74b5077776020c0fcd9 |     
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/937299c685dd84be26a6cb0b29a4211c59897191 | ORPH
    i686     |        open62541-v1.3.2        | NOK | http://autobuild.buildroot.net/results/ba1fed3caebb506af6d6201d67d8b1c0ce1de4c2 | ORPH
    i686     |  openvmtools-11.3.5-18557794   | NOK | http://autobuild.buildroot.net/results/0f3807f92ca23896e4ea6dbab1308cea09a3199e |     
powerpc64le  |         pixman-0.42.2          | NOK | http://autobuild.buildroot.net/results/800d3c6841fa2a16a08418915423cf19b457ef92 |     
   s390x     |         tealdeer-1.5.0         | NOK | http://autobuild.buildroot.net/results/8ba24dc602d9cafef73358551cf1c39d8dcda307 |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/baf7f18c4f4101ba37b075474d1a52e71ab39f3b |     
  mips64el   |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/bf298bfda09930273de0366fda0dc5d87cb91a66 |     
 aarch64_be  |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/1c229ec11bb6147f226fdbdbbb4cd3f18d93b9fe |     



-- 
http://autobuild.buildroot.net

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

