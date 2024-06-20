Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70626C27C79
	for <buildroot@archiver.kernel.org>; Thu, 20 Jun 2024 04:35:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1DEB243424;
	Thu, 20 Jun 2024 04:35:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WzKFDLZpXini; Thu, 20 Jun 2024 04:35:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C66434341F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C66434341F;
	Thu, 20 Jun 2024 04:35:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BECC21BF263
 for <buildroot@lists.busybox.net>; Thu, 20 Jun 2024 04:35:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AD18A8453B
 for <buildroot@lists.busybox.net>; Thu, 20 Jun 2024 04:35:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ls5MUbemfXoJ for <buildroot@lists.busybox.net>;
 Thu, 20 Jun 2024 04:35:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 696738447C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 696738447C
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 696738447C
 for <buildroot@buildroot.org>; Thu, 20 Jun 2024 04:35:46 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4852624000A
 for <buildroot@buildroot.org>; Thu, 20 Jun 2024 04:35:43 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Thu, 20 Jun 2024 04:35:43 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1718858143; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=LqU1AQ8NavYfaAKNO3qJJxoNWbJ+mLVS6MI5Gu9BBj0=;
 b=BRkfiNk/0xhSk2wUmniRFFjSTy3c1FlWCdmCb95pO35Kj68CA4N729xgt95BsT8Pa7LrCO
 KREbdZS7bluVtXn/zuvERASGKjCr1Nx7EttXpvoDnJ1hB6W6jzobAJ4PjwZQHbNPiXYuzb
 350OFx70smcsMIDmtuMAUf7BCwnNvKyoz1mSYTjowsnlUUmQ8JIRkLQhxkKl+/c980DJKS
 xs+1vmWsf+V8OaMRgQAmjTcKnizsI2ZT5g6PM0c/gx50EGn4GBySaqNBMfK2S63ATxaQs0
 1YjSG4oJzeWQYuiVCa+FzrR/RCv5J5ohlV6MtMwmFWqYBFqcNC7CHoWJ7+Ig3A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BRkfiNk/
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-06-19
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
Message-ID: <20240620043543.xsSgOjlAIasXy_RQVJice7lInZZLugslS6ew2z3LZag@z>

Hello,

Autobuild statistics for 2024-06-19
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  6  |  6  |  1  | 13  |
  2024.05.x  |  5  | 12  |  0  | 17  |
    master   | 131 | 345 |  1  | 477 |

Classification of failures by reason for master
-----------------------------------------------

host-prelink-cross-a853a5d7... | 54
            host-cdrkit-1.1.11 | 21
ibm-sw-tpm2-5452af422edeff7... | 17
                libressl-3.8.4 | 16
                elfutils-0.189 | 13
                   host-go-src | 13
                    mpir-3.0.0 | 12
                host-odb-2.4.0 | 11
                  ffmpeg-6.1.1 | 9 
host-vboot-utils-bbdd62f9b0... | 9 
      host-riscv-isa-sim-1.1.0 | 8 
                fail2ban-1.0.2 | 7 
                gnu-efi-3.0.18 | 7 
                s6-dns-2.3.7.1 | 7 
check-11970a7e112dfe243a2e6... | 6 
                  libffi-3.4.6 | 6 
              libopenssl-3.3.1 | 5 
                   linux-6.9.4 | 5 
                  bcusdk-0.0.5 | 4 
brcm-patchram-plus-95b7b691... | 4 
         host-libxcrypt-4.4.36 | 4 
          libcamera-apps-1.2.1 | 4 
                   bullet-3.25 | 3 
                 dc3dd-7.2.641 | 3 
glibc-2.39-74-g198632a05f6c... | 3 
                 gnuplot-6.0.0 | 3 
host-android-tools-4.2.2+gi... | 3 
pppd-e1266c76d1ad39f98f1167... | 3 
         python-remi-2022.7.27 | 3 
aer-inject-9bd5e2c7886fca72... | 2 
aubio-152d6819b360c2e7b379e... | 2 
                   bird-2.0.12 | 2 
                 coreutils-9.3 | 2 
host-heimdal-f4faaeaba371ff... | 2 
               ipmitool-1_8_19 | 2 
              libarchive-3.7.4 | 2 
               libunwind-1.8.1 | 2 
                memtest86-6.20 | 2 
                     mtd-2.2.0 | 2 
                    ncmpc-0.49 | 2 
                 openssh-9.7p1 | 2 
                 uclibc-1.0.48 | 2 
                       unknown | 2 
android-tools-4.2.2+git2013... | 1 
                 apache-2.4.59 | 1 
     bandwidthd-2.0.1-auto-r11 | 1 
                beecrypt-4.2.1 | 1 
  binutils-arc-2023.09-release | 1 
                  bitcoin-26.0 | 1 
                  boost-1.83.0 | 1 
                bpftool-v7.1.0 | 1 
                 cdrkit-1.1.11 | 1 
             containerd-1.7.14 | 1 
                   cpuload-0.3 | 1 
                     crun-1.12 | 1 
             docker-cli-26.0.2 | 1 
                   duma-2.5.21 | 1 
                     file-5.45 | 1 
              fluent-bit-3.0.3 | 1 
                   foot-1.16.2 | 1 
              gcc-final-13.3.0 | 1 
            gdk-pixbuf-2.42.10 | 1 
                 glibmm-2.76.0 | 1 
         gobject-introspection | 1 
google-breakpad-f49c2f1a202... | 1 
         host-gcc-final-13.3.0 | 1 
              host-rust-1.74.1 | 1 
 host-softether-4.30-9700-beta | 1 
igh-ethercat-f5dc109176400f... | 1 
                   libcap-2.69 | 1 
                 libcddb-1.3.2 | 1 
             libgphoto2-2.5.27 | 1 
                  libnss-3.100 | 1 
                 libp11-0.4.12 | 1 
                librsvg-2.50.9 | 1 
                  libsepol-3.6 | 1 
                   libsha1-0.3 | 1 
          linux-5.10.162-cip24 | 1 
               linux-pam-1.6.1 | 1 
                   linux-tools | 1 
ltrace-82c66409c7a93ca6ad2e... | 1 
            luaossl-20220711-0 | 1 
           mediastreamer-4.4.8 | 1 
            mesa3d-demos-9.0.0 | 1 
            nodejs-src-20.11.1 | 1 
                 pixman-0.42.2 | 1 
               pulseaudio-17.0 | 1 
    python-cryptography-39.0.2 | 1 
          python-grpcio-1.60.0 | 1 
           python-numpy-1.25.0 | 1 
                rocksdb-6.20.3 | 1 
rtl8822cs-fda6cd263e8956727... | 1 
                 shadow-4.14.5 | 1 
squeezelite-71c012ad9ba102f... | 1 
                tinifier-3.4.0 | 1 
           uboot-tools-2021.07 | 1 
                   uhd-4.3.0.0 | 1 
               valgrind-3.22.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/40daa5a911aceb30037abcd5cf2c8062973b7821 | ORPH
   armeb     | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/0aa72a5552d585c636b00c8fb05ef0eaeb6a1d25 | ORPH
   sparc     | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/713331331ed606b561f67591087b64273259bbf3 |     
    arm      |         apache-2.4.59          | NOK | http://autobuild.buildroot.net/results/ad4dc258981f7907d6d5e212ad81fe5cfcbe6b05 |     
    or1k     | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.net/results/6f2b85972895d34b30e0c5b5124e65da3c57c2f2 |     
  sparc64    | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.net/results/b9415d5928899dd8b1d762bc6cce252738098d88 |     
   nios2     |   bandwidthd-2.0.1-auto-r11    | NOK | http://autobuild.buildroot.net/results/6bcd128451ddbb286986e5c862412e9b92cb017b |     
  aarch64    |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/eb3e9e97710103a0b74ae5f06726aad084d5f850 |     
  sparc64    |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/61419d304503e2526865c41db584719014ce7929 |     
    arc      |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/7f147083ee53ffb9e98a58bcebd9e79a7489fde7 |     
   arceb     |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/f2fdca57cbfb618d11f8b11ccd150c019fc2771e |     
   nios2     |         beecrypt-4.2.1         | NOK | http://autobuild.buildroot.net/results/81554af0bd587c3b127ee21900c7237638715d8a | ORPH
   arceb     |  binutils-arc-2023.09-release  | NOK | http://autobuild.buildroot.net/results/1302f81a34efca290c4bc88148c6ae4bb6151056 |     
   xtensa    |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/20591f8419a312f5582a4c6144b114786a46efb4 |     
 powerpc64   |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/92412352564b6240b3d800123efd9c78b4be94af |     
    m68k     |          bitcoin-26.0          | NOK | http://autobuild.buildroot.net/results/a76a7d39253f5bca6666cb1512b20de407a25b54 |     
   arceb     |          boost-1.83.0          | NOK | http://autobuild.buildroot.net/results/43b559c59e7bdd38ace812b88a381e9a7ebb605b |     
    arm      |         bpftool-v7.1.0         | NOK | http://autobuild.buildroot.net/results/ab84bfb8e5c659f575e25a5d28615c4d79e968c8 |     
    i686     | brcm-patchram-plus-95b7b691... | NOK | http://autobuild.buildroot.net/results/dc3144e943d84b329f80c5e5e170e202d69e36cf |     
    i586     | brcm-patchram-plus-95b7b691... | NOK | http://autobuild.buildroot.net/results/3296cc31fa56280519903b7d31c14eb5313b292a |     
  aarch64    | brcm-patchram-plus-95b7b691... | NOK | http://autobuild.buildroot.net/results/43d98f56ca61fb8de9e479df92a59bf933c239f3 |     
  aarch64    | brcm-patchram-plus-95b7b691... | NOK | http://autobuild.buildroot.net/results/d5fc975da62293f7e27509a485d7552b292f1f04 |     
  mips64el   |          bullet-3.25           | NOK | http://autobuild.buildroot.net/results/b1c41cda1622091a571209c79751e402b21a14e8 |     
    mips     |          bullet-3.25           | NOK | http://autobuild.buildroot.net/results/5a9391e07c9c3c09b6ea7887e537ac25981b36ba |     
    or1k     |          bullet-3.25           | NOK | http://autobuild.buildroot.net/results/9e7bb5b9baced5e6d6360d7501b25fe21740b86a |     
   mipsel    |         cdrkit-1.1.11          | NOK | http://autobuild.buildroot.net/results/43ed4c6de00a669c540336a70f9de73abdf7d60f |     
   mipsel    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/f1c07147e161f596ccfd0142e48dae91610ff6b5 | ORPH
 microblaze  | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/95e60f92aaaf21ce9d98a87e3a5f0b652fb4c348 | ORPH
   sparc     | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/96ffd48cf37d1556ff67aa56d0d7bd3d0de2953f | ORPH
    or1k     | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/b80e1d359a74bef810cd448021f10b5781947594 | ORPH
    arm      | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/dab4c75122e01f38a7fa33e23afa2b3493e76fa7 | ORPH
    mips     | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/16fdd488d84bafbad2bae163ca11a8fdce26979c | ORPH
  riscv64    |       containerd-1.7.14        | NOK | http://autobuild.buildroot.net/results/662e04e1b300900826932962f59ba6e9b03eb5a7 |     
   mipsel    |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/976ee0a3ebb319249830cbdb2c271404d10c80b9 | ORPH
   s390x     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/5d1b1ce4ba2e9b94bb47d67a20a728789d21d7df | ORPH
   armeb     |          cpuload-0.3           | NOK | http://autobuild.buildroot.net/results/94a0870dbb757ecd247d17efe3794582b57f3bcf |     
    arc      |           crun-1.12            | NOK | http://autobuild.buildroot.net/results/3a1b120ec12c8de3066ea3775d326ad6e8f48a21 |     
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/6edc5ab7aa8c4351a56ed40bfdcd2d17fd98e3dc | ORPH
   nios2     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/557a6b6879e0dd49f5405d2a88ed523dbe5399a6 | ORPH
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/1dd0729a588eec1371dcb730362aae7ecd2c3140 | ORPH
  riscv64    |       docker-cli-26.0.2        | NOK | http://autobuild.buildroot.net/results/5a42dd63bc2c18f22cde3cc97433d2f12fce301a |     
  mips64el   |          duma-2.5.21           | NOK | http://autobuild.buildroot.net/results/cf2b6381887fafaf8f1c547182804ad1d54f9594 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/bccef35854d3d86f6fb9b97c27aa8f2cc810013c | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/ad757f4b88e73ccd4d8336394d6de977c12e6d54 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/f70cc234a6a64f75035df387b391204715ecf1ac | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/d2d0decf5475b591018f24ba68b1702647a70782 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/00f7a0932bea84988ab5cda3a12ec64c01668c1a | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/f8494450eeafb1548e14ac91ce0b7c820b230b14 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/3f660b2185f5622900af26c010a558b4bcb4e51f | ORPH
    i686     |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/837c29dd586e767bac7ff59c464c10b06fd1cf23 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/5d4eea9484cdddfb2699c927335aafd8fb2bf182 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/0ae0ab7e30842740cce895bbf296d52b850b454f | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/4a808f070a4a1b07198efda51b04ebcb889cfde3 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/ce877cbf1a3615dbdb82f7415d59c014e6241d1f | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/038cdc0fb14eab35e61f1308bb3772899d852c50 | ORPH
 microblaze  |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/68dacc2a88ac56776822c600d9aaacd323fb19ac |     
   sh4aeb    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/33d25b80686fa115e446aed48d71b27ad71dc149 |     
 aarch64_be  |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/b300452183edc602836dbaa11e6b5e205de68ead |     
   s390x     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/4b0748153ddc993f40f487e862da66d62093fa42 |     
  sparc64    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/89f12739a6e1d51c9abba04e225b9668c135c9ba |     
 aarch64_be  |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/2070ed9e52f648336116a126199f2646ac105849 |     
 aarch64_be  |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/9dde782d9b6894c4ba4f1c765b22f6209a7fb6f8 |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/c5642cb7f574f2378c68ebdb05990169ce504f93 |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/d0e18b313b4d0f41fd74247f1fe93d3c03509676 |     
 microblaze  |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/37792245eadc69fe2581096b66a0c88e7ba42fc0 |     
  riscv32    |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/b51b2afe6da4dabbb58eab2be798c193900399e7 |     
 microblaze  |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/9dbfb9023e15672219bdf078ddb48e6bd33f594e |     
 microblaze  |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/d1576215b19c01e694d88c888ec7183c260222bd |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/5d9da3242af8b9d0f31aca0308071bb11d60f3b0 |     
    arc      |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/d0aeeafabc4b63fc568b75a6e6ca59c65abd367c |     
    arc      |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/9e7a6d760ecc257e32b1d03365a6b1a59d9dc9f6 |     
   armeb     |           file-5.45            | NOK | http://autobuild.buildroot.net/results/c1c4444c945a8c3c46b3c0303cf01bf86fd0837e | ORPH
    arc      |        fluent-bit-3.0.3        | NOK | http://autobuild.buildroot.net/results/8ea0a68be995f495cd5d4f00808c98898f9f48e2 |     
 microblaze  |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/681d57f19c7d3bc7be3fc25e89dffc601259640b |     
  powerpc    |        gcc-final-13.3.0        | NOK | http://autobuild.buildroot.net/results/966c062c9de916b9efee3173025d13e62ec2d8e9 |     
   mipsel    |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/e3321725c37e829931a2bbaad51394c8757548fa | ORPH
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/e58bb4541aff56dce9c1d40cfc2978517ea705ce |     
powerpc64le  | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/fd4a0a68985914cc860b879a46f03bf623a7f414 |     
powerpc64le  | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/955b89ce832818cd6e70e101d9af17723393af58 |     
    or1k     |         glibmm-2.76.0          | NOK | http://autobuild.buildroot.net/results/816eabe46f39ac73724613605cd77bec54784749 |     
  riscv64    |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/702cc48083f0e7abbdeea4850e8123bc9bc204d9 |     
 aarch64_be  |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/6df341b0afe8bca0a3e0608e532165e39f2408c6 |     
    arm      |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/763a3a864021475652cf243ffe78744c476cd7c7 |     
   armeb     |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/3ae3ff714bbdd8ae7179bbe8ec5eb371662e0a27 |     
   armeb     |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/a79cba49a14cb782fee6883529cb8a7c278e93bc |     
  riscv64    |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/5cbb9cee6dc2405b5accccf6a298102754ab3bb3 |     
  riscv64    |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/45bdce92450730e32ed27c6b10fd02c0fac56958 |     
 microblaze  |         gnuplot-6.0.0          | NOK | http://autobuild.buildroot.net/results/89ea8403876b83405d6c2d04770ec8ee1dc9f2ec |     
   nios2     |         gnuplot-6.0.0          | NOK | http://autobuild.buildroot.net/results/4a8d7516beb59fa71562e9c82db4289a80844405 |     
microblazeel |         gnuplot-6.0.0          | NOK | http://autobuild.buildroot.net/results/9dd103f16c1d2a2e9d4a119e47269503ce4fe714 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/1a397458c46aab3454ed0c4d50f6a6eb0b0b4a20 |     
   mipsel    | google-breakpad-f49c2f1a202... | NOK | http://autobuild.buildroot.net/results/82c2baf2256f1f2623a7f75ca9ef5f99a7b8aff8 |     
    arm      | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/666a9f3a685a5d6c906b2f809f1c10b1099714d0 |     
    m68k     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/4fcdd556d8feb44d855dd163f73faeeddfe20f5d |     
  powerpc    | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/9effa2c833f2273b7ec740022e78eefed0d049ca |     
    mips     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/d9e4ffdbe9263ce585e79397e40f4fa3c0edccc4 |     
   nios2     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/2bb2ccf7e85bca71af551d8a85adef32a2222a5f |     
   mips64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/c78560504ff072b70b9c06d4cdad7b12fc80eebc |     
  sparc64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/2290eabab37face579b6f9668a2d5a17a58e77ef |     
   mipsel    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/444be7ee2f819913b3c82d14bbc004cefea0db77 |     
  riscv64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/1343d188be2f06fcd8bdd1e10a2e23211923e0d4 |     
  aarch64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/a83f3b4d2489293b7f1e4ff47f0edee4ea6bf9d3 |     
    arc      |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/244cecd1d68f930603658b76e56183ede34bff5e |     
 powerpc64   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/a656e0c6f89fde140729e1a2db03018c81064c11 |     
  powerpc    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/4f5db2d58124b0ebcbc68140bfd1df5615504c55 |     
   mips64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/fa4db388391698adb9fa0a14619d268d6fe34f2a |     
    or1k     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/2e84ce6e730d595d140214a98f614bf3b1862c84 |     
 microblaze  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/89f5e59783659cf6eed94f29a157152d37bda06f |     
  mips64el   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/ac5b474052bf021bb5acfeab22487a3ba68c3cf3 |     
    mips     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/5bdd2dd8b930e7b1fa4276836aff9a5d1f94df93 |     
    mips     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/e7490eddb65da0ac750d3a3c0cfee8a984179df6 |     
   s390x     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/cafaf698e4bd81d8ae61a0a8608cfd448c740401 |     
    or1k     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/19f048eef56f1f9be3c8c67e11ae8f1a8e5cd8d0 |     
   s390x     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/cda7d1eb0b68a42f662cc6acabaa55043695c8b0 |     
 aarch64_be  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/d04c890d1ca33266112d692688ec026c0e9175c4 |     
   s390x     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/f97d7686e4628f116ea57f9ac8a01812eddbb7ff |     
  powerpc    |     host-gcc-final-13.3.0      | NOK | http://autobuild.buildroot.net/results/3d8ffb14855ada764e984221bae150c72f6b5576 |     
   x86_64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/dcf423ea6e3638035759f75edd4e8490a10ce297 |     
  aarch64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/cfd16a9f54b795a5992edf43075c533aaec97499 |     
  mips64el   |          host-go-src           | NOK | http://autobuild.buildroot.net/results/834df95bb69627db77328e5931c8bc214d83a682 |     
  aarch64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/a001be61c491925167aa8b7faf633743383cb2d6 |     
   mips64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/a9ddaa47ba3827d5212a95ce755780da2cc95db3 |     
  mips64el   |          host-go-src           | NOK | http://autobuild.buildroot.net/results/212a70c9cc15b421808d0e410e0515c0e1858b85 |     
   x86_64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/053a319cbba73e2d1d126a1fe8b7a3f16f94bbd8 |     
   mips64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/347045678c27ee9ce32a1646c6b1d14bfa42eb4d |     
   mips64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/faf0971034803aa1544e17116b2e33bb3d82e376 |     
   s390x     |          host-go-src           | NOK | http://autobuild.buildroot.net/results/c64163579f961fbdd4ff1ca39980a6042225b4da |     
  mips64el   |          host-go-src           | NOK | http://autobuild.buildroot.net/results/ec0fb658a13ddf9fa2a2aa9e55b0af45293e92a3 |     
  riscv64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/2c54977a691494e79dd9238f21dce819884caf29 |     
  riscv64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/b428c437a1b938764581256781120ee85c4d6d59 |     
    i686     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/bab0c09e472031390455f510b061aaba00a75f55 | ORPH
  mips64el   | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/e601a9c1a6dd725bc685077c335e82982568077e | ORPH
   mips64    |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/abe84e2e0dc17fa6da5392da62fa2bf25babad15 |     
   mipsel    |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/f181a2821066b2e95f7d0219471934fa40c1a767 |     
   mipsel    |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/755e16cbbe70ac25e924eb34272e2591a2c7dc48 |     
powerpc64le  |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/f1f3883847bcf3af67b42a28f5c78bb154292afc |     
   nios2     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/3c907ca1c40334dc7c999e5bdf0042b9275033f5 | ORPH
    mips     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/e6679e8ee9132ba4065dd1c6d3adb1a6966aa926 | ORPH
    i686     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/8f12eea4c58dc682f8623b14b7900548863953c3 | ORPH
    i686     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/8c819d91fe985ea0307cd50ee78ed196654feecb | ORPH
powerpc64le  |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/1f74f7f7f197aec0469d20b4a208e88e5dd0dc85 | ORPH
   mipsel    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/a8bc6b30fb6b35853ad3f35e9923525db9d79c2d | ORPH
   mips64    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/6330f41b4aba7e6084c1d74b49277ac033f3ffe0 | ORPH
   mips64    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/c514906c5d72b6245d4c686a9428c01d50ef3a36 | ORPH
 aarch64_be  |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/c44956f8bf04d06e24317efe1e061af8eaef2094 | ORPH
   xtensa    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/2dafacdb478e847ba8464cc44e43b076bc1e756a | ORPH
 powerpc64   |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/26f5d1685378674513fee27e7bb78b2eee6691ad | ORPH
   arceb     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/ff6eb9d65bd32b9831d8cf8849a80425878897c9 | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/9858307d4f6c6c668a8135577b86cd390d6d93ae | ORPH
 powerpc64   | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/02146cb81e1d51d7f2f6d947d5f2e945b9a482d5 | ORPH
    m68k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/6d426880f3fea62fd8d91da8fb99c476d8b114d1 | ORPH
  aarch64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/ea27458f0c153a90a3a2434f5e528a306ea6785b | ORPH
  aarch64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/abd190bf2d5fae79c10d59f799f63896c28c051e | ORPH
   s390x     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/d90846076d3bc07abcbc144390ad8b4dc9ff7a93 | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/39131a4bdf36537ef5cb74ddf56fbde96e023d63 | ORPH
microblazeel | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/2cd1ea8824dc1e6d63b9257919d7bac124d8e4f4 | ORPH
    m68k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/bb6e46c9ef029f3a1f01820073ca100dc6c5fe22 | ORPH
   mips64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/1a8fbdba7a3a932b7883b4881024f1bf68612971 | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/4e90c010e3d1bc7a7206beb2428d30e9850d501a | ORPH
 microblaze  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/2836c45c178ffc5594dffd272b6d2cb52390f60f | ORPH
   sh4aeb    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/ad6346799cbd897ea13f73ee01b53962b5ad3251 | ORPH
   mipsel    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/543b1fac62ef81cf2334583268dcb470394e851b | ORPH
 microblaze  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/4af2e94f1162ab60607e299ded1d55cd2e239f52 | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/a1111f04a240625dd2982d76db43c51f34e0d74a | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/8df703c8bf8f822462acb112c6c497563ee947ef | ORPH
 powerpc64   | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/44c918d62a17f22de0e8fe6da1fb0c6b302ed7bd | ORPH
    i686     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/228e7198b9abeb8d699dc508c9a635846e53807a | ORPH
 microblaze  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/9341f9038ffb4eb43f0776ed06479887e7be46e5 | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/8cfba065eaa41d6f0db477c9d9b0c760335de469 | ORPH
    i686     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/28161773c60ef4fff44ea122d80ab2dd59444fce | ORPH
    sh4      | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/71343f2c901f18a3264d9b8285985357ed2ce38a | ORPH
   x86_64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/9981b24fad0bc1efaf93e45d57dde9772e884c67 | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/36cc1ac41f6543b904c510d551ab8c00ca21f218 | ORPH
  riscv32    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/d68c1d17c03bb7772e261ab0e4f2237e1b59b704 | ORPH
    mips     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/1703deb8c02324c14beffd0c4d7f78e017ff2845 | ORPH
   mipsel    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/8a76aeaafe9f170fac79787d6eebe14adf09c3fc | ORPH
 aarch64_be  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/0e01918e3a50d70736e81b0da741cec9f2867f0a | ORPH
    sh4      | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/e194744298912a3372057caeca94ad26dcbd16f7 | ORPH
  mips64el   | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/020003fd36fa59290c67a29fca08be42c08cbaab | ORPH
    sh4      | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/e4eb2f6ebc8006b763b7132541491b0778b60d86 | ORPH
   mipsel    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/d9c979e7d5a81c45fc8e0b6c14fae0681aff1aa6 | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/ab861117fc55886f45e172377d69549add92f46e | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/088ea9f7464b439e6e9fe955b3c8efd45b21c78d | ORPH
   s390x     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/cc75bffd8c1f6b9c9cadefc482ab7dab477a7690 | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/7d9b0abfa991168fad868ede967976278555b301 | ORPH
    mips     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/f22401eb7b1eb6bbcb0101ef9b23e3432dbc2de6 | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/edce5d408c2ac10d1759959e1e871ab3a046bcd3 | ORPH
   mipsel    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/d0eb91ef494eb70436ea36bb170707cedd713e17 | ORPH
   x86_64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/b34faf0e55d0bce702faf7f0d3926ad7c991c982 | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/fa117682dfc75509c514d5e36276973041fee3d7 | ORPH
   x86_64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/c11af2ed35b5c6e76edaebe86cde1419a7d46f47 | ORPH
    sh4      | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/072d2eb1c3b0a4c2cf3380bc7d2215affda45fb7 | ORPH
  mips64el   | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/cb42b7200cfdbac9329f06198836355d37c851ee | ORPH
    m68k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/d1ea30e4f5c8d625b54da672b51c4e154043276e | ORPH
 powerpc64   | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/de8c68521d4ccf83b7c69f2beee948906193a1fe | ORPH
    i686     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/688868a8f5def32bf832e2c692b6f9b44760928e | ORPH
 microblaze  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/e12c3bfd5842cab02f099026931ad26d3c2f3d2b | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/588896ed36fbb0e91bce891feb1e7f0d99aa8e6e | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/1ef088f8af3f084cf08614caddc0fc7e614b11c5 | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/1429aeb8ccb5918e80d1f33fd347a0d1c31c3e5a | ORPH
    mips     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/876f6638a10f48d1c90094e174a796036206a16e | ORPH
   mipsel    |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/e7b3a6ebf19790f1ab53111965b234582d07aed7 |     
   arceb     |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/11c920dfeccc0fc071b9b3111d2671e467c95b0a |     
   mipsel    |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/b459e0564e5b796de9b4bd3d14e09f16f5b225ca |     
   mips64    |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/0763c60fc8441fd70165d2c502c9c742bd0086ce |     
  aarch64    |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/a17628f4eee75d7384c5fe6abf2b467b1bbaf885 |     
   arceb     |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/bad416c04f3c1959b6b998dfffd61ed18388c42e |     
  mips64el   |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/11ba8b5859872f011c16026f8bc0499945efdb22 |     
   arceb     |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/01b63b90d29b4cc1304842b6818c23f1e5212bf0 |     
   x86_64    |        host-rust-1.74.1        | NOK | http://autobuild.buildroot.net/results/09a99cca402f29d06031091438a14c4af62119df |     
 aarch64_be  | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/3646dafea6029e9a4b09cac2a4fb1cc98e8eeaa8 | ORPH
    mips     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/c93e0e4fa6eed0f651d59db2d6cc40ce55f74678 |     
   arceb     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/2a7c94534e0e7248f98c752299aea4e8970ea3e7 |     
   armeb     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/7a4f364130b9192b75a20e5d7d77c9d8a7bf54a0 |     
   s390x     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/e951593bcaede8220b4c13b33a3e81e9d227522d |     
   mips64    | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/b459839c9f761f866ae95670336c0d1f00c98275 |     
microblazeel | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/7a414470aa692d3874e8ccde3c0551a67b9daa47 |     
    sh4      | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/c4634706176de6edf6ffcfc023afb4b7a9dd6d8f |     
 powerpc64   | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/23948f8ca1667be5d34c4f558c194376311a4f75 |     
    mips     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/71e1c7aa4a86651d5d0f8b29449bc69e2ec235ed |     
   sparc     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/c369f7e8e57d8f2d5c21224a89f0aab341563cc0 |     
   nios2     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/96460479a5995ce043a875d628edb4fc4fde67c7 |     
   armeb     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/28045e8df776e8c3f8a7020db435a74284c8838a |     
  mips64el   | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/d7f642b64bf73b4ccfc6a587d518c5a7ac73f5e1 |     
    arc      | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/eb45850d1a1e3642acb3e84b71af1ea64d4ae715 |     
powerpc64le  | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/787e406bb0243d132759a30c5152f8c43c6a9a97 |     
  sparc64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/ad02dfd841457ae0f5fd5283f7f7e6c8b5740802 |     
   mips64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/4366f351fb7f37a4e8ba4ea1db6495b0008b8b66 |     
   sparc     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/1f8bb4613ff8908247ef5e3f226b0bf1d2803f71 |     
   mips64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/22b519fc5e1d3e3828b3af556e3f212b84ea8bb4 |     
 microblaze  | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/86cea4f9630ede81d8f10fac090534629e7b8a7a |     
  sparc64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/0b4b2ac1639e051b8d87821e8e3933a68796ddae |     
   sparc     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/bf55fc89341b1987d473c60e4995f6ee43081d75 |     
    arm      | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/34226f323d52c4058ffb888e068a8cfc215b05b5 |     
  mips64el   | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/3b9616c35434300c7324761eef60c743f8d8291c |     
  mips64el   | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/b6215062f68d6e8d37bbb18d50916dd9f89eca77 |     
    i686     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/81a0d94b94353f3ebca6d7e74a59b702b98dd1d7 |     
microblazeel | igh-ethercat-f5dc109176400f... | NOK | http://autobuild.buildroot.net/results/6ddd3bf4c679d936e8cfee12c25598b4b7e4c01e |     
   x86_64    |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/5dad626c4f4b8d5916926e370ad81649c27d8bb9 |     
   arceb     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/4448c1b1fbc517217902bc79dd56ce0779b3aa1e |     
    or1k     |        libarchive-3.7.4        | NOK | http://autobuild.buildroot.net/results/5d53c43a4a1eff8bcd059a8fb25fb1682d1732f1 |     
   s390x     |        libarchive-3.7.4        | NOK | http://autobuild.buildroot.net/results/c82fe904bf7e7e6bd09f634a1fc1564c0024ee68 |     
   x86_64    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/abbd8f74f880565b3c9df3360a414e3804f878a9 |     
  aarch64    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/f8b42a91882b1230ae487485a471dc4130a8097d |     
   x86_64    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/0e356887a34fa37ead030b0f10795cd184f5fbb4 |     
  riscv64    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/762bfe2ec8b745345eaa53bae83af20d0e759f92 |     
 microblaze  |          libcap-2.69           | NOK | http://autobuild.buildroot.net/results/d5008774410a4a6170621f015032abf9c8e5c828 |     
 powerpc64   |         libcddb-1.3.2          | NOK | http://autobuild.buildroot.net/results/136069390beaa1006be6c3eee951553413eb710c |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/7a949dafd11a670cee04129bbd6e9d3047501ab2 |     
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/fc1e38d3f6e645cc419a9d4fd069606a77f31684 |     
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/9b5a3ffb25f4187078611068edab7cd8c713c80b |     
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/f9e043c20a1b1879d5fc0c4e3f214560fcfc6de2 |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/1bb71e772b2721c359148d522d25126da6e2b299 |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/817b556f9c117a0f8c30f57f529006c8fa16f3cd |     
  riscv32    |       libgphoto2-2.5.27        | NOK | http://autobuild.buildroot.net/results/11eb1537d39e1849f1d7f8509415723599654696 | ORPH
 aarch64_be  |          libnss-3.100          | NOK | http://autobuild.buildroot.net/results/205565573c308543168c9495a33c2fb6bff4ea5c |     
microblazeel |        libopenssl-3.3.1        | NOK | http://autobuild.buildroot.net/results/5b8c8637626f928a177f36236000fe56f50fa23a | ORPH
 microblaze  |        libopenssl-3.3.1        | NOK | http://autobuild.buildroot.net/results/30aa6d15ef76ee310473613c49148353fe4f69a6 | ORPH
microblazeel |        libopenssl-3.3.1        | NOK | http://autobuild.buildroot.net/results/98cc713bea6ea4103cac1ebcb164974d0cddd599 | ORPH
microblazeel |        libopenssl-3.3.1        | NOK | http://autobuild.buildroot.net/results/eaa5989c203ded59e281f1181e068bcbb6cec726 | ORPH
 microblaze  |        libopenssl-3.3.1        | NOK | http://autobuild.buildroot.net/results/27347345b7be3c39c3a1f4b99b631548cd02d260 | ORPH
   s390x     |         libp11-0.4.12          | NOK | http://autobuild.buildroot.net/results/ad860d619c178fb5db186fb3bd2f23fa45300734 | ORPH
    arc      |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/95f69697e7747e7c0c677b308d72609af0e7c870 | ORPH
   mips64    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/c57a3925cbc5aa2daadbba6072f2e45a3489044a | ORPH
   s390x     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/d54cdfcf4d239f6f7340299de68f33b2cfcf11c9 | ORPH
   sparc     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/be1f0e3730619cf5d79acbfd505214fa5b7f016b | ORPH
    or1k     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/48880115808a96f0d60626c67ffd95a86ca4c954 | ORPH
   s390x     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/50ad2449b3113dae2d6cb7dd45f2445215d6907e | ORPH
   nios2     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/b014158c8cc7cc71edaf881f975073da4f31ac24 | ORPH
   arceb     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/636646a9ffee6a78299d2b8c94cd7f3354ef6caf | ORPH
   arceb     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/711c6d75179016d555e2d854cbdd3ea748691e59 | ORPH
microblazeel |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/57df58cf5b43f5dce7fc495daa6af6dc7139c5ad | ORPH
 microblaze  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/d680f3a3919a1663541c20e60ca01d33905c6d1f | ORPH
   sparc     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/5881adb6c3c049e3d94baa52caa92883507be998 | ORPH
    or1k     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/e18d691d2cb98d3fa00ec027960cc9f8a0916ef0 | ORPH
  mips64el   |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/ce93bdae7ba9d988b1c5cf4b79369a787372042f | ORPH
 microblaze  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/1baeb6e68af01760152a5420060625804b5c1291 | ORPH
   mips64    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/945983cca1d551a1201355e5da23a3523bca131c | ORPH
   x86_64    |         librsvg-2.50.9         | NOK | http://autobuild.buildroot.net/results/7354cab52d70fe90633cb226df632be0c37fb908 |     
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/2e293289c888f3f0d86afd6cd8bca7de583a7d5b |     
   x86_64    |          libsha1-0.3           | NOK | http://autobuild.buildroot.net/results/bda551f338e618644abcceab51dc446c876e0b9f |     
   mipsel    |        libunwind-1.8.1         | NOK | http://autobuild.buildroot.net/results/bb5a499bb89ef50208526eb8292246c442a35b14 | ORPH
    arm      |        libunwind-1.8.1         | NOK | http://autobuild.buildroot.net/results/1193f6c3e6058c3f4752311eb015b1846fbfe5ed | ORPH
  mips64el   |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/bff49bcb46ee9ba87f277a26dc392ead0ac5b894 | ORPH
   xtensa    |          linux-6.9.4           | NOK | http://autobuild.buildroot.net/results/7eef2e4158f775d01455fb51df692a704179c576 | ORPH
  powerpc    |          linux-6.9.4           | NOK | http://autobuild.buildroot.net/results/af4459f96a23205c30d51f6290c2f9053e50a494 | ORPH
    m68k     |          linux-6.9.4           | NOK | http://autobuild.buildroot.net/results/fcea27f99e1d34e2fa2a609f62dc431b5d8f2c77 | ORPH
  aarch64    |          linux-6.9.4           | NOK | http://autobuild.buildroot.net/results/99c771f66b5b25aeeec38fc737b95d2faba1b83b | ORPH
 powerpc64   |          linux-6.9.4           | NOK | http://autobuild.buildroot.net/results/7e6963650a5f6555ca0263fa84c0c30e984fda4d | ORPH
    i686     |        linux-pam-1.6.1         | NOK | http://autobuild.buildroot.net/results/e683e887a9a206c21f6c8e00c4a0e39235ff89ec | ORPH
   sparc     |          linux-tools           | NOK | http://autobuild.buildroot.net/results/42b44982b77d66db29db6daeb90436de3d4f1198 | ORPH
   x86_64    | ltrace-82c66409c7a93ca6ad2e... | NOK | http://autobuild.buildroot.net/results/0debe255bc44189a2f21b19a52fa1b30c90ec553 | ORPH
    i686     |       luaossl-20220711-0       | NOK | http://autobuild.buildroot.net/results/42f77f1adff5bdad8ff51dc069a96e1192d69048 |     
  aarch64    |      mediastreamer-4.4.8       | NOK | http://autobuild.buildroot.net/results/11096a63be8cf6b69fa099ac6ea414015bfdebdd | ORPH
   x86_64    |         memtest86-6.20         | NOK | http://autobuild.buildroot.net/results/1257ec5f503150a7be6a0409f3835bbe02f36929 |     
    i586     |         memtest86-6.20         | NOK | http://autobuild.buildroot.net/results/af476fd9867c80759ca8fac0841bdbaddfab6f25 |     
   x86_64    |       mesa3d-demos-9.0.0       | NOK | http://autobuild.buildroot.net/results/c81bca7401c72e72841ee05e10002c2c16fe3b11 |     
   nios2     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/2693ad41a4cf34c50712937c95c0d70a877933db |     
  riscv64    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/a1147a0f9f4d310d3e834f785b891c94dc724998 |     
   s390x     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/dfc86db94bd09f770b98adf16a0ec9cbaaeeb14c |     
    or1k     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/e1625439ce25e1cecce6af756e8926419c5ebfdc |     
 powerpc64   |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/698ca182f85c3b9300fa0091cbcac94a81137300 |     
   mipsel    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/fd8dc76805a9790fefc8aff27afcda462fb28e28 |     
   mipsel    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/627e78d260d53695168bf7b1b9fa613809b46ae3 |     
   mipsel    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/5ef2db3338b13bae5ef15f0a5b3847d2160b75be |     
  powerpc    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/435b941b5e4030fa9c3e058b2a3ca2e02fe83ed4 |     
 powerpc64   |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/a00bc4d029ee7b0887a16a963f3c76edc5ccf540 |     
   mips64    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/91b421dd932d87ddaf95c4e4c281785907aa284d |     
  aarch64    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/a3b9d69a2c6b117156a0ca7e5e41545a7cbdd3e8 |     
  riscv64    |           mtd-2.2.0            | NOK | http://autobuild.buildroot.net/results/2d79bd8160407b9f8ec6ed767f9497e67eb17a96 |     
  riscv64    |           mtd-2.2.0            | NOK | http://autobuild.buildroot.net/results/b5d326a3499d317e134359687e116adb1afd8cf1 |     
    or1k     |           ncmpc-0.49           | NOK | http://autobuild.buildroot.net/results/ee76019a4a04ead4d0d63db57183af83417a9104 |     
    m68k     |           ncmpc-0.49           | NOK | http://autobuild.buildroot.net/results/e2010255afe9144ef793d3af16c23590004fcf0d |     
   x86_64    |       nodejs-src-20.11.1       | NOK | http://autobuild.buildroot.net/results/67ca280427da2c55a5f8b5b8a2e238d614cf774c |     
   mips64    |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/598ef0cbf5eed8e48b40bb3aa613e67dd7924cd2 | ORPH
   mipsel    |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/d2c947fd3a4fcd4e626b97d71efd77fca61a6efa | ORPH
   mips64    |         pixman-0.42.2          | NOK | http://autobuild.buildroot.net/results/a031f13cb08d2cfa7d91f8cca4440b9276ccbef3 | ORPH
   sparc     | pppd-e1266c76d1ad39f98f1167... | NOK | http://autobuild.buildroot.net/results/4a2cf67dc4c62d453efec7a910d525943d7f86db |     
  sparc64    | pppd-e1266c76d1ad39f98f1167... | NOK | http://autobuild.buildroot.net/results/418336a8e22ee04dda66b8f1c63b41769b3441ef |     
  sparc64    | pppd-e1266c76d1ad39f98f1167... | NOK | http://autobuild.buildroot.net/results/283f1729e1d3650667f212107941aedd4963f53a |     
microblazeel |        pulseaudio-17.0         | NOK | http://autobuild.buildroot.net/results/8d7a5a5337fdb467831d40fd9ead5cf462f8d232 | ORPH
    i686     |   python-cryptography-39.0.2   | NOK | http://autobuild.buildroot.net/results/3a09dfcdc519d258c17501a8a4b52c48e4bdff1a |     
    arm      |      python-grpcio-1.60.0      | NOK | http://autobuild.buildroot.net/results/350bae8bfb4f773274e240c28a55aefb4c70b697 |     
 powerpc64   |      python-numpy-1.25.0       | NOK | http://autobuild.buildroot.net/results/fd5335547181650617b51227f037fc1c85552661 |     
 aarch64_be  |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/59d9f85d67ead5612445cb80a148a9ae520a4b55 |     
microblazeel |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/77d50d0a119a1b362e47016debc7478bf4b95a06 |     
  aarch64    |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/742aefc50f706677143427e621a51a169eb9ea93 |     
 aarch64_be  |         rocksdb-6.20.3         | NOK | http://autobuild.buildroot.net/results/51eea1bee7104c410a5184911d1147bdb582ebe0 |     
 microblaze  | rtl8822cs-fda6cd263e8956727... | NOK | http://autobuild.buildroot.net/results/dfea6e5747a11623eec615e6dc96a2bf1f60a107 |     
   xtensa    |         s6-dns-2.3.7.1         | NOK | http://autobuild.buildroot.net/results/0e1ad6a41e30c91c433d4198f4eb4efe75703835 |     
 microblaze  |         s6-dns-2.3.7.1         | NOK | http://autobuild.buildroot.net/results/3b168c74ffd4dbc2867f4064ca0803fdf69b09b3 |     
   sparc     |         s6-dns-2.3.7.1         | NOK | http://autobuild.buildroot.net/results/890322de75177d93d5a11ac7a746330c3e4b8dc3 |     
   sparc     |         s6-dns-2.3.7.1         | NOK | http://autobuild.buildroot.net/results/17ed9a08cea18c067d9c943167f2efa5e2791a32 |     
   xtensa    |         s6-dns-2.3.7.1         | NOK | http://autobuild.buildroot.net/results/4d0d72e73849a42daae7d136b9979ca77390b4d5 |     
   sparc     |         s6-dns-2.3.7.1         | NOK | http://autobuild.buildroot.net/results/1be0ce2c0c2996c55177cda5edfc049901c08416 |     
  powerpc    |         s6-dns-2.3.7.1         | NOK | http://autobuild.buildroot.net/results/8a5255058db6001d06490f73847f7efdcf6a2d6c |     
    arm      |         shadow-4.14.5          | NOK | http://autobuild.buildroot.net/results/3712f36a89a4952196c1ef18963370467d1e3e60 |     
powerpc64le  | squeezelite-71c012ad9ba102f... | NOK | http://autobuild.buildroot.net/results/7edc4fd97c374b99e15ab48f33878ad739c33ac5 |     
  riscv64    |         tinifier-3.4.0         | NOK | http://autobuild.buildroot.net/results/00ec3767ba93e2fbe9fd9ab120a1b73bf1b6fb3a |     
   s390x     |      uboot-tools-2021.07       | NOK | http://autobuild.buildroot.net/results/2a81c049b74440aaa4925e5467a2aeacbdd3cede | ORPH
   sparc     |         uclibc-1.0.48          | NOK | http://autobuild.buildroot.net/results/2f0abf3d532a67362e411c7032604d108d80a73a |     
  riscv32    |         uclibc-1.0.48          | NOK | http://autobuild.buildroot.net/results/e8bbb9417e9e2b770daaf6d9d156fdb5f24cc790 |     
    arc      |          uhd-4.3.0.0           | NOK | http://autobuild.buildroot.net/results/542b39d3c835a36ca6c95a12361e5172ca4f7d66 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/72ab7374909c10fed8744e646b657e9d94cbe6ac |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/cd901c2789d3f788f9106a9cfaf7c929545572e2 |     
   mipsel    |        valgrind-3.22.0         | NOK | http://autobuild.buildroot.net/results/9a12e85fafa9b31fffd81e1c0fa961641b75f6ff | ORPH


Classification of failures by reason for 2024.02.x
--------------------------------------------------

          libcamera-apps-1.2.1 | 2 
         gobject-introspection | 1 
                  ntpsec-1.2.3 | 1 
                 openal-1.22.0 | 1 
pppd-e1266c76d1ad39f98f1167... | 1 
                       unknown | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/445a0ec5981ad8dc9a71719458c463ef21773841 |     
    arc      |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/375638393ae9137d3606afe938255221ff74a5bf |     
   x86_64    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/9ecbb5a75e2df99c4b3576e505e429c5d0aea6fb |     
microblazeel |          ntpsec-1.2.3          | NOK | http://autobuild.buildroot.net/results/6100d40d19bbe59dcd34ad74e26a7db59b6e61f1 | ORPH
    mips     |         openal-1.22.0          | NOK | http://autobuild.buildroot.net/results/5c04084fc16f82f5db2c88070386f3ded731f098 | ORPH
  sparc64    | pppd-e1266c76d1ad39f98f1167... | NOK | http://autobuild.buildroot.net/results/fffc7a9b39ea6269be2b709331b1b823a011e810 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/8cf92a5cbdefc71835c373a89490b3721d9418e3 |     


Classification of failures by reason for 2024.05.x
--------------------------------------------------

                fail2ban-1.0.2 | 2 
ibm-sw-tpm2-5452af422edeff7... | 2 
host-heimdal-f4faaeaba371ff... | 1 
          libcamera-apps-1.2.1 | 1 
                libressl-3.8.4 | 1 
                  linux-6.8.12 | 1 
           mediastreamer-4.4.8 | 1 
                opencv3-3.4.19 | 1 
            python-scapy-2.5.0 | 1 
                ustreamer-6.11 | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/8c00facab84a5720f1dbd6a83b0a9aa691afc75c |     
   x86_64    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/92a18f467c2848d730864454104b713ceb57a28f |     
    arm      | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/480bea87ef21250bff4508629ee525c86ab70390 | ORPH
    or1k     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/a86ec5a9a5d0b14485aba1cd7017bf1ebaff66b5 |     
   s390x     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/50ff36259a98feda1c26cc01e8492c112d43d7c2 |     
    arm      |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/885dcfdc0ef70c138cdbd0b8a8e96186b23b553d |     
   nios2     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/052df72430eb936e4deb6795def2378a331b86ed | ORPH
  mips64el   |          linux-6.8.12          | NOK | http://autobuild.buildroot.net/results/9493e36b0386faf3a2bcdad16bb3c7ebc1e6aff9 | ORPH
  powerpc    |      mediastreamer-4.4.8       | NOK | http://autobuild.buildroot.net/results/07bd119fd57aaa60e1a90293793c76e55a7e9393 | ORPH
   s390x     |         opencv3-3.4.19         | NOK | http://autobuild.buildroot.net/results/5c3d935959cfd4125e1fe2566df3703eb6bc49a1 |     
   mipsel    |       python-scapy-2.5.0       | NOK | http://autobuild.buildroot.net/results/fcc052ba246ed9bfcb5ae896e070d883c58c710c |     
    i686     |         ustreamer-6.11         | NOK | http://autobuild.buildroot.net/results/2761de3d503b91889753439db119c6353408dc84 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
