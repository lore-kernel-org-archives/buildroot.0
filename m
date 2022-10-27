Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4709FC67871
	for <buildroot@archiver.kernel.org>; Thu, 27 Oct 2022 05:37:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63019408EB;
	Thu, 27 Oct 2022 05:37:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63019408EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kBJj4sPuhW7v; Thu, 27 Oct 2022 05:37:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E55B408F7;
	Thu, 27 Oct 2022 05:37:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E55B408F7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 56B9F1BF376
 for <buildroot@lists.busybox.net>; Thu, 27 Oct 2022 05:37:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 34599408F7
 for <buildroot@lists.busybox.net>; Thu, 27 Oct 2022 05:37:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34599408F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YhEd5myt9Pep for <buildroot@lists.busybox.net>;
 Thu, 27 Oct 2022 05:37:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AABD1408EB
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AABD1408EB
 for <buildroot@buildroot.org>; Thu, 27 Oct 2022 05:37:17 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B46D140002
 for <buildroot@buildroot.org>; Thu, 27 Oct 2022 05:37:14 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Thu, 27 Oct 2022 05:37:14 -0000
Message-Id: <20221027053721.34599408F7@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1666849034; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=6OIqb/QE/+NPl8MIvgV9VT493Sv2OYhJb+xXxK4pcAI=;
 b=Iqe3BdcOLTu1SA71eg1alw+U5V6E+kffuCqMzrGyMhl0XGUbHXoU9cVwpwEV4O0DUqo06E
 ZRvLuHl+ijk6Q8IU2HPHdms3aExrf5wCJWD7/fHOP21w4lVY/RmU/3A4YArMojymHH3wSl
 mxmlBKxCCYRGXQLiTAXIFwuBaNfCMQtS3HLH/5KXDg8XDP91qqHPxPnLqIU0+4qR3Z7avj
 pKdQVL3hF3kxSbBrwnbDoOWsWLL2QOUcSID0zM66xNL3lPFQwcX4Dvw+esshV1tHLs10iL
 Di/4O90SkcNDLfvLwY04gwO1ztvaKbM3CUg7RBDut0Kf/Fi+v4TkfBl3Ql6xgA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Iqe3BdcO
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-10-26
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

Autobuild statistics for 2022-10-26
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  1  |  0  |  0  |  1  |
  2022.08.x  | 11  | 11  |  0  | 22  |
    master   | 130 | 253 | 11  | 394 |

Classification of failures by reason for master
-----------------------------------------------

                        brltty | 11
glibc-2.36-44-g2628500f5dff... | 11
        host-f2fs-tools-1.15.0 | 11
        host-sentry-cli-1.59.0 | 11
                      xz-5.2.7 | 10
                      crun-1.5 | 9 
                     file-5.43 | 8 
            btrfs-progs-5.16.2 | 7 
            igd2-for-linux-2.1 | 7 
          imagemagick-7.1.0-51 | 7 
              libarchive-3.6.1 | 7 
               libcodec2-1.0.5 | 7 
               libglib2-2.72.3 | 7 
                 systemd-250.4 | 7 
                 dash-0.5.11.5 | 6 
                host-go-1.19.1 | 6 
                   linux-6.0.1 | 6 
            host-binutils-2.38 | 5 
                 sysvinit-2.99 | 5 
                     efivar-38 | 4 
  gobject-introspection-1.72.0 | 4 
                   libnss-3.84 | 4 
                libshout-2.4.6 | 4 
                  autofs-5.1.8 | 3 
                elfutils-0.186 | 3 
               fftw-quad-3.3.8 | 3 
host-pahole-73383b3a39afe86... | 3 
                  assimp-5.2.5 | 2 
             batman-adv-2021.4 | 2 
                  gensio-2.5.5 | 2 
glibc-2.36-66-ga1dc0be03c9d... | 2 
            host-binutils-2.37 | 2 
         host-gcc-final-11.3.0 | 2 
         host-gcc-final-12.2.0 | 2 
              host-rust-1.64.0 | 2 
libdill-32d0e8b733416208e04... | 2 
              libgcrypt-1.10.1 | 2 
                    lxc-4.0.12 | 2 
                   perl-5.34.1 | 2 
              traceroute-2.1.0 | 2 
                       unknown | 2 
/home/buildroot/autobuild/i... | 1 
/home/buildroot/autobuild/i... | 1 
/home/buildroot/autobuild/i... | 1 
/home/buildroot/autobuild/i... | 1 
                 avro-c-1.11.0 | 1 
             berkeleydb-5.3.28 | 1 
             bluez5_utils-5.65 | 1 
                  brotli-1.0.9 | 1 
                 coreutils-9.1 | 1 
           crucible-2022.05.25 | 1 
             fontconfig-2.13.1 | 1 
       freeradius-client-1.1.7 | 1 
       freeradius-server-3.2.0 | 1 
fs/cpio/cpio.mk:117: /home/... | 1 
fs/cpio/cpio.mk:117: /tmp/i... | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
                 fwts-22.09.00 | 1 
                gerbera-1.10.0 | 1 
                       gsl-2.6 | 1 
gummiboot-2bcd919c681c952eb... | 1 
hawktracer-2ec19d7192334414... | 1 
         host-gcc-final-10.4.0 | 1 
       host-gcc-initial-10.4.0 | 1 
       host-gcc-initial-12.2.0 | 1 
host-gdb-arc-2020.09-releas... | 1 
                host-go-1.19.2 | 1 
                   iperf-2.1.8 | 1 
                  lcms2-2.13.1 | 1 
                libglvnd-1.4.0 | 1 
        liblog4c-localtime-1.0 | 1 
             libpciaccess-0.17 | 1 
               libsigsegv-2.14 | 1 
                 libusb-1.0.26 | 1 
          linux-5.10.145-cip17 | 1 
               linux-pam-1.5.2 | 1 
                linuxptp-3.1.1 | 1 
             lirc-tools-0.10.2 | 1 
make: *** wait: No child pr... | 1 
              memcached-1.6.16 | 1 
                  mender-3.4.0 | 1 
            micropython-1.19.1 | 1 
                    musl-1.2.3 | 1 
                  netsurf-3.10 | 1 
              open62541-v1.3.3 | 1 
                 openssh-9.1p1 | 1 
              procps-ng-3.3.17 | 1 
                      rauc-1.8 | 1 
                    sdl-1.2.15 | 1 
             stress-ng-0.13.05 | 1 
              strongswan-5.9.5 | 1 
                tealdeer-1.5.0 | 1 
                 uclibc-1.0.42 | 1 
                usbguard-1.1.2 | 1 
                  vlc-3.0.17.4 | 1 
                    volk-2.5.2 | 1 
                 wavemon-0.9.4 | 1 
                 wolfssl-5.5.1 | 1 
                 zlib-ng-2.0.6 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/825c547741ac8bb54d4050f52f70aca1b9eb1172 |     
    mips     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/ef561e91e163aafcca46e598068ba73ec14a1c71 |     
    m68k     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/e96cc7c2dbbc349338232325dd9ef585d602bb05 |     
   xtensa    | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/5b8e68a67a3c11fc896a403ccf782c4228576b9e |     
    or1k     |          assimp-5.2.5          | NOK | http://autobuild.buildroot.net/results/5199b99d2ff151def6695fe22b7f024519c31af5 | ORPH
    or1k     |          assimp-5.2.5          | NOK | http://autobuild.buildroot.net/results/7433b5c88b7ce58bd5dc26ef6f24dde6b0037f87 | ORPH
  mips64el   |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/987fe55733d421daf0412492a3663edcb3963a4f |     
microblazeel |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/e8d7318a009da7a00bf78675c1b0342b4c1628fb |     
  aarch64    |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/2e64d1d67f07129840d11d3ae5b020d2c3489233 |     
  mips64el   |         avro-c-1.11.0          | NOK | http://autobuild.buildroot.net/results/93f0c3d7beb049ffa57bc19489469b03c69af7ab |     
microblazeel |       batman-adv-2021.4        | NOK | http://autobuild.buildroot.net/results/00783b96a0c4ae5a96c304f4c9e14d362ad1d29f |     
  riscv64    |       batman-adv-2021.4        | NOK | http://autobuild.buildroot.net/results/2403eb08e8c4ca099b201f7fe64af886dea89a34 |     
    sh4      |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/f887d5479d57aa99ffa9314743fea5c378e32146 | ORPH
   sh4eb     |       bluez5_utils-5.65        | NOK | http://autobuild.buildroot.net/results/c45f392bcea5aabb2b19ffc57235857a9c25376d |     
  mips64el   |             brltty             | TIM | http://autobuild.buildroot.net/results/d2be0e0f9d31278182a3eddbb7f08c42c1528f43 |     
   armeb     |             brltty             | TIM | http://autobuild.buildroot.net/results/a7f2ef340835c126629edc3c95c49c5f2c462e94 |     
    mips     |             brltty             | TIM | http://autobuild.buildroot.net/results/fe254dc18b681ff3d348158ba9e39e43fe1b593f |     
    arm      |             brltty             | TIM | http://autobuild.buildroot.net/results/bcaea35beffcf7ee75da36d82cecb4cc9904917a |     
    arc      |             brltty             | TIM | http://autobuild.buildroot.net/results/f82026541aa4b4a243b75a7a1334ef46ac478adc |     
    arm      |             brltty             | TIM | http://autobuild.buildroot.net/results/2834aa9cb9392e0d99cc42b57cbb783649aa09be |     
 microblaze  |             brltty             | TIM | http://autobuild.buildroot.net/results/83268db829ae5bcecf0f6ad4e0a860a9cb214ee6 |     
powerpc64le  |             brltty             | TIM | http://autobuild.buildroot.net/results/4a8f43b4ea210e4c4a10b340495bd379f9ab8d96 |     
 microblaze  |             brltty             | TIM | http://autobuild.buildroot.net/results/a63028e2703a888e9e5520f0fbc846a882f5ea6b |     
    mips     |             brltty             | TIM | http://autobuild.buildroot.net/results/cb57d0f022621f8ec5163b0afe8fc89a3ed63493 |     
 powerpc64   |             brltty             | TIM | http://autobuild.buildroot.net/results/d5b60f3048b83c62ac16e51393c91a04e90c8a23 |     
   arceb     |          brotli-1.0.9          | NOK | http://autobuild.buildroot.net/results/167847c34dbb3be7143509edd727c6e74e87fd93 |     
microblazeel |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/e5de3908ea666d639f7e3f6a1e302d6c3c4fbee5 | ORPH
    mips     |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/d021c95e83e9339eea7ad3641fef1f9c69de1f1c | ORPH
 aarch64_be  |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/84faa2608966784bda26e8b4faa7880205d0caa7 | ORPH
  sparc64    |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/8becde0ffb273aae34b0ff4091548b5971738b38 | ORPH
  riscv64    |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/5ba5a780c19a0ecefee493ecaa8584e8b6093801 | ORPH
    sh4a     |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/0ca8b0c2aaa8606508a2504da8b36c69d2632c52 | ORPH
    arm      |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/89111720553eff90ca19262b8b5bade81f09a139 | ORPH
   sh4aeb    |         coreutils-9.1          | NOK | http://autobuild.buildroot.net/results/8a159c5e6d5ce01acbff97db68f98d66b93c0a86 | ORPH
powerpc64le  |      crucible-2022.05.25       | NOK | http://autobuild.buildroot.net/results/cdc35f470b590f6effcf95834f21663f6ca867d7 |     
  riscv32    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/e844d1155ef1f2c42becc088465b309d1beaea62 |     
   xtensa    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/de118307f79917b5ddf8ecb4ea2856ceb4b937b3 |     
  mips64el   |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/87a65e958850d23a96bf1403a122e73504f2a8fe |     
   s390x     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/c2749e0a1d56d2bd4091e4ba29da9328f4318428 |     
   arceb     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/8e63cd00921275768749d4a17d2618652fc97621 |     
    sh4a     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/4773770097c5ed8e5aeb43c9c1c1af0af92039b5 |     
  aarch64    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/b453f6ea565b52b7fc0598cf32e3c7ba3f85d9c9 |     
   sparc     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/447a2f23c6c297da63ab27dddcd5d80aebab65ac |     
    m68k     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/42f148ca72996032a0d7bcc2f9113b967c18b3d5 |     
    or1k     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/757c725f2f57df7992a93a9007f8457e6ac99b66 | ORPH
 powerpc64   |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/a23d40509ab97bcd0dfc491ef952495ab10bde40 | ORPH
   nios2     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/c042eec3c084f5c047b40d8dce9c74e5317ced65 | ORPH
   s390x     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/b6867d2a3fee88899a0aa721d058276c264b844e | ORPH
   sh4aeb    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/124e0138ee45e5c8320cb1b9c036bf63384e0f19 | ORPH
powerpc64le  |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/c1b943bc0be9bf2192f61fec5577a2f9d1e84c9c | ORPH
  mips64el   |           efivar-38            | NOK | http://autobuild.buildroot.net/results/5daa0e4320b4fd29c9fbaa9b86dc6105f79a70d2 |     
   mipsel    |           efivar-38            | NOK | http://autobuild.buildroot.net/results/6be4051f0220114ef3254ccdd71f30506b98977c |     
powerpc64le  |           efivar-38            | NOK | http://autobuild.buildroot.net/results/e8109c396889b36b9e53400f4f27650bbd666574 |     
   mipsel    |           efivar-38            | NOK | http://autobuild.buildroot.net/results/702e1aeed6a14b10977a77bb37e056bb7c6dc4df |     
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/5efb55de0148ad15458fba3524c5e02df6abb8f2 | ORPH
   arceb     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/7c7a1687ebd6b5d5ee93328b94d0562be2ba68eb | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/905415ceec0c92ba86d375c24aa8daa335fdd7dd | ORPH
powerpc64le  |        fftw-quad-3.3.8         | NOK | http://autobuild.buildroot.net/results/b173cbab10dd2309290d1744786755d8e4ce3e1d | ORPH
powerpc64le  |        fftw-quad-3.3.8         | NOK | http://autobuild.buildroot.net/results/89b4903b0adfbc4f7b1126922a5bb94ec2efd026 | ORPH
powerpc64le  |        fftw-quad-3.3.8         | NOK | http://autobuild.buildroot.net/results/7f75f73a57160adff80e6fe225812286846fe915 | ORPH
   sparc     |           file-5.43            | NOK | http://autobuild.buildroot.net/results/7ff1dd9f79408d2e6286c005302b6f3c505ab259 | ORPH
   mipsel    |           file-5.43            | NOK | http://autobuild.buildroot.net/results/5215df9d5c615e00cd029314435e33d382f7b7d1 | ORPH
    or1k     |           file-5.43            | NOK | http://autobuild.buildroot.net/results/1681451934639a6910ae3c2cfd2448fea53ccaa0 | ORPH
   armeb     |           file-5.43            | NOK | http://autobuild.buildroot.net/results/2f53b16c249614fbe462e06c5b5e60f6019d7092 | ORPH
   xtensa    |           file-5.43            | NOK | http://autobuild.buildroot.net/results/d7f8260b0633351698e473ec7a86f12f02b912db | ORPH
   sparc     |           file-5.43            | NOK | http://autobuild.buildroot.net/results/b177da01d237226290d4f670fd98f7da5070f19d | ORPH
   sparc     |           file-5.43            | NOK | http://autobuild.buildroot.net/results/6b292574fcf0d4aeee953dd42c6428bd7e26b34e | ORPH
    arc      |           file-5.43            | NOK | http://autobuild.buildroot.net/results/e6b30c1b564852894e5082c50b646ca60dc0b769 | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/6d0d1c9c8af16ec2c56e8b243465b5162aa1cec1 | ORPH
  riscv64    |    freeradius-client-1.1.7     | NOK | http://autobuild.buildroot.net/results/989b14ac7de43179706cd39a5a986bec2a04d46a |     
microblazeel |    freeradius-server-3.2.0     | NOK | http://autobuild.buildroot.net/results/c04fc4df8d4972f1427bea845c76231b352a3768 |     
microblazeel | fs/cpio/cpio.mk:117: /home/... | NOK | http://autobuild.buildroot.net/results/4a282bb2e313da4078e596647e2ad3c4aad8cc25 |     
   arceb     | fs/cpio/cpio.mk:117: /tmp/i... | NOK | http://autobuild.buildroot.net/results/2ec6cf38146f3ba3e50a9a5599cf38644eff3405 |     
   arceb     | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/e7977b52277e0ae3837b12f98e1a2b009faff876 |     
   arceb     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/3d7c9847bfe9465e4184bcb6d2c8c08868a4bf5f |     
    m68k     | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/137762e70ecb0e9f2a12f84436100141057ccc69 |     
  aarch64    |         fwts-22.09.00          | NOK | http://autobuild.buildroot.net/results/ac450a22ab1bd3ca1b5110fdf2001c9d5aaceeb2 |     
   x86_64    |          gensio-2.5.5          | NOK | http://autobuild.buildroot.net/results/9b683099479d5db6bcaa746451f646bf2b78f59c |     
  mips64el   |          gensio-2.5.5          | NOK | http://autobuild.buildroot.net/results/15b2bf08e5e852f46795bf2980654c3adb2577be |     
  riscv64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/88acea6b33673c255cddc99555bfd6de32f6fc43 |     
    sh4      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/8e1ae0385bb9664b11f1ccee3fc1472daccb4dab |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/02a18813eed8185d749e85465d9286bc03e3db0c |     
microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/8ba8882a861cf7df359c23969c09b2be0725b2e5 |     
 powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/845c24be5e718d0d5c208a77412c89337fa58521 |     
    or1k     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/42e40ce687e54f7f9274a6bbc7bb0116f64a648f |     
 microblaze  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/f1023e8c72d1a1d472a48283deb9225bf8a68bdf |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/44cf9a7d530aab7d0d6003e6bd1ac7bc7848af52 |     
    mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/edd204835afb9a5ad5e9789b57295e0447ba33cf |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/b797170affea0fce17f4c4dd6e18a6d84eee08d4 |     
  riscv32    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/5ca49b2732f68eccb5276e7112f7f496dcc514ee |     
    or1k     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/0e202bf53a683930f3cad6edef2a4dea629eaecb |     
 microblaze  | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/c058b27ed2834dfa633b63ec6c3639ab1e8bf412 |     
   nios2     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/5571d5913556f73c1ac8582cbdf4a7e4fba3f356 |     
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/a0392b6b521cb3e98c70b5797895e6e0ee197aa4 | ORPH
   nios2     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/8e8307246afcb2e4c0fd4512474287de9dffc4cc | ORPH
    mips     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/1c020ef273ec848d808437b66ac9416dc7acd92c | ORPH
    i686     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/dc002b2efc755559d5963d50666e9d8a87d9f09d | ORPH
  powerpc    |            gsl-2.6             | NOK | http://autobuild.buildroot.net/results/0f9365a7fea101b70bd2d27b4c5ed1e3255844c9 | ORPH
   x86_64    | gummiboot-2bcd919c681c952eb... | NOK | http://autobuild.buildroot.net/results/6880ab57859a1bead9e5c027620625b509b2dffb |     
   nios2     | hawktracer-2ec19d7192334414... | NOK | http://autobuild.buildroot.net/results/7f130ab90602374e152efd1bae7fd55099a25ff9 |     
 microblaze  |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/e550010fc8e2cf4b720b42ef1774b6729d618635 |     
   arceb     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/236ef5fda773993ed0b39ba2eb766bf055b87b94 |     
   armeb     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/0b5ac87f1d2c94e02c7af8b5ea04b7eca1155b1f |     
 powerpc64   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/8f2b2e56dd5b8a6f9faa895f1ef144877e51e2c5 |     
   sparc     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/f2529c844fb6bb5ea1198477ff6f79d1dcf6bc64 |     
  riscv32    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/12cc7ecba650c7b08ca56c4894d6a277078fb25a |     
 aarch64_be  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/b7e5ee38b1046b913498c2e1080dfdecbb84eca3 |     
   x86_64    |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/a3198e2bc086c97662919b36916d61a5898ba794 |     
  riscv32    |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/b64a2932149376b879459301e9a9a4a0f6436f0f |     
  sparc64    |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/dd08bdb6675361e5280751638b4a3ee313d2e877 |     
   sparc     |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/5b8f6ee2748b45e3db3e5c1d605f48e8b6b15408 |     
powerpc64le  |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/d6c00ebdf079eed07e6a1d977f40373ef367f064 |     
   arceb     |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/48de79ac3a582fa9e82e42fd93f4ab98c04a5e0c |     
powerpc64le  |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/4b92bddf8ff2ee5d792b1ad1e8d27662986fb213 |     
    sh4      |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/395b1618aac1f2c62f45690504609b9af60515e7 |     
 aarch64_be  |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/9a334a27512948851446432c95df31177e8d3e76 |     
   mips64    |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/b1ad86b2d214d9625bfe7e43e9a88fda07cf7e31 |     
 aarch64_be  |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/05de5fcd72fa687126dd1ab0698bc56463121aa0 |     
    arm      |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/02696dc36166c44bfb836bfaf2a976c9f931b714 |     
 microblaze  |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/2b1dc5cad41cbb078c64f4fb708c5e77e73a34b7 |     
   s390x     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/66e8191f4fc6af356d3fecb2b5c84ce42ac0f948 |     
 microblaze  |     host-gcc-final-12.2.0      | NOK | http://autobuild.buildroot.net/results/baca56c99acf72c32019320453b8126a8b802354 |     
    arm      |     host-gcc-final-12.2.0      | NOK | http://autobuild.buildroot.net/results/ccc2699fa00ac4006b619b36f56d13fab6c551f7 |     
  aarch64    |    host-gcc-initial-10.4.0     | NOK | http://autobuild.buildroot.net/results/67e37d9d00b65330ce265b6fb51711e1ff1be01e |     
    arm      |    host-gcc-initial-12.2.0     | NOK | http://autobuild.buildroot.net/results/6554b3503b4b6a192d748888dfc11056accfc4a0 |     
   arceb     | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/872e8a2dd9b96d66dfe51bd7287ef14aa03a5b45 | ORPH
  mips64el   |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/8f96fec32590df27fc918f94be377e4cd78b0e37 |     
  mips64el   |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/d69c6e35038c8d0b958b2025cc7dd25541030540 |     
  aarch64    |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/06f6ada2421bc595108a801aa9da039982663eb0 |     
    i686     |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/d6c4d1cdebc4d3a04fceefbce059bd464df6e6c2 |     
  riscv64    |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/12071f61176f90565f2b29b70dd538ec713e0e22 |     
powerpc64le  |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/fc645d0e89ed2a1be67eb7a46da9f21bd05afc33 |     
powerpc64le  |         host-go-1.19.2         | NOK | http://autobuild.buildroot.net/results/42e68753b9adb23c5ee4cdb9621548b4fd9fdd6c |     
    or1k     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/8070446ce7f6a7766eee08c997b66b8902d7435f |     
  riscv32    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/68907e07ddbce85d8676d8092bffbb91f98b6c43 |     
   armeb     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/60aaaf8a932101c305875ffef58705219f0c2a5d |     
    i686     |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/219616d859c1cdda892d239fd70d8026189126ef |     
   x86_64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/7f28c9091db5f48a4afc084e2929a8d9dc0ecd29 |     
  riscv64    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/08b6d9be1408dd54bcd7ac9eb69e1c0f02cc39b1 |     
   sparc     |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/f33d70f53ae5394425d2839464771aa7fae1569a |     
    or1k     |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/a65de0a7d9dedf9e6e2e71f1ffe21baa830c3c0c |     
    mips     |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/f06f289eba8c1435dc37ab2918c59f5115ab337b |     
 aarch64_be  |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/fd3532c5e4bac4013e0f630f9773c8185f1c1d8a |     
    m68k     |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/a0a352ccd2f0b7f0abff9418a510003fadc677f5 |     
    or1k     |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/c69d92f9ad33eccf482226c31fa5fff76f3cbf73 |     
 powerpc64   |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/219059be99929512c7bac93e242af9b0e55b32a5 |     
   sparc     |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/801ffd4967bed251fa96c5a9b530171440584066 |     
    arm      |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/883b83a5ee44206e0d67a30787bf5d60765ac1e4 |     
 aarch64_be  |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/0c7bed50b1dab4dd18a7dfd7f7a8daab85805ebc |     
   nios2     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/6ba1729880afc537221290868c20facaa5e4767b |     
   mipsel    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/4e76beae0d3a6883740dfaadd0ffcda9c7ffc6e2 |     
  mips64el   |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/defc5e84150d68b664380355a563b8c721411a96 |     
 microblaze  |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/f0bb1cbb7349028db3ec37ec1ae371d9d5d3ad34 |     
 microblaze  |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/fc2c1a1113d9214813e9ff0baaf837f94df08a54 |     
   mips64    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/a8169be4ccc3c8ddee13688448ae7dc147500c56 |     
   mipsel    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/40aaae4125c17b3abbbc152acbacdafe0cbd6f16 |     
 microblaze  |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/cede597258cff8c15a42a39f8479d6cb12914ea8 | ORPH
   s390x     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/dba3622da8b71e2b1eea3132870374359c10217e | ORPH
   s390x     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/d5869fbff77f2972bb63f3adfe380ecc318377c9 | ORPH
   sparc     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/30f2138ec7bd86a4e024aa46325ba960b16b3ead | ORPH
microblazeel |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/3d177d1ce753146693c944ce3b11ab42614d3b03 | ORPH
  mips64el   |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/433f3a49deb5bccba9655a1fb8dd299d814fdb9a | ORPH
   arceb     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/29f18d711034ebd085fa2141b9d7f77489479eef | ORPH
    arm      |          iperf-2.1.8           | NOK | http://autobuild.buildroot.net/results/2bcddf8439f6913fdf19b1fc2d33999a787ab3b2 |     
   xtensa    |          lcms2-2.13.1          | NOK | http://autobuild.buildroot.net/results/5c42bb1a2bf3f81285ccae400c8b351fa46f97af |     
    i586     |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/5492ae83a448cf4752ec95c21fc9050bf9aabea8 |     
   nios2     |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/bedac2c10e317ddacdbfd147ca89cb1f6c657a5e |     
   nios2     |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/287dc8e515d48db988c37f03c001b093177038c9 |     
  sparc64    |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/dbe26e2860ce312d1909e2fa538e50062b464e31 |     
  sparc64    |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/c646f70adf71e367ecdcfe8122782a2d9b74c43e |     
    or1k     |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/bccbb83cbbeb6f54a6c8165467151b47d3b4ca48 |     
  aarch64    |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/84adc94a8bdaebb60cd8087dc41652795e58dde4 |     
powerpc64le  |        libcodec2-1.0.5         | NOK | http://autobuild.buildroot.net/results/a52df649dadcdd804d8a668a497cf5535f005074 |     
  mips64el   |        libcodec2-1.0.5         | NOK | http://autobuild.buildroot.net/results/70f18513d975160c868d51d1b42a59dbb21cfb1a |     
   s390x     |        libcodec2-1.0.5         | NOK | http://autobuild.buildroot.net/results/76b60772f81c2e3b6e1150024376954c14f2bd8e |     
   s390x     |        libcodec2-1.0.5         | NOK | http://autobuild.buildroot.net/results/6e34f3c1d1180c3aabf4288db559632c0eb29d1c |     
    arm      |        libcodec2-1.0.5         | NOK | http://autobuild.buildroot.net/results/f38ba949ffa02d415545caa8a8024ed2181a5a8f |     
powerpc64le  |        libcodec2-1.0.5         | NOK | http://autobuild.buildroot.net/results/8b53e57858583d127b94c7280816c3967dff5d35 |     
   s390x     |        libcodec2-1.0.5         | NOK | http://autobuild.buildroot.net/results/3f95f832aacebc81e0323005c01040529c8a7462 |     
    or1k     | libdill-32d0e8b733416208e04... | NOK | http://autobuild.buildroot.net/results/035e8aa6c34c1fce0f7f7d83fe1387b2ccc362e2 |     
  riscv32    | libdill-32d0e8b733416208e04... | NOK | http://autobuild.buildroot.net/results/fcf188d660f0eb3a7f3205dfcb9683d39a950797 |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/45f2f4b93b173517a70cf9bbbeadaaf493a34a8f | ORPH
    i586     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/78027f2bc0180d83c9b9d0739a4cf7e28908e19d | ORPH
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/344834c476ae73ace0f2ecd2b05fb0089c7a330f |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/296d469b8515f0f1ed3c096317f285bde8ed24c2 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/1c6805ed0aaaeac78074ac9874be30560a2f854e |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/1c8c24083dcd452b141fe7123ff2ece440ae2af1 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/ac961c4ea63926a9abee99a06a60042f0bc94e46 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/194ce2000c8f725f4d576295ee8705187c384edb |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/236b25dfc5be57e58e858f2c11bdf4383e715557 |     
microblazeel |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/27bc946f6fc701b7482208e68d637a63b3217dfb | ORPH
  riscv64    |     liblog4c-localtime-1.0     | NOK | http://autobuild.buildroot.net/results/ebb1e11f0f60748401717644a8bd939e39fa0203 |     
  sparc64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/5a2e998567349f339cc02001df0f9264e02aedf5 |     
microblazeel |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/ddc116f787af0d1c34ee6ddd8ad5b92e902f0fb9 |     
powerpc64le  |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/13e409670cd9bb7b2b0cea4df0ae941329df41ff |     
microblazeel |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/e9c41823dbc651222679771bd16b9aba786ad98b |     
   sh4eb     |       libpciaccess-0.17        | NOK | http://autobuild.buildroot.net/results/08d57b8d147ac0021e6a848d800a5b85e8bbc65f |     
   nios2     |         libshout-2.4.6         | NOK | http://autobuild.buildroot.net/results/7e798ab35898a2601876c53e72c52b907794b2cf | ORPH
microblazeel |         libshout-2.4.6         | NOK | http://autobuild.buildroot.net/results/3a85cbc64fc13fa6e335ca8dcf64f8a5e77c71f0 | ORPH
   sparc     |         libshout-2.4.6         | NOK | http://autobuild.buildroot.net/results/ac39928f1734ad9d6e490b66aec302190855637c | ORPH
   sh4aeb    |         libshout-2.4.6         | NOK | http://autobuild.buildroot.net/results/4b0a8ca3d82d0a14a6b45c450be6dbf5388ca425 | ORPH
  powerpc    |        libsigsegv-2.14         | NOK | http://autobuild.buildroot.net/results/bb07cebebe8a26836cec163acf2e25f4dd495051 |     
  mips64el   |         libusb-1.0.26          | NOK | http://autobuild.buildroot.net/results/165d4caf6e1e1d40ba81e901fe38a84ed3db6dfe |     
   armeb     |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/fd269255cd6af30dcc00fbae71e951137569b08d | ORPH
   mipsel    |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/dc4789182ed5f77084341dffb97b25f72419d04b | ORPH
    m68k     |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/9095d1e400932f3f2504da091bf9c60835cafbee | ORPH
    sh4a     |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/8cb2e6090dd858e3ced68d7ac104786e1f8ccdaf | ORPH
  mips64el   |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/1e9cdc5885ec8a858634470dbb90ff68c12ab13b | ORPH
  powerpc    |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/ad79543d1af444d09db3d37a7cde65ae8925d8d9 | ORPH
    sh4a     |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/1cf4537a16834b990b5ad28d4f4bd6dbdbd68ea4 | ORPH
   armeb     |        linux-pam-1.5.2         | NOK | http://autobuild.buildroot.net/results/91700c3956df581e5bab3877ea32fde0d50f9d50 | ORPH
  aarch64    |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/97293b9304ed760828743148001d475cb4252f81 |     
microblazeel |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/5ffa71de0b7d9e18fa13b76cf6e4df5b7daeb9d7 | ORPH
 powerpc64   |           lxc-4.0.12           | NOK | http://autobuild.buildroot.net/results/770609d58eab18743dfa43098fa466a37541ba4a |     
  sparc64    |           lxc-4.0.12           | NOK | http://autobuild.buildroot.net/results/b0fed736ac62a522c57c639aed7e873cadb70a62 |     
   sparc     | make: *** wait: No child pr... | NOK | http://autobuild.buildroot.net/results/44b7a26ff8196b39edf972771187b7af2898bdb7 |     
   nios2     |        memcached-1.6.16        | NOK | http://autobuild.buildroot.net/results/e650ad609a205f458d736e8bac695e946e99bdc3 | ORPH
powerpc64le  |          mender-3.4.0          | NOK | http://autobuild.buildroot.net/results/ca4c2ad381fcb3f13428f367bb0480f5f63f71cd |     
  aarch64    |       micropython-1.19.1       | NOK | http://autobuild.buildroot.net/results/32adc06d047e3ecb0f1b7b773cdc66c39a7f67ee |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/63d623aa6bffade2bb602592a3cce3d830c20ab3 |     
   sh4aeb    |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/5c9e0a3478ce39d154328a84ebea98e1f56cde63 |     
powerpc64le  |        open62541-v1.3.3        | NOK | http://autobuild.buildroot.net/results/af3f2408e3ea7e880fb2f3fc0f01351a04e98645 | ORPH
    m68k     |         openssh-9.1p1          | NOK | http://autobuild.buildroot.net/results/dca1b0e9f323131babc327cc32a9d15ef7683ef1 | ORPH
   sparc     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/3ced42bff937848382c71d5a110adf70c94cb290 |     
    arc      |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/1c288e5bf53df44835ea01eaf190c9af4aebd6a8 |     
   x86_64    |        procps-ng-3.3.17        | NOK | http://autobuild.buildroot.net/results/9be42feb1d4e8d2cee8cda708665e96afd3d02e3 | ORPH
  riscv64    |            rauc-1.8            | NOK | http://autobuild.buildroot.net/results/3f3a50acf5de4c17aa3d0e8d27f803e33c479f2b |     
   sh4eb     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/60fe56597202b32691ef588d33a2bc2fddaeea53 | ORPH
    sh4a     |       stress-ng-0.13.05        | NOK | http://autobuild.buildroot.net/results/556593987e972d04efd7baabfa72a6a702aca2c6 |     
   arceb     |        strongswan-5.9.5        | NOK | http://autobuild.buildroot.net/results/5cf6aa18fd9928581314b2970a8090481f015c8b |     
   s390x     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/055faf9bc247880690d112ff8a013742b29c09f0 |     
  sparc64    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/c49e7520f6d2c865a320ab03b7986c88fa10a790 |     
   mips64    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/c34e462796163247bc753c039935162b1b44669e |     
  sparc64    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/39b991d6faf98252004280a37bb12009b2cc38ad |     
   x86_64    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/1dc46ac8c9a8bc80df8b9b06caf3b1cb6de2aa74 |     
   x86_64    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/ca4e9c0697cc7a650f747d69f43872a47ed2bf2a |     
   mips64    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/f8906f87caa72ed561b8980b5f9e039b57ad8345 |     
   x86_64    |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/856f41485a0f3650fc7ec6c2f2af9bbcfa8fca00 | ORPH
  sparc64    |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/ef6bcf6e56a88d9cb6b42388dff07a24e5518e44 | ORPH
   x86_64    |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/d3d840dbf1532ec527db0edd46e27962cf2b4fc5 | ORPH
   mips64    |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/f9fde8c126538523309e53a340124046919474db | ORPH
  aarch64    |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/c2b54068cfc0ef80fd4ea67a77341c3d36c18eac | ORPH
   mipsel    |         tealdeer-1.5.0         | NOK | http://autobuild.buildroot.net/results/95fa846021d82a2043f24575e34a0e7548e75d16 |     
  mips64el   |        traceroute-2.1.0        | NOK | http://autobuild.buildroot.net/results/66b9c45fecbbdf8dfa8219e67bbdc1813f0be4db |     
   armeb     |        traceroute-2.1.0        | NOK | http://autobuild.buildroot.net/results/d1331ffbbabd6e690841df1f3fac34ac1f389aa1 |     
  riscv64    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/650de76a851707aa3b0a096e3d36c4a0447f4720 |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/fad421293cf6cfebec15e39791b229fc69baa68f |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/88225e33da151865aecae34ce0ec897758148c4e |     
powerpc64le  |         usbguard-1.1.2         | NOK | http://autobuild.buildroot.net/results/b70dcf8628d9522579e4678e4d8873d7e52ddd95 |     
   sh4aeb    |          vlc-3.0.17.4          | NOK | http://autobuild.buildroot.net/results/86a0c3dde276fb606bf61184a796f3670339b767 |     
  powerpc    |           volk-2.5.2           | NOK | http://autobuild.buildroot.net/results/c55e21ac3c27ac5ab9ae44b4a75b1318e37b08c4 |     
 powerpc64   |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/e3b8f3e407e44cf340ef6e8612374d9e223ef02f | ORPH
    mips     |         wolfssl-5.5.1          | NOK | http://autobuild.buildroot.net/results/9551cca51591005e2600ab6a83edf8c811d4ad30 |     
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/9a02909ad44c4d79b2507d056ae42bada790565f | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/a6fd3541e585a65e4adf990a6dabdce846953df2 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/1f6b567a95d38036ad4ae2507be3207701b75602 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/28b9c395d0d37370b236da7f738f31aa3f0d88ba | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/7a4de28a9a1d97ef8aa3a33f5f6f200d009dda37 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/0fdc122cbe145bd78070e79854a0bd0c523e29dd | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/520a0c262d3555722cc25437f1917fca448ad1ae | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/f8d5259288d5002086d21efa5cb61c3841ef705c | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/e5ac80ce873cfcfe4f5a4098fa0edd59739a0eb2 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/9e34d27b55bdad4adf70e7deed078b797fc3923d | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/bf634446a668a3a680c1a1eb1ce4604e0e963c68 | ORPH


Classification of failures by reason for 2022.08.x
--------------------------------------------------

            openssh-legal-info | 3 
           crucible-2022.05.25 | 1 
                gerbera-1.10.0 | 1 
              host-rust-1.62.0 | 1 
host-spirv-llvm-translator-... | 1 
            igd2-for-linux-2.1 | 1 
                ipmiutil-3.1.8 | 1 
               libdeflate-1.12 | 1 
                   perl-5.34.1 | 1 


Detail of failures for 2022.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |      crucible-2022.05.25       | NOK | http://autobuild.buildroot.net/results/8ba2977bd712fc965c5375cff30b34b67fcc534e |     
  sparc64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/ff276691c492cfb3b6abcf34d5e3a0926c40f22c |     
   mipsel    |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/4167e14851112a8f1699611b62c08e5b75632ad0 |     
  riscv32    | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/74d5dbb5bdf81b32c317dca4fc7212b16ced156f | ORPH
    mips     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/537bdc9b1c06c90a5150f72cdbcb3c7c8439638f |     
   x86_64    |         ipmiutil-3.1.8         | NOK | http://autobuild.buildroot.net/results/c3a0d5952cc9c82f7b1f9c21c116d6a8b4a65e57 |     
   armeb     |        libdeflate-1.12         | NOK | http://autobuild.buildroot.net/results/576796e44afccc51916a7d42d2f99e39bf4011ee |     
   arceb     |       openssh-legal-info       | NOK | http://autobuild.buildroot.net/results/fee72dff0db81510d62e883c8d0c5cc25a47c591 | ORPH
  aarch64    |       openssh-legal-info       | NOK | http://autobuild.buildroot.net/results/1f8b1e7227a8799aa19994a2c7c26d88ed705bc1 | ORPH
 microblaze  |       openssh-legal-info       | NOK | http://autobuild.buildroot.net/results/4372b32333d37bd08b8a9385e92af9911f374c0b | ORPH
    arm      |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/040d870c3584235c64af33fc602a149a872af782 |     


Gitlab CI results for 2022-10-26
================================


-- 
http://autobuild.buildroot.net

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

