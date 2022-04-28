Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 937FEC433EF
	for <buildroot@archiver.kernel.org>; Thu, 28 Apr 2022 04:40:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E9A25400FE;
	Thu, 28 Apr 2022 04:40:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rTHYUfHNHqm4; Thu, 28 Apr 2022 04:40:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2F4464016C;
	Thu, 28 Apr 2022 04:40:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4B1671BF865
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 04:40:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 46F2541754
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 04:40:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jProgJVpUv4k for <buildroot@lists.busybox.net>;
 Thu, 28 Apr 2022 04:40:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 36AC941714
 for <buildroot@buildroot.org>; Thu, 28 Apr 2022 04:40:35 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1F681C0004
 for <buildroot@buildroot.org>; Thu, 28 Apr 2022 04:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1651120833; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=yQg/ksASRasWFCAoNicVU8hUf+VDOZ/1cuSRfvAC37g=;
 b=OSJzlQV9CSPoSPpjp5bNo4PjUEK8d+AVKQ6w23MaUk5ceJaPMOurfymmbOh4ET74merYmS
 iEfzk6ftnLb8nrjrH/u0Zzf43YFVJsf+BpdACr4tYIvjuURvAFVjIzULi5pvaF9se054Rz
 g6/N5O8RjxXkxdHi9DqGd23F3jdx3CSqiOrjHdWCh46HUFhLkuWshcv92EvyQDD2+adKfZ
 Hs3mIIQd15MlF0NIutAq+xFohFKVQclUBYDfILIdNsGZDNBGlDkeg2C3ZVvtpE9W7rumI1
 4ts/2Sueqd08zvhNWVglSLUid6CZerR2vGRlI8DxF/OpvyUJ6pQPDTqnpKS3Yw==
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Thu, 28 Apr 2022 04:40:33 -0000
Message-Id: <20220428044039.46F2541754@smtp4.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-04-27
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

Autobuild statistics for 2022-04-27
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  | 24  |  9  |  0  | 33  |
    master   | 149 | 154 |  1  | 304 |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 35
                  zchunk-1.2.2 | 6 
                    git-2.31.2 | 5 
         host-gcc-final-10.3.0 | 5 
           host-wayland-1.20.0 | 5 
                 uclibc-1.0.40 | 5 
               libevent-2.1.12 | 4 
         linux-headers-5.15.33 | 3 
                python3-3.10.2 | 3 
                 zlib-ng-2.0.6 | 3 
                  exempi-2.6.1 | 2 
              host-rust-1.60.0 | 2 
               libglib2-2.70.4 | 2 
             libopenssl-1.1.1n | 2 
                libressl-3.5.2 | 2 
                 libv4l-1.22.1 | 2 
           libwebsockets-4.3.1 | 2 
                 linux-5.15.33 | 2 
   linux-headers-5.10.104-cip3 | 2 
               pipewire-0.3.50 | 2 
                python3-3.10.4 | 2 
toolchain-external-bootlin-... | 2 
                    vlc-3.0.16 | 2 
                 wavemon-0.9.4 | 2 
afboot-stm32-3566acd582e553... | 1 
               aircrack-ng-1.6 | 1 
                alsa-lib-1.2.6 | 1 
                    bat-0.19.0 | 1 
                bitcoin-0.21.2 | 1 
                    brltty-6.4 | 1 
              bubblewrap-0.6.1 | 1 
                       cfm-0.3 | 1 
                 chartjs-2.9.4 | 1 
                 dash-0.5.11.5 | 1 
                    dhcp-4.4.3 | 1 
        edk2-edk2-stable202102 | 1 
             fontconfig-2.13.1 | 1 
fs/ext2/ext2.mk:65: /home/a... | 1 
fs/ext2/ext2.mk:65: /home/a... | 1 
fs/ext2/ext2.mk:65: /home/a... | 1 
fs/ext2/ext2.mk:65: /nvmeda... | 1 
fs/f2fs/f2fs.mk:64: /nvmeda... | 1 
fs/f2fs/f2fs.mk:64: /nvmeda... | 1 
glibc-2.34-109-gd64b08d5ba7... | 1 
 glslsandbox-player-2021.08.24 | 1 
         gobject-introspection | 1 
               gocryptfs-2.2.1 | 1 
google-breakpad-c85eb4a59b6... | 1 
                   gstd-0.14.0 | 1 
host-elf2flt-7e33f28df198c4... | 1 
              host-ncurses-6.1 | 1 
           host-python3-3.10.2 | 1 
                 host-wine-6.0 | 1 
            igh-ethercat-1.5.2 | 1 
                 jasper-2.0.33 | 1 
                  kexec-2.0.23 | 1 
              libeXosip2-5.3.0 | 1 
                  libpri-1.5.0 | 1 
                libssh2-1.10.0 | 1 
               libvorbis-1.3.7 | 1 
linux-headers-5.10.104-cip3... | 1 
              liquid-dsp-1.4.0 | 1 
               lpc32xxcdl-2.11 | 1 
                    mpir-3.0.0 | 1 
                nodejs-14.18.3 | 1 
                numactl-2.0.14 | 1 
                    opus-1.3.1 | 1 
                   perl-5.34.1 | 1 
            pkcs11-helper-1.28 | 1 
               protobuf-3.20.1 | 1 
                    ruby-3.1.0 | 1 
             s390-tools-2.20.0 | 1 
                  sudo-1.9.8p2 | 1 
               tcf-agent-1.7.0 | 1 
toolchain-external-bootlin-... | 1 
                xenomai-3.0.10 | 1 
                  xvisor-0.3.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | afboot-stm32-3566acd582e553... | NOK | http://autobuild.buildroot.net/results/4a2b19705ecd81f573f0e6647137e4cefcfd6ac9 |     
powerpc64le  |        aircrack-ng-1.6         | NOK | http://autobuild.buildroot.net/results/1bf10eece2392163842c0061ae29da5e902c00e4 |     
    sh4      |         alsa-lib-1.2.6         | NOK | http://autobuild.buildroot.net/results/4078da39bd314e0cf7362fffc11adfb0112d8d98 |     
    arm      |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/e6327e90298686337f3f2d27675d58d0ccce734a |     
    arc      |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/aec8c08e564bbe33d74007d59562a26fd068c3d3 |     
    mips     |           brltty-6.4           | NOK | http://autobuild.buildroot.net/results/e1bf161f4dd9c682a5b9ed04b2d60fde0d7c4546 |     
    mips     |        bubblewrap-0.6.1        | NOK | http://autobuild.buildroot.net/results/4ea36203163d878ee50791593f3dabfe5c682351 |     
   x86_64    |            cfm-0.3             | NOK | http://autobuild.buildroot.net/results/a3b320f259b3f35455b4263df0fb797493c77580 |     
   nios2     |         chartjs-2.9.4          | NOK | http://autobuild.buildroot.net/results/2e63c16c5a0da980ea90e8a42604c006e91a7d2a |     
    arm      |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/c25c1b7ebaa7c78c4dd8c697a1bafbc6b82dd7b0 | ORPH
   xtensa    |           dhcp-4.4.3           | NOK | http://autobuild.buildroot.net/results/dbfc61781b7bc6e40bf33b6b830bc5b10b55773f | ORPH
   x86_64    |     edk2-edk2-stable202102     | NOK | http://autobuild.buildroot.net/results/5fc1044948d0f6df6e105b6872381a931ded1be6 |     
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/47aa0ebe23a86534f8b98caa2a8bfed9a1e4982e |     
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/e02c9ead5adc4e57ee34507002d4b797605fab6b |     
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/e936cf82c73647e36c2e1004c1c36790da5197d8 | ORPH
    or1k     | fs/ext2/ext2.mk:65: /home/a... | NOK | http://autobuild.buildroot.net/results/d7bb4e5969160c5858e8a1906a9f5d17e31ce1c2 |     
  sparc64    | fs/ext2/ext2.mk:65: /home/a... | NOK | http://autobuild.buildroot.net/results/f32ceacd37124106859b87e7390a258772d459b1 |     
  riscv32    | fs/ext2/ext2.mk:65: /home/a... | NOK | http://autobuild.buildroot.net/results/f0e533c053415b6a98b95aa48d6d8f85afc69a42 |     
microblazeel | fs/ext2/ext2.mk:65: /nvmeda... | NOK | http://autobuild.buildroot.net/results/0ec291c5cd510ab573f49bafb2c9b8b64d551bc2 |     
   xtensa    | fs/f2fs/f2fs.mk:64: /nvmeda... | NOK | http://autobuild.buildroot.net/results/04e232185a5d777dec94b4be6cf2c07b177eed2c |     
   sh4aeb    | fs/f2fs/f2fs.mk:64: /nvmeda... | NOK | http://autobuild.buildroot.net/results/0c1524f9676913515d82c0431c588c69bee30f8f |     
   armeb     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/3016ad6683cebd3773de4fe978ffda376a3a0bbf |     
   armeb     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/772e1f074884b981afaabb542f5705b189f86a09 |     
   mips64    |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/a2547643090687684bbeb700adaa276c014263d1 |     
 aarch64_be  |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/f859d791d7fff24ebc69277de663039471cac682 |     
 aarch64_be  |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/d675c52e20c6578d6c7649fb20dd7522fbe10a20 |     
powerpc64le  | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/5347c7a02d1fc6fe6554377e5bf853de0cea6b63 |     
    arm      | glslsandbox-player-2021.08.24  | NOK | http://autobuild.buildroot.net/results/9591ffe5968fe5f20b29799d1c234426cacd549a |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/1e01cd881bf0d96e0e97f8e7fb2457558287ff76 |     
  aarch64    |        gocryptfs-2.2.1         | NOK | http://autobuild.buildroot.net/results/4a3fe5f7153a8853b8c143b553123ea759416610 |     
    arm      | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/a501f441c6ab102408140127abec33899e64c4a8 |     
    arm      |          gstd-0.14.0           | NOK | http://autobuild.buildroot.net/results/d4d6be1f708fc0b3e32345ab40286be88803c803 | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/cbb56dbe7088ff2bcd85aac7f023be5843b40db8 | ORPH
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/2f7557b647bcdd15fe844e0f554c2a9491cab51e |     
  riscv32    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/273830dc61189b8f5f91a6b0d8e1066fb1b35bdb |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/fd4a152ecb52df0f481d23554ea169edcd6dc0ed |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/d2997827336ac644f0bf26093a5097ef082bb570 |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/ef8fba6735b324620b5c624e60bb71e335f914a5 |     
 aarch64_be  |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/3d8a11d5ad75efbd0e4c491403fccaef12173068 | ORPH
 microblaze  |      host-python3-3.10.2       | NOK | http://autobuild.buildroot.net/results/f108ce848eaa3dbe4ebc417126a77a4008491465 |     
    i686     |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/3eccc5e6124fe9cb96f3e048781089b0e83e36e9 |     
  aarch64    |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/d3cdc805c39be6131c1d478b4bb114a628abab1b |     
  aarch64    |      host-wayland-1.20.0       | NOK | http://autobuild.buildroot.net/results/11eeca9f6d02471e67cd96658a47b9533e8cc0d2 |     
    arm      |      host-wayland-1.20.0       | NOK | http://autobuild.buildroot.net/results/e6a0ca1e07185a1caff272ef4bd3ae99cd123b81 |     
    arm      |      host-wayland-1.20.0       | NOK | http://autobuild.buildroot.net/results/f130369e1d9eb850e96b8c7764a9b6848d06dd74 |     
  sparc64    |      host-wayland-1.20.0       | NOK | http://autobuild.buildroot.net/results/b84832cbd0b2fa193e99d77c0ff9ec25c0b94976 |     
   s390x     |      host-wayland-1.20.0       | NOK | http://autobuild.buildroot.net/results/ccd02639baed5c96ce4add8cd888234080d95f63 |     
    i686     |         host-wine-6.0          | NOK | http://autobuild.buildroot.net/results/b589164c53a65a22f0d263e861f049f38fdc8046 |     
  sparc64    |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/4053ae3f4d9340d50f5a5d029d8a8f322c90db38 |     
   arceb     |         jasper-2.0.33          | NOK | http://autobuild.buildroot.net/results/95c09b57e62efced0fac494fd2cf2e94f01a587a |     
    arm      |          kexec-2.0.23          | NOK | http://autobuild.buildroot.net/results/70feac04be36908dfb5cb178f2c611ce02b6bc79 | ORPH
  powerpc    |        libevent-2.1.12         | NOK | http://autobuild.buildroot.net/results/72068929b31deed40f820d780a77e7400d813fc3 |     
    i686     |        libevent-2.1.12         | NOK | http://autobuild.buildroot.net/results/0a70b88844ac5666823f15176b0335176c5610b0 |     
    i686     |        libevent-2.1.12         | NOK | http://autobuild.buildroot.net/results/0a64b2ddf51f33c8326520115f59a3d4a0a8c828 |     
    i686     |        libevent-2.1.12         | NOK | http://autobuild.buildroot.net/results/3abe90166524bc12a1f95f347fffbec7383188fb |     
 aarch64_be  |        libeXosip2-5.3.0        | NOK | http://autobuild.buildroot.net/results/4ab9d81aadd6eb05261274236843053746e5c0b6 |     
   arceb     |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/c4ea67ad68bb3d821dcf52871b54e9d629ae9922 |     
   arceb     |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/92be66dcf9647e0d55551255ead1d68e0bf0c22a |     
    arc      |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/cd19df2b36d6c3f3b690b8017465c95d9d543a1e |     
    m68k     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/3d2aedccd56c1ced9d03649c69c812d404b255b0 |     
   sparc     |          libpri-1.5.0          | NOK | http://autobuild.buildroot.net/results/4d0c9e2355d3ef920beccffc7c9394a4d0e43ca8 |     
   sparc     |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/0882bc9ba1e926cfc1a8e23b2e1fb235d40711f3 | ORPH
 microblaze  |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/411032fa7f206752d0de6d72b87815ff0663182f | ORPH
    arm      |         libssh2-1.10.0         | NOK | http://autobuild.buildroot.net/results/47f492ccd4888fe4a150b36e12c88f1e068d46b6 |     
  riscv64    |         libv4l-1.22.1          | NOK | http://autobuild.buildroot.net/results/49eed5dff858dcc8510ce88b9efe37779774a9e6 |     
   x86_64    |         libv4l-1.22.1          | NOK | http://autobuild.buildroot.net/results/b80538ad478bff719e5148441d1d790f89793920 |     
  powerpc    |        libvorbis-1.3.7         | NOK | http://autobuild.buildroot.net/results/a0c470d98319c4b47d6dd9e15469a8a57e348508 |     
   s390x     |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/2d985009b430a8324415dccb326eac6acc1d5757 |     
   nios2     |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/818c3f7cfc92e1a1c866e29f0de7075e9cdc8647 |     
    mips     |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/685ce57019f45332226ed029d1c14ac455264851 | ORPH
 microblaze  |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/2a1339e384365c91bbef5f96efce11168adef888 | ORPH
microblazeel |  linux-headers-5.10.104-cip3   | NOK | http://autobuild.buildroot.net/results/b3848fb1dbba75cb4f0b627daa7f76ef60e35f82 | ORPH
    sh4a     |  linux-headers-5.10.104-cip3   | NOK | http://autobuild.buildroot.net/results/c3f72407c63f50fcb74fe899dc274b08d87c3c2f | ORPH
  riscv64    | linux-headers-5.10.104-cip3... | NOK | http://autobuild.buildroot.net/results/58093a9f2aa5e533e32b9f39ee8cbca8fc991d5d | ORPH
microblazeel |     linux-headers-5.15.33      | NOK | http://autobuild.buildroot.net/results/294f820e3cd86300d821002806786e4648b084ab | ORPH
  riscv64    |     linux-headers-5.15.33      | NOK | http://autobuild.buildroot.net/results/3754bc7ddcfb90083306ddc37e8c6a78ee87eafe | ORPH
  aarch64    |     linux-headers-5.15.33      | NOK | http://autobuild.buildroot.net/results/b34f1722c0257dfb66e7fe17b639c73f8b8985ee | ORPH
    arm      |        liquid-dsp-1.4.0        | NOK | http://autobuild.buildroot.net/results/3b68b9810eb04772b634b55c44f39e7fa779586a |     
   armeb     |        lpc32xxcdl-2.11         | NOK | http://autobuild.buildroot.net/results/c9caa7cb15bb046766dd9eb86d0f2e5e54338711 | ORPH
   armeb     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/c0c8f862ad6e66141ab54f8e943c51cc34725611 |     
    i686     |         nodejs-14.18.3         | NOK | http://autobuild.buildroot.net/results/0ff5eed6c5aa1258ca645c0ed3afd2b5aded8264 |     
 microblaze  |         numactl-2.0.14         | NOK | http://autobuild.buildroot.net/results/e225cb83dae390d9dc543d4da85c52180efbd40a |     
   armeb     |           opus-1.3.1           | NOK | http://autobuild.buildroot.net/results/e49528bd8ad383c7c04c34ade566a8d73c5987a5 | ORPH
    arc      |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/a3b041357f04d024405f3996fe4682070176e6b6 |     
   sparc     |        pipewire-0.3.50         | NOK | http://autobuild.buildroot.net/results/82e184df96ae64e2f7302a904bc4eb23f47b8e13 |     
    arm      |        pipewire-0.3.50         | NOK | http://autobuild.buildroot.net/results/ae81515c6d3c3d323cc190fe40962bdd08154a83 |     
   sparc     |       pkcs11-helper-1.28       | NOK | http://autobuild.buildroot.net/results/9b0d3bf7d97696c7be6de1724daaba196626b865 | ORPH
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/eb42ddec87ad4c990828f143d6c722044841fabc |     
microblazeel |         python3-3.10.2         | NOK | http://autobuild.buildroot.net/results/8779b888e92c454f20827d46941a11f4362214e1 |     
  powerpc    |         python3-3.10.2         | NOK | http://autobuild.buildroot.net/results/c27fe795e079350dd1c9af45be417d41b55e57c3 |     
   x86_64    |         python3-3.10.2         | NOK | http://autobuild.buildroot.net/results/06232ab765aaebef2de7516fc7d1757851f4be95 |     
    mips     |         python3-3.10.4         | NOK | http://autobuild.buildroot.net/results/78b1dcc99a4f5a766ccf97820b7d592bd776acd5 |     
 powerpc64   |         python3-3.10.4         | NOK | http://autobuild.buildroot.net/results/72ba0f2263980c51e4de2aaf3d6825c0c0299184 |     
  riscv64    |           ruby-3.1.0           | NOK | http://autobuild.buildroot.net/results/a58f7e31da5dd6103be30b37ff32295c85795e2a |     
   s390x     |       s390-tools-2.20.0        | NOK | http://autobuild.buildroot.net/results/6fc7cd9e75692e52a7d2af93d81ccece0697d927 |     
   mips64    |          sudo-1.9.8p2          | NOK | http://autobuild.buildroot.net/results/4d31dd80e02b593031c4c68baf708b79a70677e4 | ORPH
 microblaze  |        tcf-agent-1.7.0         | NOK | http://autobuild.buildroot.net/results/7ede5c173a84997032afa843374fb4ddade5d873 |     
   armeb     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/b82d466f8c35813bd27be76e2b5cc8963cc232af | ORPH
  riscv64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/acee958e098e3c06d9d846e5586040171ef6074c | ORPH
    or1k     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/d5cfbd8299c190a5780110329c4da2a060ecdc01 | ORPH
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/1f5471c98f2b519ee2425b956be211a24959f8ef |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/24b903d54da1cc5cb1cd70fbed3c8afe2beec95e |     
   armeb     |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/97745beb32e03214e6910a4905295dfe57b0a880 |     
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/4ae2f376c8a8cc803646caedebfa77f7afc990e9 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/573ece404a4357a49276196c4423d03d0bf45570 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/1f882d070f8ac4752cfbf2c5c1dc99bf9c6e5456 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/d31a3584593307489d65cdd4cf062f14a430a597 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/4d9a38308d2582165a8000e3b0b85d33ff1d1f60 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/19926db7c4bf8d60ba3e81180742576b44538001 |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.net/results/e0044f52c4f96e7ad53c660939f5ded5cdd80fba |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/b118978ba155f5e540ffc8451699520468f2b85a |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/3b267352657f4593d797540f0b4a648241bd0d75 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/a906a2e54026264f26ad9a31cfd9b98167a03344 |     
    i586     |            unknown             | NOK | http://autobuild.buildroot.net/results/641d07e5b4a32b5ea11e5480689b44b4e7ebf7db |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/2c20aacf77f1522ca01c2a4bbca9505422eb29f7 |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/399d383222371dc037e1d690ff4639065d2cdbdc |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/9c7b4b277e4f3b40399409374a06c487252e3273 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/4437c87154efcd279cc1911e4edd371ef39de1ff |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/2afd18bd0ade96588e414290dc877899c87cf632 |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/487270afa687f7c8c8cde9ad3139690804e5cbf9 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/e3d49c339ca7cdf111401438ac1b24a466f5c875 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/576f4dc183a40c126c33a50629285cb20b043312 |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/0b4ff171cc53f5cce1ce68020cda4df582ca969c |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/b7b356068e1480a033b767c365fe4f635c993b9f |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/ae56d80ecef334bd1f0f528f283742c77d055ac5 |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/bf60019dba2d63f28b1c83bef58f10434b536c59 |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.net/results/01c7fb3e59b6bbbc5bbbb46c67562a2d1eef99a6 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/d37f456c7ec69f859e0637b238b6d7906ddc98e2 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/38b3a30d220f36136e125f73737c84db265a97fa |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/8195e9c6c633de257cc8aaab846b43b1081a9243 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/b440e94339860c78a264259f8ee6da50ff9a3bee |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/20d2b28cc675b6173118afbee7fe95bde6606160 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/9ba1150275f7ebef667effc292247a4b687e2075 |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/cc55d77c892397bca6f99a46e883a58b406b740a |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/fadf45449acd313049d960d9b16c8b216f3abe43 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/e8d9612a93b1e5c8f0dc200d85d8dc037f3729f3 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/18f15e66856163063c6254e088be987564c399b6 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/cc659c681cb53b9c0d870ea35282d1d0bfb267f8 |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/af8e50863c70cc219b0311a6e5c33359c2a47622 |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/4bb838bf22a660468e4f4cf68c14484b258729a1 |     
  aarch64    |           vlc-3.0.16           | NOK | http://autobuild.buildroot.net/results/4f4393312e016bbb121b474aae2df29479fc3fe2 |     
    arc      |           vlc-3.0.16           | NOK | http://autobuild.buildroot.net/results/ff7f2ad0a8749b4db998c19bf76fb48a845f8e15 |     
  mips64el   |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/b13d0672272885f9b231f46f420c71240410229e |     
    arm      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/ed2276c766cd82732f7b9a62f7abb9b7723250ef |     
   x86_64    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/da8d6db84c3c0aab9c79c7dfe8a0fca0d9758176 |     
  riscv32    |          xvisor-0.3.1          | NOK | http://autobuild.buildroot.net/results/bef15ad1c8afbcdcabb85f5ddac4436a52293f3b |     
    m68k     |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/a1c944b680dbff3eb52cdbbf9d6e55588dbbc083 |     
   sparc     |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/7ac32b4b0b3f285d6c8a32b1d8eda5e9bd10bbc3 |     
    sh4      |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/54b057df6bdc2bbb7bf44476cdccf356fedd16ce |     
microblazeel |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/23c4c2d79c30bca85ac40c3a04295cfaa1b02feb |     
   mipsel    |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/cc9f17fb8bf01b5024c59305af9477138b33c1f8 |     
   mips64    |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/c2a76cd84a08873f5b323fb2f8c06b2dc46d9a75 |     
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/0e64770d9048458c46beb410ef225227c96749b1 | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/8d3d22dcefeacc93dcfd54d31313b4cea2070425 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/c983f7259b1d22f41cd4b84b00f08366c7fc0a42 | ORPH


Classification of failures by reason for 2022.02.x
--------------------------------------------------

tvheadend-1295dd2be863f5beb... | 3 
                    bat-0.19.0 | 1 
                    dhcp-4.4.3 | 1 
                  exempi-2.6.1 | 1 
                       frr-8.1 | 1 
                       unknown | 1 
                 wavemon-0.9.4 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/842392bbffc06f4e96fedb39df5f881892e3777a |     
  riscv32    |           dhcp-4.4.3           | NOK | http://autobuild.buildroot.net/results/692db2ca2d65d0f95ead6fd907a86be2431f312c | ORPH
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/2cd9486db7f9ad7482c6cbfefdd3c92fe758780c |     
  mips64el   |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/0182f5efea0c1bc4d9cfcdd043c3a68b28721851 |     
   nios2     | tvheadend-1295dd2be863f5beb... | NOK | http://autobuild.buildroot.net/results/990492f340fd2eace8b867311673c2e33ad87dd2 |     
   nios2     | tvheadend-1295dd2be863f5beb... | NOK | http://autobuild.buildroot.net/results/99860af9d8fa2542107da05353e9e43535237484 |     
   nios2     | tvheadend-1295dd2be863f5beb... | NOK | http://autobuild.buildroot.net/results/b485841fecd32240f47f8c18ef3d63283b319a50 |     
    i586     |            unknown             | NOK | http://autobuild.buildroot.net/results/96b131f90efa8f6093b2290b78087b40de86d26c |     
powerpc64le  |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/33fa6a0af124a700e3a355b9584a2a1f8f3d797d |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
