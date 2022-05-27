Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 563C5C433EF
	for <buildroot@archiver.kernel.org>; Fri, 27 May 2022 04:43:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BCBA0412CB;
	Fri, 27 May 2022 04:43:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EFLx4eNvMPU0; Fri, 27 May 2022 04:43:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3A99540496;
	Fri, 27 May 2022 04:43:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 136661BF36B
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 04:43:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 107C140496
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 04:43:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H3Oit_e61Xle for <buildroot@lists.busybox.net>;
 Fri, 27 May 2022 04:43:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DA5CE40134
 for <buildroot@buildroot.org>; Fri, 27 May 2022 04:43:17 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B10E91C0007
 for <buildroot@buildroot.org>; Fri, 27 May 2022 04:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1653626594; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+2cNB+ITcaw5WRivl+LBVDL3TS2IKthVDgKmR5IiHcQ=;
 b=T8Qw4AkMQt8Lhucyo3yG4VVqHftsrLRU0dESWSl6/pPiKM4oa/K5YE2vLLSXXBbb99blSV
 HG0RRTBhvn46oro9nlLBYU0w+LQ4K0HqiOSWSKjq6Tx38Jpcod3zAPGALsHrxANaUpmS4F
 kq6WrdXtMG1v3RVEOLlxKF3hcKExpWo7xhOYvr5rGzkcHxCZG3FEtDHWuwFHvWRI9oQ9Jj
 g7i32QS57KthZYVDbVQNJ2Euz6V5P2WS+l/zxGd3r28IAx6cyEmS8QmoKLcL7J5Evoxo8C
 8DO1ACNYaTNpQtCBAtOKavyLi/TfNxuylPrBLaRdfe7RNFkD0uiLeMpLq2H6fg==
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Fri, 27 May 2022 04:43:14 -0000
Message-Id: <20220527044320.107C140496@smtp2.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-05-26
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

Autobuild statistics for 2022-05-26
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  | 12  |  6  |  0  | 18  |
    master   | 127 | 124 |  0  | 251 |

Classification of failures by reason for master
-----------------------------------------------

         host-gcc-final-10.3.0 | 17
           optee-client-3.17.0 | 12
             libgpg-error-1.42 | 4 
               protobuf-3.20.1 | 4 
                 uclibc-1.0.40 | 4 
             libopenssl-1.1.1o | 3 
                libressl-3.5.2 | 3 
              swupdate-2022.05 | 3 
                       unknown | 3 
              alsa-lib-1.2.6.1 | 2 
                busybox-1.35.0 | 2 
         host-gcc-final-11.3.0 | 2 
host-gdb-arc-2020.09-releas... | 2 
                   libiio-0.23 | 2 
                   libnss-3.78 | 2 
              libostree-2022.3 | 2 
           libwebsockets-4.3.1 | 2 
                  linux-5.17.7 | 2 
           python-orjson-3.6.7 | 2 
                     refpolicy | 2 
                 zlib-ng-2.0.6 | 2 
aer-inject-9bd5e2c7886fca72... | 1 
                     aufs-util | 1 
                    bat-0.19.0 | 1 
                 batctl-2021.0 | 1 
                     bc-1.07.1 | 1 
                    bird-2.0.8 | 1 
                  boinc-7.18.1 | 1 
                  boost-1.79.0 | 1 
dahdi-linux-5c840cf43838e06... | 1 
                  exempi-2.6.1 | 1 
                      fbv-1.0b | 1 
                     frr-8.2.2 | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
                      gdb-10.2 | 1 
glibc-2.35-96-g2c4fc8e5ca74... | 1 
  gobject-introspection-1.70.0 | 1 
google-breakpad-c85eb4a59b6... | 1 
              host-delve-1.8.0 | 1 
       host-gcc-initial-10.3.0 | 1 
       host-gcc-initial-11.3.0 | 1 
                host-go-1.18.2 | 1 
host-google-breakpad-c85eb4... | 1 
              jpeg-turbo-2.1.3 | 1 
libcamera-apps-2d1009e3badc... | 1 
                  libcec-6.0.2 | 1 
                libglvnd-1.3.2 | 1 
                 libidn2-2.3.2 | 1 
           linux-5.10.104-cip3 | 1 
                   linux-tools | 1 
              memcached-1.6.12 | 1 
                  mxs-bootlets | 1 
         mxs-bootlets-10.12.01 | 1 
                nodejs-16.15.0 | 1 
               pipewire-0.3.51 | 1 
                 pixman-0.40.0 | 1 
               postgresql-14.3 | 1 
                     pv-1.6.20 | 1 
      qt5webkit-5.212.0-alpha4 | 1 
rtl8723bs-11ab92d8ccd71c80f... | 1 
                    ruby-3.1.0 | 1 
                  scrypt-1.3.1 | 1 
       shadowsocks-libev-3.3.5 | 1 
             transmission-3.00 | 1 
                   uacme-1.7.1 | 1 
             uccp420wlan-6.9.1 | 1 
uclibc-ng-test-0844445e7358... | 1 
                 wavemon-0.9.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/8ddc2c18a8d868f58d8ed15efe641058c0849987 | ORPH
    m68k     |        alsa-lib-1.2.6.1        | NOK | http://autobuild.buildroot.net/results/0b9a0a8094c8f067dfa5a4c913271c87ae9b17cc |     
    m68k     |        alsa-lib-1.2.6.1        | NOK | http://autobuild.buildroot.net/results/b73e2ae65944e44b8d127021be89830eb4206f00 |     
    or1k     |           aufs-util            | NOK | http://autobuild.buildroot.net/results/77f829dc2c3801c8b414bbe5bacfa286d763421e |     
    i586     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/65329822c6670a41784e59c681a0bb2e329c629d |     
    m68k     |         batctl-2021.0          | NOK | http://autobuild.buildroot.net/results/40395c4dec2cf49afdd660c41530b9b10aa46139 |     
  riscv64    |           bc-1.07.1            | NOK | http://autobuild.buildroot.net/results/c8d0eb4dba5122542d792dd08672098b8a588e4e |     
  nds32le    |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/b338d03440518093419b192d705b825be6e5ed37 |     
  riscv64    |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/71c7196dc8dd2ce8bb162e7cd774adc39da69297 |     
    arc      |          boost-1.79.0          | NOK | http://autobuild.buildroot.net/results/826d2fce22c8001770e0cd8acf34e7dd67f2e925 |     
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/9a6c0d9125427cc3d561ebc3e354d1fd545a2da9 | ORPH
    m68k     |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/2347fd7caebe35762788fa28f661b60b710d07b0 | ORPH
 aarch64_be  | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/bc8f8b03b554fe19709da02087b22dbd5bbd7dbe |     
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/408d4c67a0bc4df69788cbbd6dfac512f8af060f |     
   mips64    |            fbv-1.0b            | NOK | http://autobuild.buildroot.net/results/1c5522f4d6427429981a38870c2db891df072c4a | ORPH
   xtensa    |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/f68449a4e444f34c5560096ff61087da7fb99bd7 |     
 powerpc64   | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/fdf64c2faa079b9351194d6da02145e5bc8d2fc5 |     
   sparc     |            gdb-10.2            | NOK | http://autobuild.buildroot.net/results/25f828ee2ce77624521c846f7d20fe83600aeb60 | ORPH
    or1k     | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/b866ac650bbf748d2d4dafbd853dcfccdd19f735 |     
  sparc64    |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/fbfa5c429e89c0b202dab422787a559b403e67e5 | ORPH
   mipsel    | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/10475ded4ea1fe3695341d10cb930fbb4db6d185 |     
    arm      |        host-delve-1.8.0        | NOK | http://autobuild.buildroot.net/results/435531daf7a3e2b86a93484886f05786fcbe1d09 |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/098a5f875e3a5b205442fe00636af52b7c621cdc |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/858c38210642cc24e62891f18637e53ce3ecbcf5 |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/a2e9e4e5f81cd0a4c3675303dd707783071b001e |     
  riscv32    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/e786409112373f7376921e0e74ead6bdaa5e94a1 |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/9bcdf5a5e9bac4b9547d260658467f1cc2171db9 |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/b0b52f3b9f5f87722ede6eb52f443fd9fc99ef5f |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/90f2223b18519424f2679cacb5479306dafcab5a |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/ff538f6445f4df0e8cd8dbb749c928edb481ca2b |     
  powerpc    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/ae26a515a23f0aa6ff69496d4ec4752665992c71 |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/a8752c517020f3c1fcc031dfe66ccfeb9fac9177 |     
  riscv32    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/ffaa234539e5dc04eddc7cb0b2191ddf0c7a2892 |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/635da4f705a968e939910158dc201150949ac88a |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/4df370af7c29c089e73645ae1cab356f7082677e |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/249ff60b6dec02a15ac3255a1a50b2e8824debd9 |     
   armeb     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/47ad6bba108e6132856202ce1d45d5e107487be0 |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/817dace5e5035df5b69db08aeece40e2250437a1 |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/f268f81592f236b860e11ba58dc1fb090a7d34b8 |     
   nios2     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/44790ed7abe148b5929c5cf51691b9217b29967a |     
    arm      |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/a489a0496e0d14ec9afd018e2b19217a6d4e6291 |     
    arm      |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/c53f6f4d3feba731b5a65948d3ac5a1d9c507dc5 |     
    arm      |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/54d041d32908228127d59cd59f4c9e2e2933f2b7 |     
    arc      | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/f1fe8277843d3afc65b0947b95cb9fa75768de42 | ORPH
   arceb     | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/d46e67baf23db1177c9b907c37d7845594875965 | ORPH
  mips64el   |         host-go-1.18.2         | NOK | http://autobuild.buildroot.net/results/9a8b5b31b7689008bdca2a265fcca29f4894fc4f |     
    arm      | host-google-breakpad-c85eb4... | NOK | http://autobuild.buildroot.net/results/90281fe6b953fa3d957c3c09c37c755e54c29952 |     
powerpc64le  |        jpeg-turbo-2.1.3        | NOK | http://autobuild.buildroot.net/results/68d3538c75a111a83da114774a239c46428b140c |     
  riscv64    | libcamera-apps-2d1009e3badc... | NOK | http://autobuild.buildroot.net/results/1e42d92d4bbf4da2a1928e274c0b840485b924af |     
 microblaze  |          libcec-6.0.2          | NOK | http://autobuild.buildroot.net/results/5fec669f3ecee33e2ae8c62ffafa3301ad7db982 |     
   mipsel    |         libglvnd-1.3.2         | NOK | http://autobuild.buildroot.net/results/0ef060d60778dcdf316c609a6abed630695f4c0f | ORPH
  aarch64    |       libgpg-error-1.42        | NOK | http://autobuild.buildroot.net/results/6ea91f679ccc68fd8beae91d495f0c0aa324184c | ORPH
  aarch64    |       libgpg-error-1.42        | NOK | http://autobuild.buildroot.net/results/688db19321b4c4165b2912ccebf480f8269f4fe4 | ORPH
  aarch64    |       libgpg-error-1.42        | NOK | http://autobuild.buildroot.net/results/a8cefc7ddc4f24d79ae4db2f34f17c8bade4d924 | ORPH
  aarch64    |       libgpg-error-1.42        | NOK | http://autobuild.buildroot.net/results/2f2562ecb8ca58557997923652a5b0b8069355d3 | ORPH
  aarch64    |         libidn2-2.3.2          | NOK | http://autobuild.buildroot.net/results/291e11c5cb4797bd3208ef3ed8ec93150b559d5d |     
    arc      |          libiio-0.23           | NOK | http://autobuild.buildroot.net/results/8cc6a094e1d4ed8e8f1d5ec4cb0f42f53bf795cf |     
   sparc     |          libiio-0.23           | NOK | http://autobuild.buildroot.net/results/a5ee425891c4aa946acfc80e7ba520f7d4cfc497 |     
    mips     |          libnss-3.78           | NOK | http://autobuild.buildroot.net/results/ce324abd2e53ac53b6b0ce8dba55e3a153a9e31f |     
 powerpc64   |          libnss-3.78           | NOK | http://autobuild.buildroot.net/results/cc17b36f7561e948de901c0ecb45c514a68dd330 |     
 microblaze  |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/42a9a479854593a36f8549defd38aac212c58588 |     
  aarch64    |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/4df05cfe15c5e22231885f987d61afad57b60a49 |     
   arceb     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/e26711b73c39681b5e2917b0751018dde042c4ba |     
  mips64el   |        libostree-2022.3        | NOK | http://autobuild.buildroot.net/results/814f6663fecdcb37aebeba3dd837b04bcf6bc72f |     
  sparc64    |        libostree-2022.3        | NOK | http://autobuild.buildroot.net/results/244f88db2cbe0968f90ea3f8b8d981b6c4590198 |     
   sparc     |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/e0d27199db88988d015c7fff38163804e9bc167d | ORPH
    sh4      |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/b9ecacfb5fc2eeb867bd03494761718ff43faef6 | ORPH
   armeb     |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/59b6b6e236d595af87451d59597b5626d95dd788 | ORPH
    arm      |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/01d0129c130053e1c5343ab9fe767efb9512b888 |     
    arm      |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/01acd1094b0af4e897700a99514bcc376cb022e4 |     
   mipsel    |      linux-5.10.104-cip3       | NOK | http://autobuild.buildroot.net/results/792766cecf41722f3347cf2ad0ffdff02dca109c | ORPH
   nios2     |          linux-5.17.7          | NOK | http://autobuild.buildroot.net/results/c9c2999706330781e18c9796711b8a04bf015aca | ORPH
    m68k     |          linux-5.17.7          | NOK | http://autobuild.buildroot.net/results/3fac80239f4e3699d831eea5468553f75ba891c6 | ORPH
   x86_64    |          linux-tools           | NOK | http://autobuild.buildroot.net/results/58f4cdb734b68afb02595d004e7ca19a15d1abcc | ORPH
 aarch64_be  |        memcached-1.6.12        | NOK | http://autobuild.buildroot.net/results/419bb1df2864ee49db706693a348f1d6069ae0be | ORPH
    arm      |          mxs-bootlets          | NOK | http://autobuild.buildroot.net/results/abf322b6da259dfe606290b6dfc1edc8b69edab1 |     
    arm      |     mxs-bootlets-10.12.01      | NOK | http://autobuild.buildroot.net/results/3763ce85702a3a87c97436e707b8e5d2e135e4fe | ORPH
  aarch64    |         nodejs-16.15.0         | NOK | http://autobuild.buildroot.net/results/4188ef10fa7b2559b7d13c11b7f89eb38eba730c |     
   mipsel    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/b856f1001d585ada4cbe5e1d53dc39cc0bbbdda1 |     
   mipsel    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/1d5aa48d35685e888c1d0125e4704f9922fbf910 |     
    arm      |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/82d17f7e277eebb450190c76dc46ab723c747621 |     
    arm      |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/cd9b17f8e8071813f39a3bbf76321d9c6f85f7fb |     
    arm      |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/483832c04a20741227c7ea27affe448179581a41 |     
 aarch64_be  |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/aaf28e0f04b52d57a31c40318b0b86111dc86474 |     
   sparc     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/c317b5be8c3959a35fb0656e0a835dcd0f8be6d9 |     
   x86_64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/e63dd5aebb7125d770c6374100de4606d750c12c |     
    or1k     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/90da8f31f81a0d8f65b2ed309539146d7e91a9a2 |     
    arm      |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/1d6728c2605189bb9c299827be9e88ba09a079e2 |     
  aarch64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/3ec3d16f1cff0a3c68b3308e47ee71e342efffcb |     
   x86_64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/e352505662f16c65a800c9dcaeba74efb2ee2af3 |     
   sparc     |        pipewire-0.3.51         | NOK | http://autobuild.buildroot.net/results/a303a6c251643bceb941483cdbc8844e9411a832 |     
    sh4a     |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/d34b8672f6211d60af4122bdd94fa8c2f4f4bf6a |     
    arc      |        postgresql-14.3         | NOK | http://autobuild.buildroot.net/results/642d4f6ccbe549c81b69733e4a6b134765d79ece |     
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/9fd3a6be3a4d050056c3b7f21139fea38977e866 |     
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/b3a5e4f4173e96b11a414cb2e83f7f591c8a3398 |     
microblazeel |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/e4f693e4e265eaf94c7979b84e917fc97f83562c |     
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/5b537c310387b874170cf86e55f788f3aed78897 |     
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/d950cb3f6a40c23dc30ab30ba55112526c783600 | ORPH
    i586     |      python-orjson-3.6.7       | NOK | http://autobuild.buildroot.net/results/877d137abcd95063d78a8a8357b6b5781a6c7648 |     
   x86_64    |      python-orjson-3.6.7       | NOK | http://autobuild.buildroot.net/results/747425e7efc2bcf52d791ae7fcfcb29817cac73b |     
   x86_64    |    qt5webkit-5.212.0-alpha4    | NOK | http://autobuild.buildroot.net/results/9165b522fe4b002686f0d6d76d03e4eef1b1bda5 |     
    mips     |           refpolicy            | NOK | http://autobuild.buildroot.net/results/5597f997e510a82547f669225f4c94a143d02f96 |     
   armeb     |           refpolicy            | NOK | http://autobuild.buildroot.net/results/1182a97015a584ef8e46066b843f8c2fa52698d7 |     
  sparc64    | rtl8723bs-11ab92d8ccd71c80f... | NOK | http://autobuild.buildroot.net/results/7a473e83d4a3d1e2228f4ee1282e85697de4ae5d |     
  riscv64    |           ruby-3.1.0           | NOK | http://autobuild.buildroot.net/results/b579ba05da5e4a2da3f1f5b97dcc814c31792761 |     
   arceb     |          scrypt-1.3.1          | NOK | http://autobuild.buildroot.net/results/f7ea850d6271ea88da4059ebc975e4fbf2f19194 |     
    mips     |    shadowsocks-libev-3.3.5     | NOK | http://autobuild.buildroot.net/results/efc0cd10862f9474280f602e90ea17a44e69da0d |     
    mips     |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/bd4cbd8918bc01baacb648744ff7175930b0bcb2 |     
    arc      |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/c527075904926d70e6085ac28a233d9215862741 |     
   armeb     |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/e24ce0c89fa43d9e975c94ef6fb3c770ad951383 |     
  aarch64    |       transmission-3.00        | NOK | http://autobuild.buildroot.net/results/b3b882482f517726e5c780ba4c37818bd379df82 |     
   x86_64    |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/6bd1bca443c8cae692d28d829e1cd2be2fa00e6c |     
microblazeel |       uccp420wlan-6.9.1        | NOK | http://autobuild.buildroot.net/results/058cf7aa8643a8c6de15cfdfd5d8c0ed20f70fff | ORPH
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/c1ed6e7e049b2c98a82db981c02021fa944e0bf0 |     
    arm      |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/2af344127b3476810d10f135b197e212dbb3ae3a |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/b8064ee5e4af19fe13deeb804ff5f709dd7c52e8 |     
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/13c499b07c7e534e2fbc130015667198d328c4b9 |     
   mipsel    | uclibc-ng-test-0844445e7358... | NOK | http://autobuild.buildroot.net/results/a3675f485030e692f601ffd6089b5e8de7d6f0c0 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/cff4d4833f80e329914616c7dd4fd6b80c76062e |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/0a815c8f48b2f407807e7a2b90992c36ea12fe23 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/820a3c536ae8694dd6e87365174f450841649629 |     
  mips64el   |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/fc7fa6584fd1544c74d5d8678f4c75c7bdacfff7 |     
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/33510910827f5b66b0674bf1e0b5f5bd3fe24a31 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/3ec70b0e642babb7477d9e191e1c6c8052773004 | ORPH


Classification of failures by reason for 2022.02.x
--------------------------------------------------

                 wavemon-0.9.4 | 2 
                  exempi-2.6.1 | 1 
google-breakpad-7515ab13768... | 1 
package/pcre2/pcre2.mk:33: ... | 1 
              pcre2-legal-info | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/139b9a6bcd1fb70ca1e87bed7f776e3571cd81f0 |     
   mipsel    | google-breakpad-7515ab13768... | NOK | http://autobuild.buildroot.net/results/b32b85122db489a5fd7c10e4eb4b955436abe36d |     
  sparc64    | package/pcre2/pcre2.mk:33: ... | NOK | http://autobuild.buildroot.net/results/24a60e829bca6eafb135c68e05931933aac754e2 |     
    i686     |        pcre2-legal-info        | NOK | http://autobuild.buildroot.net/results/a811b7f021dd089d637c18d102e5e3606f0e5351 | ORPH
   sparc     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/56f308669743463a81d792e067650565cc51e9c5 |     
    i686     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/e34cab923b47d80cf7d77cea38c40ff284aaf40c |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
