Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 742CFC3DA61
	for <buildroot@archiver.kernel.org>; Wed, 24 Jul 2024 04:45:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46F826086B;
	Wed, 24 Jul 2024 04:45:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EAkAEuLpOnw2; Wed, 24 Jul 2024 04:45:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 347C360818
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 347C360818;
	Wed, 24 Jul 2024 04:45:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 142571BF25F
 for <buildroot@lists.busybox.net>; Wed, 24 Jul 2024 04:45:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E9AB680B6C
 for <buildroot@lists.busybox.net>; Wed, 24 Jul 2024 04:45:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XhWIzPmYkI3W for <buildroot@lists.busybox.net>;
 Wed, 24 Jul 2024 04:45:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 52AA780B8F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 52AA780B8F
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 52AA780B8F
 for <buildroot@buildroot.org>; Wed, 24 Jul 2024 04:45:24 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 26CFD40004
 for <buildroot@buildroot.org>; Wed, 24 Jul 2024 04:45:22 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Wed, 24 Jul 2024 04:45:22 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1721796322; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=L1wY/6MO527TOtrdMXJF6nPOUuBGYekoJAbKQA4rkfE=;
 b=RKphHnMKE6g10eewMHgkthMlezUn0lFxrBYPStzJBW6xPfwRju2+zL+G8gJo7Ugnk7NzZj
 bB9JqLapLYV9UUrGH0W9tTRLpD5OmZIcUAtZd3aLNLIa9o5+7p6lEMNsrt+G7zQM0T4e+B
 5QgLdm9GDYhXaH5lhQnr6vHWYOX25sL4QXzJqZg4JkF7k1DNagQdDxzaqGlaSwVDTEaZ2L
 L3aIj9m3LauFBUKL1336rxjKmQnn+owdlYBktOGOFvn42ssZ3HsH5lbgcUSNknu9ja4dJ0
 Faay/qNRbZph+MOpmXCuBt38slK/3KIxIL27Aot9EDoYIZ9dhZkte6ReUyWLfA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RKphHnMK
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-07-23
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
Message-ID: <20240724044522.sQAEkVhPaiAwPvMCc5kfSmTuywmtD14FLL486EqSJbg@z>

Hello,

Autobuild statistics for 2024-07-23
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  | 14  | 146 |  1  | 161 |
  2024.05.x  |  6  | 150 |  0  | 156 |
    master   | 86  | 222 |  1  | 309 |

Classification of failures by reason for master
-----------------------------------------------

           host-systemd-254.13 | 15
                  bcusdk-0.0.5 | 10
                elfutils-0.189 | 9 
                host-odb-2.4.0 | 8 
                espflash-3.1.0 | 6 
                     avahi-0.8 | 5 
                gnu-efi-3.0.18 | 5 
                    norm-1.5.8 | 5 
host-heimdal-f4faaeaba371ff... | 4 
 host-softether-4.30-9700-beta | 4 
host-vboot-utils-bbdd62f9b0... | 4 
               lighttpd-1.4.76 | 4 
                   linux-6.9.8 | 4 
glibc-2.39-74-g198632a05f6c... | 3 
             gtkiostream-1.8.0 | 3 
     host-python-maturin-1.7.0 | 3 
                libressl-3.8.4 | 3 
                  mender-3.4.0 | 3 
           python-daemon-3.0.1 | 3 
         python-remi-2022.7.27 | 3 
                s6-dns-2.3.7.2 | 3 
aer-inject-9bd5e2c7886fca72... | 2 
                 chicken-5.3.0 | 2 
                 coreutils-9.3 | 2 
                    dust-0.9.0 | 2 
                  fbdump-0.4.2 | 2 
                  fbterm-1.7.0 | 2 
                  ffmpeg-6.1.1 | 2 
              fluent-bit-3.1.3 | 2 
                gerbera-1.12.1 | 2 
                 gnuplot-6.0.1 | 2 
  gobject-introspection-1.76.1 | 2 
             host-delve-1.22.1 | 2 
     host-moby-buildkit-0.11.6 | 2 
          libcamera-apps-1.2.1 | 2 
                  libdex-0.6.1 | 2 
               libglib2-2.76.1 | 2 
                  libsepol-3.6 | 2 
               libvorbis-1.3.7 | 2 
                nushell-0.85.0 | 2 
                 openssh-9.8p1 | 2 
                       unknown | 2 
                      xz-5.6.2 | 2 
               zxing-cpp-2.2.1 | 2 
android-tools-4.2.2+git2013... | 1 
                 apache-2.4.61 | 1 
                apr-util-1.6.3 | 1 
                 augeas-1.14.1 | 1 
                    bat-0.24.0 | 1 
                  bind-9.16.48 | 1 
                   bird-2.0.12 | 1 
              cache-calibrator | 1 
                  cairo-1.18.0 | 1 
                  clang-15.0.3 | 1 
               collectd-5.12.0 | 1 
cwiid-fadf11e89b579bcc0336a... | 1 
                 dc3dd-7.2.641 | 1 
      docker-cli-buildx-0.16.1 | 1 
dvb-apps-3d43b280298c39a67d... | 1 
               ebtables-2.0.11 | 1 
                 erlang-26.0.2 | 1 
                  eudev-3.2.14 | 1 
              fftw-quad-3.3.10 | 1 
                     file-5.45 | 1 
              fluent-bit-3.0.4 | 1 
                  gamin-0.1.10 | 1 
                      gdb-14.2 | 1 
            gdk-pixbuf-2.42.10 | 1 
         gobject-introspection | 1 
 host-binutils-bare-metal-2.42 | 1 
host-go-bootstrap-stage3-1.... | 1 
         host-libxcrypt-4.4.36 | 1 
              host-runc-1.1.12 | 1 
              host-rust-1.79.0 | 1 
                    htop-3.3.0 | 1 
               ipmitool-1_8_19 | 1 
           janus-gateway-1.1.2 | 1 
                       kmod-31 | 1 
                  ledmon-1.0.0 | 1 
                libcuefile-475 | 1 
               libdeflate-1.20 | 1 
                  libffi-3.4.6 | 1 
              libgcrypt-1.11.0 | 1 
                libglvnd-1.4.0 | 1 
                librsvg-2.50.9 | 1 
   libtorrent-rasterbar-1.2.19 | 1 
                libvips-8.10.6 | 1 
                libxml2-2.12.6 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                   linux-tools | 1 
          moby-buildkit-0.11.6 | 1 
                     mtd-2.2.0 | 1 
                    ncmpc-0.49 | 1 
                  ntp-4.2.8p18 | 1 
               openblas-0.3.27 | 1 
                      opus-1.4 | 1 
             parsec-tool-0.7.0 | 1 
               pcsc-lite-2.1.0 | 1 
              procps-ng-3.3.17 | 1 
procrank_linux-21c30ab4514a... | 1 
               pulseaudio-17.0 | 1 
      python-autocommand-2.2.2 | 1 
          python-grpcio-1.60.0 | 1 
                python3-3.12.4 | 1 
            quickjs-2024-01-13 | 1 
               quotatool-1.6.2 | 1 
rtl8189fs-9a82349c2c40515f9... | 1 
                    rtty-8.1.0 | 1 
             sofia-sip-1.13.17 | 1 
                   speex-1.2.1 | 1 
               tipidee-0.0.5.0 | 1 
                    xen-4.14.6 | 1 
                xenomai-3.0.10 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/c899d07f3990ef32ebbd57bf05f9392d3243de00 | ORPH
 aarch64_be  | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/91ef545dd56cb4eeb3d7a02008d7ee3393ed89f7 | ORPH
   arceb     | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/1711a76a0cea810e4a788da7d83f42097611ea7b |     
  sparc64    |         apache-2.4.61          | NOK | http://autobuild.buildroot.net/results/568a988c7f2e65925c736be9a92b83df8179821e |     
microblazeel |         apr-util-1.6.3         | NOK | http://autobuild.buildroot.net/results/94f6cf314984f7473775938e3ca324e677a09883 |     
  riscv64    |         augeas-1.14.1          | NOK | http://autobuild.buildroot.net/results/f567622b407a39f3883ece6249d76e3d8b640301 | ORPH
   mipsel    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/206709116e9411ca390b0cae4dc71695ec5803c3 | ORPH
  aarch64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/2f76b95ab3dd6f3c82292cc7d4fb60edb3bd9ab6 | ORPH
microblazeel |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/2ea4c62d99cd5fb014898991d661aeab09e8bb82 | ORPH
   x86_64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/56be1f61f1e1e047de2c7cf72f9c43eb84dd732f | ORPH
  riscv32    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/6ab8d005bd9a0b86c3d44d9d1a2371b5f911e42f | ORPH
    i686     |           bat-0.24.0           | NOK | http://autobuild.buildroot.net/results/e96f58a31530b9b8d1a7c04a85069b9301fdda12 |     
powerpc64le  |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/39f1344eef3b06744321cf8bc3ca28b9b77c59dd |     
    or1k     |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/2bf5efec5fcdb7225b8ddaf50885e7edca1cc34c |     
   s390x     |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/60175831cdd089fb80084c6945d1dce48a119fd1 |     
   sparc     |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/35f6d5a4b6ecfb36925cb2e07f6022f4d092d57b |     
 aarch64_be  |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/7543209b9b27b63e4e4587f71968d0fe993ce54d |     
   xtensa    |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/445e9d752a073ee5084d1e2cc28d6cf941f3b43d |     
powerpc64le  |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/c05c55ca44aabc086983e4c8eb08bb26d7247f60 |     
  riscv64    |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/29dce4dd5609f894c2816314e14204780663fac1 |     
    arc      |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/91d6d5ff47c19f977ab84b18852a95d00ac1a7a7 |     
    sh4      |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/81eb51136513b11f94f832235dc8902c2ef176ae |     
   x86_64    |          bind-9.16.48          | NOK | http://autobuild.buildroot.net/results/d9afd887c8dc754ea02e3cac8af61adab3ab14c9 | ORPH
  riscv64    |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/b4a769429357a04a22ac5c83d5375c7e3820be4c |     
    mips     |        cache-calibrator        | NOK | http://autobuild.buildroot.net/results/ce26b55b52428984cb4a2fca7b4ff73944d7a3af |     
    arm      |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/6ac52cdf3554876b623a1808eb7e8ba38a7888a5 |     
    or1k     |         chicken-5.3.0          | NOK | http://autobuild.buildroot.net/results/0b8efe1ad71f0689aa0b19f59f915fe0bb3480a0 |     
   xtensa    |         chicken-5.3.0          | NOK | http://autobuild.buildroot.net/results/8ed6a2e8f002e8d7356c0449b09928704213e6b7 |     
  riscv32    |          clang-15.0.3          | NOK | http://autobuild.buildroot.net/results/791c2dd79cf22c37e390c5492c0fe6e6612f4279 |     
   sparc     |        collectd-5.12.0         | NOK | http://autobuild.buildroot.net/results/5ba16a25d70d53196567684080c3a47ca085966b |     
   nios2     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/35625253357ac575c03ea3ba9348c435be328162 | ORPH
   xtensa    |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/f48b1529439a871b3ff8b383e261c52ba56fc851 | ORPH
  sparc64    | cwiid-fadf11e89b579bcc0336a... | NOK | http://autobuild.buildroot.net/results/a3bde74ff2137d088f4261e62930859bfe460cb9 |     
   sparc     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/6d4e39f11176e26d2f79dfaa01ce1d15f8823c8f | ORPH
    i686     |    docker-cli-buildx-0.16.1    | NOK | http://autobuild.buildroot.net/results/28475e7ed107531837a3615997fd4456b2c53eec | ORPH
   armeb     |           dust-0.9.0           | NOK | http://autobuild.buildroot.net/results/eaaf426a5f7a1742e0836781c26c473ff70e1992 | ORPH
    arm      |           dust-0.9.0           | NOK | http://autobuild.buildroot.net/results/b3a5ee719ee015fec26ccbc1b28d97d188a0320d | ORPH
    sh4a     | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/e99b9ebf602d307fbc32f2a367e95177f53a68f9 |     
  sparc64    |        ebtables-2.0.11         | NOK | http://autobuild.buildroot.net/results/ae9b07a88a43b381bd8ce5dca9f434f63e1dcd49 |     
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/f8be22b93c7781540527a9b58f5323bfe32d8753 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/89296c0a42b96d47565db620dbd705e36fe1e381 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/27ee5793734d479c6482f70a67ef4d94665b5bf7 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/12873596ea062a99d200a8e0c381842fdad8112a | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/0e797060ba1d68c389cc9d80864edc3cab8fc488 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/72c1e0ad7f5d1ab966c6168f487ab2316e2265dd | ORPH
   arceb     |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/d278ae4cae718837f8675beec418d46f624fd874 | ORPH
  mips64el   |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/fb9684ecdbb5628c595de350430d63c8927a1c14 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/9c0c78bd1f1b7a23bc63e9dee6b7fa34aeb14412 | ORPH
    i686     |         erlang-26.0.2          | NOK | http://autobuild.buildroot.net/results/03d1bf373cd55143943d93732adee9c24efb6786 |     
    arm      |         espflash-3.1.0         | NOK | http://autobuild.buildroot.net/results/ce0c4be342669f74f94b6cf288fbabeedd14d5f7 |     
  sparc64    |         espflash-3.1.0         | NOK | http://autobuild.buildroot.net/results/e126a85a3e8ac7c3bf9cda92578cc64934b23265 |     
   x86_64    |         espflash-3.1.0         | NOK | http://autobuild.buildroot.net/results/778f6efaa26cb7b0ae4f2a9cea867187e6c82a26 |     
   x86_64    |         espflash-3.1.0         | NOK | http://autobuild.buildroot.net/results/a06fb1380cd07485966a3b13b74d6a9b72990d39 |     
   s390x     |         espflash-3.1.0         | NOK | http://autobuild.buildroot.net/results/f6f20fa2b0591e45558317215ad0de24a02b3805 |     
  sparc64    |         espflash-3.1.0         | NOK | http://autobuild.buildroot.net/results/c5fe55ceb7a2c45e7bcab42bdd605b2df6e4405c |     
   arceb     |          eudev-3.2.14          | NOK | http://autobuild.buildroot.net/results/b6481ac7d5609110e46e7b1b03f448fbffe3b316 |     
   x86_64    |          fbdump-0.4.2          | NOK | http://autobuild.buildroot.net/results/9f16576a2ff1e7864d500cf4c66757ea92ab5241 | ORPH
  riscv32    |          fbdump-0.4.2          | NOK | http://autobuild.buildroot.net/results/5362ee64003bfb68ae5e8f16329838128b1e62da | ORPH
   sparc     |          fbterm-1.7.0          | NOK | http://autobuild.buildroot.net/results/32802b462f57e1d89ff56ca7444630b5bd900dfb | ORPH
    arc      |          fbterm-1.7.0          | NOK | http://autobuild.buildroot.net/results/d39af05dd102882b01a1cd07eca85dd4fe32d4fe | ORPH
    arc      |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/43a0e282699b60daf958459e36d164ea40086061 |     
   armeb     |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/52c3047b02182d977510e7ebec89911186731e40 |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | http://autobuild.buildroot.net/results/679e783af64b4e7c76d6e65eb47026f7f4d5db18 | ORPH
   mips64    |           file-5.45            | NOK | http://autobuild.buildroot.net/results/11d49a1161ada636d776955f4e432507a42d3472 | ORPH
   x86_64    |        fluent-bit-3.0.4        | NOK | http://autobuild.buildroot.net/results/8f9fcc0ec9c915a40fe402d7c643fa83f7f6a261 |     
    i686     |        fluent-bit-3.1.3        | NOK | http://autobuild.buildroot.net/results/7154787827568a2f90fe08d566349c6e1449fb71 |     
    or1k     |        fluent-bit-3.1.3        | NOK | http://autobuild.buildroot.net/results/ae70c40347ac3887d026ea49468f79067f38af7f |     
    mips     |          gamin-0.1.10          | NOK | http://autobuild.buildroot.net/results/b267f53ba6035d256c013dbbbbd1bcdfe0ef111f |     
    m68k     |            gdb-14.2            | NOK | http://autobuild.buildroot.net/results/b8c6af95b244272220c63847e7cc929c9c58eee4 | ORPH
   mips64    |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/5be378b5ff66906c8afcd6f69fcc5792138992fe | ORPH
   x86_64    |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.net/results/93d68d2642a53f913b381528ba585068baa47795 |     
powerpc64le  |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.net/results/fa2dd35f90c25c7c847fad937f0ed6f12f7c0e00 |     
powerpc64le  | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/dbdde75525c7d62c34751653e764256866a1e011 |     
  riscv32    | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/01ea90d5a62581b9111c7de7bb79e2f1599abb40 |     
powerpc64le  | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/8614f3e5cf559990cd54783f2263e427649466cb |     
 aarch64_be  |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/117f1ce7bbc1e2fd85288b5649a9b058c80df814 |     
 aarch64_be  |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/9d2eab31139a742f006bd5a26098b8b72d9d2b18 |     
 aarch64_be  |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/4c9386ab9b2904519ed1c9edcf1c4f9bc03a30de |     
  riscv64    |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/e2461d92df7f4b319b3f1a7cc321f39784977f89 |     
   armeb     |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/3f66f95fcf0edb57fa66a376d6b1179faf818299 |     
microblazeel |         gnuplot-6.0.1          | NOK | http://autobuild.buildroot.net/results/581846443b726ad28c55f7dec4cac6e1bd75f6dc |     
   nios2     |         gnuplot-6.0.1          | NOK | http://autobuild.buildroot.net/results/f2140fa153a6fcf140e7c6358235e1387e845264 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/f58526261884aa9b15478bb34a683f601f99c6cd |     
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/95f09f0b29510e1f1e85df6e4293cab139c1293a | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/b0214f4323e9743fe802abc1f2e9bc9f6ed8569f | ORPH
    or1k     |       gtkiostream-1.8.0        | NOK | http://autobuild.buildroot.net/results/0d117205dde37e601a50bfb843207b1e22ab7794 |     
    or1k     |       gtkiostream-1.8.0        | NOK | http://autobuild.buildroot.net/results/f7c644f8a23c6514394fdfd8517e8a298bf10a6f |     
   s390x     |       gtkiostream-1.8.0        | NOK | http://autobuild.buildroot.net/results/3d98a059a8fc30c09566bb0c283bff7e9dcc4090 |     
   mips64    | host-binutils-bare-metal-2.42  | NOK | http://autobuild.buildroot.net/results/b9b55cbe5ff6a2bac20454136ae7452aa41dfbb6 |     
   mips64    |       host-delve-1.22.1        | NOK | http://autobuild.buildroot.net/results/0b85cca314883da792529179a9bc0fb911c3487e |     
powerpc64le  |       host-delve-1.22.1        | NOK | http://autobuild.buildroot.net/results/eab509d12828205be63a1b973afd988be009191a |     
  riscv64    | host-go-bootstrap-stage3-1.... | NOK | http://autobuild.buildroot.net/results/8bbb864bc47a2f5f58a74e873b24e9c1e226a695 |     
   mips64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/5f2c4f86dc73fc91acf08db461e2141c50032da0 | ORPH
 aarch64_be  | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/e6f49167cbeca8348f8ffb50fa7a8ab2a380203d | ORPH
  aarch64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/bb176ff77629fb87b8049c7c65ac9a9a4089656a | ORPH
    or1k     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/016c7f5e5a6bb15d046397db6cc6a215309a68f2 | ORPH
   armeb     |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/3579d72907be7f7f91d4de9511cfffbb6deb07ee |     
  riscv64    |   host-moby-buildkit-0.11.6    | NOK | http://autobuild.buildroot.net/results/a5019a289d3381445db1016ca4c7bea9a26d2542 |     
  aarch64    |   host-moby-buildkit-0.11.6    | NOK | http://autobuild.buildroot.net/results/a68f732d06764615c9e1d4867878f52bec03a54e |     
powerpc64le  |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/9f2dd7b598b9cbc453fd7f8476bbe0ff5df3305e | ORPH
   mipsel    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/47d858ecdd020f1cfdd71c6ace6f1ccea82d8cba | ORPH
   arceb     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/035179072677f6ee16f4a470fd9deb412a92a3a8 | ORPH
  powerpc    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/68361c66b9af57c91c1a41e6ea82b2c782047fce | ORPH
   xtensa    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/484681e52023d28110d234a114fa2966c2328eb6 | ORPH
  powerpc    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/eb345326b1f890e33e49ef3e0622fac2c58c7bab | ORPH
powerpc64le  |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/4c17460f0c1db49a382474e70428baae222c1100 | ORPH
   arceb     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/0b5d8c275b04a05c1ad979c549fdfa362a2d88c7 | ORPH
  aarch64    |   host-python-maturin-1.7.0    | NOK | http://autobuild.buildroot.net/results/201634c139b38556df9278c1d860a0eda8b566f8 |     
  aarch64    |   host-python-maturin-1.7.0    | NOK | http://autobuild.buildroot.net/results/440751997de682e57e908d316a15f3f273ea6bc7 |     
  sparc64    |   host-python-maturin-1.7.0    | NOK | http://autobuild.buildroot.net/results/4591c6788ad577ce62f6bc82ea77f94be832ce04 |     
  mips64el   |        host-runc-1.1.12        | NOK | http://autobuild.buildroot.net/results/c761263c344b1ffd2e411e8a2e41672361b7d30f |     
powerpc64le  |        host-rust-1.79.0        | NOK | http://autobuild.buildroot.net/results/6a4f9f167d03595851ed393b13128e280cc790a0 |     
   x86_64    | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/d37970c364914573410dd66b1e0eaf4b936d3bf2 | ORPH
  sparc64    | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/151a1753e5405738fadd5ada3a869d77e23250c7 | ORPH
   mipsel    | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/55be16769c3a2b8d02a5f7ce439a0478b93a8fd1 | ORPH
 microblaze  | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/cde14d5cdc8e2e4f40459c63f1ed98cb3129c7e1 | ORPH
  sparc64    |      host-systemd-254.13       | NOK | http://autobuild.buildroot.net/results/42b93eb11070376d3e9c1e2743f95f87f3a1922d |     
  sparc64    |      host-systemd-254.13       | NOK | http://autobuild.buildroot.net/results/aff04742273388e3fec1573b315e07ef54d7942e |     
powerpc64le  |      host-systemd-254.13       | NOK | http://autobuild.buildroot.net/results/c67b7e6414368d5003490db23e3e7b3778135c38 |     
   s390x     |      host-systemd-254.13       | NOK | http://autobuild.buildroot.net/results/2aa211d61d17caf74c8966f7e9a8e863d7c15c46 |     
  mips64el   |      host-systemd-254.13       | NOK | http://autobuild.buildroot.net/results/08d4994501652476e23c858e35e030700841adc5 |     
 aarch64_be  |      host-systemd-254.13       | NOK | http://autobuild.buildroot.net/results/9dde069ee3938d8760b20cddd06b1942882264de |     
   sh4eb     |      host-systemd-254.13       | NOK | http://autobuild.buildroot.net/results/e04c05870b456c94b97146fa970c6fa924e61722 |     
   nios2     |      host-systemd-254.13       | NOK | http://autobuild.buildroot.net/results/55654382a4b9013cf088f4695c97440a8528d7d6 |     
   x86_64    |      host-systemd-254.13       | NOK | http://autobuild.buildroot.net/results/4144e553b0b569716e6f4042ee6a19e94d12894c |     
   mipsel    |      host-systemd-254.13       | NOK | http://autobuild.buildroot.net/results/694be9fbc192466151d1428253face60dd2fbcdd |     
   x86_64    |      host-systemd-254.13       | NOK | http://autobuild.buildroot.net/results/9a8e9c009e5e2adfbde8905377983d3b1d6140c6 |     
   nios2     |      host-systemd-254.13       | NOK | http://autobuild.buildroot.net/results/def67a50e9540f7749f92fed9fcbdb78070ce8e1 |     
   sh4aeb    |      host-systemd-254.13       | NOK | http://autobuild.buildroot.net/results/0fc282f7e54b655e76e090951a77d8ad980ee9b8 |     
   xtensa    |      host-systemd-254.13       | NOK | http://autobuild.buildroot.net/results/8dec004b02dea0d48c2522c11b7406cee3e4e49a |     
    i686     |      host-systemd-254.13       | NOK | http://autobuild.buildroot.net/results/195509ce4acff0040b49f2d3757742b3bf32c23b |     
    m68k     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/1910d928eebbb2a9e98f3da62a9abe5557bf8879 |     
   arceb     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/a802a3db994e661b28b548f04eb7338a68155fe2 |     
   sh4aeb    | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/5927f5a93d1dd446deb6532e034c6eab8998d44e |     
  riscv32    | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/69db593d093be434b7043bf43b1c0dd644604d9a |     
   s390x     |           htop-3.3.0           | NOK | http://autobuild.buildroot.net/results/934028eedafffd9710146d77e239a1986d4934ff | ORPH
 powerpc64   |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/c32c6d1941b97bc8afdb2200ffdcdf4f90113407 |     
    mips     |      janus-gateway-1.1.2       | NOK | http://autobuild.buildroot.net/results/7b2429be87b33ca4b8982eecc9d5d802e0868bb8 |     
   mips64    |            kmod-31             | NOK | http://autobuild.buildroot.net/results/580bc81eae18834a96359bce6e4268dc733c59ff |     
   sparc     |          ledmon-1.0.0          | NOK | http://autobuild.buildroot.net/results/8c584504391f913d744aa55bde41be747fcb6e0c |     
    or1k     |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/31a917667b58f04353f2b1bb8c83917b9a6a311c |     
   nios2     |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/18bb6d9c88c1a813a350658b251293744e161916 |     
powerpc64le  |         libcuefile-475         | NOK | http://autobuild.buildroot.net/results/ebdc8327170eedb11babcfa41511c0a4b6220944 | ORPH
  aarch64    |        libdeflate-1.20         | NOK | http://autobuild.buildroot.net/results/f843498e88cba741af7e6e00ec06bdf7b9b0e63f |     
    arm      |          libdex-0.6.1          | NOK | http://autobuild.buildroot.net/results/c5b8b45bb66a9f93e6323f92d9e0473a7190193a |     
  aarch64    |          libdex-0.6.1          | NOK | http://autobuild.buildroot.net/results/5f23b0e41f2957b0562c5d168f35e42f13bdad0b |     
    or1k     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/883b58297b662bef38dd7cb6e5f635d0bf9d3733 |     
  sparc64    |        libgcrypt-1.11.0        | NOK | http://autobuild.buildroot.net/results/3b43c08c9608a3aea4f94531156079049e7a9212 | ORPH
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/8ec2ab3c3aea91a87155bc99d13065f57845b1da |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/0413151355ecd7d1dd9184cffcc3e87d09391496 |     
    m68k     |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/27bb4ce3c1dc0834182559b79e28b2f683251765 | ORPH
   mips64    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/08e2658a03d641e7e19bf71c4d221325195341e1 | ORPH
   mips64    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/722547f96f0c1f9f3e950bff20763dd5bbf48e25 | ORPH
 powerpc64   |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/eefff2cdb7f17d22e7a0bf9a8ed82d97f02f4b48 | ORPH
  aarch64    |         librsvg-2.50.9         | NOK | http://autobuild.buildroot.net/results/6d9393f0e96c37f486ba8e488df6feff8f9958fc |     
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/61b447f86cc5871edde9aebc002f0852e42a1088 |     
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/52dadace1bcdacdedd7548ce91f6f0c20612883c |     
    arm      |  libtorrent-rasterbar-1.2.19   | NOK | http://autobuild.buildroot.net/results/ff1ce83389315232335dbee00a6cd42fd15bdec8 |     
    arc      |         libvips-8.10.6         | NOK | http://autobuild.buildroot.net/results/d456a97404144452275936e3174cfc41d397e92d |     
  powerpc    |        libvorbis-1.3.7         | NOK | http://autobuild.buildroot.net/results/bfe7ba7234a3d25e3af8c4f7852ed1ec7b2ac1f5 |     
  powerpc    |        libvorbis-1.3.7         | NOK | http://autobuild.buildroot.net/results/69db6cafd53af4a306de1d27be0aaadfffce6296 |     
   mips64    |         libxml2-2.12.6         | NOK | http://autobuild.buildroot.net/results/b8fcf42fc01c34d5dec086dc25ae685a5d6c0fd7 |     
   sparc     |        lighttpd-1.4.76         | NOK | http://autobuild.buildroot.net/results/a9d3dd12954e54160ac7d0f99f8cf1234869c14a | ORPH
  sparc64    |        lighttpd-1.4.76         | NOK | http://autobuild.buildroot.net/results/6d19c2f25b395fc3c8f5f236035d5d593c095774 | ORPH
  sparc64    |        lighttpd-1.4.76         | NOK | http://autobuild.buildroot.net/results/e47d9b8111581a2745657bd93010edd30c9d62ac | ORPH
  sparc64    |        lighttpd-1.4.76         | NOK | http://autobuild.buildroot.net/results/7eecae774034e4b1a917b65a33e604e75090ec2d | ORPH
   nios2     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/7f555aa8c511285428d26ba459c8de1a6f57a578 | ORPH
   mipsel    |          linux-6.9.8           | NOK | http://autobuild.buildroot.net/results/8511977c488fe643143520740c0fb3c119f0601f | ORPH
    arm      |          linux-6.9.8           | NOK | http://autobuild.buildroot.net/results/a26ae5748aba4fa6ed69a79d2746b2d8467cdb24 | ORPH
   sh4aeb    |          linux-6.9.8           | NOK | http://autobuild.buildroot.net/results/a9dfa7f593ed5935b9ae23c641de21d80a769af2 | ORPH
   x86_64    |          linux-6.9.8           | NOK | http://autobuild.buildroot.net/results/23f5c776f0e49566949b1e3459faae8695924991 | ORPH
   mips64    |          linux-tools           | NOK | http://autobuild.buildroot.net/results/2e318c6b604332414f2644fe27d63c8d22f3bd4f | ORPH
   x86_64    |          mender-3.4.0          | NOK | http://autobuild.buildroot.net/results/1c18328e759349b5d3fc33e03916f5f25f398e34 |     
powerpc64le  |          mender-3.4.0          | NOK | http://autobuild.buildroot.net/results/08eb913359ef5ae63b571323d7ee2fe901afc3cd |     
    arm      |          mender-3.4.0          | NOK | http://autobuild.buildroot.net/results/1b60f1c5e1156c7e7aa3b37968247c990585877d |     
    i686     |      moby-buildkit-0.11.6      | NOK | http://autobuild.buildroot.net/results/048868ce947b94e9c14a9df79670e70c6784c70b |     
  powerpc    |           mtd-2.2.0            | NOK | http://autobuild.buildroot.net/results/7cbeead738af6302d5f0048a443e3b57d6776bb2 |     
    arc      |           ncmpc-0.49           | NOK | http://autobuild.buildroot.net/results/d5459a399cac703bdbd243225849b536201ebd59 |     
powerpc64le  |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/3f888f2922b06fefb7379a43a989a27065713fd8 | ORPH
   sh4aeb    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/8037ca278460a34699e3a6bafddc21120eb13c72 | ORPH
powerpc64le  |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/5d94c19399fda1eab3635f495e96ae88f306c7ca | ORPH
   x86_64    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/42df64f9e40ed3af0855663b37c14548e7914a88 | ORPH
   nios2     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/fba74e972314835e56b3b924c93f23270502619f | ORPH
   arceb     |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.net/results/d3a5e007bea53c9ea14b801cdd752635764fa578 |     
    arm      |         nushell-0.85.0         | NOK | http://autobuild.buildroot.net/results/15e586942e311e7cc5b663e8ceecc8eaa53c7eb9 | ORPH
    arm      |         nushell-0.85.0         | NOK | http://autobuild.buildroot.net/results/94e3ae12637ccae95732924dd4f93ce56dc3cec8 | ORPH
   mips64    |        openblas-0.3.27         | NOK | http://autobuild.buildroot.net/results/f50d254fa2adde8fda684ff3f23f6995c0120d36 |     
   mips64    |         openssh-9.8p1          | NOK | http://autobuild.buildroot.net/results/a6014b1d48b124fad092fa7951b4bdbc06cc47b2 | ORPH
powerpc64le  |         openssh-9.8p1          | NOK | http://autobuild.buildroot.net/results/b48b7b0a8bb73a902c65229f251d1bcfa3380076 | ORPH
    arc      |            opus-1.4            | NOK | http://autobuild.buildroot.net/results/9a121fda4d2736197419071b313ff84209fbc906 |     
  sparc64    |       parsec-tool-0.7.0        | NOK | http://autobuild.buildroot.net/results/b8c4fd7d4e68dbfcbfa5e3e48e6973e98907e501 |     
microblazeel |        pcsc-lite-2.1.0         | NOK | http://autobuild.buildroot.net/results/9bf54498a6f7c45b7e97a82b4a227979acd1e816 | ORPH
  aarch64    |        procps-ng-3.3.17        | NOK | http://autobuild.buildroot.net/results/bd7b49123905c580842a3dd3b7a338d5aedf55d7 | ORPH
    arc      | procrank_linux-21c30ab4514a... | NOK | http://autobuild.buildroot.net/results/fb9e8bdcc572d6007702a6e29320e29c7f5e579a | ORPH
    arm      |        pulseaudio-17.0         | NOK | http://autobuild.buildroot.net/results/449bd680800ae6315a5f51780024d0eb0a7ab5ae | ORPH
  aarch64    |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/c9114834eb00569cdb8ec3251ccd5ecfd906c9c9 |     
   nios2     |      python-daemon-3.0.1       | NOK | http://autobuild.buildroot.net/results/a114ba1fbc9c8456ca1033898d58e02741bc38cd |     
   nios2     |      python-daemon-3.0.1       | NOK | http://autobuild.buildroot.net/results/527c9be6a3424d32bda045bc0e8094b4c3c5dc82 |     
   x86_64    |      python-daemon-3.0.1       | NOK | http://autobuild.buildroot.net/results/8c061e0aa1c94dbd29076c3ed1c296c665f2b9aa |     
 aarch64_be  |      python-grpcio-1.60.0      | NOK | http://autobuild.buildroot.net/results/6492dd9f2ce456fc58f46007891d45b58b74acf3 |     
   mips64    |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/fe0223766d8d7b1164a57485f3305881680ad737 |     
   x86_64    |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/03838557dec51dec1e952de24af9d50e64aeb74a |     
   mipsel    |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/2f91d16bc34b8126ac8364ee0b022280d212ac7f |     
  mips64el   |         python3-3.12.4         | NOK | http://autobuild.buildroot.net/results/abb45f215faf80c6ac8bc1ce8b37f6ba25a933df |     
   mipsel    |       quickjs-2024-01-13       | NOK | http://autobuild.buildroot.net/results/27d199eb20003a8b8799ace5e5869bf915324598 |     
  powerpc    |        quotatool-1.6.2         | NOK | http://autobuild.buildroot.net/results/1855bc61fb231fadab77840dcd7ef75c414fe5be | ORPH
 powerpc64   | rtl8189fs-9a82349c2c40515f9... | NOK | http://autobuild.buildroot.net/results/ed98cc4ad12c2b7e582ee2bf419d6c09e2bbcdde |     
   mipsel    |           rtty-8.1.0           | NOK | http://autobuild.buildroot.net/results/382405b421a8ea7b5b3beb553f47fa20427fa3c3 |     
   sparc     |         s6-dns-2.3.7.2         | NOK | http://autobuild.buildroot.net/results/60cda9eb0627bc9dccad2df77ca083f4d90414d7 |     
   xtensa    |         s6-dns-2.3.7.2         | NOK | http://autobuild.buildroot.net/results/cfa4a10085ddc33764e58b650cd71fec3210a9d9 |     
 microblaze  |         s6-dns-2.3.7.2         | NOK | http://autobuild.buildroot.net/results/b8eda47c4d59eb6726585848f6c7f34d541c1a67 |     
   sparc     |       sofia-sip-1.13.17        | NOK | http://autobuild.buildroot.net/results/5709276dd47d80545ddea2ca89161fa9ff9ce7c8 |     
    arm      |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/1575da3a8ea2bcde7fa9885df317a12d5c36918f | ORPH
   sparc     |        tipidee-0.0.5.0         | NOK | http://autobuild.buildroot.net/results/d4f8516dcc2bfc485482962915811bc317ebe9aa |     
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.net/results/963e7e4986991b06627a6177338736e446c9389d |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/a2ee047eb384554f7f5bef692452b298024506f9 |     
    arm      |           xen-4.14.6           | NOK | http://autobuild.buildroot.net/results/9d7f918b14e0748440b1da7e89aec3ee79de2e08 |     
microblazeel |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/c38bcd2964894d4cbfaabc9bf931f62c0967d125 |     
   armeb     |            xz-5.6.2            | NOK | http://autobuild.buildroot.net/results/344813b202644a23c166920aa7e861ebf408536b | ORPH
   arceb     |            xz-5.6.2            | NOK | http://autobuild.buildroot.net/results/cbc00cba81b5aac006a3f8913bfebde25b7354ec | ORPH
    or1k     |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/d4cf31d838f8c88558754dfe2438c78927925b5e |     
    i686     |        zxing-cpp-2.2.1         | NOK | http://autobuild.buildroot.net/results/c828a25d36a9c50b68057fa595f3702154d656fc |     
   s390x     |        zxing-cpp-2.2.1         | NOK | http://autobuild.buildroot.net/results/f2b054dd35029f99dbe111110dd64a397e4078d4 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                 host-tar-1.34 | 127
            host-binutils-2.40 | 10
                       unknown | 2 
  gobject-introspection-1.76.1 | 1 
                heirloom-mailx | 1 
host-heimdal-f4faaeaba371ff... | 1 
ivi-homescreen-5ab78a19e95c... | 1 
                libglvnd-1.4.0 | 1 
                memtest86-6.20 | 1 
                     shim-15.8 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/92ccb1ad8071b9fa994ce85c54d0da9817700705 | ORPH
    arm      |         heirloom-mailx         | TIM | http://autobuild.buildroot.net/results/169d14ceab35131115235d24c1b6a94d6915c64d |     
    arm      |       host-binutils-2.40       | NOK | http://autobuild.buildroot.net/results/bf4c523b963e4334ee05b554c9f1bb3ed2b44892 |     
   xtensa    |       host-binutils-2.40       | NOK | http://autobuild.buildroot.net/results/50b23683d192094f9eade2bb0946f2131c151280 |     
    arm      |       host-binutils-2.40       | NOK | http://autobuild.buildroot.net/results/73d3872aeaceb1a994f6370371d29d31eb3c34e5 |     
   xtensa    |       host-binutils-2.40       | NOK | http://autobuild.buildroot.net/results/870c037d44cbb862eda6141249da8c4b71cd8ed4 |     
   xtensa    |       host-binutils-2.40       | NOK | http://autobuild.buildroot.net/results/4b9373498b32216e75ab5a7e92ebdb027124dae1 |     
   xtensa    |       host-binutils-2.40       | NOK | http://autobuild.buildroot.net/results/829f57e1a4ff99d8e25c7b6297b7434dc53b0c4f |     
   xtensa    |       host-binutils-2.40       | NOK | http://autobuild.buildroot.net/results/87a61c334da6e089880317d673c2f8818c062752 |     
    arm      |       host-binutils-2.40       | NOK | http://autobuild.buildroot.net/results/0b734f7639d6e11982d2e9bba7576bbb714149ca |     
    arm      |       host-binutils-2.40       | NOK | http://autobuild.buildroot.net/results/b19bdfd8e28d1edb10a2ffb565eff7cc387ab974 |     
    arm      |       host-binutils-2.40       | NOK | http://autobuild.buildroot.net/results/6cf5fc261df8fe0be974048cedf02487b6f42e8e |     
  aarch64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/8f25ff8063a7513c9223ad10a1fe4517e97ca2c5 | ORPH
    arm      |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/4ff7f20ad265b53477df08318f9f81935fc88bfe | ORPH
   x86_64    |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/1d514113cc2b64ab03aefaab1a2ca9a874e28fd3 | ORPH
   s390x     |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/03535dd6d04685fb643838591569ca0ab18a5718 | ORPH
 powerpc64   |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/e16d485684707c7f91a92bfabd2a328e772339c4 | ORPH
    arm      |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/e3a47b8f5ae5bacb3ab4c2ef4369f47dd0fbdb2e | ORPH
 aarch64_be  |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/c2dcd1e2981530a90fd21a955ccf7c51fea17519 | ORPH
   mipsel    |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/26d846812b65da3d819f685ff91acadae23fa4dc | ORPH
    arm      |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/60c87c15bb93126c223324c78be944791a0844da | ORPH
   mipsel    |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/4247157aa1daa5b070a8bd4787e8eed2cdf43dc3 | ORPH
   s390x     |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/fb0665c2e63fca30c66c7b0e4e7b1b41061a1a31 | ORPH
  riscv64    |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/18ed031d1c76d6a01e77c1b171d7cc724d43753c | ORPH
microblazeel |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/6db80fe5104290a294790427849a5fa7ba484463 | ORPH
    i686     |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/66548a0cf119c34b9c7c4efc07a63f56f6990d60 | ORPH
   x86_64    |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/f4c3aa4439b3f28af80263d2bf69540ca7117ffe | ORPH
   x86_64    |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/c9ce9fed0cd078ec4c0d6076bbc133a2953644c2 | ORPH
    i686     |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/38475ce5b27ac2a893f7bf9a7435057edbc7ed84 | ORPH
  riscv64    |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/5e73cce87620b252f32630ebe7a7245ffe40a5cf | ORPH
    arm      |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/11e6772a81973f1892480dc171b2e9f111763199 | ORPH
  riscv32    |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/dbf8dc570e4b00dd5047eba23e3243055409a38d | ORPH
  sparc64    |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/6a6d1935e0a778561e3f18cef7f930566f307c6e | ORPH
   s390x     |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/315e8ad6eb25babe339c81ce8dde9a2dcb8b674b | ORPH
    arm      |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/8f8eeaa893b17707f0726fd308f5f2b9c8122836 | ORPH
   mipsel    |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/86a7d7c4ab470a9c7c706c2765a8a0e389a8a231 | ORPH
   x86_64    |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/e453b1901e62fa0d082b96bca0c7418fe67ea140 | ORPH
microblazeel |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/5de0098f6da26bc12c2cb1bc8d33b86b645b5819 | ORPH
    arm      |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/6db4f36bd48cd829c8c239832d0c98a9fffe8479 | ORPH
    arm      |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/d6e5e83b5c1a025ea1d38460e4e8867db2e4c9a5 | ORPH
   s390x     |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/642019c95532e0984cc79084afbdb951f754ebf7 | ORPH
   x86_64    |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/533140b0e38f0da348490aedb6cca29dc76acc45 | ORPH
  sparc64    |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/f4766bb57cb60334d3a2f6361f14cb6baa950288 | ORPH
    arm      |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/9fbdca64366174e9a76fc0dce17ba81f9013a15c | ORPH
  mips64el   |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/e7fe89b23ba9f27de6de1b56c067d637f2d71264 | ORPH
powerpc64le  |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/3eb729202a7c8f3c20c8d77754aebed67df5464e | ORPH
    i686     |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/8809410561969f3e580cd40b83e94ab2d7e974a6 | ORPH
    m68k     |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/24ce14ee35662448ed325d8693c28275909e20d6 | ORPH
    arm      |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/583f43afc1186f6fe18f138035866ca533a64dda | ORPH
    arm      |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/ffe597005978813372d7b1947b88f6b40c204443 | ORPH
 aarch64_be  |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/02fc19ee03f5f7477175acc548e8662fb6fab96a | ORPH
    arc      |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/b2e459890d553840e9a414a7d6810fb08b9305aa | ORPH
  riscv64    |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/52b4aa23e9f890ec72b9bc49c4551a15a98ae6ea | ORPH
    arc      |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/efe995881d45bf57f712183e15afc1a2dc49f73e | ORPH
   xtensa    |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/db275700ed1d41c3ef0084c0bf5263f7d2103080 | ORPH
 powerpc64   |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/d4825d9f4a5457f56beee953bc0e4546c7de41ae | ORPH
  riscv64    |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/9e08d6c51de549f1b68ef5d9a10197fb8315ea23 | ORPH
 aarch64_be  |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/c701a90d24d5b6dcdc93f3b19692e432ac5dd03e | ORPH
   x86_64    |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/94dbf67e886ddc4e91c4b301b9b945d21c4f868f | ORPH
   sparc     |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/38a7b1344dc36d7f4bbae2b48394a2cd9e2e8cf2 | ORPH
 powerpc64   |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/e2cbb4f26e59958b083793a0df146ed78877d339 | ORPH
  sparc64    |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/05826b2d60f202dd2b3041b2e68e461aa8b51537 | ORPH
microblazeel |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/6ccd306dae243e51d5b28bb5fc3cb68d95337b2f | ORPH
    arm      |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/8f7711ae13a5905a0cdfffb70d6536baa46528b7 | ORPH
   nios2     |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/63cc799db65dac163a05b045301b3140bc44399c | ORPH
    arm      |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/a2622bdcafd9b39a4ebbc1edc2fe432c84f66304 | ORPH
  riscv32    |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/512663369bd2ed6f6d2e46d6d2f333ad433280af | ORPH
 powerpc64   |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/05864e871858354388395defda82a56c64ba6c9a | ORPH
 aarch64_be  |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/442d780177099a66e5a033c8416041e292171553 | ORPH
  mips64el   |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/8480c7bed816c1bbd172839a7dadeba19e7b1141 | ORPH
   x86_64    |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/74502f5789bbb76557e3100fc673866c87ecb3b2 | ORPH
   x86_64    |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/880692f606591c3010cbcfbae91cd4a56a722684 | ORPH
   x86_64    |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/5594ce2eba1c4ad3a860092cea42415326d4de76 | ORPH
   x86_64    |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/ae62186ec25cb4a6bf4983beb7c6a1e0e62de127 | ORPH
  sparc64    |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/fef58d5797eee9f11d164ee2f73d18f43ad994cf | ORPH
    i686     |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/93c4275f9eb6138670baff028c5c176b215e31c7 | ORPH
    arm      |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/825f11055b0ce2e19102eb38555307bcac250ee3 | ORPH
microblazeel |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/6eeab203c85afc974b577b194fc8e3e4c12ead65 | ORPH
  riscv64    |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/73130123eea48467459f2fff4b56a78a5eb8377f | ORPH
  sparc64    |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/9bd725a878d5d46aac87d94bb6ba51ba952c7e2c | ORPH
    i686     |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/884b21c3c1c0d32ae12b1e620dab40ab95598196 | ORPH
  powerpc    |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/b76f56a9350855fe05fc7cac5797b3b89c495012 | ORPH
  riscv64    |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/4ff30c2c07ff3fe5c9858f657d2b4b163888326b | ORPH
   x86_64    |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/5ac8c8cdd73eb3e71ce276b5e09b1ff4cb50d8f8 | ORPH
 aarch64_be  |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/861ba7f14af15dec5a39b5d6c069d2a5714729ce | ORPH
    arc      |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/06af135e248852e8682166679d2d69b5e06819df | ORPH
  riscv64    |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/114556e300e1f98300dc688e2c0090252d880fed | ORPH
  riscv32    |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/f1e2c1d6b7193b5e9346c957126a9559ae136a06 | ORPH
    arm      |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/dd922138e6cb7baf09b88bddbbe2ea98c91f16d6 | ORPH
  riscv64    |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/7e526a885a08cf716b3947c1d20664db0ad46d2a | ORPH
  aarch64    |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/6d1e88f2e00bfa47ecf761cb608599f7eceab456 | ORPH
    m68k     |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/70c3eba5747cef64ca81a060e27c3c10a471c2a4 | ORPH
   nios2     |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/199c78a0d0fc8f378837de9588c23036d0854d38 | ORPH
    arc      |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/1d87d39366edf1a3e57991db6f4bf5fda9602ea2 | ORPH
    arm      |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/41c8b349e57321f486f4465349b99d37cd1668bb | ORPH
    arm      |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/9c15922c556e15bc6f0299c5742aa9bd0fb02a64 | ORPH
   sparc     |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/c58fdc14cfdea98c9fbd7222f24568e7c144dd3f | ORPH
powerpc64le  |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/4064fe7b1a175154baf96d82b4a28c338f4a04e5 | ORPH
  powerpc    |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/e0edf8418b8c9156a7dd2d0576d2d1ba4c34774b | ORPH
  riscv64    |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/8795cb31f1c8a1bcfefc6a7cb983d998add46198 | ORPH
  mips64el   |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/f9861a6a3ec19c2426a269958c427e794f3b0180 | ORPH
   s390x     |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/20c9e7fef57831976f2db1616c94a7feea103f1a | ORPH
  sparc64    |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/91232d80457aaa55d700cad3afce0bf77b226c10 | ORPH
  riscv64    |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/6f313e2d9547fe2decc91c6ead560717b03386c2 | ORPH
    arm      |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/54531f1b80078b024abb8ee86cd414f4baff5212 | ORPH
    arc      |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/e3b1c3911fc4136aadd098829f46b3fa68bc1b70 | ORPH
    arm      |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/1da228cbc647f807adfb81bce73416de78a8ba58 | ORPH
    arm      |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/4f2196ebb1fcced549961bfa34c2ad8e5c79f1bc | ORPH
powerpc64le  |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/af4a37a5cba108591ff0a6ff70ab62436f3944eb | ORPH
    arm      |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/00745780ae2f59bfd0bec8f532e99109d0cf3528 | ORPH
    arm      |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/9f2c009fc3f5dc7b76d22da2b9cbba1a9ea69fb8 | ORPH
  aarch64    |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/fbb0655b8108002a03d58fa666f3a4d0e7cd1bdf | ORPH
  mips64el   |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/faded388c0996014d48def7ef5c77bbe8b7317f0 | ORPH
  powerpc    |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/de122a7387246a12981068df523b6c3177b1da90 | ORPH
    i686     |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/0734dde95e9d919f1c78035bb1fd6bd9b8e74f9a | ORPH
   mipsel    |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/39a796aaafb73d59e0de303980d1f85f820f9894 | ORPH
  aarch64    |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/d93255b5b10a05d35a9db96cb47934baf8783bea | ORPH
    i686     |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/7cb4fe2d4805488fbe2d522f814102e69c96968a | ORPH
powerpc64le  |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/9c949f3ba68b403e5467990aa34dadf87040f4ee | ORPH
    arm      |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/0806dd7e20367449add45c3fdd08d4d6dca43d62 | ORPH
  aarch64    |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/5a43249e92021806c0a68c19d2d2fafec2e79971 | ORPH
  sparc64    |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/ebbaffdf21ddbf886a36e3896f98ce97ba6fd9f8 | ORPH
  aarch64    |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/7c778a03d4333e972ba803f16941780a3efde7a8 | ORPH
    arm      |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/e7a518f5ff18f25c4b2e8e1355d3d7c705d7792d | ORPH
   x86_64    |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/c30d51ce04bb19257c6149d1aa1a16a9cd9cc63d | ORPH
   s390x     |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/0ffa220e7582cf19a89d03dc7e42781b3675da6d | ORPH
   nios2     |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/82fd7517d6908defa002ea3b7d28fb39b8c44b7d | ORPH
    m68k     |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/7f6093d40d57909cb4b65537d7ab43c8e314b278 | ORPH
powerpc64le  |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/27305ed9a4e73466dd77c0161381eb11b67bfdc2 | ORPH
   x86_64    |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/5629957b18a2634d7e4e5075955f878c85d54ab5 | ORPH
   mipsel    |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/1d106b384c2e3696f72dda0149ebdec0a3ded92a | ORPH
  mips64el   |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/7964570de36828aa9bc3a1be739cd743072a59da | ORPH
  aarch64    |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/cb16986138d59fa227b47a4dfda926e51cab852c | ORPH
    arm      |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/52226c2b0ec4d6391ce73d1cf1da19c154f6f6f8 | ORPH
    sh4      |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/849e8685a11e11226f9ab2a15ea8361117e30e4b | ORPH
   x86_64    |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/d3fee0b81f7bdd06ab2a3ab77e2686725d5b95ff | ORPH
    arc      |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/d88714d7676f6c1cd49e0d373d5e6f78c694ce48 | ORPH
   s390x     |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/f9ec3769e1291c37ef78b6d53b80df387923299e | ORPH
    arm      |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/0a879ed4ac3a979a84c98f956bd9872864bc8952 | ORPH
   x86_64    |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/46127300608bdac2a5e5defbb48d8894369626a7 | ORPH
   x86_64    | ivi-homescreen-5ab78a19e95c... | NOK | http://autobuild.buildroot.net/results/e68554ccd46cbe773de093a7cc14d33023148680 |     
    mips     |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/d427e20fd906933316060b645b67f88883ecf96d | ORPH
    i686     |         memtest86-6.20         | NOK | http://autobuild.buildroot.net/results/3cbd11a90941ce0565dd655d70d414bf526ca67e |     
    i686     |           shim-15.8            | NOK | http://autobuild.buildroot.net/results/93f95f8e6c3c41dd6049f60473140cf5e5aeabef |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/8455f18ca5fd7b9b7d9babfab502f4840e60d0b0 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/55d949179626c5880c838888a194a46f4523b4fe |     
  riscv64    |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/411b6c62766074e0443e63fcf1ae81a76a2c619f |     


Classification of failures by reason for 2024.05.x
--------------------------------------------------

toolchain-external-bootlin-... | 41
            host-libtool-2.4.6 | 23
               alsa-lib-1.2.11 | 13
     toolchain-external-custom | 12
           host-python3-3.11.8 | 9 
               host-mpfr-4.1.1 | 7 
          linux-headers-6.8.12 | 7 
toolchain-external-linaro-a... | 4 
                     ace-7.1.1 | 3 
               acpica-20240321 | 3 
            host-binutils-2.42 | 3 
toolchain-external-linaro-a... | 3 
                  hwdata-0.379 | 2 
           musl-compat-headers | 2 
                       unknown | 2 
                  bcg729-1.1.1 | 1 
                  bcusdk-0.0.5 | 1 
                beecrypt-4.2.1 | 1 
                fail2ban-1.0.2 | 1 
              fftw-quad-3.3.10 | 1 
                     frr-8.5.4 | 1 
                genromfs-0.5.2 | 1 
          host-asterisk-20.7.0 | 1 
                host-file-5.45 | 1 
                host-go-1.22.4 | 1 
ibm-sw-tpm2-5452af422edeff7... | 1 
          libcamera-apps-1.2.1 | 1 
                 libcurl-8.7.1 | 1 
                  libsepol-3.6 | 1 
      qt5webkit-5.212.0-alpha4 | 1 
toolchain-external-linaro-a... | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |           ace-7.1.1            | NOK | http://autobuild.buildroot.net/results/796b0243777eb0765a90612fbe6c271c2a722310 | ORPH
    arm      |           ace-7.1.1            | NOK | http://autobuild.buildroot.net/results/900bf7615388a98fbd3d76fe761ef13f2478651d | ORPH
  aarch64    |           ace-7.1.1            | NOK | http://autobuild.buildroot.net/results/a4c9a6d725506a1aac46e12415d5fee41c70b383 | ORPH
 powerpc64   |        acpica-20240321         | NOK | http://autobuild.buildroot.net/results/5f9253b85913bb5d43031aa5b4a60accc75315fd |     
    arm      |        acpica-20240321         | NOK | http://autobuild.buildroot.net/results/01164500ee93d21d6d85f1443f88b891631bc062 |     
   s390x     |        acpica-20240321         | NOK | http://autobuild.buildroot.net/results/cb8442f0670e2e308919c0749a4368456248836f |     
  riscv64    |        alsa-lib-1.2.11         | NOK | http://autobuild.buildroot.net/results/019bfc48a01456021fde92de4ea2a0d86a34c777 |     
   x86_64    |        alsa-lib-1.2.11         | NOK | http://autobuild.buildroot.net/results/0d82f089501da266e7e962f605023e6a99d21889 |     
    arm      |        alsa-lib-1.2.11         | NOK | http://autobuild.buildroot.net/results/42ccd94b9e9f78ad78177734dddb47a17aad15ac |     
  powerpc    |        alsa-lib-1.2.11         | NOK | http://autobuild.buildroot.net/results/37a7da52ea0857ba377ab3c09d50c6fcb0822482 |     
   x86_64    |        alsa-lib-1.2.11         | NOK | http://autobuild.buildroot.net/results/866331eeb3b0021fb7662fa5f2db172d417e5f52 |     
    arc      |        alsa-lib-1.2.11         | NOK | http://autobuild.buildroot.net/results/0d7706e3f59b43322058f63efbf8b74f7735d999 |     
  aarch64    |        alsa-lib-1.2.11         | NOK | http://autobuild.buildroot.net/results/37c2dcabece32527a344b62ab902e435d4a4416f |     
  powerpc    |        alsa-lib-1.2.11         | NOK | http://autobuild.buildroot.net/results/5adff34e40272dda68624c411a025342baf810ce |     
    arm      |        alsa-lib-1.2.11         | NOK | http://autobuild.buildroot.net/results/3bd629b1b3f0e0d41a5c133d1bf1350d7cfc080a |     
    arm      |        alsa-lib-1.2.11         | NOK | http://autobuild.buildroot.net/results/146e8ecc17c87d15bd773d4a773e5290a6403439 |     
  riscv32    |        alsa-lib-1.2.11         | NOK | http://autobuild.buildroot.net/results/f18c72b277140704448c245605d0eaa5ef0e2db4 |     
 powerpc64   |        alsa-lib-1.2.11         | NOK | http://autobuild.buildroot.net/results/a1a9e48fe55182027f317bcbf728c7377503f374 |     
   x86_64    |        alsa-lib-1.2.11         | NOK | http://autobuild.buildroot.net/results/2a92a17ac1f136465c60d03593c650b4d4f3666b |     
    m68k     |          bcg729-1.1.1          | NOK | http://autobuild.buildroot.net/results/c543c7f5e29d607c3e7bde80708240815875ba6f |     
  mips64el   |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/e5b00f1d5b01199856a27041d41b14b991f9fb64 |     
    m68k     |         beecrypt-4.2.1         | NOK | http://autobuild.buildroot.net/results/fce2d2879aaeb0afe7ecc5a9e55238b1271963dc |     
   mipsel    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/7901615cb5ca10c803e81fc197c2947cbbe91c22 |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | http://autobuild.buildroot.net/results/b92e58c9064eedce8bbd803aa24b66830afbc41a | ORPH
    arc      |           frr-8.5.4            | NOK | http://autobuild.buildroot.net/results/76da119bb7086d1043203cbdc5a4344114e467ae |     
    m68k     |         genromfs-0.5.2         | NOK | http://autobuild.buildroot.net/results/871a2b763d7210e21ab3bb2d4aa83df1a9312e43 |     
   x86_64    |      host-asterisk-20.7.0      | NOK | http://autobuild.buildroot.net/results/6c6942a068b0a2b22bdd4cf6655ffdf597e355cc |     
    arm      |       host-binutils-2.42       | NOK | http://autobuild.buildroot.net/results/bd05bcc55ec525c2e7a6d2eba0bf19aeb0c9cd96 |     
    arm      |       host-binutils-2.42       | NOK | http://autobuild.buildroot.net/results/caf545553876b2182c2e0c300d1a2fc9eca6b4e5 |     
    arm      |       host-binutils-2.42       | NOK | http://autobuild.buildroot.net/results/968231ae723bdbe8deab125d8b111613c9dbd647 |     
    arm      |         host-file-5.45         | NOK | http://autobuild.buildroot.net/results/93445c2527a574358bcefc81a896082c49aa4e93 | ORPH
  riscv64    |         host-go-1.22.4         | NOK | http://autobuild.buildroot.net/results/bb2b97787e927f389d539cd7832211123ea5cafc |     
   xtensa    |       host-libtool-2.4.6       | NOK | http://autobuild.buildroot.net/results/adf778dbe656dc00dd20a6260701cb92730939b8 | ORPH
   x86_64    |       host-libtool-2.4.6       | NOK | http://autobuild.buildroot.net/results/56233fdeab0cf2c02eeae16a6c0cd0d552650f7b | ORPH
  mips64el   |       host-libtool-2.4.6       | NOK | http://autobuild.buildroot.net/results/b2b7fcc92b1513b007091e50a3c98c0ba1deaceb | ORPH
  aarch64    |       host-libtool-2.4.6       | NOK | http://autobuild.buildroot.net/results/4854526bb003ad808debe42c546a3e2e23c3cc5e | ORPH
  riscv64    |       host-libtool-2.4.6       | NOK | http://autobuild.buildroot.net/results/6a0b8dec6bed6adfc5921634b2b8f8c205495bb3 | ORPH
    i686     |       host-libtool-2.4.6       | NOK | http://autobuild.buildroot.net/results/7941eefcfe356e01e5970c84c6a59868929bcd6f | ORPH
  sparc64    |       host-libtool-2.4.6       | NOK | http://autobuild.buildroot.net/results/f7fca5cc012587632d85cffc0d8c1dfc2ebe2cf2 | ORPH
   mipsel    |       host-libtool-2.4.6       | NOK | http://autobuild.buildroot.net/results/fcf120501180ba6a396ab301f398936cb184e5af | ORPH
    sh4      |       host-libtool-2.4.6       | NOK | http://autobuild.buildroot.net/results/5f12b46701b54094fbb6a383eb71df32055cc9f4 | ORPH
  powerpc    |       host-libtool-2.4.6       | NOK | http://autobuild.buildroot.net/results/617e8f418b361595702476ba3c78d36696e4a05c | ORPH
    arm      |       host-libtool-2.4.6       | NOK | http://autobuild.buildroot.net/results/5b7c81077549154e20e274af2ee11296d51ad645 | ORPH
 aarch64_be  |       host-libtool-2.4.6       | NOK | http://autobuild.buildroot.net/results/02141c3f9d0512742df73b19c7969732db1f8d6e | ORPH
  aarch64    |       host-libtool-2.4.6       | NOK | http://autobuild.buildroot.net/results/13a081a9731f5c6f8de7f6adece469e2bef5f2d2 | ORPH
    or1k     |       host-libtool-2.4.6       | NOK | http://autobuild.buildroot.net/results/2a1da86267f2e46309715d14c51ffe67f1f75ac5 | ORPH
  riscv32    |       host-libtool-2.4.6       | NOK | http://autobuild.buildroot.net/results/33a2d84dab3ae6f8e09d494fcf911ebf76b23c95 | ORPH
   mipsel    |       host-libtool-2.4.6       | NOK | http://autobuild.buildroot.net/results/6172ead0c863e951f1f2e8e2ffe5310266753078 | ORPH
 powerpc64   |       host-libtool-2.4.6       | NOK | http://autobuild.buildroot.net/results/e281a9bd267d40d23d3346843142498b7d082e26 | ORPH
  aarch64    |       host-libtool-2.4.6       | NOK | http://autobuild.buildroot.net/results/bdae6a54fed76f14af648cf3e8c9d08418a5684d | ORPH
    i686     |       host-libtool-2.4.6       | NOK | http://autobuild.buildroot.net/results/a1a5f27af7497382800f8c1cd0744da9e4688878 | ORPH
    or1k     |       host-libtool-2.4.6       | NOK | http://autobuild.buildroot.net/results/5c25584d43b1df0d0ca8e3e6965158363e373d83 | ORPH
  riscv64    |       host-libtool-2.4.6       | NOK | http://autobuild.buildroot.net/results/cdb463b55f08911d6ac21659e7b69c288a76c647 | ORPH
  mips64el   |       host-libtool-2.4.6       | NOK | http://autobuild.buildroot.net/results/be63736b88439aa04bd5d7931fa9b93e2c4ac8b1 | ORPH
  mips64el   |       host-libtool-2.4.6       | NOK | http://autobuild.buildroot.net/results/912373a3bd843586232a465fa32f52a0d8252306 | ORPH
   xtensa    |        host-mpfr-4.1.1         | NOK | http://autobuild.buildroot.net/results/bb021f62d4e611aa98c3986e56caebf7d1e51aa6 | ORPH
   s390x     |        host-mpfr-4.1.1         | NOK | http://autobuild.buildroot.net/results/978c87d6304badfdaf3cadcbe861f34f21e0ed57 | ORPH
   s390x     |        host-mpfr-4.1.1         | NOK | http://autobuild.buildroot.net/results/c856a8029dc016cc661826cca7b5cabc8d14a853 | ORPH
   xtensa    |        host-mpfr-4.1.1         | NOK | http://autobuild.buildroot.net/results/f2f9e9a0052671e7eaeb28309cab2183d489b7de | ORPH
microblazeel |        host-mpfr-4.1.1         | NOK | http://autobuild.buildroot.net/results/a3c48ac449c8bc4efd87186c43df82ca16e3183c | ORPH
   xtensa    |        host-mpfr-4.1.1         | NOK | http://autobuild.buildroot.net/results/7dbb0df45a228d143c5de3b7d7709b6885e07d80 | ORPH
microblazeel |        host-mpfr-4.1.1         | NOK | http://autobuild.buildroot.net/results/a7727c669a74726da39b80f3ac075bc752e835ea | ORPH
  riscv32    |      host-python3-3.11.8       | NOK | http://autobuild.buildroot.net/results/c3df3e92fe1e794f8181b6c77b0334d705a71796 |     
   s390x     |      host-python3-3.11.8       | NOK | http://autobuild.buildroot.net/results/893a70e014ad8b71ee8583cddd078e845de29dd9 |     
   x86_64    |      host-python3-3.11.8       | NOK | http://autobuild.buildroot.net/results/c75b8c4d93ec635c302c858e20f7ffc3185095cf |     
    or1k     |      host-python3-3.11.8       | NOK | http://autobuild.buildroot.net/results/26070782040cbbb920ab9c6d69e66a4fed314ab9 |     
  mips64el   |      host-python3-3.11.8       | NOK | http://autobuild.buildroot.net/results/c16c8134187e5abafa8e4206e271c6afd4727610 |     
    or1k     |      host-python3-3.11.8       | NOK | http://autobuild.buildroot.net/results/2903ff490ead2b64439c89fbe651a8972852ebc6 |     
   x86_64    |      host-python3-3.11.8       | NOK | http://autobuild.buildroot.net/results/488bcc8dbd21d5926690c9eb25acfff4bccb0c9b |     
    arm      |      host-python3-3.11.8       | NOK | http://autobuild.buildroot.net/results/478732980caaabe76293cbf11d66ca8a97163099 |     
  aarch64    |      host-python3-3.11.8       | NOK | http://autobuild.buildroot.net/results/e187fc0b4af3706fdc7bfb54a56e3c6bf0bc617d |     
    m68k     |          hwdata-0.379          | NOK | http://autobuild.buildroot.net/results/f5a7574d34cc4ffc827d7db4c68028f30fd95d13 | ORPH
    m68k     |          hwdata-0.379          | NOK | http://autobuild.buildroot.net/results/e3455a9ddb1270195a302012cf341f94256b4094 | ORPH
    sh4a     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/6b52975a7d77eb79ed166d60220c8ba241c992fc |     
microblazeel |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/8e4bbc28c0955f5e108b5d0304e5c7097de241f9 |     
   s390x     |         libcurl-8.7.1          | NOK | http://autobuild.buildroot.net/results/134953d906f58e568345eff2dc3e16b3b7f7567a |     
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/69f344c1a375cc0533c8c475c0a6aae6514feee2 |     
   s390x     |      linux-headers-6.8.12      | NOK | http://autobuild.buildroot.net/results/44f3a12e3ec544b9b666304dc5f67110832e24e0 | ORPH
    arc      |      linux-headers-6.8.12      | NOK | http://autobuild.buildroot.net/results/41c4459f10d57754ef01393f868b4b5dc6d87ed8 | ORPH
    arm      |      linux-headers-6.8.12      | NOK | http://autobuild.buildroot.net/results/8a015e573172c4596d0151824101d1c1119aaffb | ORPH
microblazeel |      linux-headers-6.8.12      | NOK | http://autobuild.buildroot.net/results/f596c14d40e3fcade87e4707c17003656f3db196 | ORPH
   s390x     |      linux-headers-6.8.12      | NOK | http://autobuild.buildroot.net/results/3944efb22de07fe49231a0f412fa9b3f1799cbd8 | ORPH
    arc      |      linux-headers-6.8.12      | NOK | http://autobuild.buildroot.net/results/95545014e4d795a417c42eacf452d5cb6fcb7293 | ORPH
   s390x     |      linux-headers-6.8.12      | NOK | http://autobuild.buildroot.net/results/37c2b3053bfa0b69e79aebc4d3524ef781ff60e9 | ORPH
   x86_64    |      musl-compat-headers       | NOK | http://autobuild.buildroot.net/results/0e8bcf37c453ca981818a6c6c5ce4a25489a497e |     
    i686     |      musl-compat-headers       | NOK | http://autobuild.buildroot.net/results/fd819ca5d9a70c2a833296b9561df18ac510cacf |     
    arc      |    qt5webkit-5.212.0-alpha4    | NOK | http://autobuild.buildroot.net/results/e0d8a110cee4e28a58a7bd697bf98cad9aaf6f68 |     
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/e83e9053805b34b780425f445d7ae210e2e2edd2 | ORPH
    or1k     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/e13c38f067a5f981e70b5117f51347f3f42da33a | ORPH
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/0f2b151bffa9c0fad18bbb994fa285e80bae2df4 | ORPH
  riscv64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/fb07bc6e3a145ab7f9bbf6d8ec29bc58fcc464c2 | ORPH
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/0b64af4232d09fa3ca40311f7a18031c492be474 | ORPH
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/06fea86aafc8e0f51d33319e6d34e278973b8b90 | ORPH
   xtensa    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/57b8f4d6a5724ad790dab1feb9849c067994ce5d | ORPH
   nios2     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/3ec201cb4dc9b812142896fa88976b92121645fe | ORPH
powerpc64le  | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/8204984d6e46e12c3d7ec6a4a40360118d071cfe | ORPH
   xtensa    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/b897d2c1592d4b597f7b65c74063b42e7effa52c | ORPH
  sparc64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/fdb8f26c7f97c98d418f71d3ebb34f6f0b6c0919 | ORPH
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/03c07e4ccbb9efa9ca6481f8db76e7af7842dbc6 | ORPH
  aarch64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/2dcddb236b532c8fe0925e6870b92069951a4bc1 | ORPH
    arc      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/05c0410a4d8ed3501ef3ee523fa63a7b0f5bb03e | ORPH
    m68k     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/7836b29b446ca4b2fd644cc37e9694e36731872d | ORPH
   x86_64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/00f4822345805374bc029e67b2877867a8cf0d91 | ORPH
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/a4f38cecc884fb72c1e437e8a5987868098d2abc | ORPH
    sh4      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/84f7d6676a1dbd4b357f3089524fb986655d4a7a | ORPH
   x86_64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/2f95bc500c9885ab60a65262d45262e0409dfde8 | ORPH
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/983c172045af27e6622b3c6c684bdf5f806ee902 | ORPH
   x86_64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/ae41cd070542952a0cfd6b0a9bd3d9ac436bf01c | ORPH
powerpc64le  | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/8c8bf7476b4cb06d8018c2d8019bc97d713c3989 | ORPH
   mipsel    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/d9d3864eff0b159a052e3eacd0b0a250ad27ffd1 | ORPH
microblazeel | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/fca8e380e2093d80f56d7c52d63ec38b13bd9969 | ORPH
    i686     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/eeff5e07279c4a41afae1b79250a5791e1c74f3c | ORPH
   nios2     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/c63445eeda64f2386bf84d614576fb3996b27d56 | ORPH
  aarch64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/5bfe0ec8169075573154660d0220bbc2d4795570 | ORPH
powerpc64le  | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/6e796392d57bfb15822be085c0f122f01789c88d | ORPH
   xtensa    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/1f1d805c89618f429d5404e2a020038d3da44518 | ORPH
   nios2     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/7666afbf962fd18993bdee2278f0e9ce036d3ad5 | ORPH
    arc      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/eddc3e93c369ed4f6f2d8237fc34978a3ff462a9 | ORPH
microblazeel | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/d13bc8b34159fd0a2ea15a7b85f2a31c099b3d7f | ORPH
   x86_64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/a442a980a6ba1d72b1f5e91443bd6ab87d902e9c | ORPH
powerpc64le  | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/7fff9416630515e0f56f0bde5ecf6c61d124b48b | ORPH
    arc      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/751cfe3195f515fd14e6f3d0863fe30d1a63704b | ORPH
    m68k     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/6b0ee4d1e065e8428e6b3cccad9699b455174dcd | ORPH
powerpc64le  | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/5819acdc9e961f34af63cbc752e7a3d4a31ac59d | ORPH
   x86_64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/e77a3a7838c74ada266e797fe1ddfd779a7d12b5 | ORPH
   mipsel    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/a984a096fe49796580c7e2531598227108186592 | ORPH
  aarch64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/0409e56d38f8f37105470a63e220f0c8a1c11068 | ORPH
    m68k     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/483f531eb8d5a55d698db27e91e24b2c1df93159 | ORPH
  mips64el   |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/04c344f0cc4d6198204130bdf36a1a7504f53c73 |     
  mips64el   |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/3cbe2930d16d1fa6dc1dd46cea542edabc66f200 |     
  mips64el   |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/ab62552a41be0d104066f6054726188d0e523d18 |     
 powerpc64   |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/601b7f2fc8e1d68928445261ee2a77153172b427 |     
  mips64el   |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/e4c053294fb2ab131a0732bb8b14cb8e062e5354 |     
  mips64el   |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/f18260299f9d6031cdea44ee2f9ecc1215f4b855 |     
    arm      |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/116425712e202a8635e4b719af4ecaa142b75d05 |     
    arm      |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/f3510fa9ece771b6a3171a6279fed686aa8c0f5a |     
 powerpc64   |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/21da129a0ecaff27229140321b31ceb6338ea0ea |     
    i686     |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/06de86c742177eb33f4068e26ca62fd404fe476a |     
  mips64el   |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/2da6911fa427ac51b318ca7d591d5f69aee9e7f1 |     
  powerpc    |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/c21c6b69aee7afe087fcdd536f046fbb352bf830 |     
  aarch64    | toolchain-external-linaro-a... | NOK | http://autobuild.buildroot.net/results/8ea802af218510099f204d1d7ff3392232e19eee | ORPH
  aarch64    | toolchain-external-linaro-a... | NOK | http://autobuild.buildroot.net/results/7931aa13ed82158db8d5243c6af05571c883fff1 | ORPH
  aarch64    | toolchain-external-linaro-a... | NOK | http://autobuild.buildroot.net/results/62a316f6d1245dbf8eb77fc03edf5b4056f6cf41 | ORPH
 aarch64_be  | toolchain-external-linaro-a... | NOK | http://autobuild.buildroot.net/results/0f31977ece7f905c108e2718747a1594eda00c45 | ORPH
 aarch64_be  | toolchain-external-linaro-a... | NOK | http://autobuild.buildroot.net/results/bc1f19cd23b64f2788908388637336a17b9107c9 | ORPH
 aarch64_be  | toolchain-external-linaro-a... | NOK | http://autobuild.buildroot.net/results/2fbf64a1da653013c3fa8111287986719d78b133 | ORPH
 aarch64_be  | toolchain-external-linaro-a... | NOK | http://autobuild.buildroot.net/results/4172963808e33dc2f31c69c7e8e512a0fcf12329 | ORPH
    arm      | toolchain-external-linaro-a... | NOK | http://autobuild.buildroot.net/results/2d0e56bbcbf33f97bfefc11a46aabb4edfdb5f54 | ORPH
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/553d27d1aad14a02c1806b8a91d424c285583a7b |     
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.net/results/e7babe87fceaf936a5bfc7fad258fafb91ce6b68 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
