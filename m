Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACE60C54EE9
	for <buildroot@archiver.kernel.org>; Tue, 20 Sep 2022 05:41:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC24681BA8;
	Tue, 20 Sep 2022 05:41:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC24681BA8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Sw0Bg_7QWYHf; Tue, 20 Sep 2022 05:41:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F20E881A58;
	Tue, 20 Sep 2022 05:41:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F20E881A58
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A96221BF360
 for <buildroot@lists.busybox.net>; Tue, 20 Sep 2022 05:41:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6A60F605AF
 for <buildroot@lists.busybox.net>; Tue, 20 Sep 2022 05:41:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A60F605AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rBzlZMxVa-B0 for <buildroot@lists.busybox.net>;
 Tue, 20 Sep 2022 05:41:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 98B35605A3
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 98B35605A3
 for <buildroot@buildroot.org>; Tue, 20 Sep 2022 05:41:27 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3D94740006
 for <buildroot@buildroot.org>; Tue, 20 Sep 2022 05:41:24 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Tue, 20 Sep 2022 05:41:24 -0000
Message-Id: <20220920054130.6A60F605AF@smtp3.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1663652484; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=nJERFuOy81COp1fwpfBMafA7BSas6z27k2/p5W1U82s=;
 b=RAiw/M4rgyUVlrzjvZ0umKibixfc1xN27+8gehQm1pgVtP2ZIUCxynchvT0DRzfBU0FXL9
 k539K6j1RIFHXphMCMMw/vwdLypxwqhr7h/+gmfGrDFN6MxOuXpkcnsdflspwUI/tV7I3j
 cOpbK+xHvwI6Sira4R9Yhr1M4LQLXmT+hNgF/oIJmwTl2fn7m1Gb0AfHyUlM/o8j0AKuOJ
 7VF8O/WYpGYm/AhUCi5r++7Z2jqpRCiSvHJdT+eHZxz/mMuGPrQNV4PnBaavQHCApxsfr4
 h6Gh+b3g2m3lfOiJFCyGj5i+/aHDcaqGlbbzwwqndyxoG4LNv/aATq35DtKGsQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RAiw/M4r
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-09-19
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

Autobuild statistics for 2022-09-19
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  9  |  1  |  0  | 10  |
  2022.05.x  | 35  | 30  |  1  | 66  |
    master   | 204 | 174 |  0  | 378 |

Classification of failures by reason for master
-----------------------------------------------

glibc-2.35-134-gb6aade18a7e... | 10
                 linux-5.17.15 | 10
                host-go-1.19.1 | 8 
            host-binutils-2.38 | 6 
                       unknown | 6 
                   perl-5.34.1 | 5 
dahdi-linux-5c840cf43838e06... | 4 
                gerbera-1.10.0 | 4 
              host-rust-1.62.0 | 4 
                bpftool-v6.8.0 | 3 
                 dash-0.5.11.5 | 3 
                     frr-8.2.2 | 3 
  gobject-introspection-1.72.0 | 3 
host-pahole-73383b3a39afe86... | 3 
               libglib2-2.72.3 | 3 
             libgpg-error-1.45 | 3 
                elfutils-0.186 | 2 
             fontconfig-2.13.1 | 2 
fs/ubifs/ubifs.mk:49: /home... | 2 
                  gensio-2.5.2 | 2 
            host-binutils-2.37 | 2 
host-spirv-llvm-translator-... | 2 
            igh-ethercat-1.5.2 | 2 
                  lcms2-2.13.1 | 2 
              libgcrypt-1.10.1 | 2 
                   libnss-3.83 | 2 
              memcached-1.6.16 | 2 
         mxs-bootlets-10.12.01 | 2 
                  ntp-4.2.8p15 | 2 
              open62541-v1.3.3 | 2 
               openpgm-5-3-128 | 2 
                    sdl-1.2.15 | 2 
toolchain-external-arm-aarc... | 2 
uqmi-0a19b5b77140465c29e2af... | 2 
                wtfutil-0.41.0 | 2 
/home/buildroot/autobuild/i... | 1 
/home/buildroot/autobuild/i... | 1 
/home/buildroot/autobuild/i... | 1 
              alsa-lib-1.2.7.2 | 1 
                    bat-0.19.0 | 1 
                  botan-2.19.2 | 1 
                   bzip2-1.0.8 | 1 
                  exempi-2.6.1 | 1 
                 fdk-aac-2.0.2 | 1 
       freeradius-server-3.2.0 | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
                 fwts-21.11.00 | 1 
          gitlab-runner-14.5.1 | 1 
                     gmp-6.2.1 | 1 
                       gsl-2.6 | 1 
gummiboot-2bcd919c681c952eb... | 1 
            host-binutils-2.39 | 1 
       host-gcc-initial-11.3.0 | 1 
host-gdb-arc-2020.09-releas... | 1 
            host-omniorb-4.3.0 | 1 
             kismet-2022-02-R1 | 1 
      libabseil-cpp-20220623.0 | 1 
               libgpgme-1.17.1 | 1 
                   libiio-0.24 | 1 
              libmanette-0.2.6 | 1 
                    libndp-1.8 | 1 
                   libqb-2.0.6 | 1 
              libunistring-1.0 | 1 
       linux-5.10.109-cip5-rt4 | 1 
           linux-5.10.115-cip7 | 1 
               linux-pam-1.5.2 | 1 
          lua-cqueues-20200726 | 1 
make: *** wait: No child pr... | 1 
            makedumpfile-1.7.0 | 1 
                    musl-1.2.3 | 1 
                nodejs-16.16.0 | 1 
                     php-8.1.9 | 1 
                python3-3.10.7 | 1 
            quickjs-2021-03-27 | 1 
         rabbitmq-server-3.8.2 | 1 
rtl8812au-aircrack-ng-e7a4a... | 1 
               snort3-3.1.18.0 | 1 
      spandsp-3.0.0-6ec23e5a7e | 1 
                tealdeer-1.5.0 | 1 
toolchain-external-arm-aarc... | 1 
                   trinity-1.9 | 1 
             uccp420wlan-6.9.1 | 1 
ulog-0389d243352255f6182326... | 1 
               valgrind-3.19.0 | 1 
wilc-driver-linux4microchip... | 1 
                   woff2-1.0.2 | 1 
                 wolfssl-5.5.0 | 1 
                      xz-5.2.5 | 1 
                  zabbix-5.4.9 | 1 
                    zeek-4.1.1 | 1 
                    zstd-1.5.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/3cb72019e2c1fac45d810a6b29a581d9bffdea1a |     
    arc      | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/79a9fa9873de28f8113f8ff9fd5285e5bca99470 |     
   mipsel    | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/8e45a0a8f524ec83cdd4471293dd8f6c3fd1f75f |     
    or1k     |        alsa-lib-1.2.7.2        | NOK | http://autobuild.buildroot.net/results/b3bb917ab59ec54ce9b1a082da8ae1efee5c76b5 |     
   armeb     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/8a1b9e770a6673f37b624696c60e850a3b233209 |     
 aarch64_be  |          botan-2.19.2          | NOK | http://autobuild.buildroot.net/results/e61cbe8c9b699901e2e923ceb5b60669507c32d2 | ORPH
  aarch64    |         bpftool-v6.8.0         | NOK | http://autobuild.buildroot.net/results/f999f25731804381f1fc3420674e598a45f8faae |     
  sparc64    |         bpftool-v6.8.0         | NOK | http://autobuild.buildroot.net/results/2895ea53744b7e7b3ecb0868a4fe8824d70eee55 |     
 aarch64_be  |         bpftool-v6.8.0         | NOK | http://autobuild.buildroot.net/results/734848a08bc069775c8c43986c53ce0a9815e35f |     
powerpc64le  |          bzip2-1.0.8           | NOK | http://autobuild.buildroot.net/results/fad53635162961e5b10bb0dd4388f7d2dba23ac8 | ORPH
 microblaze  | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/f7520a776e6e5711b74c1e890012a36a973fc96e |     
 microblaze  | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/b091399c896a6a029f28141610338962e68244f6 |     
   nios2     | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/3d0d74d3a55a866d45b5a943d1a38c8bd1db2fff |     
   nios2     | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/8b41841906de54bcb64b63e616bd2c94a35004c0 |     
  sparc64    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/af800d45243952c7ed292b939cf8d1e5a2aa0919 | ORPH
 aarch64_be  |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/ecf58aef8d29c3863e595e8e737681ef4c02853a | ORPH
  mips64el   |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/af7e5fe94591d50df6a3e6f9d5f3531d2703c2d1 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/ed0f7092044506c06e91ee9768cfa6e5056be9eb | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/5931e5cc97d051f13f9caad80ac66710ef6962d6 | ORPH
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/6773c30fb787b0f12f9dadfc3b3381e5be3c9159 |     
  mips64el   |         fdk-aac-2.0.2          | NOK | http://autobuild.buildroot.net/results/8378ea8a7666f24548a9edcc1f3322d566378e3a |     
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/acdd5e6acf4c5a8b179c1c3e4745901059648a60 | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/3b05a8574cf280cafb0fbaeb06c8b91b6596b423 | ORPH
  sparc64    |    freeradius-server-3.2.0     | NOK | http://autobuild.buildroot.net/results/efc5622e49edd20a2592ae45c5fbe8c6b9c277c4 |     
   xtensa    |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/07abeef153d740877c1e5a1863a07658c881cbba |     
   xtensa    |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/b0aaf14ebf900f7c652d05041240d7c72db91fcd |     
    arc      |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/9505543d44b62d1e493b3c4f525debbf66d89660 |     
microblazeel | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/a8dedca7accc87269301d86bda866d96321664a3 |     
   mips64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/1adf327058a87a22134166f47fe2f28effc94d3a |     
  powerpc    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/0afc0288d9cb52780b81d793a9159a60459fcb8f |     
   sparc     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/525805f9718864ab11b6d45b854a1e2f050911f0 |     
  aarch64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/2c4e7a180f6b017cbcd34cc4167e2a76250879e0 |     
  aarch64    |         fwts-21.11.00          | NOK | http://autobuild.buildroot.net/results/ab97971088bbdd141878329d472957eb753b17af |     
   sparc     |          gensio-2.5.2          | NOK | http://autobuild.buildroot.net/results/46be6a77fd47c33b1dc16eceee68415cfd002674 |     
 powerpc64   |          gensio-2.5.2          | NOK | http://autobuild.buildroot.net/results/83818b42da26ef85c70188e2fde9d73f2db1084c |     
  sparc64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/0b7d6b39ac3eb0e89626f82238b7c3465f730672 |     
 powerpc64   |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/272391caa4a781cbf4cd91aae897c5c65393eac1 |     
    i686     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/ec5822fb3d8a853cb10ede56472d225add2e4940 |     
   s390x     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/243fd75cb644b0b1a5805c8b4c96548e1c46ccc0 |     
  riscv64    |      gitlab-runner-14.5.1      | NOK | http://autobuild.buildroot.net/results/c4d36c513624411cf3fb0843d220e2d2a1f3c31c |     
  powerpc    | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/350a2bde745140cfe38d51b75676126b81ea2c30 |     
 powerpc64   | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/a5a744da8d2e9310595d5739618115b62bd098b5 |     
microblazeel | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/e20a7de2c85c90e11c696e5de5aa3b125fe82e85 |     
    sh4      | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/aa69cd2c838ffd0564d09455690b95c4568191cd |     
   arceb     | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/435c2047b18910f3b6bab362e5724925cf27b0e2 |     
   mipsel    | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/e0674da3dd9788e4ebd0b30f818ddfccdae0a512 |     
  powerpc    | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/6422272f941b44d24cdc2083354dea861c2de5ac |     
   nios2     | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/335ee1fbdd33499b2549884b7a5756235ce903cb |     
  powerpc    | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/0025fe2fd030c52002bf5810ddbe4794d090f426 |     
   nios2     | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/c4fee753ff92b8d199f0e4a4d8393224f469a194 |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/40032126915059458d01ade304636abc0cc52d57 | ORPH
   nios2     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/bd50f37c9504abdaf8f33d4792801e4b1c96b173 | ORPH
    or1k     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/f240335ec1042601aafb38f1f0582ca3dd5e4c5f | ORPH
   x86_64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/148f9800f6a26e1f8e80bea0fa1269d78f5824e7 | ORPH
  powerpc    |            gsl-2.6             | NOK | http://autobuild.buildroot.net/results/811a4e9aac9c489ee902a95560e516199b11753c | ORPH
   x86_64    | gummiboot-2bcd919c681c952eb... | NOK | http://autobuild.buildroot.net/results/5929104a868d2f69ec1b71e5e897b6d1ebf347cf |     
   sparc     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/38cfe7d6963e75a86ca008bf76e6063cc2bb8b6a |     
   s390x     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/40e7146e0ab14416ed0eb76fbb563f61c4f819b9 |     
   mipsel    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/52ac77745a63d72c719866c1c8795dd19e3417bf |     
   x86_64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/e1fbf3f555542f7d8c48214faa534c6fe29af5e2 |     
    sh4      |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/f955a9e550bb7a5c2ab744a1bfaade1b8f83efc6 |     
  mips64el   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/dbc38560ebbedd34dce84cc8b8388c1d8f86127c |     
  powerpc    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/121208eff793b73fa0076844896be60e835c2a63 |     
   x86_64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/1a39f70b886a90826b7f8de304a4dc0c5bfc835c |     
    i686     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/418776cac5deeaf985584a3d6b6ed0bc0b1156c4 |     
   armeb     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/8e4c4512902c34d8ec0c6f8dfff92b7a198e4b4a |     
   arceb     | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/2a17d19e652aaf341ebb39722f23a296f2677657 | ORPH
   mips64    |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/9d4fce49d3d0b762565ca6557219b5bc99f6eb3f |     
  aarch64    |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/46d7b5a45c7ef13f4fb4fa804ce9ff68af6820ad |     
    i686     |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/1317cedc3cf1de33539e91c15b627b43786509da |     
    i686     |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/222038a3114f0b7157dfe949e0ccec3ddb9fa9f5 |     
    i686     |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/711f38d393e68fc0a8b99869a6e6a399f3109dc1 |     
  mips64el   |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/88b1ad8407e9eab3656346028694a46de2872e24 |     
   mips64    |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/c14cf9b6bbee48c27f708e73d537957ed8c2395b |     
powerpc64le  |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/1436f3623415ca72d6cac77765758087069f5eab |     
  sparc64    |       host-omniorb-4.3.0       | NOK | http://autobuild.buildroot.net/results/5432f3bff376ab7cf60c973e45b344bdc8494280 |     
microblazeel | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/2dd8579971c0e218b866b7922e03eb9a1aec2c58 |     
    arm      | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/6a66797f782d136439f3281d1b87b504b8729694 |     
   sparc     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/893d54191e65bbd26c32468059648c0223ccf8f0 |     
   x86_64    |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/5ea218eb45cb7eb1b0c22c342095d0843c697b9d |     
   x86_64    |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/b11f327788bacf4b9b1fd2653db1f29cf5ad0613 |     
   mips64    |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/0afa2ccbfdaf8d282f6101071906e45cee95861e |     
  aarch64    |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/6539738823fba4c85cd0847181d242e9aa7ba443 |     
   armeb     | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/887e6965ea73e870220fe677eb0abc0454ba22c1 | ORPH
   armeb     | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/0e7aae3dfe5c1f1e3e97f9474ff79dbcce3c40bf | ORPH
 powerpc64   |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/d25355d02a3d6d89c0b6826d35893b9172eff5e7 |     
 powerpc64   |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/3c1afd59222fe52ce0c9fb5059f5734da6cc28d0 |     
   nios2     |       kismet-2022-02-R1        | NOK | http://autobuild.buildroot.net/results/1f7c1aaf04f84a7de2d5ace159737dbe2bc5bf7d | ORPH
   xtensa    |          lcms2-2.13.1          | NOK | http://autobuild.buildroot.net/results/bb76abe34e3dd763d42469ae20b0f1f3840471e6 |     
   xtensa    |          lcms2-2.13.1          | NOK | http://autobuild.buildroot.net/results/1287e57ef8905ce7346891ce3c24910bbd8f085d |     
  mips64el   |    libabseil-cpp-20220623.0    | NOK | http://autobuild.buildroot.net/results/1af8993b81db0d1ee6817f38df95bd31d4de9f10 |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/44e18ea222107e222592c2c07bfbf2994dcd45d2 | ORPH
    i586     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/484a3371cba3e0a9b115bd970d77f55661dada29 | ORPH
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/701fc37a5528cb6f0e649bd77d7c9b2a257bb079 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/911fb48d9b475d6eb5929c756085dcb002ae8875 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/2ea73e44a09abf8acddf9362efcfe8b9eee9bfc5 |     
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/2e2e4769dd1fa4beee313b8465798d639cc0a4e6 | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/5be575c6ffad3e3d7a229976a81435da983fbe14 | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/492e3c98e1808dbad1e6d1cb054f7c8d3990176c | ORPH
    sh4      |        libgpgme-1.17.1         | NOK | http://autobuild.buildroot.net/results/6317112f98f6486b8b3510cbc124dbc6c999ac60 | ORPH
   sparc     |          libiio-0.24           | NOK | http://autobuild.buildroot.net/results/13289ecc7a56c3863984f94dede374bd633602c1 |     
   mipsel    |        libmanette-0.2.6        | NOK | http://autobuild.buildroot.net/results/7263324435d6d25d7da98824d4313e7c45071de8 |     
  riscv64    |           libndp-1.8           | NOK | http://autobuild.buildroot.net/results/f44150ce60eb64c51f554ca18eaeffe2d9d427ce |     
 microblaze  |          libnss-3.83           | NOK | http://autobuild.buildroot.net/results/ecbbb84b2f0d354552f9592fbbdd18c8af6568f4 |     
   sh4aeb    |          libnss-3.83           | NOK | http://autobuild.buildroot.net/results/98ee87473c95df4fcbb089ed82aa7e2087cd1991 |     
   xtensa    |          libqb-2.0.6           | NOK | http://autobuild.buildroot.net/results/347c3ed932fb74141da9ace7fb872839dd63fc79 |     
   x86_64    |        libunistring-1.0        | NOK | http://autobuild.buildroot.net/results/63f1cd30840f2a5b3cb219f6683163c61d584da8 |     
   x86_64    |    linux-5.10.109-cip5-rt4     | NOK | http://autobuild.buildroot.net/results/a0899b32ef1e580b74b3461a843c1f74e559220f | ORPH
   x86_64    |      linux-5.10.115-cip7       | NOK | http://autobuild.buildroot.net/results/b0b13b99af9117cb71736e88027e6a6df562723a | ORPH
    arm      |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/c158e8ade9b290f4a0a54c0ae25b4a8d11674c76 | ORPH
powerpc64le  |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/29abec01ce508b461c747522e4df3eb2c583215e | ORPH
   arceb     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/8f8763d355bb738fbf772d5a63ab9696efa7e1ad | ORPH
   mips64    |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/9425e1d4ade0cec45d7671ec3d00b51e6664a4e9 | ORPH
   nios2     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/0732629539bb0f7e72b42fea409527c969cb8a0a | ORPH
 microblaze  |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/0fc201770417de6aa39e7d589698723ce39dd68a | ORPH
    mips     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/056eafd8f1f348d285583b49f044e0af3c9f9389 | ORPH
 powerpc64   |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/ac6ff4f5a00c9209b204f5a62d2e1aa71ee87911 | ORPH
 aarch64_be  |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/5ddb2353b89cd9a98dcbf73937ac8658986b7876 | ORPH
   nios2     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/afc6ad2ecf114c8e0e23e79c22313d0d2ca61c99 | ORPH
microblazeel |        linux-pam-1.5.2         | NOK | http://autobuild.buildroot.net/results/c06d34be416c9831b83b83a4e6c0400366f159d2 | ORPH
  aarch64    |      lua-cqueues-20200726      | NOK | http://autobuild.buildroot.net/results/032d6c9bf84b0d4e50d3c27f37b71c0564c52312 |     
  powerpc    | make: *** wait: No child pr... | NOK | http://autobuild.buildroot.net/results/6acb5e84f383fefe8ba14131d976ed98698f7e4c |     
  mips64el   |       makedumpfile-1.7.0       | NOK | http://autobuild.buildroot.net/results/2f22963f97be7ea62900e14574ec1477ed2de0f0 |     
   nios2     |        memcached-1.6.16        | NOK | http://autobuild.buildroot.net/results/89fbe944d7b1e8824c63a48272d1787785d38d7d | ORPH
    arc      |        memcached-1.6.16        | NOK | http://autobuild.buildroot.net/results/61f99bd748d1258778a48a4ef97ccd785f4befe0 | ORPH
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/a8a3d4971d95084b7f74f05127618a549b8a2d46 |     
    arm      |     mxs-bootlets-10.12.01      | NOK | http://autobuild.buildroot.net/results/96669272d5a6fba89039510c503927100040ae25 | ORPH
    arm      |     mxs-bootlets-10.12.01      | NOK | http://autobuild.buildroot.net/results/96e3e23678d4325d6b6c8b3e07bcdf8277e25b39 | ORPH
    i686     |         nodejs-16.16.0         | NOK | http://autobuild.buildroot.net/results/25db411c089a9ba8ccb6d54aed14a82526333e0c |     
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/59a2fa6f06dc46a24f55f641dae5f934fe727ecc | ORPH
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/a14c49fce1b55f8953ed8f6f07e3d3d476fed91f | ORPH
    sh4a     |        open62541-v1.3.3        | NOK | http://autobuild.buildroot.net/results/0bc15e21c3a6d1905774f7e5912ba70bc12a6982 | ORPH
    arc      |        open62541-v1.3.3        | NOK | http://autobuild.buildroot.net/results/1fd023e90f236d97b4627202ea0e2d460a7853d3 | ORPH
  sparc64    |        openpgm-5-3-128         | NOK | http://autobuild.buildroot.net/results/e6869b3450be8c8bb11ca06d8ea10b6705fbf0d4 |     
powerpc64le  |        openpgm-5-3-128         | NOK | http://autobuild.buildroot.net/results/4994a92b0d1abc90d5d07759415a84912faffe70 |     
    m68k     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/38f6fa0c49537904e6355e282f1d7a7348cb4633 |     
powerpc64le  |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/0265ec5d150f3140d47ee97d08419916ed9e016c |     
   sparc     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/b2488d0e786a37148e8c99dc74e973ed15c410e3 |     
   nios2     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/135b000d8356a12cae23c499cfbd9c9262872e34 |     
    mips     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/afd546e64814bfdc79f5ca7e394e3b099c1790fa |     
 aarch64_be  |           php-8.1.9            | NOK | http://autobuild.buildroot.net/results/faebc849eb8127fc4a80dc5e55cd78060c6c038c |     
   x86_64    |         python3-3.10.7         | NOK | http://autobuild.buildroot.net/results/8ea59bd2e03a55dfc0663d2bbe765b014882cf47 |     
  mips64el   |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/a128d377b924eee26c92439cc286d2bcc1aa20e2 |     
  riscv64    |     rabbitmq-server-3.8.2      | NOK | http://autobuild.buildroot.net/results/192a6b48caa17e93c80737b0f9d3cada6220cfd0 |     
    or1k     | rtl8812au-aircrack-ng-e7a4a... | NOK | http://autobuild.buildroot.net/results/2e4ee705d0e2b728f102aac4e6729f11ef22be36 |     
   sh4eb     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/88270622c02dd0da4a2a122bed9b6426d80423ca | ORPH
   sh4eb     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/22c819fa95e009daebe0789e2f5dea27fb308111 | ORPH
  aarch64    |        snort3-3.1.18.0         | NOK | http://autobuild.buildroot.net/results/879a5dea694a68f45502b85f3bea53784c9d5797 |     
  mips64el   |    spandsp-3.0.0-6ec23e5a7e    | NOK | http://autobuild.buildroot.net/results/fff4a31521268ba3d6b6be2f2c4c28ac0f0e2052 |     
   s390x     |         tealdeer-1.5.0         | NOK | http://autobuild.buildroot.net/results/fb566d8fef1dc061c27d8592856a591152fc3a66 |     
  aarch64    | toolchain-external-arm-aarc... | NOK | http://autobuild.buildroot.net/results/7b3612abe1d4ada026224453c557112b9f0847e0 | ORPH
 aarch64_be  | toolchain-external-arm-aarc... | NOK | http://autobuild.buildroot.net/results/3786961bee877877a69cd253e7c8c509cd2acbff | ORPH
 aarch64_be  | toolchain-external-arm-aarc... | NOK | http://autobuild.buildroot.net/results/9cbc144b72ad10b6a369e437cdea2908b68e4c1c | ORPH
   x86_64    |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/30b86ab8872fdb664cc645cd6a99cd144f222712 | ORPH
   xtensa    |       uccp420wlan-6.9.1        | NOK | http://autobuild.buildroot.net/results/79cdba79ec21251f9048d80ad1ec6c1b898b8686 | ORPH
 aarch64_be  | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/c89018c506dec734f550e2bc06124dc046723353 |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/bcbc7f2e69faf35af71d97b4d7ea4c5e3efcce25 |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/40373e71d60c2eb4fdca43aca4af1b65770c60ed |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/0821df0410e1fbfbf4804cfe4157efbaef26d350 |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/c7d8b36a0afcde072a1a623052b71a09b936df2a |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/514b6aa9ddfd65264dadb2c3e6d998fe20c5550d |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/9b65af0e48858318c1f4de38af8eaa54a297994a |     
 aarch64_be  | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/c8f02d790aaefcc17fd205d186122d52d2c0f574 |     
    or1k     | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/b4bf77a1e764fd33e82db2bf3280cf60cd399dde |     
  mips64el   |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/834d0d526ed31149385b08346d30702c9dca148f | ORPH
   x86_64    | wilc-driver-linux4microchip... | NOK | http://autobuild.buildroot.net/results/d8c4f0f959dd2ec110db8a75980f13172c3c116c |     
   x86_64    |          woff2-1.0.2           | NOK | http://autobuild.buildroot.net/results/0b131a1c3832c78865a57bf3aac50adce1062285 |     
   mipsel    |         wolfssl-5.5.0          | NOK | http://autobuild.buildroot.net/results/68670f5894bbf383ab36036465d287ac13245970 |     
   s390x     |         wtfutil-0.41.0         | NOK | http://autobuild.buildroot.net/results/e491755f2118ce5703ec7765f9d29c401ae08c51 |     
powerpc64le  |         wtfutil-0.41.0         | NOK | http://autobuild.buildroot.net/results/6ae2a6490631c464850c9a9fa37b111fa9eb4268 |     
  mips64el   |            xz-5.2.5            | NOK | http://autobuild.buildroot.net/results/096c16de023b7a3abf5eb0f7a8b807fff693ea6a | ORPH
 powerpc64   |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/8d4ef6987716c336c864bfe0ce7c55098fb20363 |     
   xtensa    |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/0846d30d468f08109f107e7dd65abe7684cd4be1 |     
microblazeel |           zstd-1.5.2           | NOK | http://autobuild.buildroot.net/results/7233759ba37e41317ff3d3e81984b4e7bde3c7b1 |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

                 wolfssl-5.5.0 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |         wolfssl-5.5.0          | NOK | http://autobuild.buildroot.net/results/9788ed580a08ae5e39d241793e545a9977c3ffde |     


Classification of failures by reason for 2022.05.x
--------------------------------------------------

         graphicsmagick-1.3.37 | 5 
host-pahole-73383b3a39afe86... | 4 
               protobuf-3.20.1 | 2 
                 uclibc-1.0.41 | 2 
                       xenomai | 2 
                 a10disp-0.6.1 | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
               gocryptfs-2.2.1 | 1 
                  kexec-2.0.23 | 1 
               libglib2-2.70.4 | 1 
                 linux-5.17.15 | 1 
                          mawk | 1 
                 mesa3d-21.3.8 | 1 
                mongodb-4.2.18 | 1 
                    ola-0.10.8 | 1 
                       opensbi | 1 
                   perl-5.34.1 | 1 
                   rsync-3.2.5 | 1 
rtl8821au-4235b0ec7d7220a63... | 1 
               xfsprogs-5.14.2 | 1 


Detail of failures for 2022.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         a10disp-0.6.1          | NOK | http://autobuild.buildroot.net/results/b8d58087e39273a1a8ed388392221524e57fe96a |     
   mipsel    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/a0efd3ffee9dbbce5c205c878c1a9b58138bbd36 |     
   s390x     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/9d495fb0534dd170602325d13667af82b2e7b590 |     
powerpc64le  |        gocryptfs-2.2.1         | NOK | http://autobuild.buildroot.net/results/b099be7c39165a709675dca5f86611203b7760df |     
  riscv64    |     graphicsmagick-1.3.37      | NOK | http://autobuild.buildroot.net/results/046971a4ae8a7659a2cfe48e51e12e82adca9893 |     
    arc      |     graphicsmagick-1.3.37      | NOK | http://autobuild.buildroot.net/results/70a5aed69aea0837e4e16c8d46af3e6fc4c499da |     
    mips     |     graphicsmagick-1.3.37      | NOK | http://autobuild.buildroot.net/results/0514ad46410dcad0aa8c5cc68afcec1072f66ad5 |     
  aarch64    |     graphicsmagick-1.3.37      | NOK | http://autobuild.buildroot.net/results/6f55b867f8171d1b61141995b84ddbefc8e528db |     
   nios2     |     graphicsmagick-1.3.37      | NOK | http://autobuild.buildroot.net/results/b54a438715e4313ab48d1b9cce6f4fcd9e548428 |     
    arc      | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/1ecad668b0997cb555824c19feaa04f5ccbc84eb |     
    i686     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/1e0170cf74297ac57c4ca91528d21bbaa430c5b0 |     
   sparc     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/2ea964f184d50822465784cafd636332e42bb081 |     
 powerpc64   | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/11b9d09b7aabbcfcbbc711594f20314217dff02b |     
   armeb     |          kexec-2.0.23          | NOK | http://autobuild.buildroot.net/results/e55f6a60d6b1ad2faaeda38d77468620ae77acbc | ORPH
    arc      |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/fd89f78b6b42b0f331e5a812f82b6b855d1228df |     
   mipsel    |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/c6a3bdd9dfdb67c550aa86c71353ea119a9f5e19 | ORPH
    m68k     |              mawk              | TIM | http://autobuild.buildroot.net/results/e19457ebc29d9f75e96e7307a8124afffdf89a3e |     
   x86_64    |         mesa3d-21.3.8          | NOK | http://autobuild.buildroot.net/results/149d33e8f07de4c09189f3ac2ae23ccaca2f426b |     
  aarch64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/667a47f295336d6153888bf29d8bced39d0f245c |     
    mips     |           ola-0.10.8           | NOK | http://autobuild.buildroot.net/results/a0d9288de0be4513645eec31c6f21ab50d9626db |     
  riscv64    |            opensbi             | NOK | http://autobuild.buildroot.net/results/0c7a4692a31ac781ffa1c23508a92c90c6c562a9 |     
   sparc     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/e83cd777a431afad272ab5dd07c55af54022a7c2 |     
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/61c49a1afac62e296145494f249c0f1b0194b6a2 |     
    sh4      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/c3581fb29eb334b48d165025564dd5f17e10c3af |     
   x86_64    |          rsync-3.2.5           | NOK | http://autobuild.buildroot.net/results/9d560a07779017092186fa6922a33ceb3bc1bc8f | ORPH
 aarch64_be  | rtl8821au-4235b0ec7d7220a63... | NOK | http://autobuild.buildroot.net/results/526809d1bae538e7761c82aac410da56876e5ae7 |     
    arc      |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/8a4d9465010baedfce74593dfa180d96cca57235 |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/59e54536b9ef79a9e3fa537dc13096cf5513284e |     
 powerpc64   |            xenomai             | NOK | http://autobuild.buildroot.net/results/37e82e72dbd3f0bf54a6b2e2716c82616a2eb5a3 |     
   armeb     |            xenomai             | NOK | http://autobuild.buildroot.net/results/ca8b1c7d697cfbc4ce140ab40bf0413d98a4dd1d |     
  mips64el   |        xfsprogs-5.14.2         | NOK | http://autobuild.buildroot.net/results/5830995111ada31189f9ad029338559b32ef40b2 | ORPH


Gitlab CI results for 2022-09-19
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
      TestClangCompilerRT | https://gitlab.com/buildroot.org/buildroot/-/jobs/3046457156  | ORPH 
...ioDracutGlibcMergedUsr | https://gitlab.com/buildroot.org/buildroot/-/jobs/3046457066  | ORPH 
...pioDracutMuslMergedUsr | https://gitlab.com/buildroot.org/buildroot/-/jobs/3046457068  | ORPH 
...oDracutUclibcMergedUsr | https://gitlab.com/buildroot.org/buildroot/-/jobs/3046457072  | ORPH 
        TestDockerCompose | https://gitlab.com/buildroot.org/buildroot/-/jobs/3046457160  | ORPH 
                 TestEdk2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3046456988  | ORPH 
                 TestExt2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3046457075  | ORPH 
...lx60UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3046458106  | ORPH 
...Xtensalx60UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3046458107  | ORPH 
   TestGdbHostGdbTarget9x | https://gitlab.com/buildroot.org/buildroot/-/jobs/3046457172  | ORPH 
   TestGdbHostGdbserver9x | https://gitlab.com/buildroot.org/buildroot/-/jobs/3046457176  | ORPH 
        TestGdbHostOnly9x | https://gitlab.com/buildroot.org/buildroot/-/jobs/3046457182  | ORPH 
       TestGrubAArch64EFI | https://gitlab.com/buildroot.org/buildroot/-/jobs/3046456989  | ORPH 
               TestOctave | https://gitlab.com/buildroot.org/buildroot/-/jobs/3046457394  | ORPH 
              TestOpenJdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3046457399  | ORPH 
         TestPhpLuaLuajit | https://gitlab.com/buildroot.org/buildroot/-/jobs/3046457470  | ORPH 
      TestPythonPy3Smmap2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3046457765  | ORPH 
       TestPythonPy3rtoml | https://gitlab.com/buildroot.org/buildroot/-/jobs/3046457759  | ORPH 
                 TestRust | https://gitlab.com/buildroot.org/buildroot/-/jobs/3046457785  | ORPH 
              TestRustBin | https://gitlab.com/buildroot.org/buildroot/-/jobs/3046457788  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

