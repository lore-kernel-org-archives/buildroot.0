Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3E92C3DA4A
	for <buildroot@archiver.kernel.org>; Sat, 10 Aug 2024 05:08:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2146F413A5;
	Sat, 10 Aug 2024 05:08:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g9OMSWlRcaB8; Sat, 10 Aug 2024 05:08:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2808C4139E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2808C4139E;
	Sat, 10 Aug 2024 05:08:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 786E41BF863
 for <buildroot@lists.busybox.net>; Sat, 10 Aug 2024 05:08:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 643F2844EF
 for <buildroot@lists.busybox.net>; Sat, 10 Aug 2024 05:08:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r2wyBxy8H0Oo for <buildroot@lists.busybox.net>;
 Sat, 10 Aug 2024 05:08:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5BD46844A8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5BD46844A8
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5BD46844A8
 for <buildroot@buildroot.org>; Sat, 10 Aug 2024 05:08:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7E366FF803
 for <buildroot@buildroot.org>; Sat, 10 Aug 2024 05:08:40 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sat, 10 Aug 2024 05:08:40 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1723266520; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=XunDYBjXGoblTyIUsSD8XUznBJ+HveWNse9AD2ot4Vs=;
 b=BomATtwnP4fUL7Omv+CoqJ+CWLBwrnChfNjXA4EycYGPFnBb4m4i5wP8wo0hhAXXmxhsXD
 MDze19OiSntRyCgj7+MunPPWq0hc+PqVnKtRGwQTDHRNfoMNTgIrxwDwL+t+YuNOEz8X0m
 qpWHN6YxKL6AAuXFeGi2DNcKtURh8Cs2xwP8LfAUkAVqQmblUazTQlQcO35xXjidxX0y+I
 cbFZtoaQMEkbJIzUllV2LYyJQGtnceaWDM8q0v4Aq8DE6IA+uoWe0lqA8JcVe7rJCM+LjA
 MqTscSPsiOVy2JeAZU9T8r4pX7J+FcSVF09CiyPF30qUG6Bk4HIxhIC9HgyL6g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BomATtwn
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-08-09
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
Message-ID: <20240810050840.yGGEyKGpAYBK7DLXnXFS6tUKKyXFvRNFHzS3b_mm6tU@z>

Hello,

Autobuild statistics for 2024-08-09
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  6  | 11  |  0  | 17  |
  2024.05.x  |  4  |  4  |  0  |  8  |
    master   | 109 | 221 |  2  | 332 |

Classification of failures by reason for master
-----------------------------------------------

host-vboot-utils-bbdd62f9b0... | 13
                  ffmpeg-6.1.2 | 8 
  gobject-introspection-1.76.1 | 8 
                     avahi-0.8 | 7 
                gnu-efi-3.0.18 | 6 
         host-libxcrypt-4.4.36 | 6 
 host-softether-4.30-9700-beta | 5 
                  linux-6.10.3 | 5 
      python-autocommand-2.2.2 | 5 
                   atop-2.10.0 | 4 
host-heimdal-f4faaeaba371ff... | 4 
         python-remi-2022.7.27 | 4 
                   swipl-9.2.6 | 4 
                    zeek-4.1.1 | 4 
aer-inject-9bd5e2c7886fca72... | 3 
                  cairo-1.18.0 | 3 
                 dc3dd-7.2.641 | 3 
                   foot-1.16.2 | 3 
 host-binutils-bare-metal-2.42 | 3 
              host-runc-1.1.12 | 3 
               ipmitool-1_8_19 | 3 
               iproute2-6.10.0 | 3 
               libglib2-2.76.1 | 3 
                  libnss-3.103 | 3 
                    norm-1.5.8 | 3 
                   trinity-1.9 | 3 
           at-spi2-core-2.50.0 | 2 
  binutils-arc-2023.09-release | 2 
                   bird-2.0.12 | 2 
                 coreutils-9.3 | 2 
                     crun-1.15 | 2 
                elfutils-0.189 | 2 
         gobject-introspection | 2 
                     gpsd-3.25 | 2 
            host-binutils-2.42 | 2 
             host-delve-1.22.1 | 2 
host-go-bootstrap-stage1-1.... | 2 
     host-moby-buildkit-0.11.6 | 2 
                  libffi-3.4.6 | 2 
             libgpg-error-1.50 | 2 
          libzenoh-pico-0.11.0 | 2 
     linux-5.10.162-cip24-rt10 | 2 
                  ntp-4.2.8p18 | 2 
                 openssh-9.8p1 | 2 
                 qt6base-6.7.2 | 2 
                 systemd-256.4 | 2 
                 uclibc-1.0.49 | 2 
                acpitool-0.5.1 | 1 
                    bat-0.24.0 | 1 
             berkeleydb-5.3.28 | 1 
                  boinc-7.20.2 | 1 
                  boost-1.83.0 | 1 
                   botan-3.3.0 | 1 
              cache-calibrator | 1 
                   cvs-1.12.13 | 1 
        edk2-edk2-stable202308 | 1 
                   eza-0.18.22 | 1 
       freeradius-server-3.2.3 | 1 
                    gdal-3.8.2 | 1 
                gerbera-1.12.1 | 1 
          gitlab-runner-15.5.0 | 1 
glibc-2.39-74-g198632a05f6c... | 1 
        gmrender-resurrect-0.1 | 1 
                 gnuplot-6.0.1 | 1 
                 highway-1.2.0 | 1 
host-go-bootstrap-stage2-1.... | 1 
host-go-bootstrap-stage3-1.... | 1 
                   host-go-src | 1 
              host-rust-1.79.0 | 1 
            host-skopeo-1.13.3 | 1 
            igd2-for-linux-2.2 | 1 
      libabseil-cpp-20230802.1 | 1 
                libcuefile-475 | 1 
libdbi-drivers-0bfae6c43134... | 1 
                libesmtp-1.1.0 | 1 
           libmaxminddb-1.10.0 | 1 
               lighttpd-1.4.76 | 1 
          linux-5.10.162-cip24 | 1 
                   linux-tools | 1 
        ltp-testsuite-20240524 | 1 
            luaossl-20220711-0 | 1 
               mariadb-10.11.6 | 1 
           mediastreamer-4.4.8 | 1 
                memtest86-6.20 | 1 
                  mender-3.4.0 | 1 
                    ncmpc-0.49 | 1 
               openblas-0.3.27 | 1 
             parsec-tool-0.7.0 | 1 
               pcsc-lite-2.1.0 | 1 
                 pixman-0.42.2 | 1 
               procps-ng-4.0.4 | 1 
           python-daemon-3.0.1 | 1 
          python-grpcio-1.60.0 | 1 
           python-numpy-1.25.0 | 1 
            python-scapy-2.5.0 | 1 
python-unittest-xml-reporti... | 1 
                python3-3.12.4 | 1 
                   rauc-1.11.3 | 1 
                s6-dns-2.3.7.2 | 1 
             sofia-sip-1.13.17 | 1 
                 sqlite-3.46.0 | 1 
               tipidee-0.0.5.0 | 1 
                    uftp-5.0.3 | 1 
                       unknown | 1 
           v4l2loopback-0.12.7 | 1 
               valgrind-3.23.0 | 1 
                 wolfssl-5.7.2 | 1 
                xenomai-3.0.10 | 1 
                 zlib-ng-2.1.6 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |         acpitool-0.5.1         | NOK | http://autobuild.buildroot.net/results/ec783256e2b99f64d20223d157d40ea5e27266a8 |     
  riscv64    | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/1bec628d56299a6a995e9055d123326c1357e19f | ORPH
  mips64el   | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/cc81f492e472f22aa2b7e5066046d9466ccc7c56 | ORPH
  sparc64    | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/7785cd08ac1fd34cde9fe30560860b61754d43c4 | ORPH
   mips64    |      at-spi2-core-2.50.0       | NOK | http://autobuild.buildroot.net/results/51edd3e1ebcc7af435bec089a81ea43a470b080f |     
    arm      |      at-spi2-core-2.50.0       | NOK | http://autobuild.buildroot.net/results/4146772dd972ac638faf1b67a077b5cdb7e59560 |     
 powerpc64   |          atop-2.10.0           | NOK | http://autobuild.buildroot.net/results/d927eaaa4fbce3d20a1e13a06a4b7aa7d7544a8f |     
   mipsel    |          atop-2.10.0           | NOK | http://autobuild.buildroot.net/results/4f256c96c8b7c34c1f1be378ad3a535d3150e44d |     
   xtensa    |          atop-2.10.0           | NOK | http://autobuild.buildroot.net/results/994e43a162bc3767ccf8bba7400d1b6848c584b5 |     
 aarch64_be  |          atop-2.10.0           | NOK | http://autobuild.buildroot.net/results/cb1257da3aae47484e42315a5a6dcd3304b0e367 |     
  aarch64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/ab9d4a6090c88f9a65c6e96c64bd63e207c39b3f | ORPH
   x86_64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/8b9f82e8cac5508e376c542a92ace9c684d4077f | ORPH
    mips     |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/c24b5dc0290d70401e38cb962a67b75f2f087262 | ORPH
 aarch64_be  |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/6a84e9d0873e807ac058448747ca844088135963 | ORPH
powerpc64le  |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/bd002513ebe2793df6938317873fb56ef3084fd3 | ORPH
microblazeel |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/ef95bfcda62dbaff17ed7b4fbe540c37fec677b0 | ORPH
  riscv64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/e9feaa55ee0948b2fcfaa33d90096c07c650d896 | ORPH
   x86_64    |           bat-0.24.0           | NOK | http://autobuild.buildroot.net/results/b0a5556c8e13d03483ce2b7c3fe7d1d565548e94 |     
  mips64el   |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/a415c10861797ba13060572c4df36fe416102dfa | ORPH
   arceb     |  binutils-arc-2023.09-release  | NOK | http://autobuild.buildroot.net/results/26165eecb920bbce8a2d31f10e3a74d563cd2927 |     
    arc      |  binutils-arc-2023.09-release  | NOK | http://autobuild.buildroot.net/results/858cc2dddfbd776f4f33cc8f8f8f3873ef301c38 |     
    or1k     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/7194dc1785dce4354996865ba4dc38f216b5ebc3 |     
   sparc     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/bc68eba1bf58df543719679bccc4037eefbac101 |     
   nios2     |          boinc-7.20.2          | NOK | http://autobuild.buildroot.net/results/205c9adcb162ff842d7e25497588a2898d71ee3e |     
  mips64el   |          boost-1.83.0          | NOK | http://autobuild.buildroot.net/results/19aa322a203f808fe415b933b281f4bd10749eb7 |     
   sparc     |          botan-3.3.0           | NOK | http://autobuild.buildroot.net/results/2b79a7a19a9f62d2f742d685509984ec974c13a1 | ORPH
   arceb     |        cache-calibrator        | NOK | http://autobuild.buildroot.net/results/05950756b897fd8c5ae001e2b502002a7a41d6e8 |     
   x86_64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/bb00d3048131dd253187bc2f936f03eb0cfee843 |     
   xtensa    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/8968d9629ac7f1a8677d59f33657c92c6f036adc |     
    i686     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/eb6b4180d25c5c8450bc25f355e38b99608f8f10 |     
   sparc     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/230ec132977608efdd6d8694de24cd3915da2d35 | ORPH
    sh4      |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/407426920e09e81cbe53619b62ba6695ee95d337 | ORPH
   xtensa    |           crun-1.15            | NOK | http://autobuild.buildroot.net/results/558235f16ca9e93774366fb3ce49688f4cb2d537 |     
   x86_64    |           crun-1.15            | NOK | http://autobuild.buildroot.net/results/b15e003e30dc8b31902cad1b414b100378185c2e |     
    m68k     |          cvs-1.12.13           | NOK | http://autobuild.buildroot.net/results/336be116903c1eec02b05c96e823e3f1f96e13a6 | ORPH
 microblaze  |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/1e2818908837425d334d5e75c4a1bdb58b0b893a | ORPH
   sh4aeb    |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/1c3204d1470d974f61aeb0879ff72aa619fe99c1 | ORPH
   sparc     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/bdd89408dc960309610abb78a0f4ed0e572dfdf8 | ORPH
   x86_64    |     edk2-edk2-stable202308     | NOK | http://autobuild.buildroot.net/results/1e5a79cf4e8504934a8563af0f89ec3bb842471f |     
   x86_64    |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/2a98a74a83a80f0a73155a0982e286e58ab52761 | ORPH
   armeb     |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/8923c4f4b4c3e1b285c5f26458533f28d364907e | ORPH
   armeb     |          eza-0.18.22           | NOK | http://autobuild.buildroot.net/results/250b1fad70bc8e5c5d948ee5ae74e8db6140a693 |     
 microblaze  |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.net/results/e046a4c824c05ea398a1cdcb88414948a9d851aa |     
   arceb     |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.net/results/aa4831feca3582126484f0d29d840abc56304a0f |     
  riscv32    |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.net/results/82288ee3d95bff2ceb491070e6e1ddd715d3d81e |     
 aarch64_be  |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.net/results/a040cbc991da14c68302062ce96121b1e55c690e |     
  sparc64    |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.net/results/0873bd7065892dd970ca7f1a8e9a517b82f0eeca |     
 powerpc64   |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.net/results/560e6a75e489d5da0ad4b162f7dfbae066daca7d |     
microblazeel |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.net/results/274adb6297785d198bb1778c847f8c7038282ae7 |     
 microblaze  |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.net/results/44e56a4372d04ef56d1d5cf4822832e1941f1b6a |     
  mips64el   |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/ede0f68550b914352a5b39a908230ada5ee56e69 |     
  mips64el   |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/3dc18145351d9261880aadcb20e4e1eb29dd3f09 |     
    arm      |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/af12825ddacf2a7e3a5103751c3317ae0eb72942 |     
   mipsel    |    freeradius-server-3.2.3     | NOK | http://autobuild.buildroot.net/results/c0170b4b7d84effc9c9f24d465d0c15e539812b1 |     
 microblaze  |           gdal-3.8.2           | NOK | http://autobuild.buildroot.net/results/40ef784d12f1f2298bd2d6d5519fa880e598fad2 |     
   sparc     |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.net/results/2474bcc71f57389cc650c83882c471a814936f61 |     
  riscv64    |      gitlab-runner-15.5.0      | NOK | http://autobuild.buildroot.net/results/cdfaaf04f421ad8f6e336b2ab1f2264d83e6a586 |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/a71db30bdc3619173cfb1cbc64d2ecb529381aa2 |     
   s390x     |     gmrender-resurrect-0.1     | NOK | http://autobuild.buildroot.net/results/61817d6602753acf7a11b1c85522ad64131ce5dd |     
 aarch64_be  |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/e526b54f382bd99361027244c579153ef3b60415 |     
 aarch64_be  |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/a2fb606c2c15eed0dc48221a89da9a01cefeeab4 |     
   armeb     |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/92362299d2640dfcdf344d161ca9bcc3365aaedd |     
 aarch64_be  |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/0c612223e7c8eb2044030ea8dd1527d1a780b8e7 |     
   armeb     |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/3f83af0ea3b7652c34ede8c766a16d835b403caa |     
 aarch64_be  |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/007d3b2ed4069260ac1387445f47e211e64b5f9e |     
   nios2     |         gnuplot-6.0.1          | NOK | http://autobuild.buildroot.net/results/271b987b2ad3d163c9d5fb99832364fc7643e6f9 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/e668534f3efaf47e02df4a4de121aacb045579b6 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/1f40f335539f12f53a05d8b939ab289f006837da |     
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/0a20aa65b56f47fefc5af1579ed493bf69b723b3 | ORPH
    i686     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/3e426c5bab5730ab0d5d7c0299403cdec1da676d | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/ad44633fb13ad96dcf6fb9dc9cd3dd906db01087 | ORPH
   x86_64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/72cf4a79a8a3ea2be0cb900e5464c0dff7a51d3b | ORPH
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/d059ba4a8e6daeef5d2e1d64b735be8c7ae658c2 | ORPH
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/43b7257bf54137da566d3e72102d24cacfa5919b | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/90a11ba23942df08e0409a1666d50405c596f69d | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/3abf3c7f2165c1ce40d2921245ee2c81338fb41b | ORPH
microblazeel |           gpsd-3.25            | NOK | http://autobuild.buildroot.net/results/7eada42858192fb5be6745270ed12b1603a7b0c1 |     
    i686     |           gpsd-3.25            | NOK | http://autobuild.buildroot.net/results/dac0f36aad7be5b8ad3c9b035fde7a83eaa9f5f3 |     
  aarch64    |         highway-1.2.0          | NOK | http://autobuild.buildroot.net/results/44b0f2570127bc7bf148250d0b3f49dcad615df8 |     
   armeb     |       host-binutils-2.42       | NOK | http://autobuild.buildroot.net/results/407ded28ba1ec8ae2491342d56e31857c2f15f52 |     
    mips     |       host-binutils-2.42       | NOK | http://autobuild.buildroot.net/results/3691369f15b990e43daed60fa0daf33d64a75613 |     
    or1k     | host-binutils-bare-metal-2.42  | NOK | http://autobuild.buildroot.net/results/59ee2885e3803d8e71f0b6a6cc32798a516380e4 |     
   nios2     | host-binutils-bare-metal-2.42  | NOK | http://autobuild.buildroot.net/results/8f1a3d2a7ad67e3842db70e286cf42feb521739c |     
  mips64el   | host-binutils-bare-metal-2.42  | NOK | http://autobuild.buildroot.net/results/590a322d4e73ee97cf4dec216cf59856ccab85a6 |     
  mips64el   |       host-delve-1.22.1        | NOK | http://autobuild.buildroot.net/results/8509b552c8e9a2bbd66a3d38d3e937502b0a375c |     
  riscv64    |       host-delve-1.22.1        | NOK | http://autobuild.buildroot.net/results/17917756d0c7f5df2005ea9f8a9f1ff8a5635810 |     
 powerpc64   | host-go-bootstrap-stage1-1.... | NOK | http://autobuild.buildroot.net/results/d14e4b0fa8705dbce0a1a05014f77600490ff832 |     
    arc      | host-go-bootstrap-stage1-1.... | NOK | http://autobuild.buildroot.net/results/f6018ba5ae2537ffb8ed52ec9aac38e1c6d90e04 |     
   sparc     | host-go-bootstrap-stage2-1.... | NOK | http://autobuild.buildroot.net/results/c951a10ed3cffc73c56b214d5d2a629c75244d4b |     
    arc      | host-go-bootstrap-stage3-1.... | NOK | http://autobuild.buildroot.net/results/9994b4baabbcbc1c1f1d08a747b4484da6593ec3 |     
    arm      |          host-go-src           | NOK | http://autobuild.buildroot.net/results/30bbd2c83a528f28d2d966559c69168190c5bb41 |     
 aarch64_be  | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/7ef5d01c68bacaaaa29b520aeea4683bf55dffde | ORPH
microblazeel | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/871d1187f1701d4ba48cf630330180d74eee6994 | ORPH
  mips64el   | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/ffe99fceeac01a97ec9df403273928cb356c6190 | ORPH
  powerpc    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/596a8ace0397093f5ee96492c3b78f06ec4f1a26 | ORPH
   sparc     |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/2b4eeea251fb57ce7348142e88370a40d46b0eb5 |     
 microblaze  |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/05e9edc4d0d6b52d4234fa2bacaa6ae807f2a093 |     
   nios2     |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/69d56d9143c730b6458aa2d3146f0428f0092198 |     
   mipsel    |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/71a73a7034010b6e9f07748f054c0f1dae994746 |     
    m68k     |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/39d9b0ae3f8af1b2599e2d889bbc2f24b06e545c |     
    i586     |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/8c471a030302b520892e1947541ff3fb4799b9d7 |     
  riscv64    |   host-moby-buildkit-0.11.6    | NOK | http://autobuild.buildroot.net/results/19b4c561e669805a52ff12e42ace2f6c2efa3bc5 |     
   mips64    |   host-moby-buildkit-0.11.6    | NOK | http://autobuild.buildroot.net/results/aa466eec5b56363dc66f582c1266cd415030941e |     
  mips64el   |        host-runc-1.1.12        | NOK | http://autobuild.buildroot.net/results/7ead10cd0d2f00d7dd172dbe0bdd715197792e8b |     
   mips64    |        host-runc-1.1.12        | NOK | http://autobuild.buildroot.net/results/56eb098d1c024dc6f707e7bd663151e75f05872b |     
  riscv64    |        host-runc-1.1.12        | NOK | http://autobuild.buildroot.net/results/13282dbcc3e48f705488a7db74b984b08a54ad70 |     
   armeb     |        host-rust-1.79.0        | NOK | http://autobuild.buildroot.net/results/16f1c1c47f3a5ef0f2aa3d6521dd926b8fb48b6c |     
  riscv64    |       host-skopeo-1.13.3       | NOK | http://autobuild.buildroot.net/results/b2fdb917c19e723da959acf544c3b5e575a73ec0 |     
    m68k     | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/60d1e2d01e7a622ead6b6be52be05b1b7ef5888a | ORPH
 microblaze  | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/5306c6a468f7dfe868b2ffa4d233ece725be62b4 | ORPH
 aarch64_be  | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/6a95c5e65776bc8549a5a714cf8e93879987291e | ORPH
  sparc64    | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/6ef24a6efab7c9f4a8193d2df559fc0896d1fa3b | ORPH
  mips64el   | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/2362ee217d52679e8981b727aa37bf0b4d241f06 | ORPH
  sparc64    | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/52177089b70b9db796bac71b0390238f24fcd711 |     
  mips64el   | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/d2c71f193c466d804c740cbc4d4236f567707b0d |     
   nios2     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/acbcf7e588ecc21f9def986e509a290070576559 |     
   mips64    | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/a49ebba6e8431488451dc3a0debb63b951133a7d |     
 powerpc64   | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/20653e437acc26b4ea90a82fb1e8ad3fe3820127 |     
   sparc     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/c8f9eaca7efd0a4edf96c85a7256489ce6ffedf6 |     
   armeb     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/13e9755af3b7f2b70565140f8fbfa82e7e2ea955 |     
    sh4a     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/be1991c84b1fc5d3b4fb31596ec27feb6f869304 |     
    arc      | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/78b67148c41be471422d09c9e0934023f0ca9513 |     
   s390x     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/ca95da531cb97037dfdb486c1a41bc5f3e476701 |     
 aarch64_be  | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/f38dd2b4328f84c9dc6c7f1f69e72724a8275581 |     
   sh4eb     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/b0379988e9278f87a1fed8d160f94f80fe3c7c17 |     
   mipsel    | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/6f89b4ad119237ee105a56af2ecbfcef3d4dc40d |     
   sh4aeb    |       igd2-for-linux-2.2       | NOK | http://autobuild.buildroot.net/results/72dbab52a2769d74c7fee29b267bcc2a3fd03d38 |     
    i586     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/8985c0ddafc930778c4c7e01c2b992609b0f2600 |     
    m68k     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/b12624d4e4fbec2ba7c0def4b8fa39bb8461ea5e |     
   s390x     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/80ba144e0144328f53fa2da9cb7fd71205221ead |     
  aarch64    |        iproute2-6.10.0         | NOK | http://autobuild.buildroot.net/results/464818b5cb260fc4595b8c26019af34f01d1e8ec |     
 microblaze  |        iproute2-6.10.0         | NOK | http://autobuild.buildroot.net/results/0e507bf8b022de54e81090058d7c4f200da34b2e |     
  aarch64    |        iproute2-6.10.0         | NOK | http://autobuild.buildroot.net/results/33fde96bd44fb67ec1524c159f3bf7e63eaad4a2 |     
   mips64    |    libabseil-cpp-20230802.1    | NOK | http://autobuild.buildroot.net/results/c0c25f99e8a5b8892cfa20b77c3b30401ab6fefd |     
    i686     |         libcuefile-475         | NOK | http://autobuild.buildroot.net/results/adaf672b0e38589761f57fa7b68895c73db9c750 | ORPH
   nios2     | libdbi-drivers-0bfae6c43134... | NOK | http://autobuild.buildroot.net/results/aca6a47446237449243081557a0c435709bd7d38 |     
    mips     |         libesmtp-1.1.0         | NOK | http://autobuild.buildroot.net/results/a4eb8aa9d5568a9d3a228c08d4b455023ff420a4 | ORPH
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/af8e52e0bf828fab46f90ffe0dacd5c3e16991b8 |     
    or1k     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/1f663c47c639746690086083a0f3a60614ca5862 |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/6b09b49b1014c6e0d6de650662d943ab925b16e4 |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/1bb483a8be638cdd375df3d5ae61fdfd71df39ff |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/9548e2ef019fa31ba225becd65b9509de559714c |     
  riscv32    |       libgpg-error-1.50        | NOK | http://autobuild.buildroot.net/results/cad29fdb8d77955b59954110513be1141bcfdc55 | ORPH
    m68k     |       libgpg-error-1.50        | NOK | http://autobuild.buildroot.net/results/fc30c392d0d26875dd8b4f0d0dab1865f3fb36c4 | ORPH
    mips     |      libmaxminddb-1.10.0       | NOK | http://autobuild.buildroot.net/results/6cac3d5eafd0488675d50a3e3463e9b653256272 |     
   armeb     |          libnss-3.103          | NOK | http://autobuild.buildroot.net/results/2ea7ea5e89c95e7c9af6252a8a42f32740920d77 |     
    m68k     |          libnss-3.103          | NOK | http://autobuild.buildroot.net/results/5ebaf2d73e100825eee06c3374e1e856621e9dc4 |     
  powerpc    |          libnss-3.103          | NOK | http://autobuild.buildroot.net/results/27dce2850c4d1fa54021d4962f0adb610fcdca8e |     
 aarch64_be  |      libzenoh-pico-0.11.0      | NOK | http://autobuild.buildroot.net/results/a217368fd14d2696a590e0b9b0bf7a11ed8bc8be |     
 microblaze  |      libzenoh-pico-0.11.0      | NOK | http://autobuild.buildroot.net/results/4e4ab00cc1985705bf07eab22d990fbd75736852 |     
  sparc64    |        lighttpd-1.4.76         | NOK | http://autobuild.buildroot.net/results/58dacf63e42111a64e3ba299a0c5298378c450da | ORPH
   mipsel    |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/a99ea345c8ef38e7fd1394b59aa66db4031dfdea | ORPH
    sh4      |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/46ad4600c77c9a8a35b002ad144bfa50c0b08d43 | ORPH
    sh4      |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/94cc18c99473dfec6d68d4606ee3bd999c8993e7 | ORPH
    arc      |          linux-6.10.3          | NOK | http://autobuild.buildroot.net/results/d9b1f493b825d6a0a203627c94076429c9664a1b | ORPH
   mips64    |          linux-6.10.3          | NOK | http://autobuild.buildroot.net/results/06469875c107c2dd36cd0af8f8df9b422becdaef | ORPH
   mips64    |          linux-6.10.3          | NOK | http://autobuild.buildroot.net/results/507ab8be70646ec89cbbca4361526d41eb3d2318 | ORPH
  mips64el   |          linux-6.10.3          | NOK | http://autobuild.buildroot.net/results/17dd58880f7a1ac15a94059953bec85049a2c1a1 | ORPH
   mips64    |          linux-6.10.3          | NOK | http://autobuild.buildroot.net/results/b934d4b0af34bca096f0b178accef78945f14865 | ORPH
microblazeel |          linux-tools           | NOK | http://autobuild.buildroot.net/results/487d6c0519edbeeeb27b39c5674771a5476be44c | ORPH
  sparc64    |     ltp-testsuite-20240524     | NOK | http://autobuild.buildroot.net/results/c2b8561d9ae4ba58af4b099a510b62fcbc3fed75 |     
 aarch64_be  |       luaossl-20220711-0       | NOK | http://autobuild.buildroot.net/results/a816bbf9f4983b3ea417d901704d62373cf0c1a2 |     
    or1k     |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/3106928a2d6b32acfb075a2840cf549a81784270 | ORPH
  aarch64    |      mediastreamer-4.4.8       | NOK | http://autobuild.buildroot.net/results/7599b713bcdb8eb7fb280c75230e61c5d731b0ee | ORPH
   x86_64    |         memtest86-6.20         | NOK | http://autobuild.buildroot.net/results/e055255666b28fcec24ca4e1a22a024274d74f32 |     
   x86_64    |          mender-3.4.0          | NOK | http://autobuild.buildroot.net/results/ef66e0f4f2d8ba466f4e2be831add9174bbc0e57 |     
  riscv64    |           ncmpc-0.49           | NOK | http://autobuild.buildroot.net/results/fa6a0fe97587203493d09effda5210775b56e6da |     
   xtensa    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/6172bb821286ec7d13cfdbf42371f1d4c9c9fde3 | ORPH
 powerpc64   |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/28b641a79ca099c3dca21692374441e726c05335 | ORPH
powerpc64le  |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/85f1f8bbe31643cf6269d791fafde8617d1cb259 | ORPH
   arceb     |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.net/results/c6a89c1b264064fe22c3e92703663e45fdec15f1 |     
    arc      |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.net/results/c1a73559cdfab9bc71c2a621f758c7fc1c6c3e7d |     
  mips64el   |        openblas-0.3.27         | NOK | http://autobuild.buildroot.net/results/65888da004899dae5f36bd6bc0aee0233a0aaa6d |     
   mips64    |         openssh-9.8p1          | NOK | http://autobuild.buildroot.net/results/d5d81a6f5ffb1c969ea94eb51a32cf140f35dbad | ORPH
   mips64    |         openssh-9.8p1          | NOK | http://autobuild.buildroot.net/results/591b47f6c6bba134d18dccbe20bd7f3512e27f99 | ORPH
   armeb     |       parsec-tool-0.7.0        | NOK | http://autobuild.buildroot.net/results/c7e007867210609179926c3c677334f55f2aa4c6 |     
 microblaze  |        pcsc-lite-2.1.0         | NOK | http://autobuild.buildroot.net/results/7e413a1dfffdbff090943efb507d63c0d4a12744 | ORPH
 aarch64_be  |         pixman-0.42.2          | NOK | http://autobuild.buildroot.net/results/9bb1f22b534d765cf6dc49df95fbf31c25fe942e | ORPH
    or1k     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/0315815998bfa5b7b338c905e81d3cc58c813657 | ORPH
 aarch64_be  |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/67885f32f66eccfdbeaa2e558bd80a5ab0d2fd04 |     
 powerpc64   |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/0374fb6c32a71f3c57c6352a91e96fe080a0e5d4 |     
  aarch64    |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/f1830b9e768c19a44a3977e534f5d0ccca665650 |     
    i686     |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/aedabc449303dcb381c692c48cb4faf976fc0f0f |     
 powerpc64   |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/29b5fa66fb149e3e70539c12e3ba87ec7847b949 |     
 aarch64_be  |      python-daemon-3.0.1       | NOK | http://autobuild.buildroot.net/results/e2ebdff0f61ff744dee54d626eaf970b30c71cd1 |     
 aarch64_be  |      python-grpcio-1.60.0      | NOK | http://autobuild.buildroot.net/results/406e27ed7e89cd717c449fb6058b279eee2102cb |     
   mipsel    |      python-numpy-1.25.0       | NOK | http://autobuild.buildroot.net/results/0c10f11ec26dbaf7cc929b3ba7acac695c0ae11b |     
powerpc64le  |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/da5286a7e8f91a9e80281cc00bb719de23905504 |     
 aarch64_be  |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/ed239443c3e4edae63bdd179f3f52d8c719ee66a |     
microblazeel |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/b5e8adf439cbd584fe473550db06118f456e9b88 |     
   mipsel    |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/57f155bed2e385a045a408121d6609265e99afc1 |     
 aarch64_be  |       python-scapy-2.5.0       | NOK | http://autobuild.buildroot.net/results/636d1b217f29060a19c03f391d65bb033adbe6db |     
   mipsel    | python-unittest-xml-reporti... | NOK | http://autobuild.buildroot.net/results/f54df8f57d00fd3e705d6d91acff3d2ff828c005 |     
   mipsel    |         python3-3.12.4         | NOK | http://autobuild.buildroot.net/results/864f2739e934a83e67752e18fa51411b243d16b4 |     
  mips64el   |         qt6base-6.7.2          | NOK | http://autobuild.buildroot.net/results/5d20de998d042ab6842f73d89102f104e07e42ef |     
    i686     |         qt6base-6.7.2          | NOK | http://autobuild.buildroot.net/results/2f3ed8cb425b84c36533835ec3e1418f4c3c1caf |     
 aarch64_be  |          rauc-1.11.3           | NOK | http://autobuild.buildroot.net/results/240fe32f7335c7c5a5944bc8e456e5422aa222ec |     
   xtensa    |         s6-dns-2.3.7.2         | NOK | http://autobuild.buildroot.net/results/11c1469a98f362f03f91fdd79cdfc76695c9c7a9 |     
   sh4eb     |       sofia-sip-1.13.17        | NOK | http://autobuild.buildroot.net/results/a40c7331e840d66d0d4e2793ec9d9b87095fa62d |     
  mips64el   |         sqlite-3.46.0          | NOK | http://autobuild.buildroot.net/results/ec0aa597094251db0f77f581918f7bcfde257429 |     
    arm      |          swipl-9.2.6           | NOK | http://autobuild.buildroot.net/results/5bef16d8ec31300ef0c25f67388f3ab5c22eea3b |     
  sparc64    |          swipl-9.2.6           | NOK | http://autobuild.buildroot.net/results/cb57de697b74eb4fb8968f7a1e327c80fe85a3c9 |     
powerpc64le  |          swipl-9.2.6           | NOK | http://autobuild.buildroot.net/results/8fa7b2edc64e6f31afe16d8739bd4d8face9c96a |     
    m68k     |          swipl-9.2.6           | NOK | http://autobuild.buildroot.net/results/bc65a70b078351cbd3f1a374e40ca6c92d7da7da |     
    m68k     |         systemd-256.4          | NOK | http://autobuild.buildroot.net/results/ac1ef84788f878206ce1a4e74a60100926f0851c |     
    i686     |         systemd-256.4          | NOK | http://autobuild.buildroot.net/results/99cdd3c0ae5b2dd9cec5ee7994848ca766907b9f |     
   mipsel    |        tipidee-0.0.5.0         | NOK | http://autobuild.buildroot.net/results/7b39baab8ebc9622db172a348c36a30283ac11bd |     
    i686     |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/07fc33a0b883f3e6a7a6883cdd51acbdc29ce57c | ORPH
    mips     |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/a045c2275da5f1f38d520c1815001fbe30d9ef7d | ORPH
    mips     |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/ca80221d1596c0970a94ee66067dd99eb73fed56 | ORPH
   arceb     |         uclibc-1.0.49          | NOK | http://autobuild.buildroot.net/results/11b0a598f86987f6171bb48352b851da2437afeb |     
  riscv32    |         uclibc-1.0.49          | NOK | http://autobuild.buildroot.net/results/a660b3500ce03386184d657844a8963fd79b47a1 |     
powerpc64le  |           uftp-5.0.3           | NOK | http://autobuild.buildroot.net/results/7dadc662e0a6642e40831a93b788e959498d8923 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/e55e4668bb975143647ae434ae05ca41b9585eb0 |     
 microblaze  |      v4l2loopback-0.12.7       | NOK | http://autobuild.buildroot.net/results/7521e36af7e50784989b088e452baabd098ad8c4 |     
    i686     |        valgrind-3.23.0         | NOK | http://autobuild.buildroot.net/results/c256e9a3c1469646b6b883b13d28c7a9dc964e8f | ORPH
  mips64el   |         wolfssl-5.7.2          | NOK | http://autobuild.buildroot.net/results/c1fed8f606eaf8749d9b73a4d9e1f4f380aa02c4 |     
   mips64    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/62a1124991b0c72c28f820a88cced30969d076b5 |     
    arc      |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/104924a9188d0183a88e9b974e2be55d5564b2a0 |     
   s390x     |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/af82e002fedef2ae3deb4e35095449097fef6564 |     
 microblaze  |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/c1282e211586cb66dc098866ad5c5643ef09573b |     
    mips     |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/3cacaa298c433c768eaa9f1fff74d32c0e4d8451 |     
  powerpc    |         zlib-ng-2.1.6          | NOK | http://autobuild.buildroot.net/results/8697815abe6a7e4244eebb43d0d653abd202c06c | ORPH


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                   botan-3.3.0 | 1 
                 coreutils-9.3 | 1 
                  fbterm-1.7.0 | 1 
           ghostscript-10.03.1 | 1 
                gnuplot-5.4.10 | 1 
host-vboot-utils-bbdd62f9b0... | 1 
                libressl-3.8.4 | 1 
                    mpv-0.35.1 | 1 
      qt5webkit-5.212.0-alpha4 | 1 
             sofia-sip-1.13.17 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |          botan-3.3.0           | NOK | http://autobuild.buildroot.net/results/90b4d4c2220f0752723c06e845a547b3dc518ed8 | ORPH
   xtensa    |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/38742e10897ef5e829bb7839f500d1112090a9a8 | ORPH
 aarch64_be  |          fbterm-1.7.0          | NOK | http://autobuild.buildroot.net/results/a80069bf7042e3fe163efeffe3e65524ab11f40e | ORPH
    arm      |      ghostscript-10.03.1       | NOK | http://autobuild.buildroot.net/results/c4f07e35d6e2657321abfc85e1f5380d978cd79c |     
  powerpc    |         gnuplot-5.4.10         | NOK | http://autobuild.buildroot.net/results/52e80dc7fe69a06126024194c7f24d29e4ac0f2a |     
    arm      | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/a5b539977a1d26cb2c469a8239e32cbb7cf847b3 |     
    m68k     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/77b25c77e15fda173384c5ae9a27a6d4d1186733 | ORPH
  aarch64    |           mpv-0.35.1           | NOK | http://autobuild.buildroot.net/results/f0e48f7f6d37d8fbe665cbef5c42f25b02dd22e2 |     
   mipsel    |    qt5webkit-5.212.0-alpha4    | NOK | http://autobuild.buildroot.net/results/eaec71ae9c2522edb75a2ea9696f39b8bb4d6a4a |     
  aarch64    |       sofia-sip-1.13.17        | NOK | http://autobuild.buildroot.net/results/10bd9effba2048f8277989f0f3674efec51685dc |     
  riscv64    |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/43c8fe959eb9326fe210435481ff6ca1189b5cd0 |     


Classification of failures by reason for 2024.05.x
--------------------------------------------------

aubio-152d6819b360c2e7b379e... | 1 
           ghostscript-10.03.1 | 1 
ibm-sw-tpm2-5452af422edeff7... | 1 
               tcf-agent-1.8.0 | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.net/results/6fccb38ff832185b532ef50ea6399704e838558a |     
    arm      |      ghostscript-10.03.1       | NOK | http://autobuild.buildroot.net/results/834c76cf008cc6a5661f549c1a44aa386b37826b |     
  riscv32    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/0a9f0db5ddb2112539f98e07f4f41c3cd5fa0fe3 |     
    arm      |        tcf-agent-1.8.0         | NOK | http://autobuild.buildroot.net/results/976ccc8299487df596676a3845665628e58ca870 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
