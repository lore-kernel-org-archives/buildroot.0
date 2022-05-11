Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3C5AC433EF
	for <buildroot@archiver.kernel.org>; Wed, 11 May 2022 04:42:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62BBF60FB1;
	Wed, 11 May 2022 04:42:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 55YR99xslqY8; Wed, 11 May 2022 04:42:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C7E7360B47;
	Wed, 11 May 2022 04:42:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F2D401BF4D7
 for <buildroot@lists.busybox.net>; Wed, 11 May 2022 04:42:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E5D5D60B47
 for <buildroot@lists.busybox.net>; Wed, 11 May 2022 04:42:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9BA7BGL9J39D for <buildroot@lists.busybox.net>;
 Wed, 11 May 2022 04:42:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E093760812
 for <buildroot@buildroot.org>; Wed, 11 May 2022 04:42:12 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id F402724000F
 for <buildroot@buildroot.org>; Wed, 11 May 2022 04:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1652244130; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=oS1sqitZhuT8OV/S2slqd1lfPQ5bt3pf/UV5TPCIJXg=;
 b=ctaj+7RuGA2WaDoVFUhkTAann8tGHLWEQnd4GQ/dPnQYs0zETmjvv2DNI8chnb2YKr4Nj2
 CTxHQ9bneWmtlDpuMs/TNSMNaeLlYfSGvuhgcIGKLJ56FmqJ9KGqTpOtiZ3Nvm9uXA8/BA
 fFRtkJmlUaIQ1N+yiBCMLVnW+7mBGTWchUTzhs1tQ+SpCDJJKddsS7QcrOKcipJnd+YCXe
 IN80U0rKBL7MInaXPzWaMaJlye7deQzh/yRMvLW/vJ20NfEMyQ8kHuUXl2R8FUWS7SdjEq
 UUY5izmQlyPbAuJOxKqScqiCcu34dzongQXbhqf9PQyDoYueNHxwjB0AFzAG6g==
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Wed, 11 May 2022 04:42:09 -0000
Message-Id: <20220511044215.E5D5D60B47@smtp3.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-05-10
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

Autobuild statistics for 2022-05-10
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  | 21  | 14  |  0  | 35  |
    master   | 205 | 250 |  1  | 456 |

Classification of failures by reason for master
-----------------------------------------------

         host-gcc-final-10.3.0 | 27
           optee-client-3.17.0 | 20
             libopenssl-1.1.1o | 11
                pciutils-3.8.0 | 11
                    git-2.31.2 | 8 
                 uclibc-1.0.40 | 7 
          host-gcc-final-9.4.0 | 6 
                 linux-5.15.37 | 6 
               protobuf-3.20.1 | 5 
                       unknown | 5 
                 zlib-ng-2.0.6 | 5 
glibc-2.34-109-gd64b08d5ba7... | 4 
              host-rust-1.60.0 | 4 
                   libnss-3.78 | 4 
                libressl-3.5.2 | 4 
                libzlib-1.2.12 | 4 
            qpid-proton-0.35.0 | 4 
                alsa-lib-1.2.6 | 3 
                     aufs-util | 3 
                elfutils-0.186 | 3 
glibc-2.35-6-g491f2ef1f0ff8... | 3 
         host-gcc-final-11.3.0 | 3 
               libglib2-2.70.4 | 3 
             libgpg-error-1.42 | 3 
                  sngrep-1.4.7 | 3 
    toolchain-external-bootlin | 3 
                  bcusdk-0.0.5 | 2 
           docker-cli-20.10.14 | 2 
                      fbv-1.0b | 2 
host-gdb-arc-2020.09-releas... | 2 
                    htop-3.2.0 | 2 
              libgcrypt-1.10.1 | 2 
   libtorrent-rasterbar-1.2.15 | 2 
               libvorbis-1.3.7 | 2 
           libwebsockets-4.3.1 | 2 
           linux-5.10.104-cip3 | 2 
                   linux-tools | 2 
                   perl-5.34.1 | 2 
               pipewire-0.3.50 | 2 
                   uacme-1.7.1 | 2 
ulog-0389d243352255f6182326... | 2 
                     ace-7.0.6 | 1 
               aircrack-ng-1.6 | 1 
                 apache-2.4.53 | 1 
                arp-scan-1.9.7 | 1 
  binutils-arc-2020.09-release | 1 
                bitcoin-0.21.2 | 1 
            bridge-utils-1.7.1 | 1 
                busybox-1.35.0 | 1 
              containerd-1.6.2 | 1 
                  cpulimit-0.2 | 1 
dahdi-linux-5c840cf43838e06... | 1 
                 dash-0.5.11.5 | 1 
               ding-libs-0.6.2 | 1 
                 dmalloc-5.6.5 | 1 
                   eigen-3.4.0 | 1 
               erofs-utils-1.4 | 1 
                   flann-1.9.1 | 1 
fs/ext2/ext2.mk:65: /nvmeda... | 1 
fs/jffs2/jffs2.mk:71: /nvme... | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
                gnu-efi-3.0.10 | 1 
         gobject-introspection | 1 
  gobject-introspection-1.70.0 | 1 
       host-gcc-initial-10.3.0 | 1 
       host-gcc-initial-11.3.0 | 1 
        host-gcc-initial-9.4.0 | 1 
host-pahole-73383b3a39afe86... | 1 
                      less-590 | 1 
                  libcgi-1.3.0 | 1 
       linux-5.10.104-cip3-rt3 | 1 
                mongodb-4.2.18 | 1 
                    mpv-0.33.1 | 1 
                    musl-1.2.2 | 1 
                  mxs-bootlets | 1 
                  ndisc6-1.0.5 | 1 
                netdata-1.33.1 | 1 
                nodejs-14.18.3 | 1 
                    opus-1.3.1 | 1 
            pkcs11-helper-1.28 | 1 
polkit-a2bf5c9c83b6ae46cbd5... | 1 
qt-webkit-kiosk-a7720e50f2b... | 1 
                     refpolicy | 1 
rtl8189fs-73f826f0fa74b2fc1... | 1 
rtl8723bu-19b4bdc05483a1e79... | 1 
rtl8812au-aircrack-ng-3a640... | 1 
             s390-tools-2.21.0 | 1 
                sg3_utils-1.47 | 1 
                     shim-15.4 | 1 
               tcf-agent-1.7.0 | 1 
toolchain-external-bootlin-... | 1 
toolchain-external-codescap... | 1 
                   tor-0.4.7.7 | 1 
             uccp420wlan-6.9.1 | 1 
               valgrind-3.19.0 | 1 
                 wavemon-0.9.4 | 1 
                       xenomai | 1 
                xenomai-custom | 1 
                  zabbix-5.4.9 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |           ace-7.0.6            | NOK | http://autobuild.buildroot.net/results/69fa1309ecc5db8ed23d6578c9ed8d4214fcaceb |     
microblazeel |        aircrack-ng-1.6         | NOK | http://autobuild.buildroot.net/results/65a32c90ab2e6e69aa25d375d3ebea458cbb9289 |     
    or1k     |         alsa-lib-1.2.6         | NOK | http://autobuild.buildroot.net/results/7bb2d3deb14609d77029f77b902b6ca9e58a1cdf |     
    m68k     |         alsa-lib-1.2.6         | NOK | http://autobuild.buildroot.net/results/38bff8c60949e23fbad32a38a0b841d76391c032 |     
    m68k     |         alsa-lib-1.2.6         | NOK | http://autobuild.buildroot.net/results/ba9679ab80d2f175642fd54cc93e2f6d5b9498a8 |     
  nds32le    |         apache-2.4.53          | NOK | http://autobuild.buildroot.net/results/795008aea0e9646353a076868fcf4f7682edfbb8 |     
  riscv64    |         arp-scan-1.9.7         | NOK | http://autobuild.buildroot.net/results/67fa5365cfe598e62b7faea0716cbe0694c2d995 |     
   sh4eb     |           aufs-util            | NOK | http://autobuild.buildroot.net/results/026abdc544a94229706ba6851de01b6f93c8bd90 |     
microblazeel |           aufs-util            | NOK | http://autobuild.buildroot.net/results/e65a6fc84fe55fe1bd9a23b6bebb9d86c8f3ea03 |     
   x86_64    |           aufs-util            | NOK | http://autobuild.buildroot.net/results/378a4c7d97519e7f6acddd1fbfc089ef23800ccd |     
    m68k     |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/da1dbb958bff510cc849168038730298838a256a |     
   x86_64    |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/0fff2bb55e1a6760726a5cde80337ec15b2133e9 |     
    arc      |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/4c5ea1d901c123048b963987aa87c82e37d1c9a3 |     
   x86_64    |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/0a75ead081ffb74cee8fcf78a6fd6e0183ae1dbc |     
    m68k     |       bridge-utils-1.7.1       | NOK | http://autobuild.buildroot.net/results/d2df73e3d5e97ac6026309580ab0aa9b459b1b24 |     
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/d03c5f772e64b1b51f61a6c6b61dc145389c152c | ORPH
powerpc64le  |        containerd-1.6.2        | NOK | http://autobuild.buildroot.net/results/e37af28b6ea2293a5a8a3bb1a5c123bd465ff5de |     
    or1k     |          cpulimit-0.2          | NOK | http://autobuild.buildroot.net/results/60657efccd3e57d30dc94e1e8b8e23456c49735c |     
    mips     | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/acb08026468b634a9f6013bf879342bf2e60a860 |     
   s390x     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/b173ee041f59fd38a583a83ad983d1a286db428e | ORPH
   arceb     |        ding-libs-0.6.2         | NOK | http://autobuild.buildroot.net/results/5a50e02a1599962c98c2c7b67120eb78ed7a1ba3 |     
powerpc64le  |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/b410f2b6302d6eada2194f200884a3afd314b05f | ORPH
powerpc64le  |      docker-cli-20.10.14       | NOK | http://autobuild.buildroot.net/results/bf9b1efa8ddd55974c5209188e833c5adca9855b |     
powerpc64le  |      docker-cli-20.10.14       | NOK | http://autobuild.buildroot.net/results/07dab4c21074d9f2cfba5020eac1d07e630fa3e9 |     
    mips     |          eigen-3.4.0           | NOK | http://autobuild.buildroot.net/results/58a641866f49bfb0ebf4056af7a955181c01b5d2 |     
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/60b87da0c0f547af128bc76e715a75e3c935ff1f | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/82232c5a21436d3de0e18086233e1afe46ed0985 | ORPH
   arceb     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/ba766bae9ee4baf26fcc9e2b4c7230183369d179 | ORPH
    or1k     |        erofs-utils-1.4         | NOK | http://autobuild.buildroot.net/results/4d2e2208f54c196a5a3c4180df8cbdec1b35101e |     
microblazeel |            fbv-1.0b            | NOK | http://autobuild.buildroot.net/results/0f428553b3354ee65f8711487e6346479e56b9e3 | ORPH
   armeb     |            fbv-1.0b            | NOK | http://autobuild.buildroot.net/results/671664dd53f8c80cb42b23aa779cfbe6d81d816e | ORPH
   mipsel    |          flann-1.9.1           | NOK | http://autobuild.buildroot.net/results/5bb329b4306508a567f3c7bf952cc9b46fadeb74 |     
   mips64    | fs/ext2/ext2.mk:65: /nvmeda... | NOK | http://autobuild.buildroot.net/results/0c87f861b76076ade14c414f52df9a80fd219ca7 |     
  mips64el   | fs/jffs2/jffs2.mk:71: /nvme... | NOK | http://autobuild.buildroot.net/results/1c98820f5e193c63cb9d1c947e6adabdcbf0b49e |     
microblazeel | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/a33908fbee1bd5be67b20629d2e3488f2b47d642 |     
microblazeel | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/310aea4b0e315700f7cb9a642d0229a6b86a5ee0 |     
  mips64el   |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/3b5a115cabd327456a3b312f03c953403fbd7b93 |     
    arc      |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/027602a750fd0989f9861773a2c4672667590acc |     
  powerpc    |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/16f21e0243c2a05d2ff41ce221a39cee35bb552e |     
 microblaze  |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/516fa927ab63f8543da1e71b21b1bf074ebf06a6 |     
  aarch64    |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/b757ac52e6c12557cb45534c3a2c0c25dbbb981f |     
   mipsel    |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/da7ab422829ab11bdb99c39c2fcc6d9d02ba0b7c |     
   sparc     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/7699ab3598522d6f97c54ed695bf33bd6db0b8c3 |     
microblazeel |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/a109ff8e118ac2d2c4db71f81c7c53f5ffa0e1d2 |     
  riscv32    | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/26da947d177f3107930689334a9d4bf59dbafae6 |     
powerpc64le  | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/bcf40bf4c35c01f0cb2da7e463f8a80ad47cf25f |     
  riscv32    | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/cda59baef06c726195ee9b3f9807caa21b027f2a |     
  riscv32    | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/2dc1b6ba6d7b2952c026bc93c498f6f217bf55d3 |     
   s390x     | glibc-2.35-6-g491f2ef1f0ff8... | NOK | http://autobuild.buildroot.net/results/083d39135a3dbb1512a7a6e9e588c84dd91d3956 |     
powerpc64le  | glibc-2.35-6-g491f2ef1f0ff8... | NOK | http://autobuild.buildroot.net/results/3b2e7ed848cabd8ee048f622b8657d7c9e2616ae |     
 powerpc64   | glibc-2.35-6-g491f2ef1f0ff8... | NOK | http://autobuild.buildroot.net/results/3927fa72fd752a06dc38ec7bf1070f73f0a3cfa4 |     
  mips64el   |         gnu-efi-3.0.10         | NOK | http://autobuild.buildroot.net/results/884831ac2962770de5a2edfe7b5ab9c56c59a6f6 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/88f1ba460bf321f8652da0df199436af2510126b |     
   x86_64    |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/65fe10fd6e5173111e68d3bdd7f4b03b453e66df | ORPH
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/07391613bc472f0a28d121fbe60b8a0add9577eb |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/bc1375c174543f742d263b0d8a868d4a148b751b |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/a6f638fc05c68b952ed03f1b1ea20712b47465f6 |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/c412fdca6000c8d6ba2d46ffce767d36110f70a6 |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/93f16a650a8fd583bf3b134a0b7d4de4b5e082f7 |     
  riscv32    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/d1bcb4f62233d3a0a28fc39dca43561170c26e4d |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/bf708a17db211a5f5f0c16af83a549fce10436f9 |     
  riscv32    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/98f19b38e46a4c99238d4854f2d2ac0c4895d401 |     
  riscv32    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/ac4aa142f607cf3360a8c2972d17ac3c07841fc1 |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/18b13f618f8c2d81296aa654094bc1c95a64ef81 |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/388d676f1137e4a73752d45391783d507f3da949 |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/0676fe08afdc1911975481e50f40629b5579d4d6 |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/74d54fb3440125b14a9c3871ee3a6c76bfdafc44 |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/cc7f6c3d0df5309a8770b2e0aff4ece01b4f459f |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/852d966631394de1c668685c1c0ba3fae4d4bde0 |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/d5f3a26760841f91b3897e2df83e8d1a9bea4ebb |     
    i686     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/58d7a97d4157d65f3fb6d1716964a3d5d62565ca |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/a84345e8e60c34c98cb27ec733966af0913bd17b |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/448c356ded7f2eee7a881bfd38b810c2cbdcecdc |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/b6a672b2288f691f53a37bc73c07c759794c6e3b |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/8d20d9c1ae0c805615a1062060e410d95bbbcb56 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/d14d6aaa9f4773cea8f97daf1f3c5fb44225faa7 |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/24eed8738f8e3d61036efa3ea3bd21f686241a0c |     
    i686     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/f907212d8780b40f0248bd5a7962b57bfeb178b4 |     
  riscv32    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/b0464a1648929d1d4b3c7f48cbc4e09fac6fe623 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/264f1c512be07296dc98b5627c3c1484fc9daefd |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/a1cc2dbb82575015198f3c8dba1ea47e779b17d2 |     
powerpc64le  |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/ac193de7f4bff12f396b52fb4b8d2a44b5a98a1c |     
   s390x     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/e0ee233e3f2e7bf9a896160acdfc14d7d1a3499b |     
powerpc64le  |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/922c43d16a7c6f2541de596c8eaba4a853307520 |     
microblazeel |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/528da282d15957d23a9844b47fed47c2c123c9d6 |     
 powerpc64   |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/dbfa6e76d61ea98d188bdc5d7559d8909d938504 |     
    i586     |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/e0fc04d0236cc7d5b911a4298f68550c2ef7994e |     
   x86_64    |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/60af8f81839d01c8c2de53df32df8443bfc5d944 |     
   s390x     |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/9ceca05a070cd3be2e6e14d17162e86754ae70b9 |     
   s390x     |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/88660ae57da89d5e3c61356e5feb90d07e8a2d90 |     
    arc      |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/15185af9d041e36f96612e66cd7e680f828cca21 |     
   armeb     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/55bb5938e9c2c2c4a83521f47d154bfe27f650a0 |     
    arc      |     host-gcc-initial-9.4.0     | NOK | http://autobuild.buildroot.net/results/814076e0c7343ba370f98d2c42ea80ae4c818214 |     
   arceb     | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/79c13b2550f07f148034219c1213619064b64e66 | ORPH
    arc      | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/8171f828dcc07a9aa1905b2b4893b9e5e9ca1e83 | ORPH
    arm      | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/9970ecbaeef872fedcde7225ebd7faedc5cfe9f2 |     
  sparc64    |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/326cbbe03a05d25d0b6c51b7fe6dc545c6aa6964 |     
  aarch64    |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/c46b0b597fbaefe4c09c80347c35f37387367ec5 |     
   s390x     |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/04660550f0d00d43e6efc4f178c470ce0bb3a7b1 |     
  aarch64    |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/6cd5582e101b5c3b3edd60c633ae981f3811daaa |     
    m68k     |           htop-3.2.0           | NOK | http://autobuild.buildroot.net/results/815bdbd8cf704434b7ee152c1c3e795c5392a781 | ORPH
    i586     |           htop-3.2.0           | NOK | http://autobuild.buildroot.net/results/795bb4ae4f1a725c56353915c21fa784ca547c59 | ORPH
    m68k     |            less-590            | NOK | http://autobuild.buildroot.net/results/3aa787ef318864c13a09be028f96023b49a381e5 | ORPH
   sh4aeb    |          libcgi-1.3.0          | NOK | http://autobuild.buildroot.net/results/c43cadc4a63198833fc43d932df3f4bf64cbae8b | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/57249ce00bd85b0a92797708cce15e15202bf556 | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/e36aab38c978600aed29535980b474f4b49e4baf | ORPH
   arceb     |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/594bb7d8139ee92b76cfd84d299b8dc1d5f931ec |     
    arc      |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/bdd8dc742d9bf1e92db6c254217cc08f3af3f37a |     
   arceb     |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/7a593c118f9e8e0f920692743c3a9b4af15a319b |     
  aarch64    |       libgpg-error-1.42        | NOK | http://autobuild.buildroot.net/results/5997f89f23b69e4f7dd118855e6bc7be4c5b1212 | ORPH
  aarch64    |       libgpg-error-1.42        | NOK | http://autobuild.buildroot.net/results/80aee842f8486e59e5a0fd09e26ded3f6a700bbb | ORPH
  aarch64    |       libgpg-error-1.42        | NOK | http://autobuild.buildroot.net/results/d58e11b98e90ea6f9a0a27b3e882c48ec4c57b09 | ORPH
 powerpc64   |          libnss-3.78           | NOK | http://autobuild.buildroot.net/results/350b201279c72f9214b91da9b29115690d10a4ad |     
   x86_64    |          libnss-3.78           | NOK | http://autobuild.buildroot.net/results/539ba41dd4b4772664152411db52a7c6ca55ab77 |     
    or1k     |          libnss-3.78           | NOK | http://autobuild.buildroot.net/results/4600bdeff87f1e4dde2c1e12f2184d984b0a8534 |     
 powerpc64   |          libnss-3.78           | NOK | http://autobuild.buildroot.net/results/dffa00b04f407715b04b1dfd8d9e5e4bc62b5ba2 |     
    arc      |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/c279a16a563071afef687b3386f90103a7c6647a |     
 aarch64_be  |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/ecb800dc097ac00b099cc4b6de4de904aa61b6f5 |     
    arc      |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/5879588dfdad5173f8287d603ad8feacae4819a8 |     
    arc      |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/162dae6e177d0b976f352b4e2ef37ab565e73ca1 |     
   sparc     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/b9e55ba670f335d414ab9ddafabafd2633fde97d |     
  powerpc    |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/6912c360b02486d68c47d51f9f408b2dadf66a3a |     
 aarch64_be  |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/5560ea682dc5d1106758ab5b7de6550dce7fadee |     
    sh4      |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/139e401845f8e66f9e198bf8f312747e8251c999 |     
 microblaze  |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/5d0eff084e185b92577d4e97434606d8a039e975 |     
  powerpc    |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/247ec564de1baede0db19ea3b4506e7a78f09ebe |     
 microblaze  |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/de4e74b7a9c3fb4f495d072d3cef0cc48d24aeba |     
microblazeel |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/6b2665e8211477471826ef97b775f29ced2d273e | ORPH
   sparc     |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/893bb354d51292f07b28f12b589be96473eccf6d | ORPH
    mips     |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/d6e0563db156396939e7651faac729f7f6b58019 | ORPH
   xtensa    |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/373809093469a620a8b732a5d803f0e77da025a7 | ORPH
  sparc64    |  libtorrent-rasterbar-1.2.15   | NOK | http://autobuild.buildroot.net/results/846dca4cb9d9c49efa6a27ecdf3c1ba31f198f61 |     
   mipsel    |  libtorrent-rasterbar-1.2.15   | NOK | http://autobuild.buildroot.net/results/bdb46a210278a60161b0c5df54a6aa43df207203 |     
  powerpc    |        libvorbis-1.3.7         | NOK | http://autobuild.buildroot.net/results/4e5d8c230eab3e4f6e319d13234d93c7c8270759 |     
  powerpc    |        libvorbis-1.3.7         | NOK | http://autobuild.buildroot.net/results/c98fcdbb1d715fb62c0c4fe797763ce99eecda94 |     
 aarch64_be  |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/b9573a51faa98803ac79fc27dc5e1dea0a7f5754 |     
    mips     |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/5ee3793826f8dd5c85357b0505ed339b0ada0d6c |     
    m68k     |         libzlib-1.2.12         | NOK | http://autobuild.buildroot.net/results/45be3673a3a4e28a9689870f3ddbb201f96aaefa | ORPH
    m68k     |         libzlib-1.2.12         | NOK | http://autobuild.buildroot.net/results/f32fdc84ba6085241a4d6a8f09f82ac90a20666e | ORPH
    m68k     |         libzlib-1.2.12         | NOK | http://autobuild.buildroot.net/results/17670b01dc15fd6de718e11116e1fb24a6c21194 | ORPH
    m68k     |         libzlib-1.2.12         | NOK | http://autobuild.buildroot.net/results/dedc5d2a8701f6726f8c1ca19a2948aec290bb2f | ORPH
   mipsel    |      linux-5.10.104-cip3       | NOK | http://autobuild.buildroot.net/results/f1de6cb6c6d521eb99b750e48edd93764d0458f5 | ORPH
  powerpc    |      linux-5.10.104-cip3       | NOK | http://autobuild.buildroot.net/results/db57a0e680e111ec628e58f176187c50ebce94a3 | ORPH
    mips     |    linux-5.10.104-cip3-rt3     | NOK | http://autobuild.buildroot.net/results/17be9496b81bb2988270b6c7cafa507dc94e894a | ORPH
  sparc64    |         linux-5.15.37          | NOK | http://autobuild.buildroot.net/results/0c3bbcd25e7830b67651ea0f15630e831d2ac4aa | ORPH
   mipsel    |         linux-5.15.37          | NOK | http://autobuild.buildroot.net/results/525eecb72d267d4a774d1d8f414b9ea8209879ee | ORPH
    arc      |         linux-5.15.37          | NOK | http://autobuild.buildroot.net/results/62afaa13ddca13c97612b38288ca188177467dc9 | ORPH
    m68k     |         linux-5.15.37          | NOK | http://autobuild.buildroot.net/results/4999dc600091a33041bedc21381de7b20e822ad8 | ORPH
  powerpc    |         linux-5.15.37          | NOK | http://autobuild.buildroot.net/results/dfbbea6902de4d9ec6897591a24e6bffecd0337f | ORPH
  mips64el   |         linux-5.15.37          | NOK | http://autobuild.buildroot.net/results/0c7d16fba40dfe896e782284e1eb2a1c4edd1749 | ORPH
 aarch64_be  |          linux-tools           | NOK | http://autobuild.buildroot.net/results/a6a8cbf78f5b7a8dc432cd156d8575503805fdc4 | ORPH
 powerpc64   |          linux-tools           | NOK | http://autobuild.buildroot.net/results/bfdfd1f771a525e04e58ad3ba105b9e2fb6a0442 | ORPH
   x86_64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/0a0efa6b359c6b8a8c273a3b08eb88ac58865a89 |     
    arc      |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/0442bfe7a988af170e19a29ff8b7360cc72161cb |     
  powerpc    |           musl-1.2.2           | NOK | http://autobuild.buildroot.net/results/282d90bed1b2972b781e5d5552483ddf8af8fef1 |     
    arm      |          mxs-bootlets          | NOK | http://autobuild.buildroot.net/results/cbd93ca4a4a4415bea02ed864d3b4d0b59d0f70f |     
    arm      |          ndisc6-1.0.5          | NOK | http://autobuild.buildroot.net/results/659e31b7de7fedee0c692595d1e3bceae339fe51 | ORPH
  aarch64    |         netdata-1.33.1         | NOK | http://autobuild.buildroot.net/results/b2d08154aec0c7f1fbddddab2ccbc424069c1722 |     
   mipsel    |         nodejs-14.18.3         | NOK | http://autobuild.buildroot.net/results/14036bac73e5c00597566f04ec18c80c5ff99953 |     
  powerpc    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/01e6c6f651c93ba1f1d32c4129f78333aa920302 |     
    sh4a     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/553adb5fd76e51984e804a5fc8e7ac3e220262d9 |     
  powerpc    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/35dfa1c4f85568811138b022689e61ae97ecbf02 |     
    arc      |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/29589c409fdaae6591c1443c854e9b3541aeed83 |     
microblazeel |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/ef925c5d3e4da8700e915d91fb4b47ae17836730 |     
   sparc     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/57b34eede53858f5835d257ac42e137212c1f729 |     
    arc      |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/3ad2107139e825d83915977ebf31b6d391648110 |     
    arc      |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/79852021ed6001783ce190cbcc1468f72c92ed24 |     
microblazeel |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/c9ec1f9075cfae55c9108d5095976f8378d7ae92 |     
 aarch64_be  |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/b18aa43fcd89660a31c95c1f3a8d76426a2ee447 |     
    i686     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/95f3502fd69faf0383c6ae6ab8e12d5506cd9c95 |     
   mipsel    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/c02baca1bfd3340acb26660c50450dec01fe2245 |     
  riscv64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/fb7696c21801597b5eacab965050884480c20a51 |     
  riscv64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/96b9b091606d34e228ff668a7764652bb9f9c943 |     
    arc      |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/cfe4e090cd03bcc8078b3310f735f27324f688e4 |     
microblazeel |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/0b385beee89c78278d8c8c0292927d2b8ce51006 |     
    arc      |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/badadb97d06221ceacd42c25368690717bbcb25b |     
  aarch64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/462cb636ff46ef8e139ec421ddd155828f05df6d |     
   mipsel    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/00546b61a25d8089983a2107fde545aca7bb3d88 |     
  riscv32    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/b47962b7a601a93e064e5254a986eed6306d864d |     
   armeb     |           opus-1.3.1           | NOK | http://autobuild.buildroot.net/results/0333a924d5a42c536bdeb0528f8dc069ce810451 | ORPH
    arm      |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/afc89a23fd696f56b312fd394fff58feb6f0bc1a | ORPH
  mips64el   |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/26005ac69e8525d00def84ab8b1866e5f2b76278 | ORPH
 powerpc64   |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/3cca85d28b23d1cb8ce7bb6a359dae5e59094469 | ORPH
  mips64el   |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/68e3f06d0abeca17ccc3d0b40d7e7d3845d8dece | ORPH
    arm      |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/fe436bb2d94e393bf4de4a0b2944fad3cdaff39f | ORPH
    arm      |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/8357310d4c7569d237f2a679d84e40009ea61f34 | ORPH
    arm      |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/d4c695a17f9b90d27fc885793e2a98c279cecd43 | ORPH
   arceb     |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/c4e38f5dfe7fe12f121bace9e3d47094d625d1cf | ORPH
  mips64el   |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/af41e8b550162c3336e6e7c04c46691732c4050b | ORPH
    i686     |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/fbd560f063cf9e89d4fad74aceff92b23ef08626 | ORPH
  mips64el   |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/af868b5e731ab08cf76d851ece5f0d902e02b3cd | ORPH
microblazeel |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/9769bb0f9f6c11aee55cc0927b89bff7c043d7c6 |     
microblazeel |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/6125451475deebfb37ba805ff4779a6a9c179b8c |     
    or1k     |        pipewire-0.3.50         | NOK | http://autobuild.buildroot.net/results/c93ee8fc7822604c1b3203c7c56896356a37efb5 |     
   arceb     |        pipewire-0.3.50         | NOK | http://autobuild.buildroot.net/results/3930bff0a0db5836a39c0d90d96d2415885f094c |     
    or1k     |       pkcs11-helper-1.28       | NOK | http://autobuild.buildroot.net/results/26e869f1ebfe0f40899735fcce254021eb1c8a4d | ORPH
powerpc64le  | polkit-a2bf5c9c83b6ae46cbd5... | NOK | http://autobuild.buildroot.net/results/4e39aaf874b5eacf768ec2b7a1e6ca67bf8ecd35 |     
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/4983be30d55ec0edbdac3b2195d6b1b1fe6af9ab |     
   nios2     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/a52f4a5d388aa17f82f030d146be5bf9ab0651ed |     
microblazeel |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/c4cbba3c29d0e8f35fc16a39096c37cf18feac40 |     
   nios2     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/af046010a28f0711f841ac8b9e3a403d32eeb668 |     
   nios2     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/02a24799aa135881082cb9aea7668b81e506a446 |     
   mipsel    |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/8cf7a9346c24a0047c7635d68e749e208f70752d |     
powerpc64le  |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/578eadfaa41db4a6088f6d56ad9cec573032e66e |     
    sh4a     |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/cb16f721e0298fe8f8f79f214bfb9414266b2d4e |     
  mips64el   |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/b66b0aae313476997e5d7e152f47561313555d75 |     
  aarch64    | qt-webkit-kiosk-a7720e50f2b... | NOK | http://autobuild.buildroot.net/results/72d7f85896aa369d763043f07b33acccf4d868c1 |     
    or1k     |           refpolicy            | NOK | http://autobuild.buildroot.net/results/362207d145371d635b4a17b3f8a4783ef673a944 |     
microblazeel | rtl8189fs-73f826f0fa74b2fc1... | NOK | http://autobuild.buildroot.net/results/a5cd8cecb4eb2404909032c26be4ea8d00654c57 |     
  sparc64    | rtl8723bu-19b4bdc05483a1e79... | NOK | http://autobuild.buildroot.net/results/e201ace89c8de0b534b47190da25a04bba7f0a8e | ORPH
   s390x     | rtl8812au-aircrack-ng-3a640... | NOK | http://autobuild.buildroot.net/results/e58c963aa9a5d2c7bdd4f89262aba516b011049f |     
   s390x     |       s390-tools-2.21.0        | NOK | http://autobuild.buildroot.net/results/e12bace34870a33b68eb5759cece051aaaf5c1f9 |     
    m68k     |         sg3_utils-1.47         | NOK | http://autobuild.buildroot.net/results/643fc9b895dd86bfa876a2657d365ca6f99d8e97 |     
 aarch64_be  |           shim-15.4            | NOK | http://autobuild.buildroot.net/results/a6c7dd171529e2a7b7a26af8d99bec53117a7a02 |     
    or1k     |          sngrep-1.4.7          | NOK | http://autobuild.buildroot.net/results/a10be6947d3506e5278b75d576c6c1662d79eb39 | ORPH
 aarch64_be  |          sngrep-1.4.7          | NOK | http://autobuild.buildroot.net/results/9d19c132ec57516254ada7e9d08a603df672d959 | ORPH
   sh4aeb    |          sngrep-1.4.7          | NOK | http://autobuild.buildroot.net/results/34193d7bdcb0cffa62ba41e38457a46290265934 | ORPH
 microblaze  |        tcf-agent-1.7.0         | NOK | http://autobuild.buildroot.net/results/bb76de3726e54fe3061d617c73f60665efd78c2c |     
   s390x     |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/1f01eae6683f585415252d71b172fc3ad7faa886 |     
   mips64    |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/ea482ac346c63754ef94c09e9f91be4061db4383 |     
  sparc64    |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/2f7e08c114d376c8bfa92d18bc6d93e85ffd5a73 |     
   armeb     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/884993356eee8865e7f4ad0cc0a0cbeccadebe1e | ORPH
  mips64el   | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/78c5fcd0c5e64dd5f0a2403e9193cf8f1718d46c | ORPH
   mips64    |          tor-0.4.7.7           | NOK | http://autobuild.buildroot.net/results/d86a10902601f4b377caac41a5fe4cb3dbd02e16 |     
  powerpc    |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/66c0bc3fcd843294f00cb7c45ed7457a6f4db72f |     
  sparc64    |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/fee2dd537d185cd10fb86150a07c65ad1e0921d8 |     
   sparc     |       uccp420wlan-6.9.1        | NOK | http://autobuild.buildroot.net/results/a7f6c867ae531eff44c6ced3be0e291059a4406f | ORPH
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/d6538d721576b47ed6ee6407a1fd8e2b160abf07 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/c005d74e7b1e762371931b6a6fe021dc3f890948 |     
    arc      |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/7590d903f9cce77913544a9f2cac3378e33b0ae1 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/d5e5843018883a8ec313f544d9665f249fc63d70 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/d18b5c56e9c14a910ec7f4d30bd165ed4a3471e3 |     
   arceb     |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/041b068f2716083e3a3364ef92ee229f0553cebb |     
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/efe69a4c4de203b0d5f5a077a31579f68695d5e1 |     
  powerpc    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/fcb3b1a4c9860a6c40b4079de36894669b0f364a |     
  aarch64    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/10c735c45507a7c8b3384a48f994aab91ccaf598 |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/729d42ccaf0a6a4548fb06f140387b406d70762a |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/bf6d8ca74e1862eda131e7732aa674eb704f0970 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/1da95de34a5d31b749436ff715db55a97a67612c |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/4ad59bca68a6d2f0c03763d4c8571b04ef8f058f |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/37edbae38c334283c709ba2e47a8a071c2dacfe6 |     
   mips64    |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/6c410fd35fa042160c301fbba7f95e6386cd1302 | ORPH
   nios2     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/24b65cd61fce904910ba5c96b922fdbd76c78b34 |     
microblazeel |            xenomai             | NOK | http://autobuild.buildroot.net/results/c6be12a660f7ebf7e8a2b64edded0a3f30365888 |     
 microblaze  |         xenomai-custom         | NOK | http://autobuild.buildroot.net/results/bb7e595703249c4c91c65d697e1103dfe47f1f6f |     
  mips64el   |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/6b76de5c83e26d52230d1ca8e6f1c3cfec94eb83 |     
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/8fe25dd2812bf468a11e54035a729e4f189afb82 | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/eb8392d3694b138c973c340194f5b8444aa8e44a | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/563f6144e241eb639752418da08ceea00bc870c1 | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/0b331b16f99b9d57c141124c7d00cf120031ed64 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/e0e70d36f50dd0f826c42a08f17b34fd71c57ef5 | ORPH


Classification of failures by reason for 2022.02.x
--------------------------------------------------

tvheadend-1295dd2be863f5beb... | 4 
                    dhcp-4.4.3 | 2 
                   perl-5.34.0 | 2 
                       frr-8.1 | 1 
                 gtkmm3-3.22.0 | 1 
             host-gtest-1.11.0 | 1 
                 mesa3d-21.3.5 | 1 
                       unknown | 1 
                 wavemon-0.9.4 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |           dhcp-4.4.3           | NOK | http://autobuild.buildroot.net/results/c4389af58b2d7ec313aa6b9ef95acbc8d11c128f | ORPH
  riscv64    |           dhcp-4.4.3           | NOK | http://autobuild.buildroot.net/results/fccbd012e52edb88377a16ade798615703a1f930 | ORPH
  mips64el   |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/44c8c79b9943153e05ffd457c0ec008da24dbd50 |     
   x86_64    |         gtkmm3-3.22.0          | NOK | http://autobuild.buildroot.net/results/a8c14deebe26306f761d0c8f4d162f27fe52f22c |     
    arm      |       host-gtest-1.11.0        | NOK | http://autobuild.buildroot.net/results/da37f056e88c27c1a3a8322255eec782c1abecdc |     
    arm      |         mesa3d-21.3.5          | NOK | http://autobuild.buildroot.net/results/28d2c7a75dced26b43b9823619ab3e8a2f38054e |     
    arm      |          perl-5.34.0           | NOK | http://autobuild.buildroot.net/results/eebcc00fa541a26f48b83fa1439a5a399b3c8b14 |     
microblazeel |          perl-5.34.0           | NOK | http://autobuild.buildroot.net/results/0ed3d26655dcd1aeb9196ebef0f1f4b9759da349 |     
   x86_64    | tvheadend-1295dd2be863f5beb... | NOK | http://autobuild.buildroot.net/results/ca52f03c0fe976340354be0e26bd0241489311a9 |     
   x86_64    | tvheadend-1295dd2be863f5beb... | NOK | http://autobuild.buildroot.net/results/c941d485cbb1519893fb7f8641a03a2598b21482 |     
  powerpc    | tvheadend-1295dd2be863f5beb... | NOK | http://autobuild.buildroot.net/results/60a4720bcf08caacdc95b1c93548c7235d5e10a7 |     
    or1k     | tvheadend-1295dd2be863f5beb... | NOK | http://autobuild.buildroot.net/results/55c443f459af9dad992acead1b4442268eb4e17c |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/a08b981deec299c59c97eddfc2abda6dbef4237e |     
  powerpc    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/8d6779d15c1e885f9a953c381698b481545efe41 |     


Gitlab CI results for 2022-05-10
================================


-- 
http://autobuild.buildroot.net

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

