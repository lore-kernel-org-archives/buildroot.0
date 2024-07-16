Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 677E3C3DA59
	for <buildroot@archiver.kernel.org>; Tue, 16 Jul 2024 06:00:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C46080BE3;
	Tue, 16 Jul 2024 06:00:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b9iHOA40hYp3; Tue, 16 Jul 2024 06:00:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7801F80B7B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7801F80B7B;
	Tue, 16 Jul 2024 06:00:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F178E1BF398
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 06:00:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E148340474
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 06:00:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IiutkJRPxwnD for <buildroot@lists.busybox.net>;
 Tue, 16 Jul 2024 06:00:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F14E240457
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F14E240457
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F14E240457
 for <buildroot@buildroot.org>; Tue, 16 Jul 2024 06:00:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D28CAFF803
 for <buildroot@buildroot.org>; Tue, 16 Jul 2024 06:00:17 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Tue, 16 Jul 2024 06:00:17 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1721109618; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=/pgBOTCJEm+5IYQ6/xiRV/TL/9wiNSd+bxUnKy8j5tI=;
 b=dRstwFhGWzSwfpcrYIyNvAzw4CHuSIF94gJe2MGSIwfArIhAL+n0dKeZspGUUwDW0JbKpL
 x/B2JPX7IaIHLJwwkg8UeNiZ8AfhQK7Fk5miJnXpjXWDdl5xeS0Od/ayhiaSiJmIWWlnw3
 GW7Cd4P/1PUQXzl705z/H+eNxDOkMJsRZIHdxKssQvD7flJyoT0vSmB37cGhVVfzZ6zIh2
 qyIsN6tha58MTMYckm85Mw8mm9NUbN/z/fhv8rd8+chGonf5/8gzQ7MbwTUfYFrZgr1Lob
 lpNY3UlTeXWYf7vBkjqNip1X7p4QYcx5PSqq6//GARJ1ZbO35aFifhlsUnD37Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dRstwFhG
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-07-15
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
Message-ID: <20240716060017.6W-NRWgwEPm_10BLMIzg0i2hlvIhkml61hRZ5zJ6574@z>

Hello,

Autobuild statistics for 2024-07-15
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  7  | 19  |  1  | 27  |
  2024.05.x  |  3  | 25  |  0  | 28  |
    master   | 108 | 415 |  1  | 524 |

Classification of failures by reason for master
-----------------------------------------------

                  cairo-1.18.0 | 102
                 host-tar-1.35 | 40
edid-decode-6f117a8f8c0e76e... | 16
                     avahi-0.8 | 12
ibm-sw-tpm2-5452af422edeff7... | 11
  gobject-introspection-1.76.1 | 10
                elfutils-0.189 | 9 
                   httping-2.5 | 9 
                    mpir-3.0.0 | 9 
glibc-2.39-74-g198632a05f6c... | 8 
                host-odb-2.4.0 | 8 
               libglib2-2.76.1 | 7 
                  bcusdk-0.0.5 | 6 
                   linux-6.9.8 | 6 
                  ffmpeg-6.1.1 | 5 
host-vboot-utils-bbdd62f9b0... | 5 
               tipidee-0.0.5.0 | 5 
                     apr-1.7.2 | 4 
 host-softether-4.30-9700-beta | 4 
                    norm-1.5.8 | 4 
                       unknown | 4 
aer-inject-9bd5e2c7886fca72... | 3 
                 dc3dd-7.2.641 | 3 
                   evemu-2.7.0 | 3 
            gdk-pixbuf-2.42.10 | 3 
                gnu-efi-3.0.18 | 3 
              host-rust-1.79.0 | 3 
                libressl-3.8.4 | 3 
     linux-5.10.162-cip24-rt10 | 3 
               mariadb-10.11.6 | 3 
                python3-3.12.4 | 3 
android-tools-4.2.2+git2013... | 2 
                 apache-2.4.61 | 2 
                 erlang-26.0.2 | 2 
                  fbterm-1.7.0 | 2 
            host-binutils-2.42 | 2 
 host-binutils-bare-metal-2.42 | 2 
        host-btrfs-progs-6.9.2 | 2 
     host-moby-buildkit-0.11.6 | 2 
                    htop-3.3.0 | 2 
                       kmod-31 | 2 
                 libp11-0.4.12 | 2 
                  libsepol-3.6 | 2 
                    mpv-0.35.1 | 2 
          ncurses-6.4-20230603 | 2 
                  ntp-4.2.8p18 | 2 
ulog-0389d243352255f6182326... | 2 
                unbound-1.19.1 | 2 
                  zabbix-6.2.7 | 2 
aubio-152d6819b360c2e7b379e... | 1 
                    bcc-0.29.1 | 1 
             berkeleydb-5.3.28 | 1 
                  boost-1.83.0 | 1 
                bpftool-v7.1.0 | 1 
brcm-patchram-plus-95b7b691... | 1 
                    brltty-6.6 | 1 
              cache-calibrator | 1 
             can-utils-2023.03 | 1 
dvb-apps-3d43b280298c39a67d... | 1 
                    fcft-3.1.6 | 1 
                flannel-0.25.4 | 1 
                   foot-1.16.2 | 1 
                     frr-8.5.4 | 1 
                  gamin-0.1.10 | 1 
                gerbera-1.12.1 | 1 
           ghostscript-10.03.1 | 1 
                 glibmm-2.76.0 | 1 
         gobject-introspection | 1 
                haveged-1.9.18 | 1 
               host-efl-1.26.3 | 1 
         host-gcc-final-13.3.0 | 1 
       host-gcc-initial-13.3.0 | 1 
           host-gengetopt-2.23 | 1 
host-heimdal-f4faaeaba371ff... | 1 
            host-skopeo-1.13.3 | 1 
igh-ethercat-f5dc109176400f... | 1 
               ipmitool-1_8_19 | 1 
                iproute2-6.9.0 | 1 
                jemalloc-5.3.0 | 1 
                  ledmon-1.0.0 | 1 
          libcamera-apps-1.2.1 | 1 
                 libcli-1.10.7 | 1 
                libcuefile-475 | 1 
           libfreeimage-3.18.0 | 1 
                libglvnd-1.4.0 | 1 
                liboauth-1.0.3 | 1 
              libostree-2023.8 | 1 
                  libva-2.22.0 | 1 
               lighttpd-1.4.76 | 1 
                   linux-tools | 1 
        ltp-testsuite-20240524 | 1 
ltrace-82c66409c7a93ca6ad2e... | 1 
                memtest86-6.20 | 1 
                 mesa3d-24.0.9 | 1 
            mesa3d-demos-9.0.0 | 1 
              mosquitto-2.0.18 | 1 
                     mtd-2.2.0 | 1 
                  mupdf-1.23.9 | 1 
                numactl-2.0.16 | 1 
                    ola-0.10.9 | 1 
                 openssh-9.8p1 | 1 
                openswan-3.0.0 | 1 
                   perl-5.38.2 | 1 
               pipewire-0.3.81 | 1 
               poppler-22.12.0 | 1 
         python-remi-2022.7.27 | 1 
             rabbitmq-c-0.13.0 | 1 
                 rrdtool-1.8.0 | 1 
rtmpdump-c5f04a58fc2aeea629... | 1 
                softhsm2-2.6.1 | 1 
                tpm2-tss-3.2.2 | 1 
                   trinity-1.9 | 1 
               xapp_xdm-1.1.14 | 1 
                      xz-5.6.2 | 1 
               zxing-cpp-2.1.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/42bf3ec5984c3bcdb5d31427971881868ba85798 | ORPH
 microblaze  | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/90429e4d02e3b67d1e90dbf3f0c10b711c51604d | ORPH
   x86_64    | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/781b6785b3665679e4381bb2cb8d87a7555ea205 | ORPH
powerpc64le  | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/034028ff7e1c503f4fa2fbc9526175b748521a15 |     
   arceb     | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/1cbe87bbe3c56f28444b3aaba1ba1d05f947d36e |     
   armeb     |         apache-2.4.61          | NOK | http://autobuild.buildroot.net/results/b3cb4b299af2ad3242e82c1e2a4f7728a455d4c0 |     
   nios2     |         apache-2.4.61          | NOK | http://autobuild.buildroot.net/results/6a6d48199ef3bc33731a3e1b2dfefee4bc9cb0d3 |     
  powerpc    |           apr-1.7.2            | NOK | http://autobuild.buildroot.net/results/c7262dca60e257f63b10f962dd3ce2d159c23572 |     
microblazeel |           apr-1.7.2            | NOK | http://autobuild.buildroot.net/results/ad025dec20257a8248154426c7551adea8eadeb8 |     
    i686     |           apr-1.7.2            | NOK | http://autobuild.buildroot.net/results/46071cd4fc222162452df7348fa1ffe66bc8e299 |     
   mips64    |           apr-1.7.2            | NOK | http://autobuild.buildroot.net/results/65305b3f54ac8549b4536025e3b9245263d3ee45 |     
   s390x     | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.net/results/ece2ac0e33fa261a987fdf68dfe7e4554f1147c8 |     
powerpc64le  |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/ab78267770d7580f0b768a993f3a14542a1ee733 | ORPH
    sh4      |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/a8da367a57d58e619d485ccc1b6f19e4387f995a | ORPH
    i686     |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/43c6890654b13b1609877b7e206d4a6dc9f28c26 | ORPH
   armeb     |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/c012a8bbc9ae39ea965328dbee1d3165c45366a6 | ORPH
    m68k     |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/8546fb33aa4b2a7b4aec271b58f3ea726744a28f | ORPH
 microblaze  |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/bae8d60ef5a219942bb494b7c4e3c2c4346558c1 | ORPH
 powerpc64   |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/94590bd70d5569eb78acadf78d40d5eb384c6229 | ORPH
    arm      |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/6eaef4d5a3fb71445037e048befdea8e9de71619 | ORPH
    i686     |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/6b83d2d69c5266369e31a278eb6400616288e889 | ORPH
   x86_64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/a00d1e0f51d07db8e55b00a1ce8cd84299fd78a7 | ORPH
  mips64el   |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/b61c65e49df545352d0d33065e439de72e98229f | ORPH
   x86_64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/c61aa22efbeb1cd35e4aeb59ac2ef765d9c79c03 | ORPH
  aarch64    |           bcc-0.29.1           | NOK | http://autobuild.buildroot.net/results/3e1105c041a3ce2be9a3ee71032a43730c57c565 |     
   arceb     |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/6e2f4c635b248d961fa8a321724b37d56e324896 |     
  sparc64    |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/cede7ee05dd090bb6e0075653ecadefdd7fb3341 |     
    arc      |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/4acb4538eeff9d357e761d273bd156417a792f99 |     
  riscv32    |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/7070f38ff35a4bea228814345b4da83a985827cf |     
   sparc     |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/3d8eec0b395f5891056ca37f4953419ca1639dd6 |     
   s390x     |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/8faef2a3a3dc56fb02cebbf741103a12ce2bf755 |     
   armeb     |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/03fa494f4fce4ef00050fdc33d70751796bf02bc | ORPH
    sh4      |          boost-1.83.0          | NOK | http://autobuild.buildroot.net/results/e649e5c400d9e51365d5cf0e935bf313f2ee0c42 |     
  aarch64    |         bpftool-v7.1.0         | NOK | http://autobuild.buildroot.net/results/c681cba6bcf50758c5a16f867a89911e3f240989 |     
    arc      | brcm-patchram-plus-95b7b691... | NOK | http://autobuild.buildroot.net/results/c282e321ff9ef91d6f398bc333341e9403e7ca1f |     
    mips     |           brltty-6.6           | NOK | http://autobuild.buildroot.net/results/beb53a3ddf6dbc3e711531e83ad0248ab7dc3c68 |     
  powerpc    |        cache-calibrator        | NOK | http://autobuild.buildroot.net/results/0c07544c7cdf1a5e0f12b95375b40edfa7928223 |     
  mips64el   |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/1bbaf97c9445993f52da8b8cce963b975a399ab5 |     
    m68k     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/ecb26bf1023200d5311ca33632ba5fe60b33ade0 |     
  riscv32    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/734a375bedba3514a2dfd1d586e8d5ad91200cc8 |     
   s390x     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/fe7d7551cd4c73d3290ed062e9f1fe9ea77ac63e |     
  powerpc    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/2883680207c6411d1943f536015c4f935ae36d05 |     
  riscv64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/e9feb1fd737e6fbc26df35ae986a9b6d93677bd2 |     
   sparc     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/59544d5704d4ea88ac6f295baf0f0bbbcdd73fe0 |     
   sh4eb     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/a79e86f0caa6a2b54279a441c73ef2dd75231ef5 |     
   nios2     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/654e6520acc6b0ff98a396041c507d64dd34af17 |     
    mips     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/3516936ac59496120daebf49f7cf996d75c04748 |     
  sparc64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/2e4fe3a7fe7928c000bc9fd43dbeb7f11ea3a8e0 |     
   sh4eb     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/2809d19d64559672c8902eaf0246c2722363cd73 |     
 microblaze  |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/95b8e24d442992e8450da01b9a2ba5b5dd15ac0f |     
 aarch64_be  |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/dc4da4c5eddcfbcb8c91d4ab58a01c449eaf197f |     
   nios2     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/64fdfda5b5a239cc5dca335572b8cc26335118e4 |     
  mips64el   |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/e8ab84c8e397f8630379d1921de2baae8d03e0fd |     
   arceb     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/976756d72e2427c9c6bc71a13d542861a92d7023 |     
  mips64el   |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/567712d50cc773c4b033fa836274dc11ea920c67 |     
   armeb     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/e1997c70bf55b23431f68b56564237a54500cfb1 |     
   arceb     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/7b1a65954d6be05d7611cf1cf88189797dd8cc2e |     
  riscv64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/046e10483cb013d0ee51284b5c0f1fef6367d8c5 |     
    arm      |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/6a9c0b77c261592eb378e632dab4c40f75d906d8 |     
    arc      |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/c4cf90fc5e2a7ec8c3279a7bdbd7effc978e3d55 |     
  powerpc    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/bcc567c4d107158f778ce7ec3a4529c5f3c5fa6e |     
  sparc64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/bf0d0ed33abdd1032aeba9ebbb05079708cab55e |     
  sparc64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/2dec8d0668ed961f75cf610012fee7233a6bc529 |     
 powerpc64   |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/6c954896b37235335c94b54691a472181b8e7f17 |     
   arceb     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/1e4ae74bc2be957c57091566c0c698cebe4e3559 |     
 microblaze  |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/2bd3fc4b6f743a3f675bba4b031cf715a92f1246 |     
 microblaze  |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/efea696fed89ebb0533a25dd62960cd81e6c5bf6 |     
   nios2     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/1c06e25e191bf8f2dcfab2abddbebf2aa137dc75 |     
   sparc     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/d7691c6830d1394c80295d459149a714a58bd271 |     
 aarch64_be  |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/1ec85899b4af6a2582d503122a224fee98fd78c0 |     
   armeb     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/5278f081d1d61fce03035686cd41b879c25115d2 |     
   sh4eb     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/1e2c94362e7ea40f2e22cce4352a3acbbd72f2c4 |     
    arm      |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/6e48bf0069aa3f8ad1ef33d0306f1bddc67671e1 |     
    i586     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/a1ea41bb81e78ce5d0d00e3b3faecd5467f4354e |     
    sh4a     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/08f567dd4e4d3ee179dda94d735cde7cf64e6b62 |     
   sh4eb     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/4399185479f2d94fddc11b40db04efa2216741ad |     
 powerpc64   |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/634ad3f2f7ec069ca5fe79636c72c8796984ea3d |     
   nios2     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/b16f49a9ee76201e9c7ce95f43eb758b4bb8b8e7 |     
   sh4eb     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/7e02a3d5d059b20608361d61b24174dfaf9e59a3 |     
microblazeel |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/f8b0fc13a70ba3a90c1fee430cf128c43e5932e5 |     
powerpc64le  |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/8a9bb27775b0b040287b1fe9b258fed0d8234e9f |     
   armeb     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/fd78c4e73028e7476c432d315d54bdc59d2c129d |     
   mipsel    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/05ccb054ea1b1f9cc4dcca8af3e8aba910903541 |     
   xtensa    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/399deb6d83d77f813a90914b7c811b7222abc2bb |     
  mips64el   |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/02a11b198a053284f63ca1e8b5cd88aa4e99c940 |     
   x86_64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/6d39102891fa36dea59cc15e5f5216f623c6e98c |     
   s390x     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/24425a6afc225aea76706cca0409f83f121f8e24 |     
    mips     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/4bec242a474817a8b3ce5c9afb7420cf209b58c9 |     
 microblaze  |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/a77d7fbe3de27f4ec468c7da469e126107aed344 |     
powerpc64le  |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/bde327c37ffddedf520d93245a1735745d7ec5eb |     
   s390x     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/e0df71b688f048e724a9e46faf99d95edb259158 |     
    arc      |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/d94ff0e6476a071af12526e6073defc00450936f |     
   arceb     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/b321bc0372d9592621b21c0629d9db86d543dbf2 |     
    arm      |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/5782b59a6661482a8c8aa62d28c9ab862028a04d |     
   sh4eb     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/b59509da384126490dafbff0d76b80916ebd0a39 |     
   nios2     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/8b21eed545ffbd2fbfd584f3a2e42eafcb263362 |     
  aarch64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/38012810cf5169f11d156f4ae4961994d8511091 |     
 microblaze  |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/840709201cb6657a69300dea52434b1c7c909211 |     
  mips64el   |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/5d70ae1b2fd37047a4a619c9ad774ae4d68f6dc6 |     
   arceb     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/80a2f64171bc6126aec901ae56121a51eeab0e3b |     
    sh4a     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/08f14fb69c1da3e30f338dca01f3e3d15cc0e856 |     
  mips64el   |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/1a64537dbba1bf7602f51750cf3d4de161e6e244 |     
   sparc     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/a80310f7ec272ba96d2fb72ce692d94cb034daeb |     
    arc      |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/9f4ec11da2ab5e1a3f7c3f1ae67981ae257d35ca |     
microblazeel |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/85ab342e6773670f693737937dd30226dbeb782e |     
   mipsel    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/7e8d56a4b17841fd38a1e1a15bf93acecb831b3f |     
   x86_64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/a4efb16f3cdf0e8488a280cb21133516b8e0cccf |     
   sparc     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/513501ff2d7fea7a1195a8c03db83589b952386b |     
powerpc64le  |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/ab21d0c2852c63eb677bdac704a5d42a62a06e87 |     
   x86_64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/7e2e69a94ab7382f03f74aef724c0005c25c6fdd |     
  aarch64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/7fcfaf0b918fe8361f4858b156dfc8136f2b6646 |     
   arceb     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/3339bb42485d3b8e285e9466229cc562a6847141 |     
 microblaze  |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/a964c78730bea6f39d2b82b227442b641f25069f |     
    sh4a     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/6a94b4a14263feffc773c8f1ca4314b651d0bc0d |     
microblazeel |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/515fa0cefbeda5a67242ed4549c635e814b0ba60 |     
  aarch64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/fa1edee8aa979ad8c1563234b3238f63a4d67031 |     
    or1k     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/e2cb6e4688dc563b70435c00725bd32be5249493 |     
    arc      |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/19756ed9ef8fd0cf669999b33a9fbc61cea03bea |     
    or1k     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/866f651543119a601073abb9acb03bba28caf75f |     
    or1k     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/1f272afa8f9ad9eefd99b6126ea62e873a98fb44 |     
   mipsel    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/0934c952020efae633310292674be600c44af008 |     
   mipsel    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/e8f6246abee1c736d32d0cacb54833bcf360e403 |     
  powerpc    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/ef2f085f85e6262e5148105e5bc9a3c09b918630 |     
  mips64el   |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/d4dbb63e2efd8814318259a75e9cc7ac11f373de |     
  aarch64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/e97c212985761b188c33092965febd4795331b03 |     
microblazeel |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/5db4fd2ade90a3decd199fa25a7e264b421a6750 |     
    or1k     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/0af0b952881c5947a2eb278b5ef4325082374f0e |     
   sh4aeb    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/bef78c1ccec53dfac5c7afd9a6a5c899b2f5f2e2 |     
   mipsel    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/d5ebfec6360cb59f8708a6ff890a7ef739c8401d |     
  sparc64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/c6f09abd0665b622d9f8086d5eccc42389ec1a0b |     
   sh4aeb    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/e9d29cc0aaf384203974bf46854b962b2ecd3cec |     
    i686     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/d41786e92ad53df90a769b1db0062b35b00d6c53 |     
powerpc64le  |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/26488e6523a3d2dc6cb508ba9ee50cfeab1f1f6c |     
    arm      |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/9cea435519210b762650b5156e515fd0654324e5 |     
 aarch64_be  |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/6330c99299e58fd53426906098af76a21fd3e8bd |     
    mips     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/3d4b3f1e16f67e3a22214f040229a24902cfbf9b |     
    arm      |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/c72a2cb7cc7dfd6fb5887b75f90180d34aa2eeb5 |     
   mipsel    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/1f6d6e07f91af255fca0d9c830c492dabd8e6cfa |     
    arm      |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/62fb873839008ce000f3888f6e6d16bddc231102 |     
  riscv64    |       can-utils-2023.03        | NOK | http://autobuild.buildroot.net/results/2098062c99ddc265e7ab3c22afc9c97b41b33883 |     
    m68k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/80491765caa1d19a3deb3dd90eef3455fbc8aecc | ORPH
   nios2     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/41dcaf15ac253481ea2887ff34686172084524b3 | ORPH
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/c3de5d72a6bbfc9557695e1d94e60376ef1b57c1 | ORPH
   mipsel    | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/e0272a07193170cd5ee9c3333cdf905cd31657c7 |     
   s390x     | edid-decode-6f117a8f8c0e76e... | NOK | http://autobuild.buildroot.net/results/15eccea5470d0f9f874da0eabb94efb8074ccda7 | ORPH
   s390x     | edid-decode-6f117a8f8c0e76e... | NOK | http://autobuild.buildroot.net/results/4fda7f8679f80b566fb232f8c405d0781103b08e | ORPH
    i686     | edid-decode-6f117a8f8c0e76e... | NOK | http://autobuild.buildroot.net/results/3b2a2b2c7fa328315cf5a7be014c61a5d437dcdd | ORPH
    m68k     | edid-decode-6f117a8f8c0e76e... | NOK | http://autobuild.buildroot.net/results/b3bf96de0c3342a839e2c0886bd46908278acdaf | ORPH
  sparc64    | edid-decode-6f117a8f8c0e76e... | NOK | http://autobuild.buildroot.net/results/d7bf1688925cb8be740d87666e9a8169079dc0fb | ORPH
  mips64el   | edid-decode-6f117a8f8c0e76e... | NOK | http://autobuild.buildroot.net/results/2c892a6f13cb2e6a9e1dc33b72156d0bb53f0ca9 | ORPH
  sparc64    | edid-decode-6f117a8f8c0e76e... | NOK | http://autobuild.buildroot.net/results/946b6a26287736ccc40e1aca36819425f423b1f7 | ORPH
   x86_64    | edid-decode-6f117a8f8c0e76e... | NOK | http://autobuild.buildroot.net/results/58c2f9ff900081488922429754cee4b631913aa5 | ORPH
   nios2     | edid-decode-6f117a8f8c0e76e... | NOK | http://autobuild.buildroot.net/results/2162545b970d9ebadd32ed633bb2f6b29570b90e | ORPH
powerpc64le  | edid-decode-6f117a8f8c0e76e... | NOK | http://autobuild.buildroot.net/results/f143882593ccf0699b02c3cd9017e30355f4f2cc | ORPH
   s390x     | edid-decode-6f117a8f8c0e76e... | NOK | http://autobuild.buildroot.net/results/60d7654bbf0d13c85d96259768fd7c52b8042fc4 | ORPH
    i686     | edid-decode-6f117a8f8c0e76e... | NOK | http://autobuild.buildroot.net/results/26ea0ab274f902c88408be24f3b5b5b0cf99efcb | ORPH
    m68k     | edid-decode-6f117a8f8c0e76e... | NOK | http://autobuild.buildroot.net/results/38a42cc64f4e04df4cdffb4b817c1cbf63ee702b | ORPH
 aarch64_be  | edid-decode-6f117a8f8c0e76e... | NOK | http://autobuild.buildroot.net/results/bd4ced5842b8adb6d1d6d03df40d5926a872e6e3 | ORPH
   mipsel    | edid-decode-6f117a8f8c0e76e... | NOK | http://autobuild.buildroot.net/results/0f52cf464a2ec1e15409c8cb6b7f3d0753772a6a | ORPH
powerpc64le  | edid-decode-6f117a8f8c0e76e... | NOK | http://autobuild.buildroot.net/results/6a5e7d543f7a8d80f719400dee928602a1f9d534 | ORPH
  powerpc    |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/961722d94ae9fd969a7e7af1c0dacd9e46952acc | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/413c6683a96df81c29b6ca2f9a3694aa2aa5f92a | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/e44fe0cff6ae374a693a8a5c75241f9ee8139042 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/6c9ed28f1fcafe05b3a782610cfb7877383edbf4 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/6e257a6b458dae792ecdf1937835233b2be50727 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/f3e83a797096db6c13642e169737f6ce0cdb7c5c | ORPH
   mips64    |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/ffedff5dce0ff6dc8eed822c0ff4b9e6ddb3ae6c | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/d9f5b9c25006a02c28764e8a3d7b94481cfc0ae4 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/8b1cb17d7c1de80855877af6a0151e54fe4e30e0 | ORPH
    i686     |         erlang-26.0.2          | NOK | http://autobuild.buildroot.net/results/dfa27a7ef5627580388a9bb8939c6bbbf6958ac7 |     
    i686     |         erlang-26.0.2          | NOK | http://autobuild.buildroot.net/results/48379e2030eb55ebf07de2bc354da2cbfb6487a6 |     
    mips     |          evemu-2.7.0           | NOK | http://autobuild.buildroot.net/results/046ef651ba66cf4682cdece85e69b963553cb73b |     
   xtensa    |          evemu-2.7.0           | NOK | http://autobuild.buildroot.net/results/bcee6f323fac642884ed278a38cb460b26bc985c |     
   s390x     |          evemu-2.7.0           | NOK | http://autobuild.buildroot.net/results/012ad3e662de14bea5c082212b0bc1a3c45c89f0 |     
   x86_64    |          fbterm-1.7.0          | NOK | http://autobuild.buildroot.net/results/b603d1682c3b108bfc88e62ea4aa721b6bd9e60b | ORPH
   x86_64    |          fbterm-1.7.0          | NOK | http://autobuild.buildroot.net/results/b0e064cd002f3f05c7151c2fa52472c977e62f17 | ORPH
 aarch64_be  |           fcft-3.1.6           | NOK | http://autobuild.buildroot.net/results/ab3c9280f9ac5d4cab63096e10583d763e167a88 |     
    arc      |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/5ecb5363ffaf438961b9be05bbb420c874dc6f11 |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/40196b0232ed6493dab9809f9c21c95f2e806aff |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/87af794bb7adcaaf083bb1eaad58350d8d3348d8 |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/941c676a027db9a7116ae489f91f3c292dcc23a0 |     
   arceb     |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/ee8f5cb1180b284ecd15e13d055972418eecd58d |     
  riscv64    |         flannel-0.25.4         | NOK | http://autobuild.buildroot.net/results/890cd3a972b2e3398060e40651344fadfb15fdb0 |     
   nios2     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/8f9727f5ce80234023acbede1e99c59e57b40b5d |     
   xtensa    |           frr-8.5.4            | NOK | http://autobuild.buildroot.net/results/ed0441f2a737ecc323517545561a6beb7cb26228 |     
   x86_64    |          gamin-0.1.10          | NOK | http://autobuild.buildroot.net/results/f9eb6267f4ae74fa0349e793b8a2d824ec0c36d7 | ORPH
   xtensa    |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/7dc59449bb39faa823ba079b9264d25d1005b918 | ORPH
   armeb     |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/385e8928e16d672befefe6f2ac9c6acb516a206e | ORPH
    mips     |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/fbacf9117b7ab16c4c6e298349b2abe581c81ee3 | ORPH
  aarch64    |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.net/results/49de2348c8988f048f170aa0bc80a5648b56c732 |     
   sparc     |      ghostscript-10.03.1       | NOK | http://autobuild.buildroot.net/results/24e4f4b604e202a9cd7cbe4a3579894199e0c248 |     
   sh4aeb    | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/0462497e7f033469c2936baf2b26813feccb326d |     
  powerpc    | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/d97040dfd598f4ae8666584e945f1625a6520c4b |     
    arc      | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/975d624cf05a6db14b9f4227b789372da1c28af7 |     
powerpc64le  | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/b05ae4c92ba5c2b1525715de5deda0d700cd9637 |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/2e4d3e50601fc2aa1211161af8192f3bb3bd2753 |     
  powerpc    | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/82d854ba8775207132c89f3e944b54b86fef8ecd |     
powerpc64le  | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/8f96046338281e5a540db387cbc9690984f2c490 |     
   sh4aeb    | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/7fe9db52feb289a3dfc10852b5a584c5fce968da |     
    or1k     |         glibmm-2.76.0          | NOK | http://autobuild.buildroot.net/results/14bcad8e2d447c0b1f37b6142aaa4036d82c2288 |     
  riscv64    |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/1667ffad8d9e1a121a177e15cb0724a14a8e1da1 |     
   armeb     |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/a85d9474198a6fa632642d14cf2ca9d3a864bb3d |     
  riscv64    |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/f0ea83cfa4dc85d002b1b52598b866659c666e82 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/2f594963f30071a7d6c4d04d217c6886d994e04a |     
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/6af43945f25ace4d5e647a976545ed2db7ff951c | ORPH
  powerpc    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/f5d409de50eb1f5d8921e1186d429a0f64c32ee7 | ORPH
    i686     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/913d6bae14e9fc9563f7361d036eba99e85f8050 | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/0119382d3eba688988f832c334cb05b093200f7e | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/dce72461cd522d116bbde417d0f060c1bbfb6eee | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/9c0cda1162d11094aeee9edfef10dcc2529b9a6c | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/31a717f5aef57702fa0a10b0ae25c4e25f8adb7d | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/a01ebf0351ed2ecc39bb5a0c0d50b5448b479eb7 | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/551ebf52bde3c83534bc3836fb6186693ace2ec4 | ORPH
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/35508b8bb7385b94df25f76be4a5899d05c96022 | ORPH
    m68k     |         haveged-1.9.18         | NOK | http://autobuild.buildroot.net/results/24b00724c21d5065fbfbfb7c1ddefbfbd001b957 |     
   mipsel    |       host-binutils-2.42       | NOK | http://autobuild.buildroot.net/results/a81e9a16205fec9f76ea2a390a1061d637b82525 |     
   s390x     |       host-binutils-2.42       | NOK | http://autobuild.buildroot.net/results/87c5a7e366b6b4471aea10c76c62659e5c52f053 |     
  riscv32    | host-binutils-bare-metal-2.42  | NOK | http://autobuild.buildroot.net/results/e05824648f59c2b45202582d3e72fde273e5924d |     
 aarch64_be  | host-binutils-bare-metal-2.42  | NOK | http://autobuild.buildroot.net/results/259ef51734425baa09f6ff9f78c558b1ee88f165 |     
microblazeel |     host-btrfs-progs-6.9.2     | NOK | http://autobuild.buildroot.net/results/c46238afe8d23cf4bff4e7290a5eaebd0640eb6e | ORPH
    sh4      |     host-btrfs-progs-6.9.2     | NOK | http://autobuild.buildroot.net/results/1c67910e9d46eb70cdd81b6d7dce3dde1175d4d9 | ORPH
  aarch64    |        host-efl-1.26.3         | NOK | http://autobuild.buildroot.net/results/3e0e689fefa8eda1f07c39fd43d80d9305774a44 |     
    i686     |     host-gcc-final-13.3.0      | NOK | http://autobuild.buildroot.net/results/ff2dbfdabf0bb6a0d82ea8a80122ab97fd75bd3f |     
   s390x     |    host-gcc-initial-13.3.0     | NOK | http://autobuild.buildroot.net/results/6db54823f9c4818f23cd3345d213320bf09a29f0 |     
  aarch64    |      host-gengetopt-2.23       | NOK | http://autobuild.buildroot.net/results/aab9dec94f639853e7255f096afb33b652fda6f8 |     
  sparc64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/bf08f16a2df3c66972e183acd02dfb772a084f64 | ORPH
   mips64    |   host-moby-buildkit-0.11.6    | NOK | http://autobuild.buildroot.net/results/1e993c8d347114693b312997e60909c68173c211 |     
  mips64el   |   host-moby-buildkit-0.11.6    | NOK | http://autobuild.buildroot.net/results/fc467484599fbc6b5a26b82517714515716a6a85 |     
microblazeel |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/03b2a2007e79ba742d701d9140b8af9bba1d1dc2 | ORPH
  aarch64    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/d302485dcefb2ec708d9b50a339a741024b82206 | ORPH
powerpc64le  |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/3356bf4471e49c6d77dae5de514a820f0c648b6b | ORPH
  riscv64    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/056c23f1bef337133e9d43848589f2524b00d06b | ORPH
    arm      |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/1b335956848ce7eb4e36997209e248881de09c96 | ORPH
  powerpc    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/758cb5c6b0a1dfa6a3b96034c8ae613064dd78f9 | ORPH
   arceb     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/e6b6821edefd32c8517bc3dab253dea80421e161 | ORPH
   nios2     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/2545e005c8b661f3216d51d4e823dc87260aa707 | ORPH
   x86_64    |        host-rust-1.79.0        | NOK | http://autobuild.buildroot.net/results/5185b72e959cbf91600124761f5d7796a8ff5029 |     
   x86_64    |        host-rust-1.79.0        | NOK | http://autobuild.buildroot.net/results/80a4fa0692908c21f2b379840cc880ef4db9d118 |     
   armeb     |        host-rust-1.79.0        | NOK | http://autobuild.buildroot.net/results/2406f2fff2f0349dc8d3cfd7a1d63c39e02ed45e |     
   x86_64    |       host-skopeo-1.13.3       | NOK | http://autobuild.buildroot.net/results/dd921b70e3392165e7e578d6df3557f35d76c89f |     
   s390x     | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/5168046465406cd0767a91c793268d46a56da287 | ORPH
   armeb     | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/ce6676f02b21a75636456395ae3825ca6f4adb03 | ORPH
   s390x     | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/97792cd431b2fc3a6cb51965a43cc3229348edc5 | ORPH
   s390x     | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/864ea5ad484d828e275e3eaa5bdbc85aea7907c2 | ORPH
  sparc64    |         host-tar-1.35          | NOK | http://autobuild.buildroot.net/results/ba1b0decf6aee5bfa9eaec8c9d6d68b71cd2b1b3 | ORPH
 microblaze  |         host-tar-1.35          | NOK | http://autobuild.buildroot.net/results/5035d310c2a47b69e288e07874bd40c72ce5fcaa | ORPH
    or1k     |         host-tar-1.35          | NOK | http://autobuild.buildroot.net/results/bb507704b1b8ed4cafe05665d27b91d690132270 | ORPH
powerpc64le  |         host-tar-1.35          | NOK | http://autobuild.buildroot.net/results/23673ff680388be0ae503f2cb60958dc50317236 | ORPH
   mipsel    |         host-tar-1.35          | NOK | http://autobuild.buildroot.net/results/660cccdf938e53a600986c889d52c2bdc12cf8ea | ORPH
    mips     |         host-tar-1.35          | NOK | http://autobuild.buildroot.net/results/1dc56419c5fd294271567453ea4609803bb54248 | ORPH
   mips64    |         host-tar-1.35          | NOK | http://autobuild.buildroot.net/results/f7adfbc45d200ee2e74cf084b835c385bdc4debd | ORPH
 microblaze  |         host-tar-1.35          | NOK | http://autobuild.buildroot.net/results/1ee65e3c582fec9f942e1c187a8b5ec6b46230e3 | ORPH
microblazeel |         host-tar-1.35          | NOK | http://autobuild.buildroot.net/results/25afa8573931cd3b78b651dff060f59cfd23008c | ORPH
  mips64el   |         host-tar-1.35          | NOK | http://autobuild.buildroot.net/results/d6c5752db90276455e915c464c61fba5070b0b96 | ORPH
    or1k     |         host-tar-1.35          | NOK | http://autobuild.buildroot.net/results/80d17625d71607c51f3d5c95a07f8db5857d42b3 | ORPH
  riscv32    |         host-tar-1.35          | NOK | http://autobuild.buildroot.net/results/be08b46d44ec314070640b363227e5458297508f | ORPH
   s390x     |         host-tar-1.35          | NOK | http://autobuild.buildroot.net/results/8a2e9919034a47a8b03dda11d4f3266ac4b2bac3 | ORPH
   nios2     |         host-tar-1.35          | NOK | http://autobuild.buildroot.net/results/1b0eb16b47c5d7a00a85974b16a2d33fe3ab923a | ORPH
    arc      |         host-tar-1.35          | NOK | http://autobuild.buildroot.net/results/19570231b6501173fab53715dc7d3f83f5d1d4ac | ORPH
  sparc64    |         host-tar-1.35          | NOK | http://autobuild.buildroot.net/results/f4dec37a740504be6a23e6eace9f82c58e05a182 | ORPH
    mips     |         host-tar-1.35          | NOK | http://autobuild.buildroot.net/results/0b2d50c122ab29e131c1d5938c319abaf67d2cd2 | ORPH
    sh4a     |         host-tar-1.35          | NOK | http://autobuild.buildroot.net/results/11c24474b28a71047ed22f756a62a90ee49b5658 | ORPH
powerpc64le  |         host-tar-1.35          | NOK | http://autobuild.buildroot.net/results/4399f219cce9b43892cb2a844279230bda858a8c | ORPH
 microblaze  |         host-tar-1.35          | NOK | http://autobuild.buildroot.net/results/df7f1472d4bc7abfc9a920e6b622861deee95359 | ORPH
   sh4aeb    |         host-tar-1.35          | NOK | http://autobuild.buildroot.net/results/1b48e2cf41c71956ebfaebbc87acb34b98113ed8 | ORPH
    arm      |         host-tar-1.35          | NOK | http://autobuild.buildroot.net/results/8796a3cee93c5de70a51049bb0e46aa05365c0fb | ORPH
  aarch64    |         host-tar-1.35          | NOK | http://autobuild.buildroot.net/results/bcf15d29810db5d798851ad1717450ed98520c10 | ORPH
  sparc64    |         host-tar-1.35          | NOK | http://autobuild.buildroot.net/results/571b3df719acfef69c051e7a72662acf05eb21a1 | ORPH
   x86_64    |         host-tar-1.35          | NOK | http://autobuild.buildroot.net/results/3daf2c6ad1a007a3d12da640b6f401cc1aef2541 | ORPH
    i686     |         host-tar-1.35          | NOK | http://autobuild.buildroot.net/results/b20fda0e428634428c393fb7fefa749b643534ea | ORPH
   nios2     |         host-tar-1.35          | NOK | http://autobuild.buildroot.net/results/0d3f21c326bdcae9323797773dcb7da9f83d0ea2 | ORPH
powerpc64le  |         host-tar-1.35          | NOK | http://autobuild.buildroot.net/results/17bf74993338b8c3354c0499a03e851526c893ac | ORPH
  sparc64    |         host-tar-1.35          | NOK | http://autobuild.buildroot.net/results/def04d49f4d297e6a6d9e40cd71301d442338ff1 | ORPH
  aarch64    |         host-tar-1.35          | NOK | http://autobuild.buildroot.net/results/cc21e9b5c3383ed722ded6f74a658e596b4f81ba | ORPH
    arm      |         host-tar-1.35          | NOK | http://autobuild.buildroot.net/results/5373222312ae4d6a51ede119eae061fa97927031 | ORPH
powerpc64le  |         host-tar-1.35          | NOK | http://autobuild.buildroot.net/results/22c9054108474e8c4ee2e96c26a2c842a2a656c9 | ORPH
   xtensa    |         host-tar-1.35          | NOK | http://autobuild.buildroot.net/results/70054e8e67df7f68d54bb174f23263851ac409e3 | ORPH
    arm      |         host-tar-1.35          | NOK | http://autobuild.buildroot.net/results/b300026f34910567d62cfbef997906b1573be8ad | ORPH
    arm      |         host-tar-1.35          | NOK | http://autobuild.buildroot.net/results/aa03bc5f07e00cfe1550b0216c815c1f8231af27 | ORPH
    mips     |         host-tar-1.35          | NOK | http://autobuild.buildroot.net/results/030182ff927c5b9ea605b028ac9ff1dea5157af2 | ORPH
   sparc     |         host-tar-1.35          | NOK | http://autobuild.buildroot.net/results/efdf7cf9ede810ed7f766cc4138b16054bc0c18a | ORPH
  riscv64    |         host-tar-1.35          | NOK | http://autobuild.buildroot.net/results/b54c874c8092761d5e46638a4e8a0f0c86fab791 | ORPH
   x86_64    |         host-tar-1.35          | NOK | http://autobuild.buildroot.net/results/3cc418c92b70ecc972dc981177d607bf8d0da0de | ORPH
 powerpc64   |         host-tar-1.35          | NOK | http://autobuild.buildroot.net/results/7469820bb36627cba3e6e372259a15031fe7d2db | ORPH
   mipsel    | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/fc8b51c2a02e1050af88c8b5a8048b2adb384142 |     
  riscv32    | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/967d9e6703e738e32d8035a4fca3d0c48ede2969 |     
   nios2     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/09233f5e13083d565321692473e17a850210279f |     
   armeb     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/42e26fd6606f149f70ee35436ffd2e7910c327fe |     
   nios2     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/eff816ede9bdce363bf10a8e7b5a975a2776c43e |     
 microblaze  |           htop-3.3.0           | NOK | http://autobuild.buildroot.net/results/c291ae9652c48f4fe315adf068dc66fe2bc74600 | ORPH
   mipsel    |           htop-3.3.0           | NOK | http://autobuild.buildroot.net/results/1114f652737d63a201254e308a80b4a26ef71f6e | ORPH
    or1k     |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/60c891c89c114a8a0153a8132b59f1a8f60872be |     
 aarch64_be  |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/5fb1ba92b94785a864f15cc09c2dabcfec472ff4 |     
   nios2     |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/42287d8e15a54282e4a13c906f7802d0a4b6f4b6 |     
   mipsel    |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/b898e441b3cb64204fd5edfa86a350078e5bf114 |     
  aarch64    |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/4f6b50db5a653ef7f583be1d2aa7ebc92e723925 |     
  riscv64    |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/340c4a183ac032528deab3035ec62d2c8f30121f |     
    arm      |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/ea853d7a09da033b4695d147f5870b64fe15e62e |     
    arm      |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/1fe9d8766fb992cb1588c0617ba9a1ceee9e7570 |     
    sh4      |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/a689cc38eee6efbd476c0b13d939ca63a5ff77b1 |     
   sparc     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/9488a77461a5152831391fb43ae1a232617a5f7d |     
  mips64el   | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/79ceb5ec8ad8df04f45d72d5f3e1f87a578d7614 |     
   s390x     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/cbf614d48c7b6799351eb638619ffb60acd809f7 |     
    arm      | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/252b6595763bf2d3328351d2cad2c41c3e6b7012 |     
    arm      | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/11cc7fcab3fd9ec9f14e30583c96eb11c9e1bc37 |     
  powerpc    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/1a990e3c4ad71496879df804a076c12907f21bda |     
   x86_64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/e328b8dd00fdbe50f22641bd74196913f71a7cab |     
   nios2     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/6da16ceb56146ee866fb8f23bf61eb708c23d4e1 |     
powerpc64le  | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/faba4bf1d07377c85bea4b6d38c208990c30cb19 |     
 aarch64_be  | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/bc278d988edb82bbf652d7c8a6b385a66239a32a |     
  aarch64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/17f9803d31e4f008a2d9fc20d0bb9fcc3d4e87fb |     
powerpc64le  | igh-ethercat-f5dc109176400f... | NOK | http://autobuild.buildroot.net/results/ae5416626ea7e28854f256f794a0d013bb65ac5d |     
    sh4a     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/2a1c6e0bcda75b83cd8693250bdb465a2821b5c7 |     
    i586     |         iproute2-6.9.0         | NOK | http://autobuild.buildroot.net/results/62025aa74dc107c0aa38952d03fc71be6a7b4634 |     
  riscv32    |         jemalloc-5.3.0         | NOK | http://autobuild.buildroot.net/results/7718083b3fc0224c1fe2af05b2f3a90f1b215d74 |     
  mips64el   |            kmod-31             | NOK | http://autobuild.buildroot.net/results/82f49090edf0a36e6db5305300f7d207d75807cf |     
  mips64el   |            kmod-31             | NOK | http://autobuild.buildroot.net/results/4a885b6b27eec7ee714227236852acc38e4b920d |     
   sparc     |          ledmon-1.0.0          | NOK | http://autobuild.buildroot.net/results/e48d879eef2311b911ed1cf2c509093dd660af31 |     
   x86_64    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/7e1fd05f65f85cf7af3d9305cda1671d3cf3c9fd |     
   sparc     |         libcli-1.10.7          | NOK | http://autobuild.buildroot.net/results/94c27a0d76e5bd6e6f7413c116311f2515fea28a |     
   mips64    |         libcuefile-475         | NOK | http://autobuild.buildroot.net/results/04fe8e4e412e88f27481ab90bcb664a20dc20405 | ORPH
    or1k     |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/40febe43a36f8c24aed204a41f8a0ee3a4688876 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/de94c271f50432a5296b72effa3bd00e5ced846e |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/695a4b01ae6194a9ed6aa0e906e1d57fcb6f4476 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/191b6d9ef9aa80388fca08d43c10744ba47e756f |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/d5233f6ba0698fad491301f32bd20a0ce12de961 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/51aeb376b85a2e7f2a81eb60eb33119cc967bd60 |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/bf3ed427b77c99362da2f78e6d073d8e3f0f7200 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/516d7b402ce089ff29fbaaaddc4810408ef0edba |     
    mips     |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/5921aa9d371827d4df35a9a652cfa86910ae06f8 | ORPH
    m68k     |         liboauth-1.0.3         | NOK | http://autobuild.buildroot.net/results/8f4e4061647bfbf8291a76697cdc2d6fa1cd40ca | ORPH
    or1k     |        libostree-2023.8        | NOK | http://autobuild.buildroot.net/results/1cb5703d1a23449a42a3aac2da0329809d751740 |     
    i686     |         libp11-0.4.12          | NOK | http://autobuild.buildroot.net/results/1950d547c4a86b66426a4ce65d24011ad96e4a9e | ORPH
   mipsel    |         libp11-0.4.12          | NOK | http://autobuild.buildroot.net/results/5914aa18ad64fe7e80a9e9f7dfe0e3a27a13d4fc | ORPH
   mips64    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/a1f989035c392c837a95634dfcaf195d58fdd863 | ORPH
powerpc64le  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/65994a42f4a7febe1a1533b7ad42155eb623a912 | ORPH
  mips64el   |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/90906feb22afb8e9f358c85febfbd229b3223764 | ORPH
  riscv64    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/d1cea13cd95b28d7ec9b29e202668169d411c679 |     
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/66657823d365cfc482f2cecfff5f41a55f0516cd |     
 aarch64_be  |          libva-2.22.0          | NOK | http://autobuild.buildroot.net/results/b692cd152f98c414fde1fb6d6a1f90cd0a92b50c |     
  sparc64    |        lighttpd-1.4.76         | NOK | http://autobuild.buildroot.net/results/547a16fd8bd83f390d6b3d9be69ae8bc863cea52 | ORPH
   mips64    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/6da64b7426ea6eb6d2d84485c18b5198d5a4d587 | ORPH
   mips64    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/96edda688830cd238e712f6226cb724ce98ce296 | ORPH
   mips64    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/c6572cbac62d63afd61c6c30563f8fe8fa7c2b2d | ORPH
   mips64    |          linux-6.9.8           | NOK | http://autobuild.buildroot.net/results/25efb4140928c6c4219d7c4011ebc346422a4df8 | ORPH
   mipsel    |          linux-6.9.8           | NOK | http://autobuild.buildroot.net/results/1f4b3932f4c1691c678ee89c42d75fc362c8de4f | ORPH
  powerpc    |          linux-6.9.8           | NOK | http://autobuild.buildroot.net/results/ba640473cbc5374c77dbdf1ff60de85e54372b0d | ORPH
   nios2     |          linux-6.9.8           | NOK | http://autobuild.buildroot.net/results/91d7175cf519ee52c28392b7e0fec487a43511cb | ORPH
    arm      |          linux-6.9.8           | NOK | http://autobuild.buildroot.net/results/e1ae91c5d4262debccc0970cc2619d717b917f66 | ORPH
   nios2     |          linux-6.9.8           | NOK | http://autobuild.buildroot.net/results/aedeba560c9a2da367e0d05d4d4a6b28bcbfd82b | ORPH
   sparc     |          linux-tools           | NOK | http://autobuild.buildroot.net/results/be05090faeee9b9a5ec17916b3b7d2ff67e36573 | ORPH
  sparc64    |     ltp-testsuite-20240524     | NOK | http://autobuild.buildroot.net/results/6eb17c8692c84579a9f75476d8ef44b8ce64bcf2 |     
    i686     | ltrace-82c66409c7a93ca6ad2e... | NOK | http://autobuild.buildroot.net/results/c378cf6d2216eac0fd21f1fd3bb54eba6a1c6e34 | ORPH
   sparc     |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/519c1358935bb9687f56971d670ba09be43436a2 | ORPH
    i686     |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/f72179a110d9aa2e2327ce110629b483a2950636 | ORPH
   sparc     |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/81d48a2a109893f0d7584cf4bacbfddea282e359 | ORPH
    i686     |         memtest86-6.20         | NOK | http://autobuild.buildroot.net/results/59a5a7918eb268cbc4d9b5fcb22404f546e231f9 |     
   sh4aeb    |         mesa3d-24.0.9          | NOK | http://autobuild.buildroot.net/results/61f369277b5d6d7e168e00313198c2b57be74f2e |     
  aarch64    |       mesa3d-demos-9.0.0       | NOK | http://autobuild.buildroot.net/results/2aad1ca19304e96b42fb8c8c2d94c8b6b42fc47b |     
    or1k     |        mosquitto-2.0.18        | NOK | http://autobuild.buildroot.net/results/8c037a7f904fd0b32a766dcf8b90ac052c114b8f |     
    arm      |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/c2e2ba94c09fa3a08a62d55f76a203089a86142a |     
    or1k     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/2afc00ca1b45f3d11f47e080ec642413545e2300 |     
   armeb     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/e3992aaa29d6c3d80d902baf6961e0cc7314929e |     
  mips64el   |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/7c73aaeeca6dd8b0baf0febc42db12e39a09e407 |     
    or1k     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/76bed4fe56ab0a6464eb4e5c4c81241224111d36 |     
  mips64el   |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/0f6e42ed2bd39842da35a2266fc5f3efe444092a |     
 aarch64_be  |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/bc0697c9c66ea6a21bc759c86aa71bed4cc6cdc2 |     
   nios2     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/d1d788b8a840440b146eea7a9452f336e02230fe |     
    i686     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/44cbfa43c9cc761cf7bc67339bafd1735d9b5a6d |     
    i686     |           mpv-0.35.1           | NOK | http://autobuild.buildroot.net/results/aa73a02f6e20b9f321c4b009acb4ae5a7e8e468b |     
  powerpc    |           mpv-0.35.1           | NOK | http://autobuild.buildroot.net/results/aa63a8a2775119e6f06e66f7dee385546336648b |     
   s390x     |           mtd-2.2.0            | NOK | http://autobuild.buildroot.net/results/9985cb47aaa7006f360489019fe4365d2a6eb87c |     
    arm      |          mupdf-1.23.9          | NOK | http://autobuild.buildroot.net/results/1368fd3ef51df93833cbbd84a4959c2ecbf662dd |     
   xtensa    |      ncurses-6.4-20230603      | NOK | http://autobuild.buildroot.net/results/ed0702bee3cc697b1d7105c46a316e239d7d147f | ORPH
    arc      |      ncurses-6.4-20230603      | NOK | http://autobuild.buildroot.net/results/31c6ecf1d5861776d173aee2eb52ca12e3615edc | ORPH
  aarch64    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/41155c303db13bf86880f3f953475475df664e67 | ORPH
   nios2     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/23aa29d64b7400df63636ddfccb9ce670a9ee39f | ORPH
 powerpc64   |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/4f953d5435689813f4ac7d42e82df412e061c49a | ORPH
  aarch64    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/03998383d900eb8c9fb0dbb87ab47354d07dcd7b | ORPH
   mipsel    |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.net/results/6ddf342a3855c13b012d9d0cbebaf2314dd2b942 |     
   armeb     |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.net/results/725cd4a3e0ff07507a9ee5208eab3bc770477ba0 |     
  aarch64    |         numactl-2.0.16         | NOK | http://autobuild.buildroot.net/results/25e63467904f069d19f822c75483ea92e95b5496 |     
  sparc64    |           ola-0.10.9           | NOK | http://autobuild.buildroot.net/results/54c20be8e20e95c9e0c26651a33db345a3b114e7 |     
    mips     |         openssh-9.8p1          | NOK | http://autobuild.buildroot.net/results/c77157d57155a5f5bdc3c6e40c20bdd2d3869d50 | ORPH
    mips     |         openswan-3.0.0         | NOK | http://autobuild.buildroot.net/results/cc83709edaf6761804e198550fdc63d029993c7b | ORPH
 microblaze  |          perl-5.38.2           | NOK | http://autobuild.buildroot.net/results/e8d13409e62e496685c24d9b99123295481354b9 |     
powerpc64le  |        pipewire-0.3.81         | NOK | http://autobuild.buildroot.net/results/1b94128f3e69361d0bd731b3e8c9723dcac71c1e |     
   xtensa    |        poppler-22.12.0         | NOK | http://autobuild.buildroot.net/results/d9c32525346aafad7b2b8568e38fc9e239c02794 |     
   s390x     |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/67668c68f97681776122cbad6e2c7814119cd12e |     
  mips64el   |         python3-3.12.4         | NOK | http://autobuild.buildroot.net/results/c5be628a9bea84ffdc3895dec477dae6e07f2a59 |     
   x86_64    |         python3-3.12.4         | NOK | http://autobuild.buildroot.net/results/ba1d4213ae9912d53412ded6d8e257b67a4f7c0e |     
  mips64el   |         python3-3.12.4         | NOK | http://autobuild.buildroot.net/results/326f179af03f6f3882bf95cd3b74719e4c121e6e |     
    arc      |       rabbitmq-c-0.13.0        | NOK | http://autobuild.buildroot.net/results/df499914a93f32904fa39a8553bc5e357c0fe0a3 |     
   sparc     |         rrdtool-1.8.0          | NOK | http://autobuild.buildroot.net/results/3a3a5f7d69a871971acd1d16a65b52fabde24eb9 |     
   s390x     | rtmpdump-c5f04a58fc2aeea629... | NOK | http://autobuild.buildroot.net/results/0fa42b4c925f8dc7c76f12dfc3c3cfde7e068329 |     
powerpc64le  |         softhsm2-2.6.1         | NOK | http://autobuild.buildroot.net/results/447ed58deac0db79ead66023b431c868da9d7ff5 | ORPH
   sh4aeb    |        tipidee-0.0.5.0         | NOK | http://autobuild.buildroot.net/results/befdcba3c7eaa74d9b3cee5ed6e714c105c72684 |     
    i686     |        tipidee-0.0.5.0         | NOK | http://autobuild.buildroot.net/results/23fae5ea51f058f40bdf167637e11e3066105c78 |     
   armeb     |        tipidee-0.0.5.0         | NOK | http://autobuild.buildroot.net/results/4b2c43a149275cea19c36da91b1593ce0f8d195e |     
  mips64el   |        tipidee-0.0.5.0         | NOK | http://autobuild.buildroot.net/results/e995fe39215b3afc1cd4f460203625c4b752a5f5 |     
    mips     |        tipidee-0.0.5.0         | NOK | http://autobuild.buildroot.net/results/4b9958f1f813ddc1f36c796f650717c1fd9f61f1 |     
powerpc64le  |         tpm2-tss-3.2.2         | NOK | http://autobuild.buildroot.net/results/8288b49ac7b00b27d320f9d83ce3e7e760375342 | ORPH
   mipsel    |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/482e929249623539b451752e762bfb6ee49db6ef | ORPH
    arm      | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/4f3e5cc059320c124c7689b458c546f508781f7b |     
  aarch64    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/f9272e23b9a2c5436ecf18b81b590f099464baf5 |     
   mips64    |         unbound-1.19.1         | NOK | http://autobuild.buildroot.net/results/39eea032123e05376e4d82aa74f275fef3d5cb83 |     
  sparc64    |         unbound-1.19.1         | NOK | http://autobuild.buildroot.net/results/caff7f0be840c862332b34130c844fbfca55de8b |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/469bab7020337528b7b8dc57f09865cbbbad936a |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/87d808aa604620c3f49720ea3a658211a03525d7 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/9c43c183393a5292563cc1964bf5b7f10af3ad7c |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/0ee6eee5c7ab1b3f0163e3b18b665f9d57837c6d |     
    mips     |        xapp_xdm-1.1.14         | NOK | http://autobuild.buildroot.net/results/cd8ed71d06b860f2057ba8d6970e1aa7c4d42f1b | ORPH
   arceb     |            xz-5.6.2            | NOK | http://autobuild.buildroot.net/results/faa76247ce4cafbbf491f2eabb1ee5315a5b37ff | ORPH
   nios2     |          zabbix-6.2.7          | NOK | http://autobuild.buildroot.net/results/dcdde5c547a320083c3e8a546b60f6bd1df02092 |     
    or1k     |          zabbix-6.2.7          | NOK | http://autobuild.buildroot.net/results/c017f7dcf03723f01bc826fe0bc6038fc201764c |     
  powerpc    |        zxing-cpp-2.1.0         | NOK | http://autobuild.buildroot.net/results/5a73e33d0eb63bf86a3886a8b54305e4b962f3ab |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                 host-tar-1.34 | 11
                       unknown | 2 
                  bitcoin-26.0 | 1 
           flatbuffers-23.5.26 | 1 
         gobject-introspection | 1 
            micropython-1.22.0 | 1 
                    ncmpc-0.49 | 1 
             util-linux-2.39.3 | 1 
               xwayland-23.2.4 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |          bitcoin-26.0          | NOK | http://autobuild.buildroot.net/results/2fd6a2b4188e58860e9bb382936e2f05e5210f8e |     
    m68k     |      flatbuffers-23.5.26       | NOK | http://autobuild.buildroot.net/results/e58bbbc64c4aa1a4b60cb69f84467c9f488532fe |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/ebfe6da3353d2761e848512db497f34d82880fae |     
 aarch64_be  |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/a97fda5e3e104b454ba224d4f086080b066fe5ee | ORPH
  powerpc    |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/bb10476fb0b91f78b65f660ac4491206340f8b77 | ORPH
    m68k     |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/677b805ba280d577fe19391e5f2913df8bcb6b1c | ORPH
 aarch64_be  |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/012af314989865ae063fb826f37b01737e60630f | ORPH
   mipsel    |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/749fcd10ad6b4f16da0c1e0c771ec6155e671efa | ORPH
  powerpc    |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/5c36cf6553597a1f58bc842c7749822b545e0c86 | ORPH
   s390x     |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/c35cf130eef8e6f93fbf7c41eff897ceddd8082c | ORPH
  riscv64    |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/ef8b4a80a03cd86c8866d72eab52fefe65dce2d8 | ORPH
  powerpc    |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/aae191284d7555de30e81846884b3d3b2301b75b | ORPH
 aarch64_be  |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/5fbfd1ebb90a838eb4c3cc8aee97bfd1b6126f61 | ORPH
  powerpc    |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/7be9e71ea2c6feda04d413395d4c77366bf3469b | ORPH
 aarch64_be  |       micropython-1.22.0       | NOK | http://autobuild.buildroot.net/results/99035c968a4967166554236fc0a10296f81c61db |     
   s390x     |           ncmpc-0.49           | NOK | http://autobuild.buildroot.net/results/3769e54b4a532b38ceca14337352e24b99186b83 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/ca020fd0ae049d107385b512e77df9ca4da2856e |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/2743778f560e7a7550c535ff5f2b494692c113a2 |     
    i686     |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/b11898c3f72337ac4cd2d7614661b8a77246ed47 | ORPH
    sh4      |        xwayland-23.2.4         | NOK | http://autobuild.buildroot.net/results/3d509dfca8b9ef469efe90b0221e4f0cc56e2ada |     


Classification of failures by reason for 2024.05.x
--------------------------------------------------

toolchain-external-bootlin-... | 12
                fail2ban-1.0.2 | 2 
                   bzip2-1.0.8 | 1 
                elfutils-0.189 | 1 
                   foot-1.16.2 | 1 
glibc-2.39-74-g198632a05f6c... | 1 
               host-gawk-5.3.0 | 1 
              libarchive-3.7.4 | 1 
              libopenssl-3.3.1 | 1 
                  libsepol-3.6 | 1 
                  linux-6.8.12 | 1 
               mariadb-10.11.6 | 1 
toolchain-external-bootlin-... | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |          bzip2-1.0.8           | NOK | http://autobuild.buildroot.net/results/c4f1949f262dcd959146753275d294cf48698a97 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/94b19a4c4ba58f65de4b0bd5b811588069b17ea5 | ORPH
   nios2     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/11a42976c2b0147af74d08e43d2a569ccb9348af |     
   xtensa    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/db9a2b4276b72ee557981888b97b38072daf085d |     
   mipsel    |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/8e71c91bf7b9e0cb9292203e3daae9a4a3675f14 |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/70b5eb9964276fd82d35c43810a4ce6082d0c491 |     
   s390x     |        host-gawk-5.3.0         | NOK | http://autobuild.buildroot.net/results/07d70f4aebc46957ae61f76c62b1e3bc8f0aa740 | ORPH
microblazeel |        libarchive-3.7.4        | NOK | http://autobuild.buildroot.net/results/89adb6b0941e50da9cb9bb7ecdd5f5b6d128afc9 |     
 microblaze  |        libopenssl-3.3.1        | NOK | http://autobuild.buildroot.net/results/c9de7b284557024a1dff3306112299a14b5d01ca | ORPH
   armeb     |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/42ba3a26e3488917b3864aef01f8121ac396098a |     
    mips     |          linux-6.8.12          | NOK | http://autobuild.buildroot.net/results/5a05a4376ad73d66037f9c87fa83191b078675ef | ORPH
  riscv32    |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/aa329386766a33cf46f1c98fca28a82caae33d28 | ORPH
   sparc     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/8bb7dad0362562ad85bba5af7a6018cc438f213c | ORPH
    m68k     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/7d26f63630b7b8085d9c6bee3bd07cd09cd9f05c | ORPH
   nios2     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/7a8a02df0ddaee92e59e4b4d035e783277f4041a | ORPH
   nios2     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/537395e25175ddd573fbe52def3adbb065320cd3 | ORPH
   mipsel    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/da7b4e2d6719fb62299ce11e011241cd9e106038 | ORPH
  riscv32    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/3ab1c5a41b41391ec69115ab6069b71a2694e4cd | ORPH
   mipsel    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/bd5fab69d8ded44de5237a126101dea54002b5ab | ORPH
  sparc64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/ab8cae8bcc58758838d6212562613d9f9467b87b | ORPH
    m68k     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/9dc8c70bd55fce83d592c8d306cd9c6d43856734 | ORPH
  riscv32    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/cbaccab645c283039639bc29916ef3096ed96b59 | ORPH
   x86_64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/a6a2bb47473748f6397efe093309750ab974470c | ORPH
  riscv64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/dfb1cb1e24dbf621007ee68a6f895897399fe5f2 | ORPH
  riscv32    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/32d10b0720c4207555f87bd1a47db016f6f559c5 | ORPH


Gitlab CI results for 2024-07-15
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
...ilp32dMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/7338388423  | ORPH 
...iscv32ilp32dMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/7338388425  | ORPH 
             TestGnuradio | https://gitlab.com/buildroot.org/buildroot/-/jobs/7338387606  | ORPH 
                 TestGzip | https://gitlab.com/buildroot.org/buildroot/-/jobs/7338387609  | ORPH 
       TestInitSystemNone | https://gitlab.com/buildroot.org/buildroot/-/jobs/7338387340  | ORPH 
...nitSystemSystemdRoFull | https://gitlab.com/buildroot.org/buildroot/-/jobs/7338387347  | ORPH 
...stemdRoIfupdownFactory | https://gitlab.com/buildroot.org/buildroot/-/jobs/7338387371  | ORPH 
                TestLrzip | https://gitlab.com/buildroot.org/buildroot/-/jobs/7338387644  | ORPH 
  TestLuajitLuaFileSystem | https://gitlab.com/buildroot.org/buildroot/-/jobs/7338387707  | ORPH 
                 TestLuvi | https://gitlab.com/buildroot.org/buildroot/-/jobs/7338387723  | ORPH 
               TestMender | https://gitlab.com/buildroot.org/buildroot/-/jobs/7338387737  | ORPH 
               TestMtools | https://gitlab.com/buildroot.org/buildroot/-/jobs/7338387746  | ORPH 
                  TestMtr | https://gitlab.com/buildroot.org/buildroot/-/jobs/7338387747  | ORPH 
         TestOpenSshGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/7338387772  | ORPH 
                 TestOpkg | https://gitlab.com/buildroot.org/buildroot/-/jobs/7338387774  | ORPH 
TestPerlIOSocketMulticast | https://gitlab.com/buildroot.org/buildroot/-/jobs/7338387791  | ORPH 
           TestPostgreSQL | https://gitlab.com/buildroot.org/buildroot/-/jobs/7338387823  | ORPH 
    TestPythonPy3Botocore | https://gitlab.com/buildroot.org/buildroot/-/jobs/7338387846  | ORPH 
   TestPythonPy3Colorzero | https://gitlab.com/buildroot.org/buildroot/-/jobs/7338387853  | ORPH 
    TestPythonPy3Iptables | https://gitlab.com/buildroot.org/buildroot/-/jobs/7338387895  | ORPH 
    TestPythonPy3Jmespath | https://gitlab.com/buildroot.org/buildroot/-/jobs/7338387897  | ORPH 
     TestPythonPy3RpiGpio | https://gitlab.com/buildroot.org/buildroot/-/jobs/7338387943  | ORPH 
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/7338387954  | ORPH 
         TestRelroPartial | https://gitlab.com/buildroot.org/buildroot/-/jobs/7338387242  | ORPH 
         TestS6Networking | https://gitlab.com/buildroot.org/buildroot/-/jobs/7338388006  | ORPH 
      TestS6PortableUtils | https://gitlab.com/buildroot.org/buildroot/-/jobs/7338388010  | ORPH 
 TestSquashfsMaxBlocksize | https://gitlab.com/buildroot.org/buildroot/-/jobs/7338387326  | ORPH 
            TestZfsUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/7338388071  | ORPH 
                 TestZstd | https://gitlab.com/buildroot.org/buildroot/-/jobs/7338388074  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
