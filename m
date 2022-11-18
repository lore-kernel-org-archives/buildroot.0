Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E00DC433FE
	for <buildroot@archiver.kernel.org>; Fri, 18 Nov 2022 07:35:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8DC7581ECE;
	Fri, 18 Nov 2022 07:35:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8DC7581ECE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RkrgQphKOxg2; Fri, 18 Nov 2022 07:35:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 61F1981EE7;
	Fri, 18 Nov 2022 07:35:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 61F1981EE7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 70FF61BF3E5
 for <buildroot@lists.busybox.net>; Fri, 18 Nov 2022 07:35:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 20A4B417D9
 for <buildroot@lists.busybox.net>; Fri, 18 Nov 2022 07:35:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 20A4B417D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mh8GnidhJOSm for <buildroot@lists.busybox.net>;
 Fri, 18 Nov 2022 07:35:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 785C3408E6
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 785C3408E6
 for <buildroot@buildroot.org>; Fri, 18 Nov 2022 07:35:08 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2D164C000E
 for <buildroot@buildroot.org>; Fri, 18 Nov 2022 07:35:05 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Fri, 18 Nov 2022 07:35:05 -0000
Message-Id: <20221118073512.20A4B417D9@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1668756905; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ioKxgNIaSjkgpEpRPwUm9gY6e9L4wtkk1BrNyFLSszE=;
 b=TJgM4h7cjh6Nj09mM9dpco/eKCx9bS8HwEF73HYY3WWYq+rfDF0xqMM7kauEIKSQ+SE4Fq
 Mz9yl/2a5IauabvmlI+iKf4hEOtRiK9LNz4fjkpJSuUyDkrEsTS4tXVrEsUS0kVEuNvvd8
 sDu9ffXfcswE6vGDkUJve6m1vi7QlVAPLLC6GrOLYAj5b9QRYlQkbQhzMJlkPwX3hiR2Ry
 +feFIyPkxg2Ds6hwzfDaoPHKLww16LMuGhD0P/GPYTvolEjCNDhXw7BhKhTTQ3trXQA8Wz
 Br50r3xSyXxqCIntTrMd3WD8wM4BRAUTh8qcHC1HFqLZS1TMOeqcFj1U5wyAxQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=TJgM4h7c
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-11-17
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

Autobuild statistics for 2022-11-17
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  9  |  1  |  0  | 10  |
  2022.08.x  | 10  | 12  |  0  | 22  |
    master   | 150 | 149 |  2  | 301 |
     next    | 39  | 75  |  2  | 116 |

Classification of failures by reason for master
-----------------------------------------------

                   libnss-3.84 | 15
glibc-2.36-66-ga1dc0be03c9d... | 8 
            host-binutils-2.38 | 7 
              host-pahole-1.24 | 7 
              host-rust-1.64.0 | 7 
                       unknown | 6 
                 dash-0.5.11.5 | 5 
                      xz-5.2.7 | 5 
             libgpg-error-1.45 | 4 
                   linux-6.0.1 | 4 
                   perl-5.34.1 | 4 
                elfutils-0.186 | 3 
                     frr-8.3.1 | 3 
                linuxptp-3.1.1 | 3 
                    bat-0.19.0 | 2 
                  check-0.15.2 | 2 
                gerbera-1.10.0 | 2 
  gobject-introspection-1.72.0 | 2 
            igh-ethercat-1.5.2 | 2 
               libglib2-2.72.3 | 2 
          linux-5.10.145-cip17 | 2 
              memcached-1.6.16 | 2 
               valgrind-3.19.0 | 2 
               apcupsd-3.14.14 | 1 
                  assimp-5.2.5 | 1 
                  boost-1.80.0 | 1 
                  botan-2.19.2 | 1 
              cannelloni-1.0.0 | 1 
                  cmocka-1.1.5 | 1 
                 coremark-1.01 | 1 
                      crun-1.5 | 1 
        edk2-edk2-stable202102 | 1 
                     efivar-38 | 1 
                  exempi-2.6.1 | 1 
               fftw-quad-3.3.8 | 1 
fs/jffs2/jffs2.mk:71: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
                 fwts-22.09.00 | 1 
                    gdal-3.5.1 | 1 
                      gdb-11.2 | 1 
                      gdb-12.1 | 1 
         gobject-introspection | 1 
google-breakpad-c85eb4a59b6... | 1 
            host-binutils-2.39 | 1 
              host-delve-1.8.0 | 1 
                host-go-1.19.3 | 1 
host-spirv-llvm-translator-... | 1 
                   imagemagick | 1 
                   json-c-0.16 | 1 
              libgcrypt-1.10.1 | 1 
                libkcapi-1.4.0 | 1 
             lirc-tools-0.10.2 | 1 
        ltp-testsuite-20220930 | 1 
          lttng-modules-2.13.1 | 1 
                     lxc-5.0.1 | 1 
                  mender-3.4.0 | 1 
                 mesa3d-22.2.2 | 1 
                mongodb-4.2.18 | 1 
                    ne10-1.2.1 | 1 
            ocf-linux-20171122 | 1 
               openpgm-5-3-128 | 1 
   openvmtools-11.3.5-18557794 | 1 
               pcsc-lite-1.9.9 | 1 
                      pigz-2.7 | 1 
                     pv-1.6.20 | 1 
    python-cryptography-38.0.1 | 1 
                    qemu-7.1.0 | 1 
rtl8821au-4235b0ec7d7220a63... | 1 
        s6-linux-utils-2.6.0.0 | 1 
                   uhd-4.3.0.0 | 1 
                 wolfssl-5.5.3 | 1 
                  xvisor-0.3.1 | 1 
                  xxhash-0.8.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/911dc70129938ca19decc1b8ceab76e97216d2df |     
    mips     |          assimp-5.2.5          | NOK | http://autobuild.buildroot.net/results/95d36a28e54a697d39b11ee7cbf469b6665f96d6 | ORPH
   armeb     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/520143dec202c6cbe2aa13cdd32180b8485515f6 |     
   armeb     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/cf0b061f49dacb56907c9a0c136bc627ced0ad7b |     
   arceb     |          boost-1.80.0          | NOK | http://autobuild.buildroot.net/results/fc767d2bceeedc6e3464b72cb50a0c5036ece042 |     
   armeb     |          botan-2.19.2          | NOK | http://autobuild.buildroot.net/results/a4522ddfe65896ec56d763b6f063fd9393bdaa06 | ORPH
   x86_64    |        cannelloni-1.0.0        | NOK | http://autobuild.buildroot.net/results/868d283396aa7c7652dafa5efa090f5b1179033b |     
   sh4aeb    |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/c37b34d49a781c42cf48def699fae184dd398602 | ORPH
    arm      |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/b0e8251b5f4ed93d6752c682ad205df246985987 | ORPH
   armeb     |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/4987a0b6f0819401e1dd128c168679097c95382e |     
  powerpc    |         coremark-1.01          | NOK | http://autobuild.buildroot.net/results/02110e03a226f2f64b0c0091e7dcf99d7c1d6c65 |     
   sparc     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/48764807c0b488c6748127c0a93a0ce2ef3c8c09 |     
  sparc64    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/e3e700549c867b23527e2fec1c278f13f6931527 | ORPH
    or1k     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/d2121ad54880c5842978b478ea0f121ce39f27d3 | ORPH
powerpc64le  |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/301a8711beb2be6434544d017687e3d1e65698ed | ORPH
    or1k     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/5fba544c43461de3dfa9326d9f9f29a6ff6b6f74 | ORPH
  aarch64    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/fb58895cedcb357f4c34166cbcbd47a8291da445 | ORPH
    i686     |     edk2-edk2-stable202102     | NOK | http://autobuild.buildroot.net/results/2bbc5031e990405a383f291d947e27fa03386fb1 |     
  mips64el   |           efivar-38            | NOK | http://autobuild.buildroot.net/results/f38028aabbea7ac4d55597eeb28fb937cbf219b1 |     
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/33cde6477db973f5ec537620a6ce84e7d28d5999 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/3de9f9ad5bdff2090a8014b0bdb1e7c0f6a5da1d | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/cd6bcbe55a169f66188f3686acd6deecdf12c931 | ORPH
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/5d5016a4760895b4eac908fe8a9690c89c4f26da |     
powerpc64le  |        fftw-quad-3.3.8         | NOK | http://autobuild.buildroot.net/results/6a5dc1a7008b1ce367949a596e4922b1f6d7ef2e | ORPH
  mips64el   |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/5fdecf8ae80404e68323eb0a8fa7cefaa1cc030f |     
  mips64el   |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/565aa837af1eee5c92b909b917746dc9760ddd47 |     
  mips64el   |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/13ce874c28dcef5aedd9b804c1d1765067c16abf |     
    sh4      | fs/jffs2/jffs2.mk:71: /home... | NOK | http://autobuild.buildroot.net/results/ef939f9c394bd1caa1263e7dcd2ca79a3694336a |     
   s390x     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/e79019ae878e694217dc93e67a5cf40f4ea345bd |     
 aarch64_be  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/579be018ac75a59bfa7924c391e4520472d579af |     
   sparc     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/a6372b97617d03e9f8a65c4e6c5f2b0f711d038b |     
   x86_64    |         fwts-22.09.00          | NOK | http://autobuild.buildroot.net/results/3d13b3341a622f87727ce14f0fc7ed1e6e0c19ed |     
    or1k     |           gdal-3.5.1           | NOK | http://autobuild.buildroot.net/results/9fcdde49fd6d86d91a67df0007d3446ff83427ee |     
    arm      |            gdb-11.2            | NOK | http://autobuild.buildroot.net/results/f817b2e7fd0483a81b13e4c827999f1fc3dd4817 | ORPH
    or1k     |            gdb-12.1            | NOK | http://autobuild.buildroot.net/results/9aacb7d77becc3a6692766d27a51ef5d2d9f3723 | ORPH
  mips64el   |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/3f01eb6f9a5717f1360d85c5329b71475791d77d |     
   mipsel    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/d3497927d02e3f1431f2c1d254228adf730b1e11 |     
microblazeel | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/0a092b1660793d4f9189bec03a442176d5f4779b |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/e7038eb7f759c371d7156844e416ae8b740e681c |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/a580a10fbaa33dbb08c872b88b93287dbec7525c |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/b381c8a67003de30edcc83e02756e273fa4aeb80 |     
 microblaze  | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/8cbdefd768ba675c58ff32fc4c50b52ced906b9e |     
    mips     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/b224cc302971c6b576d85a8f3cc3896367fad75d |     
   nios2     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/fd033177cf228b436c6d7d31c3c96564519da348 |     
    or1k     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/c8c35a22f3e6bfe6722407789016d6850a2ac2c0 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/578141a5b59bbbba066bbfc88f4e9819b9336e19 |     
    i686     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/228cebc46fcbaf7a866e651781323b1d9cbf6ef2 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/fe7134b88e4481e887f4c8967cbd093a40e911e2 | ORPH
   mipsel    | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/f925f6b3a0400c0596feba24bb2188010ed1cf3c |     
  aarch64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/e5804157add51654d4ebf47a663a1a56aff65f8d |     
   x86_64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/36205fdd924be0c75700895c6087b3dbb03bf9ea |     
    or1k     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/ed7074d2c2527f1c67fe7517a6ec390886084786 |     
   sparc     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/6782c59d9f1e4cec4a11c15956d1899885b9fab1 |     
   mipsel    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/103480cd60f1398f1935be583140bb3e9e5549e3 |     
    arm      |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/45714d341b418f89a6e74628b134af67886698b6 |     
   armeb     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/435790f0c9be3e1a49eb38f35b334f55a18617f8 |     
 powerpc64   |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/d81c3d5fdeb0a8533798bac53f9896c159d0f5f6 |     
  riscv64    |        host-delve-1.8.0        | NOK | http://autobuild.buildroot.net/results/1b55721e1ad21937c1b3b9c858e44daa2441d72a |     
    i686     |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/049e681ebf6aff0db168aabcb37e8ec5de9783da |     
   sparc     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/e0c92162fd1c548f15e70de25144827ceab35b28 |     
   xtensa    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/c9a3ffbb3cdeb675ec4abbb4adf1f8ece11f019a |     
   s390x     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/7e768a9c72e6a668ded8a58fbe0d4815c22d2a8f |     
    m68k     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/d4e2561cda0f261fdbdabd3930aa3df189e922bd |     
    or1k     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/a9075422f335751f0b81bff0eb3cd90bd459607a |     
 powerpc64   |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/cedb43e6e8de02443072b6abcd004156e60403ae |     
  riscv64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/bd4f6dd1185d2dc7a9f256eb3b09d1df7359cc3e |     
   armeb     |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/92120b23445a25907ba8673bb03ef70b51c6563e |     
   x86_64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/08040f42f3303730c1e1eef9fb26e1e34bc1e225 |     
   armeb     |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/188609c91f157db0e0bdbf280ae5732dc3a03587 |     
  sparc64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/ed9d8153d1c5ee84c4c674ed9ce9bf45e4b7a4b5 |     
    arm      |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/db729e8351a53c3bbd34847f52d05ec57baec34c |     
powerpc64le  |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/7d1b93dd725f6fbb308eaf6b51bf939fa5832910 |     
   x86_64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/b8eb8ef1b41fd7b1349f5a9899dea2244e1c74bf |     
    arm      | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/35786098b68a7987d76fc93db32a418fc18b4223 | ORPH
    i586     |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/937464cef3e5ac3f83d4f1403d592adac21d0eed |     
  sparc64    |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/ec329aa39e1b2a0218cc1d92e7b61f3560bc967d |     
    arm      |          imagemagick           | TIM | http://autobuild.buildroot.net/results/1ea44d76754411b491cbd1373eb8ec71deb90248 |     
  riscv64    |          json-c-0.16           | NOK | http://autobuild.buildroot.net/results/9dd56b27b45f92a7a6152b851bf2cf9e3df3cf47 |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/d1654055b44ab0c330592f3da2e9b36c46669a63 | ORPH
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/49dbad8c8a7f94670201a3838fd8e09aabc881d1 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/5dbe5a9dea0a6e6d4e94a78386ef083ca5264a71 |     
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/4fc16d459d40969302edad91f6c3187c9f4d4cb9 | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/e76b354e3a0e1cf19f2fff9d809bfa12e0b2ec1d | ORPH
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/193f02c3c4eac5879e13228c24a907f8e194beee | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/80652b326ceffa78c92b329a00732dbc00fc52cd | ORPH
microblazeel |         libkcapi-1.4.0         | NOK | http://autobuild.buildroot.net/results/be66e0a7fd2c108d8df2b5a9a0f6c93dacaa90f8 |     
    arc      |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/be4685f7c57a5bd06490b411fb111b7bc1db07cc |     
  riscv32    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/c2c0caa1392f2897c0ce931a1488578df212975e |     
 aarch64_be  |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/a993b435b3beaa2777b05da696a1f24adf9cf3d6 |     
    arm      |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/f7e6824c62052e6792b781dcd9fd262e93800653 |     
  sparc64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/8e6cf2b596166b9c750c9010f08a2fd1db186812 |     
 aarch64_be  |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/887a79b289b54ac3346bbe455589ce565e4bf0b1 |     
 powerpc64   |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/df308d379691c6ee19a91b3678d13cd3cc28f0d4 |     
    arc      |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/ce2a127584c9e36413db39d64ed854a1d417c2f7 |     
  sparc64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/7493ae76c9263c65174c9bc83d64941cb241b63d |     
   mips64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/9eb8f07bc1c3e8b1e45eb86fa16081a50884b879 |     
 aarch64_be  |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/50dd3904f66fd183f00ff236f49f18fdcd07031e |     
   s390x     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/a76d0b0f7a4ef56b2e2e351def9c6476cd87d5c2 |     
powerpc64le  |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/300b09dd29ec332d03e6fc7e3398d3abfc268bee |     
   armeb     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/3236177b716bff11bda45ff4d8b3929e216ab80f |     
  sparc64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/2a5db992b35098c214af44ccd44f245b44b65868 |     
   nios2     |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/deaf2229071eb1f2f74b202f94bc2e6a259a819b | ORPH
powerpc64le  |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/59f41e90f75f8e6e5393f1f925f2450b0cc63981 | ORPH
    arm      |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/48b7b32e89b8a8933343b15b4343251129e1d65b | ORPH
   sh4aeb    |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/0a5c991df1426d91b16432fe02225a9b0c0fec00 | ORPH
  mips64el   |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/ea9ce98c64b06109e215d0aa13a5cc2258c3be8c | ORPH
   mipsel    |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/22d0949acf3c09ddb5403894eee831b29ada60c2 | ORPH
  sparc64    |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/e05c35c8aa51be3111b720f15e00e4014c2e7d74 |     
   s390x     |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/797f74a92d73a9c191d2177de6b52ab261be1bf1 |     
    or1k     |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/4e6159958ce65b57446061848eaabfa677e70cce |     
    i686     |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/21b31486e08ec2fd9c2737b79f81e41dd6572be5 | ORPH
    arc      |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/30fb9bef39c80467d8d5b0012997c7c646963328 |     
    or1k     |      lttng-modules-2.13.1      | NOK | http://autobuild.buildroot.net/results/f349be58fae94c9094e9ef4409e039ad96719d12 |     
    sh4      |           lxc-5.0.1            | NOK | http://autobuild.buildroot.net/results/d1404a3f466d6572d7a38114e4a4739eac9b0e88 |     
   arceb     |        memcached-1.6.16        | NOK | http://autobuild.buildroot.net/results/45040a124582c989ce05d2ee150d958952c745b5 | ORPH
 powerpc64   |        memcached-1.6.16        | NOK | http://autobuild.buildroot.net/results/40988ea7e705142a110f4dd39dd7a7153b747a4c | ORPH
    i686     |          mender-3.4.0          | NOK | http://autobuild.buildroot.net/results/bf0875f70981eb9df408ec6dfffd3baaef805ddf |     
  powerpc    |         mesa3d-22.2.2          | NOK | http://autobuild.buildroot.net/results/69c1d3c70958e0c5747fc414c2c09591fee1a756 |     
   x86_64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/72751f3db75a1b27d0de8204deaec33986cbbdff |     
  aarch64    |           ne10-1.2.1           | NOK | http://autobuild.buildroot.net/results/2794823237045e5a9177f38bc9b9279fa9c19a57 |     
 microblaze  |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/d15fbdc4ba4780150f5ea0cf4d75723f2b8b06c8 | ORPH
powerpc64le  |        openpgm-5-3-128         | NOK | http://autobuild.buildroot.net/results/0a954b127e68be555082c0f64617d2c657d62bc8 |     
  aarch64    |  openvmtools-11.3.5-18557794   | NOK | http://autobuild.buildroot.net/results/2a3bd72dcbbb818c1d0f3bf7c1848e40eae31edc |     
    arm      |        pcsc-lite-1.9.9         | NOK | http://autobuild.buildroot.net/results/d81320e63fe6bd7f8fc7560a0e02f62ba377217a | ORPH
   sparc     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/332560352d5ac232e0a3f3f9f55f1578f7e16da8 |     
   arceb     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/f376b361cca5166795da13236d35d7852d205c36 |     
    arm      |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/7de6d9d44d8c38f60649003e116a00f262a74193 |     
    arc      |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/88e8f66108e299cd2f8b4a39afabf5ca003fdb26 |     
 microblaze  |            pigz-2.7            | NOK | http://autobuild.buildroot.net/results/eaad94d4df0b423ee213b59791c5cc9db246d3cf |     
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/0baf786f46d8d85789acb03d96b615c07d55409d | ORPH
    mips     |   python-cryptography-38.0.1   | NOK | http://autobuild.buildroot.net/results/1fdc5d640800d68ce7f1b01595b18e89bacd4723 |     
    mips     |           qemu-7.1.0           | NOK | http://autobuild.buildroot.net/results/adf28fba29d5a07ed752fb6cb58ffa315c4ebfde |     
    arc      | rtl8821au-4235b0ec7d7220a63... | NOK | http://autobuild.buildroot.net/results/b0b4007c2bea1935a59d9dfd97e9ecf7239a6824 |     
    mips     |     s6-linux-utils-2.6.0.0     | NOK | http://autobuild.buildroot.net/results/500b6a5dc71b0dfa588d256328c2b76895dcb02d |     
    mips     |          uhd-4.3.0.0           | NOK | http://autobuild.buildroot.net/results/a7b38c52d16fe9cbced049b0e2a5aaaa08263f74 |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/3c630d14f26e797dd24072b6ca006370117dc3b3 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/bae6a7a8629d7a689ac3581ab363908dd6a3c346 |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/584009968f9f2025c243d12630933c84af478de8 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/52adff7a295d8a51ef8a2c9f556f624cf041609f |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/0847449a301254f48e3ce02919337110b2223f36 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/0dab4fdff7663c2d93a5019bb8ec334b192ceffa |     
   mips64    |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/1ee075823c802fe66f0d59a8e75c07d108653c4c | ORPH
   mips64    |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/6b6a1efa20d5d16de74c6d55418a36163bb89af4 | ORPH
    mips     |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/26c4763c343cf1c54773d4115154c0f486b69faa |     
   x86_64    |          xvisor-0.3.1          | NOK | http://autobuild.buildroot.net/results/3842e3f1d1268ebc43459a2261a818d49f9cad48 |     
  aarch64    |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/245c75131ab818f9f8f6112c606c2880f475fb66 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/1ea324e111fce1edc77b5a15aeef4c96dd233f80 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/0e5ac462ba84d2fa26ec90b90a6e368ed9e0af09 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/84522ea04b19d47627a3122492fde56efe9b3aae | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/64635f0ab1b08e5c42c8f43df49f40171eea8a1f | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/acfc6239a54e8941ef1905da66b6785607055a2c | ORPH


Classification of failures by reason for next
---------------------------------------------

                   aubio-0.4.9 | 7 
          imagemagick-7.1.0-51 | 4 
                   libnss-3.84 | 4 
            host-binutils-2.38 | 3 
       host-gdk-pixbuf-2.42.10 | 3 
              host-rust-1.65.0 | 3 
                    lxc-4.0.12 | 3 
         s6-linux-init-1.0.6.3 | 3 
                      xz-5.2.7 | 3 
                      crun-1.5 | 2 
                 dash-0.5.11.5 | 2 
glibc-2.36-66-ga1dc0be03c9d... | 2 
  gobject-introspection-1.72.0 | 2 
                   linux-6.0.1 | 2 
              traceroute-2.1.0 | 2 
                 uclibc-1.0.42 | 2 
android-tools-4.2.2+git2013... | 1 
                  boost-1.80.0 | 1 
                    brltty-6.5 | 1 
              cache-calibrator | 1 
            datatables-1.10.20 | 1 
                 dhcp-4.4.3-P1 | 1 
              dieharder-3.31.1 | 1 
        edk2-edk2-stable202102 | 1 
                elfutils-0.186 | 1 
             fontconfig-2.13.1 | 1 
                  gensio-2.5.5 | 1 
                gerbera-1.10.0 | 1 
             gnuradio-3.10.4.0 | 1 
         gobject-introspection | 1 
                heirloom-mailx | 1 
            host-binutils-2.37 | 1 
                host-go-1.19.3 | 1 
              host-pahole-1.24 | 1 
    host-python-greenlet-2.0.0 | 1 
                  jack2-1.9.21 | 1 
                jemalloc-5.3.0 | 1 
              libgcrypt-1.10.1 | 1 
                linuxptp-3.1.1 | 1 
                    norm-1.5.8 | 1 
                    opus-1.3.1 | 1 
                 pango-1.50.11 | 1 
            python-bunch-1.0.1 | 1 
rtl8189es-39c17661136da48f8... | 1 
             uccp420wlan-6.9.1 | 1 
                 wolfssl-5.5.2 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/525e8398752e4b7da13e64555021b8cc8860a2ac |     
 powerpc64   |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/4639bac8b721461e4cce831ced3acb3340a53c5b |     
   mipsel    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/ad0c867cb2d7c9146479f3eaab5c47dc9019452b |     
   sparc     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/9c5a2b98cab513972d60672f5268408247ef2b07 |     
 powerpc64   |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/626a9127144167d6c730249a0b0c7e94d7538c20 |     
   x86_64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/e3ca63be08da4a2301335b7668b2e2d67a01a6e4 |     
   mipsel    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/c446282334db47a6de15ab0e0718b83a534f883c |     
  riscv64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/0f5b75e87fd2be9a48c489b859717cd791289ef7 |     
   sparc     |          boost-1.80.0          | NOK | http://autobuild.buildroot.net/results/a0155527bf95f2c5752e1f5d802f7fae9fa4634e |     
  powerpc    |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/13a922619d4235b333e473e5a4d05bd900da529c |     
  sparc64    |        cache-calibrator        | NOK | http://autobuild.buildroot.net/results/c4638dd6237bb65c3176a99f9b9f57a5478e6587 |     
    sh4      |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/1fd2754a927fe51f32f4a0b47e3db8a5164dc156 |     
    m68k     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/80da5c0001eb8c57ea28afa9bf6a98120327cd35 |     
   mips64    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/ab14e2fc536f206bc786bcefcf91d3967dbcf4bd | ORPH
   mipsel    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/a5ec7e90ec2206dd3f5ee13085775c8c34854b4d | ORPH
    arc      |       datatables-1.10.20       | NOK | http://autobuild.buildroot.net/results/facb6d633474e4887b8885ae85f3f548b294fe4b |     
    sh4a     |         dhcp-4.4.3-P1          | NOK | http://autobuild.buildroot.net/results/2e608669f46c40b59d3d1a21934f7fe44efe2280 | ORPH
 microblaze  |        dieharder-3.31.1        | NOK | http://autobuild.buildroot.net/results/022c10f9ed71ece64caae298a7d9932ea240033f |     
  aarch64    |     edk2-edk2-stable202102     | NOK | http://autobuild.buildroot.net/results/aa2c2edabeda0ea18a71b94ea5554a2807d22707 |     
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/8f031f85166fd9aa7366e38332fb95036e362aac | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/572d42ffe99b69ac8ab2af8cc124453d6c29ef12 | ORPH
   sh4eb     |          gensio-2.5.5          | NOK | http://autobuild.buildroot.net/results/c8ef02185678ab9681680b2357ed58b903722695 |     
   x86_64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/6b0309105db0d11dd8e202e65ee82a584ab98d52 |     
   nios2     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/42e308600e5fdce5ce359970f322bccb05d8a0a8 |     
    sh4      | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/995d3d9426ae4a23999edf165041fdbb09ffc2eb |     
 aarch64_be  |       gnuradio-3.10.4.0        | NOK | http://autobuild.buildroot.net/results/ac80b9d10d0c28e1f4e9c38c7d7cb4c5c824bfef |     
   armeb     |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/b30658c0454a87f48bcc539565b94ad28b9487b5 |     
   mipsel    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/24f0e62dcc9fe634c00566d1feb345d92bba1e8c | ORPH
    i686     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/1d9c896f08e1e0a8c2bac4fbc2ec714dfb9d2053 | ORPH
   armeb     |         heirloom-mailx         | TIM | http://autobuild.buildroot.net/results/8584e8f70ab14c71a5f0185f0a85543ae248d13b |     
   s390x     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/0f5318dbc43721668920cfdacc17861ab3c38ad1 |     
   armeb     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/11833aa63924cd5f47fa1d231b85b96fc799a33e |     
   mipsel    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/5656de0927676ecffb42a98e3f3c72da57932534 |     
    mips     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/3f6bd9e6c91caa67438f82379418f95b7016eff7 |     
   arceb     |    host-gdk-pixbuf-2.42.10     | NOK | http://autobuild.buildroot.net/results/54ed09a1174a27fa1420b6e711e5773d0a0ee31e | ORPH
   sh4aeb    |    host-gdk-pixbuf-2.42.10     | NOK | http://autobuild.buildroot.net/results/a8133740d1b0b65a7adb604cb08889bf04848f20 | ORPH
    sh4      |    host-gdk-pixbuf-2.42.10     | NOK | http://autobuild.buildroot.net/results/7e52719d767d2312c05e9fc425116791007ada33 | ORPH
  aarch64    |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/74c09e3c04dded1e83718325d047ba78c14bd29c |     
    i686     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/b85a84c37e56af5e423f7dd7ae164972cabf2d91 |     
    i586     |   host-python-greenlet-2.0.0   | NOK | http://autobuild.buildroot.net/results/19a88b5974b579f6f1f7d20b97fb4026db1e82c2 |     
 powerpc64   |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/f1223e45c4e2b59dabef50e455173fbd894989b1 |     
    mips     |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/4e3d428454b8cf99011dc8039652da08f8e5f191 |     
  aarch64    |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/0d28f156df2a267a027716031dbd63c8efc94b04 |     
   arceb     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/73ae65c5195b59ae89d17a6ff67ecbc6f58eb7ff | ORPH
   mipsel    |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/bfff551829f7152b2848d6131ca55539b5d294e6 | ORPH
    arc      |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/aff29605ae195fbf8d32368d13983b477728c7a4 | ORPH
    mips     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/8a7d01aefa607420f66a9524652d06440cc78778 | ORPH
   s390x     |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/ea967cfdcd74f81f3fc7e22b63fa547bb202c69c |     
    sh4      |         jemalloc-5.3.0         | NOK | http://autobuild.buildroot.net/results/bdac9a8a9d732234bcc1b4f101a5e706fd91b068 |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/2b573b3973ca19d092ad1d184d95c293a5c21e16 | ORPH
 aarch64_be  |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/cf0ff45219bc4f9eff7d5f5d9cdd87e696229431 |     
   mipsel    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/82b28c726f8185b6ba002df889e1d5f7ed23ec0b |     
powerpc64le  |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/c0f636e0ea6b8de7223545cc127e7968cfb23ee9 |     
   arceb     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/2d36b059c356c87a63ab7a0b4b60670c7a9e94f8 |     
  sparc64    |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/a608fa18fa7bc4b9da537aa2c33853b2d4fd9126 | ORPH
   s390x     |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/b54b2ea94c6a7cf6fcbfa549a6d2fb39d7fde064 | ORPH
powerpc64le  |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/9a7c4c608257f387bdee2115bcc78c3de2aacc6c |     
powerpc64le  |           lxc-4.0.12           | NOK | http://autobuild.buildroot.net/results/ad38b7a58455bf0ced17040663f8e25a50c6607b |     
 aarch64_be  |           lxc-4.0.12           | NOK | http://autobuild.buildroot.net/results/5ca713d86e3fef9d1590fe1065fb8aa1013baf11 |     
powerpc64le  |           lxc-4.0.12           | NOK | http://autobuild.buildroot.net/results/bb2627bfae94bf48a2ac61563274fd94f2f17355 |     
    arm      |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/48c77145e5bdf3443b348b410c1edaef8ce90311 | ORPH
    arm      |           opus-1.3.1           | NOK | http://autobuild.buildroot.net/results/98310ed7ea168b6f498c7252cbf403b8316d3730 | ORPH
    i686     |         pango-1.50.11          | NOK | http://autobuild.buildroot.net/results/fd0da18445af324ee910f6c810caff404d2c9d08 | ORPH
   mipsel    |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/f01c8d2158c413bffd1438a7b4994b88e4bbe2ff |     
    arc      | rtl8189es-39c17661136da48f8... | NOK | http://autobuild.buildroot.net/results/be90a0d218243de5fc780fe810f7411ab5fe05fa |     
   xtensa    |     s6-linux-init-1.0.6.3      | NOK | http://autobuild.buildroot.net/results/a24608c4129bea97780621a36205ac7104e32fc6 |     
 microblaze  |     s6-linux-init-1.0.6.3      | NOK | http://autobuild.buildroot.net/results/9f41d0c8e50bfb94e15b4713991224db2d424a00 |     
   armeb     |     s6-linux-init-1.0.6.3      | NOK | http://autobuild.buildroot.net/results/6f3dfc701f87b8c95715da94921811d3d4d59be4 |     
   mips64    |        traceroute-2.1.0        | NOK | http://autobuild.buildroot.net/results/6d8b1812d1cc23c12d827e7338e3fe523d6375c1 |     
 microblaze  |        traceroute-2.1.0        | NOK | http://autobuild.buildroot.net/results/897dd7f2658ccecb03587d14add73f7b46acb05e |     
  riscv32    |       uccp420wlan-6.9.1        | NOK | http://autobuild.buildroot.net/results/0a4ee6dc4f6d4cd7a69af8d1f1d34273aa978942 | ORPH
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/783010d3dbdeb1d08fe3cffa61474caeb133f82c |     
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/6c35a0e964aef90027228a6a207a9b57d8976fef |     
    mips     |         wolfssl-5.5.2          | NOK | http://autobuild.buildroot.net/results/e4264b4a2fd2294c29235be6ba07dd4cfdbf0f6c |     
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/ca4fec17fdf1706942af37810657f329d0eaa7c6 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/5f5825fc5737fd1bb5f63ad556248fd215e8d938 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/6f8d12552e20bae119688ae6a60ecdb51ba87268 | ORPH


Classification of failures by reason for 2022.02.x
--------------------------------------------------

                  exempi-2.6.1 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/feae5ba4304892e15082c107c8281e9d16e08b9d |     


Classification of failures by reason for 2022.08.x
--------------------------------------------------

host-pahole-73383b3a39afe86... | 2 
/home/buildroot/autobuild/i... | 1 
                gerbera-1.10.0 | 1 
              host-rust-1.62.0 | 1 
              libgcrypt-1.10.1 | 1 
                 openal-1.22.0 | 1 
               openblas-0.3.20 | 1 
              skalibs-2.10.0.3 | 1 
                tealdeer-1.5.0 | 1 
                       unknown | 1 
                 wolfssl-5.5.3 | 1 


Detail of failures for 2022.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/d26985b423a7c0598ef478c6329eae428ce589c9 |     
    arm      |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/51e9c5ba1de88470afcad6f7b631766e9e9f8d45 |     
 powerpc64   | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/4d4ac07b7998514ae478fbf14c4a7dc8e0e4fff3 |     
    m68k     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/28f905d63b2f3de62be6a72fdf1a0ceb92f52413 |     
   s390x     |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/12b792b2a1591a0e499ae2e47f7d950ab08e36eb |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/27f4694747c7fb7d68b2fd1c8c2b5ef604300558 | ORPH
   mips64    |         openal-1.22.0          | NOK | http://autobuild.buildroot.net/results/222a58063bf3a4f47ac9199d67c359d27a407618 |     
    i686     |        openblas-0.3.20         | NOK | http://autobuild.buildroot.net/results/c3783d8006a6d9e5a936b0c64baee19c1e884c4b | ORPH
    or1k     |        skalibs-2.10.0.3        | NOK | http://autobuild.buildroot.net/results/f4c7217efefe979dcee046ff0d29ae297c5f4513 |     
  sparc64    |         tealdeer-1.5.0         | NOK | http://autobuild.buildroot.net/results/5cfe6fe545e6df8e44cb7237933d3efb66d12938 |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.net/results/3f7cce2412014144fc69c22b0af3191b384927da |     
   mipsel    |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/73db584a50dfebb9e16894b72d6bb69ddbd60e3f |     


Gitlab CI results for 2022-11-17
================================

Detail of defconfig failures for 2022.02.7
------------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
         qemu_arm_versatile_nommu | https://gitlab.com/buildroot.org/buildroot/-/jobs/3338616732  | ORPH 
                qemu_m68k_mcf5208 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3338616742  |      
           qemu_xtensa_lx60_nommu | https://gitlab.com/buildroot.org/buildroot/-/jobs/3338616937  |      


Detail of runtime-test failures for 2022.02.7
---------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
...X8664corei7GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3338618478  | ORPH 
...corei7MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3338618482  | ORPH 
...nX8664corei7MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3338618493  | ORPH 
...664v2GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3338618505  | ORPH 
...8664v2MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3338618508  | ORPH 
...64v2UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3338618510  | ORPH 
...8664v3MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3338618519  | ORPH 
...64v3UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3338618521  | ORPH 
...664v4GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3338618522  | ORPH 
...8664v4MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3338618523  | ORPH 
...64v4UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3338618526  | ORPH 
...linX86core2GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3338618532  | ORPH 
...6core2MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3338618535  | ORPH 
...ernalToolchainCtngMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3338617834  | ORPH 
...ToolchainSourceryArmv5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3338617845  | ORPH 
                 TestF2FS | https://gitlab.com/buildroot.org/buildroot/-/jobs/3338617079  | ORPH 
  TestLuajitLuaFileSystem | https://gitlab.com/buildroot.org/buildroot/-/jobs/3338617376  | ORPH 


Detail of defconfig failures for 2022.08.2
------------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
           qemu_xtensa_lx60_nommu | https://gitlab.com/buildroot.org/buildroot/-/jobs/3335933480  |      


Detail of runtime-test failures for 2022.08.2
---------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
               TestExt2r1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3335933536  | ORPH 
...86i686MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3335934116  | ORPH 
...ernalToolchainCtngMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3335933834  | ORPH 
           TestLuaLuazlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/3335933636  | ORPH 
        TestLuajitLuacURL | https://gitlab.com/buildroot.org/buildroot/-/jobs/3335933621  | ORPH 
       TestPerllibwwwperl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3335933687  | ORPH 
             TestSyslogNg | https://gitlab.com/buildroot.org/buildroot/-/jobs/3335933796  | ORPH 


Detail of defconfig failures for 2022.11-rc2
--------------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
           qemu_xtensa_lx60_nommu | https://gitlab.com/buildroot.org/buildroot/-/jobs/3332086075  |      


Detail of runtime-test failures for 2022.11-rc2
-----------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
         TestLuaLuaAugeas | https://gitlab.com/buildroot.org/buildroot/-/jobs/3332086451  | ORPH 
                 TestPixz | https://gitlab.com/buildroot.org/buildroot/-/jobs/3332086617  | ORPH 
     TestPythonPy3Pexpect | https://gitlab.com/buildroot.org/buildroot/-/jobs/3332086737  | ORPH 



-- 
http://autobuild.buildroot.net

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

