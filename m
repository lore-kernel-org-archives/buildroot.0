Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C410DC433F5
	for <buildroot@archiver.kernel.org>; Sat,  1 Oct 2022 05:36:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2118660E6D;
	Sat,  1 Oct 2022 05:36:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2118660E6D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hz2GG6dYE0gU; Sat,  1 Oct 2022 05:36:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7223C60C23;
	Sat,  1 Oct 2022 05:36:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7223C60C23
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B37A71BF5EA
 for <buildroot@lists.busybox.net>; Sat,  1 Oct 2022 05:36:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 88789419BD
 for <buildroot@lists.busybox.net>; Sat,  1 Oct 2022 05:36:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 88789419BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DcD1he1YWxXj for <buildroot@lists.busybox.net>;
 Sat,  1 Oct 2022 05:36:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED72E419B7
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ED72E419B7
 for <buildroot@buildroot.org>; Sat,  1 Oct 2022 05:35:59 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 176EA2000A
 for <buildroot@buildroot.org>; Sat,  1 Oct 2022 05:35:56 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sat, 01 Oct 2022 05:35:56 -0000
Message-Id: <20221001053603.88789419BD@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1664602557; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=cUHiPYQTP2rrMi9pRqZqVxJo8sJWqHYvsltoKzIk4Ks=;
 b=JhJZ5RC+J7QXQiGSHwxY8XYIbzsD9D7SHchBuZ0h4VOEknFYfJhb1fFQ3B4b8zGnbQqbCn
 0pMg/wEEeO13+VxlsgiPM+8nlzwzXOGjwACHWyndpdqNuy7KHAX9N1sYkjT9VGy4bcek+k
 S56FZfjRBDJ+AhMeCluRMMewFC2N4zRGyy1Vxs4FtQ4XljHZDfWMrdpQMKODOPRzbizKIV
 XlsasYwF5sLzLhzYABWZik24Hv9Jx7kaUQqSSRQec4xjeRa+Zs8ZtvF3IKQTX+BLmwYPXA
 kcuI0cdg2dWhLXLhIZj0XbdeGTDI0GSTxZYBLjUP2cn4gfvk6oOpoTAc+FPphQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JhJZ5RC+
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-09-30
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

Autobuild statistics for 2022-09-30
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  4  |  1  |  1  |  6  |
  2022.05.x  | 18  |  7  |  0  | 25  |
    master   | 134 | 290 |  0  | 424 |

Classification of failures by reason for master
-----------------------------------------------

                      crun-1.5 | 20
        host-sentry-cli-1.59.0 | 17
            igd2-for-linux-2.1 | 13
                       unknown | 13
                  autofs-5.1.8 | 10
glibc-2.36-44-g2628500f5dff... | 10
              libarchive-3.6.1 | 10
                 sysvinit-2.99 | 10
                host-go-1.19.1 | 8 
                 systemd-250.4 | 8 
            btrfs-progs-5.16.2 | 6 
            host-binutils-2.38 | 6 
                gerbera-1.10.0 | 5 
  gobject-introspection-1.72.0 | 5 
                   hdparm-9.63 | 5 
              host-rust-1.64.0 | 5 
                 linux-5.17.15 | 5 
                 dash-0.5.11.5 | 4 
         host-gcc-final-11.3.0 | 4 
               libglib2-2.72.3 | 4 
casync-4ad9bcb94bc83ff36cfc... | 3 
                elfutils-0.186 | 3 
                  gensio-2.5.2 | 3 
            host-binutils-2.39 | 3 
host-pahole-73383b3a39afe86... | 3 
               libcap-ng-0.8.3 | 3 
             libgpg-error-1.45 | 3 
        ltp-testsuite-20220527 | 3 
                    lxc-4.0.12 | 3 
                 wolfssl-5.5.0 | 3 
dahdi-linux-5c840cf43838e06... | 2 
       freeradius-server-3.2.0 | 2 
gummiboot-2bcd919c681c952eb... | 2 
            host-binutils-2.37 | 2 
         host-gcc-final-10.4.0 | 2 
host-gdb-arc-2020.09-releas... | 2 
            igh-ethercat-1.5.2 | 2 
                   linux-tools | 2 
                     mtd-2.1.3 | 2 
                  ntp-4.2.8p15 | 2 
            quickjs-2021-03-27 | 2 
                 sudo-1.9.11p2 | 2 
                xenomai-3.0.10 | 2 
                 zlib-ng-2.0.6 | 2 
                  acpid-2.0.33 | 1 
afboot-stm32-3566acd582e553... | 1 
              alsa-lib-1.2.7.2 | 1 
               apcupsd-3.14.14 | 1 
                bitcoin-0.21.2 | 1 
                bpftool-v6.8.0 | 1 
                    brltty-6.4 | 1 
                  cairo-1.16.0 | 1 
                 coreutils-9.1 | 1 
          cryptodev-linux-1.12 | 1 
                 dmalloc-5.6.5 | 1 
              dropbear-2022.82 | 1 
                     efivar-37 | 1 
              erlang-22.3.4.22 | 1 
                  exempi-2.6.1 | 1 
                 fdk-aac-2.0.2 | 1 
                  ffmpeg-4.4.2 | 1 
               fftw-quad-3.3.8 | 1 
                     frr-8.3.1 | 1 
fs/cpio/cpio.mk:117: /home/... | 1 
fs/cpio/cpio.mk:117: /home/... | 1 
fs/cpio/cpio.mk:117: /nvmed... | 1 
fs/cpio/cpio.mk:117: /nvmed... | 1 
fs/cramfs/cramfs.mk:46: /nv... | 1 
fs/ubi/ubi.mk:51: /nvmedata... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
                     gmp-6.2.1 | 1 
              host-delve-1.8.0 | 1 
           host-python3-3.10.7 | 1 
host-spirv-llvm-translator-... | 1 
                  jack2-1.9.20 | 1 
kvmtool-f77d646ba01d04be5aa... | 1 
                 libclc-13.0.1 | 1 
                libcuefile-475 | 1 
               libdeflate-1.12 | 1 
              libgcrypt-1.10.1 | 1 
        liblog4c-localtime-1.0 | 1 
               libmdbx-0.11.11 | 1 
              libostree-2022.5 | 1 
              libsodium-1.0.18 | 1 
                libzlib-1.2.12 | 1 
       linux-5.10.109-cip5-rt4 | 1 
luajit-5677985dc1f19cf0a671... | 1 
               mariadb-10.3.36 | 1 
                    mpfr-4.1.0 | 1 
                    musl-1.2.3 | 1 
                  ntpsec-1_2_1 | 1 
            ocf-linux-20120127 | 1 
              open62541-v1.3.3 | 1 
                 openssh-9.0p1 | 1 
                   perl-5.34.1 | 1 
              procps-ng-3.3.17 | 1 
                    qemu-7.1.0 | 1 
rtl8723ds-76146e85847beb242... | 1 
                    sdl-1.2.15 | 1 
              skalibs-2.10.0.3 | 1 
             stress-ng-0.13.05 | 1 
                tealdeer-1.5.0 | 1 
           uboot-tools-2021.07 | 1 
                 uclibc-1.0.42 | 1 
               valgrind-3.19.0 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          acpid-2.0.33          | NOK | http://autobuild.buildroot.net/results/c19fd0cd8e5db1fb1828570d0883fb900b780c56 | ORPH
    arm      | afboot-stm32-3566acd582e553... | NOK | http://autobuild.buildroot.net/results/4394bc30aefb5c88a906cf38b9e90176e54cdf4a |     
powerpc64le  |        alsa-lib-1.2.7.2        | NOK | http://autobuild.buildroot.net/results/346549264d4b5404b6726323b0194abe6c798ab9 |     
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/c09f18e0bb2bf4a8dcb4d50dd1ed1392ab6c8d04 |     
   mipsel    |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/210ae9d27002e332f44b5d63af76013b4914dc86 |     
    mips     |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/3527aa9ea8e151bacad792302b1c4fa46d1a2321 |     
   sh4eb     |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/6321a82fbd8b2917539e37631447bd6e75e39269 |     
    i586     |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/7381d4ee7df1523f88cfc1a0c263793ede3ecd91 |     
 microblaze  |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/2378bc8e7994f41c9fc80f26d0d2e129f7919747 |     
   nios2     |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/98278127535846e2ba80e0c9ab5211fad4023211 |     
   mipsel    |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/b7389ca1db7679f65f2b7423a2d2af73ac4cf9ae |     
    i686     |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/ce04b19669ee20c8fef569231a3c3b0fd8d3c1cc |     
  sparc64    |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/1757e20f24ae24ed881230843e81130c30613752 |     
   s390x     |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/1412189a94fe59b7193f745fcea4ba320cbcfe4a |     
  aarch64    |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/63e794bb6dda48163190ce2e006e304a20b180c5 |     
 aarch64_be  |         bpftool-v6.8.0         | NOK | http://autobuild.buildroot.net/results/aa2aad575178300792802d14c29b921286041a66 |     
microblazeel |           brltty-6.4           | NOK | http://autobuild.buildroot.net/results/f000a7c043e76bef384e5dfefa98d9e4412fc99f |     
   mips64    |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/4ac57ac49892dbbce06d1b5139515e85492f87e2 | ORPH
   s390x     |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/8a570b3685adfce6597c077620ef2bf2033f96e7 | ORPH
   s390x     |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/6b94618755158d129c3388bf6e75da135198b1c2 | ORPH
   mips64    |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/93609544f3673a83ef29edb2bf9a1dcbf95f2af3 | ORPH
   s390x     |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/b114f071bd7f707da8efb189fd7fe3a54a78a324 | ORPH
    i586     |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/92da93603cfb86c30c23712afcaf9de4c1e5ff61 | ORPH
   xtensa    |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/3c1c0df272004e3b46ffa271965608dc20041382 |     
  sparc64    | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/c6ebc1d8f96df8cd19304119ef8c4f4cf4e62c89 |     
microblazeel | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/95190eebf025b9e1d0723eed203bdbb80bc87315 |     
  sparc64    | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/feb52d2b30a6f6ac67660dc9b1333adb8504ac48 |     
    sh4a     |         coreutils-9.1          | NOK | http://autobuild.buildroot.net/results/38d9c95b3f6cf8ffada10f22c530d493a693247e | ORPH
    mips     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/911a16764a97b20553985491ced63bd8ea5ab996 |     
   armeb     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/6cec43df7af91c12988165351a99c500984cbbd8 |     
    arm      |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/a1af82ab539d436ba4b4618e0cff2d3e841859a4 |     
    i686     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/c6bc66dd7de13b03207a85fd6933474f5dabc1b2 |     
  riscv32    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/7eda6a71816750719e60e05b584b73475ca21e9f |     
    mips     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/27b7da26bdbb109f6b5268356615a5d5322f7caf |     
   mipsel    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/29ad54e314f3bc3bb73bcc8c7b707c426ad987cf |     
   sh4eb     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/044d4326ca0b279968fed29b7462a71e7b472f6a |     
  mips64el   |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/aef2a3965a26058f2e5d0b44223f2f350921456c |     
    arm      |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/1195e02791a659858b6b47bbcb6c02e2f79f0d8a |     
   armeb     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/c86ca467ea703af49a7994fee0c8342ab3263291 |     
    arc      |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/eb60a753cb5d6b19d4fd3119c069a1311a7fcd7f |     
   armeb     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/a7c5c6034ed25bea34ec33b09744e3adaa5fc426 |     
   mipsel    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/878a794d8d49656e19784ca698fdf900c727bbb6 |     
  mips64el   |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/f452fe08a1e7db2cf1a01aaa31185f404d4b3da1 |     
  riscv32    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/66682a3ef00813661de9bfba16b17b1198093eef |     
    arm      |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/252cbc44a5b7f813ef89fd1c39528dc8fe8308b5 |     
  mips64el   |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/dc5cf477849817da892093c325c9335973216e2c |     
    mips     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/67534e2633b8a023270e89836bb08797ad80d9cb |     
   mips64    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/07fcc2ba9fe576ddb55cb488d01da915980444b6 |     
   mipsel    |      cryptodev-linux-1.12      | NOK | http://autobuild.buildroot.net/results/a5b9521070135abfadd02ac7b25570c1c860817e | ORPH
   armeb     | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/e83b49e5a4733b7b97c05949d721ec0218b4a0cf |     
   arceb     | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/5cb5e3852f4b86bd82d2d985dd29edb0edf00f6a |     
 aarch64_be  |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/5b2ca2593707b67b969a387c6167428b7380eaac | ORPH
    mips     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/063515ed3309e7cf1564f4b20869a02bc0f9f201 | ORPH
 powerpc64   |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/a7c2dd2762d12e5fd351d6f50bed39cc59310154 | ORPH
 microblaze  |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/479b697c384f447eab9b17e868077e0c3e9ec1fe | ORPH
    i686     |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/ebb5033cff73f1454df55cd455706a5342d6ca4c | ORPH
  riscv64    |        dropbear-2022.82        | NOK | http://autobuild.buildroot.net/results/4c286a9c699e8d571924831a52ee572ffd11df03 |     
    i686     |           efivar-37            | NOK | http://autobuild.buildroot.net/results/445569510364ee78acecd2b44cbf468803eec4ad |     
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/98867cd2cfe3420478fe58e985a81e44db5d8d8f | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/b442c71270242334f613996b8be279a564ca686e | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/f35dcfbb64d2ddf943dacf3708cfa07f3da038a1 | ORPH
  aarch64    |        erlang-22.3.4.22        | NOK | http://autobuild.buildroot.net/results/09eeebfe88cfcb759921d68527e3cee9c66ceaf4 |     
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/3f6f808db1451cb58e2bb5682a2209e585758d88 |     
    arm      |         fdk-aac-2.0.2          | NOK | http://autobuild.buildroot.net/results/0fcc3d849570188479bfc3e5823a1b64b053df4b |     
   arceb     |          ffmpeg-4.4.2          | NOK | http://autobuild.buildroot.net/results/44917339eb5a186e808aedb38346748991d8cee5 |     
powerpc64le  |        fftw-quad-3.3.8         | NOK | http://autobuild.buildroot.net/results/c68ce0ff58d011f58311458e51a76f2e1c525184 | ORPH
  powerpc    |    freeradius-server-3.2.0     | NOK | http://autobuild.buildroot.net/results/ca4f26d527f060951a5f1efa2e1be998571b765f |     
 powerpc64   |    freeradius-server-3.2.0     | NOK | http://autobuild.buildroot.net/results/3c0ea4fbcd6cc5b5f6642a405f6dbcaae5a30e1a |     
   arceb     |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/89c89f029a943c3bbdd90183f62d32441888ffce |     
  powerpc    | fs/cpio/cpio.mk:117: /home/... | NOK | http://autobuild.buildroot.net/results/14ec3713420fa064a7894288dc82bb934839d0b6 |     
powerpc64le  | fs/cpio/cpio.mk:117: /home/... | NOK | http://autobuild.buildroot.net/results/8c6f2d063fb2c021dd1c14b13f4a6fe4f40c3ff0 |     
 powerpc64   | fs/cpio/cpio.mk:117: /nvmed... | NOK | http://autobuild.buildroot.net/results/471544eed4fb692389b9901e9768c97e64062c36 |     
    arc      | fs/cpio/cpio.mk:117: /nvmed... | NOK | http://autobuild.buildroot.net/results/dae1f8d13097d60d7862b4048547bffcf9a2a6dc |     
    arm      | fs/cramfs/cramfs.mk:46: /nv... | NOK | http://autobuild.buildroot.net/results/3feb0ea546d3d0af56e0af71ddc407e0e0ed70df |     
  powerpc    | fs/ubi/ubi.mk:51: /nvmedata... | NOK | http://autobuild.buildroot.net/results/7d99f367f25786e85220f4507c4579209d2b0b8b |     
    mips     | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/62845a9c8ea62f6a0f70aae41f5cc04d5d91eb26 |     
 microblaze  | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/d50afee90c4c9b987d1dacdd7232b1a9c7466254 |     
microblazeel | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/6ea4593d1759ae24c684caa6e726f2fcb133d95f |     
    m68k     |          gensio-2.5.2          | NOK | http://autobuild.buildroot.net/results/e8880c664bfcc7385fc99e7a4050cb982dd1d852 |     
    arc      |          gensio-2.5.2          | NOK | http://autobuild.buildroot.net/results/56133017f958125b25b6f8b5e14d4b435b453e0f |     
    i686     |          gensio-2.5.2          | NOK | http://autobuild.buildroot.net/results/01964b5a6935a1efa69bec0b24c08a2aeaf388b5 |     
    mips     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/f03d723155c70a14054f0a8227bc63f863c5208e |     
   x86_64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/954a1d87ea4dd03320180c3d26d9fc5e8df1bdbc |     
   sh4aeb    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/ee0ea90a094fbbaf9eae987a597a6abb61ee15de |     
    or1k     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/48e844aa3d9361205d678ba3ef59d261c68e1d33 |     
    or1k     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/b3bdfcd9373dcbb1bc7e322e34f4ee43b222ab39 |     
   sh4aeb    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/3a73daf092a96fbee3b3c22216737b4d21773fbf |     
    sh4      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/6ce881ce6aa95c287c84b14dc1ad38d314194948 |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/9ba1549748bf313cd7b9c7ccf9783e449a60c941 |     
   x86_64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/f949dc7fd14d5c77ec8502c317bb2dfa7087b97b |     
    or1k     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/0e75fb3d6afde6c61d7a5dd4f0c1bb58b7c65cd0 |     
   mipsel    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/ca369e50be89979c14bd41ac6ed8c3177254952a |     
   x86_64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/96cfeb41f741dc158887d7b4e687f31096d2727b |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/a46e1280083d01a7681978804b2d9cf70cf50b22 |     
   sh4aeb    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/a2362c1efad2b313d87320d0e51e4c789086ddc2 |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/dccd3ef6a0b285d9a9a50cbe5d688364b031fc9b |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/a8e4140a6d75e714b278ec0ff1d749f11bec53b9 | ORPH
 microblaze  |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/aa3dccc92ede2542c40f45956de3fdeb1b7216fe | ORPH
 powerpc64   |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/81abc1c12c2a5bd0fc0751ee404098696abf5c6f | ORPH
    or1k     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/fc7873a1f23200154790e4f762002d39602b4ba3 | ORPH
powerpc64le  |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/5668c62062850a0beda11cddc12357560ce43b14 | ORPH
   nios2     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/81b41e2fefb522043c43c0ca12ef148f4930671a | ORPH
   x86_64    | gummiboot-2bcd919c681c952eb... | NOK | http://autobuild.buildroot.net/results/e947b209fcd9830fe82cd1d8eee1fde83fc42a6d |     
   x86_64    | gummiboot-2bcd919c681c952eb... | NOK | http://autobuild.buildroot.net/results/f33617892d890781bba3e8fdf9d6d3782469ece3 |     
   nios2     |          hdparm-9.63           | NOK | http://autobuild.buildroot.net/results/03f4a0869c2a9b80c3b369e33f9aef9cdc09639f |     
    sh4      |          hdparm-9.63           | NOK | http://autobuild.buildroot.net/results/343d920fc7f64654a0e2f39a16aba50655a89970 |     
   s390x     |          hdparm-9.63           | NOK | http://autobuild.buildroot.net/results/1c7273656e3e32194674f11ff850308c1ae530c2 |     
   mips64    |          hdparm-9.63           | NOK | http://autobuild.buildroot.net/results/3e5b167113aee08f8377c8fd402874dd1a9d2eed |     
  sparc64    |          hdparm-9.63           | NOK | http://autobuild.buildroot.net/results/db70c0e3d8e6adb4bdacc3043186f18e4c6fbc00 |     
    i686     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/bcfee5e1ee2e41199cf11769e749e4ce1b1a1418 |     
    m68k     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/4f2a087cd83594addc7cccf462efccee1ef2f3b5 |     
   nios2     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/218be2f1a86a667ed295526e7c1595fb06462123 |     
   s390x     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/528b93c8e333f19407817a3cb9c4719806af9b08 |     
 microblaze  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/9638cc221d9a17335e2cc9a9872662b8a78887d3 |     
   x86_64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/0a9a1919643f529f44a42379844f54b57dd9e5e9 |     
 aarch64_be  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/b576ea88984c877683a1f7ffd53b2e160cce1620 |     
 powerpc64   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/2150bb870ea60c78546bf6705ba18609f7489bee |     
   mips64    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/60b3df8c0b449ef19acfbb5b6b0c8a35dd32263d |     
   xtensa    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/43bcb85cea0bc07933c1c4b173d6c30372226670 |     
  riscv32    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/802865d6d7dccdfa95e52a4fceaf7da7a952188a |     
   x86_64    |        host-delve-1.8.0        | NOK | http://autobuild.buildroot.net/results/e8e51c24fe689304d6d0247362d3200a3ce9b034 |     
    mips     |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/1d2128d3d0912c349ea0f36a1817a445c9569d39 |     
   s390x     |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/37f81f6c73dec15a38275e3c53c8ca741361285d |     
   s390x     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/19c1d6e98d83409e8def04de5af6fa5672183789 |     
microblazeel |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/389cb0becc8946f78388130787843acbdcd17ef2 |     
   x86_64    |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/ee64bcd961c99ffb73f1cf0a78bb37abbee1f6f3 |     
    i686     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/2879265e9e605a9fcff795ea5fe19dc355c19f81 |     
    arc      | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/253f406f3ce58ba7eddca26f7df12ef2e88bc892 | ORPH
    arc      | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/aa32b2d532e298b41c9112f2579ceb75e9c53020 | ORPH
   mips64    |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/dcada4a4cf12ec4ceb05a2ba9010230e1fbd7d62 |     
    i686     |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/da0da8fefe2ff4d41dd738ae81db3e9a6185bfdf |     
  mips64el   |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/b023afaafb6068f91f0878388951f6d798172be5 |     
  mips64el   |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/bf63c696cb3f7c5ebf27d3171b75d53fb1fd0d7e |     
   mips64    |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/61aef9919f1b74a9625f0859159305c35b441b64 |     
    i586     |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/d0e17ba9e5afecb08fc2abe572003ad8f3d0874c |     
  mips64el   |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/7dcd83e29114d5d4ae2954665925a03f9e9eb424 |     
   mips64    |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/697b9c46e7369f6616e44ee7c6db6706ecc9c618 |     
    or1k     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/1774d6fd6a1402c7d9821b5777a4ebd7cd56d9cd |     
   x86_64    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/d6ad839a3c8ced1752ee63cd836bd18ef3118539 |     
    arm      | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/ee0c167d6bf053c14756f995b0183fdda164a9fc |     
   sparc     |      host-python3-3.10.7       | NOK | http://autobuild.buildroot.net/results/f232b85766813ef5081dce104e62335aaa26c0e8 |     
   mipsel    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/29043ebb32614921373b50f05a9b2b9fdc4c7fbf |     
    mips     |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/ed487fa436bbf0ea39af9f943cc2677148aeaef2 |     
   x86_64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/b43f439916123fb51c79a7e3da4d4e004f5deda1 |     
   mipsel    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/c443c1c73bd5477adf1e6534eb4ed9e606bc4326 |     
   x86_64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/6b8f3eed11461df33677fa8b3ce2c6fc3ca2db9e |     
   x86_64    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/1fc2762372492e0a1b4522dd2c9cddc81497bbfc |     
  riscv32    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/db505a4f3447f0fc580a226d4df4eb7ed211dca5 |     
    mips     |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/47d6bc012892d49919464159979a637a7e9f0045 |     
 powerpc64   |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/4c05ea00bebe9bbf43fd893b9bb97adb3db1afd4 |     
    arm      |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/d2ba994ca028937fadca91b9f71d78c561ac8cbe |     
   x86_64    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/8d1bc949aff5471fa6787cc05cb5c037b6669269 |     
   sparc     |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/ab5171acb971cf111cd5b1a8ce0cfb903487c5b8 |     
    arm      |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/f0ae99cbc79195cfc03987281cabb242d2bd7b2e |     
  riscv32    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/26dc0bd36ba9208132f18bc825780b1aac9964e1 |     
    arc      |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/c8c686c439a530d5ff8b1dec02255c380d42f5b1 |     
   x86_64    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/87223fd971bb6822b7bc4439d232614aed84b1c0 |     
    arc      |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/6eb10b20e60205b7e0162186af460cd58dfb0608 |     
    mips     |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/f40db7779c64a1ce80f15a7ccf7372d7f32f6e06 |     
   mipsel    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/1f0dfc92bc2e256c2c8c66e522694e676ddc82f4 |     
   sparc     |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/f4837186b711aa0eec3c3accdbe3e767b7b96b07 |     
  mips64el   |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/80414785e46df5d004093ffd9f3be29562792777 |     
  powerpc    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/6607dfbd7f6010d215becb3040548d097a5c7dea |     
  aarch64    | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/baeafd80e8bae5af0f1f99bd3a3bea383c65b053 | ORPH
  powerpc    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/425b7a1c17cfaef84500c67e6173c69277a20e75 |     
   mipsel    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/1fa20f210efcad65316a0d47b0643e1f749ee4eb |     
   nios2     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/2e00edd06ee3a48f54853c3ea6e28e3b9c7708c3 |     
microblazeel |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/92ff06db127d6dfa5db260792fcdc3b8b43e9b9c |     
microblazeel |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/464a05ec4b31f30d12d3618cea37002f118fe905 |     
    or1k     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/c0af5123e0e4c05614c755ce824d3d0482cd212d |     
   mips64    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/a854b7c96745d9c67a5151e592319f55f71ad335 |     
   mips64    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/64728d09ebb7e93401c5ce4812bea8b45d8d1f42 |     
 aarch64_be  |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/d604d7334355860eaee894e66d711eea0245a286 |     
   sparc     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/b6264c0f914543f3200ff2d1433618b24a8fd1af |     
 aarch64_be  |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/0701290d8711f8075c2e5a3c9069c2b6659cd616 |     
 aarch64_be  |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/e794c53e1290fceba1abbf5345163b66226c165d |     
microblazeel |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/1cda27bc60fb3ba6dd53386a16e6813920daa624 |     
   arceb     |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/961e85c07651e1fe4092e41743c0e7deeb1d97e7 |     
    arm      |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/15f246c658dd7f47a9f1150fe7093c34f668d66e |     
    m68k     |          jack2-1.9.20          | NOK | http://autobuild.buildroot.net/results/2bcca3f478868d27c81cb75c826b592d4d87a0a2 |     
   x86_64    | kvmtool-f77d646ba01d04be5aa... | NOK | http://autobuild.buildroot.net/results/070fae6c0811ab1edc30fa4834f19a25635db6f6 |     
  aarch64    |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/48b95964caa997455329538f46c12aae1c3866df |     
    mips     |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/0c08d6e18f623121f4cc3a275824a47a8677fd5b |     
  aarch64    |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/e9a9d9e98515a45afcf5715c7af31d4310132ff0 |     
   mips64    |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/35e0dd96aa2d92f289918b6421cc68d6a6fc58c8 |     
 aarch64_be  |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/8e8b1887563261079baae6496e25d47d373ca948 |     
  mips64el   |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/6ab8d05b4ed06a5b05d88823f85ebf115b8c4e72 |     
    arm      |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/9b0ad13f88ee2ce02b87c08a8640dde0d80d08ff |     
    or1k     |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/184b76bb42a8f4a88bbf9341676814a46da4f820 |     
  aarch64    |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/e37230d22cf63b494b8a7360ae32b1bd67fb0dae |     
   mipsel    |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/70946aac067fe67b1aa64842963778ca3390ab29 |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/8236639c12c6ed11a12a34afc2eddeda248cbbf7 |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/04ba5ea1a5abf2f32debf70ffcb45a723ec90e55 |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/956d8aad40f43720420fb34b6c5e8d5f62237b83 |     
    arm      |         libclc-13.0.1          | NOK | http://autobuild.buildroot.net/results/02b07de42d631ba20d7512f0e3460128e79c3453 |     
  riscv64    |         libcuefile-475         | NOK | http://autobuild.buildroot.net/results/b282406d72347e0985fc7ee6d85476cf11d576a4 | ORPH
   armeb     |        libdeflate-1.12         | NOK | http://autobuild.buildroot.net/results/28988fb5873b2dc49629d73931f7df0a9ae75fd0 |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/c9978e12e97e35862e135c023ae27180a9ae3593 | ORPH
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/c541c73e4497f98281386c1e540490e09b473aa1 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/ce51349aff7c3a2a395ec9aa2517d940f11d5cfb |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/58bd8fc7d2e8c8a4a7ba2ee2bd4c6404d2965d0c |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/6202ca7b2c221fd529df5ae01e8fd1d348ef1016 |     
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/3553379c16fb3df38ca6d312bc7e30eddf5f39eb | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/953b49a94a2c8309eeb975707c6227c5cedf0fad | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/4de46a881cc9f3ab75c96e28656eb4262f262304 | ORPH
  riscv64    |     liblog4c-localtime-1.0     | NOK | http://autobuild.buildroot.net/results/b97f6b790c34c8c9d2d83eaca694e74a7cc23dcd |     
microblazeel |        libmdbx-0.11.11         | NOK | http://autobuild.buildroot.net/results/1482995b5c9acc0888e7b94c1607827a5eddae9e |     
   armeb     |        libostree-2022.5        | NOK | http://autobuild.buildroot.net/results/6aa084f37d7d1f80df789524852dd5f000c8b20d |     
    arm      |        libsodium-1.0.18        | NOK | http://autobuild.buildroot.net/results/94cca2d29feb877b27f5d614b06666fa6866c4aa |     
  mips64el   |         libzlib-1.2.12         | NOK | http://autobuild.buildroot.net/results/1311b588f5da09dfeb2d8d94c81ce66854e6ff67 | ORPH
microblazeel |    linux-5.10.109-cip5-rt4     | NOK | http://autobuild.buildroot.net/results/1f54d6bcc4add3641ee342ba8a1f9a7a9decf4d9 | ORPH
   nios2     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/3557398d415d3b82eb9ae5fbfcf0d3cb0a529c0b | ORPH
  powerpc    |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/23d042b4c5ab0edf3ce78d06e8b9a9e1eb217157 | ORPH
   mipsel    |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/1e7d07a4c987e25a427a3ed69296fc573bdf7e06 | ORPH
   s390x     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/a6aff8fe878d66cb8c39f522d5045aa267966493 | ORPH
    m68k     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/743074f328c559bdd93ff7cdcdff7b45b7c9d074 | ORPH
    i586     |          linux-tools           | NOK | http://autobuild.buildroot.net/results/290af135a7b88019dd2b5575c0dc99d000df9ff6 | ORPH
   xtensa    |          linux-tools           | NOK | http://autobuild.buildroot.net/results/7bbc915c786cc6394efdf67ced350831747ce963 | ORPH
microblazeel |     ltp-testsuite-20220527     | NOK | http://autobuild.buildroot.net/results/917473164a36d1ae5e06f3c48df7bd74fed534c7 |     
    or1k     |     ltp-testsuite-20220527     | NOK | http://autobuild.buildroot.net/results/ee7d68ffae54e37ca12711d22b7f622003f2ce6a |     
  mips64el   |     ltp-testsuite-20220527     | NOK | http://autobuild.buildroot.net/results/3369cce98327d393fb9bfdd6caa44413694e7db7 |     
  powerpc    | luajit-5677985dc1f19cf0a671... | NOK | http://autobuild.buildroot.net/results/3752305d88805c60a2b8f2dee2e0ba1b8aac487b |     
powerpc64le  |           lxc-4.0.12           | NOK | http://autobuild.buildroot.net/results/8da283093e97eede71fe0a47e852f18d2fe0f1ee |     
powerpc64le  |           lxc-4.0.12           | NOK | http://autobuild.buildroot.net/results/1adaad1eabbce38dd4f90eb08e43b080c1b3ffa2 |     
  sparc64    |           lxc-4.0.12           | NOK | http://autobuild.buildroot.net/results/64922f0ea992a20c08333b2f0e379c368229f5b0 |     
powerpc64le  |        mariadb-10.3.36         | NOK | http://autobuild.buildroot.net/results/9bc4b3747e2740a9f3956df3b155981df8b74d61 | ORPH
    or1k     |           mpfr-4.1.0           | NOK | http://autobuild.buildroot.net/results/715fd4508df365085c826690f2be9202c1e987ba | ORPH
  sparc64    |           mtd-2.1.3            | NOK | http://autobuild.buildroot.net/results/efefa680bbcc71055f531982d909fa09cb5c7488 |     
 aarch64_be  |           mtd-2.1.3            | NOK | http://autobuild.buildroot.net/results/f31585cbd09cb4286768a5f7750db97d3e715ef6 |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/b08956ec6965a652c0357d0eab198fc430f0017d |     
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/34c9f694d4b6b485318658d7bde0f63f1cce18b5 | ORPH
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/bc7ffb21a485fc1d308e4d35ee3291cfa2b69696 | ORPH
    m68k     |          ntpsec-1_2_1          | NOK | http://autobuild.buildroot.net/results/da31815b0ce26a32718fda13b9a040884f6f6b80 | ORPH
microblazeel |       ocf-linux-20120127       | NOK | http://autobuild.buildroot.net/results/b77782ebd013d0d92cde8104d5a8e1e0ebfb5a91 | ORPH
  mips64el   |        open62541-v1.3.3        | NOK | http://autobuild.buildroot.net/results/27d16c8d462e760a0640ba4274ea7c0b699192b1 | ORPH
    m68k     |         openssh-9.0p1          | NOK | http://autobuild.buildroot.net/results/6591829b5d013995d11de28fae0963ea2e02b249 | ORPH
    arc      |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/c14d1991c629577f06fe46dfc3ac7bde1a7fb5ea |     
   nios2     |        procps-ng-3.3.17        | NOK | http://autobuild.buildroot.net/results/ce5a690bd3aecf41dd3726f27ec98adf2dc564f9 | ORPH
   x86_64    |           qemu-7.1.0           | NOK | http://autobuild.buildroot.net/results/511d2569f4167f1850ab4a3e5db66fa74f19e467 |     
   armeb     |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/de01f96ea771495282b13a37396aa21d29496cd7 |     
    or1k     |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/49457592280b3f5cfa645c6acf7ef5417c21ac06 |     
   armeb     | rtl8723ds-76146e85847beb242... | NOK | http://autobuild.buildroot.net/results/f02a9c6e89b79ac3fdeb0ab7fa2410db6a75eb58 |     
   sh4eb     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/177004d55c0985dbb6ba9833fd5b937201ae529d | ORPH
    or1k     |        skalibs-2.10.0.3        | NOK | http://autobuild.buildroot.net/results/4c7471d5a93447850a3f71ccf3db32e9ebf5d326 |     
   mips64    |       stress-ng-0.13.05        | NOK | http://autobuild.buildroot.net/results/1bfaf2cd090df6b5fdcb4826020ee4e73730e2e8 |     
 microblaze  |         sudo-1.9.11p2          | NOK | http://autobuild.buildroot.net/results/a23ad499bbc8c86f67f1990bba711b2fbf6fc11d | ORPH
   mipsel    |         sudo-1.9.11p2          | NOK | http://autobuild.buildroot.net/results/eb25452ef2985b798b1685e9d7d0663b774f76d7 | ORPH
  mips64el   |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/c7159cce1492e6c417e98c500cd82055ef1e4a39 |     
  aarch64    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/9fef4b95fc9d74e60d253dc1fe61008e3cce1f16 |     
    mips     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/83ad8acec4a3704be3c59e0d6ebe8221349acfbf |     
 aarch64_be  |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/99f4ce7be2fd34e86c25ad6ba5bb82d4540a0b89 |     
   nios2     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/53df309eb6e06fe1bf4fb61a9088ea4978a404cd |     
  aarch64    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/91eff3809dd541b119dcb47ca670b266acdb9c22 |     
   nios2     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/f3effa11311a3f7e6251744ac742bc1cfaa791f4 |     
   nios2     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/ff7cb8035d03b2ebeb9f5f19fd05a426c0de7ca6 |     
   s390x     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/44129b3e39ae06065ae4bc7cc0a03f58aefad8d0 | ORPH
microblazeel |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/19c02f0fb2273ce13e8fc0e5946f853f945fd999 | ORPH
  aarch64    |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/763bcb4be8b5cacb4434ea6c8b9fc3727a021fec | ORPH
    sh4a     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/7dcf3911a6d1e01ba1a8104c923e091bd4b12406 | ORPH
   s390x     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/dcdcc11fb59eeebb0f8f996f88fb08595b645e26 | ORPH
   mipsel    |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/761a8727308f49ebbb5834ca146b52053d3b6d99 | ORPH
 microblaze  |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/874cd9a2ccdbcef12687fecd31fb3cab2a7e24c9 | ORPH
   mipsel    |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/1552ad833c2d5fe30bdde3919e915c0e01206807 | ORPH
   nios2     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/4513523721b4ea83514addf74d30344a53f250c9 | ORPH
    or1k     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/e9f71174e8bdcc97b60b6fbff4127f98fed84b91 | ORPH
  sparc64    |         tealdeer-1.5.0         | NOK | http://autobuild.buildroot.net/results/1074a46fbf55150be350bd5200ade071641fc07b |     
  mips64el   |      uboot-tools-2021.07       | NOK | http://autobuild.buildroot.net/results/04c98c76a5ebbea769ef6a81bca2a0079da58b94 |     
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/ad5a2e088a728fc2083736ccb82dd5db54fa6ac2 |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/0acfefb12e25d9fe9d4990305f67261a82a33eaf |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/d0a6130e3964ee7f45c917ddf5c5d2b5dda14d52 |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/8f86b40a0156c223f1528a477c477fc92ff9389a |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/490d52b343c8ee7cf0e7826f7afca02d4d72107c |     
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.net/results/f7b65b996366304c4d6434ead13f35a4a5460fbb |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/6df9484cdd3533ea0cc21a912370736ab657a468 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/09a9882ad40e112cede6243e62c040f4dfc00c20 |     
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.net/results/a20bff9663134f4085d610546d059516fca7f410 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/7b871a40a88b8df73726aa50bbde0564b4484a82 |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/13b7ea099342fef781372a6d3bdf02646aa3749b |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/5e2979436f0d369cf271e6d1f063aa1a0f830801 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/e070f61637822548c02f99d3c301ace7d5ac1c18 |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/56fa7ebb083179bd80e56df9523c88bf7a426d2d |     
  mips64el   |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/a16a45a1ab910f060bc112bdf07a7e6dc4932431 | ORPH
   mipsel    |         wolfssl-5.5.0          | NOK | http://autobuild.buildroot.net/results/07dbbf5ea77993155e477e4a4dd45348aff8bd83 |     
  riscv32    |         wolfssl-5.5.0          | NOK | http://autobuild.buildroot.net/results/fc668ff4cfac851be600daef708815230c68e182 |     
  mips64el   |         wolfssl-5.5.0          | NOK | http://autobuild.buildroot.net/results/5155c4deb1e33e63010a57e030e3d7562632537c |     
   s390x     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/d9d5261215142212cbc7c07afbc6520266fba7ff |     
   armeb     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/38686914f1e3e39c005c3c33081c48c3eb88cd75 |     
   sparc     |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/b0447679b9eef0f8b8af9a32eadaaaaf28526600 |     
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/10941e203caf16d7bfdbca88e30efb6f6ca5b34f | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/dd40b2702b3bc90260415df1c8f6f04c922527ab | ORPH


Classification of failures by reason for 2022.02.x
--------------------------------------------------

                       unknown | 1 
                 wolfssl-5.5.0 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |            unknown             | TIM | http://autobuild.buildroot.net/results/e8d99f86a0d21630b969f333f40af517232541f6 |     
    arm      |         wolfssl-5.5.0          | NOK | http://autobuild.buildroot.net/results/2b594a16ef29a91d254bed68aa75c7e08848c846 |     


Classification of failures by reason for 2022.05.x
--------------------------------------------------

/home/buildroot/autobuild/i... | 1 
docker-proxy-339b972b464ee3... | 1 
         graphicsmagick-1.3.37 | 1 
                host-go-1.18.6 | 1 
            igd2-for-linux-2.1 | 1 
                  sudo-1.9.8p2 | 1 
               tcf-agent-1.7.0 | 1 


Detail of failures for 2022.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/e4d212330f63c6b6c1d759395ce401f070ec49e3 |     
powerpc64le  | docker-proxy-339b972b464ee3... | NOK | http://autobuild.buildroot.net/results/b51ba2acaad53fa571c8e5aa190dffccb5a70e53 |     
   nios2     |     graphicsmagick-1.3.37      | NOK | http://autobuild.buildroot.net/results/1713b2b8fdcf9b94923d256418f5002c687ef316 |     
   mips64    |         host-go-1.18.6         | NOK | http://autobuild.buildroot.net/results/09d3b16fdbf63544988951b4e9e170a7436ae10c |     
   sparc     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/e4fac4d259e26345f7a334388fe90c4f96e2a00b |     
   armeb     |          sudo-1.9.8p2          | NOK | http://autobuild.buildroot.net/results/ef7198d56c01186a1a8aef60ffa4aead8527dd5d | ORPH
 microblaze  |        tcf-agent-1.7.0         | NOK | http://autobuild.buildroot.net/results/123e03ef6cffbb9dd9985b1a7f78cdbe26e21308 |     


Gitlab CI results for 2022-09-30
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                amarula_a64_relic | https://gitlab.com/buildroot.org/buildroot/-/jobs/3101769645  |      
                         arm_juno | https://gitlab.com/buildroot.org/buildroot/-/jobs/3101769655  |      
   atmel_sama5d27_som1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/3101769678  |      
   atmel_sama5d2_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/3101769683  |      
       atmel_sama5d3_xplained_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/3101769686  |      
   atmel_sama5d3_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/3101769690  |      
       atmel_sama5d4_xplained_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/3101769694  |      
   atmel_sama5d4_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/3101769696  |      
                        avenger96 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3101769697  |      
                      bananapi_m1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3101769700  |      
                 bananapi_m1_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/3101769701  |      
                 bananapi_m2_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/3101769703  |      
                     bananapi_m64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3101769709  |      
              freescale_imx8mpevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3101769759  |      
            friendlyarm_nanopc_t4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3101769773  |      
           friendlyarm_nanopi_a64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3101769776  |      
            friendlyarm_nanopi_m1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3101769777  | ORPH 
       friendlyarm_nanopi_m1_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/3101769779  | ORPH 
            friendlyarm_nanopi_m4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3101769781  |      
          friendlyarm_nanopi_neo2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3101769783  |      
          friendlyarm_nanopi_neo4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3101769784  |      
     friendlyarm_nanopi_neo_plus2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3101769786  |      
            friendlyarm_nanopi_r1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3101769787  |      
                 imx6-sabresd_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3101769808  |      
                        imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3101769820  |      
                kontron_bl_imx8mm | https://gitlab.com/buildroot.org/buildroot/-/jobs/3101769821  |      
                mender_x86_64_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/3101769831  | ORPH 
      microchip_sam9x60ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/3101769834  |      
...hip_sama5d27_wlsom1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/3101769836  |      
    microchip_sama5d2_icp_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/3101769838  |      
      microchip_sama7g5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/3101769840  |      
                  minnowboard_max | https://gitlab.com/buildroot.org/buildroot/-/jobs/3101769841  |      
                       nitrogen8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/3101769855  |      
                      nitrogen8mm | https://gitlab.com/buildroot.org/buildroot/-/jobs/3101769856  |      
                      nitrogen8mn | https://gitlab.com/buildroot.org/buildroot/-/jobs/3101769857  |      
                      nitrogen8mp | https://gitlab.com/buildroot.org/buildroot/-/jobs/3101769858  |      
              octavo_osd32mp1_brk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3101769859  |      
              octavo_osd32mp1_red | https://gitlab.com/buildroot.org/buildroot/-/jobs/3101769860  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3101769877  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/3101769880  |      
                     orangepi_pc2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3101769881  |      
                    orangepi_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/3101769884  | ORPH 
                   orangepi_prime | https://gitlab.com/buildroot.org/buildroot/-/jobs/3101769885  |      
                  orangepi_rk3399 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3101769887  |      
                     orangepi_win | https://gitlab.com/buildroot.org/buildroot/-/jobs/3101769888  |      
                   pc_x86_64_bios | https://gitlab.com/buildroot.org/buildroot/-/jobs/3101769893  |      
                    pc_x86_64_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/3101769895  |      
                   pcengines_apu2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3101769896  |      
                           pine64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3101769898  |      
             qemu_arm_vexpress_tz | https://gitlab.com/buildroot.org/buildroot/-/jobs/3101769904  |      
                      qemu_x86_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3101769939  |      
           qemu_xtensa_lx60_nommu | https://gitlab.com/buildroot.org/buildroot/-/jobs/3101769942  |      
                      raspberrypi | https://gitlab.com/buildroot.org/buildroot/-/jobs/3101769953  | ORPH 
                     raspberrypi0 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3101769943  | ORPH 
                    raspberrypi0w | https://gitlab.com/buildroot.org/buildroot/-/jobs/3101769944  | ORPH 
                     raspberrypi2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3101769945  | ORPH 
                     raspberrypi3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3101769947  |      
                  raspberrypi3_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3101769946  | ORPH 
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/3101769948  | ORPH 
                     raspberrypi4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3101769951  | ORPH 
                  raspberrypi4_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3101769950  | ORPH 
                 raspberrypicm4io | https://gitlab.com/buildroot.org/buildroot/-/jobs/3101769956  | ORPH 
              raspberrypicm4io_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3101769954  | ORPH 
                raspberrypizero2w | https://gitlab.com/buildroot.org/buildroot/-/jobs/3101769958  |      
                    roc_pc_rk3399 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3101769962  |      
                           rock64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3101769963  |      
                        rock_pi_4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3101769964  |      
                      rock_pi_n10 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3101769966  |      
           sipeed_maix_bit_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3101769979  |      
          sipeed_maix_dock_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3101769982  |      
            sipeed_maix_go_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3101769987  |      
          sipeed_maixduino_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3101769990  |      
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3101769991  |      
          solidrun_clearfog_gt_8k | https://gitlab.com/buildroot.org/buildroot/-/jobs/3101770000  |      
            solidrun_macchiatobin | https://gitlab.com/buildroot.org/buildroot/-/jobs/3101770001  | ORPH 
              stm32mp157c_odyssey | https://gitlab.com/buildroot.org/buildroot/-/jobs/3101770008  |      
        terasic_de10nano_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3101770009  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3101770010  |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3101770011  |      
                           ts5500 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3101770012  |      
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3101770013  |      
                         uevm5432 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3101770014  |      
                        wandboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3101770030  |      
                            warp7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3101770032  |      
                        warpboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3101770033  |      
                    zynq_microzed | https://gitlab.com/buildroot.org/buildroot/-/jobs/3101770034  |      
                      zynq_qmtech | https://gitlab.com/buildroot.org/buildroot/-/jobs/3101770037  |      
                       zynq_zc706 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3101770038  |      
                         zynq_zed | https://gitlab.com/buildroot.org/buildroot/-/jobs/3101770039  |      
                zynqmp_kria_kv260 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3101770040  |      
                    zynqmp_zcu102 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3101770041  |      
                    zynqmp_zcu106 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3101770042  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
