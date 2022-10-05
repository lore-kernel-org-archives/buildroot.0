Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 863DCC433F5
	for <buildroot@archiver.kernel.org>; Wed,  5 Oct 2022 06:33:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C316E415A3;
	Wed,  5 Oct 2022 06:33:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C316E415A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KqHn-MzSTV6c; Wed,  5 Oct 2022 06:33:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4CEA441716;
	Wed,  5 Oct 2022 06:33:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4CEA441716
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AA76A1BF95E
 for <buildroot@lists.busybox.net>; Wed,  5 Oct 2022 06:33:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 91B6D60C19
 for <buildroot@lists.busybox.net>; Wed,  5 Oct 2022 06:33:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 91B6D60C19
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SLq7pPCw16DZ for <buildroot@lists.busybox.net>;
 Wed,  5 Oct 2022 06:32:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2940660BF6
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2940660BF6
 for <buildroot@buildroot.org>; Wed,  5 Oct 2022 06:32:57 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2A981240009
 for <buildroot@buildroot.org>; Wed,  5 Oct 2022 06:32:55 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Wed, 05 Oct 2022 06:32:55 -0000
Message-Id: <20221005063301.91B6D60C19@smtp3.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1664951575; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=hEsWXYPaqAM6LlKDdwGnk3A+V+o1DaowLoLYwDViVEg=;
 b=JsBLnJUzPcSCZhwNswsuqlQ3357mWypA5o8xhJHFg/G4aIZHStLkBEo/S3M9ZBgFp4nR+W
 H93Rjqf2xff+DJy0gVxOmDrlSIPxzstun9frFWpnBnLjR7LKzotfAq5NIwBqksmLd3b10d
 uJzwnYtHzWEFy4MrZHlG6NqCZJ8UM3MdL6KVbNYMG3KCmfeckAiGGrvoBMEFmsnhtkLFfJ
 ENz4/3cdztxvHzC+G04JgdTnF28LJvnMTCwXtrLsHxJAl2FWLxrLWxO7gEGDN6/TYSdT1/
 q1YQq7kWjUwIRBwUvKcM/ZJedSuISOeNKjMlQ9RK+tT0tTpP75OxprGovrJYDw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JsBLnJUz
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-10-04
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

Autobuild statistics for 2022-10-04
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  2  |  1  |  0  |  3  |
  2022.05.x  | 13  | 13  |  0  | 26  |
  2022.08.x  | 15  | 12  |  0  | 27  |
    master   | 189 | 405 |  0  | 594 |

Classification of failures by reason for master
-----------------------------------------------

glibc-2.36-44-g2628500f5dff... | 30
        host-f2fs-tools-1.15.0 | 14
                 systemd-250.4 | 14
            btrfs-progs-5.16.2 | 13
                      crun-1.5 | 13
host-pahole-73383b3a39afe86... | 13
                 sysvinit-2.99 | 13
                  autofs-5.1.8 | 12
        host-sentry-cli-1.59.0 | 12
                host-go-1.19.1 | 11
              libarchive-3.6.1 | 11
            igd2-for-linux-2.1 | 9 
            host-binutils-2.38 | 8 
                 linux-5.17.15 | 8 
                  ntp-4.2.8p15 | 7 
casync-4ad9bcb94bc83ff36cfc... | 6 
                 dash-0.5.11.5 | 6 
                elfutils-0.186 | 6 
  gobject-introspection-1.72.0 | 6 
                       unknown | 6 
dahdi-linux-5c840cf43838e06... | 5 
                gerbera-1.10.0 | 5 
                   hdparm-9.63 | 5 
         host-gcc-final-11.3.0 | 5 
             libgpg-error-1.45 | 5 
package/acpica/acpica.mk:40... | 5 
                   perl-5.34.1 | 5 
              host-rust-1.64.0 | 4 
               libglib2-2.72.3 | 4 
                   libnss-3.83 | 4 
             acpica-legal-info | 3 
             fontconfig-2.13.1 | 3 
                     gmp-6.2.1 | 3 
       host-gcc-initial-11.3.0 | 3 
              libostree-2022.5 | 3 
                xenomai-3.0.10 | 3 
                    zstd-1.5.2 | 3 
                  boost-1.80.0 | 2 
             c-periphery-2.3.1 | 2 
                  cmocka-1.1.5 | 2 
                  gensio-2.5.5 | 2 
            host-binutils-2.37 | 2 
            host-binutils-2.39 | 2 
       host-gcc-initial-10.4.0 | 2 
       host-gcc-initial-12.2.0 | 2 
              libgcrypt-1.10.1 | 2 
                   libqb-2.0.6 | 2 
           linux-5.10.115-cip7 | 2 
            makedumpfile-1.7.0 | 2 
              open62541-v1.3.3 | 2 
                 openssh-9.0p1 | 2 
package/acpica/acpica.mk:41... | 2 
            quickjs-2021-03-27 | 2 
/home/buildroot/autobuild/i... | 1 
/home/buildroot/autobuild/i... | 1 
/home/buildroot/autobuild/i... | 1 
                    4th-3.64.1 | 1 
               acpica-20220331 | 1 
                  acpid-2.0.33 | 1 
                apparmor-3.0.4 | 1 
                  assimp-5.2.1 | 1 
              asterisk-16.25.2 | 1 
                  bind-9.16.31 | 1 
  binutils-arc-2020.09-release | 1 
                  brotli-1.0.9 | 1 
                   bullet-3.21 | 1 
                   bzip2-1.0.8 | 1 
                  cairo-1.16.0 | 1 
                 coremark-1.01 | 1 
           crucible-2022.05.25 | 1 
                dbus-broker-32 | 1 
                 dmalloc-5.6.5 | 1 
               dvdauthor-0.7.2 | 1 
        edk2-edk2-stable202102 | 1 
             f2fs-tools-1.15.0 | 1 
                     frr-8.3.1 | 1 
fs/cpio/cpio.mk:117: /home/... | 1 
fs/cpio/cpio.mk:117: /nvmed... | 1 
fs/cpio/cpio.mk:117: /tmp/i... | 1 
fs/ubi/ubi.mk:51: /nvmedata... | 1 
fs/ubi/ubi.mk:51: /nvmedata... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
                       gerbera | 1 
          gitlab-runner-14.5.1 | 1 
                 glibmm-2.68.2 | 1 
                      grep-3.7 | 1 
        host-acpica-legal-info | 1 
              host-delve-1.8.0 | 1 
         host-gcc-final-10.4.0 | 1 
                 host-icu-70-1 | 1 
        host-libopenssl-1.1.1q | 1 
              host-ncurses-6.1 | 1 
host-spirv-llvm-translator-... | 1 
          host-util-linux-2.38 | 1 
                  hostapd-2.10 | 1 
                   json-c-0.16 | 1 
               libcap-ng-0.8.3 | 1 
                libglvnd-1.4.0 | 1 
                libressl-3.5.3 | 1 
                libselinux-3.3 | 1 
           libwebsockets-4.3.2 | 1 
       linux-5.10.109-cip5-rt4 | 1 
        lttng-babeltrace-1.5.7 | 1 
                    lxc-4.0.12 | 1 
                     lz4-1.9.3 | 1 
               mariadb-10.3.36 | 1 
                  mender-3.3.0 | 1 
                 mesa3d-22.1.6 | 1 
mmc-utils-d40ec535b9d4e4c97... | 1 
                    musl-1.2.3 | 1 
                   netsnmp-5.9 | 1 
               openblas-0.3.21 | 1 
                     php-8.1.9 | 1 
piglit-2affee53f3ad7a96f5b3... | 1 
                      pigz-2.7 | 1 
                     pv-1.6.20 | 1 
         python-greenlet-1.1.2 | 1 
            python-ujson-5.2.0 | 1 
                    qemu-7.1.0 | 1 
                  reaver-1.6.6 | 1 
              skalibs-2.10.0.3 | 1 
              strongswan-5.9.5 | 1 
                 sudo-1.9.11p2 | 1 
                tealdeer-1.5.0 | 1 
toolchain-external-codescap... | 1 
                  tor-0.4.7.10 | 1 
             uccp420wlan-6.9.1 | 1 
                 uclibc-1.0.42 | 1 
ulog-0389d243352255f6182326... | 1 
uqmi-0a19b5b77140465c29e2af... | 1 
                usbguard-1.1.1 | 1 
               valgrind-3.19.0 | 1 
                    volk-2.5.2 | 1 
                 wolfssl-5.5.1 | 1 
                 wolftpm-2.4.0 | 1 
                wtfutil-0.41.0 | 1 
                  xxhash-0.8.1 | 1 
                    zeek-4.1.1 | 1 
                 zlib-ng-2.0.6 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/3234ec34b03a13a0d60658aeee5c26890d1aeb19 |     
powerpc64le  | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/372bf8fa26adaac109f7bb4b40ccefc5250a39e5 |     
   mips64    | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/25a658c03ef34287e48cea04f27900eee5b412c4 |     
   mips64    |           4th-3.64.1           | NOK | http://autobuild.buildroot.net/results/9d433e02de5e6e743df465a73ffd89fde3c0ec9f |     
   mips64    |        acpica-20220331         | NOK | http://autobuild.buildroot.net/results/66a2dc3b7efe2a50400aee7c46e075bec322e85e |     
    arc      |       acpica-legal-info        | NOK | http://autobuild.buildroot.net/results/382db464f135214a1b40c4ddfacb580a5a36479c |     
   mips64    |       acpica-legal-info        | NOK | http://autobuild.buildroot.net/results/f370b244eda345af413b77242763d5720601eae2 |     
   sparc     |       acpica-legal-info        | NOK | http://autobuild.buildroot.net/results/21979c4cce488871174401d4f22f92830d4b00c4 |     
  mips64el   |          acpid-2.0.33          | NOK | http://autobuild.buildroot.net/results/ec9514edca290b210c3ee2dfdd993fe79d014743 | ORPH
    arc      |         apparmor-3.0.4         | NOK | http://autobuild.buildroot.net/results/9613400ad43babe35833b8c68aa7e4bedb35ac9e |     
    mips     |          assimp-5.2.1          | NOK | http://autobuild.buildroot.net/results/d9ddd74fcdaaab217cb403c6f80397afd83744ac | ORPH
 microblaze  |        asterisk-16.25.2        | NOK | http://autobuild.buildroot.net/results/74f9311a8e07b4c5adf98a97d59ad6b44334beb7 |     
   mipsel    |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/4b7eb2ef4e94b501898cab895a0d9513e6c56a42 |     
    arm      |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/f25f490607fe9925136696dc3ad974ef4573d717 |     
  sparc64    |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/88805786be2432065aeabd6e7d74c120c896e577 |     
   nios2     |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/792da1d9b0da1e22eeafc14f0509c6e24372671f |     
    arm      |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/3497b22bbc7626b49e92c747a5c75e7e77cc896b |     
   mips64    |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/82e8f460992518662c50efe72de255fdd2d9969c |     
   mipsel    |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/e465a9f1cd8e6d3aeec6ad82765100bee42d80c3 |     
   x86_64    |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/dd423160e732971f789d5444eb259e38076d4534 |     
   sh4aeb    |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/251ece17a60391d5715147bb127838b6e41eda63 |     
   mips64    |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/bb6e2714d5739df0b21c51154594da8e91dd3bc8 |     
  mips64el   |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/9048da3dbc2094887bb60e7d84a90c5303d0a67e |     
   sh4aeb    |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/2b183f5b09e9d712cfe22457569e7723da9b9f29 |     
    sh4      |          bind-9.16.31          | NOK | http://autobuild.buildroot.net/results/7983182b95da19d9fc084d3abd17cbdf53fc76c7 | ORPH
   arceb     |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/e66521a57f94b41c677232ed3ee4d5406f60328e |     
   arceb     |          boost-1.80.0          | NOK | http://autobuild.buildroot.net/results/0b74b34b41742ff953f68eb5f962044b97bc2b8e |     
   arceb     |          boost-1.80.0          | NOK | http://autobuild.buildroot.net/results/eda560ddc06594237ad7b923d919f01d4e011915 |     
  riscv64    |          brotli-1.0.9          | NOK | http://autobuild.buildroot.net/results/2793666b27ef60a815b324c0b32a1563577999b9 |     
  sparc64    |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/a1c643be3a4c22e42db489fae4b984f82cd177ee | ORPH
   mipsel    |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/17b469abd7e739134109f7840ead2307ef875b70 | ORPH
   s390x     |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/d3872dc25727e7cd6ef55498127308bb417b5c64 | ORPH
    mips     |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/94b35d621724b8a3212ba0b0dd2510195fd1798e | ORPH
  mips64el   |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/612b33da623c0bf0a1556ff9d384a42ec81f400d | ORPH
   s390x     |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/2f9752f24951256eebcbb30adfb8ed4a8424230d | ORPH
    arm      |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/3f7c8b7a62abbea00b4af0b014e17cffff406c5b | ORPH
   s390x     |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/8443b6e398b3131b8912ee3fceddd80680f8a744 | ORPH
   sh4eb     |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/cb13f0220103cb439c766420079298360d3e8bf6 | ORPH
    mips     |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/d221788ae53165522aa8704aff94067ede9617c7 | ORPH
  sparc64    |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/63022d67fdd445d0f226fdc8bbb4bb43d901cbf8 | ORPH
 microblaze  |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/ed043cac4a85eb6e588ee3a7d0845f1d4c310de0 | ORPH
 aarch64_be  |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/20da9f34418a93aa6255c3c890009b44e88701a7 | ORPH
   sh4aeb    |          bullet-3.21           | NOK | http://autobuild.buildroot.net/results/bc1f5628dd31d293e87b3d44adffcfabd0f0f7cd |     
    arc      |          bzip2-1.0.8           | NOK | http://autobuild.buildroot.net/results/30695dffe4a6fed0b14f3a9285c6b1af9dbe270b | ORPH
  riscv64    |       c-periphery-2.3.1        | NOK | http://autobuild.buildroot.net/results/e99506ba7b58911c4121d8d4cf37102965a3eec9 |     
  riscv64    |       c-periphery-2.3.1        | NOK | http://autobuild.buildroot.net/results/b959b1aaa48392d6d2aed895f372a9ff9a131c3a |     
   xtensa    |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/8dd0ac448e94f6b65b66d60774f30d312bced055 |     
microblazeel | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/cb7a6eb43e03df2fcb4aa248a203e0f743191cc7 |     
    arm      | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/4b8ef0230f96b3aec3169cdee88305ff4ad62a80 |     
   s390x     | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/b3ae268fd98144af2c1b83d288ba1b5253b4ca27 |     
 aarch64_be  | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/7768d083d8b7d2b72a124d20006b783f81c2e5ee |     
    or1k     | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/b585b5cba914817b14d442874bc76867d26a863b |     
   mipsel    | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/1095c85375437404779ad2096337538aa1368ae8 |     
    arm      |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/ee29fa2fa04ea6a794bbfeebb3e630c2c0afb241 |     
   armeb     |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/8a8cf5c0ff85385d727dbc2caaea8bcf18f0a34d |     
microblazeel |         coremark-1.01          | NOK | http://autobuild.buildroot.net/results/0c84cf6288db0f426c898dadd4efc7412ac4550a |     
powerpc64le  |      crucible-2022.05.25       | NOK | http://autobuild.buildroot.net/results/cfe53e96d55d60b4f9dac2835233d1b9c7936886 |     
    mips     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/e7f73921c649ffbd2c3dbd728098e10b4d6006b8 |     
 microblaze  |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/daeb1e4eafbbe06404e26069c7d75d12ff97f9ef |     
   armeb     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/bb201c137769d914b86f15b6d3f85efdcc19ff9e |     
powerpc64le  |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/5a958d2caa964830de7c00ba822bdcd7e9c52386 |     
    arc      |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/59d567aafbb7d19f2b2d69c0baa4b06d9a7037e2 |     
    arm      |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/180809e68850c3483f094e5cd97793696126d45e |     
    or1k     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/910814680e55010788fbe90e89e491f6d01bfea6 |     
   mips64    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/ad6ce6e38137bded01ff591e8b9cf9d30d12d114 |     
   sparc     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/953258e89b89eb4a4fa9caa41de9becb106affe5 |     
   sparc     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/19f05fdd85e20b70f67b3d822cd3826e58b88893 |     
    mips     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/a3ea312fef838926a2a910625cf6053717b1e5de |     
  sparc64    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/4dec548ed6769956c9c78fa29b6077150cb76f52 |     
    or1k     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/35ffa1dfc3d639f196533bb4bcb6bf47964107fa |     
    i686     | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/89d0627d2ade575b8369053966fa28154a25358b |     
   sparc     | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/f4ca90a2a62c6ed45bcd1a00a93147fd95b98d47 |     
  aarch64    | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/eefee4e592b4ddca6d250fa12c7dc19df39db8c3 |     
  riscv64    | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/6e66a3306ddeaf65899c4505ba34eb3b1c0dec76 |     
    sh4      | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/ef421485b80d3d8ab1ff01a3561210642bee750a |     
  sparc64    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/4ef1b078ae932cb17064df09fd117e04a00f6779 | ORPH
   mipsel    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/f6fad4841522e189539d54a1cb5c896d1b47a2a8 | ORPH
  aarch64    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/f2f2cf0a0809d03323fcea3a4030641c1338511e | ORPH
  powerpc    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/4be4b426ae04da3abb59e66e156e2c463d7824bc | ORPH
    sh4a     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/f6f4dcd82af96c2dd421ae28546592f1dee5087c | ORPH
   x86_64    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/babf3d9ea49e223669cbf7b8d90c9a0a3a168395 | ORPH
 powerpc64   |         dbus-broker-32         | NOK | http://autobuild.buildroot.net/results/c4869d72ea89af570936c843234d8743fd00e508 |     
  powerpc    |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/9475ac2db3bcb1bbfaa99ad6a967dd54104ca6a0 | ORPH
    or1k     |        dvdauthor-0.7.2         | NOK | http://autobuild.buildroot.net/results/892c632215d181c96f398f2f1bfb843963d422a6 |     
    i586     |     edk2-edk2-stable202102     | NOK | http://autobuild.buildroot.net/results/2dc9db4b4bb1547a671662d1738b4ff3702b7691 |     
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/93bce5b63d23d17167b76cf3d723e7bf692cfa18 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/3878da93da493cc8004fbf86d72e56cdf5137ae2 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/fbc0e515245c82586f230c5006f2e811b32dcb3b | ORPH
    arc      |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/49fe465ebc75b6fd5367954c21ed2d81af91f12c | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/d60afb35874fc9fe8cf0717759345ed8593d75c0 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/04c364deb347134e1100e450a9c1e7b678419d50 | ORPH
    or1k     |       f2fs-tools-1.15.0        | NOK | http://autobuild.buildroot.net/results/6dc6b77d773d7a64445818ff3c73b4118031de62 |     
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/6365aadb64bd28e0679c9a2dbe097f04ec2bdf3e | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/43ab819b95603715e912658fcdb1195b1861ca04 | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/96dbe0d955a6632cf38a2e329211d8d5c5c0f249 | ORPH
   x86_64    |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/aad6ff1e4aa20edcb8bcddb9b35bbe88d031fc1b |     
   s390x     | fs/cpio/cpio.mk:117: /home/... | NOK | http://autobuild.buildroot.net/results/54b203e8299f926914bd9bcfed1394f1b3e40c7b |     
   xtensa    | fs/cpio/cpio.mk:117: /nvmed... | NOK | http://autobuild.buildroot.net/results/a395a5966d0aaf16df20e7526bc902b03e4d2505 |     
   arceb     | fs/cpio/cpio.mk:117: /tmp/i... | NOK | http://autobuild.buildroot.net/results/78ab3ce6abd483683449c73bb3f02eca1c7f915d |     
   arceb     | fs/ubi/ubi.mk:51: /nvmedata... | NOK | http://autobuild.buildroot.net/results/0cb5699fdfb93da8c1bc8f81f79d8b9c3229c5f1 |     
   sh4eb     | fs/ubi/ubi.mk:51: /nvmedata... | NOK | http://autobuild.buildroot.net/results/3ad6b3a088cb3326e8db80f21ebab43f9caf5297 |     
microblazeel | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/b69b42a9f458349fb774565083e9aafd74f26ead |     
    or1k     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/42a389af327b720a1e99132dbde97d101c313b9b |     
    arc      |          gensio-2.5.5          | NOK | http://autobuild.buildroot.net/results/340568b2735d84d5e46d4b408288b65bd508c5c7 |     
 microblaze  |          gensio-2.5.5          | NOK | http://autobuild.buildroot.net/results/59e944db16cc36e92acffd7f4895bb4bdf39d6dc |     
  sparc64    |            gerbera             | NOK | http://autobuild.buildroot.net/results/c395faba324c09cedb1a7cf9582bec554e2fecdf |     
  riscv32    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/2eeda470fe37390fe29c5f2b201e64b2d443fcbd |     
   mipsel    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/ce49244f79859f27780f3b9a398de174a7f27b48 |     
   mipsel    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/ffd52e3d91c4ef60b2dae21296552bc3a6b1b810 |     
    sh4      |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/0313f653813292a6a76d9e90acd3782c881a8a99 |     
powerpc64le  |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/931cc3213201683dbe52101b14bbfe5c54b661b6 |     
   x86_64    |      gitlab-runner-14.5.1      | NOK | http://autobuild.buildroot.net/results/3d09fa2ef1cbcae007113069d091db99a857b6db |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/b72df5f29db6070dbb5976d12dd129a523fb5cf1 |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/136587524fb016e75c971528ec9c483f5327b4aa |     
microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/9382cdbb0ec216f785111e39b4e218e7063ac513 |     
    or1k     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/221f42a5e73a1750da89eee85330027cacf289cf |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/0d6faf8eccc26dc4a15da801dfcbe95eeb6dd85c |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/965927e9027d55667e3bfd6927d406e1cbd3a6e5 |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/a277d21dbadc8499d41dfe5c8c5de2f544542896 |     
  riscv32    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/6febd24e16f1b321ab2429482fc694f5e8effc49 |     
    or1k     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/fc6378dc8dd527093d13295763892f72566977b1 |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/e88d40282b4f0aba773358dd34d3096d9f5f06e8 |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/80cb5a6f3001d45c6c3a1472eb55bdd635a5a584 |     
microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/0190b108eccf3f3526e168f610719584b6c1ddfd |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/c055674ab562efaec0e3c1f968ecb2bcc6b7ac32 |     
    mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/65b263f6857e0f9f1069d18606aeb621838cf1e2 |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/f692524c69243f65cc35d419e26f19fc2599d6b2 |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/476789d19d6e160cf4a4605d56b66c838d9e42f4 |     
    or1k     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/d4f6523394fdbdbaaf343ddfa7240a0e39c23997 |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/cd4349cefc492f2979a10dc0654c9d0b8b0cf100 |     
   mipsel    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/08348dd641e508c23a8c0a4a39aa0ba6bf1acae4 |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/6362e645d2ccf489966ec1d537c3dcd07b2e9495 |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/0cd34afc2425c097086c2876979ab898fee6da6d |     
 microblaze  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/8cbdc9bc63f45af8c43c14280433af86f2cfcd87 |     
microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/da5280ae9ec373b4e27208bea6a88a05491687e8 |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/c21a1548748139916ac6bab799a579551821b4fe |     
  riscv32    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/43380c5626450e5495ab11b6e06083a468cd1e4d |     
   mipsel    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/7c146be8d6e0c2c1014c931380378b8f90035875 |     
   mipsel    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/f210ec5415d7c96e94421c489fa31f9bef8ce9f9 |     
   arceb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/0e16cc70f743734d7458d6499d1da0a8e88c3411 |     
    mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/e84da64777c547262c0c4a7540029af33bf1abe3 |     
microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/f2dacb1dae509d89e13ccc7e27a662b81a055a1a |     
    or1k     |         glibmm-2.68.2          | NOK | http://autobuild.buildroot.net/results/349efa10be0bb7a5c05f9192bb3bdb308b6c75cf |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/3654fb8fb3bb1a259a6766393399d5211a4c9afd | ORPH
   mipsel    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/43db0135811e12a14595d4b16912380e7f7c8589 | ORPH
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/9f4012ca2985e76af6eaf75635e94dceaac6d872 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/cf966eebe19108e13b028a9d72601aa2de285b77 | ORPH
    i686     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/5cf86ba933736a9a9db7030ad8f3742cc1c62511 | ORPH
   nios2     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/085ae279c7e02fd3a34f876279e82bdaaf06f941 | ORPH
microblazeel |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/660be85844877f15356fabaf4c8cfc5b6c3bc05c | ORPH
  powerpc    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/07fe16a1794840ca1fdaf6737086668e2144b6b8 | ORPH
powerpc64le  |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/a8c0a1f50b523d3c671aadf3db7ae76191ab7b50 | ORPH
   arceb     |            grep-3.7            | NOK | http://autobuild.buildroot.net/results/830d836ba642590baa4497bb044e02fd020b280e |     
 aarch64_be  |          hdparm-9.63           | NOK | http://autobuild.buildroot.net/results/9092ebc5aab1f1d883408659779ce76cbbc7bcf8 |     
    mips     |          hdparm-9.63           | NOK | http://autobuild.buildroot.net/results/d4c44bc99b14a12a700c2d41ffce6213e287175f |     
  mips64el   |          hdparm-9.63           | NOK | http://autobuild.buildroot.net/results/dfc9123515c5187c13b12eafbca3496ed54a6bde |     
   sh4eb     |          hdparm-9.63           | NOK | http://autobuild.buildroot.net/results/f964b0f84d7e24815c7bd9dc55dd10a962ed8f37 |     
  mips64el   |          hdparm-9.63           | NOK | http://autobuild.buildroot.net/results/dfd5f0bfc333907f618898b971fbbd57cc61882c |     
    arm      |     host-acpica-legal-info     | NOK | http://autobuild.buildroot.net/results/dd7edc29ca41823f3c848819af3a5eec0c05936d |     
powerpc64le  |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/4097439e1bff5cd7475de26cd3ae8db92940e769 |     
   mipsel    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/434182b6cbc4b90835aea3135a265123a128373d |     
   mipsel    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/0aaae99ac5485097d68ab378ed95a50a0446226e |     
   mips64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/0d136f187f15fa43594a9521b82a7e7456dbffa3 |     
  riscv32    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/aaf7cb468625aee1ced7daaa220118f83779925c |     
 aarch64_be  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/366ad991ebb305c291729e9943fe51370dbf6873 |     
    mips     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/1415695babacb7653501d9b546d5508e3e074e51 |     
 aarch64_be  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/e45e8bc1ee811d37743e5f449be1aaeb1f1fa348 |     
  mips64el   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/205b2b9f4b8dbdb58e97531391170c0f3c8cbff0 |     
  sparc64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/49025d098c5c1c8b0af7c4713105662f38f4a95a |     
   sparc     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/cbc95edd125d15c3a68d8ab6d2d268d1baa79c8c |     
   sh4aeb    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/bb3c66b513174dc2779573217f58fbff48b07e4f |     
    arm      |        host-delve-1.8.0        | NOK | http://autobuild.buildroot.net/results/064a43460e74ec87dc223d2d0c3f4fc13417ae4e |     
   armeb     |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/868cfc085c39c186f4d7a8f2a1d9c94efd8c63ab |     
powerpc64le  |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/6cddb3e88dc508c96076cb71970fe37d21408ddc |     
   arceb     |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/5566dd6aacbfeca0a49f4a3c722d7fa0110e077d |     
  mips64el   |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/52a5d3f29509b095c38afd0e87ce0d6581b02b36 |     
   arceb     |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/7bb56e097b678bea8b2cfa71bb55c6311d57911b |     
    mips     |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/472a7a3ddf503cf75941c92cebb24739c7c9b045 |     
powerpc64le  |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/2760d919354d23928c1a4d2d3e27b26ead9b614c |     
 powerpc64   |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/52fab2415189f5a4c129aba24564f967b40cae00 |     
    arc      |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/3d16d0eb928e684e793d1adc072c1581737feec5 |     
  mips64el   |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/c70280509ef0ee72f607333beba6489a868616c0 |     
   arceb     |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/8f32ebfaa420ef319895ac08b77d704ba9123e15 |     
    or1k     |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/15b03ae5bd475ff10ae5f46b46a18113c64e4506 |     
  riscv32    |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/d73a706c3e56a451e19557618872f6f44c6e6bc9 |     
    i686     |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/700b0adfad7c21b169b6e2b49c2247d76c4b147a |     
    mips     |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/3a52b43d223c1770ece969afedb8caa605941c21 |     
   s390x     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/4100f3e8993367c2504b9dbfb005dfb9a5b6aa38 |     
    arm      |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/66c49cd9ac85870d633cb8244f06e281293dac2b |     
 aarch64_be  |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/144d65ec05f5cbf1f6462d3c809a7e7bfdec3317 |     
 microblaze  |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/e56f3128e46508aa3ad704d9ec238039470a812b |     
   s390x     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/6b2ef038e3701beca68b943e728b52b6124130c9 |     
    arc      |    host-gcc-initial-10.4.0     | NOK | http://autobuild.buildroot.net/results/429a1fe40f569674e5287ed95d9165e47f665679 |     
  mips64el   |    host-gcc-initial-10.4.0     | NOK | http://autobuild.buildroot.net/results/c76b9a3bf24b3d61ee867bb44b0f5442db5357de |     
  powerpc    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/e2a1c1ec7015529a8af11db7060805e658b6fd86 |     
powerpc64le  |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/d36d9bd8f31f9d4a88e4e6726c391fe07ebb2788 |     
  aarch64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/e3c511198663b57c2e64d48f3710b5f78fd51a07 |     
    m68k     |    host-gcc-initial-12.2.0     | NOK | http://autobuild.buildroot.net/results/d40d095a928b35315f90e80d8806adc7f9a18083 |     
   arceb     |    host-gcc-initial-12.2.0     | NOK | http://autobuild.buildroot.net/results/5acd3cf6461bc189765fd9f6dc052e5473a2ab60 |     
   mips64    |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/342e02de58041545a73c8e796f7537efd42dfee6 |     
  aarch64    |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/92dba9ae1d9eb46a1d44362af48c7941e5c9a6be |     
   mips64    |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/0fc78b06d31a3f48a1b008a6dfacab226aadfabe |     
    i686     |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/1c75542f55b7414b048baf41ea9215c01621f8c6 |     
  mips64el   |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/846f2bfc6f698542a75d0df5fd01d06dcedf1974 |     
powerpc64le  |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/54495053e1878543aaae044a76d1f74f598e86b1 |     
powerpc64le  |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/b91452198aa5182b3b287a59a9b583aceaec9427 |     
    i686     |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/1f50990b03a6771b116656430a2ba5731b11aa0a |     
    i686     |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/ee47313c0bce142819ce2df8d2d0c9d5be3e0c1a |     
    i686     |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/055a6d2b5c311b37bad3693f21bbebe8a211e4b3 |     
    i686     |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/ac729d8fd45cdea5a96517a991023a2152b7d4b4 |     
    i686     |         host-icu-70-1          | NOK | http://autobuild.buildroot.net/results/c735fff923aaea20a25854c9b16ddfa96b0977db | ORPH
   mips64    |     host-libopenssl-1.1.1q     | NOK | http://autobuild.buildroot.net/results/93ab0aa392e2cee92a0b4a173245a8b2af966f25 |     
  sparc64    |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/5fa91e4f4513c8a1ce5c876b601c9d730578c3a6 | ORPH
 aarch64_be  | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/38a23af70ee788161bf39eafb109201b9c9c047f |     
   arceb     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/233cd3b066d8c3233f93a3a767996aaea902dd2a |     
   x86_64    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/54799ac127d3bf338c67cc2d641e09c31de1a12f |     
  sparc64    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/0033093b830291c7bd8125013092626b672713af |     
    arc      | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/2a751e9c4246b880d2eb3b3931afde2634df0748 |     
    mips     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/861bc5cdfd7821c224cbcb3fa95820a7689443bd |     
 microblaze  | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/a3fdccbb08d0ba768f4cc3c5ada34bf128e4f055 |     
 powerpc64   | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/db08669d982a8088157ab09e20bb4bc0e9c68830 |     
  sparc64    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/f2f219ead3e3e4243d6eb18be746ab158d16da25 |     
microblazeel | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/0ef8f5902237e37766f4e7af7e3b5de4c7a62f4b |     
microblazeel | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/255abb34e156afba5d0843b6fdc564be39904c7c |     
    arc      | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/d4c66ee5e8eddcc260e57500747c55d734ad07f1 |     
    i686     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/fcdfad9c28b75e6faeb0386f02ec72e5798f1d53 |     
   s390x     |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/f2e9c00dd181a690399cd9acd49e0b446ef7ea7c |     
   x86_64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/f98fa14df0d0da291eed35408e495b555f49b9fa |     
   x86_64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/3c4a3b3efcecb9e02efad4b113b128349500cd26 |     
   x86_64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/3145c92af6cf812b963afbd955cdd681c6a4c5f3 |     
    mips     |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/ef31912823f933d70830a99ef9faef709bb79b94 |     
 microblaze  |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/95b947f9485307632d85ca9cd7474c900de12e20 |     
 powerpc64   |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/a51fc83546161ce7e25ef19c43b61b3751bb6382 |     
   x86_64    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/6741536b787cda1c57ae3b98e0498ce8653bfa2d |     
   xtensa    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/99aad485f9bfd749e262f89550c5e518f6f37ce3 |     
  mips64el   |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/3da8fc80cb55045c7b237e59ec77fc744d936aa4 |     
 aarch64_be  |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/130b4923d5c25ad7d89778603e9054d63ee453ef |     
    or1k     |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/1aa1c81f01477aa3d1f386225cd49cb9a4241d7f |     
  powerpc    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/637435c9d243235cf5ff971e251b7bbf17f6d403 |     
  riscv64    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/f3f5fadfd1aba3c6324aefc36ef1fd0b491d3324 |     
    sh4a     |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/2ab51f6c76f65c43b924a1b9743a2f4ff7018cf3 |     
  mips64el   |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/27d0b1d0c9bbf1bf8a5ef1b12f774a18c2a39c1b |     
   armeb     | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/c520543a3ae2dc63c2be8d83fe3dc39b8bc4a937 | ORPH
   nios2     |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/a71460115a5c594c86fd982fa0df94ca2f693d59 | ORPH
   x86_64    |          hostapd-2.10          | NOK | http://autobuild.buildroot.net/results/b4d54c5ad00f4e134cd055f7484ab010f60ad644 |     
   x86_64    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/c67a771eaa0ab4d43fc94ce0c7b6982c26e3ed32 |     
    arm      |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/e172a4123e2eb098d43d31f6202a931e43240bb0 |     
   sparc     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/ed3b3eded499623622a2595979c77e4d13713da3 |     
 aarch64_be  |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/67b7b62c7d728c86c90996c89aad8bb296079afb |     
   x86_64    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/395ad73df6b3cfaa37b14e94a17b2cb6b91df7b5 |     
microblazeel |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/2dd86e4f8d27b9db3cbecd79904800c543b34f12 |     
   nios2     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/b44c6c5ba1a3757368ba2a14075d63e6b13c459c |     
    or1k     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/9de3c01db567f107623554b04fbb772780a9eb5f |     
 aarch64_be  |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/b123b74f4f2d48dfda15520f275d021de9b6cf62 |     
    or1k     |          json-c-0.16           | NOK | http://autobuild.buildroot.net/results/2be8ceba973f39496d9e20570f8aa0c7f570087c |     
  sparc64    |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/9211624517cc52fdd4074c7423437d3395546cb7 |     
   armeb     |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/30bfc160e1e0daf91b47f7684227ce29a03d76cf |     
  aarch64    |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/662c3e0006053140899f6537c0e4c8d445e01115 |     
  mips64el   |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/42456bb40789fc8350c42c1279b8b723079dd979 |     
microblazeel |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/8b6a3bbc4b6b2ab4b6e7a0f57646c2d17a355546 |     
   s390x     |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/f5b7e622db94dfbb26be303cc1a623578d902ed5 |     
    mips     |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/2bec21aabc9cf8ee3083366c56c419f785a04991 |     
    or1k     |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/ee946a01d9b278cc99a417dff5f520bce500b312 |     
    or1k     |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/14c376702f01a23a0e11f49659b0d1d223a3fb2b |     
  sparc64    |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/6a904ca47df41ba25644603af596833a277917b8 |     
  sparc64    |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/8a0ca18d34f51fd3030070603f457495a81a6c20 |     
    or1k     |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/6e443fcbdeb052acd0084ddc54a85c60cbbfabbf |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/2ec2b8b99c78f41c3e24aad7c505fe15968e17a4 | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/06104781882a42ba38cf4c9b6835acc9f23eb47d | ORPH
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/b6e23d5edf5ad1aadfb3a53d2dbe980e519e1946 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/367f71a9a1b19871165f95e2c9f4e4bad153dc1b |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/924dd8a469a6082852c512b5c248a6869f8c8ed7 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/15692f63e310faf98e41f66bf35aaedb0fcd0e9e |     
   xtensa    |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/6d2e06a50767db2e72952ad87225f8868bd584d4 | ORPH
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/10c2a899ca0272dc3f2b68e8161ec4e884f2c36d | ORPH
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/42b9c72934a38efc96a44c301a2412fb8c7f1cb1 | ORPH
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/c2ff13b9a76c32c92425d6b82157dcc77fb9edec | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/d035c016c135135edb49e2d519336f932da86059 | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/2eb7cf6bdca0e025ab6f354d0116a429aaad74a1 | ORPH
  aarch64    |          libnss-3.83           | NOK | http://autobuild.buildroot.net/results/87c0713a355802719c3efc2bb1de9dbca2d09869 |     
    or1k     |          libnss-3.83           | NOK | http://autobuild.buildroot.net/results/abf795bf0b3c11e19ee45474718699ed2c7aeb45 |     
  mips64el   |          libnss-3.83           | NOK | http://autobuild.buildroot.net/results/5f5cafea6b305e8b9879d2a28c36ed77bf0e965f |     
microblazeel |          libnss-3.83           | NOK | http://autobuild.buildroot.net/results/322364e27e8eb747fa5aed1a11b331ee06eddd5c |     
  sparc64    |        libostree-2022.5        | NOK | http://autobuild.buildroot.net/results/8394bf2dfdf96ec4b56532c8d1bcefe495d8832e |     
    arm      |        libostree-2022.5        | NOK | http://autobuild.buildroot.net/results/c7800405c2b18d451af1f48f71953f927dd8689a |     
 aarch64_be  |        libostree-2022.5        | NOK | http://autobuild.buildroot.net/results/9aecae9c44bbebadcc9af1f73a9546b2eeba42ec |     
    arm      |          libqb-2.0.6           | NOK | http://autobuild.buildroot.net/results/00a805b81c773e1e911b06e13f0a191ae07d06b7 |     
    sh4      |          libqb-2.0.6           | NOK | http://autobuild.buildroot.net/results/e89054ec77c884b1079f2789d98f7768d4e593ec |     
   armeb     |         libressl-3.5.3         | NOK | http://autobuild.buildroot.net/results/adfffdcf541626ced088956aaeeef34f937af481 | ORPH
    or1k     |         libselinux-3.3         | NOK | http://autobuild.buildroot.net/results/58fdb5dfb2c5e17d386ab0596bbd4ae33fd54c2d |     
 powerpc64   |      libwebsockets-4.3.2       | NOK | http://autobuild.buildroot.net/results/475b4fb44f80e8f08257d9add6bc0a4912652849 |     
   mips64    |    linux-5.10.109-cip5-rt4     | NOK | http://autobuild.buildroot.net/results/f2c1fa0cf8bdec23ac763d44defa275e74cef05a | ORPH
   nios2     |      linux-5.10.115-cip7       | NOK | http://autobuild.buildroot.net/results/38ccf62aa3f90961c29f383d0055c599a685e894 | ORPH
   nios2     |      linux-5.10.115-cip7       | NOK | http://autobuild.buildroot.net/results/21bb06e428c23767555fff1188e296e340f70bba | ORPH
  mips64el   |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/5880a11083e8cdcb1a318b49f496f06b768bde71 | ORPH
    m68k     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/38d774a3bbd1e97627451257f2ce5420099759d2 | ORPH
    sh4a     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/dcdd9f0479d947db67d5e8eb5ff3b27c9ff3b542 | ORPH
  powerpc    |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/e4ad92371d8ab216a3ebfc6db2ec96a3e15bb8a0 | ORPH
    m68k     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/fdff4c8027d1ce6f32379de765d4d9ccafc7e451 | ORPH
    mips     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/25c3cf16168d9e91aa063086e8e31b5c06c19ded | ORPH
   s390x     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/ae04377f61717c3b1d379bb529f1cb4b81d57ac2 | ORPH
 powerpc64   |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/a562b201e3ed679a71400b93458fe1ac5e4e1421 | ORPH
    or1k     |     lttng-babeltrace-1.5.7     | NOK | http://autobuild.buildroot.net/results/5f9c565b7134eba89da4eeec293315810780d2ba |     
  mips64el   |           lxc-4.0.12           | NOK | http://autobuild.buildroot.net/results/3060b4963638be1e9370f9a99383450892c81557 |     
microblazeel |           lz4-1.9.3            | NOK | http://autobuild.buildroot.net/results/ff3a74575478488e41aee93eae11f0667746aa21 | ORPH
  mips64el   |       makedumpfile-1.7.0       | NOK | http://autobuild.buildroot.net/results/6ffb37c92a481dd162e2dc900f819f8de7c0047d |     
  mips64el   |       makedumpfile-1.7.0       | NOK | http://autobuild.buildroot.net/results/7e59a8da6d2808a1815ac732cb03042c6e3d09b8 |     
 microblaze  |        mariadb-10.3.36         | NOK | http://autobuild.buildroot.net/results/c8b2d586ef15b411022af99841128e6c284f944d | ORPH
   x86_64    |          mender-3.3.0          | NOK | http://autobuild.buildroot.net/results/510f290e71dec308266d5a314280d5b7dbd9382a |     
  sparc64    |         mesa3d-22.1.6          | NOK | http://autobuild.buildroot.net/results/cda2b75beb619ac458ab8b0e4f9b33bbc3281e04 |     
  aarch64    | mmc-utils-d40ec535b9d4e4c97... | NOK | http://autobuild.buildroot.net/results/a95c30927f9f480a902f437438888c654809a509 |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/322572dcaded81ecc8e7bd3b198c723259fbdd35 |     
   sparc     |          netsnmp-5.9           | NOK | http://autobuild.buildroot.net/results/121ecb139d3ee01597a65f2deab41e8ef2507b01 | ORPH
    sh4a     |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/f72d06e3fc5a027543e6e1af998b148e5804e3df | ORPH
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/4f6c42fcafe551924fb12bc2a725528114d28efa | ORPH
   sh4eb     |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/e2e176e5954c394799c71ef61116f4667b8bbecc | ORPH
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/f75a038a3bd8fb8099ac8a8e0f35a6e205d76e5d | ORPH
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/436704423939e9adc96c3ec7706822e10bfd3790 | ORPH
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/e0879b7dc41b6c88847f4e8ee1b137fa2cc06d60 | ORPH
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/b3b06cf8e11497c55366c9ee4c4163c562b51a8f | ORPH
   sparc     |        open62541-v1.3.3        | NOK | http://autobuild.buildroot.net/results/23f440b093f7999e733a63c3516e8aa3778dd411 | ORPH
  riscv32    |        open62541-v1.3.3        | NOK | http://autobuild.buildroot.net/results/38196e1f37b1531556fa51a8452b3d78d01f55c7 | ORPH
  mips64el   |        openblas-0.3.21         | NOK | http://autobuild.buildroot.net/results/164a1c83fb4ca627484d9b6d7e4895d6d85a1a4a | ORPH
    m68k     |         openssh-9.0p1          | NOK | http://autobuild.buildroot.net/results/8c52ffddcccdf539e2c39af787074a596e559da8 | ORPH
    m68k     |         openssh-9.0p1          | NOK | http://autobuild.buildroot.net/results/bd5b50c02fce38c1742b11639f7a2d69975ce8d7 | ORPH
  powerpc    | package/acpica/acpica.mk:40... | NOK | http://autobuild.buildroot.net/results/0d6618d0a64323737915e29aae2a1b9115803391 |     
   arceb     | package/acpica/acpica.mk:40... | NOK | http://autobuild.buildroot.net/results/165e9cc0ae51fde44efd63bf394778a527685912 |     
 aarch64_be  | package/acpica/acpica.mk:40... | NOK | http://autobuild.buildroot.net/results/b050b14e4b1220753b2f7862c3671ede70135dae |     
  powerpc    | package/acpica/acpica.mk:40... | NOK | http://autobuild.buildroot.net/results/6898ecea6047cf500e2a3db3d387ee7a6d21986f |     
  sparc64    | package/acpica/acpica.mk:40... | NOK | http://autobuild.buildroot.net/results/eb146f73d61ad58cec3c99ea1d04b42d81e69021 |     
    i686     | package/acpica/acpica.mk:41... | NOK | http://autobuild.buildroot.net/results/2467ae75d467bac6278d90cdf5bc73791b32bddd |     
  aarch64    | package/acpica/acpica.mk:41... | NOK | http://autobuild.buildroot.net/results/ee047871ae50482a535dc99e046a037eb91f60db |     
microblazeel |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/9c24b3f4d668a3ebfa8a063e43a94980a431835f |     
 aarch64_be  |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/3f589440f4f8c3042e0ba0f5eab4ba77ca1b32f5 |     
   xtensa    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/0a91e1bab89914b40f0b637c601fd9a8c517bc00 |     
    m68k     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/cd82bc9cae9663814a3659e69a3e8e489101cc3c |     
  mips64el   |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/d92a851cec262934d6546418a7f5908dbb5ff1cd |     
 microblaze  |           php-8.1.9            | NOK | http://autobuild.buildroot.net/results/d312fbc179a896f6244a0f940ec7577ade0f1694 |     
  aarch64    | piglit-2affee53f3ad7a96f5b3... | NOK | http://autobuild.buildroot.net/results/ed3c5806458efdb9db78732d3709e1d6ec441bcb |     
microblazeel |            pigz-2.7            | NOK | http://autobuild.buildroot.net/results/01070dcf11f718a387eb87cd91fcb93679c3b64f |     
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/086c04487c4bfd64cb6acfd8ca66919c3808505c | ORPH
 powerpc64   |     python-greenlet-1.1.2      | NOK | http://autobuild.buildroot.net/results/3738e1da8359814c00c27357f1bb4ad4c3dabda4 |     
   nios2     |       python-ujson-5.2.0       | NOK | http://autobuild.buildroot.net/results/edcb332d6d6385d7c63ea602a289909bf4cfb0a8 |     
   mipsel    |           qemu-7.1.0           | NOK | http://autobuild.buildroot.net/results/34b3db16c15b0dfb0bf218f4c8307df8ef8db245 |     
microblazeel |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/970cc2b0482fca980d5bf3895c8347ca64a9cb7c |     
    arm      |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/69899534525057736f7fce5b5a21cf7e196ed8b1 |     
   arceb     |          reaver-1.6.6          | NOK | http://autobuild.buildroot.net/results/b34d5cc4318199ac763a76fba59265171a7ad2e6 |     
    or1k     |        skalibs-2.10.0.3        | NOK | http://autobuild.buildroot.net/results/17655e0969ab2883c2a1d4059ec9b7839ab482e2 |     
    mips     |        strongswan-5.9.5        | NOK | http://autobuild.buildroot.net/results/8ed637e1748ae114b1bc7c13a1b7c6e98cfc3ef3 |     
   mipsel    |         sudo-1.9.11p2          | NOK | http://autobuild.buildroot.net/results/3d0207637362d5e7098b4a15b13c1a5b314932f2 | ORPH
   armeb     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/a49bd2d2f1d28f56e86316b02b30bfb90a997856 |     
    sh4a     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/1c3af8c6ea240aea5df1081df0326edceba6dfc4 |     
  aarch64    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/9cbdd1b3193b7947d9f98ef1a79979d1529edcc0 |     
 aarch64_be  |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/1298e1d78b847e6a2867f5fd22c612d31bb6b811 |     
   s390x     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/8a38151f316c449aea7dcfc2b7b6bb1a79e62f5a |     
  aarch64    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/cf51e612136d7d1c4d625004c930cd5b4a9947b9 |     
    i686     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/db39db910fbfbbd674644f109dac721cf148038d |     
   nios2     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/921c6b5d675e209dade66f0a3ffe63d1baa1ac70 |     
   mipsel    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/f9b71479b8c159d54391d2ac3b11725ad6f5017a |     
   s390x     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/b00ef267adda1d66f6480784ae6ad0561ba3b08c |     
   mipsel    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/27bf5b8cce48b9a832f568c52806eeadd57dbb7c |     
   s390x     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/939d656335008bf76fa59d34cd93f005a24b2364 |     
   nios2     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/40865d6f4f243e9867186a4cb6b9cdcf7a0ff6aa |     
   sh4eb     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/504b1c727f38f62cebeb907362a853c51b948499 |     
   armeb     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/3f0599a2691bc982ec1f04eb00798fa96110c3fb | ORPH
    arc      |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/d9c1b614e6848173592fe9a8273f4c2000970926 | ORPH
   mips64    |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/664fc5854a0ec60822a4b6e07d934e754dd68375 | ORPH
   s390x     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/6e66318000742fe1e94d6f45c1ba6d5b153b26c1 | ORPH
   mipsel    |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/36a95f8761886bcc2a8ce0255f29638ce6f8043a | ORPH
   mipsel    |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/224fa70da2ade672477460ff378c22ee19646772 | ORPH
    i686     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/ffe13203475402aaeccba9e258b7fe025444effd | ORPH
 microblaze  |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/146f145b156dbc375565381d2956c6093f3ba050 | ORPH
   x86_64    |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/9b9c594645072b1cc7c431cc29737bd1445cc06e | ORPH
 microblaze  |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/f93ae598aa9949506ddd58d550e4d62735df5c7e | ORPH
  mips64el   |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/39291e3cd912fe07f7f3f8a5dda5dade28622659 | ORPH
 aarch64_be  |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/be7298b7623690ea66008ec1c4fd32a43e029d46 | ORPH
    arm      |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/357227d4ab7ae2685aa9edfc91137ba7575daa7a | ORPH
    mips     |         tealdeer-1.5.0         | NOK | http://autobuild.buildroot.net/results/6c845d88b62788509ce7cb93d7f6c1aedce3dc83 |     
    mips     | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/1501aac1c8d952b840b27c2d24a1b18015a97b82 | ORPH
   xtensa    |          tor-0.4.7.10          | NOK | http://autobuild.buildroot.net/results/199eebe5cd094e26f23e38fbbe4080a6dc4ab24f |     
   sparc     |       uccp420wlan-6.9.1        | NOK | http://autobuild.buildroot.net/results/137496eaadb4ac0d0b2e2035023ab20680d66d48 | ORPH
  riscv64    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/239c11392b29bb31d0d6483160625ef5f696b874 |     
powerpc64le  | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/ae28f825754a1dfb6a4b85e5ed6e46271d051155 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/0414c07b50c14cb412de84189ab619c00ff51ca6 |     
   sh4eb     |            unknown             | NOK | http://autobuild.buildroot.net/results/6b6b8931528348d0b62b4ae2b929f3e8b69206ad |     
   armeb     |            unknown             | NOK | http://autobuild.buildroot.net/results/8d855fec7fcdca304fc9e2a043a67c1cebae6706 |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/a78bbb72b1514ad0b861acbfadb96ea1cb91f23b |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/7ea72f0fb4133e074ed198639806bf4f2cb9a77c |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/862fae8f3adfe1add065f3eb122fac6befd44478 |     
    arm      | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/99a3ce83bd4c07bd38b35a0bc749381c3d779d4e | ORPH
   sparc     |         usbguard-1.1.1         | NOK | http://autobuild.buildroot.net/results/1e71adf529cfd2fa4c5d9c0d7efc43db5fa7743e |     
  mips64el   |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/4f206bb4ddbc76069962fc890252cf02488484ea | ORPH
  mips64el   |           volk-2.5.2           | NOK | http://autobuild.buildroot.net/results/c14bc9c2cb3743fd3b242179f4efc85ce64f3295 |     
    mips     |         wolfssl-5.5.1          | NOK | http://autobuild.buildroot.net/results/e05e8a83ebd789535f75d764e67ab3f705dba333 |     
   s390x     |         wolftpm-2.4.0          | NOK | http://autobuild.buildroot.net/results/14cc6ea12853c7a710390caeeec7578a578da462 |     
  mips64el   |         wtfutil-0.41.0         | NOK | http://autobuild.buildroot.net/results/e75c204c7c18911c68247ed12a0babe5018303cd |     
    arm      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/5c8b1e3b5ca94127e940475bd52b6ea4dd5ae9b8 |     
    or1k     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/d0682c248d093652d3bbdc46fe8484f6e1cd884e |     
   nios2     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/03b5c99277bf6ab5dba536981398ef1a33071a1d |     
   nios2     |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/f1d88d3833d14c4e73378c074c3ca1cf3ec7e507 | ORPH
    arm      |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/b09bf478e65f8d7db93bf16de2bf5c44dd34af94 |     
  riscv64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/5c6cc56fd9cca967dc7507bc4c583a20ba6edc5a | ORPH
microblazeel |           zstd-1.5.2           | NOK | http://autobuild.buildroot.net/results/f25448356c934c15857d845603c6a66c8eb6c908 |     
 microblaze  |           zstd-1.5.2           | NOK | http://autobuild.buildroot.net/results/9e8e6fe651ec697071411d9b680d3dd9b9ee7b73 |     
microblazeel |           zstd-1.5.2           | NOK | http://autobuild.buildroot.net/results/3effd33f0fa1a2cc97bf08b4e1159935c33e2a4d |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

            igd2-for-linux-2.1 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/35937a5a4ba90cebf457164f0f4a68af4447e31c |     


Classification of failures by reason for 2022.05.x
--------------------------------------------------

                       iw-5.16 | 2 
dahdi-linux-5c840cf43838e06... | 1 
             fontconfig-2.13.1 | 1 
host-pahole-73383b3a39afe86... | 1 
              host-rust-1.60.0 | 1 
               libglib2-2.70.4 | 1 
                lua-cffi-0.2.1 | 1 
                 opencv4-4.5.5 | 1 
                      pigz-2.6 | 1 
               protobuf-3.20.1 | 1 
                python3-3.10.7 | 1 
                 uclibc-1.0.41 | 1 


Detail of failures for 2022.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/21db82cd2b92d90e1bc56b7edadab13aa2578cf4 |     
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/442a154f2680673430977a7ef5ea463edf8eafe9 | ORPH
   arceb     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/a121ff9edef79a2bae50fc4b7807fc39be22d919 |     
    mips     |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/b2ace5922d60f6f144c584b3949b3a6308f623a0 |     
    m68k     |            iw-5.16             | NOK | http://autobuild.buildroot.net/results/952539deb8522426bad9d7578fdd183b5be6943c |     
    m68k     |            iw-5.16             | NOK | http://autobuild.buildroot.net/results/ebb28219cf1b2f885c4fb34dfdaefc5b44c1813d |     
    arc      |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/6448e9af7a4ef4830dfe4a510b4b6cc76707f136 |     
    arm      |         lua-cffi-0.2.1         | NOK | http://autobuild.buildroot.net/results/8f39fa78034b94761ace35f3b921906ce9f17e4f |     
    arm      |         opencv4-4.5.5          | NOK | http://autobuild.buildroot.net/results/9b46c4ed654446c29f936799542cd3ce0ee42615 |     
 microblaze  |            pigz-2.6            | NOK | http://autobuild.buildroot.net/results/e141fdf29a1894f59b8b5eb42713a7743819b100 |     
   nios2     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/8a3082031e141bce867822a2e902e5c5b1b63635 |     
   x86_64    |         python3-3.10.7         | NOK | http://autobuild.buildroot.net/results/c1b98ec51c95d516fde311459facba12657b43b8 |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/53e25fdb0687d7ee274d0552ca51f9b8e6c55184 |     


Classification of failures by reason for 2022.08.x
--------------------------------------------------

                gerbera-1.10.0 | 2 
glibc-2.35-134-gb6aade18a7e... | 2 
host-pahole-73383b3a39afe86... | 1 
host-spirv-llvm-translator-... | 1 
            igd2-for-linux-2.1 | 1 
                ipmiutil-3.1.8 | 1 
                 libwpe-1.12.3 | 1 
                 pixman-0.40.0 | 1 
ulog-0389d243352255f6182326... | 1 
                       unknown | 1 


Detail of failures for 2022.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/0f74884c5ad645643171ad12c6daec28348c3ae6 |     
    or1k     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/8b5c25980689edc691dcdee94305ec4da2147673 |     
  powerpc    | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/c9e3d1d40fa67bcbb0015656c938567afe485d07 |     
    sh4a     | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/b97967119562f03b5d67d109fb25b86f0e592fa9 |     
  powerpc    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/ca2e53dbfedef5fe8c76f7e206b0f57bf6057932 |     
  aarch64    | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/f8001b8cac7b90026ebc8b61cbc8e97fe7971526 | ORPH
  riscv64    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/dbc47514edf425987b3bba71f73656ad43057a18 |     
    i686     |         ipmiutil-3.1.8         | NOK | http://autobuild.buildroot.net/results/35d162c0fe5119bfcfb85d5718f582377265af7a |     
    arm      |         libwpe-1.12.3          | NOK | http://autobuild.buildroot.net/results/7cbefa3fa95a2b21d34d40ade18788f54a7569db |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/5cde4229b54b6be7d943648457888c7f92827ca9 |     
 aarch64_be  | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/45e4fa9ea1b2aa40f2f22eaafb283af647f06cc7 |     
    i486     |            unknown             | NOK | http://autobuild.buildroot.net/results/5e29669ff3b1a533c00fdfda747ddde2c1f4678e |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
