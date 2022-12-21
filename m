Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEA71C4332F
	for <buildroot@archiver.kernel.org>; Wed, 21 Dec 2022 07:23:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40A0960AD1;
	Wed, 21 Dec 2022 07:23:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 40A0960AD1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CmirIEimtPVW; Wed, 21 Dec 2022 07:23:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E9F161020;
	Wed, 21 Dec 2022 07:23:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E9F161020
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3CDBA1BF8C7
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 07:23:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 01FF981EEE
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 07:23:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 01FF981EEE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U9QcQAJnkAdz for <buildroot@lists.busybox.net>;
 Wed, 21 Dec 2022 07:23:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E1C781EEB
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0E1C781EEB
 for <buildroot@buildroot.org>; Wed, 21 Dec 2022 07:23:50 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4648840007
 for <buildroot@buildroot.org>; Wed, 21 Dec 2022 07:23:48 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Wed, 21 Dec 2022 07:23:48 -0000
Message-Id: <20221221072354.01FF981EEE@smtp1.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1671607428; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ZO78LbCuaAP/6SChLpypQKYsoPgXLoP3lvhNM/TgFJc=;
 b=jNa8N9AxIIIZWy0dH3zr6sHJiQkaYWqJ2nEWTlY+HMd9c5t5wUs2Sza+FFXWCh9T97NqWy
 RW7BwTloTQONKW8ENlXxWutd5XuiQUtplQ9UwGfvDp6H4y1WOLCgmHXBpW2AdRSTeb8VGm
 6UoXe+odliZmFWkbDoxR5+4l7uhVALxKc4ixacEWXPtYtzk/cg+r73CZoQI8Qf5ZyhBYUx
 coLE9OKxDYep43/uCwIABs2l1myblc0T1DY7TAPSWLsB+b2aKCWpIC4ZGEGleurqehTrWz
 Nd7xlegkljNEI/14gZyn9/0Ww54y/E3qD7G80ii8X+kbzgLuIt5yH42ABEKo7A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jNa8N9Ax
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-12-20
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

Autobuild statistics for 2022-12-20
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  2  |  0  |  0  |  2  |
  2022.11.x  | 17  | 15  |  0  | 32  |
    master   | 163 | 259 |  0  | 422 |

Classification of failures by reason for master
-----------------------------------------------

                   aubio-0.4.9 | 22
               host-fwup-1.9.1 | 20
                    fwup-1.9.1 | 15
                     xz-5.2.10 | 14
            host-binutils-2.38 | 9 
                       unknown | 8 
                gerbera-1.10.0 | 7 
              host-rust-1.65.0 | 7 
                     linux-6.1 | 7 
                    pixz-1.0.7 | 7 
                  jack2-1.9.21 | 6 
                    opkg-0.4.5 | 6 
            host-binutils-2.37 | 4 
                host-go-1.19.4 | 4 
host-go-bootstrap-1.4-boots... | 4 
    host-python-greenlet-2.0.1 | 4 
                    norm-1.5.8 | 4 
                   perl-5.34.1 | 4 
             dahdi-linux-3.2.0 | 3 
glibc-2.36-66-ga1dc0be03c9d... | 3 
              host-pahole-1.24 | 3 
               libcap-ng-0.8.3 | 3 
               libglib2-2.72.3 | 3 
    python-cryptography-38.0.4 | 3 
                    crun-1.7.2 | 2 
                     efivar-38 | 2 
                elfutils-0.186 | 2 
                   gvfs-1.48.1 | 2 
            host-binutils-2.39 | 2 
             host-delve-1.20.0 | 2 
host-gobject-introspection-... | 2 
               libdeflate-1.15 | 2 
                libglvnd-1.4.0 | 2 
                mongodb-4.2.18 | 2 
                    musl-1.2.3 | 2 
                 nerdctl-1.0.0 | 2 
            python-bunch-1.0.1 | 2 
                   trinity-1.9 | 2 
                    zeek-4.1.1 | 2 
/home/buildroot/autobuild/i... | 1 
/home/buildroot/autobuild/i... | 1 
/home/buildroot/autobuild/i... | 1 
                alsa-lib-1.2.8 | 1 
android-tools-4.2.2+git2013... | 1 
                  bind-9.16.33 | 1 
                  cairo-1.16.0 | 1 
                 dash-0.5.11.5 | 1 
                    dust-0.8.1 | 1 
        edk2-edk2-stable202208 | 1 
              erlang-22.3.4.22 | 1 
                   flann-1.9.2 | 1 
             fontconfig-2.13.1 | 1 
                     frr-8.3.1 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/cramfs/cramfs.mk:46: /tm... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
  gobject-introspection-1.72.0 | 1 
                host-acl-2.3.1 | 1 
       host-gcc-initial-11.3.0 | 1 
host-gdb-arc-2020.09-releas... | 1 
           host-libzlib-1.2.13 | 1 
         host-sentry-cli-2.8.0 | 1 
host-spirv-llvm-translator-... | 1 
              hyperfine-1.14.0 | 1 
                   json-c-0.16 | 1 
          libatomic_ops-7.6.14 | 1 
                libdnet-1.16.1 | 1 
              libgcrypt-1.10.1 | 1 
             libgpg-error-1.45 | 1 
              libostree-2022.7 | 1 
      linux-5.10.145-cip17-rt7 | 1 
             lirc-tools-0.10.2 | 1 
        ltp-testsuite-20220930 | 1 
               mariadb-10.3.36 | 1 
                 mesa3d-22.3.1 | 1 
              mosquitto-2.0.15 | 1 
            ocf-linux-20171122 | 1 
              open62541-v1.3.3 | 1 
                 openssh-9.1p1 | 1 
           optee-client-3.19.0 | 1 
                    opus-1.3.1 | 1 
           python-numpy-1.23.5 | 1 
           python-pyicu-2.10.2 | 1 
            quickjs-2021-03-27 | 1 
rtl8192eu-94bce7798bbb18de6... | 1 
rtl8812au-aircrack-ng-e7a4a... | 1 
                    sdl-1.2.15 | 1 
                  sscep-0.10.0 | 1 
                 sudo-1.9.12p1 | 1 
toolchain-external-codescap... | 1 
                   ulogd-2.0.8 | 1 
uqmi-0a19b5b77140465c29e2af... | 1 
               valgrind-3.19.0 | 1 
                 wavemon-0.9.4 | 1 
                xenomai-3.0.10 | 1 
                     xterm-376 | 1 
                  xxhash-0.8.1 | 1 
                  zabbix-5.4.9 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sh4eb     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/39e6ad81af92599c7c85984875be8542c9d20f0d |     
   mipsel    | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/eef27c62d5947fcbff63b384e231f9a58c3b2b71 |     
  mips64el   | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/a8596187b1521cbc544c3fe23fe4255f61aa7c52 |     
    or1k     |         alsa-lib-1.2.8         | NOK | http://autobuild.buildroot.net/results/735f64a6d5d146d01b256aecd182431088367c7a |     
   mips64    | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/1616d43dd3421433d855da9d04e83ae63ae632e0 |     
    arc      |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/a91b7d7192fdbc4b1fa0ab8d9f74b7ee86ddbc13 |     
  aarch64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/6a72e94c3519d25589e05d34b4c73105de5bac7d |     
    i686     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/3ce614d9ed25822aa63822895aaf7513e24ed1e2 |     
   x86_64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/4b9f16226ebaf754ee563623b7120c1163efaf51 |     
   xtensa    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/34f3abe3e90db715d256b583e9be88c9d20e3685 |     
powerpc64le  |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/225ad300dd8e4cfdfa59e551a621fbb8c76217cb |     
   xtensa    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/b717e0f8455ddb9632d3abb4b61d6acc6fbd4cdd |     
   mipsel    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/eed30d42b0c518d22a20627bdc7b15aff093d404 |     
  aarch64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/25f009f38f0922b90f85b0b7a026af513ae4e4b0 |     
powerpc64le  |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/acc8045e4a037c84f9735c89a69c58cd98b16a87 |     
  mips64el   |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/017da0823fd8fe1c40ca6eae0d65872380971cc2 |     
  sparc64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/1e073ddf76ad16afd867ea49a8af9f92bbb8a1e7 |     
  aarch64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/9113a887bc5bb3d9f1267d7625c7e3f98f885525 |     
   armeb     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/109d725af78484cf7f4e2ccf4f1d4d8bc6f20981 |     
    arm      |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/36fa359fa35578aeef172b89022d2deb989c7827 |     
  aarch64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/0aa947792a45441c952867af44eeb71282655740 |     
  sparc64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/00c786f3fa24aeece7834edcd6f579d0683ce2a9 |     
   mips64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/77a7d2ccc910590aea812a973465a63af0435965 |     
    arm      |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/4b4f71e3be37b45c44703da951f46ccaf6a19215 |     
  aarch64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/220e161a547b281d2d1722bd254b54cebd3345e0 |     
  aarch64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/cf8d541e124783b21de57ff07785543ca9c21017 |     
   s390x     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/bc27f150e18ce4d084be5b9488adf5a7f7ac370f |     
    or1k     |          bind-9.16.33          | NOK | http://autobuild.buildroot.net/results/c025c4683ddd24f7a1ee5c4073402be16f46a0a1 | ORPH
    or1k     |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/fcefabd53af75ff2d8998fea672480ca554961ac |     
    i686     |           crun-1.7.2           | NOK | http://autobuild.buildroot.net/results/4fc06c7b3032d1719c95eed5cf99b531b4a50726 |     
   sparc     |           crun-1.7.2           | NOK | http://autobuild.buildroot.net/results/9e6813e1f80cbe0981b96859989c7f86d694a75b |     
    i686     |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/2134a8c0ffe80c838435536868d8b427b1fff000 |     
   x86_64    |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/9e1ddbfa19a3628f736718439a607cfc9260256c |     
  riscv32    |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/9eca82888b4a4e58610269a99427359d1f1fd17b |     
   xtensa    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/3d38ae79eab6388cf3ef65a0e3c03a5cb736244e | ORPH
  sparc64    |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/ace8bffc3fd0aebf414e7b140d5872f7f2e0455b | ORPH
  aarch64    |     edk2-edk2-stable202208     | NOK | http://autobuild.buildroot.net/results/a29f3d69adff5689fb3de96ea239d93e1b2bb67a |     
    arm      |           efivar-38            | NOK | http://autobuild.buildroot.net/results/7645f4f00f6cfbdebc0dde31914454bfde6b2d8a |     
  mips64el   |           efivar-38            | NOK | http://autobuild.buildroot.net/results/51726ac178364ef17e03ffa261e8c24a67a5ebba |     
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/47c1d81a5b5707c70ea84fdb29a4351cfb48b9bc | ORPH
    arc      |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/17d7a885728b89719691248130dec21281b2310c | ORPH
    i686     |        erlang-22.3.4.22        | NOK | http://autobuild.buildroot.net/results/dd06f68ae78174b44676f8a6c151330283924e62 |     
    arm      |          flann-1.9.2           | NOK | http://autobuild.buildroot.net/results/0124aab28aea978e99aa1d81ad7bbeb34f05845a |     
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/e94844a936244b3f55c6f44e9abd3861c242a3e7 | ORPH
  mips64el   |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/97a1d5d4281c172824633614f40e3f510902c184 |     
   s390x     | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/d7327dbf23c6ca1b728f550985ceaf6afdd129f8 |     
  mips64el   | fs/cramfs/cramfs.mk:46: /tm... | NOK | http://autobuild.buildroot.net/results/f27763d2dcd451e6e853761ed727f81f2cd8781a |     
  powerpc    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/e2f87efd469e59af0b48cb79354c2817f8e01407 |     
 powerpc64   |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/1f1530f9c2f8347a7a1f11211ab26e035e5d411b |     
 aarch64_be  |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/4d53b4f2277aef297b34887de9d2b1775fc8b42c |     
  mips64el   |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/0cda1564b7d03cabd95c607b51be91af1993c533 |     
   nios2     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/af2fb6e96e0971d8022b65cfa82d89caa80db2e9 |     
   mips64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/be3509304138b953d7122722631761e1a62903a7 |     
microblazeel |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/a672fd14b7208311dd9ae4a75a19c4d2ae0498d7 |     
  mips64el   |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/5f4d358860ac934f0a894f38e81d5420b12a1abf |     
    mips     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/4873dc4ef96ab023c3a256ad75142de7f33915ce |     
    sh4a     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/18cd96cd603dd8b5342c7df4e1b794f730eaf580 |     
  mips64el   |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/f6abf67519fdd466c0d910319c5867208c7ffbc2 |     
    mips     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/f8f54ddf79eddd17acfaafc883e8185b7b3b6237 |     
    arc      |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/217aba5830ea1d9f81d23bd302e675df164e3b2d |     
  aarch64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/19e48eaf2d194fbf65a6f53f67157e101c7bbdd6 |     
powerpc64le  |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/b5e61249af26e470cc6214dd842e5f2bd29f72f7 |     
    mips     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/65633a2ab5e619b20c223cf7fe63cdde9db220c4 |     
   mipsel    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/e8769875a171fc29248db99503f183278a09cd0a |     
  sparc64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/3f6dc0f7d62ba811363f4d850705acec777965c4 |     
    mips     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/348b65bd1d9838965a2cedcb0146a6647bd05268 |     
    i686     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/bb9134c0620ec3fa16eb072ea2efb619fc461e52 |     
    m68k     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/89a725bfeb1690f7c4909b8ff9a3b90b092563cf |     
   x86_64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/19cf1e8a6ebf8f68a01f39b96546746f0d0e8419 |     
    or1k     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/a24f30a3d8bc9752fdaa2218fbd0037aed1b5e63 |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/dfed38fd1a7433187a33ca46a1bfc04a3104bedf |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/9389a7cdce334cc280651a8b902301528346c55e |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/fd6556b3a02442fa0693aeedaad1a578a1da8c08 |     
    i686     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/fe83554c5657e0182365ef01e1fbdcee123b6548 | ORPH
    i686     |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/7ed89017adb23511691f970be139851ed6050da8 | ORPH
  aarch64    |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/18e07307000d18e2b4a5113f9d7288abb507d572 | ORPH
powerpc64le  |         host-acl-2.3.1         | NOK | http://autobuild.buildroot.net/results/b1354a558db9829875948229cc0cc6867bff45ab |     
    or1k     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/bc0f4304c82138e27fc504b461cd0f7be081fb71 |     
 aarch64_be  |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/4af2a4cfad2d580596b5d46ceef97a162034fe5e |     
   mipsel    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/759a51a841b23bef10eac324ff2109fc56ca6c80 |     
  powerpc    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/13acc98ffa35368e4539935d16692cc4d83c3d11 |     
    or1k     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/a93f7113d1b296bb9402f76ad9e9fec6c78741ed |     
  powerpc    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/71c946492be6a1538931f49868876d528e9d1370 |     
   xtensa    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/031176a5fcd4f14e5d0727453972201553ba11a5 |     
   xtensa    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/77da6bb4ac39aea5aee778cc593e6bf227c48e88 |     
 powerpc64   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/1c3eefad8032cb5479d24e47450664afc67c3753 |     
    mips     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/e4030b8704d1e8f995fe208a3767dd22a0b62e88 |     
   mips64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/32690075cda3521b6570f901360526173d5b8733 |     
    mips     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/8bcf51e4b6b0204a7ecb91fc1cf6c39774d278b3 |     
   x86_64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/c822010c9a009920d316d369737d0228b96d7696 |     
    mips     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/57dd135d58f95b20e158427efa5ae63e5e4d496d |     
 powerpc64   |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/9504a7d5cdecd22c230d0020c43fa2d4cd2f0f94 |     
  riscv64    |       host-delve-1.20.0        | NOK | http://autobuild.buildroot.net/results/5a998681357fc1689b526d4937149edb2679f191 |     
  riscv64    |       host-delve-1.20.0        | NOK | http://autobuild.buildroot.net/results/566337aee914d7bbfeb36ed993e54a14713934ca |     
    or1k     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/01b1bf3bee74d2b16c975681c5d9a27d83458696 |     
 powerpc64   |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/1347e6b848d0f3f96b45c2bf7976953afc45fbd0 |     
  mips64el   |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/487eff9bc76c21dc7682501afc5f4003cf679484 |     
  powerpc    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/b91e1204b449bbc8b992b99756dfc98f1f7bc87d |     
    mips     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/b5ba848845d59365f5e1b53f934f45b1436624b8 |     
powerpc64le  |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/c0ad29ca593771253615990fcb34bbbd95fc2d31 |     
   armeb     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/879b755b4c7d99d521b7957d59a7f8df04dc462b |     
   arceb     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/0cf8b43a9e1ca8eee39c7aec4362845bb62dd972 |     
  riscv32    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/f9c828b27f1991c294ed6064cc509e5deed55dc0 |     
 powerpc64   |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/d9d3f613124ddbe4ea2bf7f17a1545ab500602b9 |     
   x86_64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/8c7a8c4de4d8b1bb33cda34bad44f1841698cf68 |     
   x86_64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/575dac6ab4c55a4fb599f0cec3c5d954165c9326 |     
  riscv32    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/4085dd84f04697ffd07cecf2f8525acac326e5e8 |     
   sh4aeb    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/20447bde42256ec18caeed35e94f9a1ba630dc6e |     
powerpc64le  |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/53375df0140bf67ef79fcfe3a65c3c6b9cd22b21 |     
   xtensa    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/43c7b728cb1d70d7e3b11995e380d134442a9411 |     
    or1k     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/72e209cb4347626d7eac34e7e0a7a6715e2e8fad |     
   xtensa    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/5272ffa3541e5c7c51678f38fff51efd709fce78 |     
  sparc64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/1d022b869af282594534a94762bbb6930b830e81 |     
    arc      |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/86e93fe4c13d47108d7de25c7cc3b339ccc55a57 |     
  aarch64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/2b489454bec2cbd82f1ccf5cd747bf913ebd27cf |     
   arceb     | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/c0ffa89514734e94e79857cfe0be85b95c9e426d | ORPH
   mips64    |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/121394b853e738e8419109e8857cfee69225ec93 |     
    i686     |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/a03a9341da4b4475a50d36797dc48b64e720ff07 |     
  mips64el   |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/83fc0d62b4527cd34a7ae8ae9367dedcfc9f479a |     
    i686     |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/7618ff5cc0cc07be67466210b3166233c1415a35 |     
   s390x     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/704aaf21a5349eda2d905f185258d7079b2f359b | ORPH
   x86_64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/ac55717b4b516976291e937202245cc95f167dc8 | ORPH
   mips64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/370cf083209ed569dd8b304ad1cb148af7596c1b | ORPH
    mips     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/aed62a1342ca16716fdb954c60d2a1175a7c055c | ORPH
microblazeel | host-gobject-introspection-... | NOK | http://autobuild.buildroot.net/results/96bf37e3e365c7bd5d4d3bd1ac107e13752432b6 | ORPH
   nios2     | host-gobject-introspection-... | NOK | http://autobuild.buildroot.net/results/1399ae96c2d6f240b2d821e6b5b2010494c781e4 | ORPH
powerpc64le  |      host-libzlib-1.2.13       | NOK | http://autobuild.buildroot.net/results/6e5733d032f0bb40122e880bbb7936910aabce49 | ORPH
    i686     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/f3a2b63029a0c3ea07202c122306915904da89f7 |     
    mips     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/a574e4e08a40a377c2799787704525c1669a8c93 |     
    mips     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/97825b5f14a92dba52f6cfcdfb43b2e9d6228c9d |     
microblazeel |   host-python-greenlet-2.0.1   | NOK | http://autobuild.buildroot.net/results/9974a6105f075b55954f8242c30d45149cecddc0 |     
   x86_64    |   host-python-greenlet-2.0.1   | NOK | http://autobuild.buildroot.net/results/5f75346472754a4beddc4f32f869e8c10acfb258 |     
    sh4a     |   host-python-greenlet-2.0.1   | NOK | http://autobuild.buildroot.net/results/c0292be86367dba062ac1ec2cdd96794bfc860ce |     
 powerpc64   |   host-python-greenlet-2.0.1   | NOK | http://autobuild.buildroot.net/results/b66751361b279ab9655116cddfacd0abbe6e13e9 |     
  sparc64    |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/f3e65d67dc8dd6f6b1dfdb7bdfde9e9709ef0ef1 |     
   x86_64    |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/1e1c1319a1b16db3072ecfd2beba00ae2c3725be |     
   x86_64    |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/9cd6f02a4547c0d31aa2e8e9f82e2a544812e30d |     
  sparc64    |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/eee36b178e692c3dfc8e89946406d271e8fc932f |     
   x86_64    |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/ec5ecf466e0d39caa71c07ee47317c7fdbcd0d60 |     
   s390x     |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/a56ac3b04ef50fae50d10e22103c4d73ddf6b074 |     
    mips     |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/4dfd3f8109d2eb2238e36dd678b1db89cae611f9 |     
   mips64    |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/0f4be7bd8784ebe916dff3507c7de1578631a789 |     
  riscv64    | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/31c0166cbecaa773934b8836bc4c1daae423e321 | ORPH
   armeb     |        hyperfine-1.14.0        | NOK | http://autobuild.buildroot.net/results/1277175efa04dc07eb227afde1268648dd154b4b | ORPH
   x86_64    |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/b62b40bffbe202f1d662ddfd3c33036d0b289ad1 |     
   s390x     |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/fcc1c5ede512aa24b0c348c2292d726e655a506c |     
    i686     |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/80bcf3b8d3876e1fa35aeb1bf0a35e2132646a37 |     
   s390x     |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/a216918a6206bb4b299b5fb8d54ca2f80de4555d |     
    arc      |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/c4a7fe61a4507bbbff89cc5b90b08eaffcbbbf06 |     
    m68k     |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/579e49c627efe51ad7edb88979f397fc56262b65 |     
  riscv64    |          json-c-0.16           | NOK | http://autobuild.buildroot.net/results/f59938db1fd56a1de94f283b55ee205fad9cf3ee |     
  mips64el   |      libatomic_ops-7.6.14      | NOK | http://autobuild.buildroot.net/results/7704b82167de6d903a24c9df352fa29fad31bd22 | ORPH
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/31e1b900f41687138aeba76ee7457656d16d1c65 |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/3863df63e919055129b650757c0d29e17bb6c7d2 |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/f8b97dc1d740a3058bed54a45bec85137f87f110 |     
    arm      |        libdeflate-1.15         | NOK | http://autobuild.buildroot.net/results/c7744b5ee741202690b495b248541d4ef8c66092 |     
    mips     |        libdeflate-1.15         | NOK | http://autobuild.buildroot.net/results/97f95a19d979469656c83cbe2fd16da6c1d23e4e |     
  mips64el   |         libdnet-1.16.1         | NOK | http://autobuild.buildroot.net/results/b0abff0d2418932a2435e3875d160cbad22d9a26 | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/9c484eb0f81722765d42e683a789b86fd104161c | ORPH
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/06e1a4941c8eee1f8726b1c79c8b142c95ccfb8d |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/603def05359cb6a62397fc2aa1711e0e1b39fbbf |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/407514e99a10e392728972603a4ab82441c0a7ca |     
   mipsel    |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/22e09d5ba68556e0b87f32fc116f8868e9920fc8 | ORPH
    m68k     |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/727706f624cfda62fec5df7585ae24250c173f67 | ORPH
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/5779fd5b93ec325c7dfecc00013be245f1cef9ee | ORPH
    m68k     |        libostree-2022.7        | NOK | http://autobuild.buildroot.net/results/c773ac130a7a0fa91db1eb8aa46499b4049a14c6 |     
    mips     |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/2f28f688c156e22908806c0446e3387254552181 | ORPH
   mipsel    |           linux-6.1            | NOK | http://autobuild.buildroot.net/results/56e411d73463a43c9c0f021545e219c91c38d543 | ORPH
  powerpc    |           linux-6.1            | NOK | http://autobuild.buildroot.net/results/95d55237c9765d0e4cb24a76574b89e394416958 | ORPH
   mipsel    |           linux-6.1            | NOK | http://autobuild.buildroot.net/results/0ef87e968f28e82e67a22cac0402b8c7d9447a94 | ORPH
  powerpc    |           linux-6.1            | NOK | http://autobuild.buildroot.net/results/4b06a583971304f8cea623262ae4ceeafa09f833 | ORPH
  mips64el   |           linux-6.1            | NOK | http://autobuild.buildroot.net/results/c68c191e1ed3b98cb687efa4d6745e19fc9d156b | ORPH
   s390x     |           linux-6.1            | NOK | http://autobuild.buildroot.net/results/7c1af0bfb34b2cf7b679ff819b6bd1f24b766540 | ORPH
  powerpc    |           linux-6.1            | NOK | http://autobuild.buildroot.net/results/e3b1809da002e2a895c7c482f427e4f7fc83b6b5 | ORPH
   nios2     |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/42b2ac79110a583bf1f9f4b6acacc229ee2d905b | ORPH
powerpc64le  |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/5968cc7ecb1bbe46b98491312ff1061707507056 |     
   sparc     |        mariadb-10.3.36         | NOK | http://autobuild.buildroot.net/results/dcd2ae02d7aa3c26e40e36c37bb0c14258a9dc5f | ORPH
    i686     |         mesa3d-22.3.1          | NOK | http://autobuild.buildroot.net/results/06a429dcdf776ca32de4570f9a408da6a7e7333d |     
   x86_64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/be87042f150d8114d6a98cdd77972eb6b51a1be5 |     
  aarch64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/dcc92d142be5137de79d11d8351fb2e295639d29 |     
    or1k     |        mosquitto-2.0.15        | NOK | http://autobuild.buildroot.net/results/0e9212575e4f66f36b980937dbba640f1d90a1b6 |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/80f74c1f7c96bf734b38f3d1f4935f69fe9f0229 |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/8c3ea6af9a995626c039745d9b59eb86bc51b408 |     
powerpc64le  |         nerdctl-1.0.0          | NOK | http://autobuild.buildroot.net/results/2d2aa141b18d8f71f4b04b72fad372394e1ea373 |     
  aarch64    |         nerdctl-1.0.0          | NOK | http://autobuild.buildroot.net/results/59b45709c9225ea84d254bb1e8c549f6ec8e8a67 |     
    sh4      |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/1d948a0cc61ac24b0be172cb982d83a328e9cee9 | ORPH
  sparc64    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/5a599c56a412d497054fefed703b1678ffe4b267 | ORPH
   sh4aeb    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/9c3c388521b81308bfa6a5cc10498d489eed4fcc | ORPH
  sparc64    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/5b9c6153ecc96db03431f983b13d0bbd3f33e7ba | ORPH
 aarch64_be  |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/d12e99cb7893d454fac0cfc771ea1487ed0d730a | ORPH
powerpc64le  |        open62541-v1.3.3        | NOK | http://autobuild.buildroot.net/results/35fd23863781885472e58e692132b0f0374a8c23 | ORPH
    m68k     |         openssh-9.1p1          | NOK | http://autobuild.buildroot.net/results/02165250314e6ca5884ffd810f49999357dfb565 | ORPH
 powerpc64   |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/ff48b0387364a400f469085edd331297466d661f | ORPH
  sparc64    |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/95a22de10de89065a987a220adab628f667f4c03 | ORPH
   armeb     |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/29de44cbed77be2774b742127591cacf62d18eb5 | ORPH
   arceb     |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/49049172a522a4f629b6c7c82b6072e74252606c | ORPH
  powerpc    |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/91cfbe80e41af709d61ceee85a10e21fe7a6b240 | ORPH
   nios2     |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/a7f72ee054b8811d7033c3786d6b085b4cf7fd45 | ORPH
    arm      |      optee-client-3.19.0       | NOK | http://autobuild.buildroot.net/results/4f6ab2648baba7767eb6a7015eed06094bafac82 |     
   armeb     |           opus-1.3.1           | NOK | http://autobuild.buildroot.net/results/3b0a3a08b23607390f4d72fcc73a23b831ab31e1 | ORPH
   mips64    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/c4240170ee9eaf135578b298063612ac5bfbd65c |     
    sh4a     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/a762e0882c7de74fdcc14906edfe1df3824da776 |     
    m68k     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/281f747425fb2a31f3780da2481bb54071beadd8 |     
    arc      |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/5002ed2c34e25bc5c9e6f26c930d257e323147cc |     
   sh4eb     |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/6c0906519606db4e07ae36d58cd5e1fa9c93f653 |     
 powerpc64   |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/df5020fa9ae9c99eed666467479d8616e401f82e |     
  sparc64    |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/b1d1cf0671fd6ea43d3cb4c2bc169f14fbffaa8b |     
    mips     |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/9f9de471f5fcfe116056a505b3a64272bd78f9bd |     
   x86_64    |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/1d7efa71c9c8848acc85392ce26f407edeeb4ea1 |     
 powerpc64   |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/56ea23f2be0f6c69d97d6fb4160426cbbd215eee |     
    arm      |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/683b8aab974b7f932334e472e73c736c183405ce |     
powerpc64le  |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/e26de3bf8110715edfd2302b7c597f49eafa5991 |     
   sh4aeb    |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/863e2a6b8c935433a25d53f4e475949b254a20ea |     
  sparc64    |   python-cryptography-38.0.4   | NOK | http://autobuild.buildroot.net/results/8cb6df8df599e711a4f160b3bf592c2074406799 |     
  sparc64    |   python-cryptography-38.0.4   | NOK | http://autobuild.buildroot.net/results/ef85fdd277f7847322d7ebff52f4d17346bffdda |     
    i686     |   python-cryptography-38.0.4   | NOK | http://autobuild.buildroot.net/results/50251b2074a3a07cca1ba6bff3738b01bed5a4ad |     
    mips     |      python-numpy-1.23.5       | NOK | http://autobuild.buildroot.net/results/5909e489fff6e0e9ec0ad2ff19bc9171d4ad9743 |     
   sh4aeb    |      python-pyicu-2.10.2       | NOK | http://autobuild.buildroot.net/results/d4b7f43bc7c728b899933ac69d076cfe858095f4 |     
microblazeel |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/57d1f53f93e0ea6fc9aa14be8f3b44e5b7496f7d |     
 powerpc64   | rtl8192eu-94bce7798bbb18de6... | NOK | http://autobuild.buildroot.net/results/bf26c4131d733511fdbc4e3a59d16f91c805719b |     
    arc      | rtl8812au-aircrack-ng-e7a4a... | NOK | http://autobuild.buildroot.net/results/765c9f1bd953defea6f8c199040baed3d877923f |     
   sh4eb     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/2f3e1fe8f2f43fb51917c0354a6c6d67638cc516 | ORPH
    arc      |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/b1cf58af535c21fe09deea53a16dadc758b913b3 |     
microblazeel |         sudo-1.9.12p1          | NOK | http://autobuild.buildroot.net/results/1789311e83f782ebe3aee4754000b46bff7d97c7 | ORPH
   mips64    | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/276a051ccc8a8ca6c8d42f542ce9a6a1262cf68e | ORPH
    mips     |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/0030a4f78d5124f8b1778d0a2056bfc7e9231fc0 | ORPH
powerpc64le  |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/d50e72a96995871358fb9515aac247f11f7d6884 | ORPH
   nios2     |          ulogd-2.0.8           | NOK | http://autobuild.buildroot.net/results/f70a8a50d6ff0476e0763e6bf521970d2ab9452e | ORPH
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/a0ece084bbd728b077c55368bc9b374ba7f3b4b9 |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.net/results/9a8d4ca950d8e61f7d96def109e3107ba63549da |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/85b2b83af01c2152d98c0c198a4a8b0b111baecd |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/e5ce226edcf0cce1135cda6209f7d7169bbe383d |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/9688ddcea5d7a10a3610073973dfe43fcbed4b59 |     
   armeb     |            unknown             | NOK | http://autobuild.buildroot.net/results/6594b4ab816bf6c5b167915381d02c5b7142c438 |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/ccfe9edff2c451e110ac0975140c249e02d109d8 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/9b97a08f837b8f4311d8a91514c0f442845aed65 |     
    or1k     | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/285cb036ac5a978c28eee2e3a519163ff79b9ed5 | ORPH
  mips64el   |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/fd83965166966c9f9831988966419470cfc13bc9 | ORPH
  sparc64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/6b90d70ea491bc28e828669d689d9870de9c5277 | ORPH
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/f01bb1ac72826db47d78a3d7991f2f2ba845d88d |     
   mipsel    |           xterm-376            | NOK | http://autobuild.buildroot.net/results/ccae0809cb5df3b50dcdb7cfdf0aef387b67710e | ORPH
  sparc64    |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/c90122373195d7461cd6d27f87aa547be3a9046f | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/d48af74c0ec392739f516d59fb6ce79c918389f4 | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/bcb90bbb8c50c895b99113df856bb901a0e9a2f5 | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/32dbae7f6466d44c67ea6c45f8791826f682df3c | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/819c95e5f2cebb8ec0871d75b07115d8c09c9669 | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/735609d73e659d60fa06313fc10b3c8d069bb20e | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/2a3112d6e7126c02679c03574e16e8f3de788a70 | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/6653846536867535d47cc64df624c7336453b871 | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/6456ffa3b94729c33fa43d972822a3b05a9c2ae8 | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/e6a6d3085b5ca3875f7eb8c1f3f6321f98186630 | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/aec9f73de8523e55136c9044edc3190d2c48c712 | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/8672666437a5c1c6ad1722f889e6feed416acc76 | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/17bc0e47ddc549406166cb72b84c5141b3766541 | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/bb915a3505377f7ecc21d39261107f07a143746b | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/6f0919591b1bc7e96288be6dc6379e86ba6f0fd3 | ORPH
microblazeel |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/488c242ae66cebc29391b14038e5ada5b387a431 |     
    m68k     |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/78636ce22cb4571e5809966549f5739596b556c3 |     
  powerpc    |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/9bbb155b1216217e580bd544f0dbe79d70906be1 |     


Classification of failures by reason for 2022.11.x
--------------------------------------------------

              host-pahole-1.24 | 4 
                    4th-3.64.1 | 1 
                     frr-8.3.1 | 1 
                gerbera-1.10.0 | 1 
                host-go-1.19.4 | 1 
              host-rust-1.64.0 | 1 
                  lcms2-2.13.1 | 1 
               libglib2-2.72.3 | 1 
          linux-5.10.145-cip17 | 1 
                    musl-1.2.3 | 1 
                       unknown | 1 
                    zeek-4.1.1 | 1 


Detail of failures for 2022.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |           4th-3.64.1           | NOK | http://autobuild.buildroot.net/results/0bcfc8aa05e0e19a109ddbc1078533de9bb2bc0b |     
  mips64el   |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/1e896f3764eceb55715689b1e1f6e226a6e1e08d |     
    arm      |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/0da3cff34ca725e98aa5e102281f0f22cb60635d |     
   mips64    |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/f4e3af6d7dfeece254c36edbcfb7fa581f29f4d4 |     
   sparc     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/162f4640a4527e009e6b20aefdcae99cd2f23908 |     
  riscv32    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/cf88a367837215a3d7b4995a4b01e248ea378034 |     
   armeb     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/363db690eeb6d37a312daf14880a2f138c4b39de |     
   arceb     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/c06988f24ca52c4d4477acb2a9b51bd8af97033d |     
  sparc64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/e553b4206904c7146a1e469227c3d4ceb4a3f7f7 |     
   xtensa    |          lcms2-2.13.1          | NOK | http://autobuild.buildroot.net/results/e65cbcb7d49593b4e43a50ff2e4c933a29700833 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/23bb836d69741557f36dbfefc812103e57487bfc |     
  riscv32    |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/75a7f95ccce15b34217d8495fd1c3e4dd88532fa | ORPH
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/eaab691f6e5b75298772e8bb3742cf9e0a806371 |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/d0b2456bffbd99c8aa96b7c6c21fab61297df8b9 |     
  powerpc    |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/80598f9491966ec57a2cb0c255a834853a854e32 |     



-- 
http://autobuild.buildroot.net

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

