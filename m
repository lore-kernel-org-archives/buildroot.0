Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6021C433EF
	for <buildroot@archiver.kernel.org>; Sat, 30 Apr 2022 04:39:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F4B841D42;
	Sat, 30 Apr 2022 04:39:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D9XPJIcpRvnU; Sat, 30 Apr 2022 04:39:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DED8541D43;
	Sat, 30 Apr 2022 04:39:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 622EE1BF287
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 04:39:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 44CDD4016B
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 04:39:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1uU6IloZBb2v for <buildroot@lists.busybox.net>;
 Sat, 30 Apr 2022 04:39:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 34D76400CC
 for <buildroot@buildroot.org>; Sat, 30 Apr 2022 04:39:24 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id DD86940010
 for <buildroot@buildroot.org>; Sat, 30 Apr 2022 04:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1651293563; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=P5JCmYguEOJdNz1BZOgOcJEdY6BUMw6qKTQCDZOhGsU=;
 b=J2ZeMAQYAR+WYNt3TxvL/c9UHMNDMW5pgGlI01AikAfHZQNaKXYbC1xv52REIt1tESJCMw
 5suoYnSdFsDR3BlIDP3oZ771TDhETeiXw6RF6ByRe/OJD6oMGbQLhYWNOsWJvQ1KSIIQO8
 jxObsl5+ePR5HHtuCeP3LuxHeeRYxXrNrbjLP05L6Z28Cz+r5kTK42KRjEspKykixHSKWS
 nhBH1s8PrkP20099d+5JeJCTlLwLnKozaKE6zFu3a2gSYe6ZJGkuaqaX8kvkcMCs8i7lt3
 9x0hXJFfd+6ghvmQurkew1TmyQWHKwCKE/FNx8HufSctdQpPBiBH2+sZMvonSQ==
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sat, 30 Apr 2022 04:39:22 -0000
Message-Id: <20220430043928.44CDD4016B@smtp2.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-04-29
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

Autobuild statistics for 2022-04-29
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  | 16  |  4  |  0  | 20  |
    master   | 142 | 259 |  0  | 401 |

Classification of failures by reason for master
-----------------------------------------------

           optee-client-3.17.0 | 20
         host-gcc-final-10.3.0 | 13
                    git-2.31.2 | 12
    python-cryptography-37.0.1 | 11
               protobuf-3.20.1 | 7 
                 zlib-ng-2.0.6 | 7 
glibc-2.34-109-gd64b08d5ba7... | 6 
                 linux-5.15.33 | 6 
                 uclibc-1.0.40 | 6 
                host-go-1.18.1 | 5 
             libopenssl-1.1.1n | 5 
linux-headers-5.10.104-cip3... | 5 
                pciutils-3.8.0 | 5 
            qpid-proton-0.35.0 | 5 
toolchain-external-bootlin-... | 5 
                busybox-1.35.0 | 4 
                libssh2-1.10.0 | 4 
         linux-headers-5.15.33 | 4 
                  zchunk-1.2.2 | 4 
                bitcoin-0.21.2 | 3 
                elfutils-0.186 | 3 
                freeipmi-1.6.9 | 3 
             host-pahole-v1.23 | 3 
               target-finalize | 3 
    toolchain-external-bootlin | 3 
                       unknown | 3 
                  vlc-3.0.17.4 | 3 
              containerd-1.6.2 | 2 
                     frr-8.2.2 | 2 
google-breakpad-c85eb4a59b6... | 2 
       host-gcc-initial-10.3.0 | 2 
host-google-breakpad-c85eb4... | 2 
           host-nodejs-14.18.3 | 2 
                 libldns-1.8.1 | 2 
                libressl-3.5.2 | 2 
   linux-headers-5.10.104-cip3 | 2 
                 mesa3d-21.3.8 | 2 
                  nginx-1.20.1 | 2 
              open62541-v1.2.2 | 2 
               pipewire-0.3.50 | 2 
                rng-tools-6.15 | 2 
                  sngrep-1.4.7 | 2 
                   uacme-1.7.1 | 2 
                       xenomai | 2 
             18xx-ti-utils-8.8 | 1 
                  acpid-2.0.33 | 1 
                  aespipe-2.4f | 1 
               aircrack-ng-1.6 | 1 
                alsa-lib-1.2.6 | 1 
                arp-scan-1.9.7 | 1 
                    bat-0.19.0 | 1 
                  bcusdk-0.0.5 | 1 
             berkeleydb-5.3.28 | 1 
                  bind-9.16.27 | 1 
                    brltty-6.4 | 1 
              bubblewrap-0.6.1 | 1 
           docker-cli-20.10.14 | 1 
              dropbear-2022.82 | 1 
            ecryptfs-utils-111 | 1 
        edk2-edk2-stable202102 | 1 
                  exempi-2.6.1 | 1 
                  ffmpeg-4.4.2 | 1 
fs/cramfs/cramfs.mk:46: /nv... | 1 
fs/ext2/ext2.mk:65: /home/a... | 1 
fs/ext2/ext2.mk:65: /nvmeda... | 1 
fs/ext2/ext2.mk:65: /nvmeda... | 1 
fs/f2fs/f2fs.mk:64: /home/a... | 1 
fs/f2fs/f2fs.mk:64: /home/a... | 1 
fs/f2fs/f2fs.mk:64: /nvmeda... | 1 
fs/f2fs/f2fs.mk:64: /nvmeda... | 1 
fs/f2fs/f2fs.mk:64: /nvmeda... | 1 
fs/f2fs/f2fs.mk:64: /nvmeda... | 1 
                   gstd-0.14.0 | 1 
           heirloom-mailx-12.5 | 1 
       host-gcc-initial-11.2.0 | 1 
host-gdb-arc-2020.09-releas... | 1 
              host-libcap-2.63 | 1 
                ipmiutil-3.1.8 | 1 
                jailhouse-0.12 | 1 
                   json-c-0.15 | 1 
             kismet-2022-02-R1 | 1 
ktap-23bc7a4a94bd9e4e1b8b7c... | 1 
                 libbsd-0.11.3 | 1 
               libcap-ng-0.8.3 | 1 
              libgcrypt-1.10.1 | 1 
               libglib2-2.70.4 | 1 
                 libp11-0.4.11 | 1 
                 libv4l-1.22.1 | 1 
           libwebsockets-4.3.1 | 1 
                libzlib-1.2.12 | 1 
        lttng-babeltrace-1.5.7 | 1 
 Makefile:732: target-finalize | 1 
          moby-buildkit-0.10.0 | 1 
                    musl-1.2.2 | 1 
                   ncurses-6.1 | 1 
                    ne10-1.2.1 | 1 
                nodejs-14.18.3 | 1 
               openpgm-5-3-128 | 1 
                 openssh-9.0p1 | 1 
                   perl-5.34.1 | 1 
polkit-a2bf5c9c83b6ae46cbd5... | 1 
                    pppd-2.4.9 | 1 
qt-webkit-kiosk-a7720e50f2b... | 1 
                    ruby-3.1.0 | 1 
       shadowsocks-libev-3.3.5 | 1 
                     shim-15.4 | 1 
                tinifier-3.4.0 | 1 
uclibc-ng-test-0844445e7358... | 1 
                xenomai-custom | 1 
                  xvisor-0.3.1 | 1 
                  zabbix-5.4.9 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |       18xx-ti-utils-8.8        | NOK | http://autobuild.buildroot.net/results/ffd723e2f1d0c8787bca20b5b85aa2ff73fcec37 |     
  mips64el   |          acpid-2.0.33          | NOK | http://autobuild.buildroot.net/results/f7a6c74c9d4493e4cf4e3634a4ea7705943d3343 | ORPH
  mips64el   |          aespipe-2.4f          | NOK | http://autobuild.buildroot.net/results/a2be6a7e9202d3f376487efb6cd8f68c9b77552b | ORPH
 microblaze  |        aircrack-ng-1.6         | NOK | http://autobuild.buildroot.net/results/06cf71dc15dbbcda6f87d3d1ee35b5b98d72ab80 |     
    m68k     |         alsa-lib-1.2.6         | NOK | http://autobuild.buildroot.net/results/c35d9649711450fb28a9b78e8fbcc57004486381 |     
  riscv64    |         arp-scan-1.9.7         | NOK | http://autobuild.buildroot.net/results/e42fc2a60bfb8122f33d0754550aba5f161d479e |     
    i686     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/88e546ac3017852784268638d24a34802be1dd50 |     
    arc      |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/d47f6e47540929e5947ea7fdbb810992453801f3 |     
   sh4eb     |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/749cd95a011ed1047884d7217325ed506bdbe733 | ORPH
   sh4aeb    |          bind-9.16.27          | NOK | http://autobuild.buildroot.net/results/a1df2ee28df39afecee8e4b964aafb0172bb0d07 | ORPH
  mips64el   |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/ac29885022b1bef0837d8d411059a36c9661e3dd |     
 aarch64_be  |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/ab41034370ec1d823687d173ed8d56ca584310a3 |     
microblazeel |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/73b4884c754a5f92cfa420f59a480335f56607fd |     
    mips     |           brltty-6.4           | NOK | http://autobuild.buildroot.net/results/4e1fc0ed9e328657f26fb8b82aa46633a0d517cc |     
   mips64    |        bubblewrap-0.6.1        | NOK | http://autobuild.buildroot.net/results/369ed6f3a4fa798bbdb58f39c1397949b52deb9c |     
    m68k     |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/173b6e309ce9c50805ac039ac992f3a36177af74 | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/4748d244c30693144ac2a28c64cabe8dd4f7fc35 | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/74e5cebf5519b6c2679789b21d136588656ea7a8 | ORPH
    m68k     |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/91938addae647e447716dff51971fe7dc5a2a91c | ORPH
   x86_64    |        containerd-1.6.2        | NOK | http://autobuild.buildroot.net/results/93c4aed5ff2ff1d36a6d402c1643ee21c8648806 |     
  aarch64    |        containerd-1.6.2        | NOK | http://autobuild.buildroot.net/results/34f0e5bbffcdc1cb5a92688b4f00236f4cd5b1f4 |     
powerpc64le  |      docker-cli-20.10.14       | NOK | http://autobuild.buildroot.net/results/ac9b60515999ca5044645e67b66eb666e7f69969 |     
  riscv64    |        dropbear-2022.82        | NOK | http://autobuild.buildroot.net/results/20d86536a273adc371c065c2e1af66028e83929c |     
    arc      |       ecryptfs-utils-111       | NOK | http://autobuild.buildroot.net/results/e3e54ae1fe0c84090a749b9490005aac30a99a34 |     
   x86_64    |     edk2-edk2-stable202102     | NOK | http://autobuild.buildroot.net/results/0d3559d5013ec2f9297cfaf36a5e3984ab6dadad |     
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/dffbc4010bfb1c62f215d6ac6358b57689ae5a4e | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/bbca0cc7d421cadb1182888edc59179ac605b1c2 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/77733f035ad01f0b7f9a8de3608f482e3af0e72c | ORPH
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/7f6bba97e7343597f45ffdecf1212565e1c6974f |     
    arm      |          ffmpeg-4.4.2          | NOK | http://autobuild.buildroot.net/results/a7325e21cf404b9f30348326ec1ecbfb0f831123 |     
    arm      |         freeipmi-1.6.9         | NOK | http://autobuild.buildroot.net/results/6b3b0b5241ffd78cd53012904edae70e2f362414 |     
    sh4      |         freeipmi-1.6.9         | NOK | http://autobuild.buildroot.net/results/de7d9040fc35e4407f57a5c2a6346263cb4aed8d |     
  powerpc    |         freeipmi-1.6.9         | NOK | http://autobuild.buildroot.net/results/6569e549724b886f844c4daea764c243518c988b |     
   xtensa    |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/41a6a8a4f6b3bcb750b07bff9b1d0dc2d6579023 |     
    arc      |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/57fe1cb226d3b84704a3838cad48ec06e3adeb7a |     
   s390x     | fs/cramfs/cramfs.mk:46: /nv... | NOK | http://autobuild.buildroot.net/results/b795050fd41831576c33303d86a16602a69db5ff |     
  aarch64    | fs/ext2/ext2.mk:65: /home/a... | NOK | http://autobuild.buildroot.net/results/065bb060342908c1c302957be7379b5f8ca54796 |     
    m68k     | fs/ext2/ext2.mk:65: /nvmeda... | NOK | http://autobuild.buildroot.net/results/22cd50b51a6319a73ca7a025fdf42cb6b4dcd77f |     
  powerpc    | fs/ext2/ext2.mk:65: /nvmeda... | NOK | http://autobuild.buildroot.net/results/f8ec920b35ecb13a964f2447aa678d23b5737a0b |     
    or1k     | fs/f2fs/f2fs.mk:64: /home/a... | NOK | http://autobuild.buildroot.net/results/ad588d5f57d7e4ddaa342633d8e932b7a2d3acf3 |     
    i686     | fs/f2fs/f2fs.mk:64: /home/a... | NOK | http://autobuild.buildroot.net/results/a5be4902394339a862571d32345572f17e6b2da8 |     
 microblaze  | fs/f2fs/f2fs.mk:64: /nvmeda... | NOK | http://autobuild.buildroot.net/results/4959d26ada080c092893aa657bdfbf33ecc76cb3 |     
 powerpc64   | fs/f2fs/f2fs.mk:64: /nvmeda... | NOK | http://autobuild.buildroot.net/results/16092bcc70553afe1cd25bcc56c7d002c051959c |     
   armeb     | fs/f2fs/f2fs.mk:64: /nvmeda... | NOK | http://autobuild.buildroot.net/results/68bbc5d48cc3ec31d333cbd110db2caeb3ac0a95 |     
   xtensa    | fs/f2fs/f2fs.mk:64: /nvmeda... | NOK | http://autobuild.buildroot.net/results/b627348add06b13ea0b43b324ebd6dd3c98e4d77 |     
   mipsel    |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/ecaf75f9bc3de9aa8241f123972faff8988f6f81 |     
    or1k     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/df7ba82891e3b22f6b66f2d912f533f316e66da1 |     
   armeb     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/d39b6ac4efdcce98814c5d9acee81f64a88b875a |     
    or1k     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/001131b584dfcd28ed1350743c25bb0257193f3f |     
   sparc     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/e9fb95290e9eafa6dfe339577909e42ca466b037 |     
  mips64el   |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/d5e7080fe8ab8b983c39f83c0db4373862b3451e |     
    arc      |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/f249ff35583abdc99e675bc55520e3abccb5888c |     
 microblaze  |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/e95ebac7843eabcbfca7c7304a09e5761c8ed652 |     
   mips64    |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/49d838baa8582420870b849551adbae3659e6f79 |     
   xtensa    |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/8d8cc0cc9eec5bf398b3ecbc907e254600d4aea9 |     
 aarch64_be  |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/3dd55131cc954f4feb6cb8192845c723ed63eaa1 |     
 aarch64_be  |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/f771f757389534170ca0387cf60760eebf0766f6 |     
powerpc64le  | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/97e7da514a881639f3f6a66214ce6630cd783587 |     
    sh4a     | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/d134811c74fc2886ce7756abc3169cfa11f14db4 |     
   nios2     | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/409ccd0c6bc60249e9fd405328bb614c287eacd3 |     
   nios2     | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/ea2060bede6f9057dd04981d8117ae7384fa60d0 |     
  riscv32    | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/3f3e4da6643cc4bef1f86f0527013900610f1dfa |     
    sh4a     | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/fa7fafbb1ee7a905ee17372006bf649284f4d3dd |     
   mipsel    | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/5080debddd0eb6cbab2c3ae9c2e15f293134629e |     
   mipsel    | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/f8a7689f2c02bdc50f3127c9a3d2cbb4514437e5 |     
microblazeel |          gstd-0.14.0           | NOK | http://autobuild.buildroot.net/results/0bb4abb806a2de7fc4b3df99750ef0c489070450 | ORPH
    sh4a     |      heirloom-mailx-12.5       | NOK | http://autobuild.buildroot.net/results/9e236aa3461701fb1fd0e7d929f1c49d47d7beec |     
   x86_64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/11570e3454c02e9dbcb104593b91e0bd1919ff65 |     
   x86_64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/bc2593ec19eb206808df377b1dfac40b138c1641 |     
  riscv32    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/734ad09932b0b52e28e6c771b8de017ad427890d |     
  riscv32    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/1b32624f4523b83f234bebb3c073ea3c9ac04155 |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/b13c73101e087912a65b3a052a9fd5123d9175b0 |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/af7bf6fd6c6d6cf964c3927e554a2781231ada3c |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/5e94a96dd70ecf02af777f380ca9609728d474c4 |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/c02db5fe6d7633232a4b170e3d29ad524b37fdc2 |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/959d272ea2931dc07176af7c67f0a3a11ae96ab8 |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/1a99be6405e39b17e635835e07e68644c40fd2fc |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/0f02339e37de299b827db9c6e73ca0fff89bb8b1 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/e724306873fcb7809e7053732eb44cc8e6a22a00 |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/4fe1b5b462e8450da86a29b1492427d23230b5b2 |     
   arceb     |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/09063f611d64287a9274f76809cc5d3952b43d50 |     
   armeb     |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/7eb2dff577111996adee8bf998c10a4d1d07f3ee |     
    arc      |    host-gcc-initial-11.2.0     | NOK | http://autobuild.buildroot.net/results/8bd312760ac84d1f00800f7fafd1f5fd3c3605da |     
   arceb     | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/3915e1d1764236b179048867bec0b3f962dd8d3c | ORPH
  mips64el   |         host-go-1.18.1         | NOK | http://autobuild.buildroot.net/results/e9ff17ea1e06bbb39f5a871b4f6286244f2c9bff |     
   mips64    |         host-go-1.18.1         | NOK | http://autobuild.buildroot.net/results/add0fb2f6ceac3b05221128bd969b9ba3a41e5a1 |     
   mips64    |         host-go-1.18.1         | NOK | http://autobuild.buildroot.net/results/a199c4183747aa0266bfedd714614eaeda0714e4 |     
  mips64el   |         host-go-1.18.1         | NOK | http://autobuild.buildroot.net/results/b4f825a83504100aff8366858495dd55596d5760 |     
   mips64    |         host-go-1.18.1         | NOK | http://autobuild.buildroot.net/results/9d904bc1d8197a61c193c06259a7c448f40cd8d9 |     
   mipsel    | host-google-breakpad-c85eb4... | NOK | http://autobuild.buildroot.net/results/67696ad50793046a3f7d74f3ef50b77b01e95c5a |     
   x86_64    | host-google-breakpad-c85eb4... | NOK | http://autobuild.buildroot.net/results/a3d4e395b45a20eb565aca1f8252b4edab13a683 |     
  powerpc    |        host-libcap-2.63        | NOK | http://autobuild.buildroot.net/results/f033b56fb3376c28dbc0d82856776d09d41af3df |     
  aarch64    |      host-nodejs-14.18.3       | NOK | http://autobuild.buildroot.net/results/1ffa9fbcbf365eed0d278a94cda4702eb833c9d5 |     
  aarch64    |      host-nodejs-14.18.3       | NOK | http://autobuild.buildroot.net/results/361cef449e2e38613fd8dcd2da85cfcb754f32d6 |     
    i686     |       host-pahole-v1.23        | NOK | http://autobuild.buildroot.net/results/0d5bb0f33130d36745fc8ac75e0a4a03a95b6b58 |     
    arm      |       host-pahole-v1.23        | NOK | http://autobuild.buildroot.net/results/745e9ed9ee5da00da5292c6a2245a82726491fa8 |     
microblazeel |       host-pahole-v1.23        | NOK | http://autobuild.buildroot.net/results/89d6812922e776c4301764cacf01b227587b328c |     
   x86_64    |         ipmiutil-3.1.8         | NOK | http://autobuild.buildroot.net/results/7f4c27c0dfa008aee5deefe176229eb7dc48a44b |     
   x86_64    |         jailhouse-0.12         | NOK | http://autobuild.buildroot.net/results/d01f4a307868c48e5cb45ad6be40f5d0593bf331 |     
    or1k     |          json-c-0.15           | NOK | http://autobuild.buildroot.net/results/5da78c28f57bbaaa3a85d0a5f02138bdf865408b |     
   mipsel    |       kismet-2022-02-R1        | NOK | http://autobuild.buildroot.net/results/0d62ab8ab659f31811cbce3fa9c2e2cc2901b707 | ORPH
   sparc     | ktap-23bc7a4a94bd9e4e1b8b7c... | NOK | http://autobuild.buildroot.net/results/0924f6e46f6e2213938256db1011f21d909695ac |     
   sh4aeb    |         libbsd-0.11.3          | NOK | http://autobuild.buildroot.net/results/6f09542e16c2fabc34b58431fa13170f7b7535de |     
    or1k     |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/da183e5148efaff35746434604ac31799a965367 |     
powerpc64le  |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/815946bf7e45601e3d0c97c3f93312f1bbf4d724 | ORPH
    arc      |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/fb802c355f30f17ab60f65078ef3ae9bea1efe72 |     
    i686     |         libldns-1.8.1          | NOK | http://autobuild.buildroot.net/results/ad119fef9705d2eda3ade89e801b37b695af8ec4 |     
    arm      |         libldns-1.8.1          | NOK | http://autobuild.buildroot.net/results/9bc57882099a445d67244ab862235ce977760d36 |     
  powerpc    |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/e44f3d27f6039e8c7be03559eb14eaee12677f0b |     
    m68k     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/da5e467d581cb1e323a2e11bd718a6992bef6860 |     
   sh4eb     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/11185ae71fe8b21a568a980d6c186d59fda9be5c |     
   arceb     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/d4f2b6bc554bc2deb76d13317b3377c6f8cc82aa |     
    m68k     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/890243e1459f60fbceec9418a4e3c82d522ea7f3 |     
 aarch64_be  |         libp11-0.4.11          | NOK | http://autobuild.buildroot.net/results/95e3c334c7979f3ef47a11ba30e13f83c82770ab | ORPH
    m68k     |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/7cdef987884345060aa55b9b2b65128a16cc67dc | ORPH
    mips     |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/4042b852d5e32e6fca872f1eb6219fa5f2c9d36a | ORPH
  powerpc    |         libssh2-1.10.0         | NOK | http://autobuild.buildroot.net/results/64ff7d873bbfec37df83c6f389d603608ae93834 |     
    or1k     |         libssh2-1.10.0         | NOK | http://autobuild.buildroot.net/results/3ff7aa6607b285e7f101e48a4024f3e30d1ec237 |     
    sh4a     |         libssh2-1.10.0         | NOK | http://autobuild.buildroot.net/results/8c52ad3b1455dce5d905c4b44f752c8a7c032777 |     
    i586     |         libssh2-1.10.0         | NOK | http://autobuild.buildroot.net/results/e03096a66a814ebfde6e7d468e5fb37fdc571d6f |     
    i686     |         libv4l-1.22.1          | NOK | http://autobuild.buildroot.net/results/575090b9c1d397093f4ba2a447c0ee6939a29ccd |     
   xtensa    |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/504bb2674f5b37c622d21c9b58bff531ca47bb17 |     
    m68k     |         libzlib-1.2.12         | NOK | http://autobuild.buildroot.net/results/7ec3d746e96225c4982957ce1a8a96dc0c070fe5 | ORPH
   mipsel    |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/b16fb6d44f27a4a514337c6ae90234c13f17ede4 | ORPH
    sh4a     |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/6826e4abcf18f63ba7354585ec7644394b0453dc | ORPH
   mipsel    |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/443fd1753ca75e4287caf3049317e73aa6a898b5 | ORPH
   nios2     |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/55a762e1f3de4460d3fe2e7598be99cc60098005 | ORPH
    arc      |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/ed601efe1496647bbafc877a7dfca83c68355566 | ORPH
  powerpc    |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/cb4ad18cb90ae5e6b84b36ad33d1e68c214bb5a1 | ORPH
  aarch64    |  linux-headers-5.10.104-cip3   | NOK | http://autobuild.buildroot.net/results/963dc5121351eab486f71705f8dd6757f8042d86 | ORPH
 microblaze  |  linux-headers-5.10.104-cip3   | NOK | http://autobuild.buildroot.net/results/60d9aa94b02005570ffef1f9afdf8bb34317fd8e | ORPH
    mips     | linux-headers-5.10.104-cip3... | NOK | http://autobuild.buildroot.net/results/32831f951baa5e3cde4f5927f4be57400f232f10 | ORPH
    arc      | linux-headers-5.10.104-cip3... | NOK | http://autobuild.buildroot.net/results/f9229ab971da5ec4b548756aeeb08233f5e40da5 | ORPH
    m68k     | linux-headers-5.10.104-cip3... | NOK | http://autobuild.buildroot.net/results/ee0f22d41e4d5b0d6e22dd8516d3579a95f13ac7 | ORPH
 powerpc64   | linux-headers-5.10.104-cip3... | NOK | http://autobuild.buildroot.net/results/4ff5f1cd1bf70b63af15902ee919054170c6ff96 | ORPH
   nios2     | linux-headers-5.10.104-cip3... | NOK | http://autobuild.buildroot.net/results/f98e52e7387f0c96816a525cd10e1eb8590ceec6 | ORPH
powerpc64le  |     linux-headers-5.15.33      | NOK | http://autobuild.buildroot.net/results/c987cdf2d61197c5578b60201ddac4f5b70f44ff | ORPH
 aarch64_be  |     linux-headers-5.15.33      | NOK | http://autobuild.buildroot.net/results/2e63a0fe7e96beed5df596cc67d1306a77c2ce1e | ORPH
  riscv32    |     linux-headers-5.15.33      | NOK | http://autobuild.buildroot.net/results/bb23e932a1430aef4037c36d4055a49d82e634f3 | ORPH
  aarch64    |     linux-headers-5.15.33      | NOK | http://autobuild.buildroot.net/results/f42fe5458792d8b0093f864e14aadc976fe91a6e | ORPH
    or1k     |     lttng-babeltrace-1.5.7     | NOK | http://autobuild.buildroot.net/results/5a91c9b3b0a09bce6cd18dedb1be9dbb953bed2b |     
   mipsel    | Makefile:732: target-finalize  | NOK | http://autobuild.buildroot.net/results/226d7906eeeada005ff7805ea2d07ba4f41b783b |     
  mips64el   |         mesa3d-21.3.8          | NOK | http://autobuild.buildroot.net/results/bbdaff4de4c1a6f09b60f000046f5760dc4a12d4 |     
    arm      |         mesa3d-21.3.8          | NOK | http://autobuild.buildroot.net/results/68e6106171cc0b4ad1750b31f529ef1554cafb9d |     
powerpc64le  |      moby-buildkit-0.10.0      | NOK | http://autobuild.buildroot.net/results/1741a788c5170608f50442a601896cfbffb061b8 |     
  powerpc    |           musl-1.2.2           | NOK | http://autobuild.buildroot.net/results/e7f807d6858b4dfe6b8e54b051559e3104d4afc8 |     
   arceb     |          ncurses-6.1           | NOK | http://autobuild.buildroot.net/results/8e481cc926bfeec67111e85d29762824c411eeca | ORPH
  aarch64    |           ne10-1.2.1           | NOK | http://autobuild.buildroot.net/results/f30234a17089559d26f173683778db4944781b51 |     
    arc      |          nginx-1.20.1          | NOK | http://autobuild.buildroot.net/results/27c8be23c0539617d55849b49060678cb1765066 |     
  riscv32    |          nginx-1.20.1          | NOK | http://autobuild.buildroot.net/results/680c3814579c5e94cd4f842fc09351d28c469e5f |     
   x86_64    |         nodejs-14.18.3         | NOK | http://autobuild.buildroot.net/results/4ec21e17b6dd7936b43ffc23951931ea33df7a09 |     
  riscv32    |        open62541-v1.2.2        | NOK | http://autobuild.buildroot.net/results/3091dcbdab7b1f0b92488b808f5cdf2bef0bacc8 | ORPH
   nios2     |        open62541-v1.2.2        | NOK | http://autobuild.buildroot.net/results/38ed2e71e5b0a639402a029e255987d2e24a76ee | ORPH
   mips64    |        openpgm-5-3-128         | NOK | http://autobuild.buildroot.net/results/f3b70c49adb0e9c9f29d6dc6532c2df6d93d480a |     
    m68k     |         openssh-9.0p1          | NOK | http://autobuild.buildroot.net/results/ca065b3a44ba9f1919e3cc2bef583133fb0aa012 | ORPH
    arc      |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/9fb7c4cf8c7aa13ab8eec3ecd76c7627aa7b33ad |     
   x86_64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/f55cddf92bbaa04b468931c83bedfd627ec9e37e |     
   nios2     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/66c219f6a69412fe9ec4cddaf9cc8dc8c4242870 |     
    mips     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/ae5fc2e12f321d8daf97d2d9b6fe4562043afccb |     
  aarch64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/19162d8f240684b35714a53ac8bd9d4d33c4d75c |     
   s390x     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/c5e21e45fc9180f9d9152ee2d2734fe4a9bb1ff4 |     
   sparc     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/b45c724542eb725dd8888c75ccd8e926a7a00611 |     
  mips64el   |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/d9ec0b17c5ecd67cc098abc0594e5df190577d29 |     
  sparc64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/f80686fa4c7900960565e2723376b3f5f03f6b35 |     
   s390x     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/52ba0115fff8318e10076d06ad586c0082d2b3d1 |     
   sparc     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/2ef07887513e2248495ebf448ded254d2e344b97 |     
   mipsel    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/fc2af7b8b2075b0772789278bedff9e51e99cea0 |     
    m68k     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/eab10b6ac5bac5d83d99662bc38a2b7b1c273e91 |     
   xtensa    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/e7d7dbacd049d9cba2428bdb99ea79183639ae9a |     
   nios2     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/f83e51d8720528d66e9978acb3475324dc7155f8 |     
 microblaze  |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/fa017e7f98fc8d0db4cd3b1604afb34521a1a8f9 |     
  aarch64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/b8ac1d46abd24b273f8375b7365eb547edeff6b4 |     
   sparc     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/e6fe357a7565331ed7c3712ae22b849424de5b8e |     
    m68k     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/d3c17c10ca4560b5e075ab1b69e511a7123d674b |     
 aarch64_be  |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/594d7651b5d0eaef35e3765bf8cdc6d28b629907 |     
    arc      |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/075bfe80fc288e81cf504e8af2dd1b76e85f240f | ORPH
    arm      |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/058b2bf1cc5ad631968345e642142ebc90667daa | ORPH
    i586     |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/5d8c556cfa6dfb45b0da3e4cfca5c05e142d14cb | ORPH
   mipsel    |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/f76f06363d7efe43b709648fb4b23d394000753e | ORPH
  mips64el   |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/ba755f0a73099df247677cf427ad0ed9ab87be82 | ORPH
   armeb     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/1e768f41031784941cb17ae20084fbb2d6880b4f |     
 aarch64_be  |        pipewire-0.3.50         | NOK | http://autobuild.buildroot.net/results/95f16971de95db2f61062daa3f2a0b599e9aef35 |     
    mips     |        pipewire-0.3.50         | NOK | http://autobuild.buildroot.net/results/e33e97055c3b568bf270570c80f08e7e12875384 |     
 aarch64_be  | polkit-a2bf5c9c83b6ae46cbd5... | NOK | http://autobuild.buildroot.net/results/5b3e9c8e3fa373f93f585bcdac4e72279258cdcb |     
  sparc64    |           pppd-2.4.9           | NOK | http://autobuild.buildroot.net/results/19d92ffc48a169323c0a2b6d2bd10fa95acd1494 | ORPH
   nios2     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/d99e3c85812f3a0cbbc2adef7a6aaa39f6b6ab5f |     
    or1k     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/018c52039021356bb21de74da59a15ede8c7b854 |     
microblazeel |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/7b85fd39c8191ff33cb47abb55f67fc500f019fc |     
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/707c181b3e0549116251f1cc2c5c13327b8c7ffa |     
   nios2     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/8436f184288b30f05ec9eef677990a7de7c6507c |     
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/864581b35ba46d54c4a9281cc743e668e711b2fa |     
   nios2     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/6883255bcc3cce5c81d0eb38fc9a24d969e14f52 |     
  aarch64    |   python-cryptography-37.0.1   | NOK | http://autobuild.buildroot.net/results/3b331f232df68a2c6ed7b213b7892949ec538eb9 |     
  sparc64    |   python-cryptography-37.0.1   | NOK | http://autobuild.buildroot.net/results/e1dc3b5b7b782368161571ad22779e2e6e5a0f89 |     
powerpc64le  |   python-cryptography-37.0.1   | NOK | http://autobuild.buildroot.net/results/592e6919f0acdc3a4c034110b7588720e83145af |     
powerpc64le  |   python-cryptography-37.0.1   | NOK | http://autobuild.buildroot.net/results/4add89f1ed4dc6684a4c4391164279d4e7e61024 |     
   x86_64    |   python-cryptography-37.0.1   | NOK | http://autobuild.buildroot.net/results/6e182c736cff18b751b5adc62b6976656b84fdad |     
   mipsel    |   python-cryptography-37.0.1   | NOK | http://autobuild.buildroot.net/results/cdedc7d4ef2627f5e4546244e589559b4149ab01 |     
  sparc64    |   python-cryptography-37.0.1   | NOK | http://autobuild.buildroot.net/results/bf03b292a1e1b1e5241001b8f006030328345779 |     
  sparc64    |   python-cryptography-37.0.1   | NOK | http://autobuild.buildroot.net/results/f9d44f4d5ef3457ccc00baebb603dc6d9e3eef9a |     
  aarch64    |   python-cryptography-37.0.1   | NOK | http://autobuild.buildroot.net/results/2a11f2e2bf28d64c1b84c1276e182449ee5f98f9 |     
    arm      |   python-cryptography-37.0.1   | NOK | http://autobuild.buildroot.net/results/91831695207c0a0ab796d0d74de95a341d564e76 |     
  aarch64    |   python-cryptography-37.0.1   | NOK | http://autobuild.buildroot.net/results/1d4d53b27f839591eb9fc2ed1b1c2c82be0eb7b3 |     
    m68k     |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/6f1a4fecaf3c6d26c0bf6fed45a9d5268f179e83 |     
 powerpc64   |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/27ff9586d9d7d4e15d2b0272421b0d200a2d9e4e |     
 powerpc64   |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/c9eb90dbea0c8fe7eb17256b58a22e419f5a95e0 |     
    m68k     |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/cf4d368aa340d39f44d05a1c0ea7ce81560304ec |     
    or1k     |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/a91d4af3291d62534d18abf99b6860031aa7313d |     
  aarch64    | qt-webkit-kiosk-a7720e50f2b... | NOK | http://autobuild.buildroot.net/results/5dbd80a5dc58a76c19783923b005c4e9e854b7e7 |     
   xtensa    |         rng-tools-6.15         | NOK | http://autobuild.buildroot.net/results/1f53a4481d4734b424bd957335b8c9d8129c4693 |     
  mips64el   |         rng-tools-6.15         | NOK | http://autobuild.buildroot.net/results/338ff87d39abd0e3093133fff7e7d629abcf4b0b |     
  riscv64    |           ruby-3.1.0           | NOK | http://autobuild.buildroot.net/results/127e280b658d3ccabd538cc5310c3663f83f688a |     
   nios2     |    shadowsocks-libev-3.3.5     | NOK | http://autobuild.buildroot.net/results/994139e46c0b33fc2a923c304730b69d37ce4ba9 |     
 aarch64_be  |           shim-15.4            | NOK | http://autobuild.buildroot.net/results/a9463163663365759b853a5fecb4a021ad9863d3 |     
   armeb     |          sngrep-1.4.7          | NOK | http://autobuild.buildroot.net/results/8dcbbf79fa4ad66fb512421451d9dd8e80fbf99f | ORPH
   armeb     |          sngrep-1.4.7          | NOK | http://autobuild.buildroot.net/results/f1e8cdb3ac35a30055ab79d41e6cc038e5339c37 | ORPH
  riscv64    |        target-finalize         | NOK | http://autobuild.buildroot.net/results/3308e1fcf5e5b7accd9b13c221ff4468564ab4a6 |     
   x86_64    |        target-finalize         | NOK | http://autobuild.buildroot.net/results/9e2da8a10f3e39af7f04edcae98d06b46b2f37e1 |     
  riscv32    |        target-finalize         | NOK | http://autobuild.buildroot.net/results/2f453af76547757567a8dde78135e88aacfb70cc |     
powerpc64le  |         tinifier-3.4.0         | NOK | http://autobuild.buildroot.net/results/3b4a996f40f2d7a2d683f8b448888188e73f747b |     
   mips64    |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/f0d0746345eaa19b0ca3e07876318527fa7bcb8a |     
  sparc64    |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/05d880626ec8ec188a2b6fe4c728e665653a4fef |     
  sparc64    |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/818ba5a36d9f38d3fe8630523ff091456d540ecd |     
    i586     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/54c3951dba235ceb4943986791c4cf206876df80 | ORPH
   armeb     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/9fcae7a03f0f494138e3f54c18acc33dcb3cb1d5 | ORPH
 microblaze  | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/e2bfb412d1462ab8c59e4694543d0da1d0cba6e8 | ORPH
 microblaze  | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/1474b5cc41f33e12ea1abb71d494ece88225a47e | ORPH
microblazeel | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/cfec475c530370665912348a3aee98c0bae25e53 | ORPH
  mips64el   |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/d141f9b8fa682cdad062b56ac8fd4fb01ca178af |     
 powerpc64   |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/c9c71a7c25cc98c2cccb8ff514d8742dcae17931 |     
  riscv64    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/0cfed9c1ce02700048411dae0fbb2d9b0da6210f |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/fd4bcd10244a9e0d8689c49b1271a7775fd885b6 |     
   armeb     |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/c97924ca515bb7541a6e1ad25ee8296d142d6041 |     
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/9293be18c48ae316fcb7a26a770ac9d75ad3c7b6 |     
    arc      |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/f1d8f7a10289f6c26ad7ef25aea74b830d54e85d |     
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/66f70ca12ee0a2bc1f94ee2097aee703618771eb |     
    i586     | uclibc-ng-test-0844445e7358... | NOK | http://autobuild.buildroot.net/results/9d121e5ed5e38179be4f09e367affcfb793c10a4 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/4da15e554bf816b0b662841a6f09c0e7bc9f69d7 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/2ae4c1009670baad44886f2e0188c73fc5483635 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/908065917ffd9f6811c75fc8867c620302704ebd |     
    arm      |          vlc-3.0.17.4          | NOK | http://autobuild.buildroot.net/results/3376748606f51250019401db3aa2ff2db0dcc1eb |     
   s390x     |          vlc-3.0.17.4          | NOK | http://autobuild.buildroot.net/results/3632c0fe695f2e89382a04e52e324a813c53ac1d |     
   s390x     |          vlc-3.0.17.4          | NOK | http://autobuild.buildroot.net/results/596d457d3f3168d9a82d749b2213124402afaf6e |     
    sh4      |            xenomai             | NOK | http://autobuild.buildroot.net/results/19d53bbeef7128dc9016b17a68364b1b70dbed5b |     
    i586     |            xenomai             | NOK | http://autobuild.buildroot.net/results/be3f4f06375295b94fb731c250138a69dcd66e94 |     
   x86_64    |         xenomai-custom         | NOK | http://autobuild.buildroot.net/results/28417b9f63bd335f7e98d5623cf69c6fffe6a143 |     
  riscv32    |          xvisor-0.3.1          | NOK | http://autobuild.buildroot.net/results/8ff9e5e0b21f9706529b1a9bb45fc6d151ec3e17 |     
   mips64    |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/784eaceea6993311085eff00dc5f1e79f83e5521 |     
    mips     |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/d2b4adcfb4d2fafa8b323612d3dd5ff960d1f926 |     
   xtensa    |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/1cdbbb4c0db3e29b9e9dfce0ff7ee1b361809ae6 |     
   armeb     |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/367378f9ea5b72e872606f6ac33731aea82b6c2d |     
    arc      |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/f4ae227356af03b84129257b0c2f114e3a227c1a |     
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/b773c877f6e46b536656a972b7cd58c43fd27ad3 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/ae3189d2509a74c6419d131b1d28afea8d5d751d | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/e1dc0e5b9d9dd06d1d0484538fb9266b1de9bc4b | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/67ff3895630a6b194ed5f2c0099cf2a296d470c0 | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/4122d2dfcaea21c5363b64b84688a05b22d9f66b | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/230fb5a7b5970d71d985c2efd36d1b90fdc12d07 | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/bcfcca82e2083cfe2d3ccaf323959b195e73bc1d | ORPH


Classification of failures by reason for 2022.02.x
--------------------------------------------------

                       frr-8.1 | 2 
                    bird-2.0.8 | 1 
                  exempi-2.6.1 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/0fdaf7e857460f1d87f3025fc27e43a4d0b2aa57 |     
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/8d2424fb671f88f46cb35e5a92e301f0a8fb3bee |     
   xtensa    |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/13eaee784ae6202e85e18dda8f97fc6445744382 |     
   xtensa    |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/d65a0446336324eabfd064f34007c78ce08f99a3 |     


Gitlab CI results for 2022-04-29
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                amarula_a64_relic | https://gitlab.com/buildroot.org/buildroot/-/jobs/2387777723  |      
   atmel_sama5d27_som1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/2387777767  |      
                      bananapi_m1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2387777793  |      
                 bananapi_m1_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/2387777795  |      
                 bananapi_m2_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/2387777798  |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/2387777805  |      
                     csky_gx6605s | https://gitlab.com/buildroot.org/buildroot/-/jobs/2387777827  |      
        freescale_imx6dlsabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/2387777841  |      
          freescale_imx6dlsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/2387777842  |      
         freescale_imx6qsabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/2387777844  |      
           freescale_imx6qsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/2387777845  |      
          freescale_imx6sxsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/2387777847  |      
             freescale_imx6ullevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/2387777849  |      
           freescale_imx7dsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/2387777850  |      
              freescale_imx8mmevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/2387777851  |      
              freescale_imx8mnevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/2387777852  |      
              freescale_imx8mpevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/2387777853  |      
              freescale_imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/2387777854  |      
              freescale_imx8qmmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/2387777855  |      
             freescale_imx8qxpmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/2387777856  |      
            friendlyarm_nanopi_m1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2387777863  | ORPH 
       friendlyarm_nanopi_m1_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/2387777865  | ORPH 
           friendlyarm_nanopi_neo | https://gitlab.com/buildroot.org/buildroot/-/jobs/2387777873  |      
     friendlyarm_nanopi_neo_plus2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2387777876  |      
            friendlyarm_nanopi_r1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2387777879  |      
                          galileo | https://gitlab.com/buildroot.org/buildroot/-/jobs/2387777886  |      
                       imx8mmpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/2387777912  |      
                        imx8mpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/2387777913  |      
                        imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/2387777914  |      
                    licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/2387777926  |      
        minnowboard_max-graphical | https://gitlab.com/buildroot.org/buildroot/-/jobs/2387777950  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/2387777998  |      
                    orangepi_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/2387778003  | ORPH 
                     orangepi_win | https://gitlab.com/buildroot.org/buildroot/-/jobs/2387778008  |      
         qemu_arm_versatile_nommu | https://gitlab.com/buildroot.org/buildroot/-/jobs/2387778030  |      
             qemu_arm_vexpress_tz | https://gitlab.com/buildroot.org/buildroot/-/jobs/2387778034  |      
               qemu_ppc64_pseries | https://gitlab.com/buildroot.org/buildroot/-/jobs/2387778075  |      
            qemu_ppc64le_powernv8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2387778079  |      
             qemu_ppc64le_pseries | https://gitlab.com/buildroot.org/buildroot/-/jobs/2387778081  |      
                qemu_riscv64_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/2387778100  |      
                       qemu_s390x | https://gitlab.com/buildroot.org/buildroot/-/jobs/2387778102  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/2387778132  |      
                  raspberrypi4_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2387778134  |      
                      rock_pi_n10 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2387778160  |      
                    zynqmp_zcu102 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2387778235  |      



-- 
http://autobuild.buildroot.net

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

