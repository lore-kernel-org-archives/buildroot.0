Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89005C4332F
	for <buildroot@archiver.kernel.org>; Thu, 13 Oct 2022 05:43:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C025C401AD;
	Thu, 13 Oct 2022 05:43:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C025C401AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gASm5WRnK8UE; Thu, 13 Oct 2022 05:43:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 47BDB40C3D;
	Thu, 13 Oct 2022 05:43:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 47BDB40C3D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CC2371BF576
 for <buildroot@lists.busybox.net>; Thu, 13 Oct 2022 05:43:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8FBA140C3D
 for <buildroot@lists.busybox.net>; Thu, 13 Oct 2022 05:43:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8FBA140C3D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mdpEz9DtzxKF for <buildroot@lists.busybox.net>;
 Thu, 13 Oct 2022 05:43:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D6C9A401AD
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D6C9A401AD
 for <buildroot@buildroot.org>; Thu, 13 Oct 2022 05:43:23 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C024024000D
 for <buildroot@buildroot.org>; Thu, 13 Oct 2022 05:43:20 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Thu, 13 Oct 2022 05:43:20 -0000
Message-Id: <20221013054327.8FBA140C3D@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1665639801; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=0MKauohKLcRClf8KaIHONsKY1kFXKfvfHtDOjyyBH3o=;
 b=gXcSuIsIsgOw8xXiYIg5eTfupM99Eg06PrA/ixCdOBHQTzHxDB2IRAcX+/bqgwSlNqbaDe
 sC1dT1UEP1lStdfHODtJ4Btnu4JlCTCdRtaOcwiIY03QEYk8uEtB1TyikJyWXBYoZyA1kK
 700xFU8jAuPZiMsaqzAalGpyNzesGpMcnCiqZ+j15JJb+f0OVFKAeVBEl3QLuMCW0iAOmI
 JAiXQJ3s2zmy4DkhqTnID01rKmlo4a57sIvWa8ZxUGsNKpvwZzANeILlDKHcufnHyvyyVq
 /OgZBfh5IvAfmNruplJ3icMfCIooc6xXIvRdsu06qbnhDsHpJvfCYB2oKXhvwA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gXcSuIsI
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-10-12
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

Autobuild statistics for 2022-10-12
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  4  |  2  |  0  |  6  |
  2022.08.x  | 21  | 15  |  0  | 36  |
    master   | 92  | 812 |  7  | 911 |

Classification of failures by reason for master
-----------------------------------------------

glibc-2.36-44-g2628500f5dff... | 351
      ca-certificates-20211016 | 36
       host-gcc-initial-11.3.0 | 29
             berkeleydb-5.3.28 | 26
                   bearssl-0.6 | 23
                      crun-1.5 | 19
        host-f2fs-tools-1.15.0 | 19
            host-binutils-2.38 | 15
                   slang-2.3.2 | 13
                   libnss-3.83 | 10
               libglib2-2.72.3 | 9 
                  autofs-5.1.8 | 8 
         coremark-pro-1.1.2743 | 8 
         host-gcc-final-11.3.0 | 8 
                        brltty | 7 
        host-sentry-cli-1.59.0 | 7 
                    sdl-1.2.15 | 7 
              dieharder-3.31.1 | 6 
                     fbset-2.1 | 6 
              host-rust-1.64.0 | 6 
                 sysvinit-2.99 | 6 
                     efivar-38 | 5 
                gerbera-1.10.0 | 5 
       host-gcc-initial-12.2.0 | 5 
                host-go-1.19.1 | 5 
host-pahole-73383b3a39afe86... | 5 
                     linux-6.0 | 5 
                 systemd-250.4 | 5 
            btrfs-progs-5.16.2 | 4 
                   duma-2.5.15 | 4 
            host-gauche-0.9.12 | 4 
                   libee-0.4.1 | 4 
      linux-5.10.145-cip17-rt7 | 4 
           dmraid-1.0.0.rc16-3 | 3 
                elfutils-0.186 | 3 
                     flite-2.2 | 3 
                    frotz-2.54 | 3 
                  gensio-2.5.5 | 3 
        host-berkeleydb-5.3.28 | 3 
            host-binutils-2.37 | 3 
       host-gcc-initial-10.4.0 | 3 
      host-riscv-isa-sim-1.1.0 | 3 
            igd2-for-linux-2.1 | 3 
              libarchive-3.6.1 | 3 
libsvgtiny-ea9d99fc8b231c22... | 3 
                 musepack-r475 | 3 
                   perl-5.34.1 | 3 
                    bat-0.19.0 | 2 
dahdi-linux-5c840cf43838e06... | 2 
                  exempi-2.6.1 | 2 
             f2fs-tools-1.15.0 | 2 
             fontconfig-2.13.1 | 2 
                    gpm-1.20.7 | 2 
                   hdparm-9.63 | 2 
            host-binutils-2.39 | 2 
         host-gcc-final-12.2.0 | 2 
host-gdb-arc-2020.09-releas... | 2 
         host-protobuf-c-1.4.1 | 2 
                 lcdproc-0.5.9 | 2 
               libcap-ng-0.8.3 | 2 
                libcurl-7.84.0 | 2 
                  netsurf-3.10 | 2 
               openpgm-5-3-128 | 2 
toolchain-external-codescap... | 2 
tstools-08f6be304040e7b8476... | 2 
                 uclibc-1.0.42 | 2 
                       unknown | 2 
/home/buildroot/autobuild/i... | 1 
/home/buildroot/autobuild/i... | 1 
/home/buildroot/autobuild/i... | 1 
/home/buildroot/autobuild/i... | 1 
                 a10disp-0.6.1 | 1 
                     ace-7.0.6 | 1 
              alsa-lib-1.2.7.2 | 1 
                  assimp-5.2.5 | 1 
              asterisk-16.25.2 | 1 
                  boost-1.80.0 | 1 
                    brltty-6.5 | 1 
casync-4ad9bcb94bc83ff36cfc... | 1 
                 dash-0.5.11.5 | 1 
                    dhcp-4.4.3 | 1 
        edk2-edk2-stable202102 | 1 
       freeradius-server-3.2.0 | 1 
             freeswitch-1.10.7 | 1 
                     frr-8.3.1 | 1 
                 gauche-0.9.12 | 1 
                    gdal-3.5.1 | 1 
          gitlab-runner-14.5.1 | 1 
                     gmp-6.2.1 | 1 
      gmrender-resurrect-0.0.9 | 1 
  gobject-introspection-1.72.0 | 1 
google-breakpad-c85eb4a59b6... | 1 
               host-vde2-2.3.2 | 1 
              libgcrypt-1.10.1 | 1 
             libgpg-error-1.45 | 1 
                   libqb-2.0.6 | 1 
              libsodium-1.0.18 | 1 
               lighttpd-1.4.67 | 1 
          lttng-modules-2.13.1 | 1 
                    lxc-4.0.12 | 1 
make: *** Waiting for unfin... | 1 
               mariadb-10.3.36 | 1 
                   mimic-1.1.0 | 1 
                mongodb-4.2.18 | 1 
                    musl-1.2.3 | 1 
                   ncurses-6.1 | 1 
                 openssh-9.0p1 | 1 
                openswan-3.0.0 | 1 
   openvmtools-11.3.5-18557794 | 1 
package/qt6/qt6base/qt6base... | 1 
               pcsc-lite-1.9.8 | 1 
          perl-net-ssleay-1.85 | 1 
pistache-3ec9d7c4f8b828fdd3... | 1 
               poppler-21.12.0 | 1 
   python-pycryptodomex-3.15.0 | 1 
                 qt6base-6.4.0 | 1 
          refpolicy-2.20220106 | 1 
sconeserver-8d1935919a20133... | 1 
toolchain-external-codescap... | 1 
               trace-cmd-2.9.7 | 1 
              traceroute-2.1.0 | 1 
             uccp420wlan-6.9.1 | 1 
ulog-0389d243352255f6182326... | 1 
               valgrind-3.19.0 | 1 
                    vde2-2.3.2 | 1 
                  whois-5.5.13 | 1 
                 wolfssl-5.5.1 | 1 
                  xxhash-0.8.1 | 1 
                    zeek-4.1.1 | 1 
                 zlib-ng-2.0.6 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/b9a1754350d6a738926dfaeb862beb93e53f6662 |     
  powerpc    | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/f83d2788d4bb451b457e59cf9f26d6c24b3b4433 |     
   arceb     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/8e4090aaf1073a0766606f81c640cb2ac2b09948 |     
 powerpc64   | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/0cd387ddf55758990205aa9fea8b20a863a4687a |     
    arm      |         a10disp-0.6.1          | NOK | http://autobuild.buildroot.net/results/1295f55793ae44741470872e198e6e93b630f287 |     
microblazeel |           ace-7.0.6            | NOK | http://autobuild.buildroot.net/results/2e2b956867490b5c038bf605173c753c0158cc14 |     
  aarch64    |        alsa-lib-1.2.7.2        | NOK | http://autobuild.buildroot.net/results/4d8b76708edb914c12907d8b54c953460635671d |     
    mips     |          assimp-5.2.5          | NOK | http://autobuild.buildroot.net/results/8527f91a437981f9ed49060a0f6f2ae20cde533e | ORPH
  aarch64    |        asterisk-16.25.2        | NOK | http://autobuild.buildroot.net/results/e577f3d8290a1d621ee554b04826cb37e7b3251f |     
   s390x     |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/f0f2eceafbf2f443f04c3c4d47bc2aa5493f2d4a |     
   nios2     |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/e4ec9277f523b3985ae5c6f70555a8636d9ddc38 |     
    mips     |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/87291d9281a1325367b35429607369807c93c264 |     
   nios2     |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/55317448ce7118165857a0ee313cb1ba3660f14d |     
microblazeel |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/6e782eb963e25f0d20900c515d1664bfe856c9a7 |     
    or1k     |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/7eab6dc45363aa082bb8e0b39bbb7daa7b131158 |     
    sh4a     |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/3ad63f86158f5f843ed77c7ef685c438fdcdb7d3 |     
microblazeel |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/2b950f446a02f7099f5dfa73a6fa3a39f2b7a936 |     
    arm      |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/ba64511dc3593e2004b87d3ca079486c3bd5ff4e |     
    arm      |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/a1a35c4de40372af536102b3aa6b8b1ddd5c7920 |     
   sparc     |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/7e2b0f354b980cc3444a37f50540966ff1bf70db |     
  riscv32    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/ec12e9a0df4fba650269c2fd6a6c631a871b6830 |     
    sh4      |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/80a2e29f7e411fda47a43ab50e3b33b60c9a7743 |     
   mipsel    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/a01a89c438373a1d2fd5da6d92d2ce9ef1cd551c |     
   arceb     |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/f3283bf971f6c48ec40f31b37822090dcf222cfd |     
   xtensa    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/daaaeacfc56a48b1acd8f0b76bf890ccd58190ce |     
 microblaze  |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/3618fc4d77f23b42d38113a5b6664ee0a96ac6da |     
   mips64    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/8b079261f7e9aa5f9b80fab17cabbad0fceed0d5 |     
  mips64el   |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/8aff1a14ed7549bca53341001b9355b5aeae2cff |     
 microblaze  |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/36f1189a75145e51ad26aa2b0d93f5ae28dc5b46 |     
    m68k     |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/2516faf3417b1a529d5a5fb11b96e0b6d14c34a2 |     
  mips64el   |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/c1f0d7eeb746900e405f2ce5d57863fbec214567 |     
 microblaze  |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/b2f2eb2ae63d99b19a250cbd695be845a9af91c1 |     
   mips64    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/20d3ddf8a6d04a5b6d2ae1d54525bedaa0ad56e3 |     
microblazeel |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/45b58059fc3252ba4d22977c9eeaccd6dbf3eeba |     
  mips64el   |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/2786e933828485542750b77ae1277c1d5e36a51d |     
 powerpc64   |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/cc798773bbb93dd3f857e197e8c336056621638b |     
 aarch64_be  |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/3568faffc603427bddbef71625a7037257878edf |     
microblazeel |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/a35712d16b59b9eba8787b851a9092938e21d780 |     
   armeb     |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/e07d9cd42f151405899ffe3b88f06b9f3ec5377c |     
   s390x     |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/b2dbf0bedc1c68c24957c41834214f875389b8f5 |     
  sparc64    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/e5d97fb61d7137b4f138820126c878928e89ab3f |     
   sparc     |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/bd2e7e6f65bf42138ec60e29f2a2479b67b7c267 |     
   mips64    |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/6078922654675d401d986e565de6ac42938de0e9 | ORPH
  powerpc    |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/d099fb78365ae848d2deea4d391be7d094902624 | ORPH
  powerpc    |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/3e8f431ac6946169916e5934071857c434687851 | ORPH
   sparc     |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/fc6b9c0113a103eaae664516abdee8bc81c54706 | ORPH
   mips64    |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/d307eb51035e4b2e4d7dffb6407120f3c68db58c | ORPH
  sparc64    |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/71c276f41f88eadbc0a0936a8c76bf01a6e51930 | ORPH
  mips64el   |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/d715da011e743d4b05eee28187c430a849106169 | ORPH
microblazeel |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/42c36bcf5fca2adfcaa48defd540470969786dd4 | ORPH
   armeb     |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/d6ca22e78ef43a1ef96de19927258eb8b18eb787 | ORPH
   arceb     |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/319fe08256cd8623330b3bb6db918dc89dfb47b0 | ORPH
   mips64    |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/cc4722a8d745b495a0d2609df92fc9a36e9b6534 | ORPH
   arceb     |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/39c08b37c1c7c54a776917df9007dedaf2b82248 | ORPH
  aarch64    |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/efaeafb26cd86a4eab4c0af7583e6afdadbba311 | ORPH
  sparc64    |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/e5ca0812314f95518d7cc75636e2b16166b26f30 | ORPH
  aarch64    |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/f6b3158f72dbe9e4c2f632c6687d7bd033b08ab6 | ORPH
  mips64el   |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/bedc1b7bf74f26b24018f3bc2dfaa3a850f9c50e | ORPH
   mips64    |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/f9e62a40777b9bb1e38c9ba1e00903106106284b | ORPH
   sparc     |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/66fca6008604fa2ecff75ff955ae91b51efe0382 | ORPH
powerpc64le  |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/f6330e0e05ec987aed3f1d27414e819914d5556f | ORPH
    arc      |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/3c49afcf04a2f07963b59c525628138afb147fc4 | ORPH
powerpc64le  |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/e646f50b6a23692754508f0d4b1d82c397857b84 | ORPH
  sparc64    |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/709e60cb973c42bd6da5df956fdcab6cc01b54c7 | ORPH
   sparc     |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/6b8ee347ba537af3029bd04c590f62d90722cb81 | ORPH
  sparc64    |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/3dc67e4cf54e1f76c23dd6adcf09ec36da1ee760 | ORPH
   arceb     |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/8c1b557f99720f95619f5fb45c982b2df73239de | ORPH
microblazeel |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/0941e976ab9ca8bd8d811f1ad8b252567e92bed7 | ORPH
   arceb     |          boost-1.80.0          | NOK | http://autobuild.buildroot.net/results/77cba08e807c7d66882af23afddf19ce87b9025a |     
microblazeel |             brltty             | TIM | http://autobuild.buildroot.net/results/44f5f216f8428c0d346941fc751214fe2d9bbae6 |     
 microblaze  |             brltty             | TIM | http://autobuild.buildroot.net/results/2064a3987ecae989849e3bbc0f1fd8d9d4d598a4 |     
powerpc64le  |             brltty             | TIM | http://autobuild.buildroot.net/results/3ecc7bb3ecdd2e65d62a14a2196d078262336de1 |     
  sparc64    |             brltty             | TIM | http://autobuild.buildroot.net/results/a1e89c6522f91b1abc761f085f3a2bbddbd660cf |     
powerpc64le  |             brltty             | TIM | http://autobuild.buildroot.net/results/6783fe6c9ba9ba23962b2d955419d8592a3297b3 |     
    arm      |             brltty             | TIM | http://autobuild.buildroot.net/results/b5671c1017a93fb2334d9e0564730af11408033d |     
  riscv64    |             brltty             | TIM | http://autobuild.buildroot.net/results/c6c399629d690b3e4401d4a498591be1082bc892 |     
   mipsel    |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/07dc6309ae292ccff07f44b1013cd6af95582234 |     
   sh4eb     |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/a2ace987fc1440f67085f728e4923410e7dab968 | ORPH
   armeb     |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/ef85f9e4fcb4739e7b829c3d3d1dcc2cbbaccf4b | ORPH
   s390x     |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/23eaeafb50c7bb36c48dc4dcefb6b539e9af1de6 | ORPH
   nios2     |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/c85d8324d7ccdc98444c304a68aab5fc741aa742 | ORPH
   xtensa    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/a0b552d30dd69d42e5518e34546c2e78fbd405a1 |     
  riscv64    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/89b3b8d9610cd7f466ff0448eea2f3ea81bd1384 |     
    m68k     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/e20228aed185021581e3b989ce21912e9d437543 |     
microblazeel |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/c2eeffa3ecb59a5d73e58462aa11d68842111867 |     
   mipsel    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/74b507c0f29dfb48d565fb76fe23749ec3dc7fff |     
    m68k     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/88dcb9eb12d291642964a71665cf6c05ae0dd1df |     
  mips64el   |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/ae48771dfef08dc6b5d401e1a9bf3417cf003cad |     
microblazeel |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/c2e1faeb33ef0f18937994b543f0eb3e1d663dad |     
   sparc     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/3aaef99c2d4108f00b1a4181ad07bb64a46a6e3e |     
   mipsel    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/8b7e7b4e619585c75b87468f5371e31c45eea971 |     
 aarch64_be  |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/8f54c27c0c843711b0150626ff0b79637b261856 |     
    sh4      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/ba0d06fb0a2fef3c1621fc66222dc377604975f9 |     
    or1k     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/e9f2a1afe6e00cb9fb5c3f869bdf4e9e50e1231a |     
   mips64    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/9bb756d31e24800e991f8dd53adf8f8909f991aa |     
    sh4      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/bd347a234e11797e5f1df8af979f92c5025a653f |     
   sh4aeb    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/9e6ff5dd2ccd510254af3ba2a91e0a74880e1c60 |     
 aarch64_be  |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/d6a908a6bca10b370b5c33ea871070efd36647db |     
    mips     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/6341cf285b385a0490855e8612ee9ecb33942f5f |     
  powerpc    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/73ae9841ecf3a33928dc41d9feb25746017907b4 |     
powerpc64le  |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/22c4468fb03ef59766a3e44e4920f848de210a35 |     
powerpc64le  |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/e157391c57510bd3220492032ce88e86789a5712 |     
   arceb     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/10baf76634e0d7cded6e34b5947eeac05c66c8bd |     
   armeb     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/a222fd4dd4cc7e17fb0642098ebc48838d1557f3 |     
  aarch64    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/61930569f380d53635d7bfc9baa530372e0c9677 |     
   arceb     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/c895c7d64d5209de48c3bb594ecb19070a8fab46 |     
   xtensa    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/3ad1d25aa1a4bf61da24426cd3a2b98c2f3a5be1 |     
    i586     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/91900dad1f91b856ff1ed6864008c5ffe99c9c70 |     
   mipsel    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/ca9702467a51ae4c1791071fe2447b8d4655766f |     
 aarch64_be  |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/8976671e382866e956732a1322cfb912dde26f70 |     
  aarch64    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/d8473e4cfdacebc05f446040a174c834eeefc992 |     
 powerpc64   |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/b2412604c7eb2115bf75ad35217fdbac504e22ad |     
    m68k     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/b45eb0c20f0b4f8a815b0034cb7a18c92635c4a2 |     
   xtensa    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/3feac65a2eaf46c628b75384ea35b568b1d43ea2 |     
    mips     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/0453bcbb055a8c026d958847c206ac6b0a755c20 |     
  riscv64    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/61e3023abbb708ebd8b69e60110fc5874fa333ae |     
  aarch64    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/5236cd24b3776330853a132653aa95899ad1a737 |     
   s390x     | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/4e46ece0df42dd981d7590ebcf516964536c31e7 |     
   sh4aeb    |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/1c61a91993bab4cd4e5fb8d59d9d82d1c785ffa9 |     
  mips64el   |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/73113d96aa53cfc36ff34233dd46f5a2f0feb195 |     
    or1k     |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/b237e1ef3fb41cb6bb4844a95d72f4ddc3353a94 |     
   sparc     |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/6dbcb307674984dc15d295cceac1c9fb37c5945e |     
  aarch64    |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/73dc27aa1ec7d2b7abf270f98ef1b852b83275fd |     
 aarch64_be  |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/0b265933d99ec48fc5d7246998c8cbbde335a63a |     
    arc      |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/2797efa8dbf2faa27b0ac53399cd5703dd9cfc85 |     
 microblaze  |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/3646e95ae46fb71608353f8512f212195a245e2f |     
    arm      |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/e3d76c0e067a78b04cbea8ca26097ad2db4297e4 |     
   arceb     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/21e762b2490bc143118bd8d6d7c417b714d2d9b6 |     
    m68k     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/f1cc917cec3cf4102d89ea954abc56ddfdc4f593 |     
    arm      |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/4fd5d2cdbd376d27fd2202a864e28c327f0b2920 |     
  riscv64    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/8a8a3e6bcd469c2e9b0f6747dcd5878df22f1177 |     
  riscv64    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/19b972adaa3f49a957c04baa221be204c34efaf5 |     
   sparc     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/03eaf053e26d096d8a89998efe497ab17d486ca0 |     
    arc      |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/327faa77b787bb677b62cfe01040b4311b4190e7 |     
   mips64    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/36e8793f49ed6a028204635c4e62b0ab05d30396 |     
    or1k     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/1a3f196f0e0adff3d5bf9214f44f4e63b87b0aff |     
   nios2     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/9cfd7f6221fa8d2a8e1438b34341cccff7ac45cb |     
    or1k     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/889776fdde4535f3c4fdef63b199ea4b6684df29 |     
   xtensa    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/0921a7fc5db266b90c8831bcb9d87cb111d03c7c |     
    arm      |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/799c2913497eb1266aaa2edab2e6751b6cc77be3 |     
  riscv32    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/9493aefda7edffbc94ab5c9f7e1b4058ce1d5753 |     
microblazeel |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/970bf45ed705cef33570021c37d003a54b423dc4 |     
    m68k     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/fbf3ed135e3231f09807b30133298f93a0a164ed |     
   armeb     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/a01da0f669599f22c0b6ee8f0c438de471550e9b |     
  riscv64    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/16c74337703fc08fd2a8c34e13acf96eab9ba7f2 |     
  aarch64    | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/3e4d5adb4fba997cc5d5a1770ffe9c2107e24db2 |     
    i686     | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/50067d9c5a2ccfa41d716ad97915081e9b77fbaa |     
    m68k     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/8ce2099dc051418693af1446d0de2315bda1a545 | ORPH
    sh4      |           dhcp-4.4.3           | NOK | http://autobuild.buildroot.net/results/094e11a1052f02c889c7f1bc700efec5ff4cc7a9 | ORPH
    arc      |        dieharder-3.31.1        | NOK | http://autobuild.buildroot.net/results/6f57fc5c99c02559af7ab807fbddb4356038cf14 |     
    mips     |        dieharder-3.31.1        | NOK | http://autobuild.buildroot.net/results/e86d11aaec2cf1292c7876aee666843e80a9f3ef |     
microblazeel |        dieharder-3.31.1        | NOK | http://autobuild.buildroot.net/results/eb8a0dc5ea835e668ff9011f2a3f3e651691ce7e |     
    arm      |        dieharder-3.31.1        | NOK | http://autobuild.buildroot.net/results/df9fd443de77c61181d7789c7d1cb38d1d66240d |     
    mips     |        dieharder-3.31.1        | NOK | http://autobuild.buildroot.net/results/0b19a1e6e55fcd6fc3be3ec7e2b910aff01429b3 |     
  mips64el   |        dieharder-3.31.1        | NOK | http://autobuild.buildroot.net/results/bb294762171a1bfeff26e5f0486532eeaedd5d33 |     
 microblaze  |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/e0e5544bf7955c63545d929e3016af3f79d1e095 | ORPH
  mips64el   |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/f8ff4bc5c543ee8de4bcd31080b3ec2dc981c462 | ORPH
powerpc64le  |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/2f73a51517fbed1019c1f11b486f042c195fb4d0 | ORPH
    m68k     |          duma-2.5.15           | NOK | http://autobuild.buildroot.net/results/c5bf69fca64456f731dd62f84b5b609c16583730 | ORPH
    sh4      |          duma-2.5.15           | NOK | http://autobuild.buildroot.net/results/bf6317e53f70477c36c1148c781fcd228123f1e0 | ORPH
    or1k     |          duma-2.5.15           | NOK | http://autobuild.buildroot.net/results/2dace93c1c61901f2caa9a9995f766f62c4f6e52 | ORPH
  aarch64    |          duma-2.5.15           | NOK | http://autobuild.buildroot.net/results/050773e3be4dd6ca66599bb1bf870966588a7951 | ORPH
  aarch64    |     edk2-edk2-stable202102     | NOK | http://autobuild.buildroot.net/results/91fddff5c670f262e2aee8814d5ae8e53cce2a1b |     
  aarch64    |           efivar-38            | NOK | http://autobuild.buildroot.net/results/e7945222a2ef5e631417eba879e0036b45d6f821 |     
  aarch64    |           efivar-38            | NOK | http://autobuild.buildroot.net/results/379a9245699fb37e216557b2051fe3d8ddffe7a6 |     
  aarch64    |           efivar-38            | NOK | http://autobuild.buildroot.net/results/803fc58b7cfe69423c4bc5eaf4bff93cae9a1100 |     
   mipsel    |           efivar-38            | NOK | http://autobuild.buildroot.net/results/d7c1a3785d1b867b87e7cb6938c7a8b3b1ce4fda |     
  aarch64    |           efivar-38            | NOK | http://autobuild.buildroot.net/results/263bf66b68f5f56b7dccec86074ec12bdb8f516d |     
    arc      |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/8545de71d30d338988739fa1bc39649c2befe9fa | ORPH
    arc      |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/fc4382b7dcc8cd3b4a32ebccb9ab78539e3517b0 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/dcfdc79eab9e39405aa224498432e87e2340e594 | ORPH
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/ba2e5bb7106cd453cb5108f643fca909f8c7cd01 |     
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/97ce169d33bc90befeebb5b6b29921c44d923d55 |     
    or1k     |       f2fs-tools-1.15.0        | NOK | http://autobuild.buildroot.net/results/efaf0b70a101a7ed1af1dc13bb0a474e93ab9271 |     
    or1k     |       f2fs-tools-1.15.0        | NOK | http://autobuild.buildroot.net/results/2f66cfab4ac40c0e9822be1cbce230586e3c634a |     
   arceb     |           fbset-2.1            | NOK | http://autobuild.buildroot.net/results/b5e2a7318aa868b0a5e19b987c16bf93285fb377 | ORPH
   sh4eb     |           fbset-2.1            | NOK | http://autobuild.buildroot.net/results/6b165317069397a50d87b77afcd974775027de2e | ORPH
    m68k     |           fbset-2.1            | NOK | http://autobuild.buildroot.net/results/977448db4133b23c3ffd6b19a4c84f609242f332 | ORPH
    or1k     |           fbset-2.1            | NOK | http://autobuild.buildroot.net/results/28ded714119f94452f0ac33365a936baca77a5c1 | ORPH
   mipsel    |           fbset-2.1            | NOK | http://autobuild.buildroot.net/results/ffcacc171505c639e24692c39b383564b6f5d027 | ORPH
   arceb     |           fbset-2.1            | NOK | http://autobuild.buildroot.net/results/05084b3a50f91af4f0b4da92bba767f500aba315 | ORPH
  powerpc    |           flite-2.2            | NOK | http://autobuild.buildroot.net/results/89fe02f2c3c741dcb686fb91cf59a09bafb5d5ab |     
  mips64el   |           flite-2.2            | NOK | http://autobuild.buildroot.net/results/103d2b8dc9a39895fbff6038533565aa002ae4f8 |     
 powerpc64   |           flite-2.2            | NOK | http://autobuild.buildroot.net/results/14829c9002520eec33470bde6354637684f3a856 |     
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/fd35e01d92cc0d69616ff5fb4285fd2b3b73148b | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/1eedffb8123623d68dabe775c8f704226d2151ca | ORPH
   armeb     |    freeradius-server-3.2.0     | NOK | http://autobuild.buildroot.net/results/6c20d612923f2279b03144cba9f6c7284aff8d73 |     
    arm      |       freeswitch-1.10.7        | NOK | http://autobuild.buildroot.net/results/db9a070067c39539bb1ca7e8bba95e7243df6fd5 |     
    arm      |           frotz-2.54           | NOK | http://autobuild.buildroot.net/results/6c6008596a24fd604336a9adcf57203d32f8bf8f |     
  riscv64    |           frotz-2.54           | NOK | http://autobuild.buildroot.net/results/870382aaa79664e68d4bb28d286dd703e0cd6087 |     
    arc      |           frotz-2.54           | NOK | http://autobuild.buildroot.net/results/363fd33d567c62a0a4f31993837005e66771c26c |     
   xtensa    |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/17728056188e5b0aa899af1e454859f40ebd0cf4 |     
   x86_64    |         gauche-0.9.12          | NOK | http://autobuild.buildroot.net/results/cbc0fa0a6e0cf3e14c5850d952be8c9e02135010 |     
    sh4      |           gdal-3.5.1           | NOK | http://autobuild.buildroot.net/results/b56ee248b203ca44ca9632848e36506214e98ddc |     
    arm      |          gensio-2.5.5          | NOK | http://autobuild.buildroot.net/results/93d3758557338c76f1d86b4736b75e1310f56119 |     
   mipsel    |          gensio-2.5.5          | NOK | http://autobuild.buildroot.net/results/7e426fa020058eee87374acf9be4439ccc8527eb |     
microblazeel |          gensio-2.5.5          | NOK | http://autobuild.buildroot.net/results/988f7369716e97f842009872bf423709cec1fb9b |     
   armeb     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/51105936c2e6eed5b347340e897f99d98cfe829b |     
  aarch64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/75b54919436655a6f68c0aceb4748b5438b5bcf2 |     
   mipsel    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/dc74cc78ae70ae2c71bf3d6f9bb98352c6a0400a |     
    or1k     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/21f288af128fd84338647124a8b821412dcdee92 |     
  aarch64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/c92282948c88cc1181797f61f5805f57e716929b |     
  riscv64    |      gitlab-runner-14.5.1      | NOK | http://autobuild.buildroot.net/results/b7154799443e478a01224acbf37393adaf5eee3d |     
   mipsel    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/92967e637918011c10a933083c4655f17919b750 |     
    or1k     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/606be58195ded7814eecf1e6bba2cdd6d6829333 |     
 powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/a7db3e8cc4b3dd3da7b55a949584fa09ff2f7d05 |     
   sh4aeb    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/382981fab3beed73ea9c01ac1982b6d03e5e5372 |     
    sh4a     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/f79e913994f3160ca40a484d49a32ed6037cf1aa |     
   mips64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/cda702b917f862d0c2aefcb5922173917695950e |     
  riscv32    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/0ed0ce746c403635aa6040f78ba75a85131db1ee |     
   sh4eb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/381fc2a51b08c6ac567e962ab69f3c8a57750e0e |     
    i686     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/c0c616900a840a41180651384872c8a46289c4f8 |     
 microblaze  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/5e943ebad75c2df1ef3179adbcf3e41b57b5c347 |     
  sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/924c34433751edf23a8504f7e4638fe86f8c8673 |     
    sh4      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/e3f798a02207c7d7977704cb2a479ee670b5fc91 |     
   armeb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/62691b056997eccfb7a04508a9b4d476590c640e |     
    mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/b5b7450d5ede291e6911f0e48da4eddf436fa322 |     
    or1k     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/dce8ce6758b275e6cef63e0227e8c7400dc6a54f |     
   mips64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/0fe88e4e9ab10ec4422e2b3926d5eba3884e7fd6 |     
powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/9961df5f640dcedb6ac5f4f2354b907fa7a44580 |     
   armeb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/ec26e7d2ac55a1aa372adf59cf31f4a65efd71ee |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/001c41746ef525ec3cac8f3e4df55123c0a6f35e |     
microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/07cec08db6305e5255ecbee7ef8bf6b0a8be2c05 |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/82434e27796eda91a2f0a2b8dc16b704ace14272 |     
    sh4a     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/7f30becc5316c26616fa650280c8a2c1beec881c |     
   x86_64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/e326189bebaca6610c2b648067c7dd2787daf622 |     
microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/8c2cb5d86d640729aaf8b227c26a93e9f61430a2 |     
  sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/db5a4f6891022253d1047b1ce61a92580f79281c |     
   armeb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/9d4f7bbdb3fa369e713356a6b7ce273b0015c3c0 |     
 powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/de2b0d161ed73ad4b3962a370b590c6c50c2599e |     
    sh4a     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/822a2d9c383e30db9c6b2d71c50a72d0fdf73a05 |     
   sh4aeb    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/36e5c59002da51428244e5f8b4fb4dfc72a2645f |     
    mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/c9510956aa19a5d131761794a841389da14a301d |     
 powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/d7475f1e7a6e1355391c6c1d36bb51f2ebcb0e7b |     
powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/7a352ea3441846d9ea0649eaa3ba0628f6de7567 |     
   x86_64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/7f1c468053584ce02aa6eef75f26680ad607143e |     
 aarch64_be  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/655c68d779dfb0ed7931a8dc35d94b06fe5acfcd |     
 powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/4971cdc3f99a3ccaca12a80e64c95d4eb3922cb6 |     
 aarch64_be  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/2c5f90646969d64746d943c1cf6b1ebb6480cbee |     
    mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/fdbab65f356a40a76bfc3dfc62ad02ee53cd0eed |     
 microblaze  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/b85421272f391f893dc3c06c4c93e76bda4e0421 |     
   armeb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/34288057bfc286ac064945c0b5205947e2163f7d |     
    sh4a     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/b01e170b4a1dba558c31cd86b3257a23d760d7d0 |     
   armeb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/68e49cf24a839c2ad171b3835c114f35d4fb1ddf |     
powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/ee21157b2a6c44c0171d68dbfc49974e7a763a11 |     
    or1k     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/c318e70f7750f0428f99628282b445c6f3b1a3d4 |     
   armeb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/3d20b16242a0e2de2bf34459a7935e7954b57574 |     
powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/3acf5b22339b08286308fa19fbc201a092c6cc2a |     
    sh4a     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/ee4eb46b83b52ac6065a138dd993db672b21d157 |     
powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/0064a6c7086840a791770162844a0e3d280cf2d8 |     
  mips64el   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/38fdf2a94ee908868b04838c30dab88e9eded44f |     
   s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/f16a7b71d5758152cecd5fa807626cf1e969c718 |     
microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/251f1af05c3c443f958091b5adf8cdb89926fbc9 |     
  riscv32    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/2e772ecb56c2715efb930e486ce436eca7af3d6d |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/2663af8cab8bb3164f097bcd90b9c1ee937c1481 |     
  aarch64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/95d9a3ffac098623ee8cbacd72d99e7e246a0b49 |     
   mips64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/26cc3bed992aeaa48fe80ba596bd9d6a7c7cd227 |     
   mips64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/bf2196072f28a9b782ec0fa98ab7b6cdbdfb32d6 |     
   s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/e7f78f1cab3934196a391d0fa420b68a6781252f |     
    arm      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/2aef2de5bf964e4c9793bd49ed2aa6848460572c |     
  sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/d9fcf93a51aa21937a80054ff9db700fe7e4a991 |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/1d7e557a5b12fa20530d9f4a9c8ad27dd2a3604d |     
  sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/d551ed63949822976a314015f71f768c9725d3a3 |     
 microblaze  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/2a446b26b3401b5ac71c08227b7c7ca3fdcd3109 |     
powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/ad0049bb80bf0d523b29d9a72c8c17583fd1e05f |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/314cc85c21076978cf16a316f6ae00bc3a357f76 |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/ec25318f08631206f66f0e6abcdd519474fbaa17 |     
 microblaze  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/f0d33f44ad861b980a204a85caf4de78e54f0dfa |     
    mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/2d51a36f01b7d80d6ed508b49d14df63ec4935cf |     
   s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/14892dae2574e326640af8c63773f2c29fb17d09 |     
   s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/3a7006fef918d65861427b119009d2024961d6e7 |     
  sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/97752c23b5f8d313449def06f81b64c861cfc5e8 |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/33496ff19b606f939f1a8069b73083c935b59b85 |     
  sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/501e8b005b079b0e97a9e4aa7efe83313308cb33 |     
    arm      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/e2d91a6a0913715ff250ddbb3ea946fed3189243 |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/f7d1b1a39d2fe117f541d04b6261473ec3b97532 |     
  sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/b0fbb140d5fcb56be867a54a8ca6b01ff20ac886 |     
    or1k     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/7cbb215fb5e9846be0060d344153f5c1600fcdc2 |     
  mips64el   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/1e1b94fd989209ca48eb5dcad9b852e5093f0d7f |     
  sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/c700f33a758e41c63440ceb2065929b2ca71bd57 |     
microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/74c6a7a8eb68b6b0bff5ab53e72ef563d3238e48 |     
 powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/1f0d6d4471680690002141716619d73cdae13b36 |     
   s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/a482315402d9740004918258e3379b30b485aa1d |     
   mipsel    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/3ea485e74229e630ee2269416e78081d3e752734 |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/c7e681218f87d24e95055d895f6d6bd2042fa7c0 |     
   mipsel    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/90e2d0f534b684aaa91215349ac874fbcbb8fc5c |     
  riscv32    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/05caa742c8d57e3a21be90a6e01956b3ccb2a465 |     
   s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/7ed01b04676c1be5074ddec7d064ec12f5f0ba4f |     
   s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/3e3bf149abee1a5a0b57add75be7c6a4995e8956 |     
  sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/0030b07006449236b2c9a645d9b7077da8d2e022 |     
 powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/0c787df861fe10a48cd5ff68dc6eb069d3ccae2b |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/c8a45b83766b90d68dbc8b69ca30631dc353cae2 |     
   sh4eb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/5e89fe98d1aa9ab7d5dc26edf3b00123e3cc7756 |     
 microblaze  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/fc1ffa9f0f44130884ab5b770e8dffcfec5cd0e3 |     
 powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/f83ce6ffee96358d238ed11dab0752dfdac13e7f |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/ad25646606b4ce93d829d537f72232e9c02a7b9a |     
   s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/7bc623920bc9789d6d837e1e0010e7eaaab586ef |     
  sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/5dd9fb4e422102c492ec46088eb731f183673d2a |     
microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/de46c5803d285d3469cd5b5255bc8157d863f85f |     
microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/43a619831b7201378f7cd24368dd8b8235a8878a |     
 aarch64_be  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/15e453ea21dd38fce0899382c6a42ffc0e6c4194 |     
powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/84090c7b58a76a60862adfb6a1c216e377133d15 |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/6abee43483e295b55ac3bac5a384cd76dbbbdac8 |     
powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/1aff306cc70621ed9ce50f34faa8117ee0613f80 |     
   sh4aeb    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/0ef6c53bfbaca309b2ea49bdb25ffe02a2914a68 |     
   s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/0efbbf183c933d6d145496cd123a05045c8af32b |     
   mips64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/f4c6594b36e626c7372546faf3ae13a0a6862871 |     
  aarch64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/7bb306fcef31aaf0ebd0b9bbf7ba9b1a9b972518 |     
    or1k     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/3d8afdfa22027487de475276f07acb39b8443f15 |     
powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/f2e8adefe245c311593494ec08dc063b0cc935ab |     
   sh4eb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/fef4bc18ec68c813972b4cc0d61a7a56dbab4fdd |     
  sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/213f601a5dba8d63fdf6b93a0201dfb8e4b744dd |     
  riscv32    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/18ef9c53f84261caa6896bdbb921551f7aea1450 |     
powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/62220612c279ba4e3293f476bdac7a59f79e4582 |     
  mips64el   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/7dfddd4d069a3b759bd6f9ea7da4287387f9bc90 |     
  riscv32    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/4a05613802f2b03409c08445ce543c107e56642d |     
microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/6babaa1e7704c6da9aa43a3e4d02e64d66f3e9d2 |     
 aarch64_be  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/559687da2510ce21ac5d08975ee9145fa92ed938 |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/3c6d995895d87832a8a7ca01db61206f780b2dbf |     
 microblaze  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/29540f58c3900d8ff80490cc608c2cb8901faee3 |     
   armeb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/c86c9d806828ee444aedf6b5cf8ea5e6fe3b7caa |     
 aarch64_be  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/b0780f2fefe951e2841a09d2bf717fe77efdbf1d |     
  riscv32    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/f9530afa328b67dca2a9653fad620e27b693adb7 |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/b6770a4320d91fe840e879eafcfde5cbf26eff4f |     
  aarch64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/80b60b15fda956dc352429d817ea288abd0c0a6b |     
 aarch64_be  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/330522bfc31b3acb2be5264c83b640e9bd002722 |     
   mipsel    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/59822375fbcdef644dce5098deaaa37b570badf7 |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/54232650831e86b69d1d8605babbebb880a14710 |     
   mips64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/ed0f9fce859a3c5a3b8e476c2f2a4b1599c0cb0a |     
    arm      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/b994f53763020dfae41ee60fc83a402a3e138d73 |     
    arm      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/977603ece717851bd1e2b63b4bb68ad856067447 |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/dc5ba96dcaf4a25e7818fbf70a8db71c975bb370 |     
   s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/e8f94ccfa896d8ce60b5c390ddbf1a26fe338706 |     
  riscv32    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/f3cce6cd80cea71fb7076dddd5eaf0a56240f7a4 |     
    arm      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/6fbef0659cde72169b0b2981d0e228dc4e05ef7e |     
  sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/a021fbc5e3e1cc824e947cd334837c76da93dba0 |     
    arm      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/88019cfe2ffc4009c7d1707556b9118799b5997f |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/b49aa6d8ec685df7eeee2d8b6df5e593c9e20412 |     
    mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/d655b35eabc18ccd9048be9fd1bafc5c233f494d |     
   armeb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/9bd09388d6df9ab9f44ccf4655d84b6a05b4a115 |     
    mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/1875ecf67a8b17edd8e8fd1f97ebd97a14f82cf0 |     
    mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/e7bbcf5fa2bcf677c7107b4ee862031bb27bc0a4 |     
  sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/815a04bf0a0464305e4064581ed97d847c35fd45 |     
 powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/60f85e8ae7c1a4d75c3ed9028d881648b1be8aec |     
   x86_64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/b58a7c2161a6854e30c99934fc88fe5b501e830c |     
 aarch64_be  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/29f71e4b2666926ec14a7eaeabcde7004236853f |     
    mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/098c04879afc7bd91b56ce516d81a73a4905e437 |     
    sh4      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/d23f3dc6c05ef43ec7fcb0a8dffbd04fd312e292 |     
powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/8a89cd9f2a53859498c04c443ec94438752dca3c |     
   s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/656256a7a874edf1e9600a442feba41bbc1ea46a |     
 powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/fb354369e1c3219887f656378213fe5925e08a4c |     
   mips64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/892c38d043c39d8bedb76f93e165dad341cb0f27 |     
   s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/51931c669cac7b968ab10baa96c1b46ba527701a |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/c0f4a3ab228715dbf1929be94bd4f0cb0a9bfcb5 |     
  riscv64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/f63fad0d0b8edce5ad1fc880fcffec2038f2c649 |     
  sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/f95f03309ad360ea64eef69c50588ad1a38522d2 |     
    arm      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/964a6143439d3312007e9b2eae88b43dee4f8ba8 |     
   armeb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/cc88bcf26d0cbd9f579f10fc9fc4bbfa342baa1d |     
 powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/e64f1aecbfd85eff00bfb82305f7537e245e0a16 |     
 aarch64_be  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/81eadfa570edba05223ac85af94fc3fdf05187e1 |     
   mips64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/ea621c61559d2e11e1dd30f9ff71d658bb80874a |     
   x86_64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/dd6883049d2f44da1435a0e3f6854a32834edb6a |     
   armeb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/7243a8700218bab88082e1327a71219a18617490 |     
  riscv32    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/3cd00000f3645644fe73ecc33069cb608969a2ca |     
  riscv32    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/fce6b6e2ea580a695f43581722691bb07dd21551 |     
powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/8c31c422699b4332dd4ba45631bcf0fe5aed19a3 |     
  sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/1394889c4243ca816ca75a42a9c9091b9d24f399 |     
  sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/6405315d3d3edbf9bd1a1dcdadbacf14d876fd76 |     
    arm      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/a220b1b251e4852edd6f620a04611f32b8c3d649 |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/b653bea00cd6267234f83fd231a74483ffd21ad5 |     
 aarch64_be  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/61e83e6cc88841700ea595873f43352288a79079 |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/bee1d025193b2afe10f4be620de96fcbfeee038b |     
    or1k     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/4e539d2751bd3e212c473d659361f74f459483c4 |     
 microblaze  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/99e446ee132dea8edf5cf025ab2fa2c3b4ced21a |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/d580bc3e7d5ae101c94d9d54bdbbb32f805e07fa |     
 powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/25a0441eab275bcb0956d33a3b90e8dfdb89bab8 |     
 powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/b46b70174e97fbb16cef9c73546b1c73a491bad7 |     
   mips64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/5338f7e0991dc2e5de471248fa4ae4d3be4041c7 |     
   s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/5c82860a64d4ad92b8b962c19d04699b2a920566 |     
   mipsel    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/6a16aed3a9eb766c3a559a05a84bac76f83091ae |     
  aarch64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/143a3232a7f42f40ff15aca903d6366e7c8c2b39 |     
  sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/4190226ffaccbdee496b62b8010a0a62d5159902 |     
powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/9bb519bf3179634846b1d0f08f4c3600b21aa915 |     
  mips64el   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/c08d9668cb721118f7c3b8d230ee92e5e8985e5f |     
   s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/e362931c9a4bc61e191589b5ba759bb39a28d951 |     
 aarch64_be  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/5d67eac8f378869fffbd0104d32542ffbeb4b481 |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/46a6122efa7ffbf9e9de2d5f63ccc631b3c7e522 |     
  riscv32    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/072b04d0bfc5f3d5370fddfc195d323d8988dc20 |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/08a39d599bebb173993dad2f9c3264b9c2ef630e |     
 powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/4d79e2cd591d557bdfcd80bb21659aebf60845e4 |     
  mips64el   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/946c5727f04a27390c229381b42725e4cc063955 |     
   mips64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/33f3ef8dfc5b26aaef028758af9dd7f9cf2b21ec |     
    or1k     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/476c60b37d6a14f01801505566c06ba1a182d97d |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/344ff801f6a7d21ef912fedfe2c3c16b66446114 |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/b02bf93cfc8afa39f49b7b7de757136f4515c5e1 |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/ddde47eb7d4f86b294def5b00ae4ec7cb082c112 |     
microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/fcaa13d84fa9ff67a9aacf929ada8be4cc7f15ea |     
   mipsel    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/71e3bd8274d67565b9c76a89d2ca1c5f708a6f78 |     
microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/a76dc0e143d64434beceaaa19f42d91a5fa0f4c7 |     
    mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/5f4ff5f51d18e89edce1339486b56f57f41c8ef7 |     
microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/524ceb9f49cfac2340e56d4c0ab3e7e7b3bd850f |     
   armeb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/0864cd77bc54be1fe6e7230dea4017b5a34c8f7e |     
   mips64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/195f9d7deb3b81127c76c5c88f0d65c522d4b20e |     
  riscv32    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/5dd1e9fa9e4655eebd5729d755cb23863d43bf25 |     
  riscv32    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/c1e5db38ff1188bc5e14372dab68be3725b7d056 |     
    or1k     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/1afbccdd57584334bb64b164bdb2bd4815580a26 |     
    sh4a     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/161a41580776f453ac3e14bf45e4d7bbc5e7b50e |     
powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/e82d1f2d1baf32a91a72d6485c46eed183051df4 |     
    mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/6061b80164d1ef66774b59ad3e1aed0764113260 |     
   s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/2f9ec4ae5b162d11f64ac3be4080b29a180612a5 |     
   arceb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/f49ddbe19bf9f73f3cd7e88a6248d94c02d5f6e3 |     
    or1k     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/ba7f0037b4439469b4ba166ea23e7d53c7773b11 |     
    arm      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/336d26dad4a959a2b862e30d6469d65ad942cb8d |     
 powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/c004df65d512baa1930e2a362729ee8cb60fb504 |     
   mipsel    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/ef7c3a8b0063aea6d20c18924522919419cd2ba9 |     
 microblaze  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/aa54d4727fdcac5c8392ebaeb7a8d0211eaeefb4 |     
    arm      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/efc397e6f11b29cb0662f9b1f8694c952a6e55ff |     
   mips64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/d2828ebe340f135351670c8c5ede7e5f2e4959b0 |     
   mipsel    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/957b5c66449eec817371c298c5b1e30ff91471b6 |     
    arm      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/827eee639ce08f54bc268fd6026454195fd63172 |     
powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/2f1c8d3562f247c9be62aa59f814b55e1e9759a7 |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/1b6164d2edf057feac45f2a5c0b97a8630bbe29e |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/dc984ff89f2c00b351bbfb917c339e2933761be2 |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/0800dcda8faebc70330e17015ccc2d378de827fa |     
  mips64el   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/9948d06272039285f518486c54923e5e53ae48ac |     
  aarch64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/e93e0535e87f38795ee54553e317e43e961a6f05 |     
  riscv32    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/a3dad7c942c12f2515d1a391d3e9748ef452e9e5 |     
   armeb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/7a388ed008a79793b7c11a126f1c44212e6debf6 |     
   armeb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/096d40e88ee2c939131d9275a5dc0a5d4073b8fe |     
    sh4a     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/0491516d1320bf496c9740c582012ddc2a21ed3c |     
 powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/1f2f9db6a5646c0c2463ccec38f3b078d8d7b3e3 |     
   s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/bf65bfb295648288ba25a9e712b830aee3cd420f |     
powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/7e168c89211be564be01e23aaa48455db6eecc9a |     
   mips64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/185da74206d667e55c945be3278bd934dbec588b |     
    arc      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/b5a5f787f2e5f699910c09fb7d844ff25b3ed762 |     
   s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/ae3cbe6679bd87295552b54eab7e019327b7e81b |     
    arm      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/8aa34f83efb110f75c359c87729d07fad819ba70 |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/e995c2adf60ee86ef305e5349ad562083fd04c3b |     
powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/9d5bc0e2f88e72858e79b7589918fa7e00f747b8 |     
   sh4eb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/d5eac92fae57940ae64651eb9a0aa435b04113b2 |     
    mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/942a59850526d2c027632b72f0e8502b9e15022a |     
 powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/16f93c8cd72143ea1630ba269a8ac6eb39dadf8f |     
  sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/127b2f0b697139c37c61d461e12cba52f067f4be |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/ad8256c5423c91d762093797e7111474896795e8 |     
  sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/85063acf49726c5a6d88ecc2218f11bf4e82489c |     
 powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/49027d9c4de7dfd15b24692216bea72a48333f97 |     
   s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/7c785077ddf61f1379f87acdf276eb94d8d89185 |     
   mips64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/b745eff3f0c0c1c0b4934ac51ce733a4515113b8 |     
    arm      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/c66b3965c8ce805e4548b0469a1f4b2a62419fc8 |     
 powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/ac55522f0fbe31743989a0116ae08b04e72b0763 |     
  mips64el   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/539fcae412041ecd14585df110bda97d9f96dd4d |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/e69ece5266854c3dddbec2202fbb9bbfa729efb2 |     
  sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/16097197a248529f54d708b52e60ddfa7f6e6c71 |     
  sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/7fbb2a39aedba0b66cdfa3c3751a998680f8cbbf |     
    or1k     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/c4fbce5a03f6977e4b9ae345b6a986546f834d89 |     
powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/a58034c97610c16391a46520662c2e285eb9ca73 |     
 microblaze  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/37da3a5176c6022412138aa4cb45821155b2742b |     
   sh4eb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/ab5e0f91a9206ff4834e4e01003cd357448d8c36 |     
  aarch64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/d518f5b541a11fe0ec47db226f5d5958d8bcf45a |     
 powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/3dba10c065a1c40eecd5c2b25be51101ff32b41a |     
  sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/154b8491f485639c9d46750926e9d354494a9c19 |     
 aarch64_be  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/4a3e13e5f8a37cac26b9b4b445d5dcbe3f9b64f6 |     
 aarch64_be  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/54df6bf6ced93e3c69cf50e28bdd01824d53073d |     
    or1k     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/9ff113f7c2930a2c29396ef04e48cc776227a085 |     
  sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/664e69be9f56d3e9518c88e3999c9778746ea277 |     
   s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/8c3ed252737f64522064a9f403250530c5c18174 |     
   s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/cb27113937de0fd06ae581fb3bdef0fd0fab78fc |     
   mips64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/8e6a876088905b96868fb5c0ff8c32d41977e436 |     
   s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/a890a762aad3a3068a31c7a614591858729277cd |     
   x86_64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/e2cb2377f5e08afcb77eae02fa8ee0f03a68e494 |     
   mipsel    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/ec64363a6a5f304abd98a3e4b2491ed7afd3cfed |     
microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/65cba3c8414454c0e50295c3f859e26007cea2e0 |     
 powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/886acba998a208335595d57cd3479d0ba20828d2 |     
   mipsel    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/dc3193731ec79c51e7c1c8d205adf35410519767 |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/485fcaf470ace76c2daf08a5f5a35c9b6641c893 |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/94cd543dfadec0bd531553c2a88667280866dacd |     
  sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/8c782e1270ef8c79677a7c5b02bfcc2d29c48e62 |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/5fe65514371703146089100ca519e328e6a47cc6 |     
powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/ddd6d71fcb0544cff6d13a3632578514d91bb8c4 |     
 microblaze  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/88526bdacacb342b3e1abf72fffb8e9e8ebc5033 |     
microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/039ce035798817eef59bcfac4c35521a76d7efb4 |     
    mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/30422d520d433e1261e50b8c562eb93bd0e13a95 |     
  mips64el   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/c429c7b187bd4f44bcb6b5b0ea478abc46023934 |     
 aarch64_be  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/20f87098b7c1baa63894533aaa0731cb1bc969a2 |     
  aarch64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/42a5f3f2cce954e775bc54dacae0c6e734c4b25d |     
 aarch64_be  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/dd7b25b32c3bc09e09258fd8ad8fb56e867309d5 |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/4fb1e54634198d92eb492a12e97cc00d7f2b7b20 |     
  aarch64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/d86b253720e0029ab56eef19200ab337cbe8d9c8 |     
  sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/a41cf5f2bcec81052f31336e56d099c9c905590a |     
   s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/1bf89ca5e2812cb2c29f050d6c22b13313c64135 |     
microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/e48b2bf1608e72abfb8f9edc0c07cde547283336 |     
    or1k     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/e1b0104da14c4074c4a2f88d66ae9bcd3913fa91 |     
 microblaze  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/9e8efedfe7380a99733206500625681c647969b9 |     
    arm      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/9a28220b8bc3d2917f1d6a6a202e67cb37074d79 |     
   mips64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/662c81ea38d754ce383dd6aa326f5bf70f5e8f2d |     
  sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/c29045cf0d6872b0b882cafbe3734f15f5d7c389 |     
  aarch64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/0edd07ef2b32196bafc84a7cbd5314be81ecb47d |     
 powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/b7900247d479a1c90ddb209d00325c2b90aadfa7 |     
   sh4eb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/9611ad7fe4e9551b9a6e326fbaff81e83e120db7 |     
  aarch64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/f400b68070b7ab1d9ac179dde48ca40836201ced |     
    sh4a     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/c37cf3781c68c41cbab0aa50e96950caa8fa4a91 |     
   x86_64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/55c6033f11da1205b9aae338e8ca6360712b4a3c |     
   x86_64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/8a7e3e40d0b3320622e9b1e2d37abdd9755184a5 |     
  riscv32    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/e4fbfdd9df006fb9373a72947bfa6b1bb5dce45e |     
 powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/ddb5a4ec6add453607a0119782e0315f84e081bf |     
  sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/3d3705e7c2b886f4ede586128e020bada6356cce |     
    mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/03f720b42fc1ace098fa5cf1f262685e00b42d8a |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/47e7877d79e6461b3dab6b7f6c3912bed027485e |     
 microblaze  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/1e552999108aebe40649d433469b9c9cc9a5d4fc |     
microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/796a67994a929391c865069ae639ae13d61e85bd |     
 microblaze  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/00845feab35436b351ae91f43ec8cccff6a677bd |     
powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/d4c34989303ab51344c53ebb7a500814b1b501fe |     
 powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/266cdb47cec19e577b7a684ee39dbcc19e92d8d0 |     
    arm      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/9a7e30463062f1ffc2c49cff0dfcc553e726e352 |     
    or1k     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/edc2e5f9d033ad218d51145ae01cab7c53928eb5 |     
   mips64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/bc3a452cc41d52349deb7f304891e28f5f763271 |     
microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/0c1880094a69bcc780221b1bed3c2395abf8a3af |     
  mips64el   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/c58cd96c34566c82fc284b5f2258c1a7867c299b |     
 powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/189ee218ab34a8e217648c5b1d5cfb5aa1cd30b1 |     
   armeb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/1e42c8369e85a23c713fe3dca83773c343a4b892 |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/54480158d75ab735524037fbe35b37c3e5195986 |     
   mipsel    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/3a5bad56a62ee49f00c0875e18117d14e743a3b5 |     
   s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/c5f26c9cda3fdc4b5a8843284dd15a62e915b916 |     
 microblaze  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/54e290c86fa4b8e02dd16f727476e00853f73a0c |     
   mipsel    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/6fba9257645be8475cf0f8ebc801a09eb256e01b |     
   armeb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/91bc7234901cf76c700e237964fa2b3269ae27ff |     
 powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/3153e9646d0a3b0634dbfd16fcd1bc30c8c254d6 |     
  mips64el   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/6e1f392056ed9dcf54a238d26b526a74d48b8b43 |     
    sh4a     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/724430dcf8524c18d1fa0400b9609db8da243b88 |     
   mips64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/a9632b82f532105649f236b896abf10d7187e18e |     
    or1k     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/e496e944bfba79364a1fe1b34bc8fe77f5381c0b |     
   sh4aeb    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/c1baf629f3802b2c3bf31a11bc2ac84e23fd9d42 |     
    mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/9de7c03d754555314813d0094f49de2060787932 |     
   armeb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/2be567fa9cb62cb871074e16f0b5bd68119df9c7 |     
 aarch64_be  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/b51365a77d28f679b57213b2ec03184b9c25963d |     
  mips64el   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/718fecd697ea585756257d9230715978a7ec55d8 |     
   armeb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/80bb5edfc0119fdadb5c9e847b95604e192a70de |     
   armeb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/a8a3c6ea4a66e51ad494328f7bbc20f3b04047de |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/a29b7a7f00dc7f05ec6e0effa2aff2c62addc8eb |     
 microblaze  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/0bcc2879d6791b7a1ce6f157b99e2611569cf5b2 |     
 microblaze  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/ee9e78759a0c663382165c210ed9cc85088de35d |     
   mipsel    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/4458f4dbacf9765ce3035c866fd19275f8ce833e |     
    mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/aeeaf38170a0806447d386cb09d11304888886a6 |     
 powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/2ee0ad3e28e2870d654208a958adc66bcc7c6c2b |     
    arm      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/5babcc1acc706d92f582c61b7316b11f30f2d3ec |     
   sh4aeb    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/c16eee633cc6b7370fab97bcd4800054306f385d |     
    or1k     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/1db540d716c497785d1748a8ac4f965637246ac8 |     
  riscv32    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/9cb9706a4cde2fad896190843e8fe78a03353231 |     
 aarch64_be  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/04b9b9dd754bf98e46eafa45d4a64998c179e217 |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/4a27371e80122f8f466ababf35f4801b3663c81f |     
   arceb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/179ff2e5e6d7f22df850e3ab6396361b8729c266 |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/82c122cef266a825ac8c993fd6df17704481c3e5 |     
  sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/8104624e204485eb790397de30c2a4718f09fdea |     
 aarch64_be  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/464542199b31f546d963efdd43c9041463641402 |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/30c31b95429b52bda2cae39382c115f235fdeedf | ORPH
powerpc64le  |    gmrender-resurrect-0.0.9    | NOK | http://autobuild.buildroot.net/results/91ae63685841d4c385a89e76114e875b1f4d1942 |     
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/6a44a5259bd5ddd7712644090133532b296bcc52 | ORPH
    i686     | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/cb62ab5da51bb4270f10973f5ebecb3ee1f42643 |     
  mips64el   |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/a4387ad5da94ec113c3edb718c9907b945d1cef5 |     
    mips     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/a24d76f73cbab80a47620f3c3fb6bc9315177869 |     
    arm      |          hdparm-9.63           | NOK | http://autobuild.buildroot.net/results/237dac7049fbbf0e303a12a9038536f9b4856301 |     
  mips64el   |          hdparm-9.63           | NOK | http://autobuild.buildroot.net/results/3aade88e217f0aeeccd83c11ed1e662ca8004de4 |     
powerpc64le  |     host-berkeleydb-5.3.28     | NOK | http://autobuild.buildroot.net/results/f1c0405bcad70799c4e8268bf29f16910fd641fe | ORPH
   arceb     |     host-berkeleydb-5.3.28     | NOK | http://autobuild.buildroot.net/results/6249939bd0d59b8279199eb128a5cff362eaf8b9 | ORPH
  aarch64    |     host-berkeleydb-5.3.28     | NOK | http://autobuild.buildroot.net/results/82b19d4fa45001a0662f398deac9a55ba67b8953 | ORPH
   s390x     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/c108e7b27ceaa70d226e5d4729ac03973d6e235a |     
   armeb     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/a39bd802fb5010e66237be3188ec7b971a081e85 |     
    arc      |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/1b76303bbd65f30b172ce9597911a4606044516c |     
    m68k     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/bab272e183b16d7dbd443e139fb0c4ba112a8ca7 |     
   s390x     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/a8b0a92f5b90f97fb092b11fb5fc4243ae1fb3ed |     
 aarch64_be  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/4b3c0d3b34747824219f69888e2aa02cb874dfb7 |     
  riscv32    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/f2946ca3dad37a6d691855d9f9ccda8801eab0d4 |     
   armeb     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/b9da3f789fa99a56a1eee481db9efc2cc0b27d3f |     
    mips     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/33b821d5446afe0e0ce120383ceca05c160abd1d |     
   mipsel    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/414cf38e2a8cfc66cf0028a37d995a6d49e14c62 |     
 aarch64_be  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/b3c0847b264586562462568e923e84fbe2a312f8 |     
    i586     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/e4c890b6ce6c0165637465175af75c7e67b62e35 |     
powerpc64le  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/918b0dd1f146f6cbdf236de89abc87a6b1f07cda |     
  aarch64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/7e130b48f6c9a5a882de3c0406b3f0fb1cffed96 |     
   x86_64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/041696626e1ae703d455228022c18080039d7fea |     
   arceb     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/9258ed51929cd8cef2ddc03f3f9fe4c4fc010215 |     
   sh4aeb    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/7e637d2d1b9d4748a91bc84c697e0a80f9e54969 |     
   s390x     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/eb3798c7ccd13bed02be7d59e565b1c9ed1d53a0 |     
   mipsel    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/679cca546e438e2245e4e9a3a2d53e3cacb08f54 |     
   arceb     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/8de0ae839b9f28e0f2960564d57c7a30c7a4892f |     
    arm      |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/5fd1f393ede2c541b0bde7201249eec45beb8318 |     
 powerpc64   |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/9542ed571ece82c4dc3a00767097f30d9568911e |     
   mips64    |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/d8706731c5529c11a5dfcf5dceec707c0efbeac8 |     
   xtensa    |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/1144b847ea0d4f8a7c4852675b343d8f1521fa06 |     
    sh4      |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/13dd578515270d251a49edc0fbaf4f8aff2c8e3e |     
   x86_64    |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/d97df9946146849141479e336f4f2fa287e949d2 |     
powerpc64le  |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/4c6e903ff4a6319971d9b3b07cd4b569682cd01b |     
 aarch64_be  |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/fc257c615d578b0a8927d614185f674ce60390f6 |     
  mips64el   |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/fd1f5fd111336e9b1696faa4bb627aa1b2ddb190 |     
   mips64    |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/1e1f99861f41a980edc3b41c6ae9db72be6f9fb8 |     
  mips64el   |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/ee4d25f22176642c10ccbaa79affddade485077d |     
    i586     |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/e1460c3b1902ef85ef33a1fa8678ec11dc054223 |     
  mips64el   |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/5398c1fecaf00d83359a2f0fdaa525cf9440d17a |     
    arm      |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/d1e8a194ae04252dbdf2e7988ff0a44c566b4eb5 |     
   arceb     |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/be5e57bd5b54ee52f854e053baec87e785fd2e04 |     
   mips64    |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/ad6c29fc35c05d7cf91a1301973638223c272509 |     
   sparc     |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/c9ba4e6d8c5099780465d40609c9e653cc5e6451 |     
  sparc64    |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/65bc4fa2e50c83ebf247323cd4e8e20322dbc3d9 |     
 microblaze  |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/64b25cf5ebfb2b572ab8f06a7062b777eb69389b |     
 powerpc64   |       host-gauche-0.9.12       | NOK | http://autobuild.buildroot.net/results/624164e8f3f45cbbfe6cc8add2b4990ac3eab9a3 |     
   sh4eb     |       host-gauche-0.9.12       | NOK | http://autobuild.buildroot.net/results/6bf9cc5ff7b1b8c0cbcc3a9df9ab4faa35876c27 |     
   mipsel    |       host-gauche-0.9.12       | NOK | http://autobuild.buildroot.net/results/bff8bb4a7b457bb25af6f99e14f9b6d81e08605c |     
    arm      |       host-gauche-0.9.12       | NOK | http://autobuild.buildroot.net/results/c58042b240fecd7d747e4ff96a25e4bd9679e8c2 |     
   s390x     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/01bc419bf0107cc06a9d7a3d05a4f803825ddc59 |     
   x86_64    |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/ef7b5b83bebadde15110d202e1eadcce29ab50da |     
    i686     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/0b40d7045b339fa2584a39c87fc57da6056dd81f |     
   x86_64    |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/d626b2edda9df2fb91c5c27d1a34064c15fb23ce |     
   x86_64    |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/eefe5d2103b17ba0740d008f885b14025c909e46 |     
   mipsel    |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/813cbb0bbd63a2f6ff360dfab389d4faa9e20878 |     
   x86_64    |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/a199a12395b3055d21e85361c6c4bf0cc3b60e60 |     
   s390x     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/64526010ca66b7fe548a8a51564734138d61c990 |     
   x86_64    |     host-gcc-final-12.2.0      | NOK | http://autobuild.buildroot.net/results/1f1d8420de31e7c20bf38db81f2100d18987b3af |     
    i586     |     host-gcc-final-12.2.0      | NOK | http://autobuild.buildroot.net/results/1c0efb41b23576c73af9a9fc726ab8b4bdc0d518 |     
    i586     |    host-gcc-initial-10.4.0     | NOK | http://autobuild.buildroot.net/results/ac6d021ea0adc263b9612926f05c3e17da7c009a |     
    i686     |    host-gcc-initial-10.4.0     | NOK | http://autobuild.buildroot.net/results/b8bc53be9d2fbc0754bacd865c18b1054ed8819b |     
microblazeel |    host-gcc-initial-10.4.0     | NOK | http://autobuild.buildroot.net/results/df935fce3610adbeddb4a08decb9d390ddffb72e |     
    i686     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/650bb4ee3dac54914ddcf4be5c82f2edb0bab31d |     
    i586     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/5722e4a1d746f22cdc15e0df847341b84dd3ccbd |     
    i686     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/c875e6cde769e416bd2fe7bb058b5e771d679e01 |     
    i586     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/788e5da3583733517d0bf1da27a67d74546b7a38 |     
    i586     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/e256871951c740573eb1ff7ee91ae89079510152 |     
    i686     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/1cf8896febac7e411d4cd5eada17c7c0566f823e |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/601c072354b07d3f2965d7fc91c2e998d9e07e14 |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/9e45236f904df8305b4effbfbd871e36cfad91dc |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/70c92d9969d7451987169c10b75eb183392a0653 |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/798f9ee4016c7ee2f2d45cd0f093b2cc6aa33b28 |     
    i686     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/28fb5894526afdcc76fd4d9af5df950a69603e79 |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/26ec2e00722ea6f24aaa666309c55663edfbe058 |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/e039ed3492d5d2d3411f5f3cb86972a5fabfe0e6 |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/6141a408c59636b396bbc571fe8df27ccc3d5e80 |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/9382a762afae45c71b3c12fc99257f09b78005a5 |     
    i486     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/1301ddd7092d2f969494bfaaa4c2639a1be8b7a2 |     
    i686     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/f1cd20e6e20181f378304d5222d3b833619d057a |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/98ee7ac394e210259bc96089a59b69d96d0ad698 |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/bf8e87cda21e0061a8bdd55fa8e2340e492ee73e |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/7c56a1d8029597348b9f9fa874258e46874736aa |     
    arm      |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/5ea573da48524e57342a283c2143515cf5f07df3 |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/b5fdd9796eebd8651811660b113c8b397c708a98 |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/22ba92bafa28eeb80de55ed5893dcbb72cd2523f |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/b9cadfea141e6b6c9b6707b367e84b641b9c30a1 |     
    i686     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/34b8a46c0cad8ca1d77e80266aaf1b43da92c2f6 |     
    i686     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/013f9db7c6eed2ee84315a11b85b2c5fc702ee62 |     
    i586     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/937d39a6569aedd301c67e0575e07e3fafa2795b |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/fdbb6731b0301f57e12032978127e27ae0ceaf84 |     
    i686     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/4783ff2933897097572e9a8c213aafd7f28f61fe |     
   nios2     |    host-gcc-initial-12.2.0     | NOK | http://autobuild.buildroot.net/results/992ddf300da2087f0f67f45a5c1a62040530109e |     
microblazeel |    host-gcc-initial-12.2.0     | NOK | http://autobuild.buildroot.net/results/dee7415920b099871b24108d8c75385bddf7b417 |     
   x86_64    |    host-gcc-initial-12.2.0     | NOK | http://autobuild.buildroot.net/results/393daca4960dc05364c768bb5f24c288b31cbcd3 |     
    i686     |    host-gcc-initial-12.2.0     | NOK | http://autobuild.buildroot.net/results/b8a9dde0c34c944398dcccab2fb4827b9ff436dd |     
    i586     |    host-gcc-initial-12.2.0     | NOK | http://autobuild.buildroot.net/results/d57f860ba928f86f37e2ddad3b559e3db64aa7ee |     
   arceb     | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/1b73e72875b295272075d7fe7d8da2c917916fda | ORPH
    arc      | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/4e51d0531ed46d812ca037370469a8ece268bd75 | ORPH
powerpc64le  |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/1e43d1a82ae785ede6d8c0fefa598749b4cf3d5a |     
    i686     |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/e1cac018f8ddcc48ed6c3d3debb8c1dccd40291b |     
    i686     |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/9e5c426a075e16d67858522653574d0de93dd4b3 |     
powerpc64le  |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/c5e4ec18608e261439a91dd5e1ca2963e905f24d |     
    i686     |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/1ddce861ff5816a16f54ca341d0356cb8a131643 |     
 powerpc64   | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/ce9ecc3ac3261e12a0eacaa3e879fd7b36dd1ae6 |     
    arm      | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/96c8049c7f780b158bee82c872f9b0946b62abc8 |     
   arceb     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/7b10b917ce0366e15b1e537d42b3488df24176ad |     
    i686     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/66ac66aa0fc2b66dcfed84f7edda3bcc4eaac38c |     
   mips64    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/e6a20699d5f1d42bc79f26e879386e7c88a05187 |     
microblazeel |     host-protobuf-c-1.4.1      | NOK | http://autobuild.buildroot.net/results/de52f39be358f786e68b69636447186c1aadc9fc |     
   arceb     |     host-protobuf-c-1.4.1      | NOK | http://autobuild.buildroot.net/results/f4b2cc931b291797906b0b7a64f39205528cab51 |     
   xtensa    |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/288685d037f47e9726e92b53540a48ab294cf224 |     
    arc      |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/f2268ad9734a018ffbd6219c1f2b0c119629224b |     
    arm      |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/14ba6b581ec22b800a80d3d51ce33e796fbb708c |     
    i686     |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/4927346428d6bd16120f39c9962c8fb1dad2fbf8 |     
   s390x     |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/736dc5da697a354cd6a58a94598be141ab5ab0d2 |     
    mips     |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/5c942339e6e6342de903f620c90da4e8710f6341 |     
  aarch64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/753660e7a57e00b034a0989176d3cdca5ff1fba3 |     
   mipsel    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/bd07d1b02dc2d3eb06135bfe739df9fc3d965f87 |     
   mipsel    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/e8b9c762c62f31ea429d6b39653e6b4b99aa84dc |     
  aarch64    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/5a9a6e06f081486bde1ad9b5d2074626c4b0e9ec |     
microblazeel |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/e1c59743ceb7b91e9bb68182486bc5e3d9d57c84 |     
   sparc     |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/a881f562fdfd300567ef51b2700291e1bdbfb094 |     
    arc      |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/627f7240095264cfeb6e91c6e4d657e363893a8a |     
    arm      |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/4fac90367a5b385aa02996f2ee38e75021000909 |     
  powerpc    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/e38f00a1edc15cef8cbbb5a0f4a521bdc941e13e |     
   mips64    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/8749da3e12830c3549097fe423498e56f34fc240 |     
   mips64    |        host-vde2-2.3.2         | NOK | http://autobuild.buildroot.net/results/6ea39a2c0f4341fd8c52d5058ac9c035b2d63935 |     
    mips     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/21f2e328a5993016866c42ae701d156186a23b36 |     
    mips     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/e73756060dc3919a84d0d43379a6cdb1beed6ac8 |     
    arc      |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/5e8d8e8c8752d7627635a6ba462df2a7322fe90a |     
   arceb     |         lcdproc-0.5.9          | NOK | http://autobuild.buildroot.net/results/8061018dcce6759785ce040bcac57b1cb21fbf5a |     
   sparc     |         lcdproc-0.5.9          | NOK | http://autobuild.buildroot.net/results/e7d07d8cda8a9bf3a2c0f59102a7b07d490d050e |     
   mipsel    |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/23d8e4a69886bd09bf35f08624a2f42420410048 |     
   mips64    |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/46bdd574238dfff75f0f1060bc915d4389a6186d |     
   mips64    |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/c2839a190f41b5d44ad08ff2070dc74147f3dfc0 |     
    or1k     |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/b48caa9c5d1738824645991b7b0ebf760bf8ed7a |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/71539cf685b35b72c8d9cd105c6e6a7539806468 |     
  riscv64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/8fc724654729930fd02f79dec74162a841fe16ef |     
  riscv64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/f68ef83b5edc5a1fb75a84fcf30b9beb4e969e11 |     
   xtensa    |          libee-0.4.1           | NOK | http://autobuild.buildroot.net/results/958643368a933a86a0b4262dc4c6cb5e99b12dd2 |     
   sparc     |          libee-0.4.1           | NOK | http://autobuild.buildroot.net/results/9160847c67d8d7490bb31ff1e9a14fac16f20df9 |     
    arc      |          libee-0.4.1           | NOK | http://autobuild.buildroot.net/results/8ac19dc8f393d5c7075b2742949d45b513cc42db |     
  mips64el   |          libee-0.4.1           | NOK | http://autobuild.buildroot.net/results/eae68dbdf96b990d00e516310cf04777740c204d |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/218ac4413549104f7b6b3311abd0c2bf3f1120c2 | ORPH
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/d9974bbb1f41943d6c971c4b4afb482487c9da3b |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/a6c7302a4e08b56c9dc547ce5cfc4d1801609157 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/7a2e64905e85897ff575fa98b7f3ab0c287e2b0b |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/ab08700ba883e4c46bbf0a73a635901f456f9736 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/84ca0e2d0ed29deb857ed360bbd311670d2b9a87 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/5b504a5b413881ab2c22d5c93b1b91439e5c7f6c |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/5a86ae574a5178a3dda88c0286f57edb8f450ed5 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/a313d414e4d1e44e95b07929a24f1edb029e3d1a |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/6d5ebd6ea8a11d94ba01efbbcba2f7791fab970c |     
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/61e58b4aec16fcca90fe42ecbe33574f4dff4b1b | ORPH
    arc      |          libnss-3.83           | NOK | http://autobuild.buildroot.net/results/78ea2d623e899879b309373d1c97e70377b69ee3 |     
  aarch64    |          libnss-3.83           | NOK | http://autobuild.buildroot.net/results/ee9f8a4a7c16f8c133736e56fb44b28f3bc0e307 |     
 microblaze  |          libnss-3.83           | NOK | http://autobuild.buildroot.net/results/18b7469f80d35aea3033ee3a9ad0894c71e84731 |     
   mips64    |          libnss-3.83           | NOK | http://autobuild.buildroot.net/results/394df79a079f4dc2182719f9e4fcbe45ed09299c |     
    or1k     |          libnss-3.83           | NOK | http://autobuild.buildroot.net/results/ee872c5f652ef4e5e9d1e3212f8818ecfd6a5c5d |     
   xtensa    |          libnss-3.83           | NOK | http://autobuild.buildroot.net/results/23840143c63724059ae8573e6ec1d3c1dad34a99 |     
 microblaze  |          libnss-3.83           | NOK | http://autobuild.buildroot.net/results/56d889b515f1f963a68d9779f8cd1c011a59d723 |     
   sparc     |          libnss-3.83           | NOK | http://autobuild.buildroot.net/results/86058063275b6806ebfc0e16cc793e943681d180 |     
  powerpc    |          libnss-3.83           | NOK | http://autobuild.buildroot.net/results/27ae94c7386260ffc0cd6ba98fb7a13ba72e0a16 |     
 powerpc64   |          libnss-3.83           | NOK | http://autobuild.buildroot.net/results/d0b7feb5ce50e0d0712608a7a93181f24881332a |     
   x86_64    |          libqb-2.0.6           | NOK | http://autobuild.buildroot.net/results/c135de188466368489ffb4d979a67861802c85b0 |     
   arceb     |        libsodium-1.0.18        | NOK | http://autobuild.buildroot.net/results/0be1b19028eb2a67ae5279eb9b52ddbd523c38fc |     
microblazeel | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/4d855c06e6549f01169d48b23bd4f8ae44164bcf | ORPH
   sparc     | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/2515a9e108bbdbbddaadffb096bf921010943b50 | ORPH
   sparc     | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/08fb023c339e632fd4da7a801df155785583b841 | ORPH
   arceb     |        lighttpd-1.4.67         | NOK | http://autobuild.buildroot.net/results/4a49f34f3cab4ae1c619f82b673db5a508118ec6 |     
    m68k     |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/32cc6ae069b38c496eb91763cb08fe432986f3cc | ORPH
   nios2     |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/8b23a989f881c4600aa8dbd7ad0c777852b8f233 | ORPH
    m68k     |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/c57c122a7f0e1a037d356ef10c76c94009c64ff1 | ORPH
 microblaze  |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/3221a0baf1694081843f64dc56fe27c9a8fb31d9 | ORPH
    m68k     |           linux-6.0            | NOK | http://autobuild.buildroot.net/results/102ef4f864a61c30fb1fe7d0682a01cb3951b03d | ORPH
   sh4eb     |           linux-6.0            | NOK | http://autobuild.buildroot.net/results/3cd0ddf1199539f4d9b1af84e0552390e5ff8deb | ORPH
    mips     |           linux-6.0            | NOK | http://autobuild.buildroot.net/results/fd6083c961e2d92fab3be241e77dda630169639c | ORPH
   arceb     |           linux-6.0            | NOK | http://autobuild.buildroot.net/results/4ed011efd9ddabbdae5c044b37d301831e053ede | ORPH
    arm      |           linux-6.0            | NOK | http://autobuild.buildroot.net/results/16a77c9f8d5e576df3792673a7f1177a45ed2609 | ORPH
    arc      |      lttng-modules-2.13.1      | NOK | http://autobuild.buildroot.net/results/d05431609b28abaa5f8d7ca1250c552ee9217faf |     
microblazeel |           lxc-4.0.12           | NOK | http://autobuild.buildroot.net/results/5781611516e01dfe93dc126f8d0d5ce823ec794f |     
microblazeel | make: *** Waiting for unfin... | NOK | http://autobuild.buildroot.net/results/b515410f7f5ce09f2c1a0a33b1074a866c200d8f |     
   sparc     |        mariadb-10.3.36         | NOK | http://autobuild.buildroot.net/results/613373a78b51865bc1b16b526886da8838ac3dcd | ORPH
   sh4aeb    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/4c37d1a573073148bb8595e53e235fc9a5b96b86 |     
  aarch64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/ca003c8dde67101696d37aee83eb659b61be12ed |     
   xtensa    |         musepack-r475          | NOK | http://autobuild.buildroot.net/results/8a776fc2bbe8d5b498d3198bbca12b1ec1283015 | ORPH
  mips64el   |         musepack-r475          | NOK | http://autobuild.buildroot.net/results/a1ec22aa8870bc99c1823f4eb5db20436601c6b0 | ORPH
  mips64el   |         musepack-r475          | NOK | http://autobuild.buildroot.net/results/d0defd5bb9db08dcc8e716aa4bb0460d41b48be6 | ORPH
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/52eb2a5a05d2a5a370565feb806447cbe38e40ed |     
   mips64    |          ncurses-6.1           | NOK | http://autobuild.buildroot.net/results/0b1df05feb7e76dab92e8f557fcbbc71d0962df3 | ORPH
  aarch64    |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/83134a6b2442a8253ea35460851a34c08b4af19d |     
    or1k     |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/a7e8c90d7ee6aea1d83192624770ac57810ea795 |     
    or1k     |        openpgm-5-3-128         | NOK | http://autobuild.buildroot.net/results/111de411b453620c9ea288b133adea88459ec57a |     
   mips64    |        openpgm-5-3-128         | NOK | http://autobuild.buildroot.net/results/6ad906749e0e949046e4cc721c94bdaa8f145e23 |     
    m68k     |         openssh-9.0p1          | NOK | http://autobuild.buildroot.net/results/a192a2e7f7ebe964b4df9fa8b587cb023d7d9bb1 | ORPH
  aarch64    |         openswan-3.0.0         | NOK | http://autobuild.buildroot.net/results/1feb9e404bdb4296aa444052a456885e28479aff | ORPH
    i586     |  openvmtools-11.3.5-18557794   | NOK | http://autobuild.buildroot.net/results/c9b63855a90530ded549473d6190ce4c23cf09f5 |     
 aarch64_be  | package/qt6/qt6base/qt6base... | NOK | http://autobuild.buildroot.net/results/1f51287fd4de387a155991727aaa8e14fd358049 |     
    or1k     |        pcsc-lite-1.9.8         | NOK | http://autobuild.buildroot.net/results/7ba3f6da3079489b74b39457256616c317f92cf2 | ORPH
   arceb     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/c6479517e5ee98a7a8953fd096559d8bead598a7 |     
    mips     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/629c1c5036de21f10c86519cc7eaae050c4b4ae8 |     
  mips64el   |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/50379d582726c92be522ca33b56fb5ab32059ac1 |     
   mips64    |      perl-net-ssleay-1.85      | NOK | http://autobuild.buildroot.net/results/d7762d17b1ba9c151e66ce67a41fecb53f3546cb |     
 microblaze  | pistache-3ec9d7c4f8b828fdd3... | NOK | http://autobuild.buildroot.net/results/2f82fd9a98da78deae83a4c15dab096398ed2f1d | ORPH
   xtensa    |        poppler-21.12.0         | NOK | http://autobuild.buildroot.net/results/bfe9e6410a16d3b74e886195034a90bd55e4ca33 |     
    arm      |  python-pycryptodomex-3.15.0   | NOK | http://autobuild.buildroot.net/results/bde442f4fd25009a3443d2f9ec2ff683124271be |     
    arm      |         qt6base-6.4.0          | NOK | http://autobuild.buildroot.net/results/cdb23094d7f27c51ab82f7c72bb91d0a838c2649 |     
powerpc64le  |      refpolicy-2.20220106      | NOK | http://autobuild.buildroot.net/results/c0ec443037064015fd4f71383da2b746cdb4de9e |     
microblazeel | sconeserver-8d1935919a20133... | NOK | http://autobuild.buildroot.net/results/dcb31ec8f4d07d0ce76ec38ca7c993cc11e0d51a |     
  powerpc    |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/fa50faa426185652eeb489b4e260ec22929d0b42 | ORPH
microblazeel |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/c1bdfc87426a59ed04366e3c0d9c024860819acb | ORPH
  aarch64    |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/d07f8dd1cb824ad1b19a6eef9f9fe0f4273afff3 | ORPH
 aarch64_be  |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/642bd6df0ca171916f561a84c3a2dc652d4b5f52 | ORPH
 aarch64_be  |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/6af423281aa59d9ce41ffa24bbcdb8770a570585 | ORPH
   xtensa    |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/fbe1103f2f4f766f39d3708bb4fc1dd80306f8f8 | ORPH
   sparc     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/9ae1ae8088f2e6f5b4af8cc7f0a39c6ccd8e363b | ORPH
   arceb     |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/32e3cbd0386ac9da32ad61c823cfe5c9ff8c1e7c | ORPH
    or1k     |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/b49c757de1dfb5d4e1402e77023a4d9cf1b054c5 | ORPH
   sparc     |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/2bf99aba6769a328b081f0f03c291829df63cea1 | ORPH
  aarch64    |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/3cb1f46816dd5b5da1745b15b256cc790fdeaf20 | ORPH
   arceb     |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/53acf9a2c89100a19c977b389f861738899935df | ORPH
    or1k     |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/533eb346ccbe2b27b0aea8c58d4c6db9185293d7 | ORPH
microblazeel |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/0fef1550dd7c8c42efd499f7baf9af1539cf2e86 | ORPH
    m68k     |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/e24342bfb48a7b9ba0caccfd6ba7c3b5ee552c65 | ORPH
    arc      |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/ed6bceec818095e36324744eb51c420f38f83bd3 | ORPH
   mips64    |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/130e7d637bf8e64e9507a918f789f8df0a2fc498 | ORPH
 microblaze  |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/8b3edee414c679f9fb1a51a16602aefed25fb54a | ORPH
   xtensa    |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/433bf62be5a73436f4f22eced24a8e4903cbe4bd | ORPH
   mipsel    |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/aef29c8898ae9b8349c334d17f0924243cabf77a | ORPH
   mips64    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/36333ccc6e27c8e46eecdb275ea3db8cfc1f6230 |     
    i686     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/7f8b65d5ca7f55349470f43794be220b2e19a579 |     
 aarch64_be  |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/88fd2b79a6767464ad62cb99c831903999793d3e |     
    sh4a     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/d840044a2fff4437f51d7afd1e7614f3fab68c15 |     
  aarch64    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/a70eb8f59653946e88fba6effd9fa329884db89a |     
   x86_64    |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/cea77c022eafab388084daddaf33ab9bd5efc361 | ORPH
    arm      |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/ed2b4a3926f945cea6c53a5250fa6b67dcfd87bc | ORPH
   nios2     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/dd2216a7b1cd14a9d7e154bd969c2dc5df3b4c83 | ORPH
 aarch64_be  |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/9991a22980c6e49c7cc119370f2d530d70b7d402 | ORPH
   mipsel    |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/4fc494a10d89324277b29e19f531f7ba997ad518 | ORPH
   mips64    |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/8e5e1f160f3df784f0129066a9e32be784605cd1 | ORPH
    mips     | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/2f8f58282e3ae423e4f793c274726c1203c08ec5 | ORPH
    mips     | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/e968473de74c6ee91064331370c2025944734046 | ORPH
   mipsel    | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/cdec55588089445c2288dc360d2fd86315843812 | ORPH
   x86_64    |        trace-cmd-2.9.7         | NOK | http://autobuild.buildroot.net/results/6330ad2aecd919de3a1e34bfcd7dc96a4640154a |     
    mips     |        traceroute-2.1.0        | NOK | http://autobuild.buildroot.net/results/88b0993e2139859974be8175e09b80d4504d982a |     
  mips64el   | tstools-08f6be304040e7b8476... | NOK | http://autobuild.buildroot.net/results/2ee713610c330bd234fad5872ae18e0d83ce7e5e |     
 microblaze  | tstools-08f6be304040e7b8476... | NOK | http://autobuild.buildroot.net/results/61117f4682410d2a9b1cb1a2a69257967fd63c86 |     
   arceb     |       uccp420wlan-6.9.1        | NOK | http://autobuild.buildroot.net/results/57a9e2a40fa250d24bbb15e4d57eed5d264778e3 | ORPH
  riscv64    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/6325f4a14888cfe56af4277f902499c2c125833a |     
  riscv64    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/104a943cfab7ef9671bee3d46d678493f4060db7 |     
  aarch64    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/8147b779bcac9f5d548068fae45f7b44a1f576b5 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/c6a707a9cbd630939dc971c41805c94de24a2854 |     
   armeb     |            unknown             | NOK | http://autobuild.buildroot.net/results/7fe215104b9a22ee7be03a8db64281e03c02859d |     
   mips64    |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/522d13a6f2ddb38689ebd5dc764fc7a8ec73e05f | ORPH
   arceb     |           vde2-2.3.2           | NOK | http://autobuild.buildroot.net/results/314c2ad51762184d2dee7c9a5bd8d9c3e05a2d78 |     
   arceb     |          whois-5.5.13          | NOK | http://autobuild.buildroot.net/results/896ee456c7e12413a4c32c17c2747ef21190a201 |     
    mips     |         wolfssl-5.5.1          | NOK | http://autobuild.buildroot.net/results/dd21f47b89ce8fe7597105c3685fdc3da9700961 |     
    or1k     |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/e9e88e7c11750065faf4c9d7955a43fb31f15df1 | ORPH
    sh4      |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/1ed80a485d97965cb8691d2751c1b145c97e77d9 |     
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/13f3dbbe7d3413d05d95e05379b9bb3cb13f8aff | ORPH


Classification of failures by reason for 2022.02.x
--------------------------------------------------

            igd2-for-linux-2.1 | 1 
                 wavemon-0.9.4 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/6bcd5a3f2d6ca576831c0d5b4c90e98b17443dcb |     
   mipsel    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/28f889889ce7a7056a1cb60ce45c22934ee47514 | ORPH


Classification of failures by reason for 2022.08.x
--------------------------------------------------

host-pahole-73383b3a39afe86... | 2 
            igd2-for-linux-2.1 | 2 
                gerbera-1.10.0 | 1 
                     gmp-6.2.1 | 1 
            igh-ethercat-1.5.2 | 1 
        ltp-testsuite-20220527 | 1 
                     nut-2.8.0 | 1 
                   perl-5.34.1 | 1 
                 pixman-0.40.0 | 1 
            python-ujson-5.2.0 | 1 
                tealdeer-1.5.0 | 1 
                  zabbix-5.4.9 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for 2022.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/887717cb761dfce9c13746edef036ce86597d1a1 |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/37406aa7057fcda3184ac593519a336692918800 | ORPH
    arm      | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/f73db0333438a1b6ae4377d37f8b0e7b4c3a8c5b |     
    sh4      | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/1bef06960d8c9c03d8fe895f5f8c18b561c58d8d |     
   x86_64    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/e469cb121a4ed77d530657e879137f5ab587b8c8 |     
  sparc64    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/f82f0fc6b2e0728d1606e87383fd87b5d8f6a4ad |     
   sparc     |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/7d9513fe87ae9da2b2ed53ffaf7313a1b7e708eb |     
   mips64    |     ltp-testsuite-20220527     | NOK | http://autobuild.buildroot.net/results/0f769795228daae309f8a1174b19ba7b351974ac |     
    arm      |           nut-2.8.0            | NOK | http://autobuild.buildroot.net/results/adedf3d150a44b9564f053cf8b6f68b687127adf |     
   sparc     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/2e15d9f788b1a63e9957a4f1258e76cd0a786d75 |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/1bbf6ce396f6d40001ca5f98c0c6e2231b876cae |     
   nios2     |       python-ujson-5.2.0       | NOK | http://autobuild.buildroot.net/results/2cd86d759f5c25836577926e721a8376d14c73e7 |     
  sparc64    |         tealdeer-1.5.0         | NOK | http://autobuild.buildroot.net/results/096d80974260e1e40d126b2700c30d65ed2e3b99 |     
  sparc64    |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/18d846d3dc6e28932bc35e0f9edb502fd66ce9af |     
 powerpc64   |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/0a585149a5a493c405fee58443091823464fad36 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
