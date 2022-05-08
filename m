Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58CABC433EF
	for <buildroot@archiver.kernel.org>; Sun,  8 May 2022 04:45:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3215408F0;
	Sun,  8 May 2022 04:45:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UUxLy9HS2QRx; Sun,  8 May 2022 04:45:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C4D3408F2;
	Sun,  8 May 2022 04:45:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0B0941BF325
 for <buildroot@lists.busybox.net>; Sun,  8 May 2022 04:45:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E2D8740629
 for <buildroot@lists.busybox.net>; Sun,  8 May 2022 04:45:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b4vxZypUttSG for <buildroot@lists.busybox.net>;
 Sun,  8 May 2022 04:45:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 15F2F40003
 for <buildroot@buildroot.org>; Sun,  8 May 2022 04:45:10 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4A2D9240009
 for <buildroot@buildroot.org>; Sun,  8 May 2022 04:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1651985107; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=zzGkxtuPra3v5FNlMl1r9p4eMrl3ZYxr0it8fAfougM=;
 b=OjLxoGqIOo01hTvRnz1rhslF40+Oran+nrsUUqTQcUwoQAKaDaQXTqejz0UwwOUJVPWrM5
 zsIoKWrIh9ryFSKh90G31L8OqAsyEHDY4pTjA/jeZUeyDA73TugF+bnRFjSh5iiIPAkruH
 su5Zlbo1TpoHP5VJn8nkzq2hTBX+myldxEjM2juzINci/shCQHiYHw1+hzUXHRLtAHEOvq
 /qNoydtxwxhWW2rWKVjL7NbP8zej9Ivc4MXrMz4IpjboQIRTTkQahxWbh5WEcNmbiZ6Bp0
 8LPp8bsLkMhAT/e4QXLXgmY06eID0ZhEqPGWIX9xfhPXetVbmK0Q9IluZ+mseQ==
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sun, 08 May 2022 04:45:07 -0000
Message-Id: <20220508044513.E2D8740629@smtp2.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-05-07
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

Autobuild statistics for 2022-05-07
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  | 31  |  4  |  0  | 35  |
    master   | 165 | 251 |  0  | 416 |

Classification of failures by reason for master
-----------------------------------------------

           optee-client-3.17.0 | 22
         host-gcc-final-10.3.0 | 20
                    git-2.31.2 | 13
             libopenssl-1.1.1o | 10
                 uclibc-1.0.40 | 10
                pciutils-3.8.0 | 8 
               protobuf-3.20.1 | 8 
                host-go-1.18.1 | 7 
               pipewire-0.3.50 | 7 
                       unknown | 6 
                 zlib-ng-2.0.6 | 6 
                bitcoin-0.21.2 | 5 
glibc-2.34-109-gd64b08d5ba7... | 5 
          host-gcc-final-9.4.0 | 5 
         host-gcc-final-11.3.0 | 4 
                libressl-3.5.2 | 4 
                 linux-5.15.37 | 4 
                     refpolicy | 4 
docker-proxy-339b972b464ee3... | 3 
                libzlib-1.2.12 | 3 
            qpid-proton-0.35.0 | 3 
toolchain-external-bootlin-... | 3 
                  bcusdk-0.0.5 | 2 
              containerd-1.6.2 | 2 
                  cpulimit-0.2 | 2 
                  exempi-2.6.1 | 2 
                gnu-efi-3.0.10 | 2 
       host-gcc-initial-10.3.0 | 2 
            igh-ethercat-1.5.2 | 2 
           libwebsockets-4.3.1 | 2 
                numactl-2.0.14 | 2 
                   perl-5.34.1 | 2 
                 wavemon-0.9.4 | 2 
                       xenomai | 2 
                  acpid-2.0.33 | 1 
               aircrack-ng-1.6 | 1 
android-tools-4.2.2+git2013... | 1 
               apcupsd-3.14.14 | 1 
                apparmor-3.0.4 | 1 
                  assimp-5.2.1 | 1 
                   atftp-0.7.5 | 1 
                     aufs-util | 1 
                     bc-1.07.1 | 1 
            bridge-utils-1.7.1 | 1 
                    brltty-6.4 | 1 
                busybox-1.35.0 | 1 
                 coreutils-9.1 | 1 
                 dash-0.5.11.5 | 1 
                    dhcp-4.4.3 | 1 
              e2fsprogs-1.46.5 | 1 
            ecryptfs-utils-111 | 1 
                   eigen-3.4.0 | 1 
                 fdk-aac-2.0.2 | 1 
                     frr-8.2.2 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/cramfs/cramfs.mk:46: /nv... | 1 
fs/cramfs/cramfs.mk:46: /nv... | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
              fstrcmp-0.7.D001 | 1 
                  gensio-2.2.9 | 1 
            ghostscript-9.55.0 | 1 
gummiboot-2bcd919c681c952eb... | 1 
       host-gcc-initial-11.3.0 | 1 
              host-libcap-2.64 | 1 
host-pahole-73383b3a39afe86... | 1 
              jpeg-turbo-2.1.3 | 1 
     kvm-unit-tests-2022-03-08 | 1 
kvmtool-f77d646ba01d04be5aa... | 1 
               libcap-ng-0.8.3 | 1 
              libgcrypt-1.10.1 | 1 
               libglib2-2.70.4 | 1 
                libglvnd-1.3.2 | 1 
libilbc-829b08c7902ceb87a26... | 1 
                libmdbx-0.11.7 | 1 
                   libnss-3.78 | 1 
                 libp11-0.4.11 | 1 
              libuhttpd-3.14.1 | 1 
               libvorbis-1.3.7 | 1 
            linux-fusion-9.0.3 | 1 
                   linux-tools | 1 
               mariadb-10.3.34 | 1 
                    musl-1.2.2 | 1 
                  mxs-bootlets | 1 
                  netsurf-3.10 | 1 
            ocf-linux-20120127 | 1 
           python-numpy-1.21.2 | 1 
            python-ujson-5.2.0 | 1 
rtl8189fs-73f826f0fa74b2fc1... | 1 
                    ruby-3.1.0 | 1 
       shadowsocks-libev-3.3.5 | 1 
                  sngrep-1.4.7 | 1 
               tcf-agent-1.7.0 | 1 
    toolchain-external-bootlin | 1 
                   uacme-1.7.1 | 1 
                  uhd-3.15.0.0 | 1 
ulog-0389d243352255f6182326... | 1 
                  zchunk-1.2.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |          acpid-2.0.33          | NOK | http://autobuild.buildroot.net/results/ee455635f0c9fbb3ad75f69fb36e173e3fdcf9c0 | ORPH
 aarch64_be  |        aircrack-ng-1.6         | NOK | http://autobuild.buildroot.net/results/1adf42942968f358aedffa92151335facfbb2797 |     
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/edf4957fa7d243e39b7b2d0d5ae2a198278d68aa |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/8e4dd80447027db1a3b94706b1fc4179a2a7de99 |     
   x86_64    |         apparmor-3.0.4         | NOK | http://autobuild.buildroot.net/results/ce8037b25d4ef959ddf1995710a006f9d150b4d2 |     
   mipsel    |          assimp-5.2.1          | NOK | http://autobuild.buildroot.net/results/085446996f46c73418c52d68b158ca8ea2a916a8 |     
    m68k     |          atftp-0.7.5           | NOK | http://autobuild.buildroot.net/results/de71364fa6edbcae35cb3dbcc91e0cc34ab89a99 | ORPH
    arm      |           aufs-util            | NOK | http://autobuild.buildroot.net/results/3ce41d64301fc96dde13cd916053f3b76f88f056 |     
  riscv64    |           bc-1.07.1            | NOK | http://autobuild.buildroot.net/results/0b9ea113a8cb53f46ef95c6187dc14f328dc1b4f |     
   mipsel    |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/0d12a9c80408066b1fdbafa1c3b7298b26eaf9d9 |     
   mips64    |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/3a1d9ac76b43a11d4b873bf18336345fef8652df |     
  sparc64    |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/f2bedeb15bc907c0aace3e856d8d2356c5d55a8a |     
powerpc64le  |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/2d7e8ef7e875d8218feddf6d7dfb4c0799bab322 |     
  aarch64    |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/0ad89215fe0ac3110466c75c7609d4b15f2e9ae2 |     
   sh4aeb    |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/4fa5216707e8bcbfe9cc0209637b49f75efa7ec2 |     
   arceb     |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/eb40f20bb955cfdf8e7088f6b34a343d62f1c5fc |     
    m68k     |       bridge-utils-1.7.1       | NOK | http://autobuild.buildroot.net/results/0415446a9b4843f49ac732052fbd7f9a62e00959 |     
    mips     |           brltty-6.4           | NOK | http://autobuild.buildroot.net/results/5d327054d773ebf43fff6aab3fd5e69cfe3897da |     
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/7a7ad335c4e5620d6b8a7e556c806d701bccec7f | ORPH
powerpc64le  |        containerd-1.6.2        | NOK | http://autobuild.buildroot.net/results/957a28368d1878fe172e2dae6f2dccc3c018191e |     
  aarch64    |        containerd-1.6.2        | NOK | http://autobuild.buildroot.net/results/8abf45f3038ed5bab804d73df4b548156878f8dd |     
    sh4      |         coreutils-9.1          | NOK | http://autobuild.buildroot.net/results/1021c4135572a605bcb6d250dac6613c41a442a6 | ORPH
    or1k     |          cpulimit-0.2          | NOK | http://autobuild.buildroot.net/results/3378edfad0792c26875568f682056d9867291dd2 |     
    or1k     |          cpulimit-0.2          | NOK | http://autobuild.buildroot.net/results/9d5b75f81ee9ca5af6015ed8eaa3c39b5a6b13ac |     
   s390x     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/af8a97b67cc3de5da49ce8cc022bba96511122ba | ORPH
    m68k     |           dhcp-4.4.3           | NOK | http://autobuild.buildroot.net/results/064b9dca01aba2780ea2cae102fd8c0c5fda42a8 | ORPH
   x86_64    | docker-proxy-339b972b464ee3... | NOK | http://autobuild.buildroot.net/results/ab056191b7fc4fdf2c7c08427383ade0492ef548 |     
   x86_64    | docker-proxy-339b972b464ee3... | NOK | http://autobuild.buildroot.net/results/4362ecba076e11ff95b785a45c2b393af8f4c023 |     
powerpc64le  | docker-proxy-339b972b464ee3... | NOK | http://autobuild.buildroot.net/results/56af8be5096be5dd28b2ae8f5b3423d36cce5b7a |     
    or1k     |        e2fsprogs-1.46.5        | NOK | http://autobuild.buildroot.net/results/76fde5daeceb0c958fa3918891c1448bdbf5757f | ORPH
    i586     |       ecryptfs-utils-111       | NOK | http://autobuild.buildroot.net/results/f0bd6e3a48cb781fa7cee1139fda9d98c659921a |     
    or1k     |          eigen-3.4.0           | NOK | http://autobuild.buildroot.net/results/b576b0c386f97b74955b1e79a16f27dbc5fe601e |     
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/25cae20709a244b72ba3a54b1e1a1e64028f9df8 |     
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/ac0cbad57478f9596e128d60fcfc5f18b18ddfad |     
  mips64el   |         fdk-aac-2.0.2          | NOK | http://autobuild.buildroot.net/results/cc34c54d6969b0987e4758ea89d0ca40f1b4f79c |     
  mips64el   |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/ba0e796d9433b4fdf21850fe25239d540a52e43c |     
powerpc64le  | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/076c631f090ab6489e6c159cf68ad4c73859b924 |     
 microblaze  | fs/cramfs/cramfs.mk:46: /nv... | NOK | http://autobuild.buildroot.net/results/eaff76e98b5ab14a713801c4ba4ed41938e6cd9c |     
microblazeel | fs/cramfs/cramfs.mk:46: /nv... | NOK | http://autobuild.buildroot.net/results/10db70f079b4354da22429c881f6fcdf6a6a6c62 |     
microblazeel | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/fdd61a5ab260f26dca64a7819fc94c0f0fbfdc6c |     
    arc      | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/fca920d28e4e793100b8f51cabfc55c64807d376 |     
   mipsel    | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/628f90f7fa60eae3bf52ab901e7833e7502a36fd |     
powerpc64le  | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/b224bd571188eb09b251fa362d11f049831e4148 |     
microblazeel | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/c4ade79966124452d35bbb2b2b0cfc057b6ed5fa |     
   armeb     |        fstrcmp-0.7.D001        | NOK | http://autobuild.buildroot.net/results/e0fd4cc543549c936851b040584d3d93e13ddd6f |     
   sparc     |          gensio-2.2.9          | NOK | http://autobuild.buildroot.net/results/f3a3a1fc8ffe5f3f53dd3693d55e33622edd4a58 |     
    mips     |       ghostscript-9.55.0       | NOK | http://autobuild.buildroot.net/results/f6d8913fb8528f87b09ab97d4988e8379d832e76 |     
    or1k     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/24f8e9255b6c79d5c489b24633924b763f62806d |     
   x86_64    |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/4c51d2143cae0bb79cba94df5eee1e6e2a3c5583 |     
 aarch64_be  |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/d3655650ad7f2a38a73af5e49b216cb1cfb9a853 |     
    arm      |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/2800a752bb0e69bc966b05fcf64da4b37864b76d |     
   x86_64    |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/c517eea9bd30c3bc65fa72a696252e4fa957c345 |     
 aarch64_be  |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/becd2c4f169e183d7c5a782345cb1cbc5d0e6f8d |     
  aarch64    |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/5f77a87ec8af08d56459f231b5894ba4690676ed |     
    m68k     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/7720be570c0cee5cf8bdbe0a7342c4c1560f9235 |     
    mips     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/2e93189d3abdd581a2a354005e6134b7f8220fe3 |     
  aarch64    |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/467439e702226ff4a61a8632b45602208aad9378 |     
    arc      |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/ff616bbbda3938a5e84ac39c7503f03e093b5824 |     
   armeb     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/98287321de11e20a6790d4d92b077e6739f8dbcd |     
 microblaze  |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/08059746f8641e5719bf14e7f63e1e3e2f31a048 |     
  powerpc    | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/b7434d37c39544e41a569b21a64c854defccf354 |     
powerpc64le  | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/a0557172757d3bba2b5fc6244c7b9b17ef6be0db |     
powerpc64le  | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/932664fcbb28b0cabd111fbbbef0738d2753cf42 |     
powerpc64le  | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/4f2efb3f709dd15d4c896976a3a3f2dd61a1c471 |     
powerpc64le  | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/9e001f4316f22340c19fb9a10f152feaa5312f11 |     
  mips64el   |         gnu-efi-3.0.10         | NOK | http://autobuild.buildroot.net/results/0281c6780b3daa173ec3477acc28adbfddcf5c73 |     
  mips64el   |         gnu-efi-3.0.10         | NOK | http://autobuild.buildroot.net/results/047a295b65af71b8d54aaf31ae9d7bbd728c15cd |     
   x86_64    | gummiboot-2bcd919c681c952eb... | NOK | http://autobuild.buildroot.net/results/6848a03a7da1111d4aefefdb7fbcd3212c2fed28 |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/186c81c6cd33e4d7bb1ba19541e1b819410f4351 |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/02bf486904540a613e1d3229e810f7dbfb5e4486 |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/41f4d678e310446a61d8779b232b88216e0207d2 |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/4e7810e181e8fe45c053f372c5c4eaba970b3fbd |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/df7dc4e75058291f10a978bcb2188d50abd2ec1d |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/f6a33f6c8a4d4a716b23a4090662c63c0a1a8941 |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/91a500f492e9549e976505c31da0f56070b5f70f |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/ca8b48a3e9a1e81bd1042ba175175f57932ecfb2 |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/ef5ab3da9278d7bae81e72c12756122262614105 |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/0d8ba8eb6d7d87617ab1816397ec357532d1f20a |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/0304f0f61ae6378db674061b93cb1e2b07bb30b7 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/b3b1b20f56af4dc8bfa8df81aee1e736a5efec77 |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/145f931c2d6ab949d6caadd4d63678e7a3b9a3c6 |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/c759643bfef1cdf006e636ea94e290ffe9105282 |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/3485fe453a26745c5eda21b60ba8bd5a42b2fd3c |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/76b012ce56578734a4a7b9457f0385f2072e0628 |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/49efd5b71da47c40209fd20164f81f51de537297 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/19150b73a09ad66f09534a4b1bd779d55b162c64 |     
    i586     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/1bbde135f911bbbe25301dcd1faaf383df4e2042 |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/ebce6bacbad93d197b5d7882e10da6718d01cf2a |     
 powerpc64   |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/ea1def5edd5df0be77017a3657bbd4bdc5afbca8 |     
   s390x     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/ac13db13088c88a0242a489109c97447bd2dede6 |     
   s390x     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/ba4526d4d28681f8feb9cdb86dad028fc89c54c0 |     
  riscv32    |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/f23014603a215640ca15d61674d451223ceb812d |     
   nios2     |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/64db89cae2da1631b61ac04de6ed05d4c19b52d9 |     
  riscv32    |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/5975c741a1205c767bbcc94ec719d63b20fdb1c6 |     
   nios2     |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/198d6ffaefe6c2a7d6d40e3b3614b16bd54b93db |     
   nios2     |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/442486b8e629554575d6caa015144abda5b4fbde |     
  powerpc    |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/74d265a9ca8595bb1d52382764f659dba6480f45 |     
    arm      |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/861ae9c6183ea623b635e246bba3735b5f45a869 |     
    arc      |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/20cdf8995df991a88b3fbe5819428d323aa2ded4 |     
    arm      |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/ffb673c601df5e6d66695090bb6b00f8dcfe91b3 |     
    i586     |         host-go-1.18.1         | NOK | http://autobuild.buildroot.net/results/59d17f59022a1c4c78a8cea0a3d077615af087d5 |     
  aarch64    |         host-go-1.18.1         | NOK | http://autobuild.buildroot.net/results/977c924c03c873180b6b2e4fb2c6e060c7b32776 |     
  mips64el   |         host-go-1.18.1         | NOK | http://autobuild.buildroot.net/results/ad5335e69908da773255cdfc9d264e94324ad1d6 |     
  mips64el   |         host-go-1.18.1         | NOK | http://autobuild.buildroot.net/results/836783a53a9e0e630a1de8b183ef4bf92c337c41 |     
  mips64el   |         host-go-1.18.1         | NOK | http://autobuild.buildroot.net/results/550acceccafc66afe5a30580cfe9a0d643a68196 |     
  aarch64    |         host-go-1.18.1         | NOK | http://autobuild.buildroot.net/results/e9736f6e626270b8797d0902acc66eea132b2e69 |     
    i686     |         host-go-1.18.1         | NOK | http://autobuild.buildroot.net/results/83d879b6281867a13ff3237c655233f439abd07a |     
  riscv64    |        host-libcap-2.64        | NOK | http://autobuild.buildroot.net/results/ce2bf8c52deb60d716339285b027a2b80afb12ca |     
    arm      | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/5f35a1854eeccf73ae15156b908d35e672e1d2a5 |     
  sparc64    |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/23e3a97a0b7ba48f00e50cf8cec04341286b81a8 |     
   xtensa    |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/5a2b79c441a46c56b3970cf061d30f2f2918513b |     
  riscv64    |        jpeg-turbo-2.1.3        | NOK | http://autobuild.buildroot.net/results/1fe4313df486f239058ac12b687bad3427dd397b |     
 aarch64_be  |   kvm-unit-tests-2022-03-08    | NOK | http://autobuild.buildroot.net/results/6e4c7e60078dd863ac4f4b7f32501aec2e67b643 |     
    i686     | kvmtool-f77d646ba01d04be5aa... | NOK | http://autobuild.buildroot.net/results/601eedcd6a952093edbcfe730db6ec432e346deb |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/5331c0a3a79bfd40329b6bec05c4e68fb0225378 |     
   armeb     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/4d295a8caba8fe34531f82b8e61d14d777483438 | ORPH
   arceb     |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/43ecb3e5e65f67fd51c565c79d722ebbacf4dd4c |     
   x86_64    |         libglvnd-1.3.2         | NOK | http://autobuild.buildroot.net/results/42b24791fb890fd428bb50c6a11036cab0cf5229 | ORPH
    sh4a     | libilbc-829b08c7902ceb87a26... | NOK | http://autobuild.buildroot.net/results/e8944976c3e4e58177bb0b2184aa7251197c385c |     
 microblaze  |         libmdbx-0.11.7         | NOK | http://autobuild.buildroot.net/results/2b67535bb12343271337e4f8b575d45278c3f1ef |     
 powerpc64   |          libnss-3.78           | NOK | http://autobuild.buildroot.net/results/01361fc6aeb47f93203807aaf42f3489aa5623b7 |     
microblazeel |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/f28f27aa201001378b3c7f73d0cec84fc0eed70c |     
    arc      |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/efbc2f65a2c7f6e0b3d13ad69728b58cb21a7ae4 |     
    arc      |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/71b576b8bde1bf1d2decfbfdb5c0e546c692b1d1 |     
microblazeel |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/20b0e1b5c2843d58aa83181ebaec3005411a6d4a |     
   sparc     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/8093086741147bcc07c430d2f5eb043993fac0ef |     
    or1k     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/eff870f363d32db5740afcf412423812a2112062 |     
   arceb     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/f73e8df410918956330bfa07702b1ccb603d853c |     
 aarch64_be  |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/09440bf50114005fe9ba0548bd982da8ad65b2fc |     
   arceb     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/0a266619f1e90fdcc04290d1e235777b56a0169a |     
    or1k     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/bcd6863fcd7635a091b151782e17ba1bd8721ad6 |     
    sh4      |         libp11-0.4.11          | NOK | http://autobuild.buildroot.net/results/4635c9c965099fbe371c10513010aaa35d88f79b | ORPH
    mips     |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/5116ad891ea2ec03176203630e80a1937591903b | ORPH
 aarch64_be  |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/1efd1efe3b5e9f5ec4ed64af22d8b33551caa76e | ORPH
 aarch64_be  |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/de75e6b5521b5325cd3407610ca31bd6295f02a2 | ORPH
   xtensa    |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/32eaf23bfea80deabdffadb82d6c84d4497451af | ORPH
  mips64el   |        libuhttpd-3.14.1        | NOK | http://autobuild.buildroot.net/results/bbf23e1f98ab4c7a712dace2b5842ce7406c2708 |     
  powerpc    |        libvorbis-1.3.7         | NOK | http://autobuild.buildroot.net/results/02bdecdb32ba3b664b2e6b0ce0b98bdd68c32f8f |     
    arm      |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/a517607d39ae4e212a72dc5d2e9c14fca90eb7f9 |     
   xtensa    |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/5f91392dc5ff9aaca9b85ca789351c79dc0088bf |     
    m68k     |         libzlib-1.2.12         | NOK | http://autobuild.buildroot.net/results/aae81e9c677d9a932eaddbfefd5255a9b61884d3 | ORPH
    m68k     |         libzlib-1.2.12         | NOK | http://autobuild.buildroot.net/results/544ee1bb47649e20708eaad287543ff03336e004 | ORPH
    m68k     |         libzlib-1.2.12         | NOK | http://autobuild.buildroot.net/results/a875f837bac8483081fea18894114a458e6d85a6 | ORPH
   nios2     |         linux-5.15.37          | NOK | http://autobuild.buildroot.net/results/22e4b6fd608cc18f0c0933669ea3f2ae164c1aec | ORPH
    mips     |         linux-5.15.37          | NOK | http://autobuild.buildroot.net/results/e410ab76c1937089f4b1341b7aa061fbe85f5f3c | ORPH
   mipsel    |         linux-5.15.37          | NOK | http://autobuild.buildroot.net/results/4ec8ba81f3fb18233ba3be0ca05bd49a78cbf325 | ORPH
  aarch64    |         linux-5.15.37          | NOK | http://autobuild.buildroot.net/results/30e22368c39328678aa3a10724dc93000ed7ef4b | ORPH
   s390x     |       linux-fusion-9.0.3       | NOK | http://autobuild.buildroot.net/results/bc0b4f6defe5da831aa93f9876a3c4ce6eea4285 | ORPH
  powerpc    |          linux-tools           | NOK | http://autobuild.buildroot.net/results/6aa2556c026738713fc51d8d9fdc49a9cc25204c | ORPH
   sparc     |        mariadb-10.3.34         | NOK | http://autobuild.buildroot.net/results/a5ccdcb8e141f311944e87478a7f1da36216a75d | ORPH
  powerpc    |           musl-1.2.2           | NOK | http://autobuild.buildroot.net/results/5ef065a9b301cb846e15a467f581148753e04fae |     
    arm      |          mxs-bootlets          | NOK | http://autobuild.buildroot.net/results/0af5e413451ba2ccc7fce713dbdadc1d3b535e16 |     
  sparc64    |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/ce60161b4a1136e5745a6a2c3ec037099811ab6c |     
    or1k     |         numactl-2.0.14         | NOK | http://autobuild.buildroot.net/results/de8add53cd3093b881cc0c2fb20fb25870a2db4e |     
microblazeel |         numactl-2.0.14         | NOK | http://autobuild.buildroot.net/results/365e2a74f0d18efdb0e81d862710adcce8dd4bb7 |     
   sparc     |       ocf-linux-20120127       | NOK | http://autobuild.buildroot.net/results/1279c385f19e377bd1a26ab1963e57a2a98cc1c3 | ORPH
   x86_64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/076923dfcfdf235b908da1918775275a5e982884 |     
   mipsel    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/2bc6f8736141b1148cd2793909f760ea898bb8b2 |     
    arm      |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/9611e3cf5d1672050461f472f97dd5a04a88b043 |     
    mips     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/283476cecc12f4e8673cbdbabbdac8c8eb961586 |     
 powerpc64   |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/28ef5c3a0bafe3c09e5f8b9070c8cdf2385c5202 |     
    arm      |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/20aef865d40953bef3f6bdae7313fb00d824f1fb |     
    m68k     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/95b80e676787c5666f8e2b41e255da8dffbe980c |     
 powerpc64   |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/56587cf5ae71d952fa51f25d99db9ee8f1a4d0a8 |     
    or1k     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/737fffe061e1deca0d0e6ed68795db058bf912b8 |     
    arm      |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/1489d72863c57d7e5713e89d52879ec04eb41a05 |     
   xtensa    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/1bde6b8c90ed7249c5fa32c7173f6d1b6ded2948 |     
   s390x     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/a07045019cba2b5abbb9a48b964fe0ab384e1e61 |     
  sparc64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/9c1f59de4e8a3097b7edaec244ff54cdbda90818 |     
  sparc64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/7f57add831f59c471003f88ad0141abdeaac7e69 |     
   armeb     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/ed80ab264128a2dca7f05cc1474f9b77c82a1534 |     
   mipsel    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/8f24976b4b6ccaa1fb4be3ef6434ae3562fc882e |     
  riscv64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/b5a84175a8cdda8d74a7b21a6e7d8e9aeac8f53f |     
   sparc     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/3bb72d3c6f87705f1e1f3e578eb722d98b649339 |     
microblazeel |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/ffed6e1c4bf79589e7a092b229684838375670c9 |     
   mipsel    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/fdc9bdd1140f6cff9b0464dbc63b194a5a859f88 |     
  sparc64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/2cfb3c8fd1438548ca5ea3aa99d9c0698e25fc42 |     
 microblaze  |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/6f0812a19db302392876f5c47dd279ec5e8f0683 |     
  powerpc    |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/6e6dc720a3d3d6e2219ee902491ec15a5fe5b1c8 | ORPH
    i686     |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/a44ea285f33249002e3a80986679b08c111eea8b | ORPH
    i686     |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/421a1f6f7580740fce091565f1f076e9c0550c98 | ORPH
   mips64    |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/ca309963d37e0de544b0810c28a694edffc37014 | ORPH
  mips64el   |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/448108a8f642b45ebbdeff326bdced47d1f600aa | ORPH
    arm      |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/2191e14accef9a74f63de66d6aae23a217c34c37 | ORPH
    arm      |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/3ce05a60d348939871b3a6048070317b8a895597 | ORPH
    arm      |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/599e5b17cb5135c270f768e9267e2cfb2b4e27a6 | ORPH
    mips     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/77b975464167e3630b4b3d6ac663442ae6b708c7 |     
   x86_64    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/82d314e58f2f0d5d0b7a47d716cf7ef7864ba1e9 |     
   mipsel    |        pipewire-0.3.50         | NOK | http://autobuild.buildroot.net/results/d973e0fc3c5dce200e7f37e16599b60426db8d17 |     
microblazeel |        pipewire-0.3.50         | NOK | http://autobuild.buildroot.net/results/2ae19c634380d788141a3306a238bbe42390de8a |     
    arm      |        pipewire-0.3.50         | NOK | http://autobuild.buildroot.net/results/2412f6d9f22d1257ce18727358ca39655bf4ab2d |     
  mips64el   |        pipewire-0.3.50         | NOK | http://autobuild.buildroot.net/results/64fa08a55300bdc5351f3edf2afcf70c05002d81 |     
   mipsel    |        pipewire-0.3.50         | NOK | http://autobuild.buildroot.net/results/a1d49120ed6d87a136c66c858dd28035c597bbdf |     
 microblaze  |        pipewire-0.3.50         | NOK | http://autobuild.buildroot.net/results/7eacb7a09a63dfcb1dcf730c8b31a6ade2fafee1 |     
microblazeel |        pipewire-0.3.50         | NOK | http://autobuild.buildroot.net/results/9103e6465fcc527d19bb370d154c80fad94575cf |     
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/174e65482cfcdd3ed296edd5007e5d47d5899309 |     
    or1k     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/49a5865945c635198170cf5d39be9fe141de6998 |     
    m68k     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/d39b8f035c6c81dccece3d7c9f25975e44e52a4b |     
microblazeel |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/8278114640d2ae74132acccaaeb311b0a332867b |     
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/b20db83b5d98251470c77f29b78e890d99c699b9 |     
    or1k     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/0bd8100ed8830d8a04b029872e085bc8bda3b1bc |     
    or1k     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/8fbaff59116a3f1c12e970657d517caf5b9fe00c |     
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/c43642ba02b9afda29f2f22a1570aed4035162d5 |     
    arm      |      python-numpy-1.21.2       | NOK | http://autobuild.buildroot.net/results/8e5ea809c0dd85e5f76e5b34752fd955469a774a |     
    arc      |       python-ujson-5.2.0       | NOK | http://autobuild.buildroot.net/results/01bb1d0ef48ced0a67bebbf633908126d526d6a3 |     
 aarch64_be  |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/8c2a572b9d4a14673e6d7d7ec991badaf80ff77f |     
  riscv32    |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/32446a1895526ff6e20e702448f2f6b09c4efcb2 |     
microblazeel |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/50e5153fc6cfe634d4c1eac602a6f4522b2605a5 |     
   s390x     |           refpolicy            | NOK | http://autobuild.buildroot.net/results/b4e926cca8c846bf02ff9cb1c2c7c56ba1af0f9c |     
  sparc64    |           refpolicy            | NOK | http://autobuild.buildroot.net/results/ed07f5821299281f5ffce03dd8d8c9afba424eec |     
powerpc64le  |           refpolicy            | NOK | http://autobuild.buildroot.net/results/c67e36eb0eac75faed1dddaba1d6790243ee79b5 |     
 powerpc64   |           refpolicy            | NOK | http://autobuild.buildroot.net/results/e837ef72e96f3d4d47c2245f9b92e73c337701df |     
   x86_64    | rtl8189fs-73f826f0fa74b2fc1... | NOK | http://autobuild.buildroot.net/results/ed6e29e44333ccae2728ca3321ff876c3056eada |     
  powerpc    |           ruby-3.1.0           | NOK | http://autobuild.buildroot.net/results/b8eda7891d49217f3356527fca04a8a94fdc0fe8 |     
    sh4a     |    shadowsocks-libev-3.3.5     | NOK | http://autobuild.buildroot.net/results/0f0a38dd320d4188f8bf20c466dcd437ca845c27 |     
   arceb     |          sngrep-1.4.7          | NOK | http://autobuild.buildroot.net/results/20e59f0478c3e4deceb5fd97be8ed6cebee587e8 | ORPH
microblazeel |        tcf-agent-1.7.0         | NOK | http://autobuild.buildroot.net/results/b12fc20fb3a5eb85f776cd618bfea06e176e3d6e |     
  sparc64    |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/5e1e1581b0d990456608e497acc4d2aa6b9e7a03 |     
  riscv64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/855dd26e4318216014457c6b7e7a83c67fa593e1 | ORPH
  riscv64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/91acb05ea3d84ce59df4e402c258019b2400c133 | ORPH
   armeb     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/07e5722590f26a3d0949d633e6f71d985daa3dd0 | ORPH
  powerpc    |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/2c7f64d4479067cea07a8385d3fb8a015780e5c9 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/d38bef16554e882ccf612ac968f332ea820c9081 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/1a73525619f54eb4a511dc880079c60f18269764 |     
    arc      |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/ab1a0c10093a71baa428b51e6c3b61b756348436 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/8cd2b0e0146620d7c381e4db5910e80c57752a5c |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/fb109f5d22afe0078ea24153bace7f83d6d30eff |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/a0ad7995520bc8796f7f015fb411bdbcc7f5e774 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/d75be28562619e202aa91b174968f2f713e98f62 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/c12a0be0d220692ea0c7ed498ddf8bca9b4bf84e |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/3080b1b7eca512c85731e921718d28896d71b773 |     
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/493b696860af5e2a9242ce166f0d552d6eb77436 |     
 aarch64_be  |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/b1f17f42ddd40a3b5ba012a61e7e98d2062813a9 |     
 aarch64_be  | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/bd94cc114aae335446cbde5e145ba88eb4bf591e |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/6ae1adcede3a33ca44a70eed03e15b278356e34b |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/bf522092a8663eb986f68cb06597b5b6cf1e2434 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/192913a6b47507138849fd6888be8bc86068a9e9 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/ae4f68c5d51c16dfc0c8e31f6d18f8413c0c64d9 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/b393d540e21a96ddcfd18407fcb336bd23ffdc46 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/208204e59bc2eee86c2bbd669bcde5176bb08ada |     
   nios2     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/111a6c77602fef8ab637a55f0e7ca23f8653c2f1 |     
  riscv64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/35aac493ae32b6660325062b4cdd686a417519ec |     
  mips64el   |            xenomai             | NOK | http://autobuild.buildroot.net/results/5c40dfd03a3f8ad8b09f9ac4250b1974dde55e79 |     
    i686     |            xenomai             | NOK | http://autobuild.buildroot.net/results/2aa323886fac29719e508f32ae9f70dd6773020b |     
  riscv64    |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/b946673a2a014dcbf41c250573f36fc0c1ce15cd |     
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/5b88df91f886a057fbe8dfc7911495b0b389b8e8 | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/a6e560a5fa69608bc678accf588fb189448ad476 | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/a668f65d0a14449ff675bb85b365b332b949ae34 | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/edb7f8e181b91a1b6f0d660a964c8d95b76fe2da | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/8a90519e60a3a8e5b9c09294b27fbaf2ac4e16b5 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/079ba41b701a003ac70ee3c66917da0c4dec2786 | ORPH


Classification of failures by reason for 2022.02.x
--------------------------------------------------

                host-go-1.17.8 | 1 
                lua-cffi-0.2.1 | 1 
                tinifier-3.4.0 | 1 
                  xvisor-0.3.1 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |         host-go-1.17.8         | NOK | http://autobuild.buildroot.net/results/d6a5ca22009562330423f30098410c985bcb91ba |     
    arm      |         lua-cffi-0.2.1         | NOK | http://autobuild.buildroot.net/results/ef7ff3672d88701318ee847ae75014e224b03208 |     
    arm      |         tinifier-3.4.0         | NOK | http://autobuild.buildroot.net/results/727f4ced73b1498952bf1e3abf0e836f9afd6dab |     
  riscv32    |          xvisor-0.3.1          | NOK | http://autobuild.buildroot.net/results/b6295b0b952ca7ff76531b95bf459132c0026a81 |     



-- 
http://autobuild.buildroot.net

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

