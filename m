Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AA16C52D7B
	for <buildroot@archiver.kernel.org>; Tue, 13 Aug 2024 05:35:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F080840179;
	Tue, 13 Aug 2024 05:35:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jlyL1ME68xdw; Tue, 13 Aug 2024 05:35:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A8E4B401C2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A8E4B401C2;
	Tue, 13 Aug 2024 05:35:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 550071BF41D
 for <buildroot@lists.busybox.net>; Tue, 13 Aug 2024 05:35:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 42CF7605A1
 for <buildroot@lists.busybox.net>; Tue, 13 Aug 2024 05:35:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U_9rNJO3_04S for <buildroot@lists.busybox.net>;
 Tue, 13 Aug 2024 05:34:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7AA2A6059F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7AA2A6059F
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7AA2A6059F
 for <buildroot@buildroot.org>; Tue, 13 Aug 2024 05:34:57 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D9ABB20009
 for <buildroot@buildroot.org>; Tue, 13 Aug 2024 05:34:53 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Tue, 13 Aug 2024 05:34:53 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1723527294; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=FhQp+WwYuZm/fELnv78V8ixp36dPNI4l/6aK1F9L14I=;
 b=fBE3kBWsEtiRgzT1mMDVRmfIv3YbScVSSbCHC4xmzCSprorVDd1Kj10VMpHt2u6SZv1ee3
 pP4UQq7RQbDfzSE55eKO8UBS2nwkqtmAZodNcPqCsKwvyP9ThcvE3lzYSyhXtTpD0ouigQ
 0P4/E8DbrZ7SWK03j0PGQjximL3W+ruX1/DB5L5g9itZRb4zGBZfpm7ePA1VpQYxIRVk5r
 u+gDc2WMw5EQ4KcVkhLlE0xPSjC5h8VAEPwpMEvPRqEodWU63PVivNAPC4u5KrE7M6pKUL
 SyqicDmL0LBs+tIvBYGWymcmC6SJi+Mv/M6mg6U+wru1UB/YKjTWsfg8Vec28Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fBE3kBWs
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-08-12
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
Message-ID: <20240813053453.51vQS_gTpkeNGpbCfms99ouHBXHwYA-5nDqMWYRzXm4@z>

Hello,

Autobuild statistics for 2024-08-12
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  6  |  6  |  0  | 12  |
  2024.05.x  |  4  |  5  |  0  |  9  |
    master   | 108 | 180 |  2  | 290 |

Classification of failures by reason for master
-----------------------------------------------

      python-autocommand-2.2.2 | 7 
                  ffmpeg-6.1.2 | 6 
  gobject-introspection-1.76.1 | 6 
host-heimdal-f4faaeaba371ff... | 6 
                elfutils-0.189 | 5 
                       unknown | 5 
                   atop-2.10.0 | 4 
                gerbera-1.12.1 | 4 
                gnu-efi-3.0.18 | 4 
 host-softether-4.30-9700-beta | 4 
               procps-ng-4.0.4 | 4 
                     avahi-0.8 | 3 
                   foot-1.16.2 | 3 
glibc-2.39-74-g198632a05f6c... | 3 
                 gnuplot-6.0.1 | 3 
            host-binutils-2.42 | 3 
 host-binutils-bare-metal-2.42 | 3 
host-go-bootstrap-stage1-1.... | 3 
                  libffi-3.4.6 | 3 
             strongswan-5.9.13 | 3 
                      fbv-1.0b | 2 
         host-libxcrypt-4.4.36 | 2 
host-vboot-utils-bbdd62f9b0... | 2 
                libcuefile-475 | 2 
               libglib2-2.76.1 | 2 
                  linux-6.10.3 | 2 
                   linux-tools | 2 
               mariadb-10.11.6 | 2 
                memtest86-6.20 | 2 
                    mpv-0.35.1 | 2 
                 pixman-0.42.2 | 2 
           python-daemon-3.0.1 | 2 
         python-remi-2022.7.27 | 2 
              skalibs-2.14.2.0 | 2 
             sofia-sip-1.13.17 | 2 
                 systemd-256.4 | 2 
                 uclibc-1.0.49 | 2 
               acpica-20240321 | 1 
aer-inject-9bd5e2c7886fca72... | 1 
                 agentpp-4.6.1 | 1 
                 apache-2.4.62 | 1 
                apr-util-1.6.3 | 1 
                  bcusdk-0.0.5 | 1 
             berkeleydb-5.3.28 | 1 
  binutils-arc-2023.09-release | 1 
                   bird-2.0.12 | 1 
                  bitcoin-26.2 | 1 
                     crun-1.15 | 1 
                   cvs-1.12.13 | 1 
                 dc3dd-7.2.641 | 1 
                espflash-3.1.0 | 1 
                  fbdump-0.4.2 | 1 
                  fbterm-1.7.0 | 1 
                    fcft-3.1.6 | 1 
           flatbuffers-24.3.25 | 1 
               freeipmi-1.6.14 | 1 
            gdk-pixbuf-2.42.10 | 1 
           ghostscript-10.03.1 | 1 
                     gmp-6.3.0 | 1 
             gnuradio-3.10.7.0 | 1 
         gobject-introspection | 1 
             host-delve-1.22.1 | 1 
           host-librsvg-2.50.9 | 1 
     host-moby-buildkit-0.11.6 | 1 
            host-skopeo-1.13.3 | 1 
               ipmitool-1_8_19 | 1 
                latencytop-0.5 | 1 
          libcamera-apps-1.5.0 | 1 
                libdrm-2.4.122 | 1 
                 libgee-0.20.6 | 1 
           libmicrohttpd-1.0.1 | 1 
     libphidget-2.1.9.20190409 | 1 
                librsvg-2.50.9 | 1 
                libselinux-3.6 | 1 
                 libusb-1.0.27 | 1 
                 libv4l-1.24.1 | 1 
                  libva-2.22.0 | 1 
          linux-5.10.162-cip24 | 1 
     linux-5.10.162-cip24-rt10 | 1 
        ltp-testsuite-20240524 | 1 
ltrace-82c66409c7a93ca6ad2e... | 1 
                   ltris-1.3.2 | 1 
         lttng-modules-2.13.10 | 1 
                  lvm2-2.03.23 | 1 
                     mdadm-4.3 | 1 
               memtester-4.5.1 | 1 
                 mesa3d-24.0.9 | 1 
            micropython-1.22.0 | 1 
                    ncmpc-0.49 | 1 
          ncurses-6.4-20230603 | 1 
                  ntpsec-1.2.3 | 1 
                    ola-0.10.9 | 1 
                 openssh-9.8p1 | 1 
             parsec-tool-0.7.0 | 1 
                    php-8.3.10 | 1 
               pulseaudio-17.0 | 1 
                    sslh-2.0.1 | 1 
                   swipl-9.2.6 | 1 
               syslog-ng-4.7.1 | 1 
uclibc-ng-test-132c6134d691... | 1 
ulog-0389d243352255f6182326... | 1 
                    volk-3.0.0 | 1 
               zxing-cpp-2.2.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |        acpica-20240321         | NOK | http://autobuild.buildroot.net/results/9779bf11bdf458926927bd5e6d41363924b3d79e |     
  aarch64    | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/ba0bae7d026e796859f84bb8e80c20ac0fa7e3a1 | ORPH
    or1k     |         agentpp-4.6.1          | NOK | http://autobuild.buildroot.net/results/c8aa51c8a03928e7abfa45be902152954d6e7397 |     
   x86_64    |         apache-2.4.62          | NOK | http://autobuild.buildroot.net/results/97ab484f3c40194531ef3eef047fa23de445029d |     
 microblaze  |         apr-util-1.6.3         | NOK | http://autobuild.buildroot.net/results/8b373dd51ba6efea9965aa8acee5d6ccaa066916 |     
    arc      |          atop-2.10.0           | NOK | http://autobuild.buildroot.net/results/731fc12eb7fca62e68a3e3fea00c067e8027baf0 |     
   sparc     |          atop-2.10.0           | NOK | http://autobuild.buildroot.net/results/21c0b2d02537b122ed2ca12efe7d44fa27f28564 |     
  riscv32    |          atop-2.10.0           | NOK | http://autobuild.buildroot.net/results/511d9e036d848c2ac1ad923be718194e81f9ad7a |     
   s390x     |          atop-2.10.0           | NOK | http://autobuild.buildroot.net/results/b4caa783b462f0ea9317726d4d2a583f7a9b9dac |     
  mips64el   |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/dc076dd50a382410a90494d1b04d86a2e5e6d52f | ORPH
  aarch64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/8a3fa19e8f78570865446289fdfa76a6845b1957 | ORPH
   nios2     |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/cac2d330e2a365107187c6f548e53f3d0ec3bc4c | ORPH
   nios2     |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/127b9882fcabc2c8e55573d36a335fabaeefe0ba |     
   armeb     |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/07608d9deaedcb17f61269fcbe590fee990c4949 | ORPH
    arc      |  binutils-arc-2023.09-release  | NOK | http://autobuild.buildroot.net/results/98b556c20ae6739bf53b9822b5bed3605efcc430 |     
   armeb     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/59f53da1540b0022256b266b17db82f5752a996a |     
    m68k     |          bitcoin-26.2          | NOK | http://autobuild.buildroot.net/results/ce893c8b80e514de3bac14450d7d1b578069ea92 |     
   arceb     |           crun-1.15            | NOK | http://autobuild.buildroot.net/results/11d7c483327075f331d2e6dcb424e2a8bbe00efe |     
    i686     |          cvs-1.12.13           | NOK | http://autobuild.buildroot.net/results/639bb1ab3416a8feb769e0bff309ccea93bcd9cf | ORPH
   xtensa    |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/ec7b349623725edd89c40b24bac6d4f2fb4c81d7 | ORPH
  powerpc    |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/deca17c805dae5bed1d0dfbf3860676c95ca541b | ORPH
   arceb     |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/9b65056600a47426cc24370667cd9394a219b9fc | ORPH
  mips64el   |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/b1e0243905f2f92847f4855e39dc9714d0358435 | ORPH
   x86_64    |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/986293a9068c23ffa3bc048cbebd9cbd28b88c1a | ORPH
   arceb     |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/7c707f119c611969f1b38492d66fa797de8f3e38 | ORPH
   armeb     |         espflash-3.1.0         | NOK | http://autobuild.buildroot.net/results/2d2e37786ac44e60a9fa69c1af3316d2c27b7515 |     
  riscv64    |          fbdump-0.4.2          | NOK | http://autobuild.buildroot.net/results/c0aad45930fc65569451f508f1113261db35f273 | ORPH
 aarch64_be  |          fbterm-1.7.0          | NOK | http://autobuild.buildroot.net/results/1d4d14248243a142de88677d4c15dbaf15f70459 | ORPH
   sparc     |            fbv-1.0b            | NOK | http://autobuild.buildroot.net/results/90c2e1bb3c373d5f32f214eb8e6a1c29bcd0c93b | ORPH
powerpc64le  |            fbv-1.0b            | NOK | http://autobuild.buildroot.net/results/77d0bd8fe3725ab994238e70b509cc9023440ac3 | ORPH
  aarch64    |           fcft-3.1.6           | NOK | http://autobuild.buildroot.net/results/474dfd88e704ff4b58ed3b97fec29db9011348db |     
   arceb     |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.net/results/9d990cd9de3027a0a8680a4060f9bdf062179f6f |     
 microblaze  |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.net/results/5a0a9960afdbd2ee0491ce1aad669e90857ba74f |     
 microblaze  |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.net/results/7e47b21a50557b1b3e069218fb641f91ff6d92a7 |     
 microblaze  |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.net/results/df25bb20e9a1d51ed210eaa78cf1e2a98a05ea82 |     
microblazeel |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.net/results/999eecb446c8e9a64e48195c46a840ec417f0da4 |     
  riscv32    |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.net/results/1eee25ab4192f4ff94da574cae9ba872a7a8ed01 |     
    m68k     |      flatbuffers-24.3.25       | NOK | http://autobuild.buildroot.net/results/7fd249cd26d7d9d1d658c0b86e9f97309249c863 |     
   nios2     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/f9ffa8263846321521709850ac719a71eaa51301 |     
   s390x     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/aad4fe97d00b1b54f1591461a01eb2f363eace3e |     
  mips64el   |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/a625c2950024e644b4434ba8fe06bfd5918ac86f |     
   sh4eb     |        freeipmi-1.6.14         | NOK | http://autobuild.buildroot.net/results/5240f51cb70066f04292c5ed151fd443a3eb6f24 |     
    m68k     |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/0d609e30c0b80f686e54171ed277cf92e004bf94 | ORPH
    m68k     |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.net/results/40188edbd560c4329624688cfcbb8e7ca765bfca |     
 powerpc64   |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.net/results/896d6960a673bac29e0dc32848a92deaef448040 |     
  powerpc    |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.net/results/1b3a055ac0b565bf764ca20332e7841c8593d9fb |     
powerpc64le  |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.net/results/0dcdbe25e14382cfec37e1817fb37f4bcf224def |     
   sparc     |      ghostscript-10.03.1       | NOK | http://autobuild.buildroot.net/results/61063fc5189a3e59586b1e893142254e752222fd |     
    arc      | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/cac6be981ba7b3a6bd59d0d8c6390c04fe43dca2 |     
powerpc64le  | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/73aa89cb1f04fbbdf0c5db78902f3dc0f0856279 |     
   arceb     | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/a5a5461aa9cf6f9c1cae68784075f4b50cf83d48 |     
  riscv64    |           gmp-6.3.0            | NOK | http://autobuild.buildroot.net/results/29715220da219ca04604220ebec37825fa7811a2 | ORPH
    arm      |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/2f2a7d930b697a1044f543c395bd756db19958ab |     
   armeb     |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/01497adcddf93b409d05749ad63b04f0683f7506 |     
  riscv64    |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/6bbbd07773d7b80ea15dc914d36bb786624f6829 |     
 aarch64_be  |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/c806dd5b0e3dfd679811299996826fa02d51aef1 |     
microblazeel |         gnuplot-6.0.1          | NOK | http://autobuild.buildroot.net/results/d6104f837e9bcff069cc6ea055c400b648346df6 |     
 microblaze  |         gnuplot-6.0.1          | NOK | http://autobuild.buildroot.net/results/b79ec68261391f99bbf09ff357276f39df9a3667 |     
   mips64    |         gnuplot-6.0.1          | NOK | http://autobuild.buildroot.net/results/481ed5992892b5ea36f5a44e8b113900d9bbd1c6 |     
  sparc64    |       gnuradio-3.10.7.0        | NOK | http://autobuild.buildroot.net/results/ba4b620a58f868720b5eb8a2afa396e372469399 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/b211bb3eb6d8577a3f24ff61e105c1d678178828 |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/ce2ade66c0b2b3a935353050508fc81009a4c988 | ORPH
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/a8a74775ed32df2edc25174e28376a3472e199a6 | ORPH
   x86_64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/c12193bc3c73068449cc72f06bdd354082940aa2 | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/c01c6d597ae5b99f297590302277acbc8809d6be | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/26b00a7dfdbe6c2adf41412cbd95900d59b65320 | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/b5a1511c76290bec153576c867e53abb8ba86125 | ORPH
 aarch64_be  |       host-binutils-2.42       | NOK | http://autobuild.buildroot.net/results/428fb9aab7214913229d515dac1043cbea2a6283 |     
   nios2     |       host-binutils-2.42       | NOK | http://autobuild.buildroot.net/results/3cf9237d759c4306fe7593111edc59161d8f32c7 |     
  powerpc    |       host-binutils-2.42       | NOK | http://autobuild.buildroot.net/results/eeb2f425e484a36396971ef35f29dcb1327fc002 |     
   s390x     | host-binutils-bare-metal-2.42  | NOK | http://autobuild.buildroot.net/results/de5837ef0878fafde148a6a05bf750f326d33b8e |     
   arceb     | host-binutils-bare-metal-2.42  | NOK | http://autobuild.buildroot.net/results/9303cc6283263f58fc92ff000262faf6512f4869 |     
   mipsel    | host-binutils-bare-metal-2.42  | NOK | http://autobuild.buildroot.net/results/c435f72e60d3b6819ef6d216864555d5a29d791b |     
  mips64el   |       host-delve-1.22.1        | NOK | http://autobuild.buildroot.net/results/ec4155be9a2f6c24758ea19c11d6b93cd15f82f0 |     
powerpc64le  | host-go-bootstrap-stage1-1.... | NOK | http://autobuild.buildroot.net/results/fcbbe5b33f375fb771eaab0e1a52cd32651da65d |     
   s390x     | host-go-bootstrap-stage1-1.... | NOK | http://autobuild.buildroot.net/results/7384791d27c3bd9cdd8becae54e66d369641e4dd |     
  riscv64    | host-go-bootstrap-stage1-1.... | NOK | http://autobuild.buildroot.net/results/e52847c1193519b9760e0b2e7e17f9952b5a1cb9 |     
   armeb     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/c8617c604efa5d83025b91af0718367199dbb8be | ORPH
  riscv64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/f9bf600c6bb7bf241ab3b2c58f7356dd0eae9991 | ORPH
   x86_64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/2e2afee0b1ca58658977eca8b10e1dd32ef0c04a | ORPH
  mips64el   | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/3bd0173168116c6986834e1f6656763ef3ecf50d | ORPH
powerpc64le  | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/1f5c88261fd53ca57d549203d044074642bdbce1 | ORPH
   sh4aeb    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/04721603d377fe4e57c044b67486320eaba79f2e | ORPH
 aarch64_be  |      host-librsvg-2.50.9       | NOK | http://autobuild.buildroot.net/results/f6c7fd8d72038056b77f5c18f15e6921e07cbc68 |     
    i686     |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/fb6933e16dba6f75e40ae29ff46a54fd859025c7 |     
   s390x     |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/375cca3ef1192a7366ed24295e48117ae180baaa |     
   mips64    |   host-moby-buildkit-0.11.6    | NOK | http://autobuild.buildroot.net/results/5e71c90ab5ca727576bbe3be5f8c63bf14c25950 |     
  riscv64    |       host-skopeo-1.13.3       | NOK | http://autobuild.buildroot.net/results/e230437e0ecf32bb9f3e8d66ed96d30a4cef6a0a |     
  mips64el   | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/86560bf7c40063770aa8cbe256e715525ba86ea5 | ORPH
    mips     | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/284fd7bebce21adbcc13e63df767aa98b1bc754f | ORPH
   s390x     | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/cd5cf84521f058665a82eca1da29f4723aa2f6e9 | ORPH
 aarch64_be  | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/8f368259242cee10c8141c74888b89f198292e06 | ORPH
    or1k     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/7482bdd00ce4bf13e3bb87db337267b727d33df6 |     
    sh4a     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/50ad75186f5086465e0b3f5c636a832c0e7bb084 |     
   mipsel    |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/9b37a002f51919b258141972e77978c486ddce4e |     
 aarch64_be  |         latencytop-0.5         | NOK | http://autobuild.buildroot.net/results/0e6de45f48d7f58c990b64951839e92de92c5b75 | ORPH
  mips64el   |      libcamera-apps-1.5.0      | NOK | http://autobuild.buildroot.net/results/ee24f7cde3cd75c66082c6f9188fa6cd0cc65386 |     
   arceb     |         libcuefile-475         | NOK | http://autobuild.buildroot.net/results/c927ca76eb6c461cbdc62b94c855785ff5e0db36 | ORPH
  mips64el   |         libcuefile-475         | NOK | http://autobuild.buildroot.net/results/bb018493d7126e19fbc422f057762c3369c631d7 | ORPH
   sparc     |         libdrm-2.4.122         | NOK | http://autobuild.buildroot.net/results/b29b17afd559819b08217a8563b05862f786b6b2 |     
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/7b40d42434f570c33262b9f341eb61e8532c1c2f |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/cc0f05aaf667f32340c4ab01a1166981a0d14024 |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/2e7aaea025fe59e58e5c7b6cabd78a14cd39c568 |     
 powerpc64   |         libgee-0.20.6          | NOK | http://autobuild.buildroot.net/results/23d23f600c0f00570251ec87ae1204040dfff03c |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/6bbb5a3020365a5e14842398e65c0a2013aa1da3 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/f70827d2b8a0ecd300afd2a0beeb0a6d85ae6ce4 |     
    arm      |      libmicrohttpd-1.0.1       | NOK | http://autobuild.buildroot.net/results/e87ec5289bcff11365158351b5ef3d811c48d8ab |     
  sparc64    |   libphidget-2.1.9.20190409    | NOK | http://autobuild.buildroot.net/results/2cfe3a0e28ebc7456475808d222828a86e91563f |     
  aarch64    |         librsvg-2.50.9         | NOK | http://autobuild.buildroot.net/results/38452ceeb78621d781d7e3689913173be5deea67 |     
  riscv64    |         libselinux-3.6         | NOK | http://autobuild.buildroot.net/results/cc23ddde966b518299ae15f071c552eee892fbbe |     
    arc      |         libusb-1.0.27          | NOK | http://autobuild.buildroot.net/results/459401bab825acf764cdbb156d1ce012183e9b94 |     
 microblaze  |         libv4l-1.24.1          | NOK | http://autobuild.buildroot.net/results/f46be6f25061eb279d3131379114ffbd7c7caa09 |     
   mipsel    |          libva-2.22.0          | NOK | http://autobuild.buildroot.net/results/e473f54dee7eb54c0bb570b5c895a98de4d2ac3b |     
  riscv32    |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/4c0a555295808bc0985e0ea42fc25ade491fe46f | ORPH
   mips64    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/c25bee6435b1fb91ce08869c0c41a363276381a6 | ORPH
  mips64el   |          linux-6.10.3          | NOK | http://autobuild.buildroot.net/results/cf10f53efb1da753da889bc1c4e3ebbf2a14bd6d | ORPH
   mipsel    |          linux-6.10.3          | NOK | http://autobuild.buildroot.net/results/031c544c5944aac10c5dfaf6fa944e33c8c51582 | ORPH
   nios2     |          linux-tools           | NOK | http://autobuild.buildroot.net/results/d1f4bb97eda8c64affee52c44351b8c45915dda6 | ORPH
    or1k     |          linux-tools           | NOK | http://autobuild.buildroot.net/results/e98e4c29af8b1e737d572458d5726d6db5cd09b8 | ORPH
   x86_64    |     ltp-testsuite-20240524     | NOK | http://autobuild.buildroot.net/results/c13dbafe2f02da3d9132845fbe8fe2ca3fec6298 |     
  aarch64    | ltrace-82c66409c7a93ca6ad2e... | NOK | http://autobuild.buildroot.net/results/96492bde18f8ba1bd83aeec3ff99f4cc89330f91 | ORPH
microblazeel |          ltris-1.3.2           | NOK | http://autobuild.buildroot.net/results/5399aead3090f1b979eb44b1113bc03d78a43e82 |     
  sparc64    |     lttng-modules-2.13.10      | NOK | http://autobuild.buildroot.net/results/a2d23e693687757950ebedbd155feb138aadc6f3 |     
 microblaze  |          lvm2-2.03.23          | NOK | http://autobuild.buildroot.net/results/bc4d2cfc64d281cd6bc550e4962f3ccacab89dc5 | ORPH
   sparc     |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/5988114aaa2d831a2f6213d53b7aad356e8c81cb | ORPH
   arceb     |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/d23862211e526dc30e3cf0b1d9157c2fa79d0692 | ORPH
   x86_64    |           mdadm-4.3            | NOK | http://autobuild.buildroot.net/results/ce35be2a5d80a82c6f60d2f70b6a606316ae0e3c | ORPH
   x86_64    |         memtest86-6.20         | NOK | http://autobuild.buildroot.net/results/f971f1fa93b89c99edb94edee352eebd5f2e2ce3 |     
   x86_64    |         memtest86-6.20         | NOK | http://autobuild.buildroot.net/results/27d176d5acfd4709d45f0698e6197836569389a0 |     
   mips64    |        memtester-4.5.1         | NOK | http://autobuild.buildroot.net/results/a3ec2ebc6b4588674d1401ae70603fe7179245ce | ORPH
 aarch64_be  |         mesa3d-24.0.9          | NOK | http://autobuild.buildroot.net/results/765aee602974907e3899c59a38cbb1e17572a3d1 |     
  aarch64    |       micropython-1.22.0       | NOK | http://autobuild.buildroot.net/results/9a1d2e441df556be01a7f6fd8fefca808c4a408f |     
    arm      |           mpv-0.35.1           | NOK | http://autobuild.buildroot.net/results/e7b9c3a5ab3fa10fb9b4c5944b59ba279ec1fe7c |     
powerpc64le  |           mpv-0.35.1           | NOK | http://autobuild.buildroot.net/results/0b794771c444312cb3def5f954b94f02c3fb962a |     
   nios2     |           ncmpc-0.49           | NOK | http://autobuild.buildroot.net/results/d0aae4626a11ea205151938b3cd28a7a1ddbf620 |     
   xtensa    |      ncurses-6.4-20230603      | NOK | http://autobuild.buildroot.net/results/a527bdb5dbe4ba25006807485fa1bf89687beba0 | ORPH
powerpc64le  |          ntpsec-1.2.3          | NOK | http://autobuild.buildroot.net/results/6d985fb446c994e97f2be56e089446c5568e4ad4 | ORPH
   sparc     |           ola-0.10.9           | NOK | http://autobuild.buildroot.net/results/29d564a950319bd72b30b788c31ca6b351c6febf |     
   mips64    |         openssh-9.8p1          | NOK | http://autobuild.buildroot.net/results/e2d75e365ae10a2c89e2a70110113c0115cd48fa | ORPH
  sparc64    |       parsec-tool-0.7.0        | NOK | http://autobuild.buildroot.net/results/5f57f1fb7afb778259e25ca577fab5b15d5fd6d7 |     
   armeb     |           php-8.3.10           | NOK | http://autobuild.buildroot.net/results/143a84648c555284aab223265f6f7a79d67874e5 |     
   armeb     |         pixman-0.42.2          | NOK | http://autobuild.buildroot.net/results/b3cf10f5d66d1f5da4f92f0ffc35f4b66c362f29 | ORPH
  mips64el   |         pixman-0.42.2          | NOK | http://autobuild.buildroot.net/results/9cbdd4372f66484bc9f719374b025ea9f4b84fb5 | ORPH
   s390x     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/7a5168017f87bf3944d0da2cf56bb2b83bfdcdc4 | ORPH
   xtensa    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/70510059ab021caa138a82fa96c4d800e653f017 | ORPH
 microblaze  |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/26594d801f0d628d06592a1716636f921f90393a | ORPH
 powerpc64   |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/05f10bd861f099e42f24d5df727528382bcd016a | ORPH
    mips     |        pulseaudio-17.0         | NOK | http://autobuild.buildroot.net/results/bf44121f44c5ac4bffb297e8cbdeb8fb4eae7fdd | ORPH
   s390x     |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/e10fddcffaf5e933c49eb419f14a0e9873692cea |     
  sparc64    |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/e84180c58fe5a188eb6fc7da2d59e5eb77ccb17a |     
 powerpc64   |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/f507a367ef7a1b4bd5b533d04306587cb491ca47 |     
powerpc64le  |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/5d2299872cc87b38ad527d3c680532d6358ce6f0 |     
  aarch64    |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/53635477ec71fc43c8d77aa65779aa1828c569c2 |     
  mips64el   |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/516d20e43bd5b8585634c6ed5e5b22b914928ebf |     
 powerpc64   |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/4565964a309728616a4ee11891da282c3bcfda39 |     
    mips     |      python-daemon-3.0.1       | NOK | http://autobuild.buildroot.net/results/91e82b95019d7f7e612b74438d4fbc23e543e81d |     
   nios2     |      python-daemon-3.0.1       | NOK | http://autobuild.buildroot.net/results/d7738c664e19eb04972c18a84d659a74609e51a9 |     
   sparc     |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/e3e89a6323aba23782d5b825347d6d816d6b5b0d |     
  riscv32    |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/99195c1a107d4d3df50dde02900c2131e55d5aa8 |     
   mips64    |        skalibs-2.14.2.0        | NOK | http://autobuild.buildroot.net/results/538060d7969f58c7201f74cd40d12edf7e6f4339 |     
   mips64    |        skalibs-2.14.2.0        | NOK | http://autobuild.buildroot.net/results/f2f43cb64acfffac87302e42a84fc16305637c8e |     
    i586     |       sofia-sip-1.13.17        | NOK | http://autobuild.buildroot.net/results/5160a64dcd3e3c2cf9261592963f6ec839d188d0 |     
    arc      |       sofia-sip-1.13.17        | NOK | http://autobuild.buildroot.net/results/c01e4a4b2d12c3a62352c800624c2ea1396ce448 |     
    sh4a     |           sslh-2.0.1           | NOK | http://autobuild.buildroot.net/results/055b553ae65c95d6e0a87f27ddbad2e5d7327f7f | ORPH
    mips     |       strongswan-5.9.13        | NOK | http://autobuild.buildroot.net/results/4984209369cbf1b4f43ca703c4bf87bbe2181c85 |     
   s390x     |       strongswan-5.9.13        | NOK | http://autobuild.buildroot.net/results/5a18c3c05c02bbb1ee70d887cafa9f100104251a |     
  riscv32    |       strongswan-5.9.13        | NOK | http://autobuild.buildroot.net/results/08c2561067242b221dbc344103ce45079e3a7ef9 |     
 aarch64_be  |          swipl-9.2.6           | NOK | http://autobuild.buildroot.net/results/34928a94cd332b4302f1ac05f4701be0805a1a7d |     
 aarch64_be  |        syslog-ng-4.7.1         | NOK | http://autobuild.buildroot.net/results/d76883e0870b4c788058fee1ac2c1c47a17f6bf2 |     
   nios2     |         systemd-256.4          | NOK | http://autobuild.buildroot.net/results/6f63c2b48c5a75bca53bb17599be55710f30e6dc |     
  sparc64    |         systemd-256.4          | NOK | http://autobuild.buildroot.net/results/7615c4c621a59d3c61ba732e39b78f559f07d68a |     
    arc      |         uclibc-1.0.49          | NOK | http://autobuild.buildroot.net/results/841a2629a0b9bb66e3daa7ae696754f90c23774b |     
   arceb     |         uclibc-1.0.49          | NOK | http://autobuild.buildroot.net/results/fab3c8e747e7d46bf4ef278f072323431abd1992 |     
  powerpc    | uclibc-ng-test-132c6134d691... | NOK | http://autobuild.buildroot.net/results/2b42be4d82b74f39c82b16239231b020075c3561 |     
    mips     | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/411b61bfb3961f67a4539624ef22ab7b78be4848 |     
   x86_64    |            unknown             | TIM | http://autobuild.buildroot.net/results/fce065c89338645b19aac3bfd2e3e00bae3993ab |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/381e6dc61111c3ff7d410add03a9892e2451d85a |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/ede9399784bc3893f1bee298985df5e9ca5b9ba9 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/3963eaddf6fbaacc193296862d84201f2b4c3ed7 |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/665ddd2fb780536c844212ad18b0fbca9876621f |     
  powerpc    |           volk-3.0.0           | NOK | http://autobuild.buildroot.net/results/82cb35e9be6a57539d4e370ab2c4a4fae9d8b5d8 |     
  aarch64    |        zxing-cpp-2.2.1         | NOK | http://autobuild.buildroot.net/results/e554b8629bb29cea697750645aa8639da81a408a |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

             containerd-1.7.18 | 1 
                 dc3dd-7.2.641 | 1 
           flatbuffers-23.5.26 | 1 
                   foot-1.16.2 | 1 
  gobject-introspection-1.76.1 | 1 
                       unknown | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |       containerd-1.7.18        | NOK | http://autobuild.buildroot.net/results/73c36931d102bd3633314174e338c076b42d50ed |     
    m68k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/856e213d0a109fbe47840bff85da76880b488fb7 | ORPH
    m68k     |      flatbuffers-23.5.26       | NOK | http://autobuild.buildroot.net/results/6546cbd22d9fd20f48fd205353cf5c7422a92a13 |     
 microblaze  |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/fea80d5e65f514bbef3d6a50ed0fbc8cae6f3a79 |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/34661c314293f306e7f8ebd5e70cb142539a51ba | ORPH
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/2880724514d6d898b18c9b3a4d30269d5a8fcb96 |     


Classification of failures by reason for 2024.05.x
--------------------------------------------------

     bandwidthd-2.0.1-auto-r11 | 1 
                    bcc-0.29.1 | 1 
  gobject-introspection-1.76.1 | 1 
         host-libxcrypt-4.4.36 | 1 
                  ntp-4.2.8p18 | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   |   bandwidthd-2.0.1-auto-r11    | NOK | http://autobuild.buildroot.net/results/e61b2f1be3b560c355d45092ea953c79921fbb66 |     
  aarch64    |           bcc-0.29.1           | NOK | http://autobuild.buildroot.net/results/20d4227b6a75dd8a821e8688438f7cb5732894bc |     
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/9ef7f4c26d588a9e19a3ad6ea24ad73cfa871e6f | ORPH
powerpc64le  |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/fa997534503078cfa3dcb8b58fd115608eefbfd4 |     
   sh4aeb    |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.net/results/74d8ce4f60fdf8cf49cda3dd9e6102a6b48dd504 |     


Gitlab CI results for 2024-08-12
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
 TestAarch64Pages64kGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/7557058183  | ORPH 
                 TestAtop | https://gitlab.com/buildroot.org/buildroot/-/jobs/7557057611  | ORPH 
              TestDtbocfg | https://gitlab.com/buildroot.org/buildroot/-/jobs/7557057635  | ORPH 
                 TestExt2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7557057547  | ORPH 
...ilp32dMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/7557058511  | ORPH 
...iscv32ilp32dMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/7557058512  | ORPH 
                TestFping | https://gitlab.com/buildroot.org/buildroot/-/jobs/7557057644  | ORPH 
             TestGnuradio | https://gitlab.com/buildroot.org/buildroot/-/jobs/7557057657  | ORPH 
        TestHostBmapTools | https://gitlab.com/buildroot.org/buildroot/-/jobs/7557057620  | ORPH 
...so9660SyslinuxExternal | https://gitlab.com/buildroot.org/buildroot/-/jobs/7557057558  | ORPH 
            TestLuaLuaSec | https://gitlab.com/buildroot.org/buildroot/-/jobs/7557057775  | ORPH 
              TestMariaDB | https://gitlab.com/buildroot.org/buildroot/-/jobs/7557057810  | ORPH 
               TestMender | https://gitlab.com/buildroot.org/buildroot/-/jobs/7557057819  | ORPH 
  TestNodeJSModuleHostBin | https://gitlab.com/buildroot.org/buildroot/-/jobs/7557057852  | ORPH 
                   TestNu | https://gitlab.com/buildroot.org/buildroot/-/jobs/7557057860  | ORPH 
          TestPerlGDGraph | https://gitlab.com/buildroot.org/buildroot/-/jobs/7557057897  | ORPH 
                 TestPixz | https://gitlab.com/buildroot.org/buildroot/-/jobs/7557057935  | ORPH 
    TestPythonPy3Autobahn | https://gitlab.com/buildroot.org/buildroot/-/jobs/7557057968  | ORPH 
    TestPythonPy3Botocore | https://gitlab.com/buildroot.org/buildroot/-/jobs/7557057986  | ORPH 
...PythonPy3PytestAsyncio | https://gitlab.com/buildroot.org/buildroot/-/jobs/7557058079  | ORPH 
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/7557058088  | ORPH 
         TestRelroPartial | https://gitlab.com/buildroot.org/buildroot/-/jobs/7557057517  | ORPH 
              TestRustBin | https://gitlab.com/buildroot.org/buildroot/-/jobs/7557058119  | ORPH 
                TestSWIPL | https://gitlab.com/buildroot.org/buildroot/-/jobs/7557058141  | ORPH 
               TestWeston | https://gitlab.com/buildroot.org/buildroot/-/jobs/7557058159  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
