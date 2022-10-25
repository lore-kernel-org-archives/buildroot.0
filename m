Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7663C04A95
	for <buildroot@archiver.kernel.org>; Tue, 25 Oct 2022 05:40:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C6FD812E9;
	Tue, 25 Oct 2022 05:40:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C6FD812E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id To4Pf49fYMSK; Tue, 25 Oct 2022 05:40:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD033812B1;
	Tue, 25 Oct 2022 05:40:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD033812B1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A91391BF329
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 05:40:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 81E3F401E8
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 05:40:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 81E3F401E8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eekjPReNshwf for <buildroot@lists.busybox.net>;
 Tue, 25 Oct 2022 05:40:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C793A40154
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C793A40154
 for <buildroot@buildroot.org>; Tue, 25 Oct 2022 05:40:04 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0CB80240012
 for <buildroot@buildroot.org>; Tue, 25 Oct 2022 05:40:01 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Tue, 25 Oct 2022 05:40:01 -0000
Message-Id: <20221025054008.81E3F401E8@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1666676402; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=TjS+jPsdovUOd9uKnGgwhYhGS/mECwn4LjqY0JIJZt0=;
 b=IB8pTqBwcGCI+NG29oU8fTDZ9K7Zd3CpaYueUirwsM0z3AOoMmh0MzFvu6kW2WC3c2SRW2
 90tg6R0770Qi1RXkJodnRokoKoJxQGOdgW/zfdhiHQNjBtIoSSuLluhhwZzHw7Zf9wrEkh
 D3iQTkl/28nvgQ2z5QYE1JJ9lY+E3j8BzFLOK4IEPHs5pfr81QCPQBd7nTB3QsRXhxFQrY
 72NVyQyBuzRJ6nr1MWr4DmE45UBLi4zufgYptcQxOjMJk0/NTX8RtB858YnsDVj3/vYEAs
 RY7mvhrmSPINbI+ILN47CiURDp2FjZQRYJQ38iQr5LSUSQmv5QB+H4wZUvIyWQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=IB8pTqBw
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-10-24
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

Autobuild statistics for 2022-10-24
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  | 12  |  0  |  1  | 13  |
  2022.08.x  | 17  | 22  |  0  | 39  |
    master   | 132 | 265 |  8  | 405 |

Classification of failures by reason for master
-----------------------------------------------

   host-bootgen-xilinx_v2022.2 | 21
                   libnss-3.84 | 13
                      crun-1.5 | 11
            igd2-for-linux-2.1 | 11
                 systemd-250.4 | 11
glibc-2.36-44-g2628500f5dff... | 10
            host-binutils-2.38 | 10
        host-f2fs-tools-1.15.0 | 10
        host-sentry-cli-1.59.0 | 9 
                 sysvinit-2.99 | 9 
                        brltty | 8 
                      xz-5.2.7 | 7 
                host-go-1.19.1 | 6 
               libcodec2-1.0.5 | 6 
            btrfs-progs-5.16.2 | 5 
              host-rust-1.64.0 | 5 
              libarchive-3.6.1 | 5 
                       unknown | 5 
                 dash-0.5.11.5 | 4 
host-pahole-73383b3a39afe86... | 4 
                   linux-6.0.1 | 4 
dahdi-linux-5c840cf43838e06... | 3 
                  gensio-2.5.5 | 3 
              libgcrypt-1.10.1 | 3 
             libpciaccess-0.17 | 3 
                linuxptp-3.1.1 | 3 
                  autofs-5.1.8 | 2 
                elfutils-0.186 | 2 
                gerbera-1.10.0 | 2 
            host-binutils-2.39 | 2 
               libcap-ng-0.8.3 | 2 
                libglvnd-1.4.0 | 2 
             libgpg-error-1.45 | 2 
                     mtd-2.1.3 | 2 
toolchain-external-codescap... | 2 
/home/buildroot/autobuild/i... | 1 
/home/buildroot/autobuild/i... | 1 
                     ace-7.0.6 | 1 
                  acpid-2.0.33 | 1 
                acpitool-0.5.1 | 1 
                apparmor-3.0.4 | 1 
             batman-adv-2021.4 | 1 
  binutils-arc-2020.09-release | 1 
                  boost-1.80.0 | 1 
                  cairo-1.16.0 | 1 
casync-4ad9bcb94bc83ff36cfc... | 1 
                 coreutils-9.1 | 1 
                 dmalloc-5.6.5 | 1 
           docker-cli-20.10.19 | 1 
              dropbear-2022.82 | 1 
        edk2-edk2-stable202102 | 1 
                     efivar-38 | 1 
                  ffmpeg-4.4.3 | 1 
             fontconfig-2.13.1 | 1 
       freeradius-client-1.1.7 | 1 
       freeradius-server-3.2.0 | 1 
fs/cpio/cpio.mk:117: /tmp/i... | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
  gobject-introspection-1.72.0 | 1 
            host-binutils-2.37 | 1 
         host-gcc-final-10.4.0 | 1 
         host-gcc-final-11.3.0 | 1 
host-spirv-llvm-translator-... | 1 
            igh-ethercat-1.5.2 | 1 
                  jack2-1.9.20 | 1 
      libabseil-cpp-20220623.1 | 1 
libcamera-ba6435930f08e802c... | 1 
               libdcadec-0.2.0 | 1 
               libglib2-2.72.3 | 1 
                   libqb-2.0.6 | 1 
                libzlib-1.2.12 | 1 
               lightning-2.1.3 | 1 
                   linux-tools | 1 
        ltp-testsuite-20220930 | 1 
                    lxc-4.0.12 | 1 
               mariadb-10.3.36 | 1 
                 mesa3d-22.1.6 | 1 
                  netsurf-3.10 | 1 
              open62541-v1.3.3 | 1 
                opencv3-3.4.17 | 1 
               openpgm-5-3-128 | 1 
                 openssh-9.1p1 | 1 
                   perl-5.34.1 | 1 
                    php-8.1.11 | 1 
pistache-3ec9d7c4f8b828fdd3... | 1 
              procps-ng-3.3.17 | 1 
                proftpd-1.3.6e | 1 
         python-greenlet-1.1.2 | 1 
                    qemu-7.1.0 | 1 
            quickjs-2021-03-27 | 1 
     s6-portable-utils-2.2.3.2 | 1 
                    sdl-1.2.15 | 1 
             stress-ng-0.13.05 | 1 
             uccp420wlan-6.9.1 | 1 
                 uclibc-1.0.42 | 1 
uqmi-0a19b5b77140465c29e2af... | 1 
                 wolfssl-5.5.1 | 1 
                    zeek-4.1.1 | 1 
                 zlib-ng-2.0.6 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/4b1867d9912af2b5f5132352efa6e5d86ff62fda |     
    m68k     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/23eb733c9212149715c4f022045735b5ccbb3455 |     
   x86_64    |           ace-7.0.6            | NOK | http://autobuild.buildroot.net/results/9027735ccc3ecc9bd9b084d284dcf18f19fc5900 |     
   mips64    |          acpid-2.0.33          | NOK | http://autobuild.buildroot.net/results/6f2cd92b9a4bd0fdbc62c29a80fa13743e1fec46 | ORPH
powerpc64le  |         acpitool-0.5.1         | NOK | http://autobuild.buildroot.net/results/1b74f37533b253c0d7e6e471825de8b44770134c |     
   arceb     |         apparmor-3.0.4         | NOK | http://autobuild.buildroot.net/results/ca71539b6c5989d71975f09f45bd34118c23ac26 |     
 microblaze  |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/4aa59f961081cf65331baca7c132923000d3c7b1 |     
   mips64    |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/51965b6ae0e956bd53bf8785ecc1529d59a9b332 |     
powerpc64le  |       batman-adv-2021.4        | NOK | http://autobuild.buildroot.net/results/174bddb2b4b5aba1d23b9fcd5dfbec57c2cee271 |     
   arceb     |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/351723ea2ef57da67404dcbd54c754d4b85a1cf8 |     
   arceb     |          boost-1.80.0          | NOK | http://autobuild.buildroot.net/results/35494960c1dfc3385b92c1d17630d6b4f115a0a5 |     
   x86_64    |             brltty             | TIM | http://autobuild.buildroot.net/results/7aa10ee3b1a70b74bfa3db88bc441a02634d0094 |     
    m68k     |             brltty             | TIM | http://autobuild.buildroot.net/results/d24dd9da1d82eaf2256ac3cd2e1eff02dc86f519 |     
powerpc64le  |             brltty             | TIM | http://autobuild.buildroot.net/results/d740119cf7483532c6183f2b64e57b28f21e08fe |     
   nios2     |             brltty             | TIM | http://autobuild.buildroot.net/results/7554066df42f4c20efaf64ee709fc47e6647b2c2 |     
powerpc64le  |             brltty             | TIM | http://autobuild.buildroot.net/results/d90e449e44e6f1e57331db753bc8281a6655db47 |     
    i686     |             brltty             | TIM | http://autobuild.buildroot.net/results/d9ea1e55697063e212d406af172759b336e095ed |     
   nios2     |             brltty             | TIM | http://autobuild.buildroot.net/results/685d2ce53d25c7771eafaf7293e8c7389241c12e |     
   nios2     |             brltty             | TIM | http://autobuild.buildroot.net/results/88ddc90d6134f64bc4f036bac68fa08576a353c9 |     
    or1k     |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/b9d67bb2c639096fa005bc09f48fba4f9e74d7af | ORPH
  sparc64    |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/d0f0dea2138371c13e4e2b1ce39beef1a2f7375c | ORPH
   mips64    |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/1c5ab8a4e2f719aa843390020ad19df62567c4c3 | ORPH
   sh4eb     |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/4ab0773e5235141aa9527cebb3d1d041f15d3fa6 | ORPH
    or1k     |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/0eafc50e756610186c06c8c4d4989f46fb2574b4 | ORPH
    or1k     |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/e783332cd955b4133c1550ed8a3db5fba021a89d |     
   mipsel    | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/55388bffd0eef1fd2661d22ef383a9947f6d2816 |     
    sh4      |         coreutils-9.1          | NOK | http://autobuild.buildroot.net/results/a07f2f34359b2c24a2e7ea0bbbdf2edfd429dbfc | ORPH
microblazeel |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/2aac3c26f7141f8e4f8ca7456fb136ac13389d63 |     
  mips64el   |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/27b08e3904e0249bad7ce05a191fbea4e3fd62d4 |     
   mips64    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/1af5bd7324755d49ca7e01f1923eda5a77e0d7da |     
   sh4eb     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/c987304527650f7aaf32b76046634b0b5e3f8e75 |     
    arm      |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/2db14c0c83873d29c418af1a2462faba57dfb220 |     
  aarch64    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/f9a9e613966ce90cc755cd34158c63ec641ee364 |     
    arm      |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/9888958eeb75352a80b27866a4da9bd1530a48f3 |     
    mips     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/aed876e9c62ed12eeedcc6473fc02a06353528a6 |     
  aarch64    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/b34fb6d70c583885f243436a3965b855785acbb4 |     
    i686     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/d2a309a4e3b28c2f75b15b59b86b2238065a0fd7 |     
  riscv64    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/fd1b41edb32536905611688de611ecad92b5855a |     
   armeb     | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/4f959766f8f202821a1ee5e33bb801b6b922f41d |     
    or1k     | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/c0efc57acbf11b473086c492e4c7666ba2de2e17 |     
  aarch64    | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/a39db8c6c8a8f2d7fc46abf31c85dc1293fb6755 |     
    i686     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/330e4ea817fcc4a3fc2cde8d9b753ad4eefe0e82 | ORPH
   xtensa    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/b895476fa94f5e7f92aaef94093ea16c6a535cc6 | ORPH
   sh4eb     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/7cc108963022f14c23b993414a8e5b19dbe34489 | ORPH
    sh4a     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/9f8e826227031d8a3a0771586db86d879aabb96c | ORPH
  powerpc    |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/2cfd0a2103e7a302d0369e5cd83f8da18f1b1b9d | ORPH
   x86_64    |      docker-cli-20.10.19       | NOK | http://autobuild.buildroot.net/results/54847564cf80771268189c13d9385692a7c2d45f |     
  riscv64    |        dropbear-2022.82        | NOK | http://autobuild.buildroot.net/results/ecb444fcb3f457319a4aee90b851638c4be17771 |     
   x86_64    |     edk2-edk2-stable202102     | NOK | http://autobuild.buildroot.net/results/4ce6ebce82a5058790bccbf9e8e92ce2c36bda58 |     
    i686     |           efivar-38            | NOK | http://autobuild.buildroot.net/results/a8c5d9cb30b4df1f90d46d886cb1d095daa8517b |     
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/9d43aaaeec92b6cf12b62b415b882f22649bc69b | ORPH
   arceb     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/92e41240564e5f2dd8418a28bb6018356b8f0a9c | ORPH
  sparc64    |          ffmpeg-4.4.3          | NOK | http://autobuild.buildroot.net/results/5708e820dbc95b212261e44a013725339da88913 |     
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/b726d3ceea6180748d75bf467b4542f509862057 | ORPH
  riscv64    |    freeradius-client-1.1.7     | NOK | http://autobuild.buildroot.net/results/b342ced57101b8e39063f5d3dc193cbf1ccd6cd4 |     
powerpc64le  |    freeradius-server-3.2.0     | NOK | http://autobuild.buildroot.net/results/a3f562f237a74093bd59f00dcb48514b4f3ff5f9 |     
    m68k     | fs/cpio/cpio.mk:117: /tmp/i... | NOK | http://autobuild.buildroot.net/results/7c35af274ac5c35c9d453a607d79bea8abcbc680 |     
   s390x     | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/0e4890f585236099b1e69f349d06aca399554dec |     
 powerpc64   | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/b087c5fb20434f7b372a7176bf7591f8a543da1d |     
    m68k     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/c932385c9de760d2fcaed072bb244ae1d4ded09f |     
  mips64el   |          gensio-2.5.5          | NOK | http://autobuild.buildroot.net/results/b1f603733b63e505e859311beb66be644dee6fb7 |     
 microblaze  |          gensio-2.5.5          | NOK | http://autobuild.buildroot.net/results/83721b2d66739ca0b62e71854960ea7aea68f5d2 |     
powerpc64le  |          gensio-2.5.5          | NOK | http://autobuild.buildroot.net/results/8fa9a466f2fde9b659a97932100920f4156fc8e6 |     
   nios2     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/5971a925a661974720e343bdf87f25bea600fa28 |     
   nios2     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/363914df8a1962217cbb503255dd725787f73393 |     
microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/74f37d64d24a61ab2c1f2b75df783676cfde0f71 |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/15a1c54b919ec7f23a1f734f6673b9376aae6ac5 |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/e2eb295fe84b9a9758c0f2f7731205fd2cc40830 |     
    sh4a     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/f4d5671b256f0148454215e2679cfdc4efc14eb5 |     
microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/b47fb6908e6cc83464bd8696786b7d51b4c3d25d |     
   mipsel    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/44a751037c840ae53f12f4550ca4955bdb47488a |     
 microblaze  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/889d956f0c8d2b392a2220834e5e2070a9e8c72e |     
 microblaze  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/229914e2c78f247dccd6e98dabd446cc85a5dded |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/019123e25a7e0de62e34dac5f47e602c3b28225d |     
   arceb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/4a3b4a5ea19e13c39c0726fc277d36c77d38e2de |     
   s390x     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/9ad60bcd2351b5fd8d5df0de30300847b6f377f5 | ORPH
   mips64    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/2875216e8fb92d01e48acbf181bb9c1514ded713 |     
 aarch64_be  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/4d426459bf121befd75f7845927fea7aab04cfe6 |     
  powerpc    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/1608af0ee967ceef9a802d8e56765d755663ff9a |     
    m68k     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/c541f9a55c6defb02bb6d951702b851256405c0f |     
 aarch64_be  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/287374b57e301c751f5ff963f5880e723e3df20a |     
    i486     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/bf5c7c933698d213a9dda0aab4026897e92a4dc1 |     
    or1k     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/c28cbb9af212bde7df1157415c22f0dfe4eb2c2d |     
    m68k     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/7ed05682a699380c405a923a934445de35165735 |     
   x86_64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/829ba5bb9263ced2081ab467a0be2c09a1a0e36c |     
  aarch64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/3d1cac0c8b9e607b8314561e3c8d256fad334d1d |     
  aarch64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/2c976e60db81a29206cfabf7818c9a2eb7ecd071 |     
   mipsel    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/b82527fed7f18931060bd12253e4bbcabbfc2ab1 |     
  mips64el   |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/f31a87f1ec6f103eeadec6789ece3517f64121fb |     
 powerpc64   |  host-bootgen-xilinx_v2022.2   | NOK | http://autobuild.buildroot.net/results/0e4db35e2af74da72a9c3d326ee37c984eaff03b |     
    mips     |  host-bootgen-xilinx_v2022.2   | NOK | http://autobuild.buildroot.net/results/dd0b0c562cab2815f13da90fa71ab8e1707424cd |     
    arc      |  host-bootgen-xilinx_v2022.2   | NOK | http://autobuild.buildroot.net/results/c30e851f3185b373febb6e5429432e86eba1ba8b |     
 microblaze  |  host-bootgen-xilinx_v2022.2   | NOK | http://autobuild.buildroot.net/results/797139d4bb2c28c691cf6ed65fe222490fce49db |     
    arm      |  host-bootgen-xilinx_v2022.2   | NOK | http://autobuild.buildroot.net/results/41b3d6cd51d2c015f0d5fc935385b9237f526e01 |     
 microblaze  |  host-bootgen-xilinx_v2022.2   | NOK | http://autobuild.buildroot.net/results/4866e57e2c06446faee71747c3773622b035e7d9 |     
  sparc64    |  host-bootgen-xilinx_v2022.2   | NOK | http://autobuild.buildroot.net/results/dcb4ae27f2977505dc1558e109d5b132e7d78f78 |     
   x86_64    |  host-bootgen-xilinx_v2022.2   | NOK | http://autobuild.buildroot.net/results/0e8dd39145cd4e09282e4349221f9d9e82a4406f |     
   mips64    |  host-bootgen-xilinx_v2022.2   | NOK | http://autobuild.buildroot.net/results/7eaaf1d633e9f98370afc1d3635c29e76785be63 |     
    m68k     |  host-bootgen-xilinx_v2022.2   | NOK | http://autobuild.buildroot.net/results/4c5aae92b3c5352d0faebcaf9163781778bb185f |     
   mipsel    |  host-bootgen-xilinx_v2022.2   | NOK | http://autobuild.buildroot.net/results/08cdbca41a03cf87d240f90286fa79541c1fd654 |     
   xtensa    |  host-bootgen-xilinx_v2022.2   | NOK | http://autobuild.buildroot.net/results/3380fb29450e10839df77f357056789baa8c4974 |     
  sparc64    |  host-bootgen-xilinx_v2022.2   | NOK | http://autobuild.buildroot.net/results/44398e17f0b7f81893130c62618895e882aa7e16 |     
   armeb     |  host-bootgen-xilinx_v2022.2   | NOK | http://autobuild.buildroot.net/results/de4a80951d485066ed846daa07b1d1cdc7bf667f |     
   arceb     |  host-bootgen-xilinx_v2022.2   | NOK | http://autobuild.buildroot.net/results/759f66dcc7041132c60491a15bee4f986c0fdb01 |     
  riscv32    |  host-bootgen-xilinx_v2022.2   | NOK | http://autobuild.buildroot.net/results/24686d256784bad7b85a14a1630e7ef020e1b914 |     
    arc      |  host-bootgen-xilinx_v2022.2   | NOK | http://autobuild.buildroot.net/results/f0022becdaf028f3e90d6f4533c148da9d9c2086 |     
   s390x     |  host-bootgen-xilinx_v2022.2   | NOK | http://autobuild.buildroot.net/results/b19198b02cdabd3c1e74c955d3a01595bccb03c6 |     
powerpc64le  |  host-bootgen-xilinx_v2022.2   | NOK | http://autobuild.buildroot.net/results/3db2992c7ad005f6061dc71d5de0b2f6257d71ba |     
  powerpc    |  host-bootgen-xilinx_v2022.2   | NOK | http://autobuild.buildroot.net/results/8ed08cd95101f945721ee346a0a4435efe66abc7 |     
 aarch64_be  |  host-bootgen-xilinx_v2022.2   | NOK | http://autobuild.buildroot.net/results/a568d8653b7e4b63f3398eeeaa56819c37a0cd6a |     
 powerpc64   |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/4e5a0a4ab583dca5c37a0b7e331127e424ce2562 |     
   x86_64    |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/fa2fa8b5d3fa2931cc3367d46f5135ea02fd47b1 |     
   x86_64    |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/dc8a8552440c60a27031f26c123760f0a7b7238f |     
  powerpc    |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/93495599068e5116cc5557adbe6ddacac7975422 |     
    i586     |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/a6d812846727c794aee9f262eb4d049db93f2ccf |     
 microblaze  |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/9cd8864d5f8dcb5637b4e47ada4f7d9520f226b4 |     
  riscv32    |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/cb440fee7d39d31696de0b87ef4c78d533c316a2 |     
   xtensa    |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/065cdfacb0a9f8a11dc250a5b58e4180989d7957 |     
  riscv32    |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/8d0b4a79ca5ab34af9b0bf783f4c3757150f62bd |     
 aarch64_be  |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/296ca4bc2e786301b75704484acfa5bd30a41656 |     
   mipsel    |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/35b220314754ae7ef9c9055c2518a5637c0035b8 |     
   s390x     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/2fd87a1f760d32ad7a9de04253abd0659e43f7c5 |     
    i686     |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/f7f423ae1b7772b01da86a2491052324bdd76692 |     
   mips64    |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/9034a76ee59141ac22924f7267a34946ead0171a |     
  aarch64    |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/429eaa7be5171fecffd35d49f3e54a0842edda35 |     
powerpc64le  |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/ebfd51c8cee8a02f31d6a9235e9335684abab211 |     
    i686     |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/0e78500e9efedc490f6ee1c4ee8cea2f98ab3039 |     
    i686     |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/5837eb9d4d6a9a6b883552eaa0b4424dc04ee6d0 |     
 aarch64_be  | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/d2984117affdc3d9eaf4d9a05a1be0e0f44167d1 |     
    arm      | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/f00b33a8c236983b2f50593fb4f7c12564016930 |     
  riscv32    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/d5c317f61f4000ad726b5f1ebbfa3454921deb64 |     
 microblaze  | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/32af62492de4b8751e7d0956ae1ba32b9360dee5 |     
   x86_64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/2a7f0adbce46629bde631ba74bb28adeee0c1351 |     
    arm      |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/a5979d1127879f6fd5c0e74fae4c85bfcdcf6fb2 |     
powerpc64le  |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/eb434afd826e48f76f18f54b821b0a883a01ada7 |     
    mips     |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/bf3990d76834551f42a8623458564cee4b9956c0 |     
    i686     |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/bd472ce0aa085f757fb3619b403fe195e13a87a7 |     
 aarch64_be  |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/6b1c7dfecfebcf7192776380280a4c1e8a7b586c |     
    sh4a     |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/1f4d84e8aed2c653900d4468b41d767714174f55 |     
    arc      |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/9e2987f98db50e3115d298ec48e191905f548645 |     
   x86_64    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/b13974e3697310e386d579af22809fc2ee61e09f |     
microblazeel |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/68723c3da50c18105a1ea526516d1b2cb10e8a3d |     
  mips64el   |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/87a0a9cdc52ecc74b80bab68721b5d0b06d2fe54 |     
  aarch64    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/a6c6af7ed9b378d6726209a26e8d94aecc3186d7 |     
 powerpc64   |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/a5c0787c81e1a51a79cd60bb66bc5bf5a2b4b74a |     
microblazeel |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/a44249757668827d49980cdbd1b6a5b34744d59b |     
   armeb     | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/364449429e91c2cd93feaf5d8832554fd18b1d2b | ORPH
  riscv64    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/a6f381137e6e35459c352ed598821610f8531252 |     
   s390x     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/141d14efc2b097ef40a1f913b694cce7fda63901 |     
   mipsel    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/e336116c073dfa6f2294b5c7096bcb661168395f |     
    or1k     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/0473b16b78eeabbc0e5a1681a5dcfb432a5460b5 |     
   mipsel    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/ac053992977bc449e1529bcbdcc5bc5572e441b6 |     
  mips64el   |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/c943b9609ef3bb1a310bbf8a22bd5b995fc94353 |     
   x86_64    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/1aba121e41d432277a52815030bc6ab9666d56d4 |     
    arm      |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/caeb4b79db2ce29779308c526af20ac7c4fb6ada |     
   x86_64    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/ca16a3daab3ece0374030e5a0386c51a8bb707c9 |     
powerpc64le  |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/88b63734e5065524568b285c4f721ec2796457ca |     
   sparc     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/4cb42ced664bef29321c48d7f3a4a0e435b4f04e |     
 aarch64_be  |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/5614ed4132684dcbd35cf09385c267417a5f471b |     
    m68k     |          jack2-1.9.20          | NOK | http://autobuild.buildroot.net/results/68ad7668716388ed5c48a67db6e0ef23ef83e116 |     
  mips64el   |    libabseil-cpp-20220623.1    | NOK | http://autobuild.buildroot.net/results/f8c1af24d59fad49d018c2137524f38d38ff967b |     
    mips     |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/75b6a996c49a38b71aa3695dc5bfeec12f1197ba |     
   nios2     |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/1b492799c9db98e6f47d04efb6127ea7112d8c49 |     
  sparc64    |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/3e439548155e83d1a345a4425334a140f23c04e8 |     
   mips64    |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/c806a48d476cf706ca1895a10bb796185e8ec750 |     
 aarch64_be  |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/bbb3908599feb8dc907c9c2f7240d4222067c87b |     
   sparc     | libcamera-ba6435930f08e802c... | NOK | http://autobuild.buildroot.net/results/fad0e82946a236b2c5f14bb06f9eced93e0a0299 |     
    or1k     |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/a63d1fd00e62b067d31fe56a2ef32b0b48740234 |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/f08a7f2e318804317476cf688b1c386e7b24cab6 |     
microblazeel |        libcodec2-1.0.5         | NOK | http://autobuild.buildroot.net/results/3e8880bbff7d42985d4c4d86d49dd5e6b9020050 |     
    m68k     |        libcodec2-1.0.5         | NOK | http://autobuild.buildroot.net/results/95016bfec95d40f72eab2e92fba9853f665d13fb |     
   arceb     |        libcodec2-1.0.5         | NOK | http://autobuild.buildroot.net/results/d6cad256f5a9b726ec18fa09b809f40906855ad2 |     
 powerpc64   |        libcodec2-1.0.5         | NOK | http://autobuild.buildroot.net/results/02975a99e68e55472dbb10ff00be16ccbe5d1f29 |     
 powerpc64   |        libcodec2-1.0.5         | NOK | http://autobuild.buildroot.net/results/0c11c5ade6117ec5b1f1d53fac1925b095ba4052 |     
   armeb     |        libcodec2-1.0.5         | NOK | http://autobuild.buildroot.net/results/d9a23dd8e01d141217d884617b8a0bab5cea3262 |     
   armeb     |        libdcadec-0.2.0         | NOK | http://autobuild.buildroot.net/results/1c09c64ba1951a33dc92b49c86c955437cc0c41b |     
   armeb     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/47cee2ea21bbf2117e30b2a7dacc4f2674e134a0 | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/6658af360cffb28652ddb93362d368d02e36c662 | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/fe622168cbb73cddb73aec1bb5893018045b5850 | ORPH
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/b9338c4b72012f67df0d412b75c051113e4c9358 |     
    arm      |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/2e6c5a7b1239e81c36fcdec94dbe4eabb3187202 | ORPH
    m68k     |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/b422e3610c76b7ea1e2061fe9ac57dee55f6dc54 | ORPH
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/cfc9584ee06f18bf91ff3dd5406d711fa21fe702 | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/897e975312929172443132b472110b9148dc4cae | ORPH
 aarch64_be  |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/2c3e7b0d08cbb3ec062cc4c852fc54759952c65a |     
 powerpc64   |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/5d84c74cc399c2c08481d2ebf982161cb459b254 |     
    arc      |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/338940364d5085eb8eed8d26fe63ba071717d198 |     
  aarch64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/5e8e8f4e7c0f90ee7137183b1eb0b873ac09586c |     
   x86_64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/6c2571b602a7b9b836faeef237dd182b88bb2915 |     
  sparc64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/434c58eed5eb80dd75b465c75d586d9b61297a76 |     
 aarch64_be  |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/6517f518d887921f5eebeb2b087c56363cec5222 |     
   armeb     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/ad895b98f132bd7c8bc06866a6a3c3d60add920a |     
   nios2     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/441a5d95cda42a7e3e9227eb70a27a2a3852d02e |     
 microblaze  |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/75141ef352d42d22a4f09ab3190ad22a301cd7f5 |     
   mips64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/e9163f9d3776fc7fe9aa2324471773d1b2145a20 |     
  aarch64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/c628ae62b900172c26839ff80be50d293a1ac0bd |     
    m68k     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/922101a2b5626810b197d656446a0b3257d1ab3c |     
   s390x     |       libpciaccess-0.17        | NOK | http://autobuild.buildroot.net/results/30d7c3522ee6883568d8b68b81ad77a1d95b61d3 |     
   arceb     |       libpciaccess-0.17        | NOK | http://autobuild.buildroot.net/results/d681b61f60f77d61aa54c2470dcf512499f79ab9 |     
   xtensa    |       libpciaccess-0.17        | NOK | http://autobuild.buildroot.net/results/ea72df7f71d15ae7ead41f038a1c3cf0b53854a1 |     
  powerpc    |          libqb-2.0.6           | NOK | http://autobuild.buildroot.net/results/b91de249553053f33b9bed77ee0cd340f720f41e |     
   mips64    |         libzlib-1.2.12         | NOK | http://autobuild.buildroot.net/results/96ab21bfe7a61fb1658d8d117501b2ce328b5b84 | ORPH
   x86_64    |        lightning-2.1.3         | NOK | http://autobuild.buildroot.net/results/72a977275c00c184e1d5e6ac35f50faf0d159476 |     
  mips64el   |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/58ecbfb1374f0f14f83d153af4c29ab7d0dde8e8 | ORPH
    sh4a     |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/6bc5d11c10825ec1b6902a316ccb171b1b52c34d | ORPH
  riscv64    |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/059145c8b651b0f93db8235c88ac2cd19aae362c | ORPH
  powerpc    |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/e517bcb0a90d6603f824a2e6c4a89440dcb00224 | ORPH
   nios2     |          linux-tools           | NOK | http://autobuild.buildroot.net/results/74ff4beaa1a6faf59b622846bffd69482d45b84c | ORPH
   armeb     |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/0b799b5d44c410b9ac6fd073edb89c77369dda55 |     
 microblaze  |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/32d0a02ac4f01046ab4bb72c7705728f0499e044 |     
powerpc64le  |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/f23b60ee02a942d1db02c58af90d6549334c2dcb |     
  sparc64    |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/1b7af48c1e4c3753edd9c86b41f119054750e34d |     
   nios2     |           lxc-4.0.12           | NOK | http://autobuild.buildroot.net/results/d4ee8e839f9473787675bf190a60360e6ec03904 |     
   sparc     |        mariadb-10.3.36         | NOK | http://autobuild.buildroot.net/results/6012c0045938d8c69eeeaeb6c5dc8c0bff6a7356 | ORPH
   xtensa    |         mesa3d-22.1.6          | NOK | http://autobuild.buildroot.net/results/7c5259c365f958b6850345d7c5b8a4b20449e8bc |     
  riscv32    |           mtd-2.1.3            | NOK | http://autobuild.buildroot.net/results/d74a430daa787685f19cdb8ee86a5c7414b78d86 |     
  mips64el   |           mtd-2.1.3            | NOK | http://autobuild.buildroot.net/results/4d4861310b4253bf6c770ac186a2f6f67838dd5c |     
powerpc64le  |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/769a513983beb6fa4cf322e9ac62172329b83e80 |     
   nios2     |        open62541-v1.3.3        | NOK | http://autobuild.buildroot.net/results/c20d359de137f9d2ca25d4a9303c0cd8413a3d22 | ORPH
  sparc64    |         opencv3-3.4.17         | NOK | http://autobuild.buildroot.net/results/288372dba2046535fb17c2277170712600094ca7 |     
    or1k     |        openpgm-5-3-128         | NOK | http://autobuild.buildroot.net/results/69527235ac234fbe4fc8586792148c57c8163989 |     
    m68k     |         openssh-9.1p1          | NOK | http://autobuild.buildroot.net/results/73a6ba0b1f28fd8bdb0d3da83172dbe20764f00a | ORPH
   armeb     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/ffdce0e57b7472488e8c76ee92d1b89fe10091f5 |     
   sh4aeb    |           php-8.1.11           | NOK | http://autobuild.buildroot.net/results/56b537e9a56a0c6bae6da36e2ff2a6497bc2bc6a |     
    arm      | pistache-3ec9d7c4f8b828fdd3... | NOK | http://autobuild.buildroot.net/results/f26badb344ee9188b3c51fbaeb5e8adb9d339136 | ORPH
 microblaze  |        procps-ng-3.3.17        | NOK | http://autobuild.buildroot.net/results/9b6bd17d67d29c334af98a37fcb48d52a07d2107 | ORPH
   sparc     |         proftpd-1.3.6e         | NOK | http://autobuild.buildroot.net/results/8a2057f8bb607d1aaefc9ef063e960aecfd7a360 |     
  mips64el   |     python-greenlet-1.1.2      | NOK | http://autobuild.buildroot.net/results/a3a12e54be72bcce060722dfe1f2c9eb593199ab |     
 powerpc64   |           qemu-7.1.0           | NOK | http://autobuild.buildroot.net/results/20ba5c8832b9263d9857e101b5e6bcaac6ba3135 |     
    or1k     |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/33a5d63634e1989572d137ad6e23b6192489345e |     
 microblaze  |   s6-portable-utils-2.2.3.2    | NOK | http://autobuild.buildroot.net/results/81423069ba732cee18948612d75e0e7b2ca54621 |     
   sh4eb     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/abfec3a7faec737272ec843fe853e1d22e3700ea | ORPH
  sparc64    |       stress-ng-0.13.05        | NOK | http://autobuild.buildroot.net/results/ba6e5d9c70d05168b681bb98c937f8882a8c9578 |     
    sh4      |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/ad70d923fcb71cd15fc7edc2c51f7e19a9bc66a6 |     
   x86_64    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/d912439be25859b22c63d2512d17aa480640c239 |     
  sparc64    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/ff5df966f0ea7d2c3d1eba1c397df7c51a2701fa |     
   nios2     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/a26381a8da49ce1e3fe471e72c6f8fb8955e8b30 |     
   nios2     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/e5f14a8a61f5e8e88e94c0d0e5d441b5430836f1 |     
  mips64el   |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/6c8a68d29038bfad94191a73dcb8bcafc0a2cf9b |     
   sh4aeb    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/ddd4141e690aa165a9768b15d6571d1623cafd3d |     
   mips64    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/6a4221c9ce9b88b21c56eb81edf10737ffe33608 |     
 aarch64_be  |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/4b34698b596c2b5d65903088ae1e7f4ae019b465 |     
   armeb     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/cef59241d8586cca2b88c95ffc42c67b6bf9bcbb |     
   nios2     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/b809788e1f8feffdf0778a1576efd07b7d0b08f0 |     
   arceb     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/61fe8e63577f2201dedc59192786c6a8438ac084 | ORPH
   mips64    |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/6075e5b722aa3cf02c8ff3c2124ea09a333d4fb0 | ORPH
   s390x     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/62800b8386f20ee17301d96748d738c1fc93185e | ORPH
  aarch64    |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/3d2bcc2eabd52a8cf5e4b28a3ba8187ba8f23aae | ORPH
  mips64el   |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/18478399be1619fe857387ea4fcc853674d18cde | ORPH
   armeb     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/63da902d42e2851e5860047eaf542eaa66a2b17a | ORPH
   s390x     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/a3bbb57630f5f6cda42fd30a4abc849785d94691 | ORPH
 aarch64_be  |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/0dbfde06dfd01efa33584cfdd7f056e17db651f1 | ORPH
  sparc64    |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/0e1471a4509a55b2418b9fab994a3eee673b0ae0 | ORPH
   mipsel    | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/f7283b24335f6873ee4584bd134bd034cafcd9ae | ORPH
   mipsel    | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/50f92affe157af7261a1e425d526be64ea22fa94 | ORPH
   sh4eb     |       uccp420wlan-6.9.1        | NOK | http://autobuild.buildroot.net/results/333aef73b5990b47e6c9c1b3e170e7c76302c5ae | ORPH
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/5271753fcc0269d22a0b11f89cf1b1da040f937f |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/2eda57d62a6cfcf4a1efc4410ebbbd93e4e99b07 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/febd86b73ee319caf40bf98a52ed953e35d642e4 |     
   armeb     |            unknown             | NOK | http://autobuild.buildroot.net/results/e5f2753f002425de96f40821bc90e967bef020ff |     
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.net/results/10bbbcdf1b40898140ed6db567cf7e5b2baba4a5 |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/139d393db5e4d5bf9db8e2a25a145e3e5c53c52e |     
    arc      | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/57218d72118b6331e99735596831e1671dfe6227 | ORPH
   armeb     |         wolfssl-5.5.1          | NOK | http://autobuild.buildroot.net/results/3c0325fe9a2007cb53ad553ed0743d003bb550b6 |     
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/090c70758f090bdf3206af31f8c1974b9cfd2f93 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/36661d7f3853dec651b6ac99642afce200b9361e | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/d65f9f6706fe396367addbbc57ef0181456061b8 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/f1a6be4a2936b67415817d37fa80d9b45680a23b | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/79bad7156a0f11d1f534d192616a85b8197b968e | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/ce848de38fdff7911788bf9232e409eb2ba64c86 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/46895fb6636372b23f968967041824323a185501 | ORPH
  mips64el   |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/908073808920d9c7f4f5b9dc56ebddf01d1c0f7b |     
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/46a97e5ebc5218f8d7decaaa67b53acf3f18516e | ORPH


Classification of failures by reason for 2022.02.x
--------------------------------------------------

                       libuwsc | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |            libuwsc             | TIM | http://autobuild.buildroot.net/results/c6ed54be2e8b3298927a7f431fe246656d58441b |     


Classification of failures by reason for 2022.08.x
--------------------------------------------------

                 linux-5.17.15 | 4 
host-pahole-73383b3a39afe86... | 2 
                 dc3dd-7.2.641 | 1 
                 dmalloc-5.6.5 | 1 
              erlang-22.3.4.22 | 1 
                gerbera-1.10.0 | 1 
                host-go-1.18.6 | 1 
              host-rust-1.62.0 | 1 
            igd2-for-linux-2.1 | 1 
               libdeflate-1.12 | 1 
                   libnss-3.81 | 1 
           linux-5.10.115-cip7 | 1 
                nodejs-16.17.1 | 1 
            openssh-legal-info | 1 
package/openssh/openssh.mk:... | 1 
                   perl-5.34.1 | 1 
                     php-8.1.9 | 1 
               xfsprogs-5.14.2 | 1 


Detail of failures for 2022.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/53a61cf4406570d23e10bc9b8fc43c2ce973a468 | ORPH
    i686     |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/4b32cc37bf8095d365836ae7eaf0279b37bfed34 | ORPH
   x86_64    |        erlang-22.3.4.22        | NOK | http://autobuild.buildroot.net/results/0f1d6aca5b0327815d3f1e08f0e4e8dd61efd08b |     
    arm      |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/5ca8fc75181b1da347b601665443ad1505a05985 |     
   mips64    |         host-go-1.18.6         | NOK | http://autobuild.buildroot.net/results/d0f0235848188c95198b45b53f644fb4bb7c6936 |     
    arm      | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/b18f05020bf9af82b142d00207a6243e9a8e94cb |     
microblazeel | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/f83062230c2fa148e82e1bf4980f5928e11aed1a |     
  powerpc    |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/c1fd0cf15cb4e793be737e27a8e3d7f0472e783e |     
 aarch64_be  |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/ff5c2e909d7d2d17bf569f3c95eab4f9adfe91eb |     
microblazeel |        libdeflate-1.12         | NOK | http://autobuild.buildroot.net/results/48175110072d8bde2a5ac70649ea453ef4f4ee2e |     
powerpc64le  |          libnss-3.81           | NOK | http://autobuild.buildroot.net/results/a4d4243be5e1a78e14d30ea1eb4d049e96c509b8 |     
 powerpc64   |      linux-5.10.115-cip7       | NOK | http://autobuild.buildroot.net/results/447d8fc83ef5d01ff306cf3fea9527b2212aeded | ORPH
   nios2     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/02928452171be3332a42f59d27f0e4fbe6e04734 | ORPH
    arm      |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/73289305bdf9feb20310aa707c22b3ff8afe2fa5 | ORPH
   armeb     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/c92d9e8714b89cfb4c898a802a9ae9422fff60d3 | ORPH
   nios2     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/88a324848838af4e2c2c9f4b3775a9daf49dc728 | ORPH
   mipsel    |         nodejs-16.17.1         | NOK | http://autobuild.buildroot.net/results/0e6ee80c77bcb77afe18410e8d9da93b738cb0a4 |     
 powerpc64   |       openssh-legal-info       | NOK | http://autobuild.buildroot.net/results/fbdfe4565fa34d62d9ceb30d330178370f78127c | ORPH
  aarch64    | package/openssh/openssh.mk:... | NOK | http://autobuild.buildroot.net/results/a9614a88f246deeb6680899e38b0257b5b878ee5 |     
    mips     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/4aa7b516e7b211ed88ee277b55a5bff952e3371e |     
  aarch64    |           php-8.1.9            | NOK | http://autobuild.buildroot.net/results/4ba838bb2fc711e7aed06a319bb151066945b41a |     
   nios2     |        xfsprogs-5.14.2         | NOK | http://autobuild.buildroot.net/results/b0b2784325d5550a13ff4e099525411b17984643 | ORPH


Gitlab CI results for 2022-10-24
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
 TestAarch64Pages64kGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3215701180  | ORPH 
      TestCpioDracutGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3215700904  | ORPH 
...ioDracutGlibcMergedUsr | https://gitlab.com/buildroot.org/buildroot/-/jobs/3215700906  | ORPH 
       TestCpioDracutMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3215700909  | ORPH 
...pioDracutMuslMergedUsr | https://gitlab.com/buildroot.org/buildroot/-/jobs/3215700911  | ORPH 
     TestCpioDracutUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3215700914  | ORPH 
...oDracutUclibcMergedUsr | https://gitlab.com/buildroot.org/buildroot/-/jobs/3215700916  | ORPH 
        TestDockerCompose | https://gitlab.com/buildroot.org/buildroot/-/jobs/3215700986  | ORPH 
             TestExecline | https://gitlab.com/buildroot.org/buildroot/-/jobs/3215700989  | ORPH 
...lx60UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3215701459  | ORPH 
...Xtensalx60UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3215701460  | ORPH 
   TestGdbHostGdbTarget9x | https://gitlab.com/buildroot.org/buildroot/-/jobs/3215700993  | ORPH 
   TestGdbHostGdbserver9x | https://gitlab.com/buildroot.org/buildroot/-/jobs/3215700995  | ORPH 
        TestGdbHostOnly9x | https://gitlab.com/buildroot.org/buildroot/-/jobs/3215700997  | ORPH 
TestUbootOpensslPkgConfig | https://gitlab.com/buildroot.org/buildroot/-/jobs/3215701175  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
