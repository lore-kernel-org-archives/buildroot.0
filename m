Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A33D6C43334
	for <buildroot@archiver.kernel.org>; Tue, 19 Jul 2022 05:38:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC1706111E;
	Tue, 19 Jul 2022 05:38:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC1706111E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id htuTT-QmxA1U; Tue, 19 Jul 2022 05:38:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 543D860D60;
	Tue, 19 Jul 2022 05:38:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 543D860D60
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 408EB1BF381
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 05:38:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0F40382965
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 05:38:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F40382965
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qhFKo2Xlu630 for <buildroot@lists.busybox.net>;
 Tue, 19 Jul 2022 05:38:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A91EE8295A
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A91EE8295A
 for <buildroot@buildroot.org>; Tue, 19 Jul 2022 05:38:44 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 446A2E000B
 for <buildroot@buildroot.org>; Tue, 19 Jul 2022 05:38:41 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Tue, 19 Jul 2022 05:38:41 -0000
Message-Id: <20220719053848.0F40382965@smtp1.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1658209121; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=q9EUz0MKFqBm1fjldh9mvxQg+Lt56zfw3Y6CjmrtEfg=;
 b=mW7kA829pPtXd1NaVHKEeqaO8PEwS9XDCnnoLvW6mDOshuaALSjZM7eDppIDVvUzm9vV2j
 pXBVOq0BzH+yXa1hvcEe0m91Ue/K704Sf8MacWIyacHPP876BIWXo8EjADeZCGOAMMElpy
 1V1ERRPih3p0OaDd9nionyRM07Iq+67Xk/wrbMHz+2Sx8tNWRR9KZUiOgv3bQ6SAfaNMgS
 N3YKLvLV7TH29R2tDCZHXMm/hwSPHzmjctFATvhYrTMt+/HZEwNMdBnwPmrEUVes8XAzcm
 R2gkws6gQEOM9sYYMU7lXWaxXa1QTYjmNf3WCWGxH3VgL0cLMZAzTNR2nJb/TA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mW7kA829
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-07-18
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

Autobuild statistics for 2022-07-18
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  | 20  |  0  |  0  | 20  |
  2022.05.x  | 16  | 26  |  0  | 42  |
    master   | 221 | 275 |  0  | 496 |

Classification of failures by reason for master
-----------------------------------------------

                 uclibc-1.0.41 | 15
                 libvpx-1.12.0 | 10
                   speex-1.2.1 | 10
glibc-2.35-96-g2c4fc8e5ca74... | 9 
             libopenssl-1.1.1q | 9 
                host-go-1.18.3 | 8 
           libfreeimage-3.18.0 | 8 
                 linux-5.17.15 | 8 
                speexdsp-1.2.1 | 7 
                 pixman-0.40.0 | 6 
                 zlib-ng-2.0.6 | 6 
              alsa-utils-1.2.7 | 5 
  gobject-introspection-1.70.0 | 5 
host-pahole-73383b3a39afe86... | 5 
              host-rust-1.60.0 | 5 
                libcurl-7.84.0 | 5 
               libglib2-2.72.3 | 5 
                       unknown | 5 
           host-harfbuzz-4.4.0 | 4 
host-spirv-llvm-translator-... | 4 
                iptables-1.8.8 | 4 
                     php-8.1.8 | 4 
       shadowsocks-libev-3.3.5 | 4 
              alsa-lib-1.2.7.2 | 3 
                bitcoin-0.21.2 | 3 
                elfutils-0.186 | 3 
         host-gcc-final-10.3.0 | 3 
       host-gcc-initial-11.3.0 | 3 
           linux-5.10.115-cip7 | 3 
               protobuf-3.20.1 | 3 
                     refpolicy | 3 
                   uacme-1.7.1 | 3 
                       xenomai | 3 
  binutils-arc-2020.09-release | 2 
              containerd-1.6.2 | 2 
           crucible-2022.05.25 | 2 
dahdi-linux-5c840cf43838e06... | 2 
                 dash-0.5.11.5 | 2 
                  exempi-2.6.1 | 2 
                     frr-8.2.2 | 2 
         host-gcc-final-11.3.0 | 2 
                ipmiutil-3.1.8 | 2 
kvmtool-f77d646ba01d04be5aa... | 2 
       linux-5.10.109-cip5-rt4 | 2 
                  matio-1.5.22 | 2 
                    ne10-1.2.1 | 2 
               openpgm-5-3-128 | 2 
                 openssh-9.0p1 | 2 
                   perl-5.34.1 | 2 
                    pppd-2.4.9 | 2 
            python-ujson-5.2.0 | 2 
                    qemu-7.0.0 | 2 
rtl8812au-aircrack-ng-37e27... | 2 
              swupdate-2022.05 | 2 
                 wavemon-0.9.4 | 2 
                xenomai-custom | 2 
                zerofree-1.1.1 | 2 
/home/buildroot/autobuild/i... | 1 
/home/buildroot/autobuild/i... | 1 
                  acpid-2.0.33 | 1 
             berkeleydb-5.3.28 | 1 
                     cpio-2.13 | 1 
          crucible-v2022.05.25 | 1 
                 dmalloc-5.6.5 | 1 
             fontconfig-2.13.1 | 1 
fs/ubi/ubi.mk:51: /nvmedata... | 1 
                gnu-efi-3.0.10 | 1 
                      grep-3.7 | 1 
                       gsl-2.6 | 1 
                harfbuzz-4.4.0 | 1 
          host-gcc-final-9.4.0 | 1 
        host-gcc-initial-9.4.0 | 1 
host-gdb-arc-2020.09-releas... | 1 
            igh-ethercat-1.5.2 | 1 
                  jack2-1.9.20 | 1 
              jpeg-turbo-2.1.3 | 1 
                 libbsd-0.11.3 | 1 
               libcap-ng-0.8.3 | 1 
              libgcrypt-1.10.1 | 1 
               libgpgme-1.17.1 | 1 
                    liblo-0.31 | 1 
          libmicrohttpd-0.9.75 | 1 
            libnetconf2-2.1.11 | 1 
                   libnss-3.80 | 1 
                 libp11-0.4.12 | 1 
   libtorrent-rasterbar-1.2.15 | 1 
              libuhttpd-3.14.1 | 1 
        ltp-testsuite-20220121 | 1 
          lttng-modules-2.13.1 | 1 
mali-driver-a742530232d1de4... | 1 
            ocf-linux-20120127 | 1 
              open62541-v1.2.4 | 1 
               openblas-0.3.20 | 1 
                    opus-1.3.1 | 1 
          perl-net-ssleay-1.85 | 1 
                    pimd-2.3.2 | 1 
      qt5webkit-5.212.0-alpha4 | 1 
                rng-tools-6.15 | 1 
                    sdl-1.2.15 | 1 
                sg3_utils-1.47 | 1 
               valgrind-3.19.0 | 1 
                xenomai-3.0.10 | 1 
                  zabbix-5.4.9 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/f79580af9acbb9c7f49614805089c78fe0f10bbf |     
  sparc64    | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/72165e7a0a593c7c10adc0c5e75d0145a9464e7b |     
   mips64    |          acpid-2.0.33          | NOK | http://autobuild.buildroot.net/results/eb2ec421a827de961a4328ea501a13c140027135 | ORPH
    m68k     |        alsa-lib-1.2.7.2        | NOK | http://autobuild.buildroot.net/results/43e16329a04018ddd3d92b081e3be118ec898360 |     
    m68k     |        alsa-lib-1.2.7.2        | NOK | http://autobuild.buildroot.net/results/293ff23477562fe31e5f57f94904f76bbf53f30d |     
   mips64    |        alsa-lib-1.2.7.2        | NOK | http://autobuild.buildroot.net/results/70a9625b92c4a26eaf784c3da445db3948418842 |     
    or1k     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/c7c742d0814f093bae9854de547085bc67606f9b |     
    mips     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/afaf56844b01bfa754a74f392144ef85f5d29ccb |     
   x86_64    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/4e8a37d7e851102a9d84fc26a0abed922f0b8818 |     
    arm      |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/98f41d7bc6585e1c60dc69a055af710553a3e519 |     
  mips64el   |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/50a5d674bf41a59fde052eb4c8e0f1ccac532f18 |     
    sh4      |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/75bf86c086212b18dd653231c3658a010864e448 | ORPH
    arc      |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/e24f6c481f152d03b4919308d02f2c8461db3168 |     
   arceb     |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/2234987a580623a7e0add736b0eb508c9f754759 |     
   sh4aeb    |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/846e5fc437219d5eb7a223f51503e74d1ef6e335 |     
   x86_64    |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/0a7335ea9426dcf3f8b891b8e0f6e9b789f2dd3b |     
    sh4      |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/bf07906ebaa59ef8d7321080806d3a05f44bd996 |     
powerpc64le  |        containerd-1.6.2        | NOK | http://autobuild.buildroot.net/results/20cdc755b256494302414bb1f29ecfbcaefa92f4 |     
powerpc64le  |        containerd-1.6.2        | NOK | http://autobuild.buildroot.net/results/470f1daf01459df93c8b2363efd83d287394a569 |     
    m68k     |           cpio-2.13            | NOK | http://autobuild.buildroot.net/results/aa206c09d398d68a41d0f852c95ce15db93eef08 |     
  aarch64    |      crucible-2022.05.25       | NOK | http://autobuild.buildroot.net/results/48a39341ca3dcb3675b2876e680718c3e43f55aa |     
   x86_64    |      crucible-2022.05.25       | NOK | http://autobuild.buildroot.net/results/897b4803f4f221c52899641a45708b49b7cb5f5c |     
   x86_64    |      crucible-v2022.05.25      | NOK | http://autobuild.buildroot.net/results/3a75c6b73a1f583d6db666eacc45c4debd9218e9 |     
   xtensa    | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/d973715442ef189f913c429a31cf6c1aa7f81b40 |     
    or1k     | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/5a25ab8adbbb3bb183c7a90a2de63264da83f29c |     
    or1k     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/07eb3f34a6e9830aeb6a1fbd290e7b5b437861bd | ORPH
  sparc64    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/ecc9fb6bb3e0de243972eb7f58e9bfeb0a42dea5 | ORPH
    i686     |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/ba0db8783e9754fe759cb77e2cc3243e601927f0 | ORPH
   arceb     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/0558197183ecc6e52d9f31154f62541b7a1e55d6 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/972dd4bcb5d310dec8fc5f40a4e7d1c58bfa5368 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/e4ef5814fdfc2e3dc5bd3a30847013417a782cf9 | ORPH
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/61241e968a6fb612c2a62c4d002c3707605dd17c |     
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/cacedaff2d33c044fa752c05f9feceb048a39837 |     
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/8170d5675f21d759d270662a669163f14858a80b | ORPH
  mips64el   |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/af440842f5a21355c868f3b64d2be827e38b063c |     
    arc      |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/ed9a81729f023a49ceb8a0de85877d7dc365af2b |     
  mips64el   | fs/ubi/ubi.mk:51: /nvmedata... | NOK | http://autobuild.buildroot.net/results/426c3c2aa3d93592a5ebafbb8766787a563246b7 |     
  riscv32    | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/ecd2d0e8e47c0b53a239d645a071b1db524c5b58 |     
   nios2     | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/eabb0d9c566b7dd1abddd70fe7cd37b759329099 |     
    or1k     | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/fd7fc0e3a13e6b7b88aac16d45420f6b621aa5c7 |     
  riscv32    | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/a4283e42db95ab27234d3b1b57d55356bb53c78b |     
   nios2     | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/718251bd5b2198f54fbd3348d106eff4d1da39f0 |     
   nios2     | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/92dc828aa3af69ba565c652554b8ba005ff115b1 |     
   nios2     | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/b7c2cfaa4a2f0cd263f7512c6e3d154946eb427b |     
   nios2     | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/de7f4654098eb592f1eec1afae0a138d0c4a556c |     
    sh4      | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/3a28aab6b28e64a3ec3a0024b0034f813a3b1134 |     
    i686     |         gnu-efi-3.0.10         | NOK | http://autobuild.buildroot.net/results/dedc26fa16dde96fbb2ca0d6ba091f90fc548476 |     
  sparc64    |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/9b1e7e372992d7642fe3eda930a13b8b32c6b50f | ORPH
    i686     |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/08fc3b8fd12ee7f3bf7366aa091966ec555e6487 | ORPH
   nios2     |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/f6b38ae92c19abf4dc8b1267f0bd1179893e706b | ORPH
    mips     |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/ab5890e9e6eaaa606ff572703645c5a7549b591f | ORPH
  powerpc    |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/fb06aa9b60ddb3b2e3fc06e8a46fe98c657f1fb1 | ORPH
  powerpc    |            grep-3.7            | NOK | http://autobuild.buildroot.net/results/40334284b68e31146e7819d1c38907d2a970927a |     
  powerpc    |            gsl-2.6             | NOK | http://autobuild.buildroot.net/results/cd9c3b87a5f869a300544a299a0bb3484b8375f1 | ORPH
  mips64el   |         harfbuzz-4.4.0         | NOK | http://autobuild.buildroot.net/results/c88eadb454615ef643ad518c46efad8bf11a821a |     
  riscv32    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/177e30add2e2e3b0d9fe6ea73305ed84f029453a |     
  riscv64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/d0840831c94d18d600863e025beea53a45c35efb |     
    i686     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/28ae1762e4cb03a4dd52c6e06f128d9fd238ddf7 |     
microblazeel |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/3ca7bea115bbc9147f8aea1d7e2921e0a8d971fb |     
   x86_64    |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/35d9acc13be3075209128fd9e975a18af15f74e9 |     
  riscv64    |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/f2c7f8de50508772ca4aa244198ce7274860b202 |     
    arm      |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/56239860e52a04be438b2567353611766a4baf8a |     
   armeb     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/04a08c2bc7e1c0437423048775110e705c7b7030 |     
    arm      |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/f5d87643dd380aa425eff8cc20fa1787e60b6a98 |     
   armeb     |     host-gcc-initial-9.4.0     | NOK | http://autobuild.buildroot.net/results/64ab2d46d104ec71525c42b3c9e8d83115ab60dd |     
   arceb     | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/a69bb15229adeded74129f75ea1a8440d285e26b | ORPH
  mips64el   |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/821819198b631cd6317efa75d3e4c38aa82a4ffb |     
  mips64el   |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/c3a10761b7afd8f96bc4f96bd0a6d4b1dbbb99d3 |     
    i686     |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/1c9ca5b0edea1bc6059da5bef2690346254018be |     
powerpc64le  |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/20b6ab117a94efefa8fa6b1d3ca6aa707a7868be |     
  mips64el   |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/b85cf672ec80f7c0f4a00ecbcb4ee8076b7528d7 |     
  aarch64    |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/8f41e12b5f448bbac87e7e9845b82f4ec7668f03 |     
   mips64    |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/c7cb9f4f30aaea3e42ac634ce3a5e547ef7de238 |     
  aarch64    |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/bddef7adc0166460fe464293170fec7ad4a10653 |     
   mipsel    |      host-harfbuzz-4.4.0       | NOK | http://autobuild.buildroot.net/results/6cc6ff29b8ee524c76526984650393a3ea5c8b86 |     
 aarch64_be  |      host-harfbuzz-4.4.0       | NOK | http://autobuild.buildroot.net/results/5757897e225bd6d11265740f0ae28ca818507a0c |     
    or1k     |      host-harfbuzz-4.4.0       | NOK | http://autobuild.buildroot.net/results/a75dc888631c512b72301e60db83996285a6a70d |     
   armeb     |      host-harfbuzz-4.4.0       | NOK | http://autobuild.buildroot.net/results/1785e02b06b16548bbd4ea7407ad383c8c98f7d2 |     
   x86_64    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/7d7662ad08541a9257b11a65cb1b9468300fd59e |     
   sh4aeb    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/50c183b38cdfbb6667e823d9022a8b83905e52f4 |     
   xtensa    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/997f33f391fdb3ebcc01c4a93f076f188bb14d13 |     
   x86_64    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/8f07c4d1ac6181d352190358fd77ec673b2065fb |     
  sparc64    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/e6aa1b062c6bfd351200d889f6b98eec4ef7f776 |     
 powerpc64   |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/945eba70d4a5a2f60e73840e80d80c8e86f4a61a |     
  aarch64    |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/eea926ec228c36ef1731dc38802cb532a798f7b0 |     
    i686     |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/0700e3ca7743e9e5a87199b2f001b472c845c9f1 |     
    arm      |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/6a2f746215096e794f7f72aea185a01def06c72c |     
   s390x     |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/afec97f2db001e11b55c46a3a350f3629e27ef05 |     
   armeb     | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/157e85ab3445b0852d999b747765a0a020e90c06 | ORPH
  aarch64    | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/09df558b4bf9c162011a5fbbdcc9da4045fe23af | ORPH
   x86_64    | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/72ae95e4e2dcf71cf77e88ee65d25777f652614e | ORPH
    i686     | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/fb7e9aa4473ca4bd220915b3453fccc3dd70f941 | ORPH
    i686     |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/a48256b4c3cdc169726e7fd4fc0df874b71f3159 |     
   x86_64    |         ipmiutil-3.1.8         | NOK | http://autobuild.buildroot.net/results/f7f749d0fccef5e0532bb3951cdbc3af541c2c94 |     
    i686     |         ipmiutil-3.1.8         | NOK | http://autobuild.buildroot.net/results/e6fa4e3182458a59e130c8210882017ba8049f44 |     
    i686     |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/19a0b4df9ba08b788d2934558dde2ec36ad11b29 | ORPH
    arm      |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/e02b7c488acd913ed4956a3fbd0bb19dbc63e97c | ORPH
    i686     |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/a0257a88159e250a2adb6540a87a61fb215e7ee7 | ORPH
    arm      |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/f68e0f3f048b20d431c35d6783abeb775fd8d0bd | ORPH
    m68k     |          jack2-1.9.20          | NOK | http://autobuild.buildroot.net/results/0df30c961b7e9547842076622a3f399789ad20ce |     
powerpc64le  |        jpeg-turbo-2.1.3        | NOK | http://autobuild.buildroot.net/results/d473fc5aa86ae059e3fd1d8b88a4b05bcd6b8641 |     
    i586     | kvmtool-f77d646ba01d04be5aa... | NOK | http://autobuild.buildroot.net/results/58e0633a9cb2dc7adde5668b7b1310144493bcb9 |     
  aarch64    | kvmtool-f77d646ba01d04be5aa... | NOK | http://autobuild.buildroot.net/results/a5ec21f19d8098a99d49777ade27e4785e5928b8 |     
   sh4eb     |         libbsd-0.11.3          | NOK | http://autobuild.buildroot.net/results/e3341dbe74c8bfe34e17de486a048df00e48da21 |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/c9aa0fa78461667ffd4f2092fed42149f4e80045 |     
   sparc     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/4be626dce0caa7955de89f2bbfe90b4015ef7c49 |     
microblazeel |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/7ae91c23f64f3fb8b50b5e4bcc1ce0f1c7e5bfd1 |     
  riscv32    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/6de97b6e7e12032e592301a1ef7b46a68739a2ff |     
   sparc     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/a63b0d2b4d5deee5668b9aa06a68d5486066dc38 |     
microblazeel |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/566dd46c16f796def46801eb115c5761a6a04366 |     
    m68k     |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/1beaf36586c7e48901e9a3f7e5df7c04b77a5166 |     
    or1k     |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/76fcdf4f7e4342005ab339c24cfce4832f8329f2 |     
   nios2     |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/0005272cf3a426e5a0682a89f6352b2ae6412ae4 |     
    sh4      |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/7f40e3689016fc641b10c82946aaf99497d9bc02 |     
  riscv32    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/12e8120a8722bd8f468ae516cd73347ca43696fb |     
    arm      |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/9b1f81d8062628fc13b03129e1f2836722634158 |     
    sh4      |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/53f715d7555a7a90dcbce26b43543a65ae2f2f75 |     
  riscv32    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/af162dc6fd57c7806fa4000910281b92f47b816a |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/1e5d0cdd4a52d579f12223f94b33f0f335daf3be | ORPH
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/2dd10b4d2265f5b6d168eebcfadd5c5150249f45 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/24a97218fb4d3a0428e2d66182286a711c7f8b14 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/8b54379f80de04520902bf7f9f4aa02ebb87416c |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/da6168c1ad52391e1d5fcad59dbb30ef821a614d |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/8e8dc5a1bba3c142715efdc99cf5586d020d187e |     
  aarch64    |        libgpgme-1.17.1         | NOK | http://autobuild.buildroot.net/results/a1e79faa2dcccb234b63c8553dad3df41e133996 | ORPH
   s390x     |           liblo-0.31           | NOK | http://autobuild.buildroot.net/results/6bcad7663bca50414530a151c9bcaa94de733e0e | ORPH
   xtensa    |      libmicrohttpd-0.9.75      | NOK | http://autobuild.buildroot.net/results/f9e0f6525077b2ca845d881728f9a667a50b36c3 |     
   nios2     |       libnetconf2-2.1.11       | NOK | http://autobuild.buildroot.net/results/dd286ca0fd1c6a9db46458c358c623e06db308bd |     
   mipsel    |          libnss-3.80           | NOK | http://autobuild.buildroot.net/results/91cab4753ab73919bc54db38c8989d0793366cb5 |     
  aarch64    |       libopenssl-1.1.1q        | NOK | http://autobuild.buildroot.net/results/250a93ed59a4df29dfd2ff409cd1a61aaaffdc14 |     
microblazeel |       libopenssl-1.1.1q        | NOK | http://autobuild.buildroot.net/results/eae60f1f31a2c1f87a0e19a44f82918280bbcb86 |     
    m68k     |       libopenssl-1.1.1q        | NOK | http://autobuild.buildroot.net/results/620bafea01ad301d875d2afef0dc87106acdd972 |     
    or1k     |       libopenssl-1.1.1q        | NOK | http://autobuild.buildroot.net/results/c9c98e9faefe59159a0990f694e0f4ebb95b623b |     
   xtensa    |       libopenssl-1.1.1q        | NOK | http://autobuild.buildroot.net/results/aba1144f34f9b548c8849b36be3e478ae6f2d44c |     
    arc      |       libopenssl-1.1.1q        | NOK | http://autobuild.buildroot.net/results/9ef428555c0a5c87c5ac379d02205195912b0ab9 |     
  powerpc    |       libopenssl-1.1.1q        | NOK | http://autobuild.buildroot.net/results/95ac4c849973c19358911ea05f958868f1ffb30d |     
  powerpc    |       libopenssl-1.1.1q        | NOK | http://autobuild.buildroot.net/results/a24d4a9caaa8c0efab959409c187d3af60603406 |     
   sparc     |       libopenssl-1.1.1q        | NOK | http://autobuild.buildroot.net/results/494129cdef68828da44d7c06c5bd8014d064e94a |     
    mips     |         libp11-0.4.12          | NOK | http://autobuild.buildroot.net/results/7af59f797b7508a080aba1db156cdc9f9c2cdfe1 | ORPH
    m68k     |  libtorrent-rasterbar-1.2.15   | NOK | http://autobuild.buildroot.net/results/7faa7868654be0b789c51b96fe54c59ab7f85902 |     
  mips64el   |        libuhttpd-3.14.1        | NOK | http://autobuild.buildroot.net/results/77fd2219806104e001d1fc44f0efc076a3eda57c |     
    arc      |         libvpx-1.12.0          | NOK | http://autobuild.buildroot.net/results/aa354e3f42e7292e46b1a7789574e9bc56ae918f |     
 powerpc64   |         libvpx-1.12.0          | NOK | http://autobuild.buildroot.net/results/1c89953f547d89438068ccf016c2217b79ce4f40 |     
   s390x     |         libvpx-1.12.0          | NOK | http://autobuild.buildroot.net/results/f835ef0820ba9909c0c44076e5d61aa3666ee06e |     
   mips64    |         libvpx-1.12.0          | NOK | http://autobuild.buildroot.net/results/854c351fb09f724c90f0d103babcff5138131e3c |     
   x86_64    |         libvpx-1.12.0          | NOK | http://autobuild.buildroot.net/results/4f9d92c842f46abcb585750a66c30ad3e478419e |     
    i686     |         libvpx-1.12.0          | NOK | http://autobuild.buildroot.net/results/cd36904d83243f9ad384188ba5f9f5da695986c2 |     
    or1k     |         libvpx-1.12.0          | NOK | http://autobuild.buildroot.net/results/eb963c61c892a6e76a692bc7b747366650d7250e |     
   arceb     |         libvpx-1.12.0          | NOK | http://autobuild.buildroot.net/results/c0d59106fa020dd98f972adadac47aac67cbeaf2 |     
    or1k     |         libvpx-1.12.0          | NOK | http://autobuild.buildroot.net/results/f8ae04c8adaea5b87f3b4f685d13240286fd0c64 |     
  powerpc    |         libvpx-1.12.0          | NOK | http://autobuild.buildroot.net/results/4c4c1af9c5524d1ab4dc866d753ab8c94cbcc7aa |     
microblazeel |    linux-5.10.109-cip5-rt4     | NOK | http://autobuild.buildroot.net/results/dd3b8a9683b9d15a214e8f090acd496372f8d9d7 | ORPH
    sh4      |    linux-5.10.109-cip5-rt4     | NOK | http://autobuild.buildroot.net/results/d36def94131c326e9249fd159230a9ef682f8d68 | ORPH
  mips64el   |      linux-5.10.115-cip7       | NOK | http://autobuild.buildroot.net/results/ab2b7397d0a51355cfd842b486c8afae8f4ca122 | ORPH
 powerpc64   |      linux-5.10.115-cip7       | NOK | http://autobuild.buildroot.net/results/b1a1fe993d2bc4d0fb263e0d1430f9b5669bfc61 | ORPH
    sh4a     |      linux-5.10.115-cip7       | NOK | http://autobuild.buildroot.net/results/9f91efef5a136ad69784742d2a716c73471fc265 | ORPH
microblazeel |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/33edd68ab29dcc78b6a89b3703da3a68a65cb9d3 | ORPH
   mips64    |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/ba2a43c2b74531af6c781799c855b86ed157f79b | ORPH
  powerpc    |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/812751bcfc0fde02e283266886b4c21409feaca6 | ORPH
   armeb     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/84190de557516a829ee21490cc5eab98aef20b2a | ORPH
    i686     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/33797f5e1cc24f861ccfd6d0aa25c7e4e3f4d55f | ORPH
 powerpc64   |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/1d535fdbc9570f91396ac5142b4cc531f99d95d6 | ORPH
    i686     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/13eb8f09582797614b05defd11ba88212398a7ef | ORPH
  mips64el   |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/95524047e1387e188d9d9611358345ff813f0534 | ORPH
  mips64el   |     ltp-testsuite-20220121     | NOK | http://autobuild.buildroot.net/results/34add455a8d10b578a9242e210aba22af4d0c1cc |     
    or1k     |      lttng-modules-2.13.1      | NOK | http://autobuild.buildroot.net/results/66b3fa5870a84977f8ce7d11f652117f8f68ff51 |     
    arm      | mali-driver-a742530232d1de4... | NOK | http://autobuild.buildroot.net/results/a44f6d8d64d57806025b6208b4cc6fa9a9626658 |     
   nios2     |          matio-1.5.22          | NOK | http://autobuild.buildroot.net/results/8de29632c0d24ae21982426e187eb350757f50ab |     
   nios2     |          matio-1.5.22          | NOK | http://autobuild.buildroot.net/results/178291129de691fba0d7ce724bd00a2edefdee55 |     
  aarch64    |           ne10-1.2.1           | NOK | http://autobuild.buildroot.net/results/09f17733e314d012b53d7e525aebf49b8e1cff9e |     
  aarch64    |           ne10-1.2.1           | NOK | http://autobuild.buildroot.net/results/81d1f0460f71d3769b2d591639164fc7ac08c081 |     
  sparc64    |       ocf-linux-20120127       | NOK | http://autobuild.buildroot.net/results/fabdb0e26da9e31d1a3218630ca275ff1b35d1ff | ORPH
  riscv32    |        open62541-v1.2.4        | NOK | http://autobuild.buildroot.net/results/16492fb41b06114a52b8e29598354e8da39c7e97 | ORPH
  mips64el   |        openblas-0.3.20         | NOK | http://autobuild.buildroot.net/results/d8d2c3e542472dae1b62980674e17eafaf045106 | ORPH
  sparc64    |        openpgm-5-3-128         | NOK | http://autobuild.buildroot.net/results/cd28ebf66ba35314e665072092e1e26430d404ff |     
  sparc64    |        openpgm-5-3-128         | NOK | http://autobuild.buildroot.net/results/eeeb58a572abef17a074cfce9cae5ebea118c9ce |     
    m68k     |         openssh-9.0p1          | NOK | http://autobuild.buildroot.net/results/5ff9809edc4d5abcefc81f1d32e22d2adf4cdd4a | ORPH
    m68k     |         openssh-9.0p1          | NOK | http://autobuild.buildroot.net/results/73c8b02dc0c99bf59d429879b5f77bb12d535148 | ORPH
    sh4a     |           opus-1.3.1           | NOK | http://autobuild.buildroot.net/results/251c9c5eee09e96d1adc387cb7704183d0d47bfd | ORPH
    arc      |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/258910c313996d7bd4abc236a6132aa04b32df46 |     
   mipsel    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/42d4b78df654e51881b7a3a5b0a613f574f6a959 |     
    or1k     |      perl-net-ssleay-1.85      | NOK | http://autobuild.buildroot.net/results/0dbe37ccdb2a9ea665af897c4784b46aebe80031 |     
    sh4      |           php-8.1.8            | NOK | http://autobuild.buildroot.net/results/f5dbf6e78b8eed594c9369f3da2210dd856f19b8 |     
    or1k     |           php-8.1.8            | NOK | http://autobuild.buildroot.net/results/23959318baea23ea3ec81e1dbf728223beeec513 |     
 aarch64_be  |           php-8.1.8            | NOK | http://autobuild.buildroot.net/results/e3f45813785dcac46b71cf995121dbdfa7049f27 |     
    sh4      |           php-8.1.8            | NOK | http://autobuild.buildroot.net/results/1441663605512de07e565d8fa9a76bb2ec0443b3 |     
   sparc     |           pimd-2.3.2           | NOK | http://autobuild.buildroot.net/results/07d09807061422b2fb9c9ff74ce7f5b60c7740ad |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/f9b9311ea7871a9938dd9986c328653bb06fd6c3 |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/ebfe52ce3033da44c8b2eda95758a70ba40ab533 |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/5498cee32fd0629f3bcac8d72b20094fc7c491cd |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/0986c004e932bfd1f83a1dbd8e35664a50ac9c3e |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/593ad4865eccb8e1bdf60c5365b5775bef595edc |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/0bc7d3f53fd081dd6fa022c00fa2c87aed370738 |     
 microblaze  |           pppd-2.4.9           | NOK | http://autobuild.buildroot.net/results/15fb367a18edd8c4868a79a6276dcd927509ad1b | ORPH
  sparc64    |           pppd-2.4.9           | NOK | http://autobuild.buildroot.net/results/2260d2c50584b97f9e00a27775ca6eee610a5873 | ORPH
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/c94143e740a1a96e230745cd656ed39bb9f92c3b |     
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/e7bdafa76ef7a0945bc34eb591ab3ee82b00b8b5 |     
    or1k     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/2b27f4b706608536b34ce620b2ca7bbeca4d2a7f |     
   xtensa    |       python-ujson-5.2.0       | NOK | http://autobuild.buildroot.net/results/8dfae61b6eb12e569badcbb631bfd6dcb043a93b |     
    or1k     |       python-ujson-5.2.0       | NOK | http://autobuild.buildroot.net/results/e98643725949121a056275983c681c8510d09b78 |     
   mipsel    |           qemu-7.0.0           | NOK | http://autobuild.buildroot.net/results/b2bd9e28eea33b1514d74e9d9714e36767e09140 |     
   mipsel    |           qemu-7.0.0           | NOK | http://autobuild.buildroot.net/results/7af22df949a51ae86888cda7c3c0e5eeef5da662 |     
    arm      |    qt5webkit-5.212.0-alpha4    | NOK | http://autobuild.buildroot.net/results/4e299bfe6d00a203d34171af89ec0f0f0b06cb4f |     
    i686     |           refpolicy            | NOK | http://autobuild.buildroot.net/results/62a1558b76ba7fc0eee508f38d7d4062c2799d3f |     
  riscv32    |           refpolicy            | NOK | http://autobuild.buildroot.net/results/bd8dc99a8ff6ad20c1686f484d07d89c72b267b9 |     
powerpc64le  |           refpolicy            | NOK | http://autobuild.buildroot.net/results/fb89927e078eff86c11f24e5c7170cc6f742e67f |     
  aarch64    |         rng-tools-6.15         | NOK | http://autobuild.buildroot.net/results/609cfe3361e0c5e692e16ffa1c8a70834b750422 |     
 powerpc64   | rtl8812au-aircrack-ng-37e27... | NOK | http://autobuild.buildroot.net/results/8b2d8c6dd62dfbbe2427f345ea00c4465a1f5ac6 |     
    arc      | rtl8812au-aircrack-ng-37e27... | NOK | http://autobuild.buildroot.net/results/5e7deee9b009367c3ccf2529451b5aabb286d51f |     
   sh4aeb    |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/b6faf88574b8d40b1b7ec830c928e0abc2cda963 | ORPH
    m68k     |         sg3_utils-1.47         | NOK | http://autobuild.buildroot.net/results/8cc7480fb535e58961c0f5732821a2a91e944abb |     
   nios2     |    shadowsocks-libev-3.3.5     | NOK | http://autobuild.buildroot.net/results/cb830454ff93eaaec0bc981f9c92da1729d3e070 |     
    m68k     |    shadowsocks-libev-3.3.5     | NOK | http://autobuild.buildroot.net/results/a552a7ad66b99f4cbf40e4cfaffbbaa98583cc51 |     
   nios2     |    shadowsocks-libev-3.3.5     | NOK | http://autobuild.buildroot.net/results/ffb268a73c87421ffe3aacd1e5b5b606cccbfe11 |     
  aarch64    |    shadowsocks-libev-3.3.5     | NOK | http://autobuild.buildroot.net/results/1f785e444e8eca4d9c341c351f2142c779ed3a22 |     
    sh4a     |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/567027213051a34675a103858cbe1d33b4d760a0 | ORPH
   sparc     |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/eb9078ec86eeecfd41944ec037fa1d46af6a2782 | ORPH
microblazeel |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/2f5d223273819c9d22b5f767b06a2f96e3a0fe47 | ORPH
   mipsel    |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/2722af7bc5ba57574bce45db3a7f59bf674640fb | ORPH
  sparc64    |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/6c53f76f39c81a7904c70874c0302fa158c89f43 | ORPH
  powerpc    |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/82e56a2fd6384aeac025d34c4759d2f177b3e12b | ORPH
   sh4eb     |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/24761484afb18a5b8b42e17c22f0f369c16e6910 | ORPH
powerpc64le  |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/2ad7cc886ca00563cf37e5940cecedd36ef03169 | ORPH
    i686     |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/513725070e9eb0e9fb75d99e211fd3e68f2f0720 | ORPH
    m68k     |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/4743758eed3956aefa2b280243e5e57643d77dc5 | ORPH
   s390x     |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/02df96669524048cba61f31e408ffd6f8e5d5c5b | ORPH
powerpc64le  |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/2c2f1c7fc49c5de94f0449b0342f58ccda9dc851 | ORPH
   xtensa    |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/685afb8a5f6ff6473684e32d12d01ae9135d6ebb | ORPH
  mips64el   |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/059a1ab93aa6c7b1325d10c243889ef1211f157f | ORPH
   sparc     |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/2eda0d73630f9cfe7786f56238046fb93656ecf8 | ORPH
    mips     |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/463c5025aef9259b2319f9df573ee8440c638978 | ORPH
   x86_64    |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/276d3cd15ac7e0855c6d4a90f598c8da0cc71fd9 | ORPH
microblazeel |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/e5179c1960bb541cf313578f63f6e1c382167701 |     
microblazeel |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/c30e614cb57dab73ba00aa0945ea6af0f2893b14 |     
    mips     |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/7d1defd50b65573cbe4569f5769d661b292c3d4d |     
    i686     |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/c844058d7636522f4b6eaab4b9dc26b1a48d5dfc |     
   nios2     |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/27ca76eb8becb50adac9c763b15840ddd1f0151f |     
    arm      |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/3824cc8a568ee0ba93f66018ea0033cddc30ac28 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/02bb67b696c1e054def3a09cdd7870183d3e1adc |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/19774d636fd2ece23133d5c10b2363cc9ac88cc2 |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/f8a716a7ad4c177461094ec0fff231193e937a64 |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/8885015525bdb9d82d728e832198d32224d5efe6 |     
  riscv64    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/b0c135911baddbb415289351f562a8a107eaba26 |     
  riscv64    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/dbfd2f269bbc1b8c3df963307e200dd8c3292507 |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/5277143bbfedb3699710ec80d53886ad32b52d2c |     
    arc      |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/20c917e413ca9d6f5673f4417962a63dd5405ceb |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/6ce3be3768ee574e4c3680fea2eeea585ae0958f |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/63e6e19d399e10b8b8981b4cfd89f47166c74734 |     
    arc      |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/840252daa5bd742eb3afb47d76bfafdaa4ea6241 |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/36242f80fc260122a6086b9e638cd2ca5c780247 |     
    arm      |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/590978668c1500a72a95212008352e642e7f702a |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/49f6a8fd370efee37dd87324a1ff12df42d446d7 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/3e89a867bc1c5000f1ea6a012c315d752852ba9f |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/714c7c0c1421c7d50cbc985d625c828243ffedde |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/ac9cda0f7f499a8af891bc4a4404e52e279702db |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/194d755aa323d0d1e63e4171fdd5707b0b132d99 |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/0bd0304e3cf297edcf14efb6ac8edbbab60af6d9 |     
   mips64    |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/4f0f8c63767d890fb14cd3c05d72d0c06e66b1cc | ORPH
microblazeel |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/4bc0a8fa8c79d05e778d7bd4d5a2cc03898d8725 |     
  riscv32    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/1908c403dbf0202a57ec09188301c0024aa2b8c7 |     
  powerpc    |            xenomai             | NOK | http://autobuild.buildroot.net/results/943e91dcdabe68c0c17df11095d01cf37a4fc3ba |     
   x86_64    |            xenomai             | NOK | http://autobuild.buildroot.net/results/06e8ce7c18c21238467de0ee935640a6bd82c6a6 |     
   arceb     |            xenomai             | NOK | http://autobuild.buildroot.net/results/a95b4ee9148d70853e5ed9977c64324f05433a44 |     
  sparc64    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/a3a69582081e2e4572be244b6b178f44741460f1 |     
  sparc64    |         xenomai-custom         | NOK | http://autobuild.buildroot.net/results/e7956049c99553412da6fb5d97d126d7119580b3 |     
   nios2     |         xenomai-custom         | NOK | http://autobuild.buildroot.net/results/4f14b1010c85512959346e4bfef30c23fc0d00b8 |     
 powerpc64   |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/cd202ac695edeffc092edc97ac9b4e7deb1dceee |     
    mips     |         zerofree-1.1.1         | NOK | http://autobuild.buildroot.net/results/1f6abef7a0df5efa0949f8798f3782346d4bc63f |     
 powerpc64   |         zerofree-1.1.1         | NOK | http://autobuild.buildroot.net/results/a2373d7e6a6ee26dccc7c63622facd19d93a35d9 |     
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/a116410e36ffb024fc752efb6af91d12a984385b | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/5b8b10419bc6a9c8eab8c7fab428a212224aa562 | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/ae997c6a1d6d6cf8c87ffc871423c5ff40f4de00 | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/95e4a097ab95eec258dd1fe7eb0071484e080388 | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/228058e7b900bea2453d9919dd5bdd1329e61495 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/479db1987f6db2034415e0d7656432216cb154f1 | ORPH


Classification of failures by reason for 2022.05.x
--------------------------------------------------

                host-go-1.18.3 | 2 
host-pahole-73383b3a39afe86... | 2 
           libfreeimage-3.18.0 | 2 
                       unknown | 2 
/home/buildroot/autobuild/i... | 1 
                    brltty-6.4 | 1 
              containerd-1.6.2 | 1 
docker-proxy-339b972b464ee3... | 1 
                  exempi-2.6.1 | 1 
                     frr-8.2.2 | 1 
               gocryptfs-2.2.1 | 1 
              host-rust-1.60.0 | 1 
             libopenssl-1.1.1o | 1 
                libressl-3.5.2 | 1 
                 mesa3d-21.3.8 | 1 
               protobuf-3.20.1 | 1 
                     refpolicy | 1 
              swupdate-2022.05 | 1 
toolchain-external-bootlin-... | 1 
                 uclibc-1.0.41 | 1 
                 wavemon-0.9.4 | 1 
                       xenomai | 1 


Detail of failures for 2022.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/43b8a7b0065db05c425923c0513a21cb8308edc3 |     
microblazeel |           brltty-6.4           | NOK | http://autobuild.buildroot.net/results/764538609b43958729655b3d46c3145be3290f9f |     
  aarch64    |        containerd-1.6.2        | NOK | http://autobuild.buildroot.net/results/aa854b40955c0b3a8230ac05cb0704d0329d5fde |     
powerpc64le  | docker-proxy-339b972b464ee3... | NOK | http://autobuild.buildroot.net/results/18f2a6cb40b28731b1d2714d829f9804e498b8c1 |     
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/8fe3fdff63ec34e40d8f6659129cb9ee38685117 |     
   xtensa    |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/0ce166fca8982346752f9d7acc682d42074a2e1f |     
  riscv64    |        gocryptfs-2.2.1         | NOK | http://autobuild.buildroot.net/results/267f94db08ee47631996a0e4db15e6de5f83e4a6 |     
    i686     |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/ae59090349653f8a7714bf4022dc42dd29f2f128 |     
   mips64    |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/75c57dba792b39a94deacd40c13d0accdf712c0c |     
   armeb     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/521b52104472909bbda5496b2053253bc13af640 |     
   armeb     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/8f278d3ec3672aba776d113aa792e93bab321ebd |     
   x86_64    |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/28c08111160ec759e51cb125cb8b22b544f3e6df |     
    i686     |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/73559aa42f9d371c0bb6a04e748b2079eb18abbd |     
    m68k     |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/89c181fa0cad9c7ecadaa1cee10f5193d7b38624 |     
    or1k     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/4226c627591291f9ef7e6a051ccaa967174ff702 |     
   arceb     |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/5e42b8f6fc487840b92a2565e236b64ede9b091c | ORPH
  riscv32    |         mesa3d-21.3.8          | NOK | http://autobuild.buildroot.net/results/3d0b3373ea3d939bcf61797ac37867d43cb9e87e |     
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/c7fff092e271da687ee19219c72956c102db1338 |     
 aarch64_be  |           refpolicy            | NOK | http://autobuild.buildroot.net/results/39e4c012a9ac6a293f48860549ef5269edb9c908 |     
    i686     |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/5a4ee6330c7afa1b23a720a318cc047398039bd5 |     
    or1k     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/edd1a58b825a64e0812aa8e1f1be94a44a1a0e5d | ORPH
    arm      |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/22176f3a72f67ace3378ca939270c048275bcf08 |     
   sh4aeb    |            unknown             | NOK | http://autobuild.buildroot.net/results/b0a72570993d534f7189bbf19ac89c2561685754 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/e902f5eec66780b6541419b17bb0ecdf950c294b |     
    arm      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/f2498c26936faa84c7e21dbe5664854059a3f30b |     
   nios2     |            xenomai             | NOK | http://autobuild.buildroot.net/results/1dab73ff41f87ac0fd6d9d3cfa19467fe4be7ce1 |     


Gitlab CI results for 2022-07-18
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
...e6500GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/2733122303  | ORPH 
...ystemSystemdRoIfupdown | https://gitlab.com/buildroot.org/buildroot/-/jobs/2733121596  | ORPH 
           TestLuaLuacURL | https://gitlab.com/buildroot.org/buildroot/-/jobs/2733121769  | ORPH 
               TestMender | https://gitlab.com/buildroot.org/buildroot/-/jobs/2733121849  | ORPH 
                  TestOci | https://gitlab.com/buildroot.org/buildroot/-/jobs/2733121547  | ORPH 
     TestPerlEncodeDetect | https://gitlab.com/buildroot.org/buildroot/-/jobs/2733121871  | ORPH 
        TestPythonPy3Argh | https://gitlab.com/buildroot.org/buildroot/-/jobs/2733121920  | ORPH 
...honPy3FlaskExpectsJson | https://gitlab.com/buildroot.org/buildroot/-/jobs/2733121947  | ORPH 
             TestZerofree | https://gitlab.com/buildroot.org/buildroot/-/jobs/2733122037  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
