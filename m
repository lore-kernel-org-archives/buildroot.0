Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA2A4C433F5
	for <buildroot@archiver.kernel.org>; Sun,  1 May 2022 04:41:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 426C340493;
	Sun,  1 May 2022 04:41:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fuh4UsCNeCQm; Sun,  1 May 2022 04:41:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E1C2C4015A;
	Sun,  1 May 2022 04:41:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CEF9A1BF3E9
 for <buildroot@lists.busybox.net>; Sun,  1 May 2022 04:41:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B1F924015A
 for <buildroot@lists.busybox.net>; Sun,  1 May 2022 04:41:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AKMYsn804FiR for <buildroot@lists.busybox.net>;
 Sun,  1 May 2022 04:41:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6F31240135
 for <buildroot@buildroot.org>; Sun,  1 May 2022 04:41:25 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E7269C000A
 for <buildroot@buildroot.org>; Sun,  1 May 2022 04:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1651380083; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=bigD/YPG6bRNa+ttXocsWu7Dtid2kDGCurrywUXGYkA=;
 b=S7sscXpHYxb1YeQj5lHvb4pflKGr8oned0+yu9Cezj94/Dzlw3rPEW9v3Be8LswLVtJNbr
 H1wWs1YEAJ/otzcoXKvyXBgOPJ3MBoxw9nxxUswxGJYkPaFZoh+ogXuL5awTq2UXBmMCBs
 iyq3nvZaCn8NzUPdPuVDQWIOkXYsg7uVmSehJhX4/uP+GRDNTxA/RZSuMyIZe6nQjXF/gL
 SxGuPgFh+k7Vm5JQFLP4/z43qgkyyKgBHLX+ToV5iuzSfg5mI1tYWyeZLXeX69NCGJz5HU
 NfVQq84LLmuHuOqZja3+mdRHSM9+WlmaIWaGrp1YmGECCMvB9b0q7Ll9GozMIQ==
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sun, 01 May 2022 04:41:22 -0000
Message-Id: <20220501044129.B1F924015A@smtp2.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-04-30
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

Autobuild statistics for 2022-04-30
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  | 24  |  6  |  0  | 30  |
    master   | 153 | 260 |  1  | 414 |

Classification of failures by reason for master
-----------------------------------------------

           optee-client-3.17.0 | 19
                  zchunk-1.2.2 | 13
                    git-2.31.2 | 12
               protobuf-3.20.1 | 12
         host-gcc-final-10.3.0 | 11
             libopenssl-1.1.1n | 11
                 uclibc-1.0.40 | 8 
                libressl-3.5.2 | 7 
    python-cryptography-37.0.1 | 7 
         linux-headers-5.15.33 | 6 
                pciutils-3.8.0 | 6 
                  bcusdk-0.0.5 | 5 
                     refpolicy | 5 
                host-go-1.18.1 | 4 
               pipewire-0.3.50 | 4 
                 zlib-ng-2.0.6 | 4 
                    bat-0.19.0 | 3 
                busybox-1.35.0 | 3 
         host-gcc-final-11.2.0 | 3 
             host-pahole-v1.23 | 3 
               libglib2-2.70.4 | 3 
                 libv4l-1.22.1 | 3 
            qpid-proton-0.35.0 | 3 
               target-finalize | 3 
                 wavemon-0.9.4 | 3 
                alsa-lib-1.2.6 | 2 
                 dash-0.5.11.5 | 2 
                elfutils-0.186 | 2 
                  faad2-2.10.0 | 2 
                     frr-8.2.2 | 2 
glibc-2.34-109-gd64b08d5ba7... | 2 
               gocryptfs-2.2.1 | 2 
          host-gcc-final-9.4.0 | 2 
              host-rust-1.60.0 | 2 
                 libldns-1.8.1 | 2 
   libtorrent-rasterbar-1.2.15 | 2 
                libzlib-1.2.12 | 2 
                   perl-5.34.1 | 2 
            quickjs-2021-03-27 | 2 
                  tor-0.4.6.10 | 2 
                       unknown | 2 
               acpica-20200717 | 1 
               aircrack-ng-1.6 | 1 
               apcupsd-3.14.14 | 1 
                    apg-2.3.0b | 1 
                  assimp-5.2.1 | 1 
                   atftp-0.7.5 | 1 
                     bc-1.07.1 | 1 
                bitcoin-0.21.2 | 1 
                    brltty-6.4 | 1 
              bubblewrap-0.6.1 | 1 
              containerd-1.6.2 | 1 
              dieharder-3.31.1 | 1 
                  exempi-2.6.1 | 1 
                   flann-1.9.1 | 1 
             flare-engine-1.12 | 1 
fs/axfs/axfs.mk:32: /home/a... | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/cramfs/cramfs.mk:46: /nv... | 1 
fs/cramfs/cramfs.mk:46: /nv... | 1 
fs/ext2/ext2.mk:65: /nvmeda... | 1 
fs/ext2/ext2.mk:65: /nvmeda... | 1 
fs/ext2/ext2.mk:65: /nvmeda... | 1 
fs/f2fs/f2fs.mk:64: /nvmeda... | 1 
fs/f2fs/f2fs.mk:64: /nvmeda... | 1 
fs/f2fs/f2fs.mk:64: /nvmeda... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
                gnu-efi-3.0.10 | 1 
         gobject-introspection | 1 
  gobject-introspection-1.70.0 | 1 
       gst1-plugins-bad-1.20.1 | 1 
              host-delve-1.8.0 | 1 
          host-gcc-final-8.4.0 | 1 
              libgcrypt-1.10.1 | 1 
                libmdbx-0.11.7 | 1 
                   libnss-3.77 | 1 
                libssh2-1.10.0 | 1 
           libvncserver-0.9.13 | 1 
                 linux-5.15.33 | 1 
   linux-headers-5.10.104-cip3 | 1 
                     lz4-1.9.3 | 1 
 Makefile:732: target-finalize | 1 
                    musl-1.2.2 | 1 
                net-tools-2.10 | 1 
                nodejs-14.18.3 | 1 
                       opensbi | 1 
                    php-8.0.18 | 1 
            pkcs11-helper-1.28 | 1 
                    pppd-2.4.9 | 1 
      qt5webkit-5.212.0-alpha4 | 1 
                  ramsmp-3.5.0 | 1 
ripgrep-af6b6c543b224d348a8... | 1 
rtl8723bs-11ab92d8ccd71c80f... | 1 
                    ruby-3.1.0 | 1 
       shadowsocks-libev-3.3.5 | 1 
                  sngrep-1.4.7 | 1 
              syslog-ng-3.35.1 | 1 
                 systemd-250.4 | 1 
    toolchain-external-bootlin | 1 
toolchain-external-bootlin-... | 1 
ulog-0389d243352255f6182326... | 1 
                  vlc-3.0.17.4 | 1 
                 wolfssl-5.2.0 | 1 
                       xenomai | 1 
                xenomai-custom | 1 
                  xvisor-0.3.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |        acpica-20200717         | NOK | http://autobuild.buildroot.net/results/c0b5cb23f8da40e6d063800f962e6e5afa0b7caa |     
  aarch64    |        aircrack-ng-1.6         | NOK | http://autobuild.buildroot.net/results/d8444dada84a54205273ac627d3e4f4692a55364 |     
    m68k     |         alsa-lib-1.2.6         | NOK | http://autobuild.buildroot.net/results/b04401f30b6e6d7dc8dab640742860a7e3bf8c03 |     
    m68k     |         alsa-lib-1.2.6         | NOK | http://autobuild.buildroot.net/results/7c5bfd0dc8b9ccdda4e9b887f918f3a857f0d063 |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/326fe5b4335d45b3ebc933b4a110959c906679fb |     
   mips64    |           apg-2.3.0b           | NOK | http://autobuild.buildroot.net/results/81cf18f1d8debef453cd759ff8eaa9a6760e2e85 |     
  riscv64    |          assimp-5.2.1          | NOK | http://autobuild.buildroot.net/results/00eb31d01e4c43dcc8bd7adc86e601620f95360d |     
    m68k     |          atftp-0.7.5           | NOK | http://autobuild.buildroot.net/results/5afb38fae881aa842f204feb94cdc26c16066cba | ORPH
    i686     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/a56fce331cd7ee2c028562a37b00699ac0e29cda |     
    arm      |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/5d43a825de902b1c6c49fb257d5200a17ccf6491 |     
    arm      |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/7ab6e601236f901fca1589d098f128fe647d5c72 |     
  riscv64    |           bc-1.07.1            | NOK | http://autobuild.buildroot.net/results/ff53a9997d56db6d8bad0da2734159b819cdd849 |     
    arm      |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/f35ef1904d00e8027f98beb3e9d0d69ef8858f7a |     
  mips64el   |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/7a0649b757d836437a7b15e2977b9532bcdade85 |     
    arm      |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/61bd2e023999ed78ddce14603e62ea8f91a41314 |     
  riscv64    |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/7be49f4b261d7fb15fa8b03c3c3a52312b022d47 |     
    sh4      |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/db2e9113e4ee720a7cc5a3b34b999efc826f5c1e |     
  sparc64    |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/d207ae6e4dfe0276134ade09b2ea43d9eacb5c1b |     
 microblaze  |           brltty-6.4           | NOK | http://autobuild.buildroot.net/results/41b66c6ec74444f665b343bca5fee7fc65aaf510 |     
   mips64    |        bubblewrap-0.6.1        | NOK | http://autobuild.buildroot.net/results/84e0ab12f00cb32bf8370f7d90a26aa7634224b3 |     
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/a8ba271f0f02cd3436597569661b038f51c19598 | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/3251da43e5854cee4118b63efa7d5baf8c037dd2 | ORPH
    m68k     |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/fc0d1ed425fcfac324da9b3993945f64ea0c76df | ORPH
    i686     |        containerd-1.6.2        | NOK | http://autobuild.buildroot.net/results/1068cd91c1ce0f5201b10b34579194e2588641d7 |     
    arm      |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/1ea515c6d7aa17dcc9e5ff1c124b9679ae986f80 | ORPH
  mips64el   |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/90c70bfed60eebea29585eca0069d230420a7454 | ORPH
microblazeel |        dieharder-3.31.1        | NOK | http://autobuild.buildroot.net/results/a3c38da1b280eb0b4aa149e8eafc19ad8b884d69 |     
   arceb     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/f4aafcdc95a2491043ba3a7c75cb37c7453e071b | ORPH
   arceb     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/dea4cdb6e7bf62c20508d147f385ccb3cebd9c98 | ORPH
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/6410e966f3babca2119180d6d676ea0052fffb36 |     
    sh4a     |          faad2-2.10.0          | NOK | http://autobuild.buildroot.net/results/d3d350a5b779d982819865f99f923138a54edc94 |     
   sh4aeb    |          faad2-2.10.0          | NOK | http://autobuild.buildroot.net/results/8fc0f64be342a55c2395bc42a067d7b9d7bd2625 |     
   mips64    |          flann-1.9.1           | NOK | http://autobuild.buildroot.net/results/644e8a37d4c5ac6a3d969a8980953258457c2d68 |     
    mips     |       flare-engine-1.12        | NOK | http://autobuild.buildroot.net/results/b8a90681c184039bd12bc50e2b65c0b6f287a9ae |     
   xtensa    |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/ad36ef9c93a9a9b5328599888c13b1c46b523871 |     
    arc      |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/b0b011e2cf4e640eab2107537515f6f77a74a73b |     
   armeb     | fs/axfs/axfs.mk:32: /home/a... | NOK | http://autobuild.buildroot.net/results/c4135ebcf0a7afd568eb4094ba183198d5d81228 |     
    i686     | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/c902e04cbf808a02279f170dafbc8ad878d17e8b |     
   nios2     | fs/cramfs/cramfs.mk:46: /nv... | NOK | http://autobuild.buildroot.net/results/d771a9dd645a91cf0be0b6f9af7dace18dfe684a |     
    sh4      | fs/cramfs/cramfs.mk:46: /nv... | NOK | http://autobuild.buildroot.net/results/20d5e2bde59da5e9ae70567d0bc1a64676b449b8 |     
  mips64el   | fs/ext2/ext2.mk:65: /nvmeda... | NOK | http://autobuild.buildroot.net/results/df9348b4aadda6bc0a1f5ba0014d6705b112d788 |     
   arceb     | fs/ext2/ext2.mk:65: /nvmeda... | NOK | http://autobuild.buildroot.net/results/33b0d744db985530b78d96d216cd2029dfabd3b2 |     
 powerpc64   | fs/ext2/ext2.mk:65: /nvmeda... | NOK | http://autobuild.buildroot.net/results/34028761046bc8fdcdc4625ad5e9e6d44b1e8582 |     
   armeb     | fs/f2fs/f2fs.mk:64: /nvmeda... | NOK | http://autobuild.buildroot.net/results/a550bff10fc7470009ed2555b7821dca214bf1f4 |     
  powerpc    | fs/f2fs/f2fs.mk:64: /nvmeda... | NOK | http://autobuild.buildroot.net/results/fc59b979f7b9682fca249aa36d09b1aef1664854 |     
 microblaze  | fs/f2fs/f2fs.mk:64: /nvmeda... | NOK | http://autobuild.buildroot.net/results/ed386ef609685d47e09fefd7d42f99bd1f8acd10 |     
  powerpc    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/4a48cbf665fa2b0a9d24e5090ccdcf0ee5e41fec |     
  sparc64    | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/85ab91fdf0bef37f24f0b4077c973ce94e6cf007 |     
powerpc64le  | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/fd49b493edab582221f7c6ea7e57f0d7dff6499f |     
microblazeel | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/4178055162e3de4aee3ab57055641604f86832b8 |     
    m68k     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/4bb6523dc704e2e027bb5e5e9a686152bc871490 |     
    i686     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/0fcd6c60f6cf18a771a373d4ac4fba06eac0dce8 |     
  mips64el   |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/12e3fe3b74f3472177b6f1cdfdb9340fddff0369 |     
 aarch64_be  |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/82670cb5f2ec068d92081edd336dfdee0f04dc8e |     
   sparc     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/4bd40f78b198946c680f2a55b93469a498ce5aec |     
   armeb     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/b310c041a64537cbec82feb0a309499e4dc4f6f5 |     
 microblaze  |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/f95df52c0a67d2530b1769b4636bb50755c5ff8b |     
   sparc     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/30a111966f255478f2dac2e0123105cd5e52f624 |     
    or1k     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/0fc2830fdfafb46c872abdaade6d6b651efbfa69 |     
    or1k     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/8840536e1dbb91919c73b56919d4c52d2f5b5002 |     
    i686     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/cd662081d957863acacd479a7055f750334c10bb |     
 microblaze  |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/06aa0b0b51093538a005af976988faa4fd6addfc |     
powerpc64le  | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/b2934dbef5da9f9c0507eff57bb23b769e1683c3 |     
   nios2     | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/3b4a37e96d3f691290aedcdd8e39ce2f0ce0dfee |     
    i686     |         gnu-efi-3.0.10         | NOK | http://autobuild.buildroot.net/results/17f7bf0dc9abcb263a1759e5af799289cb9b192d |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/ae69c3a25b374ad5e47cc01f1a6cd3faee5cec73 |     
   x86_64    |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/fdb5f5b8937615b3891147e2382a2d576975193c | ORPH
  mips64el   |        gocryptfs-2.2.1         | NOK | http://autobuild.buildroot.net/results/7b365b9644a236533c98d849b1dae5e4c1a638ab |     
  aarch64    |        gocryptfs-2.2.1         | NOK | http://autobuild.buildroot.net/results/2f2ab450fc828494dfbc06bad6c06fe40af30f0c |     
   nios2     |    gst1-plugins-bad-1.20.1     | NOK | http://autobuild.buildroot.net/results/e10110311a188960ddb3c83cf7558de95a2bb6a2 | ORPH
    arm      |        host-delve-1.8.0        | NOK | http://autobuild.buildroot.net/results/1186bc2f876ca73649e7a516e141830e1989ef9e |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/230eb30dc10651a7991e0fc134dc443426dc25f6 |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/a69d4c55bd82d6670058530b3a198eacefae47e1 |     
    i686     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/45011139756f99f14421b8fc1fcf5fd4f0ded670 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/e9d444b1e9abdc2b33663fce242119340e35bba6 |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/e17812e189d03da01b09c7511c1a81f1670947a4 |     
microblazeel |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/906d6c53b644375e7056b630b1265f197d48c772 |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/c37e32b4b04036d3a02c72f2c33cb9ee5590004f |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/611d61dfbad84ba7747782ad7ec594e9bf9e7349 |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/d439dc6c503735dcb4eed071d603fcdcc49de311 |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/73e033ea77080313b9acba1a1882fd5fac048900 |     
  powerpc    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/bbd2535858c92fcc9df51f884ef10496aed9a19a |     
    i686     |     host-gcc-final-11.2.0      | NOK | http://autobuild.buildroot.net/results/cab10620bb5de41ffcde082e896b98fdca19a404 |     
  sparc64    |     host-gcc-final-11.2.0      | NOK | http://autobuild.buildroot.net/results/f31a3a15e9f9e66417130cb129e2c5da0a2bfc09 |     
   nios2     |     host-gcc-final-11.2.0      | NOK | http://autobuild.buildroot.net/results/e31a16e37d9357da37710c63fd07e3036e4043f9 |     
  powerpc    |      host-gcc-final-8.4.0      | NOK | http://autobuild.buildroot.net/results/c13abf04ada76f1421a74aa2b5bf041a148115ef |     
   nios2     |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/45aa410154e8639e1145f9510379e43010d5316e |     
   s390x     |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/d477390b98e57537094f314afd74d07f33c068f2 |     
   mips64    |         host-go-1.18.1         | NOK | http://autobuild.buildroot.net/results/9ea536b421ffe7d783154aba57741b7ddf773ca0 |     
    i686     |         host-go-1.18.1         | NOK | http://autobuild.buildroot.net/results/0423ad6c57cdb06c361775baddc63c2cfa5afd80 |     
  aarch64    |         host-go-1.18.1         | NOK | http://autobuild.buildroot.net/results/1439e74e44d85518ab3a9d712f1b12604c9f2c95 |     
  mips64el   |         host-go-1.18.1         | NOK | http://autobuild.buildroot.net/results/6a7e7c86401b1fda5a50779d33907994fe39b788 |     
   x86_64    |       host-pahole-v1.23        | NOK | http://autobuild.buildroot.net/results/5d5114dd687a252f1628919bff68bc3f3477b2a2 |     
   mipsel    |       host-pahole-v1.23        | NOK | http://autobuild.buildroot.net/results/7d7ba3118ed29df00d1a400fc073472374b01cdf |     
  riscv32    |       host-pahole-v1.23        | NOK | http://autobuild.buildroot.net/results/57afd3131dd254c7239fc75880aa3edf8d268a5f |     
   armeb     |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/42808281805b624d410e87316e3890b4e01a3069 |     
 powerpc64   |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/d83eba51b94571830887c5452152462e8e16c8b7 |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/8ad4974bf21c962972c2d741a09d03d4954631da | ORPH
    arc      |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/a2e1b09742eb87e4426956882842ee468e6e4e3c |     
    arc      |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/15bf30c4af49dcd8b6bdb2fea4ea55a965ab37d0 |     
    arc      |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/3d155046e97c54b703a3b0cb588b9b1e261c68a6 |     
powerpc64le  |         libldns-1.8.1          | NOK | http://autobuild.buildroot.net/results/20af864a86618bfd584a55b5fa68d28e90507b6c |     
    or1k     |         libldns-1.8.1          | NOK | http://autobuild.buildroot.net/results/31c11f82f5ca6cd1386643d3dc5f738125e587ac |     
microblazeel |         libmdbx-0.11.7         | NOK | http://autobuild.buildroot.net/results/0c52d3202854526de35770df6f580f9b4ad4c588 |     
powerpc64le  |          libnss-3.77           | NOK | http://autobuild.buildroot.net/results/505d72a62ddc6507cb2cced18ce639c5fdafdbb8 |     
microblazeel |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/c2f15698c154087d203607fcfa9d571d6fb8178c |     
microblazeel |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/6f2e5db39de473e3d94969fe5911e920b6aebd00 |     
    m68k     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/a3d1578fca2d326c7bb867c9f32bd17b5a618f68 |     
 microblaze  |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/cf875fa8352729a800ba3b19f9c3797afc08d827 |     
    arc      |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/e22dd1a54c8e1a4a2763fc44d13e9e08faed9d3b |     
    arc      |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/15ac1f739513da8f16c2863ef7f75c19943a541e |     
   sparc     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/2217358c6d0616b6f67f3d070c6f4d279b4d34ce |     
   xtensa    |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/ef4ac971868b90450e02bb8380e4403d99b9c742 |     
   sh4eb     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/3b6b6dde56eaf6fcf00a8e144f4e350ec37397c5 |     
    arc      |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/5e7602189b23d60ae13bb26e51f2ab4ce2cf8939 |     
    m68k     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/3a427a009ae054df5e12c147e64b64374066b478 |     
   sparc     |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/26083235b038d1dbe895f7a645dadc61cf116e51 | ORPH
 aarch64_be  |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/f908dbeebc021fab3ded45ec55c3785e976e10ad | ORPH
microblazeel |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/fc82677e4eda36df39ee07852331c6a33b3c7f43 | ORPH
    m68k     |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/2e13a36bb5e4440783dfcf389da5a40f2530b16b | ORPH
   arceb     |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/fe3d434561b0a18afd1f700626fe44df8ad73ba5 | ORPH
   armeb     |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/12a47fda12ada4f7a80870276c8fc03895fb52c1 | ORPH
   sparc     |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/a996821ce7b6576ca0edd21daf16ace911940e80 | ORPH
   mipsel    |         libssh2-1.10.0         | NOK | http://autobuild.buildroot.net/results/8a1e62dcd71f7d044b6325a322e1c520fd144dcc |     
    arc      |  libtorrent-rasterbar-1.2.15   | NOK | http://autobuild.buildroot.net/results/e0da6acd4ea537ad268fb09f5f48db78d48f15f9 |     
    mips     |  libtorrent-rasterbar-1.2.15   | NOK | http://autobuild.buildroot.net/results/b9393aec27a4f8ace258ee64e0bdb8aeb4ca81c6 |     
  powerpc    |         libv4l-1.22.1          | NOK | http://autobuild.buildroot.net/results/d6efe14f7ee1b46962b3b21f42b40b4d2f11297d |     
    arc      |         libv4l-1.22.1          | NOK | http://autobuild.buildroot.net/results/4d83a34dfe2ff295baeeda44d1ab7bd15804823b |     
  mips64el   |         libv4l-1.22.1          | NOK | http://autobuild.buildroot.net/results/f5a055e689a672aac123ee61a4ca2f1705e487bc |     
   mips64    |      libvncserver-0.9.13       | NOK | http://autobuild.buildroot.net/results/b14f15ecd27673a5294e91bb18ca727ac75bb8f9 | ORPH
    m68k     |         libzlib-1.2.12         | NOK | http://autobuild.buildroot.net/results/4fe5112d4c61a8c1a7785e0714115a1e3fb62491 | ORPH
    m68k     |         libzlib-1.2.12         | NOK | http://autobuild.buildroot.net/results/f6656782911f2037ae0535e13f6b2ab2a5c3248e | ORPH
   armeb     |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/9dacaf9dd582813701582be9497768fb688a2748 | ORPH
    arm      |  linux-headers-5.10.104-cip3   | NOK | http://autobuild.buildroot.net/results/baf61704014b42b8f91ef47bccb15bf1c252b067 | ORPH
   sh4eb     |     linux-headers-5.15.33      | NOK | http://autobuild.buildroot.net/results/1110201dc6c7100a31323768066501811469faf5 | ORPH
   mips64    |     linux-headers-5.15.33      | NOK | http://autobuild.buildroot.net/results/69a9b92651883d737854a95fae81d639ecc4d80a | ORPH
microblazeel |     linux-headers-5.15.33      | NOK | http://autobuild.buildroot.net/results/e7603475de120673353134c398a359f857aa3980 | ORPH
  aarch64    |     linux-headers-5.15.33      | NOK | http://autobuild.buildroot.net/results/eb0ed7700821b7c44973f1fb018852dba1be0150 | ORPH
  powerpc    |     linux-headers-5.15.33      | NOK | http://autobuild.buildroot.net/results/95471ecd547b616494f5806bc1c89e0c0814ea80 | ORPH
 aarch64_be  |     linux-headers-5.15.33      | NOK | http://autobuild.buildroot.net/results/df615aaabc02bbbbb6e6d4938fbdb84cc43030da | ORPH
 microblaze  |           lz4-1.9.3            | NOK | http://autobuild.buildroot.net/results/f36a18b30e359caeda1b501133ef238e30c5ddd7 | ORPH
powerpc64le  | Makefile:732: target-finalize  | NOK | http://autobuild.buildroot.net/results/0c662a8a3be5367109065aa23d77ed4cd955dea2 |     
  powerpc    |           musl-1.2.2           | NOK | http://autobuild.buildroot.net/results/960e57adf6804f49cfc897681c35c18b8944a15e |     
    m68k     |         net-tools-2.10         | NOK | http://autobuild.buildroot.net/results/a4021d8ca3906f1c4d5582236882398c8f97b487 | ORPH
   x86_64    |         nodejs-14.18.3         | NOK | http://autobuild.buildroot.net/results/512601d61c99ac04b3c8e489775362e9bd2fefac |     
  riscv32    |            opensbi             | NOK | http://autobuild.buildroot.net/results/52ffcdcaa8a4d549389546a8078cd56548bb2cc0 |     
   nios2     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/2d2cdc339dc93c1753072621b6abd40ea4d8c4d2 |     
    arm      |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/52d6043cffccbb30b0d7de03d19eda14636b7a37 |     
  aarch64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/aef5144b6f18a8af6adb99581df6204708a46ea1 |     
    arc      |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/a7480fafaf514b2cb498d607c99f627593776848 |     
    m68k     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/9a0b478c56ddcbee547c0dfc75a030ed80316408 |     
  aarch64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/93615441f5ff3f6f0608bf6df648499b512a4729 |     
    arm      |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/cac0dda7ccd98f1cdafaba10456b6b770fed1c99 |     
  powerpc    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/e0571f389ce8408d9dde0dae2b6f7798560a10ca |     
   mipsel    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/7d34b8a09ff3159fd04c0fbf79903dbe260a76a8 |     
  aarch64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/ea3d8e63614b9bb793bed5563b18bd15a5e2a479 |     
 aarch64_be  |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/51fa76e8f2b35119d941405f022965f05feb3779 |     
  mips64el   |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/00ff656f54944ca562118e0b7172a37a8257ce9e |     
   mipsel    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/191c4f214c9c36d6f3ca3b9513399a0569f8a1e0 |     
   x86_64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/3c0e00de728c19e0afe6ce9d7292dc2618851d6a |     
    sh4      |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/74dc360135ec9d315fc46233dfcd6bff0d9f9cfd |     
microblazeel |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/6d9394ba8cb9e06f03f89234023e1eb8f473891b |     
  riscv32    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/56bc359d2c1b2d3f410a8987fe3772ab5da35d8d |     
    arm      |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/fb0d09f844e44dc2aab5ccfd16693d949b2b9d7f |     
   xtensa    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/fbd884703bf493ee5e319f7a3f5c18b4434a4c1f |     
    mips     |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/765d471b79610a0c745ae32bf95b81747d14482e | ORPH
  powerpc    |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/2055331856f3c3781db1531a16ef5300c14b2f3b | ORPH
   nios2     |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/6a62f189bc6652e07f501b339773b70769942676 | ORPH
  mips64el   |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/be84e51f8843a2bdea4c585f3cf4ffd042d2bc0a | ORPH
  powerpc    |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/4359e36c1576864e2a833fe2de5b812c59f95c61 | ORPH
   nios2     |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/1e083aa920dd09a8f3fc982a5ac0c0b256db32b4 | ORPH
  mips64el   |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/3cbfda07c80abe28cbbb522b99b304f068fea730 |     
    arm      |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/2265161691335e042827a58ee426187d08ce17b0 |     
  aarch64    |           php-8.0.18           | NOK | http://autobuild.buildroot.net/results/420c35fa90e91523671170743d080a30fbf0a674 |     
   arceb     |        pipewire-0.3.50         | NOK | http://autobuild.buildroot.net/results/d66d2819c517b617f880127b3dd275ee01b72983 |     
    mips     |        pipewire-0.3.50         | NOK | http://autobuild.buildroot.net/results/4fb33a491edf42460a462f19158457b3a7a74214 |     
    or1k     |        pipewire-0.3.50         | NOK | http://autobuild.buildroot.net/results/6ee5d90193ebf0bbce9ce3c423b5acd5c49077a5 |     
   armeb     |        pipewire-0.3.50         | NOK | http://autobuild.buildroot.net/results/84891593920852a71180d29f37a489213ade28db |     
 microblaze  |       pkcs11-helper-1.28       | NOK | http://autobuild.buildroot.net/results/c3fc2b7226fd52d030e14ace0177a8585ab49956 | ORPH
   sh4aeb    |           pppd-2.4.9           | NOK | http://autobuild.buildroot.net/results/6da00c5342d8f522efaa612df9eb44501a65e291 | ORPH
 microblaze  |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/be89a9e180187ecef6b85590661f2ec6d8e8eff2 |     
microblazeel |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/f24c8e956164779b2ed5eec4c91864f75c395460 |     
    or1k     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/911f1aa2a98d047041cdd7ca9772536bf8878670 |     
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/2ff1fede79fda2ffd68fb9cd1ac0e8121eb54adf |     
    sh4      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/e78212b9dead46008d21f7ae6f687e6c862b3a39 |     
microblazeel |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/e32e4d8f702bee7cc9ef2232df73914a85eafa5d |     
   nios2     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/74b11756cb586487f0169a7333554b5a0f9bf013 |     
microblazeel |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/715bd25a7be19c686a4073f255c0840713763362 |     
   nios2     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/ccf8753eff062a399d448ff42ad805d4b7966a8f |     
    m68k     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/fe90658952473608d8ed35ea48c7f9173bf78bd0 |     
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/0f0939f0d35f39f47468bc7304fedec1bb665c07 |     
microblazeel |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/f4ddf3e935589af1faf97d31b937281080f47924 |     
  aarch64    |   python-cryptography-37.0.1   | NOK | http://autobuild.buildroot.net/results/5fefd07f8dda6a81a9796a30c0bdc6b16ce95062 |     
 powerpc64   |   python-cryptography-37.0.1   | NOK | http://autobuild.buildroot.net/results/36f92895910442fd85fdd75ece7008b01b75e693 |     
   x86_64    |   python-cryptography-37.0.1   | NOK | http://autobuild.buildroot.net/results/312116d4ec3d66f0cb6615d722329bab532e9783 |     
  aarch64    |   python-cryptography-37.0.1   | NOK | http://autobuild.buildroot.net/results/80f106451096f7cc3332e4733236dcd55ef5cfe9 |     
    arm      |   python-cryptography-37.0.1   | NOK | http://autobuild.buildroot.net/results/a64e1a80448639bac8cdfe285ee19b9d304c74c3 |     
   mipsel    |   python-cryptography-37.0.1   | NOK | http://autobuild.buildroot.net/results/31c483b0490dc65f31ec11649a7b5640a2aae426 |     
  aarch64    |   python-cryptography-37.0.1   | NOK | http://autobuild.buildroot.net/results/3660002e4c7ff922763d1d4341ca1d8042f9fb34 |     
 powerpc64   |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/9128273420e61b7537ffe7ded4187c22a09bf78b |     
  powerpc    |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/91787b3b1836e7b407d1697da6a0e8c378193641 |     
microblazeel |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/1b55c140b64593615e5a87dd959ba9374fcd11b2 |     
    arm      |    qt5webkit-5.212.0-alpha4    | NOK | http://autobuild.buildroot.net/results/656a6d59223aa3594066122700d094b588ee7e8a |     
    or1k     |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/778267af18d0de95401a0dc847a6fba6449dca5a |     
microblazeel |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/6d69902c1a7ed1ae5c781d776e967acad03c830f |     
   sh4aeb    |          ramsmp-3.5.0          | NOK | http://autobuild.buildroot.net/results/df07d013ee1c6ff6c5c587be2e69ea5aefd10ab8 |     
    mips     |           refpolicy            | NOK | http://autobuild.buildroot.net/results/23461bf29bdf7ffea1993891f890d9a812ee7c89 |     
  aarch64    |           refpolicy            | NOK | http://autobuild.buildroot.net/results/2f8c3114ac7dab8d3878a28cc8aa2ae6d1cdd020 |     
microblazeel |           refpolicy            | NOK | http://autobuild.buildroot.net/results/16af984d3ae9d75cd37eb33cc218c43cd366de35 |     
    or1k     |           refpolicy            | NOK | http://autobuild.buildroot.net/results/8582a64d0d82819038c6cbeb90b93289fbe7f5e8 |     
   mips64    |           refpolicy            | NOK | http://autobuild.buildroot.net/results/4d1bc7d4c778daf4f466587e0d239b7a6e20a442 |     
   x86_64    | ripgrep-af6b6c543b224d348a8... | NOK | http://autobuild.buildroot.net/results/1131d6b8f20ed0629da4966e0c0e8576b148ea17 |     
    or1k     | rtl8723bs-11ab92d8ccd71c80f... | NOK | http://autobuild.buildroot.net/results/dd084d4704d8be833880ffd024df8672ed6f3259 |     
    i686     |           ruby-3.1.0           | NOK | http://autobuild.buildroot.net/results/3cb2b9e9128861605eb270c594188c6a7f8f703c |     
   mipsel    |    shadowsocks-libev-3.3.5     | NOK | http://autobuild.buildroot.net/results/8f84bf24b2b9545c127f66e75f9b95b929fb622f |     
    arm      |          sngrep-1.4.7          | NOK | http://autobuild.buildroot.net/results/9b1492fab45ed2ddf971238cdc4462b50c157bc0 | ORPH
 microblaze  |        syslog-ng-3.35.1        | NOK | http://autobuild.buildroot.net/results/77437ef6e85bf5390fcd23114835f119f2a9386c |     
   s390x     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/c2ed88f7800a4315bf09ecff88f44abea5c21ae1 |     
  powerpc    |        target-finalize         | NOK | http://autobuild.buildroot.net/results/790834ec8860454bd91563ded88504e5071e7c52 |     
  powerpc    |        target-finalize         | NOK | http://autobuild.buildroot.net/results/bff13b9201bd7c0c44556a1003e109ae8e99d62a |     
  riscv32    |        target-finalize         | NOK | http://autobuild.buildroot.net/results/924d624c0a1568343a6f86b9040cbf28a517b1c0 |     
   nios2     |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/d1a38e94623900cbf1685268455dde77239b77bf |     
   armeb     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/bae4ce96bcca2ebd78f60191211353a4fd3187fc | ORPH
    arc      |          tor-0.4.6.10          | NOK | http://autobuild.buildroot.net/results/236b46b5f0824d4d05d82795c4b32e2906e3be20 |     
 microblaze  |          tor-0.4.6.10          | NOK | http://autobuild.buildroot.net/results/99487664f61db5503304723e24bb849267b9afc8 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/2f2103fb3f3ac5174657bb277b8a6b777ec0f647 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/b8f4f66784644ef7117ea9bfe5922173ec28767b |     
    arc      |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/53a613dc8d647cd96777a1596b3fea95a88072eb |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/b421941e728b9b20e6a41f48e15ace8326a98da3 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/09e3eda7195143dd0de08fd49356dad8efe05c82 |     
   arceb     |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/7ed00e6abfbba10721ccb5532d202d71d1a7f5e9 |     
    arc      |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/4a2697187537edcf68e485993d0d8d42395f62c3 |     
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/75d7d1f13f9b19d97e8e4f749020a3677168b7a8 |     
    mips     | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/d1775821f9cdae279a995a66bcf4341ef6dc7cef |     
    i586     |            unknown             | NOK | http://autobuild.buildroot.net/results/9a78af451cb03721aa353408abc5507c6408faae |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/31077a6fc11061be40eea80925c54aba2f422fa8 |     
  powerpc    |          vlc-3.0.17.4          | NOK | http://autobuild.buildroot.net/results/19fdc1fca1fe48aaa520ab706777c3a4c5621bc1 |     
powerpc64le  |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/9518af69456d6a2392a40aedeadcdca08571dded |     
   xtensa    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/1fc87a911c610c8f8cd514db9b4e5fff41d0c6e5 |     
    arm      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/68427f1ac26ec1635cb5f4f770c7d69cdb9a54fd |     
    arm      |         wolfssl-5.2.0          | NOK | http://autobuild.buildroot.net/results/388d8ebbdb53f6d6ea9099cd5aebd65696fadb9a |     
microblazeel |            xenomai             | NOK | http://autobuild.buildroot.net/results/ab95b5e93b67be140f64467d6f77aa738f6126f0 |     
    i686     |         xenomai-custom         | NOK | http://autobuild.buildroot.net/results/cfb2b06d6a6be1a206be818198f206393fd38aee |     
  riscv32    |          xvisor-0.3.1          | NOK | http://autobuild.buildroot.net/results/110a96c863194bda77d43b79559d99c372017b2d |     
    mips     |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/1e72963c2a77ac5d53f0c6782f1f4f4c61b03f4b |     
   armeb     |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/e2589a9e16b3ea5c34f80ec4daedb5d52981b043 |     
  mips64el   |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/8c519ee543b8bdb35a789a8609d9b4e68d8dc6d2 |     
  powerpc    |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/c2c10e80285c0baacd5f516086c27db4babed156 |     
    arm      |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/8f1937fc9db4099e11e4520f69ca9f2eb2f08b59 |     
    arc      |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/ec5359278726f4e1d9007e80d60bb2738f0efc1b |     
   mipsel    |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/2130620ca297c9c9c80229f88c931d051e955229 |     
    or1k     |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/05a488eaa830b97a9492b8eb5af79767eb2a4fec |     
    arm      |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/81879b422efc2ecf1f73cbe7130c387404c2f1e6 |     
    i586     |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/89a4a28d0862bf852562247b05b31aa7875a5c38 |     
    arm      |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/73184532710db6a4ec03f88e7d9fce98b9c1f1e1 |     
   sparc     |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/6265a19fe34f8af93f99d1d2197c00135f8e2896 |     
microblazeel |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/6d360596ce31d1b1f6ed0d65dccd5725be8294d0 |     
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/a36cb03d9390bf06377c9eb4f7f831b463f1db17 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/070c9fa31c4f1680628af57323d13efdd57022f9 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/9ee1e49fcadab9062d0ab31e97a01cdb1ebbfea6 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/433ab5fa3e96d1052c13a7d5903be0a76935f47d | ORPH


Classification of failures by reason for 2022.02.x
--------------------------------------------------

               gocryptfs-2.2.1 | 2 
               apcupsd-3.14.14 | 1 
                    dhcp-4.4.3 | 1 
tvheadend-1295dd2be863f5beb... | 1 
                 wavemon-0.9.4 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/c4cd898b51d51e1dc32e7dc98511e0dd5cdb2e1e |     
    or1k     |           dhcp-4.4.3           | NOK | http://autobuild.buildroot.net/results/46a2f4eba193d2e45b399d56d69077e342a002a2 | ORPH
  mips64el   |        gocryptfs-2.2.1         | NOK | http://autobuild.buildroot.net/results/aa7f6248edd329972ed92e8f00210fdaad3b33e9 |     
    arm      |        gocryptfs-2.2.1         | NOK | http://autobuild.buildroot.net/results/5107ea329e1facceb10e1261c085015d8b37591a |     
   nios2     | tvheadend-1295dd2be863f5beb... | NOK | http://autobuild.buildroot.net/results/418fc1855ad8959f83d7c91a05c86ed377eb075f |     
   s390x     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/3e3fd90c53ce10f932e6cf1f8ab5934111386554 |     



-- 
http://autobuild.buildroot.net

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

