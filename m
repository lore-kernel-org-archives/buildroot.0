Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E778BC021A0
	for <buildroot@archiver.kernel.org>; Sat, 15 Feb 2025 04:14:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6662160891;
	Sat, 15 Feb 2025 04:14:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XqcMlFWUAd01; Sat, 15 Feb 2025 04:14:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ECD066088C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ECD066088C;
	Sat, 15 Feb 2025 04:14:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 628D172
 for <buildroot@buildroot.org>; Sat, 15 Feb 2025 04:14:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 45D27608CE
 for <buildroot@buildroot.org>; Sat, 15 Feb 2025 04:14:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1CUtl94DeOwS for <buildroot@buildroot.org>;
 Sat, 15 Feb 2025 04:14:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E8C7560891
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E8C7560891
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E8C7560891
 for <buildroot@buildroot.org>; Sat, 15 Feb 2025 04:14:26 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5df07041c24so1675660a12.0
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 20:14:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739592865; x=1740197665;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XRTs4dyjprHk9sJitOne7m5/Ic9gPfkJf2wH6xTGv3I=;
 b=GzWXmDsWLfQZ/4GOZ2YyFpRYM+fSuqHV8ifm0+PN/gNmQancnqOSMSUScLrMSaBdD+
 ZznDprwdgXqhdRzeUNf+buU+PAuHerJJE88iyXccb1MslkMgmf2L+2xjuVpZupat4XVh
 9XZXgIB8KfEN4KZKP3yZRR4D5tAmJLXaSCOMvrHCNJil0YWhg7dHRTUkGnGjhk7I0sB6
 daPeIOVKHYXD94PmR8dO6SjhyVbi9ejIIpI6Llbm7MajZcIBm0qjFdYz5L3BeaPVMl92
 U3/eBAY0rqfgUYH5kO4S0sjF6T+YUQ2nAuUGQ62hXzTKV7W4cU2jD2sb0oAPwU1Xe1Ig
 tpIw==
X-Gm-Message-State: AOJu0YzEig4YEvz+rY5UUIKFwF6b5bDpHNwdDE2X7FmINfFNTRsOkV1U
 B6iEsijIvlT0tprI9i2998kkEE/JjauY5wviTafVp1MAHLeuEuwvtxe/SA==
X-Gm-Gg: ASbGnctZ8CVeZ2H6tRTdV/l3ALejZRagNDSQLqFf9SFuJsRabipiWuKE/Qb45g7GVvd
 su6zDHd+BAxtDrruuN7ge0zllqBA0L2hjI0rRfl1B4QJ981rbLRHhpqUyiElIoxCYd4Jd+OPKTk
 zFGmaxQJIone66OsqbeiIl6QbynZgf0z0bzvMYST3aw0cGJpvRbQ4r8yDDypCu6bYIj/TJLGuAt
 h5tHZqR4awBqN6xF+BB0WpzujMctmtC0lNtFDzMLwLTPqfvWOtJ5IipCg50bZaBve2y9QpjyFzM
 EtGOY9uwsYWVjumrAFY=
X-Google-Smtp-Source: AGHT+IFIy0dbXcYaWDnb4uTgFPaAwRLrAgtc+9qg3kEPM4kz2lemC37vf4ePpttJX/Ir2BJLe64MUw==
X-Received: by 2002:a17:906:3292:b0:aa6:7220:f12f with SMTP id
 a640c23a62f3a-abb70a956c2mr106282366b.18.1739592863914; 
 Fri, 14 Feb 2025 20:14:23 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aba910e8b11sm182177866b.21.2025.02.14.20.14.23
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2025 20:14:23 -0800 (PST)
Message-ID: <67b0149f.170a0220.139ce5.449c@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 15 Feb 2025 04:14:23 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739592865; x=1740197665; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=XRTs4dyjprHk9sJitOne7m5/Ic9gPfkJf2wH6xTGv3I=;
 b=YwL9JEKwdWLRSsuThJnIgc6FvxXXMqeeprGgrC1Za4s2q1xXcbqkj6eBKXeTimvwjc
 r9otS5vwiLRNtcAcpYUFhsy0chXccdMrDC1gO4kYoeWjyWFGAXRzSeZwPsVbTFm1JeBG
 EHMyYFdfgZxXD78ex0MrFLjjC+RMR9FiLaoBP3jEUnHBzJEO2ORQ1MtXLoU2dMWM0d/y
 NVgSBFBR95GcTSlfsacIYlViYv7dpix/AHtZiwJZz5i0lXKsePaMua74ELUv4qNvLNn1
 58OP1B4puKxyDAXOd9MugzYUJPZId5eCmRCGYb2U+bBAsaXraUMalHHeFrdk2czmTm9K
 oH+w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=YwL9JEKw
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-02-14
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

Autobuild statistics for 2025-02-14
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  1  |  3  |  0  |  4  |
  2024.11.x  |  5  |  9  |  0  | 14  |
    master   | 12  | 360 |  0  | 372 |

Classification of failures by reason for master
-----------------------------------------------

                 sqlite-3.49.0 | 205
                       unknown | 8 
                   perl-5.40.1 | 7 
             util-linux-2.40.2 | 7 
                  ntp-4.2.8p18 | 6 
                  assimp-5.3.1 | 5 
                 c-ares-1.34.2 | 4 
                elfutils-0.192 | 4 
             fontconfig-2.16.0 | 4 
            gettext-gnu-0.22.4 | 4 
                 libcdio-2.2.0 | 4 
                 linux-6.12.12 | 4 
               pulseaudio-17.0 | 4 
           at-spi2-core-2.50.0 | 3 
                   bird-2.15.1 | 3 
                   bullet-3.25 | 3 
  gobject-introspection-1.82.0 | 3 
               harfbuzz-10.2.0 | 3 
                 libv4l-1.28.1 | 3 
             lirc-tools-0.10.2 | 3 
                  bcusdk-0.0.5 | 2 
             berkeleydb-5.3.28 | 2 
             bluez5_utils-5.79 | 2 
             bmap-writer-1.0.2 | 2 
                 coreutils-9.5 | 2 
                cryptopp-8.9.0 | 2 
                    gdal-3.8.2 | 2 
            gdk-pixbuf-2.42.12 | 2 
                  jack2-1.9.22 | 2 
                jemalloc-5.3.0 | 2 
           libfreeimage-3.18.0 | 2 
                  libsepol-3.7 | 2 
     linux-5.10.162-cip24-rt10 | 2 
               mariadb-10.11.6 | 2 
        util-linux-libs-2.40.2 | 2 
                  boost-1.83.0 | 1 
                   botan-3.5.0 | 1 
cegui-00b4e1fe174da53b7ed72... | 1 
               collectd-5.12.0 | 1 
              containerd-2.0.2 | 1 
                     criu-3.19 | 1 
             dahdi-linux-3.3.0 | 1 
               dvdauthor-0.7.2 | 1 
                     exim-4.98 | 1 
                  ffmpeg-6.1.2 | 1 
                    flac-1.4.3 | 1 
            freeswitch-1.10.12 | 1 
                 fwupd-efi-1.7 | 1 
                 gerbera-2.4.1 | 1 
                 hddtemp-0.4.3 | 1 
    host-python-greenlet-3.1.1 | 1 
              host-rust-1.82.0 | 1 
 host-softether-4.30-9700-beta | 1 
               iproute2-6.13.0 | 1 
kvmtool-4d2c017f41533b0e51e... | 1 
             libapparmor-3.1.7 | 1 
          libcamera-apps-1.5.0 | 1 
                libdrm-2.4.124 | 1 
                libgpiod-1.6.5 | 1 
        liblog4c-localtime-1.0 | 1 
                 libssh-0.11.1 | 1 
              libunistring-1.3 | 1 
               libunwind-1.8.1 | 1 
                  libva-2.22.0 | 1 
           libzenoh-pico-1.1.0 | 1 
               linknx-0.0.1.38 | 1 
          linux-5.10.162-cip24 | 1 
                   linux-tools | 1 
            live555-2021.05.03 | 1 
   nxp-mwifiex-lf-6.6.52_2.2.0 | 1 
                 openssh-9.9p1 | 1 
                 pixman-0.44.2 | 1 
               postgresql-17.2 | 1 
               procps-ng-4.0.5 | 1 
        s6-linux-utils-2.6.2.0 | 1 
      spandsp-3.0.0-6ec23e5a7e | 1 
ulog-0389d243352255f6182326... | 1 
               valgrind-3.23.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |          assimp-5.3.1          | NOK | https://autobuild.buildroot.org/results/66bfa52beb9010ad0c78ac77459b9aab8ef10d2e | ORPH
    or1k     |          assimp-5.3.1          | NOK | https://autobuild.buildroot.org/results/4a7afad1f1fb87ea5e9b6d16b649ee60b272abae | ORPH
    arm      |          assimp-5.3.1          | NOK | https://autobuild.buildroot.org/results/b93b4990d68b35b81e0b73a66231c3a4e1eba3fa | ORPH
    mips     |          assimp-5.3.1          | NOK | https://autobuild.buildroot.org/results/9803043c50bafa7d4015ef0974c761b478121520 | ORPH
 microblaze  |          assimp-5.3.1          | NOK | https://autobuild.buildroot.org/results/81221678f2b6cc65bc9f9bbdb3f5449849e1b909 | ORPH
    mips     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/9e4ac95d6fa43e3e218e70d951772a8de4a40f3d |     
    mips     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/24b2c24aea23e7af9fb5313f9f973697f1e7ed62 |     
    mips     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/8a393bc977515fd45e0e240cb12c691b31fe5fe5 |     
   sparc     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/aecae9ad94027e7365ce50e4deac36a1169f657c |     
  mips64el   |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/becebdf7c7b96b878aac1a85bf960f2429140fc2 |     
   armeb     |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/a1790209d1509f67b2a2e5fc54982a16e3f79b61 | ORPH
  mips64el   |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/55bf58af2470787538ab523951f5e3862b3867e8 | ORPH
    i686     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/10abce5050650d606c600e33fa18adac9d354267 |     
   mipsel    |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/65c850f6200e5278c1ac0bf8f427b1061451b7d6 |     
   mips64    |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/8e46fe52b55e2471730b8e58e9b19bf25b9a0e2d |     
powerpc64le  |       bluez5_utils-5.79        | NOK | https://autobuild.buildroot.org/results/40329c66e5229fa674d02654931835f2e36b4dda |     
 powerpc64   |       bluez5_utils-5.79        | NOK | https://autobuild.buildroot.org/results/d6a4a42ccb9e8b13819dc775a8787e5bd85540ec |     
   mips64    |       bmap-writer-1.0.2        | NOK | https://autobuild.buildroot.org/results/e8c9fbd01c81f681d5445284b85ff527c5f277a6 |     
   s390x     |       bmap-writer-1.0.2        | NOK | https://autobuild.buildroot.org/results/6bdcae149c22653b05f969e0cdf6d14c192c59a2 |     
 aarch64_be  |          boost-1.83.0          | NOK | https://autobuild.buildroot.org/results/c849b134a107df7ffc2b91879ba019e718bab347 |     
    i686     |          botan-3.5.0           | NOK | https://autobuild.buildroot.org/results/c63defa893ddb5c574bd75208ff3f7cc0e4356f4 | ORPH
  powerpc    |          bullet-3.25           | NOK | https://autobuild.buildroot.org/results/cbb0591b76f1a05bbcb88039cc1a63fc40b7d84a |     
    m68k     |          bullet-3.25           | NOK | https://autobuild.buildroot.org/results/fecc305212659e62facbb7bd56eecedb1a603ed0 |     
 microblaze  |          bullet-3.25           | NOK | https://autobuild.buildroot.org/results/b32ea19a16c657db06e48d91a12e12147eb94313 |     
   sparc     |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/7984dc76917dcdbcd6bb3980d44ee361437afc15 | ORPH
microblazeel |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/ee1310781e3958538e106d5adebad9df3d493b91 | ORPH
   sparc     |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/8aa17846ad516122ecadd450925f60f8f2256455 | ORPH
    i686     |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/df7e33e3834a7898a9cdc72db7ebd069eb695c6e | ORPH
microblazeel | cegui-00b4e1fe174da53b7ed72... | NOK | https://autobuild.buildroot.org/results/cf9a9aaae6536c5474576ec040441a2e9a6b6fe0 | ORPH
  mips64el   |        collectd-5.12.0         | NOK | https://autobuild.buildroot.org/results/8ea086cecbb855ac950297c55ddfe220fc514cc9 | ORPH
   s390x     |        containerd-2.0.2        | NOK | https://autobuild.buildroot.org/results/021e362b4a75a56c266849f95bd61bbf51f5f686 |     
    m68k     |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/ffaca5e4942a5489fb38f41c9a8bb178c7d4dedb | ORPH
   x86_64    |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/98613dd4b497b240bace152fc55d9be0c420b7b8 | ORPH
powerpc64le  |           criu-3.19            | NOK | https://autobuild.buildroot.org/results/2ecd48cc89eb06dac907c0972e57646bb29edab3 |     
   s390x     |         cryptopp-8.9.0         | NOK | https://autobuild.buildroot.org/results/656460eeff47a60943418f9f68b27150ba45f14c |     
  sparc64    |         cryptopp-8.9.0         | NOK | https://autobuild.buildroot.org/results/84f4ededb20373c44c3c37675431e0b9b0dc05ac |     
   s390x     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/d412fcf3faad261196f2cda3bff258e50c933ca4 | ORPH
    or1k     |        dvdauthor-0.7.2         | NOK | https://autobuild.buildroot.org/results/dbb6816c75d595849b6ebd515b2564e57c137459 |     
  aarch64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/69e66113682b195062cc65064e05c546ae9aa9c8 | ORPH
microblazeel |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/358f542f8397bbf6889032808d4b8fc3571e7b22 | ORPH
  aarch64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/29b4058fb0d2dc5d80897adf6ffcf0ff0a1a2909 | ORPH
 aarch64_be  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/841cf48c2924e96a0df80315e408bcd90c946fbe | ORPH
   armeb     |           exim-4.98            | NOK | https://autobuild.buildroot.org/results/baa33f4569f5ec6441f8ff9504c5c2f3e259244c |     
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/71e21dab04111b21811ec0dc8823cf8344478e08 |     
   sh4aeb    |           flac-1.4.3           | NOK | https://autobuild.buildroot.org/results/87b1497edd9984995494955ac115b6b065e88adb |     
  mips64el   |       fontconfig-2.16.0        | NOK | https://autobuild.buildroot.org/results/3951132b6092e0d1d5997b24cc1b0276f959b179 | ORPH
  mips64el   |       fontconfig-2.16.0        | NOK | https://autobuild.buildroot.org/results/69dccbc379d39251a5574a42ae330eb241690af8 | ORPH
   armeb     |       fontconfig-2.16.0        | NOK | https://autobuild.buildroot.org/results/35f32ba23eb8424a5b4f3faf41a23efd05a241e2 | ORPH
   mips64    |       fontconfig-2.16.0        | NOK | https://autobuild.buildroot.org/results/55a8d4b5b8efc970f03ba729f95322a9a81d2f6c | ORPH
  mips64el   |       freeswitch-1.10.12       | NOK | https://autobuild.buildroot.org/results/2cd7e25318f9312c1372fc7fae00ce7d8199ecb9 |     
    i686     |         fwupd-efi-1.7          | NOK | https://autobuild.buildroot.org/results/58dda6946540dbba434d2691c9739923f36b00ec |     
   s390x     |           gdal-3.8.2           | NOK | https://autobuild.buildroot.org/results/e623dacb0484efa6c9f0e0992be661ce5e9e453b |     
  mips64el   |           gdal-3.8.2           | NOK | https://autobuild.buildroot.org/results/f9ffbc4934afc4d3faa1902e8ee731dc118fbe4e |     
microblazeel |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/0142ae4510ddbbafcba143ed11736133b1d9b1db | ORPH
  mips64el   |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/f01edc21d52f5650950053978c32b0200ea47b28 | ORPH
 microblaze  |         gerbera-2.4.1          | NOK | https://autobuild.buildroot.org/results/3df24e8cb6e79cf485f1770b6bb280a5ce9b47a1 |     
   arceb     |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/bf2b5c5dd4b9c8b1f64682c072ccbe99687cf8ee | ORPH
    or1k     |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/2c2f6d26189a9d46b1a5a21fc8f7d1115ad00adf | ORPH
   mips64    |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/fdb358faac84c09f55296d99c36d566cc1de7814 | ORPH
   sparc     |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/32045f7aec2e8093543c4a45a8c12789a032480a | ORPH
   x86_64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/f8d84ba15e2a1a754e9d60bf7d4cdb4fb5a0864c | ORPH
   x86_64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/89508700a86cef4500dee7175e832f6edec7eec9 | ORPH
   x86_64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/6654f344f497c13fcd9802409b593f7d21890f07 | ORPH
    or1k     |        harfbuzz-10.2.0         | NOK | https://autobuild.buildroot.org/results/9d02df5dab95494c0d4f399286904b1727d646dc |     
    or1k     |        harfbuzz-10.2.0         | NOK | https://autobuild.buildroot.org/results/569785b77b89576febc50d33077f8edc7335585d |     
    or1k     |        harfbuzz-10.2.0         | NOK | https://autobuild.buildroot.org/results/ca0a2a16443e07bccca244be8d6027b566cb225b |     
 powerpc64   |         hddtemp-0.4.3          | NOK | https://autobuild.buildroot.org/results/2c9674e3ef2a2c3a5235b596278a392d1f3a757b |     
 powerpc64   |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/f6decabdc886405cce5e4e7d33b87afe88ad12c2 |     
  sparc64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/e2e2bb68edb9a5cf8636d1953f3c35dfca9baded |     
  powerpc    | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/6dfa2f130a9b01d5ed7ef3f5fdfb67c2aec8723f | ORPH
   arceb     |        iproute2-6.13.0         | NOK | https://autobuild.buildroot.org/results/ca965020b6a25303847412b29932bc6c61c6f3e3 |     
    m68k     |          jack2-1.9.22          | NOK | https://autobuild.buildroot.org/results/7921aa9034e060937e89aacab320e5fd01819f6f |     
    m68k     |          jack2-1.9.22          | NOK | https://autobuild.buildroot.org/results/642ea1ec00a68bb26824c99c2d5352219a744236 |     
  riscv64    |         jemalloc-5.3.0         | NOK | https://autobuild.buildroot.org/results/f74ae04ccd0668f63d4484d50cf002e133218369 |     
  riscv64    |         jemalloc-5.3.0         | NOK | https://autobuild.buildroot.org/results/27e0ff9228105631a5732e4c354cdb52de7ca714 |     
    mips     | kvmtool-4d2c017f41533b0e51e... | NOK | https://autobuild.buildroot.org/results/a2861bd2ebd4647376835148c0921041596567aa | ORPH
    or1k     |       libapparmor-3.1.7        | NOK | https://autobuild.buildroot.org/results/a0485d15b9db13e51d1343ff79725f434fa4c33a |     
 microblaze  |      libcamera-apps-1.5.0      | NOK | https://autobuild.buildroot.org/results/d1517d6fc10367cd394fca234a174a1eed2ee73a |     
  sparc64    |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/150f8980780ba9e693e2b2d428fc0c7d92ab4eb6 |     
powerpc64le  |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/03250d14df764b8512aebd8708cfc62717a466e3 |     
   s390x     |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/7c582e3c6e085bf25a07079dbd3a51b150bc9db6 |     
   armeb     |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/b85e470c03c1e1f9c165db7f250e93b484f546c8 |     
   sparc     |         libdrm-2.4.124         | NOK | https://autobuild.buildroot.org/results/b6335d281e1f6c98e6694fe9ab34f739e202b3c5 |     
microblazeel |      libfreeimage-3.18.0       | NOK | https://autobuild.buildroot.org/results/48ef60b30fc593f40fcde9e31fa361e7df9120bb |     
powerpc64le  |      libfreeimage-3.18.0       | NOK | https://autobuild.buildroot.org/results/f5e530c48b55c4564cb4c620c51b7ef670213c2b |     
 microblaze  |         libgpiod-1.6.5         | NOK | https://autobuild.buildroot.org/results/5bf7dbfdc0e248cc72804d84cbd0141c7649ea7e | ORPH
  sparc64    |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/82d41e278ca8818a1bbdcedb5c21b206b09c7338 |     
  riscv32    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/daca5305f786f67d7d79d3dafa7cd33d3675e943 |     
   xtensa    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/fc98f21863f853802fadbd83ef37b14cc5cbd897 |     
  aarch64    |         libssh-0.11.1          | NOK | https://autobuild.buildroot.org/results/7e6872a8677b5487b3eb1faa72542e4852b9245d | ORPH
   sparc     |        libunistring-1.3        | NOK | https://autobuild.buildroot.org/results/b572db1524de16006d55a42dca43a0a500f78ed0 |     
   mips64    |        libunwind-1.8.1         | NOK | https://autobuild.buildroot.org/results/a23b612632f6a271867d198997895a40b5b10ee0 | ORPH
   arceb     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/a1d9d327ae68146e5968fe9613e39fc0e5d26f2d |     
    i586     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/140fb9eeb2c9eb80d8f9e66160eb9803ceb2b664 |     
    m68k     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/62db9357c850822e591861cc3b2882b755b7d6ce |     
   mipsel    |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/96376fdb2268d21adb4bb0a8a4b96024d4ad3395 |     
 aarch64_be  |      libzenoh-pico-1.1.0       | NOK | https://autobuild.buildroot.org/results/9f1647aec4e7a4f3b0398f3c040d37980e02fbdc |     
 powerpc64   |        linknx-0.0.1.38         | NOK | https://autobuild.buildroot.org/results/675e863a3c84e48ad929950bb96f9832ac5480fd | ORPH
    arm      |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/84f51df7fdccb21581abccf3d6c461275cb8c019 | ORPH
 powerpc64   |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/c8cb4599249becb81765529c6af3d81105d18ead | ORPH
  powerpc    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/a8a461175635895df5612cb7f15a7623e5fe7184 | ORPH
  powerpc    |         linux-6.12.12          | NOK | https://autobuild.buildroot.org/results/023d1d8b3f0af2f8569286690bc5229b6cd03cac | ORPH
powerpc64le  |         linux-6.12.12          | NOK | https://autobuild.buildroot.org/results/eadc8cf1262b235bfacbfcfa237c13e6b485d3a5 | ORPH
    m68k     |         linux-6.12.12          | NOK | https://autobuild.buildroot.org/results/eb3c156b51293fd880bd3f6bddb2c044babf3add | ORPH
  powerpc    |         linux-6.12.12          | NOK | https://autobuild.buildroot.org/results/992026fafbd29c90d295b03a06d3c8e73dac8d08 | ORPH
microblazeel |          linux-tools           | NOK | https://autobuild.buildroot.org/results/b9ec24118cf1966b0640ced59adee7f77cc85e35 | ORPH
  sparc64    |       lirc-tools-0.10.2        | NOK | https://autobuild.buildroot.org/results/7b1d8890349096e8d84238c6ee55b8eae9f9d5f3 | ORPH
   mipsel    |       lirc-tools-0.10.2        | NOK | https://autobuild.buildroot.org/results/09b905fe8d52ca4d9cfb5d2e4c32888467330f99 | ORPH
    arc      |       lirc-tools-0.10.2        | NOK | https://autobuild.buildroot.org/results/f1b4d0b1d07d4cf531bb321d08c7f6dad616eaac | ORPH
  sparc64    |       live555-2021.05.03       | NOK | https://autobuild.buildroot.org/results/6c377fd2d2ca8035e8359951fa2e7953e22b87ba | ORPH
   sparc     |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/05b2e9d64ee044c9344494c2f4c8d84b6a27100e | ORPH
   x86_64    |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/ef1cefedd752657a5122974ceed36139f98a3f1e | ORPH
microblazeel |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/17dd0977c904ca4c3ec67cdf04ddd246c8a3be4b |     
   armeb     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/1b2d70863dedd3670a93afab1b98fa30cd3640a6 |     
microblazeel |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/1d81e4182e5ad80c3a827971762972831898251e |     
  riscv64    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/f5377e65611e43c05f94d09a1a6a30ba5daf4401 |     
    arc      |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/1204ed63d958b523db76c42bde8ede33d0304d7e |     
 microblaze  |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/930936aa511c4e5a7c3873eb36cc5fb48668f6df |     
    m68k     |  nxp-mwifiex-lf-6.6.52_2.2.0   | NOK | https://autobuild.buildroot.org/results/e0f2fad9269eb7c47f7a59b9f8ffb8b51e26d267 |     
  powerpc    |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/3869554e47fa3a19b7bdbd213e32ab307c8c7fd8 | ORPH
microblazeel |          perl-5.40.1           | NOK | https://autobuild.buildroot.org/results/b686e238c6f5ad585d4da98a0ce35157de34bdd7 |     
    arm      |          perl-5.40.1           | NOK | https://autobuild.buildroot.org/results/25c7213d458faf9ca67aafa48cca64d1ec4f7fe0 |     
   s390x     |          perl-5.40.1           | NOK | https://autobuild.buildroot.org/results/19e73f443a023cd52aba4e859d1d8c7f6c31f9d6 |     
    sh4      |          perl-5.40.1           | NOK | https://autobuild.buildroot.org/results/dc9f82e8c618bcf75db620772502bceebbd0265d |     
    i686     |          perl-5.40.1           | NOK | https://autobuild.buildroot.org/results/4331f1a92bbc9c744c63794ac07eb85b320d5be9 |     
 microblaze  |          perl-5.40.1           | NOK | https://autobuild.buildroot.org/results/7fac7c2afcb7b85fa3aaad64ee7967b10ded08b2 |     
   xtensa    |          perl-5.40.1           | NOK | https://autobuild.buildroot.org/results/3b327eda13be496015e2d424ba711b84ef063002 |     
  riscv64    |         pixman-0.44.2          | NOK | https://autobuild.buildroot.org/results/1ed33a3a04c2dfe02451ef040b38a96de280d1eb | ORPH
    sh4a     |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/a53dadd8bd6f6b7888782401a7157cdd2da4d611 |     
 aarch64_be  |        procps-ng-4.0.5         | NOK | https://autobuild.buildroot.org/results/99a52543648a7e86bcd2a9af04537badcf6d6b9c | ORPH
 microblaze  |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/eb7ef9fdb51d3dc3328bfee2c918c15d51ad2e4a | ORPH
    mips     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/4ca08cbdd26f0afd0e63aadcea6d660a08b9921f | ORPH
    i686     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/daa66edcba0c448492e0369b4bbfd43f6eaca595 | ORPH
microblazeel |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/3501defc1a2695a25ce812c9d8450e1d7a50ffef | ORPH
   xtensa    |     s6-linux-utils-2.6.2.0     | NOK | https://autobuild.buildroot.org/results/7bd9090d46a2887a48c9c6ea05a3be95e4ab976d |     
   mipsel    |    spandsp-3.0.0-6ec23e5a7e    | NOK | https://autobuild.buildroot.org/results/77550def0d821c6fb64f478fced732f65eda7d46 |     
microblazeel |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/ae0e7ed75651edd4bee187105f5c47c3158ed178 |     
   mips64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/e13c61c1e2243ae57f2ad31fc0499ee651e57784 |     
    arc      |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/abca121dd64591af60664f7ae504708eeb39d88f |     
   mips64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/00c349dcb38c816fcd340ab62aaa6f473825cf99 |     
   mipsel    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/b1ef23f188cc913108a88906c05ae1b14c577c22 |     
microblazeel |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/60f1d4db2560b0a8ab4d2dfdde8bacb3e3a146f8 |     
   xtensa    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/ad911f0e55776323f0765b51f8639a8d3e7ea601 |     
powerpc64le  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/6439cd63867b1febbe5c6edf9d1a793e3ba968dc |     
   s390x     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/4cf95256dab7c208145fbf87afd0dc2305e15454 |     
microblazeel |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/1ad94b2c0d223c893c4434892031fba522a9c3c9 |     
 powerpc64   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/da4211600bd46440faac05332f9228921f2ca612 |     
microblazeel |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/ae85f02c40c105e49ba55bd2353d263cb33d38e9 |     
 powerpc64   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/1358a67c1077d44d8a99a69d01f6cd87c6c7a9aa |     
   s390x     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/7fee00d94b1afdace80fa540e762e336db8ca977 |     
   sh4aeb    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/9d1725c29ac10baf77762c295e22722549f2c0b2 |     
microblazeel |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/9adf65b0439bce8f756b11b2d86913f1de8fbb25 |     
   armeb     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/416f6ebfa1a8aed354be94bfc8265df616a9789a |     
 aarch64_be  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/53a234e53119f3911d29ec306ba871888187e58b |     
microblazeel |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/0c40151a7a254eb84cba1e5714c1c3c2eb7d1b49 |     
   mips64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/5eca3783c04126542ceec12bb700f268eb369728 |     
 aarch64_be  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/946a701873049c51b9111c26edfc4843309bcf54 |     
 aarch64_be  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/d1259370c84d1d2fe0a5a3bc66d09f3d8343b3a5 |     
   mipsel    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/3c5922f667cba56fb9f8d330d22952311a5cb8f5 |     
    mips     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/2c31a00dc0d2fc2ff2f0949a12a87d4a6b0802e6 |     
    arc      |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/71fc95c5fbfbbe5bc66d8c1c0771d99c5788f304 |     
    i686     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/7cc6daa53ac8eddd9b05837bfe54c196e9d67c62 |     
 microblaze  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/15fab611135f48feb0d6de4320092003e895a542 |     
 powerpc64   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/65d5595ffe4f408590da0a4224ddad9fad2117c4 |     
    arm      |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/f4e2c541a8670cc6cb92d5d86982da8dda3f86bd |     
powerpc64le  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/f4d6c012b2547589a41bccba4206d8ed4b02f593 |     
   sparc     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/142e48d9c715895caa163cdce9dc5a73b528895a |     
   x86_64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/a3781cd49e61fb2454405c731998b97845e47db2 |     
    m68k     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/b71a29e3d8074e644a7759a151f3830972152882 |     
   x86_64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/4aa4b230081db7fb24ff6fe52f7ca4053e3435ee |     
   xtensa    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/08d9036b532b9786dfd6f1cbef8cf261465b4459 |     
   sparc     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/9ca0bc31748d94b71f43717009f79ab2cf35beb4 |     
    arm      |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/9e0bbfa3931874e93867ad72db20013dd95b6a4f |     
    arm      |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/65b694a54b627b0a7bbaccfb8b8d8c3431d53bcc |     
 aarch64_be  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/00c9bc3eddc21a042b0ad8610975df5972ad80b2 |     
  sparc64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/7d9e082130e80aff253a120da1e20f1777498133 |     
  riscv32    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/2f1c83b44173494603ebe3474c908f9bc0ba3bd9 |     
  sparc64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/ede5f6eef544566c1fff756082bc060566202a1c |     
  mips64el   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/5b994a9265e5ff5b46f5db1f964aa0be746421eb |     
  mips64el   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/d06df2501aa0933014a6cf31846ca7da25c42757 |     
   s390x     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/68495d43af68b6a45fa13a3a7b08f4f9fde0f6bc |     
   mips64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/1f2e22981b4b1a7fb9f5bdc34b668b4f87892b92 |     
    arm      |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/a2f49f7678b1366697035a93dab966b3464c8950 |     
   mips64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/cd7d90ad29e739ed9344f148b61061d0cbca406b |     
    or1k     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/63563f71706547b307405800516b8572bfc72a3e |     
   s390x     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/fe842b833a368e36f28b9d248077b85e6253b984 |     
   x86_64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/6a6786b10feb7d56fd4bfe2d371cc22ce9556a14 |     
   mipsel    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/89087857b4ff6e76b410a6b4b8f008dda49b350c |     
    arm      |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/3e6bd67ed3a5eae7ec75a818738a54dfbd4ca433 |     
 powerpc64   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/d6dd37b93ab2edfe89611160246f2aa7b7d60fe3 |     
  mips64el   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/a8cd91f7adf9756d492d79823b184e5995de15ce |     
powerpc64le  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/296d8add3f033ec6a0c326d3fdec21c0ac28b434 |     
 aarch64_be  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/cf71f92743c7bcb41cf8f1a05fd3202c1c5e4de2 |     
 microblaze  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/d47d2486e24dcc7e312e4fa672365e07c51a4ad5 |     
  mips64el   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/7c3d2804f09dfb1e12b8e480db6685378c58df2f |     
  mips64el   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/cfb3c20ec596fd36ab131fda01a5ec9d513f8035 |     
  aarch64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/aae95b4731cc5bebb69fdd417bae4751721f69c4 |     
powerpc64le  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/5718f4dd7b1c305bd04d4f8472c0bdd832e7c721 |     
  riscv32    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/601900de0df548038b489b381358a7208722de07 |     
 powerpc64   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/568a73da002ecc63cce88526f25a74c8e2ddfc32 |     
    mips     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/b3d39d5c4ff7522833204a9f1f630f2dda231102 |     
    or1k     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/7a3f7d98cc3b23ad89b275926111663cc535bf33 |     
  riscv64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/25d0e7621565d1c0547ec842eaaa894d5d79d23c |     
microblazeel |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/91ecdab1ceeda2ed7f18d406d1681b71b0e34380 |     
   s390x     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/65bf6883c429dc8631854b88009b8011e775b143 |     
 powerpc64   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/2998949b992e6147e87256607faf850e99343ed6 |     
    mips     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/f6c86f9360ea2d980ca2b6b9648383eeca2ecff8 |     
    sh4      |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/2d1443592c4a64e9a3696d95f49cd3185dfc324a |     
powerpc64le  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/9e255538e3c2db413708ef473d3731f508b75b72 |     
 powerpc64   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/2858ca31fce391a512c9cefa008e1ca9e97ff017 |     
    mips     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/3e94a39152973dc8dc2a4bb1b8bcfa6a51d749ce |     
   armeb     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/16a750a10f8aa45af62795475822060f6a365482 |     
   mips64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/250834e55f7a080b929ec945d319864e255c49ac |     
   sh4eb     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/9f7e0fd93633bf4a393dfee49b338cb286fdeefc |     
    mips     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/d97d3379e716d33daebc329234f69ccc90fc7e5a |     
   s390x     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/8d57695a5dc8cf54e488ec238a6b63b74a9920c7 |     
    sh4a     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/905b634eaa5b29829c178433ce59149a3327b0e4 |     
   arceb     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/ad70f41bfeed6db0b0ba4dbeee32284b66d68c7f |     
    m68k     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/5a127bf74c2ee3db4bcb89a1bfb92af0daaff393 |     
   mips64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/28a1dd42b38d21b897f4a2e1821597a925d1cdf4 |     
   s390x     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/773c6009c901520d64355672f25a836c14bc46ec |     
  powerpc    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/a3e79baece0d8775de2abdba6410eca16098f2a8 |     
microblazeel |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/23bcc297e23ff682677af0f324030cb4c2097be0 |     
   s390x     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/e466cf945a635add236f0e036f3fb05a53690055 |     
    sh4a     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/5bbe940bcd6ed8ac53fbfdbd7e3de5aa7fe82b1f |     
  sparc64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/d1ed4526f83aa4138ba99fb15e28072cf85c848b |     
   mipsel    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/b3f90810cb0a0aee50b168a83c1f705588870729 |     
   s390x     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/d5189e538437aaa9c33cab6a6ec1840721d53413 |     
   s390x     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/9d902f2c9b60de11d16d801e9bd51ac985495b53 |     
    i686     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/e57ddb162b8a100be771a50dc3d5f213aa115e19 |     
   arceb     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/9f8ae08a538d21d760e0fe0640147ee304305447 |     
  mips64el   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/5a6bae58619caf8a09cbfcdd24654459d94439c8 |     
    or1k     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/358e0aef2ec765cb2e2f426be24101a65fe29c31 |     
microblazeel |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/3b8925d4ceaedd73c38a8e04e4a04319d8536316 |     
microblazeel |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/5f3c01ddd9903294a97b81798891e84f788e21d5 |     
 microblaze  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/6ad89ddbf2e235966821f754cbbf3e3f3dc88a48 |     
microblazeel |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/6557b93273f106c530ea379f41682884620b195d |     
   mips64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/04fafedfe340ae2fda4058aa285de92ca6347e3a |     
  riscv64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/319904b7d40a5bb0ec9d4274dfecae4fff455088 |     
powerpc64le  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/276026fc99611b22e0a0d5c0aaab0c75cb3407c1 |     
    sh4a     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/d960fd9aec2f2ee51713ae7704acea35092f3165 |     
   mipsel    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/2e15d424bcbc9bfdfc3a653122e348bcafc7fc53 |     
  sparc64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/9b2fcc432bb205b8589aa6178f97e8feed3202b4 |     
   arceb     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/4c4822e778d1e05f62e32a8763694b7cc85c9287 |     
    i586     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/b3c6e4b73bf9677366822748a70d58322f5d30dd |     
   mips64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/80852565b1d46a129bae17301995470f3f17a719 |     
   sh4eb     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/6a62f7af08de04fc5f88115a15959a5d889ddcb3 |     
  powerpc    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/462385cd338fa9e64aa166441e8346764c3fdf06 |     
   sparc     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/3073a764ff948a564ed6dd61dcd8dc848f0be5e6 |     
   sh4eb     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/93d2c4fe42a5ced6b6cd588773b7c57f67fde098 |     
   mipsel    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/b8df8551229258f5778a1c4361562f572e226b66 |     
  sparc64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/cc2249129975ac5869ca866c050ad111907176cd |     
    i686     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/7d7a04c0b2cf89b0a4822c533d0abf6ef0ce2a3c |     
   armeb     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/084ba166130e483c6ab9d9630079f04ec52802e7 |     
   x86_64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/8af74f1ea14875fc8f65d4f19e7ea2442fca70d7 |     
 aarch64_be  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/50cb1f492b82659d0b407c690ce369cf1a9806e9 |     
   armeb     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/3bdac2424007828c0c5056f13a276f1fda617da9 |     
   s390x     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/c51c107fb534407c0c3f069d98793520efa25192 |     
microblazeel |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/58680813e05d11bf820fd55042a131f93f80ff3f |     
   mipsel    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/cd70ff7efbf67cf034148990d1ab42702c2d3c12 |     
  mips64el   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/9d1778988452f91ccfe2842ea1c57203a3a07732 |     
   s390x     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/00726c8c3f5f51e3f360ad891e38275517f48b98 |     
   mipsel    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/435fc1381583341823309150c279c5bd87e7d623 |     
    arc      |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/38ee5e4394e863fffee76575127885c68a83ca12 |     
  sparc64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/0b2c0110312ba78c1dff5febe38294f613164600 |     
   sparc     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/f538711710c92914b9615f4859f42614ceaf553b |     
   x86_64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/7a2084e3f045143cecd5275b0f4bc0bd9c3d7f2c |     
   arceb     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/bbbb0844a739ec4b439f69bff0cd6b5e6ba40a96 |     
  sparc64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/785fd772f1630566ec3c78118aec7421cafb459d |     
  mips64el   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/54378aeb74529c4410b059c7dbe513c90ad4e139 |     
   armeb     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/109d32ad0cf00205f25f97db473b2ed37f675ffe |     
powerpc64le  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/79cd24510e643e78381569c1702ddb0eb9782d56 |     
  mips64el   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/12951a9c7cd99b31bdd46ea07bf8561918df3d27 |     
   sparc     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/ba5881b769015ff24c297bef1a57d48ac6a58054 |     
    or1k     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/97c85df2acd482626332d095d4f58d86c88ecb24 |     
   sparc     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/d04015ad3412d4c9b49e0a24c6d89701649aa982 |     
    mips     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/32f41c726719f6a8ad863f7e313ea599f5a3b840 |     
 aarch64_be  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/37f80c585afb0c6945062d72155e2a6b5be35cc5 |     
   s390x     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/06c90a6a5bd834d59decba21d1f7bdce3dbf4a06 |     
powerpc64le  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/9ab983dc1a4549bce205f11b562811d010b5187c |     
   mipsel    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/293c4d18301c17e8943c99f6902381967d5ec93c |     
   s390x     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/225f712fef61f4f73d5d7a80fda6d70fa9871d67 |     
powerpc64le  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/49fcd5673ee2979212ba3ea23dbd30bec6ca2d7e |     
   armeb     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/10af6ad538d2580faf913a780d8d7b1e2b4e1ab1 |     
  mips64el   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/b12997d01ef39bc311edafc4c7e3616372fab1b0 |     
  powerpc    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/a01c9ff69d9cf59ea579accd580d567dd7431792 |     
   mips64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/d1b039f71a52be4134d89ff7682e75e2cdaa1b4c |     
    or1k     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/6da6e17570873e6a4d4ba6be6b863ecff21f1f35 |     
  mips64el   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/4e88b2e520df4576154a2c276d9a2d77eb6784ac |     
   mipsel    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/77b263964242c98c3f48a635a8af4ee2de16119a |     
   mipsel    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/8f1bfb373969a8ece24a709f675512dcfcf4bbab |     
   armeb     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/a028c48b209cd095050b973a3a831aba29437ad6 |     
  powerpc    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/ceaecc97677905df701b22ed91df75a95726bdd4 |     
    or1k     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/e77dfb56eba832907d6d86d9c05fe24aaa056c9d |     
  aarch64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/c7bf01a6b31217af2ffc1186405a30410d23380a |     
   mipsel    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/5b35bedbf6dcff595cbadd083cd5dbf6e8987ab3 |     
powerpc64le  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/664259e8e500479fdeef3136382d3f3a31fad242 |     
 powerpc64   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/1d72c310faacc95d017c5c09216da0e75861d053 |     
   sparc     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/ea20b1b690694e2f4e7d43dcb1e1114aa36ab5a8 |     
    arc      |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/bb3e036fa20e538c6645a68cafc70556c19b17f8 |     
  aarch64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/b9b8e20f74ad1ce9a0cd899f235c8980ded528f8 |     
   mips64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/c9a075af19c705bb02331fcb1b5026718c7b4783 |     
  sparc64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/0988eeef720404fbbcf252a4d41470fba2448c29 |     
 microblaze  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/36776101a8c6dd88f1f1256317bb242ccde386df |     
 microblaze  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/d519b70bdb1ae52dc74799e337858c4bb1438af6 |     
   armeb     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/ca4c693de78911cf23b52666fcf7d40539d5d1e3 |     
microblazeel |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/71f8493259fd865856874597d5f645d1ecde3aa4 |     
   sparc     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/835d9b194384f5bd4b52211ab8d1d224c03508db |     
  mips64el   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/5af49eb710a82341cb5e3dabf7edc1b34aacc58a |     
 powerpc64   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/60ae8f94b549a5501d0f7a444d5b2dcda2c670fc |     
powerpc64le  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/0c72f9515a0c315fb05dfc579f34fb1434904751 |     
    mips     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/bc5e531fe5b1f151233d8738d6ef4fe7a44b958b |     
microblazeel |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/5998f18838eeb1064295b02d53cbfdad712ebbf0 |     
   mipsel    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/0d2a2e7674ff6ef4122821f7ca68c5b84e724b51 |     
 microblaze  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/0c40f2782259586d673a040b6249ae198ca41725 |     
   xtensa    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/4c49979287fa8c2b9dee3a640eec7a7873d46509 |     
   mipsel    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/b35e4e7593083d404cce9af92d836d2bb31e9b2a |     
 powerpc64   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/36449b55901151067486c1b48eecbcec2a926392 |     
   armeb     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/5a4025808c129b027ed5dfc44c8fc7785de63063 |     
  mips64el   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/034d85904768275b8c5b26ce8088cb01ec292582 |     
   mipsel    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/d5dbfce47f34dad1e97096baa81ff86c96c9a6bc |     
   x86_64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/6e9a2ea0b41022b3c6405cba03a2b500d6e43727 |     
   mipsel    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/90463cf012bf178c5c9f80e5e1f21a722eb7208d |     
    arm      |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/de57d8c84181f54b23626effc99870e1dc6a5210 |     
    sh4      |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/0c6a6f26463cd32e1e6c06d49efe0c84d892b734 |     
    arc      |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/5f5622111bc905980652c858fcf3492ef7c3b57b |     
   armeb     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/2fb767e2758411df9892250e1f8a23aa9084e864 |     
powerpc64le  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/76267b7624b30eb0c938cce27c7ed8ee76fe26e7 |     
    or1k     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/a53ea5498dcdb8dbd417b893aed6b1dea4fdba2c |     
   mips64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/b89b37548ee0792a11e194f4c2016ecad4e27161 |     
 microblaze  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/154028c3548819a73bbad82130f06b44cca67bda |     
    or1k     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/5c4f4c0184b39bb842b93721b475436ecfd85e63 |     
 microblaze  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/ec05f513af7ad59e619aa7e7edf2c7695dd0cf67 |     
  powerpc    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/69ed727a04d72c1f31f12c81d158cdb96d91dc47 |     
    i686     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/453ee84f3652ced1df08ec9981b685e1a4632930 |     
  aarch64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/30764625a872585c918960457dc7bc2030eb83a5 |     
   s390x     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/8f24d1509cc8cc3abde57043a339c1093c932d76 |     
    m68k     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/d11b0f0be49f5768ae6a129563635ff05dc97479 |     
    mips     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/4641e2b019673d30ac2ab6fdfc0192f57f366868 |     
  powerpc    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/74f01b91e0e68a652c0c06d6f5c3e5394a305576 |     
microblazeel |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/48fc867c1f927e9cecb160cbc319c71ed1fb0525 |     
    arc      | ulog-0389d243352255f6182326... | NOK | https://autobuild.buildroot.org/results/236a76d784f9bdcc1463a6d3a828e41866844ecb |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/6f1e337785515c8a71e8c100f30eaae2d625657b |     
    m68k     |            unknown             | NOK | https://autobuild.buildroot.org/results/75e80ad4c15ae2ca89d5b43fd79fe45ba8300f68 |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/d430de54b9fcc13d01757f0a44b025cd0e4d487a |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/aada3c2f19a674cfb7d733e32f9725bfee14941c |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/3a350060c0638b4bd1e974c3dc2f34bd363fbda7 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/590a40e3d5a704c0e6ca43fc202337bb7951d17d |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/f6cb0704da98f7bb03c2c08987e2b27060efd81f |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/6f6428f8dd822d51e136dcb8ebcdaaaec010fc0b |     
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/a49f09c67a04b70b93bea35053f44185595266d4 | ORPH
    m68k     |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/f02184e786b8b1f012928e90bed514a31fc2d28d | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/01d4d7f545cb89674f3071267db60eb7a40a2cfd | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/96011b2dafb1a0c6cd91a0c207ab398ea8216abf | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/5ff46534d846d7fcb2a6cd3b141b2ea80410a85a | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/1a30cb5683ee45eced56ef9e90a8b1967a24610b | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/fd6537b196067ebf7215dc67bfdae7b2d235dd1a | ORPH
   xtensa    |     util-linux-libs-2.40.2     | NOK | https://autobuild.buildroot.org/results/bb1e8e2748d052a42daf3327b73090e099d02999 | ORPH
   armeb     |     util-linux-libs-2.40.2     | NOK | https://autobuild.buildroot.org/results/f394f1615271f389161e91450b72dc317df0b553 | ORPH
   mips64    |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/37d89bc98bc594c6856b9d6c77e175d8351d1298 | ORPH


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                  linux-6.6.75 | 2 
                       unknown | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |          linux-6.6.75          | NOK | https://autobuild.buildroot.org/results/6a4d4f487e84b88b8a7014d9f1fd09da24bb745a | ORPH
   xtensa    |          linux-6.6.75          | NOK | https://autobuild.buildroot.org/results/59302972da4f5ef37a2fd980c0c822c22a26fb27 | ORPH
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/9434b1c98a5dd4298802e3c523e03aa72587f6d4 |     


Classification of failures by reason for 2024.11.x
--------------------------------------------------

              fluent-bit-3.1.3 | 2 
                    brltty-6.6 | 1 
            host-binutils-2.42 | 1 
                    ipset-7.16 | 1 
                  janet-1.35.2 | 1 
               libgtk2-2.24.33 | 1 
                   mimic-1.1.0 | 1 
               tcf-agent-1.8.0 | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/abf1252bc1c88368d29e1bd4c405f7b121a913f2 |     
   sh4eb     |        fluent-bit-3.1.3        | NOK | https://autobuild.buildroot.org/results/faa0c821d8f6aca23d2eef638cf3eb09f17b533f |     
 aarch64_be  |        fluent-bit-3.1.3        | NOK | https://autobuild.buildroot.org/results/b8645825ae1c912141dc4e10d24b1d3ffdc19970 |     
powerpc64le  |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/d209c9464464ae402840f22132e04eabd40e584a |     
   sh4eb     |           ipset-7.16           | NOK | https://autobuild.buildroot.org/results/156f5fc92d61501ae853bc3533d4eea28bb82d9e |     
 aarch64_be  |          janet-1.35.2          | NOK | https://autobuild.buildroot.org/results/505fe09283cce25d9e8904ce26a10b9beec60ac5 |     
   mipsel    |        libgtk2-2.24.33         | NOK | https://autobuild.buildroot.org/results/37ac9bd3760722e58b7fd39c09122345e57a9328 |     
  mips64el   |          mimic-1.1.0           | NOK | https://autobuild.buildroot.org/results/1fabee78ea5bd91a8fcfc156d19fb5022491abff |     
microblazeel |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/f9701851a5c570e62d36c6a51b8f16462e47132e |     


Gitlab CI results for 2025-02-14
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
             amarula_vyasa_rk3288 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9122555527  |      
                   andes_ae350_45 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9122555533  |      
                 arcturus_ucp1020 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9122555550  |      
             asus_tinker-s_rk3288 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9122555733  |      
               asus_tinker_rk3288 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9122555763  |      
                  at91sam9260eknf | https://gitlab.com/buildroot.org/buildroot/-/jobs/9122555790  |      
                   at91sam9g20dfc | https://gitlab.com/buildroot.org/buildroot/-/jobs/9122555800  |      
                 at91sam9g45m10ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/9122555828  |      
                     at91sam9rlek | https://gitlab.com/buildroot.org/buildroot/-/jobs/9122555862  |      
                 atmel_sama5d3xek | https://gitlab.com/buildroot.org/buildroot/-/jobs/9122556082  |      
                        avenger96 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9122556116  |      
                bananapi_m2_berry | https://gitlab.com/buildroot.org/buildroot/-/jobs/9122556131  |      
                bananapi_m2_ultra | https://gitlab.com/buildroot.org/buildroot/-/jobs/9122556139  |      
                 bananapi_m2_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/9122556145  |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/9122556151  | ORPH 
                   beagleboneai64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9122556197  |      
                       beagleplay | https://gitlab.com/buildroot.org/buildroot/-/jobs/9122556210  |      
                      beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9122556240  |      
                     canaan_kd233 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9122556250  |      
                  chromebook_snow | https://gitlab.com/buildroot.org/buildroot/-/jobs/9122556259  |      
                             ci20 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9122556262  |      
                      cubieboard1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9122556269  |      
                      cubieboard2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9122556274  |      
            engicam_imx6qdl_icore | https://gitlab.com/buildroot.org/buildroot/-/jobs/9122556277  |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9122556279  |      
        engicam_imx6qdl_icore_rqs | https://gitlab.com/buildroot.org/buildroot/-/jobs/9122556283  |      
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/9122556286  |      
             engicam_imx6ul_isiot | https://gitlab.com/buildroot.org/buildroot/-/jobs/9122556289  |      
               freescale_p1025twr | https://gitlab.com/buildroot.org/buildroot/-/jobs/9122556328  | ORPH 
             freescale_t1040d4rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/9122556330  | ORPH 
          freescale_t2080_qds_rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/9122556333  | ORPH 
           friendlyarm_nanopi_neo | https://gitlab.com/buildroot.org/buildroot/-/jobs/9122556335  |      
           friendlyarm_nanopi_r2s | https://gitlab.com/buildroot.org/buildroot/-/jobs/9122556338  |      
                 hifive_unleashed | https://gitlab.com/buildroot.org/buildroot/-/jobs/9122556362  |      
               icnova-a20-adb4006 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9122556366  |      
                imx8mn_bsh_smm_s2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9122556429  |      
            imx8mn_bsh_smm_s2_pro | https://gitlab.com/buildroot.org/buildroot/-/jobs/9122556437  |      
                kontron_bl_imx8mm | https://gitlab.com/buildroot.org/buildroot/-/jobs/9122556461  |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/9122556462  |      
              kontron_smarc_sal28 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9122556468  |      
               linksprite_pcduino | https://gitlab.com/buildroot.org/buildroot/-/jobs/9122556477  |      
                  mangopi_mq1rdw2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9122556484  |      
          microchip_sam9x60ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/9122556489  |      
                            nezha | https://gitlab.com/buildroot.org/buildroot/-/jobs/9122556521  |      
                       nitrogen8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/9122556529  |      
                      nitrogen8mm | https://gitlab.com/buildroot.org/buildroot/-/jobs/9122556531  |      
                      nitrogen8mn | https://gitlab.com/buildroot.org/buildroot/-/jobs/9122556532  |      
                      nitrogen8mp | https://gitlab.com/buildroot.org/buildroot/-/jobs/9122556534  |      
              octavo_osd32mp1_brk | https://gitlab.com/buildroot.org/buildroot/-/jobs/9122556537  |      
              octavo_osd32mp1_red | https://gitlab.com/buildroot.org/buildroot/-/jobs/9122556538  |      
                        odroidxu4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9122556540  |      
        olimex_a10_olinuxino_lime | https://gitlab.com/buildroot.org/buildroot/-/jobs/9122556541  |      
             olimex_a13_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/9122556542  |      
        olimex_a20_olinuxino_lime | https://gitlab.com/buildroot.org/buildroot/-/jobs/9122556545  |      
       olimex_a20_olinuxino_lime2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9122556544  |      
       olimex_a20_olinuxino_micro | https://gitlab.com/buildroot.org/buildroot/-/jobs/9122556546  |      
             olimex_a33_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/9122556548  |      
                  orangepi_5_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/9122556560  |      
                    orangepi_lite | https://gitlab.com/buildroot.org/buildroot/-/jobs/9122556562  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9122556561  |      
                     orangepi_one | https://gitlab.com/buildroot.org/buildroot/-/jobs/9122556563  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/9122556565  |      
                      orangepi_pc | https://gitlab.com/buildroot.org/buildroot/-/jobs/9122556568  |      
                 orangepi_pc_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/9122556569  |      
                      orangepi_r1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9122556572  |      
                    orangepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/9122556581  |      
                   pcengines_apu2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9122556594  |      
                  pine64_pinecube | https://gitlab.com/buildroot.org/buildroot/-/jobs/9122556598  |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/9122556600  |      
                 qemu_xtensa_lx60 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9122556662  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/9122556676  |      
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/9122556692  |      
                    roc_pc_rk3399 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9122556693  |      
                          rock4se | https://gitlab.com/buildroot.org/buildroot/-/jobs/9122556694  |      
                           rock5b | https://gitlab.com/buildroot.org/buildroot/-/jobs/9122556697  |      
                           rock64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9122556699  |      
                       rock_pi_n8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9122556701  |      
                        rockpro64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9122556704  |      
                      roseapplepi | https://gitlab.com/buildroot.org/buildroot/-/jobs/9122556705  |      
                 sipeed_lichee_rv | https://gitlab.com/buildroot.org/buildroot/-/jobs/9122556711  |      
            sipeed_lichee_rv_dock | https://gitlab.com/buildroot.org/buildroot/-/jobs/9122556713  |      
             sipeed_licheepi_nano | https://gitlab.com/buildroot.org/buildroot/-/jobs/9122556715  |      
             sipeed_licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/9122556717  |      
                  sipeed_maix_bit | https://gitlab.com/buildroot.org/buildroot/-/jobs/9122556718  |      
           sipeed_maix_bit_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/9122556721  |      
                 sipeed_maix_dock | https://gitlab.com/buildroot.org/buildroot/-/jobs/9122556722  |      
          sipeed_maix_dock_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/9122556724  |      
                   sipeed_maix_go | https://gitlab.com/buildroot.org/buildroot/-/jobs/9122556726  |      
            sipeed_maix_go_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/9122556729  |      
                 sipeed_maixduino | https://gitlab.com/buildroot.org/buildroot/-/jobs/9122556730  |      
          sipeed_maixduino_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/9122556732  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9122556743  |      
                  stm32mp157a_dk1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9122556763  |      
                  stm32mp157c_dk2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9122556765  |      
                     ti_am62ax_sk | https://gitlab.com/buildroot.org/buildroot/-/jobs/9122556770  |      
                     ti_am62px_sk | https://gitlab.com/buildroot.org/buildroot/-/jobs/9122556772  |      
                      ti_am62x_sk | https://gitlab.com/buildroot.org/buildroot/-/jobs/9122556774  |      
                      ti_am64x_sk | https://gitlab.com/buildroot.org/buildroot/-/jobs/9122556775  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9122556776  |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9122556778  | ORPH 
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9122556781  |      
                      visionfive2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9122556787  |      
                zynqmp_kria_kd240 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9122556801  |      
                zynqmp_kria_kr260 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9135503006  |      
                zynqmp_kria_kv260 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9135503216  |      
                    zynqmp_zcu102 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9135503373  |      
                    zynqmp_zcu104 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9135503632  |      
                    zynqmp_zcu106 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9135503945  |      



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
