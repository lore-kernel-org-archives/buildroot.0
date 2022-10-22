Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26092C433FE
	for <buildroot@archiver.kernel.org>; Sat, 22 Oct 2022 05:34:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 75F6A60BC4;
	Sat, 22 Oct 2022 05:34:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 75F6A60BC4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oU4VVbI18Ks2; Sat, 22 Oct 2022 05:34:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 64E4F60A66;
	Sat, 22 Oct 2022 05:34:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 64E4F60A66
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F1BDA1BF2F6
 for <buildroot@lists.busybox.net>; Sat, 22 Oct 2022 05:34:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AB4EB40194
 for <buildroot@lists.busybox.net>; Sat, 22 Oct 2022 05:34:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB4EB40194
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UuXiNhmZL9CW for <buildroot@lists.busybox.net>;
 Sat, 22 Oct 2022 05:34:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B1DA40132
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4B1DA40132
 for <buildroot@buildroot.org>; Sat, 22 Oct 2022 05:34:50 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1FCAB6000C
 for <buildroot@buildroot.org>; Sat, 22 Oct 2022 05:34:47 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sat, 22 Oct 2022 05:34:47 -0000
Message-Id: <20221022053453.AB4EB40194@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1666416887; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=tF3PMnIczHZhfjtEQAW5juq/fLJdxl95nPkmEr564o4=;
 b=LBIoiQiN+vNgSkuxoe0xxkgzBHKoDtgnKCHxz+Sn08VHXfJwLO6SQl+m/+9XvrCxVzmMBD
 0RYZ4JpAo0ha8gl76YAiGKHYyy+NY9S9gCoX+rVFD21NF7URcvZCIYD+kC8F4z7JaCA9BP
 hDDBY8NEe4ZIaS0W56qy0yObc4vSLtmCaT8XXrhH9fjgr01nm6cg0/kJNsZhzhIWUQU5OL
 jYL4Ntsi10uBmG2qHKI7LviN/3tkRHWDVPiPSXrY7ifDp2DPn5Eew8wlkymzn3dL+kIgZe
 wB4SGmv3r5soYnOspzt92TXIN30uI+8wFRZE0fkat9LcmCuFWmYD0Toho2yOPQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LBIoiQiN
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-10-21
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

Autobuild statistics for 2022-10-21
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  3  |  1  |  0  |  4  |
  2022.08.x  | 13  | 13  |  0  | 26  |
    master   | 112 | 231 | 10  | 353 |

Classification of failures by reason for master
-----------------------------------------------

                 sysvinit-2.99 | 19
                      crun-1.5 | 15
        host-sentry-cli-1.59.0 | 15
                   libnss-3.84 | 13
glibc-2.36-44-g2628500f5dff... | 12
        host-f2fs-tools-1.15.0 | 12
                        brltty | 9 
host-pahole-73383b3a39afe86... | 7 
              host-rust-1.64.0 | 6 
              libarchive-3.6.1 | 6 
                 systemd-250.4 | 6 
                      xz-5.2.7 | 6 
            btrfs-progs-5.16.2 | 5 
                     efivar-38 | 5 
                   linux-6.0.1 | 5 
                gerbera-1.10.0 | 4 
                linuxptp-3.1.1 | 4 
                   perl-5.34.1 | 4 
                       unknown | 4 
             batman-adv-2021.4 | 3 
dahdi-linux-5c840cf43838e06... | 3 
                elfutils-0.186 | 3 
                  gensio-2.5.5 | 3 
            host-binutils-2.38 | 3 
         host-gcc-final-11.3.0 | 3 
                host-go-1.19.1 | 3 
            igd2-for-linux-2.1 | 3 
               libglib2-2.72.3 | 3 
             libgpg-error-1.45 | 3 
                 dash-0.5.11.5 | 2 
  gobject-introspection-1.72.0 | 2 
               libcap-ng-0.8.3 | 2 
            ocf-linux-20171122 | 2 
            quickjs-2021-03-27 | 2 
                 uclibc-1.0.42 | 2 
                  acpid-2.0.33 | 1 
              alsa-lib-1.2.7.2 | 1 
                  autofs-5.1.8 | 1 
             bluez5_utils-5.65 | 1 
                  botan-2.19.2 | 1 
                  exempi-2.6.1 | 1 
                     frr-8.3.1 | 1 
fs/cpio/cpio.mk:117: /home/... | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
                    gdal-3.5.1 | 1 
                     gmp-6.2.1 | 1 
         gobject-introspection | 1 
google-breakpad-c85eb4a59b6... | 1 
            host-binutils-2.39 | 1 
                jemalloc-5.3.0 | 1 
                libcurl-7.84.0 | 1 
              libgcrypt-1.10.1 | 1 
        liblog4c-localtime-1.0 | 1 
                   libqb-2.0.6 | 1 
               libvorbis-1.3.7 | 1 
                   linux-tools | 1 
              liquid-dsp-1.4.0 | 1 
               lpc32xxcdl-2.11 | 1 
            luaossl-20220711-0 | 1 
               mariadb-10.3.36 | 1 
                     mtd-2.1.3 | 1 
                 openal-1.22.0 | 1 
                 openssh-9.1p1 | 1 
   openvmtools-11.3.5-18557794 | 1 
                    opus-1.3.1 | 1 
              procps-ng-3.3.17 | 1 
           proxychains-ng-4.16 | 1 
                    putty-0.76 | 1 
                     pv-1.6.20 | 1 
                      rauc-1.8 | 1 
rtl8723bu-d79a676a8d3f0bb6a... | 1 
                usbguard-1.1.1 | 1 
                 wolfssl-5.5.1 | 1 
                    zeek-4.1.1 | 1 
                 zlib-ng-2.0.6 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          acpid-2.0.33          | NOK | http://autobuild.buildroot.net/results/a4428059ca2001ef0ec8b233a03853a30588b70d | ORPH
  mips64el   |        alsa-lib-1.2.7.2        | NOK | http://autobuild.buildroot.net/results/e7b8a80a9c03644e6099fa8d6eee0df959e50f0f |     
    or1k     |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/a199fe0aa457668e91e1d4dcfaa73be00ce316e5 |     
 powerpc64   |       batman-adv-2021.4        | NOK | http://autobuild.buildroot.net/results/b3528c5886bcf8e6db5e279764542c03a874586d |     
   armeb     |       batman-adv-2021.4        | NOK | http://autobuild.buildroot.net/results/f61646ed8d4ddc520723287dd98af21e8d0c6a26 |     
  riscv64    |       batman-adv-2021.4        | NOK | http://autobuild.buildroot.net/results/b28048cd57746d75f9a664ded8b9267a7d17f2bd |     
   sh4eb     |       bluez5_utils-5.65        | NOK | http://autobuild.buildroot.net/results/89e6f012971698e0f365ce2886488dd3268c0790 |     
   mipsel    |          botan-2.19.2          | NOK | http://autobuild.buildroot.net/results/b27f53884fc41fd802eb61b4a0d5e58dd5db5727 | ORPH
    arc      |             brltty             | TIM | http://autobuild.buildroot.net/results/dd08c305437a04cac3a349ceeaa394282fd01164 |     
    mips     |             brltty             | TIM | http://autobuild.buildroot.net/results/4790214bbe0f932c02beaa8884af0fb68338aacf |     
  riscv32    |             brltty             | TIM | http://autobuild.buildroot.net/results/1c7fbec2bb4d444f4fe5b98b328873aae84c9399 |     
    sh4      |             brltty             | TIM | http://autobuild.buildroot.net/results/98cc654fe7a9bad2e0afc1d92a2bf83b581e5227 |     
   x86_64    |             brltty             | TIM | http://autobuild.buildroot.net/results/5fba1da10b888becd251bf7da383ce11f6d328cb |     
   s390x     |             brltty             | TIM | http://autobuild.buildroot.net/results/489f0b1e6d531a0c3d5f05ef30d071bed9067e86 |     
   mipsel    |             brltty             | TIM | http://autobuild.buildroot.net/results/87f2eed7462b8ca57cc191fce0c08177ea498167 |     
 powerpc64   |             brltty             | TIM | http://autobuild.buildroot.net/results/db0eaa716729d8f51cb0efff3f4865d2c68a0d79 |     
 microblaze  |             brltty             | TIM | http://autobuild.buildroot.net/results/dca4b18cfe5fedf768b719c5c1e83ca7a4bc60ec |     
   mipsel    |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/a2936ba90866bf5a781a620f8aa8617bb7bc5b2a | ORPH
   sh4aeb    |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/b72e31d86c882dc8f7363fbc27efa4ea5fe564e1 | ORPH
    arm      |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/e55e59d715775317b78ee601a55f6382af7b1d07 | ORPH
  mips64el   |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/9a8157a9fc68443267260eb11be401de9cd4b6c3 | ORPH
   s390x     |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/6429c983c9c571db4504dc8f1faddc8d97eb101e | ORPH
   nios2     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/faaa5eb138afa382ef16e9366d4690809975fe87 |     
  powerpc    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/762bcbbea2d101097f8534bbd608b63732b45968 |     
microblazeel |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/22d214c665292baf9026433e97f8245b02ded0c0 |     
   arceb     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/112c01ada3023b2529c788e6a3f2e3bcd3316f60 |     
  riscv32    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/71e79a12be2a38dc9ebe580ebe5a46b23016c739 |     
  riscv32    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/f079d1d180e45e2f9c2f05de71f436ba17611668 |     
   arceb     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/c8decbf5e3fc47ef66edc4a0ac1a61b20aedd0a6 |     
   mipsel    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/3ea798054ab31245498572aa98161fedaa0c062f |     
   x86_64    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/9102ff9206815f3600a851e1486d2e15cb1f8ab0 |     
   s390x     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/c640227aa7a32528b6bc8b947fdadf8d553c26ac |     
   armeb     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/811f7fc7112e3b575120ff4406e74fccd2434a3c |     
    arc      |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/242674282ae8c0473e4206af6c5c3d6562a2eab6 |     
  aarch64    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/c0f262000d19963af671539d6bcb6dd6b25449cf |     
  aarch64    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/0b2b27b82d2ed049accfbc4a28e89d8233b99475 |     
   s390x     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/cd382dd1b57e2264d28cdacf3f00ed204b3622ca |     
    i686     | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/463b7ac2da7fc2b43290e2f6060dd320559344d1 |     
   xtensa    | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/3372b25762b00eeb7230c70952e493456b3b2670 |     
   arceb     | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/dc7f0f56e01fb4ae5b993aada6e57c5a4d419d87 |     
powerpc64le  |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/5d70e90aff7d7affce049f0fb50f846ac4911d13 | ORPH
 powerpc64   |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/85dce21ba7d94d5d7ab3a077f4fcf98f6e3f64fe | ORPH
  aarch64    |           efivar-38            | NOK | http://autobuild.buildroot.net/results/96c158d39512fa9dffff3a5ce7522cb8a6433063 |     
   mipsel    |           efivar-38            | NOK | http://autobuild.buildroot.net/results/3d097a86fa24f812f4b18c379e5dbc94a6ccd057 |     
    i686     |           efivar-38            | NOK | http://autobuild.buildroot.net/results/44c46de36d46d832ab7eefef848163dd792d6b08 |     
    arm      |           efivar-38            | NOK | http://autobuild.buildroot.net/results/5f0b7346ed62746469a432ec24032d63520ab16a |     
  aarch64    |           efivar-38            | NOK | http://autobuild.buildroot.net/results/f8fcb093ce6c68230c9467a2a20ae3d447f7010f |     
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/1a6f31415db678b76bc866f994d8e64b2e91c285 | ORPH
    arc      |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/f921b000edab30ed09965575cc0725ddaac266c6 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/378305066f1e2404e336ea542414869399b3bc42 | ORPH
   mips64    |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/264ba84fbe53388d5047c5fd318dd45469ff5731 |     
  mips64el   |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/415560ee93e56166f197ddbcee4bdecf45561f6b |     
 aarch64_be  | fs/cpio/cpio.mk:117: /home/... | NOK | http://autobuild.buildroot.net/results/419f17150bd48fadce1627e30d06c8171351edaf |     
  mips64el   | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/23f564e3eac6e936309d146d5c23165a8d5de236 |     
   mipsel    | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/69b5d9aa8b366dae9789d338afdf1d8c7bb214b0 |     
    or1k     | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/b8043621f941269efc839ed5c48b80bbda1fd3de |     
    arm      |           gdal-3.5.1           | NOK | http://autobuild.buildroot.net/results/ef81f63df0e414eaf3d8a4398a0b28e321c94554 |     
    or1k     |          gensio-2.5.5          | NOK | http://autobuild.buildroot.net/results/98c91570d5a9cf8e6b8e3cb1c1a2d558fa87bced |     
  mips64el   |          gensio-2.5.5          | NOK | http://autobuild.buildroot.net/results/7e5bd50835fdd07a3edf33adbd04a17e94325893 |     
   s390x     |          gensio-2.5.5          | NOK | http://autobuild.buildroot.net/results/5e101bb2deef369038066acec3001b75d2930f25 |     
 aarch64_be  |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/da304f4353aee0b736b4e567243050452a2a32aa |     
   x86_64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/fe57ac66f15cfbf784a637c444546b62aaadadb5 |     
powerpc64le  |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/55d044fb750e8c125b0aed7f349ea9c6357fd1b5 |     
    arm      |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/acdfa6e8f083d44d4345c660991c17923c42f9a8 |     
   x86_64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/1cb9e4ed65ee0f0e85e432906ec0b0d4014578cb |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/a9d249534b17cb292bdda3ba9c0fc7e1cefeea2d |     
 microblaze  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/0bc7c8a685c62d5ad590aa5bbf2983c69a935347 |     
   mipsel    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/af1fb36f7d972b6fd26b628f00d4f2a50db4f609 |     
    or1k     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/46d7934778c71842900256d969c0dd909179b886 |     
powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/2a75837b10e81d998d774db1299d45ddd814ab14 |     
    mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/0d2c446f623c5e21889ed3202842f145959aee25 |     
    or1k     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/00d692b9b850ef22ca852e417bedab78adfe2e2c |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/71773b014233101be286f161ff8cf790b77f32e7 |     
microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/69047305cd9fc8b6ad9194dfa425883bf637c0b5 |     
    or1k     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/13cbbb1200092a4b9f0521b968eb2ba0467322a9 |     
    or1k     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/265073aa19e5b620ec8deb89af43350af223505d |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/4894b162f97e369d2f179975562894cba28a8a55 | ORPH
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/689dfa172beaf4d4d22830ad95ef2b0b884080af |     
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/93700865cea12b293e382a934e74529b6b624591 | ORPH
   s390x     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/8001ae95b618c4a80fca4aa28590e545d62dbe08 | ORPH
    arm      | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/78c8880e032d2ae525f16afee4beef9cb6f3e5a3 |     
 microblaze  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/531b945ad24ecd8aac2f59cf8f5a24d52dba323c |     
   mips64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/168f4cb76be3a1564dc9e84cabe152a8132326c4 |     
    sh4      |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/ea0513d72aab0ec9b16448c5389c864fcb3251e5 |     
    m68k     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/f2c07067d573870f85ff05e7ab8e53ac76c4105f |     
 aarch64_be  |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/89bbdf6098803fb927036bb8f253b658dccf6e41 |     
powerpc64le  |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/3292e29f47adc2a642f981bfd9b29de0440c770f |     
  riscv64    |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/dfad7f18b06ce2d3a400746f9c590762b0acf209 |     
    arm      |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/37724bce05dabb55694984357858fa95e144610d |     
   sh4aeb    |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/cd66f9c99ce3f3c27727d02589ded96c4faf3b8d |     
   s390x     |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/b739e5cf6d97e99b571e4678730ee31606db51bb |     
 powerpc64   |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/27c7345a3bac3ba2a4acad46d919f0843a74c083 |     
    mips     |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/96c71d86657e99e297442016653e6c36fb65dd53 |     
   nios2     |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/0bb06d325d4d976e7b9ded4e85a3165b70ad051c |     
 aarch64_be  |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/5802784f6616c3be4835f2cb4080dbbc8d678037 |     
 microblaze  |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/99f6cddfadcee94e117775dbedcf476c997a1678 |     
 microblaze  |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/d84e831eef749f79eecfb5e4b84ba5424e69402b |     
  aarch64    |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/b82aa041534288528a20b4955cabe118eea2e0f1 |     
 microblaze  |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/07dce54f02a7569aa8dc7b00b590cf80c183f2d4 |     
   s390x     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/a34289d87231f652ecf235d79991c2592e07ab48 |     
   mips64    |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/b770124ec8d0dbf47dc03415c67bce694310ffe3 |     
powerpc64le  |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/e8734352b93bff900af9ea1d32d2c60d5382a225 |     
    i686     |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/7e9a976e0714c3282804fadd9d1b11da4981cbed |     
 microblaze  | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/670c687ea8620f957b32a37a03dc1b80f0debaa7 |     
    arm      | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/5f6ad76cd8a506b67a578b28051ea51c40c9d17f |     
 powerpc64   | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/63b707c985095134f5501404134714363fb2082e |     
 powerpc64   | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/21eca8bc9bb03523a4b73c66c38c4aaf4b6036af |     
   mipsel    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/b67c62b0c1201691c4bdd5eac762c2e875790003 |     
    arm      | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/b26915ccd827e217ea8ccd8373bc39d02b5f7b40 |     
powerpc64le  | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/df3ce57b09f7cbea87115a32e854e8579f0201f7 |     
   armeb     |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/4f2c090e7377ee6574dc8ff31c434509059a6345 |     
   x86_64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/29e0bd7b85cc504617fba80733b5b749346a2a93 |     
    mips     |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/4e3b8eb552c70f4db377111414d343c551d04806 |     
powerpc64le  |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/6f4182da6074a42cfbe6b61a8e2a08b823ccd04a |     
   mipsel    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/bdc75181a445e89dad114ae3f6f1fe11a58d5d4b |     
   s390x     |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/7f6dc8a12388eeb8f0242433255ee6cdad03b1ee |     
  powerpc    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/beb74e934a679901d46214857bd858c656c69370 |     
    arc      |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/ba7294ecdd7a29adc6a7be551816a97ec796a01e |     
   s390x     |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/86f3e2db7bd740fc9696a08c325af76af8b7edac |     
  mips64el   |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/754c296230e41d44cecb3e80fbc6757350c12240 |     
    arm      |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/4065c94664504e8576c928fc895e0c290a8b3125 |     
   xtensa    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/4472b25933650b6f518008cf01c2a29e0e5f7c11 |     
powerpc64le  |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/74affbd4cc393de33490149f8dec58b936921d36 |     
  powerpc    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/b861d55bc5f06dd322d08b6d56bea329f9f3842f |     
 aarch64_be  |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/53ade4317a0dd8a61ef51aad6fea93bbc3f836c1 |     
   s390x     |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/d6517e84309d54349d1fbb8f7a73f1c929b3c4c9 |     
  aarch64    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/020fe2fca315aea01a7d7928173dd1d2b6c42198 |     
   nios2     |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/be5e28681407273781ac8a77588c49334f2f7f6b |     
   mips64    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/b7be5f601e338d4130dc4bd6c248a7bfda24ee72 |     
   mipsel    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/81a5021a4468f87742cf676ae19f731773e6f4b1 |     
   xtensa    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/97567fd063d1492504ecc9976b6078dd890b6ff3 |     
powerpc64le  |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/92288db9f0c81e116e3f452a8afa0a5b55f4942b |     
  sparc64    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/e6112f514808a72285dca09bfb3268cab0a06e8c |     
   nios2     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/ad8e7be15146127c86f79d14fde6fe2cceff2d36 |     
    sh4a     |         jemalloc-5.3.0         | NOK | http://autobuild.buildroot.net/results/b5fe739cb5f347aa8ea4b5b094075d92a8dd9b53 |     
 aarch64_be  |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/b9db26e7905ba1a59ea175851a6f4a692eecb7ec |     
    mips     |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/aeac3dc8106a4cdfe3e417fa66e902b60cb3d519 |     
  sparc64    |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/1def3966dc8161399f6e85a81b14aa182f83d3f1 |     
  sparc64    |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/b4cff1684a16297d7d9e58baf415baeb02f054e4 |     
   nios2     |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/feffa4ed1087d39cbf738ef6d35f794d2e168504 |     
   s390x     |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/bc279853f60b97fbbda9c1b3dc8e974a07659aab |     
    or1k     |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/9733477141a9a43bdd2bbb429ec6c172e813fbf2 |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/87f5c52675bb10fd0abad41ff1b11a601296d920 |     
  riscv64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/6f635af6bcbe2a00967dd8dc92811b37658b8cc3 |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/1b533bd5883d861bf52fc148d1ff4ad5cb169789 | ORPH
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/691f146e2e69c73244a25a99647fbfc1830401e9 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/2e9a7228f845f5fd1d701a7f0076a7c1c0957295 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/8b45d1917c155c553c1fee96de41bc4b8c1e9808 |     
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/2d0b03132fc429e965dcbc9f3eaf441c63e7f039 | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/80f0e44c9eefa197d5a004d9551f59851f78dde1 | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/94dbfcf7165a8c9290637717ff89df5de53cabbe | ORPH
  riscv64    |     liblog4c-localtime-1.0     | NOK | http://autobuild.buildroot.net/results/576a3fdb2092d620dec0f53414bbc0347d3b1ef6 |     
   nios2     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/0e1be660fc206b2501ebc18424db3c3f1c936612 |     
powerpc64le  |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/1efed21659fe2b4331dfa2d0cb834853e0de8668 |     
   sh4eb     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/73f8c653c319b65e5e81484d52fa66cd9126ddd9 |     
   mipsel    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/ce8d3291c51f59a6bc3ba9fa08239fcbe432b993 |     
   sparc     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/8af849b00cde45a1a12e9456cf542c39ef6d3c66 |     
  aarch64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/fbe66901b4ed1fda6b5080e66a80476e35668609 |     
   mips64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/d22d36a1633404f449a0cfc4d2a199be9a46c8d0 |     
    arc      |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/acefcd37eef5b10715bffc05833be12a8eba8924 |     
   arceb     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/b91934f3decf5890d9ebe9d49ec04c14c2f8e86c |     
   s390x     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/25cf95b3fd94ce27d5a9c04fb68b56cec90dc221 |     
powerpc64le  |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/b39c957b6aadbf5349808fc651aa4d1bce28d8a7 |     
 powerpc64   |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/d51e0007327ce0dabe731511e580792bb0f52b46 |     
  sparc64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/8ea97128ffda6369235251827eed009b24b012d8 |     
   mips64    |          libqb-2.0.6           | NOK | http://autobuild.buildroot.net/results/55b4acda3555c1e0134a3a8967849da1d9e50032 |     
  powerpc    |        libvorbis-1.3.7         | NOK | http://autobuild.buildroot.net/results/54ad7a600488c6dfa06371a489837feda90661a1 |     
   s390x     |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/85b57b7896acbfc261533d510e277918bb7935aa | ORPH
   mips64    |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/aae94d4680c08140f509c86eea837ee43e781830 | ORPH
   s390x     |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/e0c5b7aca1feda5759c4e69a0989c06289a4fd6b | ORPH
   s390x     |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/903ade5ff0053ecf0487b5b19f14413e1762e9e0 | ORPH
 microblaze  |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/1374cb97ee73997695cd583396b2b13713d29d05 | ORPH
    m68k     |          linux-tools           | NOK | http://autobuild.buildroot.net/results/cdedaa1eb7c2e744fb3b127cf03e8e580146ac6c | ORPH
  mips64el   |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/8c7ea4eba7e26a2f0b2b1b57ae0b4d8e557a1f4e |     
   xtensa    |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/c5600b603cecd4df8b3b7f043738f305688349e8 |     
   sparc     |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/3f570165eb0a70f8f32b8ee97bc39baede047ad4 |     
  mips64el   |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/ee39e8052fc5b693a645aa070244c3d4da91aad3 |     
   sh4aeb    |        liquid-dsp-1.4.0        | NOK | http://autobuild.buildroot.net/results/ac1a37d1c87739718cffad42f2bfb49adce4c028 |     
   armeb     |        lpc32xxcdl-2.11         | NOK | http://autobuild.buildroot.net/results/2ef74e295913d81393e8d586243255933cbcd7a5 | ORPH
    arc      |       luaossl-20220711-0       | NOK | http://autobuild.buildroot.net/results/343b57d4eec4b28841023dabed5f92ee9fccecfe |     
    or1k     |        mariadb-10.3.36         | NOK | http://autobuild.buildroot.net/results/8cbe531f77d64b011d88620805622a90b37508d1 | ORPH
    arc      |           mtd-2.1.3            | NOK | http://autobuild.buildroot.net/results/a903c4cda2f62fd53bfd836a1e47123f869c413e |     
   x86_64    |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/4e32f701a36b9c33fe0119e2cdc529625ba9bae6 | ORPH
  mips64el   |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/89ded53cad7dd6a52f5e58e0cac58e6fdd1ddf7a | ORPH
  mips64el   |         openal-1.22.0          | NOK | http://autobuild.buildroot.net/results/7030667369c5852bb935dc5922a49f743ab07c04 |     
    m68k     |         openssh-9.1p1          | NOK | http://autobuild.buildroot.net/results/7e0174f98f280a36c0172c8aaf1e02e425f2ca6a | ORPH
   x86_64    |  openvmtools-11.3.5-18557794   | NOK | http://autobuild.buildroot.net/results/eb277fb780fc4d9ff3a0791910ecd3274d61cd5d |     
   armeb     |           opus-1.3.1           | NOK | http://autobuild.buildroot.net/results/0a7d524511aaca6eba479938bfd948cfd5f62021 | ORPH
  powerpc    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/7eb04a16d8c880e9e645843bb197795fbb617deb |     
   arceb     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/25edfe1ccfc0ec4d6d98479db41808d296e54fe0 |     
    or1k     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/3fa631d5c8722772dcb00fe62dc50e6b68ba45b9 |     
   x86_64    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/73da13f2d05a58aa8ccdfb17d17b7da1038646c6 |     
   armeb     |        procps-ng-3.3.17        | NOK | http://autobuild.buildroot.net/results/0dc6601189c9e087f821a82ee98709044e9ea0e3 | ORPH
   mips64    |      proxychains-ng-4.16       | NOK | http://autobuild.buildroot.net/results/b696abb67595b4e4a3c40b2380691aebbc261550 | ORPH
  aarch64    |           putty-0.76           | NOK | http://autobuild.buildroot.net/results/6f73a3b4841a958dd95b1651a6213ae5b9a033ca |     
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/7f8641566dd9b175e6a669e1f85340d1d81e97e5 | ORPH
    arm      |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/191ca86f080406b5b236ae2b8316c48fbb671b9d |     
    sh4      |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/94fe498f2403fd249087e7241dbf870076d62e1b |     
    or1k     |            rauc-1.8            | NOK | http://autobuild.buildroot.net/results/b6df9ba1d2a32fb5014f15cf5641b230a1c8867b |     
powerpc64le  | rtl8723bu-d79a676a8d3f0bb6a... | NOK | http://autobuild.buildroot.net/results/99571b055e6185d57f89b90821b76099ebc766ed |     
    i686     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/6d3d8f16688c340c4bf4690016b8cb9a2b7a857c |     
  aarch64    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/bd2f476a13f62e48c0650ce02d309bfff40ddfb2 |     
  sparc64    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/ae97cbc97be84e74d1e21a5aa69e2465808b3c38 |     
  aarch64    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/7ffed8c2731ab278702eb25a78e8d56a248c04b9 |     
   mipsel    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/d3035d56d532ead4d2cae24e66bfc9ceceb8b35a |     
   mipsel    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/0ab38e9c2f608a08b7d5ae955cc2152ddf437b67 |     
    arm      |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/b888bbdc4d4b6c6f24c279879b52187a334d11ee | ORPH
   mipsel    |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/c140eb2ff9ae243d21b4dfe88629ae1d234e2af1 | ORPH
   x86_64    |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/dfd5e2f2dad9f36c85b22d503b70b5d4923eaed7 | ORPH
   mipsel    |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/bf6843b11f127dd451e30f98dafc640e3f1c2882 | ORPH
    mips     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/d199d6d83997092416a9a216406d4666c1e4ac66 | ORPH
 aarch64_be  |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/5a42c22f66d141dfecf1ed5878ceca66254a3f7e | ORPH
   mips64    |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/191b3c05300b072b7d1f2679fa3fa72a1a128e94 | ORPH
  sparc64    |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/f04f6a8effe17880300bd387678408b9127a1fb5 | ORPH
   x86_64    |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/ad1523d4ae276630dc9d7730a9bcb31e9a2211e0 | ORPH
    arm      |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/442d6c0be9aedbdcccff888e997f43f91f068726 | ORPH
   nios2     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/941c5fdc711e64f420d091078c3401117627e217 | ORPH
 microblaze  |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/59ae9f665a669ef1100944bb98d195b80e46c952 | ORPH
   mips64    |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/b7873bbc278471d086c7a6d6ab0bdca387ec2f83 | ORPH
   mips64    |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/05f0ca8d22480df8a351e0ced43e20190934fa54 | ORPH
  sparc64    |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/41dfb90ea473ecaa43965a6ab19409923a826cea | ORPH
    i686     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/e8ca89853f72be68a40cbef6e420f4233020fae0 | ORPH
    sh4a     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/cfdec513ebfd6a216e9119412d47d7acc7a4eda3 | ORPH
   s390x     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/e23c4393e5bd18589f20ccd5233c3ca01408a0c1 | ORPH
  aarch64    |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/42f9ed68b6a5f0ae6af51c1a01fc1e4f0dac9a4d | ORPH
  riscv64    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/c23483e8b98aa63414fe78708f53df230f68452c |     
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/b535155f3529584d4b75206d88f9a1ad5ed91761 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/c6fa79f2f86a246f115831a7b2d9f7d6d1ba823f |     
   armeb     |            unknown             | NOK | http://autobuild.buildroot.net/results/d9e7ba23d385830cb2756b6b7b9791f8cb88ed64 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/0c9432638f9e0f5343cd6b08e87abeae44fa1657 |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.net/results/55ae6d63e40516df1abb6ef37a705f2604c17d14 |     
   arceb     |         usbguard-1.1.1         | NOK | http://autobuild.buildroot.net/results/8ac76c18c2fc4f3e2263b8fbe0e99075f7f8b7a6 |     
   armeb     |         wolfssl-5.5.1          | NOK | http://autobuild.buildroot.net/results/732c1baa0f0a31c420231676e5ad44591494b7c7 |     
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/10174ec91734c78a74907b015cd52568ec36b6f8 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/67cf195dfa937d89e0f489d06bfd468414384f6f | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/fa4aed94e94f48f1ae6de9cc1c66f60bb2e47a22 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/bc5a3d085b3bd2cc3bfa607677cb6cd5ea7e7966 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/4eeed19efdddb24eddc8b407ef0c470724e24795 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/b5edb59bc87e7ceb019d422c63961129f30fca2d | ORPH
   xtensa    |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/ef525951cd10ab587e0fbf240e03330d8bddad18 |     
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/591a8cfa28b1c9bf4c409297ccdae7210de0a013 | ORPH


Classification of failures by reason for 2022.02.x
--------------------------------------------------

                       frr-8.1 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/1675a5d749a8cbb199adc3128ca914996351051d |     


Classification of failures by reason for 2022.08.x
--------------------------------------------------

                gerbera-1.10.0 | 2 
glibc-2.35-134-gb6aade18a7e... | 1 
host-pahole-73383b3a39afe86... | 1 
            igd2-for-linux-2.1 | 1 
               libglib2-2.72.3 | 1 
              open62541-v1.3.2 | 1 
            openssh-legal-info | 1 
pistache-3ec9d7c4f8b828fdd3... | 1 
            python-sip-4.19.25 | 1 
                       unknown | 1 
                    volk-2.5.1 | 1 
                  waffle-1.7.0 | 1 


Detail of failures for 2022.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/80f8939e67f72b780ae98733dafcb216826301aa |     
    arc      |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/1b98b6757b2d78b636fa07ac7253625986bf260a |     
   sh4aeb    | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/53df0773ece9005faea74c4f2c70b21548ba2929 |     
  riscv32    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/217258f3ec31452cc101fe9d28237d409b674b04 |     
   arceb     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/3fec2f94179c88c7181b2fb69236ffc08ccb86da |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/449945b46fae4338051366cdfe26ba8ae88d9b39 |     
   armeb     |        open62541-v1.3.2        | NOK | http://autobuild.buildroot.net/results/6703faac5b9894f3a545241ff5ca119d7ba12181 | ORPH
    arm      |       openssh-legal-info       | NOK | http://autobuild.buildroot.net/results/49fce75e077d926422242e622f7b5e63a8ed9c49 | ORPH
    arm      | pistache-3ec9d7c4f8b828fdd3... | NOK | http://autobuild.buildroot.net/results/3fd0c2fd050c0a91d4f755151b68fc9f4811ce41 | ORPH
    arc      |       python-sip-4.19.25       | NOK | http://autobuild.buildroot.net/results/a9c0866b218817f315b3b2f490878c9ede19448b |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.net/results/aa431496a75cf7167faf064aab89085805ec1dd5 |     
    arm      |           volk-2.5.1           | NOK | http://autobuild.buildroot.net/results/32ba29e7383f6b7c22ee99627d4e38b2367014c2 |     
  riscv64    |          waffle-1.7.0          | NOK | http://autobuild.buildroot.net/results/b8acabd3fa0c67d71b526b34e8f2a463d1bc0e4b |     


Gitlab CI results for 2022-10-21
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                amarula_a64_relic | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200497934  |      
                         arm_juno | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200497944  |      
   atmel_sama5d27_som1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200497964  |      
   atmel_sama5d2_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200497967  |      
       atmel_sama5d3_xplained_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200497969  |      
   atmel_sama5d3_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200497974  |      
       atmel_sama5d4_xplained_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200497977  |      
   atmel_sama5d4_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200497982  |      
                      bananapi_m1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200497987  |      
                 bananapi_m1_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200497990  |      
                 bananapi_m2_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200497992  |      
                     bananapi_m64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498000  |      
                      beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498032  |      
          freescale_imx6dlsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498071  |      
              freescale_imx8mmevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498078  |      
              freescale_imx8mnevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498079  |      
              freescale_imx8mpevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498080  |      
              freescale_imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498082  |      
              freescale_imx8qmmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498084  |      
             freescale_imx8qxpmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498085  |      
            friendlyarm_nanopc_t4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498090  |      
           friendlyarm_nanopi_a64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498091  |      
            friendlyarm_nanopi_m1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498092  | ORPH 
       friendlyarm_nanopi_m1_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498093  | ORPH 
            friendlyarm_nanopi_m4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498094  |      
          friendlyarm_nanopi_neo2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498095  |      
          friendlyarm_nanopi_neo4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498097  |      
     friendlyarm_nanopi_neo_plus2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498098  |      
            friendlyarm_nanopi_r1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498099  |      
                 imx6-sabresd_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498109  |      
                       imx8mmpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498119  |      
                        imx8mpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498120  |      
                        imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498121  |      
                kontron_bl_imx8mm | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498124  |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498126  |      
                mender_x86_64_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498137  | ORPH 
      microchip_sam9x60ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498140  |      
...hip_sama5d27_wlsom1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498142  |      
    microchip_sama5d2_icp_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498144  |      
      microchip_sama7g5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498147  |      
                  minnowboard_max | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498149  |      
                       nitrogen8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498170  |      
                      nitrogen8mm | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498172  |      
                      nitrogen8mn | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498173  |      
                      nitrogen8mp | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498176  |      
             olimex_a64_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498195  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498205  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498209  |      
                     orangepi_pc2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498210  |      
                    orangepi_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498215  | ORPH 
                   orangepi_prime | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498216  |      
                  orangepi_rk3399 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498219  |      
                     orangepi_win | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498220  |      
               orangepi_zero_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498224  |      
              orangepi_zero_plus2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498222  |      
                   pc_x86_64_bios | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498226  |      
                    pc_x86_64_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498229  |      
                   pcengines_apu2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498232  |      
                           pine64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498234  |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498236  |      
             qemu_arm_vexpress_tz | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498249  |      
                 qemu_ppc64_e5500 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498274  |      
               qemu_ppc64_pseries | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498278  |      
            qemu_ppc64le_powernv8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498280  |      
             qemu_ppc64le_pseries | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498284  |      
                  qemu_ppc_bamboo | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498286  |      
                  qemu_ppc_e500mc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498287  |      
                 qemu_ppc_g3beige | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498291  |      
                   qemu_ppc_mac99 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498293  |      
               qemu_ppc_mpc8544ds | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498294  |      
                qemu_riscv32_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498296  |      
          qemu_riscv64_nommu_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498297  |      
                qemu_riscv64_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498298  |      
                       qemu_s390x | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498301  |      
                     qemu_sh4_r2d | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498304  |      
                   qemu_sh4eb_r2d | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498307  |      
               qemu_sparc64_sun4u | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498309  |      
                  qemu_sparc_ss10 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498311  |      
                         qemu_x86 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498314  |      
                      qemu_x86_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498313  |      
                 qemu_xtensa_lx60 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498316  |      
           qemu_xtensa_lx60_nommu | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498317  |      
                      raspberrypi | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498332  | ORPH 
                     raspberrypi0 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498320  | ORPH 
                    raspberrypi0w | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498321  | ORPH 
                     raspberrypi2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498323  | ORPH 
                     raspberrypi3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498326  |      
                  raspberrypi3_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498325  | ORPH 
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498327  | ORPH 
                     raspberrypi4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498330  | ORPH 
                  raspberrypi4_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498329  | ORPH 
                 raspberrypicm4io | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498334  | ORPH 
              raspberrypicm4io_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498333  | ORPH 
                raspberrypizero2w | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498336  |      
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498337  |      
                    roc_pc_rk3399 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498339  |      
                           rock64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498340  |      
                        rock_pi_4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498341  |      
                      rock_pi_n10 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498342  |      
                       rock_pi_n8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498343  |      
                        rockpro64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498345  |      
                      roseapplepi | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498346  |      
                 s6lx9_microboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498347  |      
                       sheevaplug | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498349  |      
                  sipeed_maix_bit | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498350  |      
           sipeed_maix_bit_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498352  |      
                 sipeed_maix_dock | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498353  |      
          sipeed_maix_dock_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498354  |      
                   sipeed_maix_go | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498356  |      
            sipeed_maix_go_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498357  |      
                 sipeed_maixduino | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498361  |      
          sipeed_maixduino_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498362  |      
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498363  |      
              snps_archs38_axs103 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498364  |      
                snps_archs38_haps | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498365  |      
                snps_archs38_hsdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498366  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498368  |      
                solidrun_clearfog | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498369  |      
          solidrun_clearfog_gt_8k | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498370  |      
            solidrun_macchiatobin | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498371  | ORPH 
                    spike_riscv64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498372  |      
              stm32f429_disco_xip | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498373  |      
               stm32f469_disco_sd | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498375  |      
              stm32f469_disco_xip | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498376  |      
                  stm32mp157a_dk1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498377  |      
                  stm32mp157c_dk2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498379  |      
              stm32mp157c_odyssey | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498380  |      
        terasic_de10nano_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498382  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498383  |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498384  |      
                           ts5500 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498385  |      
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498387  |      
                         uevm5432 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498388  |      
                       visionfive | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498389  |      
                        wandboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498390  |      
                            warp7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498391  |      
                        warpboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498392  |      
                    zynq_microzed | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498394  |      
                      zynq_qmtech | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498395  |      
                       zynq_zc706 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498396  |      
                         zynq_zed | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498398  |      
                zynqmp_kria_kv260 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498399  |      
                    zynqmp_zcu102 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498400  |      
                    zynqmp_zcu106 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498401  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
