Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 163D0C3DA7F
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 04:52:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA28160717;
	Wed,  7 Aug 2024 04:52:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I9Ffg8DBwxgn; Wed,  7 Aug 2024 04:52:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 356C760687
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 356C760687;
	Wed,  7 Aug 2024 04:52:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 685CD1BF21A
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 04:52:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 61EED400EA
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 04:52:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6atTxE4hhcSu for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 04:51:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DBB874004A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DBB874004A
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DBB874004A
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 04:51:57 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 427461C000C
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 04:51:55 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Wed, 07 Aug 2024 04:51:55 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1723006315; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=nsPq2ZD3nhUUDJZz2gLfIl86JX82YfBh6Oo0oKW5nQ8=;
 b=n4SdnBQP6SpG6x5H7DzgkDYwNtP76BYM/PlCqBvmPx8RvBaCq2xWBD1Ap+7k+QSOiHUrd3
 yiAShrJ9Zm6De1Jj8hGRnTwSX94a1+CbEmP/sCf+BOjllmTES+th5exznxg9whjeGPMlgK
 858sZCLplx4EZrjTQhkTl1RDGCeVJ/XzTtInpSSkMG04c+Xo0mZ56h2A5UFU/t2R3n5Ljp
 vj19AQmEl57ZPtUC0VSvwnODAS93d0woQaNNK1ASqansKR7dr1m6iZ1WDx0dU2qUuDHfQb
 uZzDssQxPAwMyvxdGnkZxN/82DU6sxndqf7c9BlD/SkN2FBOJcrC3IUG0pq3dA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=n4SdnBQP
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-08-06
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
Message-ID: <20240807045155.i9TkBYNxkV7bRonazm3qpNGCNqFs_gzvvyeb6_8quBw@z>

Hello,

Autobuild statistics for 2024-08-06
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  7  |  7  |  1  | 15  |
  2024.05.x  |  5  |  8  |  1  | 14  |
    master   | 108 | 211 |  4  | 323 |

Classification of failures by reason for master
-----------------------------------------------

    host-gcc-bare-metal-14.1.0 | 15
  gobject-introspection-1.76.1 | 8 
                 nethogs-0.8.7 | 8 
                  ffmpeg-6.1.2 | 7 
              host-rust-1.79.0 | 7 
                  linux-6.10.3 | 7 
               procps-ng-4.0.4 | 7 
aer-inject-9bd5e2c7886fca72... | 5 
host-heimdal-f4faaeaba371ff... | 5 
host-vboot-utils-bbdd62f9b0... | 5 
                     avahi-0.8 | 4 
                gerbera-1.12.1 | 4 
glibc-2.39-74-g198632a05f6c... | 4 
         gobject-introspection | 4 
            host-libtool-2.4.6 | 4 
               libglib2-2.76.1 | 4 
               lighttpd-1.4.76 | 4 
                 dc3dd-7.2.641 | 3 
                elfutils-0.189 | 3 
                gnu-efi-3.0.18 | 3 
                  libffi-3.4.6 | 3 
                    norm-1.5.8 | 3 
      python-autocommand-2.2.2 | 3 
         python-remi-2022.7.27 | 3 
               valgrind-3.23.0 | 3 
aubio-152d6819b360c2e7b379e... | 2 
                 coreutils-9.3 | 2 
      docker-cli-buildx-0.16.1 | 2 
                    dust-0.9.0 | 2 
                   ethtool-6.9 | 2 
                   foot-1.16.2 | 2 
             gnuradio-3.10.7.0 | 2 
            host-binutils-2.42 | 2 
                host-m4-1.4.19 | 2 
 host-softether-4.30-9700-beta | 2 
                  mender-3.4.0 | 2 
              openconnect-9.12 | 2 
    python-cryptography-39.0.2 | 2 
           python-daemon-3.0.1 | 2 
  python-pypika-tortoise-0.1.6 | 2 
                s6-dns-2.3.7.2 | 2 
             sofia-sip-1.13.17 | 2 
                 systemd-256.4 | 2 
                 apache-2.4.62 | 1 
                   bird-2.0.12 | 1 
                  boost-1.83.0 | 1 
                     crun-1.15 | 1 
                  daemon-0.8.4 | 1 
                   duma-2.5.21 | 1 
                  fbdump-0.4.2 | 1 
              fftw-quad-3.3.10 | 1 
              fluent-bit-3.1.3 | 1 
       freeradius-server-3.2.3 | 1 
                    gdal-3.8.2 | 1 
          gitlab-runner-15.5.0 | 1 
google-breakpad-f49c2f1a202... | 1 
               graphene-1.10.8 | 1 
 host-binutils-bare-metal-2.42 | 1 
         host-libxcrypt-4.4.36 | 1 
                    htop-3.3.0 | 1 
                   httping-2.5 | 1 
               ipmitool-1_8_19 | 1 
                    ipset-7.16 | 1 
             libargtable2-2.13 | 1 
                libdrm-2.4.122 | 1 
             libgpg-error-1.50 | 1 
        liblog4c-localtime-1.0 | 1 
           libmaxminddb-1.10.0 | 1 
                libressl-3.9.2 | 1 
                 libv4l-1.24.1 | 1 
          linux-5.10.162-cip24 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                   linux-tools | 1 
                     lxc-5.0.3 | 1 
                     lzip-1.23 | 1 
                memtest86-6.20 | 1 
                mongodb-4.2.18 | 1 
                    mpv-0.35.1 | 1 
                  mupdf-1.23.9 | 1 
          ncurses-6.4-20230603 | 1 
            nodejs-src-20.15.1 | 1 
                  octave-9.2.0 | 1 
               openblas-0.3.27 | 1 
                opencv3-3.4.19 | 1 
                 openssh-9.8p1 | 1 
               poppler-22.12.0 | 1 
          powerpc-utils-1.3.11 | 1 
               pulseaudio-17.0 | 1 
                 shadow-4.15.1 | 1 
                   strace-6.10 | 1 
               tcf-agent-1.8.0 | 1 
                       unknown | 1 
             util-linux-2.39.3 | 1 
                    volk-3.0.0 | 1 
         wpebackend-fdo-1.14.2 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/32b2b8c613fce554803e84adeceb3d0812516cdd | ORPH
   mipsel    | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/db8696729199d46cd3f86317cbeda6f13b9591ee | ORPH
    arm      | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/ea6c938df9818f2420416a6e88c8ff9c3f9bd262 | ORPH
 aarch64_be  | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/4151475a88c94354107301c1a72befce64c390d4 | ORPH
    arc      | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/a7a5475968d505687c69c0d48f0ebf03ce7500f0 | ORPH
   s390x     |         apache-2.4.62          | NOK | http://autobuild.buildroot.net/results/445883b1fc1d71264f2234114b98a4ecdff48628 |     
   mips64    | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.net/results/33090dcc79a411e50f519cb0645d0168bd5cd2dd |     
  powerpc    | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.net/results/b67315f0d7e6e3b8ea60a19cc826e932c80dd610 |     
    i686     |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/813df4350189443950959b5f63644f4f7a279bfd | ORPH
   sh4aeb    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/81437b8b68a09dafec660b5bb63b18ffdbfc3481 | ORPH
  aarch64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/607ebf833306e40ed2ad0edf5e00d832d3851269 | ORPH
    or1k     |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/7b52df35851ea104f73ccc7b48c174696fa868b1 | ORPH
   xtensa    |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/8675bf43af15514d5109287aed0c735555932c43 |     
  riscv64    |          boost-1.83.0          | NOK | http://autobuild.buildroot.net/results/66c3490b12c0ecb7f644f61e4c3c9609ba68f20e |     
    sh4a     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/f85cba00f3a626c498aac9332d5b0b5ac555dc07 | ORPH
    sh4      |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/854ccadf74fe6ed33bd8614a1337bf62fbdd18b1 | ORPH
    or1k     |           crun-1.15            | NOK | http://autobuild.buildroot.net/results/20790a7f2c8ef4fd754187e505a24da54814e436 |     
   mipsel    |          daemon-0.8.4          | NOK | http://autobuild.buildroot.net/results/c615b7cbcbe19929919bd36c437d670ecf16cd49 |     
    sh4      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/3417bd33c3f945238a9c9f1bdeaeb5ca3651e7cb | ORPH
   xtensa    |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/8c360540d650d746c6436e4b1936d2788c42d070 | ORPH
   xtensa    |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/bf2e17f64dc6eae85c9817abae091ea2c4f79197 | ORPH
    arm      |    docker-cli-buildx-0.16.1    | NOK | http://autobuild.buildroot.net/results/4a0e8a258521d0a015e606f22d502833b6466188 | ORPH
powerpc64le  |    docker-cli-buildx-0.16.1    | NOK | http://autobuild.buildroot.net/results/4ab777c3806fe0943580869503d7e24237bade81 | ORPH
powerpc64le  |          duma-2.5.21           | NOK | http://autobuild.buildroot.net/results/966a96301784199496999e0ddb75f1a26616c793 | ORPH
  powerpc    |           dust-0.9.0           | NOK | http://autobuild.buildroot.net/results/4cd9975ce9420935e0b03a835007fb3263ffad00 | ORPH
   armeb     |           dust-0.9.0           | NOK | http://autobuild.buildroot.net/results/ca79a7a60588324da3746eb4dcebb9874ac99de5 | ORPH
    m68k     |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/c1a8fe6b685e590b052fe662eeaecfdd11bce1ea | ORPH
    mips     |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/482560c674dc554db6d10eb5f517b4c16cb0989b | ORPH
   arceb     |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/26c839f71609b2df12e53d90da112f779a30ae5a | ORPH
   mipsel    |          ethtool-6.9           | NOK | http://autobuild.buildroot.net/results/c818b703822060daabc430ea33f4b171cd0f180b |     
   mips64    |          ethtool-6.9           | NOK | http://autobuild.buildroot.net/results/1ceb84defd7ee62aef467335d5b0625dae1ab60e |     
   sparc     |          fbdump-0.4.2          | NOK | http://autobuild.buildroot.net/results/56b4f85e421ce7b3713a9c84836e469bb109718d | ORPH
microblazeel |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.net/results/12329216ea1c739db3172fc6c4ce2766c9cab55d |     
microblazeel |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.net/results/509e1aa592b1dc0a9fd1f50a23e3aacb5ca76e05 |     
 microblaze  |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.net/results/cef2bba08794087064e7fea8ac4121ba594ee820 |     
microblazeel |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.net/results/7083d6394485edf4918b4bc269ba6779d43f0454 |     
 microblaze  |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.net/results/c94247889ca1eda6462f03fae54db1db88835632 |     
    arc      |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.net/results/894f0b8d397e3820367a22baeefcd7e07a5ee7b8 |     
microblazeel |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.net/results/ff1abaa89e0906c8252d1095968d804d2b577e2b |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | http://autobuild.buildroot.net/results/05b30ec0dbdd37e29434ab2de07b3ee63ed00e1a | ORPH
    arm      |        fluent-bit-3.1.3        | NOK | http://autobuild.buildroot.net/results/a437c5d68a36d79522140d2cba31799889753b0b |     
   nios2     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/fcf004a60768ac644bcf261ec881a9bf62733d78 |     
   s390x     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/063cc22ea5f68570b21ede9502df969517507025 |     
  sparc64    |    freeradius-server-3.2.3     | NOK | http://autobuild.buildroot.net/results/dc15c8ad4e0a65307bdb4885449e8cdc544c58ba |     
microblazeel |           gdal-3.8.2           | NOK | http://autobuild.buildroot.net/results/195e892392b5260b887f6da479e1d8edaad1d982 |     
   x86_64    |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.net/results/29d84e8d402f8352fc8fc03426b6dcdc14f76db6 |     
 powerpc64   |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.net/results/9d04ab926468ea55ba8810e4540b4e2f3deb4a26 |     
   nios2     |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.net/results/17d5bb8497e22d1f56e6988bf5e97e3f39dc594a |     
 powerpc64   |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.net/results/d629910bc8688b588bfdd5ca8279bc79bb2af2d4 |     
    i686     |      gitlab-runner-15.5.0      | NOK | http://autobuild.buildroot.net/results/465bd584ab2657668ec313f64281e921b4a70b10 |     
   sh4aeb    | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/2cf276abdefd6975461dd3aec0dd06c9bb0bfbcd |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/1ed128623469930c8e3a23dcd58bc596b5986340 |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/db12e3caf442ff8dd5c4babf2d812f5fce175d22 |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/58c5fb626ee89f86857d179721a9d5e7d0570b4e |     
 aarch64_be  |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/0bc04b1d176965991020589ada00e8dff3328f5f |     
   armeb     |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/4250810d4e6a4547021f3ab2f5702221be96cb12 |     
   armeb     |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/2b9a3b30d7f5732d269ea7ddee926226c843dffd |     
 microblaze  |       gnuradio-3.10.7.0        | NOK | http://autobuild.buildroot.net/results/77af1516ded88e471bb3f49cc503fdd398d4b136 |     
   s390x     |       gnuradio-3.10.7.0        | NOK | http://autobuild.buildroot.net/results/95c6a8f31bbc69f40e02b42d53427ba93a4a104a |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/c9721f460341b0804cd2ab186f25e97a2cb429c1 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/50e9c813ad906b705cf860951bdcba7428fcb80c |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/153aeebe430361e42e51305e5a2e3643e6a74b40 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/e5b04d21407d20cb6769f7eb19abe07d9249b80c |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/9d8862679681b76a4b69308a63df3af8e95ac7c0 | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/c31ee6fef2944e7ece82320361afd956476a88af | ORPH
   mipsel    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/26c96b28fabab9cabb15b2168f4acabcc1f82509 | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/3c03c1bf739d9c34906a7924a0cb2dc6505912e4 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/a29af6dbc7533653c66050b46a13b26a85f34ce3 | ORPH
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/3939148b8a59bd3da2f4de0c911ca9352f6c9510 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/6d12ac628bfb1c7af589e6065df9410ed171a9f1 | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/51bf6a7f772e7cb33e0e958b6f6009765b72ee5b | ORPH
   mipsel    | google-breakpad-f49c2f1a202... | NOK | http://autobuild.buildroot.net/results/24e352ed6f6c94756ab8d8796d7295bec1f9ea4b |     
    sh4a     |        graphene-1.10.8         | NOK | http://autobuild.buildroot.net/results/86b3ccebd09c9e3c1d4736418298f8d02bc32fbd |     
  powerpc    |       host-binutils-2.42       | NOK | http://autobuild.buildroot.net/results/065abf5a1804a1933dc82b90b171a4bf92a9514e |     
   mips64    |       host-binutils-2.42       | NOK | http://autobuild.buildroot.net/results/84453166bb3d406c4050c79e9707c79f8fe33ae6 |     
microblazeel | host-binutils-bare-metal-2.42  | NOK | http://autobuild.buildroot.net/results/f01e6a0879fd63e37a3bc6af2c674b35124eeacd |     
 microblaze  |   host-gcc-bare-metal-14.1.0   | NOK | http://autobuild.buildroot.net/results/3ce8bcb1ccb887902cdb0813904b0efaa923dcd0 |     
   arceb     |   host-gcc-bare-metal-14.1.0   | NOK | http://autobuild.buildroot.net/results/087dad52ed93399f59172d90fcc9f67d68a21389 |     
  sparc64    |   host-gcc-bare-metal-14.1.0   | NOK | http://autobuild.buildroot.net/results/aa91c829b330dbf32f54d30bead9280415c9e6c9 |     
microblazeel |   host-gcc-bare-metal-14.1.0   | NOK | http://autobuild.buildroot.net/results/54319f1f36b1e73d54f151e98263e5829cd5ecb1 |     
   x86_64    |   host-gcc-bare-metal-14.1.0   | NOK | http://autobuild.buildroot.net/results/a7d569b559aeeba2dd74ccb757b678560719c186 |     
microblazeel |   host-gcc-bare-metal-14.1.0   | NOK | http://autobuild.buildroot.net/results/6538cfea6822e93548660630ae371bf876dd62f6 |     
    i686     |   host-gcc-bare-metal-14.1.0   | NOK | http://autobuild.buildroot.net/results/5b08e6bb5d01c6878c3455039c8c90d79d01a06a |     
 powerpc64   |   host-gcc-bare-metal-14.1.0   | NOK | http://autobuild.buildroot.net/results/89a2623fa66623a817e8efa2ecd35018723e7fe4 |     
    sh4a     |   host-gcc-bare-metal-14.1.0   | NOK | http://autobuild.buildroot.net/results/33ac9d04d72a978d28d39eedcb6d42abe03ec6be |     
    sh4      |   host-gcc-bare-metal-14.1.0   | NOK | http://autobuild.buildroot.net/results/8cc6a24ddd73153da98eb27a30a269ac8efb916c |     
microblazeel |   host-gcc-bare-metal-14.1.0   | NOK | http://autobuild.buildroot.net/results/6c79284174e176a9031ee042992d6d9d7bd6bbf1 |     
  sparc64    |   host-gcc-bare-metal-14.1.0   | NOK | http://autobuild.buildroot.net/results/030a543f2c9ff3f30c6267abe02caef549a5bd60 |     
 powerpc64   |   host-gcc-bare-metal-14.1.0   | NOK | http://autobuild.buildroot.net/results/91c26657a7b15c09463f556a1ed1331f5fcd8720 |     
  powerpc    |   host-gcc-bare-metal-14.1.0   | NOK | http://autobuild.buildroot.net/results/184aef98379b65fed80db317cf62c7f208fe116a |     
   sh4eb     |   host-gcc-bare-metal-14.1.0   | NOK | http://autobuild.buildroot.net/results/e8e662597934f25af26bc89f22fbec5d5cfb6a3b |     
    sh4      | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/c6d8347da329cacd55cdc74127667d6fd2fe5e06 | ORPH
    arm      | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/07775fa09fbf96fc28a277cae2beefed373e7a57 | ORPH
    sh4a     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/357ef2f22aae7d206c179521340a7c7127806567 | ORPH
microblazeel | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/7b115dd2003f78d719b5bc699aa5c51cc4e98c27 | ORPH
powerpc64le  | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/4f3e72e46e1c6df41854ca9cc25676b2cffeed77 | ORPH
 microblaze  |       host-libtool-2.4.6       | NOK | http://autobuild.buildroot.net/results/6602c8714eca70b2a03e314d653df95bc80a4097 | ORPH
powerpc64le  |       host-libtool-2.4.6       | NOK | http://autobuild.buildroot.net/results/def23b04d03db2f54f6272fb18827aafd2e35071 | ORPH
microblazeel |       host-libtool-2.4.6       | NOK | http://autobuild.buildroot.net/results/e999941056999a643e92ae8b2e0f8994ee10b594 | ORPH
    arc      |       host-libtool-2.4.6       | NOK | http://autobuild.buildroot.net/results/56f44ebe3949b751554fd6c4fec1fcdec4d09dbf | ORPH
    i686     |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/caaa0427772eb63674864426c021d685f37a120b |     
   sparc     |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/147226e8a8f19c41c9306361e293321aa372f7b5 | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/bc6a9c5c5934473679c8ef200ca067f8bbeee889 | ORPH
  sparc64    |        host-rust-1.79.0        | NOK | http://autobuild.buildroot.net/results/6aaa1e57fc44ecd83b8c791ce7cfdfa849dd07cc |     
   x86_64    |        host-rust-1.79.0        | NOK | http://autobuild.buildroot.net/results/d4d110e6f0a30e5cb6df2fceb334bbfc33f707dc |     
   armeb     |        host-rust-1.79.0        | NOK | http://autobuild.buildroot.net/results/61d88ef7bbda8341208e0cb0bbf18efed3e370b9 |     
   x86_64    |        host-rust-1.79.0        | NOK | http://autobuild.buildroot.net/results/c673e28d40ee7e237e9687e695623f970b52d13f |     
  sparc64    |        host-rust-1.79.0        | NOK | http://autobuild.buildroot.net/results/609f48068f3d1abdf72d9a425f287e51c53ab6be |     
   x86_64    |        host-rust-1.79.0        | NOK | http://autobuild.buildroot.net/results/22015d67e7684602c77630d80671ccc2501ffc7f |     
  sparc64    |        host-rust-1.79.0        | NOK | http://autobuild.buildroot.net/results/7f4568dae8b4ae333b724fa1f71ccd6db5cd0681 |     
   x86_64    | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/3ca2d4d3715aa4da7d3b6742cc0e9ed28e4007a0 | ORPH
 powerpc64   | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/7c058cd78de56bcfd0f5f60dbbcd6fcb9068311a | ORPH
   s390x     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/59e35566b026156d49b1b2d3d122a615b2e50b0c |     
  powerpc    | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/a28ef9397598c6c08f4d93ae6bb5d4eb5349308c |     
 aarch64_be  | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/5647a388fbc880dd5fdd72ebdbd5a2040339cb4f |     
  riscv64    | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/54eb4b0136e6a981abeddd73e9152e999d3b7fd5 |     
  mips64el   | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/dd2e6128653f96b060d79c458c4fb65fb6f7c804 |     
  sparc64    |           htop-3.3.0           | NOK | http://autobuild.buildroot.net/results/3c420410609fd57753611c0ff887d31ccfab4827 | ORPH
  powerpc    |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/a0f15eaf837f635c3949daea0d5954620d3c1e0e |     
   sparc     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/b12d8d6c21f9dc6cc2db862819b84cc4fffca952 |     
    i686     |           ipset-7.16           | NOK | http://autobuild.buildroot.net/results/f1c2e49d23ac6a9294e2391c5e07fecfb5245cc9 |     
   armeb     |       libargtable2-2.13        | NOK | http://autobuild.buildroot.net/results/103fb2bd63e9d9e53a9f11e5d545f522c1fecbcf | ORPH
   sparc     |         libdrm-2.4.122         | NOK | http://autobuild.buildroot.net/results/24a90faafdb9c2c9f13150b40d1d2cf9ee9a3d82 |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/f1e515c68a7a10c011e78fcb38a29df22ed3706c |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/46a2434b2c3059b39eb8418215b0c84f045b6a42 |     
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/c2b9ba9ed9cefa01ae0762792a6daaed05c6c6d7 |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/637f64fd1ded1036540fc272660c341df36dbaf4 |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/28b1c4e5a4cfe0325d2f25f0c3b6fc079062ed18 |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/1f41c242f3fb10330ecc7976cb5a64480e949145 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/6f7718c45f6d487655313df099cf3f1605a3b61d |     
    arm      |       libgpg-error-1.50        | NOK | http://autobuild.buildroot.net/results/1e56209b6da5108214a795c3e8eb53766484f1cf | ORPH
    arc      |     liblog4c-localtime-1.0     | NOK | http://autobuild.buildroot.net/results/6a600e0b8c1ca01a6422526d63bda9f28e6ddf31 |     
  mips64el   |      libmaxminddb-1.10.0       | NOK | http://autobuild.buildroot.net/results/f232d96f11eeab79c0a92287ff378356fb51fb86 |     
  mips64el   |         libressl-3.9.2         | NOK | http://autobuild.buildroot.net/results/7883ffe9ed96f38f9ca359e99a18a548b6f35c24 | ORPH
   mipsel    |         libv4l-1.24.1          | NOK | http://autobuild.buildroot.net/results/9615df7e5d8714daf674e51c5db544588eb9bc70 |     
  sparc64    |        lighttpd-1.4.76         | NOK | http://autobuild.buildroot.net/results/b993728d2bb823a2c74466f016d68cdd4b689812 | ORPH
  sparc64    |        lighttpd-1.4.76         | NOK | http://autobuild.buildroot.net/results/551f6f02baecf97eee4bcc3cd85c254ecda60518 | ORPH
   sparc     |        lighttpd-1.4.76         | NOK | http://autobuild.buildroot.net/results/67eda6950b38b9a8c596e58568d4c9de6e18c5c6 | ORPH
   sparc     |        lighttpd-1.4.76         | NOK | http://autobuild.buildroot.net/results/eaf903ac5a05dc02168305141481553a613cf812 | ORPH
    i686     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/bcb455dd40b0e38c2c12336c37d073d82d8c5c1e | ORPH
   armeb     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/aebbd553842711fe1e7ebee0b2d4ed553a03d6ae | ORPH
   s390x     |          linux-6.10.3          | NOK | http://autobuild.buildroot.net/results/f7eb5fb9ba34673e3d687938ff0738d298840e8c | ORPH
    m68k     |          linux-6.10.3          | NOK | http://autobuild.buildroot.net/results/9263485e7e018722bd5de12bc610fa896487065c | ORPH
    m68k     |          linux-6.10.3          | NOK | http://autobuild.buildroot.net/results/ba2d49d44cb51cafd34459d3ed973e5ef693d201 | ORPH
   arceb     |          linux-6.10.3          | NOK | http://autobuild.buildroot.net/results/250bfd3bd88f940b2deae27cfd183c18999257e7 | ORPH
    sh4      |          linux-6.10.3          | NOK | http://autobuild.buildroot.net/results/3e84d2ca0e96985232113a84347b1e2916023577 | ORPH
   mipsel    |          linux-6.10.3          | NOK | http://autobuild.buildroot.net/results/654c0882acc4a2547cdebf8632e621309cb03ef7 | ORPH
  mips64el   |          linux-6.10.3          | NOK | http://autobuild.buildroot.net/results/15af77c9db5d3f8cdadf0fd22af03af775e4c4cb | ORPH
 aarch64_be  |          linux-tools           | NOK | http://autobuild.buildroot.net/results/bae75e8a8117d60aa8439c8d86310a6ab8d4a1f8 | ORPH
 aarch64_be  |           lxc-5.0.3            | NOK | http://autobuild.buildroot.net/results/6c9d46d5f268854c74744740db4c77e1f8070d81 |     
  riscv64    |           lzip-1.23            | NOK | http://autobuild.buildroot.net/results/e15c714a88750fb1961c3515c928a6a4e8fbc141 | ORPH
    i586     |         memtest86-6.20         | NOK | http://autobuild.buildroot.net/results/f14a031e18e2ae90d97878d6e89f961e4d36df36 |     
powerpc64le  |          mender-3.4.0          | NOK | http://autobuild.buildroot.net/results/ec1d1c30311579422a08e898cd9d508a8f7dfc27 |     
   s390x     |          mender-3.4.0          | NOK | http://autobuild.buildroot.net/results/50f24141e3547ef010872fdacdda23e5f2a74587 |     
  aarch64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/68d1171ec3ac707330d1df28703a5ef2e551066d |     
   s390x     |           mpv-0.35.1           | NOK | http://autobuild.buildroot.net/results/0c7b17e1cc1e5bf6ccc104aec177a1fa41e6333e |     
    arm      |          mupdf-1.23.9          | NOK | http://autobuild.buildroot.net/results/7834ed6f3e40073288d0f93460624ccaa16f49a0 |     
  powerpc    |      ncurses-6.4-20230603      | NOK | http://autobuild.buildroot.net/results/e2ba6a5554bfa0bf9b4c2eaf9222d041204f00e9 | ORPH
microblazeel |         nethogs-0.8.7          | NOK | http://autobuild.buildroot.net/results/a250f6f3e93ceddad2d4c7cd1f29233fce2b327e |     
    mips     |         nethogs-0.8.7          | NOK | http://autobuild.buildroot.net/results/b68e8c601b31c70bc30cdfe913f7988f54255dbf |     
   s390x     |         nethogs-0.8.7          | NOK | http://autobuild.buildroot.net/results/298090dfb9db42ba9f219d2c268bc798373142c7 |     
   mipsel    |         nethogs-0.8.7          | NOK | http://autobuild.buildroot.net/results/b59851d542418ad0f40d86b32dc7573248233de4 |     
   sh4aeb    |         nethogs-0.8.7          | NOK | http://autobuild.buildroot.net/results/18cc7058d567916c7d2bfb16b7808b71ed731948 |     
   armeb     |         nethogs-0.8.7          | NOK | http://autobuild.buildroot.net/results/786e68c8c397038511db4e8bea589839a7d9b056 |     
   s390x     |         nethogs-0.8.7          | NOK | http://autobuild.buildroot.net/results/8eddfca525f6951e6d11184e312cffccfc443ba8 |     
   s390x     |         nethogs-0.8.7          | NOK | http://autobuild.buildroot.net/results/bdfc7b723abdf4aea48e40e789883405061e4e1c |     
  aarch64    |       nodejs-src-20.15.1       | NOK | http://autobuild.buildroot.net/results/5cc38af2a020e7e0bceff089c5469d1c97e3b6c5 |     
  powerpc    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/9cadb0943a31b8759489839bfa1e11f4de27f038 | ORPH
    or1k     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/91b7a32ed1f92b41b7a9b98cb4369ea5fcbcc4c3 | ORPH
  mips64el   |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/397705b97af71484f190470e38f90605c0b13564 | ORPH
powerpc64le  |          octave-9.2.0          | NOK | http://autobuild.buildroot.net/results/7968243b7244de7aa24cc30074c36bf2669c3727 |     
  mips64el   |        openblas-0.3.27         | NOK | http://autobuild.buildroot.net/results/c261eb5245ab7c70502417077674cd6eed7ce381 |     
   nios2     |        openconnect-9.12        | NOK | http://autobuild.buildroot.net/results/f535a63b80f2efe59709d5d9b59bc27ba66d2c26 |     
  aarch64    |        openconnect-9.12        | NOK | http://autobuild.buildroot.net/results/83966cccdb44adff9e891c074dc1b193b3d3e7f7 |     
   x86_64    |         opencv3-3.4.19         | NOK | http://autobuild.buildroot.net/results/985b6cdcc0216b7a20d8c688daa37255064a6057 |     
powerpc64le  |         openssh-9.8p1          | NOK | http://autobuild.buildroot.net/results/ba5f1ac4ff26f327070738f431632ec8a2c161d3 | ORPH
   xtensa    |        poppler-22.12.0         | NOK | http://autobuild.buildroot.net/results/b81bf40ba195a0c4c4a23afb13a567251a141f88 |     
  powerpc    |      powerpc-utils-1.3.11      | NOK | http://autobuild.buildroot.net/results/5d6558a9421e4c435e7fa500dbe243af702783ff | ORPH
   mips64    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/e6c039dc0e66dacd714c618529b3150a9970e5e5 | ORPH
   sparc     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/8307925dd37e7425c311edf58b451282c1cc3880 | ORPH
   s390x     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/eff1480cd68f8b09e3da6177965ca8dc32fe47e2 | ORPH
   s390x     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/eeda7b25701ea7f969721351d2a1384b2c841489 | ORPH
 microblaze  |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/44319fc498936ea1e6439e241da6979a81afc725 | ORPH
 microblaze  |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/5b51de533f0ad63131bf4d3d54a09f451855f673 | ORPH
  sparc64    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/26d041d348f3de3789c5a31912649228d7ec9eb4 | ORPH
    arm      |        pulseaudio-17.0         | NOK | http://autobuild.buildroot.net/results/ab0deb8133cd2eadb499b1ef99b9fbdb782b3630 | ORPH
 powerpc64   |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/840c6baeae50ea59ba02e0aea690b74c366a4dd0 |     
   mips64    |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/3c812967170f29e4962681f12c62195cce41531c |     
  sparc64    |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/ffc94b4c73401f1fa7a7bb5a7da2dcc4170fd6ea |     
   mips64    |   python-cryptography-39.0.2   | NOK | http://autobuild.buildroot.net/results/d509b235a480aca3b6bb08a74e7f0361b35b84bd |     
    sh4      |   python-cryptography-39.0.2   | NOK | http://autobuild.buildroot.net/results/2cf91543771b6bcdc19d520d1707e2c7bc460fdd |     
    i686     |      python-daemon-3.0.1       | NOK | http://autobuild.buildroot.net/results/c9c99771e7b773b4763c433693575cafbdb06f56 |     
   x86_64    |      python-daemon-3.0.1       | NOK | http://autobuild.buildroot.net/results/7f75caecbf7bf8187d45da2e9ecab2e735dccf64 |     
  sparc64    |  python-pypika-tortoise-0.1.6  | NOK | http://autobuild.buildroot.net/results/202bc63351bc5f40378624f9ba043aa51053470e |     
  sparc64    |  python-pypika-tortoise-0.1.6  | NOK | http://autobuild.buildroot.net/results/80ec106528cfbe176544a8cfc9f510d2018344fe |     
   armeb     |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/25726750cb68cc41d06934fc3f90e044de5213ca |     
  mips64el   |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/df12f3bbe95779b93c9e5ff31e499535fdba9971 |     
  riscv64    |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/beab15958d522a0bf7bf9915063d75602867bd92 |     
   xtensa    |         s6-dns-2.3.7.2         | NOK | http://autobuild.buildroot.net/results/f19b6befa97665e6a8ebde4c8df609348ddde876 |     
   sparc     |         s6-dns-2.3.7.2         | NOK | http://autobuild.buildroot.net/results/0098024da4b0c226cb1e8dba82c009cb89d1d944 |     
    arc      |         shadow-4.15.1          | NOK | http://autobuild.buildroot.net/results/0335bbf7e4e6cdf2480a384bafba624fde557362 |     
 aarch64_be  |       sofia-sip-1.13.17        | NOK | http://autobuild.buildroot.net/results/07ddedda382da5f56e38a971b4f4df014c3e771b |     
 microblaze  |       sofia-sip-1.13.17        | NOK | http://autobuild.buildroot.net/results/1c3878505a94b4c5e88f541ab866f9b42a612857 |     
    m68k     |          strace-6.10           | NOK | http://autobuild.buildroot.net/results/bd5b332c3ba88686b1090d973d6b2bcabdeccc38 |     
    arm      |         systemd-256.4          | NOK | http://autobuild.buildroot.net/results/4dc2cb5dc5661cf08f26656d6a9a9f2a8bc3cd27 |     
    m68k     |         systemd-256.4          | NOK | http://autobuild.buildroot.net/results/f38623349b73b4c1092d8a5adedacf74d1473527 |     
 microblaze  |        tcf-agent-1.8.0         | NOK | http://autobuild.buildroot.net/results/257c1defaf89f200f808690949739fb00a764694 |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/ee91c43ad2736ce0d57fd7a700cee01b7d3083c0 |     
  riscv64    |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/37f13af5abc506ceee387717e350e2e01e9381f3 | ORPH
   mipsel    |        valgrind-3.23.0         | NOK | http://autobuild.buildroot.net/results/55d0e0cad0f987198056e3dee5aeec3559b906fd | ORPH
  mips64el   |        valgrind-3.23.0         | NOK | http://autobuild.buildroot.net/results/34983cf68089fea436420aa047a93d9499429a63 | ORPH
   mips64    |        valgrind-3.23.0         | NOK | http://autobuild.buildroot.net/results/ed56e11b0fefd58a38516fe66141d34ae68e2c19 | ORPH
  powerpc    |           volk-3.0.0           | NOK | http://autobuild.buildroot.net/results/a3c4099914b19bd3bb6e333d8e57ea9f3be6bf93 |     
  aarch64    |     wpebackend-fdo-1.14.2      | NOK | http://autobuild.buildroot.net/results/92c5cc3134e92c263a0cbb4c05ef8956569e434b |     
    arm      |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/74d0ccababd465f17ea0ed1322fb578529a045a2 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                  bcusdk-0.0.5 | 1 
         gobject-introspection | 1 
host-prelink-cross-a853a5d7... | 1 
               mariadb-10.11.6 | 1 
                mongodb-4.2.18 | 1 
                  ntp-4.2.8p18 | 1 
   openvmtools-11.3.5-18557794 | 1 
               valgrind-3.22.0 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/c387f7b756217af5616e1fdd6b78eb25bf87a404 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/a11cfbbdfe789010e8b48a583bf4d43534b194b5 |     
microblazeel | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/98755f77c4980f9cac0d917c383fb86cef4506d6 | ORPH
   sparc     |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/31cfc969d9b8050435caac0b7b5e7797c5ebd129 | ORPH
  aarch64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/6192ec1d9659775bc9017d7cad608f43d87b179c |     
   sparc     |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.net/results/84f19303057c1fcb70e425c687e7ff7d22a3eb2b |     
   x86_64    |  openvmtools-11.3.5-18557794   | NOK | http://autobuild.buildroot.net/results/f930676b1adf12064968cd8906520a5f92e3a73b |     
    mips     |        valgrind-3.22.0         | NOK | http://autobuild.buildroot.net/results/1c179937594725ef667ae6d273471bc6ff5fd210 | ORPH


Classification of failures by reason for 2024.05.x
--------------------------------------------------

     bandwidthd-2.0.1-auto-r11 | 1 
host-go-bootstrap-stage2-1.... | 1 
                  host-qt6base | 1 
      host-riscv-isa-sim-1.1.0 | 1 
              host-runc-1.1.12 | 1 
               openblas-0.3.27 | 1 
pistache-3ec9d7c4f8b828fdd3... | 1 
tftpd-e52af4207a6e09a1ba21f... | 1 
                   uhd-4.3.0.0 | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   |   bandwidthd-2.0.1-auto-r11    | NOK | http://autobuild.buildroot.net/results/75742912fcbb747e65e587e0f6eadc67e0873e0a |     
  mips64el   | host-go-bootstrap-stage2-1.... | NOK | http://autobuild.buildroot.net/results/34ac628b9c9a9a7ac22c43dccd1f81e612625a99 |     
   mipsel    |          host-qt6base          | TIM | http://autobuild.buildroot.net/results/a3d2f9a9de4ea3822ccd8bbb84c41df91e1e9ce4 |     
   mipsel    |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/5cc3b3edcc5073f3ca176b1dd99e6f456b86a5af |     
    arc      |        host-runc-1.1.12        | NOK | http://autobuild.buildroot.net/results/4c3b3eefaf3f760ca7defbec8256f4979db7fa90 |     
   mips64    |        openblas-0.3.27         | NOK | http://autobuild.buildroot.net/results/092c016165af8107e04ecc5b70ac17cd970e5afc |     
    m68k     | pistache-3ec9d7c4f8b828fdd3... | NOK | http://autobuild.buildroot.net/results/b5f61ba6f8b4899bf8136058b5cb8edbab6b25e1 | ORPH
   x86_64    | tftpd-e52af4207a6e09a1ba21f... | NOK | http://autobuild.buildroot.net/results/0532e1c63918f2024034f9b32121522104fb5729 | ORPH
    arc      |          uhd-4.3.0.0           | NOK | http://autobuild.buildroot.net/results/b8fef55c1e5f8fda29e6534ac4919ea772eb00da |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
