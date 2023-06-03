Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAA7BC77B73
	for <buildroot@archiver.kernel.org>; Sat,  3 Jun 2023 05:46:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 58E2640222;
	Sat,  3 Jun 2023 05:46:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 58E2640222
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8_ICADzNrd7w; Sat,  3 Jun 2023 05:45:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A80414012B;
	Sat,  3 Jun 2023 05:45:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A80414012B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 478AB1BF417
 for <buildroot@lists.busybox.net>; Sat,  3 Jun 2023 05:45:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 213874012B
 for <buildroot@lists.busybox.net>; Sat,  3 Jun 2023 05:45:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 213874012B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WWW-vGLy2LSP for <buildroot@lists.busybox.net>;
 Sat,  3 Jun 2023 05:45:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 90763400FB
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 90763400FB
 for <buildroot@buildroot.org>; Sat,  3 Jun 2023 05:45:54 +0000 (UTC)
X-GND-Sasl: thomas.petazzoni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 88654FF808
 for <buildroot@buildroot.org>; Sat,  3 Jun 2023 05:45:51 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sat, 03 Jun 2023 05:45:51 -0000
Message-Id: <20230603054557.213874012B@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1685771151; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Mu08ogn3ZEY5Oq+rTuq8jCRMVwBqn/YgE6Cf2JyeNQQ=;
 b=Kr+IXsD4OOGyZWGnx2yEhJ7FwRsvP515XMXm/3uETv0Mrm8NAzl+SGUY6Tl1huiRIoymRn
 diHisbUI/YcFGfHfAelusxKH2sEKHaR01YK0dtSKHJc4DuUKx/9v21TTXH8jyFJ0KsrgS9
 DxBIWdaeMSALiTKaStTW+x2Bu8iXijZofqyuB9VWCk1o1GyARKD4WrYQcjbgvX4Gy2zdd8
 t0ZEZqtgDSTfVegT3Q774nUdjdKOWyXqxW3LqNxqo+NLQnchUDBXUnVSUqCrxqHjXWWdNh
 PdrXgE4DwHcpLjIuefi0LFvRgXRffgKegeeM10JZDxcgKKL872600+uBIBggXw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Kr+IXsD4
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-06-02
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

Autobuild statistics for 2023-06-02
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  3  |  0  |  0  |  3  |
  2023.02.x  |  7  |  5  |  0  | 12  |
    master   | 68  | 75  |  0  | 143 |

Classification of failures by reason for master
-----------------------------------------------

package/sdl2_net/sdl2_net.m... | 7 
  gobject-introspection-1.74.0 | 5 
                       unknown | 5 
            host-binutils-2.38 | 3 
               syslog-ng-4.1.1 | 3 
                 agentpp-4.6.0 | 2 
                elfutils-0.186 | 2 
             fontconfig-2.14.2 | 2 
                haveged-1.9.18 | 2 
            host-binutils-2.37 | 2 
              host-rust-1.68.2 | 2 
               libglib2-2.76.1 | 2 
                    olsr-0.9.8 | 2 
                  acpid-2.0.34 | 1 
           at-spi2-core-2.48.2 | 1 
                     audit-3.1 | 1 
                    bat-0.23.0 | 1 
             berkeleydb-5.3.28 | 1 
                  boost-1.82.0 | 1 
                bpftool-v7.1.0 | 1 
                    brltty-6.5 | 1 
                 dc3dd-7.2.641 | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
fs/ubi/ubi.mk:51: /home/bui... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
glibc-2.37-2-g9f8513dc64119... | 1 
            host-binutils-2.39 | 1 
                host-go-1.19.9 | 1 
host-heimdal-f4faaeaba371ff... | 1 
libdill-32d0e8b733416208e04... | 1 
                libmdbx-0.12.5 | 1 
               libsigsegv-2.14 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                mongodb-4.2.18 | 1 
                    mpv-0.35.1 | 1 
               nfs-utils-2.6.3 | 1 
   openvmtools-11.3.5-18557794 | 1 
                   perl-5.36.1 | 1 
                  reaver-1.6.6 | 1 
                    sdl-1.2.15 | 1 
           sdl2_net-legal-info | 1 
               tcf-agent-1.7.0 | 1 
                   trinity-1.9 | 1 
                 uclibc-1.0.43 | 1 
ulog-0389d243352255f6182326... | 1 
                xenomai-3.0.10 | 1 
               zxing-cpp-1.4.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |          acpid-2.0.34          | NOK | http://autobuild.buildroot.net/results/ea31b5e4cbc38423fc4f57bc5544b5d08d0dd7dd | ORPH
   s390x     |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/bc79f69eb0f5464bf8b7e0850a89bee787428966 |     
   sparc     |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/b6f17d68473ca4053905f4cebc5fff01fde3ecb5 |     
powerpc64le  |      at-spi2-core-2.48.2       | NOK | http://autobuild.buildroot.net/results/3405e7e851a2edd9ffd655796046c15c50b5e67c |     
    arm      |           audit-3.1            | NOK | http://autobuild.buildroot.net/results/ffc2b3172c35f3b848761a713287b731dcded21c |     
   armeb     |           bat-0.23.0           | NOK | http://autobuild.buildroot.net/results/e159828336448c17995e04c3f48331fd888cf53e |     
    sh4      |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/a9bb9062b75e5f626638af8359c1bf8539b07c5f | ORPH
    arc      |          boost-1.82.0          | NOK | http://autobuild.buildroot.net/results/61e21303b2f07743160c062c1a3bd39a82b7c4fb |     
   s390x     |         bpftool-v7.1.0         | NOK | http://autobuild.buildroot.net/results/7146a575cd22d3adbc8ffeb2ced605d4f6643d81 |     
   mipsel    |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/37be10e0d11326c78b01083fad989207832d93f9 |     
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/0e018d5680d6ea3eb3f590faacb189b464e3b948 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/ea3d13c8bdd750ede871d94c99467a1772599e32 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/a365c91d3d93fe7a77194f82d5db5b7958991207 | ORPH
  riscv64    |       fontconfig-2.14.2        | NOK | http://autobuild.buildroot.net/results/408946ff2b8bf5959a0f63c890636d81eff28b10 | ORPH
  riscv64    |       fontconfig-2.14.2        | NOK | http://autobuild.buildroot.net/results/128537ca206b1e65e655378deba85d6f0917de15 | ORPH
    arm      | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/92161998e16a14d0f82d64d0408c4fa6e74d43c2 |     
 microblaze  | fs/ubi/ubi.mk:51: /home/bui... | NOK | http://autobuild.buildroot.net/results/eccee6f322d3322d9bbb37b497b72764a622fcbb |     
  sparc64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/4c22d98d0094448b097a7bc7ffb7c4012d34b46a |     
    arm      | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/c40d1ad26e7e2e5b4ca53053d311f72e2b60cc64 |     
   s390x     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/d8dd927cde0c47e06ca9e097a509bcec66b2b412 |     
  powerpc    | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/630ace2622c9106116d63d1c28e5edceaa068b7e |     
   nios2     |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/07140edafaa83ea25e002a2ca3364333eff0910f | ORPH
  sparc64    |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/9587ba3cb91138b6b545c9c5ed48b6f583a89d6d | ORPH
   nios2     |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/6d8419c3cd7f845962c561fb02540663d0c8e5a2 | ORPH
   nios2     |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/00aa5eb14b8a32810a5242c1eb5212f0a42f60e7 | ORPH
   nios2     |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/0a3442ead42ba51a068d7034e06ee24876e914c1 | ORPH
 aarch64_be  |         haveged-1.9.18         | NOK | http://autobuild.buildroot.net/results/914658f3192b13c011d8cee85b7bf2c45cdb9105 |     
    arm      |         haveged-1.9.18         | NOK | http://autobuild.buildroot.net/results/58d3f8e3206ada0e5efa587bb75f82fb3b6edf63 |     
   mipsel    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/81021f957c56f6b0980d284b1499030e633741bd |     
  riscv64    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/1b811279a13cb1f1f0c48236a3870e45468824b8 |     
 aarch64_be  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/9b05b63a93a790fc1c198a501f2fb861c82a0644 |     
  mips64el   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/51d6ca384f12efdf4004d4157b290b2a1931b228 |     
   mips64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/7080452aa4872e6dc031502cfa5df9fd980b072a |     
powerpc64le  |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/19ad2629bff597e3cb978e0e6cf7a08ed05ac58a |     
  aarch64    |         host-go-1.19.9         | NOK | http://autobuild.buildroot.net/results/1edc84cab6938aa2b9ad5bbb3197c434c6ab07b2 |     
    arm      | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/8d665b5b0f25638c8c1a80d02cda8021250c0128 | ORPH
   s390x     |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/a0fca31a1816d22aa0605f8057735a4911ad6852 |     
    i686     |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/043f5d487b803df8a182055c9679fdd3b053aa2c |     
   armeb     | libdill-32d0e8b733416208e04... | NOK | http://autobuild.buildroot.net/results/2c4b81405f940ce47de04f271de820f2babcdb94 |     
   sparc     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/c81a033a65723b371ffa3655021db15874fc2116 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/94ffddc51e38b321a3dbada5857130c148d2a4e0 |     
    i686     |         libmdbx-0.12.5         | NOK | http://autobuild.buildroot.net/results/506f3f673bf2c62c71158b8bb6432e53464f9b15 |     
   arceb     |        libsigsegv-2.14         | NOK | http://autobuild.buildroot.net/results/a6e971bde1664081ef1d9d35b4dbb373fc1ea55e |     
    sh4a     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/b6702f7c14c308575b43c4a770f797dad11070c6 | ORPH
    arm      |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/dddeee85fe67ae3e3c9662a97c9c9141cc3c8de1 |     
 aarch64_be  |           mpv-0.35.1           | NOK | http://autobuild.buildroot.net/results/9b5915016b29c5caf596dd78ce26c32ddf7e3c75 |     
   arceb     |        nfs-utils-2.6.3         | NOK | http://autobuild.buildroot.net/results/1d65e88a7b87a8726036fc79a54808a34e61337d |     
   sparc     |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/99131e69aaf8a3ccfbe87c0fa105c1428de44b69 | ORPH
    or1k     |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/2d83e5f94d33ccb84fd71effe7cc8e7b0c20a015 | ORPH
   x86_64    |  openvmtools-11.3.5-18557794   | NOK | http://autobuild.buildroot.net/results/5a0ae37b95ac8102ba73f337e7f636ef0b1c03d9 |     
   mips64    | package/sdl2_net/sdl2_net.m... | NOK | http://autobuild.buildroot.net/results/37e5075a5c790d5c96bdc72c44d4362a16ae00bb |     
   x86_64    | package/sdl2_net/sdl2_net.m... | NOK | http://autobuild.buildroot.net/results/4e83aebe18aadcd37a0c132404222979248fdef8 |     
   nios2     | package/sdl2_net/sdl2_net.m... | NOK | http://autobuild.buildroot.net/results/d4b24765e6d4ac9f4aa19726bd562d6d057b9079 |     
  mips64el   | package/sdl2_net/sdl2_net.m... | NOK | http://autobuild.buildroot.net/results/d23219b8bb2e82681e503543f519016804ba5666 |     
 aarch64_be  | package/sdl2_net/sdl2_net.m... | NOK | http://autobuild.buildroot.net/results/80f9f4d0655f3946083c4169196268b71a6ffe6c |     
powerpc64le  | package/sdl2_net/sdl2_net.m... | NOK | http://autobuild.buildroot.net/results/405d58964a31989338049d968740d017875df7af |     
    mips     | package/sdl2_net/sdl2_net.m... | NOK | http://autobuild.buildroot.net/results/8780607bc0e68a8f1521a1c9b9ce177785cd72fe |     
   arceb     |          perl-5.36.1           | NOK | http://autobuild.buildroot.net/results/a10014833b876f671026489f7dc4ebf6829a20ea |     
   arceb     |          reaver-1.6.6          | NOK | http://autobuild.buildroot.net/results/4dd5400176107303d2c7ef628094177521660b84 |     
    sh4a     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/29b8b70717fbdb36d48d20a02e8117ecfd742696 | ORPH
powerpc64le  |      sdl2_net-legal-info       | NOK | http://autobuild.buildroot.net/results/3a7074611b1d719ac0a9ba1a2a8911ae77c0bc4a | ORPH
  mips64el   |        syslog-ng-4.1.1         | NOK | http://autobuild.buildroot.net/results/ae5a6c339004405e7717a9841770a75a99403585 |     
   nios2     |        syslog-ng-4.1.1         | NOK | http://autobuild.buildroot.net/results/31d3ce3ddc49325a00d74f65370fa687cd0c851e |     
   x86_64    |        syslog-ng-4.1.1         | NOK | http://autobuild.buildroot.net/results/3476faed1bdafae53b9f9edf0ec814551e5d0180 |     
 microblaze  |        tcf-agent-1.7.0         | NOK | http://autobuild.buildroot.net/results/c85bf8c53260271d06cf83ccc8f6cf4b6a848e67 |     
    mips     |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/415a262a546c82a4f51cafa532d789886d6d90f4 | ORPH
  riscv64    |         uclibc-1.0.43          | NOK | http://autobuild.buildroot.net/results/f1a4a07bfc8a3a5be163c48ba437e3c3c16d0545 |     
  riscv32    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/193bc29371cd040447f5efa5c99a51df93060669 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/b5b2cadedd9d50d0005b600b7ae8c338ed1b5dc8 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/38c48d82e3192ae371b0c253f527ac335d431b13 |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/8d3fe52a537a0dcfe6b45052fcfbbfb355f49914 |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/56a7f31885739d9775db4e1f566b3e2f86a5f235 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/7aefbda553442745367c1ad39c826236bdecf296 |     
powerpc64le  |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/2ced3335c45bab54c3d42da4958217878b827af1 |     
   mipsel    |        zxing-cpp-1.4.0         | NOK | http://autobuild.buildroot.net/results/886c4527a973a50a8d7cd611cbf2733ad5aaded2 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                  ffmpeg-4.4.4 | 1 
                     gmp-6.2.1 | 1 
host-gdb-arc-2020.09-releas... | 1 
               host-qemu-7.2.0 | 1 
               libglib2-2.72.3 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |          ffmpeg-4.4.4          | NOK | http://autobuild.buildroot.net/results/e60679f6ed455c8c95e371db6e5e40f397d83fd8 |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/7d55b1c7d0939b8f38f920d017b28b0793e63537 | ORPH
   arceb     | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/f61001cb874d2c82f4ffb2d75b9f481e6513ba4b | ORPH
   sparc     |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/b68f71be136efac8e7c2a0b2864a94d3518d40aa |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/d09e5be58d87dd4d78d89d630bef24cd566f5823 |     


Gitlab CI results for 2023-06-02
================================

Detail of defconfig failures for 2023.02.1
------------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                       qemu_s390x | https://gitlab.com/buildroot.org/buildroot/-/jobs/4254727540  |      


Detail of runtime-test failures for 2023.02.1
---------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
      TestClangCompilerRT | https://gitlab.com/buildroot.org/buildroot/-/jobs/4254727757  | ORPH 
           TestCrudiniPy3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4254727760  | ORPH 
...ToolchainBuildrootMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/4254728142  | ORPH 
...olchainBuildrootuClibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/4254728143  | ORPH 
...xternalToolchainCCache | https://gitlab.com/buildroot.org/buildroot/-/jobs/4254728144  | ORPH 
...ernalToolchainCtngMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/4254728145  | ORPH 
...ToolchainSourceryArmv4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4254728147  | ORPH 
...ToolchainSourceryArmv5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4254728148  | ORPH 
...ToolchainSourceryArmv7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4254728149  | ORPH 
     TestFileCapabilities | https://gitlab.com/buildroot.org/buildroot/-/jobs/4254727607  | ORPH 
     TestGlibcAllTimezone | https://gitlab.com/buildroot.org/buildroot/-/jobs/4254727634  | ORPH 
...DefaultLimitedTimezone | https://gitlab.com/buildroot.org/buildroot/-/jobs/4254727636  | ORPH 
           TestIPythonPy3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4254727787  | ORPH 
       TestInitSystemNone | https://gitlab.com/buildroot.org/buildroot/-/jobs/4254727707  | ORPH 
      TestIso9660Grub2EFI | https://gitlab.com/buildroot.org/buildroot/-/jobs/4254727665  | ORPH 
 TestIso9660Grub2External | https://gitlab.com/buildroot.org/buildroot/-/jobs/4254727667  | ORPH 
...0Grub2ExternalCompress | https://gitlab.com/buildroot.org/buildroot/-/jobs/4254727669  | ORPH 
   TestIso9660Grub2Hybrid | https://gitlab.com/buildroot.org/buildroot/-/jobs/4254727673  | ORPH 
 TestIso9660Grub2Internal | https://gitlab.com/buildroot.org/buildroot/-/jobs/4254727676  | ORPH 
...so9660SyslinuxExternal | https://gitlab.com/buildroot.org/buildroot/-/jobs/4254727679  | ORPH 
...slinuxExternalCompress | https://gitlab.com/buildroot.org/buildroot/-/jobs/4254727682  | ORPH 
...so9660SyslinuxInternal | https://gitlab.com/buildroot.org/buildroot/-/jobs/4254727686  | ORPH 
               TestLibJXL | https://gitlab.com/buildroot.org/buildroot/-/jobs/4254727791  | ORPH 
         TestLuajitLuaSec | https://gitlab.com/buildroot.org/buildroot/-/jobs/4254727883  | ORPH 
             TestPerftest | https://gitlab.com/buildroot.org/buildroot/-/jobs/4254727939  | ORPH 
 TestPerlLWPProtocolhttps | https://gitlab.com/buildroot.org/buildroot/-/jobs/4254727969  | ORPH 
       TestPerllibwwwperl | https://gitlab.com/buildroot.org/buildroot/-/jobs/4254727967  | ORPH 
         TestPythonPy3Can | https://gitlab.com/buildroot.org/buildroot/-/jobs/4254728032  | ORPH 
    TestPythonPy3DBusFast | https://gitlab.com/buildroot.org/buildroot/-/jobs/4254728043  | ORPH 
      TestPythonPy3Django | https://gitlab.com/buildroot.org/buildroot/-/jobs/4254728047  | ORPH 
         TestPythonPy3Git | https://gitlab.com/buildroot.org/buildroot/-/jobs/4254728051  | ORPH 
...PythonPy3MagicWormhole | https://gitlab.com/buildroot.org/buildroot/-/jobs/4254728060  | ORPH 
       TestPythonPy3Munch | https://gitlab.com/buildroot.org/buildroot/-/jobs/4254728062  | ORPH 
                   TestS6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4254728103  | ORPH 
             TestZfsGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/4254728132  | ORPH 
              TestZfsMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/4254728134  | ORPH 
            TestZfsUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/4254728136  | ORPH 


Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                       beaglebone | https://gitlab.com/buildroot.org/buildroot/-/jobs/4390011205  |      
                   beaglebone_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4390011212  |      
           freescale_imx6qsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/4390011272  |      
                 grinn_chiliboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/4390011313  |      
                 hifive_unleashed | https://gitlab.com/buildroot.org/buildroot/-/jobs/4390011316  |      
                         mx53loco | https://gitlab.com/buildroot.org/buildroot/-/jobs/4390011422  |      
                      nitrogen6sx | https://gitlab.com/buildroot.org/buildroot/-/jobs/4390011430  |      
                       nitrogen6x | https://gitlab.com/buildroot.org/buildroot/-/jobs/4390011434  |      
                        nitrogen7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4390011437  |      
                       nitrogen8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/4390011440  |      
                      nitrogen8mm | https://gitlab.com/buildroot.org/buildroot/-/jobs/4390011446  |      
                      nitrogen8mn | https://gitlab.com/buildroot.org/buildroot/-/jobs/4390011451  |      
                      nitrogen8mp | https://gitlab.com/buildroot.org/buildroot/-/jobs/4390011455  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/4390011508  |      
                       pandaboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/4390011569  |      
                   pc_x86_64_bios | https://gitlab.com/buildroot.org/buildroot/-/jobs/4390011576  |      
                    pc_x86_64_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/4390011581  |      
                   pcengines_apu2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4390011584  |      
                qemu_aarch64_ebbr | https://gitlab.com/buildroot.org/buildroot/-/jobs/4390011597  |      
                qemu_aarch64_sbsa | https://gitlab.com/buildroot.org/buildroot/-/jobs/4390011603  |      
                       qemu_s390x | https://gitlab.com/buildroot.org/buildroot/-/jobs/4390011762  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/4390011799  | ORPH 
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4390011968  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4390012005  |      
              stm32mp157c_odyssey | https://gitlab.com/buildroot.org/buildroot/-/jobs/4390012127  |      
        terasic_de10nano_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4390012136  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4390012144  |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4390012173  |      
                           ts5500 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4390012180  |      
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4390012182  |      
                         uevm5432 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4390012187  |      
                    versal_vck190 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4390012190  |      
                       visionfive | https://gitlab.com/buildroot.org/buildroot/-/jobs/4390012197  |      
                      visionfive2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4390012194  |      
                        wandboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/4390012201  |      
                            warp7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4390012205  |      
                        warpboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/4390012215  |      
                    zynq_microzed | https://gitlab.com/buildroot.org/buildroot/-/jobs/4390012218  |      
                      zynq_qmtech | https://gitlab.com/buildroot.org/buildroot/-/jobs/4390012220  |      
                       zynq_zc706 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4390012223  |      
                         zynq_zed | https://gitlab.com/buildroot.org/buildroot/-/jobs/4390012226  |      
                zynqmp_kria_kv260 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4390012230  |      
                    zynqmp_zcu102 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4390012232  |      
                    zynqmp_zcu106 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4390012236  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
