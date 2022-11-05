Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 575F1C433FE
	for <buildroot@archiver.kernel.org>; Sat,  5 Nov 2022 07:37:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B823F41A3A;
	Sat,  5 Nov 2022 07:37:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B823F41A3A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iYiepW4pv-mV; Sat,  5 Nov 2022 07:37:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C00D41A4A;
	Sat,  5 Nov 2022 07:37:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C00D41A4A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 378F21BF21A
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 07:37:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0107D60A9C
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 07:37:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0107D60A9C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L95uoxvss-y9 for <buildroot@lists.busybox.net>;
 Sat,  5 Nov 2022 07:37:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4299360687
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4299360687
 for <buildroot@buildroot.org>; Sat,  5 Nov 2022 07:37:47 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5811DFF807
 for <buildroot@buildroot.org>; Sat,  5 Nov 2022 07:37:45 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sat, 05 Nov 2022 07:37:45 -0000
Message-Id: <20221105073753.0107D60A9C@smtp3.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1667633865; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=uG2ylhqNXe5btj0e0oShaJyMQjvLUrkqwr909MviBk0=;
 b=kTzGUrXQdEt8RPxH34FaBbn/s3WBh4QTVjrPH02QJte3nLAfWvPsbjQzCmgFT2m+RMQrAf
 UNKzOM/5mHr/0jcTqJfz2H9Ucxa42F1rdyqGFOImPSTl3MvUDeas5qOEqpNdKpOdgmHyd1
 1TZMDrbpqlqwhJh6XQ4svM//8ixnsDtsDDULRN6/AzGSL1LM77yrz+F/olSE7I2pB+jZyO
 86tqCaBiBNUk1XyUkPUMdGNxs/CbAumxOQobMkEAqTRw2uowAi5v5wdrFGMKbiwWh+Yt64
 FFocYmsS78mwGG6yfDUUmHMvFfreFSUGTIoKx1hrpYTDg5QENeBB0WHSF0QgpQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kTzGUrXQ
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-11-04
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

Autobuild statistics for 2022-11-04
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  2  |  0  |  0  |  2  |
  2022.08.x  |  9  | 10  |  0  | 19  |
    master   | 152 | 245 |  3  | 400 |
     next    |  8  | 20  |  0  | 28  |

Classification of failures by reason for master
-----------------------------------------------

glibc-2.36-66-ga1dc0be03c9d... | 14
          imagemagick-7.1.0-51 | 14
                   libnss-3.84 | 14
         s6-linux-init-1.0.6.3 | 12
               libglib2-2.72.3 | 10
                      xz-5.2.7 | 9 
                host-go-1.19.3 | 7 
                elfutils-0.186 | 6 
                tealdeer-1.6.1 | 6 
              alsa-utils-1.2.8 | 5 
                      crun-1.5 | 5 
                 dash-0.5.11.5 | 5 
            host-binutils-2.38 | 5 
              host-rust-1.64.0 | 5 
                   linux-6.0.1 | 5 
                       unknown | 5 
                gerbera-1.10.0 | 4 
                  gensio-2.5.5 | 3 
         gobject-introspection | 3 
            host-binutils-2.39 | 3 
              host-pahole-1.24 | 3 
             libgpg-error-1.45 | 3 
                libkcapi-1.4.0 | 3 
                linuxptp-3.1.1 | 3 
                    lxc-4.0.12 | 3 
                    php-8.1.12 | 3 
ulog-0389d243352255f6182326... | 3 
                     efivar-38 | 2 
             fontconfig-2.13.1 | 2 
                     frr-8.3.1 | 2 
  gobject-introspection-1.72.0 | 2 
            host-binutils-2.37 | 2 
         host-gcc-final-10.4.0 | 2 
       host-gcc-initial-10.4.0 | 2 
            igh-ethercat-1.5.2 | 2 
             lirc-tools-0.10.2 | 2 
               lpc32xxcdl-2.11 | 2 
          lttng-modules-2.13.1 | 2 
                mongodb-4.2.18 | 2 
                  ntp-4.2.8p15 | 2 
                     pv-1.6.20 | 2 
           python-numpy-1.23.4 | 2 
                 systemd-250.4 | 2 
                 uclibc-1.0.42 | 2 
                 wolfssl-5.5.2 | 2 
                xenomai-3.0.10 | 2 
                  zabbix-5.4.9 | 2 
                    zeek-4.1.1 | 2 
                 zlib-ng-2.0.6 | 2 
/home/buildroot/autobuild/i... | 1 
                alsa-lib-1.2.8 | 1 
                  assimp-5.2.5 | 1 
             bluez5_utils-5.65 | 1 
                  boost-1.80.0 | 1 
                  botan-2.19.2 | 1 
              containerd-1.6.8 | 1 
           crucible-2022.05.25 | 1 
              dropbear-2022.82 | 1 
edid-decode-188950472c19492... | 1 
                  fbterm-1.7.0 | 1 
       freeradius-client-1.1.7 | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
gummiboot-2bcd919c681c952eb... | 1 
             host-cmake-3.22.3 | 1 
         host-gcc-final-11.3.0 | 1 
        host-libopenssl-1.1.1q | 1 
      host-python-jinja2-3.1.2 | 1 
               host-swig-4.0.2 | 1 
                   json-c-0.16 | 1 
kvmtool-f77d646ba01d04be5aa... | 1 
                  lcms2-2.13.1 | 1 
      libabseil-cpp-20220623.1 | 1 
               libdcadec-0.2.0 | 1 
                libmad-0.15.1b | 1 
             libopenssl-1.1.1q | 1 
              libsodium-1.0.18 | 1 
          linux-5.10.145-cip17 | 1 
      linux-5.10.145-cip17-rt7 | 1 
                nerdctl-0.17.1 | 1 
                  netsurf-3.10 | 1 
                 openssh-9.1p1 | 1 
package/qt6/qt6base/qt6base... | 1 
              procps-ng-3.3.17 | 1 
            quickjs-2021-03-27 | 1 
rtl8192eu-1e15b6d451731bc4d... | 1 
                    ruby-3.1.2 | 1 
toolchain-external-codescap... | 1 
                wtfutil-0.41.0 | 1 
                  xxhash-0.8.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/65a92218f5e7adb92b7b56e70c365413f700bca0 |     
    or1k     |         alsa-lib-1.2.8         | NOK | http://autobuild.buildroot.net/results/8d32602ad4409100b300e7507761c5a208f33d6f |     
  mips64el   |        alsa-utils-1.2.8        | NOK | http://autobuild.buildroot.net/results/a9c9f5157365efe8271bf69dab0d5a5532b196ea |     
  mips64el   |        alsa-utils-1.2.8        | NOK | http://autobuild.buildroot.net/results/f3524d896223c74430eb4878a2787f1d865343a1 |     
microblazeel |        alsa-utils-1.2.8        | NOK | http://autobuild.buildroot.net/results/df69a0aa236e1dd0afb3136bb206eea7c6cfcd9d |     
   s390x     |        alsa-utils-1.2.8        | NOK | http://autobuild.buildroot.net/results/95242c92a79520177e7344777c2d536dbf0b2ef0 |     
    sh4      |        alsa-utils-1.2.8        | NOK | http://autobuild.buildroot.net/results/511941a03f805db0fd03ed997529369b0d622642 |     
    mips     |          assimp-5.2.5          | NOK | http://autobuild.buildroot.net/results/c717b1377606ae9bc05e900dfd5e7cb704e70599 | ORPH
   sh4aeb    |       bluez5_utils-5.65        | NOK | http://autobuild.buildroot.net/results/c203920d96bb38b206bdb36caab0b91889fc9372 |     
   arceb     |          boost-1.80.0          | NOK | http://autobuild.buildroot.net/results/d45543d3c599c9cc8e6a8309262c1d115fe40f94 |     
    m68k     |          botan-2.19.2          | NOK | http://autobuild.buildroot.net/results/91eb6d03ee899bc1034efc5ac7d1fe78961d37ca | ORPH
   x86_64    |        containerd-1.6.8        | NOK | http://autobuild.buildroot.net/results/bc0cd4d61d6c8bc1834418ffdb4ccb09c20a0702 |     
   x86_64    |      crucible-2022.05.25       | NOK | http://autobuild.buildroot.net/results/c1c6f60b65c54e366752fbd22b9210af8faf295d |     
   xtensa    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/7ec857e3f69cfba14df68689d6a6e3d86712c38e |     
    or1k     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/46c43fc2f8c4d4fdfe515f68fba531abaee9ccf3 |     
  mips64el   |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/2cd3e9ab632792063a52e51e0aafc7d6f102eefd |     
    arc      |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/a9b594e907800f0d1ab3420a716a2efcb5fd9eda |     
   arceb     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/c6a41588522894ae709e290ce8a7ceef7302684d |     
   sh4aeb    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/76204f539b5878e7facf5a9a926b472942dac72d | ORPH
    i686     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/fce383bdf43c86e9d98429bdcf739d8a8e04ef82 | ORPH
    sh4a     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/3c801a7b7e1ec8dd9c7322fda76740be257b1e1c | ORPH
    m68k     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/54f383a31c8e4a18bdb7f23e158cdbbd669924b1 | ORPH
    or1k     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/ad20ca662cadd613a8dc867a616ff94a07a7ec0b | ORPH
  riscv64    |        dropbear-2022.82        | NOK | http://autobuild.buildroot.net/results/2f092dbca36c904d3b785cd974989cb9e1644427 |     
  riscv64    | edid-decode-188950472c19492... | NOK | http://autobuild.buildroot.net/results/c5f914a791a4ab0559260e61a531036b4bc5b069 | ORPH
    arm      |           efivar-38            | NOK | http://autobuild.buildroot.net/results/4787731c3e0bdad24702c1c6f8f20af133c14721 |     
  aarch64    |           efivar-38            | NOK | http://autobuild.buildroot.net/results/d4758bd5dff4ca89bd43cc9d876113cb131bd193 |     
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/adc5cfe94cc2ad39fc4645c74199148ff6b0415a | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/a56506bfb1e6cc24cb1cd5fef031e0a517c7f655 | ORPH
  powerpc    |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/dc7a56516b7a2752ce947f13997d911a78514207 | ORPH
   arceb     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/41248cf4e8974c719358f6d1ce6faa63fdfff0f1 | ORPH
   arceb     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/27a63807f8f3d73860cd4448c896c163b378b5e9 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/fec2d014130d062f53c0a2ad52a9554c7dd9f898 | ORPH
microblazeel |          fbterm-1.7.0          | NOK | http://autobuild.buildroot.net/results/4df6492b11c7267c0419b56c2f15f9eb7ceb74e0 | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/fc58b77c045a28c946c742bd8cc26535e99662fa | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/0cdc985e78b4d01fdde4c4d1600831c40bb79f81 | ORPH
  riscv64    |    freeradius-client-1.1.7     | NOK | http://autobuild.buildroot.net/results/60c325e8c0d28e07f856f312bd4fbee49be5263f |     
  mips64el   |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/aa392ebd0e5eec077cd5f8f5c5bebbf61bc6f490 |     
  mips64el   |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/45119b86c91a37236077669fe03e743bbbaccde6 |     
   nios2     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/9bf3889ef74026da209869ccdde91ae8ca2f2cbb |     
  riscv64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/c6cbe0dee2494bbbd865b73f2ffec9542e32c5f3 |     
  sparc64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/337514e13c6f5368738c90bb361b6d559b87b2f3 |     
  mips64el   | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/daa8edde8331b51b8f1c906412669abc676093e1 |     
  mips64el   |          gensio-2.5.5          | NOK | http://autobuild.buildroot.net/results/25affc3718b01f261ccff988f73ad677ba948a20 |     
  powerpc    |          gensio-2.5.5          | NOK | http://autobuild.buildroot.net/results/f98c66d37e367498fe96e4058d7b7693ea794eb0 |     
   sparc     |          gensio-2.5.5          | NOK | http://autobuild.buildroot.net/results/394bdbe0e85871645e71c1fff62996708c6e7add |     
  riscv64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/3b8a7a93c0ca4b2c8603cbdf6bef1c0dbeb5afd0 |     
   mips64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/198b65f411e8b6d5edbae5fd825abc792ca1b71e |     
    mips     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/9f7797d54a5ad22425d1f1dfbb98ec5660e02f60 |     
  mips64el   |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/1a92ad63fc8e3e871a2594707874e004a20b8266 |     
   sh4aeb    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/920811859a532caf225ae433216a3a90ee183aa9 |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/eff8e8f2cfe7d2f5acc23d327ee12874f77101c4 |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/eb4afb631d2501dd29ea99dec1c2d1ada8325c70 |     
   nios2     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/448b10aab066dd0e3a7fed570c260b0de6c8d03b |     
microblazeel | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/685e7761025fa0b78a2a1c1d6d1c933c4162f531 |     
 microblaze  | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/345903d3784e193063035bb78e4172ea097ebb8f |     
    arc      | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/ddddd4534e7fdfa9e28adcc58c985efca746224e |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/68f3be4b467797be804c947ae92849e2e579c8f6 |     
   nios2     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/1e229be373cc10086fcaef3c345b1699ef746775 |     
   nios2     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/6f04e6d58ab3c20a178e3daffde9c645ce0ef4e7 |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/fddb5cbc4942eb988e298e83a0909c74e3c5030d |     
    mips     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/18a30ba670571c6e1e01c9554f8c03a59680ca00 |     
   nios2     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/ce90a14d2b3a121cf715d6716e20873402d97568 |     
   arceb     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/e550682a0df3f223e28050013d091f5bc25739ff |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/8a56366eaf2f8f34855f08cfa32a96260f8aa74d |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/70ad680c4c04bd78fcd9e680b31e09d1ad1fa1ea |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/2fa5cf3707a33a5852839161aed93c640d6104bb |     
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/818cf66b380a086156ea49bef6927ab1bc9c17d1 | ORPH
powerpc64le  |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/3b427152d9647b990f6cebd9bbdb8743eddcd341 | ORPH
   x86_64    | gummiboot-2bcd919c681c952eb... | NOK | http://autobuild.buildroot.net/results/b5040541c936be078b95b62da25133d2b21bdb42 |     
   xtensa    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/3cb82fb9417a7ad277f120ae76ef31f92591d0e6 |     
   xtensa    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/cdb507a5117d9155c66f90ea38d73a3e8081435e |     
   s390x     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/a00c223a4c195e680d7f20db623f0e85e81627e1 |     
   x86_64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/2e370a1fe2780b70b1bedf496a1534687751e333 |     
   mipsel    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/567f5ef1e3a28f5052bd869958c5dfb93cfc38ac |     
  riscv32    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/48e31f21e3eb63c9fcf6b976c3b9b3a0431dd0d7 |     
   armeb     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/0456e077d662f3210b33b0cd3d38d6fac3620ffe |     
  mips64el   |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/9c731d2ca23e3de55b03a6eca793d738e0f644e2 |     
   s390x     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/ddaa66b48fe42ca02bf64f90956abe3fc85404f3 |     
   sparc     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/79f261c9b710387f510eaa0b7d75fc0c9a2ec45a |     
    arm      |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/c401f1ce1750a9a5c421683dec083dfc3f320952 |     
   sparc     |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/c3d0ac33c490ac2c35f00388ddbbceb362d1dce8 |     
    arm      |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/e09b72cab8591448c8536c73133f64007945af0f |     
 microblaze  |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/4d4b5639ca007ed20753eff53f6cdf733f2f32d6 |     
   sparc     |    host-gcc-initial-10.4.0     | NOK | http://autobuild.buildroot.net/results/ee86cb7974af94902a4a1a225ee01adfac21fe88 |     
   sparc     |    host-gcc-initial-10.4.0     | NOK | http://autobuild.buildroot.net/results/f8ac4c32c202221d012d7355789b7d3dcdbf7efc |     
  mips64el   |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/8741f1af8d95a423003de66d910168f9d421319a |     
   mips64    |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/8b2d06fd45f5206c6c62adf51c21d46c5a4c6461 |     
    i686     |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/f1969ee89926a6caa63aebcd911de2f67c07dca3 |     
  mips64el   |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/e5ac927e326f08ca4a9b8312594e2f37a61d0806 |     
    i686     |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/a00c0c5743da60c21a1457d06196ee0cb8dfb4bd |     
    i686     |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/a51e1d1cde50b12fcc27b990b04a1bb8b8d6c8f4 |     
    i686     |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/cf300d0a35644e54ba253e3a3eb83352d7e4b993 |     
   sh4aeb    |     host-libopenssl-1.1.1q     | NOK | http://autobuild.buildroot.net/results/0705d04ca1c587e541a2f9180f973791b50c69d4 |     
   sparc     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/9c5393f02aed8f3fedba748deb06b61e3db7dbc2 |     
 aarch64_be  |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/68b4a717f0d64db2724eb2a135d8a30811bd3faa |     
    i686     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/2d539290688e803936ede0fca91a6856d2dd2b92 |     
   s390x     |    host-python-jinja2-3.1.2    | NOK | http://autobuild.buildroot.net/results/f419b2e7ea2a40596f6810808bc62de52cfa9692 |     
    arm      |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/94dcb1d86aaf8dbab85291a075f934a00c304a4d |     
   x86_64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/e8cef2b8d0036f02795a79c0632786dd9a8f2e1e |     
powerpc64le  |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/a4be7dc1f045421487e72c7540246aa2ad9956cf |     
    i686     |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/2e3445d74e0b3f6ccbde965a9e48fbd309447531 |     
   x86_64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/76209493d05cda3c6b1a1d765cc52537d6c786ea |     
    or1k     |        host-swig-4.0.2         | NOK | http://autobuild.buildroot.net/results/6bcda243cc9bb89ed0fcce095ff0302e6ac9cf5d |     
    arm      |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/3c22c6e7271660f48e0b64b94c7b2b3c5c153a89 |     
   x86_64    |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/ef931c93e6f436f13dab09508e1ee818c27b3824 |     
    arc      |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/8277a58b09c99ad34060445ee971d134483455b2 | ORPH
  mips64el   |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/df5233bcb6575fed073d897fb2c2fc53b9a2171e | ORPH
   mipsel    |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/86f73e755873c826839286fb765a99b70d951558 | ORPH
   sh4eb     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/cc488f395b4da240cfcc43f44ef728ca71cd8abe | ORPH
 aarch64_be  |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/8d24dee71a408a391d344ce5a9cde1b309f28b9a | ORPH
    mips     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/20a1d370781d3db49a7741be9fbe0dbbeb61c3df | ORPH
   arceb     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/a6378c43fb2299892fc321639cd1db1f9aaec764 | ORPH
    i686     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/2bb2a7046d905add5d346b8d4d5363701d2ef905 | ORPH
    arc      |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/8eb2c261691efb1c1c315d208550c7cd104c9aab | ORPH
  sparc64    |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/d25fde378c6d267d1c5246fd9d21f5ad166cbd32 | ORPH
    sh4a     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/c358947846b43c4ff7fc83ce5d226c613ebb0987 | ORPH
    mips     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/7b094dc3b0f9ec4f2cf68559d48a3b22bdc40d5a | ORPH
    arc      |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/07babbef747dff429f7eb3e56101d0f6cdfe4b86 | ORPH
   arceb     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/9d13b639f8d50e00e0e2fac24d27a31f66ea3fd5 | ORPH
  riscv64    |          json-c-0.16           | NOK | http://autobuild.buildroot.net/results/e7ac45c80ab93a72662be41cbdf3b8094b36dc9d |     
   x86_64    | kvmtool-f77d646ba01d04be5aa... | NOK | http://autobuild.buildroot.net/results/1dbdfb7a850c651f38dda5916303090e3b483bb4 |     
   xtensa    |          lcms2-2.13.1          | NOK | http://autobuild.buildroot.net/results/14f6187a8091df71a7f2cf447ad7df1a8263537d |     
  mips64el   |    libabseil-cpp-20220623.1    | NOK | http://autobuild.buildroot.net/results/c4e7477783d04eb714d739a3bce56068bae517f0 |     
    arm      |        libdcadec-0.2.0         | NOK | http://autobuild.buildroot.net/results/1e63586c91a2670ecac2940f6e9840e6801c32f3 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/73e885f6383e42cae3c29a399a66368196d7212f |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/7eddbdafcd786489c78dc14d59b350570cf4ed26 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/a7b33247829ac5bc758f43b8fbe6f46aece7108e |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/26bd82dfef32aef319c3dbf96becac70ff1a95d7 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/00cb2f7a5eb9cab1ffc1b41c1dc8c52188abd7a1 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/ab8b35e9026881263f3373fa93949d66af6bbb32 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/1b26e2b0c10ffb76ae2fea08e69536909a0c1322 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/efb257e88682bb1a581c648321b361fe9331b4e1 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/38772b029cabedfb7c194032f59f5e0f56c6df7f |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/db2308d733a9f0babf50472e896a4c02f8b00e03 |     
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/9aed5abfef68a4d661f27d481876f5fb274ffbf8 | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/e423d1ac66caafc41769ab8e8921a43d6a24820c | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/8d13daaa494f96354f112ab92245ab19a5df5b67 | ORPH
    arm      |         libkcapi-1.4.0         | NOK | http://autobuild.buildroot.net/results/b34c5d8eafa5e6c1ec26248cd3c407e1641406b5 |     
   xtensa    |         libkcapi-1.4.0         | NOK | http://autobuild.buildroot.net/results/e87e1349f539c772d9c7117ce7dec7ee0a70fb83 |     
    arm      |         libkcapi-1.4.0         | NOK | http://autobuild.buildroot.net/results/ab9037ed16c5ef7074bdc25d4d820a31c3c72a63 |     
    arm      |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/4884b58426c67e8248e3190395860ea25d317b3b | ORPH
   s390x     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/9ef401ff098569dc2d985d09517b0abf7e9b2043 |     
   x86_64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/08a01324bdd85f4e3a43177bff2f2dbc8914dda8 |     
  mips64el   |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/1b3b8356e6b33de0d93d63ddb9233ab62572ec99 |     
 aarch64_be  |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/eab0396ccf07cb0d62024b504130dff47e382d44 |     
   armeb     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/c1a82a82f94fc2d7b74fefce46a85aa8389587c6 |     
   sparc     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/cf313c60f78d0cca583af68dbe5ab7ef247719a7 |     
 aarch64_be  |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/c014fb4b9071d03e7033cad8089e1de4d9836720 |     
    arm      |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/04cd81b55442434b703fb52b35dd22e40a66f8dc |     
powerpc64le  |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/d6d74905b981c9c43dae555bc3986570c9c28201 |     
 aarch64_be  |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/831bc5741b4ed64e03ac93283f8e9369f6449dd0 |     
   x86_64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/475d26d3e04a6ef81d31a6b44b47f84dc05c18ef |     
 microblaze  |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/505e9b3beb4fbeea5496f26263704e37191424a0 |     
  aarch64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/d5e61c2a776d98d62b59fe3ba1463ff326dec146 |     
   armeb     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/01194e4f7441368895148fc07e70357b43768acd |     
   mipsel    |       libopenssl-1.1.1q        | NOK | http://autobuild.buildroot.net/results/26e84ca043305ffa261868ceb201e1514c419b00 |     
    arm      |        libsodium-1.0.18        | NOK | http://autobuild.buildroot.net/results/daccd48502e3887dfd58dc8e85fefcddb7fed16d |     
   mipsel    |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/71420b2ac1117d85ed679e873d3fb12509b8c410 | ORPH
  powerpc    |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/82d0a0ed6d470f4ca8cfa940d57cae9299c56001 | ORPH
   mips64    |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/23a2cb90cb92a6f87b9846ca184834234abf14d1 | ORPH
   s390x     |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/af250784d0e25d5a3bef3c35724c752c01dd0f6f | ORPH
   s390x     |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/c3b811726bb52076a6765ac8004a9880cc7dfa9f | ORPH
    m68k     |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/a10e2976825f006aa374f6867083cc81d636e28e | ORPH
  powerpc    |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/6403ae3f78dfd2e433427fb967066fe70642f164 | ORPH
 microblaze  |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/3e36b48204fe8b0ea967c9dc5422c48cd091cec9 |     
 aarch64_be  |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/54ba9084e4fc9e807dd034d0e614f6f3c72b2e71 |     
    m68k     |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/c7ec369f3a5976844bd25bcc0d27338300079f20 |     
  aarch64    |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/5f38862ebb467804ef472ab9172f811ad642db85 | ORPH
    or1k     |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/47af88ccd8f513370f00dc7cff926914a42a0208 | ORPH
   armeb     |        lpc32xxcdl-2.11         | NOK | http://autobuild.buildroot.net/results/4a38638d1cf1d3357ed92be93fb76e63194246f8 | ORPH
    arm      |        lpc32xxcdl-2.11         | NOK | http://autobuild.buildroot.net/results/0af883590d3531f79b0df19620e85eea5d3e96dd | ORPH
    sh4      |      lttng-modules-2.13.1      | NOK | http://autobuild.buildroot.net/results/e72ce37d85218dd798ff7a10208c50ccc8059879 |     
    or1k     |      lttng-modules-2.13.1      | NOK | http://autobuild.buildroot.net/results/81e5ff08ccb9da120f97786707c63d722190323d |     
  powerpc    |           lxc-4.0.12           | NOK | http://autobuild.buildroot.net/results/8947ab2132272143d91b4301d50f10b0e1f52c8c |     
   nios2     |           lxc-4.0.12           | NOK | http://autobuild.buildroot.net/results/f77e2dc44c9a224f280e08089a890e85c302274f |     
  aarch64    |           lxc-4.0.12           | NOK | http://autobuild.buildroot.net/results/393d829d4e0fa3dbbcf3c3dc45807190f326a28b |     
   x86_64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/fd010b64f61456110ba4392b3f71f52ef27de266 |     
   x86_64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/579c3ae6f0c57c9434be75a65007bc5b489b319a |     
powerpc64le  |         nerdctl-0.17.1         | NOK | http://autobuild.buildroot.net/results/e45efeb18a83ced146cc947c435bb52356d3f20a |     
    arm      |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/e1c21616958f652198c2b26d279dcaff1b147bfc |     
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/e810980e513b32e74a58acef250729ed8b873472 | ORPH
    sh4      |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/b1a83d72f82ef2f97bfa02ba8467d6bc22cbe149 | ORPH
    m68k     |         openssh-9.1p1          | NOK | http://autobuild.buildroot.net/results/a8d718f4e7ff4c8b544102877209cee8955eb731 | ORPH
  sparc64    | package/qt6/qt6base/qt6base... | NOK | http://autobuild.buildroot.net/results/a414dd11e5fb6928fb8952e47f5236ab6e6d9bb1 |     
    sh4      |           php-8.1.12           | NOK | http://autobuild.buildroot.net/results/6aa0c01e848eb43785c433bf302f3c985a189fcc |     
microblazeel |           php-8.1.12           | NOK | http://autobuild.buildroot.net/results/66c98767a899bf2f673a0b42313478e2a4200486 |     
    sh4a     |           php-8.1.12           | NOK | http://autobuild.buildroot.net/results/18c7decf410f12299e9c0b8df7ede68fd60f1d52 |     
    arm      |        procps-ng-3.3.17        | NOK | http://autobuild.buildroot.net/results/e63d20c92896b31f58caf69b5b834db9cac2f808 | ORPH
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/4b61c165fb84d42adff148f37d01770c4406c768 | ORPH
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/df6951c1339293863a6beb21f19b550f4347ef1b | ORPH
    sh4a     |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/c615dcb971ee3f830dc091417dfb52aac35efefc |     
  aarch64    |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/7de6e99790954ff1e0f0f0d2bf71ac21a8951d77 |     
    or1k     |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/fd807e9cec5bf9606c4398aa1cb84fc7bf44d89a |     
 aarch64_be  | rtl8192eu-1e15b6d451731bc4d... | NOK | http://autobuild.buildroot.net/results/ad4ef6dd9373e626375c5d630762897d5e725ead |     
    arc      |           ruby-3.1.2           | NOK | http://autobuild.buildroot.net/results/f76cf2837e8bea27466728c37510ebeace088837 |     
    sh4a     |     s6-linux-init-1.0.6.3      | NOK | http://autobuild.buildroot.net/results/eb837870b5584b083d19c36b5c0133213e16ac58 |     
   mipsel    |     s6-linux-init-1.0.6.3      | NOK | http://autobuild.buildroot.net/results/da07c648907542cf4d9573258995adb3fb939d4e |     
   nios2     |     s6-linux-init-1.0.6.3      | NOK | http://autobuild.buildroot.net/results/7b36439d885f1426abd2976b0bed4905cc2a44ae |     
    mips     |     s6-linux-init-1.0.6.3      | NOK | http://autobuild.buildroot.net/results/4f59e52fab36f6e3f32752b0e6d4f8b58e167724 |     
    arm      |     s6-linux-init-1.0.6.3      | NOK | http://autobuild.buildroot.net/results/0408dd8f903d7e8b4b973a735e3627181d147ea2 |     
   nios2     |     s6-linux-init-1.0.6.3      | NOK | http://autobuild.buildroot.net/results/a336ce1970ba8c095aedcf437cd8a89b640a322a |     
  powerpc    |     s6-linux-init-1.0.6.3      | NOK | http://autobuild.buildroot.net/results/c45055d6440a981f8fc5b29603aa8fe23e179df6 |     
   x86_64    |     s6-linux-init-1.0.6.3      | NOK | http://autobuild.buildroot.net/results/7361822fd78b706d88db1b49f92caa4dcb177a4f |     
    arm      |     s6-linux-init-1.0.6.3      | NOK | http://autobuild.buildroot.net/results/b7279a993c1dc2e8af8d2bbeabd1536da53fd1a5 |     
    arc      |     s6-linux-init-1.0.6.3      | NOK | http://autobuild.buildroot.net/results/4912a044eb5825ab1af3e73b46c8da4ce44041e0 |     
microblazeel |     s6-linux-init-1.0.6.3      | NOK | http://autobuild.buildroot.net/results/0a4d62568264180842ebc24973349d00e930a72a |     
   xtensa    |     s6-linux-init-1.0.6.3      | NOK | http://autobuild.buildroot.net/results/9366ae503cadd4154a9574c4c204c279f0af5e11 |     
powerpc64le  |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/b9dfd802f04ffb7799a5fc87e669aa255bbbb87b |     
   s390x     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/779c6a55a12d2765391da59b0fa9ac023de96ca6 |     
 powerpc64   |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/3fae97081e1ce59ebe823f4daa938fecd1b49440 |     
  sparc64    |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/8ca197b79bd30dfd36cc4851a0befd014a2960be |     
 powerpc64   |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/bb7cd246413ed4bf19c2290703795adbc5e0072d |     
    mips     |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/2ef97b75098b4f9ef9562312801b63f5ef04da48 |     
    mips     |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/bfc6e63be7e23793b86811f67603ae4055ffc097 |     
    mips     |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/50be190118fd7a8cd23cfa55c9a02479e06a39ed |     
    mips     | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/8a25c5f8d22cfcec325451b154e51bfcf42a90e4 | ORPH
   xtensa    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/236b2c6d91536edc612dcc30ace76b98e8a9fab6 |     
  riscv64    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/7598635cf3d5997473af844a0e2bdbef09d822d5 |     
  sparc64    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/432dafb5f5897587e0382497a01e4cf06f58db96 |     
   mipsel    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/746d6ae2438e528f041bd3b05cacfb5f754069a0 |     
   sparc     | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/000448f21243ff7746e39a2b6e33eef8781c6d1c |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/5bb3f9955aa96e51def7de73ddf95b0e4ea3ee0d |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/7afa9d6b97f25804dde5bfc25002bc8ba87e3380 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/a0a75d322cf8a00b0c2b311762eade538d6742b1 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/217a5aa8e420da31b832f0b8b26206b91dc06f81 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/07dcd3af10379e2f6d1c9941a7715967b988e228 |     
  riscv32    |         wolfssl-5.5.2          | NOK | http://autobuild.buildroot.net/results/4ca190460ab3fcfc78acd4cfbd89f8e80efc6f7b |     
  riscv32    |         wolfssl-5.5.2          | NOK | http://autobuild.buildroot.net/results/416372efde065c6dca11e31656e920331419bbfa |     
   mips64    |         wtfutil-0.41.0         | NOK | http://autobuild.buildroot.net/results/e91d1b9f3a61e647586fa0afa0852920bfc1d951 |     
    m68k     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/12e8c5d5fbe054ac45047969da606cce5d4fa8c2 |     
   x86_64    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/26d33668509cae860f3bd946583a7e4cc5f70f32 |     
    or1k     |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/7217bf2d6a946758cc303869d19b41089e551ca0 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/6ef137747bc4cd3045ef8a4489b5fbcd9ab1fdb8 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/7f78a49f03e3876025dd075fa29ea2d7064643bd | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/8465c96c869b0cca20d6e82290cd81efaada3a27 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/4f85b26ef58e261f281bae4fa2db9349f07a8d19 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/75f84530498f7c0eb546eccad33a4ebf1756bb9a | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/179a805a4cd44fd7f224d9fc69ddea3a25ff7e10 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/0e3242fe72cddd3ddcca88482622b462abc649a1 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/9ea1eb5409fb5ef493f8b329cb1b0cd274f21cb8 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/69b2ea61e6c8f2b61b26cb47fa9b692d14cee004 | ORPH
   s390x     |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/a995e34403a8116314e9e0988b67cf1c8919f6d4 |     
    mips     |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/ead2e28e60e29641a83873192249a10ccf72f6d0 |     
  powerpc    |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/c2c8c42d0971761a93077171ed59b0bdedd3a07a |     
   mipsel    |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/c2c3def434e80a1c706b1ae0abdf829fb88c6ca9 |     
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/a2c5d5f2c4381214c6b37e5aed3cb471e5e9104d | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/be2ce360d8c9530b4c75ab08a92a97d69feb2c3a | ORPH


Classification of failures by reason for next
---------------------------------------------

          imagemagick-7.1.0-51 | 2 
                       unknown | 2 
/home/buildroot/autobuild/i... | 1 
                acpitool-0.5.1 | 1 
                   aubio-0.4.9 | 1 
                      crun-1.5 | 1 
                gerbera-1.10.0 | 1 
            host-binutils-2.39 | 1 
              host-pahole-1.24 | 1 
    host-python-greenlet-2.0.0 | 1 
              host-rust-1.64.0 | 1 
host-spirv-llvm-translator-... | 1 
                libkcapi-1.4.0 | 1 
      linux-5.10.145-cip17-rt7 | 1 
                    lxc-4.0.12 | 1 
                  ntp-4.2.8p15 | 1 
           python-numpy-1.23.4 | 1 
                      xz-5.2.7 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/dbef82fbd04b6d398f405aa68f4c4be59bd7e470 |     
   mips64    |         acpitool-0.5.1         | NOK | http://autobuild.buildroot.net/results/dc89df6eee1aa4f855d914e46ecbfb3103d6ad9f |     
   nios2     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/fe0f958bc1cdfd70f60640482cf61af24e85328b |     
    arm      |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/04ccbb17cde97ef67581dec4e3ae2fe457bc70f9 |     
  mips64el   |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/6ddbacd1bdcd90685a9d57c576ed37a820e66274 |     
    arc      |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/ba3145aac968e3a66e6da1046a481258dea38553 |     
 powerpc64   |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/d25910a97eeaa1be2c4d44584c4f1fd820e55c42 |     
powerpc64le  |   host-python-greenlet-2.0.0   | NOK | http://autobuild.buildroot.net/results/8e12cee26ed1441a80d864e0516dee2f9c0011ac |     
powerpc64le  |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/f2dee97bab7509856bf0fd0c718fff7f866dd6ab |     
  aarch64    | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/04090a705834f4a93a959fa0bf4dac71409611cc | ORPH
  mips64el   |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/66808b2b59fcb1d8077d2be0c3d28f1c1aee6464 | ORPH
    sh4a     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/95800861092e7151979f9bcc5e6da44eb9acf290 | ORPH
    or1k     |         libkcapi-1.4.0         | NOK | http://autobuild.buildroot.net/results/0730a511075e32835ad613ad8fe027d64def777b |     
   xtensa    |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/2004287e91b01b2f89c5b2d7c2d22fcd1305350c | ORPH
    or1k     |           lxc-4.0.12           | NOK | http://autobuild.buildroot.net/results/8cecb1094616837e78299ce2b4528b95d701ea46 |     
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/5b1d38eced9f98425f6df548d9051939d450bc07 | ORPH
   mipsel    |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/b972917772270905bbcced4b3eccf64392d134ed |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/51f2d00e1eebd00788829c8f0c81c8c724668423 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/1d7e127b5c63bcd30d1b9cb886bac53acdf5d0a5 |     
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/649bd97609962d65ca418b6c015fc0c317045f5c | ORPH


Classification of failures by reason for 2022.08.x
--------------------------------------------------

                gerbera-1.10.0 | 2 
                host-go-1.18.6 | 2 
host-pahole-73383b3a39afe86... | 1 
              host-rust-1.62.0 | 1 
                   libnss-3.81 | 1 
                   sdl2-2.0.22 | 1 
                       unknown | 1 
                    zstd-1.5.2 | 1 


Detail of failures for 2022.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i586     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/dcb3928847a75ce67203ee20408d6452363e0751 |     
  riscv64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/bf88ff2efc79b409216b35403e74fc05891b8171 |     
    i686     |         host-go-1.18.6         | NOK | http://autobuild.buildroot.net/results/07c8311ad422e1e7f0bb63dd84e8a125bf27775c |     
   mips64    |         host-go-1.18.6         | NOK | http://autobuild.buildroot.net/results/547e56b50bbac7dad4a0ad954ab84dc1a1449828 |     
microblazeel | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/0cba07fbcd739b9799f578d7d635276b74efc981 |     
  sparc64    |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/f833a93f31987ce5a3b23b162c5514233cf0d2bb |     
   x86_64    |          libnss-3.81           | NOK | http://autobuild.buildroot.net/results/d64d153b4ec3701a39df08cdf91b1ab76d9c0d5c |     
    arm      |          sdl2-2.0.22           | NOK | http://autobuild.buildroot.net/results/397c64de3dd39b615c628ff018089e0859d641ba |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/5518d739dba5d7fb29f013865c0dfd3bee8e99ec |     
microblazeel |           zstd-1.5.2           | NOK | http://autobuild.buildroot.net/results/5306b7ed7da3d9a6c690a412cc7e46eae3b9d3e0 |     


Gitlab CI results for 2022-11-04
================================

Detail of defconfig failures for 2022.11-rc1
--------------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                qemu_aarch64_ebbr | https://gitlab.com/buildroot.org/buildroot/-/jobs/3273861356  |      
                qemu_arm_vexpress | https://gitlab.com/buildroot.org/buildroot/-/jobs/3273861369  |      
                   qemu_m68k_q800 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3273861379  |      
            qemu_microblazeel_mmu | https://gitlab.com/buildroot.org/buildroot/-/jobs/3273861385  |      
                 qemu_ppc64_e5500 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3273861418  |      
           qemu_xtensa_lx60_nommu | https://gitlab.com/buildroot.org/buildroot/-/jobs/3273861474  |      


Detail of runtime-test failures for 2022.11-rc1
-----------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
...ioDracutGlibcMergedUsr | https://gitlab.com/buildroot.org/buildroot/-/jobs/3273861545  | ORPH 
...pioDracutMuslMergedUsr | https://gitlab.com/buildroot.org/buildroot/-/jobs/3273861548  | ORPH 
...oDracutUclibcMergedUsr | https://gitlab.com/buildroot.org/buildroot/-/jobs/3273861550  | ORPH 
...lx60UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3273862450  | ORPH 
...Xtensalx60UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3273862454  | ORPH 
   TestGdbHostGdbTarget9x | https://gitlab.com/buildroot.org/buildroot/-/jobs/3273861625  | ORPH 
   TestGdbHostGdbserver9x | https://gitlab.com/buildroot.org/buildroot/-/jobs/3273861632  | ORPH 
        TestGdbHostOnly9x | https://gitlab.com/buildroot.org/buildroot/-/jobs/3273861639  | ORPH 
          TestPhpPeclDbus | https://gitlab.com/buildroot.org/buildroot/-/jobs/3273861827  | ORPH 
        TestPythonPy3Cbor | https://gitlab.com/buildroot.org/buildroot/-/jobs/3273861871  | ORPH 
    TestPythonPy3Crossbar | https://gitlab.com/buildroot.org/buildroot/-/jobs/3273861883  | ORPH 
         TestPythonPy3RSA | https://gitlab.com/buildroot.org/buildroot/-/jobs/3273861929  | ORPH 


Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                amarula_a64_relic | https://gitlab.com/buildroot.org/buildroot/-/jobs/3267233708  |      
                         arm_juno | https://gitlab.com/buildroot.org/buildroot/-/jobs/3267233718  |      
                        avenger96 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3267233745  |      
                      bananapi_m1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3267233746  |      
                 bananapi_m1_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/3267233747  |      
                 bananapi_m2_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/3267233748  |      
                     bananapi_m64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3267233751  |      
        freescale_imx6dlsabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/3267233775  |      
         freescale_imx6qsabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/3267233777  |      
             freescale_imx6ullevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3267233781  |      
           freescale_imx7dsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/3267233782  |      
              freescale_imx8mmevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3267233783  |      
              freescale_imx8mnevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3267233784  |      
              freescale_imx8mpevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3267233785  |      
              freescale_imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3267233786  |      
              freescale_imx8qmmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/3267233787  |      
             freescale_imx8qxpmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/3267233790  |      
            friendlyarm_nanopc_t4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3267233799  |      
           friendlyarm_nanopi_a64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3267233800  |      
            friendlyarm_nanopi_m1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3267233802  | ORPH 
       friendlyarm_nanopi_m1_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/3267233803  | ORPH 
            friendlyarm_nanopi_m4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3267233804  |      
          friendlyarm_nanopi_neo2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3267233805  |      
          friendlyarm_nanopi_neo4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3267233806  |      
     friendlyarm_nanopi_neo_plus2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3267233808  |      
            friendlyarm_nanopi_r1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3267233809  |      
                        imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3267233832  |      
                kontron_bl_imx8mm | https://gitlab.com/buildroot.org/buildroot/-/jobs/3267233833  |      
              kontron_smarc_sal28 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3267233835  |      
      microchip_sam9x60ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/3267233843  |      
    microchip_sama5d2_icp_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/3267233847  |      
                  minnowboard_max | https://gitlab.com/buildroot.org/buildroot/-/jobs/3267233850  |      
                          mx51evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3267233852  |      
                       nitrogen8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/3267233862  |      
                      nitrogen8mm | https://gitlab.com/buildroot.org/buildroot/-/jobs/3267233863  |      
                      nitrogen8mn | https://gitlab.com/buildroot.org/buildroot/-/jobs/3267233864  |      
                      nitrogen8mp | https://gitlab.com/buildroot.org/buildroot/-/jobs/3267233865  |      
              octavo_osd32mp1_brk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3267233866  |      
              octavo_osd32mp1_red | https://gitlab.com/buildroot.org/buildroot/-/jobs/3267233867  |      
                         odroidc2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3267233868  |      
        olimex_a20_olinuxino_lime | https://gitlab.com/buildroot.org/buildroot/-/jobs/3267233873  |      
             olimex_a33_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/3267233875  |      
             olimex_a64_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/3267233876  |      
          olimex_imx233_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/3267233877  |      
    olimex_stmp157_olinuxino_lime | https://gitlab.com/buildroot.org/buildroot/-/jobs/3267233878  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3267233882  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/3267233887  |      
                     orangepi_pc2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3267233888  |      
                    orangepi_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/3267233891  | ORPH 
                   orangepi_prime | https://gitlab.com/buildroot.org/buildroot/-/jobs/3267233892  |      
                  orangepi_rk3399 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3267233894  |      
                     orangepi_win | https://gitlab.com/buildroot.org/buildroot/-/jobs/3267233895  |      
                qemu_aarch64_ebbr | https://gitlab.com/buildroot.org/buildroot/-/jobs/3267233905  |      
                qemu_arm_vexpress | https://gitlab.com/buildroot.org/buildroot/-/jobs/3267233914  |      
              qemu_mips64el_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/3267233939  |      
            qemu_ppc64le_powernv8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3267233953  |      
             qemu_ppc64le_pseries | https://gitlab.com/buildroot.org/buildroot/-/jobs/3267233954  |      
                  qemu_ppc_bamboo | https://gitlab.com/buildroot.org/buildroot/-/jobs/3267233956  |      
                  qemu_ppc_e500mc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3267233958  |      
           qemu_xtensa_lx60_nommu | https://gitlab.com/buildroot.org/buildroot/-/jobs/3267233975  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/3267233984  | ORPH 
                    roc_pc_rk3399 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3267233992  |      
                           rock64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3267233993  |      
                        rock_pi_4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3267233994  |      
                      rock_pi_n10 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3267233995  |      
                       rock_pi_n8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3267233996  |      
                        rockpro64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3267233997  |      
                       sheevaplug | https://gitlab.com/buildroot.org/buildroot/-/jobs/3267234000  |      
          sipeed_maix_dock_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3267234004  |      
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3267234011  |      
        terasic_de10nano_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3267234029  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3267234030  |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3267234031  |      
                           ts5500 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3267234032  |      
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3267234033  |      
                         uevm5432 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3267234034  |      
                       visionfive | https://gitlab.com/buildroot.org/buildroot/-/jobs/3267234035  |      
                        wandboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3267234036  |      
                            warp7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3267234037  |      
                        warpboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3267234038  |      
                    zynq_microzed | https://gitlab.com/buildroot.org/buildroot/-/jobs/3267234040  |      
                      zynq_qmtech | https://gitlab.com/buildroot.org/buildroot/-/jobs/3267234042  |      
                       zynq_zc706 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3267234043  |      
                         zynq_zed | https://gitlab.com/buildroot.org/buildroot/-/jobs/3267234044  |      
                zynqmp_kria_kv260 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3267234045  |      
                    zynqmp_zcu102 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3267234046  |      
                    zynqmp_zcu106 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3267234047  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
