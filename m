Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABB7FC6379F
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 07:38:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 170E460B23;
	Tue, 21 Feb 2023 07:38:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 170E460B23
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7fJDHoue9EKI; Tue, 21 Feb 2023 07:38:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D98E60B8C;
	Tue, 21 Feb 2023 07:38:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D98E60B8C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B81A21BF2EF
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 07:38:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 84D8442A6B
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 07:38:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 84D8442A6B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2W5-Ljh_VQTE for <buildroot@lists.busybox.net>;
 Tue, 21 Feb 2023 07:38:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C32641D47
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5C32641D47
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 07:38:37 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6B1BD1C000D
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 07:38:34 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Tue, 21 Feb 2023 07:38:34 -0000
Message-Id: <20230221073840.84D8442A6B@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1676965114; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Uea2DoWCGEQnUGXQzeu6SkXh4CNOQ8vHtSuyv3da4QE=;
 b=pRKOlZ0Gtrg1Ncb/5YucD2rGW5PU3rJG9Yj8od+kVTFQfVUejTD8cqtsc5cv1+ccKj63/m
 oGX3GOeMfWIxE31Zpxgu+E1XOKzu3rBDNchqflWRzS7hQ+xO6Y/rAt5jdAxUxTCDlYKauw
 be2rko+svpNRzUBzVqY0NYRbgdhSxGcTvyuZdFzMAnFQKcir+UezcywNYpYUGz1Va4r5MP
 Zr1uLXybcvK1oKEtw7+21mIR4IcHk726Q0s0X4aSRbW1OCOJ+IOew7mKpFdD7eLvmy1uNS
 krRjxbe1JH5g7AoIQEQkR/sMPmKehUlpeyn7474Lowtk9TexxBF0APcHCrgQxw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=pRKOlZ0G
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-02-20
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

Autobuild statistics for 2023-02-20
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.11.x  | 13  | 12  |  0  | 25  |
    master   | 153 | 139 |  2  | 294 |
     next    |  2  |  0  |  0  |  2  |

Classification of failures by reason for master
-----------------------------------------------

  gobject-introspection-1.72.0 | 8 
              host-pahole-1.24 | 7 
                  linux-6.1.11 | 7 
                       unknown | 7 
            host-binutils-2.38 | 5 
                host-go-1.19.6 | 5 
                elfutils-0.186 | 4 
                speechd-0.11.4 | 4 
                busybox-1.36.0 | 3 
glibc-2.36-81-g4f4d7a13edfd... | 3 
            host-binutils-2.37 | 3 
         host-libarchive-3.6.2 | 3 
              host-rust-1.67.0 | 3 
              libgcrypt-1.10.1 | 3 
               libglib2-2.72.3 | 3 
                 systemd-252.4 | 3 
                    brltty-6.5 | 2 
               fftw-quad-3.3.8 | 2 
             fontconfig-2.13.1 | 2 
       freeradius-client-1.1.7 | 2 
                gerbera-1.10.0 | 2 
         gobject-introspection | 2 
            host-binutils-2.39 | 2 
                  netsurf-3.10 | 2 
                    olsr-0.9.8 | 2 
           python-numpy-1.23.5 | 2 
               valgrind-3.19.0 | 2 
               xfsprogs-5.14.2 | 2 
                  zabbix-6.2.7 | 2 
                  acpid-2.0.34 | 1 
android-tools-4.2.2+git2013... | 1 
                  boost-1.80.0 | 1 
            btrfs-progs-5.16.2 | 1 
             containerd-1.6.16 | 1 
             docker-cli-23.0.0 | 1 
                 fdk-aac-2.0.2 | 1 
                    flac-1.4.2 | 1 
              fluent-bit-2.0.9 | 1 
fs/ubi/ubi.mk:51: /home/bui... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
              fstrcmp-0.7.D001 | 1 
 glslsandbox-player-2021.08.24 | 1 
                   gvfs-1.48.1 | 1 
         host-gcc-final-11.3.0 | 1 
         host-gcc-final-12.2.0 | 1 
         libcpprestsdk-2.10.18 | 1 
             libgpg-error-1.46 | 1 
                  libjxl-0.7.0 | 1 
                 libnss-3.88.1 | 1 
          linux-5.10.162-cip24 | 1 
     linux-5.10.162-cip24-rt10 | 1 
             lirc-tools-0.10.2 | 1 
        ltp-testsuite-20220930 | 1 
         multipath-tools-0.9.4 | 1 
                    mutt-2.2.9 | 1 
                  ntp-4.2.8p15 | 1 
           optee-client-3.19.0 | 1 
                    opus-1.3.1 | 1 
                   perl-5.36.0 | 1 
                     php-8.2.3 | 1 
                    pixz-1.0.7 | 1 
                    qemu-7.2.0 | 1 
            quickjs-2021-03-27 | 1 
                    ruby-3.1.3 | 1 
                 syslinux-6.03 | 1 
                 uclibc-1.0.42 | 1 
ulog-0389d243352255f6182326... | 1 
uqmi-0a19b5b77140465c29e2af... | 1 
                 wolfssl-5.5.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          acpid-2.0.34          | NOK | http://autobuild.buildroot.net/results/e3180b157da82a873e26d82a214bf45209a1e3b8 | ORPH
powerpc64le  | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/4cbc60e95e38bbb1d0c5d4ecc504e5da8ae22af4 |     
   arceb     |          boost-1.80.0          | NOK | http://autobuild.buildroot.net/results/4cf51b37c785eed8f5e950fe26e79e8fb20c8566 |     
 microblaze  |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/2529778cc04100e9b901323808d3274ea83bd4f8 |     
 microblaze  |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/d496753fa4e5f47dec317b1b81c098bdbbae0238 |     
    or1k     |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/893288c3b7ab58a8d15e1f96ee30ae19d2e8312a | ORPH
  mips64el   |         busybox-1.36.0         | NOK | http://autobuild.buildroot.net/results/a67bbd05aa05e926512a58f5e534635b73c4d03a | ORPH
   mips64    |         busybox-1.36.0         | NOK | http://autobuild.buildroot.net/results/3ad70dc07bbae130b74bf699e249cbf116d81010 | ORPH
    arm      |         busybox-1.36.0         | NOK | http://autobuild.buildroot.net/results/6ed313724af39600c19e639e7ae7aeb60109828a | ORPH
    arm      |       containerd-1.6.16        | NOK | http://autobuild.buildroot.net/results/8cae16a62a81d9ea998a1248bb377d129db33ea5 |     
   x86_64    |       docker-cli-23.0.0        | NOK | http://autobuild.buildroot.net/results/c8be4259dd17753f79eee10c36a3f5f80b7672fc |     
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/1ee3401edeae9430303ffdea35bfbea5921a2b3d | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/62ad9d9e29485e57df6fccdb55e736f984dd4ae5 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/77f471b242682c7af39d5c42becd1ba03f67e68e | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/d10e2fb80131f6358d297dff596ab6141c28c603 | ORPH
   x86_64    |         fdk-aac-2.0.2          | NOK | http://autobuild.buildroot.net/results/8ec43c2db6dd7f308bcf02bec4e12ab33632e3f5 |     
powerpc64le  |        fftw-quad-3.3.8         | NOK | http://autobuild.buildroot.net/results/e5524c2e43dbb7fe5f517b553e18e55927fdde5f | ORPH
powerpc64le  |        fftw-quad-3.3.8         | NOK | http://autobuild.buildroot.net/results/1d9c3980b45c0d8d1bd3880983e83893e5e54a53 | ORPH
    sh4a     |           flac-1.4.2           | NOK | http://autobuild.buildroot.net/results/7d426e2650e409ca73cf289b4d7dab7dcbf214e3 |     
   xtensa    |        fluent-bit-2.0.9        | NOK | http://autobuild.buildroot.net/results/4b0f90d79d6dbbf976acf1da839260b0ee94ddda |     
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/cb5a21a6f5bf39e09919c4ec915d5aa6480f7aa9 | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/21ac1bdc72848aeaefe85fff95700f1c761a65f5 | ORPH
  riscv64    |    freeradius-client-1.1.7     | NOK | http://autobuild.buildroot.net/results/22d258b0b35ce5cea180d392c4259d2a85dd5d17 |     
  riscv64    |    freeradius-client-1.1.7     | NOK | http://autobuild.buildroot.net/results/b11001f71bed7b5ea58f8b70f7539b4f4ee32a0f |     
    mips     | fs/ubi/ubi.mk:51: /home/bui... | NOK | http://autobuild.buildroot.net/results/a70b5a8fbac22269ac5d21ee10542131214b5ff8 |     
   s390x     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/6480b3aef0e0aa2adea1da0d35f3573c9d6b2f16 |     
 microblaze  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/af49f968088530b66082641464d5b2df7b5ec63e |     
powerpc64le  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/e60048d62b7ac4c5651cf98c7842840f6db765b3 |     
    or1k     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/33e2b14f31d1faf1b41df11db113a5c3fb347924 |     
    or1k     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/e5c0bc96e2b8c7fa9b50096b0021c92f62753019 |     
   armeb     |        fstrcmp-0.7.D001        | NOK | http://autobuild.buildroot.net/results/56dda0c224c04d68747cfc4c2045165fc2bc2d71 |     
 aarch64_be  |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/0c9cc1d43daccd21b16de1ea21322c7b1e9a1bbd |     
powerpc64le  |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/22275e769ac373961971fb44695d645d7687f123 |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/fa8e220621a2ac472346fa14ad9a7006a1274b8d |     
 powerpc64   | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/3ed5e504e7f994b1e103e9fa6a8b324126eff5f7 |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/2aec85e60080e8abcb0200bf2b60807f35eba2bf |     
  aarch64    | glslsandbox-player-2021.08.24  | NOK | http://autobuild.buildroot.net/results/ac765b0ff5f914df4087ae4691fe711dc912f03b |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/9303b861da97521c25bd2898ea044f37c01ad5bf |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/3bead068b84e8a40077c8bef57d90a5ab47a18c2 |     
 microblaze  |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/358bc905ee73e70dd41a1347174577c905bd82a0 | ORPH
   s390x     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/86adfc65a263e02ebf1f9acf75574c7c1f212dfd | ORPH
powerpc64le  |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/4657f21099bfa7d52dcec08dc09d8bf6b74fa34b | ORPH
    or1k     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/fab352ec1be76fca9b4133ab58b109a56a75ceb3 | ORPH
microblazeel |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/55df3b1bc4aed899f9bf673045f633f0e27a05ec | ORPH
 microblaze  |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/1d7775d5538c765d23bf5619219739679824e3ab | ORPH
   mipsel    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/60cd771ca50accf6cf19f66226c42a9edb7930f1 | ORPH
    i686     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/f2a649a36e9cc5a27dc1a5bfd7af85e703e282c8 | ORPH
   x86_64    |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/98dc4b415115cca65b53e4cd986144ef85bf17ad | ORPH
   mips64    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/86b4f7b620c5ed46a94f2835d4f1f142717db952 |     
  mips64el   |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/7c53e187e2b87ca0262f55a54cc110de9f1e247d |     
   armeb     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/8d95190345d3072345cad2bf4c87faee33c9e302 |     
    mips     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/aa8912eb231b5810fb89323c19e82230ec3b6cbb |     
   s390x     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/3e6534f937518ff34f0bc92c0355661db86fc81f |     
    or1k     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/b56524f4bd95d1726140c0330de87bc10d37e4d1 |     
   s390x     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/7b34fe3de9396d6d721e88e1c35f2a1a1d2e5dc3 |     
    arm      |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/effb52b4257096c107997ddc172801894bdc6aa4 |     
  riscv32    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/42c3383a825966d9cb0944149313cf20f5ed8169 |     
   xtensa    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/5bc22eda781d23e4e0dc574d3f7eba6a2fa81381 |     
microblazeel |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/ee7821580f8cc59cd1d4992eafcc8de43e7a9668 |     
   armeb     |     host-gcc-final-12.2.0      | NOK | http://autobuild.buildroot.net/results/e6ceec6b459b37ffbbb277355986e9ec549cc786 |     
    i686     |         host-go-1.19.6         | NOK | http://autobuild.buildroot.net/results/9612b79f94fae7160b67f349b9b7bca93b1c9b61 |     
    i686     |         host-go-1.19.6         | NOK | http://autobuild.buildroot.net/results/402c0e7d55677602b81cba7b7b7e478f643b9314 |     
    i686     |         host-go-1.19.6         | NOK | http://autobuild.buildroot.net/results/57b236ce192b2879786b5140364d836dfc4a0b4f |     
   mips64    |         host-go-1.19.6         | NOK | http://autobuild.buildroot.net/results/a4c4c3e20c4ac313ef3ddcb6e7847ca4a1bacb4c |     
  mips64el   |         host-go-1.19.6         | NOK | http://autobuild.buildroot.net/results/4a3b0e8239d3a7a150cc3ed6169176ee78366e21 |     
   mips64    |     host-libarchive-3.6.2      | NOK | http://autobuild.buildroot.net/results/ee687375ebd7cc912378664308c46a0f83b6c335 |     
    arc      |     host-libarchive-3.6.2      | NOK | http://autobuild.buildroot.net/results/11868e9bc4916843a7fc76f7b5e4c251f89e33dc |     
  riscv32    |     host-libarchive-3.6.2      | NOK | http://autobuild.buildroot.net/results/bed12b7f41bb42b009b366a6e7de87ba543f7c9f |     
   sh4eb     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/23c8297c18d5e2c9375e001b4264bae290e82309 |     
    arm      |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/eddbeedc7249a9ea6943c4078f190de891bc356a |     
    or1k     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/94d07202bbb84cbde0eb8cc6debd7c9bcdd666f5 |     
    mips     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/0d41179361f2cdde07ef8d9b0df58e167ba54155 |     
   mipsel    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/a385950474714b5adb117f9b1151fab5c9b16542 |     
    i686     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/1797d9e956d5fdbcb847399b54939b4bb244c17d |     
   armeb     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/5defc47a6efca1e061642868663f36c2f81e1e57 |     
   x86_64    |        host-rust-1.67.0        | NOK | http://autobuild.buildroot.net/results/b6a153fc8319e6454d4b7d042c38fa9334ca40d9 |     
    mips     |        host-rust-1.67.0        | NOK | http://autobuild.buildroot.net/results/a13012dc03256c45aa3f7f69b96d14c86d0f2dd4 |     
   x86_64    |        host-rust-1.67.0        | NOK | http://autobuild.buildroot.net/results/a90f58bcf2cf05bdd6917def8fb01ceba1f7cf8e |     
    arc      |     libcpprestsdk-2.10.18      | NOK | http://autobuild.buildroot.net/results/e6778e60cc1ea455f5b4511d5824f04d8040f67b | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/7fa10c8b2d0e48641e247b457f76de88a5c2e127 | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/ecb0c243ac4766acc39af8d286c36486837318e1 | ORPH
    i586     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/1cbbc0b4bcbf86170ee797a55226002e2e631785 | ORPH
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/31291a8707f6fb0c8567fe73e136059062f92d8b |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/ef1a0ff1a9d4b060cf0e259144befd42979e093f |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/a5cbff35ed4b5d6b74cdf2ac7173d8be571a4401 |     
  aarch64    |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/7d26d0f05815c529d4d7ebd1de1e7019484d8eef | ORPH
    arc      |          libjxl-0.7.0          | NOK | http://autobuild.buildroot.net/results/9893a0da313e77a47550595b71befcece76bb206 |     
   mipsel    |         libnss-3.88.1          | NOK | http://autobuild.buildroot.net/results/26871866e8f2b4a79ef32c114ac5295a3b4d7762 |     
   s390x     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/a4d183f54ab5d149613f6ad432331b2a4db4b94c | ORPH
  mips64el   |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/248fca028f60e7659d1f66b635eb071f162995ef | ORPH
    mips     |          linux-6.1.11          | NOK | http://autobuild.buildroot.net/results/b5aa7990927abc9fcaed9e23506950c6b550d71c | ORPH
   mips64    |          linux-6.1.11          | NOK | http://autobuild.buildroot.net/results/4af79f7293316522f49137ffd44a62585780d3ab | ORPH
    sh4a     |          linux-6.1.11          | NOK | http://autobuild.buildroot.net/results/dab96083e4de1fc5f3e63900aaf2e2bd20d80e87 | ORPH
    m68k     |          linux-6.1.11          | NOK | http://autobuild.buildroot.net/results/8f6c7cf4636ef5149b210c0de8a8766876d6e3d2 | ORPH
    m68k     |          linux-6.1.11          | NOK | http://autobuild.buildroot.net/results/7f3c829796e55eee4b64fb2c2e8dc4c0ae01df1e | ORPH
    i686     |          linux-6.1.11          | NOK | http://autobuild.buildroot.net/results/a9522c0e9bfa4a23f31573c3fb43939b54fa79ff | ORPH
   mips64    |          linux-6.1.11          | NOK | http://autobuild.buildroot.net/results/41e178fa6b4c03a69c986207741c315cb9255e50 | ORPH
  sparc64    |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/8d0d603a04380b2305fdce4295df42e426e05368 | ORPH
   s390x     |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/0f21f69e11fb52b320de306c69b8844ed90417ec |     
 aarch64_be  |     multipath-tools-0.9.4      | NOK | http://autobuild.buildroot.net/results/e8542b8a733b23450a697d67fbb40042e4dfd4ed |     
powerpc64le  |           mutt-2.2.9           | NOK | http://autobuild.buildroot.net/results/4291c582a750a7bd794f1d862f67a7d624165c3e |     
   mips64    |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/d47cad90021082b972bbaa597078ffa31cf5456a |     
 powerpc64   |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/94d5b30d7d297813828d4476d20ea6c926d8f8be |     
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/72ab327ea556ffab1997db5d8089a913f34103f1 | ORPH
powerpc64le  |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/e5354c926b61d4f3dd9170bf019c24a74166cf06 | ORPH
    arc      |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/d34acbc52c200a0b76ad8e2f8f8f5d4f83264883 | ORPH
   arceb     |      optee-client-3.19.0       | NOK | http://autobuild.buildroot.net/results/ba922e5d5afc1a8e96dbe1c814495dd26fdddf36 |     
   armeb     |           opus-1.3.1           | NOK | http://autobuild.buildroot.net/results/9966147849708b47df5137b88c319c01961b2c7c | ORPH
    arc      |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/8c190f0a7ee54a45c79b925087d16a2b6f0687a7 |     
 microblaze  |           php-8.2.3            | NOK | http://autobuild.buildroot.net/results/93ccccd233cf83aadce01bf8171317bfe8be492d |     
    arc      |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/52efcad081d94e9800723bc5bac52a0f1f8c3f76 |     
    i686     |      python-numpy-1.23.5       | NOK | http://autobuild.buildroot.net/results/20ce30249942f92ba17c40a27867f7c128fe59a1 |     
    sh4      |      python-numpy-1.23.5       | NOK | http://autobuild.buildroot.net/results/6601739b21ae44c8d685affc2524e14fd9d110f8 |     
  riscv32    |           qemu-7.2.0           | NOK | http://autobuild.buildroot.net/results/9b3a4007a776dec173ed6347167f9971ac8843e9 |     
    sh4a     |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/71a29398d5dffa04a01b495e95fd7121b1803c4e |     
    sh4      |           ruby-3.1.3           | NOK | http://autobuild.buildroot.net/results/5eaac7cb81a496fdc3432a31d6786561bd3776f1 |     
   x86_64    |         speechd-0.11.4         | NOK | http://autobuild.buildroot.net/results/b91c6f19cceccf064a90e27d7ca082e3b82cc6d0 |     
  sparc64    |         speechd-0.11.4         | NOK | http://autobuild.buildroot.net/results/583306d5210ab35da1400a8b9b56e9d3e066a64b |     
   nios2     |         speechd-0.11.4         | NOK | http://autobuild.buildroot.net/results/cc1817efb4a5d54ffd2e7ac2f4fc773535f70972 |     
  sparc64    |         speechd-0.11.4         | NOK | http://autobuild.buildroot.net/results/215507ff5cfc779ad095156b384bf45cb84b8461 |     
    i586     |         syslinux-6.03          | NOK | http://autobuild.buildroot.net/results/de88089888b2ca354b28af3550abf846560da7d5 | ORPH
   mipsel    |         systemd-252.4          | NOK | http://autobuild.buildroot.net/results/5cfb6c51fe8da507fd547c15170169d84ee36abd |     
   sh4aeb    |         systemd-252.4          | NOK | http://autobuild.buildroot.net/results/be2198865ad16d565816590768948910a9f612f9 |     
   s390x     |         systemd-252.4          | NOK | http://autobuild.buildroot.net/results/dfc23dfa90556becd4c882e893a0f72f78574c7c |     
  riscv64    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/40315d6915c1d72144da8f9c10d73587eae6b21c |     
  aarch64    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/ff50155db80ac1c57034b23dd994f701a0fea8bb |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/f64ce692967cf043fe8dbd82e789ccb8b4d86901 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/f8b3abd256ff40d04aed63c5676ab54b31cf4b68 |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/634e1da40c275bcf51e9d8bbd48e96c0f074c223 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/7f868232e74ed44c11a8662e53568607531f742a |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/ade13ceb9b7d88105be2b292c49a31f6a8647a9b |     
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.net/results/3ce8c243b77bed8c69475a5f293d8fe24beaa310 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/b8f0df18ae70a2b511441f44dd5fc939c0a71b55 |     
   x86_64    | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/e991e633e9f4bc2b074dab07a500c735120aecff | ORPH
  powerpc    |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/38015111b9d410840eb1c19f4c2ea7748160feb8 | ORPH
    i686     |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/a9c418e1bfea6d0fe797d252ed104c8945d7a3d8 | ORPH
   mips64    |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/ab27cb2c835b9325c061c6ee50234ccfa6839c02 |     
   mips64    |        xfsprogs-5.14.2         | NOK | http://autobuild.buildroot.net/results/dc6bd721bcc2b59581bb49d10e0c404d8ea5da46 | ORPH
   mipsel    |        xfsprogs-5.14.2         | NOK | http://autobuild.buildroot.net/results/35fc9dfe97e2d9dd8a0fefea51882e97c308742d | ORPH
   mips64    |          zabbix-6.2.7          | NOK | http://autobuild.buildroot.net/results/bc4fc8ff640aa538e1ec70485d47e3ea3d606d8a |     
   mips64    |          zabbix-6.2.7          | NOK | http://autobuild.buildroot.net/results/5bc66df6a7dd22cbafd4749ee1626113af6cf6e5 |     


Classification of failures by reason for 2022.11.x
--------------------------------------------------

                  netsurf-3.10 | 2 
                  xxhash-0.8.1 | 2 
               collectd-5.12.0 | 1 
                 coreutils-9.1 | 1 
              dieharder-3.31.1 | 1 
  gobject-introspection-1.72.0 | 1 
          linux-5.10.145-cip17 | 1 
                    mutt-2.2.9 | 1 
                       unknown | 1 
                  zabbix-5.4.9 | 1 


Detail of failures for 2022.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |        collectd-5.12.0         | NOK | http://autobuild.buildroot.net/results/64543c5e5a1abdcbeeb09aa53b30d0c2aa390f62 |     
    sh4      |         coreutils-9.1          | NOK | http://autobuild.buildroot.net/results/ab4e284f4d67e22ea0d02505829e970b605fd7ae | ORPH
 microblaze  |        dieharder-3.31.1        | NOK | http://autobuild.buildroot.net/results/8ab826577b203ae89559d427b6aa1611540342aa |     
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/117a607f0cba5827e7cccb185a7a6e9603b20efd | ORPH
    m68k     |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/35e256ea6d48f9f35363fee3f924c541d49b1d31 | ORPH
    i686     |           mutt-2.2.9           | NOK | http://autobuild.buildroot.net/results/2ff1b2d4a5ef54d47b03a50fe0785dd3d9679fbc |     
   s390x     |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/c9ee089b3fe01158a7b3e65724696f6a18767ff8 |     
    arc      |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/534ce0af5a26d52d145242a518cb4b71e2daf89a |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/7ce89193d8a00bb5f6d8abd60a274893acfc4053 |     
    or1k     |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/e79b34a1d7c058ebc0a0eb0982381ed71341a2b6 | ORPH
   mipsel    |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/cfc5eda527f53e9109572aefe1a84826c636126d | ORPH
  sparc64    |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/e71836f4cba58e791785ac73add1d282afc9fa21 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
