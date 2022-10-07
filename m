Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 075F5C433FE
	for <buildroot@archiver.kernel.org>; Fri,  7 Oct 2022 06:33:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61B73418DF;
	Fri,  7 Oct 2022 06:33:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61B73418DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kODr60P3Qe7m; Fri,  7 Oct 2022 06:33:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95799417BE;
	Fri,  7 Oct 2022 06:33:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 95799417BE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ADE091BF2C8
 for <buildroot@lists.busybox.net>; Fri,  7 Oct 2022 06:33:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 78144417BE
 for <buildroot@lists.busybox.net>; Fri,  7 Oct 2022 06:33:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 78144417BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id grDFwGZrt91p for <buildroot@lists.busybox.net>;
 Fri,  7 Oct 2022 06:33:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56F7A41722
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 56F7A41722
 for <buildroot@buildroot.org>; Fri,  7 Oct 2022 06:33:25 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 924AFFF811
 for <buildroot@buildroot.org>; Fri,  7 Oct 2022 06:33:22 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Fri, 07 Oct 2022 06:33:22 -0000
Message-Id: <20221007063329.78144417BE@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1665124402; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=focYJ35Wwo6uo58Lf97UDkLuI7qsglMeLNVdNNRGjzs=;
 b=O4rbTP+c6s+OuOihFC4lsvgNOyJxXmRx7h4GKDyt5RR4sgkDYadKdag1UmiWGRO0yPaTDl
 odMTRxesOi75AViHWi1kOoAEQaaCjjyS94wKAdlCSxatKK63mScZYLxKDHhSqD16RN7wUm
 LkgjUcN+zJ52fNj2dOcOmPhIMn+Bu3HGzkcRdlOJ+JlgOlMy//903HUPlgsE6JPsq+iTMc
 srYxqcsMwaTdYFGNG6UOI5T6Rgu6Ppo0rPBrHAojfvNvd6eFidqFKyKTrlaU/TcBWSmM7y
 Mpjs941RSiNKv3TNqLq4dka/HqbRHuUu98JNpWB31tPU1wfpy0L4a9EoEbKiKg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=O4rbTP+c
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-10-06
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

Autobuild statistics for 2022-10-06
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  3  |  1  |  0  |  4  |
  2022.05.x  | 10  | 15  |  0  | 25  |
  2022.08.x  | 13  | 14  |  1  | 28  |
    master   | 179 | 381 |  2  | 562 |

Classification of failures by reason for master
-----------------------------------------------

glibc-2.36-44-g2628500f5dff... | 27
            igd2-for-linux-2.1 | 22
                 systemd-250.4 | 22
        host-sentry-cli-1.59.0 | 21
                      crun-1.5 | 17
              libarchive-3.6.1 | 16
                 sysvinit-2.99 | 15
        host-f2fs-tools-1.15.0 | 13
                host-go-1.19.1 | 13
            host-binutils-2.38 | 10
                 linux-5.17.15 | 10
                  autofs-5.1.8 | 9 
                elfutils-0.186 | 8 
package/acpica/acpica.mk:40... | 7 
                  gensio-2.5.5 | 6 
               libglib2-2.72.3 | 6 
            btrfs-progs-5.16.2 | 5 
                    lxc-4.0.12 | 5 
                   perl-5.34.1 | 5 
                     frr-8.3.1 | 4 
  gobject-introspection-1.72.0 | 4 
                   hdparm-9.63 | 4 
         host-gcc-final-11.3.0 | 4 
toolchain-external-codescap... | 4 
                 dash-0.5.11.5 | 3 
                gerbera-1.10.0 | 3 
             libgpg-error-1.45 | 3 
                       unknown | 3 
             acpica-legal-info | 2 
                    brltty-6.4 | 2 
casync-4ad9bcb94bc83ff36cfc... | 2 
              dieharder-3.31.1 | 2 
              dropbear-2022.82 | 2 
                     efivar-37 | 2 
fs/ubifs/ubifs.mk:49: /home... | 2 
         gobject-introspection | 2 
                       gsl-2.6 | 2 
host-gdb-arc-2020.09-releas... | 2 
host-pahole-73383b3a39afe86... | 2 
kvmtool-f77d646ba01d04be5aa... | 2 
                 libp11-0.4.12 | 2 
       linux-5.10.109-cip5-rt4 | 2 
package/acpica/acpica.mk:41... | 2 
ulog-0389d243352255f6182326... | 2 
                    yajl-2.1.0 | 2 
                acpitool-0.5.1 | 1 
afboot-stm32-3566acd582e553... | 1 
                 augeas-1.12.0 | 1 
                    bat-0.19.0 | 1 
bayer2rgb-neon-15feb1115b48... | 1 
                bitcoin-0.21.2 | 1 
                  boost-1.80.0 | 1 
                  botan-2.19.2 | 1 
              containerd-1.6.8 | 1 
dahdi-linux-5c840cf43838e06... | 1 
               ding-libs-0.6.2 | 1 
                 dmalloc-5.6.5 | 1 
docker-proxy-f6ccccb1c082a4... | 1 
              e2fsprogs-1.46.5 | 1 
        edk2-edk2-stable202102 | 1 
               fftw-quad-3.3.8 | 1 
                     file-5.41 | 1 
             flare-engine-1.12 | 1 
             fontconfig-2.13.1 | 1 
       freeradius-server-3.2.0 | 1 
fs/cpio/cpio.mk:117: /home/... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
                     gmp-6.2.1 | 1 
               gocryptfs-2.2.1 | 1 
google-breakpad-c85eb4a59b6... | 1 
                      grep-3.7 | 1 
                   grpc-1.49.1 | 1 
            host-binutils-2.39 | 1 
         host-gcc-final-10.4.0 | 1 
       host-gcc-initial-10.4.0 | 1 
               host-runc-1.1.4 | 1 
              host-rust-1.64.0 | 1 
            igh-ethercat-1.5.2 | 1 
                jemalloc-5.3.0 | 1 
                libcurl-7.84.0 | 1 
              libgcrypt-1.10.1 | 1 
                libgeos-3.11.0 | 1 
               libmdbx-0.11.11 | 1 
              libostree-2022.5 | 1 
                   libqb-2.0.6 | 1 
                  libsepol-3.3 | 1 
           linux-5.10.115-cip7 | 1 
      linux-5.10.145-cip17-rt7 | 1 
                   linux-tools | 1 
               lpc32xxcdl-2.11 | 1 
lshw-d76afbaaf40e953243da92... | 1 
        ltp-testsuite-20220930 | 1 
                      lzo-2.10 | 1 
make: *** wait: No child pr... | 1 
              memcached-1.6.16 | 1 
                  mender-3.3.0 | 1 
              mosquitto-2.0.15 | 1 
                     mtd-2.1.3 | 1 
         mxs-bootlets-10.12.01 | 1 
                  ndisc6-1.0.5 | 1 
            ocf-linux-20120127 | 1 
                 openssh-9.0p1 | 1 
   openvmtools-11.3.5-18557794 | 1 
          perl-net-ssleay-1.85 | 1 
                     php-8.1.9 | 1 
              procps-ng-3.3.17 | 1 
           python-numpy-1.21.2 | 1 
qt5base-2ffb7ad8a1079a0444b... | 1 
                 qt6base-6.3.2 | 1 
                    sdl-1.2.15 | 1 
              skalibs-2.10.0.3 | 1 
               tcf-agent-1.7.0 | 1 
                tealdeer-1.5.0 | 1 
uqmi-0a19b5b77140465c29e2af... | 1 
               valgrind-3.19.0 | 1 
                    volk-2.5.2 | 1 
                 wavemon-0.9.4 | 1 
                wtfutil-0.41.0 | 1 
x264-baee400fa9ced6f5481a72... | 1 
                  zabbix-5.4.9 | 1 
                    zeek-4.1.1 | 1 
                 zlib-ng-2.0.6 | 1 
                    zstd-1.5.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |       acpica-legal-info        | NOK | http://autobuild.buildroot.net/results/bfaf1f3838a7ae2c572a02155f68a6dd1c07196c |     
  mips64el   |       acpica-legal-info        | NOK | http://autobuild.buildroot.net/results/012c3c8f509b71c830366e31cb42bfedaabfd5e1 |     
   mips64    |         acpitool-0.5.1         | NOK | http://autobuild.buildroot.net/results/9a41cab40b211a3c6b554b71189b220eb6010e47 |     
    arm      | afboot-stm32-3566acd582e553... | NOK | http://autobuild.buildroot.net/results/ce93876f18030fc1d2337349e363f7b1905002ab |     
  riscv64    |         augeas-1.12.0          | NOK | http://autobuild.buildroot.net/results/4b18e749216bc6308b6266caa33ce3e2e2ca8f15 | ORPH
  sparc64    |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/1cf0418e02f44e0b8e1f2fa3ffd452f0c12cfd4e |     
   nios2     |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/4422d55fe870517a7b7d39c50d29890b8970591a |     
   mipsel    |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/9ed6db3ce3a87666a42c8b5cb86ee24f8dfa5ac5 |     
    mips     |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/8abe03cc0c154e2fc5e883be35bebd852164b190 |     
  sparc64    |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/e15e391668fd05e8b41a30b4bcbd6dab4ea6c26a |     
   nios2     |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/33b9433c918e77d2cfd28eee6b4ba91ad9e3c705 |     
   x86_64    |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/e198441f70ac759dde3a6eba3a5cc043731c71a5 |     
   mipsel    |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/8db57f3efc0594718ff80aa42fd5bae5897d9c58 |     
  sparc64    |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/682e234b091a5d9f35b24125dbe6881e63c6eec8 |     
    mips     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/be801748f3b81ca4e61fe52e0c149f70af7dcba8 |     
  aarch64    | bayer2rgb-neon-15feb1115b48... | NOK | http://autobuild.buildroot.net/results/8f081876931a29b72720b3326ff07b5041792145 |     
microblazeel |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/113b12c5e82d91ca3c9d6512ae5f32e29f021e2f |     
   arceb     |          boost-1.80.0          | NOK | http://autobuild.buildroot.net/results/295a169821997c7bf2666a432b13e048db2847d9 |     
powerpc64le  |          botan-2.19.2          | NOK | http://autobuild.buildroot.net/results/02109ec6ffbbc60823e7e5ed01fa514d5aa1da71 | ORPH
   mipsel    |           brltty-6.4           | NOK | http://autobuild.buildroot.net/results/129caaf40c913a15f1dcb64ff25d41ea32c0816a |     
  powerpc    |           brltty-6.4           | NOK | http://autobuild.buildroot.net/results/2d91a9ae678a21f0c2a0e7040af3d151fef465a6 |     
microblazeel |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/cdc7eca962956805fb07544a58a02d36d435ac73 | ORPH
   nios2     |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/fd9b0460e7cb2bbf12b17908a1be586561aa7f23 | ORPH
   s390x     |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/3edab9d49ab0496716cf88ee2674b364ea666f50 | ORPH
    i686     |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/a635158433a174b2bbd1d0d8f30175104a1441e5 | ORPH
   nios2     |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/0f3da0e37bc365a8bd302739a51829ce4d1b6e3e | ORPH
    i686     | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/5b69dc6ee12ae34f63db0689bffbfaef2c4e9032 |     
  mips64el   | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/87f13b3dd7999c4ff504409443ae36f7c159905e |     
powerpc64le  |        containerd-1.6.8        | NOK | http://autobuild.buildroot.net/results/9c25cf1e85e87338da40f7b9234dfcc81f8c30e6 |     
 aarch64_be  |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/5ea8a1076e3bae9f3b26f9c6e5d62603bd063136 |     
 microblaze  |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/291be26b79c15f28a9e738bc3e9422c1a6c19bf9 |     
   sh4aeb    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/c0699db007766e409f1401ce57e9785b8c5b1971 |     
  riscv64    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/5d05b2c884ce2b16a71284510251d32500193506 |     
   x86_64    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/9c60893f4ca18a5d36e8103ef64392688c3b82be |     
   armeb     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/bb5fa6d5919f4e056b05b776f62286d4bed57619 |     
   xtensa    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/55107d76cbb6f2ebdf7f4d82cd7768f98f549014 |     
   armeb     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/061b3e9ff2776dd639063c62ea11641f2c6fb0d1 |     
   xtensa    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/75247fdeb61f37ce145e29e1edbe6a6a4ad5c00c |     
  aarch64    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/57a8549eca11de84c6028021d907ab8942da501c |     
    or1k     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/950cf9a88b939859337fa75b139ad7afd675c364 |     
   mips64    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/fd8c348a5d75ddd3072669cd01cbdc452bb3e2cf |     
    arc      |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/94990c50f2f9d8237ec12bfa954f40eb3e349c9d |     
   x86_64    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/7cdcfd61c77eafb49fc84ca720a533ab524f3f10 |     
   sh4aeb    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/05863675d545fb8fc0340e01e1d1653acb6facde |     
powerpc64le  |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/d7de16ae5970b81374a4b658da8bb0271598d4b1 |     
    arc      |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/6daa408df6beb586cf19316c463f2c8fba138d95 |     
    arc      | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/0f084133619709b8220e46bc5364cc465b2bb98e |     
  sparc64    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/f63ad068952eca53cf0da7d1c6d0f784ce8f4f49 | ORPH
    mips     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/ad7a562abeb6946ca1bd74b86e7b4dbb35cfbd04 | ORPH
   x86_64    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/bc582e6eb6741a5c5bafd10a23c9953f25a8916e | ORPH
 microblaze  |        dieharder-3.31.1        | NOK | http://autobuild.buildroot.net/results/f037ad3945e41a4ad93cfb647fb3578f554cc96a |     
 microblaze  |        dieharder-3.31.1        | NOK | http://autobuild.buildroot.net/results/17fddde63589db9d7cb467c504c6a40cb37543bf |     
   arceb     |        ding-libs-0.6.2         | NOK | http://autobuild.buildroot.net/results/dad204ab9357406b284cd53ab410a48199e787cf |     
  powerpc    |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/77c2b2eb11f6e317f8c626dd844f419406c3680b | ORPH
   x86_64    | docker-proxy-f6ccccb1c082a4... | NOK | http://autobuild.buildroot.net/results/fd3d722a661b76cbec94d884440680fe09257f1e |     
  riscv64    |        dropbear-2022.82        | NOK | http://autobuild.buildroot.net/results/25aace9ebf60a0c9087f137fcb1cf0f1c27129e5 |     
  riscv64    |        dropbear-2022.82        | NOK | http://autobuild.buildroot.net/results/c3970e0fdb1c25c6519bb27c823c401b8e8b0c23 |     
    or1k     |        e2fsprogs-1.46.5        | NOK | http://autobuild.buildroot.net/results/1fbfa7c07fe71bd6dcf29e4a726e774dc2071272 | ORPH
    i686     |     edk2-edk2-stable202102     | NOK | http://autobuild.buildroot.net/results/3b87af804c7aa66bf955c51ba1468cdc360d54ad |     
  mips64el   |           efivar-37            | NOK | http://autobuild.buildroot.net/results/efc147212b08495f86aa8210f21278d661c008f4 |     
  aarch64    |           efivar-37            | NOK | http://autobuild.buildroot.net/results/7bef90817702e80f278394bf683c95e57475d7d6 |     
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/061005b94d5d44299bd970d4b9037b478f49402e | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/392e0a362105534a9ad1f6786ce12268e854e93e | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/66729456c555f8119f5ebd36d12c8fd3d7eccff7 | ORPH
   arceb     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/6c3387c9216b0d8b9850bdf280ff077a0dd4e321 | ORPH
    arc      |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/fe79f88438d5b2f3f370d63af78fbd132c052136 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/2b8088f8b9fe70ca7f8cffc21bfa654215d9822a | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/d8f6a0919142144a11bfb1143ac0f6c2d7043bad | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/1249756fb164b05d55fab700e6fc21858254ca87 | ORPH
 powerpc64   |        fftw-quad-3.3.8         | NOK | http://autobuild.buildroot.net/results/de6631a3ef18a010217f489c5a7af8a7060396c0 | ORPH
    arm      |           file-5.41            | NOK | http://autobuild.buildroot.net/results/7be7d3a62b413eb0039b99f33e259ad4e908af24 | ORPH
   mips64    |       flare-engine-1.12        | NOK | http://autobuild.buildroot.net/results/367686c5524708657e6711230ad0a4a2210d4a29 |     
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/cf10d3934a3e7e557f83cbe7e3637abaf0cf413e | ORPH
microblazeel |    freeradius-server-3.2.0     | NOK | http://autobuild.buildroot.net/results/f98fee83a9f9e1e9553036bed92d391c3afa5da6 |     
  mips64el   |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/c0b390b66776ab37a9eaebd5940ff8182631c8f5 |     
   xtensa    |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/77ca91268bbb4e03faf4b1e58749edf64120c18c |     
    arc      |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/cf4a2b87004476f0f2bea05ca87c8253f2693233 |     
   arceb     |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/40213e526976a1febb64db8613b0f4d6ed031a25 |     
powerpc64le  | fs/cpio/cpio.mk:117: /home/... | NOK | http://autobuild.buildroot.net/results/6cea99ec0153c425d2d840ae2a7d54e38d2e2105 |     
    arm      | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/5460241191798fccf876c2961345901ec3a53791 |     
 powerpc64   | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/d6b354ce5a6f9af13b95ed36b7efecc3822249ad |     
    i586     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/210c2732131f63e4d9edcefadf89ed35a93012da |     
powerpc64le  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/fc3e072fa8fad694cc6006bd5ecc952b19aaf7be |     
   xtensa    | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/7b8f9d5c9de85a8fb90100267077ce499f1d0b4d |     
    i686     |          gensio-2.5.5          | NOK | http://autobuild.buildroot.net/results/cbedddc2147c0e4cd1243cb36ae9fbe706503254 |     
 microblaze  |          gensio-2.5.5          | NOK | http://autobuild.buildroot.net/results/2c02b8f06eb45c315711c03c364bae0464a27993 |     
   x86_64    |          gensio-2.5.5          | NOK | http://autobuild.buildroot.net/results/e7f1eb992fc9461f338b3ee9e4144ee083c99ca4 |     
   x86_64    |          gensio-2.5.5          | NOK | http://autobuild.buildroot.net/results/43f6b232cf5e3cf479b8bc83919b85ae460f3e35 |     
    arc      |          gensio-2.5.5          | NOK | http://autobuild.buildroot.net/results/c0c11fc6409fd602b5f48491ececbaa8d7090316 |     
   s390x     |          gensio-2.5.5          | NOK | http://autobuild.buildroot.net/results/a09e901365dc3affc69e57afbb202c058c288010 |     
microblazeel |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/d162b4586c76383eab2b7b5ba6b01993ac39daaa |     
    arc      |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/861097e395bc6c36d1727560161bc33eca795e1b |     
 microblaze  |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/da921a379427c3e2713e32881c32fe20964a6772 |     
microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/b58dbc39b54985d4e9facdacb2d6aabc0019fe84 |     
   x86_64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/bf2aa800295da24da65ded5d2fb4a4dd4d8f80b0 |     
 microblaze  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/a8fbd019e1f7c4f12eda24ed886963514e86a350 |     
   mipsel    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/cc824716d0a5ca70dca49865201bd9c01196acf3 |     
   x86_64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/92f5f1436cf6d188d6b599a7b6983018d2fe517e |     
   x86_64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/8de9fc43ee33658b5af91817925fc700259812d5 |     
microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/790b699e704d03382d0fcacbf8d35e61384a24ea |     
   sh4aeb    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/e7d472691e7126ce523304f4b647c6fb79cb8ea9 |     
   sh4aeb    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/e52b0159e001585e76540515363fd31b00789021 |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/f232b398519c6e8a79b316efc1c8af88fc762b7f |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/859799663c9fdc903590fd02031efdda6e50f100 |     
microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/dfd13a675eefc32ec799b6cd6a90e07df8dc4518 |     
microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/f1fe26adeb67bb9bcaf3553434a688e3461262ae |     
    mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/090b3febb43aa49644960920078010acf2191b3f |     
 microblaze  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/ad0f0c6b689e1b32818a1f4a70227b45e3b8d67f |     
 microblaze  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/a779bf694f31b4e7ee0a9a93881cd1b22f42a2b6 |     
   sh4eb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/0eca37fc9594e7cc7e60ad7766e034b472f1fab6 |     
   sh4aeb    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/2713e3144daaf35de742e44cb45170d9096e36a7 |     
    mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/b40cecaeaf270eb7475470e7dac5c9f359417ce8 |     
microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/8a420d38fb14c61268b32f9a44eed3bcf07efb5c |     
 powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/643c134f89bdea046d70d2d126d92265f7bb6570 |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/2aac745b4cdd4ed3699cba42cf08d3e86dc5b667 |     
    sh4      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/b169c1af5428af3b38e2e89042fcdb45d03e3ed6 |     
   sh4eb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/917f33b0e6cde2a5b96fd3aa96704aa356fe924f |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/6fd9c763558da852819159b0fab8653643ee66b9 |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/762cdb2231fd9b56b64fdf3d6d12b2a43f3da6fc |     
 microblaze  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/997cd7fd5ce1b968c7ffb3f3c56d71ec421d652a |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/90c49b8a0636cbbadea25a00d55b0d29a939fd01 | ORPH
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/790d9be7d0225f9a907bd16f63e56e29161b3802 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/b8b5a1e55116cfee6e84973721650241cb41d24f |     
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/70b2ed988bd83789da6359688f08713588faaf34 | ORPH
powerpc64le  |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/edc97ebd8b207e576ff78766516e17d36c7cdd19 | ORPH
 powerpc64   |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/5836effc5b63e52da2ac67f62e3ae0dddb0a96fe | ORPH
   nios2     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/d41eb416660dc61ba8d80aae03f648775264b8da | ORPH
    i686     |        gocryptfs-2.2.1         | NOK | http://autobuild.buildroot.net/results/53039497768789f9a142a3853acfb0bbdc84d67f |     
    i686     | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/78737d3c66ab05a2a80398c6b675e339d0a7408c |     
  powerpc    |            grep-3.7            | NOK | http://autobuild.buildroot.net/results/3c381aa2a615d25343089ddd541f0b8227cc5695 |     
    mips     |          grpc-1.49.1           | NOK | http://autobuild.buildroot.net/results/4cd084803cdf2b6470b15e34708094308250d857 |     
  powerpc    |            gsl-2.6             | NOK | http://autobuild.buildroot.net/results/63edaa4524fa30d8dad3beeb0518a47999436d3f | ORPH
  powerpc    |            gsl-2.6             | NOK | http://autobuild.buildroot.net/results/93bb95f1221af615563675be46b681b325a6d721 | ORPH
   s390x     |          hdparm-9.63           | NOK | http://autobuild.buildroot.net/results/00550524dc9c85054a32cd5a52a54d746d6c9288 |     
   armeb     |          hdparm-9.63           | NOK | http://autobuild.buildroot.net/results/733a67f3f749771d687e598f117d29a5fc491d77 |     
   x86_64    |          hdparm-9.63           | NOK | http://autobuild.buildroot.net/results/48c5dcda9a02f2ad7a2ba34386441dde3fbdf4f8 |     
    or1k     |          hdparm-9.63           | NOK | http://autobuild.buildroot.net/results/6528b8b59ea9e3a9785a143fa10e3b6d3a238730 |     
   sh4aeb    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/9e09150d5baa835ec18ef69b21f1d351c0ffdbb8 |     
   mipsel    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/b99d4b8467309c3449028a6aed3b8f661f1ac3ef |     
   armeb     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/a0b395176f76aa6f62648db02e8990d5a6191228 |     
    arm      |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/2a9c9f323ce8e2d1245f09d7c79f9ad940163ff0 |     
  powerpc    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/22cd0559da19ff9ace77b4519405ea00d8a292d2 |     
   sparc     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/acd5f21c70874528738a54552dab06c1baf8450a |     
    arm      |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/77987a06658f760e649a676ef57d09d5b41af213 |     
 microblaze  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/29c9722fb92ce084c2f3fa2a6586eb66a90f0763 |     
   mips64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/fe75be51650d373a32cb0f5c661abec9fa926a74 |     
 microblaze  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/dffe808722602f99cabf84ee9a128acf3dec33db |     
   mipsel    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/0c7594b382656519c90ca93044cfa49344e41979 |     
   armeb     |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/5e5ad45a330de2d58093b809ba0f7f543797af4c |     
   arceb     |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/6f2ca63f4a92f63ddd75584b047e19fa6393bbc1 |     
  riscv32    |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/584e36561f64870b6a982e49e5069c207a96c773 |     
    arc      |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/b77ee3baad939d88542f5fbb68c1aa4c59d48043 |     
powerpc64le  |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/ba0e8be5e1f5583faaab2c003be8cb5b37a11d04 |     
  powerpc    |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/e1fa1e0bb91a0d84859888bcfe3252e60c46d519 |     
    arm      |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/758f1542331df4e47aff2d8b0b54b9f43899df3d |     
 microblaze  |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/19ff25a325564acaeaacb333af91f881b394e757 |     
 microblaze  |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/2f3e9815f9ee6f4005656b62ca471ed41f0a5a5d |     
 powerpc64   |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/175dc19dd44c9419343bb356ba68b7c86da15e4e |     
  sparc64    |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/407723771ec44b2429841ade8bb0f4368415c2b5 |     
   mips64    |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/25cd15c62710e01d39da8092f27b7217b1dff8a5 |     
microblazeel |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/9ce59a6d1daa08d309c3a231d0e081c21a1f9ef2 |     
 microblaze  |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/898ddab7d69180bb35b019446508e807681499ce |     
   s390x     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/edef72c79de37407167f6d04ef01383693476779 |     
microblazeel |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/422ecdf1fb0e7c70c45ad6fed3000b4f5210d7fb |     
   armeb     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/c332b8f815ec46860d34765f3fe2a2eccd6cffd2 |     
   s390x     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/d8d8ded19497984dfe776ecc1ff125c5ffae0183 |     
    arc      |    host-gcc-initial-10.4.0     | NOK | http://autobuild.buildroot.net/results/6f10e342881b4a11ac3a462eb79ea58de5e06865 |     
    arc      | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/b9a581cf2c5177e445a3f13b37f1a2f15dcfcdde | ORPH
   arceb     | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/a5e6a7ee211ea1b3c46f659504959624c941e5ed | ORPH
    i686     |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/e511041b80921ff733079413efaff30be4bc2d9d |     
  aarch64    |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/bbefb0aa6594614f8ddd1728de7ae5d1e8137a64 |     
  mips64el   |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/7692411f77132c140678c45da71cad6b40180de5 |     
   mips64    |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/113be27680b587fe6750328abb8797d118846ff5 |     
    i686     |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/0b7c3530097e41edb995775d54087c8d5494cfb9 |     
  mips64el   |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/117a6a721e00bc32942b5bcb10653ceea6ea5ab6 |     
   mips64    |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/67c8e472bcecaaf3ca4fc15ff0824e06d9885198 |     
    i686     |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/f3ad2f1b0d9a6f0648c86dfd8f71a206a349374c |     
  mips64el   |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/9206ea5c9ce4a4cad907dde671a581156f86c584 |     
   mips64    |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/0fec719ec8b283da2bbd1134701bcb502c1bddd1 |     
powerpc64le  |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/3473a56ef4fba1b0f4be9a08581f9e7cb5b3d054 |     
   mips64    |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/1c2af3eda3537c6f674e76d2f6cb31c876603543 |     
  mips64el   |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/56ba71f7e7bc4b294997db712081c2522695e834 |     
    i486     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/7e15e65ac4dff2b8f59bb715b17db8c2b4cf138a |     
  mips64el   | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/2a86dce7741d28fda6956652bdbf0ec105b8a9f3 |     
    arm      |        host-runc-1.1.4         | NOK | http://autobuild.buildroot.net/results/e38bcf4dd2bbb4234d78ae4f8a158d89358ea753 |     
   armeb     |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/6a09d5dac9291b5218db7c1bb63e94b342c7e427 |     
   sh4aeb    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/226b8e8e6c28312851fa19bfd0d4aeadce1fe368 |     
microblazeel |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/4157cb724b48f420e52cfc98fde52be59ed8d096 |     
   x86_64    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/90840716914760b9bef6e70f02d0997f5fff8e4e |     
   x86_64    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/bb52f69115f75c3f26ef2cbeeb05811fb5ebd927 |     
   xtensa    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/553ab800b0f9c0e155a7e6dd445d217d3a9b2d8f |     
   sh4aeb    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/f3b247d7b6d093b45168613eb40b0c3fc26e8f02 |     
   sparc     |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/e6424097dfd79b3b72552ae0709aa255cad82653 |     
  riscv32    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/c9a1d41b5e151687b5d6579b7b991f31ae095aba |     
   sparc     |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/5db0c228495b12e243ef17662e21739ea4a7d2c3 |     
microblazeel |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/65671334f9d98871a58bf136d5c9fc08aa4fb034 |     
    sh4a     |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/e1cf5883ae7247788cb5d0d7fd8d5f3215d44df6 |     
    mips     |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/105a313796c8226c84ac2942822abd0513c84ca3 |     
 aarch64_be  |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/fee3501165d11b58c86dab56c7da63dada842bf8 |     
   sparc     |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/98a3ea40f58b6c300a831a9d46ccbd794b60eaac |     
microblazeel |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/0cf7d6bace2431d416980040541b2f7d08239c43 |     
   arceb     |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/7d650af6285e2a5b9234a3efd0b00f7396dfd3cf |     
   sh4aeb    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/61e79327e461e9b1bd86e9147d4fbf63f56ed718 |     
  sparc64    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/e95fa301631aa497b17c4d442b9432b2b0249568 |     
   sparc     |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/a9aa72b5d4ef9adf784a07451c510808f71d112e |     
  sparc64    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/048a95dd5c053270b81282ef1881c641a16ccfdb |     
   arceb     |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/0c6e5c309096a89654d8dd3f3626729260f3d384 |     
powerpc64le  |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/9beaaf3990be017255ba33a0f511c20c3bb9c9fd |     
powerpc64le  |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/1bcbc4b19744f26316a421701c2b6c097c7447f5 |     
    mips     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/2bee3e57965bd3b6dcf948512f170d411cc4c0b1 |     
powerpc64le  |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/a808bbf2f7df69b3e760d9e019cf068bff88a45f |     
   s390x     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/f9c7f84f53bdb7aa19b5b4f51f3eaf35939d57ce |     
   nios2     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/34d8ecc798686544ccb7c7d8b1a0b5757cea30ea |     
  mips64el   |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/6c8115a9956aaa7a1a955a9b3f8b3f0c4801d917 |     
   mips64    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/1e33e4c1c447dfda3b9fdc1ede39f182d7578bbb |     
  mips64el   |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/8a586057e9e23e7be16450797ab06aa30c8484dc |     
   sparc     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/9a35728af9e17686813e2fe5465202159c104b2a |     
powerpc64le  |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/fcc28f05f1850f1c0b83e4799736679f6b46da0c |     
  powerpc    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/1402ab85a5dbd5c73ccaf22e5456e71719e401ac |     
    or1k     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/11d227c39d66a33d16529d5ebef8838fbfb0ea7f |     
    arm      |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/7b05d76a715f111d3919874cbde99affef4db772 |     
   mipsel    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/b4b10e1cc120d1669890be52f6dd91b966380097 |     
    or1k     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/1bb9a280e756c4c356f93f0507d7de22f70c6f22 |     
 microblaze  |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/dda95b3d0ef32795fa834d21d3cc52923d23e384 |     
microblazeel |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/80581c9621adc2e2f3c52190e1429b9e95429991 |     
    mips     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/daca821110ba55797a904d037df31db03adadde4 |     
microblazeel |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/9aac03c94b2ba7063e1f2fbd67d169b236a11370 |     
  mips64el   |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/01878f7fc0c016b719c5caee5d62e6e2f422cd45 |     
 microblaze  |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/0280a7ede9c2ee624dd400d723680362bfeca659 |     
   sparc     |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/d80aaf72d1e75f2ca94dbaf7df4acf4892d2eb43 |     
    sh4a     |         jemalloc-5.3.0         | NOK | http://autobuild.buildroot.net/results/d3e60918726803351e2d1042e3f1acb122e18a92 |     
   x86_64    | kvmtool-f77d646ba01d04be5aa... | NOK | http://autobuild.buildroot.net/results/307b34df86ae28eabd000c1a9f5eac94f0761c26 |     
    i686     | kvmtool-f77d646ba01d04be5aa... | NOK | http://autobuild.buildroot.net/results/ce72325cb1901d712ea11d6406a314ddc722de05 |     
    or1k     |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/75563649280e90811d34bbb147241292f62a018f |     
  sparc64    |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/2c4aa106947741da681f73475c1ea5420edb888d |     
  mips64el   |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/2093918db19ce5c32d3b8b87353b28000aa07b52 |     
 microblaze  |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/1caa7e45f2c3c7dcfaf841bf7e77d9d4448634eb |     
    i686     |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/56e3c1a102369693b0e4874653276400e581aa13 |     
  mips64el   |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/46a52bfaddc57df37d5726b439a11cd28f64677b |     
    arm      |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/095bc31a3629e1c4b5ce1fb9e7f2f2fa69cb82d8 |     
   nios2     |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/1e8daecd24a0690fa37cd73840a5299325338dfa |     
    or1k     |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/b6e3115c9d250c72fd6353cf4bf5a96643c1a9d9 |     
microblazeel |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/de8e2a1612e851155f6c9f418529b3dfb0947265 |     
  sparc64    |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/5c24b014e434a666ee7fb66ef10f6ce93bd5fea3 |     
    or1k     |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/a430e2a74458c638cf7671da33fa8b0f48ceade1 |     
   nios2     |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/1e81e274b29c675c41bef5500d0e7a19326d6700 |     
microblazeel |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/af7444cefafc9c7f060709e065ec485aa7ea2f43 |     
  sparc64    |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/aea7f9bc4a505eff78938446e48e0334a36595d2 |     
    or1k     |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/90dccd352d865dfdf1b9b8ea2aeb734d6677d602 |     
  riscv64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/6b48495df83e51454b0164bc0909f9526ae344ee |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/8adf9cf9c2ad970a968f674e40a7df30d8d538b7 | ORPH
    or1k     |         libgeos-3.11.0         | NOK | http://autobuild.buildroot.net/results/596852ad9c7c0376707184ad501fd8e3c51c3fd3 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/69ab85d1acea51852543458cbb638a787612f44f |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/b97dba24b34c3e077a64ba2f8bdfeb4c122f67b3 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/b529717f62f405b51de8100b7a5642a00d4a3261 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/e827ff7a96b1b1fad8fca7d05b61bf1d195c878c |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/f834e6b8dbec8b7b062f863a9be9b6789f930d16 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/9e373c251650e9f0906e6962ee0d59c62d918aa9 |     
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/53223e787c99e2b61d809c03037fd8414cca6b3d | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/66a002853d3fbb9c04f4ab60d156dbf8cb0d84cc | ORPH
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/f35741f19022d5baf0c97cab4fc73d9832457f84 | ORPH
 microblaze  |        libmdbx-0.11.11         | NOK | http://autobuild.buildroot.net/results/17219033c5dda2d63f2078f7eed4dd84d29c82d3 |     
   nios2     |        libostree-2022.5        | NOK | http://autobuild.buildroot.net/results/409de62450d59e523ee591bb9ffda31dae28e7dc |     
   sparc     |         libp11-0.4.12          | NOK | http://autobuild.buildroot.net/results/c35e0f01651a0970f923cb9408a6e64a2b8b0610 | ORPH
    arc      |         libp11-0.4.12          | NOK | http://autobuild.buildroot.net/results/e16d6da2f70b306baa289062f266ee41ddfeafa0 | ORPH
  riscv64    |          libqb-2.0.6           | NOK | http://autobuild.buildroot.net/results/27bdcdbedfe12ea5386a1d2740687af340c6fd57 |     
   mips64    |          libsepol-3.3          | NOK | http://autobuild.buildroot.net/results/75f3e57025e11e93bf99bc548846307b545d0054 |     
 microblaze  |    linux-5.10.109-cip5-rt4     | NOK | http://autobuild.buildroot.net/results/6dfe573de5c42abe1ad5ba5cd1e9107a0c2d437e | ORPH
 microblaze  |    linux-5.10.109-cip5-rt4     | NOK | http://autobuild.buildroot.net/results/7e642a8cc703f8a61f19b82b4c9a0bd985feab50 | ORPH
   armeb     |      linux-5.10.115-cip7       | NOK | http://autobuild.buildroot.net/results/7559f3fcb316808e146bb4bf639df74ebe29288b | ORPH
    arc      |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/9c87471758d7fe71be305a91cf599cf1f28898ca | ORPH
   mipsel    |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/f7945eee71d0e6004bfaadc722a04d18b034e3e4 | ORPH
   mips64    |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/46bfa768268a1fa69803e0e322a89b4a75187512 | ORPH
  mips64el   |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/931af925a916a11a6b45d43c362bdf916724318d | ORPH
   nios2     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/bdb2e684b3460840fc0227e4032e1abd8ee2eb61 | ORPH
   s390x     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/6fa51623e8b00b25dc98cf40be3586f51cec8e49 | ORPH
  mips64el   |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/9bcd33bcf3caa0e16e1895df3f85be7c8e236a2d | ORPH
   s390x     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/2589d27dce810cfa59f6446ce63c0b5ff8044e85 | ORPH
    arc      |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/9df1a946bd32f7324d7922da721b60a052373b8e | ORPH
    mips     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/571c050861045654c3b6db12dfba40ebf8a32264 | ORPH
    mips     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/d446ef5edb2f31991384dc800002528fc498a09c | ORPH
   mipsel    |          linux-tools           | NOK | http://autobuild.buildroot.net/results/56b2ad62bae7b90b1c68da1ad671b0fd8f08c0aa | ORPH
   armeb     |        lpc32xxcdl-2.11         | NOK | http://autobuild.buildroot.net/results/7e8f86eada15e7f191fc557e4be4de048a120dcd | ORPH
   arceb     | lshw-d76afbaaf40e953243da92... | NOK | http://autobuild.buildroot.net/results/a4ac79a786fb12242c449b21ed7bcab353e9ca13 | ORPH
   x86_64    |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/bdba3d1cf9e61cd6117b833a6f0e4c52822bc3d4 |     
   s390x     |           lxc-4.0.12           | NOK | http://autobuild.buildroot.net/results/1e231c50de9d785a423b55c5fe3eaffcadb95e3a |     
  sparc64    |           lxc-4.0.12           | NOK | http://autobuild.buildroot.net/results/d4c95f0e0be6da6ea34e2248f116e53c8489a6e0 |     
   nios2     |           lxc-4.0.12           | NOK | http://autobuild.buildroot.net/results/9071f63b5bc1be5ad473b74383ff397448e2a411 |     
   nios2     |           lxc-4.0.12           | NOK | http://autobuild.buildroot.net/results/b60f7f5a2e7a3716a1389bbfef1f37076d9bc781 |     
    i686     |           lxc-4.0.12           | NOK | http://autobuild.buildroot.net/results/1a56bc1a61891c2054498a04a2cf1c0174848575 |     
  riscv64    |            lzo-2.10            | NOK | http://autobuild.buildroot.net/results/9c8add7ca5114a8fe89e3bdef91aacdf3176415b | ORPH
 aarch64_be  | make: *** wait: No child pr... | NOK | http://autobuild.buildroot.net/results/6749dd56808bed00e7f00ae18324517adc2f45f9 |     
   arceb     |        memcached-1.6.16        | NOK | http://autobuild.buildroot.net/results/05433a63a4804e16340eb22c5b4ddc61fb430b7b | ORPH
  aarch64    |          mender-3.3.0          | NOK | http://autobuild.buildroot.net/results/bf42c8a3cbc7b332047b9a79e4267f0e2885bf91 |     
    or1k     |        mosquitto-2.0.15        | NOK | http://autobuild.buildroot.net/results/9be953d7b93bf9137b8ba223ec2242ca1152bf4a |     
  sparc64    |           mtd-2.1.3            | NOK | http://autobuild.buildroot.net/results/647abece6b60d53d71b6f9acd0ff2dd84b3128d9 |     
    arm      |     mxs-bootlets-10.12.01      | NOK | http://autobuild.buildroot.net/results/2cbe1423eaafa3b57b2a3e5131b6759c22ec01bc | ORPH
    arm      |          ndisc6-1.0.5          | NOK | http://autobuild.buildroot.net/results/a810b1f2a1d5f37183eac6c57ebee6dacd6d7ce2 | ORPH
   armeb     |       ocf-linux-20120127       | NOK | http://autobuild.buildroot.net/results/ea74d4dbaaf1c1ce07e1e5f905ed490a12ff2c99 | ORPH
  sparc64    |         openssh-9.0p1          | NOK | http://autobuild.buildroot.net/results/2123f1c9123e4ed63f71de206c0945685c0fa00a | ORPH
   x86_64    |  openvmtools-11.3.5-18557794   | NOK | http://autobuild.buildroot.net/results/dcd4fce40a03edcfe981ec79e15972dfe5ea74b1 |     
    m68k     | package/acpica/acpica.mk:40... | NOK | http://autobuild.buildroot.net/results/e7a126e09d1b73a13bb066449df83a7d087bceee |     
   arceb     | package/acpica/acpica.mk:40... | NOK | http://autobuild.buildroot.net/results/6fe97716418ffd844958c58355115e70de31fa0d |     
   mipsel    | package/acpica/acpica.mk:40... | NOK | http://autobuild.buildroot.net/results/1ba8ea24aa3410a295264e2de28a7dd7d962e641 |     
   arceb     | package/acpica/acpica.mk:40... | NOK | http://autobuild.buildroot.net/results/d8b853e740c0533aa620d0004602367f8e345a81 |     
 microblaze  | package/acpica/acpica.mk:40... | NOK | http://autobuild.buildroot.net/results/408850c953fab13ebad0b75697599af442128921 |     
   sparc     | package/acpica/acpica.mk:40... | NOK | http://autobuild.buildroot.net/results/db35f52e8af5abdec868082186a51250783a0b60 |     
  mips64el   | package/acpica/acpica.mk:40... | NOK | http://autobuild.buildroot.net/results/b74b5651472fe8d43acb3b775044de641234c18c |     
    i486     | package/acpica/acpica.mk:41... | NOK | http://autobuild.buildroot.net/results/904b893bbb2b4ab85b4408e36cbebf2b6c666550 |     
  aarch64    | package/acpica/acpica.mk:41... | NOK | http://autobuild.buildroot.net/results/b322981c4acdade1eb61f9d9656dacc7ca697f97 |     
   arceb     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/49dd3e37a153f1b1fb9364e6f593e3701e712719 |     
    or1k     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/43120d54bd8ca00f31052e4e24ee001552be099a |     
   mipsel    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/55ac24e70415bb06615638e385b47312f094ce95 |     
   mipsel    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/115c897ba2d1196a30262a5ac55e2ee0143368f6 |     
  mips64el   |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/e880521252190411294a75eac996c0793469299e |     
   arceb     |      perl-net-ssleay-1.85      | NOK | http://autobuild.buildroot.net/results/b74159d225f807e5cf6b41656b40f86b0a77efc5 |     
    arm      |           php-8.1.9            | NOK | http://autobuild.buildroot.net/results/279477414d20ffb78ff46c08d89474dc95092436 |     
 aarch64_be  |        procps-ng-3.3.17        | NOK | http://autobuild.buildroot.net/results/07f424b16006dd1bee89a559de71abb573e6ab03 | ORPH
   armeb     |      python-numpy-1.21.2       | NOK | http://autobuild.buildroot.net/results/97f4f7b4f3c82e708baf09043a0a328598e67114 |     
powerpc64le  | qt5base-2ffb7ad8a1079a0444b... | NOK | http://autobuild.buildroot.net/results/d246fc79a7e48a86669ce55cb864de118d736d81 |     
powerpc64le  |         qt6base-6.3.2          | NOK | http://autobuild.buildroot.net/results/a9ad1945724d450f8522eddf31fb79de0a78e71c |     
   sh4aeb    |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/bf612d5075f1fa9f19f32506c397533fd10858ec | ORPH
    or1k     |        skalibs-2.10.0.3        | NOK | http://autobuild.buildroot.net/results/7ec7b580a551bf3812ea3784cdea776324a451cc |     
   nios2     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/0990caab3e6bb3fbc9f711a39b632ea08d21d88e |     
 aarch64_be  |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/ef14c5f3f1101d07f7984573b92fbf3baea36047 |     
    mips     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/25b34ebaaa87603b8b4f62ea6a1df4fb6b11fc17 |     
  sparc64    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/2a01bf99baed20629758bcddd3c09d2cc6685e19 |     
 aarch64_be  |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/8ee6ff908e9447baec0692d1a3eef8bef010887d |     
    i686     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/f071e7f0cf954d4e237d8b5fb7e91768e653cee1 |     
   arceb     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/413baab86c327550bc8ac7e3c2cb4581fb61a58b |     
  sparc64    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/9e40df29b51cac353abcc101ffb0fed15a8604d9 |     
  sparc64    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/16af8322cbb8bb1bb6317f630d6c0676f814782f |     
 aarch64_be  |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/9f65e71254c94446648d94a03c66e69c341e035c |     
   mipsel    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/6b131b51f2b2d0f7503a3413e54c88700bfd3967 |     
 aarch64_be  |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/291c3dda493f4a1fd67e1dc950fa336d5ec3bfaf |     
   nios2     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/c38f2f3271568538795cd80d904c52a02ec6917e |     
   s390x     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/5b66073d9c8be56b9ec20365a3b7e82756c4a416 |     
    i686     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/fb413bf075812e093a9eb0da55052c6fc13ba0c1 |     
    sh4      |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/bd649711c086a1d589839da2e0c7d5acac550e2e |     
  aarch64    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/414f02cab8ff85eeef0f0364409a0296bfd3b139 |     
    i686     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/7a266111e8e00ebfd9387dfed7e06dd212dfc8bb |     
  mips64el   |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/5e9c7178ba1a7b10e2f756d8c1e7d517b91456e3 |     
   s390x     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/088c2682f15bb8107b45e672e371b1092a512e44 |     
  sparc64    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/f92fa10544e8dd585a1612968fcfad8eae654620 |     
  sparc64    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/75428639d411ddc3f0b2c1dedd425f96fb6c13e8 |     
   armeb     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/3d52d3dcbad556ec23de5ee16450c402c008b93e | ORPH
 aarch64_be  |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/938093570e8def9f757653f55551afae4b185fae | ORPH
   s390x     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/01ac60d7b95ba9ee85cd2688c96002176218d847 | ORPH
microblazeel |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/535a8b2d215471fca8577362ae09d2f0f609c672 | ORPH
  sparc64    |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/7451d97ec154aff7ee21501551b70cbfbeeb4e9f | ORPH
  riscv64    |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/00535c083fd12adaea2420b6e2039bc16bdc7551 | ORPH
   armeb     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/be1810b1186b0ac9cf8ce0f8e4674a4d2af18818 | ORPH
  aarch64    |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/05645f2eaf1299b9c7d31d5ce6439e4a916e9106 | ORPH
   nios2     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/ee5aa81a5728f5e0b5c60c8fe8579a3e7344bb31 | ORPH
   x86_64    |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/7980787465e4e1c4b0710cc4f8aea4aeb28d9541 | ORPH
  aarch64    |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/b94fd15b097a0c7be5edbc5ce06ac4835cefb2f3 | ORPH
    sh4      |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/f32bc2d2240d2268d4514c940aa2a5d4fd25db22 | ORPH
    i686     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/ffcf5180565245ee50b4a90cb3cf71d9fee55d10 | ORPH
   nios2     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/a205e87534d7d6b6b9e15e48744971268183011a | ORPH
   armeb     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/a915519b5fbb24190b0c1b444709d618529a32ee | ORPH
microblazeel |        tcf-agent-1.7.0         | NOK | http://autobuild.buildroot.net/results/9ae779e7d7a8c403e9f79d44a161aaec5b2125ef |     
 powerpc64   |         tealdeer-1.5.0         | NOK | http://autobuild.buildroot.net/results/d4d5404b87e762c9fb8af274c0b9ac629d51875d |     
   mipsel    | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/04f8d1f94aabc49e148125cd9d61074a87c94fd1 | ORPH
   mips64    | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/b3a6892865051f8f39b2ab897a0818c3c463fd43 | ORPH
   mipsel    | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/6aeb323fca80e05bf0392cadcc22b9c0cfa14f16 | ORPH
  mips64el   | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/604501e99095139bc40553b8e9410424a4e9f45a | ORPH
   xtensa    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/7f382507c4ec2b2b51991ecfdbde9a01689cc99f |     
   s390x     | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/846a113e9194ad71f6e90c3fba7c2ed5cec409b9 |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/24328d4e78807fa26e0e047258aacd6fd6fb52cf |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/95d6fcad67e0475f05427803486b4e7cb1466f0f |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/6c012d7862308168f00fdf00f966059627aa57d3 |     
    i686     | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/93badc1b50fd20e2c916cdcfc495b662215fe9a9 | ORPH
  powerpc    |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/04ad2a0e2734866bb5399543a0801645f983336a | ORPH
  powerpc    |           volk-2.5.2           | NOK | http://autobuild.buildroot.net/results/e17bb5e205963c61ee129104f7a1785f7303e363 |     
   mipsel    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/8e35d3294a43b9de365f03efbea25dcaeb6bf13b | ORPH
powerpc64le  |         wtfutil-0.41.0         | NOK | http://autobuild.buildroot.net/results/5964284a39c62c2de6bb836d167751c5ff8f8535 |     
    i486     | x264-baee400fa9ced6f5481a72... | NOK | http://autobuild.buildroot.net/results/fde6f68ebc152dce01479ecbfbbf7698fb061b60 |     
  riscv64    |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/f809986ff92b0fe84e697bb41d327f4bc2ef2112 | ORPH
  riscv64    |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/82ac95352c1b01b7effa153dbcdaa88668457db9 | ORPH
   nios2     |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/da86dbd0b2ebd6cb748f9ae2e4fcefa63edf51a1 |     
   sparc     |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/bd6da2d4125e3cb13ff4520581e42178112ca7cb |     
  riscv64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/0138021ad813213f904997afbd94cdd04b7a05d0 | ORPH
microblazeel |           zstd-1.5.2           | NOK | http://autobuild.buildroot.net/results/efa7d378f0721cf6d717ada9176729e8293986bd |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

                  exempi-2.6.1 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/64d69fa1ffe0afc959045ac52202784153b20b3c |     


Classification of failures by reason for 2022.05.x
--------------------------------------------------

                       unknown | 3 
            igd2-for-linux-2.1 | 2 
                 pixman-0.40.0 | 2 
/home/buildroot/autobuild/i... | 1 
dahdi-linux-5c840cf43838e06... | 1 
glibc-2.35-134-gb6aade18a7e... | 1 
          host-gcc-final-9.4.0 | 1 
host-pahole-73383b3a39afe86... | 1 
libcamera-8a845ab078c3fe12a... | 1 
               libglib2-2.70.4 | 1 
                 wavemon-0.9.4 | 1 


Detail of failures for 2022.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/176838b6c7a74f2d82d14679499bba8eb37268cd |     
   sh4eb     | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/7b8dfe4c45c669689f8d422029b6449e3b8cdbc8 |     
  powerpc    | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/239736e92d7ed97a4fd058c28985b38cef0e9a11 |     
    arm      |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/526545e32c0b2ad30a75d9495f8698d0bf2f097e |     
   armeb     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/d9eb4446ae5c9c6b425bc3ef15de746f3f0469b6 |     
    i686     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/03ef95066476e821a7c416f8962716da7c29bdf3 |     
  powerpc    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/d6bd1fdbc311658f05e1b37a1cac0249c93acecb |     
  riscv32    | libcamera-8a845ab078c3fe12a... | NOK | http://autobuild.buildroot.net/results/03f4dd4771e8f3c7b54f202b06f987578bf13167 |     
    arc      |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/9bf17c48561d4f10d42c30d7f2416798b26eeea3 |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/5a82f6ccf1e04a98e3a12949344010bbd9fe9166 |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/534d530fd8e19a759435584dfcaf42c1e4e7812c |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/e35440bcde84f817bd603ee1d2660768301729ab |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/11a603310146f4b808f1f52d700c0b1f4dc98461 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/3e5ad95e43a9fa2e24d9423e8f08ad97443356f1 |     
    or1k     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/661495d8b934de39cf720b326ff8ba29e3f933e6 | ORPH


Classification of failures by reason for 2022.08.x
--------------------------------------------------

              containerd-1.6.6 | 2 
                     frr-8.2.2 | 2 
            igd2-for-linux-2.1 | 2 
gummiboot-2bcd919c681c952eb... | 1 
       host-gcc-initial-11.3.0 | 1 
     host-moby-buildkit-0.10.0 | 1 
host-pahole-73383b3a39afe86... | 1 
               libcap-ng-0.8.3 | 1 
                     libgcrypt | 1 
               libglib2-2.72.3 | 1 
                   libnss-3.81 | 1 
        ltp-testsuite-20220527 | 1 


Detail of failures for 2022.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |        containerd-1.6.6        | NOK | http://autobuild.buildroot.net/results/fec6412855d83d27c53de805449554f409c80799 |     
powerpc64le  |        containerd-1.6.6        | NOK | http://autobuild.buildroot.net/results/0d6cafac0b8490955d02dcbe7f90d1e2a47a6a91 |     
   xtensa    |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/b591be03f6aa34e90310b990e6a822292f22ede4 |     
   xtensa    |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/3e3b2336366bec5c22f58bf8e236cd37bf2a0e61 |     
    i686     | gummiboot-2bcd919c681c952eb... | NOK | http://autobuild.buildroot.net/results/f28c5d009fbbcdd341b5912e53dd686349a7264a |     
    arm      |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/f5adbd313b03c389e1be27ae23ca77d1abe652e2 |     
    arm      |   host-moby-buildkit-0.10.0    | NOK | http://autobuild.buildroot.net/results/6fae4e9d2e8240c7621242f44aced404112f384b |     
    arm      | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/c7a4a4a38c1b8c4a19acbbee6c0124b206ad3708 |     
    arc      |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/6637c5537f7927e1c6c992ccf57ca8077065a463 |     
  aarch64    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/2b6325cabf73e08f111a1829809ace268473ed92 |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/004e3b056d027f670059bb775fbbfc816129ceac |     
    arm      |           libgcrypt            | TIM | http://autobuild.buildroot.net/results/7faae7c72d93b7c5de5f8dd585e403f9bb85805a |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/638535d964a3e4bca206921a3514c55aca12f49e |     
powerpc64le  |          libnss-3.81           | NOK | http://autobuild.buildroot.net/results/feb72930545280fe4fe038cb8f6cd3e27f79710d |     
   x86_64    |     ltp-testsuite-20220527     | NOK | http://autobuild.buildroot.net/results/3695a2396165392ec17343ce36c30c3084a0d12d |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
