Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 708DAC49EA1
	for <buildroot@archiver.kernel.org>; Tue,  6 Aug 2024 04:37:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F0B074014E;
	Tue,  6 Aug 2024 04:37:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AzOSPxcKGGZF; Tue,  6 Aug 2024 04:37:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 91B7C4027D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 91B7C4027D;
	Tue,  6 Aug 2024 04:37:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 179911BF304
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 04:37:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 06AC48116A
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 04:37:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mgwdYCvxsVwO for <buildroot@lists.busybox.net>;
 Tue,  6 Aug 2024 04:37:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E90E981167
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E90E981167
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E90E981167
 for <buildroot@buildroot.org>; Tue,  6 Aug 2024 04:37:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D942B1C0006
 for <buildroot@buildroot.org>; Tue,  6 Aug 2024 04:37:08 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Tue, 06 Aug 2024 04:37:08 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1722919029; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=A2l+EGL21i2Ackr05TRgP/WyMkxJDJJBEWHbd4pkLBo=;
 b=MSF+lT5QdpTllV5OPTL8/WRecPEG/LSlrowLPcp7W77ik9olS/VoUAbi0Nc5hhMuMVS2+U
 gPkNl/2QUuF8sblclZvezPZTpW1xG2fokIruQaC8p4H2AWvpUccxqf8T7jpR6cQtR7any2
 +5z9LvLo9uPG5J/yYdagA5FOLWMzrDmNwIuDWfqP7KrooGPEgHXRw7UXvgAVwZaKsJfsF7
 kKCWDKpjepXklMPE/nmPLIWB3CQyKM2j80li6OfyTP/ycFeTPspdz1cdk62ilwN/8RJ0kZ
 zjv0/Y0HcyNv15jh69N+On/rzJdNobk7c4t5+qWwxfCARu8I9scS6lZetvhyVQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=MSF+lT5Q
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-08-05
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
Message-ID: <20240806043708.yt7x2h2e3blkjPV_y7auAFZ7gTayeRp5OW3oMjlfzJk@z>

Hello,

Autobuild statistics for 2024-08-05
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  6  | 11  |  1  | 18  |
  2024.05.x  |  4  | 12  |  0  | 16  |
    master   | 135 | 296 |  2  | 433 |

Classification of failures by reason for master
-----------------------------------------------

    host-gcc-bare-metal-14.1.0 | 34
                  ffmpeg-6.1.1 | 9 
                 dc3dd-7.2.641 | 8 
glibc-2.39-74-g198632a05f6c... | 8 
                    norm-1.5.8 | 8 
               procps-ng-4.0.4 | 8 
      python-autocommand-2.2.2 | 8 
  gobject-introspection-1.76.1 | 7 
host-vboot-utils-bbdd62f9b0... | 7 
                  libsepol-3.6 | 7 
                gnu-efi-3.0.18 | 6 
                  linux-6.10.3 | 6 
                 openssh-9.8p1 | 6 
aer-inject-9bd5e2c7886fca72... | 5 
               mariadb-10.11.6 | 5 
                 nethogs-0.8.7 | 5 
           python-daemon-3.0.1 | 5 
                     avahi-0.8 | 4 
                 coreutils-9.3 | 4 
host-heimdal-f4faaeaba371ff... | 4 
             parsec-tool-0.7.0 | 4 
              cache-calibrator | 3 
                  cairo-1.18.0 | 3 
             gnuradio-3.10.7.0 | 3 
             host-delve-1.22.1 | 3 
            host-libtool-2.4.6 | 3 
            host-skopeo-1.13.3 | 3 
              openconnect-9.12 | 3 
                s6-dns-2.3.7.2 | 3 
                      fio-3.34 | 2 
              fluent-bit-3.1.3 | 2 
                   foot-1.16.2 | 2 
               freeipmi-1.6.14 | 2 
                 gnuplot-6.0.1 | 2 
         gobject-introspection | 2 
               graphene-1.10.8 | 2 
            host-binutils-2.42 | 2 
 host-softether-4.30-9700-beta | 2 
                    htop-3.3.0 | 2 
                  libffi-3.4.6 | 2 
               libglib2-2.76.1 | 2 
     linux-5.10.162-cip24-rt10 | 2 
                   linux-tools | 2 
                  mender-3.4.0 | 2 
    python-cryptography-39.0.2 | 2 
         python-remi-2022.7.27 | 2 
             sofia-sip-1.13.17 | 2 
             strongswan-5.9.13 | 2 
               tipidee-0.0.5.0 | 2 
                 uclibc-1.0.49 | 2 
               valgrind-3.23.0 | 2 
                 x11vnc-0.9.16 | 2 
android-tools-4.2.2+git2013... | 1 
                 apache-2.4.62 | 1 
  binutils-arc-2023.09-release | 1 
                     crun-1.15 | 1 
                  daemon-0.8.4 | 1 
      docker-cli-buildx-0.16.1 | 1 
                   duma-2.5.21 | 1 
                    dust-0.9.0 | 1 
                elfutils-0.189 | 1 
                espflash-3.1.0 | 1 
                  fbdump-0.4.2 | 1 
                      fd-9.0.0 | 1 
                    gdal-3.8.2 | 1 
                gerbera-1.12.1 | 1 
          gitlab-runner-15.5.0 | 1 
                 highway-1.2.0 | 1 
          host-automake-1.16.5 | 1 
 host-binutils-bare-metal-2.42 | 1 
                   host-go-src | 1 
         host-libxcrypt-4.4.36 | 1 
     host-moby-buildkit-0.11.6 | 1 
              host-runc-1.1.12 | 1 
              host-rust-1.79.0 | 1 
                   httping-2.5 | 1 
                  jack2-1.9.22 | 1 
                lesstif-0.95.2 | 1 
                 libcddb-1.3.2 | 1 
                libcuefile-475 | 1 
               libdeflate-1.20 | 1 
                libdrm-2.4.122 | 1 
                libesmtp-1.1.0 | 1 
                libgeos-3.12.2 | 1 
             libgpg-error-1.50 | 1 
                 libjcat-0.2.1 | 1 
                  libnfc-1.8.0 | 1 
                   libnl-3.9.0 | 1 
              libopenssl-3.3.1 | 1 
     libphidget-2.1.9.20190409 | 1 
                libressl-3.9.2 | 1 
                libshout-2.4.6 | 1 
libsvgtiny-ea9d99fc8b231c22... | 1 
               libunwind-1.8.1 | 1 
               lighttpd-1.4.76 | 1 
          linux-5.10.162-cip24 | 1 
                   lsuio-0.2.0 | 1 
         lttng-modules-2.13.10 | 1 
                     lxc-5.0.3 | 1 
                 mesa3d-24.0.9 | 1 
            micropython-1.22.0 | 1 
                    mpir-3.0.0 | 1 
                    mpv-0.35.1 | 1 
                  mupdf-1.23.9 | 1 
                    ncmpc-0.49 | 1 
            netstat-nat-1.4.10 | 1 
                  ntpsec-1.2.3 | 1 
               openblas-0.3.27 | 1 
          python-grpcio-1.60.0 | 1 
  python-pypika-tortoise-0.1.6 | 1 
           sane-backends-1.1.1 | 1 
                 shadow-4.15.1 | 1 
                    sslh-2.0.1 | 1 
                 systemd-256.4 | 1 
                   trinity-1.9 | 1 
           uboot-tools-2021.07 | 1 
                       unknown | 1 
             util-linux-2.39.3 | 1 
                 wolfssl-5.7.2 | 1 
x264-baee400fa9ced6f5481a72... | 1 
                    zeek-4.1.1 | 1 
               zxing-cpp-2.2.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/336776c748ad5a24d6407034930ff564a91c350d | ORPH
    m68k     | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/1adc7e1ebe73063e79f14d010f1b1ca236f0c9c2 | ORPH
  sparc64    | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/5fa18afe4566b1379de57b50ca1b75c13dbdd9b4 | ORPH
 powerpc64   | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/74c7bd885422f425372b6cf3327b131097c48fa3 | ORPH
    i686     | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/5af14b485cdad6f0c577f6cb8929b2588f7c0984 | ORPH
  mips64el   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/6e7aefe751d57c2a79eee17a368a0bbeefeb039b |     
   armeb     |         apache-2.4.62          | NOK | http://autobuild.buildroot.net/results/5b812bf9e17fd72271681e6a95651145f0ec1388 |     
  sparc64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/400171714065ad0ba5f5babf0b8ae9020c0cde12 | ORPH
   s390x     |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/71b35fa255cc24d58d7466213e38e46d2a4c8e07 | ORPH
   nios2     |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/379ae8aa778a326f436a29b253c9ad7042a04564 | ORPH
  aarch64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/22c58223f558315f022f0e0ab6cd338db074effa | ORPH
   arceb     |  binutils-arc-2023.09-release  | NOK | http://autobuild.buildroot.net/results/a71c28c15b8818ed291c788015b2a2b17d278ef6 |     
  mips64el   |        cache-calibrator        | NOK | http://autobuild.buildroot.net/results/e628a4ed1a4b72b24970aebbf58339a5ef940169 |     
    arc      |        cache-calibrator        | NOK | http://autobuild.buildroot.net/results/58bb4291923ccdaaf6237268eeaa2b042d1006f2 |     
    arm      |        cache-calibrator        | NOK | http://autobuild.buildroot.net/results/2c378bfdff81240cc058e65d1248a87660bb0528 |     
   xtensa    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/cf303090c53d7b57c153bf3fa6dcb12e76dfa689 |     
    or1k     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/31c2e8315792a8886b933d2e654d9b0d0fd16453 |     
   xtensa    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/efe4594fe1c31a59fb626881e52104144bc0de63 |     
   sh4eb     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/352250b64012915c3b7b65277bd257a89e7501e4 | ORPH
    arc      |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/704d8ab434053de099ebdd5c4046cefc9b8dbd96 | ORPH
    or1k     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/6ebde295287d1fb5672afcc6f6532b0fc0594512 | ORPH
    i686     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/378444dcff4ba5f24854deff8d077c43d214c311 | ORPH
    or1k     |           crun-1.15            | NOK | http://autobuild.buildroot.net/results/6f7d58911f7dee80651ed0b60bc0d546631fd196 |     
  mips64el   |          daemon-0.8.4          | NOK | http://autobuild.buildroot.net/results/f3b3942b6b645d9523ab08d179a3f8aca7d6641c |     
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/4b2f706fa41f5e2fc7e6adbc0f81b99dd34f8793 | ORPH
 microblaze  |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/b27d7224395ff0e837b8b3afd140acb95abaa3fc | ORPH
    mips     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/f7326699030e7718206f735d7de59d27a6fa213d | ORPH
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/9da4f856436f672e24fa06a86cb646387826f349 | ORPH
   sparc     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/eb3621278e24e3a5af4b486116c92f93fd710252 | ORPH
   xtensa    |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/98a6c82670e88ce02e7c87859515e8a3dc1c6c4c | ORPH
   armeb     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/9142a6c183c8f02c10f2cc3b62f2ec4d9bbef875 | ORPH
   sparc     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/f7b06ec45b020853c817ce8479f3874be09a8002 | ORPH
  riscv64    |    docker-cli-buildx-0.16.1    | NOK | http://autobuild.buildroot.net/results/4578d737431db35ff868f6ccc41e9728ae259c1e | ORPH
  sparc64    |          duma-2.5.21           | NOK | http://autobuild.buildroot.net/results/a9cbef5f3ff77588d3d00f08ba592389e3d8854e | ORPH
  powerpc    |           dust-0.9.0           | NOK | http://autobuild.buildroot.net/results/12cd34b673a411e44c8c6e401cd8b9fe93137c8d | ORPH
    arc      |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/720a7bf074c901cebd08301bbac6a73c886a2038 | ORPH
  sparc64    |         espflash-3.1.0         | NOK | http://autobuild.buildroot.net/results/1ea75c190c9d4e519f79b99e646d8ecbbe09e509 |     
  aarch64    |          fbdump-0.4.2          | NOK | http://autobuild.buildroot.net/results/cff0278fe1225bda397a0746627b54fde7a43839 | ORPH
  aarch64    |            fd-9.0.0            | NOK | http://autobuild.buildroot.net/results/a159ae075702cda477047a59cf13bd43658731b1 |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/8358cab758eb7219c355c534eecf7bfcb8c15c09 |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/9f62fc16db2e1c23bb2a00334516b2703f34cf17 |     
    m68k     |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/5cbb11909936f2b0087f04f0e9e2f4513df7efbb |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/3f7dc90efdb4681a07f3ded84d7f6906d93b9c3e |     
 microblaze  |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/7f8f95b5d7e4e9015f7949820609ee0f8fd9c436 |     
 microblaze  |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/f9468bed65d257443342e0aa06857ccc7fe09a09 |     
   arceb     |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/3a0ce06709b03fa4a23e6973b03d7750f485c25f |     
 microblaze  |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/9c25a76a1c7b8d5ce174c3df150027855ecfa789 |     
 microblaze  |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/02118379625aae218c33a4134cfdb8fa6fa68798 |     
 powerpc64   |            fio-3.34            | NOK | http://autobuild.buildroot.net/results/ab18cecbdfffeb4dad759809d65f0918c49c5cc6 |     
  mips64el   |            fio-3.34            | NOK | http://autobuild.buildroot.net/results/9358aabef20727461e9642a7b21cac1968544a8b |     
microblazeel |        fluent-bit-3.1.3        | NOK | http://autobuild.buildroot.net/results/a00c1b3f4b19a5cf76999d0ed9eb6612a6312e80 |     
   x86_64    |        fluent-bit-3.1.3        | NOK | http://autobuild.buildroot.net/results/cdd2d6d9f2a9b4e23e9eeef083fce50eabd3f393 |     
microblazeel |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/2f8a14c497aa16d7cd15a998bf31208b8398b499 |     
   nios2     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/627cf8cdd41b347b93cbf5a5693ca8e31bbd93c2 |     
   x86_64    |        freeipmi-1.6.14         | NOK | http://autobuild.buildroot.net/results/630f4c3021bda51cbd0cf98be5eeb8bdf41bcd5c |     
   x86_64    |        freeipmi-1.6.14         | NOK | http://autobuild.buildroot.net/results/5965c3ebe747dbaf65a254454b2ad53e0f046475 |     
 microblaze  |           gdal-3.8.2           | NOK | http://autobuild.buildroot.net/results/7d0c12fcf24505dd0c61de53eaa9ad561096d40b |     
    arc      |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.net/results/4e650392490cc5963592e283e242f721d16ee47a |     
  riscv64    |      gitlab-runner-15.5.0      | NOK | http://autobuild.buildroot.net/results/4601615d78f1baed22f9731bc5cf7d828943cf5b |     
powerpc64le  | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/d293cc95f1181e13f994ab8a6b12ad342e71c737 |     
   arceb     | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/cf7f581262d29320cb706286e765e3c29c06b601 |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/b08fe405e496bd5756270ad4fd3026ec21203206 |     
powerpc64le  | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/84ecadbe39a70640d7fcfa384f98b06f077ba6b0 |     
powerpc64le  | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/170732b550c488d5238bde1262e78e8742fada53 |     
powerpc64le  | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/59e1ac24654ee9578e4440fd799e0d62844f8e5f |     
powerpc64le  | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/79061aed9e77762c8f9a7ef1e49aec4dff09ba45 |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/0e528e449980b0ded871c916527066d73b410ca8 |     
  aarch64    |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/5ff3ce745c70aa41a77d1cab51bc958188a8c1b4 |     
   armeb     |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/cad5869df840bb2666092cf3eb0ac18521128f95 |     
  riscv64    |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/11a6bdba80641d51164bd662227a8b3f4d0ecf23 |     
   armeb     |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/c5c17e222de0117a7f314d999056ee4709204893 |     
   armeb     |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/fe880a13e4195fef7733f08abfec765f88744586 |     
   armeb     |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/2f974e0a369d24f0172d3967cc590e009dd68b4b |     
   nios2     |         gnuplot-6.0.1          | NOK | http://autobuild.buildroot.net/results/7927dca265c6c6bca5b32485a9d034473120aa18 |     
   nios2     |         gnuplot-6.0.1          | NOK | http://autobuild.buildroot.net/results/2c684d7a9f5c2307f4393e69e46fefc7a3ef7299 |     
    i686     |       gnuradio-3.10.7.0        | NOK | http://autobuild.buildroot.net/results/cca01bf9c91383354f98b4ea75678944fa990a46 |     
powerpc64le  |       gnuradio-3.10.7.0        | NOK | http://autobuild.buildroot.net/results/e94e6c4a6bd32539378315ea6795bb5b2027c3fe |     
    i686     |       gnuradio-3.10.7.0        | NOK | http://autobuild.buildroot.net/results/b560f1bcd82882d4f60f5fe57cc662e93348abf2 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/8efd82c8515948c5e09ef7ab2684818dc2b0c254 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/32fdc25904a01b4da27794afde7bb180775f8fc3 |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/fae30a7eea740983f8407311d2d9fe09766dd0b5 | ORPH
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/358ea46e84ac39e490aca121cd1ad86c3ba95ccb | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/cc856a1dbdc48caf60a1811d09f60490d84198da | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/91c54de0237484d252caa9b82ce5153d3e955e5e | ORPH
    i686     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/4d282f5b97e686a7596959744fbf43a1f0147d40 | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/1d48f242bff93d0522cf66a02c6f54e94aa3997b | ORPH
    i686     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/74bc3797c1144c3abd6e2e66eaf96ca7934ca9a9 | ORPH
   sh4aeb    |        graphene-1.10.8         | NOK | http://autobuild.buildroot.net/results/2e9a291947ef64512adfa27ec6a4bfee744681a6 |     
   sh4aeb    |        graphene-1.10.8         | NOK | http://autobuild.buildroot.net/results/ed0133e695a0b9d8e69c512e951ed226cf8c8c24 |     
 powerpc64   |         highway-1.2.0          | NOK | http://autobuild.buildroot.net/results/db35c67c9cfea298a1eeaef9434917c44bf3b79e |     
    or1k     |      host-automake-1.16.5      | NOK | http://autobuild.buildroot.net/results/0d04bfb6898261b6bdede2c396645cfb5165c09e | ORPH
microblazeel |       host-binutils-2.42       | NOK | http://autobuild.buildroot.net/results/196948531a49dfe9217d10435f3e5301fb65979c |     
   nios2     |       host-binutils-2.42       | NOK | http://autobuild.buildroot.net/results/43fc06fe104785ff7ab43c6a0673f1c9ff056351 |     
 powerpc64   | host-binutils-bare-metal-2.42  | NOK | http://autobuild.buildroot.net/results/7a8e071a2841a9c6255a66197e9b0f8c971b6e57 |     
   x86_64    |       host-delve-1.22.1        | NOK | http://autobuild.buildroot.net/results/536de3290496da40dfc1ca914ee5134bec7e9846 |     
   s390x     |       host-delve-1.22.1        | NOK | http://autobuild.buildroot.net/results/809d12aff949ee57609a22922cb6ff45cc26b189 |     
  riscv64    |       host-delve-1.22.1        | NOK | http://autobuild.buildroot.net/results/d35bd56e02570fd21cd31e42fab5b8b0b9bc4c45 |     
   xtensa    |   host-gcc-bare-metal-14.1.0   | NOK | http://autobuild.buildroot.net/results/34525bde5728c683450eed8e92557315f79d9ade |     
 microblaze  |   host-gcc-bare-metal-14.1.0   | NOK | http://autobuild.buildroot.net/results/d6e58860b2a245dadc128daf3809223765ef5aaa |     
   mips64    |   host-gcc-bare-metal-14.1.0   | NOK | http://autobuild.buildroot.net/results/dbbdc38eb75bfc6ed660659164a3e1f374b92528 |     
powerpc64le  |   host-gcc-bare-metal-14.1.0   | NOK | http://autobuild.buildroot.net/results/dd7225613200666bd8604457addb9868479842d7 |     
 microblaze  |   host-gcc-bare-metal-14.1.0   | NOK | http://autobuild.buildroot.net/results/467f3cc90aaa6e3bedb1bed6d2a11cc9b0aea9a6 |     
microblazeel |   host-gcc-bare-metal-14.1.0   | NOK | http://autobuild.buildroot.net/results/20c8e8e6d99fc1ba9852772e30f89f6a1da445d0 |     
  sparc64    |   host-gcc-bare-metal-14.1.0   | NOK | http://autobuild.buildroot.net/results/b27dea8d70df3868f94710d718734ffbbe9082e9 |     
powerpc64le  |   host-gcc-bare-metal-14.1.0   | NOK | http://autobuild.buildroot.net/results/e79f7eea4d71398a962eaf21f22b1d1d5c09ef87 |     
  sparc64    |   host-gcc-bare-metal-14.1.0   | NOK | http://autobuild.buildroot.net/results/33317c1f3c580a7a7f036a2af9761931a7606ee8 |     
  sparc64    |   host-gcc-bare-metal-14.1.0   | NOK | http://autobuild.buildroot.net/results/8c16887c9a453cf51febd5d0375c38eb8d65eed8 |     
   s390x     |   host-gcc-bare-metal-14.1.0   | NOK | http://autobuild.buildroot.net/results/fe2105641a9323dd3044826d71e451f39db8c967 |     
   nios2     |   host-gcc-bare-metal-14.1.0   | NOK | http://autobuild.buildroot.net/results/47e9645e75023a0acfe03aecf13d65edfdafb548 |     
    i686     |   host-gcc-bare-metal-14.1.0   | NOK | http://autobuild.buildroot.net/results/2d06fe7a009207d3b52da1f152b730d04139b0a8 |     
microblazeel |   host-gcc-bare-metal-14.1.0   | NOK | http://autobuild.buildroot.net/results/021a68b649bb32c76c06a0ddb9fb8ce4ad8b500f |     
 powerpc64   |   host-gcc-bare-metal-14.1.0   | NOK | http://autobuild.buildroot.net/results/c8cbf8536eface5ffc3a96f74f8f8dc9194fa646 |     
 aarch64_be  |   host-gcc-bare-metal-14.1.0   | NOK | http://autobuild.buildroot.net/results/446bded405e191294ce2c2a10fdea14389f171ea |     
   arceb     |   host-gcc-bare-metal-14.1.0   | NOK | http://autobuild.buildroot.net/results/245583a3e4600b9f8d4533d5f525be6d79a37f3d |     
 microblaze  |   host-gcc-bare-metal-14.1.0   | NOK | http://autobuild.buildroot.net/results/58ddb45bf8affbd84e8505f4cf682638eecc20fb |     
   armeb     |   host-gcc-bare-metal-14.1.0   | NOK | http://autobuild.buildroot.net/results/4427f513f0cb25f7e6fc77a32cb97f6586e18997 |     
   mipsel    |   host-gcc-bare-metal-14.1.0   | NOK | http://autobuild.buildroot.net/results/1adfc95d3ffc13c60594de1b1bc7e1e2e7a78097 |     
   mips64    |   host-gcc-bare-metal-14.1.0   | NOK | http://autobuild.buildroot.net/results/b24d49ce2a944f6aad8ca4f55ea2501d4894674d |     
microblazeel |   host-gcc-bare-metal-14.1.0   | NOK | http://autobuild.buildroot.net/results/04f36564a650025229f66463294ecb20f37bf377 |     
  aarch64    |   host-gcc-bare-metal-14.1.0   | NOK | http://autobuild.buildroot.net/results/10ea08250afc2e7dbc42014a9a18e95fb84adee1 |     
microblazeel |   host-gcc-bare-metal-14.1.0   | NOK | http://autobuild.buildroot.net/results/f20a607cda6d88fd385f223253315f16c7b6f32f |     
   arceb     |   host-gcc-bare-metal-14.1.0   | NOK | http://autobuild.buildroot.net/results/fa14257ba3eb8220a9dec4f49e80cf6314f8373d |     
  sparc64    |   host-gcc-bare-metal-14.1.0   | NOK | http://autobuild.buildroot.net/results/f3e70046c6eab7505845fcbd6e04506bbfd6fec6 |     
    mips     |   host-gcc-bare-metal-14.1.0   | NOK | http://autobuild.buildroot.net/results/3221b7963e73947c6441416a78ca55e825744d40 |     
  sparc64    |   host-gcc-bare-metal-14.1.0   | NOK | http://autobuild.buildroot.net/results/3f7b8d7ea3a92b8e8cb81fe0c8d1d7792ddf71de |     
   arceb     |   host-gcc-bare-metal-14.1.0   | NOK | http://autobuild.buildroot.net/results/28f5f09ef89fb61486a6701fbffcd622ab2b7946 |     
    m68k     |   host-gcc-bare-metal-14.1.0   | NOK | http://autobuild.buildroot.net/results/71a0527b04caf62ac3bd112e38683c04d30d57f1 |     
   mips64    |   host-gcc-bare-metal-14.1.0   | NOK | http://autobuild.buildroot.net/results/c524c1be1a5af8e6bbe39aa217a69bfc460723f6 |     
   xtensa    |   host-gcc-bare-metal-14.1.0   | NOK | http://autobuild.buildroot.net/results/5d412c490f776bd14bc9cb56dc847e9f8fcdac3a |     
powerpc64le  |   host-gcc-bare-metal-14.1.0   | NOK | http://autobuild.buildroot.net/results/cd3795d35286a46c6d82dcde6193bf45a4bc0ce4 |     
 powerpc64   |   host-gcc-bare-metal-14.1.0   | NOK | http://autobuild.buildroot.net/results/0df483318e49aa47cbc1e6ccc405d622373c5caa |     
    arm      |          host-go-src           | NOK | http://autobuild.buildroot.net/results/cf97d3c1f19d15e093c3c3b244f141dd7744460a |     
microblazeel | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/e5ee3cfb8fa8b05a54f3e2a3c3bd836799463924 | ORPH
    mips     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/cf70f6f925eb92c3b225ab21d859e7d7d7af7eee | ORPH
   s390x     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/5a1ee6469678d1628a6302c679f6ae922e5148a1 | ORPH
powerpc64le  | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/460fdf166d743c16d11cd647884c501701d1b12b | ORPH
   arceb     |       host-libtool-2.4.6       | NOK | http://autobuild.buildroot.net/results/671d090de96e5de477698bdcd0b9a64145e97f58 | ORPH
   armeb     |       host-libtool-2.4.6       | NOK | http://autobuild.buildroot.net/results/3654af689bee0cd6224322aa0dc20a2012240eca | ORPH
    i686     |       host-libtool-2.4.6       | NOK | http://autobuild.buildroot.net/results/972e2fa26da7fbedd26b3f4d1f6e4fb82334b30b | ORPH
    mips     |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/4b83bf266177fd572f42b9b635f0f0bf8faa6e0b |     
  mips64el   |   host-moby-buildkit-0.11.6    | NOK | http://autobuild.buildroot.net/results/926e8ec3885f02c415bae2add09af706e9ab6900 |     
  riscv64    |        host-runc-1.1.12        | NOK | http://autobuild.buildroot.net/results/b76efa31c7fef6a3702af67a0bb8c127bd71aea0 |     
   x86_64    |        host-rust-1.79.0        | NOK | http://autobuild.buildroot.net/results/03e1429ac4b728c2270d3c4aa5d7b53f78410d3b |     
  aarch64    |       host-skopeo-1.13.3       | NOK | http://autobuild.buildroot.net/results/ce55dfe95dcadb796cccf26d1840e65c8360b029 |     
  mips64el   |       host-skopeo-1.13.3       | NOK | http://autobuild.buildroot.net/results/ad33221545486a6f0ba7be6cfa1e691e896ab8a4 |     
   mips64    |       host-skopeo-1.13.3       | NOK | http://autobuild.buildroot.net/results/989e166ba9c51f4f92bfff5f6c22c3c341dbe9a0 |     
    i686     | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/f982cd0c402fde218881f5c44fd5a1b1031148c6 | ORPH
   armeb     | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/83a2a3eb95b01ca9aa882ddd43676304829caeb6 | ORPH
   nios2     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/f6326844fa3cce517d1cd195b8d7654a8bb0ec94 |     
  aarch64    | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/3669e4ff964b585a7048731903c583f46707db62 |     
   sparc     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/7c41a72ec4210c569d1df8a4ae0b51c21c99a249 |     
    arm      | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/87c6671673d6b8d09cfa63ba82946f537bbf308c |     
   mips64    | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/e1ab81018f6279b14a9f6b43335ebb45be3eeed5 |     
  sparc64    | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/47b77425afd93e81ac835ea76c3e19a061159532 |     
 aarch64_be  | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/26d8758a55babcb0327b2a4db2f150d4c0b7f826 |     
   arceb     |           htop-3.3.0           | NOK | http://autobuild.buildroot.net/results/b7645b14e2dd7bc235a14a5a919a07147ba0cb1b | ORPH
   sparc     |           htop-3.3.0           | NOK | http://autobuild.buildroot.net/results/a800c2769e3bb9f729ea4bee79480516a6e68f3d | ORPH
  aarch64    |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/bf63e072ba5ed89286bf021ef7ddcbd05053de57 |     
   xtensa    |          jack2-1.9.22          | NOK | http://autobuild.buildroot.net/results/bcc3082ab7baebd861f5120e88909137def99363 |     
    or1k     |         lesstif-0.95.2         | NOK | http://autobuild.buildroot.net/results/66caacce602ead0e693585c67faad9e97ea9dbb0 | ORPH
   x86_64    |         libcddb-1.3.2          | NOK | http://autobuild.buildroot.net/results/f7b7730b626a32826d4fd2cd963118ea676de251 |     
   x86_64    |         libcuefile-475         | NOK | http://autobuild.buildroot.net/results/0dda525f271746fc7bf4a758aa29c873be9bc73f | ORPH
  aarch64    |        libdeflate-1.20         | NOK | http://autobuild.buildroot.net/results/2c4fcffa2b4525ece84de95ad14159541ca08b98 |     
   sparc     |         libdrm-2.4.122         | NOK | http://autobuild.buildroot.net/results/083e15ecc46dac91fa615411d8bcab402358d584 |     
   nios2     |         libesmtp-1.1.0         | NOK | http://autobuild.buildroot.net/results/267ae496fc969ca8d29e85e4c411b54b239feee2 | ORPH
    or1k     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/944d0c4c21f26ae346e9f1de33385dd99c277682 |     
    or1k     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/308b29390ab37b01e15e310301e206bf59690149 |     
    or1k     |         libgeos-3.12.2         | NOK | http://autobuild.buildroot.net/results/23b997f1dda8fb44908a5f0ced3392e97fb68ca2 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/6f4c35232c02db029320d440723559d3e9932926 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/2fa47ed00231367f43607e07eab73f21291e0840 |     
  riscv64    |       libgpg-error-1.50        | NOK | http://autobuild.buildroot.net/results/44e54d41017092665be2b7a98945487c57a9b72e | ORPH
    m68k     |         libjcat-0.2.1          | NOK | http://autobuild.buildroot.net/results/58c7ecbcfab96ebbc7a20291d4712cf64094b9f7 |     
    or1k     |          libnfc-1.8.0          | NOK | http://autobuild.buildroot.net/results/551cddf3b9513812147c0504a9620251ee7bc2d3 |     
powerpc64le  |          libnl-3.9.0           | NOK | http://autobuild.buildroot.net/results/9cd095c6357ca43195fb41215477f683cc0e7a75 | ORPH
 microblaze  |        libopenssl-3.3.1        | NOK | http://autobuild.buildroot.net/results/2f1f0952d44ece2a738e839c7deae5646d5e65a2 | ORPH
powerpc64le  |   libphidget-2.1.9.20190409    | NOK | http://autobuild.buildroot.net/results/da22c55c17dfdd6749ccc4c6daa51f98bb9afa88 |     
    arm      |         libressl-3.9.2         | NOK | http://autobuild.buildroot.net/results/5d6b0dff17c1d5eb3527c8b59d2c1c8b57dc6ee6 | ORPH
  riscv64    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/6682c5e634c7257b2a7f5b30567839a2825b4b3c |     
   armeb     |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/a4be6b44937aa541c1d428950863a0299af3909b |     
  riscv64    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/69d18305993524bf38542fb50e04649a6ccd0a1c |     
    m68k     |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/04c6d6c61cc36adaf753a2d9e71b6cc1f819b102 |     
   armeb     |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/24123ce95b7f862e37f7c557e40e7545cf18a4d9 |     
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/cd6371bdbde40ea9c49e27b109d006436641e043 |     
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/a35aa5ba4cf71ffecbef25fd6e56712bd190377d |     
    sh4a     |         libshout-2.4.6         | NOK | http://autobuild.buildroot.net/results/2e82feb4f5fc35fccec35090d5bedc980ac583b8 | ORPH
 powerpc64   | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/99f1f9523b03fc953dbd140fda5d67a931a4b647 | ORPH
    or1k     |        libunwind-1.8.1         | NOK | http://autobuild.buildroot.net/results/435fe0927c001403d183530d72e8c5043a032bab | ORPH
   sparc     |        lighttpd-1.4.76         | NOK | http://autobuild.buildroot.net/results/fa128b79bb8713581b9c5cb67f8b2aa707f15089 | ORPH
   arceb     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/711b7588c9df3a5f10646a0e1a2bd48908dec4a1 | ORPH
    m68k     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/0cb3246842c0e3c9a72ca2d3099b08f246e7b720 | ORPH
    m68k     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/57498a07ff4689616ebebd8e4718819b4689f40c | ORPH
   x86_64    |          linux-6.10.3          | NOK | http://autobuild.buildroot.net/results/f239651077770b51c8cb214ff2e3cd01d6c107a2 | ORPH
   x86_64    |          linux-6.10.3          | NOK | http://autobuild.buildroot.net/results/fca1327102e6a2e94ce49972f2c6238bcc2c9232 | ORPH
  mips64el   |          linux-6.10.3          | NOK | http://autobuild.buildroot.net/results/9a60b4b96eaa2f4dc4473c6e484e3a916ebaac07 | ORPH
   arceb     |          linux-6.10.3          | NOK | http://autobuild.buildroot.net/results/84ebdfd9d4840a3b72e52fa17363834e6c3a6f1c | ORPH
    sh4a     |          linux-6.10.3          | NOK | http://autobuild.buildroot.net/results/695b10442bc8357eff43b7acf864d6361342974c | ORPH
   mips64    |          linux-6.10.3          | NOK | http://autobuild.buildroot.net/results/44a652d771f1e853c5899c229b0cc0d5ad7d9642 | ORPH
   s390x     |          linux-tools           | NOK | http://autobuild.buildroot.net/results/9bb27992f909c7d54deb7dbdeeaa47777b74cd1c | ORPH
   mips64    |          linux-tools           | NOK | http://autobuild.buildroot.net/results/ae39ff7bbd1dc371bef1b3b7bf82ae4db6d9f566 | ORPH
   arceb     |          lsuio-0.2.0           | NOK | http://autobuild.buildroot.net/results/0fbe7ae21462b4889e4d168fc7c228fa878c3176 | ORPH
powerpc64le  |     lttng-modules-2.13.10      | NOK | http://autobuild.buildroot.net/results/7c4cb2e8073407e053e1f7cc450b9bc391417748 |     
 aarch64_be  |           lxc-5.0.3            | NOK | http://autobuild.buildroot.net/results/2f4ff0523ab93adb4b49c6cdeac62079b4351efd |     
  aarch64    |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/7fd541051ce044afbf8b03f1c98f47b7080dfd19 | ORPH
  sparc64    |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/a9e9173ba1b009350d51fff3e1a3e2718f4b3f2d | ORPH
    m68k     |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/87061808c846f4ef9f5863cb2056a3afe5ee32c8 | ORPH
  riscv32    |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/fda37ef70fdedb859cea0921924b47e274e24ca0 | ORPH
    arm      |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/e493781619f983e8507e5d2895c9ee0824ad5627 | ORPH
    arm      |          mender-3.4.0          | NOK | http://autobuild.buildroot.net/results/d16e08024f73d3e0b0234aae1278c6108b8ba907 |     
   s390x     |          mender-3.4.0          | NOK | http://autobuild.buildroot.net/results/7382c27706f51e0dbc3ff41d739fb402755aa89c |     
    sh4      |         mesa3d-24.0.9          | NOK | http://autobuild.buildroot.net/results/13145f0798539e65e46cba3b88630e538977ce8a |     
  aarch64    |       micropython-1.22.0       | NOK | http://autobuild.buildroot.net/results/5293e4125e89d4c79e2bfc7d0951f62948c0a65f |     
  mips64el   |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/06a7f079012197812ecb47587b7b52075e898346 |     
    m68k     |           mpv-0.35.1           | NOK | http://autobuild.buildroot.net/results/8c6df573cd415511c145f967ea6505c283e39033 |     
 aarch64_be  |          mupdf-1.23.9          | NOK | http://autobuild.buildroot.net/results/736bc2cb2ca32bfad8e0a46c202b4fef58ef643a |     
   x86_64    |           ncmpc-0.49           | NOK | http://autobuild.buildroot.net/results/e58ae2e1253eadfa8883fd31ffd1a9af7ec78f05 |     
  powerpc    |         nethogs-0.8.7          | NOK | http://autobuild.buildroot.net/results/a3d50311e979c345fd3eb3d38d331a861e9595c1 |     
 powerpc64   |         nethogs-0.8.7          | NOK | http://autobuild.buildroot.net/results/fb4318db7b1e1b18262335f638db3fc1408f0267 |     
   nios2     |         nethogs-0.8.7          | NOK | http://autobuild.buildroot.net/results/acf8e2ab72bbf02f9994d2eb2b882cc2ceb0aecf |     
powerpc64le  |         nethogs-0.8.7          | NOK | http://autobuild.buildroot.net/results/f09ee5cb68b95be5d3731cea7ce44f496096e05b |     
   nios2     |         nethogs-0.8.7          | NOK | http://autobuild.buildroot.net/results/a691b1b9ac25645abdac6ef03384d46dc1700472 |     
    mips     |       netstat-nat-1.4.10       | NOK | http://autobuild.buildroot.net/results/5f61c64c0acb568182445edc1c27129aeb4380db | ORPH
    m68k     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/2a18b422984ae3298d48033a79d4575f9e4024db | ORPH
   nios2     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/ac00544b9984e24f1bec6649fe808b4aaa6e854f | ORPH
  aarch64    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/5df997aa8979cd64adc0bc8daa5bca0cb0b9f97e | ORPH
   x86_64    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/10ce6f13739281c171bf5fc5d8742817eacb7856 | ORPH
   nios2     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/ec99cbf37365eabd9ea81fc62601948c98eb94ce | ORPH
   nios2     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/cb7ed75ea229954e9b69550120d55691b3b5f8bb | ORPH
   mipsel    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/abc12f2818f8b353e97a8aef2a3646fd5a1ae26e | ORPH
   nios2     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/1ecb18a96192168286613eddfac09f789e8a9b03 | ORPH
   xtensa    |          ntpsec-1.2.3          | NOK | http://autobuild.buildroot.net/results/8190e8caafbba9b96514282368ef8e76881e0ab1 | ORPH
   mips64    |        openblas-0.3.27         | NOK | http://autobuild.buildroot.net/results/001d41d320b6f127319d7d40f18068cb27273b27 |     
microblazeel |        openconnect-9.12        | NOK | http://autobuild.buildroot.net/results/fd1a8b66e641f43b21a23e193967590de398edfd |     
    arc      |        openconnect-9.12        | NOK | http://autobuild.buildroot.net/results/26e71278aff74f6cc1c95f7ed35cbc1b1fe56c8b |     
powerpc64le  |        openconnect-9.12        | NOK | http://autobuild.buildroot.net/results/45cc1d69527edd8b253533a1d985acec16dfad54 |     
    mips     |         openssh-9.8p1          | NOK | http://autobuild.buildroot.net/results/cc5655ee10412813e26f8f81131c9bf8bb0552b0 | ORPH
   mips64    |         openssh-9.8p1          | NOK | http://autobuild.buildroot.net/results/550a42bf61e3fe42e335f3226fa8bad1c8ebd52c | ORPH
powerpc64le  |         openssh-9.8p1          | NOK | http://autobuild.buildroot.net/results/5d5cd64d2e8268c86a310ab8d274dc401c256f3b | ORPH
   mips64    |         openssh-9.8p1          | NOK | http://autobuild.buildroot.net/results/105b6e501c06ad78f608e3189963545cec50bbde | ORPH
powerpc64le  |         openssh-9.8p1          | NOK | http://autobuild.buildroot.net/results/8a526b8b4a136ffaa5403eb5512eed934409705e | ORPH
powerpc64le  |         openssh-9.8p1          | NOK | http://autobuild.buildroot.net/results/48f2e7602763ec39b836d0bc8b78a9124547b76e | ORPH
powerpc64le  |       parsec-tool-0.7.0        | NOK | http://autobuild.buildroot.net/results/00fdf3515d20b5784d62493f889a5907c806a018 |     
powerpc64le  |       parsec-tool-0.7.0        | NOK | http://autobuild.buildroot.net/results/f408179df133e44775e7a628ea1c74449a5f4af9 |     
  powerpc    |       parsec-tool-0.7.0        | NOK | http://autobuild.buildroot.net/results/6e9d1bd857526b93319573bf7e35db1a23b486ef |     
  sparc64    |       parsec-tool-0.7.0        | NOK | http://autobuild.buildroot.net/results/65c7f1c7268fa2a6320afa581500e78f57dda9b3 |     
   arceb     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/a017cd4648bba91d02ed6a641e4572cf38879006 | ORPH
   mips64    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/46d466d2459637735333888c7bc18ad02e245c58 | ORPH
  sparc64    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/d0f972542f9d6ece4691e03d8179528fea59f040 | ORPH
   xtensa    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/a284e911321d316ff3fcb7ec1f564e8f933202d2 | ORPH
    m68k     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/53fbb8bd8e6693d46570e67978f7dd9a1f917d78 | ORPH
   s390x     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/39abe03fcd7866aba4dac339056e1075546bfb6c | ORPH
   nios2     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/5dc94270ba834494e523c1312c18d7420f76b084 | ORPH
 aarch64_be  |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/1a6a808cac8bed76fa69ee8b9e405e1d6b5561ef | ORPH
  sparc64    |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/4e288203dae584feba2568daece776d1d33940d7 |     
   mipsel    |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/2f36b71db7ec5dc8fdb52c8a8bc24971e13962c1 |     
 aarch64_be  |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/7643824e6138facb404a794755f21de8c3631f86 |     
   nios2     |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/a1542021934b5f78382e92aa54824569528543b5 |     
   x86_64    |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/74dffd9047ca09eb19eca49879574cb8bc3a4faf |     
powerpc64le  |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/d54ae5c2c7b23b9c306fc789b201211d8ac4b520 |     
   s390x     |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/90dff3ef4cbc1cd34c88e6b159ece17d79623d1c |     
  mips64el   |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/f740bf235ba2aff58e299bf944315e3902b37642 |     
    mips     |   python-cryptography-39.0.2   | NOK | http://autobuild.buildroot.net/results/c4ebb295614a3cd421bca0031fa6ada428863461 |     
microblazeel |   python-cryptography-39.0.2   | NOK | http://autobuild.buildroot.net/results/5eb2341116f3d077bd903089a322615e61619dd7 |     
    mips     |      python-daemon-3.0.1       | NOK | http://autobuild.buildroot.net/results/f1c62bf259a76c6e4d8b7ea860a2832587f693b5 |     
  sparc64    |      python-daemon-3.0.1       | NOK | http://autobuild.buildroot.net/results/8a2cb5193d0c90ea6e7ff10565cf353a7926b980 |     
  mips64el   |      python-daemon-3.0.1       | NOK | http://autobuild.buildroot.net/results/f09cedc06b3fda14dd244798a17f296a998f2404 |     
    mips     |      python-daemon-3.0.1       | NOK | http://autobuild.buildroot.net/results/039bc6678c0fa027172f3685555563e403249867 |     
  sparc64    |      python-daemon-3.0.1       | NOK | http://autobuild.buildroot.net/results/b0d5146d56c793711c7e68e6db6e686edb91a82e |     
    mips     |      python-grpcio-1.60.0      | NOK | http://autobuild.buildroot.net/results/73deff7f0cfccf4920b0c96d3ce71d522e6d5fb9 |     
powerpc64le  |  python-pypika-tortoise-0.1.6  | NOK | http://autobuild.buildroot.net/results/e9614e663a8242a0400a1147212e8cfd9d8302b4 |     
   nios2     |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/12f3eb6c65559416fb0c0b098334b4ec987b4c03 |     
 aarch64_be  |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/4f3d9e281f6f961851b2823bd1c14232d856cd4e |     
   sparc     |         s6-dns-2.3.7.2         | NOK | http://autobuild.buildroot.net/results/e7016674496b31a1dd1650f186955cf323b4f0c9 |     
   xtensa    |         s6-dns-2.3.7.2         | NOK | http://autobuild.buildroot.net/results/925a141ba283debc9dc79d496556bdd68ca0572e |     
   xtensa    |         s6-dns-2.3.7.2         | NOK | http://autobuild.buildroot.net/results/5ddbba5c4a1797bec73eb0a4f6e6f0d10d08a421 |     
   sh4eb     |      sane-backends-1.1.1       | NOK | http://autobuild.buildroot.net/results/66ddd2c6ff58bdf20797ad8e965bcf06d14f81d2 |     
    or1k     |         shadow-4.15.1          | NOK | http://autobuild.buildroot.net/results/d6e3a44c90d0bc1b28f75a5a591ce7dd9a124fa7 |     
   sparc     |       sofia-sip-1.13.17        | NOK | http://autobuild.buildroot.net/results/3badfb86ea20b821e06c9d47e26b3e118fff98ef |     
   sparc     |       sofia-sip-1.13.17        | NOK | http://autobuild.buildroot.net/results/c95855635b8afc419c4c6e0007c8ac46818f743f |     
   sh4eb     |           sslh-2.0.1           | NOK | http://autobuild.buildroot.net/results/e323d0cb85044f9857f22a20baaece71d17cb08e | ORPH
   nios2     |       strongswan-5.9.13        | NOK | http://autobuild.buildroot.net/results/1920cba7ed6f6e7f9529f64ebe4737919ca4cfae |     
 powerpc64   |       strongswan-5.9.13        | NOK | http://autobuild.buildroot.net/results/4af984603560d7d9b12d27bc1a20440368feb051 |     
  sparc64    |         systemd-256.4          | NOK | http://autobuild.buildroot.net/results/0a0d65ee9d36f9e658a939b6b3a668349a51ee16 |     
   sparc     |        tipidee-0.0.5.0         | NOK | http://autobuild.buildroot.net/results/814dd9eeda87189e25414c0de8bb7ad6488498b6 |     
   x86_64    |        tipidee-0.0.5.0         | NOK | http://autobuild.buildroot.net/results/7dbb81cdb83f4fde85ef7fa275b531e4dfc7e3f9 |     
powerpc64le  |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/2892c87249f86a1a020f8db40be31d3849c5be55 | ORPH
microblazeel |      uboot-tools-2021.07       | NOK | http://autobuild.buildroot.net/results/47271087f808c8ec9a3f73fa5b1e5d8c1d99aeb4 | ORPH
    or1k     |         uclibc-1.0.49          | NOK | http://autobuild.buildroot.net/results/6b35918faf2ba42f3e24d4f035cb4d5b507a3a92 |     
    arc      |         uclibc-1.0.49          | NOK | http://autobuild.buildroot.net/results/3deb7c1d7aa220e5135c2454d393cb0f9cd3bfc8 |     
   armeb     |            unknown             | NOK | http://autobuild.buildroot.net/results/8c94d60f66c538d893508ff21b59120b23cb2ba9 |     
  riscv64    |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/6ac0da043e3828bbda6d0eb8740879919ff0a61e | ORPH
   mipsel    |        valgrind-3.23.0         | NOK | http://autobuild.buildroot.net/results/a076e49acf2df807935296bf4febbada0771f17a | ORPH
   mips64    |        valgrind-3.23.0         | NOK | http://autobuild.buildroot.net/results/e905821e5ad48c8e8e988c26201723bf1f5433e9 | ORPH
   mips64    |         wolfssl-5.7.2          | NOK | http://autobuild.buildroot.net/results/06be4d2358b42de5d88a11ee43b597c96bced85a |     
  mips64el   |         x11vnc-0.9.16          | NOK | http://autobuild.buildroot.net/results/ab393cb64cc8d97a024313791649725f038dd541 |     
   sh4eb     |         x11vnc-0.9.16          | NOK | http://autobuild.buildroot.net/results/c098fdafa80e177c4104bb0a1db3d2671e268dbc |     
    i586     | x264-baee400fa9ced6f5481a72... | NOK | http://autobuild.buildroot.net/results/3bf93ab3742710e38a7725f96fade4a22ae7e055 |     
   x86_64    |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/1b9674d82c53bb0a3ae39517c7f10f03b6cfad31 |     
powerpc64le  |        zxing-cpp-2.2.1         | NOK | http://autobuild.buildroot.net/results/b3c3d4c95a72cf53dda250d90804502ae32aded6 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                 coreutils-9.3 | 2 
                     exim-4.98 | 1 
firmware-utils-86739f2b3ae9... | 1 
         gobject-introspection | 1 
  gobject-introspection-1.76.1 | 1 
               libglib2-2.76.1 | 1 
                libressl-3.8.4 | 1 
                  linux-6.6.37 | 1 
               mariadb-10.11.6 | 1 
                 openssh-9.7p1 | 1 
   openvmtools-11.3.5-18557794 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/98b38c597c7b033fa47514025df4019fd0ed20fd | ORPH
   mipsel    |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/b4f46abe7de718ab34c155e9cb5aa091a7c9378d | ORPH
    arm      |           exim-4.98            | NOK | http://autobuild.buildroot.net/results/e9c059d43c86787b74cd9689d8c320981eddab68 |     
powerpc64le  | firmware-utils-86739f2b3ae9... | NOK | http://autobuild.buildroot.net/results/abd42fb84126aa3d4c3b925a0d749942e77e9c4f |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/94629d3429aca0ecd8c0ccf0612c14aa0371035a |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/ce19a73de936901299a0e19789fa3bea21e8f0b4 | ORPH
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/51e23ee37411db775c0680727f5422f1a5e9c6c9 |     
    or1k     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/3dca02403214428fb985188ebbd5d22c156ebb5d | ORPH
 aarch64_be  |          linux-6.6.37          | NOK | http://autobuild.buildroot.net/results/1fa3033b045ed0f35372654da0173777a7d4b3f3 | ORPH
powerpc64le  |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/d50a1747302f875ff6fb771f3a6ee50118b1c359 | ORPH
powerpc64le  |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/83e10f486c8aef6f57d3dddd0947eda8f15f94bb | ORPH
    i686     |  openvmtools-11.3.5-18557794   | NOK | http://autobuild.buildroot.net/results/4eaa2f7e91d4262879900f0fd8a1e01c34328599 |     


Classification of failures by reason for 2024.05.x
--------------------------------------------------

                    bat-0.24.0 | 1 
       gst1-plugins-bad-1.22.9 | 1 
 host-binutils-bare-metal-2.42 | 1 
         host-libxcrypt-4.4.36 | 1 
ibm-sw-tpm2-5452af422edeff7... | 1 
                libressl-3.8.4 | 1 
                  linux-6.8.12 | 1 
               mariadb-10.11.6 | 1 
                     php-8.3.9 | 1 
pppd-e1266c76d1ad39f98f1167... | 1 
         python-remi-2022.7.27 | 1 
                 shadow-4.14.5 | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |           bat-0.24.0           | NOK | http://autobuild.buildroot.net/results/597f5ff50957f0d35312ca3ecab154236a8c6f36 |     
    or1k     |    gst1-plugins-bad-1.22.9     | NOK | http://autobuild.buildroot.net/results/5a19e211b3f636520998e6b7dbbfd198dca7404b | ORPH
    i686     | host-binutils-bare-metal-2.42  | NOK | http://autobuild.buildroot.net/results/c41d925b08976c36bc324ad0d4699005ba7fb41b |     
   x86_64    |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/1adff5bb8585de4b54239c177e4417fdc56687bf |     
    arm      | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/5b106e9ce875dde347dd8a97714be471dd07a4a3 |     
microblazeel |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/34dbeaa231115a565a2fdc2ddc4183e0452cfc44 | ORPH
  aarch64    |          linux-6.8.12          | NOK | http://autobuild.buildroot.net/results/92c83f6277b4d72fd42ee4064a32f698d69429e7 | ORPH
  riscv32    |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/41450dab53ea78c07b26178a4e2f3e9c00be7021 | ORPH
    sh4      |           php-8.3.9            | NOK | http://autobuild.buildroot.net/results/c3a56d334aec9c665153eaaa234c181c906b86b7 |     
  sparc64    | pppd-e1266c76d1ad39f98f1167... | NOK | http://autobuild.buildroot.net/results/852505594149ba9ebf227471a7db2e63a4e91d9c |     
   nios2     |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/ef81ce45d2f0154c94a6ccabc1fd7e13389e3b1a |     
    m68k     |         shadow-4.14.5          | NOK | http://autobuild.buildroot.net/results/12d7a2066473920ed1d1c17770f5a522d64da46b |     


Gitlab CI results for 2024-08-05
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
              TestBitcoin | https://gitlab.com/buildroot.org/buildroot/-/jobs/7502134323  | ORPH 
...ilp32dMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/7502134814  | ORPH 
...iscv32ilp32dMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/7502134815  | ORPH 
             TestGnuradio | https://gitlab.com/buildroot.org/buildroot/-/jobs/7502134361  | ORPH 
                 TestGpsd | https://gitlab.com/buildroot.org/buildroot/-/jobs/7502134363  | ORPH 
          TestLuajitLunix | https://gitlab.com/buildroot.org/buildroot/-/jobs/7502134415  | ORPH 
              TestMariaDB | https://gitlab.com/buildroot.org/buildroot/-/jobs/7502134450  | ORPH 
               TestMender | https://gitlab.com/buildroot.org/buildroot/-/jobs/7502134454  | ORPH 
          TestPhpPeclDbus | https://gitlab.com/buildroot.org/buildroot/-/jobs/7502134500  | ORPH 
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/7502134582  | ORPH 
         TestRelroPartial | https://gitlab.com/buildroot.org/buildroot/-/jobs/7502134160  | ORPH 
               TestWeston | https://gitlab.com/buildroot.org/buildroot/-/jobs/7502134636  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
