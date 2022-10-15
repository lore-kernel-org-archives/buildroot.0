Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 534BEC433FE
	for <buildroot@archiver.kernel.org>; Sat, 15 Oct 2022 05:42:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8E5EF40239;
	Sat, 15 Oct 2022 05:42:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E5EF40239
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1_zLlyVg9EIP; Sat, 15 Oct 2022 05:42:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CE5984014C;
	Sat, 15 Oct 2022 05:42:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE5984014C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DD86F1BF592
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 05:42:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 82EF44014C
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 05:42:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 82EF44014C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bArU-l8LmQ0E for <buildroot@lists.busybox.net>;
 Sat, 15 Oct 2022 05:42:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7C37740116
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7C37740116
 for <buildroot@buildroot.org>; Sat, 15 Oct 2022 05:42:20 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1902E20008
 for <buildroot@buildroot.org>; Sat, 15 Oct 2022 05:42:17 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sat, 15 Oct 2022 05:42:16 -0000
Message-Id: <20221015054224.82EF44014C@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1665812537; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=mSj/UYflNi726UkzprGjyafuq8FENLynq6XcOp+Jf8I=;
 b=H3usmYTLLwxKBPBWkwDq9YXFH7wvQdFoTo5WTcJ4jhhpWRgrulRMqPdImu35mssRjHzmxr
 h+S3UvBJGU1y/wR2TCzG88t9PY+Z0onJ0Flyn72Hbj2V/2s2uyeN3GjChYibO5vLHzmQvc
 51fk9qGvKlyogSFuR83z4/KketRGQ4V7rjoZajpecj3ky88LXxJ8SGR5MvVmwsJVVyNcmI
 OIEcLa9foIQQDzw3ejwsqlY8Xp3SVPxtNhW1Le8PZZ4NQvSn/+vB6nf7iqEdurlfCkhPQC
 KuSQy0m55YbahbGo+ShFpyDGw+H822t7RfoxUVyHhEhjhimeJIkAJ+JERKvynw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=H3usmYTL
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-10-14
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

Autobuild statistics for 2022-10-14
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  | 12  |  5  |  0  | 17  |
  2022.08.x  | 12  | 11  |  0  | 23  |
    master   | 83  | 654 | 18  | 755 |

Classification of failures by reason for master
-----------------------------------------------

glibc-2.36-44-g2628500f5dff... | 273
       host-gcc-initial-11.3.0 | 29
                   bearssl-0.6 | 20
      ca-certificates-20211016 | 20
                   slang-2.3.2 | 19
                        brltty | 18
            host-binutils-2.38 | 17
         coremark-pro-1.1.2743 | 16
             berkeleydb-5.3.28 | 15
                   libnss-3.83 | 13
        host-f2fs-tools-1.15.0 | 11
            igd2-for-linux-2.1 | 11
              dieharder-3.31.1 | 7 
       host-gcc-initial-12.2.0 | 7 
                host-go-1.19.1 | 7 
        host-sentry-cli-1.59.0 | 6 
                   libee-0.4.1 | 6 
                    sdl-1.2.15 | 6 
       host-gcc-initial-10.4.0 | 5 
               libglib2-2.72.3 | 5 
                      crun-1.5 | 4 
           dmraid-1.0.0.rc16-3 | 4 
            host-binutils-2.37 | 4 
host-pahole-73383b3a39afe86... | 4 
                 systemd-250.4 | 4 
                  autofs-5.1.8 | 3 
dahdi-linux-5c840cf43838e06... | 3 
                     efivar-38 | 3 
                     fbset-2.1 | 3 
                  gensio-2.5.5 | 3 
                     gmp-6.2.1 | 3 
            host-binutils-2.39 | 3 
         host-gcc-final-11.3.0 | 3 
                libcurl-7.84.0 | 3 
                     linux-6.0 | 3 
                  netsurf-3.10 | 3 
            openssh-legal-info | 3 
                 sysvinit-2.99 | 3 
toolchain-external-codescap... | 3 
              traceroute-2.1.0 | 3 
                    vde2-2.3.2 | 3 
             batman-adv-2021.4 | 2 
                  boost-1.80.0 | 2 
                    dhcp-4.4.3 | 2 
                elfutils-0.186 | 2 
             fontconfig-2.13.1 | 2 
                    frotz-2.54 | 2 
        host-berkeleydb-5.3.28 | 2 
      host-riscv-isa-sim-1.1.0 | 2 
              host-rust-1.64.0 | 2 
              libarchive-3.6.1 | 2 
                   libnss-3.84 | 2 
                linuxptp-3.1.1 | 2 
                    lxc-4.0.12 | 2 
                 musepack-r475 | 2 
                   nanocom-1.0 | 2 
                openswan-3.0.0 | 2 
                  reaver-1.6.6 | 2 
          refpolicy-2.20220106 | 2 
                       unknown | 2 
/home/buildroot/autobuild/i... | 1 
               acpica-20220331 | 1 
                  acpid-2.0.33 | 1 
                 augeas-1.12.0 | 1 
                  botan-2.19.2 | 1 
            btrfs-progs-5.16.2 | 1 
casync-4ad9bcb94bc83ff36cfc... | 1 
                  check-0.15.2 | 1 
               collectd-5.12.0 | 1 
           crucible-2022.05.25 | 1 
                 dash-0.5.11.5 | 1 
              dropbear-2022.82 | 1 
                   expat-2.4.9 | 1 
             f2fs-tools-1.15.0 | 1 
                  ffmpeg-4.4.2 | 1 
                     file-5.41 | 1 
       freeradius-server-3.2.0 | 1 
                      gdb-11.2 | 1 
                gerbera-1.10.0 | 1 
      gmrender-resurrect-0.0.9 | 1 
google-breakpad-c85eb4a59b6... | 1 
                    gpm-1.20.7 | 1 
                       gsl-2.6 | 1 
           heirloom-mailx-12.5 | 1 
            host-gauche-0.9.12 | 1 
         host-gcc-final-10.4.0 | 1 
host-gdb-arc-2020.09-releas... | 1 
         host-protobuf-c-1.4.1 | 1 
                  jack2-1.9.20 | 1 
kvmtool-f77d646ba01d04be5aa... | 1 
                libglvnd-1.4.0 | 1 
                   libqb-2.0.6 | 1 
libsvgtiny-ea9d99fc8b231c22... | 1 
               lighttpd-1.4.67 | 1 
          linux-5.10.145-cip17 | 1 
        ltp-testsuite-20220930 | 1 
make: *** wait: No child pr... | 1 
               mariadb-10.3.36 | 1 
                  mender-3.4.0 | 1 
                   mimic-1.1.0 | 1 
                    musl-1.2.3 | 1 
             netsniff-ng-0.6.8 | 1 
                    olsr-0.9.8 | 1 
              open62541-v1.3.3 | 1 
               openblas-0.3.21 | 1 
                 openssh-9.0p1 | 1 
            quickjs-2021-03-27 | 1 
                 snmppp-3.4.10 | 1 
                 uclibc-1.0.42 | 1 
                  umtprd-1.6.2 | 1 
                    volk-2.5.2 | 1 
                 wolfssl-5.5.1 | 1 
                      xz-5.2.7 | 1 
                  zabbix-5.4.9 | 1 
                 zlib-ng-2.0.6 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/f1baec73a949864679703688a42fd7e05ff42e1e |     
  mips64el   |        acpica-20220331         | NOK | http://autobuild.buildroot.net/results/ca0b40fc483015afd27827d60d904dfd6a0d8e80 |     
  mips64el   |          acpid-2.0.33          | NOK | http://autobuild.buildroot.net/results/918b883f334b24031f5253bcae2d82b34ab743c7 | ORPH
  riscv64    |         augeas-1.12.0          | NOK | http://autobuild.buildroot.net/results/abdd41a13912708d212203361b09164fe322054f | ORPH
   armeb     |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/f278d849fd2acef373d5774543f94a4a3a5fb593 |     
    i686     |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/69343902c4b129451073287f09d75c4f52770ccb |     
  aarch64    |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/faf95b325436430290de3202f2c72bb2aaf90a86 |     
  aarch64    |       batman-adv-2021.4        | NOK | http://autobuild.buildroot.net/results/f01073614b3786fd9fc719462daf188e81ab5d8b |     
  aarch64    |       batman-adv-2021.4        | NOK | http://autobuild.buildroot.net/results/4023f7a2b046a1b4f5a29951b1fe6f201518cf4a |     
    mips     |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/6d9d7f1e7da819e60899bfb454cf8853cbf02d20 |     
    arc      |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/0607156477da188aded3bc4afe1a2f8d2fd33c62 |     
   mipsel    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/2e8098a988b8bb774bc1771ec3baff5a68833c01 |     
   sparc     |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/0f6d5b819ac0d1e13e054242c11262e95add6750 |     
   armeb     |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/323ef854838e1ddf80974d1b9547426e4f987e06 |     
  mips64el   |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/e532b99dba5a09418b19ed020b769f706a4c082c |     
   xtensa    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/1f9a726d54f685218b3187787e53b804160b0589 |     
  riscv64    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/0f99a94978e3d22cad5e5fb34fccca49a9ff6058 |     
    or1k     |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/4a6b262a7b710106e1f43980bfa1aa04221c6fbc |     
  aarch64    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/b23eb4d079bd63fc108ccac862d20b93052312e3 |     
    arc      |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/267e9e6a22da9c71bc69161f586ff7d8ba52d2e1 |     
 microblaze  |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/400d1b709342998b1d3454fa16bd0b871f46dbd7 |     
  powerpc    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/068eb5555e15e0a029270c9a527bbd8b2f357a90 |     
   mipsel    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/08142b13ad6f087d67a2b757ffeccaae14393e97 |     
    sh4      |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/acc832abcf3cba12954d2a73b208702600bcbca5 |     
 powerpc64   |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/c75c528849520d903fc6271751e553ca289f3b9f |     
   arceb     |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/3a81a5b2a02bdaa724778d6cf69e56e38413b159 |     
    or1k     |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/1db027dbca40c35581c07812180c365246ab4879 |     
  sparc64    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/ccd637c672febb89ad15547a96d612636c9d5ad4 |     
   mips64    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/b7ec6564ef86e87c7de78b8731b2d879f176e0c7 |     
   sparc     |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/d1865d66f2e97400d2b596c9eee2c26db1ad26a4 | ORPH
 aarch64_be  |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/c154f6dbc42bdba46fc33653258f6100e0769494 | ORPH
   sparc     |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/4424f11d02e166ba0b77d40850b384ba978b9458 | ORPH
    or1k     |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/a6168d801f66b5637f3dc6700ce93e4e649dd944 | ORPH
   sparc     |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/1b50e186a10b3400c417616b337fa96853b68310 | ORPH
  mips64el   |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/e96f52579212e442536b235dca23a4ed53b884d4 | ORPH
  mips64el   |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/4fa3155643f274899627125e45ca1818c3ae070b | ORPH
  aarch64    |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/36c793bda3851827abb7d399d6c708737ed8c07a | ORPH
microblazeel |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/f3b476ccbf936de74149758b7baca6870a607fc7 | ORPH
  powerpc    |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/1d991f69b47e4b05f57de586666c20ceac890f70 | ORPH
    arc      |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/442aa2f13a3a8d3ec48ceac5214a3852667546ed | ORPH
  powerpc    |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/2c8faa8b3a21b9a2d748360521bc3f77f2dbf179 | ORPH
  aarch64    |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/c26fd3dd1a41537b43f61d78344b93f83ea99805 | ORPH
  mips64el   |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/9b5ee356ca059e6b4b5cd8c574257f6aa88ab3e1 | ORPH
   sparc     |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/1d7ae9ad4d0ebf22a5d39f61903a75e9c45666d6 | ORPH
    arc      |          boost-1.80.0          | NOK | http://autobuild.buildroot.net/results/496c46ebc71aab3c205ba7e5a6e5680a3eb32019 |     
    arc      |          boost-1.80.0          | NOK | http://autobuild.buildroot.net/results/7108f71915831b941f9ad953d09e83385c49d137 |     
 aarch64_be  |          botan-2.19.2          | NOK | http://autobuild.buildroot.net/results/bb0a1c72e25a05fc5c23eed5d2823f5eb00e1ac7 | ORPH
 powerpc64   |             brltty             | TIM | http://autobuild.buildroot.net/results/8d97a937c64aae35c75b91c352d384d5557f4987 |     
  mips64el   |             brltty             | TIM | http://autobuild.buildroot.net/results/509138f7ba5f248ecf33ba47c17e17a209f19761 |     
powerpc64le  |             brltty             | TIM | http://autobuild.buildroot.net/results/bafec897850252e0136e367f1936be99cf999783 |     
    mips     |             brltty             | TIM | http://autobuild.buildroot.net/results/2e4cc76aae638b328b90c1223876253eac3f554a |     
   arceb     |             brltty             | TIM | http://autobuild.buildroot.net/results/61c00f8b0d06d3397f8035edf9b75a600ecab5bb |     
  sparc64    |             brltty             | TIM | http://autobuild.buildroot.net/results/58aaacbc802873d6e55f95cb55c9961b13e9e3a9 |     
 aarch64_be  |             brltty             | TIM | http://autobuild.buildroot.net/results/1097ec96cbca07ee746e97df4a62bc599348299f |     
powerpc64le  |             brltty             | TIM | http://autobuild.buildroot.net/results/b1f2367086f1c11800e087c52a95ab0a46b5a36f |     
    or1k     |             brltty             | TIM | http://autobuild.buildroot.net/results/4b2a4e9655d8c01599828d60eda5dbceb3100a02 |     
  mips64el   |             brltty             | TIM | http://autobuild.buildroot.net/results/1a47154e694a9aa16a6e04b1ca6dca2bb1830cf2 |     
   mipsel    |             brltty             | TIM | http://autobuild.buildroot.net/results/4633d8e656c6df3a89bd3b14b4de66a4ec9a2df8 |     
    mips     |             brltty             | TIM | http://autobuild.buildroot.net/results/49f27fe555e20009777aa574b77bcb89976a1752 |     
powerpc64le  |             brltty             | TIM | http://autobuild.buildroot.net/results/a05c11583907836f96558639ac53a098fd96df85 |     
 microblaze  |             brltty             | TIM | http://autobuild.buildroot.net/results/bc642846946eca70cc59b3709d434fbcfb31cf5e |     
   sh4aeb    |             brltty             | TIM | http://autobuild.buildroot.net/results/891364f3c5422f18054aff8616217faf60ba0977 |     
   mips64    |             brltty             | TIM | http://autobuild.buildroot.net/results/f791ccc43d4cde458a0c61f4272e25a91b33aa59 |     
    or1k     |             brltty             | TIM | http://autobuild.buildroot.net/results/a0a0cb2c6b29e667e07bb2b3c52c49a0d11c2a77 |     
    m68k     |             brltty             | TIM | http://autobuild.buildroot.net/results/08bfc6e78b1affa3ced485ec652392986e234916 |     
  mips64el   |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/fa2d78216037128fe61e7db192f7e97bc308706e | ORPH
  aarch64    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/45248be80cfa2b16c822055a729094a56b548491 |     
   armeb     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/9933a82308edc23823059ef1eb81213128b8b1c5 |     
   mipsel    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/380dc5525cf27d9129b410652c4d3bd2b354274a |     
    mips     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/8c153497afb1637e08d62d5c125d902ea48b00ba |     
 powerpc64   |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/e70322928313c18d304349e6b93d2c7276f017af |     
    arc      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/675267f6502efd357f28e143a628e3b281a34bc4 |     
  powerpc    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/326c572684edf521fd7d56025ef8e42e917b32bc |     
  mips64el   |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/5fb22a6d3316f5a538da3662c8c8a57053ce37c4 |     
    mips     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/773d9e3ef65bc16923e3a481dad0dc793ffb4b15 |     
    i686     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/58a7c72391b09bdc8b5c70f5f7eed62be57a0a9d |     
    arc      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/c1d40ec663e5e5f9b58b5df22fa1eed00cca1025 |     
   mips64    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/2a2103ea188990b525fb20ed4081631f6925b2d8 |     
    or1k     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/696efe4b0138936f8f45c73e3c008141ed49458a |     
   arceb     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/577a919b4e137d3266fd3175bdca31293a5cc747 |     
    arm      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/355f734cdc7bf401284090777d7e358a09b4f4fd |     
  powerpc    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/0a15a45567ad9a4868d7df9085c8b29787d87a0c |     
    m68k     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/64cf1f776ac02f88e16e8c34cbc387133630b7fe |     
    arm      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/84ebd29d7971ceea574f535e584afba4429999d3 |     
    or1k     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/f0d255181aa081f3c2b20e42ac55c2dab1970ea0 |     
    mips     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/3aed56dc53cf8327fc16bc34e2dc440ea2b7709b |     
 aarch64_be  | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/177f38b48e1c0c590b7c2d017a776bc664a15507 |     
 aarch64_be  |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/1b0f0fe48b3ba348a248c40345b24a153c3ba79d | ORPH
    arm      |        collectd-5.12.0         | NOK | http://autobuild.buildroot.net/results/3b57c968dd2fa8d99bcba28e1baf8b519b800738 |     
    i686     |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/4ffe46abed939a0cae82f43e07fb7bfc2ccdc348 |     
   mips64    |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/7302f102d4e3ca634b0266d8f9548b48028ee1bd |     
powerpc64le  |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/3eb7393d8ff36a8890c8fbefe3b37881ec59c5db |     
   arceb     |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/2754fac3c0b8208b12fb9f4f47b2973a5ff8dc23 |     
    i686     |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/3518529f8933ff3048b3bd48b12a672b081f6ba9 |     
microblazeel |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/fd3ee9666ddb3b10d6614bd45622ec8ff8b1935f |     
   s390x     |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/5ed686457696d14ff68fbfc39e9e797734a757a5 |     
    arc      |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/9ba639477b19f036efdd2e890408223e8f54030c |     
    arc      |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/f4da94659a221d6d9ae784c9a8d524cb0278cb4a |     
    mips     |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/77a034bad922f90b70ece473a6d81e99b26af2cc |     
    arc      |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/b41fca485d82daefa813b29868605da6b9d61d20 |     
powerpc64le  |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/8ad3f8adb5c39e5c61c2b3fef94526e78afcde0f |     
   sparc     |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/b5ded96bb44a96f6d3ef915f63395e1859358b62 |     
    mips     |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/63ff2b88d3ce5c8a423f9eb3bab2ecd578d9cd71 |     
   xtensa    |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/2095657d2a1e1c78bb0362d907df6d551f5f69f8 |     
  powerpc    |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/4743894bf68738fbcb978329e6863a6b6bb7512a |     
   s390x     |      crucible-2022.05.25       | NOK | http://autobuild.buildroot.net/results/3883dfaefd8bd05b082bd7a2c3af716b795642ca |     
    or1k     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/e0e73499ceef874ec28a635fe5bbb15628114add |     
    arc      |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/1defcea890fed1d531d16302551bad0627e19ace |     
   arceb     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/ee82df01b4b91ae66e08bcce9ced6a936e2f3ee8 |     
    arc      |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/c86d9b09aa595498bbe7a5cfe7f05aa2364ce49b |     
    or1k     | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/cb49eb413ad607db471b67ab70b3976c5d378a0b |     
   sparc     | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/ce4fdfda2349c349cd71fda336ee8a475f8b6a3c |     
  aarch64    | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/fd1221aa18ab1e883e0af5dd200ae24106f605f2 |     
   xtensa    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/87c2e682f7083d20e3cb2454d7ed5dbb09e55566 | ORPH
   xtensa    |           dhcp-4.4.3           | NOK | http://autobuild.buildroot.net/results/8367bebfe7e453f5c9c8f046b5885a675c210303 | ORPH
   xtensa    |           dhcp-4.4.3           | NOK | http://autobuild.buildroot.net/results/e5241ef01392c127b3efb556c36e55bebb85901d | ORPH
    m68k     |        dieharder-3.31.1        | NOK | http://autobuild.buildroot.net/results/fa33f1b68e4a9ed796d69230a7842ad86423aa9a |     
  sparc64    |        dieharder-3.31.1        | NOK | http://autobuild.buildroot.net/results/537a63e6473c0692073ca6f0561e924016f9d9f8 |     
    m68k     |        dieharder-3.31.1        | NOK | http://autobuild.buildroot.net/results/d749db0ee3a71b6c6a6b3644509e7e2f29e5b654 |     
microblazeel |        dieharder-3.31.1        | NOK | http://autobuild.buildroot.net/results/8d50baacd5cd95673c542e11de0930d66c35bfc0 |     
  aarch64    |        dieharder-3.31.1        | NOK | http://autobuild.buildroot.net/results/e690516e4d73fcfd1306d9cc719f9b198d4090bc |     
   nios2     |        dieharder-3.31.1        | NOK | http://autobuild.buildroot.net/results/a6e088b0636512f62c1e1a9ed1b3d9f7dac2f127 |     
    m68k     |        dieharder-3.31.1        | NOK | http://autobuild.buildroot.net/results/1d92237afb3ae344c941b833b0bcc141ecdfe99c |     
microblazeel |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/40467e1b5f956a45a973f3a3842e425a223aa4fa | ORPH
    or1k     |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/ef82f825d48909105b90a244a2cc4ece866192c6 | ORPH
  mips64el   |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/0327b7e3bcb956b75cd40a72b2000847f0bf6558 | ORPH
    mips     |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/b876ba6a82904e0347e1b8f68584c3c99548e6e7 | ORPH
    or1k     |        dropbear-2022.82        | NOK | http://autobuild.buildroot.net/results/edae8ab42443d4672d6e2774c9e8fb4b236e44b0 |     
  mips64el   |           efivar-38            | NOK | http://autobuild.buildroot.net/results/8d8dd64adf0c2feaa69c461c4f4714fd528571c0 |     
   mipsel    |           efivar-38            | NOK | http://autobuild.buildroot.net/results/67731f24bf5a552523b675ebaa127e1f6c92e305 |     
  mips64el   |           efivar-38            | NOK | http://autobuild.buildroot.net/results/7c94ab97246f350cf6e53e08f5d4d67c718f1137 |     
   arceb     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/0a14e14391b7171adead1c7d3fcc77e57b676085 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/4295369dff3c02c152050dcd0394bebc15772a77 | ORPH
powerpc64le  |          expat-2.4.9           | NOK | http://autobuild.buildroot.net/results/85cb9b0c0ac0326e71f12f756325486c94bf8173 |     
    or1k     |       f2fs-tools-1.15.0        | NOK | http://autobuild.buildroot.net/results/d0f724815dbd87cfb4839e102c0ba1f2752086d3 |     
    m68k     |           fbset-2.1            | NOK | http://autobuild.buildroot.net/results/b1fd47e37292e9ef03b19768b233326b45e1dc8b | ORPH
microblazeel |           fbset-2.1            | NOK | http://autobuild.buildroot.net/results/43768879fd125c4aad4321e9fe5707f2bc72d632 | ORPH
 aarch64_be  |           fbset-2.1            | NOK | http://autobuild.buildroot.net/results/3ba836f81d11e59a107cc4d5e0068dc9aa9dd0dd | ORPH
   armeb     |          ffmpeg-4.4.2          | NOK | http://autobuild.buildroot.net/results/190a5d9f7bbadf27fcd2f849a1e1b3819ec6b334 |     
    arm      |           file-5.41            | NOK | http://autobuild.buildroot.net/results/25adb49f552f156a5a58b028172741445e50d3fd | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/7a8004eb22b7da43348ad355c8ad55e4f743901a | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/e4ce3862481573b51d1ef53cceb2cfd60518642e | ORPH
  aarch64    |    freeradius-server-3.2.0     | NOK | http://autobuild.buildroot.net/results/9c7634c703917877faa530d094be1fc48695675c |     
   mips64    |           frotz-2.54           | NOK | http://autobuild.buildroot.net/results/00127456af2481ca58ce11672271bcfb50715c36 |     
   armeb     |           frotz-2.54           | NOK | http://autobuild.buildroot.net/results/3a8994e7138660fa87281fbebb32712abc2350dc |     
   mipsel    |            gdb-11.2            | NOK | http://autobuild.buildroot.net/results/a94dea645cb65780196fc5ccf4b26df8befd1c64 | ORPH
   arceb     |          gensio-2.5.5          | NOK | http://autobuild.buildroot.net/results/eaf5599ded83d1f12a890387fabde174e795c527 |     
    arc      |          gensio-2.5.5          | NOK | http://autobuild.buildroot.net/results/e43a0fb738b98590549ba9e678278dfe477aa1dd |     
    m68k     |          gensio-2.5.5          | NOK | http://autobuild.buildroot.net/results/168733747431233ea3036239cf67ff926a72a9a3 |     
   sparc     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/7dd547a88ad5bd266038614e1fa8bd76355f10b6 |     
    or1k     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/ad54da221e0bbad20d36b6f2a8488152ea240e2c |     
microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/79b8e4a11902f60d7de39e4827e6de99ed3e5c1f |     
 powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/fcff5314d14297e0b3bd75e4672788502726842e |     
  sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/73a51b00b3e71840084bd6386dc5843ba22c8bf7 |     
    sh4a     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/7cbb3faca07a16007482bec40013ff9d144135d3 |     
 aarch64_be  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/7de7f7886b938dcdee7a5420d361969c813885ca |     
microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/f1117d8d9d24f165412786ee226e8bb3971c0aef |     
    or1k     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/b0549ea3731a3ac25eab2ce01b961cdbadbaf3a5 |     
 microblaze  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/58af588a961ca584d2144067fcf24995a201691c |     
   x86_64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/50d31527e5f72663a82d336c413a89de8cb6e499 |     
   sh4aeb    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/1cb18a135dbccfa1411aabb130e8395f1e82b81a |     
  sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/fe075d64a0213d0b10a8635d9014be5067deaf33 |     
   sh4eb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/a8bbed46516e063e3f677f5c11971b6b7960ba8b |     
  sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/dd576395bca9ae9d93e59517c878e57794046a2c |     
    i686     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/33142db66ebe9a30759f0161bc9b9d77934c8b87 |     
    or1k     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/0113088d5234346a569765b21b0d152716ac0de1 |     
microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/098c82d8e8641b9ba1e02a25be94cbd80e289e92 |     
 powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/e46dd6091cd4ed9b7f02c590c85c8319aae3379d |     
  sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/fe58169a0e8a9e66df20be6855b1ed6dc6332142 |     
microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/f1d9bca75c699bbd4093cea8535bd3a064381275 |     
  riscv32    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/c197409a9bb92454810fda29087c37d8d837ceab |     
   armeb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/3eec57d4d6d77fa026492b723e44f119eb43299e |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/76083fc6a9312f39ee8de8ff012140b1ba5a0118 |     
   s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/e403cf3229e426c08e5dcb7c5ae7d89d8a349ad6 |     
   mipsel    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/b9f74e91df35ff5ef603498693da3d390ba8ac5f |     
    or1k     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/57b4b4fa6feb74cbe82c153e6b3f18cbb33836b5 |     
  riscv32    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/d485dab5f5dea7d94ee35aa80a42a626cd5fe0eb |     
 microblaze  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/8bf86aef75d39ddf0c6b99ecd06b75930ad0621a |     
  riscv32    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/ecee4f2881c6a26122d0ef7d7fa3af173de73e2a |     
   x86_64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/4677e333eb9c5625efa47621845cc4c2c23a17be |     
  sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/5347bc313eb48b7973550e2c6c84c35d48365c68 |     
 powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/ab6b70bf05d5348df9f5a2c06d360434eafaa47b |     
  sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/e8f2af22807cb9ed725c536fe6d5a077d69c464c |     
  riscv32    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/312c54e07dd7b42b2b88e01fa626cd87b17d77a2 |     
    mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/da87736e6ab9720cc55988122f0475115c519158 |     
  sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/9689e94f9c6874b8fbe43c7c07afbb4e0451792e |     
  sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/4809d6a86cf512a7864f0fe1461ba9c647dc9a06 |     
   mipsel    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/7c6806646c0886baaaa4e8c58d9ce7b74b9660ae |     
    or1k     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/29ed89b94d33badad46257afc5f7c624b74be2ac |     
   mips64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/ab15f57d4c2b246e481fe16079870f6c999a783e |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/1f0f77eefbeb3e919ee3f19daf67c87ec3028bdd |     
  aarch64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/54d06259cdc86a8bdfb9494c99d5903fb7244775 |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/aaea4b844624b5afc68c8170e2f1fa4d6632bc3a |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/a3a02865a17906ba79f2b687ac07b5ddc4bdef6f |     
    arm      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/0bd4b91de1dc139394559aba0c08e37a3ed4c27b |     
microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/210f907633eb31371ead59f1ce0fff55b0920da3 |     
 aarch64_be  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/d895fcca19059742e0773a9e53b4df14067b4966 |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/9b363be00a86e56fb7145b93d7f9d6d42f735c71 |     
   mipsel    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/46229caf79ad4f1ec5f774e4a60304f2f22830e2 |     
   armeb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/b0553adf6a88d02585e40e8f77d24a379e3b9b1a |     
  aarch64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/899e69c29e91e59fbcdf9e5adc84d7ca6e7a7e18 |     
   s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/3723577c8f5a1e21368f7958ab1889d5eb790141 |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/fc1b5a1c4b44122ab19fbb5f65beba2787189aae |     
 aarch64_be  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/294c2cd71ae6d10333f53056d3b8f487e0b5d3af |     
  riscv32    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/533ed47246e4c196467b849430c3fac88ea54750 |     
powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/fe5f85c446193111d4f4ff7cbf09ae37081ac139 |     
    sh4      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/a782ac9d17aca9d9bfa55c0ba1a721d1997ef283 |     
   sh4eb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/2ac501611ed8ed97d153b41679375a2d89141d63 |     
    or1k     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/27e9a3fa57528c1a5a4a87d62b30ef8f0cea25c8 |     
microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/4f89380b9cf8edf49cb2c8578590557a4928b4b9 |     
powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/1cd0267c581c6c206f27d3071c46c16fba17ed9b |     
   armeb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/c2414e4644656db22df8ba9e64a2d1009b975ab3 |     
 microblaze  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/10b961235784b0c2d0bd8d1cfd83d64f319a147d |     
    mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/f9f54e7f4f23400ab77d2f8946854345e8691a31 |     
 aarch64_be  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/61f740c9bbbe6cbfaa432c946ad3df21f2d0d9a0 |     
    arm      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/7a9c4f6ef656771e142da1d18b6e95278e6e739b |     
  sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/427710e610b8e2a7ce801a6e63be2c22ce015e90 |     
   arceb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/c108a2e5d1f56429ed372fa2da8201267af70dd6 |     
powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/328a0058da14f47852e331d59ad115fe0305c411 |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/5cc6b53b20a0980387360221f779d2e082622140 |     
   armeb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/a2004c361c9246162301ddd8902305fdfd832d18 |     
 powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/1d03ff6b39aec683352ad787b37e2f8fc2205ab5 |     
powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/ac0960ca1f03e72e19482ad408d20c3f23464210 |     
   mips64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/795408dafae9239ce36b83f35f9a29ad30df89d9 |     
   armeb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/e4d9bb89088bbb57c75405e1ba2cd5f0ec58937a |     
  mips64el   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/d64b2e1b33343d413eb9af829586e2cff67bbdf8 |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/3fec196cb3eb0990ac7852e034b2b6a6ff317252 |     
 powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/682be6c26dd865758603937b4dfd1ff4901c7b76 |     
 powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/a9eec06d0b459735f7b5d0a7714f4852d0271956 |     
powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/da0504080f2617c87be7d930a4d4b9e9fe88417b |     
powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/c6e0a10d53c46a659271784623a97c53ae194292 |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/f089089a9408ffd70c6900dbbfecd182d411b586 |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/a1c19e0babf82483c7884ab12bebbee2e06a04b4 |     
   armeb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/58122f9dd255aa0a0e7cff54c36fdfc4d3ece6be |     
 powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/3924345804ce12929c29b46afea989e4368cda88 |     
   mips64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/f68e88a50339014a7aca6179b0a72d75da98643b |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/11e077035b75aa7fc21312b357f18e70c09343df |     
  sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/2fc3e9a8ce120948c4067fa32b3fa29f310dd064 |     
  mips64el   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/d5bd4afb9b21648fa661cbd983b86775465a344b |     
  mips64el   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/95755152915a67fb4ce0d35ec38ca50d8cfa22c0 |     
  riscv32    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/3d411f3a21885eb75cfa93cc9e6ee395e36061d4 |     
    mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/37d7c78e90a4b03b017a498f54f261a282530ad3 |     
   mipsel    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/c0c9c122a70043bc92cd84670e3ead3626cffc8d |     
   armeb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/c9d03380a8a93191ea224da8bed4668954123f6d |     
powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/f4d236bd4ce7d6d9ec234309ff14c9806041c754 |     
   mips64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/948c897b3ccede2e6d17dfc4e68bf90c90544821 |     
    arm      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/d3ce43e5f17129ac02fc54383f378120086ed9ff |     
 microblaze  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/784cd7a0bca8c65794c42839ede1a27af29c3fbc |     
 powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/5d8a9b5fa05f38ffc9f9dcaeded0b21a9d9740cf |     
   armeb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/28a8e95ef0cb0674878a29c07f537b6fc503bf0c |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/982df47ad335aaaabce9c9d3038ec0ad9264d2af |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/4914b2d89075727d3a109de47564fca9e88d5e5e |     
   sh4aeb    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/5151f7352b7addaf351b480b1b884d8deb4388f4 |     
    or1k     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/807c94d6bdef86ebbde0d5b6d5c05bedfe36e980 |     
    i686     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/96116f815666e6a230d4350076acf599ee8bd16a |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/ae80904b8dc19a3c21860ec357e50da98ff6ec6b |     
    i586     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/99b859c2b70c9cfdb2231ca72d3ac2f83d35d28b |     
    or1k     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/4383d64f38b4b12f7d7745ee6be66b1df891afd2 |     
 microblaze  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/afd328233efdc6af203dcf22193f7b7a77cb9175 |     
powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/78e76b71114d2982a8fb7dea5f340253552d44b5 |     
    or1k     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/86d1300eeedb9522abc2315dd5324003a37d5629 |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/09370ef3cc4f0670da7888610d29b826032f7149 |     
 microblaze  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/342f4549204175ea9b4e95b7b76418d5c596c68c |     
microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/f8a9316053652cf6f3c218689ec37401c87aa199 |     
 aarch64_be  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/1a499b37fba59bc4a279a3a61fb68df3308a8884 |     
    arm      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/1ffe485a44a7fb7290a26118a7c1fd025e99590f |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/0195aa14dfa628f224e47e421b01e229dd72ea47 |     
  sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/e3899a579a4abfae5dd1a683cc868ca29316b46d |     
  mips64el   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/25326e537d08f0ff5b353318a936394ee520c711 |     
   s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/80c05be80d43b322eb095ad5e1aeeaea9b2dd3ce |     
    mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/595a445ffc363bc15f19b350419978f569875d1f |     
  riscv32    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/31ac4521c9a41c8b38a26b7f78ff8787bc6eec67 |     
   mips64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/5e7710628a9b43c462e909a40602be48455c7c65 |     
   mipsel    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/4a3ad50fd19c423a87124d3fb9011db01e629964 |     
   s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/61063214d0b62c4078f894d5d844ef3357435e8a |     
    mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/c27dd84acd8683ad292f1ebc6bee63095b42964a |     
   armeb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/df7d6200203c26fc6adaa5ddd18241d0668171ff |     
 powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/ba6e9fb36c8fc30f16c14329fc16b697e40220a2 |     
    arm      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/98266d9450d25b9b81784b5203588af4fbe02fe1 |     
   mipsel    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/3ad761ac13da0f46d264ad3040d06472c01fbf0e |     
    arm      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/dfacdf6530fecbf93a8b20c2f5e965c69d627f36 |     
powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/ad29b3a6359c916cbf98f1681333d83476c5cb2f |     
  mips64el   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/c9266f68731aa5925323223286d6b48a4f3a5a6f |     
   armeb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/dc75549c23ef515787e3b20e9e60e779586cbdc9 |     
    arm      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/8b6cfa7d8a8f34e8c00bb874b5cf3fd3c1bb8c2c |     
  mips64el   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/eefe3cc74fa2d4b9883b97c64bf9f3bf87aa2bbc |     
 powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/9ec96dba6c172091a3c6bff41c8f4af631d60fbc |     
  riscv32    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/0675ed3dc4fecd9eec68e199a98b8c1f62ef30fd |     
  sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/c0b1098e665903f6cef132e1b6065b851d002732 |     
 powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/b51825182aa17c4d2df22bcf392f28e3afff9a52 |     
    sh4      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/7343c623bdc2f3d1f67ac9b9563fa7285f55d901 |     
 microblaze  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/866c2446ad4d21d0769add58bd9b527560781236 |     
powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/507a9685f2a27e51ca84d33f23f2cb035f53950d |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/33dfc6ba47525319343aacb1308498324c729ef3 |     
   sh4eb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/3d4aa08b3d050b4e8a4c2c7163c2b8996cad767e |     
    sh4      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/bc4aa6c612cbeade7973049bd2b03dddcbccf806 |     
   s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/a6341c76628983f78f40830f8548aecdb5283b7a |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/c35cb4849f6f3a8b8377bdf09406274880a8da52 |     
  sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/dc3083873a8a657650ec2d8853f881ee9c020837 |     
microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/37600ccbb8f3f81ca8bbfe1fc62b43ebd79133c7 |     
   s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/3ef7278e0afb3401f481f1dc2471f9dd0a48bf72 |     
  aarch64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/8404160f030acdd09133060d804b876b6f09df87 |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/cf054572f910224f522de1720dfce8b3f233e480 |     
  aarch64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/051290519862a60b1313c9e81e4b63c0b2b595c9 |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/f626e8549550d6aca51c2e6f6095c9ec32a7fddb |     
  sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/d84af8e9a86ff4798bd981d66be694c9efe17dcb |     
    i686     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/da4087a0ff3b582da02aeaa0af13b44e4b65857e |     
    sh4a     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/25776745560936d56cfb6f30d6a798df9875e36f |     
   mips64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/c82e6a7683389fdd4e1c16b5844e66958454f8d9 |     
   sh4aeb    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/8454a1ba0d9b3dfaff1b5dd8d60410c2473fcfd3 |     
    arm      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/d586d3e9394d294bc543ffb76ea1fed9c8ae2de8 |     
   s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/a83cde970273659ab53947ed3c420aceb3729f1c |     
   mips64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/6052c4c5cdfba53ba75dddeba8b5c044616d044f |     
   mips64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/b05bdda6130ad09113696ff8fe6a80e3c576ff7c |     
  riscv32    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/1cf418d7a5dfc2a149460ec5ab27f641f5a5f393 |     
 aarch64_be  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/8bfc8b0fca3fe2831c4831c35161bfe94e46cf6d |     
   s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/5d8ff99ab14076adf8f73ee254d3a1e274208c23 |     
    mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/7e6c2438a50b72621244dc23af3458efb33d059f |     
   mips64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/afbc71617c8bb8a66e5ebe4b43803c52221df672 |     
    sh4a     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/5f0c0cc3e6570060a73a226bd77f6fff89e220de |     
 microblaze  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/4b8fa8db4222589ec09f80bef1f33b987cddf622 |     
    mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/6fdd5d5da16ff5af1143b03b29f311d91582fb98 |     
 powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/16f4641740915120a1cca9820d47786e23aa1577 |     
  sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/1a8b7501e8b8bf0d6a3849a8191a48301d042784 |     
microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/d5bc4a8cc62b3502b86e702efaa039de88cf95c6 |     
    mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/b1ccfabb41477e3edde4ffdd7371f269242d54fa |     
 microblaze  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/e9172592b472c8b2ac8805cb3a24e198a4ccb87a |     
  riscv64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/6b51807a1a4358d62d647c5d4e3df8a5dcbe812f |     
    or1k     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/d2052c420aa048035c4d70872287649e10780d35 |     
powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/ad453f0b5abf4afe2e98e04250584e1ba0b23acd |     
 powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/ee43bbc20a45bc589edaaac2cb008443d3a663de |     
  aarch64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/ef0bc5bbfdff32e1e1e074f0d6317c3f45214de1 |     
    sh4a     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/9baeb2a99f6e2a4c1eb8aae3afb74469024d5bab |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/4a465aa7ad69714cab23dede4ee6002339bcb034 |     
 powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/01202907683f0da60c1ae6990e0f2973152a32f2 |     
   mips64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/fddc46a146f9a2c4a4ea9e5385cb1fc1cc2debff |     
    or1k     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/aa3c889952994576fb49e5b1072e3ab029ebf73d |     
 powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/55f24397e1414c3eaabed01fcca4ec53688ac3e6 |     
    or1k     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/70ad21f3a22d969be56a512b0acc12d677268451 |     
powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/734e5b6ded24b86ae0fb2672932cc9a1ead0154d |     
   s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/3e91b2428dc18fbcaf43b7ba533f6cca51c1bd2d |     
 microblaze  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/0221ecdf190c156e5bbc27d501c56a187aec2c8b |     
 powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/e1bce902b2acea62defa218ad41105d960146f00 |     
powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/00f1e2e4f9e732b87a2dc945a47393678fc36c9c |     
   sh4eb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/ee784d1cca31ea8d1a0336a8f348bfa863eddac8 |     
   armeb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/c648b103268dea45739ad31c2631f393010b2739 |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/ec82c3c2688048225626faff5f0877ba3b6f7561 |     
 aarch64_be  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/120ea3ab64ea22c6c2239d40cc51a3876e4f7718 |     
   s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/5539daa3aaaea46e028075a0fef6f86d41218831 |     
  sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/a494c982712a2abb969b9f179be1282fd25b9553 |     
 powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/cc20ed5856ca7720fd6d22b3b4965aa758cc13a2 |     
  riscv32    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/83f10648ae0e1843da46763a96efefe1fd10b609 |     
 aarch64_be  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/17b7d1f0223787ba0c5d4b5209c9d8dddce28862 |     
    mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/6638522f4905af128210cfc12fb2ec8576a64438 |     
    arc      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/055433a2fe91112bded485c29ac8eae25a823661 |     
  aarch64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/f1471b9213821af142b77f4f0d0558cf720b348a |     
    arm      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/76b3ab9142f6654d9c06ff07c3de7bcabc4bf816 |     
   mipsel    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/13a0601f61bf25f48549af02eaa523664e788338 |     
    i686     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/a56b1c17151f3220dbdee0c741ab12057af04991 |     
   mipsel    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/6952292ffbf11b43e5f3c05b5ef2501cec0c5efa |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/69833e8e8d3d409424bd9b15cc164229137c843a |     
   mips64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/b8def78b3dcebd287cb8004f632263314a0e6bf5 |     
microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/a29d95fafda61208fdcc2758ffd68a274a17e739 |     
  riscv64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/281280d59e2f935e41afa84a045f171d9b7efcd4 |     
    or1k     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/215f311de24ca3e0ed257954db5ff6e9bedf62f2 |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/0059a31244e44b4f9aa4b5a4cf32dc53b5a69a50 |     
   mipsel    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/30992dd8857353424178020ec84f5da218062138 |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/40d6255e049dc0d4725aec659d4aa46145c8a8d7 |     
    arm      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/e77ee1de2eb5c0faf30026aa9371f62d36da2eda |     
   sh4eb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/ebf020223706117ee93284eaa6543bf9218174ba |     
 microblaze  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/f7b5f4ccf64c6353f8f530f558c5e561d7de4e3f |     
  riscv64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/471c58bca3eb132c46db94f7411b0010e59dba41 |     
    or1k     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/6af6624543ae2ae4c934d4bb1a0b57334ca2f56b |     
    arm      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/ac9e51c5faeb81d16c9f3565c0ee6ca3f511e69b |     
   mips64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/52564cfb16645bb6833ba9ac358caa6c07920ba4 |     
 aarch64_be  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/f19ba5a85c52002aaa1ac602b10f5a34e32a1084 |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/4e32cd221204fd92d1901c564ed026229b21e824 |     
  aarch64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/4d7aea365da1b7a5026c1faa34ca5682e5e78ae4 |     
   armeb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/2b484327d8ed9a1fa37373fb8b2325843b9057ae |     
   s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/c10a14ee0fa3bc5b9e03b7286b254a561a380afd |     
   s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/072381653b80df24897cdc36efc730b1ddf8fbbe |     
  sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/99d10cfe2021f4b74f621e16ae2b2a967a35423a |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/b6d41fa979bddfbe434e07876be4bd77a12e1c56 |     
  mips64el   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/7ddfc4f181c3213deddb4c62534c89591e63091a |     
 powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/3c5d25490182a49abbf99d0b61a3327e364f2169 |     
   mipsel    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/839a746e6b7ef5a5a68e4389222daf00e41984f0 |     
  riscv32    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/bd1700e5e607d23c1d678eb835dbdde69bd1fdc9 |     
 powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/47148e63380a6d6e8a457f836ea466efec87d1ef |     
  sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/a5c6c55b5404707f527c0792b736fcc7c73b16e2 |     
  sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/fd847ee7f5e903f0ee8ae92b348a8678533533c0 |     
  riscv64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/07e769fe945ea4bd1200509de46b209fc0125e28 |     
  sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/67746eeac5399ff970cd2c3723b209e3e9bff7fe |     
  riscv32    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/c033b9a22d392dc5bd4de828d17b04d6419d5829 |     
microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/1e9e4122c569f33a3285e1dccab168c510d216dd |     
 aarch64_be  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/a8ab1aba060cf5002020e137aac84d1c7f1e22aa |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/4c8a57fe0c896b09ef632037d5be6f0f59430042 |     
    arm      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/93799257349ac1f3dbf66a0f87326820475d8b17 |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/e6423d4f42f4efa3dd2a5943836d57d74c3e113d |     
  mips64el   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/30aea8ca3d52368df8a1a2a0b5e46a1f62f31eca |     
   mipsel    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/28ff8a7f1b4d688ec22de988e3195ca31166fa79 |     
   mips64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/469f8007c35a87e800afe78a9bd79b56a758c02a |     
   armeb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/c08c76e1c12ff217de90492af75980c3c9ed16e8 |     
  sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/1bbec84cd2a5003ef14c8b135ce0109978f49ba0 |     
  sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/1400f26ff1cb937d804c568ea86c266695e10c05 |     
   s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/efcdea39f3fd8e9258d940fb1a275ebf9ecbf5c0 |     
 aarch64_be  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/61346220493308eb838feda760d4d6204a07e732 |     
  sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/69651c266cee83b04a897a0fec4ab98bc2f98b45 |     
  riscv32    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/b4ac9d6ffe79e593a15d3be91c1e22ec505e9d5a |     
powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/d291c25c67b738c93cc66f063f962b682c7adac3 |     
   armeb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/f2a8e86e26659e9e242bcc0d1776c0bdc0e2f73e |     
   sh4aeb    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/e1369ac07d8c423a316b09e735af3cdbe094324f |     
   sh4eb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/d222e6a284b7a4f5a63251f0f453e8bce0c56617 |     
  riscv32    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/dfa54d3f43aefc3a50db5fefaf94274eb37e3047 |     
 powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/a6b122494cd7e5e5f549ed8cc6625201feeaad71 |     
 powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/5c5b78c23ba9014c4be9c132114705db9fb8216b |     
 powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/55c5906fe603fb705b223db9ef5c02d1d79d6f94 |     
 powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/b6757f1969458b2da9ab05e96fdd5bed9780771c |     
microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/468633cdbf0c5acc56af333c1c18d32330f19a04 |     
  mips64el   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/ed3b6b9007b1321cfd78e668e6b3c6508acb421d |     
    arm      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/dcaf90529bdb6cab453badb99b23e12648b14023 |     
   armeb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/4769cc0cf1fc8f42669417d6e816d8ba22809941 |     
  sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/5827df1ba85d170c3d220bb93f424d051c25a19b |     
 powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/c0ba98f2a431ac45b31b69acdb0e2db0b237c14c |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/b286ac0f87e9f17f9881739972c20ed931971f7a | ORPH
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/04d34db3ec9f055ba3e1fa10994b1d36aeea0767 | ORPH
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/5d4487cd551573c65f3efa79dfd1363659ae3103 | ORPH
   mips64    |    gmrender-resurrect-0.0.9    | NOK | http://autobuild.buildroot.net/results/0634c0df56dbfe8f0dc9c95ce736bdc4bca156c0 |     
    mips     | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/575f30ff4b9ffd578a1caea71b1d37912b17a4b3 |     
powerpc64le  |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/133c03179d9a15fdcf50e42c34363996604db838 |     
  powerpc    |            gsl-2.6             | NOK | http://autobuild.buildroot.net/results/c1ec76746dc3083ec0ad9e152b3fbd76d4a8e0c9 | ORPH
   sh4eb     |      heirloom-mailx-12.5       | NOK | http://autobuild.buildroot.net/results/c4af2457dbbca3de200f4561b75de80a4319367c |     
   mips64    |     host-berkeleydb-5.3.28     | NOK | http://autobuild.buildroot.net/results/058dd8cdb6f7cf35185b50634d6c01cda6c2d376 | ORPH
   mips64    |     host-berkeleydb-5.3.28     | NOK | http://autobuild.buildroot.net/results/b873074330c5fb6d9a3edb6ac9f4cb11f58cd66a | ORPH
  sparc64    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/c6a77d8250c8563eef3287752177552394c75b24 |     
    m68k     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/d6d7346cf533257b60c1da99027a2a3f86b23a58 |     
    m68k     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/e4c29a8e8a5e0b60acddeec6fc6c36162edcc35a |     
  riscv64    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/381dd7d3993b2ffe2a6a7de9e357357bfd3a69ff |     
   s390x     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/76edfd8c73e22fdeaf038875cd051d472ac9f3c0 |     
 powerpc64   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/bc598d466a7deb5253af06ec57b641e0c28e2e94 |     
    or1k     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/ca202cee08181ef3641fc71784a888654a57d364 |     
  sparc64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/bf2855780649cc4554605fc179564b13f3351b63 |     
  riscv32    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/240cfde7d58797d237c2f0660f4722556118dce0 |     
    mips     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/4b47f6b2785c3a1b7459253e7995464c99594a26 |     
 powerpc64   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/f9e06e753ddc11eff69e9a4ee9a213533b2f961a |     
    i686     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/bafac12da293cb6a795239c01712e609c46384aa |     
  riscv32    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/24834ea8dded38d520c5154d4d2a6ee3f01acd6c |     
powerpc64le  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/78c83599e05197e8db0d9c6ac3817f9074a34165 |     
    mips     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/d6fe2b7050ae557351d3ca16bddbdeae9fe038cf |     
    sh4a     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/b4d837d1bd98fc317130eec6059d4b515ae7d067 |     
    i686     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/f712af13bb3c21c54c38275df2e955fbe460beb8 |     
   nios2     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/175272180ced3b38d886ed1406132d7cbe5a5fcf |     
powerpc64le  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/171c10eeb6c50aa2f180433f3715bc8b9d40100d |     
 microblaze  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/0b9f23e9b54f111a578bf98d2f053594e2b14f3b |     
   x86_64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/55b313e225df00433d0603b153b78a9e4ca9880f |     
    i686     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/d7054ff4a23573a91c84c070499badc292b4eb41 |     
   sparc     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/c170e21954b65df0967787c41109c443c1f12ef8 |     
   s390x     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/2e430152f1b4d808a70574ad7064d725273c4f89 |     
   sparc     |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/a5a0fe4715bb42c2ccc75afc22b378e6ed67455a |     
  mips64el   |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/545e080d33c7f57fdbc36f05491927fc1826b426 |     
powerpc64le  |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/321e3722ae5042e46f6ea0b8b8e9f5c3db9439df |     
 microblaze  |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/eb62bca2903346bae2a69f51fc4ec3565377b4ec |     
    arc      |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/19517b07a21db4ec645d4f062a6a5e7d1a7075b9 |     
   mips64    |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/9cac0325c6e30857d8c79b0e6cba125c1c5e6149 |     
   mipsel    |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/6366f60bdb4ba9ec18cb02b3e95a304e88475c07 |     
   x86_64    |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/4479c05ef126fa0d6c716a9df616143ab1ffca91 |     
   mips64    |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/626418d95c0721b8571b11402fdb2d2379240b73 |     
    mips     |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/6caa203d714fb0f39e317e36ac70c3987f469f08 |     
    or1k     |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/f3d7f60a7ed87cd0f9c19e11f2bdd40edd172af3 |     
powerpc64le  |       host-gauche-0.9.12       | NOK | http://autobuild.buildroot.net/results/ee0d6098f02f84045ea5a1c67267db028a9ab413 |     
    i686     |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/c9c0528162002eeaa2c243337dc500681bff8234 |     
   s390x     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/ebe7249d0c751444e78e71c6a8e1d0683e1ed4c0 |     
   x86_64    |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/5efebb541aceb22269aa1c3d59d7805fe4e451d0 |     
   x86_64    |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/e880cb53abf65d13d8571156d3d5be1762df05a5 |     
    i686     |    host-gcc-initial-10.4.0     | NOK | http://autobuild.buildroot.net/results/746e86387b2b71c552e302d6c6aae4fab9161bc5 |     
  powerpc    |    host-gcc-initial-10.4.0     | NOK | http://autobuild.buildroot.net/results/3e0b395770e40104d9c46e3fa2bc019d22df5d71 |     
   x86_64    |    host-gcc-initial-10.4.0     | NOK | http://autobuild.buildroot.net/results/3dc1ae1db09629b0ca3dc09ba6c5b32d0ae8abce |     
    i686     |    host-gcc-initial-10.4.0     | NOK | http://autobuild.buildroot.net/results/2aabd652fb3244dd7d1129f80ed699a52c578bd4 |     
   x86_64    |    host-gcc-initial-10.4.0     | NOK | http://autobuild.buildroot.net/results/340765438eecb11579da1e2edf3bc445a0406b73 |     
    i686     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/30a17c4e27353929ef0773b91f8e257b914b837b |     
    i686     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/ba59dda6738b2a8a845f47decd4fac9a4d998ccb |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/bfc29eeb3424aeb2c3d38316fd84b1475fdaa3fe |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/e51d26c4f08a715ee7e918f33d069aced20e7e65 |     
    i686     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/9fff992240e6e1217941e61ab5768fc5bca7e225 |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/7ac2ac0e5519e24a4ba7a9b0fb47f938654e71f8 |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/d1409562358304e86c0b5ee1b5c1c762d5236f30 |     
    i586     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/974e18c2064cc7f77892da27d6f5ba9bb20ea4a0 |     
    i686     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/ec17a81ca4ae90617dd5d20c1f216a97778109d6 |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/96c60f688ec9178da4bb5e4e9be542f5fa19e30f |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/1c544902297a51633a10f3e7b7a4406642e775dc |     
    i686     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/d306a367ac81c1328d869d596d4074ad7fe37984 |     
    i686     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/474c07c63cd90fb8721b6d6584a9381e699b96b7 |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/95d3e1d31c2dd9f5be41c9615faeb96908877eeb |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/ac43255f429a51e93b1e1a187d86132f1764a429 |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/fd6c8f13b8ab0cbcaff9cec9e0b0523959035bc7 |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/ae090dec7f267ecab407866f5c838ae5bccf9d32 |     
    i586     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/5c5324a205daf927a7410d993ccf64c09e1be1a3 |     
    i686     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/12bd2bdd82384a42569dad9cfa735fa42b84468e |     
    i686     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/e55b48d6967544004b0876ae928b443fdcf6602c |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/3e28fc0da11db6699ac25f5e55385cdb2b88abec |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/7cc1c2ad6dd98eb329f7687da0299cd0d86c2188 |     
    i586     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/d4d344e06b146a9dc9ec2f6d227e3300283266ba |     
    i586     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/b9f51b2232997d5be2ae8a0198da8d5663894131 |     
    i686     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/ebf466007116590b5e31d145ad2821f0b6f3731b |     
    i686     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/09e57ceac020a2ce530fb97707255dd928c42727 |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/1ed75ce3de394452496b015df9a6ccba7300935e |     
    i586     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/2a93d6743779f3120ac88e6c05a321705831e6c7 |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/7c496c9b559609b2caa584149503fe9237505d9e |     
   x86_64    |    host-gcc-initial-12.2.0     | NOK | http://autobuild.buildroot.net/results/97b63508d2f18b93c267f0865ad8fd42d7233879 |     
   x86_64    |    host-gcc-initial-12.2.0     | NOK | http://autobuild.buildroot.net/results/eb694f9012e211d845d50d337c528bcd31c5b004 |     
   x86_64    |    host-gcc-initial-12.2.0     | NOK | http://autobuild.buildroot.net/results/9c2c25c1bcc3c341d0eaffdb85585596995e09f7 |     
   x86_64    |    host-gcc-initial-12.2.0     | NOK | http://autobuild.buildroot.net/results/c3b00d10955e0c2e292c952ea16aab982ebb2b8a |     
    i686     |    host-gcc-initial-12.2.0     | NOK | http://autobuild.buildroot.net/results/290b45ad453e49e3fee90c25aa8e277de7e04e05 |     
   x86_64    |    host-gcc-initial-12.2.0     | NOK | http://autobuild.buildroot.net/results/20cc724e35483d50828218b0369b74733fd0c8c7 |     
   x86_64    |    host-gcc-initial-12.2.0     | NOK | http://autobuild.buildroot.net/results/df136319d51c6b855b34601f3bb9273ffbb86417 |     
    arc      | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/2a60470204cf0a2a9bf379f948adfd3856c68698 | ORPH
    i686     |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/5477bd8970ad78ff7ed6ff58a30f64a3d643e3fb |     
   mips64    |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/b2733ca1c7408218f81a3c30bbd027c09a890eb1 |     
  mips64el   |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/f0489e602bd87acf463628cc7f7081ef1d055f98 |     
    i686     |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/49a37a12a9deec9ed7141997090ef840723e3a33 |     
  aarch64    |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/7cbb3624f3e170a6c119e2ad73fd72fd2f9f28ef |     
  mips64el   |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/fa4cf5c8746090480ea409897dce154149572fac |     
   mips64    |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/eca49aae26193cd9e5a6d5fb479a73618ee7dcc0 |     
microblazeel | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/1c81febc933aba6cbffbea526f9e9876014e7d18 |     
    or1k     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/257116be97b8dac3cb79fdaad5cd1784925cac47 |     
 powerpc64   | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/da5a0dbb7eb5b901d6d9ca7cc426befd460b1426 |     
   armeb     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/282adde74d24b1ab02e85b12a4ace52f5ac7c62f |     
powerpc64le  |     host-protobuf-c-1.4.1      | NOK | http://autobuild.buildroot.net/results/3627729af5e4faa87a0aaae9dbfaf77e2b6a122e |     
    m68k     |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/bb96eb9296e229416b87ce2db77fc7af613f1275 |     
   sparc     |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/643f0684418fd69517f1ec097b8cdaaba9173103 |     
powerpc64le  |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/c35ac51f99bbbe65d02f6076a4ea3bfe56bff2de |     
   x86_64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/93a99c11ac76d7df3c6d8742f94ca34193ff2c40 |     
 aarch64_be  |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/53d01391359b946b8f8cfb2f0652ce02c8b84b0f |     
    arc      |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/4db6faf8da1857d0da05d0d1acfe3acca53d615f |     
   sparc     |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/529af12d514dcbf338d606ef3112d6e3646061ca |     
powerpc64le  |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/c15ddd875c3ad5ce7941089a03a5c6fb8d9a0478 |     
   xtensa    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/2c0c3ed98a4bf6f5c4353d127a57e8adcf3d7028 |     
   armeb     |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/360111206fb0d7215fdc2c89198a2722b4643801 |     
  aarch64    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/7ddadb06419b6dd8b04655c610e0b77c47ee795e |     
    i586     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/c4ef9a2bd6c0414fa1ce2c75eae93dfc09e4be85 |     
  mips64el   |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/917904a7729dac096ec37b58423dbe9c1b3d0828 |     
  mips64el   |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/d80e576ea2c5acf8039d9446f3457a916328bcd4 |     
    mips     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/5af2f99a4a40e888c0b1b42499cb248078fbea6a |     
    arm      |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/ec82176b6362ed13995f3144d28fa8fb59d0d5a6 |     
microblazeel |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/a0008c9603a9dd894ae84b3ce4c78fe77587653f |     
   xtensa    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/61c610a15ef600bcf31f6326fab7497e7f89c3b6 |     
powerpc64le  |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/c6055b073f1704a9539d7a9742e0a8f9b151fdaf |     
powerpc64le  |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/25bbc289c827b12049e8ecee6dcf3e9ec1eb90f1 |     
  riscv64    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/b2e5cda9918b823a1d1e3dfdae34744f515ddd4b |     
    m68k     |          jack2-1.9.20          | NOK | http://autobuild.buildroot.net/results/342d5e82181a482209e81f4b601d1f68e7aea778 |     
  aarch64    | kvmtool-f77d646ba01d04be5aa... | NOK | http://autobuild.buildroot.net/results/48cc6b53ab0c0c8ab1097e1260c1d8a3b1d7faab |     
   mipsel    |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/c698561ea9cac15526b8a7e76afd0d1b650ed597 |     
    arc      |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/85bfef1c9d665588df346367d1151565c7d49369 |     
  riscv64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/0537362ea0a47c68040f5852d2a1a4a3c58b463c |     
  riscv64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/456cfda8cc28364315f67e7d8ddee81fc5ea3341 |     
  riscv64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/965cbc45a8fb719d00b4fbc9153d01dab0db7e1f |     
   mips64    |          libee-0.4.1           | NOK | http://autobuild.buildroot.net/results/5a3e4fc002371204664d5ea758a23233093e1ca6 |     
   sparc     |          libee-0.4.1           | NOK | http://autobuild.buildroot.net/results/e33eab30bf375240edb43063d97942ca290d31bd |     
 aarch64_be  |          libee-0.4.1           | NOK | http://autobuild.buildroot.net/results/91a47bb1b1dfeeca79a99192904ce5532c56a366 |     
    mips     |          libee-0.4.1           | NOK | http://autobuild.buildroot.net/results/55e614d35d46a24867fe42508bc07e0c02b13c59 |     
    or1k     |          libee-0.4.1           | NOK | http://autobuild.buildroot.net/results/e9f81842c91ca5b12fe38140dee00bec8c0985ea |     
microblazeel |          libee-0.4.1           | NOK | http://autobuild.buildroot.net/results/d2c1875c8434d277456da98c634acfd69340ce4f |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/aa18f906ca667027089524e1087c95c13e9521fc |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/4ef6e1e1f662f278939ea7a98db04d1a60bc6bc8 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/ff96cca0027804fb4e439ed9674386440a074292 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/a21d00e78fef9e78fd092dfda2b60d52444e44b8 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/d80543725e62d8e3c14baa7ded39de5189cbb8f9 |     
  mips64el   |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/d2b3b6cd80b4e25967025e365936dde99a5647fc | ORPH
    arc      |          libnss-3.83           | NOK | http://autobuild.buildroot.net/results/176b7e180a1b12a8259154a1c55fd54666aaa810 |     
    or1k     |          libnss-3.83           | NOK | http://autobuild.buildroot.net/results/a2fe13249697590e3de73092e5922b2ba19f30e2 |     
  mips64el   |          libnss-3.83           | NOK | http://autobuild.buildroot.net/results/6addbe4f34e20e6b95eef6ac0f07e53b79281444 |     
   sh4eb     |          libnss-3.83           | NOK | http://autobuild.buildroot.net/results/fe4f148de42aa7146b1acca5f36e89b0f8e3e200 |     
powerpc64le  |          libnss-3.83           | NOK | http://autobuild.buildroot.net/results/c48d79ccb10c2970b0100ec900d60c28313cf121 |     
    mips     |          libnss-3.83           | NOK | http://autobuild.buildroot.net/results/aa0edee22f6837e89678fc055a5684ca56aae36e |     
  powerpc    |          libnss-3.83           | NOK | http://autobuild.buildroot.net/results/e4f42836aeea477d3449b8685d65058f6df25558 |     
   mipsel    |          libnss-3.83           | NOK | http://autobuild.buildroot.net/results/3e17119046bd277df6944b336af424622847c854 |     
   xtensa    |          libnss-3.83           | NOK | http://autobuild.buildroot.net/results/f9be31c2ae9668a86670c38135d0f84dfc0c3bb9 |     
    or1k     |          libnss-3.83           | NOK | http://autobuild.buildroot.net/results/9dab0094098bf2ec36753fa13db9020318421673 |     
  mips64el   |          libnss-3.83           | NOK | http://autobuild.buildroot.net/results/833a27281ae98d9279f4bdbd8bcf7affdc53016d |     
  powerpc    |          libnss-3.83           | NOK | http://autobuild.buildroot.net/results/ac3ad38f9208a9897f3f23e455fdd5cc2e109696 |     
powerpc64le  |          libnss-3.83           | NOK | http://autobuild.buildroot.net/results/621c8f22953db1a00f009b629a43e837ed4463ea |     
    or1k     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/d2a19e9eda42e99bd8b978f5a521ed3593735d0b |     
   mipsel    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/4649b2c7c5494e0d998cc757f72b2e192d4a66a8 |     
    or1k     |          libqb-2.0.6           | NOK | http://autobuild.buildroot.net/results/56d8e97be92512892783f5bca7a80ee8af0859eb |     
    mips     | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/8e3dac5b15fdbab3d2cfe3bc6c399333e540c306 | ORPH
   arceb     |        lighttpd-1.4.67         | NOK | http://autobuild.buildroot.net/results/1e4b7a429ff690ec5d222ba121c31f96c99c8a3d |     
  mips64el   |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/d42b8bbc0f6bafdf35e1e2e7b6f1258dcec620fa | ORPH
   mipsel    |           linux-6.0            | NOK | http://autobuild.buildroot.net/results/715c28beb4faabfb174ba002c5dd72ee066f5464 | ORPH
   arceb     |           linux-6.0            | NOK | http://autobuild.buildroot.net/results/364f6884b9a534b5d9d1e4d41672468f46e499b8 | ORPH
    arc      |           linux-6.0            | NOK | http://autobuild.buildroot.net/results/53e0c05fab60155bc6934f8449e8aa2f30727458 | ORPH
   sparc     |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/a15a6240172549d2965d68f4abb9cff56d81a8a2 |     
microblazeel |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/9c638ac4ff5e3db198a410f368729ac361007ce4 |     
   x86_64    |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/b06e108781d82d71b139e56611f89446867673de |     
powerpc64le  |           lxc-4.0.12           | NOK | http://autobuild.buildroot.net/results/9797c46d9d3c1588530523c9c8142a0d508ebf83 |     
 aarch64_be  |           lxc-4.0.12           | NOK | http://autobuild.buildroot.net/results/5a0adf76c869091090fdfe6ff185809471664f5d |     
    arm      | make: *** wait: No child pr... | NOK | http://autobuild.buildroot.net/results/fe9c758ad40994841145c33ef787eb1d0a7e6640 |     
   sparc     |        mariadb-10.3.36         | NOK | http://autobuild.buildroot.net/results/e925aaab09e86f42e9ad8bf02a2fc29e89e5ec15 | ORPH
   x86_64    |          mender-3.4.0          | NOK | http://autobuild.buildroot.net/results/9c61fc0f946dbb580d55ec9737c7ff48a9d765b4 |     
    or1k     |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/28bceb69cf1825662885325736ead1242f37870a |     
    sh4      |         musepack-r475          | NOK | http://autobuild.buildroot.net/results/fb8474776624af4d30200756f1ddb9666610d1c2 | ORPH
    sh4      |         musepack-r475          | NOK | http://autobuild.buildroot.net/results/669c93ef033bd1b4d82014bca159a92dd7a9b3e4 | ORPH
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/2ba40235d3eb992483b139921c747bf7a9c66afb |     
    m68k     |          nanocom-1.0           | NOK | http://autobuild.buildroot.net/results/ee2bdde7540afec6ec5c9d7440cf6801e2d93772 |     
    arc      |          nanocom-1.0           | NOK | http://autobuild.buildroot.net/results/dd15981834c16d3eb3964a9d602c5f3d0fe1b5de |     
    arm      |       netsniff-ng-0.6.8        | NOK | http://autobuild.buildroot.net/results/31fe26870d0f54ef3a51ecdfde822625317f36b6 |     
microblazeel |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/5169f8b89d20bef8d5b6c55364b25d065d53bb11 |     
microblazeel |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/1113e978d47958d2bb70a404d64b0bedf4b36060 |     
   sh4aeb    |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/268d13d6afd4f802105d37561e3849834c3d737c |     
   sparc     |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/d32e533755e727f33cf88094238f7c21fa25a6f6 | ORPH
   sparc     |        open62541-v1.3.3        | NOK | http://autobuild.buildroot.net/results/cd065800b2a48e70b534fe280ea5c8ff37051c19 | ORPH
   mips64    |        openblas-0.3.21         | NOK | http://autobuild.buildroot.net/results/a18061de5e37a2847b54564166ad223493766405 | ORPH
    m68k     |         openssh-9.0p1          | NOK | http://autobuild.buildroot.net/results/cd9a1c2d6b9fdb0e3407713d474d2d70150af53a | ORPH
  aarch64    |       openssh-legal-info       | NOK | http://autobuild.buildroot.net/results/c6407cdd0e3c9db04154433da992a7f28a1967aa | ORPH
  riscv64    |       openssh-legal-info       | NOK | http://autobuild.buildroot.net/results/f49920cb3cbd3c59d46c735829dda9f70da9a4cb | ORPH
   mipsel    |       openssh-legal-info       | NOK | http://autobuild.buildroot.net/results/244e50b7bbe46f794aa1c9c2636bc1652df5d6c7 | ORPH
  aarch64    |         openswan-3.0.0         | NOK | http://autobuild.buildroot.net/results/a84d5915d68da7b121337f2a48de93e91ccefe30 | ORPH
 aarch64_be  |         openswan-3.0.0         | NOK | http://autobuild.buildroot.net/results/49d009f6c9a0302245112aed7e4a0a450a2213c9 | ORPH
 microblaze  |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/39b9b251af52d3cfa1a3a0b4e21dbacc901f4f2e |     
   arceb     |          reaver-1.6.6          | NOK | http://autobuild.buildroot.net/results/df7edeacf34240a7720227e51768c5b21ee17200 |     
    arc      |          reaver-1.6.6          | NOK | http://autobuild.buildroot.net/results/8df68addb47312f52b77f12aa78c64b09bfe3e3a |     
    or1k     |      refpolicy-2.20220106      | NOK | http://autobuild.buildroot.net/results/bb54b049e6e32308af1af0d3703216063b7c3ae8 |     
   arceb     |      refpolicy-2.20220106      | NOK | http://autobuild.buildroot.net/results/d9470b23f3a0114219d53e6fd054bce8bf7f371c |     
    sh4a     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/1acd9f2a69c28ec0e057820fa8012d520f9ad72b | ORPH
microblazeel |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/aa660503c5c96cbc2cb9bffbda02ea2a18fcc032 | ORPH
  aarch64    |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/eef39a39593d61462f7d5694c55eb6b33fc0d115 | ORPH
    arc      |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/3e52f67ae2c91d80c54323a394114df8c8dc1748 | ORPH
   mipsel    |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/8717b403fbd33c6b94791412da37731aa7e6a58c | ORPH
 aarch64_be  |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/0db271dbc220bea72e9b71746b00bc53ad2e2801 | ORPH
   sparc     |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/66a6d57ec41ee374a8bd8107bc323ba21f18bd43 | ORPH
   arceb     |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/c8291834c2b65be331f84ada14320411cfb6bffd | ORPH
  aarch64    |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/192605cd5f711903d1ccaf7fef0be81abdf96041 | ORPH
 microblaze  |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/8a4f1ca1008f28c6abbbb3eb1fb4586eeb1eb9ff | ORPH
    sh4      |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/fc6879b975c8d61dc4e7604465bd01edf19e0469 | ORPH
   sparc     |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/b155cc847b1f1de8b131421fd4313fee61591e93 | ORPH
   sparc     |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/3e32408af2ae113fb138a6b1a1460c823ab6fb73 | ORPH
   sparc     |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/be1cc2bd1902e83b335b5dc839e77f634616f6e0 | ORPH
  mips64el   |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/c503d6a583adb52df08e9cf7bc6e76e6bb57c3a7 | ORPH
    arc      |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/9791781958b6fda79dc8125a7be709cf3dc326dc | ORPH
   sparc     |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/3160daa03a5d6d22f73aacc5e5a3bcb8c106db96 | ORPH
    arc      |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/016f8abde2f45c8906f48c73280ead854a18870b | ORPH
  sparc64    |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/51820d61b5d09d6ea53026b921dbb0735f211033 | ORPH
powerpc64le  |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/c322e9d20a3b903155484c14e3ca88c030b2d865 | ORPH
  powerpc    |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/98fdd7a9214f5f3d8e4a8aa5a1329a210c90d620 | ORPH
  powerpc    |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/d8ee1f40f16afc6469d62c7d763ab1bb6ceb3411 | ORPH
   armeb     |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/fa2f1e928109d724fce6733b7ebef9ff81f51eec | ORPH
  aarch64    |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/fb9ce0ea8a1f6af993ad53419b5e651da829f95b | ORPH
   xtensa    |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/3eec63ffec93b8975cb666076c3eb83bea608710 | ORPH
  mips64el   |         snmppp-3.4.10          | NOK | http://autobuild.buildroot.net/results/36b08dba6a07a2d19bf5342488693926e6f98298 |     
   mipsel    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/e63421b88e9f87790e33b463ba7e1eb6b2ba4580 |     
 aarch64_be  |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/77680bfbe4ef98747ca7cb7c5ae905c047ab2b25 |     
   x86_64    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/34f8d3051fce3c7f1f28a8581d27dcf497f56343 |     
  sparc64    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/18ec1545dbf0a1f51dd461c6f87c9ca9c0e5a082 |     
    arm      |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/cb69c1798eb918b9aa416f8d91e592e75a3683f8 | ORPH
   s390x     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/8458751076b39a082553f327ab8cac46dd114fc5 | ORPH
   armeb     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/abb58e710e1d0c5e4d5685fa9d40469472511b84 | ORPH
   mipsel    | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/198212e1a7eac34b0b13d8e3e5b71f216fa0a4c3 | ORPH
    mips     | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/6e84dde8f2a722d8ff7ef9b05db16553fcf7b90e | ORPH
    mips     | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/d39155496a6987f4ecebbc0d8311620e3572cd03 | ORPH
    or1k     |        traceroute-2.1.0        | NOK | http://autobuild.buildroot.net/results/b01f7783d1dd8183c366a3a82c29aeb2cf495bf7 |     
    sh4      |        traceroute-2.1.0        | NOK | http://autobuild.buildroot.net/results/02910480e5d77e41fc52ff5187330d3b433643b2 |     
   mipsel    |        traceroute-2.1.0        | NOK | http://autobuild.buildroot.net/results/76d84a872763bec1b22f53edf313c1d4ca6d4aa1 |     
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/f539a054cd3185b0dd317385b953e99773304f88 |     
    m68k     |          umtprd-1.6.2          | NOK | http://autobuild.buildroot.net/results/0331fb9cf2748b16440ef830d09452a9812f5217 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/ee9e41badcf38ce27a6faa03e887c195deb93105 |     
   armeb     |            unknown             | NOK | http://autobuild.buildroot.net/results/6896eefe0969f9d6c86a67aa4c71226169ced990 |     
 microblaze  |           vde2-2.3.2           | NOK | http://autobuild.buildroot.net/results/74086b201fb37ea0fe02e55a591186958788090e |     
   sparc     |           vde2-2.3.2           | NOK | http://autobuild.buildroot.net/results/e8b7df25a4e2fead771589a2debb103f2acbda41 |     
   xtensa    |           vde2-2.3.2           | NOK | http://autobuild.buildroot.net/results/aa1ac30dd2e251dc2b8026673bad2eb7e029de06 |     
  mips64el   |           volk-2.5.2           | NOK | http://autobuild.buildroot.net/results/263021ac00e642282f9e52938c30d301d42de875 |     
   armeb     |         wolfssl-5.5.1          | NOK | http://autobuild.buildroot.net/results/e3b6677f597f3c26444877809423aa3ff4f3d63f |     
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/41c19f599afd7bb0136c17af245afcaa59e333d1 | ORPH
    mips     |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/307faeb443c32458958d80ff61d8d81f86a5707d |     
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/a70941a903123bb25fed5ca03cf0d6ecdc21d0ba | ORPH


Classification of failures by reason for 2022.02.x
--------------------------------------------------

            igd2-for-linux-2.1 | 2 
libcamera-1966b9a58436fab51... | 1 
                 wavemon-0.9.4 | 1 
                 wolfssl-5.5.0 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/3c2e02d880ab7281f4c6d8aa085a216f802847ff |     
    mips     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/75b8d182b6d3b76bc42a062af546201304d4021e |     
  riscv64    | libcamera-1966b9a58436fab51... | NOK | http://autobuild.buildroot.net/results/8bfe32a0eb2f259b3db95b5296403c76c2982013 |     
    mips     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/44ca9ef3fa90b80ff092075038d3ba61f2f10a91 | ORPH
   mipsel    |         wolfssl-5.5.0          | NOK | http://autobuild.buildroot.net/results/57991d6cd1356e3b96aacbb88c3e3a3200c7964f |     


Classification of failures by reason for 2022.08.x
--------------------------------------------------

                  acpid-2.0.33 | 1 
              dieharder-3.31.1 | 1 
                     gmp-6.2.1 | 1 
host-pahole-73383b3a39afe86... | 1 
host-spirv-llvm-translator-... | 1 
                   json-c-0.16 | 1 
                libcurl-7.84.0 | 1 
make: *** wait: No child pr... | 1 
                       unknown | 1 
                     vdr-2.6.1 | 1 
                 wolfssl-5.5.0 | 1 


Detail of failures for 2022.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          acpid-2.0.33          | NOK | http://autobuild.buildroot.net/results/2b6115c6d6992d250042b0f1f8d2defa02436c0c | ORPH
microblazeel |        dieharder-3.31.1        | NOK | http://autobuild.buildroot.net/results/5602ccafa1c1e4077cc6298b425d83449cd03920 |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/aae7d44f7f591ab419eded5856982d5b7ec80a03 | ORPH
   mips64    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/88a95af1f6ff81c574d1809ad3f90502320bab33 |     
  riscv32    | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/82fadcdf2724e330dfe12a8528411b66155d1f3b | ORPH
  riscv64    |          json-c-0.16           | NOK | http://autobuild.buildroot.net/results/331e1b69412b2e553a43f19c0852a458065f03d1 |     
  riscv64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/99e9dc159ea2d093341f48c027b1d1ebd95ce088 |     
   mips64    | make: *** wait: No child pr... | NOK | http://autobuild.buildroot.net/results/1b44fa52b1dd77d9930c09ddbbe87fcc89b1d0fb |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/eb3a48d1d13df10e5cf6bba75416b3939dbbbdba |     
    arm      |           vdr-2.6.1            | NOK | http://autobuild.buildroot.net/results/9bace99025e77d88d47b9f43d0d54f64226ed4cf |     
    arm      |         wolfssl-5.5.0          | NOK | http://autobuild.buildroot.net/results/9fec4c6a918a590ac02781d60873f1dc73fbc04f |     


Gitlab CI results for 2022-10-14
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                amarula_a64_relic | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035122  |      
                         arm_juno | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035129  |      
   atmel_sama5d27_som1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035151  |      
   atmel_sama5d2_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035153  |      
       atmel_sama5d3_xplained_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035155  |      
   atmel_sama5d3_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035158  |      
       atmel_sama5d4_xplained_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035161  |      
   atmel_sama5d4_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035163  |      
                        avenger96 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035164  |      
                      bananapi_m1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035165  |      
                 bananapi_m1_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035166  |      
                 bananapi_m2_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035167  |      
                     bananapi_m64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035171  |      
              freescale_imx8mnevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035204  |      
            friendlyarm_nanopc_t4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035212  |      
           friendlyarm_nanopi_a64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035213  |      
            friendlyarm_nanopi_m1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035214  | ORPH 
       friendlyarm_nanopi_m1_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035215  | ORPH 
            friendlyarm_nanopi_m4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035217  |      
          friendlyarm_nanopi_neo2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035219  |      
          friendlyarm_nanopi_neo4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035220  |      
     friendlyarm_nanopi_neo_plus2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035222  |      
            friendlyarm_nanopi_r1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035223  |      
                 imx6-sabresd_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035242  |      
                        imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035274  |      
                kontron_bl_imx8mm | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035279  |      
                       ls1028ardb | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035296  |      
                mender_x86_64_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035298  | ORPH 
      microchip_sam9x60ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035301  |      
...hip_sama5d27_wlsom1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035304  |      
    microchip_sama5d2_icp_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035307  |      
      microchip_sama7g5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035310  |      
                  minnowboard_max | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035312  |      
                            nezha | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035324  |      
                       nitrogen8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035328  |      
                      nitrogen8mm | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035330  |      
                      nitrogen8mn | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035331  |      
                      nitrogen8mp | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035332  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035358  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035363  |      
                     orangepi_pc2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035366  |      
                    orangepi_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035372  | ORPH 
                   orangepi_prime | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035374  |      
                  orangepi_rk3399 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035377  |      
                     orangepi_win | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035379  |      
                   pc_x86_64_bios | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035389  |      
                    pc_x86_64_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035391  |      
                   pcengines_apu2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035392  |      
                           pine64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035393  |      
             qemu_arm_vexpress_tz | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035400  |      
          qemu_riscv64_nommu_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035431  |      
                qemu_riscv64_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035432  |      
                       qemu_s390x | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035433  |      
                     qemu_sh4_r2d | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035434  |      
                   qemu_sh4eb_r2d | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035435  |      
               qemu_sparc64_sun4u | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035437  |      
                  qemu_sparc_ss10 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035439  |      
                         qemu_x86 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035442  |      
                      qemu_x86_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035441  |      
                 qemu_xtensa_lx60 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035444  |      
           qemu_xtensa_lx60_nommu | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035445  |      
                      raspberrypi | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035458  | ORPH 
                     raspberrypi0 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035446  | ORPH 
                    raspberrypi0w | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035448  | ORPH 
                     raspberrypi2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035451  | ORPH 
                     raspberrypi3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035453  |      
                  raspberrypi3_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035452  | ORPH 
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035454  | ORPH 
                     raspberrypi4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035456  | ORPH 
                  raspberrypi4_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035455  | ORPH 
                 raspberrypicm4io | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035460  | ORPH 
              raspberrypicm4io_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035459  | ORPH 
                raspberrypizero2w | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035462  |      
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035463  |      
                    roc_pc_rk3399 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035465  |      
                           rock64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035467  |      
                        rock_pi_4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035468  |      
                      rock_pi_n10 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035469  |      
                       rock_pi_n8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035470  |      
                        rockpro64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035471  |      
                      roseapplepi | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035473  |      
                 s6lx9_microboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035474  |      
                       sheevaplug | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035475  |      
                  sipeed_maix_bit | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035477  |      
           sipeed_maix_bit_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035478  |      
                 sipeed_maix_dock | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035481  |      
          sipeed_maix_dock_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035482  |      
                   sipeed_maix_go | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035483  |      
            sipeed_maix_go_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035485  |      
                 sipeed_maixduino | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035486  |      
          sipeed_maixduino_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035487  |      
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035488  |      
              snps_archs38_axs103 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035489  |      
                snps_archs38_haps | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035490  |      
                snps_archs38_hsdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035491  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035492  |      
                solidrun_clearfog | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035493  |      
          solidrun_clearfog_gt_8k | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035494  |      
            solidrun_macchiatobin | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035496  | ORPH 
                    spike_riscv64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035497  |      
              stm32f429_disco_xip | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035498  |      
               stm32f469_disco_sd | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035499  |      
              stm32f469_disco_xip | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035500  |      
                  stm32mp157a_dk1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035503  |      
                  stm32mp157c_dk2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035504  |      
              stm32mp157c_odyssey | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035505  |      
        terasic_de10nano_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035507  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035508  |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035509  |      
                           ts5500 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035510  |      
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035512  |      
                         uevm5432 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035513  |      
                        wandboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035515  |      
                            warp7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035516  |      
                        warpboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035518  |      
                    zynq_microzed | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035522  |      
                      zynq_qmtech | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035523  |      
                       zynq_zc706 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035525  |      
                         zynq_zed | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035529  |      
                zynqmp_kria_kv260 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035531  |      
                    zynqmp_zcu102 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035534  |      
                    zynqmp_zcu106 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3166035535  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
