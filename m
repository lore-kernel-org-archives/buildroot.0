Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32722C4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 06:41:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 753984048F;
	Sun, 11 Dec 2022 06:41:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 753984048F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f7WlJTn5fx_R; Sun, 11 Dec 2022 06:41:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CDCBC4049A;
	Sun, 11 Dec 2022 06:41:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CDCBC4049A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 270ED1BF380
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 06:41:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 07A6481421
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 06:41:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 07A6481421
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F6zqC_xSnq2H for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 06:40:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CCF0F8141E
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CCF0F8141E
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 06:40:56 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id F4148E0003
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 06:40:53 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 06:40:53 -0000
Message-Id: <20221211064100.07A6481421@smtp1.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1670740854; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Nsiy3r1K2vr2BJ3iV+3R2LKoqsjDhe7vEhn7mdVVbRI=;
 b=Jr3VPkdHaS/WETD3ccRpD+/cGfTmD9Xw8hprwCmafa0a3+R4TUAC3Ep+mBl/U+2tajGF8i
 aBuMISX+r7GvwyhpchPJoraABbn1eVlxRmlCL6Hq12vLFd3yjWifFTEN8nzkBn3/oUXya2
 4qYXk7DlUp532OGqtQkTG5s+BK9vn7Zeg4lfBfqyF/10jaUbqisbRh61Vqx28voFgo7sIe
 TlVcEUagyKN6Q4D8y1J0vFKRDoHKgUcV5JP0BiCKbasRA8qBgmwYGhJL/adDZmHnn1IlL1
 ywB0MtRKJcmg+Oa162RmY+3pLWLjoITVTdPI/qpPy9oGH9jsdiMm3innBVc9zg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Jr3VPkdH
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-12-10
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

Autobuild statistics for 2022-12-10
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  7  |  4  |  0  | 11  |
  2022.08.x  | 25  | 15  |  0  | 40  |
    master   | 204 | 273 |  1  | 478 |

Classification of failures by reason for master
-----------------------------------------------

                   aubio-0.4.9 | 24
                  jack2-1.9.21 | 15
                  sscep-0.10.0 | 13
glibc-2.36-66-ga1dc0be03c9d... | 8 
                gerbera-1.10.0 | 7 
              host-pahole-1.24 | 7 
                      xz-5.2.7 | 7 
              host-rust-1.65.0 | 6 
                   linux-6.0.9 | 6 
                    norm-1.5.8 | 6 
               libglib2-2.72.3 | 5 
            python-bunch-1.0.1 | 5 
    python-cryptography-38.0.3 | 5 
                    bat-0.19.0 | 4 
            host-binutils-2.37 | 4 
                host-go-1.19.4 | 4 
                  netsurf-3.10 | 4 
                       unknown | 4 
                alsa-lib-1.2.8 | 3 
    host-python-greenlet-2.0.0 | 3 
         host-sentry-cli-2.8.0 | 3 
                libdnet-1.16.1 | 3 
              libgcrypt-1.10.1 | 3 
             lirc-tools-0.10.2 | 3 
          lttng-modules-2.13.7 | 3 
                   perl-5.34.1 | 3 
           python-bcrypt-4.0.1 | 3 
           python-numpy-1.23.4 | 3 
                    sdl-1.2.15 | 3 
                 wolfssl-5.5.3 | 3 
android-tools-4.2.2+git2013... | 2 
              dropbear-2022.83 | 2 
             fontconfig-2.13.1 | 2 
                     frr-8.3.1 | 2 
  gobject-introspection-1.72.0 | 2 
            host-binutils-2.38 | 2 
              host-delve-1.8.0 | 2 
          linux-5.10.145-cip17 | 2 
                mongodb-4.2.18 | 2 
                    opus-1.3.1 | 2 
           proxychains-ng-4.16 | 2 
         python-greenlet-2.0.0 | 2 
ulog-0389d243352255f6182326... | 2 
uqmi-0a19b5b77140465c29e2af... | 2 
               valgrind-3.19.0 | 2 
                     z3-4.11.2 | 2 
                  zabbix-5.4.9 | 2 
                     ace-7.0.6 | 1 
                  acpid-2.0.34 | 1 
               apcupsd-3.14.14 | 1 
azure-iot-sdk-c-LTS_07_2022... | 1 
                  boost-1.80.0 | 1 
                    brltty-6.5 | 1 
                  cairo-1.16.0 | 1 
               collectd-5.12.0 | 1 
            compiler-rt-11.1.0 | 1 
                      crun-1.5 | 1 
             dahdi-linux-3.2.0 | 1 
               dvdauthor-0.7.2 | 1 
                     efivar-38 | 1 
             f2fs-tools-1.15.0 | 1 
                  faad2-2.10.1 | 1 
               fftw-quad-3.3.8 | 1 
                   flann-1.9.2 | 1 
fs/f2fs/f2fs.mk:64: /tmp/in... | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
                 fwts-22.09.00 | 1 
 glslsandbox-player-2021.08.24 | 1 
             gnuradio-3.10.4.0 | 1 
         gobject-introspection | 1 
           heirloom-mailx-12.5 | 1 
         host-gcc-final-11.3.0 | 1 
    host-python-maturin-0.14.1 | 1 
host-spirv-llvm-translator-... | 1 
kvmtool-f77d646ba01d04be5aa... | 1 
                 lapack-3.10.1 | 1 
                   libao-1.2.0 | 1 
                libglvnd-1.4.0 | 1 
             libgpg-error-1.45 | 1 
               libgtk3-3.24.35 | 1 
                    libndp-1.8 | 1 
                  libnfc-1.8.0 | 1 
                   libnl-3.7.0 | 1 
                   libnss-3.85 | 1 
                librsvg-2.50.7 | 1 
              liquid-dsp-1.4.0 | 1 
               lpc32xxcdl-2.11 | 1 
        ltp-testsuite-20220930 | 1 
mali-driver-3d697de9bce8bc6... | 1 
              memcached-1.6.16 | 1 
                  mender-3.4.0 | 1 
                  ntp-4.2.8p15 | 1 
            ocf-linux-20171122 | 1 
              openjdk-17.0.2+8 | 1 
                python3-3.11.0 | 1 
                    qemu-7.1.0 | 1 
qt-webkit-kiosk-a7720e50f2b... | 1 
                      rauc-1.8 | 1 
rtl8192eu-1e15b6d451731bc4d... | 1 
                  scrypt-1.3.1 | 1 
              skalibs-2.12.0.1 | 1 
                 sudo-1.9.11p2 | 1 
                tealdeer-1.6.1 | 1 
toolchain-external-codescap... | 1 
              traceroute-2.1.0 | 1 
                   uhd-4.3.0.0 | 1 
           v4l2loopback-0.12.7 | 1 
                 wavemon-0.9.4 | 1 
                wtfutil-0.41.0 | 1 
                  xerces-3.2.4 | 1 
                  xvisor-0.3.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |           ace-7.0.6            | NOK | http://autobuild.buildroot.net/results/4fb139b639280b852b0813861d37f44644053b70 |     
  mips64el   |          acpid-2.0.34          | NOK | http://autobuild.buildroot.net/results/a9c7f417d9cdf8f2f51da4c377c1e984ad5bf808 | ORPH
    or1k     |         alsa-lib-1.2.8         | NOK | http://autobuild.buildroot.net/results/85abae8a18ae5ab7e95df7626f5431145aa9f6e8 |     
  mips64el   |         alsa-lib-1.2.8         | NOK | http://autobuild.buildroot.net/results/a4c2e287390adf99b84e849db39debf7c77664f1 |     
   mips64    |         alsa-lib-1.2.8         | NOK | http://autobuild.buildroot.net/results/5926473f187a7911562892e3776dbc4b7c21665a |     
  mips64el   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/cd216f0b1aad63fa4955d55bf3a435c1dde9b298 |     
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/cd7e6dabd97bbeeb8494eb1df1f4452d6cbebcb5 |     
   arceb     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/ac2285bfd1bcccc7b8ccdd1956816ee05379b46f |     
    arm      |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/cc8f8bee06e454f36b759a17d516e1fa2020d3c2 |     
    arc      |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/175d295b67adfed35b4bf5c107f2635dc2bfc290 |     
 microblaze  |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/59cd13ecf30571ae84cdec7d71ca13255efc2ef6 |     
microblazeel |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/710bf2297f823b365e78b6abc57d509ca8469f8f |     
  sparc64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/ead60f68ae7a03cc0b0d2cf627a9221b1f392e23 |     
   arceb     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/35aa70546db62bc0e047775ef8ec73124d5d4a23 |     
   arceb     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/366657aab5efba9c5e2ddce8bc27af98e9fd4cda |     
    mips     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/9e63be798ecd5240b8a52ce36cc69a26d8cf36e1 |     
    i586     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/90343f04a1c56360bee0ac616c2286582e92e782 |     
microblazeel |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/0d0e546e443574614bc47209131a4f7626ac4029 |     
   mipsel    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/6503e4655bf38b6909861413f36c9b1720f2a4f9 |     
    mips     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/a8589205d586e1d865dbbb6e7f3e4d2b4e234f7c |     
    mips     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/4cb300ec96264b81d2f6d786543de51a7644d1df |     
    arc      |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/e0253ce7af0ed0b1af4aff5450b21497b5c18252 |     
   mips64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/99fb2aaa3e68ea4d059f87125d7bb7026ecc4eda |     
   sh4eb     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/460c49cdef49f4f5171207ab57ab792dbce883b5 |     
  sparc64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/5e50a8c0f8c93061c34c56aa44a3d99e037878dd |     
   arceb     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/673d961a6f00811521646c2ccf885bb995cca1f9 |     
   s390x     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/a223d1b61cc54b5b40a376fb553786c243de92d3 |     
   s390x     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/11ada70eb5a498f210f03d57b65372a1ecd6c542 |     
  mips64el   |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/b17ad74ba36411e14c6d557a9f6bec19d9c32038 |     
powerpc64le  |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/448a7362a7c616b144c0f9836925c350572fab9a |     
   s390x     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/9f0467adebf47170cc337e1129837291cf19c419 |     
  powerpc    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/16432b2879c3cc1ebdc77ec7e871a73a67a0176d |     
   xtensa    | azure-iot-sdk-c-LTS_07_2022... | NOK | http://autobuild.buildroot.net/results/aa5f4ec25b92aeb80b2df63255996b885a46bc92 |     
   x86_64    |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/f56a0551ba40e5782e02a1153398aa1b2fdb0ecb |     
  powerpc    |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/962a9085bdf1e7f45f04d8357b00c56b1afb8e83 |     
  aarch64    |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/ddc53ff7b0953e0ae513d4fca6685fb9452e14aa |     
    i586     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/c22bef9bee92024fafcfd9c6f2e2ef6d19a5e198 |     
    arc      |          boost-1.80.0          | NOK | http://autobuild.buildroot.net/results/b17f737c06636b3b67786244c73f2505ae96e656 |     
powerpc64le  |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/eb7bf7da1d965a00891f71414a07a42ec462acec |     
   xtensa    |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/cc4c9897fa40cd6fa85d7b0847470ef6b905f532 |     
   mipsel    |        collectd-5.12.0         | NOK | http://autobuild.buildroot.net/results/cd8e83419aaa62452d001debe18a981cfa43a643 |     
  riscv32    |       compiler-rt-11.1.0       | NOK | http://autobuild.buildroot.net/results/ae04cfab38599d49829d4eda8aaf6a4f2ebcb241 |     
  riscv64    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/6140187229a195a9b05936a9c408dde5b909f30c |     
    i686     |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/01bc26be93ff2c06bdc85af0888c4a0a206a242b |     
  riscv64    |        dropbear-2022.83        | NOK | http://autobuild.buildroot.net/results/bfaf5e5fb1cea1aa6ce1cd6da9fe0b4bc332cb28 |     
  riscv64    |        dropbear-2022.83        | NOK | http://autobuild.buildroot.net/results/68ad450abe830f39e5e49c9c5b1cc7069608589f |     
    or1k     |        dvdauthor-0.7.2         | NOK | http://autobuild.buildroot.net/results/147d47e87128416c5e32127cf172fda793e88847 |     
    arm      |           efivar-38            | NOK | http://autobuild.buildroot.net/results/7f20e75e4a1446f7b88b7a8528c48f0e463fc6b4 |     
    or1k     |       f2fs-tools-1.15.0        | NOK | http://autobuild.buildroot.net/results/72abd734655878cb1660e3bffec0e69af4e85c94 |     
   sh4aeb    |          faad2-2.10.1          | NOK | http://autobuild.buildroot.net/results/2027e57d84ba40a079f42f8d8f8e3480bffb5bbe |     
 powerpc64   |        fftw-quad-3.3.8         | NOK | http://autobuild.buildroot.net/results/135f66e7746a526a8589ffaea91e2c40f6be004b | ORPH
  mips64el   |          flann-1.9.2           | NOK | http://autobuild.buildroot.net/results/e449490fd1605defb6531135fcbc172acd3be2b3 |     
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/f9c2b30c5258491e87814330aefcc7aa29e950a6 | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/4cabbfe9b11f8c651ac0fd03e2626cec635e4c62 | ORPH
  mips64el   |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/271ba9cac5d95de28368ce130c49417899932380 |     
  mips64el   |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/163f06a3dfb461f66a71b436468768128921fda8 |     
 aarch64_be  | fs/f2fs/f2fs.mk:64: /tmp/in... | NOK | http://autobuild.buildroot.net/results/8d230e23b95edf6fbd058700241d617225efcee3 |     
  mips64el   | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/60ab3a1bd3f0947a12204ba8bb694af03246b6fc |     
   armeb     | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/eec908084b32b02ec8d0d051265694b3cd7c1be5 |     
microblazeel | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/9c1d062b9b0721606043bc64b6018f7f483df442 |     
    arc      | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/b1f675b51fd725a56c29d8e96fd7d61d0e062b3d |     
   nios2     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/98fb4383795632384c602f5c55cfe81a6d794050 |     
   x86_64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/744fb469bf5cb372ab953007a8c15bdccdfa575f |     
 aarch64_be  | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/9cc91801b0e8107c5cfffaae5fccf63ef2c4974b |     
    i686     |         fwts-22.09.00          | NOK | http://autobuild.buildroot.net/results/93a056e53986cdde978f1dfd4587eae0d441f414 |     
  aarch64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/8e5c58e46c20a5913f10f77bb595495614f57aa2 |     
   sparc     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/0ebf8d548724b9e931437f8e913b246ac13f46d2 |     
 aarch64_be  |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/0597c2528c37363b539ad69795ea881ba0c3945e |     
   x86_64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/969519999946202805ca8ad1c1b34d9c08e9b46a |     
  sparc64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/6b825796e0ca040bf73d731066c9e497c78bdfcc |     
    sh4      |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/6ce7d593aca174e737cf0519bc0efcd6677379a7 |     
    arm      |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/30a5903bc544191c66ef76f241e162b3b5f29a26 |     
    arc      | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/aabd7a0c83fc49218ca5301f6af64285e0f3651c |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/3c607fe4e368d946d7d2aa25b4df40d228054b2b |     
  riscv32    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/0c3ec58f93e0bf225d16c496b967d54ef33c0654 |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/27cc0dae76e787004cdcc590c7240f0950cf541f |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/6f44ffc75f0692bc3671b9c6669b9f00cb598726 |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/ebe76a0ce7e32fb26d7641ec3ffd063dd14ac724 |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/595c98288806f345fe0cc25b022c0d5308340e86 |     
   arceb     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/e8c8edf3622ea0b1d562c463a899a07aa48c495b |     
    arm      | glslsandbox-player-2021.08.24  | NOK | http://autobuild.buildroot.net/results/865af860f9e52fe5311bb0c6a246ff871ae5a989 |     
 aarch64_be  |       gnuradio-3.10.4.0        | NOK | http://autobuild.buildroot.net/results/9828a85b76c6b6db4487cd2ad32537f2a75b3da0 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/6402f7ca1455e000d2be1ee6d2077caec7b80349 |     
   s390x     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/488bb8c798e889de271506f38fcc68444b801bb6 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/0a35a8c55f86cc2c8d46281f97a77265140de671 | ORPH
   sh4aeb    |      heirloom-mailx-12.5       | NOK | http://autobuild.buildroot.net/results/a90414d4a2a499da579544b28e924bffedc0075d |     
   sparc     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/ba754be2b8af5461e1ad78c4ce9c80b335011fc5 |     
    mips     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/39fca841a577f8eb1f9ee65d3ea9ff5d16723304 |     
microblazeel |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/f43eeb1067af60ccae3a246222985d07da2422ff |     
 aarch64_be  |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/af6b9a544ee2bf869a252416d250b1ca764701f1 |     
   arceb     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/296e46fe1a7b6930e13cb0b23ce4a6fefb3cb019 |     
microblazeel |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/91cf2ac4c3d90d3043cceb844d5987405df9545f |     
  mips64el   |        host-delve-1.8.0        | NOK | http://autobuild.buildroot.net/results/8e301d7b2df69a54890d9483876d6067117e6c3d |     
   mips64    |        host-delve-1.8.0        | NOK | http://autobuild.buildroot.net/results/404f0822fa4250a38cf3912d2fcbb20b50903670 |     
microblazeel |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/7b9354632a037a5833a8e1aa83148f3ae3cead4d |     
    i686     |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/09f9c163e8e7b310acb60c62226d499a05db109a |     
  mips64el   |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/1a429f873b63386146787b2f286b690829f9ad57 |     
   mips64    |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/9a2e0ec1ba26c36144b1955785672adb358b7199 |     
  mips64el   |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/dfecf8451d76435fce5af8360404ed951d27b360 |     
    arm      |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/ea227a1103a348aefe6828aa5596613a6cc5d38a |     
  mips64el   |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/b22deab2a0c0992203aa52a7a498e4c7824f4c8d |     
   sh4eb     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/ca91f73081037a412474bc2db63079c5d187b866 |     
  powerpc    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/1dda33abb80148fed8d8c5d03d7f4f8125654e04 |     
   mips64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/663811d695bff17563eb483332823973f8152455 |     
   mips64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/c2386269200f8af74299707ff71f3b323be5ea63 |     
    or1k     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/538c0234e30983c538f83ebf3ceb0a4551b0bdb2 |     
  mips64el   |   host-python-greenlet-2.0.0   | NOK | http://autobuild.buildroot.net/results/a400c63557a35aa16c7ec3c101657333683e293f |     
    mips     |   host-python-greenlet-2.0.0   | NOK | http://autobuild.buildroot.net/results/a00f9d57a2363fba79ba09f6204950e5ceab0096 |     
    arc      |   host-python-greenlet-2.0.0   | NOK | http://autobuild.buildroot.net/results/bdfdac92f53342911de9bb26c9fa128825e9e4ab |     
powerpc64le  |   host-python-maturin-0.14.1   | NOK | http://autobuild.buildroot.net/results/57c05fc5cc0d796ba6fe9253b2f35b486f15e159 |     
    mips     |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/565a1d7d29a9d66bf1603fbd8d86b7768efcb8c2 |     
  sparc64    |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/ca5b1d3fb912000dfa87100fc67d5ecd0318e6c1 |     
   mipsel    |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/999ad6b54d50e42853eb3d84ecdabd8b5e3c2b19 |     
   x86_64    |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/918cd33822bc0801acaf6e1ede008589a41e4961 |     
  sparc64    |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/a5edc3011b7ab5eed4447535191226eeadfef210 |     
   s390x     |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/60c785c3878dc33f00cbf7608a3883912bdfa6de |     
   s390x     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/e51d48ee1f7ec3102122cb060793400b24e288b8 |     
powerpc64le  |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/31d838dc87d9af81108777e9c1784775419c6aea |     
   mipsel    |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/953c0db5938ae3c9b96cef3b4a03950b6f107c22 |     
  riscv32    | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/72e13d1fc9bf7f4f510f6593783559bb7588ba38 | ORPH
  riscv64    |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/f245d82a37c5258d08f261ec211149f6807b0209 |     
  aarch64    |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/7620c3bbe6f08d7d21ea25567c44787758f6596a |     
   x86_64    |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/d3e9894416d277e8437100a13d60bf2ab81d5825 |     
    arm      |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/9f426323796f78b3e17e01ac24bf1e38f3cb0003 |     
    m68k     |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/d12f53ba298968402a0dbcd67c75b39cbf81c30c |     
  sparc64    |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/2b2a37d2d6025332a5366d2f48799fc6a5e2e9e5 |     
   mipsel    |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/a1dcf497bb8d465aa237950c5d8d2e5e1f7bc4c0 |     
    m68k     |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/31d1bb7fa346ed5a2607b179b66020b222f90d4d |     
  riscv64    |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/9fe06ef153eb74e49a482742e4685824fb5fcf02 |     
    i586     |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/aa39b10a294539c09235c0de0cae5563da4000ac |     
   nios2     |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/77eb470effc638a4086a91bc991d1d5e898db831 |     
   armeb     |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/b559e0a6cdfcf750211b0398024c53989d5a3214 |     
 aarch64_be  |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/a95c3be5e466743a28ca2c3e21609127d1ecc407 |     
    i686     |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/bc48f0750713d34609b1fabe45331bd9a82b7530 |     
 aarch64_be  |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/04461864fc805523102d4aa69659e56749e1a701 |     
    i686     | kvmtool-f77d646ba01d04be5aa... | NOK | http://autobuild.buildroot.net/results/bf52baca4efc85108c4b591717db3d20fabca250 |     
  riscv64    |         lapack-3.10.1          | NOK | http://autobuild.buildroot.net/results/231cec8a04c6c9e93fe3b4871bcdd329fe3e16d8 |     
   xtensa    |          libao-1.2.0           | NOK | http://autobuild.buildroot.net/results/b8e3dea2203053c07c7139f6d81a7785e6aefb6f | ORPH
    or1k     |         libdnet-1.16.1         | NOK | http://autobuild.buildroot.net/results/d37e06c4219f3554487b5dd6b18999c1efab68af | ORPH
   nios2     |         libdnet-1.16.1         | NOK | http://autobuild.buildroot.net/results/ebcd89bcb9dd3c3e231a6b7281c7d507ee827ef4 | ORPH
   sh4aeb    |         libdnet-1.16.1         | NOK | http://autobuild.buildroot.net/results/cb76636ce7a8db63f21e7de6c65bdd0d8648cad6 | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/6b32cdc55e282305c3be1d50ae22774d62578a25 | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/0f96ecbbee4352f2df402173076db44b1dcbec00 | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/dcec295ed0c1040c6d04355e77eb286785598539 | ORPH
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/f2988fbf1495e02b1bbd675d89bd539ad18e2f98 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/53aa315bf8b67b9f5fc0ec4fca0105e514b659d5 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/cb8fcfa0a597672e33cda9db5cec2a3eb4ef54fd |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/e5b7b5d6452b35c0bf2365fb13d1cd65a0cdc283 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/a13c5ece1005dc28d3b97bfb6c523d635369f55e |     
   mipsel    |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/7b16dbab1712b01a0a2ee52cef1b90766085db92 | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/a43c0e17f9540b568de9b7a1cdbbf5d4761da9bc | ORPH
   armeb     |        libgtk3-3.24.35         | NOK | http://autobuild.buildroot.net/results/7ba21bf9e5a9ba58c7a2d8c7dbcb8af83e0ca377 |     
  riscv64    |           libndp-1.8           | NOK | http://autobuild.buildroot.net/results/f2a64b9ebcb64829e5a69b245547a8384d0c2517 |     
    or1k     |          libnfc-1.8.0          | NOK | http://autobuild.buildroot.net/results/5d9faef25583d2982240d01dccee63b5dd42da04 |     
powerpc64le  |          libnl-3.7.0           | NOK | http://autobuild.buildroot.net/results/ffaf54c9afccfbfaba64be6f5fd1148482e41dbf | ORPH
    or1k     |          libnss-3.85           | NOK | http://autobuild.buildroot.net/results/107baa3124ac0de9ab653d3cc21ccc52e3512fab |     
   armeb     |         librsvg-2.50.7         | NOK | http://autobuild.buildroot.net/results/e4b336847a4b660005a369ba1bb5483eefe2f3fb |     
   mips64    |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/47193e06bab7d190cab5a95aad6ed7b1fbac0d86 | ORPH
  sparc64    |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/0a6fb7e4ff985352e9164e50622906adc6f2c65f | ORPH
    mips     |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/fa299419e43060a8965148e372c4f11fb305cd66 | ORPH
   nios2     |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/0326a668209e2cb8de59c47f577d1449b200dde8 | ORPH
    m68k     |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/5bf948a7ddc2a9c0581725b236cb0ef086f56206 | ORPH
   nios2     |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/4bfceef8c7fd597a88c93d8faf4ba77587367e8c | ORPH
   arceb     |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/c86fa1ebac921585c4dc1ba722505110ac551c6e | ORPH
  mips64el   |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/b1cfbbda4b746369906d001ff5d68b14ee942389 | ORPH
   sh4aeb    |        liquid-dsp-1.4.0        | NOK | http://autobuild.buildroot.net/results/6ebf31766d574664e6d0b7087ce1516c851b6534 |     
  mips64el   |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/2a3b82f9a31868e0457aef62b7868d258d64b9e6 | ORPH
    arc      |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/14a56cb5f2a41f1b709476c141ec27f67e655470 | ORPH
 powerpc64   |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/3c19dc89b612d2c9c0534bef1822c0add46ee8c9 | ORPH
   armeb     |        lpc32xxcdl-2.11         | NOK | http://autobuild.buildroot.net/results/717ae6c73f73d0d10c95447fd067ce197675438f | ORPH
  sparc64    |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/450437b33afe9cd54af6c5b13d188c248c8b22be |     
 microblaze  |      lttng-modules-2.13.7      | NOK | http://autobuild.buildroot.net/results/41828211cafa3c32dde36e26fc7aedaff2da08e3 |     
 powerpc64   |      lttng-modules-2.13.7      | NOK | http://autobuild.buildroot.net/results/605a0217f312e3e6abddcc171555314f186b1451 |     
   arceb     |      lttng-modules-2.13.7      | NOK | http://autobuild.buildroot.net/results/cf179feef424779906cb9f663201a51d4c18b275 |     
  aarch64    | mali-driver-3d697de9bce8bc6... | NOK | http://autobuild.buildroot.net/results/6f073fea149533a294dd838ce8373185236fe1d4 |     
  aarch64    |        memcached-1.6.16        | NOK | http://autobuild.buildroot.net/results/f1b055a85f4d008fd7c74208e41806fa11a81066 | ORPH
  aarch64    |          mender-3.4.0          | NOK | http://autobuild.buildroot.net/results/4862f401644b4bb125807a3cc2d6eb0fdc68d22b |     
  aarch64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/32a7b4223f2c9d65036acf5924db577244a62e9e |     
  aarch64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/8f68cd6290719f18d468080073096d47cc635e13 |     
powerpc64le  |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/db0fb2da7972d4806531ad95c2c78eb1b7e6ac9e |     
    or1k     |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/abf328e4074a1dd764ef9c620889da7028b8466b |     
microblazeel |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/83c619205471a321101c93314749916241f9dde9 |     
   sh4aeb    |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/df174f1e24cff849ca0cc6cc56e9d48942779ef4 |     
    mips     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/0abf879d917ecb852e40ee44c3eb481cd24c2ee0 | ORPH
powerpc64le  |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/dc62f755b4f71a388278ee9af517b82b0a45c900 | ORPH
  sparc64    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/2987e7d32804da33ca0140fd71ed3695e0bc8868 | ORPH
   arceb     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/ae83b6b5a14805e21dda5629c9c1e9f9cd97d50f | ORPH
  mips64el   |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/147403bc2c60be08db84ecea3e2e14137aa1a559 | ORPH
 aarch64_be  |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/f04a86609ecbf5acc52427d23d454d28fbb99ab2 | ORPH
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/d62712ac425c5cd07d671743c7743b0664604856 | ORPH
  riscv64    |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/9216d3469315f0af1b809b48600e4d024286dae5 | ORPH
    arc      |        openjdk-17.0.2+8        | NOK | http://autobuild.buildroot.net/results/c2550d4ddaa55179a21cfcc477d12e6f76dce1c5 |     
   armeb     |           opus-1.3.1           | NOK | http://autobuild.buildroot.net/results/d27d1c4bf0f373af41a384813557b1a83bd23c25 | ORPH
   armeb     |           opus-1.3.1           | NOK | http://autobuild.buildroot.net/results/a0d25a130cb63fe1d5b139011a30b81d4f0c7c12 | ORPH
   xtensa    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/b43998257fdd3eb552d60873f034c8760e1b8def |     
    or1k     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/6f3a2f76a26382fb0ec0cd505b499dfff24e59dd |     
   arceb     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/53bd6d1471f260a21d575488e0336b7ce419ce9c |     
 aarch64_be  |      proxychains-ng-4.16       | NOK | http://autobuild.buildroot.net/results/19b777a4b4073d84f45367b925a9773c953827b5 | ORPH
    or1k     |      proxychains-ng-4.16       | NOK | http://autobuild.buildroot.net/results/2a299ad1d0a1f390728ef8cb04e57bb9b482a5f4 | ORPH
    mips     |      python-bcrypt-4.0.1       | NOK | http://autobuild.buildroot.net/results/d09132fab539e63a95b19ccc3a86f9d331866f83 |     
 powerpc64   |      python-bcrypt-4.0.1       | NOK | http://autobuild.buildroot.net/results/d4e80eb860eeae1645b4c6129046d2dfcf874871 |     
 powerpc64   |      python-bcrypt-4.0.1       | NOK | http://autobuild.buildroot.net/results/7a8e0621877f49c49f7a723cb1c45011102fdde3 |     
powerpc64le  |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/1fb3a2d10032cf71eb1b64160b8ffa355d1d3a89 |     
  mips64el   |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/02a31b1c4297bbf7bc31bebcda312a86983abd7a |     
    sh4      |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/292fa3c6324e421dea2cb8fd41c01a9b5a4ba395 |     
  aarch64    |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/8644a158ac8bf1b0e8fe878e18e7b77bd0aff3c0 |     
 microblaze  |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/543546ac9e6e8cc6ca0cd938be53da5ecd3cf182 |     
   x86_64    |   python-cryptography-38.0.3   | NOK | http://autobuild.buildroot.net/results/efc839fd47e2c11238b05d5145ad2c32eca15819 |     
   mipsel    |   python-cryptography-38.0.3   | NOK | http://autobuild.buildroot.net/results/098f9a85c2f8c104aa1cd3fab246b1173cc8b468 |     
    i686     |   python-cryptography-38.0.3   | NOK | http://autobuild.buildroot.net/results/616e983c8dedde340db8167907a5113c81f6f9de |     
   s390x     |   python-cryptography-38.0.3   | NOK | http://autobuild.buildroot.net/results/edb54c57db6e4e2701f5074c382d26194b797c22 |     
   mipsel    |   python-cryptography-38.0.3   | NOK | http://autobuild.buildroot.net/results/891f4bce71ddaa62eed8e506a4843a4396673e53 |     
   sparc     |     python-greenlet-2.0.0      | NOK | http://autobuild.buildroot.net/results/6c3a8c1c566ec74450cf570c29a1da99c4cf3f27 |     
    mips     |     python-greenlet-2.0.0      | NOK | http://autobuild.buildroot.net/results/81187293ac5a269797a8837b2abd30fe6aae4a0d |     
   x86_64    |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/abff354cc30d6ffa92e86d96218b79cff3242f86 |     
    mips     |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/126c23f6d6be9a60fb86aaea7fed724a3e9f2a3b |     
    i686     |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/0d699610cef2d1b6294a9e5560a9d3cde6efce5b |     
   x86_64    |         python3-3.11.0         | NOK | http://autobuild.buildroot.net/results/03360d4ab98140da26374f5d4ccb6b0afc55cf9f |     
powerpc64le  |           qemu-7.1.0           | NOK | http://autobuild.buildroot.net/results/1f659221f660713725aadb3a75ec23b0ffe19387 |     
    i686     | qt-webkit-kiosk-a7720e50f2b... | NOK | http://autobuild.buildroot.net/results/565ad458740d9c351a846361a2196b3880089d8b |     
   mips64    |            rauc-1.8            | NOK | http://autobuild.buildroot.net/results/8409be22c4d1f5887782913fb4312b5e5c86e15e |     
   armeb     | rtl8192eu-1e15b6d451731bc4d... | NOK | http://autobuild.buildroot.net/results/c12ca26cfea6c60eb35eb5e94011f58d14721569 |     
   arceb     |          scrypt-1.3.1          | NOK | http://autobuild.buildroot.net/results/7678569bea50891ce8c3ec66a098e39c7e991155 |     
    sh4a     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/dd612069d116c649d34d896f65eaa8f2e25f65db | ORPH
   sh4eb     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/909a5db2691bf8d5eb49d35abc5ccbbdb1fabf19 | ORPH
   sh4aeb    |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/aa0906dc9b25a216981fcd7577d2278227b68c9f | ORPH
    or1k     |        skalibs-2.12.0.1        | NOK | http://autobuild.buildroot.net/results/0fa2c5a8500bb51ec7fddd70feaf980d71e0a4b2 |     
  powerpc    |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/a875a9e790e8560e2897e6674af9524de26efc07 |     
powerpc64le  |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/05e6bec82754bef7847e6c3286b2a13eed165e66 |     
  riscv32    |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/a0e79797db621f5a69e09f7ccff4605e777dfb5f |     
   xtensa    |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/afffff8dd3bf1cc28737d14e27c5edd53f479129 |     
    mips     |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/98400bbc59697a44cb3395fb64c7d900ae2c6a15 |     
   armeb     |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/4d1c628acebfe6dc170523753b0f3fee1250194b |     
 powerpc64   |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/ff9f8ce806b0c5982fd98786669d9a43f51b4e7c |     
 aarch64_be  |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/47ba875896a5fac2d1501b225064556575773ffd |     
 powerpc64   |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/ed874a652c2b6cda99a7a1958fdd878a76a706fe |     
    m68k     |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/a4fc9b420ea816ba60e253111a8e91d6cc5f1f77 |     
  riscv32    |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/cf0147c3adedfc98d51642c311c72872eea2df43 |     
  sparc64    |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/c3feb7f033eef5c808af5096838cf1bce64ac13f |     
 powerpc64   |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/5181c701c504be7e03cbe343f2eeb6968fbd96c0 |     
   arceb     |         sudo-1.9.11p2          | NOK | http://autobuild.buildroot.net/results/4a4ca7400b0ca95f88a52f791e4926d12c65644a | ORPH
 powerpc64   |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/bd6ac519530dc1baced11947db2c8d078ad2d15f |     
   mipsel    | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/45afd492ddbe31ad727381b7b6c1b4e6d485d272 | ORPH
   mipsel    |        traceroute-2.1.0        | NOK | http://autobuild.buildroot.net/results/dd611b9d0e77cac0be9826b5f5a898244581e87a |     
   mipsel    |          uhd-4.3.0.0           | NOK | http://autobuild.buildroot.net/results/f9096a6e913e58dc9394f448f956b3faa43b4aac |     
  sparc64    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/95f5e49937f52818ce68baee1a26130267b00b5e |     
   x86_64    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/80c6bccb2a00284014b64df69b442c6ae9a7ce31 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/7354707fa5866a29be2659742d95db2f74af5127 |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.net/results/75517d0cd3d58c0b3a32ae4cbc3b329d1c4cc8cc |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/cc1a73043ceea813f49e5054b2ddf703379a7a6a |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/14b79203ab7e9439104895e3eb05267fc59189e8 |     
   s390x     | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/20224851be913e93cbdf4f707eda8e8ac0aeefaf | ORPH
    arm      | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/03c2543ce79ca1ad940f0d30f3c8ef01b8c377e2 | ORPH
  sparc64    |      v4l2loopback-0.12.7       | NOK | http://autobuild.buildroot.net/results/349ee4a7887443c86f38e73af89fcef37242aa01 |     
    i686     |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/c23b56b7263e30537e41bc1b40b98af21fb93e86 | ORPH
   mips64    |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/0ccb954714e624c9ef509ef37643d5db67f1acf9 | ORPH
 aarch64_be  |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/9d802d35a5f82c28b89583c231ed0168921887ce | ORPH
  riscv32    |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/c2c2e55f1ee932bb62cfb1c4ba23912383480996 |     
    arm      |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/2d86e2d144fca04678ea43cde911e6afe7f46a50 |     
  riscv32    |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/abeba1acbc686dbbbd34bc34ec43f2388ec2dad3 |     
    i586     |         wtfutil-0.41.0         | NOK | http://autobuild.buildroot.net/results/7fcc929aa587378ab53df7684e24c324770d42ca |     
    arc      |          xerces-3.2.4          | NOK | http://autobuild.buildroot.net/results/5c2a408db72aa4852470ddf3fb4d704a0e58c070 | ORPH
  aarch64    |          xvisor-0.3.1          | NOK | http://autobuild.buildroot.net/results/e03f7299b48544fa81f198256dd3c086d4415afd |     
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/5952c19ec222fd0bc18e8c910a626567da316376 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/a1da14831ef03e01434926481ec4f8d1c07f834a | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/aa145dfc3c347b4378aac7a5fe485d9c537bb38a | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/8a5ccd1af755b1e8bf0404650acd60432c282eea | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/98bb36ccb8385d718047190b4934709908bdcbd6 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/015d6ecffb58f98bfd312d048904fbd621c5af3d | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/a53f31b8340d599997244324591d2807c3abb614 | ORPH
    sh4      |           z3-4.11.2            | NOK | http://autobuild.buildroot.net/results/bd9dbba9b6e5c3082e70903232b5fdecc8409994 |     
    or1k     |           z3-4.11.2            | NOK | http://autobuild.buildroot.net/results/a282221ebadfea4522b85d132e319c127d9e118e |     
  sparc64    |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/874abffdd112e3d76b8f611bfd7700e1ed53cdca |     
 microblaze  |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/9e4fb516be668a0d7cd8b5eea606d228f1a5d6f8 |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

            igd2-for-linux-2.1 | 3 
                 wavemon-0.9.4 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/26a305d33a8f6f5c0cab7bcafdd94a2de41c446d |     
   s390x     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/435ed6fcea619cb9685e1ea6df0ea51ff9c4cb96 |     
    arm      |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/d5b6fb96d00e211ae3fd52601e583215a048a23e |     
   mipsel    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/cabce25494e7834a10a85c127a9afafd8d221b0a | ORPH


Classification of failures by reason for 2022.08.x
--------------------------------------------------

host-pahole-73383b3a39afe86... | 3 
                host-go-1.18.8 | 2 
              libgcrypt-1.10.1 | 2 
                gerbera-1.10.0 | 1 
           heirloom-mailx-12.5 | 1 
host-spirv-llvm-translator-... | 1 
            igd2-for-linux-2.1 | 1 
               libglib2-2.72.3 | 1 
                 mesa3d-22.1.6 | 1 
                mongodb-4.2.18 | 1 
                 wolfssl-5.5.3 | 1 


Detail of failures for 2022.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/0f5bebbdb455754d55a2f2c56c99339b0c8a91a7 |     
    sh4a     |      heirloom-mailx-12.5       | NOK | http://autobuild.buildroot.net/results/ae41304b66d5e78fb0a16759ca248c961c19ec73 |     
  aarch64    |         host-go-1.18.8         | NOK | http://autobuild.buildroot.net/results/8a18844d346cf6e70e484eff5b45a89ee2bcb9ff |     
powerpc64le  |         host-go-1.18.8         | NOK | http://autobuild.buildroot.net/results/e8bf94d1372c9d63a8bddf2391f5c9db7aa95701 |     
   x86_64    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/ebfc546940d31646be28a3cfe3c7de9ae723db01 |     
  riscv32    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/aaf4dcc24dbf5a98568d683c7a4a98fcf050402d |     
   sparc     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/a7770638cd1a4d24c35e73bd68cb696f9cb7d3e4 |     
  riscv32    | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/d2292b57b0d3e531d29ee0065216fbfd187e49d5 | ORPH
 powerpc64   |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/d1f8d57223a00471a354e5bb6ce9bd627bf6beb3 |     
    arm      |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/4d267619aa0493d2d5de918851114dcde35ea3b0 | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/0e74a8900daba40faa96da24c2b14f7dcba003f3 | ORPH
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/264d2757a6c816636efbc243187a4df3e071f466 |     
   x86_64    |         mesa3d-22.1.6          | NOK | http://autobuild.buildroot.net/results/b96f980bb848d2d4b1d6c52eb0ee298c5c5a996d |     
   x86_64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/4fa03dfaec3d24212b103b39a7a0a5dd84ac79c0 |     
   mips64    |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/ce89482e5a0829f75ba630d2e1548cba450122f2 |     



-- 
http://autobuild.buildroot.net

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

