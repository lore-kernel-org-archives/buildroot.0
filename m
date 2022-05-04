Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CDC1C433EF
	for <buildroot@archiver.kernel.org>; Wed,  4 May 2022 04:40:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 09AB540499;
	Wed,  4 May 2022 04:40:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jrJr9AGgXw9J; Wed,  4 May 2022 04:40:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 976F0403AA;
	Wed,  4 May 2022 04:40:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C3A461BF47E
 for <buildroot@lists.busybox.net>; Wed,  4 May 2022 04:40:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A3916403AA
 for <buildroot@lists.busybox.net>; Wed,  4 May 2022 04:40:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yuwtAHDdHUml for <buildroot@lists.busybox.net>;
 Wed,  4 May 2022 04:39:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5457E400E3
 for <buildroot@buildroot.org>; Wed,  4 May 2022 04:39:58 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4A8262000C
 for <buildroot@buildroot.org>; Wed,  4 May 2022 04:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1651639196; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=aLcNe9iCowUDkIRdVY7uzvGM4oesY7de/jVfsKVq0rM=;
 b=Mcikz91rlZ1vLaZ2zdDIMlxz/P954bIwG3YZvCcffPKeepT06AZneGDynB9uRN92IAB3vT
 EZOtQNhs5i0Jc0fwqkWybo5OKVG3R+vsg0fxNq7AYkJfbimx3GvQQnWqIflgWPGTPvafSq
 ePcF/i8MNtMORRGWUGsAswIo+NQBOUpnIGfMs7R+aZkZZwHmYQ8vR0MALwmxea3YBI5o66
 1jYnvgt/HaI4t/Toe4+eZephEL4hB5c3lKdha966F9VxAlaIOM7a4iJJGYtdX0vVfPOSP1
 RvyKCBXUncbo1LsYRFPkVrHSi+raJIT1uz6SVjttqDAIWhdrL1AR/goC86LX+g==
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Wed, 04 May 2022 04:39:56 -0000
Message-Id: <20220504044002.A3916403AA@smtp2.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-05-03
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

Autobuild statistics for 2022-05-03
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  | 22  |  3  |  0  | 25  |
    master   | 191 | 310 |  0  | 501 |

Classification of failures by reason for master
-----------------------------------------------

           optee-client-3.17.0 | 17
             libopenssl-1.1.1n | 16
         host-gcc-final-10.3.0 | 13
                  zchunk-1.2.2 | 13
               protobuf-3.20.1 | 12
                    git-2.31.2 | 11
                libressl-3.5.2 | 9 
glibc-2.34-109-gd64b08d5ba7... | 8 
                pciutils-3.8.0 | 8 
          host-gcc-final-9.4.0 | 7 
                 linux-5.15.33 | 7 
                 zlib-ng-2.0.6 | 7 
         host-gcc-final-11.2.0 | 6 
host-pahole-73383b3a39afe86... | 6 
                   perl-5.34.1 | 6 
               pipewire-0.3.50 | 6 
                busybox-1.35.0 | 5 
              host-rust-1.60.0 | 5 
                 uclibc-1.0.40 | 5 
                alsa-lib-1.2.6 | 4 
                     frr-8.2.2 | 4 
                 libp11-0.4.11 | 4 
            qpid-proton-0.35.0 | 4 
                       unknown | 4 
                host-go-1.18.1 | 3 
             host-libbpf-0.7.0 | 3 
              libgcrypt-1.10.1 | 3 
               libglib2-2.70.4 | 3 
           libwebsockets-4.3.1 | 3 
         linux-headers-5.15.33 | 3 
            pkcs11-helper-1.28 | 3 
            quickjs-2021-03-27 | 3 
toolchain-external-bootlin-... | 3 
                  cmocka-1.1.5 | 2 
                 dash-0.5.11.5 | 2 
                    dhcp-4.4.3 | 2 
docker-proxy-339b972b464ee3... | 2 
                elfutils-0.186 | 2 
                      fbv-1.0b | 2 
  gobject-introspection-1.70.0 | 2 
                   gstd-0.14.0 | 2 
                libzlib-1.2.12 | 2 
luajit-f2b37f51f69ba7e9f8de... | 2 
rtl8723bu-19b4bdc05483a1e79... | 2 
    toolchain-external-bootlin | 2 
                 wavemon-0.9.4 | 2 
               xfsprogs-5.14.2 | 2 
                    4th-3.64.0 | 1 
               aircrack-ng-1.6 | 1 
         argp-standalone-1.4.1 | 1 
                arp-scan-1.9.7 | 1 
                   atftp-0.7.5 | 1 
                    attr-2.5.1 | 1 
                   audit-3.0.7 | 1 
                     aufs-util | 1 
             berkeleydb-5.3.28 | 1 
                bitcoin-0.21.2 | 1 
                    brltty-6.4 | 1 
                    chrony-4.2 | 1 
              containerd-1.6.2 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/cramfs/cramfs.mk:46: /nv... | 1 
fs/cramfs/cramfs.mk:46: /nv... | 1 
fs/jffs2/jffs2.mk:71: /home... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
              fstrcmp-0.7.D001 | 1 
               git-crypt-0.6.0 | 1 
               gocryptfs-2.2.1 | 1 
                      grep-3.7 | 1 
       host-dbus-python-1.2.18 | 1 
              host-delve-1.8.0 | 1 
       host-gcc-initial-10.3.0 | 1 
host-google-breakpad-c85eb4... | 1 
           host-nodejs-14.18.3 | 1 
            host-systemd-250.4 | 1 
                  janet-1.21.2 | 1 
          janus-gateway-0.11.6 | 1 
kvmtool-f77d646ba01d04be5aa... | 1 
               libcap-ng-0.8.3 | 1 
                    libev-4.33 | 1 
               libevdev-1.12.1 | 1 
                libkrb5-1.18.4 | 1 
                libmdbx-0.11.7 | 1 
   libtorrent-rasterbar-1.2.15 | 1 
                 libusb-1.0.25 | 1 
       linux-5.10.104-cip3-rt3 | 1 
            linux-fusion-9.0.3 | 1 
   linux-headers-5.10.104-cip3 | 1 
linux-headers-5.10.104-cip3... | 1 
                   linux-tools | 1 
              memcached-1.6.12 | 1 
                mongodb-4.2.18 | 1 
                     mtd-2.1.3 | 1 
             netsniff-ng-0.6.8 | 1 
                nodejs-14.18.3 | 1 
            ocf-linux-20120127 | 1 
               openpgm-5-3-128 | 1 
polkit-a2bf5c9c83b6ae46cbd5... | 1 
                    pppd-2.4.9 | 1 
    python-cryptography-37.0.1 | 1 
                python3-3.10.4 | 1 
                      rauc-1.6 | 1 
                     refpolicy | 1 
rtl8188eu-903b6fcb821465fe9... | 1 
rtl8723bs-11ab92d8ccd71c80f... | 1 
rtl8812au-aircrack-ng-3a640... | 1 
                  sngrep-1.4.7 | 1 
                 systemd-250.4 | 1 
toolchain-external-codescap... | 1 
                  vlc-3.0.17.4 | 1 
                       xenomai | 1 
xr819-xradio-16180b6308e3c5... | 1 
             xscreensaver-6.03 | 1 
                    zstd-1.5.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |           4th-3.64.0           | NOK | http://autobuild.buildroot.net/results/34666a80982076b35327ab138fef6bd60c8c21ff |     
  sparc64    |        aircrack-ng-1.6         | NOK | http://autobuild.buildroot.net/results/3336ff27f229d5d09ab06921af0b33771d8bb54e |     
    m68k     |         alsa-lib-1.2.6         | NOK | http://autobuild.buildroot.net/results/27d350c706c2053f917941bf71e08414f32a2f58 |     
    m68k     |         alsa-lib-1.2.6         | NOK | http://autobuild.buildroot.net/results/46d2959655a82ba980255aa16ab1056eb7ffc451 |     
    or1k     |         alsa-lib-1.2.6         | NOK | http://autobuild.buildroot.net/results/0977cdcae704caada739c1f66057b34c27629fd2 |     
    m68k     |         alsa-lib-1.2.6         | NOK | http://autobuild.buildroot.net/results/db055a14b9c8912fa20b9c1c31f99c31b270c43c |     
   arceb     |     argp-standalone-1.4.1      | NOK | http://autobuild.buildroot.net/results/a3ae7e783ee7b1fd4b534a2480cf18c663cf5759 |     
  riscv64    |         arp-scan-1.9.7         | NOK | http://autobuild.buildroot.net/results/bf98881febe286a87d9a68eb429ab4e97c8719f6 |     
    m68k     |          atftp-0.7.5           | NOK | http://autobuild.buildroot.net/results/12ae61f618df30ffb14b600299fd3b33fa39352d | ORPH
  aarch64    |           attr-2.5.1           | NOK | http://autobuild.buildroot.net/results/e82086a0340445f920f3f6703627bab7433d3387 |     
   armeb     |          audit-3.0.7           | NOK | http://autobuild.buildroot.net/results/efb839c1e8c036c6e72f0f0facf89a1100d6f879 |     
   x86_64    |           aufs-util            | NOK | http://autobuild.buildroot.net/results/db40f1cbbafe5c4e0fddd60765f764643e003fbf |     
   sh4eb     |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/c55d1a72c6875fa6ea5761ee1be5036331afd952 | ORPH
  aarch64    |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/3250501fb3151fc36afb936df4cc0d43c9a8922a |     
microblazeel |           brltty-6.4           | NOK | http://autobuild.buildroot.net/results/159bb49aa967e745afe84defd2d61a9389145b18 |     
    m68k     |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/10d8dca4c2f4e6276af122d85accdc1b9b4cc802 | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/c2d6d486eafd8880cbecf094901b5b9fbc20bdf5 | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/a5202c3e71b73c222e9c5eadb2e7381856ad43d4 | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/d639c25caf688b4407a8f398b572de15c7b75965 | ORPH
    m68k     |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/112079ec0702e07a109323c98b5ab781c43f016f | ORPH
 powerpc64   |           chrony-4.2           | NOK | http://autobuild.buildroot.net/results/a2f764eaed20b9814dddf2e0791b07027f004bb5 | ORPH
   armeb     |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/ff38f643acc77b81c65d304a8ac78e120e09bcf3 |     
    arm      |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/e6f412b27ad264943dc0ee913a8ee8634bfcb8cf |     
powerpc64le  |        containerd-1.6.2        | NOK | http://autobuild.buildroot.net/results/061dbd29f49798284503668f58676dfbf05dedde |     
  riscv32    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/7fc35993242e20945ea3f5145b5e2c914f49bb11 | ORPH
  sparc64    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/91b0efa8f6e49ca0b51bafe973eb90ba00f7a281 | ORPH
    arc      |           dhcp-4.4.3           | NOK | http://autobuild.buildroot.net/results/0606406a914b8429282e1825adf60d7d9909c721 | ORPH
   arceb     |           dhcp-4.4.3           | NOK | http://autobuild.buildroot.net/results/fae1dd12cc4c01cfbee32d350c64ce70b7a07d35 | ORPH
   x86_64    | docker-proxy-339b972b464ee3... | NOK | http://autobuild.buildroot.net/results/3509295ff2140d81602d598abf4daea239c7269d |     
   s390x     | docker-proxy-339b972b464ee3... | NOK | http://autobuild.buildroot.net/results/c769816148f665e13b836c2c73190f69c9fa5648 |     
    arc      |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/db8c0ab093b4b264c508d4682a2d9b68a42288a6 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/e5f42ebac4f5daa3fb57ea2a31bc22b47816aeb3 | ORPH
    or1k     |            fbv-1.0b            | NOK | http://autobuild.buildroot.net/results/e258b7033c10a57003f003f1b88b1337d8886580 | ORPH
  mips64el   |            fbv-1.0b            | NOK | http://autobuild.buildroot.net/results/fdb3328e3e2b0a506d704b5121563137a6b4dd25 | ORPH
   xtensa    |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/4b5b68b48afb1f8bad3083fca245f48d10a6534f |     
   xtensa    |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/859332a94c071b4cf741eb15893b53f9775d630f |     
    arc      |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/18d4a0c24bac8f99d9efee1bea19d89d769eb868 |     
    arc      |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/64385a7fe7abdd627f5986c07c6ca55fd428a0cd |     
   armeb     | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/93befbac1a2254b78f8bdfdb2d6ba71f109825b9 |     
 powerpc64   | fs/cramfs/cramfs.mk:46: /nv... | NOK | http://autobuild.buildroot.net/results/c6e50279ee71495408520fc1c1c1a514840866c6 |     
  aarch64    | fs/cramfs/cramfs.mk:46: /nv... | NOK | http://autobuild.buildroot.net/results/6d8cd730b0ebd0f9c6bacb41d56f5d21412d6e1e |     
 aarch64_be  | fs/jffs2/jffs2.mk:71: /home... | NOK | http://autobuild.buildroot.net/results/f1834c71cf7abf10ce13dc6a8ae36510a0ae5c1d |     
microblazeel | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/4a5ab75462df205ab4cb10e7aa2d4c578cb4b8d6 |     
    arc      | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/32e0e5d224048d032b5721bdf1d96d7a8bf52e33 |     
    arm      |        fstrcmp-0.7.D001        | NOK | http://autobuild.buildroot.net/results/ac4b5ce624275e9d1b7c50ebd4632fae46bf7052 |     
   sparc     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/f2aafb1220973a95bc9fa62a688cece1c4308402 |     
  mips64el   |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/04d9131ae289452099c19e5a16848cca3bb10452 |     
   sparc     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/35160896a8a3083b36276772535de8a2eedabd78 |     
   mipsel    |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/b1455630fd3790433e2fad864c0cb2cbb0062153 |     
    arc      |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/d850ba867809f217c1bbad43b4e9c704717a7318 |     
    arc      |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/4b123e1c9c9415fb469bda2d922a0df51d2d7abd |     
    m68k     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/f339f4e46a2ee8809732aa992479ea48be7dfe1c |     
   sparc     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/5ad263ebb294ffc1c380495eb8843a76eeae7304 |     
   x86_64    |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/5c6fd7899cbfdb3f04a3dedcba48f2b510566245 |     
    i686     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/2da231c050654049160d12960d17abdddb4e365a |     
  aarch64    |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/71d22b30fe47ad344006b118b8cfd0cbf989dcfb |     
    sh4      |        git-crypt-0.6.0         | NOK | http://autobuild.buildroot.net/results/ad889f08df5793215a7bd6a883eab99261025e2a | ORPH
powerpc64le  | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/6f2666a0350ddf812878f5b939baddaf5e15ba6d |     
  riscv32    | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/41ec8e3d68acd51bc2da9de01ce018aa9985cba4 |     
  riscv32    | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/013dc8767e30e8e900adb03e1651c341d142c69b |     
  powerpc    | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/6cc8fa456e09b149fe660229a1a8b1944f71ae59 |     
microblazeel | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/09f89bb447fe217c1212860c8623752628198830 |     
   nios2     | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/886c980931093ecb98b8b3b7f18b06db7bf5a5be |     
  riscv32    | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/a3cacaa3d967bdc19af986da5052351f10f008c5 |     
powerpc64le  | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/6e3c51f9b967ada76db458d4d857e9e0d70165bd |     
   s390x     |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/beecc398b998d05785a91166a9af080e3f48319d | ORPH
microblazeel |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/1425c0ce30a1c7b11b69fbf432a769b04ddff098 | ORPH
   x86_64    |        gocryptfs-2.2.1         | NOK | http://autobuild.buildroot.net/results/abb7331e43c92d8d4e0c25e12afbf215d5b2d04c |     
  powerpc    |            grep-3.7            | NOK | http://autobuild.buildroot.net/results/01d75da0bcfb58b51a514a06a6c1ec2eaa760637 |     
    arm      |          gstd-0.14.0           | NOK | http://autobuild.buildroot.net/results/ef30cff2c004a78ad9b059653bd799e9f18366d4 | ORPH
    arm      |          gstd-0.14.0           | NOK | http://autobuild.buildroot.net/results/ae712f27dc5bf6a34e5ebc2ce28c8d47035c4ceb | ORPH
   mipsel    |    host-dbus-python-1.2.18     | NOK | http://autobuild.buildroot.net/results/5bab8fd488fc52b91f938425a7eee75258ddf34a | ORPH
    arm      |        host-delve-1.8.0        | NOK | http://autobuild.buildroot.net/results/a190a239593288f07d7f844402dfe6a44d54a364 |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/cbbd34e044f04dbfafefa1e73a6e3a6c35ec3925 |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/851a17063edf68d870da4890d8e67f1f7a3afd26 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/e7b4208074a991cd50a996551085c484f173b871 |     
  riscv32    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/f0a31adef5ae6fbabb43c7163ac403b92235fe8b |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/6bf0c65644c10b4de21db57ba3839419bcca6340 |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/6fd97165b72bf478716deb45e9999bf02d11c2da |     
    i686     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/37aad3535d4da099e47f6ad1d2d10a9d65398a16 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/5d1000d18d1573a3f862ae9bf005339dad0e3785 |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/31a7d492e659cc567e46bd50f1758537bfb59235 |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/07c4186a9c9ddd2759ec4fa44ecef8d731f6380e |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/84fc13a04429140166ed28f7676e33c8fb852b30 |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/a507055a29220ac9f536dcb46f252c6215cfe62b |     
  riscv32    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/840b9f1041e7e94eaea9772fd466541d3939c8b6 |     
  sparc64    |     host-gcc-final-11.2.0      | NOK | http://autobuild.buildroot.net/results/1d5abfc90a88d74f68bdf93af1f1774d074a92f0 |     
  sparc64    |     host-gcc-final-11.2.0      | NOK | http://autobuild.buildroot.net/results/867b566dfe9777d45df1b77891be4e09e63e894a |     
   s390x     |     host-gcc-final-11.2.0      | NOK | http://autobuild.buildroot.net/results/59d82644f2abb89883983b70cc3ee3d9f20b3aad |     
   nios2     |     host-gcc-final-11.2.0      | NOK | http://autobuild.buildroot.net/results/519eac268797cd67e23d0fca6237167834e5b93c |     
powerpc64le  |     host-gcc-final-11.2.0      | NOK | http://autobuild.buildroot.net/results/b565cd5f1ba1461efd7b029d09a17ebe7918e1e0 |     
   nios2     |     host-gcc-final-11.2.0      | NOK | http://autobuild.buildroot.net/results/688985737e3a73414c1381e2f9f6cdc7b3521177 |     
powerpc64le  |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/792fae592099721b97c9365c4e228f64fec625b2 |     
   s390x     |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/0e9baee4f4114ce6c6f63e5fe9c1712b2eb6c4f6 |     
  sparc64    |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/77dc1d763f08230333b6b611c54db8eae25c5db7 |     
  powerpc    |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/12b03576abe1febf28668ad9f085bf7180a56acc |     
powerpc64le  |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/3bfbe4a8522570e0a9bd705313d7bff8c31ced6e |     
   nios2     |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/1442c57bd901cc487067558e110df750d66bdfa5 |     
   s390x     |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/634161d89b6b66a3f2146c9165d5bfbe71da4dd7 |     
    arc      |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/9f5dd1c2a6030cf7a64d987326d2b6f52bb61b5a |     
  aarch64    |         host-go-1.18.1         | NOK | http://autobuild.buildroot.net/results/82327d155777fe80d62f0d0f997e2d82be37789f |     
   mips64    |         host-go-1.18.1         | NOK | http://autobuild.buildroot.net/results/9959b574bf41fd6056797ef3159b547e1349b7db |     
   mips64    |         host-go-1.18.1         | NOK | http://autobuild.buildroot.net/results/dd71812ea4b1cfbdee45c6694a9446eae7b0949e |     
   mipsel    | host-google-breakpad-c85eb4... | NOK | http://autobuild.buildroot.net/results/fa7d7e823a3d4f452e2a3ca92865caeccabb16ed |     
    arm      |       host-libbpf-0.7.0        | NOK | http://autobuild.buildroot.net/results/04710161ff2ce249c5ae9047a88711666cfb240f |     
   sparc     |       host-libbpf-0.7.0        | NOK | http://autobuild.buildroot.net/results/21d46c1506e9d98680e75d8bf1299862f7ed0769 |     
  aarch64    |       host-libbpf-0.7.0        | NOK | http://autobuild.buildroot.net/results/99d18fdb7e64b102084a30181a04e70a293dcf0a |     
  sparc64    |      host-nodejs-14.18.3       | NOK | http://autobuild.buildroot.net/results/6c19c26fb5e4ea0c2c17adca73a23248e58e1051 |     
   xtensa    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/6d1c57396399675cc25df80168c8f61f5f486703 |     
    sh4      | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/78be36a90c8fab1d6f382499c6a19e67c00e78a7 |     
   x86_64    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/00b24f73fcaca735dd0170d15936770ebf08bd7f |     
powerpc64le  | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/bb19e84ac9a6b94b2189b775d7690363213d4e90 |     
 powerpc64   | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/7ba07d61b85fc37b459e41dfdf67530619087135 |     
   s390x     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/49c1576d4d0c0705c69e63c00b8d6c165b2eb448 |     
   x86_64    |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/0a16c2073449419018703c30be32975197f1b4d4 |     
    i686     |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/3111bab06a1f7d2c1fe621010c34e576689339a2 |     
    mips     |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/3977ff8c435747cdfaacf7a27ae3d8e0f6c68bff |     
   armeb     |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/771a9be99cbf6a08697df023d069f36cbe759677 |     
  aarch64    |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/b7ea4f5d98b69fc2549fca60064d38c6b32d9e78 |     
 aarch64_be  |       host-systemd-250.4       | NOK | http://autobuild.buildroot.net/results/5965bb3a02869901e8207eb71e6a2a6ba85c3fe3 |     
 microblaze  |          janet-1.21.2          | NOK | http://autobuild.buildroot.net/results/0cbcf78df0d3aef176ad3a56be1ca801758c257a |     
microblazeel |      janus-gateway-0.11.6      | NOK | http://autobuild.buildroot.net/results/3071777f1ae02665aaaaa47206fbf3df225b6901 |     
   x86_64    | kvmtool-f77d646ba01d04be5aa... | NOK | http://autobuild.buildroot.net/results/7074311aac6f3cec73a027cd62ca3b1677585bbb |     
    or1k     |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/a34e528e6ddb0e3b86e9606bae37121e7485c16a |     
   armeb     |           libev-4.33           | NOK | http://autobuild.buildroot.net/results/fef8683aca828d82f9c2bb2ea9bbbf36b54bebdc | ORPH
    arc      |        libevdev-1.12.1         | NOK | http://autobuild.buildroot.net/results/d9b3f6573f7188b5cd1ab9a14e495cf928e2001b |     
    i586     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/d0dd83b8909e207d0cff79fd0b8f2d927c895557 | ORPH
 powerpc64   |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/fe942777f90d363d289eb746a2276eaab8b3db9b | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/822b1f0750644e27867260c00fca7f98bdd84b1b | ORPH
   arceb     |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/cba31044479e20b255d6ebee91ebe427abc7c8f3 |     
   arceb     |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/f68103c81d31bdd922a30e7fab9483164a469226 |     
   arceb     |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/1e5dd41059d590deb60a0d9b93785de29f116284 |     
   armeb     |         libkrb5-1.18.4         | NOK | http://autobuild.buildroot.net/results/f2c458701697030c4e602f0609d8d13fa4307558 |     
 microblaze  |         libmdbx-0.11.7         | NOK | http://autobuild.buildroot.net/results/d0489a1c1a9d47ed656e8f3507af7293a0f77de2 |     
    m68k     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/bf27abff00e7364821d26a6662dbba99877dfd55 |     
  powerpc    |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/ac7582d251a40d4f9836cabdc5fb299a77d80428 |     
    m68k     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/fed51878addc4db41d18e5ce0589b28c31ff0e96 |     
    arc      |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/6563726d0fa563ba2e2477d403780e33d17b7d58 |     
   arceb     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/0b16f7d11f24d47bdff9ad26da673436d41544f7 |     
 microblaze  |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/f99ae6efa519f45dffe53d4b3f88119d4b6b56f6 |     
    or1k     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/8548202981e230783c9ba7ce24555a2089e6fb1c |     
   arceb     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/abf4a0108b3ee5bcff84c3e655fded70fdd9693c |     
   arceb     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/5d33c406327ae9808bdfade2f4772e5c6dcb427e |     
   xtensa    |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/996b7c013a04bb6cb96ca4eeb724fe32c79762b5 |     
  powerpc    |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/4f693e30a0332249a72408410e6f8a761de834b4 |     
   sparc     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/3e44e3c439c6c2ac935be3df3e2078d4bd710b72 |     
microblazeel |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/b06cab3a7d2fde4d2193eac7bf9df1af3456d588 |     
    arc      |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/4ddb9fc7022bd8f82db07bd89ae2148150db4e3e |     
    m68k     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/0037bb5ce38d905d58c35ea1bc131b4d635ecc89 |     
   xtensa    |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/50334a6c4f78e5a9bc487537a67af5a7d7ba64af |     
    sh4a     |         libp11-0.4.11          | NOK | http://autobuild.buildroot.net/results/c4e91c94f62fe8c06a2baf1ac5aa41eff320ca0b | ORPH
  mips64el   |         libp11-0.4.11          | NOK | http://autobuild.buildroot.net/results/9ab475461ebe4129258fd3bbcc6bf7cdd4d240c5 | ORPH
  sparc64    |         libp11-0.4.11          | NOK | http://autobuild.buildroot.net/results/fd777d452b5c64a55baa02dc6cff36c4d162fd68 | ORPH
 microblaze  |         libp11-0.4.11          | NOK | http://autobuild.buildroot.net/results/d4b268d80c8f97e6547a344914a0fe53b467c624 | ORPH
 microblaze  |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/9d938bcce988d7793ce3689d3e5a71a92b308897 | ORPH
    arc      |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/892a6f9762894a6b2a27192668a86c15747373f0 | ORPH
    m68k     |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/422334cffaa2a5f5b8c48280b622988c2bc089e9 | ORPH
   xtensa    |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/edbc35a1ab2b62e4257fdd244c26ba5e95a7bbd6 | ORPH
   sh4eb     |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/93009dec6ba75555fbdf2d5e14cd1b6c3f72d82b | ORPH
   armeb     |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/156c07db1ffc3531b8471bf5f7573202d02e781a | ORPH
   arceb     |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/65309501094ab8c76b1520a39aa0410167b4de4c | ORPH
 microblaze  |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/6385ae97e4cfcbee73ffb6c73f75ab8128b44ac8 | ORPH
 aarch64_be  |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/75fe5c310e0996f8cd48f1c809532229a2e797d5 | ORPH
  sparc64    |  libtorrent-rasterbar-1.2.15   | NOK | http://autobuild.buildroot.net/results/855387ea1e903ae1d570f52f4e390efa4ba74aff |     
    arm      |         libusb-1.0.25          | NOK | http://autobuild.buildroot.net/results/c375e58ed599ae96e4a8cf0842feaddc1170a21e |     
  sparc64    |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/23e19b7ece632b04b08b1229b43b8a2ca09fa655 |     
 aarch64_be  |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/9944ccf4b4e1291beda49ff04afdd6c61237cc7d |     
    arm      |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/1a3fbbed52f2450c3fda2491b6e98a368a336409 |     
    m68k     |         libzlib-1.2.12         | NOK | http://autobuild.buildroot.net/results/959ee9a7703b169a803a14a5c56af6054434e82c | ORPH
    m68k     |         libzlib-1.2.12         | NOK | http://autobuild.buildroot.net/results/67b332eee37e5648205167816230a26601a2bcea | ORPH
    arc      |    linux-5.10.104-cip3-rt3     | NOK | http://autobuild.buildroot.net/results/c627c6ad9412ef6f6b7ba82e2dc03dfcdf5d4fb9 | ORPH
    m68k     |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/3f77093daddd6f715f300069a513a6cbd9a9a2f9 | ORPH
 powerpc64   |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/b41a10147f08b43c733534920b36eb27eb6258eb | ORPH
    or1k     |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/ce633cc98b0b4c5194ad04cc5ac6e9dd6d8978e8 | ORPH
    m68k     |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/a14ee3b07450e6ae6f19b2f8d424145d783ee479 | ORPH
   arceb     |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/ee2a78586cc6a5242e32b6327e4496a49876d5ff | ORPH
   mipsel    |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/abd62dc561a96a221f75fe45e95f517134a17188 | ORPH
    m68k     |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/c80c3d89769add9fc019bda603e637d15775d2b1 | ORPH
   armeb     |       linux-fusion-9.0.3       | NOK | http://autobuild.buildroot.net/results/f5830c5c23d36be519e4a4980fa25af8071f2e8b | ORPH
  riscv64    |  linux-headers-5.10.104-cip3   | NOK | http://autobuild.buildroot.net/results/48c9829b4d04ca87abc77dc9a36774d6d626a71d | ORPH
microblazeel | linux-headers-5.10.104-cip3... | NOK | http://autobuild.buildroot.net/results/e7bbf84051b5df528ca3df8ac8a24d1702b0c92d | ORPH
    arm      |     linux-headers-5.15.33      | NOK | http://autobuild.buildroot.net/results/8392267dac2a2cac3d5a9348483bd90934a98ddf | ORPH
   mipsel    |     linux-headers-5.15.33      | NOK | http://autobuild.buildroot.net/results/a992e12276c2da3a7fcd447d97570284ead2dbff | ORPH
   mips64    |     linux-headers-5.15.33      | NOK | http://autobuild.buildroot.net/results/5048ddda5a500a6ae8021fa035708b1c829fb45f | ORPH
 aarch64_be  |          linux-tools           | NOK | http://autobuild.buildroot.net/results/85a9a45e8a2bf45977ddd7d9030d7c7a75ce43d1 | ORPH
   armeb     | luajit-f2b37f51f69ba7e9f8de... | NOK | http://autobuild.buildroot.net/results/799e3ff1b5b5c53832e3e1775c8cd07a7f70627a |     
   armeb     | luajit-f2b37f51f69ba7e9f8de... | NOK | http://autobuild.buildroot.net/results/700e0d019c6b51ea72604ed84d0a00e031b1130d |     
 aarch64_be  |        memcached-1.6.12        | NOK | http://autobuild.buildroot.net/results/473048e940162caa32893f4e6ac32a49b6ae38c0 | ORPH
   x86_64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/5a8d4bcc19c2bd6eb0441a4e372aa0d8229f70e5 |     
    m68k     |           mtd-2.1.3            | NOK | http://autobuild.buildroot.net/results/ae30f944ea3cb2e0d4947427b956cf8af509b266 |     
    mips     |       netsniff-ng-0.6.8        | NOK | http://autobuild.buildroot.net/results/f97837cd792208e0e9542ee1051b9aff3983a220 |     
   mipsel    |         nodejs-14.18.3         | NOK | http://autobuild.buildroot.net/results/9f861da174fd61fb8fbd742151e9f47237fed097 |     
   s390x     |       ocf-linux-20120127       | NOK | http://autobuild.buildroot.net/results/8cf8ca9ca510e4585f6b34464e45226682243c52 | ORPH
   s390x     |        openpgm-5-3-128         | NOK | http://autobuild.buildroot.net/results/78d4e8e72b63cd3f743a04bbc0472dda2b2fa3ab |     
   xtensa    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/9540d106c4353209d391d8a3189df912482b51ea |     
microblazeel |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/2187c1fa3185153ed3f3ad5dc23c542aa0099390 |     
  aarch64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/43dd87f13ac16245f537c543b6fd6cde5698aba9 |     
 powerpc64   |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/5b16e21f90c55aac27f55d20f9f9a334fadb72cb |     
   xtensa    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/4c8bc9416d8764dc5f2fd2933ca74d9ca00ec32b |     
   xtensa    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/325deb946afd407ec4f77c8cc84ee84d2061a708 |     
   sh4eb     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/92c452a2c167fc70a63b736649bcd942c1cfd7a1 |     
   arceb     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/6b1cf100f342cd3345c14a9e495fcec8b3e4e704 |     
   s390x     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/b9dcf7838d6993f23e83a948d133235546a1f295 |     
    arc      |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/71ac0e6121b6264d2f405ba0d64629563b44c5d9 |     
    arc      |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/d3f7afd6a61f5eb780c4134b9e5fc385efcf87c2 |     
 powerpc64   |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/36372c9d512ff916ac58875468ace128f5120e65 |     
   mips64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/3fc3115bd6fb1eb0d81bb445a0be31d8e23240a3 |     
 aarch64_be  |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/9c976c639491d91a2f1d19850401f78d66a5f4ea |     
  sparc64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/ab1dd4c0ea16c376745098206cf5410dbbaf996c |     
   x86_64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/1c7212a7c75516d9b447a06d58e2b3b6797106a8 |     
 aarch64_be  |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/347322fbbb82c7dcd9c4e9ec7a894bd295ce5307 |     
    i686     |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/664a1d3c0f32e80f7a940a4eae0e88991af5b7d6 | ORPH
  mips64el   |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/cdbeece952681a8a2db3c80df8cc8d0fd4072a85 | ORPH
 powerpc64   |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/6173647d613c6e1c17a9ed1a142bf659bdfcdea6 | ORPH
   nios2     |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/da9fbad4ba255b83a408bdc5fbb63aed8a59c627 | ORPH
    arm      |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/d47163fccb8dc952bda33611357a52a11f58e5ad | ORPH
  mips64el   |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/d0d63353db29841ad092a171198a01621b929336 | ORPH
    i686     |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/da8d51bcf651004683d5f06581036acd2e8cd8ef | ORPH
  powerpc    |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/b687d69b12b83ec66a70c094b7c2bd61f79035fa | ORPH
   x86_64    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/38be72e818da88feec565747f2c1ecc81eb6456c |     
    i586     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/ff82836de11858e0074262b4634c7b3f0a3caa28 |     
  aarch64    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/b864d8a17fff07854fa031ef6d4d755aca0d9416 |     
   mipsel    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/e4be69b47a77dcbd45718de5657b3231bc209b08 |     
 aarch64_be  |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/69a38f84a443123df357065ca5e9c1e734c4f55e |     
  mips64el   |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/81be70597432aa8f845515ba33bb9f1a463ad41d |     
microblazeel |        pipewire-0.3.50         | NOK | http://autobuild.buildroot.net/results/9acb8c74c72931265ab5e80469d372062883ecd7 |     
microblazeel |        pipewire-0.3.50         | NOK | http://autobuild.buildroot.net/results/45a9365b6029d410dfa62505b9ba66963911311a |     
microblazeel |        pipewire-0.3.50         | NOK | http://autobuild.buildroot.net/results/759b9721b4a4c39a0dc68a08189aaec8335cbdbd |     
    or1k     |        pipewire-0.3.50         | NOK | http://autobuild.buildroot.net/results/da174284b4af16ce0249f955a30ca3b6ff0be524 |     
microblazeel |        pipewire-0.3.50         | NOK | http://autobuild.buildroot.net/results/ccc690794d8559ec1a6336bb9d2a56069da5d716 |     
 aarch64_be  |        pipewire-0.3.50         | NOK | http://autobuild.buildroot.net/results/0b5306d664ecf62c879323ae7e682b80d5dc5e67 |     
    i686     |       pkcs11-helper-1.28       | NOK | http://autobuild.buildroot.net/results/ca78a8acaa7eadc90edd4a83473f2eec5d43033c | ORPH
 microblaze  |       pkcs11-helper-1.28       | NOK | http://autobuild.buildroot.net/results/f1a57d56b752bbbad1ae3532cd297c0e8987db94 | ORPH
    or1k     |       pkcs11-helper-1.28       | NOK | http://autobuild.buildroot.net/results/43af177e0e0a9e2e77b8f6314c668db9a39924e6 | ORPH
 microblaze  | polkit-a2bf5c9c83b6ae46cbd5... | NOK | http://autobuild.buildroot.net/results/55baaf18d2e1f98a611e8a700a31c48fc5865473 |     
    mips     |           pppd-2.4.9           | NOK | http://autobuild.buildroot.net/results/1587add6386f287b27d4e810a9176614c0650774 | ORPH
   nios2     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/0462b96868fa85b04480ce34b0299e3d535064d8 |     
    sh4      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/a5589e14ed09af107f91175f9b4ea254adb0d660 |     
    m68k     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/05b320a5587c5080241fe5392af53eb40aab8c7f |     
    sh4      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/2e618a20b52a73bb20a7002e57863aa3a20b627f |     
   nios2     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/77be65725ece60a43b791f85c3b4718bc6a7fca3 |     
    sh4      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/7c277308d30cbc4c07b634fb3df1e917e3404057 |     
    or1k     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/7641c17b67f377cf02e8b650b3d5a97a0032216e |     
   nios2     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/e443954683e170418735554e81fa8d21924273b3 |     
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/d39f360b3c6c789f94bfa135e36540d00a206e09 |     
microblazeel |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/3402da4d6c8317ae9394923db78e76a5c0ad3b37 |     
    sh4      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/bae80bb6c7167f1ce5de62231ac51039c1b0396e |     
    m68k     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/22d701062dd2ac3dcd5b090117d85ad02bb54418 |     
   armeb     |   python-cryptography-37.0.1   | NOK | http://autobuild.buildroot.net/results/45a777370302c0d2cc14e68b24f213a9804c935a |     
    arc      |         python3-3.10.4         | NOK | http://autobuild.buildroot.net/results/0c1ca6b03b5e97834e93c24b338ba7b24994b695 |     
   armeb     |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/0dff5f9a506883fbb160469a749cad09230c0177 |     
powerpc64le  |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/97919618bd34442a74096b8e99bac028e0d0bc6d |     
powerpc64le  |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/9af0763a1c2e24c39daf350310d8f97a84e1ffc4 |     
  sparc64    |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/787145b5c4e187eb0986b7679482949e88605230 |     
microblazeel |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/c1f9e8dcccbd5ca93d46f292d45b2710383b110d |     
    sh4a     |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/50158dffe4f70beb9c5dc9952393085213a41908 |     
microblazeel |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/499631c3340b3d606f28c2f0b35ff55ebd00c43d |     
   mipsel    |            rauc-1.6            | NOK | http://autobuild.buildroot.net/results/5d24b8b825e0d19bf99c293349a7896c20d72981 |     
   mipsel    |           refpolicy            | NOK | http://autobuild.buildroot.net/results/1658c98a36802b190c2c9069a99d9097905c039c |     
    or1k     | rtl8188eu-903b6fcb821465fe9... | NOK | http://autobuild.buildroot.net/results/9514704d6d44fc1b5dd188eac06b269427d3dee2 |     
 microblaze  | rtl8723bs-11ab92d8ccd71c80f... | NOK | http://autobuild.buildroot.net/results/59fadf7540b7612c1a8423871e410fc27eebe59c |     
   s390x     | rtl8723bu-19b4bdc05483a1e79... | NOK | http://autobuild.buildroot.net/results/cbf161288ed18ceb905829d90f321a7b59cee187 | ORPH
   arceb     | rtl8723bu-19b4bdc05483a1e79... | NOK | http://autobuild.buildroot.net/results/5988700c275457c731f4e20cb65e6e9412aef986 | ORPH
microblazeel | rtl8812au-aircrack-ng-3a640... | NOK | http://autobuild.buildroot.net/results/88b0ec2932d7ffba623f1893f3abc56ac17ef3bd |     
   sparc     |          sngrep-1.4.7          | NOK | http://autobuild.buildroot.net/results/3734c1c3e698cb07221fc4337d436a1a03174ef9 | ORPH
   s390x     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/78326d0af40e1e6393414e8f2b8ab633b3d1923c |     
   s390x     |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/2be48b1e216906bf50aee81d74b49dc3ab366b1b |     
   nios2     |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/ac76e612d29bafff2286658fc646d3f88d687b43 |     
   armeb     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/16f524cd480ed9ba8f41aec47a58e558c83de259 | ORPH
   armeb     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/f6b919cb02ceecf29c5c88510ec623f8e691f8eb | ORPH
   armeb     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/754d3ca03afd0eb898bcc64459bb1ccb47e93bce | ORPH
  mips64el   | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/fa247a8ddfb7e0740886bcb86b1cc195a9ca1fce | ORPH
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/f2d3ca24c73a2d2e6a4b248135f51282021a38fd |     
   armeb     |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/41aba76ed0be71510583f0187545cf899b45b6c0 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/b32108e40309792136ac630caad3ed596878f228 |     
   armeb     |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/70336f18ba307bcb89e3043047996c66f1566f09 |     
   arceb     |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/49517c9997bbd0e07cfd57854174626929a8a2e7 |     
   armeb     |            unknown             | NOK | http://autobuild.buildroot.net/results/30ea8922024640cade7bfe77fd70290034f6a817 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/bd1b954d24b946e075dccb29399784641968f835 |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/56f631e6547659f07021bed3c48f0422d09cb5cc |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/eceae1d46375437e285f8aa6e68906502f6efdfd |     
  riscv64    |          vlc-3.0.17.4          | NOK | http://autobuild.buildroot.net/results/51b072a583347b0d309e3f2d4947d51a345ed519 |     
  mips64el   |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/7aeafa6a8fe62c9d78558e94ba38b53acea6e3da |     
 powerpc64   |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/1245b85727fe591a25ebb94b815c9c68c34934a0 |     
   s390x     |            xenomai             | NOK | http://autobuild.buildroot.net/results/1453c2122ac3b80fdfbc0e0912a81107e3a3d732 |     
  mips64el   |        xfsprogs-5.14.2         | NOK | http://autobuild.buildroot.net/results/94ea40a589e19fcfe3fd4799fa847ac313f45e9d | ORPH
    arm      |        xfsprogs-5.14.2         | NOK | http://autobuild.buildroot.net/results/d41f4dca6763b255c221f2782649d7c3c710d4c7 | ORPH
    or1k     | xr819-xradio-16180b6308e3c5... | NOK | http://autobuild.buildroot.net/results/2ad11cd7a9ca6b694854730e46260a944e8c4bac |     
  sparc64    |       xscreensaver-6.03        | NOK | http://autobuild.buildroot.net/results/84575eec1d4226c46ac96bfc98963f38fa75a762 |     
    arm      |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/129823e38440b08d95256b097437bef7ed935239 |     
    arm      |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/19eb436d0ec74188de770f88ec7b288b3c1b2b3d |     
    or1k     |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/94ae0f7b437aac40273729e6aee666c6e9c6a07f |     
    sh4      |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/a275db880f87591619efde04a2640aab1ca02d93 |     
    or1k     |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/7c1cf347c4435236b29baa4fc3c473db4c379ec1 |     
    i686     |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/6b48300a57f6c489ef5335f052ef0c131e915e5a |     
microblazeel |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/1906e798d90f665a9cd832643ed40ab1e17dd057 |     
  powerpc    |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/836a1cacef5606f93f5e892d11799446e8a6c2b4 |     
 microblaze  |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/1abe22016687e28f8541ed1148b5a29e3572e392 |     
    arc      |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/5766da1c30543b435231a068f09d1c012a742c7b |     
    arm      |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/c3af4125f91cbb7f5d13d0230a1f33162b345a87 |     
    arm      |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/6afc00217196ae653f39997e64536e01b4225b58 |     
   arceb     |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/c56323c6148a1268af12f5334ec2f24baf4275b1 |     
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/4f5cd3e00f42f7a7a5ddfaee7e1de51621348546 | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/7c0f758d60ce60050f0e87ce13be691a0e678ff7 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/9803a4e784a635aecdb57e2b27a3a95b377194b6 | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/896853a64ca6e1e23510f65501fc676ac6e9a7b1 | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/0a5ef1589d23daf869ad4f5ccba69dfc3e91a55d | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/ba2c3fef7922b4ed5b041bede27ccb66c7e9cdf9 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/2918690a7c978c1e65d4a4ffc51cbb8229a90eff | ORPH
microblazeel |           zstd-1.5.2           | NOK | http://autobuild.buildroot.net/results/a98fab0a68a9e08a1d0d1bb52024d5c4ebdf04c1 |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

      gst1-plugins-good-1.20.1 | 1 
tvheadend-1295dd2be863f5beb... | 1 
                    vlc-3.0.16 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |    gst1-plugins-good-1.20.1    | NOK | http://autobuild.buildroot.net/results/d62360256f3a35ae477cbb2ec3dc2e82664918bd | ORPH
  mips64el   | tvheadend-1295dd2be863f5beb... | NOK | http://autobuild.buildroot.net/results/09b549448e863f9a2aa2854fbdb9e5c967ef4cb7 |     
    arc      |           vlc-3.0.16           | NOK | http://autobuild.buildroot.net/results/7e5bf87a3b0a2c8b14f6a103d504e585112ba1d9 |     


Gitlab CI results for 2022-05-03
================================


-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
