Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24C1EC3DA4A
	for <buildroot@archiver.kernel.org>; Fri,  2 Aug 2024 05:03:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70C3B40D07;
	Fri,  2 Aug 2024 05:03:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q4DU-Tg8ARaI; Fri,  2 Aug 2024 05:03:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2557F40B5F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2557F40B5F;
	Fri,  2 Aug 2024 05:03:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A80E11BF39D
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 05:03:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8914C40B5F
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 05:03:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yEWIY1D31De8 for <buildroot@lists.busybox.net>;
 Fri,  2 Aug 2024 05:03:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 56762406E3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56762406E3
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 56762406E3
 for <buildroot@buildroot.org>; Fri,  2 Aug 2024 05:03:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 428ECFF80B
 for <buildroot@buildroot.org>; Fri,  2 Aug 2024 05:03:41 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Fri, 02 Aug 2024 05:03:41 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1722575021; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=KpRQLPVsaA60PjN13352rO9Nla6PKXzvz2DRNRBoRRE=;
 b=n1PvM8cX2TmRMrVnLB1E8euNzxO1WdVwR6KS8KJTXP7zvVoDBMTjGZlQQCFDpGWu5SwpMg
 wGgOL3tyd3MkhkmnrMZItGuaw8E0Jjp17ER4V32KJOu+IfAGShzBYiDCJM20oKTykdYQ34
 AzQtI4OtcAXEuBKlu90i/XrG+FrVWYW8PHeBwrQ2ys2DB1DjUAr7EcvcA+S/uxMCZmHzOE
 djok7ILS4w9fHY/0CYgFwUh0vfp5vMenO7kQ2kQifDT1jaxUqmEthralJn1ZhBjGCfuQP8
 gAbOC0XKPia34t5mVoxxl8jrw8etZqyf5kx7Gkd5Z1tOHBxdDIPe+JBvCRXfwA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=n1PvM8cX
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-08-01
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
Message-ID: <20240802050341._2QHFhP7zpa3LaW9GcOrEtGs6luRcUv_yrX0vCtS5OM@z>

Hello,

Autobuild statistics for 2024-08-01
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  8  |  5  |  0  | 13  |
  2024.05.x  |  6  |  8  |  1  | 15  |
    master   | 125 | 249 |  4  | 378 |

Classification of failures by reason for master
-----------------------------------------------

                host-odb-2.4.0 | 12
                     avahi-0.8 | 11
                  bcusdk-0.0.5 | 8 
                  ffmpeg-6.1.1 | 8 
host-vboot-utils-bbdd62f9b0... | 8 
  gobject-introspection-1.76.1 | 7 
               procps-ng-4.0.4 | 7 
      python-autocommand-2.2.2 | 7 
                 openssh-9.8p1 | 6 
                 dc3dd-7.2.641 | 5 
                elfutils-0.189 | 5 
glibc-2.39-74-g198632a05f6c... | 5 
host-heimdal-f4faaeaba371ff... | 5 
                    norm-1.5.8 | 5 
           python-daemon-3.0.1 | 5 
aer-inject-9bd5e2c7886fca72... | 4 
                gnu-efi-3.0.18 | 4 
         gobject-introspection | 4 
         host-libxcrypt-4.4.36 | 4 
            host-skopeo-1.13.3 | 4 
 host-softether-4.30-9700-beta | 4 
                libressl-3.8.4 | 4 
                       unknown | 4 
            host-binutils-2.42 | 3 
                  libffi-3.4.6 | 3 
                  linux-6.10.2 | 3 
               mariadb-10.11.6 | 3 
                s6-dns-2.3.7.2 | 3 
                 apache-2.4.62 | 2 
                  assimp-5.3.1 | 2 
             cni-plugins-1.3.0 | 2 
cwiid-fadf11e89b579bcc0336a... | 2 
                  fbdump-0.4.2 | 2 
              fmlib-LSDK-21.08 | 2 
                   foot-1.16.2 | 2 
                gerbera-1.12.1 | 2 
             gnuradio-3.10.7.0 | 2 
               graphene-1.10.8 | 2 
             host-delve-1.22.1 | 2 
              host-rust-1.79.0 | 2 
               ipmitool-1_8_19 | 2 
                  ledmon-1.0.0 | 2 
                libnss-3.102.1 | 2 
                  libsepol-3.6 | 2 
                  mender-3.4.0 | 2 
                    mpv-0.35.1 | 2 
              openconnect-9.12 | 2 
             parsec-tool-0.7.0 | 2 
    python-cryptography-39.0.2 | 2 
               tipidee-0.0.5.0 | 2 
                 uclibc-1.0.49 | 2 
                      xz-5.6.2 | 2 
               zxing-cpp-2.2.1 | 2 
android-tools-4.2.2+git2013... | 1 
           at-spi2-core-2.50.0 | 1 
                  bind-9.16.48 | 1 
  binutils-arc-2023.09-release | 1 
                   bird-2.0.12 | 1 
              cache-calibrator | 1 
                  cairo-1.18.0 | 1 
                   cvs-1.12.13 | 1 
                     daq-2.0.7 | 1 
      docker-cli-buildx-0.16.1 | 1 
                   duma-2.5.21 | 1 
                   expat-2.6.2 | 1 
                   eza-0.18.22 | 1 
       freeradius-server-3.2.3 | 1 
            gdk-pixbuf-2.42.10 | 1 
                 gnuplot-6.0.1 | 1 
     host-moby-buildkit-0.11.6 | 1 
                    htop-3.3.0 | 1 
          imagemagick-7.1.1-31 | 1 
                  jack2-1.9.22 | 1 
                jemalloc-5.3.0 | 1 
          libcamera-apps-1.5.0 | 1 
                 libcddb-1.3.2 | 1 
                libcuefile-475 | 1 
                libesmtp-1.1.0 | 1 
               libglib2-2.76.1 | 1 
              libopenssl-3.3.1 | 1 
              libtracefs-1.8.1 | 1 
               libunwind-1.8.1 | 1 
                  libva-2.22.0 | 1 
                libxml2-2.12.6 | 1 
                 libzlib-1.3.1 | 1 
               lighttpd-1.4.76 | 1 
          linux-5.10.162-cip24 | 1 
                   lsuio-0.2.0 | 1 
        ltp-testsuite-20240524 | 1 
                  lvm2-2.03.23 | 1 
                memtest86-6.20 | 1 
                    ncmpc-0.49 | 1 
                  nginx-1.24.0 | 1 
                     nut-2.8.2 | 1 
               openblas-0.3.27 | 1 
           python-numpy-1.25.0 | 1 
  python-pypika-tortoise-0.1.6 | 1 
         python-remi-2022.7.27 | 1 
                  scrypt-1.3.2 | 1 
                 shadow-4.15.1 | 1 
                  snmppp-3.5.1 | 1 
                 systemd-256.4 | 1 
                tpm2-tss-3.2.2 | 1 
                usbguard-1.1.2 | 1 
                    vlc-3.0.21 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/dc7443ffa34ef97c5af678ef1a29c5c8a206a2e0 | ORPH
  aarch64    | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/d811cdcebabd26e5101a96b449626f619d963dcd | ORPH
   s390x     | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/5968c4e8d55190c5452cdefc6917e002b89d9770 | ORPH
   mipsel    | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/e78dac7072b7948153f5e339c36fa8f8f239c949 | ORPH
 microblaze  | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/dac5963fd845db2b86dbede7b524151afb666c17 |     
  sparc64    |         apache-2.4.62          | NOK | http://autobuild.buildroot.net/results/8b4300a99c2318a5c4cd5cd2d53a7f420e643441 |     
    i686     |         apache-2.4.62          | NOK | http://autobuild.buildroot.net/results/51c0746ed6520790bd5a8e1af5276b061eeee759 |     
  powerpc    |          assimp-5.3.1          | NOK | http://autobuild.buildroot.net/results/587efd45c2490d758d89fa096981fdf8b01a3f0c | ORPH
    i686     |          assimp-5.3.1          | NOK | http://autobuild.buildroot.net/results/6f5517d92fe96ee8555d079d56f8ef69f48eb107 | ORPH
 microblaze  |      at-spi2-core-2.50.0       | NOK | http://autobuild.buildroot.net/results/0193592c18c33e7b1d6289e824816fef3f2b13d8 |     
   s390x     |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/6d76650862d3f7218cec4e1d9d6221361863b9c6 | ORPH
  aarch64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/d42923cd001a5c0762d180b1d92cbd452f010ac4 | ORPH
    mips     |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/22a2bf60c4c4cf3f990f86243d49f80dfadbc246 | ORPH
powerpc64le  |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/c8b2a15035a7b0ae02cd8de0786f1ccd69930624 | ORPH
  aarch64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/3492a2ace1c40700667d84ab18ae3ea56ff8e8cb | ORPH
 aarch64_be  |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/c638870b5ca4e558bf7bf00f2df87e91b8ec77bd | ORPH
 powerpc64   |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/8033036a4d94c86f0575d0dcf3c842470174d040 | ORPH
powerpc64le  |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/fa10bb8122f5dad515b8e911aa27ff5c67d8a06a | ORPH
  sparc64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/28392f52d68e1dc76930d31dc1890e4614e82e68 | ORPH
 aarch64_be  |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/fbaed7ceb472cd524c7b48443453a91fcba741d8 | ORPH
   x86_64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/ad52483de3bcd2e3fce17d4fac8d2b624ae4d616 | ORPH
   mipsel    |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/116f22c613935d3240f7855c6cc487902844ca4a |     
   mipsel    |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/50987bd60c16463378ea11efbd4015930cff18b6 |     
 microblaze  |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/9f757d3996b7e3a053e39a674df2e425e8a5f403 |     
    i686     |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/894580e287b8441c8af803e4f773fb951894f2fc |     
 aarch64_be  |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/5f43ecf3518f7a4dc10bd0d413b2e9493d244acd |     
   sparc     |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/da5686cb7f2392023a1f73e3fc3c6dcdfc088e97 |     
  aarch64    |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/afd373a2a688141e636a0581a65c87cd5e82638b |     
   x86_64    |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/0a0f857078fe0a44a6f6f290fa0ee701ad31a80f |     
  mips64el   |          bind-9.16.48          | NOK | http://autobuild.buildroot.net/results/ef421d7b51da67b8a6f90283868a82a311bf6927 | ORPH
    arc      |  binutils-arc-2023.09-release  | NOK | http://autobuild.buildroot.net/results/f1119b3f3c4105e47c8e2ed9810e17e93d4f21b7 |     
  aarch64    |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/82fbda76b521ea9ff642842f911895f3ead7c19d |     
   mipsel    |        cache-calibrator        | NOK | http://autobuild.buildroot.net/results/ace8847c2207f1ba17ff71044fc7bb1fcba34cd8 |     
   mipsel    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/35ccdb4d80609cd61c22ac4df007c15f933ad22e |     
  riscv64    |       cni-plugins-1.3.0        | NOK | http://autobuild.buildroot.net/results/47f11e638821ce84d4cadb832670b4becc5cb22f |     
    arm      |       cni-plugins-1.3.0        | NOK | http://autobuild.buildroot.net/results/b09a4f05c5fe6af8b31dffa3bcf5abe65ac0cafc |     
    mips     |          cvs-1.12.13           | NOK | http://autobuild.buildroot.net/results/ae6334b85d7b0b28d3f10fe1e56a21408328ba7a | ORPH
   mipsel    | cwiid-fadf11e89b579bcc0336a... | NOK | http://autobuild.buildroot.net/results/b792b4fddeb711066500037e86297aa19a5c7fdb |     
   nios2     | cwiid-fadf11e89b579bcc0336a... | NOK | http://autobuild.buildroot.net/results/e9ed25f7f560e6f9c79ed00462fbd01d5578a0b1 |     
  powerpc    |           daq-2.0.7            | NOK | http://autobuild.buildroot.net/results/c71c32f13984bb5ab7e3f97a07675681b7aca579 |     
   mipsel    |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/1d8072b2a1dbdfb1180480fceca2a5d6aaa2ae44 | ORPH
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/ec50e1908d61d305e7c2662a8cd9a568944b25ba | ORPH
    i686     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/4b009f4f09d2db19f6ca4ce432b26a880d06ef5b | ORPH
   armeb     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/b1111e81c1c725196cbf7ae3f6f992ac4b3805e1 | ORPH
  mips64el   |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/ff86115c458ade3eabe860e37d04243a919e15db | ORPH
    arm      |    docker-cli-buildx-0.16.1    | NOK | http://autobuild.buildroot.net/results/81b0afc407d3fb7deed39ddae9f651140bed8d63 | ORPH
    sh4a     |          duma-2.5.21           | NOK | http://autobuild.buildroot.net/results/9d4af4ca05451e6b073d2f127815828b004c522f | ORPH
  mips64el   |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/fd4ff9505da01189df65578ae52259009014e4ec | ORPH
    arc      |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/76917a2085e7dcfc0b8934c071401efd267ee340 | ORPH
   x86_64    |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/65f12088bb84792facec418f089c6341a0a94657 | ORPH
   x86_64    |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/932a6da26a3fcf75de29afcf9dd58fccae1f0f2c | ORPH
   arceb     |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/d6c88a4296a2b94d5e7987ead4699b0adf3cba86 | ORPH
powerpc64le  |          expat-2.6.2           | NOK | http://autobuild.buildroot.net/results/cade0f397906ecd15aa972faccddc8cf8924e4d3 |     
    arm      |          eza-0.18.22           | NOK | http://autobuild.buildroot.net/results/37af863169b181868e1217adcaa092964b17ab88 |     
   sparc     |          fbdump-0.4.2          | NOK | http://autobuild.buildroot.net/results/a321e1741b377d764e33496d3e7014459ec44efd | ORPH
  sparc64    |          fbdump-0.4.2          | NOK | http://autobuild.buildroot.net/results/c4498197cd3e4316cbb51815be60a1a24acc4d2b | ORPH
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/08a5c509323dd5c5984532d2afafbc795f893559 |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/f0c3434f268f7dcd804f93f73af49e7f2fe81848 |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/32079a08d9d0b94a125532aba5bb69a3b263857c |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/99bc1df1248e054ed69396dd7cb66ea1c0891fe6 |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/9526a1fcef1186bbdd5b6a692db51bb5adaebde9 |     
   arceb     |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/7158893b556540b3f4db176e63e2ba7ce4910a15 |     
    arc      |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/3b6df53e5d743beb3063f1a3392cf3c74c1cf9b0 |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/c01813d7a9cc3e2a7146f7fe1a6c915c9b514022 |     
  aarch64    |        fmlib-LSDK-21.08        | NOK | http://autobuild.buildroot.net/results/57d5cc103eb32fd0356971be9f9dd60fadbc112f | ORPH
  aarch64    |        fmlib-LSDK-21.08        | NOK | http://autobuild.buildroot.net/results/38d470d458928a1cb36c8a9d0762fb35d5584ca1 | ORPH
   nios2     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/32da4be6809230c4134e7e7ce217c6099f441440 |     
  powerpc    |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/d1b722d0bfeae87f497f6f6b1de146cab022784b |     
   sh4eb     |    freeradius-server-3.2.3     | NOK | http://autobuild.buildroot.net/results/4ec4816bff3e7358e6b96abceb123a8c43639d38 |     
   x86_64    |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/4fc13ebdace02d6b1280bfc570a54bc9d15efc7e | ORPH
   x86_64    |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.net/results/dd56853e75bb27aab59c766b7e7f76aa74a166c5 |     
  aarch64    |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.net/results/dcf849195134b2d934c435d838632d597497b03d |     
powerpc64le  | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/b3749676c15660fe2078adc8242be8683194bba1 |     
    arc      | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/d27a3935d421ae438ccadcc3c617d6b4c57df721 |     
   arceb     | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/5a3492bdd22e88235514eb99324cb80b4b707815 |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/3b23a4a0c5a40ba511d2c1c4c303c9653a54acb9 |     
  riscv64    | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/157be8b6f7b407bd75760a5dc21eaa2471e908e2 |     
    arm      |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/7be6797633b60904e9d3a3a4dc0a9d9126b88981 |     
 aarch64_be  |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/2af4c353ee0f9d88a4528ee43b36747b50422724 |     
 aarch64_be  |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/412b6555a20efdd757ae5695a5d4054a6f66c4f2 |     
   armeb     |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/33f7cd501539ebc74da579cb12883e3ef9761b54 |     
   nios2     |         gnuplot-6.0.1          | NOK | http://autobuild.buildroot.net/results/0c6304caffce3dcdda882469bbc103efb6653376 |     
  sparc64    |       gnuradio-3.10.7.0        | NOK | http://autobuild.buildroot.net/results/36bb644220db92c1a34d156fba6b7e293014ea9a |     
  aarch64    |       gnuradio-3.10.7.0        | NOK | http://autobuild.buildroot.net/results/8fd81f4fc7d69955e114eccd2c611269a4013316 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/781b7624b4c6ad5a6e1af7263f33be80e245870a |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/6829728184d512c8971515c98e6accf9c4f67958 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/bee26a017a142611afc0812fcaf7f33786f77a72 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/65d66ea3564aa3f5067115f141d4def9f3cfba6c |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/358180ae21dc91f84ed60d32d3b1837525b0e652 | ORPH
  powerpc    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/2ba08521d1d99a74633b6c0a5ae9c9058c538ae0 | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/5a2d064e4fa259cca2a0779fe79a9006dbd773e7 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/664b2df14d7f7b200f5699177f10dc5f61a0b6ae | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/baa030af4182702d9a120cbfcd5ec9f7e80ac5cf | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/e9f971df82a1492c021c10bb9606cb91d1b107c8 | ORPH
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/39d84d45928433d22625a6f19535cb5b88bbad25 | ORPH
    sh4a     |        graphene-1.10.8         | NOK | http://autobuild.buildroot.net/results/50e2768c605e66f5fcb027321383e9a8a48b2271 |     
    sh4a     |        graphene-1.10.8         | NOK | http://autobuild.buildroot.net/results/74ae475e8de2c324db0b5d282533dbae81a90e12 |     
   nios2     |       host-binutils-2.42       | NOK | http://autobuild.buildroot.net/results/0ec2fd04735d166783471c963944d800a1237d63 |     
   s390x     |       host-binutils-2.42       | NOK | http://autobuild.buildroot.net/results/72d6f1078a8eb71560db4cb441c30e352785c5a9 |     
    arm      |       host-binutils-2.42       | NOK | http://autobuild.buildroot.net/results/4598d6d35a6e11e40d783c7d6b533e9fce26154f |     
  mips64el   |       host-delve-1.22.1        | NOK | http://autobuild.buildroot.net/results/530e95c3b1f8dd0494075735a401be89e0cb9938 |     
  riscv64    |       host-delve-1.22.1        | NOK | http://autobuild.buildroot.net/results/f0e2908e42f9ca2607e3fd188deecb0a7bb5760a |     
   mipsel    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/fd5d605cdab964378b9950ca07a65daa6202332a | ORPH
  sparc64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/a453524b8760d719a78d656c0a139ee01f220a1f | ORPH
    m68k     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/b1276656840e1db75eeb574a80764530ad67bd08 | ORPH
  aarch64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/37c13d4e3eda1fdaad35e652c30649ac8e6ac412 | ORPH
   arceb     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/e6de560a1fc64fd29631493be8846d9d0db06e25 | ORPH
microblazeel |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/e6999f3d1f2ea63bf5efaec88ac5e05596547c5b |     
   xtensa    |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/06f5390558c046b0a6263b333971f00c4a385f9d |     
   mips64    |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/214ab6f0585ba12ad2bf26b4bea42c10282e5a7a |     
   mipsel    |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/8f6c7fd14b64bea692886bccfb319137975cee6c |     
  riscv64    |   host-moby-buildkit-0.11.6    | NOK | http://autobuild.buildroot.net/results/fa5dba1a01b2b54594843f048a572ada9d590a66 |     
   nios2     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/e8c851008e689d71b7f46de2543b576af87d1838 | ORPH
powerpc64le  |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/44599d54835f7d1bc8ae612901c9d3a5fef0b843 | ORPH
    arc      |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/86ac3a47d6672085fc35886018ded671391ad3ed | ORPH
   s390x     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/6ee0e9a8da0069b5f4745214ab362a2611059e16 | ORPH
   x86_64    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/0cc337b4b0f95aa494d7a71ecd904f99efe9e56b | ORPH
 microblaze  |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/f1b802e65273ae348569f37feb7e4bd2a04bb46e | ORPH
powerpc64le  |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/4ad52d193ce98fe46556a2dbd9773b119063f0bc | ORPH
  riscv32    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/eb00a1ca0be1d8f14b1474f2fd3b20e2478fbd97 | ORPH
   mips64    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/0c15176cc0c6ecae2a3b6fd0cfc314092473011d | ORPH
   nios2     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/a60519296b23dbc0311b5465a224f6ff3ce8052e | ORPH
    mips     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/c0b086f50b092039830b62fdfe3d60a93cc5153f | ORPH
microblazeel |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/e68f18af93fd31ae68c02b86d252b762ef991a01 | ORPH
 powerpc64   |        host-rust-1.79.0        | NOK | http://autobuild.buildroot.net/results/68597f30a0545ae29ac981cc9ea0338a6aea9291 |     
  powerpc    |        host-rust-1.79.0        | NOK | http://autobuild.buildroot.net/results/5de18df1ddac1324d2089d4512b146eb92509266 |     
    i686     |       host-skopeo-1.13.3       | NOK | http://autobuild.buildroot.net/results/c8e14d9244fc44ab9988ee46b9e5653c58652a7a |     
   mips64    |       host-skopeo-1.13.3       | NOK | http://autobuild.buildroot.net/results/e3f25ba1fd5a29f56de6c9635e3cd4f38de550a5 |     
  mips64el   |       host-skopeo-1.13.3       | NOK | http://autobuild.buildroot.net/results/ca1be1efd129aa3c001a9b56264b8a151a916219 |     
  riscv64    |       host-skopeo-1.13.3       | NOK | http://autobuild.buildroot.net/results/35ec43c0970f001e422d0b2ca6f8319deea2cde4 |     
   s390x     | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/078777042e3d08316d1a85014a0471c630e3d4dd | ORPH
    arm      | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/c03a5b35b632e7a765a94766e478a162cad0c0ec | ORPH
 aarch64_be  | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/3c6f8170924eff555b289a40fcdb581e94d50c52 | ORPH
    or1k     | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/1a09a47a4193ec37699e415965642c22db7a4656 | ORPH
  aarch64    | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/4dd2eb55b6c16bbd5bae8d0984d4559fbdfecba1 |     
   s390x     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/af2f90f43fd7ed7d6f52fd1b648abc093249d375 |     
powerpc64le  | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/4955d11f5a64188ae924ec47e452598658fd7cb8 |     
   x86_64    | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/a36f2af75907558f6a1cd7edda2df69eba5b5335 |     
    arm      | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/523a77852dda7d339c45868b1487f772dc480914 |     
   mips64    | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/fbd25b35d0895c5434d00f7fd0c48d3e02ea6ae0 |     
    arm      | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/a8518284ee3438f4c20afc0fdbf556d706e9228f |     
    arm      | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/b4fe3ea60b4c2cbf16e3248e54b07687f822f2a0 |     
   s390x     |           htop-3.3.0           | NOK | http://autobuild.buildroot.net/results/f0f36b0fb9c8b6a748dea3cdb782a732b027950c | ORPH
    arc      |      imagemagick-7.1.1-31      | NOK | http://autobuild.buildroot.net/results/c386f6c089d6a78f8306aa6317a64e6c670354af | ORPH
   mips64    |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/8cf446fb451fa4bc5fab59b56f67d99aa379e079 |     
   x86_64    |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/d1930da4252287fa10400ff0bef3e290b7aa4c9b |     
   xtensa    |          jack2-1.9.22          | NOK | http://autobuild.buildroot.net/results/f1d1e723706687463526c955918833633953f572 |     
  riscv64    |         jemalloc-5.3.0         | NOK | http://autobuild.buildroot.net/results/b403f2629f7395f6d13b2c30a9544d69e2dc35fb |     
microblazeel |          ledmon-1.0.0          | NOK | http://autobuild.buildroot.net/results/9606b033069086183940e2cfd0640aa2667325b2 |     
microblazeel |          ledmon-1.0.0          | NOK | http://autobuild.buildroot.net/results/b335af4ba1c7d7682513fbcea395844c87056d9c |     
   s390x     |      libcamera-apps-1.5.0      | NOK | http://autobuild.buildroot.net/results/31c65d236b784119ca29fe0ea1eade1992dc8ac4 |     
   mips64    |         libcddb-1.3.2          | NOK | http://autobuild.buildroot.net/results/acb6e39d1e3cc96e6ee4bcc63c5d77f0a9c7f776 |     
   mips64    |         libcuefile-475         | NOK | http://autobuild.buildroot.net/results/87f65f6808e09b605a6571c6feff0bd257a1a9c5 | ORPH
    m68k     |         libesmtp-1.1.0         | NOK | http://autobuild.buildroot.net/results/120a1f939d24b7afca4be36bf3703c7e6329551a | ORPH
    or1k     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/37522e21a6fdf1a6e04ed629efb62e3602f2fb44 |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/e03c55fce54529063f37186076d0a2203a3c8eca |     
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/f3c9f84dbd1094d006953f87198e407e356df915 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/f18ac30ee7732c4d8e2e5625d322a3d05ab00492 |     
powerpc64le  |         libnss-3.102.1         | NOK | http://autobuild.buildroot.net/results/dcb76c031daf97da5c6f627d1ee0a8164f297048 |     
   s390x     |         libnss-3.102.1         | NOK | http://autobuild.buildroot.net/results/c2b26c3583af2a19d9bb6fa60df1e0c9d64f51de |     
 microblaze  |        libopenssl-3.3.1        | NOK | http://autobuild.buildroot.net/results/d100b594c3467870a0bcc48e76c8bb27b36a3a38 | ORPH
   mips64    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/7a5d4b3287ae1aba69f139effff108ee23857161 | ORPH
  powerpc    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/e1a9675641b99f2281549a832e28ceb29ebc3232 | ORPH
  mips64el   |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/f6d3eb9337df7218fe945535cbab5b5a08090760 | ORPH
  powerpc    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/7dcbc803fa51b7da68f8c9036f6cecf3352bd7e1 | ORPH
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/f8c19895e2795449ce5d40d714491771c48d27b2 |     
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/4715e7e6efd2b0c021a625e7bc9d0d4f1da4615c |     
   arceb     |        libtracefs-1.8.1        | NOK | http://autobuild.buildroot.net/results/a82597ee2c3f3000ae5e2210316318866279c5c4 |     
   mips64    |        libunwind-1.8.1         | NOK | http://autobuild.buildroot.net/results/9537539077466b0b86e9bc6f2384ee32fa2cef24 | ORPH
  aarch64    |          libva-2.22.0          | NOK | http://autobuild.buildroot.net/results/a378fa788cb2cb73e7cdbcc3f8833edf552f05d8 |     
  mips64el   |         libxml2-2.12.6         | NOK | http://autobuild.buildroot.net/results/888305984d407278b28fa05ab2dc2342b73ee202 |     
 aarch64_be  |         libzlib-1.3.1          | NOK | http://autobuild.buildroot.net/results/219abf20f7098ad4456c26dbe14163606f891bf1 | ORPH
  sparc64    |        lighttpd-1.4.76         | NOK | http://autobuild.buildroot.net/results/950c86e046dfc2c71e3b81d4071d9f8a62c22048 | ORPH
   sparc     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/95c0a345591032aa47309dcdc932601d4c5fd059 | ORPH
    or1k     |          linux-6.10.2          | NOK | http://autobuild.buildroot.net/results/b38697a5f8216a6b4bb3030a4271713000cb59e0 | ORPH
   nios2     |          linux-6.10.2          | NOK | http://autobuild.buildroot.net/results/857076bf1a5c52eae5fe2a46b04b847fe5b8860e | ORPH
   nios2     |          linux-6.10.2          | NOK | http://autobuild.buildroot.net/results/366d37c5e0388617f9c119ea4037a3134fe59aac | ORPH
    m68k     |          lsuio-0.2.0           | NOK | http://autobuild.buildroot.net/results/73b7412e4459c345302e09ab1c7fb60b4dcaf2ca | ORPH
   xtensa    |     ltp-testsuite-20240524     | NOK | http://autobuild.buildroot.net/results/798ab382c764b4da6efd7e4803f62fc0b2c8e433 |     
microblazeel |          lvm2-2.03.23          | NOK | http://autobuild.buildroot.net/results/dc4fc33eaeafe5d6707d26a373560402533954f6 | ORPH
  powerpc    |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/3ad17d114654ae9998ee32ad556819df014c56f2 | ORPH
    sh4a     |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/5388c7adf68221174b00a199ed6fafa1e887a22b | ORPH
   sparc     |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/08b0d3de31b43be7aa2afa0bcc299a70406507f7 | ORPH
    i686     |         memtest86-6.20         | NOK | http://autobuild.buildroot.net/results/5ee3b91098b1132bc91b6f6790616fd6edb8c84c |     
    i686     |          mender-3.4.0          | NOK | http://autobuild.buildroot.net/results/09cd904e2a6b92e43cff5362ff862443ac7a812d |     
    arm      |          mender-3.4.0          | NOK | http://autobuild.buildroot.net/results/303b8d48dd47b92c50ea42f4e5e2bec7e3ec0bfb |     
    or1k     |           mpv-0.35.1           | NOK | http://autobuild.buildroot.net/results/7dac16fb734b65309fafd58944c08e946fa0a8e9 |     
  riscv64    |           mpv-0.35.1           | NOK | http://autobuild.buildroot.net/results/59a7070f961e7ed5f757cb0b3c674f39d5ea7441 |     
    mips     |           ncmpc-0.49           | NOK | http://autobuild.buildroot.net/results/8b693eb38f038b259835c4d7a77f2bad4ba0f00c |     
   sparc     |          nginx-1.24.0          | NOK | http://autobuild.buildroot.net/results/d764b236ef08504471e1c7cc80602e7b08978507 |     
   mipsel    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/fd28b7113fc8e13d80c8ae1ead3051483c0f3e11 | ORPH
    i686     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/aaf53eabedc0e22249cb5d69544df55dc63fa5a3 | ORPH
 aarch64_be  |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/6e40729070a259210f4dd4edc9a4da32af16449a | ORPH
   mips64    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/b43265281b6a0ab4d5ba097815618acd57a0379a | ORPH
microblazeel |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/31b298a95d3e64f5f299a1c1c029f9b25b94f0cc | ORPH
   xtensa    |           nut-2.8.2            | NOK | http://autobuild.buildroot.net/results/96892de3307808ea5bffee2928c4ba69b3ade748 |     
   mips64    |        openblas-0.3.27         | NOK | http://autobuild.buildroot.net/results/468b7702ca7b72322c56df2f5b47cc23ac55b35c |     
  aarch64    |        openconnect-9.12        | NOK | http://autobuild.buildroot.net/results/e4002d755b3032b0886419b99048c8c0ccc41e50 |     
    mips     |        openconnect-9.12        | NOK | http://autobuild.buildroot.net/results/e0392724f97bcf2694b0ba83ff87014b4b471ba1 |     
powerpc64le  |         openssh-9.8p1          | NOK | http://autobuild.buildroot.net/results/b784a02ff1e069ae328bcd6098598679687ae286 | ORPH
powerpc64le  |         openssh-9.8p1          | NOK | http://autobuild.buildroot.net/results/cbb9ba79b78f1ecb11e5f317e1bdd13b9527238d | ORPH
   armeb     |         openssh-9.8p1          | NOK | http://autobuild.buildroot.net/results/3674667b9b407227fb86b37375d4ae3f58282f12 | ORPH
powerpc64le  |         openssh-9.8p1          | NOK | http://autobuild.buildroot.net/results/88e4bbe2150b5df9a5dce9f06f6c2e01f669859d | ORPH
  powerpc    |         openssh-9.8p1          | NOK | http://autobuild.buildroot.net/results/90f273c0a98b008d660e90aacc5a9f27d510ff42 | ORPH
powerpc64le  |         openssh-9.8p1          | NOK | http://autobuild.buildroot.net/results/137081b934eaf77110f7b900cb0c28ae1c3eb8f3 | ORPH
 powerpc64   |       parsec-tool-0.7.0        | NOK | http://autobuild.buildroot.net/results/c9956933ae01bad9cc4ef03212590459834a749a |     
  sparc64    |       parsec-tool-0.7.0        | NOK | http://autobuild.buildroot.net/results/254a745b8ffa6541cd49fd864a315a5096aa7967 |     
  aarch64    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/443b9786d38d6bc4b014810b2c5e3b4414101993 | ORPH
microblazeel |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/f620c604a8e1d5b25404c8e68117c0e349d88633 | ORPH
    arc      |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/79b778a1366d3a5f129cd02375af2aba12d28c16 | ORPH
 powerpc64   |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/e81507d1e5ae625672ba2226e54c2e682577b86d | ORPH
    i686     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/8e2f96724cfb940f8d0228ca337c26b856f75736 | ORPH
 powerpc64   |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/8df14668f1bf092695b046e755c8581d24ae48e7 | ORPH
   sparc     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/8f012b3d65791063361ba96dc0b019427bba437e | ORPH
  aarch64    |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/c3683a7b8648687fd9acbb2c5eb003b2d92dc0f3 |     
microblazeel |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/b3943a8601f22716f5cf79cbbe664b0f7390b94e |     
    or1k     |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/7f9808f22c90749d494de4897bb56aea99ae44f4 |     
   x86_64    |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/e62754b6e06e3c427daaf0f63702da28ebf1c4de |     
  aarch64    |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/551d3166334a36329f29201f1d863b52432ea312 |     
    mips     |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/b6ee63051df608e4bf216e2f8a1fa1187f547bfe |     
 powerpc64   |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/1a4356dd3330bee643ae6329b01d9c105e1fe2a0 |     
microblazeel |   python-cryptography-39.0.2   | NOK | http://autobuild.buildroot.net/results/d6814b8b52ae615f6e3c296620a7d81907cecc55 |     
   sh4eb     |   python-cryptography-39.0.2   | NOK | http://autobuild.buildroot.net/results/8c61d18f5993fbf13f69a258f6b7650478b1c723 |     
  aarch64    |      python-daemon-3.0.1       | NOK | http://autobuild.buildroot.net/results/593ce1cd440d3ec05f084f71c41a52a74b9aeb89 |     
 aarch64_be  |      python-daemon-3.0.1       | NOK | http://autobuild.buildroot.net/results/2ddb957b63fad78fe42269e27f418f579b5c6384 |     
    m68k     |      python-daemon-3.0.1       | NOK | http://autobuild.buildroot.net/results/d53d811056001f7ec3e23a0d5712dcce75b56667 |     
   mipsel    |      python-daemon-3.0.1       | NOK | http://autobuild.buildroot.net/results/47575331152eb9dc1216ba84b5f1e8f5661f7238 |     
    mips     |      python-daemon-3.0.1       | NOK | http://autobuild.buildroot.net/results/182712d1a7107fb81038be143a090bcd6e8bf4a9 |     
   x86_64    |      python-numpy-1.25.0       | NOK | http://autobuild.buildroot.net/results/8412cef7b609a10c24dc83569bc925fa720308e2 |     
powerpc64le  |  python-pypika-tortoise-0.1.6  | NOK | http://autobuild.buildroot.net/results/597e6d1e0505aff7e05fdd024aec04b2f1fdeede |     
  aarch64    |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/00b7c7a2c11f2da0d13a0335214e0dcb503574bb |     
  mips64el   |         s6-dns-2.3.7.2         | NOK | http://autobuild.buildroot.net/results/b418830515c62d48de0e6b243a0ea492735ed339 |     
   sparc     |         s6-dns-2.3.7.2         | NOK | http://autobuild.buildroot.net/results/3e87657542c92b0141e0aa0759f6b7aa388b094b |     
    arm      |         s6-dns-2.3.7.2         | NOK | http://autobuild.buildroot.net/results/38cb8008eb5464833750dbe550d671d33273edce |     
   arceb     |          scrypt-1.3.2          | NOK | http://autobuild.buildroot.net/results/c5eba8afdb562f37c2c707ca21b6edd732a6f69f |     
    arm      |         shadow-4.15.1          | NOK | http://autobuild.buildroot.net/results/db727bddcc8f4575a2b5596fda4669976c598380 |     
microblazeel |          snmppp-3.5.1          | NOK | http://autobuild.buildroot.net/results/889f9242ac539540b96f85e797ba01aa1c6810e8 |     
  aarch64    |         systemd-256.4          | NOK | http://autobuild.buildroot.net/results/758db40ac1036b0ccbce594f0dffd85a7b53f742 |     
    i686     |        tipidee-0.0.5.0         | NOK | http://autobuild.buildroot.net/results/665e9b5639de99b613fb24f4bbfc2050c9e0d645 |     
    arm      |        tipidee-0.0.5.0         | NOK | http://autobuild.buildroot.net/results/9954d6c5bfb1a85ca5f4c28e0a8a09af7f3484f2 |     
   x86_64    |         tpm2-tss-3.2.2         | NOK | http://autobuild.buildroot.net/results/decdcca788b7a3e250dcf8e152bca547f31be28b | ORPH
    or1k     |         uclibc-1.0.49          | NOK | http://autobuild.buildroot.net/results/e147600854cd95abf0d8faea2002ed54dcc76da3 |     
    or1k     |         uclibc-1.0.49          | NOK | http://autobuild.buildroot.net/results/2bf49c03289f930d0c4f1d05f4019a3d858c167b |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.net/results/f19a1cbc15d9df4a78eb9a0c6e4776ad550ee4e6 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/03cb05784c049a20af998dc6f4eb93a21f7ce7e5 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/f8422b81c79fef72808a727247f78d4d3c87b12a |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/d736095f14bbdf0bb3a2cd01fcdd0c4534e05a8b |     
   arceb     |         usbguard-1.1.2         | NOK | http://autobuild.buildroot.net/results/aa4c4e14a754755ca7cab132435d6810bb20e6c5 |     
    sh4a     |           vlc-3.0.21           | NOK | http://autobuild.buildroot.net/results/0a4c9c55bd634caf965a02eac169ced190039512 |     
   xtensa    |            xz-5.6.2            | NOK | http://autobuild.buildroot.net/results/2389795e1247481c2d291803cbb101f8aaff1a4d | ORPH
    arc      |            xz-5.6.2            | NOK | http://autobuild.buildroot.net/results/fc690bc09a61c2d25d9cd58ff69863e01769035e | ORPH
  aarch64    |        zxing-cpp-2.2.1         | NOK | http://autobuild.buildroot.net/results/f7182e710f3df3626c693b1aa483f5b57612b85a |     
   x86_64    |        zxing-cpp-2.2.1         | NOK | http://autobuild.buildroot.net/results/98e5cfe797a6741a4a1a9bea174d8c09e132f206 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

          libcamera-apps-1.2.1 | 2 
                     crun-1.12 | 1 
                libressl-3.8.4 | 1 
                    mpir-3.0.0 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |           crun-1.12            | NOK | http://autobuild.buildroot.net/results/db03ff4fb07feaaf04100afb5dd5309faad3dc49 |     
   sparc     |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/d952d41befe5a9d5ac3e4e1de9b47ebe35b6c4c2 |     
   x86_64    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/327a47a4dcd2459ef2730aa79184a52d6fdad216 |     
microblazeel |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/1b8b0a768a2bc0a63cd729ea42d2eab9dd0cd3ff | ORPH
   mipsel    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/4af5aac6663a64060fae70e5199f6e351bc8c071 |     


Classification of failures by reason for 2024.05.x
--------------------------------------------------

                  ffmpeg-6.1.1 | 2 
                   foot-1.16.2 | 1 
         gobject-introspection | 1 
                host-go-1.22.4 | 1 
host-prelink-cross-a853a5d7... | 1 
               mariadb-10.11.6 | 1 
                    ola-0.10.9 | 1 
                       unknown | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/abb82af5e6c2b95e7be40bce131abf33419e086b |     
    arc      |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/3297ffb24c0ed8baed7a6ba1e151a32a03205466 |     
   nios2     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/7c921494a7f3a1f951337c6bb0f1a387dba76dd6 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/39275854fa327b1140e9d4ef7e6e6c26804897be |     
  mips64el   |         host-go-1.22.4         | NOK | http://autobuild.buildroot.net/results/13f100f2d4fe00e8e8570927288f6038cbbcd0e2 |     
    arm      | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/7aa730947ef99b816b87b331760b75013230697e | ORPH
microblazeel |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/55ce7048d9536ef3a2a437732c92a2acd0eee323 | ORPH
  sparc64    |           ola-0.10.9           | NOK | http://autobuild.buildroot.net/results/38ba52db5e941e34d1fb3a542f92b0272919335d |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/108c436854a07b4b4bdde5bad2a84f17c67cf258 |     


Gitlab CI results for 2024-08-01
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                  at91sam9260eknf | https://gitlab.com/buildroot.org/buildroot/-/jobs/7477108423  |      
                   at91sam9g20dfc | https://gitlab.com/buildroot.org/buildroot/-/jobs/7477108462  |      
                 at91sam9g45m10ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/7477108480  |      
                     at91sam9rlek | https://gitlab.com/buildroot.org/buildroot/-/jobs/7477108492  |      
                 atmel_sama5d3xek | https://gitlab.com/buildroot.org/buildroot/-/jobs/7477108572  |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/7477108632  | ORPH 
                      beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7477108671  |      
                  chromebook_snow | https://gitlab.com/buildroot.org/buildroot/-/jobs/7477108698  |      
                             ci20 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7477108704  |      
                      cubieboard2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7477108717  |      
            engicam_imx6qdl_icore | https://gitlab.com/buildroot.org/buildroot/-/jobs/7477108722  |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7477108726  |      
        engicam_imx6qdl_icore_rqs | https://gitlab.com/buildroot.org/buildroot/-/jobs/7477108729  |      
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/7477108735  |      
             engicam_imx6ul_isiot | https://gitlab.com/buildroot.org/buildroot/-/jobs/7477108740  |      
        freescale_imx6dlsabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/7477108748  |      
          freescale_imx6dlsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/7477108749  |      
         freescale_imx6qsabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/7477108753  |      
           freescale_imx6qsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/7477108756  |      
          freescale_imx6sxsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/7477108760  |      
           freescale_imx7dsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/7477108765  |      
             freescale_imx8dxlevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7477108769  |      
              freescale_imx8mmevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7477108770  |      
              freescale_imx8mnevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7477108771  |      
              freescale_imx8mpevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7477108773  |      
              freescale_imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7477108777  |      
              freescale_imx8qmmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/7477108782  |      
             freescale_imx8qxpmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/7477108784  |      
           friendlyarm_nanopi_r2s | https://gitlab.com/buildroot.org/buildroot/-/jobs/7477108819  |      
                   imx6-sabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/7477108861  |      
                 imx6-sabresd_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7477108868  |      
                        imx6slevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7477108871  |      
                       imx6sx-sdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/7477108876  |      
                        imx6ulevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7477108878  |      
                       imx6ulpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/7477108883  |      
                        imx7dpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/7477108891  |      
                        imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7477108899  |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/7477108908  |      
                       ls1028ardb | https://gitlab.com/buildroot.org/buildroot/-/jobs/7477108919  |      
                     ls1046a-frwy | https://gitlab.com/buildroot.org/buildroot/-/jobs/7477108920  |      
                mender_x86_64_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/7477108927  | ORPH 
                          mx25pdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7477108962  |      
                   mx6sx_udoo_neo | https://gitlab.com/buildroot.org/buildroot/-/jobs/7477108980  |      
                          mx6udoo | https://gitlab.com/buildroot.org/buildroot/-/jobs/7477108986  |      
              octavo_osd32mp1_brk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7477109078  |      
              octavo_osd32mp1_red | https://gitlab.com/buildroot.org/buildroot/-/jobs/7477109083  |      
                        odroidxu4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7477109098  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7477109222  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/7477109243  |      
                       pandaboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/7477109277  |      
                           pine64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7477109284  |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/7477109287  |      
                qemu_aarch64_sbsa | https://gitlab.com/buildroot.org/buildroot/-/jobs/7477109295  |      
                       qemu_s390x | https://gitlab.com/buildroot.org/buildroot/-/jobs/7477109346  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/7477109363  | ORPH 
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/7477109378  |      
                           rock5b | https://gitlab.com/buildroot.org/buildroot/-/jobs/7477109384  |      
                           rock64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7477109386  |      
                       rock_pi_n8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7477109389  |      
             sipeed_licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/7477109406  |      
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7477109418  |      
                 snps_arc700_nsim | https://gitlab.com/buildroot.org/buildroot/-/jobs/7477109420  | ORPH 
                snps_archs38_hsdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7477109424  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7477109425  |      
                solidrun_clearfog | https://gitlab.com/buildroot.org/buildroot/-/jobs/7477109428  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7477109485  |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7477109486  | ORPH 
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7477109490  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
