Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18538C54EE9
	for <buildroot@archiver.kernel.org>; Tue, 27 Sep 2022 06:04:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 612F6418BF;
	Tue, 27 Sep 2022 06:04:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 612F6418BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IZMk5wmAhKbw; Tue, 27 Sep 2022 06:03:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 78A424185A;
	Tue, 27 Sep 2022 06:03:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 78A424185A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 83D5A1BF29D
 for <buildroot@lists.busybox.net>; Tue, 27 Sep 2022 06:03:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2D7164185A
 for <buildroot@lists.busybox.net>; Tue, 27 Sep 2022 06:03:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D7164185A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S8CQazT1bqDt for <buildroot@lists.busybox.net>;
 Tue, 27 Sep 2022 06:03:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA6AA4181F
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BA6AA4181F
 for <buildroot@buildroot.org>; Tue, 27 Sep 2022 06:03:50 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 985E1C0011
 for <buildroot@buildroot.org>; Tue, 27 Sep 2022 06:03:47 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Tue, 27 Sep 2022 06:03:47 -0000
Message-Id: <20220927060354.2D7164185A@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1664258627; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=WoR6UgflnWoKZILOcLhej9InE9/oxntXAR3fdvSdndA=;
 b=I3k409/SrdQfKI5uyBSeqGa9mGx4CgmsGnxtPoIchy5Yl2LREzVq1Ol5quU83DRGBXIV2N
 KiyIK9eSJRqJ5LEyjkO/gXl5KZmwCgLNqatXNEz32vtPW69edG2N4WBY7I1KJJcVXxPgfp
 8If4a1xNFRLvbNpSaSGPQ22GIjznvNwslHh2DJisf+Lbb+kFO/swQbUbh/6u6H8cflk8rq
 tAKqHE0Vk/Rv0Th74Uw15WkyOf8izGOMTv81GxpFOtzr5zEFtFaAUY2t8SnpbtUNTOKvat
 sWsPSjOb4Ow39M9+NBV7hwBGAEo9mr4k9BmcsnqDY1TtmMVM+sL4W/OySJJN0g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=I3k409/S
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-09-26
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

Autobuild statistics for 2022-09-26
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  | 16  |  3  |  0  | 19  |
  2022.05.x  | 32  | 20  |  0  | 52  |
    master   | 123 | 171 |  0  | 294 |

Classification of failures by reason for master
-----------------------------------------------

                 chartjs-3.9.1 | 19
                       unknown | 10
                      crun-1.5 | 8 
glibc-2.36-44-g2628500f5dff... | 8 
         host-gcc-final-11.3.0 | 7 
            igd2-for-linux-2.1 | 7 
                gerbera-1.10.0 | 6 
                 systemd-250.4 | 6 
              host-rust-1.62.0 | 5 
              libarchive-3.6.1 | 5 
                 sysvinit-2.99 | 5 
                  autofs-5.1.8 | 4 
host-pahole-73383b3a39afe86... | 4 
            host-binutils-2.38 | 3 
             libgpg-error-1.45 | 3 
                elfutils-0.186 | 2 
               fftw-quad-3.3.8 | 2 
             fontconfig-2.13.1 | 2 
google-breakpad-c85eb4a59b6... | 2 
                   hdparm-9.63 | 2 
                 openssh-9.0p1 | 2 
   openvmtools-11.3.5-18557794 | 2 
                 uclibc-1.0.42 | 2 
uqmi-0a19b5b77140465c29e2af... | 2 
                 wolfssl-5.5.0 | 2 
/home/buildroot/autobuild/i... | 1 
/home/buildroot/autobuild/i... | 1 
/home/buildroot/autobuild/i... | 1 
/home/buildroot/autobuild/i... | 1 
                    bat-0.19.0 | 1 
  binutils-arc-2020.09-release | 1 
                bpftool-v6.8.0 | 1 
            btrfs-progs-5.16.2 | 1 
casync-4ad9bcb94bc83ff36cfc... | 1 
dahdi-linux-5c840cf43838e06... | 1 
              dropbear-2022.82 | 1 
              e2fsprogs-1.46.5 | 1 
                  exempi-2.6.1 | 1 
                 fdk-aac-2.0.2 | 1 
                     frr-8.3.1 | 1 
fs/cpio/cpio.mk:117: /home/... | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
                  gensio-2.5.2 | 1 
            host-binutils-2.39 | 1 
                host-go-1.19.1 | 1 
              host-rust-1.64.0 | 1 
        host-sentry-cli-1.59.0 | 1 
host-spirv-llvm-translator-... | 1 
            igh-ethercat-1.5.2 | 1 
               libglib2-2.72.3 | 1 
                   libqb-2.0.6 | 1 
               libsigsegv-2.14 | 1 
               libvorbis-1.3.7 | 1 
       linux-5.10.109-cip5-rt4 | 1 
           linux-5.10.115-cip7 | 1 
                 linux-5.17.15 | 1 
              liquid-dsp-1.4.0 | 1 
        ltp-testsuite-20220527 | 1 
                    lxc-4.0.12 | 1 
make: *** wait: No child pr... | 1 
                mongodb-4.2.18 | 1 
                  ntp-4.2.8p15 | 1 
               openpgm-5-3-128 | 1 
                   perl-5.34.1 | 1 
               poppler-21.12.0 | 1 
              procps-ng-3.3.17 | 1 
                 protobuf-21.6 | 1 
           proxychains-ng-4.16 | 1 
            python-sip-4.19.25 | 1 
            python-ujson-5.2.0 | 1 
            quickjs-2021-03-27 | 1 
rtl8189es-39c17661136da48f8... | 1 
                 sudo-1.9.11p2 | 1 
                tealdeer-1.5.0 | 1 
ulog-0389d243352255f6182326... | 1 
                 wavemon-0.9.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/3c0d37083836c73fbfbf89ee909d35f8d7e2cd74 |     
 powerpc64   | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/6d33a234a9bd0f3fce824db81ba0d7dd9aa33c32 |     
   sparc     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/662dd2711fcd1ec5c9f98c7240d36f55c55a58b6 |     
 microblaze  | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/ccbb17682f6d85277dba39c46687d84ea111d56f |     
  mips64el   |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/511b588026ff1d837bbce24429348e4142d6c554 |     
   mips64    |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/4f8b58df2b374ec6fa2a2c0ff7ff5f10d0e034e6 |     
   armeb     |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/46c1185f87a6d0d29a1023cd52b8221145008eae |     
microblazeel |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/7cbb6b175c64b917dd378298f8530c2c7910d661 |     
    arm      |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/081d97dc993a5243678c4e44e9693bf2a87b4089 |     
   arceb     |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/e4b1fdb756ca4f76d897bbf85cdccac25edf4d2f |     
  sparc64    |         bpftool-v6.8.0         | NOK | http://autobuild.buildroot.net/results/fa3d3d483f8b2872b669cc720b7e8727022252bf |     
    mips     |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/06d2b9e7c9dcd80786235c6fe8ec289b80c73bcb | ORPH
   armeb     | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/e1739a1ca179c821c1d16b568489dd75f92f03a9 |     
   arceb     |         chartjs-3.9.1          | NOK | http://autobuild.buildroot.net/results/18099d3653c19ba09210bbce2a5656ff333ad93f |     
   x86_64    |         chartjs-3.9.1          | NOK | http://autobuild.buildroot.net/results/1bb19170a216d5d234f3766d795017baa9995702 |     
   mipsel    |         chartjs-3.9.1          | NOK | http://autobuild.buildroot.net/results/bd794e9b5650d072e47a9b858d740cbfc12c7536 |     
    arm      |         chartjs-3.9.1          | NOK | http://autobuild.buildroot.net/results/430e9034dbd3851b56ee89d5f6423ba7462f630d |     
    arm      |         chartjs-3.9.1          | NOK | http://autobuild.buildroot.net/results/67081d9e7657adfee4d29af61292f955d043c2cd |     
   s390x     |         chartjs-3.9.1          | NOK | http://autobuild.buildroot.net/results/db14693c9700898f290fa4bac309e05a3eca0e85 |     
   mipsel    |         chartjs-3.9.1          | NOK | http://autobuild.buildroot.net/results/e8b29c8ce81de054b609339a05d81bc2ab03b556 |     
    arc      |         chartjs-3.9.1          | NOK | http://autobuild.buildroot.net/results/7c824f4c014eadf5120cb1ba3ef291ba6b153bc2 |     
   x86_64    |         chartjs-3.9.1          | NOK | http://autobuild.buildroot.net/results/a967ca6c956fa0dde84020300c7b28ea2b0e9979 |     
 powerpc64   |         chartjs-3.9.1          | NOK | http://autobuild.buildroot.net/results/712b1bad8fb8a74b787537a95769b8189b33f609 |     
microblazeel |         chartjs-3.9.1          | NOK | http://autobuild.buildroot.net/results/7e3efca9b9e0cf7424c778316ce98779aed2a607 |     
   mipsel    |         chartjs-3.9.1          | NOK | http://autobuild.buildroot.net/results/f7dc4e54d3483866bc73388ebd433a9e7af6115e |     
  powerpc    |         chartjs-3.9.1          | NOK | http://autobuild.buildroot.net/results/4427365da69fc2366ac9d34239a10b1c14572bb3 |     
    arm      |         chartjs-3.9.1          | NOK | http://autobuild.buildroot.net/results/03ab6d53a645d64c52de6e1a49e24b08e2361176 |     
 powerpc64   |         chartjs-3.9.1          | NOK | http://autobuild.buildroot.net/results/13bad12adb76c26cd284b325b41edc9cfc5e616b |     
    arc      |         chartjs-3.9.1          | NOK | http://autobuild.buildroot.net/results/f3ebb111e054c31aa945710a25bed23f2ed61418 |     
    or1k     |         chartjs-3.9.1          | NOK | http://autobuild.buildroot.net/results/e4a24482fc7f9c479cf1d461f0bef5c86611d005 |     
    mips     |         chartjs-3.9.1          | NOK | http://autobuild.buildroot.net/results/454216c43430c829c4a06566e99f363e3d0f3019 |     
    or1k     |         chartjs-3.9.1          | NOK | http://autobuild.buildroot.net/results/3d1cd3de77af5f55f58511a28f1ccf63fdbb06a8 |     
    m68k     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/83b6276e26d51cbd11c3f5be560ef08d4d0735d0 |     
  riscv32    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/eeff19ed3c2407a77f4d7e7001a098aeac299bb1 |     
    arm      |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/ca19145c17927a741164ed11bec86e74942c8f15 |     
  mips64el   |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/d1772d505e86e5372f11cd62c3bbc749100ef965 |     
    arm      |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/557d6aca22b62d49e85433f6002668753f4ff2c7 |     
microblazeel |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/e40e28f36bd976322fe6706e022e5867b4a19655 |     
    arc      |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/58c54bcb97c29689197313eefeabbc960d353183 |     
    arm      |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/9043a81994abd227999b9104564d8aee2f585764 |     
   armeb     | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/7facd2d9a024e7abb6b6be669056437ae947f3ec |     
  riscv64    |        dropbear-2022.82        | NOK | http://autobuild.buildroot.net/results/bfec02a9f6e92900ed94bcf7f4fa645eef6d5cf3 |     
    or1k     |        e2fsprogs-1.46.5        | NOK | http://autobuild.buildroot.net/results/c12e3b7ef768e02fd13ae6c7785774070b696ce3 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/d724bfd9a371551f048072eb414731aba78d4631 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/1450eb5205c7ad2cd120a44c2a7845352e29c5d3 | ORPH
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/7b0d752bf68aff4e3873375389d1c09d4685f0e9 |     
   armeb     |         fdk-aac-2.0.2          | NOK | http://autobuild.buildroot.net/results/f19e4604ef59eeb1650dab9c38a04efc5c6862b8 |     
 powerpc64   |        fftw-quad-3.3.8         | NOK | http://autobuild.buildroot.net/results/49d5a76e44592c68c3fbaaf1e098349e26bbe1de | ORPH
 powerpc64   |        fftw-quad-3.3.8         | NOK | http://autobuild.buildroot.net/results/ff41eda2ac9659de9949e10d81ddd4486aa5f9ac | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/88aca9c4ef1261dcb80da65719a1fb905a3aa7d5 | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/d4679279b7dd8d66c03a9c634e0ada5bfb5c72ec | ORPH
   xtensa    |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/a36a1be01d2fcd2e89d39dc0317966012bdf3dee |     
   nios2     | fs/cpio/cpio.mk:117: /home/... | NOK | http://autobuild.buildroot.net/results/267022b8ce2e8534c105c753151500c7d28cd826 |     
    m68k     | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/f9ab93d76b6de2959ba9abf9a9078f972c22730c |     
    arm      |          gensio-2.5.2          | NOK | http://autobuild.buildroot.net/results/c21ea7ccc7438c1fb6adc2b8a7dd57ea0e08305a |     
  aarch64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/ad5d30cb84ffdb34f730d8dc5ce2bb8c3e506022 |     
  riscv32    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/0a793cf04f39609845cf2832550bba2de5c9da48 |     
  aarch64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/0725f578f461d80aa0ba3d7affddcab9e09f6cf7 |     
    sh4      |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/8887787f2b6d7efcc7f7308cc7c5a87febc39ce0 |     
    arm      |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/edf308e3ec1d2da899312605ab51cd32ee7699b1 |     
  sparc64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/2c60702c50a4ff0774d18aef87a9be0036470e43 |     
    arc      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/b846aa1703c96480d7722f6950dfa0a769a8636f |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/851125c19b4a14c42765a8dbbc4ded44fa15728d |     
   arceb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/46a8ed86a53e4bb0fffaff36e498af8024a54887 |     
microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/f0f98e626925c0ca19798405b5a0622acbafc91c |     
   mipsel    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/47f8a8f15eb49fa403bb49e544aa3a308e3b7a12 |     
   mipsel    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/2e27a68cf421c2af75e4f50c0a886b11d3d3d7c6 |     
    mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/e2e334f49e71a2202710da05eeed5aae0c9cc837 |     
    or1k     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/9d26d86ca20040cce7dfa78371de186e2e921fdd |     
   mipsel    | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/c3da0c4385d31844b435ddac433b9ff1b5ac29fe |     
   mipsel    | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/bafce3a6bf675ed69e0788be00ebd60e59e2a70b |     
  sparc64    |          hdparm-9.63           | NOK | http://autobuild.buildroot.net/results/8e04f8a57679fa3d8dca2d05d2d7aed8beaf7bba |     
   nios2     |          hdparm-9.63           | NOK | http://autobuild.buildroot.net/results/0456b351b08a65dc584605fe38fc214ecdab303a |     
    arc      |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/299f9e46f4ba58113b714d3a327a01ad96571798 |     
  sparc64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/e7414a5905b2ffda1719a7ff5d7ea7e93775f5d0 |     
   nios2     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/0ca8dfd2e93901925cbd7b552dbb44aa4af68fd9 |     
   mipsel    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/1046feb7e93c206c406471a9af4038581ded8fef |     
  aarch64    |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/59e9839d9caa6db13be9e062c346eb677228e111 |     
   s390x     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/c12b69e7f3c98a2e3d6b803a00fcb048b7856247 |     
   s390x     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/9e8eebf82b0762e1eed9b2e4b41e97673a2332b7 |     
   mipsel    |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/5d5627d5b0dceb5dde5790bc04e1eeec066aa615 |     
   s390x     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/50bbc72d0b29b0f5bc8f2989f222ab35c0708fc3 |     
   s390x     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/3527fc3008284b4b3de1c4455272d15cabbbebf4 |     
    arm      |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/90c7e48307ebfaa9876e935c14162a26867f8830 |     
  mips64el   |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/b72358885cd1a2ff1514a09a690c99f918ebc758 |     
 powerpc64   | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/8cd3f6cb492df1268ef3e2bae8e57f4045c2c261 |     
    mips     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/6b5b7a764047d6772cc8eda228e78f979e271ec6 |     
 powerpc64   | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/4141885dd21a79cb319d430d10d4807012395eae |     
powerpc64le  | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/6f37fc11497357206e97f1d20b04e211577ffdff |     
powerpc64le  |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/aa7fd0160110d71c19a8ea81302116a33e14bf1a |     
powerpc64le  |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/a7dcafe98f4b2f68772a3f0bebb54061ac616e56 |     
   armeb     |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/813c890e0a4c1bd5ee434068c690827c27ce7140 |     
   mipsel    |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/4c6b0e8472c52f07dd792bd2df76efec26f349fb |     
  sparc64    |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/bb9dd6c96732389b858841c171dfec5e86e38966 |     
  aarch64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/489eb3eceeec629401708597dc42b3da4943186c |     
  riscv32    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/34b824f4dda2722c7b5a040a21d9bfd5a1de263a |     
   armeb     | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/00f690ad6c5cdb21bcd1e8ec13f5ec09832afd09 | ORPH
    mips     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/5fd3b948472d4bd08a235561834ea57894afca82 |     
microblazeel |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/592194322ede8055d20291417c67efdbf250e09c |     
 powerpc64   |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/3b1de7c045fc10d149b700b352ee5d6f6a55821c |     
    or1k     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/e9c72f4e18feb238ee9e58ca6af83d5bb6f7e89a |     
    arm      |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/4a353523733f11fa92ba9a6cc606b3f8d02431e2 |     
powerpc64le  |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/49199eb613345b802bbe0e7e8478f85d3ad3b34b |     
   s390x     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/e378826f5b8a871f9cf0b28b4b9bb44bb5de9163 |     
   x86_64    |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/fa674f81309fbc9f67a87f9c0798c04655260326 |     
   armeb     |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/152ddaa3844993f45324ef6c9e633c083949cb3a |     
    or1k     |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/e0245a0531b2d17fb957c827b8ec2ad0246b0f83 |     
    mips     |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/51f0f2b6776f31634a747e54ac99f5e0d14bda47 |     
    arm      |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/5a56adb84ab4933bd9e9dc62109d5a9a59551626 |     
    mips     |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/2e7d03326746906469b754fce1a376f79c83681d |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/546e89fbb620e302216ac4571fd52c5364e371a2 |     
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/d3da9dd8924b9bb836f428aca0f834f3ebe5677e | ORPH
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/1487d311fe87196ac7906dbae8a5ed93ac813695 | ORPH
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/fc7f632fc8ea43fef24eee1f39b450401e1b2029 | ORPH
    arc      |          libqb-2.0.6           | NOK | http://autobuild.buildroot.net/results/ed303390143f70eecf0511537686e09d0a26aea8 |     
  powerpc    |        libsigsegv-2.14         | NOK | http://autobuild.buildroot.net/results/2d9d5f8080976d14988478562d33e314db1a6aa9 |     
  powerpc    |        libvorbis-1.3.7         | NOK | http://autobuild.buildroot.net/results/da2fb1d1e4350d625e2c3915b7ced0ce2d3cbf13 |     
    i686     |    linux-5.10.109-cip5-rt4     | NOK | http://autobuild.buildroot.net/results/ba04a211249f9d89f5e89038410cbb5aa338621f | ORPH
  mips64el   |      linux-5.10.115-cip7       | NOK | http://autobuild.buildroot.net/results/1dc3451746d8d99a52a2096444142106f7374504 | ORPH
  powerpc    |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/951627a2217231b887645efa97b11dd440b0d274 | ORPH
    arm      |        liquid-dsp-1.4.0        | NOK | http://autobuild.buildroot.net/results/6f132548d9da96c7880d0267f21171da69e8f7fb |     
   mips64    |     ltp-testsuite-20220527     | NOK | http://autobuild.buildroot.net/results/86ff0fe8c6044a9dd4df771c9f6856a6372a8bfb |     
   nios2     |           lxc-4.0.12           | NOK | http://autobuild.buildroot.net/results/4248554a894af657b53f83fab9ee593e22786ff7 |     
 aarch64_be  | make: *** wait: No child pr... | NOK | http://autobuild.buildroot.net/results/1cd8c454ac5869986a68f49ea4b984ad2b691fcf |     
   x86_64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/2839e45cf3d0e58e0e04b7269c3a698088b50eef |     
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/39f6ecac757045b8dac7b5ba1ee6f735594da650 | ORPH
   mips64    |        openpgm-5-3-128         | NOK | http://autobuild.buildroot.net/results/09659cc3766ead1bbb99a6ccbcb7b45a5c0b4de5 |     
    m68k     |         openssh-9.0p1          | NOK | http://autobuild.buildroot.net/results/24b284abd1dac4226640ce9d35a0bbddc1f6b93e | ORPH
    m68k     |         openssh-9.0p1          | NOK | http://autobuild.buildroot.net/results/e733ca3a8929ca021b69eb0bdb9bc02fc30b0f32 | ORPH
   x86_64    |  openvmtools-11.3.5-18557794   | NOK | http://autobuild.buildroot.net/results/9b641dc28e68994bea83c3275ebe3e1b85ba07ef |     
   x86_64    |  openvmtools-11.3.5-18557794   | NOK | http://autobuild.buildroot.net/results/8a7ddacdab30fcf6eb7e0e397bfbb50d5f62b14e |     
   sparc     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/292b73a558fa5b44ecd0e4e988ad77393e39eb5b |     
   xtensa    |        poppler-21.12.0         | NOK | http://autobuild.buildroot.net/results/f318dda84dbf0777546d4133820fade67ea734ea |     
   nios2     |        procps-ng-3.3.17        | NOK | http://autobuild.buildroot.net/results/c1c3d4ac989444a5f2e686ca6d4afdf2ca380a26 | ORPH
    m68k     |         protobuf-21.6          | NOK | http://autobuild.buildroot.net/results/fe9deb1ea54129b93a5694f4443e6979ac0dc977 |     
    mips     |      proxychains-ng-4.16       | NOK | http://autobuild.buildroot.net/results/b754a16180f1949de65966e39e5048a06fbfeff7 | ORPH
 powerpc64   |       python-sip-4.19.25       | NOK | http://autobuild.buildroot.net/results/1fe881b83cd7a87e99ffde09a6532f717824e196 |     
   xtensa    |       python-ujson-5.2.0       | NOK | http://autobuild.buildroot.net/results/214c83579daa4dc68b1b8cb483233ee8f2e4ed21 |     
  powerpc    |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/0ff7f58d94d2a9f8e599504294c81bbccca49217 |     
   sparc     | rtl8189es-39c17661136da48f8... | NOK | http://autobuild.buildroot.net/results/593386dbb79ecfd35a8fabfe56a41657c475d2d4 |     
 aarch64_be  |         sudo-1.9.11p2          | NOK | http://autobuild.buildroot.net/results/95ab953931d658cd76a5d050af5d0e02e928f29e | ORPH
 aarch64_be  |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/9a6414983e4d2e1b2d368923aa96ceea157438c3 |     
   nios2     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/28bb09f63e48868f35b174304916b6162def04a5 |     
   armeb     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/dd417395e84316e669561a1dc300a26fd891429c |     
    i686     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/0f009d5aea23559c1cf4befbc78c201097b7a431 |     
    i586     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/dcc5abd5ef6233b810a33ddee233861d69954cb2 |     
   mipsel    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/d8cde49816148b9d10ab0765efed6548d6a21f56 |     
    or1k     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/81c3c9bec641c6488ca6142186df7462316bdcd6 | ORPH
 microblaze  |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/0f73ce8558b5a011074ad8eccc4a23066822b38e | ORPH
   mips64    |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/90b145eb7a93e1972c36bfbc33f69245432c301c | ORPH
  sparc64    |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/fd6fd4986ce0d0069e5f560b91d19d144b1ce082 | ORPH
   mipsel    |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/cb446801ae9568ad53c4ce61cba0f592b8698007 | ORPH
 powerpc64   |         tealdeer-1.5.0         | NOK | http://autobuild.buildroot.net/results/a8dea965e9861dab9da207440ec7f52ce44080ef |     
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/a1b85fa650cd3d8937725c6f057ae2087017d007 |     
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/ad5d7611c8185c0c80bf2792c5a9e54cd8bf12cb |     
   mipsel    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/58289f6468c22aa1046c2f02bb31d11497c12a66 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/7d567bde8c043d82332c16b4fd3ce8de75d0fe45 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/95bd0117f6531407361b4cc8c2cace9dd38d0a69 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/eafea8a4555c4fd40043fe33065752bc980f0d23 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/d477a3959cd18b6575c6302b6fc243c30822b3c7 |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/17dd9f52e6328187db9208e30262b31efc79163b |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/b61244bca48454a68a537d9f884112a91f388140 |     
   sh4eb     |            unknown             | NOK | http://autobuild.buildroot.net/results/b7eca77d5a65a9d556623ec062e6f1d2f14b956b |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/9bd48813117dcb714c539638a124c9ede35ab68a |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/5f7d403644ae4740d9ea4f95eb42153a0f015bed |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/baf024e1e23550f9f3c58f155f88c30a74f0a110 |     
    mips     | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/770f86018ca059d4f33324604da68b2c40de3eeb | ORPH
   x86_64    | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/e1846100b333eafd69653b3c406a091197f27134 | ORPH
  riscv64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/e7cfdf39591c10a7bea62f72f38bf7be84ec9d59 |     
   mipsel    |         wolfssl-5.5.0          | NOK | http://autobuild.buildroot.net/results/460485d54b9050c1734e53dbfc04b158a2768826 |     
    arm      |         wolfssl-5.5.0          | NOK | http://autobuild.buildroot.net/results/9d5feba7042b79b028335a194173888e8aea51ea |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

                    bat-0.19.0 | 1 
                  exempi-2.6.1 | 1 
                    ruby-3.1.2 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/b0ab5f513846edfe8b76a1356603deadbd56eb0e |     
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/f2aa92eac3ed3d082300efe32c5d9092b8f83f0d |     
  riscv64    |           ruby-3.1.2           | NOK | http://autobuild.buildroot.net/results/d60b1447071c900c7fa5b7d307074f3ae476dd20 |     


Classification of failures by reason for 2022.05.x
--------------------------------------------------

host-pahole-73383b3a39afe86... | 4 
              host-rust-1.60.0 | 2 
                 linux-5.17.15 | 2 
               protobuf-3.20.1 | 2 
/home/buildroot/autobuild/i... | 1 
                     frr-8.2.2 | 1 
         graphicsmagick-1.3.37 | 1 
                host-go-1.18.6 | 1 
               libglib2-2.70.4 | 1 
                mongodb-4.2.18 | 1 
                 pixman-0.40.0 | 1 
rtl8723bs-11ab92d8ccd71c80f... | 1 
                       unknown | 1 
                 wavemon-0.9.4 | 1 


Detail of failures for 2022.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/46b3b827208dc69d47572bc3ff46bc73630a2ba3 |     
  mips64el   |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/ecb372b21a14602373cd96ccaa4ac221a3e26d40 |     
  sparc64    |     graphicsmagick-1.3.37      | NOK | http://autobuild.buildroot.net/results/478da54b2091ed01d2ed10673e919e637ca43852 |     
  mips64el   |         host-go-1.18.6         | NOK | http://autobuild.buildroot.net/results/c4d92438a93e64916e79a73861b0c6dc81d795a9 |     
   xtensa    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/6f364b111d5307a046938a40dd3634a9b19b30fe |     
  sparc64    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/450c344bab4911da30a3004062d19ef4c2287bfb |     
   sparc     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/3cf91048801a5b650d57e169c54bb924bc952f99 |     
   nios2     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/60e15256fa6cf16641b4eda66321f979173c2e60 |     
    mips     |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/2d08ce6dd60acc7257829afe2009e8d835385d2c |     
   x86_64    |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/68ae2565dce0c377ac64b11aaee88d41237a6e29 |     
    arc      |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/d5c232efdb91aa03aa5958ab530c2c500249e8c3 |     
   x86_64    |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/92182a82f22f0897469a0968643b14e294f45aa7 | ORPH
   mipsel    |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/376fcc07d1cfaa353a572addf2626e51a207be96 | ORPH
  aarch64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/aa4985f688bd2e379e56c7a95b332e8cffad8aef |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/ded13416645c5d5fdbb612d5e3174c812eb47e04 |     
 microblaze  |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/0415eec9d9c52d1f71d55fd279e34963d097d9bb |     
microblazeel |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/3173cdd77fe0e31234a514f12e5333b3f038d46d |     
  sparc64    | rtl8723bs-11ab92d8ccd71c80f... | NOK | http://autobuild.buildroot.net/results/d9ee6f5067a3ca6b2ad718d6ddd1547ba7a3a9be |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/0bb629cab288c81db28d915d622657f44a80b7a8 |     
  sparc64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/bde340cd78a87ac487347166c7f5947bf13fcf84 |     


Gitlab CI results for 2022-09-26
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
      TestCpioDracutGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3082082695  | ORPH 
...ioDracutGlibcMergedUsr | https://gitlab.com/buildroot.org/buildroot/-/jobs/3082082697  | ORPH 
       TestCpioDracutMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3082082698  | ORPH 
...pioDracutMuslMergedUsr | https://gitlab.com/buildroot.org/buildroot/-/jobs/3082082699  | ORPH 
     TestCpioDracutUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3082082700  | ORPH 
...oDracutUclibcMergedUsr | https://gitlab.com/buildroot.org/buildroot/-/jobs/3082082701  | ORPH 
        TestDockerCompose | https://gitlab.com/buildroot.org/buildroot/-/jobs/3082082767  | ORPH 
...lx60UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3082083269  | ORPH 
...Xtensalx60UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3082083270  | ORPH 
   TestGdbHostGdbTarget9x | https://gitlab.com/buildroot.org/buildroot/-/jobs/3082082778  | ORPH 
   TestGdbHostGdbserver9x | https://gitlab.com/buildroot.org/buildroot/-/jobs/3082082780  | ORPH 
        TestGdbHostOnly9x | https://gitlab.com/buildroot.org/buildroot/-/jobs/3082082782  | ORPH 
       TestInitSystemNone | https://gitlab.com/buildroot.org/buildroot/-/jobs/3082082730  | ORPH 
      TestLuajitLuaAugeas | https://gitlab.com/buildroot.org/buildroot/-/jobs/3082082805  | ORPH 
TestPythonPy3Cryptography | https://gitlab.com/buildroot.org/buildroot/-/jobs/3082082954  | ORPH 
TestUbootOpensslPkgConfig | https://gitlab.com/buildroot.org/buildroot/-/jobs/3082083026  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
