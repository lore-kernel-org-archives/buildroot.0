Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 984AEC433F5
	for <buildroot@archiver.kernel.org>; Mon,  2 May 2022 04:47:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 34D7A818D0;
	Mon,  2 May 2022 04:47:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OdUXsmqQj88C; Mon,  2 May 2022 04:47:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 94C198193E;
	Mon,  2 May 2022 04:47:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DD79B1BF408
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 04:47:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CEF7A4021F
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 04:47:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9DGi8Xh-Giqq for <buildroot@lists.busybox.net>;
 Mon,  2 May 2022 04:47:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 590B740195
 for <buildroot@buildroot.org>; Mon,  2 May 2022 04:47:02 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 72F7D60003
 for <buildroot@buildroot.org>; Mon,  2 May 2022 04:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1651466820; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=nUCPOA2WSrXURQcHUpCPmmNqWznQVAxnWkQRHBL8X48=;
 b=JjPQtBg17+VBPyo/Ii7RknEy3i5f6w8LMUJ4XEjWuvElk5HR7YKvuFGpy8kNedxf2kra6c
 nz3OlPV/92x6U1LS5e31TjUthj/ut/WvUI7f4xGhzIXmvmzmoMFyTyP5LDYeQa/kjw1mOQ
 rrHeI7ehZyGiKC5cXewFUkAQ+kyhLEZpXWLlbdjigvSpdWNutEsYldOZhSybyT38GDUbgc
 DZ2hBG5Lv/j1odBsUKDNNwQNXige9Q/Pykx2BZwgTyeDClrC3iWGzKmAhcNMm4/OqQCPk8
 c85Q/HEVVVZd3J0pZeCkF71dx4JiU6ZkyLAYp/tvNiVb9Bn3PPF4bxSXagzWJQ==
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Mon, 02 May 2022 04:47:00 -0000
Message-Id: <20220502044706.CEF7A4021F@smtp4.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-05-01
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

Autobuild statistics for 2022-05-01
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  | 27  |  9  |  0  | 36  |
    master   | 181 | 256 |  0  | 437 |

Classification of failures by reason for master
-----------------------------------------------

           optee-client-3.17.0 | 28
                    git-2.31.2 | 13
                pciutils-3.8.0 | 13
                 linux-5.15.33 | 9 
               protobuf-3.20.1 | 8 
         host-gcc-final-10.3.0 | 7 
             libopenssl-1.1.1n | 7 
                 uclibc-1.0.40 | 7 
         linux-headers-5.15.33 | 6 
    python-cryptography-37.0.1 | 6 
            qpid-proton-0.35.0 | 6 
         host-gcc-final-11.2.0 | 5 
                host-go-1.18.1 | 4 
               libglib2-2.70.4 | 4 
 Makefile:732: target-finalize | 4 
               target-finalize | 4 
    toolchain-external-bootlin | 4 
                       unknown | 4 
                 zlib-ng-2.0.6 | 4 
                 dash-0.5.11.5 | 3 
                     frr-8.2.2 | 3 
glibc-2.34-109-gd64b08d5ba7... | 3 
                libressl-3.5.2 | 3 
                   perl-5.34.1 | 3 
toolchain-external-bootlin-... | 3 
                 wavemon-0.9.4 | 3 
                       xenomai | 3 
          host-gcc-final-9.4.0 | 2 
host-google-breakpad-c85eb4... | 2 
host-pahole-73383b3a39afe86... | 2 
              libgcrypt-1.10.1 | 2 
linux-headers-5.10.104-cip3... | 2 
luajit-f2b37f51f69ba7e9f8de... | 2 
             netsniff-ng-0.6.8 | 2 
                     refpolicy | 2 
                rng-tools-6.15 | 2 
               tcf-agent-1.7.0 | 2 
toolchain-external-codescap... | 2 
                  zchunk-1.2.2 | 2 
               aircrack-ng-1.6 | 1 
                alsa-lib-1.2.6 | 1 
                 apache-2.4.53 | 1 
                apparmor-3.0.4 | 1 
atest-895b0183a89c15f5e2305... | 1 
                 augeas-1.12.0 | 1 
                    bat-0.19.0 | 1 
                bitcoin-0.21.2 | 1 
                  bitwise-0.43 | 1 
                 coreutils-9.1 | 1 
                 diffutils-3.8 | 1 
              dropbear-2022.82 | 1 
fs/ext2/ext2.mk:65: /home/a... | 1 
fs/ext2/ext2.mk:65: /nvmeda... | 1 
fs/ext2/ext2.mk:65: /nvmeda... | 1 
fs/ext2/ext2.mk:65: /nvmeda... | 1 
fs/f2fs/f2fs.mk:64: /nvmeda... | 1 
fs/ubi/ubi.mk:51: /nvmedata... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
                 fwts-21.11.00 | 1 
                      gdb-10.2 | 1 
  gobject-introspection-1.70.0 | 1 
               gocryptfs-2.2.1 | 1 
              host-delve-1.8.0 | 1 
       host-gcc-initial-10.3.0 | 1 
             host-gtest-1.11.0 | 1 
             host-libbpf-0.7.0 | 1 
              host-libcap-2.64 | 1 
            host-systemd-250.4 | 1 
                   i2pd-2.40.0 | 1 
            igh-ethercat-1.5.2 | 1 
                  jack2-1.9.20 | 1 
                  janet-1.21.2 | 1 
ktap-23bc7a4a94bd9e4e1b8b7c... | 1 
                    liblo-0.31 | 1 
                   libnl-3.5.0 | 1 
                   libnss-3.77 | 1 
                 libpng-1.6.37 | 1 
   libtorrent-rasterbar-1.2.15 | 1 
               libunwind-1.5.0 | 1 
                 libusb-1.0.25 | 1 
           libwebsockets-4.3.1 | 1 
           linux-5.10.104-cip3 | 1 
       linux-5.10.104-cip3-rt3 | 1 
   linux-headers-5.10.104-cip3 | 1 
                  matio-1.5.22 | 1 
                mongodb-4.2.18 | 1 
                     mtd-2.1.3 | 1 
                  ndisc6-1.0.5 | 1 
                    ne10-1.2.1 | 1 
                nodejs-14.18.3 | 1 
                numactl-2.0.14 | 1 
   openvmtools-10.3.5-10430147 | 1 
               pipewire-0.3.50 | 1 
            pkcs11-helper-1.28 | 1 
polkit-a2bf5c9c83b6ae46cbd5... | 1 
                    pppd-2.4.9 | 1 
                  reaver-1.6.6 | 1 
                     shim-15.4 | 1 
             stress-ng-0.13.05 | 1 
uclibc-ng-test-0844445e7358... | 1 
ulog-0389d243352255f6182326... | 1 
                  vlc-3.0.17.4 | 1 
                xenomai-custom | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |        aircrack-ng-1.6         | NOK | http://autobuild.buildroot.net/results/c75fcb891b17853db67733da464dd62a4c1f1ff1 |     
    m68k     |         alsa-lib-1.2.6         | NOK | http://autobuild.buildroot.net/results/b2fac32a6f36f51e1caa6298abe767d6bcce989a |     
    arc      |         apache-2.4.53          | NOK | http://autobuild.buildroot.net/results/90e3a2aaf0ce0451b80c71743209797abeb83d0a |     
   x86_64    |         apparmor-3.0.4         | NOK | http://autobuild.buildroot.net/results/402e9513cac49ee3076c29969cbf6569b15e8629 |     
   mips64    | atest-895b0183a89c15f5e2305... | NOK | http://autobuild.buildroot.net/results/5501ce45e751ccfe7d019510555d0f86e71a1138 |     
  riscv64    |         augeas-1.12.0          | NOK | http://autobuild.buildroot.net/results/185e956c105d26a3554f141c263231a24a42cb21 |     
    i586     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/5b6c129fd488e10b328c27d5cd2916aae9cdee99 |     
   arceb     |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/510b69cf9ae64ad6ae04182e45b7281918b6cdbb |     
  riscv64    |          bitwise-0.43          | NOK | http://autobuild.buildroot.net/results/fd517d1501f19cbff6aee2c9cc5f1aed8b398d46 |     
    sh4      |         coreutils-9.1          | NOK | http://autobuild.buildroot.net/results/c8090aee9a564949bc06957888c9bdf6ae5ab358 | ORPH
  sparc64    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/d35b30dfe1250eb5586f9b6111f1021ee09d0468 | ORPH
 powerpc64   |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/16d03155206904fdd26dd54d398295af89c72d6a | ORPH
 powerpc64   |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/296ea889c71804793758761c919c08619f56640a | ORPH
  powerpc    |         diffutils-3.8          | NOK | http://autobuild.buildroot.net/results/07b54224939eb80e639d07805e3296823bfdb18e | ORPH
    or1k     |        dropbear-2022.82        | NOK | http://autobuild.buildroot.net/results/f3dd0fb06fd8578c3abbc19fb5d3966324052f6e |     
    arc      |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/a923b4079c1831c1bdc79ce5e7245473e249b238 |     
   xtensa    |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/a375856fab3c7d45df5c599566999c4631b04b2c |     
   xtensa    |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/f3e3bd6e0ecb2b8c646ad04242805aaefe9d4f92 |     
   sparc     | fs/ext2/ext2.mk:65: /home/a... | NOK | http://autobuild.buildroot.net/results/24bfa9816be87fb0646fa3cf0e56adac86507d94 |     
    mips     | fs/ext2/ext2.mk:65: /nvmeda... | NOK | http://autobuild.buildroot.net/results/5d7833212bd8a2b575945f848d8c91dabe7d3c30 |     
 powerpc64   | fs/ext2/ext2.mk:65: /nvmeda... | NOK | http://autobuild.buildroot.net/results/51933aaee88350a98c0bb5b95f73407996e967ba |     
   x86_64    | fs/ext2/ext2.mk:65: /nvmeda... | NOK | http://autobuild.buildroot.net/results/d3e8de9778eec596ab27c3258943910a160acd24 |     
  powerpc    | fs/f2fs/f2fs.mk:64: /nvmeda... | NOK | http://autobuild.buildroot.net/results/49e7e4ca04a13fd03b8d80ac734c7cca8a7d86c8 |     
  riscv32    | fs/ubi/ubi.mk:51: /nvmedata... | NOK | http://autobuild.buildroot.net/results/8b301f09b92d45b473c290b126a56f0a13d0287f |     
    m68k     | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/c4537741956c76e5f492d42311f1244f7b64ff7e |     
   mipsel    | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/08396219b1b40236469f0375bdc0e96a05bf97f8 |     
    i686     |         fwts-21.11.00          | NOK | http://autobuild.buildroot.net/results/ac65793980d31e715f84a8fcaa50d074304a988a |     
   sparc     |            gdb-10.2            | NOK | http://autobuild.buildroot.net/results/ecd570523d3f9399b2d50c2180b824aa5b18c940 | ORPH
   xtensa    |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/36d6a9d898e18f558d4c46a9de1290b5b9b0badc |     
 aarch64_be  |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/f258935df4dfe606c4cdebb1cc9c8a52e5924ab8 |     
    mips     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/e4d2926a69207c6c885e5671874f11a0999334e3 |     
  mips64el   |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/89caed54463084cb06ec9908452bd6bd4a97e807 |     
  aarch64    |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/b1b1f7354721e3621c2b5514858919368ed68b4c |     
  mips64el   |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/99d4190e2c579d4ddae1ce293398bb97527da386 |     
  mips64el   |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/3e722bd3a487165ee1e8c0e27886902d8eb977d5 |     
   mipsel    |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/5b03db83e4b5e7ae592f81c26d68adb95bfddef9 |     
    mips     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/d7177eb76d0c5a8adcaa2324862962692241678d |     
    arc      |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/a6e8bd7a92a16df56d4a1bcc149c39864f995307 |     
   armeb     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/34fd147551e695fbd1eb1292ce454c4c0c6ceac4 |     
   mipsel    |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/2c9bef97ba3eb7f2a235ec27000a63f280f4a55d |     
   x86_64    |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/b893b2836522304c4fff4cf162baedbaeaf5ec8e |     
   sh4aeb    | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/5933ef0786cc5c0684116e00bfddab2fa817d919 |     
  riscv32    | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/6d3542c5cc2ab6062f97ab9f3852810043196a93 |     
powerpc64le  | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/e74a1ad5ee2de02c58b7052a889ac55844894a70 |     
   s390x     |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/6dc5f47e3d11d3eedd1b9a24b015f3540d84e837 | ORPH
powerpc64le  |        gocryptfs-2.2.1         | NOK | http://autobuild.buildroot.net/results/2496612495c26534a128008be1069cfa1720ee37 |     
    arm      |        host-delve-1.8.0        | NOK | http://autobuild.buildroot.net/results/a9c2c855dfbcfc88bd3f4ef913ac00b9817bd23b |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/a35505638616e45d7d11670c8a1b14318af2875b |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/a502f9d712b70cbcb1b0caf30f92ca23c1951c6b |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/53322b5ee46567014d6da18cd73e7885ed056d12 |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/8c050258abb77fa68748338565299294d2a2ece6 |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/036284a9824a1e064629966b31ad2671c23e247e |     
  riscv32    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/e57fb37bac3eac5a32d5cdab962a20a613d83ecb |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/8161c8ea334f0784b7bab7f03d7ed0562707be32 |     
  sparc64    |     host-gcc-final-11.2.0      | NOK | http://autobuild.buildroot.net/results/a058ebcaa5c12b50793415181607c662d1301025 |     
 powerpc64   |     host-gcc-final-11.2.0      | NOK | http://autobuild.buildroot.net/results/1c40674098e5684d2dd0cb6e7ed2720992bf3583 |     
 powerpc64   |     host-gcc-final-11.2.0      | NOK | http://autobuild.buildroot.net/results/a974d286e020715d621aa931cf0ae3942adff29e |     
   x86_64    |     host-gcc-final-11.2.0      | NOK | http://autobuild.buildroot.net/results/60efd7521f0660aeb90d4f8295e04dd0f7616f8a |     
   s390x     |     host-gcc-final-11.2.0      | NOK | http://autobuild.buildroot.net/results/444c9b0beda5f871a4850e45a7b524d1c7ce894a |     
  sparc64    |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/612f17f49a41f36c01b03d8a43766b0fab16fbe7 |     
   s390x     |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/f83527c0f22295f2c93a9fac14964ef8f9cf282e |     
    arm      |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/bac69d862f609afbac614f8b0181aee991bc88eb |     
   mips64    |         host-go-1.18.1         | NOK | http://autobuild.buildroot.net/results/00b2188c93aa71a527f9141916e325efcbec44ac |     
  mips64el   |         host-go-1.18.1         | NOK | http://autobuild.buildroot.net/results/3a7d5e7ba373fbe20102221b86a5f7a381b75be8 |     
  mips64el   |         host-go-1.18.1         | NOK | http://autobuild.buildroot.net/results/711cb76a7b3294fb7e640c991546acb27bba7cd8 |     
  mips64el   |         host-go-1.18.1         | NOK | http://autobuild.buildroot.net/results/e06b3d288065af945f1a41bdea72e581b2033491 |     
   mipsel    | host-google-breakpad-c85eb4... | NOK | http://autobuild.buildroot.net/results/05b8f24487d6ff9a85e67c2288e4c9a02bf24587 |     
    mips     | host-google-breakpad-c85eb4... | NOK | http://autobuild.buildroot.net/results/d635a2b74e41aa03428b49752d704074d19cbbfe |     
    sh4      |       host-gtest-1.11.0        | NOK | http://autobuild.buildroot.net/results/8b42535ddc7f80a4fabbbcf013843e47b46cb488 |     
    mips     |       host-libbpf-0.7.0        | NOK | http://autobuild.buildroot.net/results/7c04e9be32ae01f6d0e0532f87e326590fa36547 |     
  powerpc    |        host-libcap-2.64        | NOK | http://autobuild.buildroot.net/results/1e6bbb5b1d6bae846b4d4adeaf145f5fd137c0ea |     
    arm      | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/369cd0d2cc83eb1cd4e0460088ed59f85f13c4b9 |     
    arm      | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/d5af97035401412fdd359934fcff2bb8ca4a7952 |     
   mipsel    |       host-systemd-250.4       | NOK | http://autobuild.buildroot.net/results/e607e3dd6ed803114402864222e81179300885d6 |     
    or1k     |          i2pd-2.40.0           | NOK | http://autobuild.buildroot.net/results/9f732afd599f0fce65c517186081382af62a8e46 |     
 aarch64_be  |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/c4374b87a73ac98c0544d059e55b681c64975e7d |     
    m68k     |          jack2-1.9.20          | NOK | http://autobuild.buildroot.net/results/4b33c3fd40f56ed02ce3b5b5e5b73f3e0a921d0f |     
 microblaze  |          janet-1.21.2          | NOK | http://autobuild.buildroot.net/results/e87bff9a361ef1a04eece72b472185152d69bbbf |     
   nios2     | ktap-23bc7a4a94bd9e4e1b8b7c... | NOK | http://autobuild.buildroot.net/results/612d4d9f12f3a3b4c32b1aed455b76e2d7f50c3f |     
   armeb     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/054e48833de97deb8aa3054527a6383b259a3c8f | ORPH
 powerpc64   |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/c358afbe7f4b8ee90d01d2fb83220130e985ce17 | ORPH
   arceb     |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/eefdf20163bba7a8fc0d0d5c15f7c799279cc308 |     
    arc      |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/cd5ddfc05d2a010ddf04feba55459729f838a64e |     
    arc      |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/22ae1e1d4da2e95f1c01eecef6463a3b347b4206 |     
    arc      |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/34bf9016fb5f601e71b972d994426d245484b3ad |     
   s390x     |           liblo-0.31           | NOK | http://autobuild.buildroot.net/results/293143724d5ebf14835d6f3a4e110cda0ed292a8 | ORPH
   x86_64    |          libnl-3.5.0           | NOK | http://autobuild.buildroot.net/results/151e7869579e35536e0c7010dcbc3a1e6ba5e8de | ORPH
   armeb     |          libnss-3.77           | NOK | http://autobuild.buildroot.net/results/a3178b1c3a8447866dc9ee4d6e9ba28754eef9cc |     
  powerpc    |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/bc737ff11614f160971869569221f4785fa61541 |     
   sparc     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/3f7751d0f30ac21270857c5d11bfb89b3ca68d25 |     
   arceb     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/8658e48b9c49c2a5524c32b0c0b0c60726e0c8bd |     
   sh4eb     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/27ff7cd429c63cf5df97e7c2688d644d9fb5f6df |     
    arc      |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/03ec419e8b767668a09d00f3cf47b813563be545 |     
    arc      |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/a1b0d77a34b5957ced10209fbe1a98ffbaa7fbbb |     
   arceb     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/d0289d870d41c2e717735bb8c15c8996d687848e |     
  riscv64    |         libpng-1.6.37          | NOK | http://autobuild.buildroot.net/results/1a8edd87a717d3af35a15d58b4dbab16a63b4ca4 |     
    mips     |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/15568511cf966f2cbd9384ff91a5fee225183759 | ORPH
   sparc     |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/ed96a78f4fca54dab42b6eb31da3fef148e45448 | ORPH
    i686     |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/d9ecad41fbd09a3a0951fdf0e9a465ae379ceec6 | ORPH
   sparc     |  libtorrent-rasterbar-1.2.15   | NOK | http://autobuild.buildroot.net/results/7afa39656818239e19a9e9e221bf79ae89114940 |     
    arm      |        libunwind-1.5.0         | NOK | http://autobuild.buildroot.net/results/4ccb0c66766354c48cc86399886c637ee3b9cfa9 | ORPH
    or1k     |         libusb-1.0.25          | NOK | http://autobuild.buildroot.net/results/0fc27c3b4f3852da6e2a5fa2375a2682d5f64c11 |     
  sparc64    |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/a83c74c78c64a60cf3b873ffd8137d2f5e3111e4 |     
    mips     |      linux-5.10.104-cip3       | NOK | http://autobuild.buildroot.net/results/e2e449972e2dc4c8aef52c064f046951844d2dae | ORPH
    sh4a     |    linux-5.10.104-cip3-rt3     | NOK | http://autobuild.buildroot.net/results/8e007792e1b3a084939b39d2b5747f74b4872f04 | ORPH
 microblaze  |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/06b0d09539a55986ba9a1a1a1b460c61223b190c | ORPH
    m68k     |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/6e966ce2d25c12a60a722ff3ceda706ad676e596 | ORPH
   mipsel    |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/1fce61e4dd72f552ef80d63ee1294645e03a3a5a | ORPH
   mipsel    |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/1c04471c477c97139b429b1fc171d59312e34d75 | ORPH
    arc      |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/d2165944fc60f401e781d99beecee61a9ef2970e | ORPH
    mips     |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/fca2c9a9b824aa0d42c57a62ff15be7c53cd0a25 | ORPH
  mips64el   |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/bf125d3836383bb8cf5e31d795513aaeeed3c006 | ORPH
   sparc     |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/a657df9e4532afe0532787da0a18b1a0a2ca51c7 | ORPH
   x86_64    |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/260946622073ea436b3d0a1e3137f40e1edf2171 | ORPH
  riscv32    |  linux-headers-5.10.104-cip3   | NOK | http://autobuild.buildroot.net/results/ad9a80cea0d5cad525963bc574c846aae1559e6a | ORPH
   arceb     | linux-headers-5.10.104-cip3... | NOK | http://autobuild.buildroot.net/results/47e6782089fe6c04ee4cd989ebf85896ced64774 | ORPH
  powerpc    | linux-headers-5.10.104-cip3... | NOK | http://autobuild.buildroot.net/results/18883459577dc0fdc01149110ffb81bf1a28c94a | ORPH
   x86_64    |     linux-headers-5.15.33      | NOK | http://autobuild.buildroot.net/results/5e1946f59e144ac68eea2d0fca30b9fdc5c33c87 | ORPH
  riscv64    |     linux-headers-5.15.33      | NOK | http://autobuild.buildroot.net/results/4e11044b37cdfd30a5ca23c68dc2b908400f4e74 | ORPH
    arc      |     linux-headers-5.15.33      | NOK | http://autobuild.buildroot.net/results/35f82c9e6a4ce5312c0f6dd6811ee81749f28ad4 | ORPH
   s390x     |     linux-headers-5.15.33      | NOK | http://autobuild.buildroot.net/results/2316ffbfa744a108befb3cba490cdc380d38cb38 | ORPH
   xtensa    |     linux-headers-5.15.33      | NOK | http://autobuild.buildroot.net/results/c9eab03e2ddb964f19b85680bca5d3e1bba6cbd0 | ORPH
  riscv32    |     linux-headers-5.15.33      | NOK | http://autobuild.buildroot.net/results/518f8f1d3f38b47753d4148387ab40a9cec3933b | ORPH
   armeb     | luajit-f2b37f51f69ba7e9f8de... | NOK | http://autobuild.buildroot.net/results/080562f99dfc3921086fed7ad107b42522399eee |     
   armeb     | luajit-f2b37f51f69ba7e9f8de... | NOK | http://autobuild.buildroot.net/results/06fb37fa6f9fcabd4c2abe3ee1cf28d9a6d58587 |     
  riscv32    | Makefile:732: target-finalize  | NOK | http://autobuild.buildroot.net/results/c950000b722c12b5e8958d0332c1a3598ef2116f |     
  mips64el   | Makefile:732: target-finalize  | NOK | http://autobuild.buildroot.net/results/e3d1f61f2924ce6fcada017374b611a1f357e315 |     
   mipsel    | Makefile:732: target-finalize  | NOK | http://autobuild.buildroot.net/results/7dc15a5de274edaa8e172007fc7745493ee147d9 |     
microblazeel | Makefile:732: target-finalize  | NOK | http://autobuild.buildroot.net/results/fdf297b16369a3e9915d5f8fdbc63f3b82ce219f |     
   nios2     |          matio-1.5.22          | NOK | http://autobuild.buildroot.net/results/9b38d1321119e091d9805865f0f711bac968f5ea |     
   x86_64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/8c8f78783ae88c2e9265aaaeff5612f6aac6177d |     
    mips     |           mtd-2.1.3            | NOK | http://autobuild.buildroot.net/results/4cfa4a0cbab194dd9de0bd0e2b59f14db5602ac2 |     
    arm      |          ndisc6-1.0.5          | NOK | http://autobuild.buildroot.net/results/92635d576bb522e3b5aba9ca6d7e3e09d2cfa1b7 | ORPH
  aarch64    |           ne10-1.2.1           | NOK | http://autobuild.buildroot.net/results/123751aac20ac5e87778d7a1f3310703143e28f3 |     
   mips64    |       netsniff-ng-0.6.8        | NOK | http://autobuild.buildroot.net/results/bfbd7acedcb476a4916e8696e7b1c45429a35ead |     
   mips64    |       netsniff-ng-0.6.8        | NOK | http://autobuild.buildroot.net/results/4d546b19bfdca8ddf970a102f2caca00563da6c7 |     
   mipsel    |         nodejs-14.18.3         | NOK | http://autobuild.buildroot.net/results/5b5f447a11f79c25c1c0550fe28cca7a436ad807 |     
microblazeel |         numactl-2.0.14         | NOK | http://autobuild.buildroot.net/results/923d4fd595f970f16fa4be3da5792a4896f725f3 |     
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/6c4146fe6d1f40432032cbd3fa5438e2c4a0bac1 |     
  aarch64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/beeb00144a98a83c0fc81033ef67ffbe9ef8e24a |     
   x86_64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/f4b731dcd42392508c237d8356626b7506e4b350 |     
  aarch64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/a5797ae1b1891fc4dd754659d5ee3eef0449b433 |     
  riscv64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/38e94f734d24a4506c1a20f5bc65acd147be9276 |     
  powerpc    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/0971042e4d77d9de7afbdd88b05843350f14b95b |     
    arc      |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/5d367482eb548c9a5e2f58206f7ffd578e60cefa |     
    m68k     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/36fed4c35a3b87897f47b2cb9fea3236fe12955b |     
  riscv64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/6c4766b9051bde7572d46c7014694e933bd610a5 |     
    m68k     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/02b530e7ad21f8e332fd7e3eee10dd9e232e3ee4 |     
    or1k     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/efd9a5a0528e7d0a4114fb123c4eb493fe326040 |     
   xtensa    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/8e0dd47c3ab3b4b9065f5ff4a30f3096a58c5401 |     
  sparc64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/43f69b44c6bf79b11d9c29f233c68413455ff27e |     
  riscv64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/a1095ce7cb117b84f799e99971abc2300608571c |     
   xtensa    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/cb3aee5dadb389dd4414c81f542d9a88850cf8d3 |     
  mips64el   |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/fc887b18eb0b1fefba85cd2a52532c919530b05e |     
    sh4a     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/386e70f20b19320aa9219497fbc1a1aa6465c790 |     
 powerpc64   |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/4a5c4fc5c454b299b523f1e4302c13b349d6d37d |     
   x86_64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/0b074b4ed284e9534c19e93bd212419cb149fcb6 |     
   armeb     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/10c94931b1bbc2df873930fe2e0670b90a069f61 |     
  powerpc    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/63f47eef3300dbfb80b8d1aba6817d5dfd5563d8 |     
   arceb     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/a4916efc80d42e0852e1273e050ed9a1f655ce3e |     
    arm      |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/0567037f072d88e59358a86c0d09b2ad9e8e6ada |     
  mips64el   |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/767551ba5271448e5b99c378bf86797b6ac2d69a |     
  sparc64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/63fac2c6ce8f161dcc06f7df99c0f732b0300f42 |     
   mipsel    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/07c08c88599c5f4dec87a8c18fe91d1b5e6eea99 |     
microblazeel |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/db471b0de3158c56f75a7974cac8794d389fd918 |     
   xtensa    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/df90d228b0f4a48ca27b0d3e289a03acb6209fff |     
    arm      |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/c9931d65a8c81ce963fe8dffc20df78deb8a3e31 |     
    i586     |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/6ddcbd38b0b071a310f6dbdfe0efda51156516cf | ORPH
   nios2     |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/30b73b86ece2952afba6f1d66d61b8d2afd3bde3 | ORPH
    i686     |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/f778a865190f22dd057068a130a048518f76f27f | ORPH
    arm      |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/bd9f3a9d61cb09b0d462fcca8e86607ef5434535 | ORPH
  mips64el   |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/778fe6963a273f9ca77e8f80277771f55d146f5d | ORPH
  powerpc    |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/fe52561cd7740481026b0fd13159ea2ab16f8d34 | ORPH
  mips64el   |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/3cf9312894ff3ff6f7e036561e9f4edf566e6e76 | ORPH
    arm      |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/efef2fe86735780f71149bf4a2e6428f1b5d491b | ORPH
  mips64el   |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/eaf6af39b73ccd37bdd06a59d11ea937bb048125 | ORPH
   nios2     |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/d2c9c0605bd92c1307e89da8f7a185172a311c06 | ORPH
  powerpc    |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/34dd4d4e23063ade78c52899b2f95f7234572583 | ORPH
 powerpc64   |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/668ce9cde991fd0c710da2940a0d6f58e3d5f5a0 | ORPH
    arm      |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/45f8f06d32a3d34db5ce300c26943e9985520e56 | ORPH
 microblaze  |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/ef9769564906105b093f6f0b4094ce48b85b700e |     
   armeb     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/97a6d1e8f17943efbdb20e168867ba80cb282f3b |     
    or1k     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/8dbfe534d6e725d1b9071803a31a227112af87e0 |     
    or1k     |        pipewire-0.3.50         | NOK | http://autobuild.buildroot.net/results/241d55918dbadb21ff8ab1e9041a7ba1189a8b25 |     
   x86_64    |       pkcs11-helper-1.28       | NOK | http://autobuild.buildroot.net/results/2691645e2296acd307a7f72953977c913818018a | ORPH
 aarch64_be  | polkit-a2bf5c9c83b6ae46cbd5... | NOK | http://autobuild.buildroot.net/results/32e5f9df4647f9c149cb19aaa0eca1ed4207a6dc |     
   armeb     |           pppd-2.4.9           | NOK | http://autobuild.buildroot.net/results/1e0e3cbef2ab802a8279782c1361ade2ecf391b9 | ORPH
   nios2     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/eb8f0e7d582d6307258ab3990af2c4fed0136669 |     
microblazeel |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/3e2f962d4c74d5a226806a3c143dec06c4a63891 |     
    sh4      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/9bb6025addb385d090d0f8a72b3dfe9b89329a7d |     
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/94ffe5ead5a38cda37d3a16196a62840ea1772e1 |     
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/be5fc35cdf6ea845f0c2250c5f8e23d11b45eada |     
   nios2     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/8f02676989d53517279ad3655e64448a620310bb |     
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/cc487ad6d1a91d9dd856a6ae516deb36eab879e1 |     
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/eed57c48282d8ef6b976919fa4e8e2c025734c92 |     
   s390x     |   python-cryptography-37.0.1   | NOK | http://autobuild.buildroot.net/results/5f570d79bc90080f4e011820c1006100aa243a6e |     
  sparc64    |   python-cryptography-37.0.1   | NOK | http://autobuild.buildroot.net/results/1f2f203ee5130fdfce005281e71bf371699701f3 |     
  aarch64    |   python-cryptography-37.0.1   | NOK | http://autobuild.buildroot.net/results/300f53cf45a5c48f3393e47c9256cce244c6a033 |     
    mips     |   python-cryptography-37.0.1   | NOK | http://autobuild.buildroot.net/results/bbace0aed62720aebf0c2f3fc7c916da344d033d |     
    arm      |   python-cryptography-37.0.1   | NOK | http://autobuild.buildroot.net/results/1ba2701312dfdfc5f8af0f187c2945561aa57333 |     
   s390x     |   python-cryptography-37.0.1   | NOK | http://autobuild.buildroot.net/results/8076e49667260bd14fafb7ea1a19b70cdcda91b7 |     
   xtensa    |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/bb52ab4812f68d437c011bc88df8a21142e20863 |     
    mips     |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/91b61bb9d44caa043959beef4aa2a356bf2f3c4b |     
  mips64el   |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/297326fdf3c46ed55c7dbffec13e0b90e1b4c427 |     
   nios2     |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/1ea133b50e9cb8b5a52c10921c9854536afb0f01 |     
    sh4a     |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/220571473623bad3e05e821afddadb7811241f08 |     
   arceb     |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/c6a05b9c1abc5416b522b31c0e2027292f6e3cf1 |     
    arc      |          reaver-1.6.6          | NOK | http://autobuild.buildroot.net/results/0a59889ec006c0b73594515e4d3b0ffabe855b0e |     
    i686     |           refpolicy            | NOK | http://autobuild.buildroot.net/results/430cc93a98a471bd4804e25f8f9c6d8345c9f5b7 |     
   nios2     |           refpolicy            | NOK | http://autobuild.buildroot.net/results/c88163a8b9619d451c81e1c927d3da4281994617 |     
    arm      |         rng-tools-6.15         | NOK | http://autobuild.buildroot.net/results/f84ddc9e470d24d791388290d2c341c6fd07609c |     
  riscv64    |         rng-tools-6.15         | NOK | http://autobuild.buildroot.net/results/af2a367a9b5858790d752062d9cf2834c271ceff |     
   armeb     |           shim-15.4            | NOK | http://autobuild.buildroot.net/results/bfb7fbbd9786b04f29024984dce92b8e2518778d |     
 microblaze  |       stress-ng-0.13.05        | NOK | http://autobuild.buildroot.net/results/13d35885e37201d87dd09c917a97d9e0b7b08489 |     
  riscv64    |        target-finalize         | NOK | http://autobuild.buildroot.net/results/2c864494a3695429fb3044e55cb0968efe83bcb8 |     
  riscv64    |        target-finalize         | NOK | http://autobuild.buildroot.net/results/23e4804b4ca253da39f9bced252e55a9fbd62ffa |     
    arc      |        target-finalize         | NOK | http://autobuild.buildroot.net/results/20916cbcb75720a4c280d2104b2f58824fb0647b |     
    i686     |        target-finalize         | NOK | http://autobuild.buildroot.net/results/81cce28f4e32719242997c7897d2e706c65deff6 |     
 microblaze  |        tcf-agent-1.7.0         | NOK | http://autobuild.buildroot.net/results/c9be667e0af777a97723f112356863bd7b7b0725 |     
microblazeel |        tcf-agent-1.7.0         | NOK | http://autobuild.buildroot.net/results/007c7063a8e6fe61d896908a8fd2635637f5e084 |     
   mips64    |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/8432b3fadf22e29bdbb698a1c68bb13534d13fca |     
  riscv32    |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/f4948280b744a94e896dd6b2238d598ec1ece63b |     
   nios2     |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/d1ac2b3cf4bd1eb6bbcee15ef6de583e10a7a805 |     
  sparc64    |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/97e85faa57b4bafbd8131790417a87325cdb5d5a |     
   armeb     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/73c9a453c03ecfab1226defe14628dca4c79c5fb | ORPH
   armeb     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/8de5b5be921471076c7bf5849e3c54c1a0730455 | ORPH
   armeb     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/30402415d2c0732dfb1c37f503e0f7cbc797724c | ORPH
  mips64el   | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/0193c008b05e1fad9eda95442a7030bd0109218c | ORPH
   mips64    | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/c50d8110a96203a188a575dd324255fd862ccbd3 | ORPH
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/92a3cb13ef139979ba7d1badaafe6a269ae4369d |     
  riscv64    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/377c94333c0a093eada6aaa7bb11e9a50133216d |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/0b366e0e380978683761742354f4f1a3e922f6c1 |     
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/0530b89929331d51387c0362b4d73d1680a59667 |     
  riscv64    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/1df64c2fa84f5f35d19b54d7ca28ef8293b4bd9a |     
  riscv64    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/f89e89d204baebf482e719760876ce85aa095acd |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/04f2c018ec72119f2a58626c039b365ef1b4fe34 |     
 microblaze  | uclibc-ng-test-0844445e7358... | NOK | http://autobuild.buildroot.net/results/70ed7000f977b747f3133082d2718bb61bccb68e |     
  sparc64    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/ff792c953366dade89ef9f4140f247cb804e2a43 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/14c9a7c2051d0ec4987062715025899368df8410 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/4910df121a17310856b15c12c2b6712606126eef |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/9020a059420f2776318a6c5099bb79cccc035330 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/90b38f97cefc7bc601d53d30efdacf7cea99841e |     
    arm      |          vlc-3.0.17.4          | NOK | http://autobuild.buildroot.net/results/893835802ee971559ca95136e1f473c97228cd36 |     
  powerpc    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/e6e55b086e8d3d6e2a561c426140822335646158 |     
    arm      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/6be045b7f2dcc8d6db673efbfcd9309336572b7d |     
    i686     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/97c4d64c34b47e55d1abb024be6d8267a219d92a |     
   mipsel    |            xenomai             | NOK | http://autobuild.buildroot.net/results/72acb64bd85ec155afc8ba7c2c33f27d55bd4a7d |     
   nios2     |            xenomai             | NOK | http://autobuild.buildroot.net/results/fb7fcbdecfbff67692f5460ac162e14253138896 |     
  mips64el   |            xenomai             | NOK | http://autobuild.buildroot.net/results/34fcc58b26f35b846c77a066efc0722c6d1e7cdf |     
   mips64    |         xenomai-custom         | NOK | http://autobuild.buildroot.net/results/6751bc694425c98a3ae22a1bae060fd15cb345e7 |     
   sparc     |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/4e3985c8bc0f7e11903461b3ae975c2cf60b3c15 |     
  aarch64    |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/b4bfc77354520fec4ba1b04f63ef360350307c6d |     
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/0c32b3e7ec8563d2d4e15a8c5501f398a22057b5 | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/8fa864de1435a79168c4f91b70b31b5ec970f3ae | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/dd33f5d70d590f2fb406a49d61898df730ed31de | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/a133ead8dabd9945bec4a1a26f7609ea532b1fb1 | ORPH


Classification of failures by reason for 2022.02.x
--------------------------------------------------

                       frr-8.1 | 3 
      gst1-plugins-good-1.20.1 | 1 
             host-pahole-v1.23 | 1 
                     mc-4.8.28 | 1 
                     mtd-2.1.3 | 1 
qt-webkit-kiosk-a7720e50f2b... | 1 
tvheadend-1295dd2be863f5beb... | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/fc85e0d28802e1fd98c49f88d8885392c69ddda2 |     
    arc      |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/fc3c8fda4c8f47bed810e9e4e826550e089eea3d |     
    arc      |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/f968d20941fd4159e109ca40f1dcc2f8ba080cae |     
    arm      |    gst1-plugins-good-1.20.1    | NOK | http://autobuild.buildroot.net/results/35f1682a413be3db7395d45315e8ae6d5aa7b654 | ORPH
    sh4      |       host-pahole-v1.23        | NOK | http://autobuild.buildroot.net/results/fa7ae909e0e5a89191999f9c05e45848b981ed98 |     
    arm      |           mc-4.8.28            | NOK | http://autobuild.buildroot.net/results/7f9ec18aa3040d1fd0b7aafc05c6c0b08cb79f39 |     
    mips     |           mtd-2.1.3            | NOK | http://autobuild.buildroot.net/results/e846c596be79e0b18ccbd794d4650c172bdf9ac3 |     
  aarch64    | qt-webkit-kiosk-a7720e50f2b... | NOK | http://autobuild.buildroot.net/results/952124eddf36879a8280dc60b27b401f451e9f8e |     
    arm      | tvheadend-1295dd2be863f5beb... | NOK | http://autobuild.buildroot.net/results/2ea61f6597f13f6e17b56a516343c28db8876ecf |     


Packages having a newer version
===============================

             name              | found by |        link to release-monitoring.org        |   version    |   upstream   | orph?
-------------------------------+----------+----------------------------------------------+--------------+--------------+-------
                        acpica |  DISTRO  | https://release-monitoring.org/project/00018 | 20200717     | 20220331     |     
            adwaita-icon-theme |  DISTRO  | https://release-monitoring.org/project/13117 | 3.37.2       | 42.0         |     
                       agentpp |  DISTRO  | https://release-monitoring.org/project/21316 | 4.5.3        | 4.5.4        |     
                      alsa-lib |  DISTRO  | https://release-monitoring.org/project/00038 | 1.2.6        | 1.2.6.1      |     
                 android-tools |  GUESS   | https://release-monitoring.org/project/13989 | 4.2.2+git... | 12.1.0_r4    |     
                     angularjs |  DISTRO  | https://release-monitoring.org/project/21321 | 1.8.2        | 1.8.3        |     
                      apitrace |  DISTRO  | https://release-monitoring.org/project/06170 | 10.0         | 11.0         |     
                     armadillo |  DISTRO  | https://release-monitoring.org/project/07006 | 9.900.2      | 11.0.1       |     
                        assimp |  DISTRO  | https://release-monitoring.org/project/06988 | 5.2.1        | 5.2.3        |     
                      asterisk |  DISTRO  | https://release-monitoring.org/project/09838 | 16.25.2      | 19.3.3       |     
                   at-spi2-atk |  DISTRO  | https://release-monitoring.org/project/07840 | 2.34.2       | 2.38.0       |     
                  at-spi2-core |  DISTRO  | https://release-monitoring.org/project/07841 | 2.36.0       | 2.44.1       |     
                         audit |  DISTRO  | https://release-monitoring.org/project/15225 | 3.0.7        | 3.0.8        |     
              autoconf-archive |  DISTRO  | https://release-monitoring.org/project/00142 | 2021.02.19   | 2022.02.11   |     
               azure-iot-sdk-c |  DISTRO  | https://release-monitoring.org/project/21322 | LTS_01_20... | 3033-01-05   |     
                        babeld |  DISTRO  | https://release-monitoring.org/project/00154 | 1.9.2        | 1.11         | ORPH
                 balena-engine |  DISTRO  | https://release-monitoring.org/project/141616 | 20.10.12     | 20.10.16     | ORPH
                           bat |  DISTRO  | https://release-monitoring.org/project/241901 | 0.19.0       | 0.20.0       |     
                        batctl |  DISTRO  | https://release-monitoring.org/project/14740 | 2021.0       | 2022.0       |     
                    batman-adv |  DISTRO  | https://release-monitoring.org/project/19529 | 2021.4       | 2022.0       |     
                     bats-core |  DISTRO  | https://release-monitoring.org/project/10587 | 1.4.1        | 1.6.0        |     
                        bcg729 |  DISTRO  | https://release-monitoring.org/project/14743 | 1.0.4        | 1.1.1        |     
                     bctoolbox |  DISTRO  | https://release-monitoring.org/project/14746 | 4.4.8        | 5.1.17       | ORPH
                         bdwgc |  DISTRO  | https://release-monitoring.org/project/17108 | 8.0.6        | 8.2.0        |     
                     belle-sip |  DISTRO  | https://release-monitoring.org/project/14378 | 4.4.8        | 5.1.12       |     
                          belr |  DISTRO  | https://release-monitoring.org/project/80042 | 4.4.8        | 5.1.12       |     
                    berkeleydb |  GUESS   | https://release-monitoring.org/project/138386 | 5.3.28       | 18.1.5       | ORPH
                          bind |  DISTRO  | https://release-monitoring.org/project/14923 | 9.16.27      | 9.18.2       | ORPH
                      binutils |  DISTRO  | https://release-monitoring.org/project/07981 | 2.37         | 2.38         |     
                          bird |  DISTRO  | https://release-monitoring.org/project/00192 | 2.0.8        | 2.0.9        |     
                       bitcoin |  DISTRO  | https://release-monitoring.org/project/13618 | 0.21.2       | 23.0         |     
                        bonnie |  DISTRO  | https://release-monitoring.org/project/00212 | 1.03e        | 2.00a        | ORPH
                         boost |  DISTRO  | https://release-monitoring.org/project/06845 | 1.78.0       | 1.79.0       |     
                     bootstrap |  DISTRO  | https://release-monitoring.org/project/21578 | 4.3.1        | 5.1.3        |     
                   btrfs-progs |  DISTRO  | https://release-monitoring.org/project/00227 | 5.16.2       | 5.17         | ORPH
                        bullet |  DISTRO  | https://release-monitoring.org/project/07669 | 3.21         | 3.24         |     
                        c-icap |  DISTRO  | https://release-monitoring.org/project/21325 | 0.5.7        | 0.5.9        | ORPH
                c-icap-modules |  DISTRO  | https://release-monitoring.org/project/21326 | 0.5.4        | 0.5.5        | ORPH
                         cairo |  DISTRO  | https://release-monitoring.org/project/00247 | 1.16.0       | 1.17.6       |     
                     cantarell |  DISTRO  | https://release-monitoring.org/project/10888 | 0.0.25       | 0.303.1      | ORPH
                        ccache |  DISTRO  | https://release-monitoring.org/project/00257 | 3.7.12       | 4.6          | ORPH
                          ccid |  DISTRO  | https://release-monitoring.org/project/02612 | 1.4.34       | 1.5.0        | ORPH
                        cereal |  DISTRO  | https://release-monitoring.org/project/11606 | 1.3.1        | 1.3.2        |     
                       chartjs |  DISTRO  | https://release-monitoring.org/project/85785 | 2.9.4        | 3.7.1        |     
                   checkpolicy |  DISTRO  | https://release-monitoring.org/project/00276 | 3.3          | 20200710     |     
                    cifs-utils |  DISTRO  | https://release-monitoring.org/project/00287 | 6.13         | 6.15         |     
                        circus |  DISTRO  | https://release-monitoring.org/project/21726 | 0.16.1       | 0.17.1       |     
                        clamav |  DISTRO  | https://release-monitoring.org/project/00291 | 0.103.5      | 0.104.2      |     
                         clang |  DISTRO  | https://release-monitoring.org/project/11811 | 9.0.1        | 14.0.3       |     
                         cmake |  DISTRO  | https://release-monitoring.org/project/00306 | 3.18.6       | 3.23.1       |     
                           cog |  DISTRO  | https://release-monitoring.org/project/21333 | 0.12.4       | 0.13.3       |     
                      collectl |  DISTRO  | https://release-monitoring.org/project/00330 | 4.3.2        | 4.3.3        |     
                    containerd |  DISTRO  | https://release-monitoring.org/project/16460 | 1.6.2        | 1.6.3        |     
                  cups-filters |  DISTRO  | https://release-monitoring.org/project/05541 | 1.28.12      | 1.28.15      |     
                      cutelyst |  DISTRO  | https://release-monitoring.org/project/21335 | 2.11.0       | 3.4.0        |     
                        dacapo |  DISTRO  | https://release-monitoring.org/project/20546 | 9.12-MR1-... | 9.12-vbump   |     
                          daq3 |  DISTRO  | https://release-monitoring.org/project/212345 | 3.0.5        | 3.0.6        |     
                    datatables |  DISTRO  | https://release-monitoring.org/project/141588 | 1.10.20      | 1.11.5       |     
            datatables-buttons |  DISTRO  | https://release-monitoring.org/project/141589 | 1.6.1        | 2.2.2        |     
       datatables-fixedcolumns |  DISTRO  | https://release-monitoring.org/project/141590 | 3.3.0        | 4.0.2        |     
         datatables-responsive |  DISTRO  | https://release-monitoring.org/project/141591 | 2.2.3        | 2.2.9        |     
                          dbus |  DISTRO  | https://release-monitoring.org/project/05356 | 1.12.22      | 1.14.0       | ORPH
                         dc3dd |  DISTRO  | https://release-monitoring.org/project/15086 | 7.2.641      | 7.2.646      | ORPH
                   debianutils |  DISTRO  | https://release-monitoring.org/project/21341 | 4.11         | 5.7          | ORPH
                         delve |  DISTRO  | https://release-monitoring.org/project/40149 | 1.8.0        | 1.8.3        |     
                        dialog |  DISTRO  | https://release-monitoring.org/project/00431 | 1.3-20220117 | 1.3-20220414 | ORPH
                docker-compose |  DISTRO  | https://release-monitoring.org/project/06185 | 1.24.1       | 2.5.0        |     
                    drbd-utils |  DISTRO  | https://release-monitoring.org/project/00462 | 9.19.0       | 9.21.1       |     
                     dropwatch |  DISTRO  | https://release-monitoring.org/project/21344 | 1.5.3        | 1.5.4        |     
                            dt |  DISTRO  | https://release-monitoring.org/project/21844 | 18.32        | 21.27        | ORPH
                      earlyoom |  DISTRO  | https://release-monitoring.org/project/17392 | 1.6.2        | 1.7          |     
                          edk2 |  DISTRO  | https://release-monitoring.org/project/125953 | edk2-stab... | 202202       |     
                        efivar |  DISTRO  | https://release-monitoring.org/project/00664 | 37           | 38           |     
                           efl |  DISTRO  | https://release-monitoring.org/project/06128 | 1.26.1       | 1.26.2       |     
                         eigen |  DISTRO  | https://release-monitoring.org/project/00666 | 3.3.7        | 3.4.0        |     
                      ejabberd |  DISTRO  | https://release-monitoring.org/project/00667 | 20.07        | 21.12        |     
                      elfutils |  DISTRO  | https://release-monitoring.org/project/05679 | 0.186        | 0.187        | ORPH
                        elixir |  DISTRO  | https://release-monitoring.org/project/00673 | 1.9.4        | 1.13.4       |     
                           ell |  DISTRO  | https://release-monitoring.org/project/17781 | 0.49         | 0.50         |     
                 enlightenment |  DISTRO  | https://release-monitoring.org/project/00698 | 0.25.1       | 0.25.3       |     
                        erlang |  DISTRO  | https://release-monitoring.org/project/00707 | 22.3.4.22    | 24.3.3       |     
                   erlang-eimp |  DISTRO  | https://release-monitoring.org/project/17060 | 1.0.17       | 1.0.21       |     
               erlang-goldrush |  DISTRO  | https://release-monitoring.org/project/09692 | 0.1.9        | 0.2.0        |     
                   erlang-idna |  DISTRO  | https://release-monitoring.org/project/45374 | 6.0.0        | 6.1.1        |     
                   erlang-jose |  DISTRO  | https://release-monitoring.org/project/16913 | 1.9.0        | 1.11.2       |     
                  erlang-lager |  DISTRO  | https://release-monitoring.org/project/00727 | 3.6.10       | 3.9.2        |     
                erlang-p1-acme |  DISTRO  | https://release-monitoring.org/project/45375 | 1.0.9        | 1.0.18       |     
           erlang-p1-cache-tab |  DISTRO  | https://release-monitoring.org/project/08757 | 1.0.25       | 1.0.29       |     
              erlang-p1-mqtree |  DISTRO  | https://release-monitoring.org/project/20220 | 1.0.10       | 1.0.14       |     
              erlang-p1-oauth2 |  DISTRO  | https://release-monitoring.org/project/09302 | 0.6.7        | 0.8.0        |     
                erlang-p1-pkix |  DISTRO  | https://release-monitoring.org/project/20539 | 1.0.6        | 1.0.8        |     
                 erlang-p1-sip |  DISTRO  | https://release-monitoring.org/project/10576 | 1.0.38       | 1.0.45       |     
          erlang-p1-stringprep |  DISTRO  | https://release-monitoring.org/project/09222 | 1.0.23       | 1.0.27       |     
                erlang-p1-stun |  DISTRO  | https://release-monitoring.org/project/09151 | 1.0.39       | 1.2.0        |     
                 erlang-p1-tls |  DISTRO  | https://release-monitoring.org/project/10455 | 1.1.9        | 1.1.13       |     
               erlang-p1-utils |  DISTRO  | https://release-monitoring.org/project/08643 | 1.0.20       | 1.0.24       |     
                 erlang-p1-xml |  DISTRO  | https://release-monitoring.org/project/10464 | 1.1.44       | 1.1.48       |     
                erlang-p1-xmpp |  DISTRO  | https://release-monitoring.org/project/12752 | 1.4.10       | 1.5.6        |     
                erlang-p1-yaml |  DISTRO  | https://release-monitoring.org/project/10243 | 1.0.28       | 1.0.32       |     
               erlang-p1-yconf |  DISTRO  | https://release-monitoring.org/project/45378 | 1.0.8        | 1.0.12       |     
                erlang-p1-zlib |  DISTRO  | https://release-monitoring.org/project/09283 | 1.0.9        | 1.0.10       |     
                      execline |  DISTRO  | https://release-monitoring.org/project/05482 | 2.8.0.1      | 2.8.3.0      |     
                         expat |  DISTRO  | https://release-monitoring.org/project/00770 | 2.4.7        | 2.4.8        |     
                      fakeroot |  DISTRO  | https://release-monitoring.org/project/12048 | 1.26         | 1.28         | ORPH
                           feh |  DISTRO  | https://release-monitoring.org/project/00790 | 3.7.1        | 3.8          |     
                     fetchmail |  DISTRO  | https://release-monitoring.org/project/00801 | 6.4.29       | 6.4.30       |     
                        ffmpeg |  DISTRO  | https://release-monitoring.org/project/05405 | 4.4.2        | 5.0.1        |     
                   fftw-double |  DISTRO  | https://release-monitoring.org/project/00803 | 3.3.8        | 3.3.10       | ORPH
              fftw-long-double |  DISTRO  | https://release-monitoring.org/project/00803 | 3.3.8        | 3.3.10       | ORPH
                     fftw-quad |  DISTRO  | https://release-monitoring.org/project/00803 | 3.3.8        | 3.3.10       | ORPH
                   fftw-single |  DISTRO  | https://release-monitoring.org/project/00803 | 3.3.8        | 3.3.10       | ORPH
                           fio |  DISTRO  | https://release-monitoring.org/project/00806 | 3.28         | 3.30         |     
                       flannel |  DISTRO  | https://release-monitoring.org/project/07421 | 0.14.0       | 0.17.0       |     
                  flare-engine |  DISTRO  | https://release-monitoring.org/project/21433 | 1.12         | 1.13.04      |     
                    flare-game |  DISTRO  | https://release-monitoring.org/project/21434 | 1.12         | 1.13.04      |     
                          flot |  DISTRO  | https://release-monitoring.org/project/07184 | 0.8.3        | 4.2.2        | ORPH
                          fltk |  DISTRO  | https://release-monitoring.org/project/00823 | 1.3.7        | 1.3.8        | ORPH
                    fluidsynth |  DISTRO  | https://release-monitoring.org/project/10437 | 2.2.6        | 2.2.7        |     
                           fmc |  GUESS   | https://release-monitoring.org/project/145761 | fsl-sdk-v2.0 | 0.2.0        |     
                  font-awesome |  DISTRO  | https://release-monitoring.org/project/00826 | 4.7.0        | 6.1.1        | ORPH
                    fontconfig |  DISTRO  | https://release-monitoring.org/project/00827 | 2.13.1       | 2.14.0       | ORPH
                       freerdp |  DISTRO  | https://release-monitoring.org/project/10442 | 2.6.1        | 2.7.0        |     
                      freetype |  DISTRO  | https://release-monitoring.org/project/00854 | 2.12.0       | 2.12.1       |     
                fuse-overlayfs |  DISTRO  | https://release-monitoring.org/project/101220 | 1.5.0        | 1.8.2        |     
                          fwts |  DISTRO  | https://release-monitoring.org/project/17383 | 21.11.00     | 22.03.00     |     
                        gauche |  DISTRO  | https://release-monitoring.org/project/00873 | 0.9.9        | 0.9.11       |     
                           gcr |  DISTRO  | https://release-monitoring.org/project/11801 | 3.40.0       | 3.41.0       | ORPH
                          gdbm |  DISTRO  | https://release-monitoring.org/project/00882 | 1.22         | 1.23         | ORPH
                    gdk-pixbuf |  DISTRO  | https://release-monitoring.org/project/09533 | 2.42.4       | 2.42.8       | ORPH
                        gensio |  DISTRO  | https://release-monitoring.org/project/67634 | 2.2.9        | 2.4.0        |     
                   gettext-gnu |  DISTRO  | https://release-monitoring.org/project/00898 | 0.20.1       | 0.21         | ORPH
                   ghostscript |  DISTRO  | https://release-monitoring.org/project/01157 | 9.55.0       | 9.56.1       |     
                           git |  DISTRO  | https://release-monitoring.org/project/05350 | 2.31.2       | 2.36.0       |     
                     git-crypt |  DISTRO  | https://release-monitoring.org/project/17093 | 0.6.0        | 0.7.0        | ORPH
               glib-networking |  DISTRO  | https://release-monitoring.org/project/21353 | 2.70.1       | 2.72.0       | ORPH
                        glibmm |  DISTRO  | https://release-monitoring.org/project/07960 | 2.68.2       | 2.72.0       |     
                           glm |  DISTRO  | https://release-monitoring.org/project/01181 | 0.9.9.5      | 0.9.9.8      | ORPH
                          glog |  DISTRO  | https://release-monitoring.org/project/08732 | 0.5.0        | 0.6.0        |     
                       gnu-efi |  DISTRO  | https://release-monitoring.org/project/01202 | 3.0.10       | 3.0.14       |     
                        gnupg2 |  DISTRO  | https://release-monitoring.org/project/01215 | 2.2.32       | 2.3.6        | ORPH
                      gnuradio |  DISTRO  | https://release-monitoring.org/project/01217 | 3.8.2.0      | 3.10.2.0     |     
         gobject-introspection |  DISTRO  | https://release-monitoring.org/project/01223 | 1.70.0       | 1.72.0       | ORPH
                          gpsd |  DISTRO  | https://release-monitoring.org/project/06846 | 3.23.1       | 3.24         |     
                      gptfdisk |  DISTRO  | https://release-monitoring.org/project/00885 | 1.0.8        | 1.0.9        |     
                          gqrx |  DISTRO  | https://release-monitoring.org/project/09771 | 2.14.4       | 2.15.9       |     
                       granite |  DISTRO  | https://release-monitoring.org/project/05410 | 6.0.0        | 7.0.0        | ORPH
                graphicsmagick |  DISTRO  | https://release-monitoring.org/project/01248 | 1.3.37       | 1.3.38       |     
                         grub2 |  DISTRO  | https://release-monitoring.org/project/01257 | 2.04         | 2.06         |     
     gsettings-desktop-schemas |  DISTRO  | https://release-monitoring.org/project/13139 | 3.36.1       | 42.0         | ORPH
                           gsl |  DISTRO  | https://release-monitoring.org/project/01267 | 2.6          | 2.7.1        | ORPH
                         gssdp |  DISTRO  | https://release-monitoring.org/project/01262 | 1.4.0.1      | 1.5.0        |     
                      gst1-imx |  DISTRO  | https://release-monitoring.org/project/21846 | 0.13.1       | 2.0.0        |     
                        gtkmm3 |  DISTRO  | https://release-monitoring.org/project/07963 | 3.22.0       | 4.6.1        |     
                 gtksourceview |  DISTRO  | https://release-monitoring.org/project/07724 | 3.24.7       | 5.4.1        |     
                         gupnp |  DISTRO  | https://release-monitoring.org/project/01281 | 1.4.3        | 1.5.0        |     
                    gutenprint |  DISTRO  | https://release-monitoring.org/project/01285 | 5.2.14       | 5.3.4        | ORPH
                          gvfs |  DISTRO  | https://release-monitoring.org/project/05496 | 1.48.1       | 1.50.1       | ORPH
                        hackrf |  DISTRO  | https://release-monitoring.org/project/06136 | 2018.01.1    | 2021.03.1    | ORPH
                       haproxy |  DISTRO  | https://release-monitoring.org/project/01298 | 2.4.15       | 2.5.6        |     
                       haveged |  DISTRO  | https://release-monitoring.org/project/11695 | 1.9.15       | 1.9.18       |     
                        hidapi |  DISTRO  | https://release-monitoring.org/project/05594 | 0.11.0       | 0.11.2       | ORPH
                         hplip |  DISTRO  | https://release-monitoring.org/project/01327 | 3.17.10      | 3.22.4       | ORPH
                         hwloc |  DISTRO  | https://release-monitoring.org/project/13501 | 2.7.0        | 2.7.1        |     
                          i2pd |  DISTRO  | https://release-monitoring.org/project/21355 | 2.40.0       | 2.41.0       |     
                           icu |  DISTRO  | https://release-monitoring.org/project/16134 | 70-1         | 71-1         | ORPH
                     ifenslave |  DISTRO  | https://release-monitoring.org/project/21670 | 2.9          | 2.13         | ORPH
                      ifupdown |  DISTRO  | https://release-monitoring.org/project/21673 | 0.8.16       | 0.8.37       | ORPH
                   imagemagick |  DISTRO  | https://release-monitoring.org/project/01372 | 7.1.0-19     | 7.1.0-32     | ORPH
                        imlib2 |  DISTRO  | https://release-monitoring.org/project/21676 | 1.7.3        | 1.9.0        |     
                          inih |  DISTRO  | https://release-monitoring.org/project/11600 | 53           | 55           |     
                 inotify-tools |  DISTRO  | https://release-monitoring.org/project/08864 | 3.20.2.2     | 3.22.1.0     | ORPH
               intel-microcode |  DISTRO  | https://release-monitoring.org/project/20614 | 20210608     | 20220419     | ORPH
                         iperf |  DISTRO  | https://release-monitoring.org/project/01388 | 2.1.6        | 2.1.7        |     
                        iperf3 |  DISTRO  | https://release-monitoring.org/project/01389 | 3.10.1       | 3.11         |     
                      irrlicht |  DISTRO  | https://release-monitoring.org/project/01403 | 1.8.4        | 1.8.5        |     
                           isl |  DISTRO  | https://release-monitoring.org/project/13286 | 0.23         | 0.24         | ORPH
                           iwd |  DISTRO  | https://release-monitoring.org/project/18380 | 1.25         | 1.27         |     
                         jack2 |  DISTRO  | https://release-monitoring.org/project/21358 | 1.9.20       | 1.9.21       |     
                 janus-gateway |  DISTRO  | https://release-monitoring.org/project/15715 | 0.11.6       | 1.0.1        |     
                        jasper |  DISTRO  | https://release-monitoring.org/project/01421 | 2.0.33       | 3.0.3        |     
         jitterentropy-library |  DISTRO  | https://release-monitoring.org/project/29701 | 3.3.1        | 3.4.0        |     
         jquery-datetimepicker |  DISTRO  | https://release-monitoring.org/project/13910 | 2.4.5        | 2.5.20       |     
               jquery-keyboard |  DISTRO  | https://release-monitoring.org/project/21681 | 1.18.12      | 1.30.4       | ORPH
                 jquery-mobile |  DISTRO  | https://release-monitoring.org/project/59395 | 1.4.3        | 1.4.5        | ORPH
                     jquery-ui |  DISTRO  | https://release-monitoring.org/project/21815 | 1.10.4       | 1.13.1       |     
              jquery-ui-themes |  DISTRO  | https://release-monitoring.org/project/21816 | 1.10.4       | 1.13.1       |     
                        json-c |  DISTRO  | https://release-monitoring.org/project/01477 | 0.15         | 0.16         |     
                         jszip |  DISTRO  | https://release-monitoring.org/project/141558 | 3.2.2        | 3.9.1        |     
                         kexec |  DISTRO  | https://release-monitoring.org/project/12689 | 2.0.23       | 2.0.24       | ORPH
       kf5-extra-cmake-modules |  DISTRO  | https://release-monitoring.org/project/08762 | 5.91.0       | 5.93.0       |     
               kf5-kcoreaddons |  DISTRO  | https://release-monitoring.org/project/08762 | 5.91.0       | 5.93.0       |     
           kf5-modemmanager-qt |  DISTRO  | https://release-monitoring.org/project/08762 | 5.91.0       | 5.93.0       |     
         kf5-networkmanager-qt |  DISTRO  | https://release-monitoring.org/project/08762 | 5.91.0       | 5.93.0       |     
     kodi-audiodecoder-modplug |  DISTRO  | https://release-monitoring.org/project/21818 | 19.0.2-Ma... | 20.2.0-Nexus |     
    kodi-audiodecoder-nosefart |  DISTRO  | https://release-monitoring.org/project/21819 | 19.0.2-Ma... | 20.2.0-Nexus |     
     kodi-audiodecoder-sidplay |  DISTRO  | https://release-monitoring.org/project/21820 | 19.0.1-Ma... | 20.2.0-Nexus |     
     kodi-audiodecoder-snesapu |  DISTRO  | https://release-monitoring.org/project/21802 | 19.0.2-Ma... | 20.2.0-Nexus |     
     kodi-audiodecoder-stsound |  DISTRO  | https://release-monitoring.org/project/21801 | 19.0.1-Ma... | 20.2.0-Nexus |     
    kodi-audiodecoder-timidity |  DISTRO  | https://release-monitoring.org/project/21800 | 19.0.2-Ma... | 20.2.0-Nexus |     
   kodi-audiodecoder-vgmstream |  DISTRO  | https://release-monitoring.org/project/21799 | 19.0.0-Ma... | 20.2.0-Nexus |     
        kodi-audioencoder-flac |  DISTRO  | https://release-monitoring.org/project/17755 | 19.0.1-Ma... | 20.2.0-Nexus |     
        kodi-audioencoder-lame |  DISTRO  | https://release-monitoring.org/project/21798 | 19.1.2-Ma... | 20.3.0-Nexus |     
      kodi-audioencoder-vorbis |  DISTRO  | https://release-monitoring.org/project/21797 | 19.0.1-Ma... | 20.2.0-Nexus |     
         kodi-audioencoder-wav |  DISTRO  | https://release-monitoring.org/project/21796 | 19.0.1-Ma... | 20.2.0-Nexus |     
     kodi-inputstream-adaptive |  DISTRO  | https://release-monitoring.org/project/21795 | 19.0.4-Ma... | 20.2.0-Nexus |     
 kodi-inputstream-ffmpegdirect |  DISTRO  | https://release-monitoring.org/project/177174 | 19.0.1-Ma... | 20.2.0-Nexus |     
         kodi-inputstream-rtmp |  DISTRO  | https://release-monitoring.org/project/21794 | 19.0.1-Ma... | 20.2.0-Nexus |     
      kodi-peripheral-joystick |  DISTRO  | https://release-monitoring.org/project/21793 | 19.0.2-Ma... | 20.1.1-Nexus |     
       kodi-peripheral-xarcade |  DISTRO  | https://release-monitoring.org/project/21791 | 19.0.3-Ma... | 20.1.1-Nexus |     
              kodi-pvr-argustv |  DISTRO  | https://release-monitoring.org/project/21788 | 19.2.1-Ma... | 20.4.1-Nexus |     
              kodi-pvr-dvblink |  DISTRO  | https://release-monitoring.org/project/21787 | 19.0.1-Ma... | 20.2.0-Nexus |     
            kodi-pvr-dvbviewer |  DISTRO  | https://release-monitoring.org/project/21786 | 19.0.2-Ma... | 20.2.0-Nexus |     
               kodi-pvr-filmon |  DISTRO  | https://release-monitoring.org/project/21785 | 19.0.1-Ma... | 20.2.1-Nexus |     
            kodi-pvr-hdhomerun |  DISTRO  | https://release-monitoring.org/project/21784 | 19.1.0-Ma... | 20.3.0-Nexus |     
                  kodi-pvr-hts |  DISTRO  | https://release-monitoring.org/project/21783 | 19.0.6-Ma... | 20.3.0-Nexus |     
           kodi-pvr-iptvsimple |  DISTRO  | https://release-monitoring.org/project/21782 | 19.1.0-Ma... | 20.3.0-Nexus |     
 kodi-pvr-mediaportal-tvserver |  DISTRO  | https://release-monitoring.org/project/21781 | 19.0.2-Ma... | 20.2.0-Nexus |     
               kodi-pvr-mythtv |  DISTRO  | https://release-monitoring.org/project/21780 | 19.0.8-Ma... | 20.2.5-Nexus |     
              kodi-pvr-nextpvr |  DISTRO  | https://release-monitoring.org/project/21779 | 19.0.3-Ma... | 20.2.3-Nexus |     
                 kodi-pvr-njoy |  DISTRO  | https://release-monitoring.org/project/21778 | 19.0.1-Ma... | 20.2.0-Nexus |     
              kodi-pvr-octonet |  DISTRO  | https://release-monitoring.org/project/100437 | 19.0.0-Ma... | 20.2.0-Nexus |     
                 kodi-pvr-pctv |  DISTRO  | https://release-monitoring.org/project/21777 | 19.0.1-Ma... | 20.3.0-Nexus |     
              kodi-pvr-plutotv |  DISTRO  | https://release-monitoring.org/project/241527 | 19.0.3-Ma... | 20.1.0-Nexus |     
              kodi-pvr-stalker |  DISTRO  | https://release-monitoring.org/project/21776 | 19.0.2-Ma... | 20.2.1-Nexus |     
                 kodi-pvr-vbox |  DISTRO  | https://release-monitoring.org/project/21775 | 19.0.0-Ma... | 20.2.0-Nexus |     
             kodi-pvr-vdr-vnsi |  DISTRO  | https://release-monitoring.org/project/21774 | 19.0.3-Ma... | 20.2.2-Nexus |     
               kodi-pvr-vuplus |  DISTRO  | https://release-monitoring.org/project/21773 | 19.0.0-Ma... | 20.3.0-Nexus |     
                kodi-pvr-waipu |  DISTRO  | https://release-monitoring.org/project/241529 | 19.2.1-Ma... | 20.4.2-Nexus |     
                  kodi-pvr-wmc |  DISTRO  | https://release-monitoring.org/project/21772 | 19.0.2-Ma... | 20.2.1-Nexus |     
               kodi-pvr-zattoo |  DISTRO  | https://release-monitoring.org/project/100438 | 19.7.14-M... | 20.2.1-Nexus |     
    kodi-screensaver-asteroids |  DISTRO  | https://release-monitoring.org/project/21771 | 19.0.1-Ma... | 20.1.0-Nexus |     
    kodi-screensaver-asterwave |  DISTRO  | https://release-monitoring.org/project/21770 | 19.0.1-Ma... | 20.1.0-Nexus |     
   kodi-screensaver-biogenesis |  DISTRO  | https://release-monitoring.org/project/21768 | 19.0.1-Ma... | 20.1.0-Nexus |     
      kodi-screensaver-cpblobs |  DISTRO  | https://release-monitoring.org/project/21767 | 19.0.1-Ma... | 20.1.0-Nexus |     
    kodi-screensaver-greynetic |  DISTRO  | https://release-monitoring.org/project/21765 | 19.0.1-Ma... | 20.1.0-Nexus |     
 kodi-screensaver-matrixtrails |  DISTRO  | https://release-monitoring.org/project/21764 | 19.0.1-Ma... | 20.1.0-Nexus |     
     kodi-screensaver-pingpong |  DISTRO  | https://release-monitoring.org/project/21763 | 19.0.1-Ma... | 20.1.0-Nexus |     
         kodi-screensaver-pyro |  DISTRO  | https://release-monitoring.org/project/21761 | 19.0.1-Ma... | 20.1.0-Nexus |     
         kodi-screensaver-rsxs |  DISTRO  | https://release-monitoring.org/project/21760 | 19.0.2-Ma... | 20.1.0-Nexus |     
        kodi-screensaver-stars |  DISTRO  | https://release-monitoring.org/project/21759 | 19.0.0-Ma... | 20.1.0-Nexus |     
           kodi-vfs-libarchive |  DISTRO  | https://release-monitoring.org/project/177173 | 19.0.1-Ma... | 20.1.0-Nexus |     
                  kodi-vfs-rar |  DISTRO  | https://release-monitoring.org/project/21900 | 19.0.1-Ma... | 20.1.0-Nexus |     
                 kodi-vfs-sftp |  DISTRO  | https://release-monitoring.org/project/21899 | 19.0.1-Ma... | 20.1.0-Nexus |     
    kodi-visualisation-fishbmc |  DISTRO  | https://release-monitoring.org/project/21758 | 19.0.1-Ma... | 20.1.0-Nexus |     
       kodi-visualisation-goom |  DISTRO  | https://release-monitoring.org/project/21757 | 19.0.1-Ma... | 20.1.0-Nexus |     
     kodi-visualisation-matrix |  DISTRO  | https://release-monitoring.org/project/177172 | 19.0.1-Ma... | 20.1.0-Nexus |     
  kodi-visualisation-shadertoy |  DISTRO  | https://release-monitoring.org/project/21756 | 19.1.2-Ma... | 20.2.0-Nexus |     
   kodi-visualisation-spectrum |  DISTRO  | https://release-monitoring.org/project/21755 | 19.0.1-Ma... | 20.1.0-Nexus |     
  kodi-visualisation-starburst |  DISTRO  | https://release-monitoring.org/project/85703 | 19.0.1-Ma... | 20.1.0-Nexus |     
   kodi-visualisation-waveform |  DISTRO  | https://release-monitoring.org/project/21753 | 19.0.2-Ma... | 20.1.0-Nexus |     
                       kvazaar |  DISTRO  | https://release-monitoring.org/project/12418 | 1.2.0        | 2.1.0        |     
                        lapack |  DISTRO  | https://release-monitoring.org/project/01534 | 3.10.0       | 3.10.1       |     
                         lcms2 |  DISTRO  | https://release-monitoring.org/project/09815 | 2.13         | 2.13.1       |     
                       lensfun |  DISTRO  | https://release-monitoring.org/project/01548 | 0.3.2        | 0.3.95       |     
                        libaio |  DISTRO  | https://release-monitoring.org/project/01557 | 0.3.112      | 0.3.113      | ORPH
                         libao |  DISTRO  | https://release-monitoring.org/project/07629 | 1.2.0        | 1.2.2        | ORPH
                   libblockdev |  DISTRO  | https://release-monitoring.org/project/09397 | 2.26         | 2.26-1       | ORPH
                        libbsd |  DISTRO  | https://release-monitoring.org/project/01567 | 0.11.3       | 0.11.6       |     
                     libcgroup |  DISTRO  | https://release-monitoring.org/project/01575 | 0.42.2       | 2.0.1        |     
                     libcodec2 |  DISTRO  | https://release-monitoring.org/project/14605 | 1.0.1        | 1.03         |     
                       libfuse |  GUESS   | https://release-monitoring.org/project/00861 | 2.9.9        | 3.10.5       | ORPH
                    libgdiplus |  DISTRO  | https://release-monitoring.org/project/06440 | 6.0.5        | 6.1          |     
                      libglade |  DISTRO  | https://release-monitoring.org/project/01174 | 2.6.4        | 3.38.2       | ORPH
                       libglfw |  DISTRO  | https://release-monitoring.org/project/01180 | 3.3.6        | 3.3.7        |     
                      libglib2 |  DISTRO  | https://release-monitoring.org/project/10024 | 2.70.4       | 2.72.1       |     
                      libglvnd |  DISTRO  | https://release-monitoring.org/project/12098 | 1.3.2        | 1.4.0        | ORPH
                  libgpg-error |  DISTRO  | https://release-monitoring.org/project/01628 | 1.42         | 1.45         | ORPH
                      libgpgme |  DISTRO  | https://release-monitoring.org/project/01239 | 1.16.0       | 1.17.1       | ORPH
                    libgphoto2 |  DISTRO  | https://release-monitoring.org/project/12558 | 2.5.27       | 2.5.29       | ORPH
                       libgtk2 |  DISTRO  | https://release-monitoring.org/project/13942 | 2.24.33      | 4.6.3        |     
                      libgudev |  DISTRO  | https://release-monitoring.org/project/07735 | 236          | 237          |     
                     libiberty |  DISTRO  | https://release-monitoring.org/project/07981 | 2.32         | 2.38         |     
                       libical |  DISTRO  | https://release-monitoring.org/project/01637 | 1.0.1        | 3.0.14       |     
                      libiconv |  DISTRO  | https://release-monitoring.org/project/10656 | 1.15         | 1.16         | ORPH
                  libimxvpuapi |  DISTRO  | https://release-monitoring.org/project/21479 | 0.10.3       | 2.2.0        |     
                        libite |  DISTRO  | https://release-monitoring.org/project/17367 | 2.5.1        | 2.5.2        |     
                      libkcapi |  DISTRO  | https://release-monitoring.org/project/16828 | 1.1.5        | 1.4.0        | ORPH
                       libmbim |  DISTRO  | https://release-monitoring.org/project/07308 | 1.26.2       | 1.26.4       |     
                      libmhash |  DISTRO  | https://release-monitoring.org/project/21488 | 0.9.9.9      | 1.4          | ORPH
                  libminiupnpc |  DISTRO  | https://release-monitoring.org/project/01986 | 2.1.20201016 | 2.2.3        |     
                     libmspack |  DISTRO  | https://release-monitoring.org/project/16827 | 0.10.1alpha  | 1.9.1        |     
                   libnetconf2 |  DISTRO  | https://release-monitoring.org/project/31639 | 2.0.24       | 2.1.7        |     
                  libnfnetlink |  DISTRO  | https://release-monitoring.org/project/01682 | 1.0.1        | 1.0.2        | ORPH
                        libnfs |  DISTRO  | https://release-monitoring.org/project/07325 | 4.0.0        | 5.0.1        | ORPH
                        libnss |  DISTRO  | https://release-monitoring.org/project/02503 | 3.77         | 3.78         |     
                        libolm |  DISTRO  | https://release-monitoring.org/project/29706 | 3.2.9        | 3.2.11       |     
                    libopenssl |  DISTRO  | https://release-monitoring.org/project/02566 | 1.1.1n       | 3.0.2        |     
                   libpagekite |  DISTRO  | https://release-monitoring.org/project/21366 | 0.91.190530  | 0.91.201110  |     
            libpam-radius-auth |  DISTRO  | https://release-monitoring.org/project/57834 | 1.4.0        | 2.0.0        | ORPH
                       libpeas |  DISTRO  | https://release-monitoring.org/project/06871 | 1.30.0       | 1.32.0       | ORPH
                       libpqxx |  DISTRO  | https://release-monitoring.org/project/21367 | 6.4.5        | 7.7.3        |     
                         libqb |  DISTRO  | https://release-monitoring.org/project/09399 | 2.0.3        | 2.0.6        |     
                        libqmi |  DISTRO  | https://release-monitoring.org/project/07307 | 1.30.4       | 1.30.6       |     
                       librsvg |  DISTRO  | https://release-monitoring.org/project/05420 | 2.50.7       | 2.54.1       |     
                       librtas |  DISTRO  | https://release-monitoring.org/project/10717 | 2.0.2        | 2.0.3        | ORPH
                    libseccomp |  DISTRO  | https://release-monitoring.org/project/13823 | 2.5.3        | 2.5.4        |     
                   libsemanage |  DISTRO  | https://release-monitoring.org/project/01718 | 3.3          | 20200710     |     
                      libsepol |  DISTRO  | https://release-monitoring.org/project/01719 | 3.3          | 20200710     |     
                      libshout |  DISTRO  | https://release-monitoring.org/project/11084 | 2.4.5        | 2.4.6        | ORPH
                       libsigc |  DISTRO  | https://release-monitoring.org/project/07961 | 3.0.7        | 3.2.0        | ORPH
                    libsndfile |  DISTRO  | https://release-monitoring.org/project/13277 | 1.0.31       | 1.1.0        |     
                       libsoup |  DISTRO  | https://release-monitoring.org/project/11483 | 2.74.0       | 3.0.6        |     
                  libtextstyle |  DISTRO  | https://release-monitoring.org/project/00898 | 0.20.1       | 0.21         | ORPH
                       libtool |  DISTRO  | https://release-monitoring.org/project/01741 | 2.4.6        | 2.4.7        | ORPH
          libtorrent-rasterbar |  DISTRO  | https://release-monitoring.org/project/04166 | 1.2.15       | 2.0.6        |     
                     libunwind |  DISTRO  | https://release-monitoring.org/project/01748 | 1.5.0        | 1.6.2        | ORPH
                        libusb |  DISTRO  | https://release-monitoring.org/project/01749 | 1.0.25       | 1.0.26       |     
                         libuv |  DISTRO  | https://release-monitoring.org/project/10784 | 1.43.0       | 1.44.1       |     
                      libvdpau |  DISTRO  | https://release-monitoring.org/project/01755 | 1.4          | 1.5          |     
                       libvips |  DISTRO  | https://release-monitoring.org/project/05097 | 8.10.6       | 8.12.2       |     
                       libvirt |  DISTRO  | https://release-monitoring.org/project/224041 | 7.10.0       | 8.2.0        |     
                     libxmlrpc |  DISTRO  | https://release-monitoring.org/project/09024 | r3119        | 1.54.05      |     
                       libyang |  DISTRO  | https://release-monitoring.org/project/18554 | 2.0.112      | 2.0.164      |     
                      linphone |  DISTRO  | https://release-monitoring.org/project/01823 | 4.4.8        | 5.1.24       | ORPH
                linux-firmware |  DISTRO  | https://release-monitoring.org/project/141464 | 20220310     | 20220411     |     
                       live555 |  DISTRO  | https://release-monitoring.org/project/12414 | 2021.05.03   | 2022.04.26   | ORPH
                           lld |  DISTRO  | https://release-monitoring.org/project/01830 | 9.0.1        | 14.0.3       |     
                         lldpd |  DISTRO  | https://release-monitoring.org/project/14019 | 1.0.9        | 1.0.13       | ORPH
                          llvm |  DISTRO  | https://release-monitoring.org/project/01830 | 9.0.1        | 14.0.3       |     
                       log4cxx |  DISTRO  | https://release-monitoring.org/project/15330 | 0.12.1       | 0.13.0       |     
                     logrotate |  DISTRO  | https://release-monitoring.org/project/10567 | 3.18.0       | 3.19.0       |     
                          lpty |  DISTRO  | https://release-monitoring.org/project/11671 | 1.0.1-1      | 1.2.2        |     
                         lrzip |  DISTRO  | https://release-monitoring.org/project/01842 | 0.641        | 0.651        |     
                          lsof |  DISTRO  | https://release-monitoring.org/project/01844 | 4.94.0       | 4.95.0       | ORPH
                         ltris |  DISTRO  | https://release-monitoring.org/project/21503 | 1.2          | 1.2.4        |     
              lttng-babeltrace |  DISTRO  | https://release-monitoring.org/project/00155 | 1.5.7        | 1.5.8        |     
                  lttng-libust |  DISTRO  | https://release-monitoring.org/project/07135 | 2.13.1       | 2.13.2       |     
                 lttng-modules |  DISTRO  | https://release-monitoring.org/project/07141 | 2.13.1       | 2.13.3       |     
                   lttng-tools |  DISTRO  | https://release-monitoring.org/project/07136 | 2.13.2       | 2.13.7       |     
                           lua |  DISTRO  | https://release-monitoring.org/project/01847 | 5.1.5        | 5.4.4        |     
                lua-resty-http |  DISTRO  | https://release-monitoring.org/project/13887 | 0.15-0       | 0.16.1       |     
                          lvm2 |  DISTRO  | https://release-monitoring.org/project/05354 | 2.03.14      | 2.03.15      | ORPH
                          lynx |  DISTRO  | https://release-monitoring.org/project/01863 | 2.8.9rel.1   | 2.9.0        |     
                    lzma-alone |  DISTRO  | https://release-monitoring.org/project/242840 | 9.22         | 2107         | ORPH
                          lzop |  DISTRO  | https://release-monitoring.org/project/07486 | 1.03         | 1.04         |     
                          make |  DISTRO  | https://release-monitoring.org/project/01877 | 4.2.1        | 4.3          | ORPH
                  makedumpfile |  DISTRO  | https://release-monitoring.org/project/131396 | 1.7.0        | 1.7.1        |     
                       mariadb |  DISTRO  | https://release-monitoring.org/project/01887 | 10.3.34      | 10.8.2       | ORPH
             matchbox-keyboard |  DISTRO  | https://release-monitoring.org/project/230595 | 0.1          | 0.1.1        |     
                         matio |  DISTRO  | https://release-monitoring.org/project/01893 | 1.5.22       | 1.5.23       |     
                       mbedtls |  DISTRO  | https://release-monitoring.org/project/13824 | 2.28.0       | 3.1.0        |     
                        mbpfan |  DISTRO  | https://release-monitoring.org/project/115980 | 2.2.1        | 2.3.0        |     
                       mbuffer |  DISTRO  | https://release-monitoring.org/project/15518 | 20211018     | 20220418     |     
                        mcelog |  DISTRO  | https://release-monitoring.org/project/08093 | 180          | 181          |     
                         mdevd |  DISTRO  | https://release-monitoring.org/project/16553 | 0.1.4.0      | 0.1.5.1      |     
                 mediastreamer |  DISTRO  | https://release-monitoring.org/project/21746 | 4.4.8        | 5.1.20       | ORPH
                     memcached |  DISTRO  | https://release-monitoring.org/project/01965 | 1.6.12       | 1.6.15       | ORPH
                     memtest86 |  DISTRO  | https://release-monitoring.org/project/01966 | 5.01         | 5.31b        |     
                     memtester |  DISTRO  | https://release-monitoring.org/project/01967 | 4.5.0        | 4.5.1        |     
                        mender |  DISTRO  | https://release-monitoring.org/project/20629 | 3.1.0        | 3.2.1        |     
                        mesa3d |  DISTRO  | https://release-monitoring.org/project/01970 | 21.3.8       | 22.0.2       |     
                mesa3d-headers |  DISTRO  | https://release-monitoring.org/project/01970 | 21.3.8       | 22.0.2       |     
                      metacity |  DISTRO  | https://release-monitoring.org/project/15392 | 2.25.1       | 3.44.0       | ORPH
                      mfgtools |  DISTRO  | https://release-monitoring.org/project/21519 | 0.02         | 2.8.0        |     
                         mimic |  DISTRO  | https://release-monitoring.org/project/21521 | 1.1.0        | 1.3.0.1      |     
                      minetest |  DISTRO  | https://release-monitoring.org/project/01978 | 5.4.1        | 5.5.0        |     
                 minetest-game |  DISTRO  | https://release-monitoring.org/project/21522 | 5.4.1        | 5.5.0        |     
                       minizip |  DISTRO  | https://release-monitoring.org/project/17546 | 3.0.5        | 3.0.6        |     
mobile-broadband-provider-info |  DISTRO  | https://release-monitoring.org/project/10267 | 20190618     | 20220315     | ORPH
                 moby-buildkit |  DISTRO  | https://release-monitoring.org/project/20836 | 0.10.0       | 0.10.2       |     
                 modem-manager |  DISTRO  | https://release-monitoring.org/project/07306 | 1.18.6       | 1.18.8       |     
                       mongodb |  DISTRO  | https://release-monitoring.org/project/02008 | 4.2.18       | 5.3.1        |     
                      mongoose |  DISTRO  | https://release-monitoring.org/project/07603 | 7.2          | 7.6          |     
                         monit |  DISTRO  | https://release-monitoring.org/project/05483 | 5.26.0       | 5.32.0       |     
                          mono |  DISTRO  | https://release-monitoring.org/project/06360 | 6.12.0.122   | 6.12.0.177   |     
                        mpg123 |  DISTRO  | https://release-monitoring.org/project/12413 | 1.25.15      | 1.29.3       | ORPH
                           mpv |  DISTRO  | https://release-monitoring.org/project/05348 | 0.33.1       | 0.34.1       |     
                       msgpack |  DISTRO  | https://release-monitoring.org/project/12278 | 3.3.0        | 4.1.1        |     
                         msmtp |  DISTRO  | https://release-monitoring.org/project/02024 | 1.8.14       | 1.8.20       |     
                         mstpd |  DISTRO  | https://release-monitoring.org/project/235098 | 0.1.0        | 0.05         |     
                           mtd |  DISTRO  | https://release-monitoring.org/project/02026 | 2.1.3        | 2.1.4        |     
                        mtools |  DISTRO  | https://release-monitoring.org/project/02028 | 4.0.38       | 4.0.39       |     
                           mtr |  DISTRO  | https://release-monitoring.org/project/02029 | 0.94         | 0.95         | ORPH
                         mupdf |  DISTRO  | https://release-monitoring.org/project/02034 | 1.18.0       | 1.19.0       |     
                          musl |  DISTRO  | https://release-monitoring.org/project/11688 | 1.2.2        | 1.2.3        |     
                          mutt |  DISTRO  | https://release-monitoring.org/project/02035 | 2.2.3        | 2.2.4        |     
                          nano |  DISTRO  | https://release-monitoring.org/project/02046 | 6.2          | 6.3          | ORPH
                          ncdu |  DISTRO  | https://release-monitoring.org/project/06045 | 1.16         | 2.1.2        |     
                       ncurses |  DISTRO  | https://release-monitoring.org/project/02057 | 6.1          | 6.3-20220501 | ORPH
                        netcat |  DISTRO  | https://release-monitoring.org/project/21534 | 0.7.1        | 1.218        | ORPH
                       netdata |  DISTRO  | https://release-monitoring.org/project/11046 | 1.33.1       | 1.34.1       |     
                       netifrc |  DISTRO  | https://release-monitoring.org/project/21917 | 0.6.1        | 0.7.3        |     
                     netopeer2 |  DISTRO  | https://release-monitoring.org/project/114978 | 2.0.35       | 2.1.16       |     
                       netsnmp |  DISTRO  | https://release-monitoring.org/project/02062 | 5.9          | 5.9.1        | ORPH
       network-manager-openvpn |  DISTRO  | https://release-monitoring.org/project/69977 | 1.8.14       | 1.8.18       |     
           networkd-dispatcher |  DISTRO  | https://release-monitoring.org/project/242008 | 2.1          | 2.2.1        |     
                      nftables |  DISTRO  | https://release-monitoring.org/project/02082 | 1.0.1        | 1.0.2        |     
                       nghttp2 |  DISTRO  | https://release-monitoring.org/project/08651 | 1.41.0       | 1.47.0       |     
                         nginx |  DISTRO  | https://release-monitoring.org/project/05413 | 1.20.1       | 1.21.6       |     
                        nodejs |  DISTRO  | https://release-monitoring.org/project/08251 | 14.18.3      | 18.0.0       |     
                      nss-mdns |  DISTRO  | https://release-monitoring.org/project/05491 | 0.14.1       | 0.15.1       | ORPH
                        nuttcp |  DISTRO  | https://release-monitoring.org/project/02511 | 6.1.2        | 8.2.2        |     
                 nvidia-driver |  DISTRO  | https://release-monitoring.org/project/21843 | 390.132      | 390.147      |     
               nvidia-modprobe |  DISTRO  | https://release-monitoring.org/project/141657 | 450.57       | 510.68.02    | ORPH
                          nvme |  DISTRO  | https://release-monitoring.org/project/09074 | 1.12         | 2.0          | ORPH
                     ocf-linux |  DISTRO  | https://release-monitoring.org/project/21541 | 20120127     | 20171122     | ORPH
                         ocrad |  DISTRO  | https://release-monitoring.org/project/02526 | 0.27         | 0.28         |     
                          ogre |  DISTRO  | https://release-monitoring.org/project/33334 | v1.12.12     | 13.3.4       |     
                     oniguruma |  DISTRO  | https://release-monitoring.org/project/11184 | 6.9.7.1      | 6.9.8        |     
                     open62541 |  DISTRO  | https://release-monitoring.org/project/16896 | v1.2.2       | 1.3          | ORPH
                        openal |  DISTRO  | https://release-monitoring.org/project/08172 | 1.21.1       | 1.22.0       |     
                       opencv3 |  DISTRO  | https://release-monitoring.org/project/06615 | 3.4.17       | 4.5.5        |     
                openfpgaloader |  DISTRO  | https://release-monitoring.org/project/241709 | 0.6.1        | 0.8.0        |     
                       openjdk |  GUESS   | https://release-monitoring.org/project/176098 | 11.0.14.1+1  | 19+20        |     
                       openmpi |  DISTRO  | https://release-monitoring.org/project/02554 | 4.0.0        | 4.1.3        | ORPH
                 openpowerlink |  DISTRO  | https://release-monitoring.org/project/21550 | 2.7.1        | 2.7.2        |     
                        openrc |  DISTRO  | https://release-monitoring.org/project/11687 | 0.43.3       | 0.44.10      |     
                   openvmtools |  DISTRO  | https://release-monitoring.org/project/10998 | 10.3.5-10... | 12.0.0       |     
                          opkg |  DISTRO  | https://release-monitoring.org/project/59397 | 0.4.5        | 0.5.0        | ORPH
                    opkg-utils |  DISTRO  | https://release-monitoring.org/project/59396 | 0.4.5        | 0.5.0        |     
                  oracle-mysql |  DISTRO  | https://release-monitoring.org/project/00334 | 5.1.73       | 8.0.29       | ORPH
                          ortp |  DISTRO  | https://release-monitoring.org/project/21691 | 4.4.8        | 5.1.12       | ORPH
                       pangomm |  DISTRO  | https://release-monitoring.org/project/07958 | 2.48.2       | 2.50.0       |     
                    parprouted |  DISTRO  | https://release-monitoring.org/project/10309 | 0.7          | 0.65         | ORPH
                        parted |  DISTRO  | https://release-monitoring.org/project/02596 | 3.4          | 3.5          |     
                      patchelf |  DISTRO  | https://release-monitoring.org/project/02598 | 0.9          | 0.14.5       | ORPH
                     pax-utils |  DISTRO  | https://release-monitoring.org/project/02601 | 1.2.6        | 1.3.4        | ORPH
                     pcm-tools |  DISTRO  | https://release-monitoring.org/project/21377 | 202110       | 202203       | ORPH
                perl-crypt-cbc |  DISTRO  | https://release-monitoring.org/project/11930 | 2.33         | 3.04         |     
        perl-crypt-openssl-rsa |  DISTRO  | https://release-monitoring.org/project/02748 | 0.31         | 0.32         |     
                perl-dbd-mysql |  DISTRO  | https://release-monitoring.org/project/02807 | 4.046        | 4.050        |     
             perl-file-listing |  DISTRO  | https://release-monitoring.org/project/02892 | 6.14         | 6.15         |     
              perl-html-parser |  DISTRO  | https://release-monitoring.org/project/02967 | 3.76         | 3.78         |     
              perl-http-daemon |  DISTRO  | https://release-monitoring.org/project/02975 | 6.12         | 6.14         |     
              perl-libwww-perl |  DISTRO  | https://release-monitoring.org/project/03024 | 6.62         | 6.64         |     
                perl-mail-dkim |  DISTRO  | https://release-monitoring.org/project/11868 | 1.20200824   | 1.20220408   |     
              perl-mojolicious |  DISTRO  | https://release-monitoring.org/project/05966 | 9.24         | 9.25         |     
                 perl-net-http |  DISTRO  | https://release-monitoring.org/project/03152 | 6.21         | 6.22         |     
               perl-net-ssleay |  DISTRO  | https://release-monitoring.org/project/06575 | 1.85         | 1.92         |     
            perl-package-stash |  DISTRO  | https://release-monitoring.org/project/11885 | 0.39         | 0.40         |     
                  perl-sys-cpu |  DISTRO  | https://release-monitoring.org/project/14338 | 0.52         | 0.61         |     
               perl-xml-libxml |  DISTRO  | https://release-monitoring.org/project/03527 | 2.0134       | 2.0207       |     
                           php |  DISTRO  | https://release-monitoring.org/project/03627 | 8.0.18       | 8.1.5        |     
                      php-amqp |  DISTRO  | https://release-monitoring.org/project/15603 | 1.10.2       | 1.11.0       |     
                      php-apcu |  DISTRO  | https://release-monitoring.org/project/11010 | 5.1.20       | 5.1.21       |     
                     php-gnupg |  DISTRO  | https://release-monitoring.org/project/21743 | 1.5.0        | 1.5.1        | ORPH
                   php-imagick |  DISTRO  | https://release-monitoring.org/project/17401 | 3.5.0        | 3.7.0        | ORPH
                 php-memcached |  DISTRO  | https://release-monitoring.org/project/17400 | 3.1.5        | 3.2.0        | ORPH
                       php-pam |  DISTRO  | https://release-monitoring.org/project/241707 | 2.2.3        | 2.2.4        |     
                    php-xdebug |  DISTRO  | https://release-monitoring.org/project/13302 | 3.0.4        | 3.1.4        |     
                      php-yaml |  DISTRO  | https://release-monitoring.org/project/12515 | 2.2.1        | 2.2.2        | ORPH
                        pigpio |  DISTRO  | https://release-monitoring.org/project/21577 | 79           | 7301         |     
                          pigz |  DISTRO  | https://release-monitoring.org/project/03642 | 2.6          | 2.7          |     
                      pinentry |  DISTRO  | https://release-monitoring.org/project/03643 | 1.1.1        | 1.2.0        | ORPH
                      pipewire |  DISTRO  | https://release-monitoring.org/project/57357 | 0.3.50       | 0.3.51       |     
                 pkcs11-helper |  DISTRO  | https://release-monitoring.org/project/91990 | 1.28         | 1.29.0       | ORPH
                       pkgconf |  DISTRO  | https://release-monitoring.org/project/12753 | 1.6.3        | 1.8.0        | ORPH
                          poco |  DISTRO  | https://release-monitoring.org/project/05418 | 1.11.1       | 1.11.2       |     
                          poke |  DISTRO  | https://release-monitoring.org/project/179926 | 2.1          | 2.3          | ORPH
               policycoreutils |  DISTRO  | https://release-monitoring.org/project/03680 | 3.2          | 20200710     |     
                       poppler |  DISTRO  | https://release-monitoring.org/project/03686 | 21.12.0      | 22.04.0      |     
                 powerpc-utils |  DISTRO  | https://release-monitoring.org/project/10715 | 1.3.8        | 1.3.9        | ORPH
                      powertop |  DISTRO  | https://release-monitoring.org/project/03702 | 2.13         | 2.14         |     
                     procps-ng |  DISTRO  | https://release-monitoring.org/project/03708 | 3.3.17       | 4.0.0        | ORPH
                       proftpd |  DISTRO  | https://release-monitoring.org/project/07609 | 1.3.6e       | 1.3.7d       |     
                          proj |  DISTRO  | https://release-monitoring.org/project/21570 | 8.1.1        | 9.0.0        |     
                       prosody |  DISTRO  | https://release-monitoring.org/project/03709 | 0.11.13      | 0.12.0       |     
                proxychains-ng |  DISTRO  | https://release-monitoring.org/project/06499 | 4.14         | 4.16         | ORPH
          pru-software-support |  DISTRO  | https://release-monitoring.org/project/21825 | 6.0.1        | 6.1.0        |     
                          ptpd |  GUESS   | https://release-monitoring.org/project/03726 | 1.1.0        | 2.3.1        | ORPH
                    pulseaudio |  DISTRO  | https://release-monitoring.org/project/03729 | 14.2         | 15.0         |     
             python-aioblescan |  DISTRO  | https://release-monitoring.org/project/21242 | 0.2.8        | 0.2.12       |     
                python-aiocoap |  DISTRO  | https://release-monitoring.org/project/21243 | 0.4.1        | 0.4.3        |     
        python-aiohttp-remotes |  DISTRO  | https://release-monitoring.org/project/21248 | 1.1.0        | 1.2.0        |     
                python-aiojobs |  DISTRO  | https://release-monitoring.org/project/21252 | 0.3.0        | 1.0.0        |     
              python-alsaaudio |  DISTRO  | https://release-monitoring.org/project/10072 | 0.8.4        | 0.9.0        |     
                  python-arrow |  DISTRO  | https://release-monitoring.org/project/05314 | 1.2.0        | 1.2.2        |     
                python-asgiref |  DISTRO  | https://release-monitoring.org/project/18462 | 3.3.4        | 3.5.1        |     
                  python-babel |  DISTRO  | https://release-monitoring.org/project/11984 | 2.9.1        | 2.10.1       |     
                 python-bcrypt |  DISTRO  | https://release-monitoring.org/project/09047 | 3.2.0        | 3.2.2        |     
         python-beautifulsoup4 |  DISTRO  | https://release-monitoring.org/project/03779 | 4.10.0       | 4.11.1       |     
                  python-bleak |  DISTRO  | https://release-monitoring.org/project/26271 | 0.12.1       | 0.14.3       |     
                  python-boto3 |  DISTRO  | https://release-monitoring.org/project/08778 | 1.19.2       | 1.22.4       |     
               python-botocore |  DISTRO  | https://release-monitoring.org/project/08748 | 1.22.2       | 1.25.4       |     
                python-canopen |  DISTRO  | https://release-monitoring.org/project/23230 | 1.0.0        | 2.0.0b1      |     
               python-channels |  DISTRO  | https://release-monitoring.org/project/21937 | 2.3.1        | 3.0.4        |     
         python-channels-redis |  DISTRO  | https://release-monitoring.org/project/21936 | 2.4.1        | 3.4.0        |     
                python-cheroot |  DISTRO  | https://release-monitoring.org/project/20163 | 8.2.1        | 8.6.0        |     
               python-cherrypy |  DISTRO  | https://release-monitoring.org/project/03799 | 12.0.1       | 18.6.1       |     
                  python-click |  DISTRO  | https://release-monitoring.org/project/03802 | 7.1.2        | 8.1.3        |     
               python-colorlog |  DISTRO  | https://release-monitoring.org/project/12509 | 6.4.1        | 6.6.0        |     
         python-configshell-fb |  DISTRO  | https://release-monitoring.org/project/19734 | 1.1.29       | 1.5          |     
               python-crossbar |  DISTRO  | https://release-monitoring.org/project/21696 | 21.3.1       | 22.3.1       |     
               python-cssutils |  DISTRO  | https://release-monitoring.org/project/13259 | 2.3.0        | 2.4.0        |     
                 python-cython |  DISTRO  | https://release-monitoring.org/project/12679 | 0.29.27      | 3.0.0a10     |     
                 python-daemon |  DISTRO  | https://release-monitoring.org/project/03816 | 2.2.3        | 2.3.0        |     
                 python-daphne |  DISTRO  | https://release-monitoring.org/project/21939 | 2.4.1        | 3.0.2        |     
           python-dataproperty |  DISTRO  | https://release-monitoring.org/project/21697 | 0.54.2       | 0.55.0       |     
              python-decorator |  DISTRO  | https://release-monitoring.org/project/03819 | 5.1.0        | 5.1.1        |     
                python-dialog3 |  DISTRO  | https://release-monitoring.org/project/03823 | 3.5.1        | 3.5.3        |     
              python-dnspython |  DISTRO  | https://release-monitoring.org/project/13190 | 2.1.0        | 2.2.1        |     
                 python-docker |  DISTRO  | https://release-monitoring.org/project/03847 | 4.1.0        | 5.0.3        |     
                  python-ecdsa |  DISTRO  | https://release-monitoring.org/project/08370 | 0.17.0       | 0.18.0b2     |     
               python-engineio |  DISTRO  | https://release-monitoring.org/project/15064 | 4.2.1        | 4.3.2        |     
            python-entrypoints |  DISTRO  | https://release-monitoring.org/project/12081 | 0.3          | 0.4          |     
                 python-falcon |  DISTRO  | https://release-monitoring.org/project/03860 | 3.0.1        | 3.1.0        |     
               python-filelock |  DISTRO  | https://release-monitoring.org/project/11739 | 3.3.0        | 3.6.0        |     
                  python-flask |  DISTRO  | https://release-monitoring.org/project/03867 | 1.1.2        | 2.1.2        |     
     python-flask-expects-json |  DISTRO  | https://release-monitoring.org/project/127659 | 1.5.0        | 1.7.0        |     
          python-flask-jsonrpc |  DISTRO  | https://release-monitoring.org/project/21698 | 0.3.1        | 2.1.0        |     
            python-flask-login |  DISTRO  | https://release-monitoring.org/project/03868 | 0.5.0        | 0.6.0        |     
       python-flask-sqlalchemy |  DISTRO  | https://release-monitoring.org/project/05701 | 2.4.1        | 2.5.1        |     
              python-flask-wtf |  DISTRO  | https://release-monitoring.org/project/05702 | 0.15.1       | 1.0.1        |     
              python-fonttools |  DISTRO  | https://release-monitoring.org/project/07388 | 4.32.0       | 4.33.3       |     
                    python-git |  DISTRO  | https://release-monitoring.org/project/06459 | 3.1.24       | 3.1.27       |     
                 python-gitdb2 |  DISTRO  | https://release-monitoring.org/project/12730 | 4.0.7        | 4.0.9        |     
                python-gobject |  DISTRO  | https://release-monitoring.org/project/13158 | 3.42.0       | 3.42.1       |     
               python-httplib2 |  DISTRO  | https://release-monitoring.org/project/03887 | 0.19.1       | 0.20.4       |     
               python-humanize |  DISTRO  | https://release-monitoring.org/project/19799 | 3.11.0       | 4.0.0        |     
                python-ipython |  DISTRO  | https://release-monitoring.org/project/01399 | 7.31.1       | 8.3.0        |     
                python-iso8601 |  DISTRO  | https://release-monitoring.org/project/17228 | 0.1.14       | 1.0.2        |     
           python-itsdangerous |  DISTRO  | https://release-monitoring.org/project/03892 | 2.0.1        | 2.1.2        |     
                  python-iwlib |  DISTRO  | https://release-monitoring.org/project/51611 | 1.5          | 1.7.0        |     
         python-jaraco-classes |  DISTRO  | https://release-monitoring.org/project/20150 | 2.0          | 3.2.1        |     
       python-jaraco-functools |  DISTRO  | https://release-monitoring.org/project/20165 | 2.0          | 3.5.0        |     
                 python-jinja2 |  DISTRO  | https://release-monitoring.org/project/03894 | 3.0.3        | 3.1.2        |     
               python-jmespath |  DISTRO  | https://release-monitoring.org/project/08749 | 0.10.0       | 1.0.0        |     
             python-jsonschema |  DISTRO  | https://release-monitoring.org/project/03898 | 2.5.1        | 4.4.0        |     
                python-keyring |  DISTRO  | https://release-monitoring.org/project/03901 | 19.2.0       | 23.5.0       |     
             python-kiwisolver |  DISTRO  | https://release-monitoring.org/project/16910 | 1.1.0        | 1.4.2        |     
                python-libusb1 |  DISTRO  | https://release-monitoring.org/project/12301 | 2.0.1        | 3.0.0        |     
                   python-mako |  DISTRO  | https://release-monitoring.org/project/03915 | 1.1.5        | 1.2.0        |     
               python-markdown |  DISTRO  | https://release-monitoring.org/project/03916 | 3.3.4        | 3.3.6        |     
              python-markdown2 |  DISTRO  | https://release-monitoring.org/project/03917 | 2.4.1        | 2.4.3        |     
             python-markupsafe |  DISTRO  | https://release-monitoring.org/project/03918 | 2.0.1        | 2.1.1        |     
             python-matplotlib |  DISTRO  | https://release-monitoring.org/project/03919 | 3.4.3        | 3.5.1        |     
        python-memory-profiler |  DISTRO  | https://release-monitoring.org/project/38508 | 0.58.0       | 0.60.0       |     
                python-mistune |  DISTRO  | https://release-monitoring.org/project/06189 | 0.8.4        | 2.0.2        |     
         python-more-itertools |  DISTRO  | https://release-monitoring.org/project/12201 | 8.10.0       | 8.12.0       |     
                  python-msgfy |  DISTRO  | https://release-monitoring.org/project/29716 | 0.1.0        | 0.2.0        |     
         python-networkmanager |  DISTRO  | https://release-monitoring.org/project/12909 | 2.1          | 2.2          |     
               python-networkx |  DISTRO  | https://release-monitoring.org/project/07791 | 2.6.3        | 2.8          |     
                  python-numpy |  DISTRO  | https://release-monitoring.org/project/02509 | 1.21.2       | 1.22.3       |     
               python-oauthlib |  DISTRO  | https://release-monitoring.org/project/05377 | 3.1.1        | 3.2.0        |     
          python-opcua-asyncio |  DISTRO  | https://release-monitoring.org/project/131612 | 0.8.4        | 0.98.9       |     
              python-paho-mqtt |  DISTRO  | https://release-monitoring.org/project/06084 | 1.4.0        | 1.6.1        |     
               python-paramiko |  DISTRO  | https://release-monitoring.org/project/03954 | 2.10.3       | 2.10.4       |     
                 python-pathpy |  DISTRO  | https://release-monitoring.org/project/21703 | 12.0.1       | 12.5.0       |     
                    python-pbr |  DISTRO  | https://release-monitoring.org/project/03960 | 5.6.0        | 5.8.1        |     
                 python-pillow |  DISTRO  | https://release-monitoring.org/project/07974 | 9.0.1        | 9.1.0        |     
                    python-pip |  DISTRO  | https://release-monitoring.org/project/06529 | 21.2.4       | 22.1b1       |     
                python-portend |  DISTRO  | https://release-monitoring.org/project/20203 | 2.5          | 3.1.0        |     
         python-prompt-toolkit |  DISTRO  | https://release-monitoring.org/project/08742 | 3.0.20       | 3.0.29       |     
                 python-psutil |  DISTRO  | https://release-monitoring.org/project/03978 | 5.8.0        | 5.9.0        |     
               python-psycopg2 |  DISTRO  | https://release-monitoring.org/project/03979 | 2.9.1        | 2.9.3        |     
                   python-pudb |  DISTRO  | https://release-monitoring.org/project/03980 | 2021.1       | 2022.1.1     |     
                     python-py |  DISTRO  | https://release-monitoring.org/project/03981 | 1.10.0       | 1.11.0       |     
                 python-pybind |  DISTRO  | https://release-monitoring.org/project/13384 | 2.9.0        | 2.9.2        |     
                python-pycairo |  DISTRO  | https://release-monitoring.org/project/13166 | 1.19.1       | 1.21.0       |     
               python-pydantic |  DISTRO  | https://release-monitoring.org/project/29768 | 1.8.2        | 1.9.0        |     
             python-pyelftools |  DISTRO  | https://release-monitoring.org/project/16219 | 0.27         | 0.28         |     
                 python-pygame |  DISTRO  | https://release-monitoring.org/project/17480 | d61ea8eabd56 | 2.1.2        |     
               python-pygments |  DISTRO  | https://release-monitoring.org/project/03986 | 2.7.4        | 2.12.0       |     
             python-pyhamcrest |  DISTRO  | https://release-monitoring.org/project/11633 | 2.0.2        | 2.0.3        |     
                  python-pyicu |  DISTRO  | https://release-monitoring.org/project/12004 | 1.9.7        | 2.9          |     
              python-pylibftdi |  DISTRO  | https://release-monitoring.org/project/21583 | 0.18.1       | 0.20.0       |     
                  python-pylru |  DISTRO  | https://release-monitoring.org/project/21584 | 1.2.0        | 1.2.1        |     
               python-pymodbus |  DISTRO  | https://release-monitoring.org/project/15600 | 2.2.0        | 2.5.3        |     
                python-pymupdf |  DISTRO  | https://release-monitoring.org/project/17320 | 1.18.14      | 1.19.6       |     
              python-pyopenssl |  DISTRO  | https://release-monitoring.org/project/05535 | 21.0.0       | 22.0.0       |     
               python-pyparted |  DISTRO  | https://release-monitoring.org/project/15558 | 3.11.6       | 3.12.0       |     
                  python-pyqt5 |  DISTRO  | https://release-monitoring.org/project/20104 | 5.7          | 5.15.6       |     
               python-pyroute2 |  DISTRO  | https://release-monitoring.org/project/20081 | 0.5.7        | 0.6.9        |     
          python-pytablereader |  DISTRO  | https://release-monitoring.org/project/21592 | 0.26.1       | 0.31.3       |     
          python-pytablewriter |  DISTRO  | https://release-monitoring.org/project/21593 | 0.46.1       | 0.64.2       |     
                 python-pytest |  DISTRO  | https://release-monitoring.org/project/03765 | 6.2.5        | 7.1.2        |     
         python-pytest-asyncio |  DISTRO  | https://release-monitoring.org/project/07273 | 0.15.1       | 0.18.3       |     
                   python-pytz |  DISTRO  | https://release-monitoring.org/project/06537 | 2021.3       | 2022.1       |     
                 python-pyudev |  DISTRO  | https://release-monitoring.org/project/08485 | 0.22.0       | 0.23.2       |     
                  python-pyzmq |  DISTRO  | https://release-monitoring.org/project/04104 | 19.0.2       | 23.0.0b1     |     
                  python-redis |  DISTRO  | https://release-monitoring.org/project/03992 | 3.5.3        | 4.2.2        |     
                python-reentry |  DISTRO  | https://release-monitoring.org/project/21596 | 1.3.2        | 1.3.3        |     
                  python-regex |  DISTRO  | https://release-monitoring.org/project/05548 | 2021.4.4     | 2022.4.24    |     
                   python-remi |  DISTRO  | https://release-monitoring.org/project/21597 | 2021.3.2     | 2022.3.7     |     
      python-requests-oauthlib |  DISTRO  | https://release-monitoring.org/project/11803 | 1.3.0        | 1.3.1        |     
               python-rpi-gpio |  DISTRO  | https://release-monitoring.org/project/12026 | 0.7.0        | 0.7.1        |     
             python-rpi-ws281x |  DISTRO  | https://release-monitoring.org/project/21898 | 4.3.0        | 4.3.4        |     
                    python-rsa |  DISTRO  | https://release-monitoring.org/project/08808 | 4.7.2        | 4.8          |     
              python-rtslib-fb |  DISTRO  | https://release-monitoring.org/project/19641 | 2.1.74       | 2.2          |     
             python-s3transfer |  DISTRO  | https://release-monitoring.org/project/10428 | 0.5.0        | 0.5.2        |     
          python-secretstorage |  DISTRO  | https://release-monitoring.org/project/04020 | 3.1.2        | 3.3.2        |     
       python-semantic-version |  DISTRO  | https://release-monitoring.org/project/06514 | 2.8.5        | 2.9.0        |     
             python-sentry-sdk |  DISTRO  | https://release-monitoring.org/project/21603 | 1.4.3        | 1.5.10       |     
       python-service-identity |  DISTRO  | https://release-monitoring.org/project/07917 | 18.1.0       | 21.1.0       |     
           python-setproctitle |  DISTRO  | https://release-monitoring.org/project/11699 | 1.2.2        | 1.2.3        |     
           python-simplesqlite |  DISTRO  | https://release-monitoring.org/project/21608 | 0.45.2       | 1.3.0        |     
                    python-sip |  DISTRO  | https://release-monitoring.org/project/13626 | 4.18         | 5.0.0        |     
                 python-smmap2 |  DISTRO  | https://release-monitoring.org/project/12729 | 4.0.0        | 5.0.0        |     
               python-socketio |  DISTRO  | https://release-monitoring.org/project/21611 | 5.4.0        | 5.6.0        |     
              python-soupsieve |  DISTRO  | https://release-monitoring.org/project/27570 | 2.2.1        | 2.3.2.post1  |     
             python-sqlalchemy |  DISTRO  | https://release-monitoring.org/project/04034 | 1.3.10       | 1.4.36       |     
           python-sqliteschema |  DISTRO  | https://release-monitoring.org/project/29718 | 1.2.1        | 1.3.0        |     
               python-sqlparse |  DISTRO  | https://release-monitoring.org/project/04038 | 0.3.0        | 0.4.2        |     
                python-tempora |  DISTRO  | https://release-monitoring.org/project/21225 | 1.14.1       | 5.0.1        |     
                 python-thrift |  DISTRO  | https://release-monitoring.org/project/21614 | 0.13.0       | 0.16.0       |     
                python-tornado |  DISTRO  | https://release-monitoring.org/project/07498 | 6.0.4        | 6.1          |     
                   python-tqdm |  DISTRO  | https://release-monitoring.org/project/11524 | 4.40.1       | 4.64.0       |     
              python-traitlets |  DISTRO  | https://release-monitoring.org/project/12211 | 5.1.0        | 5.1.1        |     
                python-twisted |  DISTRO  | https://release-monitoring.org/project/04071 | 22.2.0       | 22.4.0       |     
               python-txtorcon |  DISTRO  | https://release-monitoring.org/project/19661 | 21.1.0       | 22.0.0       |     
 python-unittest-xml-reporting |  DISTRO  | https://release-monitoring.org/project/72281 | 3.0.4        | 3.2.0        |     
             python-validators |  DISTRO  | https://release-monitoring.org/project/19818 | 0.15.0       | 0.18.2       |     
               python-watchdog |  DISTRO  | https://release-monitoring.org/project/05341 | 2.1.6        | 2.1.7        |     
                python-wcwidth |  DISTRO  | https://release-monitoring.org/project/08743 | 0.1.9        | 0.2.5        |     
             python-weasyprint |  DISTRO  | https://release-monitoring.org/project/11057 | 54.3         | 55.0b1       |     
                  python-webpy |  DISTRO  | https://release-monitoring.org/project/04090 | 0.40         | 0.62         |     
       python-websocket-client |  DISTRO  | https://release-monitoring.org/project/07288 | 0.58.0       | 1.3.2        |     
             python-websockets |  DISTRO  | https://release-monitoring.org/project/08100 | 10.0         | 10.3         |     
               python-werkzeug |  DISTRO  | https://release-monitoring.org/project/04092 | 1.0.1        | 2.1.2        |     
                  python-wrapt |  DISTRO  | https://release-monitoring.org/project/06108 | 1.12.1       | 1.14.0       |     
                python-wtforms |  DISTRO  | https://release-monitoring.org/project/11805 | 2.3.3        | 3.0.1        |     
                   python-xlib |  DISTRO  | https://release-monitoring.org/project/12180 | 0.27         | 0.31         |     
             python-xlsxwriter |  DISTRO  | https://release-monitoring.org/project/12031 | 3.0.1        | 3.0.3        |     
                   python-yarl |  DISTRO  | https://release-monitoring.org/project/12895 | 1.7.2        | 1.8.0        |     
               python-zeroconf |  DISTRO  | https://release-monitoring.org/project/12681 | 0.29.0       | 0.38.4       |     
          qcom-db410c-firmware |  DISTRO  | https://release-monitoring.org/project/235382 | 1034.2.1     | 1036.1       |     
                          qemu |  DISTRO  | https://release-monitoring.org/project/13607 | 6.2.0        | 7.0.0        |     
                          qpdf |  DISTRO  | https://release-monitoring.org/project/05542 | 10.5.0       | 10.6.3       |     
                   qpid-proton |  DISTRO  | https://release-monitoring.org/project/15198 | 0.35.0       | 0.37.0       |     
                       qt5coap |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.3.0        |     
                        qt5knx |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.3.0        |     
                       qt5mqtt |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.3.0        |     
                      qt5opcua |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.3.0        |     
                  qt5webengine |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.3.0        |     
                        quazip |  DISTRO  | https://release-monitoring.org/project/04141 | 1.2          | 1.3          |     
                           qwt |  DISTRO  | https://release-monitoring.org/project/04147 | 6.1.6        | 6.2.0        | ORPH
               rabbitmq-server |  DISTRO  | https://release-monitoring.org/project/05585 | 3.8.2        | 3.9.16       |     
                         ragel |  DISTRO  | https://release-monitoring.org/project/12105 | 6.10         | 7.0.4        | ORPH
                        ranger |  DISTRO  | https://release-monitoring.org/project/07426 | 1.7.2        | 1.9.3        |     
                         redis |  DISTRO  | https://release-monitoring.org/project/04181 | 6.2.6        | 7.0.0        |     
                   restorecond |  DISTRO  | https://release-monitoring.org/project/16520 | 3.3          | 20200710     | ORPH
              riemann-c-client |  DISTRO  | https://release-monitoring.org/project/21389 | 1.10.5       | 2.0.0        | ORPH
                       rocksdb |  DISTRO  | https://release-monitoring.org/project/15560 | 6.20.3       | 7.1.2        |     
                         rsync |  DISTRO  | https://release-monitoring.org/project/04217 | 3.2.3        | 3.2.4        | ORPH
                       rsyslog |  DISTRO  | https://release-monitoring.org/project/04218 | 8.2010.0     | 8.2204.0     |     
                          rtai |  DISTRO  | https://release-monitoring.org/project/21658 | 4.0.1        | 5.3          | ORPH
                          rtty |  DISTRO  | https://release-monitoring.org/project/87994 | 7.4.0        | 8.0.0        |     
                          ruby |  DISTRO  | https://release-monitoring.org/project/04223 | 3.1.0        | 3.1.2        |     
                         rygel |  DISTRO  | https://release-monitoring.org/project/04751 | 0.40.2       | 0.40.3       |     
                    s390-tools |  DISTRO  | https://release-monitoring.org/project/10714 | 2.20.0       | 2.21.0       |     
                            s6 |  DISTRO  | https://release-monitoring.org/project/05485 | 2.10.0.3     | 2.11.1.0     |     
                        s6-dns |  DISTRO  | https://release-monitoring.org/project/16547 | 2.3.5.1      | 2.3.5.3      |     
                 s6-linux-init |  DISTRO  | https://release-monitoring.org/project/16552 | 1.0.6.3      | 1.0.7.3      |     
                s6-linux-utils |  DISTRO  | https://release-monitoring.org/project/16551 | 2.5.1.5      | 2.5.1.7      |     
                 s6-networking |  DISTRO  | https://release-monitoring.org/project/16550 | 2.4.1.1      | 2.5.1.0      |     
             s6-portable-utils |  DISTRO  | https://release-monitoring.org/project/16549 | 2.2.3.2      | 2.2.4.0      |     
                         s6-rc |  DISTRO  | https://release-monitoring.org/project/16548 | 0.5.2.2      | 0.5.3.1      |     
                      safeclib |  DISTRO  | https://release-monitoring.org/project/21385 | 3.7.1        | 01022022     |     
                        samba4 |  DISTRO  | https://release-monitoring.org/project/04758 | 4.15.7       | 4.16.0       |     
                 sane-backends |  DISTRO  | https://release-monitoring.org/project/04760 | 1.0.32       | 1.1.1        |     
                         scons |  DISTRO  | https://release-monitoring.org/project/04770 | 3.1.2        | 4.3.0        |     
                          sdl2 |  DISTRO  | https://release-monitoring.org/project/04779 | 2.0.20       | 2.0.22       |     
                       sdl_gfx |  DISTRO  | https://release-monitoring.org/project/04778 | 2.0.23       | 2.0.25       | ORPH
                     sdl_sound |  DISTRO  | https://release-monitoring.org/project/10262 | 1.0.3        | 2.0.1        | ORPH
                        sdparm |  DISTRO  | https://release-monitoring.org/project/04787 | 1.10         | 1.12         |     
                       sedutil |  DISTRO  | https://release-monitoring.org/project/15203 | 1.15.1       | 1.20.0       |     
                    sentry-cli |  DISTRO  | https://release-monitoring.org/project/135642 | 1.59.0       | 2.0.4        |     
                 sentry-native |  DISTRO  | https://release-monitoring.org/project/135639 | 0.4.1        | 0.4.17       |     
                       ser2net |  DISTRO  | https://release-monitoring.org/project/21655 | 4.3.4        | 4.3.5        |     
              shared-mime-info |  DISTRO  | https://release-monitoring.org/project/05524 | 1.12         | 2.2          | ORPH
                          shim |  DISTRO  | https://release-monitoring.org/project/10719 | 15.4         | 15.5         |     
                       skalibs |  DISTRO  | https://release-monitoring.org/project/05486 | 2.10.0.3     | 2.11.2.0     |     
                         slirp |  DISTRO  | https://release-monitoring.org/project/96796 | 4.6.1        | 4.7.0        |     
                 smartmontools |  DISTRO  | https://release-monitoring.org/project/04835 | 7.2          | 7.3          | ORPH
                        sngrep |  DISTRO  | https://release-monitoring.org/project/17075 | 1.4.7        | 1.5.0        | ORPH
                        snmppp |  DISTRO  | https://release-monitoring.org/project/21318 | 3.4.9        | 3.4.10       |     
                        snort3 |  DISTRO  | https://release-monitoring.org/project/13263 | 3.1.18.0     | 3.1.28.0     |     
                     sofia-sip |  DISTRO  | https://release-monitoring.org/project/10509 | 1.13.6-41... | 1.13.7       |     
                     softether |  DISTRO  | https://release-monitoring.org/project/21383 | 4.30-9700... | 4.38-9760... |     
       sound-theme-freedesktop |  DISTRO  | https://release-monitoring.org/project/10152 | 0.7          | 0.8          |     
                       spandsp |  DISTRO  | https://release-monitoring.org/project/12600 | 3.0.0-6ec... | 3.0.0        |     
                    sphinxbase |  DISTRO  | https://release-monitoring.org/project/20548 | 5prealpha    | 0.8          |     
                spice-protocol |  DISTRO  | https://release-monitoring.org/project/14892 | 0.14.3       | 0.14.4       |     
                     sqlcipher |  DISTRO  | https://release-monitoring.org/project/11213 | 4.5.0        | 4.5.1        |     
                        sqlite |  DISTRO  | https://release-monitoring.org/project/04877 | 3.38.2       | 3.38.3       |     
                      squashfs |  DISTRO  | https://release-monitoring.org/project/04879 | 4.5          | 4.5.1        |     
                         squid |  DISTRO  | https://release-monitoring.org/project/04880 | 5.3          | 5.5          | ORPH
                         sshfs |  DISTRO  | https://release-monitoring.org/project/11058 | 3.7.1        | 3.7.2        | ORPH
             start-stop-daemon |  DISTRO  | https://release-monitoring.org/project/08127 | 1.20.7.1     | 1.21.7       | ORPH
                    stm32flash |  DISTRO  | https://release-monitoring.org/project/227276 | 0.6          | 0.7          |     
                        stress |  DISTRO  | https://release-monitoring.org/project/08048 | 1.0.4        | 1.0.5        |     
                    strongswan |  DISTRO  | https://release-monitoring.org/project/04899 | 5.9.5        | 5.9.6        |     
                       stunnel |  DISTRO  | https://release-monitoring.org/project/04901 | 5.60         | 5.63         |     
                          sudo |  DISTRO  | https://release-monitoring.org/project/04906 | 1.9.8p2      | 1.9.10       | ORPH
                    supervisor |  DISTRO  | https://release-monitoring.org/project/16289 | 4.2.2        | 4.2.4        | ORPH
                       synergy |  DISTRO  | https://release-monitoring.org/project/05718 | 2.0.12-beta  | 2.3.2        |     
                        sysdig |  DISTRO  | https://release-monitoring.org/project/16898 | 0.29.1       | 0.29.2       |     
                     syslog-ng |  DISTRO  | https://release-monitoring.org/project/04930 | 3.35.1       | 3.36.1       |     
                       sysprof |  DISTRO  | https://release-monitoring.org/project/21649 | 1.2.0        | 3.44.0       |     
                       sysrepo |  DISTRO  | https://release-monitoring.org/project/34820 | 2.0.53       | 2.1.42       |     
                       sysstat |  DISTRO  | https://release-monitoring.org/project/04931 | 12.4.2       | 12.5.6       | ORPH
         system-config-printer |  DISTRO  | https://release-monitoring.org/project/08855 | 1.5.15       | 1.5.16       | ORPH
             systemd-bootchart |  DISTRO  | https://release-monitoring.org/project/11774 | 233          | 234          |     
                      sysvinit |  DISTRO  | https://release-monitoring.org/project/21648 | 2.99         | 3.04         | ORPH
                         tclap |  DISTRO  | https://release-monitoring.org/project/04942 | 1.2.4        | 1.2.5        |     
                     tcpreplay |  DISTRO  | https://release-monitoring.org/project/13716 | 4.3.4        | 4.4.1        | ORPH
                 tesseract-ocr |  DISTRO  | https://release-monitoring.org/project/04954 | 5.0.1        | 5.1.0        |     
                      thermald |  DISTRO  | https://release-monitoring.org/project/14500 | 2.4.8        | 2.4.9        |     
                        thrift |  DISTRO  | https://release-monitoring.org/project/05581 | 0.14.1       | 0.16.0       | ORPH
                      tinifier |  DISTRO  | https://release-monitoring.org/project/241900 | 3.4.0        | 3.5.0        |     
                       tinyssh |  DISTRO  | https://release-monitoring.org/project/14678 | 20210601     | 20220311     |     
                       tinyxml |  DISTRO  | https://release-monitoring.org/project/10162 | 2.6.2_2      | 2.6.2        | ORPH
                           tio |  DISTRO  | https://release-monitoring.org/project/20587 | 1.32         | 1.37         |     
                          tmux |  DISTRO  | https://release-monitoring.org/project/04980 | 3.1c         | 3.2a         |     
                     tpm-tools |  DISTRO  | https://release-monitoring.org/project/21640 | 1.3.9.1      | 1.3.9.2      |     
                    tpm2-abrmd |  DISTRO  | https://release-monitoring.org/project/16819 | 2.3.3        | 2.4.1        | ORPH
                   tpm2-pkcs11 |  DISTRO  | https://release-monitoring.org/project/18777 | 1.7.0        | 1.8.0        |     
                     tpm2-totp |  DISTRO  | https://release-monitoring.org/project/18790 | 0.2.1        | 0.3.0        |     
                      tpm2-tss |  DISTRO  | https://release-monitoring.org/project/12683 | 3.1.0        | 3.2.0        | ORPH
                     trace-cmd |  DISTRO  | https://release-monitoring.org/project/07873 | 2.9.7        | 3.0.3        |     
                        tzdata |  DISTRO  | https://release-monitoring.org/project/05021 | 2021e        | 2022a        |     
                   uboot-tools |  DISTRO  | https://release-monitoring.org/project/05022 | 2021.07      | 2022.04      |     
                       udpcast |  DISTRO  | https://release-monitoring.org/project/10206 | 20200328     | 20211207     | ORPH
                       uftrace |  DISTRO  | https://release-monitoring.org/project/195039 | 0.10         | 0.11         |     
                           uhd |  DISTRO  | https://release-monitoring.org/project/12572 | 3.15.0.0     | 4.2.0.0      |     
                       unionfs |  DISTRO  | https://release-monitoring.org/project/17617 | 2.1          | 2.2          |     
                         unrar |  DISTRO  | https://release-monitoring.org/project/13306 | 6.1.3        | 6.1.6        | ORPH
                      upmpdcli |  DISTRO  | https://release-monitoring.org/project/15848 | 1.5.12       | 1.5.16       |     
                        upower |  DISTRO  | https://release-monitoring.org/project/05056 | 0.99.11      | 0.99.17      |     
                           uvw |  DISTRO  | https://release-monitoring.org/project/33083 | 2.11.0_li... | 2.12.1_li... |     
                          vala |  DISTRO  | https://release-monitoring.org/project/05065 | 0.52.4       | 0.56.1       | ORPH
                           vim |  DISTRO  | https://release-monitoring.org/project/05092 | 8.2.4843     | 8.2.4851     | ORPH
                        vnstat |  DISTRO  | https://release-monitoring.org/project/07283 | 2.8          | 2.9          |     
                          vpnc |  DISTRO  | https://release-monitoring.org/project/15955 | 0.5.3r550... | 0.5.3        | ORPH
                           vte |  DISTRO  | https://release-monitoring.org/project/10895 | 0.66.2       | 0.68.0       | ORPH
                vulkan-headers |  DISTRO  | https://release-monitoring.org/project/88835 | 1.2.203      | 1.3.212      | ORPH
                        waffle |  DISTRO  | https://release-monitoring.org/project/21633 | 1.6.1        | 1.7.0        |     
                     waylandpp |  DISTRO  | https://release-monitoring.org/project/16969 | 0.2.8        | 1.0.0        |     
       webrtc-audio-processing |  DISTRO  | https://release-monitoring.org/project/15929 | 0.3.1        | 1.0          | ORPH
                         whois |  DISTRO  | https://release-monitoring.org/project/05128 | 5.5.11       | 5.5.13       |     
                          wine |  DISTRO  | https://release-monitoring.org/project/05134 | 6.0          | 7.7          |     
        wireguard-linux-compat |  DISTRO  | https://release-monitoring.org/project/62379 | 1.0.20210606 | 1.0.20211208 |     
                wireless-regdb |  DISTRO  | https://release-monitoring.org/project/15257 | 2022.02.18   | 2022.04.08   |     
                   wireplumber |  DISTRO  | https://release-monitoring.org/project/235056 | 0.4.8        | 0.4.9        | ORPH
                     wireshark |  DISTRO  | https://release-monitoring.org/project/05137 | 3.4.12       | 3.6.3        | ORPH
                   xapp_appres |  DISTRO  | https://release-monitoring.org/project/15053 | 1.0.5        | 1.0.6        |     
                   xapp_bitmap |  DISTRO  | https://release-monitoring.org/project/00191 | 1.0.9        | 1.1.0        |     
                  xapp_editres |  DISTRO  | https://release-monitoring.org/project/17160 | 1.0.7        | 1.0.8        |     
                  xapp_iceauth |  DISTRO  | https://release-monitoring.org/project/15048 | 1.0.8        | 1.0.9        |     
                  xapp_listres |  DISTRO  | https://release-monitoring.org/project/17161 | 1.0.4        | 1.0.5        |     
                     xapp_luit |  DISTRO  | https://release-monitoring.org/project/15047 | 1.1.1        | 20220111     |     
              xapp_mkfontscale |  DISTRO  | https://release-monitoring.org/project/15043 | 1.2.1        | 1.2.2        |     
                   xapp_rstart |  DISTRO  | https://release-monitoring.org/project/21256 | 1.0.5        | 1.0.6        |     
                xapp_setxkbmap |  DISTRO  | https://release-monitoring.org/project/12314 | 1.3.2        | 1.3.3        |     
                      xapp_twm |  DISTRO  | https://release-monitoring.org/project/15038 | 1.0.11       | 1.0.12       |     
                    xapp_xauth |  DISTRO  | https://release-monitoring.org/project/05253 | 1.1.1        | 1.1.2        |     
                    xapp_xcalc |  DISTRO  | https://release-monitoring.org/project/05164 | 1.1.0        | 1.1.1        |     
                   xapp_xclock |  DISTRO  | https://release-monitoring.org/project/15032 | 1.0.9        | 1.1.1        |     
                      xapp_xdm |  DISTRO  | https://release-monitoring.org/project/05255 | 1.1.12       | 1.1.13       |     
                 xapp_xdpyinfo |  DISTRO  | https://release-monitoring.org/project/15028 | 1.3.2        | 1.3.3        |     
                    xapp_xedit |  DISTRO  | https://release-monitoring.org/project/05180 | 1.2.2        | 1.2.3        |     
                    xapp_xload |  DISTRO  | https://release-monitoring.org/project/14992 | 1.1.3        | 1.1.4        |     
                 xapp_xlsfonts |  DISTRO  | https://release-monitoring.org/project/14964 | 1.0.6        | 1.0.7        |     
                      xapp_xsm |  DISTRO  | https://release-monitoring.org/project/05259 | 1.0.4        | 1.0.5        |     
   xdriver_xf86-input-libinput |  DISTRO  | https://release-monitoring.org/project/05782 | 1.2.0        | 1.2.1        |     
     xdriver_xf86-video-amdgpu |  DISTRO  | https://release-monitoring.org/project/15900 | 19.1.0       | 22.0.0       |     
      xdriver_xf86-video-dummy |  DISTRO  | https://release-monitoring.org/project/05216 | 0.3.8        | 0.4.0        |     
                           xen |  DISTRO  | https://release-monitoring.org/project/05181 | 4.14.4       | 4.16.1       |     
                      xfsprogs |  DISTRO  | https://release-monitoring.org/project/05188 | 5.14.2       | 5.15.0       | ORPH
                        xinetd |  DISTRO  | https://release-monitoring.org/project/06382 | 2.3.15       | 2.3.15.4     |     
              xkeyboard-config |  DISTRO  | https://release-monitoring.org/project/05191 | 2.34         | 2.35.1       |     
                   xlib_libX11 |  DISTRO  | https://release-monitoring.org/project/01764 | 1.7.3.1      | 1.8          |     
               xlib_libXcursor |  DISTRO  | https://release-monitoring.org/project/01770 | 1.2.0        | 1.2.1        |     
                  xlib_libXvMC |  DISTRO  | https://release-monitoring.org/project/01796 | 1.0.12       | 1.0.13       |     
                     xorgproto |  DISTRO  | https://release-monitoring.org/project/17190 | 2021.5       | 2022.1       |     
           xserver_xorg-server |  DISTRO  | https://release-monitoring.org/project/05250 | 21.1.2       | 21.1.3       |     
                xtables-addons |  DISTRO  | https://release-monitoring.org/project/07736 | 3.17         | 3.20         | ORPH
                         xterm |  DISTRO  | https://release-monitoring.org/project/05272 | 371          | 372          | ORPH
                           yad |  DISTRO  | https://release-monitoring.org/project/05280 | 0.40.0       | 11.1         |     
                      yaml-cpp |  DISTRO  | https://release-monitoring.org/project/05284 | 0.6.3        | 0.7.0        | ORPH
                        zabbix |  DISTRO  | https://release-monitoring.org/project/05492 | 5.4.9        | 6.0.3        |     
                           zic |  DISTRO  | https://release-monitoring.org/project/16905 | 2021e        | 2022a        |     

Packages having CVEs
====================

CVEs for the 'master' branch
----------------------------

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                        apache | CVE-1999-0236    | https://security-tracker.debian.org/tracker/CVE-1999-0236   
                        apache | CVE-1999-0289    | https://security-tracker.debian.org/tracker/CVE-1999-0289   
                        apache | CVE-1999-0678    | https://security-tracker.debian.org/tracker/CVE-1999-0678   
                        apache | CVE-1999-1237    | https://security-tracker.debian.org/tracker/CVE-1999-1237   
                        apache | CVE-1999-1412    | https://security-tracker.debian.org/tracker/CVE-1999-1412   
                        apache | CVE-2007-0086    | https://security-tracker.debian.org/tracker/CVE-2007-0086   
                        apache | CVE-2007-0450    | https://security-tracker.debian.org/tracker/CVE-2007-0450   
                        apache | CVE-2007-4465    | https://security-tracker.debian.org/tracker/CVE-2007-4465   
                        apache | CVE-2007-5000    | https://security-tracker.debian.org/tracker/CVE-2007-5000   
                        apache | CVE-2007-6388    | https://security-tracker.debian.org/tracker/CVE-2007-6388   
                        apache | CVE-2007-6420    | https://security-tracker.debian.org/tracker/CVE-2007-6420   
                        apache | CVE-2007-6421    | https://security-tracker.debian.org/tracker/CVE-2007-6421   
                        apache | CVE-2007-6422    | https://security-tracker.debian.org/tracker/CVE-2007-6422   
                        apache | CVE-2007-6423    | https://security-tracker.debian.org/tracker/CVE-2007-6423   
                        apache | CVE-2008-0455    | https://security-tracker.debian.org/tracker/CVE-2008-0455   
                        apache | CVE-2008-2168    | https://security-tracker.debian.org/tracker/CVE-2008-2168   
                        apache | CVE-2008-2939    | https://security-tracker.debian.org/tracker/CVE-2008-2939   
                        apache | CVE-2009-1195    | https://security-tracker.debian.org/tracker/CVE-2009-1195   
                        apache | CVE-2009-1890    | https://security-tracker.debian.org/tracker/CVE-2009-1890   
                        apache | CVE-2009-1891    | https://security-tracker.debian.org/tracker/CVE-2009-1891   
                        apache | CVE-2009-2699    | https://security-tracker.debian.org/tracker/CVE-2009-2699   
                        apache | CVE-2010-0408    | https://security-tracker.debian.org/tracker/CVE-2010-0408   
                        apache | CVE-2010-0425    | https://security-tracker.debian.org/tracker/CVE-2010-0425   
                        apache | CVE-2010-0434    | https://security-tracker.debian.org/tracker/CVE-2010-0434   
                        apache | CVE-2010-1452    | https://security-tracker.debian.org/tracker/CVE-2010-1452   
                        apache | CVE-2014-0231    | https://security-tracker.debian.org/tracker/CVE-2014-0231   
                      apparmor | CVE-2016-1585    | https://security-tracker.debian.org/tracker/CVE-2016-1585   
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                          atop | CVE-2011-3618    | https://security-tracker.debian.org/tracker/CVE-2011-3618   
                         avahi | CVE-2021-3468    | https://security-tracker.debian.org/tracker/CVE-2021-3468   
                     belle-sip | CVE-2021-33056   | https://security-tracker.debian.org/tracker/CVE-2021-33056  
                     belle-sip | CVE-2021-43610   | https://security-tracker.debian.org/tracker/CVE-2021-43610  
                     belle-sip | CVE-2021-43611   | https://security-tracker.debian.org/tracker/CVE-2021-43611  
                        bento4 | CVE-2020-23331   | https://security-tracker.debian.org/tracker/CVE-2020-23331  
                        bento4 | CVE-2020-23332   | https://security-tracker.debian.org/tracker/CVE-2020-23332  
                        bento4 | CVE-2022-27607   | https://security-tracker.debian.org/tracker/CVE-2022-27607  
                    berkeleydb | CVE-2017-3604    | https://security-tracker.debian.org/tracker/CVE-2017-3604   
                    berkeleydb | CVE-2017-3605    | https://security-tracker.debian.org/tracker/CVE-2017-3605   
                    berkeleydb | CVE-2017-3606    | https://security-tracker.debian.org/tracker/CVE-2017-3606   
                    berkeleydb | CVE-2017-3607    | https://security-tracker.debian.org/tracker/CVE-2017-3607   
                    berkeleydb | CVE-2017-3608    | https://security-tracker.debian.org/tracker/CVE-2017-3608   
                    berkeleydb | CVE-2017-3609    | https://security-tracker.debian.org/tracker/CVE-2017-3609   
                    berkeleydb | CVE-2017-3610    | https://security-tracker.debian.org/tracker/CVE-2017-3610   
                    berkeleydb | CVE-2017-3611    | https://security-tracker.debian.org/tracker/CVE-2017-3611   
                    berkeleydb | CVE-2017-3612    | https://security-tracker.debian.org/tracker/CVE-2017-3612   
                    berkeleydb | CVE-2017-3613    | https://security-tracker.debian.org/tracker/CVE-2017-3613   
                    berkeleydb | CVE-2017-3614    | https://security-tracker.debian.org/tracker/CVE-2017-3614   
                    berkeleydb | CVE-2017-3615    | https://security-tracker.debian.org/tracker/CVE-2017-3615   
                    berkeleydb | CVE-2017-3616    | https://security-tracker.debian.org/tracker/CVE-2017-3616   
                    berkeleydb | CVE-2017-3617    | https://security-tracker.debian.org/tracker/CVE-2017-3617   
                    berkeleydb | CVE-2019-2708    | https://security-tracker.debian.org/tracker/CVE-2019-2708   
                    berkeleydb | CVE-2020-2981    | https://security-tracker.debian.org/tracker/CVE-2020-2981   
                      binutils | CVE-2021-45078   | https://security-tracker.debian.org/tracker/CVE-2021-45078  
                       bitcoin | CVE-2012-1909    | https://security-tracker.debian.org/tracker/CVE-2012-1909   
                       bitcoin | CVE-2012-4682    | https://security-tracker.debian.org/tracker/CVE-2012-4682   
                       bitcoin | CVE-2012-4683    | https://security-tracker.debian.org/tracker/CVE-2012-4683   
                       bitcoin | CVE-2013-2272    | https://security-tracker.debian.org/tracker/CVE-2013-2272   
                       bitcoin | CVE-2013-2273    | https://security-tracker.debian.org/tracker/CVE-2013-2273   
                       bitcoin | CVE-2013-2292    | https://security-tracker.debian.org/tracker/CVE-2013-2292   
                       bitcoin | CVE-2013-2293    | https://security-tracker.debian.org/tracker/CVE-2013-2293   
                       bitcoin | CVE-2013-3220    | https://security-tracker.debian.org/tracker/CVE-2013-3220   
                  bluez5_utils | CVE-2020-12352   | https://security-tracker.debian.org/tracker/CVE-2020-12352  
                  bluez5_utils | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
          bluez5_utils-headers | CVE-2020-12352   | https://security-tracker.debian.org/tracker/CVE-2020-12352  
          bluez5_utils-headers | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
                        bsdiff | CVE-2020-14315   | https://security-tracker.debian.org/tracker/CVE-2020-14315  
                       busybox | CVE-2022-28391   | https://security-tracker.debian.org/tracker/CVE-2022-28391  
                         cairo | CVE-2019-6461    | https://security-tracker.debian.org/tracker/CVE-2019-6461   
                         cairo | CVE-2019-6462    | https://security-tracker.debian.org/tracker/CVE-2019-6462   
                         cairo | CVE-2020-35492   | https://security-tracker.debian.org/tracker/CVE-2020-35492  
                        clamav | CVE-2016-1405    | https://security-tracker.debian.org/tracker/CVE-2016-1405   
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
                      cryptopp | CVE-2021-43398   | https://security-tracker.debian.org/tracker/CVE-2021-43398  
                          cups | CVE-2018-6553    | https://security-tracker.debian.org/tracker/CVE-2018-6553   
                           cvs | CVE-2017-12836   | https://security-tracker.debian.org/tracker/CVE-2017-12836  
                     darkhttpd | CVE-2020-25691   | https://security-tracker.debian.org/tracker/CVE-2020-25691  
                       dnsmasq | CVE-2021-45951   | https://security-tracker.debian.org/tracker/CVE-2021-45951  
                       dnsmasq | CVE-2021-45952   | https://security-tracker.debian.org/tracker/CVE-2021-45952  
                       dnsmasq | CVE-2021-45953   | https://security-tracker.debian.org/tracker/CVE-2021-45953  
                       dnsmasq | CVE-2021-45954   | https://security-tracker.debian.org/tracker/CVE-2021-45954  
                       dnsmasq | CVE-2021-45955   | https://security-tracker.debian.org/tracker/CVE-2021-45955  
                       dnsmasq | CVE-2021-45956   | https://security-tracker.debian.org/tracker/CVE-2021-45956  
                       dnsmasq | CVE-2021-45957   | https://security-tracker.debian.org/tracker/CVE-2021-45957  
                        docker | CVE-2014-0048    | https://security-tracker.debian.org/tracker/CVE-2014-0048   
                        docker | CVE-2014-8178    | https://security-tracker.debian.org/tracker/CVE-2014-8178   
                        docker | CVE-2014-8179    | https://security-tracker.debian.org/tracker/CVE-2014-8179   
                        docker | CVE-2015-1843    | https://security-tracker.debian.org/tracker/CVE-2015-1843   
                        docker | CVE-2015-3627    | https://security-tracker.debian.org/tracker/CVE-2015-3627   
                        docker | CVE-2015-3630    | https://security-tracker.debian.org/tracker/CVE-2015-3630   
                        docker | CVE-2015-3631    | https://security-tracker.debian.org/tracker/CVE-2015-3631   
                        docker | CVE-2016-3697    | https://security-tracker.debian.org/tracker/CVE-2016-3697   
                        docker | CVE-2017-14992   | https://security-tracker.debian.org/tracker/CVE-2017-14992  
                        docker | CVE-2019-13139   | https://security-tracker.debian.org/tracker/CVE-2019-13139  
                        docker | CVE-2019-13509   | https://security-tracker.debian.org/tracker/CVE-2019-13509  
                        docker | CVE-2019-15752   | https://security-tracker.debian.org/tracker/CVE-2019-15752  
                        docker | CVE-2019-16884   | https://security-tracker.debian.org/tracker/CVE-2019-16884  
                        docker | CVE-2019-5736    | https://security-tracker.debian.org/tracker/CVE-2019-5736   
                        docker | CVE-2020-27534   | https://security-tracker.debian.org/tracker/CVE-2020-27534  
                        docker | CVE-2021-21284   | https://security-tracker.debian.org/tracker/CVE-2021-21284  
                        docker | CVE-2021-21285   | https://security-tracker.debian.org/tracker/CVE-2021-21285  
                        docker | CVE-2021-3162    | https://security-tracker.debian.org/tracker/CVE-2021-3162   
                        docker | CVE-2021-33183   | https://security-tracker.debian.org/tracker/CVE-2021-33183  
                        docker | CVE-2022-25365   | https://security-tracker.debian.org/tracker/CVE-2022-25365  
                     e2fsprogs | CVE-2022-1304    | https://security-tracker.debian.org/tracker/CVE-2022-1304   
                          edk2 | CVE-2014-4859    | https://security-tracker.debian.org/tracker/CVE-2014-4859   
                          edk2 | CVE-2014-4860    | https://security-tracker.debian.org/tracker/CVE-2014-4860   
                          edk2 | CVE-2014-8271    | https://security-tracker.debian.org/tracker/CVE-2014-8271   
                          edk2 | CVE-2019-14553   | https://security-tracker.debian.org/tracker/CVE-2019-14553  
                          edk2 | CVE-2019-14559   | https://security-tracker.debian.org/tracker/CVE-2019-14559  
                          edk2 | CVE-2019-14562   | https://security-tracker.debian.org/tracker/CVE-2019-14562  
                          edk2 | CVE-2019-14563   | https://security-tracker.debian.org/tracker/CVE-2019-14563  
                          edk2 | CVE-2019-14575   | https://security-tracker.debian.org/tracker/CVE-2019-14575  
                          edk2 | CVE-2019-14586   | https://security-tracker.debian.org/tracker/CVE-2019-14586  
                          edk2 | CVE-2019-14587   | https://security-tracker.debian.org/tracker/CVE-2019-14587  
                         emlog | CVE-2021-44584   | https://security-tracker.debian.org/tracker/CVE-2021-44584  
                        erlang | CVE-2020-35733   | https://security-tracker.debian.org/tracker/CVE-2020-35733  
                          exim | CVE-2020-28017   | https://security-tracker.debian.org/tracker/CVE-2020-28017  
                         exiv2 | CVE-2007-6353    | https://security-tracker.debian.org/tracker/CVE-2007-6353   
                        ffmpeg | CVE-2021-38291   | https://security-tracker.debian.org/tracker/CVE-2021-38291  
                           git | CVE-2022-24765   | https://security-tracker.debian.org/tracker/CVE-2022-24765  
                           git | CVE-2022-24975   | https://security-tracker.debian.org/tracker/CVE-2022-24975  
                         glibc | CVE-2010-4756    | https://security-tracker.debian.org/tracker/CVE-2010-4756   
                         glibc | CVE-2019-1010022 | https://security-tracker.debian.org/tracker/CVE-2019-1010022
                         glibc | CVE-2019-1010023 | https://security-tracker.debian.org/tracker/CVE-2019-1010023
                         glibc | CVE-2019-1010024 | https://security-tracker.debian.org/tracker/CVE-2019-1010024
                         glibc | CVE-2019-1010025 | https://security-tracker.debian.org/tracker/CVE-2019-1010025
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                            go | CVE-2020-29509   | https://security-tracker.debian.org/tracker/CVE-2020-29509  
                            go | CVE-2020-29511   | https://security-tracker.debian.org/tracker/CVE-2020-29511  
                graphicsmagick | CVE-2007-0770    | https://security-tracker.debian.org/tracker/CVE-2007-0770   
                graphicsmagick | CVE-2008-6621    | https://security-tracker.debian.org/tracker/CVE-2008-6621   
                     graphite2 | CVE-2017-5436    | https://security-tracker.debian.org/tracker/CVE-2017-5436   
                         grub2 | CVE-2021-3981    | https://security-tracker.debian.org/tracker/CVE-2021-3981   
                         grub2 | CVE-2021-46705   | https://security-tracker.debian.org/tracker/CVE-2021-46705  
                       haproxy | CVE-2016-2102    | https://security-tracker.debian.org/tracker/CVE-2016-2102   
                       haproxy | CVE-2022-0711    | https://security-tracker.debian.org/tracker/CVE-2022-0711   
                heirloom-mailx | CVE-2004-2771    | https://security-tracker.debian.org/tracker/CVE-2004-2771   
                   imagemagick | CVE-2007-1667    | https://security-tracker.debian.org/tracker/CVE-2007-1667   
                   imagemagick | CVE-2014-9804    | https://security-tracker.debian.org/tracker/CVE-2014-9804   
                   imagemagick | CVE-2014-9805    | https://security-tracker.debian.org/tracker/CVE-2014-9805   
                   imagemagick | CVE-2014-9806    | https://security-tracker.debian.org/tracker/CVE-2014-9806   
                   imagemagick | CVE-2014-9807    | https://security-tracker.debian.org/tracker/CVE-2014-9807   
                   imagemagick | CVE-2014-9808    | https://security-tracker.debian.org/tracker/CVE-2014-9808   
                   imagemagick | CVE-2014-9809    | https://security-tracker.debian.org/tracker/CVE-2014-9809   
                   imagemagick | CVE-2014-9810    | https://security-tracker.debian.org/tracker/CVE-2014-9810   
                   imagemagick | CVE-2014-9811    | https://security-tracker.debian.org/tracker/CVE-2014-9811   
                   imagemagick | CVE-2014-9812    | https://security-tracker.debian.org/tracker/CVE-2014-9812   
                   imagemagick | CVE-2014-9813    | https://security-tracker.debian.org/tracker/CVE-2014-9813   
                   imagemagick | CVE-2014-9814    | https://security-tracker.debian.org/tracker/CVE-2014-9814   
                   imagemagick | CVE-2014-9815    | https://security-tracker.debian.org/tracker/CVE-2014-9815   
                   imagemagick | CVE-2014-9816    | https://security-tracker.debian.org/tracker/CVE-2014-9816   
                   imagemagick | CVE-2014-9817    | https://security-tracker.debian.org/tracker/CVE-2014-9817   
                   imagemagick | CVE-2014-9818    | https://security-tracker.debian.org/tracker/CVE-2014-9818   
                   imagemagick | CVE-2014-9819    | https://security-tracker.debian.org/tracker/CVE-2014-9819   
                   imagemagick | CVE-2014-9820    | https://security-tracker.debian.org/tracker/CVE-2014-9820   
                   imagemagick | CVE-2014-9821    | https://security-tracker.debian.org/tracker/CVE-2014-9821   
                   imagemagick | CVE-2014-9822    | https://security-tracker.debian.org/tracker/CVE-2014-9822   
                   imagemagick | CVE-2014-9823    | https://security-tracker.debian.org/tracker/CVE-2014-9823   
                   imagemagick | CVE-2014-9824    | https://security-tracker.debian.org/tracker/CVE-2014-9824   
                   imagemagick | CVE-2014-9825    | https://security-tracker.debian.org/tracker/CVE-2014-9825   
                   imagemagick | CVE-2014-9826    | https://security-tracker.debian.org/tracker/CVE-2014-9826   
                   imagemagick | CVE-2014-9827    | https://security-tracker.debian.org/tracker/CVE-2014-9827   
                   imagemagick | CVE-2014-9828    | https://security-tracker.debian.org/tracker/CVE-2014-9828   
                   imagemagick | CVE-2014-9829    | https://security-tracker.debian.org/tracker/CVE-2014-9829   
                   imagemagick | CVE-2014-9830    | https://security-tracker.debian.org/tracker/CVE-2014-9830   
                   imagemagick | CVE-2014-9831    | https://security-tracker.debian.org/tracker/CVE-2014-9831   
                   imagemagick | CVE-2014-9848    | https://security-tracker.debian.org/tracker/CVE-2014-9848   
                   imagemagick | CVE-2014-9852    | https://security-tracker.debian.org/tracker/CVE-2014-9852   
                   imagemagick | CVE-2014-9853    | https://security-tracker.debian.org/tracker/CVE-2014-9853   
                   imagemagick | CVE-2014-9854    | https://security-tracker.debian.org/tracker/CVE-2014-9854   
                   imagemagick | CVE-2014-9907    | https://security-tracker.debian.org/tracker/CVE-2014-9907   
                   imagemagick | CVE-2016-10062   | https://security-tracker.debian.org/tracker/CVE-2016-10062  
                   imagemagick | CVE-2016-10144   | https://security-tracker.debian.org/tracker/CVE-2016-10144  
                   imagemagick | CVE-2016-10145   | https://security-tracker.debian.org/tracker/CVE-2016-10145  
                   imagemagick | CVE-2016-10146   | https://security-tracker.debian.org/tracker/CVE-2016-10146  
                   imagemagick | CVE-2016-7513    | https://security-tracker.debian.org/tracker/CVE-2016-7513   
                   imagemagick | CVE-2016-7514    | https://security-tracker.debian.org/tracker/CVE-2016-7514   
                   imagemagick | CVE-2016-7515    | https://security-tracker.debian.org/tracker/CVE-2016-7515   
                   imagemagick | CVE-2016-7516    | https://security-tracker.debian.org/tracker/CVE-2016-7516   
                   imagemagick | CVE-2016-7517    | https://security-tracker.debian.org/tracker/CVE-2016-7517   
                   imagemagick | CVE-2016-7518    | https://security-tracker.debian.org/tracker/CVE-2016-7518   
                   imagemagick | CVE-2016-7519    | https://security-tracker.debian.org/tracker/CVE-2016-7519   
                   imagemagick | CVE-2016-7520    | https://security-tracker.debian.org/tracker/CVE-2016-7520   
                   imagemagick | CVE-2016-7521    | https://security-tracker.debian.org/tracker/CVE-2016-7521   
                   imagemagick | CVE-2016-7522    | https://security-tracker.debian.org/tracker/CVE-2016-7522   
                   imagemagick | CVE-2016-7523    | https://security-tracker.debian.org/tracker/CVE-2016-7523   
                   imagemagick | CVE-2016-7524    | https://security-tracker.debian.org/tracker/CVE-2016-7524   
                   imagemagick | CVE-2016-7525    | https://security-tracker.debian.org/tracker/CVE-2016-7525   
                   imagemagick | CVE-2016-7526    | https://security-tracker.debian.org/tracker/CVE-2016-7526   
                   imagemagick | CVE-2016-7527    | https://security-tracker.debian.org/tracker/CVE-2016-7527   
                   imagemagick | CVE-2016-7528    | https://security-tracker.debian.org/tracker/CVE-2016-7528   
                   imagemagick | CVE-2016-7529    | https://security-tracker.debian.org/tracker/CVE-2016-7529   
                   imagemagick | CVE-2016-7530    | https://security-tracker.debian.org/tracker/CVE-2016-7530   
                   imagemagick | CVE-2016-7531    | https://security-tracker.debian.org/tracker/CVE-2016-7531   
                   imagemagick | CVE-2016-7532    | https://security-tracker.debian.org/tracker/CVE-2016-7532   
                   imagemagick | CVE-2016-7533    | https://security-tracker.debian.org/tracker/CVE-2016-7533   
                   imagemagick | CVE-2016-7534    | https://security-tracker.debian.org/tracker/CVE-2016-7534   
                   imagemagick | CVE-2016-7535    | https://security-tracker.debian.org/tracker/CVE-2016-7535   
                   imagemagick | CVE-2016-7536    | https://security-tracker.debian.org/tracker/CVE-2016-7536   
                   imagemagick | CVE-2016-7537    | https://security-tracker.debian.org/tracker/CVE-2016-7537   
                   imagemagick | CVE-2016-7538    | https://security-tracker.debian.org/tracker/CVE-2016-7538   
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                   imagemagick | CVE-2017-5509    | https://security-tracker.debian.org/tracker/CVE-2017-5509   
                   imagemagick | CVE-2017-5510    | https://security-tracker.debian.org/tracker/CVE-2017-5510   
                   imagemagick | CVE-2017-5511    | https://security-tracker.debian.org/tracker/CVE-2017-5511   
                        jasper | CVE-2015-8751    | https://security-tracker.debian.org/tracker/CVE-2015-8751   
                        jquery | CVE-2007-2379    | https://security-tracker.debian.org/tracker/CVE-2007-2379   
                         libao | CVE-2017-11548   | https://security-tracker.debian.org/tracker/CVE-2017-11548  
                  libfreeimage | CVE-2019-12211   | https://security-tracker.debian.org/tracker/CVE-2019-12211  
                  libfreeimage | CVE-2019-12212   | https://security-tracker.debian.org/tracker/CVE-2019-12212  
                  libfreeimage | CVE-2019-12213   | https://security-tracker.debian.org/tracker/CVE-2019-12213  
                  libfreeimage | CVE-2019-12214   | https://security-tracker.debian.org/tracker/CVE-2019-12214  
                     libiberty | CVE-2012-3509    | https://security-tracker.debian.org/tracker/CVE-2012-3509   
                     libiberty | CVE-2016-2226    | https://security-tracker.debian.org/tracker/CVE-2016-2226   
                     libiberty | CVE-2016-4487    | https://security-tracker.debian.org/tracker/CVE-2016-4487   
                     libiberty | CVE-2016-4488    | https://security-tracker.debian.org/tracker/CVE-2016-4488   
                     libiberty | CVE-2016-4489    | https://security-tracker.debian.org/tracker/CVE-2016-4489   
                     libiberty | CVE-2016-4490    | https://security-tracker.debian.org/tracker/CVE-2016-4490   
                     libiberty | CVE-2016-4491    | https://security-tracker.debian.org/tracker/CVE-2016-4491   
                     libiberty | CVE-2016-4492    | https://security-tracker.debian.org/tracker/CVE-2016-4492   
                     libiberty | CVE-2016-4493    | https://security-tracker.debian.org/tracker/CVE-2016-4493   
                     libiberty | CVE-2016-6131    | https://security-tracker.debian.org/tracker/CVE-2016-6131   
                       libkrb5 | CVE-1999-0143    | https://security-tracker.debian.org/tracker/CVE-1999-0143   
                       libkrb5 | CVE-1999-0713    | https://security-tracker.debian.org/tracker/CVE-1999-0713   
                       libkrb5 | CVE-2007-3149    | https://security-tracker.debian.org/tracker/CVE-2007-3149   
                       libkrb5 | CVE-2007-5894    | https://security-tracker.debian.org/tracker/CVE-2007-5894   
                       libkrb5 | CVE-2007-5902    | https://security-tracker.debian.org/tracker/CVE-2007-5902   
                       libkrb5 | CVE-2009-0844    | https://security-tracker.debian.org/tracker/CVE-2009-0844   
                       libkrb5 | CVE-2009-0846    | https://security-tracker.debian.org/tracker/CVE-2009-0846   
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                      libpjsip | CVE-2022-24754   | https://security-tracker.debian.org/tracker/CVE-2022-24754  
                      libpjsip | CVE-2022-24764   | https://security-tracker.debian.org/tracker/CVE-2022-24764  
                      libplist | CVE-2017-5834    | https://security-tracker.debian.org/tracker/CVE-2017-5834   
                      libplist | CVE-2017-5835    | https://security-tracker.debian.org/tracker/CVE-2017-5835   
                      libplist | CVE-2017-5836    | https://security-tracker.debian.org/tracker/CVE-2017-5836   
                    libtorrent | CVE-2009-1760    | https://security-tracker.debian.org/tracker/CVE-2009-1760   
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                       libvirt | CVE-2014-8135    | https://security-tracker.debian.org/tracker/CVE-2014-8135   
                       libvirt | CVE-2014-8136    | https://security-tracker.debian.org/tracker/CVE-2014-8136   
                       libvirt | CVE-2015-5313    | https://security-tracker.debian.org/tracker/CVE-2015-5313   
                       libvirt | CVE-2018-5748    | https://security-tracker.debian.org/tracker/CVE-2018-5748   
                       libvirt | CVE-2018-6764    | https://security-tracker.debian.org/tracker/CVE-2018-6764   
                         lrzsz | CVE-2018-10195   | https://security-tracker.debian.org/tracker/CVE-2018-10195  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2020-15888   | https://security-tracker.debian.org/tracker/CVE-2020-15888  
                           lua | CVE-2020-15945   | https://security-tracker.debian.org/tracker/CVE-2020-15945  
                           lua | CVE-2021-43519   | https://security-tracker.debian.org/tracker/CVE-2021-43519  
                           lua | CVE-2022-28805   | https://security-tracker.debian.org/tracker/CVE-2022-28805  
                       mariadb | CVE-2021-46669   | https://security-tracker.debian.org/tracker/CVE-2021-46669  
                       mariadb | CVE-2022-27376   | https://security-tracker.debian.org/tracker/CVE-2022-27376  
                       mariadb | CVE-2022-27377   | https://security-tracker.debian.org/tracker/CVE-2022-27377  
                       mariadb | CVE-2022-27378   | https://security-tracker.debian.org/tracker/CVE-2022-27378  
                       mariadb | CVE-2022-27379   | https://security-tracker.debian.org/tracker/CVE-2022-27379  
                       mariadb | CVE-2022-27380   | https://security-tracker.debian.org/tracker/CVE-2022-27380  
                       mariadb | CVE-2022-27381   | https://security-tracker.debian.org/tracker/CVE-2022-27381  
                       mariadb | CVE-2022-27382   | https://security-tracker.debian.org/tracker/CVE-2022-27382  
                       mariadb | CVE-2022-27383   | https://security-tracker.debian.org/tracker/CVE-2022-27383  
                       mariadb | CVE-2022-27384   | https://security-tracker.debian.org/tracker/CVE-2022-27384  
                       mariadb | CVE-2022-27385   | https://security-tracker.debian.org/tracker/CVE-2022-27385  
                       mariadb | CVE-2022-27386   | https://security-tracker.debian.org/tracker/CVE-2022-27386  
                       mariadb | CVE-2022-27387   | https://security-tracker.debian.org/tracker/CVE-2022-27387  
                       mariadb | CVE-2022-27444   | https://security-tracker.debian.org/tracker/CVE-2022-27444  
                       mariadb | CVE-2022-27445   | https://security-tracker.debian.org/tracker/CVE-2022-27445  
                       mariadb | CVE-2022-27446   | https://security-tracker.debian.org/tracker/CVE-2022-27446  
                       mariadb | CVE-2022-27447   | https://security-tracker.debian.org/tracker/CVE-2022-27447  
                       mariadb | CVE-2022-27448   | https://security-tracker.debian.org/tracker/CVE-2022-27448  
                       mariadb | CVE-2022-27449   | https://security-tracker.debian.org/tracker/CVE-2022-27449  
                       mariadb | CVE-2022-27451   | https://security-tracker.debian.org/tracker/CVE-2022-27451  
                       mariadb | CVE-2022-27452   | https://security-tracker.debian.org/tracker/CVE-2022-27452  
                       mariadb | CVE-2022-27455   | https://security-tracker.debian.org/tracker/CVE-2022-27455  
                       mariadb | CVE-2022-27456   | https://security-tracker.debian.org/tracker/CVE-2022-27456  
                       mariadb | CVE-2022-27457   | https://security-tracker.debian.org/tracker/CVE-2022-27457  
                       mariadb | CVE-2022-27458   | https://security-tracker.debian.org/tracker/CVE-2022-27458  
                       mbedtls | CVE-2021-45451   | https://security-tracker.debian.org/tracker/CVE-2021-45451  
                       mongodb | CVE-2014-8180    | https://security-tracker.debian.org/tracker/CVE-2014-8180   
                       mongodb | CVE-2017-18381   | https://security-tracker.debian.org/tracker/CVE-2017-18381  
                       mongodb | CVE-2017-2665    | https://security-tracker.debian.org/tracker/CVE-2017-2665   
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
                          nasm | CVE-2020-18974   | https://security-tracker.debian.org/tracker/CVE-2020-18974  
                       ncurses | CVE-2021-39537   | https://security-tracker.debian.org/tracker/CVE-2021-39537  
                       ncurses | CVE-2022-29458   | https://security-tracker.debian.org/tracker/CVE-2022-29458  
                           ntp | CVE-2014-9750    | https://security-tracker.debian.org/tracker/CVE-2014-9750   
                           ntp | CVE-2014-9751    | https://security-tracker.debian.org/tracker/CVE-2014-9751   
                           ntp | CVE-2015-7691    | https://security-tracker.debian.org/tracker/CVE-2015-7691   
                           ntp | CVE-2015-7692    | https://security-tracker.debian.org/tracker/CVE-2015-7692   
                           ntp | CVE-2015-7701    | https://security-tracker.debian.org/tracker/CVE-2015-7701   
                           ntp | CVE-2015-7702    | https://security-tracker.debian.org/tracker/CVE-2015-7702   
                           ntp | CVE-2015-7703    | https://security-tracker.debian.org/tracker/CVE-2015-7703   
                           ntp | CVE-2015-7704    | https://security-tracker.debian.org/tracker/CVE-2015-7704   
                           ntp | CVE-2015-7705    | https://security-tracker.debian.org/tracker/CVE-2015-7705   
                           ntp | CVE-2015-7849    | https://security-tracker.debian.org/tracker/CVE-2015-7849   
                           ntp | CVE-2015-7850    | https://security-tracker.debian.org/tracker/CVE-2015-7850   
                           ntp | CVE-2015-7852    | https://security-tracker.debian.org/tracker/CVE-2015-7852   
                           ntp | CVE-2015-7853    | https://security-tracker.debian.org/tracker/CVE-2015-7853   
                           ntp | CVE-2015-7854    | https://security-tracker.debian.org/tracker/CVE-2015-7854   
                           ntp | CVE-2015-7855    | https://security-tracker.debian.org/tracker/CVE-2015-7855   
                           ntp | CVE-2015-7973    | https://security-tracker.debian.org/tracker/CVE-2015-7973   
                           ntp | CVE-2015-7974    | https://security-tracker.debian.org/tracker/CVE-2015-7974   
                           ntp | CVE-2015-7977    | https://security-tracker.debian.org/tracker/CVE-2015-7977   
                           ntp | CVE-2016-2518    | https://security-tracker.debian.org/tracker/CVE-2016-2518   
                           ntp | CVE-2016-4953    | https://security-tracker.debian.org/tracker/CVE-2016-4953   
                           ntp | CVE-2016-4954    | https://security-tracker.debian.org/tracker/CVE-2016-4954   
                           ntp | CVE-2016-4955    | https://security-tracker.debian.org/tracker/CVE-2016-4955   
                           ntp | CVE-2016-4956    | https://security-tracker.debian.org/tracker/CVE-2016-4956   
                           ntp | CVE-2016-7426    | https://security-tracker.debian.org/tracker/CVE-2016-7426   
                           ntp | CVE-2016-7434    | https://security-tracker.debian.org/tracker/CVE-2016-7434   
                           ntp | CVE-2017-6458    | https://security-tracker.debian.org/tracker/CVE-2017-6458   
                           ntp | CVE-2018-7170    | https://security-tracker.debian.org/tracker/CVE-2018-7170   
                           ntp | CVE-2018-7185    | https://security-tracker.debian.org/tracker/CVE-2018-7185   
                           ntp | CVE-2019-11331   | https://security-tracker.debian.org/tracker/CVE-2019-11331  
                           ntp | CVE-2019-8936    | https://security-tracker.debian.org/tracker/CVE-2019-8936   
                           ntp | CVE-2020-11868   | https://security-tracker.debian.org/tracker/CVE-2020-11868  
                           ntp | CVE-2020-13817   | https://security-tracker.debian.org/tracker/CVE-2020-13817  
                       opencv3 | CVE-2019-14493   | https://security-tracker.debian.org/tracker/CVE-2019-14493  
                       opencv3 | CVE-2019-15939   | https://security-tracker.debian.org/tracker/CVE-2019-15939  
                       opencv3 | CVE-2019-19624   | https://security-tracker.debian.org/tracker/CVE-2019-19624  
                       openjdk | CVE-2009-2475    | https://security-tracker.debian.org/tracker/CVE-2009-2475   
                       openjdk | CVE-2009-2476    | https://security-tracker.debian.org/tracker/CVE-2009-2476   
                       openjdk | CVE-2009-2689    | https://security-tracker.debian.org/tracker/CVE-2009-2689   
                       openjdk | CVE-2009-2690    | https://security-tracker.debian.org/tracker/CVE-2009-2690   
                       openjdk | CVE-2009-3728    | https://security-tracker.debian.org/tracker/CVE-2009-3728   
                       openjdk | CVE-2009-3879    | https://security-tracker.debian.org/tracker/CVE-2009-3879   
                       openjdk | CVE-2009-3880    | https://security-tracker.debian.org/tracker/CVE-2009-3880   
                       openjdk | CVE-2009-3881    | https://security-tracker.debian.org/tracker/CVE-2009-3881   
                       openjdk | CVE-2009-3882    | https://security-tracker.debian.org/tracker/CVE-2009-3882   
                       openjdk | CVE-2009-3883    | https://security-tracker.debian.org/tracker/CVE-2009-3883   
                       openjdk | CVE-2009-3884    | https://security-tracker.debian.org/tracker/CVE-2009-3884   
                       openjdk | CVE-2013-0169    | https://security-tracker.debian.org/tracker/CVE-2013-0169   
                      openjpeg | CVE-2015-1239    | https://security-tracker.debian.org/tracker/CVE-2015-1239   
                      openjpeg | CVE-2016-9675    | https://security-tracker.debian.org/tracker/CVE-2016-9675   
                      openjpeg | CVE-2021-29338   | https://security-tracker.debian.org/tracker/CVE-2021-29338  
                      openjpeg | CVE-2021-3575    | https://security-tracker.debian.org/tracker/CVE-2021-3575   
                      openjpeg | CVE-2022-1122    | https://security-tracker.debian.org/tracker/CVE-2022-1122   
                      openldap | CVE-2015-3276    | https://security-tracker.debian.org/tracker/CVE-2015-3276   
                       openssh | CVE-2007-2768    | https://security-tracker.debian.org/tracker/CVE-2007-2768   
                       openssh | CVE-2008-3844    | https://security-tracker.debian.org/tracker/CVE-2008-3844   
                       openssh | CVE-2014-9278    | https://security-tracker.debian.org/tracker/CVE-2014-9278   
                      openswan | CVE-2019-10155   | https://security-tracker.debian.org/tracker/CVE-2019-10155  
                         p7zip | CVE-2017-17969   | https://security-tracker.debian.org/tracker/CVE-2017-17969  
                         p7zip | CVE-2018-5996    | https://security-tracker.debian.org/tracker/CVE-2018-5996   
                         patch | CVE-2018-6952    | https://security-tracker.debian.org/tracker/CVE-2018-6952   
                         patch | CVE-2019-20633   | https://security-tracker.debian.org/tracker/CVE-2019-20633  
                           php | CVE-2007-2728    | https://security-tracker.debian.org/tracker/CVE-2007-2728   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                           php | CVE-2007-4596    | https://security-tracker.debian.org/tracker/CVE-2007-4596   
                        polkit | CVE-2021-4034    | https://security-tracker.debian.org/tracker/CVE-2021-4034   
                    postgresql | CVE-2017-8806    | https://security-tracker.debian.org/tracker/CVE-2017-8806   
                 powerpc-utils | CVE-2014-8165    | https://security-tracker.debian.org/tracker/CVE-2014-8165   
                          pppd | CVE-2018-11574   | https://security-tracker.debian.org/tracker/CVE-2018-11574  
               python-m2crypto | CVE-2020-25657   | https://security-tracker.debian.org/tracker/CVE-2020-25657  
                    python-pip | CVE-2018-20225   | https://security-tracker.debian.org/tracker/CVE-2018-20225  
                python-twisted | CVE-2022-24801   | https://security-tracker.debian.org/tracker/CVE-2022-24801  
                       python3 | CVE-2015-20107   | https://security-tracker.debian.org/tracker/CVE-2015-20107  
                          qemu | CVE-2018-18438   | https://security-tracker.debian.org/tracker/CVE-2018-18438  
                          qemu | CVE-2019-12067   | https://security-tracker.debian.org/tracker/CVE-2019-12067  
                          qemu | CVE-2021-20255   | https://security-tracker.debian.org/tracker/CVE-2021-20255  
                          qemu | CVE-2021-3947    | https://security-tracker.debian.org/tracker/CVE-2021-3947   
                          qemu | CVE-2022-1050    | https://security-tracker.debian.org/tracker/CVE-2022-1050   
                          qemu | CVE-2022-26353   | https://security-tracker.debian.org/tracker/CVE-2022-26353  
                          qemu | CVE-2022-26354   | https://security-tracker.debian.org/tracker/CVE-2022-26354  
                        quagga | CVE-2016-4049    | https://security-tracker.debian.org/tracker/CVE-2016-4049   
                        quagga | CVE-2017-3224    | https://security-tracker.debian.org/tracker/CVE-2017-3224   
                        quagga | CVE-2021-44038   | https://security-tracker.debian.org/tracker/CVE-2021-44038  
               rabbitmq-server | CVE-2018-11087   | https://security-tracker.debian.org/tracker/CVE-2018-11087  
               rabbitmq-server | CVE-2018-1279    | https://security-tracker.debian.org/tracker/CVE-2018-1279   
                   resiprocate | CVE-2017-9454    | https://security-tracker.debian.org/tracker/CVE-2017-9454   
                        samba4 | CVE-2011-2411    | https://security-tracker.debian.org/tracker/CVE-2011-2411   
                        samba4 | CVE-2018-1050    | https://security-tracker.debian.org/tracker/CVE-2018-1050   
                        samba4 | CVE-2018-1057    | https://security-tracker.debian.org/tracker/CVE-2018-1057   
                           sdl | CVE-2019-13616   | https://security-tracker.debian.org/tracker/CVE-2019-13616  
                           sdl | CVE-2019-14906   | https://security-tracker.debian.org/tracker/CVE-2019-14906  
                           sdl | CVE-2019-7572    | https://security-tracker.debian.org/tracker/CVE-2019-7572   
                           sdl | CVE-2019-7573    | https://security-tracker.debian.org/tracker/CVE-2019-7573   
                           sdl | CVE-2019-7574    | https://security-tracker.debian.org/tracker/CVE-2019-7574   
                           sdl | CVE-2019-7575    | https://security-tracker.debian.org/tracker/CVE-2019-7575   
                           sdl | CVE-2019-7576    | https://security-tracker.debian.org/tracker/CVE-2019-7576   
                           sdl | CVE-2019-7577    | https://security-tracker.debian.org/tracker/CVE-2019-7577   
                           sdl | CVE-2019-7578    | https://security-tracker.debian.org/tracker/CVE-2019-7578   
                           sdl | CVE-2019-7635    | https://security-tracker.debian.org/tracker/CVE-2019-7635   
                           sdl | CVE-2019-7636    | https://security-tracker.debian.org/tracker/CVE-2019-7636   
                           sdl | CVE-2019-7637    | https://security-tracker.debian.org/tracker/CVE-2019-7637   
                           sdl | CVE-2019-7638    | https://security-tracker.debian.org/tracker/CVE-2019-7638   
                           sdl | CVE-2020-14409   | https://security-tracker.debian.org/tracker/CVE-2020-14409  
                           sdl | CVE-2020-14410   | https://security-tracker.debian.org/tracker/CVE-2020-14410  
                         smack | CVE-2014-0363    | https://security-tracker.debian.org/tracker/CVE-2014-0363   
                         smack | CVE-2014-0364    | https://security-tracker.debian.org/tracker/CVE-2014-0364   
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                         spice | CVE-2016-0749    | https://security-tracker.debian.org/tracker/CVE-2016-0749   
                         spice | CVE-2016-2150    | https://security-tracker.debian.org/tracker/CVE-2016-2150   
                         spice | CVE-2018-10893   | https://security-tracker.debian.org/tracker/CVE-2018-10893  
                        thttpd | CVE-2012-5640    | https://security-tracker.debian.org/tracker/CVE-2012-5640   
                          tiff | CVE-2015-7313    | https://security-tracker.debian.org/tracker/CVE-2015-7313   
                          tiff | CVE-2022-0561    | https://security-tracker.debian.org/tracker/CVE-2022-0561   
                          tiff | CVE-2022-0562    | https://security-tracker.debian.org/tracker/CVE-2022-0562   
                          tiff | CVE-2022-0865    | https://security-tracker.debian.org/tracker/CVE-2022-0865   
                          tiff | CVE-2022-0891    | https://security-tracker.debian.org/tracker/CVE-2022-0891   
                          tiff | CVE-2022-0907    | https://security-tracker.debian.org/tracker/CVE-2022-0907   
                          tiff | CVE-2022-0908    | https://security-tracker.debian.org/tracker/CVE-2022-0908   
                          tiff | CVE-2022-0909    | https://security-tracker.debian.org/tracker/CVE-2022-0909   
                          tiff | CVE-2022-0924    | https://security-tracker.debian.org/tracker/CVE-2022-0924   
                          tiff | CVE-2022-1056    | https://security-tracker.debian.org/tracker/CVE-2022-1056   
                          tiff | CVE-2022-1210    | https://security-tracker.debian.org/tracker/CVE-2022-1210   
                          tinc | CVE-2013-1428    | https://security-tracker.debian.org/tracker/CVE-2013-1428   
                           tor | CVE-2016-9079    | https://security-tracker.debian.org/tracker/CVE-2016-9079   
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                         unzip | CVE-2022-0529    | https://security-tracker.debian.org/tracker/CVE-2022-0529   
                         unzip | CVE-2022-0530    | https://security-tracker.debian.org/tracker/CVE-2022-0530   
                           xen | CVE-2011-1936    | https://security-tracker.debian.org/tracker/CVE-2011-1936   
                           xen | CVE-2011-3346    | https://security-tracker.debian.org/tracker/CVE-2011-3346   
                           xen | CVE-2014-2580    | https://security-tracker.debian.org/tracker/CVE-2014-2580   
                           xen | CVE-2014-3672    | https://security-tracker.debian.org/tracker/CVE-2014-3672   
                           xen | CVE-2015-7504    | https://security-tracker.debian.org/tracker/CVE-2015-7504   
                           xen | CVE-2015-8550    | https://security-tracker.debian.org/tracker/CVE-2015-8550   
                           xen | CVE-2015-8553    | https://security-tracker.debian.org/tracker/CVE-2015-8553   
                           xen | CVE-2016-3960    | https://security-tracker.debian.org/tracker/CVE-2016-3960   
                           xen | CVE-2016-7092    | https://security-tracker.debian.org/tracker/CVE-2016-7092   
                           xen | CVE-2016-9379    | https://security-tracker.debian.org/tracker/CVE-2016-9379   
                           xen | CVE-2016-9380    | https://security-tracker.debian.org/tracker/CVE-2016-9380   
                           xen | CVE-2016-9383    | https://security-tracker.debian.org/tracker/CVE-2016-9383   
                           xen | CVE-2016-9386    | https://security-tracker.debian.org/tracker/CVE-2016-9386   
                           xen | CVE-2017-12134   | https://security-tracker.debian.org/tracker/CVE-2017-12134  
                           xen | CVE-2017-12135   | https://security-tracker.debian.org/tracker/CVE-2017-12135  
                           xen | CVE-2017-12137   | https://security-tracker.debian.org/tracker/CVE-2017-12137  
                           xen | CVE-2017-7228    | https://security-tracker.debian.org/tracker/CVE-2017-7228   
                           xen | CVE-2018-5244    | https://security-tracker.debian.org/tracker/CVE-2018-5244   
                           xen | CVE-2018-8897    | https://security-tracker.debian.org/tracker/CVE-2018-8897   
                           xen | CVE-2021-26313   | https://security-tracker.debian.org/tracker/CVE-2021-26313  
                           xen | CVE-2021-26314   | https://security-tracker.debian.org/tracker/CVE-2021-26314  
                           xen | CVE-2021-28038   | https://security-tracker.debian.org/tracker/CVE-2021-28038  
                           xen | CVE-2021-28039   | https://security-tracker.debian.org/tracker/CVE-2021-28039  
                           xen | CVE-2021-28687   | https://security-tracker.debian.org/tracker/CVE-2021-28687  
                           xen | CVE-2021-28690   | https://security-tracker.debian.org/tracker/CVE-2021-28690  
                           xen | CVE-2021-28692   | https://security-tracker.debian.org/tracker/CVE-2021-28692  
                           xen | CVE-2021-28693   | https://security-tracker.debian.org/tracker/CVE-2021-28693  
                           xen | CVE-2021-28694   | https://security-tracker.debian.org/tracker/CVE-2021-28694  
                           xen | CVE-2021-28695   | https://security-tracker.debian.org/tracker/CVE-2021-28695  
                           xen | CVE-2021-28696   | https://security-tracker.debian.org/tracker/CVE-2021-28696  
                           xen | CVE-2021-28697   | https://security-tracker.debian.org/tracker/CVE-2021-28697  
                           xen | CVE-2021-28698   | https://security-tracker.debian.org/tracker/CVE-2021-28698  
                           xen | CVE-2021-28699   | https://security-tracker.debian.org/tracker/CVE-2021-28699  
                           xen | CVE-2021-28700   | https://security-tracker.debian.org/tracker/CVE-2021-28700  
                           xen | CVE-2021-28701   | https://security-tracker.debian.org/tracker/CVE-2021-28701  
                           xen | CVE-2021-28702   | https://security-tracker.debian.org/tracker/CVE-2021-28702  
                           xen | CVE-2021-28703   | https://security-tracker.debian.org/tracker/CVE-2021-28703  
                           xen | CVE-2021-28704   | https://security-tracker.debian.org/tracker/CVE-2021-28704  
                           xen | CVE-2021-28707   | https://security-tracker.debian.org/tracker/CVE-2021-28707  
                           xen | CVE-2021-28708   | https://security-tracker.debian.org/tracker/CVE-2021-28708  
                           xen | CVE-2021-28711   | https://security-tracker.debian.org/tracker/CVE-2021-28711  
                           xen | CVE-2021-28712   | https://security-tracker.debian.org/tracker/CVE-2021-28712  
                           xen | CVE-2021-28713   | https://security-tracker.debian.org/tracker/CVE-2021-28713  
                           xen | CVE-2022-23033   | https://security-tracker.debian.org/tracker/CVE-2022-23033  
                           xen | CVE-2022-23035   | https://security-tracker.debian.org/tracker/CVE-2022-23035  
                           xen | CVE-2022-23036   | https://security-tracker.debian.org/tracker/CVE-2022-23036  
                           xen | CVE-2022-23037   | https://security-tracker.debian.org/tracker/CVE-2022-23037  
                           xen | CVE-2022-23038   | https://security-tracker.debian.org/tracker/CVE-2022-23038  
                           xen | CVE-2022-23039   | https://security-tracker.debian.org/tracker/CVE-2022-23039  
                           xen | CVE-2022-23040   | https://security-tracker.debian.org/tracker/CVE-2022-23040  
                           xen | CVE-2022-23041   | https://security-tracker.debian.org/tracker/CVE-2022-23041  
                           xen | CVE-2022-23042   | https://security-tracker.debian.org/tracker/CVE-2022-23042  
                           xen | CVE-2022-23960   | https://security-tracker.debian.org/tracker/CVE-2022-23960  
                           xen | CVE-2022-26357   | https://security-tracker.debian.org/tracker/CVE-2022-26357  
                           xen | CVE-2022-26358   | https://security-tracker.debian.org/tracker/CVE-2022-26358  
                           xen | CVE-2022-26359   | https://security-tracker.debian.org/tracker/CVE-2022-26359  
                           xen | CVE-2022-26360   | https://security-tracker.debian.org/tracker/CVE-2022-26360  
                           xen | CVE-2022-26361   | https://security-tracker.debian.org/tracker/CVE-2022-26361  
                        xerces | CVE-2012-0880    | https://security-tracker.debian.org/tracker/CVE-2012-0880   
                           zip | CVE-2018-13410   | https://security-tracker.debian.org/tracker/CVE-2018-13410  

CVEs for the '2022.02.x' branch
-------------------------------

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                        apache | CVE-1999-0236    | https://security-tracker.debian.org/tracker/CVE-1999-0236   
                        apache | CVE-1999-0289    | https://security-tracker.debian.org/tracker/CVE-1999-0289   
                        apache | CVE-1999-0678    | https://security-tracker.debian.org/tracker/CVE-1999-0678   
                        apache | CVE-1999-1237    | https://security-tracker.debian.org/tracker/CVE-1999-1237   
                        apache | CVE-1999-1412    | https://security-tracker.debian.org/tracker/CVE-1999-1412   
                        apache | CVE-2007-0086    | https://security-tracker.debian.org/tracker/CVE-2007-0086   
                        apache | CVE-2007-0450    | https://security-tracker.debian.org/tracker/CVE-2007-0450   
                        apache | CVE-2007-4465    | https://security-tracker.debian.org/tracker/CVE-2007-4465   
                        apache | CVE-2007-5000    | https://security-tracker.debian.org/tracker/CVE-2007-5000   
                        apache | CVE-2007-6388    | https://security-tracker.debian.org/tracker/CVE-2007-6388   
                        apache | CVE-2007-6420    | https://security-tracker.debian.org/tracker/CVE-2007-6420   
                        apache | CVE-2007-6421    | https://security-tracker.debian.org/tracker/CVE-2007-6421   
                        apache | CVE-2007-6422    | https://security-tracker.debian.org/tracker/CVE-2007-6422   
                        apache | CVE-2007-6423    | https://security-tracker.debian.org/tracker/CVE-2007-6423   
                        apache | CVE-2008-0455    | https://security-tracker.debian.org/tracker/CVE-2008-0455   
                        apache | CVE-2008-2168    | https://security-tracker.debian.org/tracker/CVE-2008-2168   
                        apache | CVE-2008-2939    | https://security-tracker.debian.org/tracker/CVE-2008-2939   
                        apache | CVE-2009-1195    | https://security-tracker.debian.org/tracker/CVE-2009-1195   
                        apache | CVE-2009-1890    | https://security-tracker.debian.org/tracker/CVE-2009-1890   
                        apache | CVE-2009-1891    | https://security-tracker.debian.org/tracker/CVE-2009-1891   
                        apache | CVE-2009-2699    | https://security-tracker.debian.org/tracker/CVE-2009-2699   
                        apache | CVE-2010-0408    | https://security-tracker.debian.org/tracker/CVE-2010-0408   
                        apache | CVE-2010-0425    | https://security-tracker.debian.org/tracker/CVE-2010-0425   
                        apache | CVE-2010-0434    | https://security-tracker.debian.org/tracker/CVE-2010-0434   
                        apache | CVE-2010-1452    | https://security-tracker.debian.org/tracker/CVE-2010-1452   
                        apache | CVE-2014-0231    | https://security-tracker.debian.org/tracker/CVE-2014-0231   
                      apparmor | CVE-2016-1585    | https://security-tracker.debian.org/tracker/CVE-2016-1585   
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                          atop | CVE-2011-3618    | https://security-tracker.debian.org/tracker/CVE-2011-3618   
                         avahi | CVE-2021-3468    | https://security-tracker.debian.org/tracker/CVE-2021-3468   
                     belle-sip | CVE-2021-33056   | https://security-tracker.debian.org/tracker/CVE-2021-33056  
                     belle-sip | CVE-2021-43610   | https://security-tracker.debian.org/tracker/CVE-2021-43610  
                     belle-sip | CVE-2021-43611   | https://security-tracker.debian.org/tracker/CVE-2021-43611  
                        bento4 | CVE-2020-23331   | https://security-tracker.debian.org/tracker/CVE-2020-23331  
                        bento4 | CVE-2020-23332   | https://security-tracker.debian.org/tracker/CVE-2020-23332  
                        bento4 | CVE-2022-27607   | https://security-tracker.debian.org/tracker/CVE-2022-27607  
                    berkeleydb | CVE-2017-3604    | https://security-tracker.debian.org/tracker/CVE-2017-3604   
                    berkeleydb | CVE-2017-3605    | https://security-tracker.debian.org/tracker/CVE-2017-3605   
                    berkeleydb | CVE-2017-3606    | https://security-tracker.debian.org/tracker/CVE-2017-3606   
                    berkeleydb | CVE-2017-3607    | https://security-tracker.debian.org/tracker/CVE-2017-3607   
                    berkeleydb | CVE-2017-3608    | https://security-tracker.debian.org/tracker/CVE-2017-3608   
                    berkeleydb | CVE-2017-3609    | https://security-tracker.debian.org/tracker/CVE-2017-3609   
                    berkeleydb | CVE-2017-3610    | https://security-tracker.debian.org/tracker/CVE-2017-3610   
                    berkeleydb | CVE-2017-3611    | https://security-tracker.debian.org/tracker/CVE-2017-3611   
                    berkeleydb | CVE-2017-3612    | https://security-tracker.debian.org/tracker/CVE-2017-3612   
                    berkeleydb | CVE-2017-3613    | https://security-tracker.debian.org/tracker/CVE-2017-3613   
                    berkeleydb | CVE-2017-3614    | https://security-tracker.debian.org/tracker/CVE-2017-3614   
                    berkeleydb | CVE-2017-3615    | https://security-tracker.debian.org/tracker/CVE-2017-3615   
                    berkeleydb | CVE-2017-3616    | https://security-tracker.debian.org/tracker/CVE-2017-3616   
                    berkeleydb | CVE-2017-3617    | https://security-tracker.debian.org/tracker/CVE-2017-3617   
                    berkeleydb | CVE-2019-2708    | https://security-tracker.debian.org/tracker/CVE-2019-2708   
                    berkeleydb | CVE-2020-2981    | https://security-tracker.debian.org/tracker/CVE-2020-2981   
                      binutils | CVE-2021-45078   | https://security-tracker.debian.org/tracker/CVE-2021-45078  
                       bitcoin | CVE-2012-1909    | https://security-tracker.debian.org/tracker/CVE-2012-1909   
                       bitcoin | CVE-2012-4682    | https://security-tracker.debian.org/tracker/CVE-2012-4682   
                       bitcoin | CVE-2012-4683    | https://security-tracker.debian.org/tracker/CVE-2012-4683   
                       bitcoin | CVE-2013-2272    | https://security-tracker.debian.org/tracker/CVE-2013-2272   
                       bitcoin | CVE-2013-2273    | https://security-tracker.debian.org/tracker/CVE-2013-2273   
                       bitcoin | CVE-2013-2292    | https://security-tracker.debian.org/tracker/CVE-2013-2292   
                       bitcoin | CVE-2013-2293    | https://security-tracker.debian.org/tracker/CVE-2013-2293   
                       bitcoin | CVE-2013-3220    | https://security-tracker.debian.org/tracker/CVE-2013-3220   
                  bluez5_utils | CVE-2020-12352   | https://security-tracker.debian.org/tracker/CVE-2020-12352  
                  bluez5_utils | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
          bluez5_utils-headers | CVE-2020-12352   | https://security-tracker.debian.org/tracker/CVE-2020-12352  
          bluez5_utils-headers | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
                        bsdiff | CVE-2020-14315   | https://security-tracker.debian.org/tracker/CVE-2020-14315  
                       busybox | CVE-2022-28391   | https://security-tracker.debian.org/tracker/CVE-2022-28391  
                         cairo | CVE-2019-6461    | https://security-tracker.debian.org/tracker/CVE-2019-6461   
                         cairo | CVE-2019-6462    | https://security-tracker.debian.org/tracker/CVE-2019-6462   
                         cairo | CVE-2020-35492   | https://security-tracker.debian.org/tracker/CVE-2020-35492  
                        clamav | CVE-2016-1405    | https://security-tracker.debian.org/tracker/CVE-2016-1405   
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
                      cryptopp | CVE-2021-43398   | https://security-tracker.debian.org/tracker/CVE-2021-43398  
                          cups | CVE-2018-6553    | https://security-tracker.debian.org/tracker/CVE-2018-6553   
                           cvs | CVE-2017-12836   | https://security-tracker.debian.org/tracker/CVE-2017-12836  
                     darkhttpd | CVE-2020-25691   | https://security-tracker.debian.org/tracker/CVE-2020-25691  
                       dnsmasq | CVE-2021-45951   | https://security-tracker.debian.org/tracker/CVE-2021-45951  
                       dnsmasq | CVE-2021-45952   | https://security-tracker.debian.org/tracker/CVE-2021-45952  
                       dnsmasq | CVE-2021-45953   | https://security-tracker.debian.org/tracker/CVE-2021-45953  
                       dnsmasq | CVE-2021-45954   | https://security-tracker.debian.org/tracker/CVE-2021-45954  
                       dnsmasq | CVE-2021-45955   | https://security-tracker.debian.org/tracker/CVE-2021-45955  
                       dnsmasq | CVE-2021-45956   | https://security-tracker.debian.org/tracker/CVE-2021-45956  
                       dnsmasq | CVE-2021-45957   | https://security-tracker.debian.org/tracker/CVE-2021-45957  
                        docker | CVE-2014-0048    | https://security-tracker.debian.org/tracker/CVE-2014-0048   
                        docker | CVE-2014-8178    | https://security-tracker.debian.org/tracker/CVE-2014-8178   
                        docker | CVE-2014-8179    | https://security-tracker.debian.org/tracker/CVE-2014-8179   
                        docker | CVE-2015-1843    | https://security-tracker.debian.org/tracker/CVE-2015-1843   
                        docker | CVE-2015-3627    | https://security-tracker.debian.org/tracker/CVE-2015-3627   
                        docker | CVE-2015-3630    | https://security-tracker.debian.org/tracker/CVE-2015-3630   
                        docker | CVE-2015-3631    | https://security-tracker.debian.org/tracker/CVE-2015-3631   
                        docker | CVE-2016-3697    | https://security-tracker.debian.org/tracker/CVE-2016-3697   
                        docker | CVE-2017-14992   | https://security-tracker.debian.org/tracker/CVE-2017-14992  
                        docker | CVE-2019-13139   | https://security-tracker.debian.org/tracker/CVE-2019-13139  
                        docker | CVE-2019-13509   | https://security-tracker.debian.org/tracker/CVE-2019-13509  
                        docker | CVE-2019-15752   | https://security-tracker.debian.org/tracker/CVE-2019-15752  
                        docker | CVE-2019-16884   | https://security-tracker.debian.org/tracker/CVE-2019-16884  
                        docker | CVE-2019-5736    | https://security-tracker.debian.org/tracker/CVE-2019-5736   
                        docker | CVE-2020-27534   | https://security-tracker.debian.org/tracker/CVE-2020-27534  
                        docker | CVE-2021-21284   | https://security-tracker.debian.org/tracker/CVE-2021-21284  
                        docker | CVE-2021-21285   | https://security-tracker.debian.org/tracker/CVE-2021-21285  
                        docker | CVE-2021-3162    | https://security-tracker.debian.org/tracker/CVE-2021-3162   
                        docker | CVE-2021-33183   | https://security-tracker.debian.org/tracker/CVE-2021-33183  
                        docker | CVE-2022-25365   | https://security-tracker.debian.org/tracker/CVE-2022-25365  
                     e2fsprogs | CVE-2022-1304    | https://security-tracker.debian.org/tracker/CVE-2022-1304   
                          edk2 | CVE-2014-4859    | https://security-tracker.debian.org/tracker/CVE-2014-4859   
                          edk2 | CVE-2014-4860    | https://security-tracker.debian.org/tracker/CVE-2014-4860   
                          edk2 | CVE-2014-8271    | https://security-tracker.debian.org/tracker/CVE-2014-8271   
                          edk2 | CVE-2019-14553   | https://security-tracker.debian.org/tracker/CVE-2019-14553  
                          edk2 | CVE-2019-14559   | https://security-tracker.debian.org/tracker/CVE-2019-14559  
                          edk2 | CVE-2019-14562   | https://security-tracker.debian.org/tracker/CVE-2019-14562  
                          edk2 | CVE-2019-14563   | https://security-tracker.debian.org/tracker/CVE-2019-14563  
                          edk2 | CVE-2019-14575   | https://security-tracker.debian.org/tracker/CVE-2019-14575  
                          edk2 | CVE-2019-14586   | https://security-tracker.debian.org/tracker/CVE-2019-14586  
                          edk2 | CVE-2019-14587   | https://security-tracker.debian.org/tracker/CVE-2019-14587  
                         emlog | CVE-2021-44584   | https://security-tracker.debian.org/tracker/CVE-2021-44584  
                        erlang | CVE-2020-35733   | https://security-tracker.debian.org/tracker/CVE-2020-35733  
                          exim | CVE-2020-28017   | https://security-tracker.debian.org/tracker/CVE-2020-28017  
                         exiv2 | CVE-2007-6353    | https://security-tracker.debian.org/tracker/CVE-2007-6353   
                        ffmpeg | CVE-2021-38291   | https://security-tracker.debian.org/tracker/CVE-2021-38291  
                           git | CVE-2022-24765   | https://security-tracker.debian.org/tracker/CVE-2022-24765  
                           git | CVE-2022-24975   | https://security-tracker.debian.org/tracker/CVE-2022-24975  
                         glibc | CVE-2010-4756    | https://security-tracker.debian.org/tracker/CVE-2010-4756   
                         glibc | CVE-2019-1010022 | https://security-tracker.debian.org/tracker/CVE-2019-1010022
                         glibc | CVE-2019-1010023 | https://security-tracker.debian.org/tracker/CVE-2019-1010023
                         glibc | CVE-2019-1010024 | https://security-tracker.debian.org/tracker/CVE-2019-1010024
                         glibc | CVE-2019-1010025 | https://security-tracker.debian.org/tracker/CVE-2019-1010025
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                            go | CVE-2020-29509   | https://security-tracker.debian.org/tracker/CVE-2020-29509  
                            go | CVE-2020-29511   | https://security-tracker.debian.org/tracker/CVE-2020-29511  
                            go | CVE-2022-24675   | https://security-tracker.debian.org/tracker/CVE-2022-24675  
                            go | CVE-2022-28327   | https://security-tracker.debian.org/tracker/CVE-2022-28327  
                graphicsmagick | CVE-2007-0770    | https://security-tracker.debian.org/tracker/CVE-2007-0770   
                graphicsmagick | CVE-2008-6621    | https://security-tracker.debian.org/tracker/CVE-2008-6621   
                     graphite2 | CVE-2017-5436    | https://security-tracker.debian.org/tracker/CVE-2017-5436   
                         grub2 | CVE-2021-3981    | https://security-tracker.debian.org/tracker/CVE-2021-3981   
                         grub2 | CVE-2021-46705   | https://security-tracker.debian.org/tracker/CVE-2021-46705  
                       haproxy | CVE-2016-2102    | https://security-tracker.debian.org/tracker/CVE-2016-2102   
                       haproxy | CVE-2022-0711    | https://security-tracker.debian.org/tracker/CVE-2022-0711   
                heirloom-mailx | CVE-2004-2771    | https://security-tracker.debian.org/tracker/CVE-2004-2771   
                   imagemagick | CVE-2007-1667    | https://security-tracker.debian.org/tracker/CVE-2007-1667   
                   imagemagick | CVE-2014-9804    | https://security-tracker.debian.org/tracker/CVE-2014-9804   
                   imagemagick | CVE-2014-9805    | https://security-tracker.debian.org/tracker/CVE-2014-9805   
                   imagemagick | CVE-2014-9806    | https://security-tracker.debian.org/tracker/CVE-2014-9806   
                   imagemagick | CVE-2014-9807    | https://security-tracker.debian.org/tracker/CVE-2014-9807   
                   imagemagick | CVE-2014-9808    | https://security-tracker.debian.org/tracker/CVE-2014-9808   
                   imagemagick | CVE-2014-9809    | https://security-tracker.debian.org/tracker/CVE-2014-9809   
                   imagemagick | CVE-2014-9810    | https://security-tracker.debian.org/tracker/CVE-2014-9810   
                   imagemagick | CVE-2014-9811    | https://security-tracker.debian.org/tracker/CVE-2014-9811   
                   imagemagick | CVE-2014-9812    | https://security-tracker.debian.org/tracker/CVE-2014-9812   
                   imagemagick | CVE-2014-9813    | https://security-tracker.debian.org/tracker/CVE-2014-9813   
                   imagemagick | CVE-2014-9814    | https://security-tracker.debian.org/tracker/CVE-2014-9814   
                   imagemagick | CVE-2014-9815    | https://security-tracker.debian.org/tracker/CVE-2014-9815   
                   imagemagick | CVE-2014-9816    | https://security-tracker.debian.org/tracker/CVE-2014-9816   
                   imagemagick | CVE-2014-9817    | https://security-tracker.debian.org/tracker/CVE-2014-9817   
                   imagemagick | CVE-2014-9818    | https://security-tracker.debian.org/tracker/CVE-2014-9818   
                   imagemagick | CVE-2014-9819    | https://security-tracker.debian.org/tracker/CVE-2014-9819   
                   imagemagick | CVE-2014-9820    | https://security-tracker.debian.org/tracker/CVE-2014-9820   
                   imagemagick | CVE-2014-9821    | https://security-tracker.debian.org/tracker/CVE-2014-9821   
                   imagemagick | CVE-2014-9822    | https://security-tracker.debian.org/tracker/CVE-2014-9822   
                   imagemagick | CVE-2014-9823    | https://security-tracker.debian.org/tracker/CVE-2014-9823   
                   imagemagick | CVE-2014-9824    | https://security-tracker.debian.org/tracker/CVE-2014-9824   
                   imagemagick | CVE-2014-9825    | https://security-tracker.debian.org/tracker/CVE-2014-9825   
                   imagemagick | CVE-2014-9826    | https://security-tracker.debian.org/tracker/CVE-2014-9826   
                   imagemagick | CVE-2014-9827    | https://security-tracker.debian.org/tracker/CVE-2014-9827   
                   imagemagick | CVE-2014-9828    | https://security-tracker.debian.org/tracker/CVE-2014-9828   
                   imagemagick | CVE-2014-9829    | https://security-tracker.debian.org/tracker/CVE-2014-9829   
                   imagemagick | CVE-2014-9830    | https://security-tracker.debian.org/tracker/CVE-2014-9830   
                   imagemagick | CVE-2014-9831    | https://security-tracker.debian.org/tracker/CVE-2014-9831   
                   imagemagick | CVE-2014-9848    | https://security-tracker.debian.org/tracker/CVE-2014-9848   
                   imagemagick | CVE-2014-9852    | https://security-tracker.debian.org/tracker/CVE-2014-9852   
                   imagemagick | CVE-2014-9853    | https://security-tracker.debian.org/tracker/CVE-2014-9853   
                   imagemagick | CVE-2014-9854    | https://security-tracker.debian.org/tracker/CVE-2014-9854   
                   imagemagick | CVE-2014-9907    | https://security-tracker.debian.org/tracker/CVE-2014-9907   
                   imagemagick | CVE-2016-10062   | https://security-tracker.debian.org/tracker/CVE-2016-10062  
                   imagemagick | CVE-2016-10144   | https://security-tracker.debian.org/tracker/CVE-2016-10144  
                   imagemagick | CVE-2016-10145   | https://security-tracker.debian.org/tracker/CVE-2016-10145  
                   imagemagick | CVE-2016-10146   | https://security-tracker.debian.org/tracker/CVE-2016-10146  
                   imagemagick | CVE-2016-7513    | https://security-tracker.debian.org/tracker/CVE-2016-7513   
                   imagemagick | CVE-2016-7514    | https://security-tracker.debian.org/tracker/CVE-2016-7514   
                   imagemagick | CVE-2016-7515    | https://security-tracker.debian.org/tracker/CVE-2016-7515   
                   imagemagick | CVE-2016-7516    | https://security-tracker.debian.org/tracker/CVE-2016-7516   
                   imagemagick | CVE-2016-7517    | https://security-tracker.debian.org/tracker/CVE-2016-7517   
                   imagemagick | CVE-2016-7518    | https://security-tracker.debian.org/tracker/CVE-2016-7518   
                   imagemagick | CVE-2016-7519    | https://security-tracker.debian.org/tracker/CVE-2016-7519   
                   imagemagick | CVE-2016-7520    | https://security-tracker.debian.org/tracker/CVE-2016-7520   
                   imagemagick | CVE-2016-7521    | https://security-tracker.debian.org/tracker/CVE-2016-7521   
                   imagemagick | CVE-2016-7522    | https://security-tracker.debian.org/tracker/CVE-2016-7522   
                   imagemagick | CVE-2016-7523    | https://security-tracker.debian.org/tracker/CVE-2016-7523   
                   imagemagick | CVE-2016-7524    | https://security-tracker.debian.org/tracker/CVE-2016-7524   
                   imagemagick | CVE-2016-7525    | https://security-tracker.debian.org/tracker/CVE-2016-7525   
                   imagemagick | CVE-2016-7526    | https://security-tracker.debian.org/tracker/CVE-2016-7526   
                   imagemagick | CVE-2016-7527    | https://security-tracker.debian.org/tracker/CVE-2016-7527   
                   imagemagick | CVE-2016-7528    | https://security-tracker.debian.org/tracker/CVE-2016-7528   
                   imagemagick | CVE-2016-7529    | https://security-tracker.debian.org/tracker/CVE-2016-7529   
                   imagemagick | CVE-2016-7530    | https://security-tracker.debian.org/tracker/CVE-2016-7530   
                   imagemagick | CVE-2016-7531    | https://security-tracker.debian.org/tracker/CVE-2016-7531   
                   imagemagick | CVE-2016-7532    | https://security-tracker.debian.org/tracker/CVE-2016-7532   
                   imagemagick | CVE-2016-7533    | https://security-tracker.debian.org/tracker/CVE-2016-7533   
                   imagemagick | CVE-2016-7534    | https://security-tracker.debian.org/tracker/CVE-2016-7534   
                   imagemagick | CVE-2016-7535    | https://security-tracker.debian.org/tracker/CVE-2016-7535   
                   imagemagick | CVE-2016-7536    | https://security-tracker.debian.org/tracker/CVE-2016-7536   
                   imagemagick | CVE-2016-7537    | https://security-tracker.debian.org/tracker/CVE-2016-7537   
                   imagemagick | CVE-2016-7538    | https://security-tracker.debian.org/tracker/CVE-2016-7538   
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                   imagemagick | CVE-2017-5509    | https://security-tracker.debian.org/tracker/CVE-2017-5509   
                   imagemagick | CVE-2017-5510    | https://security-tracker.debian.org/tracker/CVE-2017-5510   
                   imagemagick | CVE-2017-5511    | https://security-tracker.debian.org/tracker/CVE-2017-5511   
                        jasper | CVE-2015-8751    | https://security-tracker.debian.org/tracker/CVE-2015-8751   
                        jquery | CVE-2007-2379    | https://security-tracker.debian.org/tracker/CVE-2007-2379   
                         libao | CVE-2017-11548   | https://security-tracker.debian.org/tracker/CVE-2017-11548  
                        libbpf | CVE-2021-45940   | https://security-tracker.debian.org/tracker/CVE-2021-45940  
                        libbpf | CVE-2021-45941   | https://security-tracker.debian.org/tracker/CVE-2021-45941  
                  libfreeimage | CVE-2019-12211   | https://security-tracker.debian.org/tracker/CVE-2019-12211  
                  libfreeimage | CVE-2019-12212   | https://security-tracker.debian.org/tracker/CVE-2019-12212  
                  libfreeimage | CVE-2019-12213   | https://security-tracker.debian.org/tracker/CVE-2019-12213  
                  libfreeimage | CVE-2019-12214   | https://security-tracker.debian.org/tracker/CVE-2019-12214  
                     libiberty | CVE-2012-3509    | https://security-tracker.debian.org/tracker/CVE-2012-3509   
                     libiberty | CVE-2016-2226    | https://security-tracker.debian.org/tracker/CVE-2016-2226   
                     libiberty | CVE-2016-4487    | https://security-tracker.debian.org/tracker/CVE-2016-4487   
                     libiberty | CVE-2016-4488    | https://security-tracker.debian.org/tracker/CVE-2016-4488   
                     libiberty | CVE-2016-4489    | https://security-tracker.debian.org/tracker/CVE-2016-4489   
                     libiberty | CVE-2016-4490    | https://security-tracker.debian.org/tracker/CVE-2016-4490   
                     libiberty | CVE-2016-4491    | https://security-tracker.debian.org/tracker/CVE-2016-4491   
                     libiberty | CVE-2016-4492    | https://security-tracker.debian.org/tracker/CVE-2016-4492   
                     libiberty | CVE-2016-4493    | https://security-tracker.debian.org/tracker/CVE-2016-4493   
                     libiberty | CVE-2016-6131    | https://security-tracker.debian.org/tracker/CVE-2016-6131   
                       libkrb5 | CVE-1999-0143    | https://security-tracker.debian.org/tracker/CVE-1999-0143   
                       libkrb5 | CVE-1999-0713    | https://security-tracker.debian.org/tracker/CVE-1999-0713   
                       libkrb5 | CVE-2007-3149    | https://security-tracker.debian.org/tracker/CVE-2007-3149   
                       libkrb5 | CVE-2007-5894    | https://security-tracker.debian.org/tracker/CVE-2007-5894   
                       libkrb5 | CVE-2007-5902    | https://security-tracker.debian.org/tracker/CVE-2007-5902   
                       libkrb5 | CVE-2009-0844    | https://security-tracker.debian.org/tracker/CVE-2009-0844   
                       libkrb5 | CVE-2009-0846    | https://security-tracker.debian.org/tracker/CVE-2009-0846   
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                      libpjsip | CVE-2022-24754   | https://security-tracker.debian.org/tracker/CVE-2022-24754  
                      libpjsip | CVE-2022-24764   | https://security-tracker.debian.org/tracker/CVE-2022-24764  
                      libplist | CVE-2017-5834    | https://security-tracker.debian.org/tracker/CVE-2017-5834   
                      libplist | CVE-2017-5835    | https://security-tracker.debian.org/tracker/CVE-2017-5835   
                      libplist | CVE-2017-5836    | https://security-tracker.debian.org/tracker/CVE-2017-5836   
                    libtorrent | CVE-2009-1760    | https://security-tracker.debian.org/tracker/CVE-2009-1760   
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                       libvirt | CVE-2014-8135    | https://security-tracker.debian.org/tracker/CVE-2014-8135   
                       libvirt | CVE-2014-8136    | https://security-tracker.debian.org/tracker/CVE-2014-8136   
                       libvirt | CVE-2015-5313    | https://security-tracker.debian.org/tracker/CVE-2015-5313   
                       libvirt | CVE-2018-5748    | https://security-tracker.debian.org/tracker/CVE-2018-5748   
                       libvirt | CVE-2018-6764    | https://security-tracker.debian.org/tracker/CVE-2018-6764   
                         lrzsz | CVE-2018-10195   | https://security-tracker.debian.org/tracker/CVE-2018-10195  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2020-15888   | https://security-tracker.debian.org/tracker/CVE-2020-15888  
                           lua | CVE-2020-15945   | https://security-tracker.debian.org/tracker/CVE-2020-15945  
                           lua | CVE-2021-43519   | https://security-tracker.debian.org/tracker/CVE-2021-43519  
                           lua | CVE-2022-28805   | https://security-tracker.debian.org/tracker/CVE-2022-28805  
                       mariadb | CVE-2021-46669   | https://security-tracker.debian.org/tracker/CVE-2021-46669  
                       mariadb | CVE-2022-27376   | https://security-tracker.debian.org/tracker/CVE-2022-27376  
                       mariadb | CVE-2022-27377   | https://security-tracker.debian.org/tracker/CVE-2022-27377  
                       mariadb | CVE-2022-27378   | https://security-tracker.debian.org/tracker/CVE-2022-27378  
                       mariadb | CVE-2022-27379   | https://security-tracker.debian.org/tracker/CVE-2022-27379  
                       mariadb | CVE-2022-27380   | https://security-tracker.debian.org/tracker/CVE-2022-27380  
                       mariadb | CVE-2022-27381   | https://security-tracker.debian.org/tracker/CVE-2022-27381  
                       mariadb | CVE-2022-27382   | https://security-tracker.debian.org/tracker/CVE-2022-27382  
                       mariadb | CVE-2022-27383   | https://security-tracker.debian.org/tracker/CVE-2022-27383  
                       mariadb | CVE-2022-27384   | https://security-tracker.debian.org/tracker/CVE-2022-27384  
                       mariadb | CVE-2022-27385   | https://security-tracker.debian.org/tracker/CVE-2022-27385  
                       mariadb | CVE-2022-27386   | https://security-tracker.debian.org/tracker/CVE-2022-27386  
                       mariadb | CVE-2022-27387   | https://security-tracker.debian.org/tracker/CVE-2022-27387  
                       mariadb | CVE-2022-27444   | https://security-tracker.debian.org/tracker/CVE-2022-27444  
                       mariadb | CVE-2022-27445   | https://security-tracker.debian.org/tracker/CVE-2022-27445  
                       mariadb | CVE-2022-27446   | https://security-tracker.debian.org/tracker/CVE-2022-27446  
                       mariadb | CVE-2022-27447   | https://security-tracker.debian.org/tracker/CVE-2022-27447  
                       mariadb | CVE-2022-27448   | https://security-tracker.debian.org/tracker/CVE-2022-27448  
                       mariadb | CVE-2022-27449   | https://security-tracker.debian.org/tracker/CVE-2022-27449  
                       mariadb | CVE-2022-27451   | https://security-tracker.debian.org/tracker/CVE-2022-27451  
                       mariadb | CVE-2022-27452   | https://security-tracker.debian.org/tracker/CVE-2022-27452  
                       mariadb | CVE-2022-27455   | https://security-tracker.debian.org/tracker/CVE-2022-27455  
                       mariadb | CVE-2022-27456   | https://security-tracker.debian.org/tracker/CVE-2022-27456  
                       mariadb | CVE-2022-27457   | https://security-tracker.debian.org/tracker/CVE-2022-27457  
                       mariadb | CVE-2022-27458   | https://security-tracker.debian.org/tracker/CVE-2022-27458  
                       mbedtls | CVE-2021-45451   | https://security-tracker.debian.org/tracker/CVE-2021-45451  
                       mongodb | CVE-2014-8180    | https://security-tracker.debian.org/tracker/CVE-2014-8180   
                       mongodb | CVE-2017-18381   | https://security-tracker.debian.org/tracker/CVE-2017-18381  
                       mongodb | CVE-2017-2665    | https://security-tracker.debian.org/tracker/CVE-2017-2665   
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
                          mutt | CVE-2022-1328    | https://security-tracker.debian.org/tracker/CVE-2022-1328   
                          nasm | CVE-2020-18974   | https://security-tracker.debian.org/tracker/CVE-2020-18974  
                       ncurses | CVE-2021-39537   | https://security-tracker.debian.org/tracker/CVE-2021-39537  
                       ncurses | CVE-2022-29458   | https://security-tracker.debian.org/tracker/CVE-2022-29458  
                           ntp | CVE-2014-9750    | https://security-tracker.debian.org/tracker/CVE-2014-9750   
                           ntp | CVE-2014-9751    | https://security-tracker.debian.org/tracker/CVE-2014-9751   
                           ntp | CVE-2015-7691    | https://security-tracker.debian.org/tracker/CVE-2015-7691   
                           ntp | CVE-2015-7692    | https://security-tracker.debian.org/tracker/CVE-2015-7692   
                           ntp | CVE-2015-7701    | https://security-tracker.debian.org/tracker/CVE-2015-7701   
                           ntp | CVE-2015-7702    | https://security-tracker.debian.org/tracker/CVE-2015-7702   
                           ntp | CVE-2015-7703    | https://security-tracker.debian.org/tracker/CVE-2015-7703   
                           ntp | CVE-2015-7704    | https://security-tracker.debian.org/tracker/CVE-2015-7704   
                           ntp | CVE-2015-7705    | https://security-tracker.debian.org/tracker/CVE-2015-7705   
                           ntp | CVE-2015-7849    | https://security-tracker.debian.org/tracker/CVE-2015-7849   
                           ntp | CVE-2015-7850    | https://security-tracker.debian.org/tracker/CVE-2015-7850   
                           ntp | CVE-2015-7852    | https://security-tracker.debian.org/tracker/CVE-2015-7852   
                           ntp | CVE-2015-7853    | https://security-tracker.debian.org/tracker/CVE-2015-7853   
                           ntp | CVE-2015-7854    | https://security-tracker.debian.org/tracker/CVE-2015-7854   
                           ntp | CVE-2015-7855    | https://security-tracker.debian.org/tracker/CVE-2015-7855   
                           ntp | CVE-2015-7973    | https://security-tracker.debian.org/tracker/CVE-2015-7973   
                           ntp | CVE-2015-7974    | https://security-tracker.debian.org/tracker/CVE-2015-7974   
                           ntp | CVE-2015-7977    | https://security-tracker.debian.org/tracker/CVE-2015-7977   
                           ntp | CVE-2016-2518    | https://security-tracker.debian.org/tracker/CVE-2016-2518   
                           ntp | CVE-2016-4953    | https://security-tracker.debian.org/tracker/CVE-2016-4953   
                           ntp | CVE-2016-4954    | https://security-tracker.debian.org/tracker/CVE-2016-4954   
                           ntp | CVE-2016-4955    | https://security-tracker.debian.org/tracker/CVE-2016-4955   
                           ntp | CVE-2016-4956    | https://security-tracker.debian.org/tracker/CVE-2016-4956   
                           ntp | CVE-2016-7426    | https://security-tracker.debian.org/tracker/CVE-2016-7426   
                           ntp | CVE-2016-7434    | https://security-tracker.debian.org/tracker/CVE-2016-7434   
                           ntp | CVE-2017-6458    | https://security-tracker.debian.org/tracker/CVE-2017-6458   
                           ntp | CVE-2018-7170    | https://security-tracker.debian.org/tracker/CVE-2018-7170   
                           ntp | CVE-2018-7185    | https://security-tracker.debian.org/tracker/CVE-2018-7185   
                           ntp | CVE-2019-11331   | https://security-tracker.debian.org/tracker/CVE-2019-11331  
                           ntp | CVE-2019-8936    | https://security-tracker.debian.org/tracker/CVE-2019-8936   
                           ntp | CVE-2020-11868   | https://security-tracker.debian.org/tracker/CVE-2020-11868  
                           ntp | CVE-2020-13817   | https://security-tracker.debian.org/tracker/CVE-2020-13817  
                       opencv3 | CVE-2019-14493   | https://security-tracker.debian.org/tracker/CVE-2019-14493  
                       opencv3 | CVE-2019-15939   | https://security-tracker.debian.org/tracker/CVE-2019-15939  
                       opencv3 | CVE-2019-19624   | https://security-tracker.debian.org/tracker/CVE-2019-19624  
                       openjdk | CVE-2009-2475    | https://security-tracker.debian.org/tracker/CVE-2009-2475   
                       openjdk | CVE-2009-2476    | https://security-tracker.debian.org/tracker/CVE-2009-2476   
                       openjdk | CVE-2009-2689    | https://security-tracker.debian.org/tracker/CVE-2009-2689   
                       openjdk | CVE-2009-2690    | https://security-tracker.debian.org/tracker/CVE-2009-2690   
                       openjdk | CVE-2009-3728    | https://security-tracker.debian.org/tracker/CVE-2009-3728   
                       openjdk | CVE-2009-3879    | https://security-tracker.debian.org/tracker/CVE-2009-3879   
                       openjdk | CVE-2009-3880    | https://security-tracker.debian.org/tracker/CVE-2009-3880   
                       openjdk | CVE-2009-3881    | https://security-tracker.debian.org/tracker/CVE-2009-3881   
                       openjdk | CVE-2009-3882    | https://security-tracker.debian.org/tracker/CVE-2009-3882   
                       openjdk | CVE-2009-3883    | https://security-tracker.debian.org/tracker/CVE-2009-3883   
                       openjdk | CVE-2009-3884    | https://security-tracker.debian.org/tracker/CVE-2009-3884   
                       openjdk | CVE-2013-0169    | https://security-tracker.debian.org/tracker/CVE-2013-0169   
                      openjpeg | CVE-2015-1239    | https://security-tracker.debian.org/tracker/CVE-2015-1239   
                      openjpeg | CVE-2016-9675    | https://security-tracker.debian.org/tracker/CVE-2016-9675   
                      openjpeg | CVE-2021-29338   | https://security-tracker.debian.org/tracker/CVE-2021-29338  
                      openjpeg | CVE-2021-3575    | https://security-tracker.debian.org/tracker/CVE-2021-3575   
                      openjpeg | CVE-2022-1122    | https://security-tracker.debian.org/tracker/CVE-2022-1122   
                      openldap | CVE-2015-3276    | https://security-tracker.debian.org/tracker/CVE-2015-3276   
                       openssh | CVE-2007-2768    | https://security-tracker.debian.org/tracker/CVE-2007-2768   
                       openssh | CVE-2008-3844    | https://security-tracker.debian.org/tracker/CVE-2008-3844   
                       openssh | CVE-2014-9278    | https://security-tracker.debian.org/tracker/CVE-2014-9278   
                      openswan | CVE-2019-10155   | https://security-tracker.debian.org/tracker/CVE-2019-10155  
                         p7zip | CVE-2017-17969   | https://security-tracker.debian.org/tracker/CVE-2017-17969  
                         p7zip | CVE-2018-5996    | https://security-tracker.debian.org/tracker/CVE-2018-5996   
                         patch | CVE-2018-6952    | https://security-tracker.debian.org/tracker/CVE-2018-6952   
                         patch | CVE-2019-20633   | https://security-tracker.debian.org/tracker/CVE-2019-20633  
                           php | CVE-2007-2728    | https://security-tracker.debian.org/tracker/CVE-2007-2728   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                           php | CVE-2007-4596    | https://security-tracker.debian.org/tracker/CVE-2007-4596   
                        polkit | CVE-2021-4034    | https://security-tracker.debian.org/tracker/CVE-2021-4034   
                    postgresql | CVE-2017-8806    | https://security-tracker.debian.org/tracker/CVE-2017-8806   
                 powerpc-utils | CVE-2014-8165    | https://security-tracker.debian.org/tracker/CVE-2014-8165   
                          pppd | CVE-2018-11574   | https://security-tracker.debian.org/tracker/CVE-2018-11574  
                 python-django | CVE-2022-28346   | https://security-tracker.debian.org/tracker/CVE-2022-28346  
                 python-django | CVE-2022-28347   | https://security-tracker.debian.org/tracker/CVE-2022-28347  
               python-m2crypto | CVE-2020-25657   | https://security-tracker.debian.org/tracker/CVE-2020-25657  
                    python-pip | CVE-2018-20225   | https://security-tracker.debian.org/tracker/CVE-2018-20225  
                python-twisted | CVE-2022-24801   | https://security-tracker.debian.org/tracker/CVE-2022-24801  
                       python3 | CVE-2015-20107   | https://security-tracker.debian.org/tracker/CVE-2015-20107  
                       python3 | CVE-2022-26488   | https://security-tracker.debian.org/tracker/CVE-2022-26488  
                          qemu | CVE-2018-18438   | https://security-tracker.debian.org/tracker/CVE-2018-18438  
                          qemu | CVE-2019-12067   | https://security-tracker.debian.org/tracker/CVE-2019-12067  
                          qemu | CVE-2021-20255   | https://security-tracker.debian.org/tracker/CVE-2021-20255  
                          qemu | CVE-2021-3947    | https://security-tracker.debian.org/tracker/CVE-2021-3947   
                          qemu | CVE-2022-1050    | https://security-tracker.debian.org/tracker/CVE-2022-1050   
                          qemu | CVE-2022-26353   | https://security-tracker.debian.org/tracker/CVE-2022-26353  
                          qemu | CVE-2022-26354   | https://security-tracker.debian.org/tracker/CVE-2022-26354  
                        quagga | CVE-2016-4049    | https://security-tracker.debian.org/tracker/CVE-2016-4049   
                        quagga | CVE-2017-3224    | https://security-tracker.debian.org/tracker/CVE-2017-3224   
                        quagga | CVE-2021-44038   | https://security-tracker.debian.org/tracker/CVE-2021-44038  
               rabbitmq-server | CVE-2018-11087   | https://security-tracker.debian.org/tracker/CVE-2018-11087  
               rabbitmq-server | CVE-2018-1279    | https://security-tracker.debian.org/tracker/CVE-2018-1279   
                   resiprocate | CVE-2017-9454    | https://security-tracker.debian.org/tracker/CVE-2017-9454   
                       rtl_433 | CVE-2022-27419   | https://security-tracker.debian.org/tracker/CVE-2022-27419  
                        samba4 | CVE-2011-2411    | https://security-tracker.debian.org/tracker/CVE-2011-2411   
                        samba4 | CVE-2018-1050    | https://security-tracker.debian.org/tracker/CVE-2018-1050   
                        samba4 | CVE-2018-1057    | https://security-tracker.debian.org/tracker/CVE-2018-1057   
                           sdl | CVE-2019-13616   | https://security-tracker.debian.org/tracker/CVE-2019-13616  
                           sdl | CVE-2019-14906   | https://security-tracker.debian.org/tracker/CVE-2019-14906  
                           sdl | CVE-2019-7572    | https://security-tracker.debian.org/tracker/CVE-2019-7572   
                           sdl | CVE-2019-7573    | https://security-tracker.debian.org/tracker/CVE-2019-7573   
                           sdl | CVE-2019-7574    | https://security-tracker.debian.org/tracker/CVE-2019-7574   
                           sdl | CVE-2019-7575    | https://security-tracker.debian.org/tracker/CVE-2019-7575   
                           sdl | CVE-2019-7576    | https://security-tracker.debian.org/tracker/CVE-2019-7576   
                           sdl | CVE-2019-7577    | https://security-tracker.debian.org/tracker/CVE-2019-7577   
                           sdl | CVE-2019-7578    | https://security-tracker.debian.org/tracker/CVE-2019-7578   
                           sdl | CVE-2019-7635    | https://security-tracker.debian.org/tracker/CVE-2019-7635   
                           sdl | CVE-2019-7636    | https://security-tracker.debian.org/tracker/CVE-2019-7636   
                           sdl | CVE-2019-7637    | https://security-tracker.debian.org/tracker/CVE-2019-7637   
                           sdl | CVE-2019-7638    | https://security-tracker.debian.org/tracker/CVE-2019-7638   
                           sdl | CVE-2020-14409   | https://security-tracker.debian.org/tracker/CVE-2020-14409  
                           sdl | CVE-2020-14410   | https://security-tracker.debian.org/tracker/CVE-2020-14410  
                         smack | CVE-2014-0363    | https://security-tracker.debian.org/tracker/CVE-2014-0363   
                         smack | CVE-2014-0364    | https://security-tracker.debian.org/tracker/CVE-2014-0364   
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                         spice | CVE-2016-0749    | https://security-tracker.debian.org/tracker/CVE-2016-0749   
                         spice | CVE-2016-2150    | https://security-tracker.debian.org/tracker/CVE-2016-2150   
                         spice | CVE-2018-10893   | https://security-tracker.debian.org/tracker/CVE-2018-10893  
                    subversion | CVE-2021-28544   | https://security-tracker.debian.org/tracker/CVE-2021-28544  
                    subversion | CVE-2022-24070   | https://security-tracker.debian.org/tracker/CVE-2022-24070  
                        thttpd | CVE-2012-5640    | https://security-tracker.debian.org/tracker/CVE-2012-5640   
                          tiff | CVE-2015-7313    | https://security-tracker.debian.org/tracker/CVE-2015-7313   
                          tiff | CVE-2022-0561    | https://security-tracker.debian.org/tracker/CVE-2022-0561   
                          tiff | CVE-2022-0562    | https://security-tracker.debian.org/tracker/CVE-2022-0562   
                          tiff | CVE-2022-0865    | https://security-tracker.debian.org/tracker/CVE-2022-0865   
                          tiff | CVE-2022-0891    | https://security-tracker.debian.org/tracker/CVE-2022-0891   
                          tiff | CVE-2022-0907    | https://security-tracker.debian.org/tracker/CVE-2022-0907   
                          tiff | CVE-2022-0908    | https://security-tracker.debian.org/tracker/CVE-2022-0908   
                          tiff | CVE-2022-0909    | https://security-tracker.debian.org/tracker/CVE-2022-0909   
                          tiff | CVE-2022-0924    | https://security-tracker.debian.org/tracker/CVE-2022-0924   
                          tiff | CVE-2022-1056    | https://security-tracker.debian.org/tracker/CVE-2022-1056   
                          tiff | CVE-2022-1210    | https://security-tracker.debian.org/tracker/CVE-2022-1210   
                          tinc | CVE-2013-1428    | https://security-tracker.debian.org/tracker/CVE-2013-1428   
                           tor | CVE-2016-9079    | https://security-tracker.debian.org/tracker/CVE-2016-9079   
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                         unzip | CVE-2022-0529    | https://security-tracker.debian.org/tracker/CVE-2022-0529   
                         unzip | CVE-2022-0530    | https://security-tracker.debian.org/tracker/CVE-2022-0530   
                      usbguard | CVE-2019-25058   | https://security-tracker.debian.org/tracker/CVE-2019-25058  
                           vim | CVE-2022-1381    | https://security-tracker.debian.org/tracker/CVE-2022-1381   
                           vim | CVE-2022-1420    | https://security-tracker.debian.org/tracker/CVE-2022-1420   
                           xen | CVE-2011-1936    | https://security-tracker.debian.org/tracker/CVE-2011-1936   
                           xen | CVE-2011-3346    | https://security-tracker.debian.org/tracker/CVE-2011-3346   
                           xen | CVE-2014-2580    | https://security-tracker.debian.org/tracker/CVE-2014-2580   
                           xen | CVE-2014-3672    | https://security-tracker.debian.org/tracker/CVE-2014-3672   
                           xen | CVE-2015-7504    | https://security-tracker.debian.org/tracker/CVE-2015-7504   
                           xen | CVE-2015-8550    | https://security-tracker.debian.org/tracker/CVE-2015-8550   
                           xen | CVE-2015-8553    | https://security-tracker.debian.org/tracker/CVE-2015-8553   
                           xen | CVE-2016-3960    | https://security-tracker.debian.org/tracker/CVE-2016-3960   
                           xen | CVE-2016-7092    | https://security-tracker.debian.org/tracker/CVE-2016-7092   
                           xen | CVE-2016-9379    | https://security-tracker.debian.org/tracker/CVE-2016-9379   
                           xen | CVE-2016-9380    | https://security-tracker.debian.org/tracker/CVE-2016-9380   
                           xen | CVE-2016-9383    | https://security-tracker.debian.org/tracker/CVE-2016-9383   
                           xen | CVE-2016-9386    | https://security-tracker.debian.org/tracker/CVE-2016-9386   
                           xen | CVE-2017-12134   | https://security-tracker.debian.org/tracker/CVE-2017-12134  
                           xen | CVE-2017-12135   | https://security-tracker.debian.org/tracker/CVE-2017-12135  
                           xen | CVE-2017-12137   | https://security-tracker.debian.org/tracker/CVE-2017-12137  
                           xen | CVE-2017-7228    | https://security-tracker.debian.org/tracker/CVE-2017-7228   
                           xen | CVE-2018-5244    | https://security-tracker.debian.org/tracker/CVE-2018-5244   
                           xen | CVE-2018-8897    | https://security-tracker.debian.org/tracker/CVE-2018-8897   
                           xen | CVE-2021-26313   | https://security-tracker.debian.org/tracker/CVE-2021-26313  
                           xen | CVE-2021-26314   | https://security-tracker.debian.org/tracker/CVE-2021-26314  
                           xen | CVE-2021-28038   | https://security-tracker.debian.org/tracker/CVE-2021-28038  
                           xen | CVE-2021-28039   | https://security-tracker.debian.org/tracker/CVE-2021-28039  
                           xen | CVE-2021-28687   | https://security-tracker.debian.org/tracker/CVE-2021-28687  
                           xen | CVE-2021-28690   | https://security-tracker.debian.org/tracker/CVE-2021-28690  
                           xen | CVE-2021-28692   | https://security-tracker.debian.org/tracker/CVE-2021-28692  
                           xen | CVE-2021-28693   | https://security-tracker.debian.org/tracker/CVE-2021-28693  
                           xen | CVE-2021-28694   | https://security-tracker.debian.org/tracker/CVE-2021-28694  
                           xen | CVE-2021-28695   | https://security-tracker.debian.org/tracker/CVE-2021-28695  
                           xen | CVE-2021-28696   | https://security-tracker.debian.org/tracker/CVE-2021-28696  
                           xen | CVE-2021-28697   | https://security-tracker.debian.org/tracker/CVE-2021-28697  
                           xen | CVE-2021-28698   | https://security-tracker.debian.org/tracker/CVE-2021-28698  
                           xen | CVE-2021-28699   | https://security-tracker.debian.org/tracker/CVE-2021-28699  
                           xen | CVE-2021-28700   | https://security-tracker.debian.org/tracker/CVE-2021-28700  
                           xen | CVE-2021-28701   | https://security-tracker.debian.org/tracker/CVE-2021-28701  
                           xen | CVE-2021-28702   | https://security-tracker.debian.org/tracker/CVE-2021-28702  
                           xen | CVE-2021-28703   | https://security-tracker.debian.org/tracker/CVE-2021-28703  
                           xen | CVE-2021-28704   | https://security-tracker.debian.org/tracker/CVE-2021-28704  
                           xen | CVE-2021-28707   | https://security-tracker.debian.org/tracker/CVE-2021-28707  
                           xen | CVE-2021-28708   | https://security-tracker.debian.org/tracker/CVE-2021-28708  
                           xen | CVE-2021-28711   | https://security-tracker.debian.org/tracker/CVE-2021-28711  
                           xen | CVE-2021-28712   | https://security-tracker.debian.org/tracker/CVE-2021-28712  
                           xen | CVE-2021-28713   | https://security-tracker.debian.org/tracker/CVE-2021-28713  
                           xen | CVE-2022-23033   | https://security-tracker.debian.org/tracker/CVE-2022-23033  
                           xen | CVE-2022-23035   | https://security-tracker.debian.org/tracker/CVE-2022-23035  
                           xen | CVE-2022-23036   | https://security-tracker.debian.org/tracker/CVE-2022-23036  
                           xen | CVE-2022-23037   | https://security-tracker.debian.org/tracker/CVE-2022-23037  
                           xen | CVE-2022-23038   | https://security-tracker.debian.org/tracker/CVE-2022-23038  
                           xen | CVE-2022-23039   | https://security-tracker.debian.org/tracker/CVE-2022-23039  
                           xen | CVE-2022-23040   | https://security-tracker.debian.org/tracker/CVE-2022-23040  
                           xen | CVE-2022-23041   | https://security-tracker.debian.org/tracker/CVE-2022-23041  
                           xen | CVE-2022-23042   | https://security-tracker.debian.org/tracker/CVE-2022-23042  
                           xen | CVE-2022-23960   | https://security-tracker.debian.org/tracker/CVE-2022-23960  
                           xen | CVE-2022-26357   | https://security-tracker.debian.org/tracker/CVE-2022-26357  
                           xen | CVE-2022-26358   | https://security-tracker.debian.org/tracker/CVE-2022-26358  
                           xen | CVE-2022-26359   | https://security-tracker.debian.org/tracker/CVE-2022-26359  
                           xen | CVE-2022-26360   | https://security-tracker.debian.org/tracker/CVE-2022-26360  
                           xen | CVE-2022-26361   | https://security-tracker.debian.org/tracker/CVE-2022-26361  
                        xerces | CVE-2012-0880    | https://security-tracker.debian.org/tracker/CVE-2012-0880   
                  xscreensaver | CVE-2021-34557   | https://security-tracker.debian.org/tracker/CVE-2021-34557  
                           zip | CVE-2018-13410   | https://security-tracker.debian.org/tracker/CVE-2018-13410  
                          zlog | CVE-2021-43521   | https://security-tracker.debian.org/tracker/CVE-2021-43521  


-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
