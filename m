Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2149DECAAD2
	for <buildroot@archiver.kernel.org>; Sun, 28 Aug 2022 05:37:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 62CA9829DC;
	Sun, 28 Aug 2022 05:37:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 62CA9829DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pHUKpK3A-yAg; Sun, 28 Aug 2022 05:37:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2EC9D82A3B;
	Sun, 28 Aug 2022 05:37:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2EC9D82A3B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DF3DC1BF5E0
 for <buildroot@lists.busybox.net>; Sun, 28 Aug 2022 05:37:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 76D3D4089E
 for <buildroot@lists.busybox.net>; Sun, 28 Aug 2022 05:37:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 76D3D4089E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 37iC26EiHTF5 for <buildroot@lists.busybox.net>;
 Sun, 28 Aug 2022 05:37:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 642F5403C5
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 642F5403C5
 for <buildroot@buildroot.org>; Sun, 28 Aug 2022 05:37:05 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 05795E0009
 for <buildroot@buildroot.org>; Sun, 28 Aug 2022 05:37:02 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sun, 28 Aug 2022 05:37:02 -0000
Message-Id: <20220828053710.76D3D4089E@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1661665023; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=351x2gtOCK9ISVwc/SNhAPAgzi8RXTVYXI0L1Fmw6eM=;
 b=WpuaeyucIQVZ+VGKNrUEOatzCvXftZBAza04SeVNVRw+oGVMQfYxiLn/+4Q2oxMneytGZ0
 kNOJUcfzQRMjHYzdqRISexrJYj144G5QVPqSlj3e2bZFLcCGwkwcBH/McngCwlEMleJdh4
 A09zCJwM5WFZIWKkQoIVHtxwN56LCXYLEuex3Z46f4687EHW0/7OkDij+nlSL/wnsWJu+M
 2C5GyWidu+cxUu+nx7ktH1rl0oQrY/4yQOVuIIl8ytMESihwJyUkb8JTpoNBUWdjTlvAoH
 FetEgXerDffG8w116VOanxGG5KXVMoi8SHIz0jDmw3fXyhHbCFub2xgHbZal9A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Wpuaeyuc
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-08-27
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

Autobuild statistics for 2022-08-27
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  | 14  |  2  |  0  | 16  |
  2022.05.x  | 38  | 31  |  0  | 69  |
    master   | 194 | 238 |  0  | 432 |

Classification of failures by reason for master
-----------------------------------------------

                   thttpd-2.29 | 25
                    wipe-2.3.1 | 22
                 linux-5.17.15 | 11
                speexdsp-1.2.1 | 11
              host-rust-1.62.0 | 8 
                   perl-5.34.1 | 8 
                gerbera-1.10.0 | 7 
                host-go-1.18.5 | 7 
                       unknown | 6 
                   speex-1.2.1 | 5 
                 uclibc-1.0.42 | 5 
                  ffmpeg-4.4.2 | 4 
host-pahole-73383b3a39afe86... | 4 
                    brltty-6.4 | 3 
dahdi-linux-5c840cf43838e06... | 3 
glibc-2.35-134-gb6aade18a7e... | 3 
                     gmp-6.2.1 | 3 
          host-elf2flt-2021.08 | 3 
host-python-pycryptodomex-3... | 3 
              libgcrypt-1.10.1 | 3 
              open62541-v1.3.2 | 3 
                elfutils-0.186 | 2 
       freeradius-server-3.2.0 | 2 
fs/ubifs/ubifs.mk:49: /home... | 2 
  gobject-introspection-1.70.0 | 2 
                   libnss-3.81 | 2 
             libopenssl-1.1.1q | 2 
       linux-5.10.109-cip5-rt4 | 2 
                     php-8.1.9 | 2 
                 pixman-0.40.0 | 2 
                 wavemon-0.9.4 | 2 
/home/buildroot/autobuild/i... | 1 
                  acpid-2.0.33 | 1 
        at91dataflashboot-1.05 | 1 
                    bat-0.19.0 | 1 
                  boost-1.79.0 | 1 
casync-4ad9bcb94bc83ff36cfc... | 1 
                 coreutils-9.1 | 1 
           crucible-2022.05.25 | 1 
                 dash-0.5.11.5 | 1 
docker-proxy-f6ccccb1c082a4... | 1 
              dropbear-2022.82 | 1 
              erlang-22.3.4.22 | 1 
                  exempi-2.6.1 | 1 
               fftw-quad-3.3.8 | 1 
             fontconfig-2.13.1 | 1 
fs/ubi/ubi.mk:51: /home/tho... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
                    gdal-3.5.1 | 1 
                      gdb-10.2 | 1 
host-gdb-arc-2020.09-releas... | 1 
               host-runc-1.1.3 | 1 
host-spirv-llvm-translator-... | 1 
            igh-ethercat-1.5.2 | 1 
                  jack2-1.9.20 | 1 
libcamera-ba6435930f08e802c... | 1 
               libcap-ng-0.8.3 | 1 
                libglvnd-1.4.0 | 1 
             libgpg-error-1.45 | 1 
               libgpgme-1.17.1 | 1 
                    liblo-0.31 | 1 
               libsigrok-0.5.2 | 1 
               libvorbis-1.3.7 | 1 
           linux-5.10.115-cip7 | 1 
            linux-fusion-9.0.3 | 1 
              liquid-dsp-1.4.0 | 1 
        ltp-testsuite-20220527 | 1 
           lttng-libust-2.13.1 | 1 
                lua-cffi-0.2.1 | 1 
               mariadb-10.3.35 | 1 
                 mesa3d-22.1.6 | 1 
              micropython-1.19 | 1 
                    musl-1.2.3 | 1 
                  ntpsec-1_2_1 | 1 
                 openal-1.22.0 | 1 
                 openssh-9.0p1 | 1 
                    opus-1.3.1 | 1 
          perl-net-ssleay-1.85 | 1 
                     pv-1.6.20 | 1 
    python-cryptography-37.0.4 | 1 
           python-numpy-1.21.2 | 1 
   python-pycryptodomex-3.15.0 | 1 
            python-sip-4.19.25 | 1 
      qt5webkit-5.212.0-alpha4 | 1 
                  reaver-1.6.6 | 1 
ripgrep-af6b6c543b224d348a8... | 1 
                rocksdb-6.20.3 | 1 
rtl8189es-39c17661136da48f8... | 1 
rtl8723bu-19b4bdc05483a1e79... | 1 
rtl8821au-4235b0ec7d7220a63... | 1 
                 sudo-1.9.11p2 | 1 
                 systemd-250.4 | 1 
                tealdeer-1.5.0 | 1 
                tinifier-3.4.0 | 1 
                 wolfssl-5.4.0 | 1 
                wtfutil-0.41.0 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/ff73695bf9601ca0a96e935ca44fe7083d472ede |     
   mips64    |          acpid-2.0.33          | NOK | http://autobuild.buildroot.net/results/69ed1567d66bbfbcea37aa0a227c3d3c00db7662 | ORPH
    arm      |     at91dataflashboot-1.05     | NOK | http://autobuild.buildroot.net/results/2d31cfde431cbc4fcf9bcc34bb8c5c808fa9586f | ORPH
    i586     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/ccaf34b01cd3f1a32162ee1cfd42fdc3275a52ce |     
   arceb     |          boost-1.79.0          | NOK | http://autobuild.buildroot.net/results/47ff5ed7010f6dc9cb5de95303e908f57da45c1d |     
    mips     |           brltty-6.4           | NOK | http://autobuild.buildroot.net/results/528bf78524fc039553b8f26fd1afe7f74c8be715 |     
    mips     |           brltty-6.4           | NOK | http://autobuild.buildroot.net/results/306d54e69f0f4878d761041da788c9c3ea6dfbd7 |     
powerpc64le  |           brltty-6.4           | NOK | http://autobuild.buildroot.net/results/cfd1fea169f0640daf3489c4f8e764dfefdcf29e |     
   nios2     | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/3dfeaaf2275abe326eb694c2eef14463e151c658 |     
   sh4aeb    |         coreutils-9.1          | NOK | http://autobuild.buildroot.net/results/84fc9e1c4d3dd295a61693ee88a79476f3740d90 | ORPH
   x86_64    |      crucible-2022.05.25       | NOK | http://autobuild.buildroot.net/results/16d2553885d0bda648efd0635c3a8925f618038a |     
    sh4      | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/7254fde0ec0c844db79579f19f1bc649ff1f1977 |     
    arc      | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/809ada7e7bbea7b33ea810c73cf2594c6c83d67d |     
   x86_64    | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/aa9d751a2a00c0cf3fd9764e834d3138a0e67712 |     
   mips64    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/32ffc504f999f3f9a49693c26e20ad076c126189 | ORPH
   x86_64    | docker-proxy-f6ccccb1c082a4... | NOK | http://autobuild.buildroot.net/results/ca706fe5ec5edc5540a68434631d3e8eeecca8b6 |     
  riscv64    |        dropbear-2022.82        | NOK | http://autobuild.buildroot.net/results/643cbc468d8b2c18958d4e53265329c56c292ea1 |     
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/fc155a069a25240d4aa83451ea6e1a92958d2e18 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/ee6fe6f5fe33918384c1691c3870d2b6c26fddef | ORPH
  riscv64    |        erlang-22.3.4.22        | NOK | http://autobuild.buildroot.net/results/644d1e89ee503e8e56dfcd0f85c901d501b802dd |     
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/da9111af25668105cc982c83e3f181cfbea19004 |     
powerpc64le  |          ffmpeg-4.4.2          | NOK | http://autobuild.buildroot.net/results/f5ff421f592de8f9d4ad3e67c53d76298e44d799 |     
powerpc64le  |          ffmpeg-4.4.2          | NOK | http://autobuild.buildroot.net/results/a614f7fa375fc442c95034effe329411f34c0aa5 |     
powerpc64le  |          ffmpeg-4.4.2          | NOK | http://autobuild.buildroot.net/results/10661747a35db01feac043627ead3d31edbe9f4a |     
  mips64el   |          ffmpeg-4.4.2          | NOK | http://autobuild.buildroot.net/results/757ac875deaf3ce96c2100619b57680180ab2996 |     
 powerpc64   |        fftw-quad-3.3.8         | NOK | http://autobuild.buildroot.net/results/5a3fd1ab86022ab7c28e42434887e5490d6fd725 | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/7d4e8d7ca251210a7800dbcb7f9ad9ce9a0eb9bc | ORPH
    arm      |    freeradius-server-3.2.0     | NOK | http://autobuild.buildroot.net/results/5a0e5023c274223b5eb7623165395549e7f446bf |     
microblazeel |    freeradius-server-3.2.0     | NOK | http://autobuild.buildroot.net/results/98a6033e670b75b33c8fedeaf22726ecab01aa44 |     
    sh4      | fs/ubi/ubi.mk:51: /home/tho... | NOK | http://autobuild.buildroot.net/results/41bd73c29e0b8874c55021802df26017c3afa074 |     
   xtensa    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/afcc035ec20ce80b5a4392968522e8500c185e84 |     
   arceb     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/1ff309ee3743f018340c83d685abef4e2ccac8b1 |     
  aarch64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/2a00e2cadae6692c478236d35f9616093ea2dd84 |     
    i686     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/e56d516c107e0bdf89a448d8bab19c62661a02f5 |     
   nios2     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/04edead0ce832f9050f808c7066245f5d70c44dd |     
   arceb     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/385a55e9e9ea9b7ea2879860179c39782ab2f288 |     
   mipsel    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/55b185d9bfa031a12b52bab30efb78e7220397f1 |     
   mips64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/79e5e718dc9e62ab3051b382a7643a4c55333d47 |     
    mips     |           gdal-3.5.1           | NOK | http://autobuild.buildroot.net/results/3add81b25b1dd67ab22c4c472976170c4aaa80eb |     
    or1k     |            gdb-10.2            | NOK | http://autobuild.buildroot.net/results/b3c0df53d09d9facaf0c3c2bc4529f9fcf7737ee | ORPH
  sparc64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/cc2ea4e0fc9e5388308712789b7bc22a1ccdb0fc |     
  aarch64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/a47c63691411ab0202bcf3aff33c7e45ec698f37 |     
   nios2     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/d4517a0bc8bb39967fb8567d8a6a3635205c95f9 |     
  riscv32    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/c7b1c05056007b21747d414500a02090342f23b9 |     
   xtensa    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/f7bdc0260c78a26bfdf44e13213f69fc11a08157 |     
  riscv64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/1090a2c14e21b8c6c254349307bb47d76c5c012a |     
   sparc     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/3a50eb68c985bb487681ac752d165a3b782881a2 |     
  riscv32    | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/1778ff03ef7528dfad1d4c4de4c963d3ffd8d997 |     
   nios2     | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/0bc95011fb1b8dbab229f5bad36b208bca61d773 |     
   mipsel    | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/2306939224ff0e9fee606bb331e518dd325fddd9 |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/73198477e5150242f6ee0fbb685da997207d5338 | ORPH
    m68k     |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/0d3363ef5d56156f8044a0e23b2bbf17e9760a62 | ORPH
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/8f6ff41e97ead00dbfc515992ea58476ed724005 | ORPH
   s390x     |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/52be45b8d054616efbc9e7bd597df5d7463f9b17 | ORPH
  sparc64    |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/8ee57dea6e10cd4e52745ae72b7265b6fb0f4e25 | ORPH
    m68k     |      host-elf2flt-2021.08      | NOK | http://autobuild.buildroot.net/results/a9c69b03733b515a2e0ea94a7b3958f0c73237c3 | ORPH
    m68k     |      host-elf2flt-2021.08      | NOK | http://autobuild.buildroot.net/results/fbf356fc2b2fc9fe3f055b5fdaab739c1c41f82b | ORPH
  riscv64    |      host-elf2flt-2021.08      | NOK | http://autobuild.buildroot.net/results/0fba267084c9390a27a6a3f08b039700907c82b6 | ORPH
   arceb     | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/3ed2715e7b91f13d212860b20a576f7dc1762568 | ORPH
   mips64    |         host-go-1.18.5         | NOK | http://autobuild.buildroot.net/results/7c295e4bc98f853e582d41dc9425eeaadabac031 |     
  mips64el   |         host-go-1.18.5         | NOK | http://autobuild.buildroot.net/results/3ff4d5aef829cdf03e7390a192955da05f5c0616 |     
powerpc64le  |         host-go-1.18.5         | NOK | http://autobuild.buildroot.net/results/731356ecd28eace5eaf6046a999d4a12d629b03a |     
  mips64el   |         host-go-1.18.5         | NOK | http://autobuild.buildroot.net/results/15b69a7c89f14cc1617dcec533fb64bd27e99441 |     
  mips64el   |         host-go-1.18.5         | NOK | http://autobuild.buildroot.net/results/04cc6ef995e5a4f162d1eb25346b204250696ce5 |     
   mips64    |         host-go-1.18.5         | NOK | http://autobuild.buildroot.net/results/1da44bcf589017a57e686608a949aa73f6528088 |     
    i686     |         host-go-1.18.5         | NOK | http://autobuild.buildroot.net/results/a51e2f4e7f7775bef25b17a4268952a83bc167e3 |     
   sparc     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/b4b46781484a447b4740af03d524ef564d60573e |     
   arceb     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/355d64fdfc8149ca346511fecfe5ec7298e53aae |     
    arm      | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/1c1698f3acc39ecf0b73fbcf576026c6c361afb1 |     
  riscv32    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/17b5095006dec0ebded5b472a45b5db795059ea5 |     
    arm      | host-python-pycryptodomex-3... | NOK | http://autobuild.buildroot.net/results/7fc3b8c5604b2a99bf0b0b2cbe1bdf96ea3adaab |     
    arm      | host-python-pycryptodomex-3... | NOK | http://autobuild.buildroot.net/results/5bec964fb8585abc75271b288d2264cf6285c214 |     
  powerpc    | host-python-pycryptodomex-3... | NOK | http://autobuild.buildroot.net/results/d11bf3fbc0f2e57ac124ec5643f27fe2f414b358 |     
   mips64    |        host-runc-1.1.3         | NOK | http://autobuild.buildroot.net/results/60f2579bba2c7e17de65525604da8cb0f8d8a2de |     
    i686     |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/2eb77878964bcea3de63e679b71c4e3fb556055a |     
   mipsel    |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/d8d6d45d4bd17aa2e12f9e95656b9a24bc45769f |     
   s390x     |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/dcc3315fa040d107f311654ca3f02964ede23884 |     
  sparc64    |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/ce235d59cc93d18611221b31c6e8031d79e4e331 |     
  sparc64    |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/d61dbdbda472b13a2f4ea454bd315aaa0f3a68a4 |     
   x86_64    |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/4983b5cdc18e83d7ba10c526325c06e1b3ad9a1a |     
   s390x     |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/001f3707fc4530074298b74f87e1b77731704f78 |     
  aarch64    |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/4847d9a5d51bcf6ac7c470c44429f5c8888fd314 |     
    i686     | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/0698d498265aff90c075811e004eb951708b194e | ORPH
 aarch64_be  |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/d710293ef055330d564e78dbdfa2e4e9bd66dc39 |     
    m68k     |          jack2-1.9.20          | NOK | http://autobuild.buildroot.net/results/ac34a0447999911d5ea20f2f91848eec6aa8e782 |     
    arm      | libcamera-ba6435930f08e802c... | NOK | http://autobuild.buildroot.net/results/f8eba0e564d03b83fcda4085baec16a4857c7d25 |     
    or1k     |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/fd67a7a414748babc2438ee72479d5b1e7410b44 |     
    i586     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/5cddfdd20c0d948e52a59fe56ef7aff5c0b99609 | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/8297dec39a4604799a1f782f53b569534b5a940c | ORPH
    i586     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/506216ab2237f4a36149d7856904b0db46281670 | ORPH
   x86_64    |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/772c8fbfe03bb95353586cf0ab41a73a6cf2ead0 | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/9745654c6b6c67704127b037e1e34de3cc60eef0 | ORPH
    arm      |        libgpgme-1.17.1         | NOK | http://autobuild.buildroot.net/results/2915f6105bae595274fabaa12de7cc53926d22d0 | ORPH
   s390x     |           liblo-0.31           | NOK | http://autobuild.buildroot.net/results/fec5913a794e2555b831907e86b2d7811c36dae9 | ORPH
powerpc64le  |          libnss-3.81           | NOK | http://autobuild.buildroot.net/results/a2bf3cd2c256a02d232656369e8ca21becccc12b |     
    or1k     |          libnss-3.81           | NOK | http://autobuild.buildroot.net/results/53e254a81ebd5e368c7a6df0f6c65aa5379b9cf3 |     
   sparc     |       libopenssl-1.1.1q        | NOK | http://autobuild.buildroot.net/results/90aca40aa87ff6bd45fc81e85f244e8cf15fb3fb |     
   sparc     |       libopenssl-1.1.1q        | NOK | http://autobuild.buildroot.net/results/5fc1e10af2883cc57916c1921e53619a5f8b1244 |     
   mipsel    |        libsigrok-0.5.2         | NOK | http://autobuild.buildroot.net/results/f80e275b7999b2143dbd6e66a00788dc85aebe03 |     
  powerpc    |        libvorbis-1.3.7         | NOK | http://autobuild.buildroot.net/results/9b1466f4f8217399f45772960472f4b0aa7da18d |     
   mips64    |    linux-5.10.109-cip5-rt4     | NOK | http://autobuild.buildroot.net/results/a0c66156231df5b98bf174e4f6f00b09dfee255f | ORPH
    arc      |    linux-5.10.109-cip5-rt4     | NOK | http://autobuild.buildroot.net/results/fcaae2b517dacf3ab840279661004683941eaa26 | ORPH
powerpc64le  |      linux-5.10.115-cip7       | NOK | http://autobuild.buildroot.net/results/f224cb49ce32d4843cfe30fffff8d08e08cd0a37 | ORPH
    mips     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/d5445695717db9a61334079730bab7fcb5f8fa74 | ORPH
   s390x     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/6b4a35918045fb8ba1edee03bdfb43a0a414303c | ORPH
  aarch64    |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/d15d0db22869ece6c102d5e39682d8af93901186 | ORPH
   nios2     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/4897b7dc0e4bd51f78bcfdfa5908e60435dfd7ee | ORPH
   xtensa    |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/6876d06648367dfe56b45d99cae6172630f2a6b7 | ORPH
   sh4aeb    |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/66daaf1ccfd10ad3f7fa2d503144160a93ed5118 | ORPH
    m68k     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/901fdbf405b90f4d57dac1a69bc38e6679c3397c | ORPH
    mips     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/e5457d971e674df6d898f65a4dd20bea36ca0cbe | ORPH
  mips64el   |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/0dc00606cf505c1893cc5127ef49954f391145e1 | ORPH
   sh4aeb    |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/93041ba4476808880c501764e942f41ab8259729 | ORPH
   mips64    |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/28c4f84e9d3ba866c2b13c6a1deafa5b52f5b892 | ORPH
    arc      |       linux-fusion-9.0.3       | NOK | http://autobuild.buildroot.net/results/d71e7060b2087816387b9548ba58bffd6a12c3bc | ORPH
    arm      |        liquid-dsp-1.4.0        | NOK | http://autobuild.buildroot.net/results/405ff9dc45f5c03678ebb42c1cd4c46806f08406 |     
   sh4eb     |     ltp-testsuite-20220527     | NOK | http://autobuild.buildroot.net/results/6e08a9206e44b74284bf7c71e23852e4991610ca |     
   x86_64    |      lttng-libust-2.13.1       | NOK | http://autobuild.buildroot.net/results/d5078d8cbcff4c93b09828c0c9545560c607fc52 |     
    arm      |         lua-cffi-0.2.1         | NOK | http://autobuild.buildroot.net/results/98eb9d6294209b29f4c31bf01ac27b5acc7d8e45 |     
   sparc     |        mariadb-10.3.35         | NOK | http://autobuild.buildroot.net/results/2c844ec4845cdee59ffc9e1c5783f90b4a9dc0d5 | ORPH
    arm      |         mesa3d-22.1.6          | NOK | http://autobuild.buildroot.net/results/4d3e12c613e3502b03d1ede17ac8b1ce1fac89f3 |     
  aarch64    |        micropython-1.19        | NOK | http://autobuild.buildroot.net/results/bd07a91e312136ead817d027b1b7cbf8a5563889 |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/730e987c290184ef918090057cb466355b251fcd |     
microblazeel |          ntpsec-1_2_1          | NOK | http://autobuild.buildroot.net/results/523e45bf4769bfe4a6ed0e7cac291649f8f10168 |     
   x86_64    |        open62541-v1.3.2        | NOK | http://autobuild.buildroot.net/results/ed866fdf8a7b7310589f04a59749d7f7fac7108e | ORPH
   nios2     |        open62541-v1.3.2        | NOK | http://autobuild.buildroot.net/results/4303b7145a037d46bad39933534ac105b1a3ab3b | ORPH
    sh4a     |        open62541-v1.3.2        | NOK | http://autobuild.buildroot.net/results/498a89cf829c0f4a395c8495dc9d5772ce746a73 | ORPH
    mips     |         openal-1.22.0          | NOK | http://autobuild.buildroot.net/results/9c4e935250ac323c2765788d4cb6f073ad285351 |     
    m68k     |         openssh-9.0p1          | NOK | http://autobuild.buildroot.net/results/f3279948a1616a770ef570248111dea288683336 | ORPH
   armeb     |           opus-1.3.1           | NOK | http://autobuild.buildroot.net/results/b6455bf5f8dbf028d4e6ce5244a67de0f2c2c8ad | ORPH
    or1k     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/a04114ff26c9e19579952822897135c1b10d0cc8 |     
    arc      |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/e3d57c4b4d9759fd18fbd1d9e3e95dcbc69eeaba |     
microblazeel |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/6fecd7e7a34053a0fc6198d727f2215656815732 |     
   mips64    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/fec6f823261a0e7e2b8b6dfc516f767435970362 |     
 microblaze  |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/9fba06abe0e7fb1a1b868dfec8dcadde342235ef |     
   mipsel    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/aa075de4570736e9a422739637802404e1121ab4 |     
    arc      |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/7f392241e403ebea098d18941a1dec1583dbf6ec |     
  aarch64    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/a180bc9069821fe6c4581782ed542bd260086990 |     
   xtensa    |      perl-net-ssleay-1.85      | NOK | http://autobuild.buildroot.net/results/1da5540c96788b5669490228305915ad88e71890 |     
microblazeel |           php-8.1.9            | NOK | http://autobuild.buildroot.net/results/98f75389bd893d4a868bb03a29418e0af8d8f687 |     
   armeb     |           php-8.1.9            | NOK | http://autobuild.buildroot.net/results/872f7690e417603eca98e62bf70cd15acd298bcd |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/1d719dbffbd1aef6b26e0d6446b3a1450f70767d |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/55fe7e1ab6759fa3c1a1e7a6c092caa390876b73 |     
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/ace9a4dcbec705e2fb725ef3e453c0491598284d | ORPH
    mips     |   python-cryptography-37.0.4   | NOK | http://autobuild.buildroot.net/results/905cbd0ce1f3c1e82652881619dc0f16e59f585f |     
   armeb     |      python-numpy-1.21.2       | NOK | http://autobuild.buildroot.net/results/b5f390ccf4cfdc336dc3c40f17ba065a3d2d32d8 |     
    arm      |  python-pycryptodomex-3.15.0   | NOK | http://autobuild.buildroot.net/results/1b63031f0b0f8e9656daebbfa3f6b8e5921f3eb4 |     
  riscv64    |       python-sip-4.19.25       | NOK | http://autobuild.buildroot.net/results/efd4091879610e2eb772137dbdc735258a5fd45c |     
    arm      |    qt5webkit-5.212.0-alpha4    | NOK | http://autobuild.buildroot.net/results/643e1e025ff186755e8635b2a319146cb5c02127 |     
   arceb     |          reaver-1.6.6          | NOK | http://autobuild.buildroot.net/results/95651a12cdea6c2c66a30d8c60a4ce88439587c8 |     
    mips     | ripgrep-af6b6c543b224d348a8... | NOK | http://autobuild.buildroot.net/results/c4422390576ca2af7325f44f9bf07804c1a2988b |     
 powerpc64   |         rocksdb-6.20.3         | NOK | http://autobuild.buildroot.net/results/77dd889dc5720709a61f8e219b0315b51e9ce9b9 |     
   sparc     | rtl8189es-39c17661136da48f8... | NOK | http://autobuild.buildroot.net/results/b4d105111dd02d7ac200bfcc228b3d4628cdc989 |     
   s390x     | rtl8723bu-19b4bdc05483a1e79... | NOK | http://autobuild.buildroot.net/results/a4c9b8338e401576ceda12e0f00018ccec792e0f | ORPH
   nios2     | rtl8821au-4235b0ec7d7220a63... | NOK | http://autobuild.buildroot.net/results/ea61878c2cd46c298b11b791e113637f5d0dd8e5 |     
   sparc     |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/e24888517dca48a56bebc3566a8deeb036b44d51 | ORPH
    sh4a     |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/a4f6a868aa9d8d00fb6eca4179a7bb258cab7eca | ORPH
   sparc     |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/d78414bc66e22f8fe8e7f9c00bc3f703aa044ff5 | ORPH
   nios2     |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/760f30928508d5976b24161d5e6e255261c66185 | ORPH
microblazeel |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/e01cf10da3f66d27c3af41c8276c0f8463950445 | ORPH
   nios2     |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/5dc07eabdcec7dd72d709fa1d0c10acd42f8ab62 | ORPH
powerpc64le  |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/53d466033c5e2e8befaf75b31d94c26eaf906289 | ORPH
    i686     |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/a08f39fe4c7229e791d4b65f7193d6d6c1a5ba71 | ORPH
   nios2     |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/16d9c4a7dc57536c3866185dc320249c9856d439 | ORPH
  mips64el   |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/e404cb502adfd975c76e2a52530c77473f2b71d4 | ORPH
 microblaze  |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/a00c55bad5dd100244391e178bb9f22f325a735c | ORPH
 aarch64_be  |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/96a5218cb12677f62d7f05b4c89e59f5ca97fe0c | ORPH
microblazeel |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/dd867def3e6affb2a5d9731d28bcf45f86ca8910 | ORPH
   armeb     |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/827f1540b7fff2da5b6f93cde135114c116c1c47 | ORPH
  aarch64    |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/6d7a3465d0f23ca0e8ac0c8f1288428dbe8c915e | ORPH
   arceb     |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/d07d7373d896a33015fdfbdbff1f534cb9904549 | ORPH
   xtensa    |         sudo-1.9.11p2          | NOK | http://autobuild.buildroot.net/results/e7c8ed3253842526d891e60f7b36cfa2bd1ce269 | ORPH
   nios2     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/c4c161432cc92132576da6d143e732735f25ce13 |     
   s390x     |         tealdeer-1.5.0         | NOK | http://autobuild.buildroot.net/results/baced5a46938ea55fbfdf945d6ae561e4472bd45 |     
    or1k     |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/e9597687c223c3a8a66b8900e484d45c09caf227 | ORPH
  aarch64    |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/087c8571bb4ee42fd938f321b61b85ce79d15f9b | ORPH
   mipsel    |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/56350f6bdb281e66be258e3186f4f9eb78856d12 | ORPH
powerpc64le  |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/5514f015b512bd980beadfcef696acf8d319c736 | ORPH
microblazeel |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/99205f0e5c06895a7c620f9b8d28848080fbdb92 | ORPH
microblazeel |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/3379f2ef1c052d6f4170189351de731b109ac705 | ORPH
  mips64el   |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/94d468086dced4f6410c0000d061f2ad2273b95e | ORPH
   mipsel    |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/a2d31576ca9718d2b26e4286f34fe45225fd79ee | ORPH
   s390x     |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/ff245ae1a3ccf56064644a6393df396aed667195 | ORPH
  mips64el   |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/a9742e5e783e55dab6c6d534fcdc0a565b97a71a | ORPH
   mipsel    |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/2d2745fcf3e2ed1eb6d26bf6816287e95d5338eb | ORPH
    or1k     |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/a2dc6afc3b988d8bbdd9561b591233fa2c6807f9 | ORPH
   x86_64    |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/e021ce1921e98aab9aad85c0bd94d10dd4e45e46 | ORPH
 aarch64_be  |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/2b63077ea2d9fe4c0bea0aee429d70532005ca64 | ORPH
   sparc     |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/212b1c2c77dd306635393de1ed6986bd466a7c25 | ORPH
   xtensa    |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/99fbb92ebad9b0656959efe92a77683276510362 | ORPH
 microblaze  |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/c6c7942a303796a8e9b4d09f8ea72bb59d5c4dfd | ORPH
   sparc     |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/b6e476f5684ea4ef4e71984fd3339181d871ff2c | ORPH
   sparc     |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/58746b9fa7cb2f31a485c3b4e680eb7c708d62ae | ORPH
    m68k     |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/fe8838f2483d3bc5f2448c9bfbf188401f85a284 | ORPH
   x86_64    |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/6ceab6ed775f7729e323fe98bc0bd2189d97b20f | ORPH
   mipsel    |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/373520250a173fa4b2f55ce4c104b50d22060444 | ORPH
  riscv32    |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/a718777284308c0dbbc9f9e6789da69c76d683a4 | ORPH
    or1k     |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/ebd855c48229c303c29862f76adefdc55f301753 | ORPH
   armeb     |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/05a801397eecc5416241d308caa886d4d893f19d | ORPH
    arm      |         tinifier-3.4.0         | NOK | http://autobuild.buildroot.net/results/53406a3705b78808a94e5aa7f8d13cae13465743 |     
   xtensa    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/687f845aa568d50be9b9f98c4ecddc6656236211 |     
   xtensa    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/e6e4772dd565b39d71a3812b31b2f21108803917 |     
   xtensa    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/34bf2dd6fc9757ca9cd0b613b4cdc8603304ba12 |     
   xtensa    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/706ad31e3d48df576ad7b4c00a48a9a1d197e340 |     
   xtensa    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/dc7abaeaad13c31cf9b82d67e872fad41e7c082f |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/0ab8a76662d360aac21b1d59ce30bae404d48bc7 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/df68380d2650f61d39321e1bc2971d76a4925c6d |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/c54b19a21fd857218a16e0ea279c2e4272b1530f |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/da639424ea694acf23e28171cb50948838cc343b |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/a2a81d9722e52f7a9284f01a696a7a58c6ab47fa |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/435aecdefa20226a3228eb66a92e9ad7974484c3 |     
  mips64el   |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/59f0a5845b8a14f48e23fcd05bf70084cbea8663 |     
    mips     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/713c9b671ed09c3447620bb096fd463c5593867d |     
  mips64el   |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/252533ed9d66b4375bd24feb0c9ddc9187e1e501 | ORPH
   s390x     |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/f7b7be36361306bcd13a1b432b15dcb535a1abfa | ORPH
    or1k     |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/2d04f6b59091a9250ffb42ef51e8a864ad95871e | ORPH
   sparc     |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/41fdbc6306c94521c82871455d822731c31af74c | ORPH
powerpc64le  |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/8bd2f4905acf9b2e3d325fbc0e0a09c256f34893 | ORPH
   armeb     |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/8325fcfde5cb4970be734b03bd085740e4885f29 | ORPH
   s390x     |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/95d56dcae83408cad0865e4accdd39485388dd88 | ORPH
    mips     |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/bdbd7c485a8029fa75309f433a085835dbb734d5 | ORPH
 powerpc64   |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/35ae2933b2b27ef4db835f051a33b7286eb76fde | ORPH
   mips64    |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/b229158afc5be26173c6478bfd899e01392bcf27 | ORPH
  powerpc    |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/85dddcf30d480086ce24902113d2d2b3d10b7ac1 | ORPH
    mips     |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/06b36f99b24a9a79641361a107595349fc396abf | ORPH
    arm      |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/5ce877498226a6f3155478d67a2ea9f9bc3a2349 | ORPH
  riscv32    |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/d650fc603135fd73abc2a815032de7c7d05e9431 | ORPH
 powerpc64   |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/9667d741b8400f2d9e634561fb55bc976a2fcd01 | ORPH
    or1k     |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/c64db93179bfac5107e3784c8189b7bea448564a | ORPH
    i486     |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/202636d0f41ad7a5bb056f36b15ce2ab0bfb6335 | ORPH
  sparc64    |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/2b54633e6cc26b15dae854563e545855a6e309ce | ORPH
  powerpc    |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/2743d306c3ffd823a7f699fa542a9cd6660f5b57 | ORPH
   arceb     |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/ab23dd57c9f17d1aee2d6eb9308ba217cb97cda1 | ORPH
   s390x     |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/9534241ae8a17450456b8feaa9bc262b11c2eabc | ORPH
    m68k     |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/d028adbdb866293a2cf2901edf67dd6d2365d8e1 | ORPH
  riscv32    |         wolfssl-5.4.0          | NOK | http://autobuild.buildroot.net/results/4a359d452e1e64bec6f4d3584bf7fdf7fe1d24a6 |     
   mips64    |         wtfutil-0.41.0         | NOK | http://autobuild.buildroot.net/results/2d7492483723197f20bb3ed4f057de97787c42e6 |     
  powerpc    |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/32daebd66dccf1eea877ffb5dbfdf35691f41ecb |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

           libfreeimage-3.18.0 | 1 
                  waffle-1.6.1 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/6740fd2f55b1a0e1bd32d8dfab7debfb99ea2bf4 |     
    arm      |          waffle-1.6.1          | NOK | http://autobuild.buildroot.net/results/d6fe410aba7ff61bd8a640b52ab8c80fb5070fea |     


Classification of failures by reason for 2022.05.x
--------------------------------------------------

           libfreeimage-3.18.0 | 3 
                 uclibc-1.0.41 | 3 
                 pixman-0.40.0 | 2 
/home/buildroot/autobuild/i... | 1 
/home/buildroot/autobuild/i... | 1 
                  boost-1.79.0 | 1 
                busybox-1.35.0 | 1 
                 dash-0.5.11.5 | 1 
                elfutils-0.186 | 1 
         host-gcc-final-10.3.0 | 1 
                host-go-1.18.3 | 1 
              host-rust-1.60.0 | 1 
      libabseil-cpp-20211102.0 | 1 
                    libndp-1.8 | 1 
           linux-5.10.115-cip7 | 1 
                 linux-5.17.15 | 1 
                ljsyscall-0.12 | 1 
                 mesa3d-21.3.8 | 1 
               protobuf-3.20.1 | 1 
                     refpolicy | 1 
                  sudo-1.9.8p2 | 1 
    toolchain-external-bootlin | 1 
toolchain-external-codescap... | 1 
                       unknown | 1 
                 weston-10.0.1 | 1 
                       xenomai | 1 


Detail of failures for 2022.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/eddc33c916d2bf5adcaf0a3a8f0958341e8357ed |     
    or1k     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/74b99a0be2a77824cf56768d47df2b40c6c8d9db |     
   arceb     |          boost-1.79.0          | NOK | http://autobuild.buildroot.net/results/71990a276fa66e858e85c65c3acc83535a78d5c7 |     
    m68k     |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/107183b37841e47428475afdd8d09c284b4b6d4a | ORPH
microblazeel |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/381cd749a6b89e3147479fa02c7a8015ba04dcfe | ORPH
   arceb     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/80c5d5d6fb8b2735296a6136945ea9dabc28a242 | ORPH
    arm      |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/9bd6c6bda3c054dd293383482e400ea442d9dd75 |     
   mips64    |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/103f5fcc8e26375b98c228d4ba89e25241c57d9e |     
   mipsel    |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/e7e8f118f87393e46387522978a63db4bfe2754f |     
   mips64    |    libabseil-cpp-20211102.0    | NOK | http://autobuild.buildroot.net/results/537db0cb19abce6e11ee1ef41ff319f5f04b7ad8 |     
powerpc64le  |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/4169316a6933eff052a59a118c76f7de7db7eede |     
   nios2     |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/dcb56f1fd118a84da66fb30d91f5a3285d11cc5b |     
   xtensa    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/67e19aa3ba52bf3644a05df7d43ef8d784cbc2fa |     
    or1k     |           libndp-1.8           | NOK | http://autobuild.buildroot.net/results/c00a16e62a545fdf805fd1c1a88409a250d6c26e |     
    arc      |      linux-5.10.115-cip7       | NOK | http://autobuild.buildroot.net/results/fcf0a74057f1543100a7fedc067bd62ad89fe54f | ORPH
    mips     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/9fd25a3f210d9ac7050af99be096eda4b3e930c3 | ORPH
 aarch64_be  |         ljsyscall-0.12         | NOK | http://autobuild.buildroot.net/results/1d6b55415ccb055a0b7a51895ff392aaef7e47fb |     
   x86_64    |         mesa3d-21.3.8          | NOK | http://autobuild.buildroot.net/results/3e434d2dcb007b5354befa78decd0571c1385f70 |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/a8542306ea88963c0c5f6492577a39bef1a6100e |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/49ec3a029bda743e9bed594f0bc5f83d42b909dd |     
   nios2     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/c52c099924eb652a9c4bf54c94b2193f18dce286 |     
    or1k     |           refpolicy            | NOK | http://autobuild.buildroot.net/results/68a3f96f12f7b34866a22ba4586af50d71a3e6d7 |     
   mips64    |          sudo-1.9.8p2          | NOK | http://autobuild.buildroot.net/results/a8c0b64095929d1683e21e2cbef02cc7cb7b765f | ORPH
   mips64    |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/cd915514f6072c5ec189ee665d957349b70f3227 |     
   mipsel    | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/14db8d0a6308ae1fb3ac871a757df5b35f59ec0d | ORPH
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/50100f1e043b686687598b9f4c6523e2da76841d |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/0a9ef6966695013e08f6d3ad0854b66ea705eed0 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/e942efa74f791fce263569cef11f33af1e941e40 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/ede099d02e6585c75552b8b919278743f8c08f88 |     
    m68k     |         weston-10.0.1          | NOK | http://autobuild.buildroot.net/results/ec4e1674fd53aef1722610e590e95f88c5ff2704 |     
microblazeel |            xenomai             | NOK | http://autobuild.buildroot.net/results/ce6e693a14a8c23cb653979cca93526d6a475475 |     


Gitlab CI results for 2022-08-27
================================


-- 
http://autobuild.buildroot.net

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

