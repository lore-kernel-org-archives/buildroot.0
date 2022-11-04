Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ACFEC4332F
	for <buildroot@archiver.kernel.org>; Fri,  4 Nov 2022 07:39:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A9D74606C0;
	Fri,  4 Nov 2022 07:39:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9D74606C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CObMs134EYH4; Fri,  4 Nov 2022 07:39:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4418161038;
	Fri,  4 Nov 2022 07:39:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4418161038
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2F2511BF399
 for <buildroot@lists.busybox.net>; Fri,  4 Nov 2022 07:39:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0896261038
 for <buildroot@lists.busybox.net>; Fri,  4 Nov 2022 07:39:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0896261038
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sPKaWm_Uy4CV for <buildroot@lists.busybox.net>;
 Fri,  4 Nov 2022 07:39:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9BAA060D6E
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9BAA060D6E
 for <buildroot@buildroot.org>; Fri,  4 Nov 2022 07:39:31 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id AD899E0007
 for <buildroot@buildroot.org>; Fri,  4 Nov 2022 07:39:28 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Fri, 04 Nov 2022 07:39:28 -0000
Message-Id: <20221104073935.0896261038@smtp3.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1667547568; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=cXks1R5kErjIXFp7svk6aMHzB6Df90UgHallAfg6PPo=;
 b=daX7Pf0H9BnAuVK6HnU9p1POCL8TZz+DZIXNEqEvDPrFgvKrmS85qr4N74lbWVHaHYcEvB
 D8LltEjrm/jcNiT+Wyr/NX6GSwWOKH1fFSTMCw7MZqsyYgyhR/t2iNb1RlccX/uZ+PH+Lu
 tFzF5XRMox5iBetosZ1ZLLnudFjsvISQ5xlMXeZSj6ekKR3B0D+p6ZUAVLRNxhoAX9BFXR
 CexDoMfGDRWsjDu0sJWFGsQZ2O0nnW/QPfx6rst0pL7lrU5TcT/R5Q+Ac3kRc50WpjHsEY
 QwzR+1MIIMCb5YdF/FVUj2EkDKQEBakdD6HTZOlHR6Wr+dih287RGjqthS4Jdw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=daX7Pf0H
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-11-03
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

Autobuild statistics for 2022-11-03
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  1  |  1  |  0  |  2  |
  2022.08.x  | 12  | 11  |  0  | 23  |
    master   | 195 | 322 |  0  | 517 |
     next    |  0  |  1  |  0  |  1  |

Classification of failures by reason for master
-----------------------------------------------

                   libnss-3.84 | 31
          imagemagick-7.1.0-51 | 21
         s6-linux-init-1.0.6.3 | 17
glibc-2.36-66-ga1dc0be03c9d... | 14
                      xz-5.2.7 | 12
                 dash-0.5.11.5 | 11
  gobject-introspection-1.72.0 | 11
            host-binutils-2.38 | 11
                    lxc-4.0.12 | 8 
                      crun-1.5 | 7 
                   linux-6.0.1 | 7 
            host-binutils-2.39 | 6 
                host-go-1.19.3 | 5 
              host-rust-1.64.0 | 5 
                elfutils-0.186 | 4 
              traceroute-2.1.0 | 4 
              alsa-utils-1.2.8 | 3 
                  botan-2.19.2 | 3 
                gerbera-1.10.0 | 3 
                     gmp-6.2.1 | 3 
       host-gcc-initial-11.3.0 | 3 
               libcap-ng-0.8.3 | 3 
               libglib2-2.72.3 | 3 
                libkcapi-1.4.0 | 3 
                       unknown | 3 
               valgrind-3.19.0 | 3 
                 wolfssl-5.5.2 | 3 
                    brltty-6.5 | 2 
             fontconfig-2.13.1 | 2 
                  gensio-2.5.5 | 2 
               ipmitool-1_8_19 | 2 
              libgcrypt-1.10.1 | 2 
             libgpg-error-1.45 | 2 
          linux-5.10.145-cip17 | 2 
              memcached-1.6.16 | 2 
                  ntp-4.2.8p15 | 2 
                numactl-2.0.16 | 2 
            ocf-linux-20171122 | 2 
           python-numpy-1.23.4 | 2 
rtl8192eu-1e15b6d451731bc4d... | 2 
toolchain-external-codescap... | 2 
/home/buildroot/autobuild/i... | 1 
/home/buildroot/autobuild/i... | 1 
/home/buildroot/autobuild/i... | 1 
                  acpid-2.0.34 | 1 
                alsa-lib-1.2.8 | 1 
                    attr-2.5.1 | 1 
                  bcg729-1.1.1 | 1 
                   bdwgc-8.2.2 | 1 
                  bind-9.16.33 | 1 
             bluez5_utils-5.65 | 1 
                  check-0.15.2 | 1 
              containerd-1.6.8 | 1 
                  dbus-1.12.24 | 1 
              docopt-cpp-0.6.3 | 1 
              e2fsprogs-1.46.5 | 1 
                     efivar-38 | 1 
              erlang-22.3.4.22 | 1 
             f2fs-tools-1.15.0 | 1 
                   flann-1.9.2 | 1 
       freeradius-client-1.1.7 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/cramfs/cramfs.mk:46: /nv... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
                    gdal-3.5.1 | 1 
                       gsl-2.6 | 1 
gummiboot-2bcd919c681c952eb... | 1 
            host-autoconf-2.71 | 1 
             host-cmake-3.22.3 | 1 
              host-delve-1.8.0 | 1 
              host-expat-2.5.0 | 1 
         host-gcc-final-10.4.0 | 1 
         host-gcc-final-11.3.0 | 1 
         host-gcc-final-12.2.0 | 1 
host-gcc-final-arc-2020.09-... | 1 
host-gdb-arc-2020.09-releas... | 1 
              host-llvm-11.1.0 | 1 
                host-mpc-1.2.1 | 1 
              host-pahole-1.24 | 1 
           host-python3-3.10.8 | 1 
host-spirv-llvm-translator-... | 1 
            host-systemd-250.4 | 1 
            igh-ethercat-1.5.2 | 1 
                   json-c-0.16 | 1 
               libdeflate-1.12 | 1 
                    libev-4.33 | 1 
                libglvnd-1.4.0 | 1 
                 libidn2-2.3.4 | 1 
                   libnl-3.7.0 | 1 
                   libqb-2.0.6 | 1 
              libtommath-1.2.0 | 1 
              libunistring-1.1 | 1 
                linuxptp-3.1.1 | 1 
          lttng-modules-2.13.1 | 1 
            makedumpfile-1.7.2 | 1 
mali-driver-3d697de9bce8bc6... | 1 
                  mender-3.4.0 | 1 
                    musl-1.2.3 | 1 
                   ncurses-6.1 | 1 
                  netsurf-3.10 | 1 
              open62541-v1.3.3 | 1 
                 openal-1.22.0 | 1 
               openblas-0.3.21 | 1 
               openpgm-5-3-128 | 1 
                 openssh-9.1p1 | 1 
                    opus-1.3.1 | 1 
                      pigz-2.7 | 1 
              procps-ng-3.3.17 | 1 
           proxychains-ng-4.16 | 1 
                    putty-0.76 | 1 
                     pv-1.6.20 | 1 
                    qemu-7.1.0 | 1 
qt5base-2ffb7ad8a1079a0444b... | 1 
                  reaver-1.6.6 | 1 
rtl8189es-39c17661136da48f8... | 1 
rtl8821au-4235b0ec7d7220a63... | 1 
                 sudo-1.9.11p2 | 1 
                 systemd-250.4 | 1 
                tealdeer-1.6.1 | 1 
                 uclibc-1.0.42 | 1 
uclibc-ng-test-6790eafe897b... | 1 
ulog-0389d243352255f6182326... | 1 
uqmi-0a19b5b77140465c29e2af... | 1 
                  zabbix-5.4.9 | 1 
                 zlib-ng-2.0.6 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/aa0696e22f54531b096a348b61fbc0217a3f9f03 |     
  aarch64    | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/d667848ede98ed3d6bbae8c733c6b18822432098 |     
   sparc     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/96d88379cdc34032122dfef4ec7442ef4585ebac |     
  mips64el   |          acpid-2.0.34          | NOK | http://autobuild.buildroot.net/results/2bc99b2b31457f7f1483e2759d6d9bf4b9b6a7c9 | ORPH
    or1k     |         alsa-lib-1.2.8         | NOK | http://autobuild.buildroot.net/results/3bb9c1db16ae7b6082026a9c2d994155e28c1b9a |     
   x86_64    |        alsa-utils-1.2.8        | NOK | http://autobuild.buildroot.net/results/fc7e98a242a379fb9d4056aad747d2dc51f213fd |     
   arceb     |        alsa-utils-1.2.8        | NOK | http://autobuild.buildroot.net/results/9f15f7679f89f9b581650d3a16538c6f373c8afd |     
    i686     |        alsa-utils-1.2.8        | NOK | http://autobuild.buildroot.net/results/a34472d02c408150cf907658c8f79e895eeacf3f |     
  aarch64    |           attr-2.5.1           | NOK | http://autobuild.buildroot.net/results/18e66b2fab7d2f21172d7af0f4bef64612df6489 |     
  riscv64    |          bcg729-1.1.1          | NOK | http://autobuild.buildroot.net/results/f952ee70665a05f37b532289114cc49df2df9866 |     
  riscv64    |          bdwgc-8.2.2           | NOK | http://autobuild.buildroot.net/results/51ce4c5afa06d861ea2018103ca49689173d3ee8 |     
powerpc64le  |          bind-9.16.33          | NOK | http://autobuild.buildroot.net/results/8e8ab674442eca0f52d48ce42f9653688164211b | ORPH
   sh4aeb    |       bluez5_utils-5.65        | NOK | http://autobuild.buildroot.net/results/1bf1940aadab0fc5c25341186320d368dff9d974 |     
  sparc64    |          botan-2.19.2          | NOK | http://autobuild.buildroot.net/results/dc14936ad06c4a2cf6dc49648addabab99133325 | ORPH
    i686     |          botan-2.19.2          | NOK | http://autobuild.buildroot.net/results/64454ba211363b4dfb93a8de896146f479cf9306 | ORPH
   mips64    |          botan-2.19.2          | NOK | http://autobuild.buildroot.net/results/0a1d6eddc201cf60c6bb5abcdc95625e2d932dc7 | ORPH
    mips     |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/e364d287a0acc22a74f40bf4e5ef33bcfc429a58 |     
    mips     |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/16f63cc0a039845c4b605059b56f077d64317d26 |     
    i686     |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/56b8b77eb5e36b430b5624381e1d96c13a218d95 | ORPH
   x86_64    |        containerd-1.6.8        | NOK | http://autobuild.buildroot.net/results/7fd852fd706f81816780a6b9063764b0e4eb1b60 |     
  aarch64    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/4623e8d19049a638cb83d5768acb32e939279736 |     
   arceb     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/e8a8e848e8a96a8c9f9d851e9178587c487f2ac5 |     
 aarch64_be  |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/b6acfb229a301f18565bc9fc94ca31c9a1103a01 |     
    arc      |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/e495f879330fca084dd71ec9834ff8f1cfb79fb0 |     
   arceb     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/4d9fac9edbd78fa09269e30505a6043186e475d2 |     
   sparc     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/ab763234e6b7ebd56852c49557f4d3762558fb74 |     
   armeb     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/10e817b20705de24d96259788ab70b82643ef3e3 |     
   x86_64    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/d421b6e8edf3a74d8209ce5fa4599684176141b6 | ORPH
   mipsel    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/7ad04f79029ca73103ed950fee6beb18e0e654f3 | ORPH
    sh4a     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/b3e90f1661f9bd14e38dcaf1b572f6b8eaa01cc6 | ORPH
   x86_64    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/20242ddf0b574b82696d5af4c38e4f07ed513719 | ORPH
   mipsel    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/02a137c0938ca5261f7b9d6dc5c7bcc11d8c7744 | ORPH
   sh4eb     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/d87798b16d8790deacb7b25cf2bf862adfde37d7 | ORPH
   mips64    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/f0996fdcda909ce66c7fda1d5a3fcb43df7f4690 | ORPH
   mips64    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/e34c47cec00e588056c1201293bb448ec16e7559 | ORPH
   x86_64    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/cee431a64589d7212451d0ff06745aa23581e317 | ORPH
    or1k     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/b6c2db90ed3bc15ce934cf6cd19b723a52e778a4 | ORPH
   sparc     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/fb994d42bed46d1f762f0139eaef07d9745769ad | ORPH
   s390x     |          dbus-1.12.24          | NOK | http://autobuild.buildroot.net/results/ff758cf1806bf719ab2681251de2d2677b26d189 | ORPH
  riscv64    |        docopt-cpp-0.6.3        | NOK | http://autobuild.buildroot.net/results/834a0209c8165b3208ebf8654cb6cf8e3568b671 |     
    or1k     |        e2fsprogs-1.46.5        | NOK | http://autobuild.buildroot.net/results/b81573ebc9c4edada4f94bf15b276aa883d3e915 | ORPH
  mips64el   |           efivar-38            | NOK | http://autobuild.buildroot.net/results/c2cab25bbf746c83146f3f2890fe74165af82737 |     
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/019d51dd565462b78fc24fceea5fdd27a833c9de | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/bc981d48c663ba264fb8b5b2c67cb26817c50ede | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/c4028961723aad63c3eb3b6eab4ce0cbe3e6733b | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/d8e5974fb9a3a80ded2e79672bb0b368dd07ac05 | ORPH
  sparc64    |        erlang-22.3.4.22        | NOK | http://autobuild.buildroot.net/results/938b2b307725210746b2f24baab7cdd3b2017be5 |     
    or1k     |       f2fs-tools-1.15.0        | NOK | http://autobuild.buildroot.net/results/a7ff65afb449f27c22dbd03310268ca673dc39ec |     
    or1k     |          flann-1.9.2           | NOK | http://autobuild.buildroot.net/results/f8602d2c99c8aa8fbe5cab329db1a64bbc0d851c |     
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/5fb3f7f910a6948cd3db7661e453cb40616e487d | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/2f5396a7e5628bc39f9a036af92062d8d8d033b9 | ORPH
  riscv64    |    freeradius-client-1.1.7     | NOK | http://autobuild.buildroot.net/results/404617e3217ce9095375b73911a0d69dc872e345 |     
   s390x     | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/ab38b27a83ab98c22b62b5404abe99ea8a2a2eb1 |     
   s390x     | fs/cramfs/cramfs.mk:46: /nv... | NOK | http://autobuild.buildroot.net/results/3e3f2e350b1ce2450df30a50f85f1791ecf5afbb |     
 aarch64_be  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/fcdb436fcfa2bd0917d13a390289c8af962c7dd7 |     
  riscv32    | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/422a6b5a1b192af1f2f12c85a373175236c5d7cc |     
  aarch64    | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/62395ba95c21339b3d83c55d9567b76a498ce655 |     
    or1k     | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/678a5d2de02065d85dfe2aea95bc4e47419da1b6 |     
    or1k     |           gdal-3.5.1           | NOK | http://autobuild.buildroot.net/results/eb18ad063bfc4d47699d75e577b93be55da58aed |     
   x86_64    |          gensio-2.5.5          | NOK | http://autobuild.buildroot.net/results/f4c1058025a716ea5fbfe1f2cc89e8634ddb35f2 |     
   mips64    |          gensio-2.5.5          | NOK | http://autobuild.buildroot.net/results/46ed180b7396ab74737a1349868d83e856e8bcbd |     
powerpc64le  |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/34974050d9539fd9154f9f853aa5489ad782270f |     
   s390x     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/c9f09514fb4a506e626afee8e421a83e38aa72fd |     
powerpc64le  |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/7912be202414d0b0a4836257568536b39a2ae607 |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/d6009a128c198eebd1d8440cead413ec5cfa8048 |     
    mips     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/746d45da9e8f0107fcde501e793338b5984d622f |     
   sh4eb     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/e533b8c538f9622dff84c492ca2a5cf59a9979fb |     
   mipsel    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/5c6493d14b8baacbabc7e5770da1619afc5993ca |     
   nios2     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/8077244f300f8c3aceea4096fed9d07e03a6da4d |     
microblazeel | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/e1e9f06fa374b30b416f36ce417145f6983c9701 |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/fc50800697965c49f109cfe22c7f43232e109e69 |     
   nios2     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/18ab5053baf47ec09489c9cccb8b27f3c0e96984 |     
    i586     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/72ad15c8e3b8b7bf6f861d9fdb649a13ef0a539e |     
    mips     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/58b5899f38e8d9c9a296728269bd7561ea796730 |     
   mips64    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/50da2b7c3656af9c7be6ef251a48c35533869ea1 |     
 microblaze  | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/fd0949eff80562d8347a43203bf11c16641afa34 |     
    mips     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/b0525ba86a6191a98867179ea04d515f7bfab645 |     
    or1k     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/6d3bd2cc4d418b48d21785f6c0e1370067040703 |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/dd57cb18052a22856283d1795c0ef635d6873bd0 | ORPH
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/7c3c6ab9a52c3672df722184bb7752e5f75473f0 | ORPH
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/75195c754e72ed5741cb15a9a0c2827015fff19c | ORPH
microblazeel |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/4d0bcf1791481358d0ed494dd0da2a445f2f15ad | ORPH
   x86_64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/769a594a73f66ec61c5ae675f62e09a7a7d9de08 | ORPH
 powerpc64   |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/cb31848406ca436b5df5d8b386941d7e318d4e86 | ORPH
   s390x     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/6b3de80b5a1bbed1cb54016ab0aa308d000afd63 | ORPH
   s390x     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/1c79dc3f686df2281c7a10f4e77d91b170cbcfdb | ORPH
    or1k     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/512166a2c539ead95b09143b2191cc1831581843 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/b6b2610d0947a990a4b6fda5d4b2869f20e8c3ed | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/a1093a277f204a97e07505226cf46293373c3fb2 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/848a90bb06ba2848c562718020e22823d7a32ad3 | ORPH
  powerpc    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/747d9ce2f9f069fdb74b79dbd07ab5237d15a314 | ORPH
    or1k     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/342301f1523392a23d6f32f54300ac568d595de4 | ORPH
  powerpc    |            gsl-2.6             | NOK | http://autobuild.buildroot.net/results/8f35156c7541d291a9e747f124e9a288a92ff827 | ORPH
    i686     | gummiboot-2bcd919c681c952eb... | NOK | http://autobuild.buildroot.net/results/f1dc6f84e026fd3d15e670968c2bde4883e20796 |     
 powerpc64   |       host-autoconf-2.71       | NOK | http://autobuild.buildroot.net/results/0a9d20162faec1bf0ed88e280875ee6fa427cec8 | ORPH
    or1k     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/4d45138bfd8640f79d7bd125b32efdcc54039e1c |     
  aarch64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/1ebdc74f59ea3709cda627ba436cd67eb15f4eee |     
  riscv64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/d8feb392e2be6a7499c5a53876657c3270f1226e |     
   mips64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/69574e0eca571b28280eec03294dae3667e7ac5d |     
   nios2     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/beaf46bb5184cfb1f384176e122720b5047dc895 |     
   armeb     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/2c632bfefb54627ad42e3ee1dac665d67eaf95f6 |     
   mipsel    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/28d93079d2ce080ce4c194b6b6b50e11fe5f3658 |     
 powerpc64   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/bd00e48c15ae368b1c6c44278b6c3fb0ef18d40c |     
    i686     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/1c588dd748cc0abb50eb1f0a021d04de14f59167 |     
   mipsel    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/e495b035593bf92c1bc98407f6c14e75dd2d6352 |     
   mips64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/3374320995695ec9b306561cee55473bd74589a3 |     
   s390x     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/8145993766774ac9ddb5ef839c439a02edc54c7b |     
   arceb     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/40d7e1c25428a6d11c3da455cdd3d92efd46a865 |     
    arc      |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/8d2dc863dc792adfb2e8260b820ccb06ea33b4f8 |     
  aarch64    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/373b45c1b82b25c661b5bc4ccd83ea0fee323698 |     
    mips     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/a50eff624d8433271a56dbd5923acca21b13296c |     
   arceb     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/95703d7cd42a0590b70d148b9753271f0694950a |     
   x86_64    |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/849ff7b86e8ff2955a8b33788e58eb09ff01fda2 |     
   mips64    |        host-delve-1.8.0        | NOK | http://autobuild.buildroot.net/results/fb21964d8059d7d6d1dcf045d443116633de305a |     
    arc      |        host-expat-2.5.0        | NOK | http://autobuild.buildroot.net/results/e91220144015cfd0c70b3d32dd10c75ce80b7c26 |     
  riscv64    |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/d5d6d3b3e8c052172c9f491549968064ee637ad7 |     
 microblaze  |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/d935f6d8545682c8f1dff4db802fb30cd657fa6e |     
microblazeel |     host-gcc-final-12.2.0      | NOK | http://autobuild.buildroot.net/results/28280c81b596dee2912d43967ac101fae2422e21 |     
   arceb     | host-gcc-final-arc-2020.09-... | NOK | http://autobuild.buildroot.net/results/a53697ef07224b94e08895cf7ace7a9dc65b8afc |     
 microblaze  |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/427b8633286632fd95e10bbfd208c4db0a1d6bda |     
   mipsel    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/60f521cd0c8609640ec17eb252de07c08ffc64f6 |     
    or1k     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/b3f8012069ea068826ec93719d0ce198a9b36f11 |     
   arceb     | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/ec704093838ca3911d4027788eec7940f376f0f2 | ORPH
  mips64el   |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/cca8a0c0850594453acd8328fac38f0cdb92bffe |     
   mips64    |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/a9f4b979c38aac3a797c98dfe7f169b81762bc64 |     
    i686     |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/7a1a040e89cfc5baf8acb3f001fcd37573352f9f |     
  mips64el   |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/cf9054f331d7b443c357fbc4e1ba5dcd9089e7e0 |     
    i686     |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/40f207d2dbf80126d10c2e67c47f5156ced5eb03 |     
  riscv32    |        host-llvm-11.1.0        | NOK | http://autobuild.buildroot.net/results/1cdc936b2e6dc9bea3cc5a63215a7539a7f46d3e |     
  mips64el   |         host-mpc-1.2.1         | NOK | http://autobuild.buildroot.net/results/e508e45a62243bba60101f772e990da4926a7fdc | ORPH
microblazeel |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/c393dff61e8f76bb8f76b75377607852daa23291 |     
powerpc64le  |      host-python3-3.10.8       | NOK | http://autobuild.buildroot.net/results/84c90bc428dc6a3e5345b12208280305c669e272 |     
   x86_64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/c7dd8025ad3c452d4eac90d8d798c6d8d0186b37 |     
   x86_64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/3b5391a95ab097fd930bb37d3b91791beea6e80b |     
   x86_64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/f78217cbe43a11bcde0e0b6a84fb3c315a10a2b0 |     
  aarch64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/22128c59a1305e09a16aa7806cbd3cfaa4cea633 |     
   mipsel    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/d5e5710244eca009ef4796c7df338bfc3f4f4a9e |     
  aarch64    | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/7e883f292629aa0a024536a50cdce03433b8cb77 | ORPH
  aarch64    |       host-systemd-250.4       | NOK | http://autobuild.buildroot.net/results/338b69d95bdce5a214c2cbb048ee4c3e24125829 |     
 microblaze  |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/653e384576b24a7adc5703b1a8975881617f5085 |     
   s390x     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/e839ed0d4efd2b713ff6dd33adc397bd66704af6 | ORPH
  riscv64    |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/4b040660247e22188b59bdec3ec80cca2a27599a | ORPH
   sh4eb     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/0f1990090b9084791efa5ed6071c266fcd16d12f | ORPH
   arceb     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/460680ba73816e3f9154a1fb915a35bbf71e9999 | ORPH
   sh4eb     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/0b923cc1d2c9117082b2c3c7453f893e5f814150 | ORPH
    i686     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/3dea860d3c556e9d0001bb62d013712c7b88cf2b | ORPH
microblazeel |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/617530751e419167a306d35ec95a7d15ec7ad844 | ORPH
powerpc64le  |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/787b3e5a946eaaac3ccac8202a6cd42350e8a4e0 | ORPH
   x86_64    |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/b3b575d61eb620f75ded39bce9ade2a631b313c5 | ORPH
    or1k     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/463e801ffdefdd7c93149121f101afa78acf2589 | ORPH
   s390x     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/98f7a758ebfb579f86a14939de8286c22c7317b8 | ORPH
   mips64    |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/8066bbd9071feaca04ca97a5ba3c66c6433999a7 | ORPH
 aarch64_be  |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/d55c789e758e826b7d6e8d5102ce042ee0c8468f | ORPH
   sparc     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/fafc884d870a72c0f1fe6c6a53cc5857255f757e | ORPH
    or1k     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/6977f89fd97e7b7211ae09f11427aa6ffc017aa1 | ORPH
    mips     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/5b70144746e1020c859d084f21f4527657a8ad4c | ORPH
microblazeel |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/43f3d843d96a7465a7c0d1ceba31e98759c6abaf | ORPH
   mipsel    |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/94444d0825f41bbca51eabdae7eb3503fc26f002 | ORPH
   s390x     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/cc50a27bce519b0d3a73353cc18ee1da459787bd | ORPH
   nios2     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/884b4fd0c89a63d231c7457343136005dc72dd49 | ORPH
   mipsel    |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/d9c0919d75952be7c257e24855760bd2c1df921d | ORPH
   sparc     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/6eb22d28281e151c8ef6f794ef9f19f7eb813613 |     
   armeb     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/dabc6a4f49d464c129ac6bc3710011678142fcbe |     
    or1k     |          json-c-0.16           | NOK | http://autobuild.buildroot.net/results/1f49273c5859c61b39c904167efa0b015152afbd |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/f10ef818fc6230e9f3090e19ab4b777969bd13d9 |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/77636910e7033726303477e84637b6816b2cbacc |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/577663fdd6510ac3535c80951dfc703e28127ba1 |     
microblazeel |        libdeflate-1.12         | NOK | http://autobuild.buildroot.net/results/028abbe6a5515315784c7ff828f54afd44a7ea14 |     
    arm      |           libev-4.33           | NOK | http://autobuild.buildroot.net/results/d3335a11d2a23fab2008f5fb2a66aff1ea23c7bc | ORPH
    i586     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/3188a464fb933a8c8aef261d19587811fb2f367a | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/12d77f0bf67e6d8679521c5ff283f11646e25627 | ORPH
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/e1f39c4b5ed79da3d1422c9ce8e750d943f7e1a7 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/f10a7adaa62456258ef9921507582171a461f79e |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/944fb29ffd349d0fc8447b8e2b4f45d7fb645cca |     
   arceb     |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/2cae697f976fa8e8986e721b45d82ebaa97d9376 | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/c561bd1640f9eeb4e1b96af93662c883c5734465 | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/10c26baf86a29107d16e8a33ff53ffddd25debb6 | ORPH
  aarch64    |         libidn2-2.3.4          | NOK | http://autobuild.buildroot.net/results/30ac50512cd4b4cb3ecc97514a72d1f316a1b33a |     
   xtensa    |         libkcapi-1.4.0         | NOK | http://autobuild.buildroot.net/results/085b204ed02907fe2b3593751c89f20dfb64ea4d |     
    or1k     |         libkcapi-1.4.0         | NOK | http://autobuild.buildroot.net/results/dd2701a0d3fc6ded415beacde1d380b076dfcb3a |     
 microblaze  |         libkcapi-1.4.0         | NOK | http://autobuild.buildroot.net/results/377a38c039578c8ed35a2004e9343531878fb68e |     
  mips64el   |          libnl-3.7.0           | NOK | http://autobuild.buildroot.net/results/5cbc34e5e18b1b14cf969700d48efa8516d5ba3e | ORPH
 aarch64_be  |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/e6c1b6ba3e49d945c68b0d731dcc2aae58eb8a82 |     
 aarch64_be  |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/1d501f88b2ab30cb73c6196032fb90fd3ab8a038 |     
   arceb     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/26e2f5030e67e37a116af80180c792517f246a62 |     
    i586     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/ac110acef67820a1122a62a601bd49669cf162ef |     
   mipsel    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/145183a3c29c8b3e62a052161d09b3f688f6bb27 |     
 microblaze  |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/a1667e9a8d0d71d5e80446427f7fc2bad2676060 |     
   mipsel    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/4aab6786560ca2dd71886c82f4bb7279c72675b1 |     
  aarch64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/0f32e5581d43f6bcd6ace325542205fe2879e8f2 |     
    mips     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/35a128b89052e3932d4ce3a9e30c4b66eddcf1ed |     
   mips64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/f7dbedabf2b9ca068dd141cc0743165af837be1a |     
  mips64el   |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/2bc285e31b57cd80c124be58ba76b50d909b8844 |     
 powerpc64   |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/1b875e1bd2248f2dbf078d64968f818190bed82f |     
powerpc64le  |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/af9defab2a341602703c14be1305d9804d1a2805 |     
   s390x     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/ab391cbe2be4d749984e6c9acec6e86afdabc1ed |     
   nios2     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/ba1092f063058060935d429fd6db5fb0fd268d6a |     
 microblaze  |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/3b8ca292536612a668744d9fdb75802ba60c9855 |     
    mips     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/8df12b6d03a5240dc12eb61e93d21d352abe9e85 |     
powerpc64le  |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/07b02f9be6594b0f966e11de33bb3f64246a3a07 |     
   x86_64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/7800cd4293acc94ec597efb4ae066a0eb6e245f3 |     
  mips64el   |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/9c461fd7970a0a26b2aee1242aad27f432ee8347 |     
    arc      |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/0365364ee7ae282b00dec8eda7aa6b7a549d2d64 |     
    mips     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/3526a87c9634a82841c5a2dc57bfd7e17f63006b |     
    sh4      |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/9e53514bdf556dd68b5bba1ce6487b00ce2da28a |     
  sparc64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/7c1cd0bfc5e809f4e04f793d1ad5b746691621d4 |     
  aarch64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/6e87a76b7dbaf1a5ec30205fd5f2f9d9036602ae |     
   armeb     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/5e9d99e39b551788fde75979713a01f91fad0e56 |     
   s390x     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/0d5cfa5265a0c2d749ec2cefc96906f53f01f5f6 |     
microblazeel |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/304112fffcce9ee29834b4cc1eb9a2c3eec55484 |     
  powerpc    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/0e0af7dc637ad57c721f541865e188a670ad3d5e |     
  aarch64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/daf956c99fee19411c7fd1e3adf76d71f07740d7 |     
   x86_64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/0a8dacfa884a11a97e10bcb2cc06a3f6b57153f5 |     
    mips     |          libqb-2.0.6           | NOK | http://autobuild.buildroot.net/results/1b792831701da68d74a3f5ed85c43ddc8ed5b383 |     
    arc      |        libtommath-1.2.0        | NOK | http://autobuild.buildroot.net/results/f20727ff865f6dd58d1ee74ebbca1ae2e2ebc44f |     
   mips64    |        libunistring-1.1        | NOK | http://autobuild.buildroot.net/results/3e4e27a57f0e1b58be2f7803041d4a8dc8c96fcf |     
powerpc64le  |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/1fac7cd9d429027dea94be5d03f1d5d34f60b8d4 | ORPH
 aarch64_be  |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/d10195239eadab9bc2bdf7182584f0282a961f6f | ORPH
  sparc64    |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/2393aea9e147b26ed235a8d64211db46cea39af4 | ORPH
  powerpc    |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/11826ea47600e0aaba9816905f6e1b8e74c7e6d6 | ORPH
  mips64el   |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/88782955d4e25771a04a4ac73d30b33c17586307 | ORPH
   s390x     |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/76bbc2d9833012a061c0048f8e8ff91c2ed9205a | ORPH
    sh4a     |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/75e5dbe8a6c4add3692260436094303666e20cab | ORPH
   s390x     |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/1cb3b15cf1ced2cfa0264c2b87c32541b7216275 | ORPH
   xtensa    |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/4dd1b895207efa7933d1d99b87f50a28d1a1b1b4 | ORPH
    mips     |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/dc4f8ef038d0a9aac4f35e5e49bbad30421edc87 |     
 microblaze  |      lttng-modules-2.13.1      | NOK | http://autobuild.buildroot.net/results/f51069074729df1e83acce14d55095ddd9fa86d3 |     
powerpc64le  |           lxc-4.0.12           | NOK | http://autobuild.buildroot.net/results/cae04264f8aad7d7d67b60e20cfbde07ad9b4f23 |     
  mips64el   |           lxc-4.0.12           | NOK | http://autobuild.buildroot.net/results/e16b62e17b02596479709c1cc130bfe9c3dee0fd |     
   s390x     |           lxc-4.0.12           | NOK | http://autobuild.buildroot.net/results/fe0dc5425010be5feeaa11520db4ada5d8c89e45 |     
  aarch64    |           lxc-4.0.12           | NOK | http://autobuild.buildroot.net/results/fd33eadccb9c3a8bfdba0425357d05b2a765db3b |     
    i686     |           lxc-4.0.12           | NOK | http://autobuild.buildroot.net/results/bbd33fe73cf01e2b39b67d33bde5e43da0cd19f0 |     
 aarch64_be  |           lxc-4.0.12           | NOK | http://autobuild.buildroot.net/results/6a886d5e16e9f796f321fa3947d68f45caa36ea0 |     
   s390x     |           lxc-4.0.12           | NOK | http://autobuild.buildroot.net/results/cf812f7b488666012bbe3c6b99a064286bfddd98 |     
 aarch64_be  |           lxc-4.0.12           | NOK | http://autobuild.buildroot.net/results/3132692a1a708b7bed42a3057f7e312969714944 |     
  mips64el   |       makedumpfile-1.7.2       | NOK | http://autobuild.buildroot.net/results/356672d8f26f4d0c620042c7d9d0231ff539ae6b |     
    arm      | mali-driver-3d697de9bce8bc6... | NOK | http://autobuild.buildroot.net/results/031e2b1da77b1108dd682c540cf06704d3ee0062 |     
 microblaze  |        memcached-1.6.16        | NOK | http://autobuild.buildroot.net/results/1245b9993923d644c0b2f21f8ee30ccab4d780d8 | ORPH
    arc      |        memcached-1.6.16        | NOK | http://autobuild.buildroot.net/results/b26889b2059c0d20997f75102e547c47f4ffd598 | ORPH
  aarch64    |          mender-3.4.0          | NOK | http://autobuild.buildroot.net/results/c107fdbdab0f8b342bf924632b0c53ff75894d6e |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/c2b0bba69abc6b316279efcf640764614d5664c6 |     
  mips64el   |          ncurses-6.1           | NOK | http://autobuild.buildroot.net/results/8f3ef9ad58b17b6afcaee3f3475da85ae1338043 | ORPH
   mips64    |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/9fce2c086971cc791c07d431c499ca2024f0cb89 |     
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/2dede3c4e8b8046a0453fd4a8f4144f78ab2b7e9 | ORPH
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/4b9ffc170ea5bebf7f233d97da5ff9b9a72036e1 | ORPH
microblazeel |         numactl-2.0.16         | NOK | http://autobuild.buildroot.net/results/da778c9b6a6862c941fb237eebed387621c2fd73 |     
  riscv32    |         numactl-2.0.16         | NOK | http://autobuild.buildroot.net/results/6eb52760546d5cfca962c3e06b7ab2edce6f57a8 |     
microblazeel |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/b5b2070d717ec248b840e9e17d7957d77e6cbbf4 | ORPH
   sparc     |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/ad3d5ba08fe4816588edb4ce0bf473e49c7d4fd5 | ORPH
   nios2     |        open62541-v1.3.3        | NOK | http://autobuild.buildroot.net/results/70eecadb6a56fc1cbf1303ea05141dfab75df5e5 | ORPH
    mips     |         openal-1.22.0          | NOK | http://autobuild.buildroot.net/results/1cf72f16d71d5404dd42fbb05a838360d2743d1e |     
    i686     |        openblas-0.3.21         | NOK | http://autobuild.buildroot.net/results/d16e46e71a8e626ae8155152200f2789c23fb198 | ORPH
    or1k     |        openpgm-5-3-128         | NOK | http://autobuild.buildroot.net/results/675e488902892312a339c2d03a3200cd87079842 |     
    m68k     |         openssh-9.1p1          | NOK | http://autobuild.buildroot.net/results/ba88b0a03f9cfaf9ddefb04ab5bd68186a0b4b79 | ORPH
   armeb     |           opus-1.3.1           | NOK | http://autobuild.buildroot.net/results/1df6d22d39431bf161a823658ea8a1e15ff3bc11 | ORPH
 microblaze  |            pigz-2.7            | NOK | http://autobuild.buildroot.net/results/9752f95e1204298ea304bd2348c2238b6a2154d3 |     
   armeb     |        procps-ng-3.3.17        | NOK | http://autobuild.buildroot.net/results/f23a5156e641b2ebdd673973dec0f9c87760c688 | ORPH
   mipsel    |      proxychains-ng-4.16       | NOK | http://autobuild.buildroot.net/results/c4b32e0ffa91b94f63d5f082a440b125245e3944 | ORPH
  aarch64    |           putty-0.76           | NOK | http://autobuild.buildroot.net/results/16328190ae39f16e707a31d0732087412c4671d8 |     
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/42025ec5b135ad7cade70b8007688120f562d679 | ORPH
    arm      |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/1d7f1cacbf6117d8e5ff239552b66d0729cd57ab |     
 powerpc64   |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/8d7ee26cfc5ba1ce1e2a22a158424fc6c0811318 |     
  aarch64    |           qemu-7.1.0           | NOK | http://autobuild.buildroot.net/results/3f19ddd8c3c65043c2ea071b9ee1b41fabec4592 |     
 powerpc64   | qt5base-2ffb7ad8a1079a0444b... | NOK | http://autobuild.buildroot.net/results/52753f3df722c84611c1bab46e3caf47da2a2719 |     
    arc      |          reaver-1.6.6          | NOK | http://autobuild.buildroot.net/results/9523473dc3b075785a588b88fc07bb32ec0489ea |     
   xtensa    | rtl8189es-39c17661136da48f8... | NOK | http://autobuild.buildroot.net/results/8e71a0d89e0459d67682a2c90056bc3515d3a0b7 |     
   sparc     | rtl8192eu-1e15b6d451731bc4d... | NOK | http://autobuild.buildroot.net/results/6da95ca1b771f8f91b8547720ed59a5e5bc3e69c |     
  sparc64    | rtl8192eu-1e15b6d451731bc4d... | NOK | http://autobuild.buildroot.net/results/3499f536be6abaf3e345b566ed63458c402d96ba |     
 microblaze  | rtl8821au-4235b0ec7d7220a63... | NOK | http://autobuild.buildroot.net/results/c27436f280ac641588f53aa31ca1c03db2af0739 |     
   armeb     |     s6-linux-init-1.0.6.3      | NOK | http://autobuild.buildroot.net/results/4fd9ed022c83d7f9757b424427d379bb4d5fba30 |     
    or1k     |     s6-linux-init-1.0.6.3      | NOK | http://autobuild.buildroot.net/results/62fbdec64d639c64f0388e021d41bd1184f6008a |     
   xtensa    |     s6-linux-init-1.0.6.3      | NOK | http://autobuild.buildroot.net/results/9d994b2fa1c9782c7e140fcb7d56f68e0e3caa19 |     
   armeb     |     s6-linux-init-1.0.6.3      | NOK | http://autobuild.buildroot.net/results/935792b8449772d17e8f300c1ac96774286f76d6 |     
   s390x     |     s6-linux-init-1.0.6.3      | NOK | http://autobuild.buildroot.net/results/38832ae0e91f6f072313ea9d8605b6ddf7b20164 |     
    sh4a     |     s6-linux-init-1.0.6.3      | NOK | http://autobuild.buildroot.net/results/a428a5c974649bf9c2b1d419a4d0335ce34ad32b |     
   sparc     |     s6-linux-init-1.0.6.3      | NOK | http://autobuild.buildroot.net/results/97d5c51c4d13bf78d0120124d988b8fc4822f66b |     
  sparc64    |     s6-linux-init-1.0.6.3      | NOK | http://autobuild.buildroot.net/results/02d3c4895cc7b8441be533a50cee94e8a4d6dd03 |     
   sparc     |     s6-linux-init-1.0.6.3      | NOK | http://autobuild.buildroot.net/results/c397c5f6bc7cfc432712e430945eebe666617f0e |     
   sh4aeb    |     s6-linux-init-1.0.6.3      | NOK | http://autobuild.buildroot.net/results/a41c055e54049aaf6dc8136c040464650972e270 |     
  riscv64    |     s6-linux-init-1.0.6.3      | NOK | http://autobuild.buildroot.net/results/cae7842f5c5dcfc5ac1059d3c3d089e6dae5677b |     
   mips64    |     s6-linux-init-1.0.6.3      | NOK | http://autobuild.buildroot.net/results/ed5bbff2f76653f1a3e5f28ed3c991ec0c6d1ba1 |     
powerpc64le  |     s6-linux-init-1.0.6.3      | NOK | http://autobuild.buildroot.net/results/809a7b854ff01a9a326ae2900d565653365ad056 |     
 powerpc64   |     s6-linux-init-1.0.6.3      | NOK | http://autobuild.buildroot.net/results/a441d3e2f95bb902aa05b20539129fe532594f0b |     
 aarch64_be  |     s6-linux-init-1.0.6.3      | NOK | http://autobuild.buildroot.net/results/e25bfaa01c5b4366c0b790049ac2629b10aa848b |     
   nios2     |     s6-linux-init-1.0.6.3      | NOK | http://autobuild.buildroot.net/results/a0068d75ef201e1fa10946c08de0a08611c37cbf |     
 powerpc64   |     s6-linux-init-1.0.6.3      | NOK | http://autobuild.buildroot.net/results/389fdb3c7e3f2d4d66e2f5e1c57a008d089d66df |     
   sparc     |         sudo-1.9.11p2          | NOK | http://autobuild.buildroot.net/results/c6928356839506be914d99a942b122ada4eeeca3 | ORPH
 powerpc64   |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/4b0b0e3004be569cb7d7089d436b99a723197edb |     
    mips     |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/d4863f476de2a8b4c9d28ee52b1a48f5b0947c4b |     
    mips     | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/4633f800efa6160cce48f25e0eb6ecb9d1b2f641 | ORPH
  mips64el   | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/c965676bf7a311563444d1462fc5b73df0f67e9c | ORPH
   x86_64    |        traceroute-2.1.0        | NOK | http://autobuild.buildroot.net/results/47e3cca332a9147b51c16a7da5eae29fe8f79448 |     
   x86_64    |        traceroute-2.1.0        | NOK | http://autobuild.buildroot.net/results/d88d1cf675f9b03cccd04bb640394224c97ef763 |     
 microblaze  |        traceroute-2.1.0        | NOK | http://autobuild.buildroot.net/results/d412c2283346db31ef4341e88affae8a02497088 |     
    or1k     |        traceroute-2.1.0        | NOK | http://autobuild.buildroot.net/results/e45ac638a74a19fb7c63cf430bf7ae8cc5359ac6 |     
  riscv64    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/84151a046ae14ffe3b2ae5e70e19ee1185cda791 |     
    mips     | uclibc-ng-test-6790eafe897b... | NOK | http://autobuild.buildroot.net/results/fe5ee55304eaade2323e0084b1e522263c776a07 |     
    i686     | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/b1eaf7feba88243e4dbb6bfffba8ff1ba653d7d7 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/b1d4d53d6f24b765b4c423c3b38309ca6135c686 |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/5b18569c0db4ca53de1ad7e538060fa5a896dad4 |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/b02824881fb2a397dce94bc607fc693d276584fc |     
   armeb     | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/29ed008e7ee0fb33141bd1568ac8f1702e791f26 | ORPH
  powerpc    |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/8136621cda7894da3a027a4adcf462ad304d238d | ORPH
   mips64    |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/5a693ebf4fde712fe1f4d3486776a19e4ce0a9c7 | ORPH
  powerpc    |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/17a936881b2995c70fedf4f19ccd65bce774e2f1 | ORPH
  riscv32    |         wolfssl-5.5.2          | NOK | http://autobuild.buildroot.net/results/7ead9da90521d4a36c549aa9a6c1aae411a74790 |     
    arm      |         wolfssl-5.5.2          | NOK | http://autobuild.buildroot.net/results/974983b7efa739a5cc12e61cf77b7bfc8e698b7a |     
    arm      |         wolfssl-5.5.2          | NOK | http://autobuild.buildroot.net/results/62b087ab47285bd115e6f6da42200f13e17d5202 |     
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/36f1de04727b580e03afd54ee4283f3dc8179b23 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/fd7348b4b979f7d2e65474577e24b5561ac9fc22 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/46ea179e0603c171a7b689c2681043fa6cbca531 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/6c7a8702265743cd39c24d22d5956cf926e002be | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/53d854548d5f22611f0133d28df73e73050374c0 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/31b5555049901fefb4be9de5f380c1ed676d2fac | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/e3de51b334a89f6a23e7a44ecad8fb59d896c5b8 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/597f79fb9e0288292f2808406b86267c548b0d0a | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/c9d11135bbd0db8d9063dc459096dcd4ee32f826 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/d5cf1f5d382ebeb04385259b84acb4e4b1537bb8 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/ff842953e5aa56418a1a2408b0b598d1dd967a2c | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/5d3a1ae747ce06ea9150d81cfd6639bd4cd236db | ORPH
powerpc64le  |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/34c7668c698fa7f482e33d5fa7875b2da038d7f6 |     
  riscv64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/8d9d2891bd44e87c8afb4029206c8f86bdc3e64c | ORPH


Classification of failures by reason for next
---------------------------------------------

                readline-8.1.2 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |         readline-8.1.2         | NOK | http://autobuild.buildroot.net/results/c619b8906eae31529d6584c02f839c0fd9685604 | ORPH


Classification of failures by reason for 2022.02.x
--------------------------------------------------

               poppler-21.12.0 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |        poppler-21.12.0         | NOK | http://autobuild.buildroot.net/results/7bf0d4b04adf1a2e4f2d946f89c25985f0659b2b |     


Classification of failures by reason for 2022.08.x
--------------------------------------------------

/home/buildroot/autobuild/i... | 1 
                  boost-1.79.0 | 1 
                elfutils-0.186 | 1 
           host-doxygen-1.8.18 | 1 
                host-go-1.18.6 | 1 
              host-rust-1.62.0 | 1 
            igd2-for-linux-2.1 | 1 
                 linux-5.17.15 | 1 
              open62541-v1.3.2 | 1 
            python-ujson-5.2.0 | 1 
                    zstd-1.5.2 | 1 


Detail of failures for 2022.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/7641f462a698662e65c2917079585877b43cd342 |     
   x86_64    |          boost-1.79.0          | NOK | http://autobuild.buildroot.net/results/51d5a76bce7e7ddbce8b9229a309a2a4b958189d |     
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/5cc04a248c1e5e89105ad2cc0a80e005902d6a44 | ORPH
 powerpc64   |      host-doxygen-1.8.18       | NOK | http://autobuild.buildroot.net/results/f6dfb68ad6e609c623555df5e74705b57b69ff2d |     
powerpc64le  |         host-go-1.18.6         | NOK | http://autobuild.buildroot.net/results/9a39a0d5a864286adf0dc6c2f86ec07c2b0f1488 |     
    i686     |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/0c057691f3a9b432816f2ef118b931cc0ac7b397 |     
    or1k     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/d542a69aee524c6273d232e6313687f8466b3c5d |     
    arm      |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/3b14818073d4bd6a1cf64cd7b41a204385892ef3 | ORPH
  powerpc    |        open62541-v1.3.2        | NOK | http://autobuild.buildroot.net/results/0ff4acb66dc42b439cc8b92df94a37ef48ce32c3 | ORPH
    or1k     |       python-ujson-5.2.0       | NOK | http://autobuild.buildroot.net/results/c727267d1b6562486427dc1a6972dbb949e4c1ef |     
 microblaze  |           zstd-1.5.2           | NOK | http://autobuild.buildroot.net/results/2e920f22d227a4df3329f104d922e330d0033b41 |     


Gitlab CI results for 2022-11-03
================================


-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
