Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD36FC04A95
	for <buildroot@archiver.kernel.org>; Sun, 25 Sep 2022 09:00:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E66460AEB;
	Sun, 25 Sep 2022 09:00:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E66460AEB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SYXLpBGDkjVD; Sun, 25 Sep 2022 08:59:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC75660784;
	Sun, 25 Sep 2022 08:59:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC75660784
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 112091BF20D
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 08:59:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DA9CD82A8F
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 08:59:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA9CD82A8F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DfGmfPgEhojy for <buildroot@lists.busybox.net>;
 Sun, 25 Sep 2022 08:59:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08D2D82A29
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 08D2D82A29
 for <buildroot@buildroot.org>; Sun, 25 Sep 2022 08:59:49 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9FFAB100005
 for <buildroot@buildroot.org>; Sun, 25 Sep 2022 08:59:46 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Sep 2022 08:59:46 -0000
Message-Id: <20220925085954.DA9CD82A8F@smtp1.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1664096386; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=IX/+VQySC52ga8fJtMtwhcswmo3YeXXeEzHxjhkVG0A=;
 b=F3YcJksrAiHfA2rHs2P89+U7ppI+eRAvmhYqO4x816QEYj9aqBb0tXXGxFtDLowrVg/LuL
 S2XOB4ddTdpaeJlccOwVh6uA3Nb1sM2nWicqjHi7EH7pL//I9CkpzybFRSv/0VdDIst4fo
 hXU6ph/6qrs+GxxgUuqp4my4qTtqRt8R12oYCR+1ra7swtEHpqc+FadMIROhEdxY0Y8hLY
 r0N1u4FtaT3iE9tDgRIwJgtgpsXE1ZsmvxJhVxLrmkZaGl3rijyqmYJD88/Nq+qSj2Nxyk
 mDLrMWVC+tq9kO6+fvdMErz60GoFlT/UYt48pwE+VPOBRvSbRlLK30NFJVLLTw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=F3YcJksr
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-09-24
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

Autobuild statistics for 2022-09-24
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  | 13  |  3  |  0  | 16  |
  2022.05.x  | 39  | 30  |  0  | 69  |
    master   | 229 | 344 |  0  | 573 |

Classification of failures by reason for master
-----------------------------------------------

                 chartjs-3.9.1 | 38
            igd2-for-linux-2.1 | 23
                 systemd-250.4 | 19
glibc-2.36-44-g2628500f5dff... | 17
                  autofs-5.1.8 | 14
            host-binutils-2.38 | 13
                host-go-1.19.1 | 12
                      crun-1.5 | 10
                    daq3-3.0.9 | 10
                 sysvinit-2.99 | 8 
            btrfs-progs-5.16.2 | 7 
casync-4ad9bcb94bc83ff36cfc... | 7 
dahdi-linux-5c840cf43838e06... | 6 
                gerbera-1.10.0 | 6 
                       unknown | 6 
             libgpg-error-1.45 | 5 
                 linux-5.17.15 | 5 
                 dash-0.5.11.5 | 4 
              libarchive-3.6.1 | 4 
               libglib2-2.72.3 | 4 
                xenomai-3.0.10 | 4 
                bitcoin-0.21.2 | 3 
                elfutils-0.186 | 3 
                  gensio-2.5.2 | 3 
            host-binutils-2.39 | 3 
         host-gcc-final-11.3.0 | 3 
              host-rust-1.62.0 | 3 
                    lxc-4.0.12 | 3 
                tealdeer-1.5.0 | 3 
                    brltty-6.4 | 2 
                  check-0.15.2 | 2 
                     efivar-37 | 2 
                  exempi-2.6.1 | 2 
               fftw-quad-3.3.8 | 2 
                     frr-8.3.1 | 2 
fs/ubifs/ubifs.mk:49: /home... | 2 
  gobject-introspection-1.72.0 | 2 
                   hdparm-9.63 | 2 
            host-binutils-2.37 | 2 
host-pahole-73383b3a39afe86... | 2 
              libgcrypt-1.10.1 | 2 
        ltp-testsuite-20220527 | 2 
                      pigz-2.7 | 2 
              procps-ng-3.3.17 | 2 
                 wavemon-0.9.4 | 2 
                 zlib-ng-2.0.6 | 2 
                    zstd-1.5.2 | 2 
/home/buildroot/autobuild/i... | 1 
/home/buildroot/autobuild/i... | 1 
                     ace-7.0.6 | 1 
                  bcg729-1.1.1 | 1 
              containerd-1.6.8 | 1 
           crucible-2022.05.25 | 1 
                 dc3dd-7.2.641 | 1 
              dieharder-3.31.1 | 1 
                 fdk-aac-2.0.2 | 1 
       freeradius-client-1.1.7 | 1 
fs/cpio/cpio.mk:117: /nvmed... | 1 
fs/ubi/ubi.mk:51: /nvmedata... | 1 
fs/ubi/ubi.mk:51: /nvmedata... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
              host-delve-1.8.0 | 1 
         host-gcc-final-10.4.0 | 1 
         host-gcc-final-12.2.0 | 1 
       host-gcc-initial-11.3.0 | 1 
host-gdb-arc-2020.09-releas... | 1 
               host-runc-1.1.4 | 1 
host-spirv-llvm-translator-... | 1 
            igh-ethercat-1.5.2 | 1 
                  jack2-1.9.20 | 1 
                  kexec-2.0.25 | 1 
               libcap-ng-0.8.3 | 1 
                libcurl-7.84.0 | 1 
               libdcadec-0.2.0 | 1 
                libdrm-2.4.112 | 1 
               libvorbis-1.3.7 | 1 
       linux-5.10.109-cip5-rt4 | 1 
           linux-5.10.115-cip7 | 1 
               lpc32xxcdl-2.11 | 1 
                   luvi-2.13.0 | 1 
            makedumpfile-1.7.0 | 1 
              memcached-1.6.16 | 1 
mmc-utils-d40ec535b9d4e4c97... | 1 
                  netsurf-3.10 | 1 
                     nmap-7.92 | 1 
                nodejs-16.16.0 | 1 
                  ntp-4.2.8p15 | 1 
               openpgm-5-3-128 | 1 
                   perl-5.34.1 | 1 
pistache-3ec9d7c4f8b828fdd3... | 1 
                 protobuf-21.6 | 1 
           python-numpy-1.21.2 | 1 
            python-ujson-5.2.0 | 1 
ripgrep-af6b6c543b224d348a8... | 1 
                   rsync-3.2.5 | 1 
rtl8723bu-d79a676a8d3f0bb6a... | 1 
                    sdl-1.2.15 | 1 
              strongswan-5.9.5 | 1 
               tcf-agent-1.7.0 | 1 
toolchain-external-codescap... | 1 
toolchain-external-codescap... | 1 
                 uclibc-1.0.42 | 1 
                  uhd-3.15.0.0 | 1 
                    volk-2.5.1 | 1 
x264-baee400fa9ced6f5481a72... | 1 
                  zabbix-5.4.9 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/2652d648b5e494e5e23b7fc44f202f521123f9c8 |     
    sh4      | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/056ce3c3988d21d955a14026dbf942868619a0f3 |     
   x86_64    |           ace-7.0.6            | NOK | http://autobuild.buildroot.net/results/dc1e28ca92f17c21704382c09b6b0a427ae25855 |     
    mips     |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/537b00bb934230ae4b045a17e2bf1d5ffd6d14f0 |     
microblazeel |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/f146b43974b97f06614f758ac9cf0b34370943bd |     
   mips64    |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/23c8636e521939bc4918a219bdc702c0e5fddc12 |     
   x86_64    |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/b578fb885282bf1d1f3e3f5215a3380574cbe626 |     
   mips64    |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/e697e8a227c59a0dd2d9936ec50c2edb13e6ba36 |     
  sparc64    |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/11fdde1b01e737d2a7a450c068b74a65f1b30716 |     
  sparc64    |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/dfd37402416bc34aa4b453dfbcaa4ab0b317653f |     
    or1k     |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/61aa6ea78f35080a1c89d5290ae93f12529ee3c8 |     
 aarch64_be  |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/c41823d369fc940c8ce72ce9b8a3607df2ba9cbf |     
   s390x     |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/47cc3e7aa0ddd2f1f120cf54a28e6324c2b0da9f |     
   mips64    |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/a50ec9d28eacf1e0b98546e0bcbe5e36c4bb2f28 |     
   s390x     |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/dce22c557b998f2ff124156dacaef3e6b1ea77b4 |     
   mips64    |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/812e97857444e11bc8251feb805e1746a958d0a2 |     
    or1k     |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/eecb485cd8671731a3d54c11fb6bba2e098ada29 |     
  riscv64    |          bcg729-1.1.1          | NOK | http://autobuild.buildroot.net/results/c4be313ba65206167b0aa042b2b834766b5eabf8 |     
    i686     |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/b6ce161c87dfa5323ebe4efabde0bc8bbc7cb7b6 |     
 microblaze  |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/abd31bf5bf9da4ee93babd1770a5ad65af597e46 |     
  powerpc    |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/b78e32907c308632f46fa1be6a20f9ee394d7b14 |     
microblazeel |           brltty-6.4           | NOK | http://autobuild.buildroot.net/results/895492c19e8defc44ca20f9252da915aba47f629 |     
    mips     |           brltty-6.4           | NOK | http://autobuild.buildroot.net/results/5d7965f289c8d8e67b5f4509b0b473400ef4aa09 |     
   s390x     |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/b523227ba193136dcdb2fd8bea599a81954129c1 | ORPH
  aarch64    |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/90a40dbc494423cff8c963e3623e3806df2de8a2 | ORPH
    mips     |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/5504e993f96f99d51344d51607bd4ca2714860a7 | ORPH
 aarch64_be  |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/2a859819e7efe5b3be60d1b86876726daa8eec60 | ORPH
  aarch64    |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/94d4217ddd5bc7a5e853db0dcf3e0c8d5a2566d5 | ORPH
 aarch64_be  |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/0515ee8982f0a0a0667573f157b48b273c01eebe | ORPH
   sh4eb     |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/fba9f0935e47529c4b7f57bd0244a2f24856a755 | ORPH
microblazeel | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/5bf084eb934932ecb03c385679733f6bf1bd1024 |     
    i686     | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/332add518b4c828641680f25db44b6c25a59dd78 |     
    or1k     | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/cee3065f95dd16f769e4db73ecea8ce0c2df0bb7 |     
   arceb     | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/a56bdc7ea9ddc5eb5ef10c4b1a0ace3f2119274e |     
   s390x     | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/208c0d150ca6884c8a0485122d9e83573f84346d |     
  sparc64    | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/875d30197d23395c863f1fc70912204c0d8e6ba2 |     
   nios2     | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/0672d48391cddf7d60f99cac946e81ee7b94a533 |     
   mipsel    |         chartjs-3.9.1          | NOK | http://autobuild.buildroot.net/results/19bbceff6b8845b7d03ef21fb4fc2496fe5468c7 |     
   arceb     |         chartjs-3.9.1          | NOK | http://autobuild.buildroot.net/results/0de9e5c3ebd7020d6f2482fe3ef5b1a665f5a297 |     
  aarch64    |         chartjs-3.9.1          | NOK | http://autobuild.buildroot.net/results/0e389c1e99fa146fb0edbf9102a749ae7f7a87b2 |     
   sh4eb     |         chartjs-3.9.1          | NOK | http://autobuild.buildroot.net/results/24b140257fad50ff105a046d3062d0782fa3b31b |     
   x86_64    |         chartjs-3.9.1          | NOK | http://autobuild.buildroot.net/results/80649004196ea902046cbb8953da5f8839594ed5 |     
    arm      |         chartjs-3.9.1          | NOK | http://autobuild.buildroot.net/results/1fa45917ad44cbec5c0baf517c9deb9c7eeb3876 |     
  aarch64    |         chartjs-3.9.1          | NOK | http://autobuild.buildroot.net/results/a2cdb21e59372afd1375054139cb720c09178c6c |     
   sparc     |         chartjs-3.9.1          | NOK | http://autobuild.buildroot.net/results/7d51bfb2b57bbc378edc06d678faaaf8a26c86a9 |     
   s390x     |         chartjs-3.9.1          | NOK | http://autobuild.buildroot.net/results/f06bd9998ffd168f259b948bf11eb42a771b08c8 |     
powerpc64le  |         chartjs-3.9.1          | NOK | http://autobuild.buildroot.net/results/bec36cb5f07d01e47af0a4de19bca3472c9510bd |     
 aarch64_be  |         chartjs-3.9.1          | NOK | http://autobuild.buildroot.net/results/83f06b75e144659395b5de42a6b8c1ee8af6bd18 |     
   sparc     |         chartjs-3.9.1          | NOK | http://autobuild.buildroot.net/results/2372c146845171c6677d4e282dab7bb294d0bcdd |     
    mips     |         chartjs-3.9.1          | NOK | http://autobuild.buildroot.net/results/a3f17d900d10527641a2fc7ff9f3680608d540a2 |     
    mips     |         chartjs-3.9.1          | NOK | http://autobuild.buildroot.net/results/d951d9b24184ba31f81a899cd7bbed5f7f6f1a88 |     
    arm      |         chartjs-3.9.1          | NOK | http://autobuild.buildroot.net/results/4f36b74ae4f5c81a5b429effecabab0080ae52db |     
  sparc64    |         chartjs-3.9.1          | NOK | http://autobuild.buildroot.net/results/266eebd24b3d22d5c903f04ba608946a4b521d45 |     
   mips64    |         chartjs-3.9.1          | NOK | http://autobuild.buildroot.net/results/55c50e24bbd70b99a4179cab5a570f57ea47150b |     
   mipsel    |         chartjs-3.9.1          | NOK | http://autobuild.buildroot.net/results/c1a2ed20533d271752829e82527387ac00526ee3 |     
   x86_64    |         chartjs-3.9.1          | NOK | http://autobuild.buildroot.net/results/b9dd63db852b44c7e332b8f0c5b5e588163cf76e |     
   s390x     |         chartjs-3.9.1          | NOK | http://autobuild.buildroot.net/results/88f17b5ed62b52997e56e6c6e21ca10d1dfe3ff6 |     
   sh4eb     |         chartjs-3.9.1          | NOK | http://autobuild.buildroot.net/results/4d941d88434e48255af4908ad4ad5cbaf3da2457 |     
  powerpc    |         chartjs-3.9.1          | NOK | http://autobuild.buildroot.net/results/ef3e981b2ed6ac23c92e4155165cfa683daac218 |     
  riscv64    |         chartjs-3.9.1          | NOK | http://autobuild.buildroot.net/results/f0cd1f7a0d5130ca1ce9b6612f8a700c54a98593 |     
 powerpc64   |         chartjs-3.9.1          | NOK | http://autobuild.buildroot.net/results/b3c1fc01942ba8432df19ee7378f92aabc7f9241 |     
  riscv32    |         chartjs-3.9.1          | NOK | http://autobuild.buildroot.net/results/a24544425bb981500fca18ca70dcc4b61d0bc37b |     
microblazeel |         chartjs-3.9.1          | NOK | http://autobuild.buildroot.net/results/075ab0cc83cd2faf3f224170c397106fe5cbbea3 |     
  aarch64    |         chartjs-3.9.1          | NOK | http://autobuild.buildroot.net/results/cea97d3fedefaa6c60304b7f03e543c93d4a4748 |     
   nios2     |         chartjs-3.9.1          | NOK | http://autobuild.buildroot.net/results/69502375fa4554b905daf325ec9c1f0242440e05 |     
   armeb     |         chartjs-3.9.1          | NOK | http://autobuild.buildroot.net/results/c44e2292739f8b7f851a667f5d2fa552ef740b98 |     
 aarch64_be  |         chartjs-3.9.1          | NOK | http://autobuild.buildroot.net/results/62a900b18ec8113f66200a51253056de0c307ac3 |     
    m68k     |         chartjs-3.9.1          | NOK | http://autobuild.buildroot.net/results/f76d16f4490a6f67957030f795160ff8ebc26f86 |     
   s390x     |         chartjs-3.9.1          | NOK | http://autobuild.buildroot.net/results/ca6f5770998b10606bd884f65694c3f71d347cbc |     
   mipsel    |         chartjs-3.9.1          | NOK | http://autobuild.buildroot.net/results/fb80fe5338b1c4a404e6e6dc050978bb9fdd94b6 |     
 aarch64_be  |         chartjs-3.9.1          | NOK | http://autobuild.buildroot.net/results/644754d88eb533500d0fb1166e088c49b351cdfc |     
  mips64el   |         chartjs-3.9.1          | NOK | http://autobuild.buildroot.net/results/0b0783456a9579a1dd147e9d893141cb5ef5ff80 |     
 aarch64_be  |         chartjs-3.9.1          | NOK | http://autobuild.buildroot.net/results/32f21cd31d661cd195b2118055836e8c4d2b80a9 |     
   arceb     |         chartjs-3.9.1          | NOK | http://autobuild.buildroot.net/results/ccbf646b80e1050be381eca220ed2eba00cd4d70 |     
    arm      |         chartjs-3.9.1          | NOK | http://autobuild.buildroot.net/results/e4626856c0f12072acd7f8f65f7b4aa8adee16da |     
 powerpc64   |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/c31a1e6aad8313ed87138bd3f671d4f56c82ee94 | ORPH
 powerpc64   |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/195d488e78e555dc52b70a4fd25ee7a4c59af1b3 | ORPH
   x86_64    |        containerd-1.6.8        | NOK | http://autobuild.buildroot.net/results/0697d4200d175b498f63b520c2037607ef523556 |     
   x86_64    |      crucible-2022.05.25       | NOK | http://autobuild.buildroot.net/results/fa4d5c89f8329f9d3e1d4790144dd655b16d8542 |     
    arm      |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/eefd88408bfaf012d9fffe4c4370feea1e3889d5 |     
    m68k     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/065225549b04747b1e3a0d4a77c1fd79c5bcd32b |     
    arc      |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/f9528c70603694ce9f2b8d4194a8190356784374 |     
  sparc64    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/8a6d35c69974031f629e836eb5b9a51365fe9630 |     
   s390x     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/5549bc8023b0a0fd96d0adcb1e50b45f3c48d162 |     
   s390x     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/af6cbd4c852333d8ca6c3fccad94dea8cdffb664 |     
   sparc     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/4d5a5f88f7adb8a135a780e015fea4ef8bae86fc |     
microblazeel |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/146f3717963c384508a93d659d2372b29d07a1fa |     
  mips64el   |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/0fabcfe9f7f515b23bd4f23f58e1c20c249fdf6e |     
    arm      |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/bd044998d92892fce9af4c0c8ff29ba68cbae341 |     
  aarch64    | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/01c5e8f3c1904277ab8061562fd8e5a8b6b9bd0b |     
   arceb     | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/fcdfa83a0a0b55d26105f7f23731f86f6706f8cc |     
  riscv64    | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/836aefc6a43b28196057a93d71cba6164b24b88b |     
   x86_64    | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/73eb32dcc282ca26de14e711be96788881a6c034 |     
 powerpc64   | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/860a121649fdf24f22fb3462ad8af437f4423662 |     
   armeb     | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/7fbd21ac653e1f268ad85ceb5d86146c37b9cffe |     
  mips64el   |           daq3-3.0.9           | NOK | http://autobuild.buildroot.net/results/1c8a6f85d7731f9133dd4e7af7313fcee8129a82 |     
   armeb     |           daq3-3.0.9           | NOK | http://autobuild.buildroot.net/results/96f7a3c280ce1b94d6bf342e0601603ff5e596cb |     
   x86_64    |           daq3-3.0.9           | NOK | http://autobuild.buildroot.net/results/3c2ba892b65ba34d064be84b6c77ed4cd3f49f3c |     
   arceb     |           daq3-3.0.9           | NOK | http://autobuild.buildroot.net/results/be37726c55dc5be9c4a6dd006a2f801b03c54862 |     
 aarch64_be  |           daq3-3.0.9           | NOK | http://autobuild.buildroot.net/results/25c9ee8138ab539cb42e8312af3cec105fe185a6 |     
   mipsel    |           daq3-3.0.9           | NOK | http://autobuild.buildroot.net/results/d2697fcf2697824927828d97887ce9e23a6143ff |     
    arm      |           daq3-3.0.9           | NOK | http://autobuild.buildroot.net/results/48b4673f46c9065e97e95872f9aa947c4f3fc21b |     
microblazeel |           daq3-3.0.9           | NOK | http://autobuild.buildroot.net/results/662c9800f6ecd9cd25341bbd8b3201bfd14656fa |     
    m68k     |           daq3-3.0.9           | NOK | http://autobuild.buildroot.net/results/b2800dadd1ec773ad4393bada140a26e9406f1e8 |     
powerpc64le  |           daq3-3.0.9           | NOK | http://autobuild.buildroot.net/results/6f75d8585984d6c034651fe3f06989d6d8b6ddd3 |     
   x86_64    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/7820d477e08d80a983acc255582cca360fec9cb9 | ORPH
  aarch64    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/247accc6a927106a5b0b74cd61ab4c974efd6026 | ORPH
   nios2     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/0dd34f2f1802fbe622d9a2a03451c8dccb3dfb60 | ORPH
   sh4eb     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/ea6dd4b6cabad57457aac10af848b0fba2727c5a | ORPH
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/626f4bae1ed14f0fbb0e3204ccac2c9f76a96151 | ORPH
microblazeel |        dieharder-3.31.1        | NOK | http://autobuild.buildroot.net/results/c0293ed094b2158cbc2a7a6a143fba64287bd136 |     
  mips64el   |           efivar-37            | NOK | http://autobuild.buildroot.net/results/43214fcbd1643ff850f0cb1408e2a08c6d6c6cd1 |     
    i686     |           efivar-37            | NOK | http://autobuild.buildroot.net/results/32f4bd2417177995e98defcf20b4c1c3f0e4dd20 |     
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/1ee69f13234c58c6881c67e3a67c68801d2f2efe | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/9e5561ca748f9004ca745e5792d09656930603ea | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/dcf8c2db19314672b8844904e675a0b20afa9722 | ORPH
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/8540660fdaa108f0121b1db523fa037f9f02af02 |     
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/91e770f8fc4a05bc18939f9ddcd6e5a788a0e540 |     
    mips     |         fdk-aac-2.0.2          | NOK | http://autobuild.buildroot.net/results/328eafbac1a3ff14a9c401f90abc644afc0b8493 |     
 powerpc64   |        fftw-quad-3.3.8         | NOK | http://autobuild.buildroot.net/results/438b828230d256096d65bff1ea75c0f408171137 | ORPH
powerpc64le  |        fftw-quad-3.3.8         | NOK | http://autobuild.buildroot.net/results/23e3600db34dcf1ef1c029488cbee6489031247a | ORPH
  riscv64    |    freeradius-client-1.1.7     | NOK | http://autobuild.buildroot.net/results/1981075ba2537c2cc95b34032400c535ade75438 |     
    arc      |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/70f43df5cce0132b6f8b7f01d05fa85a66ccb0c8 |     
   xtensa    |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/0f4f10f206e667d881e234b081f8606cadfc4fea |     
  sparc64    | fs/cpio/cpio.mk:117: /nvmed... | NOK | http://autobuild.buildroot.net/results/86c0664c64b971555987fb9c2d6501fce7c82648 |     
  powerpc    | fs/ubi/ubi.mk:51: /nvmedata... | NOK | http://autobuild.buildroot.net/results/2b64204846be2a0eb238a9f8bd4d646c920da787 |     
  powerpc    | fs/ubi/ubi.mk:51: /nvmedata... | NOK | http://autobuild.buildroot.net/results/70612ea55665070cd2bb69e6e173307e1e3900f4 |     
  mips64el   | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/32bad5ff8f115a6c4d4b8d649eec69195fe53069 |     
powerpc64le  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/60933b1ed74e57f41d5724fbb9d96db6d8387771 |     
    mips     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/5ceb0da7b72bb8daf57ec903fc619a1f4f7ceee7 |     
 microblaze  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/6357452f46e5ce498ba7a45e88e51e3d6e841fe0 |     
   s390x     | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/6dd6475a0ee02aac318bfa12f435b43102d4f94a |     
    arm      |          gensio-2.5.2          | NOK | http://autobuild.buildroot.net/results/1d9365ab6dbcd79d63522e80723758add4922159 |     
    arc      |          gensio-2.5.2          | NOK | http://autobuild.buildroot.net/results/e55c41b3e3c8c6f453ebfba866d0ca6c36ee1c1f |     
  aarch64    |          gensio-2.5.2          | NOK | http://autobuild.buildroot.net/results/28b3f59ed8fbc037e5c8060bce30e6d65ff015b7 |     
  aarch64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/feb5a60a31a2fd1217e3dd228d317ad897e952e7 |     
 aarch64_be  |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/e65ccb2f1ab0e9a030e7bf50ed2eb5e0186211ef |     
powerpc64le  |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/6fef9255c9e6ebfac897b83090872bce11ddbd70 |     
   mipsel    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/ba93736eda49e4af4b7446570539463329d3e530 |     
   mips64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/f7ccdfd5ec8c5c35d82e6c611b1f589437515d57 |     
powerpc64le  |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/07bcdf47498c9b938e638f4675c43f361bcd8032 |     
   x86_64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/5b442f95587ddc65a995bbd9e310c88a66c55b1f |     
    sh4a     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/dd60c1191c969e49664172c1bc5f5e0b7b63fe92 |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/7856309dc58330658e064d9e742e345f2609b8e9 |     
   mipsel    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/ff2f6ab354afd63a9187c8f36569f2b0b3d8b815 |     
    sh4a     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/615b28abca6516ccbe5b40377b5d79b7eb1f53e9 |     
    or1k     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/8b5b2f3fa1c419644fec58ea59b282d1c8924832 |     
 microblaze  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/52b5ac232f6e6216bd8cb9520de4f0fd6bf4ac6a |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/4bacbc2e66d033bf3123d168b8e44771f5b252c1 |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/f23a796e5eb7487652c70dbb3a96468bcbf81158 |     
microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/8b55d14e9f76d214afbb5d04c768d22fa31a32aa |     
 microblaze  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/0e520d0073979971f1d4a89c9c2620b31f11c83b |     
  riscv32    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/99e1a7485ec45fc234f0e98cf9ef3b78ab8f2521 |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/dc7d50e420d4e52335b4eedf4385727225d33cdf |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/03476ad2667ad522eb9c3acd1d401726e26d59cc |     
    sh4a     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/35363048dd109d61101c5c2ffeec82db6cbdb78b |     
 microblaze  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/28aaf641d5157caaa85b0df32f144940e4ed2f09 |     
   mipsel    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/caa79f93bb71689a09ec40679c3561957c17904f |     
   mipsel    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/1e6c3f7775a756bba76c41cfd028c9763936a50b | ORPH
   nios2     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/3f0d3fb1fe5a1a3e1b53a837d5e558f36e3673c5 | ORPH
   mips64    |          hdparm-9.63           | NOK | http://autobuild.buildroot.net/results/2a207da6e69603d33235f22be323267a435c415f |     
   armeb     |          hdparm-9.63           | NOK | http://autobuild.buildroot.net/results/f4a778105f36da2f7dc4701a22013574e6ea401f |     
powerpc64le  |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/4a195080157dbeaf302827a60460cb66c530f0cb |     
   armeb     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/de64b93c43a24cfc13ac0c983fccfebd2b132acb |     
 powerpc64   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/0874320cc67e46c1b540cffec4b84980a2fb0e51 |     
   armeb     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/a02ceed083af80c6bc2583a06546cbfff03aedd4 |     
   xtensa    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/fd2da0a760c9a5c1fa788bdc5f06369bc7aa09c8 |     
  aarch64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/6d987156597cd52ce4bb829f17255355ea510535 |     
   s390x     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/17ac555c1d2d580f59ca8df4a190492f31e3b269 |     
  powerpc    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/c5cedddc3c4d296823508f08862a38239b824abf |     
   nios2     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/90f6e8b8e5d60912be6776e22d65316789191f7e |     
   s390x     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/d9d2d381fc3d9827812dcf6bc9abe40c7702e542 |     
   armeb     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/996732b0acfca1d4a8e451db9f73223632e63806 |     
powerpc64le  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/665d6cb2ccdf598a274056dc476b47374e8574d0 |     
powerpc64le  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/122f5479b6437d7d8f6ee20d370e2fb9c18b2ed6 |     
   s390x     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/42d012760276268536157e717d84c462bf42360b |     
 aarch64_be  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/fdc2fb7e0406dd70e56e4b5480fcf75efd21263e |     
   nios2     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/bd140e3081a376d56d04f9a1a908d87b6a7424f0 |     
   s390x     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/cab28d4150a256f6f2f4ca6f6af8b81aa0b6cbb0 |     
 powerpc64   |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/7f14ee39e90853a95ba76c0fa09218f51d629572 |     
  mips64el   |        host-delve-1.8.0        | NOK | http://autobuild.buildroot.net/results/db508ac75e6cd5ea49962180bbba279e2ecb0e59 |     
  aarch64    |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/34048ea2f3d1920ec160ca6bb023e592f371dbe4 |     
   s390x     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/a93787f2a4b74333531eafd1c9f0e6a42d1fe6e1 |     
   s390x     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/a3e31ddcd3bcddee9860818c8dcccf671f0d3878 |     
   s390x     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/d953a44040d72e17c60d62768f22b5ce8bea20ba |     
 microblaze  |     host-gcc-final-12.2.0      | NOK | http://autobuild.buildroot.net/results/499b8420f4de804b0001eff97282613068c771a7 |     
   armeb     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/6e5d9b1bbe21e95c8726efb94335b43deee1b1e0 |     
   arceb     | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/e227bf9c64b9789cab87c6918afdb975aa853914 | ORPH
    i686     |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/ca438aed250f221281c5bc1f0df5e624935a353f |     
    i586     |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/3e350cd0d81607358fc09d43bbd48bef71fdf1b2 |     
powerpc64le  |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/c4c85cce4fed41fe5cab8c4bfb70f11f9b3b224b |     
    i686     |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/f90097644d70d30e8dd5f704982ffc114df5beb5 |     
    i686     |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/bb318b45c6d245d65f406f19aa5195147a9a8123 |     
    i686     |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/89bbe70d6f45bbe372faf2ead0e4eae2aad28ce1 |     
powerpc64le  |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/ba57c55c847f4b543dddb479b1640b9f58ec2e11 |     
  mips64el   |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/612d7defd2367367163613a7e3526c21387627c3 |     
    i686     |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/9f623fea0dad82618de3bef0e1e90cb6e9e1b8f8 |     
  mips64el   |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/f29f809622e8c7f509c131635442084ebbb08f4b |     
  mips64el   |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/432bb5d032dcfd7439c19571baaef08596984b82 |     
  mips64el   |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/758369254c871855ab88dba29239d4224d249678 |     
    i686     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/264980080fbfb189c5939610ee7629943afcdbc8 |     
powerpc64le  | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/68bde334e0951b45cb0352594232b808e9f32574 |     
   x86_64    |        host-runc-1.1.4         | NOK | http://autobuild.buildroot.net/results/a4ba232f077fb57d105026b15ecf8ff10bbffc01 |     
  sparc64    |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/9774e38150d76f6274b7e47e35f90de0623b9d37 |     
   mips64    |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/e2a0a9dc83261cd479cb2a1f3ec8cc3aa443366c |     
powerpc64le  |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/0ff7c6b2bc0944b3b92b4288b6c21581d282ba8f |     
  riscv32    | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/9f839e0f727c2e4a40034250e9e91b3729ec9670 | ORPH
    arc      |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/230e3c38a613770c0a7ed2c25a3bd0adbd271a72 |     
powerpc64le  |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/aafdd1179fa15448f12194b0b010967f636db081 |     
powerpc64le  |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/ddce4439b04a5c0a9e81e1d377e564f6766f200e |     
   x86_64    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/ca10ed2e5eb9fde6716696f014f48616358df629 |     
powerpc64le  |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/b13c9547fcaa6125e47f674436d53fd9c125e8ce |     
  riscv32    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/e900e813a7853d391f52779f326a1660269eb840 |     
    mips     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/c8233580261ad7cd2830bad66d9aae4d1a22f172 |     
 powerpc64   |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/5588340af0d2a501d892c6c7c429e23fa6e02c57 |     
   mips64    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/40f01351f4f53f49572ead3c71183719f2c663c3 |     
    or1k     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/d55fe894b236a1df04736f6eeb671484d5c96450 |     
   armeb     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/a93ea5926b1f25b692d6c41c8a4f106f75748829 |     
powerpc64le  |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/4e5b015553b656e9d3187060c204e1e2e854b8bb |     
    or1k     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/21fec46d717d0168d7e433c3e14bfea0d6c3841a |     
powerpc64le  |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/1c5e974842a4272ba8df61ac1aa7ee287a2eb812 |     
microblazeel |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/e5419a5ee50bb86b8ee4cf21829c0632a04a01d3 |     
   x86_64    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/8819c08b4d71c177e0559e70a0baaf716a40a9e6 |     
powerpc64le  |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/08fe5aeb66006c63af2064e4b88924e30fb18485 |     
    mips     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/7bd5f4fe70e3b5dbb2db160d29cc061984571775 |     
    or1k     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/d0efdb0fda97d84f35b8f9923799ba57c5587814 |     
   sh4aeb    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/6d1333896b10dce380f2543a18e9a08de77e6a3d |     
   mipsel    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/e8dc52d3b5dc7700247392111760884ef3e9e5bc |     
   x86_64    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/e187784c1551241d116bc54ab2770b122bee9ef4 |     
   mips64    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/d43171b4827683d9e4355dcc0b082ae3006a6e3f |     
   arceb     |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/66b65c6407d5a09aa440581d20bad7824a6c8428 |     
    m68k     |          jack2-1.9.20          | NOK | http://autobuild.buildroot.net/results/90d6fedcaca7215bcd652a23ea8d2994a19bd741 |     
   armeb     |          kexec-2.0.25          | NOK | http://autobuild.buildroot.net/results/62034e0cc9efbac993473bbe89c43e532ea2cd27 | ORPH
   s390x     |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/900928438030490e9f113a4b010793cf3d164edc |     
   mips64    |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/ef45dd1f26bf0a13b50291772e22c4738c3fc4c3 |     
   mips64    |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/5274a7bf81a1eee169f7aa88b9957105ae7d985d |     
  mips64el   |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/ffc4e1ff1288e3030e9e63aff95127804452e323 |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/d7ec72dbcdfbff054c3cfd8e39ceff6b1e28ca18 |     
  riscv64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/93057c07416188461cf9319866904e83eac8f932 |     
    arm      |        libdcadec-0.2.0         | NOK | http://autobuild.buildroot.net/results/b43bc1b874d677bf7e016136546d9ce92340fadc |     
    arm      |         libdrm-2.4.112         | NOK | http://autobuild.buildroot.net/results/224ed84c1373b88c4e4ca55f8d4f404a8e15bca9 |     
    i586     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/c6d750602e7de63a547dfac5e11decfade3be1c7 | ORPH
    arm      |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/ebcfcd97d54085ee333439c4a96b7affe79001c4 | ORPH
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/e925c200666357cafc30201e9326032a8e8d2d97 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/8f2aa65d0e01fc6348d5802d29bdc0375d3acc0f |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/d5e0858b6f94094cebb6961eaf6cec5dae8f6c3c |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/a2197a4ecb3a8ea3711e75ede8d5b2dfdab8fa36 |     
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/8323413f0d4402848da76caed3c12cda231602f9 | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/19c0d312cd4b06f415c5f8dc25273257186ef878 | ORPH
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/762cd83bc8d35ea1d45b97039350936c64ff8ce2 | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/8263b6ee690eac90ae11dc1f7b5474b67c579337 | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/7d35f437e931f2c8184fc2e15c17d11c8d57afa4 | ORPH
  powerpc    |        libvorbis-1.3.7         | NOK | http://autobuild.buildroot.net/results/4435d0a5a2481feae05e5bf297c6e45c6e128f94 |     
   mipsel    |    linux-5.10.109-cip5-rt4     | NOK | http://autobuild.buildroot.net/results/1fb99f385763054bfca240e21017798310b0b49b | ORPH
    mips     |      linux-5.10.115-cip7       | NOK | http://autobuild.buildroot.net/results/30cad3c39414c2d0d9b352b32c6ca91ff2c3422a | ORPH
   x86_64    |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/1ac5f5b51c13cf8770a32ca023a9efca850db381 | ORPH
   s390x     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/bd36342a4344e2bee78b0b59f9072a3898429b81 | ORPH
   x86_64    |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/5fc9a87b753e26f7daf0156d255705742cbb6155 | ORPH
    or1k     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/ddf672c7451822ca622731e2c3c31a5fdfd9ad5d | ORPH
   mips64    |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/74dd23605350ec22cf9553e4a43f3d25349bacf6 | ORPH
   armeb     |        lpc32xxcdl-2.11         | NOK | http://autobuild.buildroot.net/results/1eddfaf9991dad0dd6b8f7154ece5c13e4a12b0b | ORPH
    or1k     |     ltp-testsuite-20220527     | NOK | http://autobuild.buildroot.net/results/3810c42116d1d5754bfcf1743ef0c82ad9a60527 |     
   mips64    |     ltp-testsuite-20220527     | NOK | http://autobuild.buildroot.net/results/1ba33ec39fdcb69a772f5decefa98ab340f2ceec |     
 aarch64_be  |          luvi-2.13.0           | NOK | http://autobuild.buildroot.net/results/dc1d360ded1c8abb8464199d6268091bf9f3e90d |     
   armeb     |           lxc-4.0.12           | NOK | http://autobuild.buildroot.net/results/012a0a90d8b79a322cf4b6d87013167048460e0a |     
   s390x     |           lxc-4.0.12           | NOK | http://autobuild.buildroot.net/results/4f5cd2bcfdc2e2d1e8e52bd23102a53292cdc82d |     
   nios2     |           lxc-4.0.12           | NOK | http://autobuild.buildroot.net/results/65e41e7b532516ac3390e949fed3134ff5135ed6 |     
  mips64el   |       makedumpfile-1.7.0       | NOK | http://autobuild.buildroot.net/results/08d9d65b0f420ba75975cf7dc9f41ab1cafc2ce9 |     
    arm      |        memcached-1.6.16        | NOK | http://autobuild.buildroot.net/results/f0a9d24a1901f08877f0072e4c6ec3a1964dedd7 | ORPH
powerpc64le  | mmc-utils-d40ec535b9d4e4c97... | NOK | http://autobuild.buildroot.net/results/c18330a354ba3e85b19c9405a3c90a9a151058b3 |     
 microblaze  |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/736ed00ecd961a69b6e339109a17d86305a3dfe1 |     
   sparc     |           nmap-7.92            | NOK | http://autobuild.buildroot.net/results/15d7cfc7cd763f06777f08e82b1648968020713c | ORPH
  aarch64    |         nodejs-16.16.0         | NOK | http://autobuild.buildroot.net/results/2009c2e103c08f04e7ce9ce563fe071c9422d845 |     
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/91ec6d20a73e7354f9203d64ed87dc4e3d5d552e | ORPH
  sparc64    |        openpgm-5-3-128         | NOK | http://autobuild.buildroot.net/results/bfde0678dc2a78f5605867f938ec537f6bb74b54 |     
   sparc     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/036b7e604cae1a1528052ac0ba1cd7f793ed8c4b |     
microblazeel |            pigz-2.7            | NOK | http://autobuild.buildroot.net/results/e758d33bc37bf8f067a0019857f942ae95bcf427 |     
 microblaze  |            pigz-2.7            | NOK | http://autobuild.buildroot.net/results/ac9de9b9e449928500967ab31338e51e465801e7 |     
    arm      | pistache-3ec9d7c4f8b828fdd3... | NOK | http://autobuild.buildroot.net/results/1807189cca3fb1ebf8b5af7c2d2b4e88f2db0699 | ORPH
 powerpc64   |        procps-ng-3.3.17        | NOK | http://autobuild.buildroot.net/results/5dc1ac53601bb0c4a9f2b801657032a7c7af36dc | ORPH
    mips     |        procps-ng-3.3.17        | NOK | http://autobuild.buildroot.net/results/99eac6327df713b69eefba601e1a353ce0d39d30 | ORPH
    m68k     |         protobuf-21.6          | NOK | http://autobuild.buildroot.net/results/abfdad727de17f92335a4e5ce1fb954f8f3a6c47 |     
   armeb     |      python-numpy-1.21.2       | NOK | http://autobuild.buildroot.net/results/de3638b56413a722363f803daa5b05d12eeedeef |     
   nios2     |       python-ujson-5.2.0       | NOK | http://autobuild.buildroot.net/results/c5195fd9d929e621617fe06a99a630f040158d15 |     
   armeb     | ripgrep-af6b6c543b224d348a8... | NOK | http://autobuild.buildroot.net/results/967b762371f35cc31ae13824ac3f7e1eec3f4684 |     
   x86_64    |          rsync-3.2.5           | NOK | http://autobuild.buildroot.net/results/cc680ab0da3d3213a24203c9c4b2a9e1c1b0dba2 | ORPH
powerpc64le  | rtl8723bu-d79a676a8d3f0bb6a... | NOK | http://autobuild.buildroot.net/results/c7c5e72b086521f9e5934f0ad5267b680174b028 |     
    sh4a     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/b67a7f7e2896e82ea64eb2b190e195e090174b62 | ORPH
    m68k     |        strongswan-5.9.5        | NOK | http://autobuild.buildroot.net/results/e712d5fc94a3f9d0a9da2423609c38fc4e934b8d |     
   s390x     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/47f7138440b4b830b3eb38b07a48b552ae43ed07 |     
   s390x     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/299d0aedd808b3cdf79398e75d376e677cd84d99 |     
    sh4      |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/8d012e86c949070ae050587e47cdd356bb044fab |     
    sh4      |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/08f3bf902790ad8e7d68115c5474ce484ba655bb |     
  sparc64    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/d57cec568787d7b9c606a6eb103eef1981ad86e5 |     
   s390x     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/14746d1115b8a5d71b3338b13f045b60bf466907 |     
   mipsel    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/f01d353d2f4a0c164c155d485d055c91d0fd71b1 |     
    mips     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/377f09a8b65f08663a7eb0e916b9d13ed91aa869 |     
    i686     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/df2ba2387fc6aef29979f2187d1df8561f35edd6 |     
    sh4      |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/feff8f51f32cba5b3d16d4e06545cd6b0b805e63 |     
    arm      |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/0168e97109f7ee6625d89085fa39c46d4be09a80 |     
   nios2     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/127bb74a0149cbb048c0b5a1ec23f1a25067fa5e |     
 aarch64_be  |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/630b2982c71613c408605d248b8323da0dc23b16 |     
  sparc64    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/247d5c3131b18d97a7ca1c530c1f0138821aec76 |     
   x86_64    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/79ee251d435081df7fadf5f4ded95495a97603b1 |     
 aarch64_be  |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/72ed538c2805af7c2881b2a62164b5a831d592d4 |     
 aarch64_be  |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/b94e19a49411fa6385aea890824bb0acac00a299 |     
  sparc64    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/fbf598227f10ad544cdbd316df684d189f248e83 |     
 powerpc64   |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/994b89086904665d02460750c34923ab324803d3 |     
 aarch64_be  |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/31cadf9f3daf1cc07d820b278c314de66adf2996 | ORPH
 aarch64_be  |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/ff90bd97d645909adc00417897409105a49d6bce | ORPH
    mips     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/df3c49823bcec449d939071ad12e28c3b3e67765 | ORPH
 microblaze  |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/26590ee3d584d563d938270a875870f667dd9c4e | ORPH
   mips64    |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/30a840254e25b5122212f0508144c2e0e443fde0 | ORPH
    arm      |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/6eea9861ed412f0f028e67ef30523633131c1903 | ORPH
  mips64el   |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/afb711959190e2e8e739ceac36b3a7c623eff39c | ORPH
    arm      |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/f7aac89ea4badb78a2d1e7253b143c2e8679568e | ORPH
 microblaze  |        tcf-agent-1.7.0         | NOK | http://autobuild.buildroot.net/results/21fc9b827f4c2dcc3a12bb727372667c449dd5ec |     
 powerpc64   |         tealdeer-1.5.0         | NOK | http://autobuild.buildroot.net/results/148071e7bce96fa5ba514f8fdbbf649c03d56ad7 |     
powerpc64le  |         tealdeer-1.5.0         | NOK | http://autobuild.buildroot.net/results/b58bdfeec68342b4362845b34277d0ee87a431d6 |     
 powerpc64   |         tealdeer-1.5.0         | NOK | http://autobuild.buildroot.net/results/473b072c6c4a0550058e65e226a5b2ec5f8fafc8 |     
   mipsel    | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/a8ee678e8a14292b27d96fb83baed8617d7ab1e1 | ORPH
  mips64el   | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/aa441937a169c2fb45981eee7df04dd84549e078 | ORPH
  riscv64    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/acf9da9a3603e368f1ec8b56d6d48a08779d4f60 |     
  sparc64    |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/8919897a24394765bd30209e3b20dfa7de6b0ff7 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/c85e55c43b99adc579cddcce32b448f16de22dae |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/c6d3409737d73dd44ab1b52c178c0ddebc51cbc5 |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.net/results/02c7bc8fe30f25e172d710aa86db2b815fe7e6d8 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/ada04a5fcbb4fbc173bac2c545df3ce8598837a1 |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/6978b806182f1241f414a5847edf6b8d4c5f7a82 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/d2597a205ae1997c960bae9fc65471f236392ab3 |     
  powerpc    |           volk-2.5.1           | NOK | http://autobuild.buildroot.net/results/0f320a94e31c336363f1ff3c0cadc09938731774 |     
   x86_64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/5cccec36bb4392bb50fbaf3230da3f2633ba2aba |     
   xtensa    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/b3bcaa0ba24e2ffafa4a672f1f4cd90515bf516d |     
    i686     | x264-baee400fa9ced6f5481a72... | NOK | http://autobuild.buildroot.net/results/caa8d0cb6587ae9fdc309733b9109f15daa1dfc5 |     
   nios2     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/c1d3e81cea481d60350761e04f5635f199c4c96a |     
    mips     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/5d2809fc0499601a3bec536f29b90587de9f9ed1 |     
    arm      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/96dbc9ddd0c9ece6eaa31f0faff4affbfedca8c2 |     
  powerpc    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/f597f365fce25bbdfe4163d6407de2e524418072 |     
  sparc64    |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/db4d824ae352a22f79168992df40c4d0c0d3a846 |     
    or1k     |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/09a7fa4a4dde6e0902317a21cc199e5a772a0a1f |     
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/6515aee556da3dcf5574bfa855fc54b7e956ee08 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/2c8c9c091eb58a09dfecb1e479f974e05ee675f8 | ORPH
 microblaze  |           zstd-1.5.2           | NOK | http://autobuild.buildroot.net/results/aaab70a146a87bd213b19aacbc22eb53abc92ba0 |     
 microblaze  |           zstd-1.5.2           | NOK | http://autobuild.buildroot.net/results/6b38728b3b40ce76eccd5648ef27ba1a8e9ef29d |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

                    bat-0.19.0 | 1 
google-breakpad-7515ab13768... | 1 
                 wavemon-0.9.4 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/990889728aa4154588b636b671185a4e25667d21 |     
   mipsel    | google-breakpad-7515ab13768... | NOK | http://autobuild.buildroot.net/results/9eb240a70bb91be7d60ed9453462ebe19f56e585 |     
    arm      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/9e1dfca420209cae8dde93f0aae709f40f7729a8 |     


Classification of failures by reason for 2022.05.x
--------------------------------------------------

                       xenomai | 4 
                 linux-5.17.15 | 2 
/home/buildroot/autobuild/i... | 1 
                  acpid-2.0.33 | 1 
                    brltty-6.4 | 1 
                     frr-8.2.2 | 1 
         graphicsmagick-1.3.37 | 1 
host-gdb-arc-2020.09-releas... | 1 
                host-go-1.18.6 | 1 
host-pahole-73383b3a39afe86... | 1 
                   httping-2.5 | 1 
      libabseil-cpp-20211102.0 | 1 
              libgcrypt-1.10.1 | 1 
             libopenssl-1.1.1q | 1 
                librsvg-2.50.7 | 1 
            luaossl-20200709-0 | 1 
              memcached-1.6.12 | 1 
                 mesa3d-21.3.8 | 1 
                   perl-5.34.1 | 1 
          perl-net-ssleay-1.85 | 1 
                 pixman-0.40.0 | 1 
               protobuf-3.20.1 | 1 
                  reaver-1.6.6 | 1 
toolchain-external-bootlin-... | 1 
toolchain-external-codescap... | 1 
                       unknown | 1 


Detail of failures for 2022.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   arceb     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/0269d1a39c73f31d0180d97310184960199845d0 |     
  mips64el   |          acpid-2.0.33          | NOK | http://autobuild.buildroot.net/results/90c042978709c4a1401ef342d2cb2edd42be414d | ORPH
 microblaze  |           brltty-6.4           | NOK | http://autobuild.buildroot.net/results/d06ac13fe2fd5db53cae67500b8923c2bbf36829 |     
    arc      |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/4fdf41d484bc51d69afe2f4c08122522a9d03131 |     
  powerpc    |     graphicsmagick-1.3.37      | NOK | http://autobuild.buildroot.net/results/19d30b6bde5bd409ddf17d5313c36fff0bfbf225 |     
    arc      | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/1793a2243e08fd36329874c6f167318e037a85e3 | ORPH
    i686     |         host-go-1.18.6         | NOK | http://autobuild.buildroot.net/results/fd24d41adc5f13a0715fb4010ae3d9d2f3e733b5 |     
powerpc64le  | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/91db1517d228ee085db782a25249c75dbd359ca1 |     
   mips64    |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/b473e81558f9bbafae7177a3c8bc8bdebcf9a980 |     
   mips64    |    libabseil-cpp-20211102.0    | NOK | http://autobuild.buildroot.net/results/64242dffa7e51d322d051284ee08e7157845e0ec |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/db32e423afe159d41ad094cafebd06ed0ac24a53 | ORPH
   sparc     |       libopenssl-1.1.1q        | NOK | http://autobuild.buildroot.net/results/2c1cb7e63101b49e3968025aaa10c6074a7e7014 |     
    arm      |         librsvg-2.50.7         | NOK | http://autobuild.buildroot.net/results/badcd074bcc99916dc9c83407f1dd0390bb344df |     
  powerpc    |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/ff60cdeb941151f8c7b260df74c177acfc91fae7 | ORPH
    mips     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/4a56d99b30e588e4dbdd6325ea7e7d9ffdefc61c | ORPH
   sparc     |       luaossl-20200709-0       | NOK | http://autobuild.buildroot.net/results/0316191b0fc4d98d149ba5554c6151d7647c9e6e |     
  aarch64    |        memcached-1.6.12        | NOK | http://autobuild.buildroot.net/results/33919e10112cec4bd89532dc7671e6e49c4cb4e5 | ORPH
   x86_64    |         mesa3d-21.3.8          | NOK | http://autobuild.buildroot.net/results/c7d6a2fac4863ce6d6fc418ef75d28c37d32cf06 |     
 microblaze  |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/35ee1eeb3e54620ef230c398b3a6962e0b625fbb |     
  sparc64    |      perl-net-ssleay-1.85      | NOK | http://autobuild.buildroot.net/results/4588c4960986e7359123733f650c938b59588427 |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/83e5f37653fbffb7f4c4fd788cee3a8fc9247a1a |     
   nios2     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/3f9a35bb3c20b1b777463f3d574adfaaa24261c2 |     
   arceb     |          reaver-1.6.6          | NOK | http://autobuild.buildroot.net/results/6d896ddf10b496100cff681a21cef317c3cebcbe |     
 microblaze  | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/6069a3b884ad03c73b3fa606ae3ad1af7f8a79b0 | ORPH
    mips     | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/46d6789ffcbf196b3131771750e98349487222e6 | ORPH
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/eb062ba27abf3e54ce7e8828f53317cedd2a6009 |     
    mips     |            xenomai             | NOK | http://autobuild.buildroot.net/results/ea524039d7c11e300fbf68c1808254f5412e0754 |     
  riscv32    |            xenomai             | NOK | http://autobuild.buildroot.net/results/5e7007b71647b1c45bd0115b3a0e4c1a2faca0a0 |     
 aarch64_be  |            xenomai             | NOK | http://autobuild.buildroot.net/results/93ec962efeb1540a9642231c5a8af918ef40e9c9 |     
microblazeel |            xenomai             | NOK | http://autobuild.buildroot.net/results/6877dafc0e54650575581f1a867e6ae5378cc23a |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
