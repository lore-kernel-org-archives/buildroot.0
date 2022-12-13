Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CDCEC4332F
	for <buildroot@archiver.kernel.org>; Tue, 13 Dec 2022 06:36:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61B004097E;
	Tue, 13 Dec 2022 06:36:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61B004097E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vag8ZPiLsM7X; Tue, 13 Dec 2022 06:36:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19AAA416B4;
	Tue, 13 Dec 2022 06:36:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 19AAA416B4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A27731BF2E5
 for <buildroot@lists.busybox.net>; Tue, 13 Dec 2022 06:36:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 79E68416B4
 for <buildroot@lists.busybox.net>; Tue, 13 Dec 2022 06:36:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79E68416B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6B2FlxsY0s0L for <buildroot@lists.busybox.net>;
 Tue, 13 Dec 2022 06:36:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F179B4097E
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F179B4097E
 for <buildroot@buildroot.org>; Tue, 13 Dec 2022 06:36:50 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 46C0BFF809
 for <buildroot@buildroot.org>; Tue, 13 Dec 2022 06:36:48 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Tue, 13 Dec 2022 06:36:48 -0000
Message-Id: <20221213063654.79E68416B4@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1670913408; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=w123IUzAxLP52/kD4SbOM3p8HaOF5QfTVgTGkn9Mleo=;
 b=T9+5D9AjRYuY2PLnlmeNOLLXBjeNsdfgokxN8/zLA8uYmoKjOw4wATCPkczwJI1NCFRLny
 LShJEu6yaiVWIdQBf9GNKx1fJJJnyndCSd6eNLM0h3Ve+hhQdJKZOKxBxYGtPo/lRDGASp
 UapciGFaK/54JiKISbc69gfM6DSL528+mRKflcpZmqHaAmatAkQLXaZe2E0uI5raiJGAiV
 Ah5m19SwQcRP0ZxXNB1V7woBIEAyQRHYnyyUM6CV1gJuVhn79ICxjtMQA5slPte0md8xeD
 2mfMDd3QMqR92TW1aFKQu5JhrpTsCipLG+c1XxyEbP4CvU3MLyq/pH7hNGPQrw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=T9+5D9Aj
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-12-12
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

Autobuild statistics for 2022-12-12
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  | 10  |  1  |  0  | 11  |
  2022.08.x  | 13  | 14  |  0  | 27  |
    master   | 223 | 256 |  2  | 481 |

Classification of failures by reason for master
-----------------------------------------------

                   aubio-0.4.9 | 38
              host-pahole-1.24 | 13
                      xz-5.2.7 | 12
package/libmbim/libmbim.mk:... | 7 
                  davfs2-1.7.0 | 6 
            host-binutils-2.38 | 6 
                host-go-1.19.4 | 6 
              host-rust-1.65.0 | 6 
                  linux-6.0.12 | 6 
                       unknown | 5 
                  jack2-1.9.21 | 4 
                libdnet-1.16.1 | 4 
              libgcrypt-1.10.1 | 4 
               libglib2-2.72.3 | 4 
                    norm-1.5.8 | 4 
    python-cryptography-38.0.4 | 4 
                elfutils-0.186 | 3 
             fontconfig-2.13.1 | 3 
                gerbera-1.10.0 | 3 
  gobject-introspection-1.72.0 | 3 
    host-python-greenlet-2.0.1 | 3 
            python-bunch-1.0.1 | 3 
           python-numpy-1.23.5 | 3 
uqmi-0a19b5b77140465c29e2af... | 3 
                  zabbix-5.4.9 | 3 
                    bat-0.19.0 | 2 
glibc-2.36-66-ga1dc0be03c9d... | 2 
host-gdb-arc-2020.09-releas... | 2 
host-spirv-llvm-translator-... | 2 
               libcap-ng-0.8.3 | 2 
             libgpg-error-1.45 | 2 
                libkcapi-1.4.0 | 2 
          linux-5.10.145-cip17 | 2 
                    musl-1.2.3 | 2 
                 nerdctl-1.0.0 | 2 
            ocf-linux-20171122 | 2 
                 openssh-9.1p1 | 2 
package/vuejs-router/vuejs-... | 2 
           python-bcrypt-4.0.1 | 2 
                      rauc-1.8 | 2 
toolchain-external-codescap... | 2 
ulog-0389d243352255f6182326... | 2 
       vuejs-router-legal-info | 2 
                xenomai-3.0.10 | 2 
                     z3-4.11.2 | 2 
/home/buildroot/autobuild/i... | 1 
afboot-stm32-3566acd582e553... | 1 
  binutils-arc-2020.09-release | 1 
                  cairo-1.16.0 | 1 
                 coreutils-9.1 | 1 
                    crun-1.7.2 | 1 
             dahdi-linux-3.2.0 | 1 
                 dmalloc-5.6.5 | 1 
                     efivar-38 | 1 
              erlang-22.3.4.22 | 1 
                  ffmpeg-4.4.3 | 1 
                     file-5.43 | 1 
       freeradius-client-1.1.7 | 1 
                     frr-8.3.1 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
         gobject-introspection | 1 
                 haproxy-2.6.5 | 1 
                 hddtemp-0.4.3 | 1 
            host-binutils-2.37 | 1 
         host-python-m2r-0.3.1 | 1 
               host-runc-1.1.4 | 1 
         host-sentry-cli-2.8.0 | 1 
kvmtool-f77d646ba01d04be5aa... | 1 
      libabseil-cpp-20220623.1 | 1 
                     libgcrypt | 1 
        liblog4c-localtime-1.0 | 1 
                libmad-0.15.1b | 1 
            libmbim-legal-info | 1 
libutp-059c9449a104e440e4f9... | 1 
                 libuwsc-3.3.5 | 1 
           libvncserver-0.9.13 | 1 
               lightning-2.1.3 | 1 
      linux-5.10.145-cip17-rt7 | 1 
             lirc-tools-0.10.2 | 1 
               lpc32xxcdl-2.11 | 1 
        ltp-testsuite-20220930 | 1 
            luaossl-20220711-0 | 1 
                 mesa3d-22.3.0 | 1 
                mongodb-4.2.18 | 1 
                  netsurf-3.10 | 1 
                  ntp-4.2.8p15 | 1 
                  ntpsec-1_2_1 | 1 
              open62541-v1.3.3 | 1 
                    php-8.1.12 | 1 
           python-orjson-3.8.3 | 1 
                    qemu-7.1.0 | 1 
            quickjs-2021-03-27 | 1 
rtl8192eu-94bce7798bbb18de6... | 1 
                    sdl-1.2.15 | 1 
                 sudo-1.9.11p2 | 1 
                 systemd-250.8 | 1 
              traceroute-2.1.0 | 1 
             uccp420wlan-6.9.1 | 1 
               valgrind-3.19.0 | 1 
                     vdr-2.6.1 | 1 
                 wavemon-0.9.4 | 1 
                 wolfssl-5.5.3 | 1 
               xfsprogs-5.14.2 | 1 
                    zstd-1.5.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/34b0afdfb7fd4c2f4b3d0da638cdf392db1632df |     
    arm      | afboot-stm32-3566acd582e553... | NOK | http://autobuild.buildroot.net/results/a8a7e0db5634b7d442acc0992864f7566131a52d |     
  mips64el   |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/3a36bc94b0b682f360373a60f1d94df10ac9a2db |     
  powerpc    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/db590632bd2de12272115720733e7412b93f372c |     
   sparc     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/63f749426f4619399ff65bb537487bd37f56b2ec |     
   s390x     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/1bbcc6068f9a824272d6daff990241d9a55889ff |     
  sparc64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/9b93e648b3163ccd9c2bf2dd82762efe16f9a78d |     
 aarch64_be  |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/0b8578860a1915d77ce2e12c9f8c6d908b1d529a |     
 microblaze  |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/20c9c5a2ad49240d24fc59112a20fd856609c882 |     
    or1k     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/ee36debac5aa5c5961df60351482aaf5358de1f8 |     
  sparc64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/9aadc4e145a2645225cb38337a57d4b4f7c29690 |     
microblazeel |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/9dbf9190e2f10b167ef319cdc67b93962c45f2b7 |     
   nios2     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/7b7ff0cc43a4b1d0b8614ffe1d9248efa0cd66f9 |     
    m68k     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/4ac7ecbff2f8edb1091d0e8515e8b3a37aaf0027 |     
  mips64el   |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/2cd4e498f893d3bf73aa9fc7b1407e15318d1314 |     
 aarch64_be  |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/bcb76dcfd75ba974864361247b0325a2ab58805d |     
    sh4      |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/a0e0503f0ec2baf291fb3c8b801ae6fbbc91c773 |     
  mips64el   |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/93b78f472884e4fe2defde1bffdc52caae7ec0c5 |     
powerpc64le  |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/24a5f3989dbe4b9e851018832262a1629c3633e4 |     
    m68k     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/0f832389682983dbecee2da2a83ef2dfcb3ceeca |     
   sh4eb     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/0169395d09ba61d3761f63e763fc82daeb30657f |     
  sparc64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/a2bbe43525be25150d71902b1bb43be364ffab6d |     
   arceb     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/09c913e7ab577bfcce7d2c6592f386fc2df56885 |     
 microblaze  |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/f2ad9d61f6fe5bb6bf4263e726b92070ae42767f |     
powerpc64le  |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/0f5b4bbb1ac9bec686844a017306692097a23b88 |     
microblazeel |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/337787e585edf6857dbb1ba9b6bd6afc3b2373b1 |     
   nios2     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/2b576aa016cd94364617f86125e2090e1649a871 |     
   s390x     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/82e007d85a2df5452850d98ce74df7601fcf0d4f |     
    i686     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/c4cb4fb960e939834a970525eb642576f42bc351 |     
    arc      |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/881ea3a68c195bc93cac64470245e8686103c31a |     
    m68k     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/53fac3a7843edd5e7447f9dcaec87b7135f8838c |     
   s390x     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/a136f29e90c20cc252c1d34af63ff83930294e27 |     
  mips64el   |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/fd8cb81d2c9955f94495fc299620ceca27906ad8 |     
   s390x     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/5ebf3a5cfc1ec156e0991f7317a129b09eb6c3b6 |     
  mips64el   |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/3a4b3bfc54c15a2bde48419bccf2b6fe083a47d9 |     
   sh4aeb    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/2209aa42d3841c8d2960848974e673c2f3225d9c |     
   x86_64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/2992b79ada2a5b1a8777fd80060cfa50c8c1a208 |     
    sh4a     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/a0e88b85e236c3b341968df5484e0476219b9d43 |     
   nios2     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/555300cd2480de6459a330d58b9d30c884ec2cee |     
   sparc     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/c0646a7b0363eebcdb1e4b350ac2b50df5645a1c |     
   x86_64    |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/a89e02b531b57b1517aef6c8c78572bd2d2f362a |     
 powerpc64   |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/2c41601e0fa58ce4dfda230dae290ed0044efeb2 |     
   arceb     |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/0c61f56a0b26e21e2121e5a228bd571815c6ba95 |     
  aarch64    |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/aaf7eeabfbe891f40d00aad431976e3ab44580a7 |     
   sh4aeb    |         coreutils-9.1          | NOK | http://autobuild.buildroot.net/results/3cb83ef0f9fab952434a4c80d2bec612c87f70a2 | ORPH
   mips64    |           crun-1.7.2           | NOK | http://autobuild.buildroot.net/results/f007594dfa90f6a8da973131f88811329f2965fe |     
    i686     |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/ed042e63c5a1a524b46c5a59efd2a607b62d3390 |     
   arceb     |          davfs2-1.7.0          | NOK | http://autobuild.buildroot.net/results/a1c8f3a7e06f0d68599f052ee0f551dac2d6519f | ORPH
   sparc     |          davfs2-1.7.0          | NOK | http://autobuild.buildroot.net/results/1ab4cb4ee17c2370d795cf91497831c6de92299b | ORPH
   xtensa    |          davfs2-1.7.0          | NOK | http://autobuild.buildroot.net/results/ad7299ee45dda9b57e1614bcca445ad152b45ee1 | ORPH
   xtensa    |          davfs2-1.7.0          | NOK | http://autobuild.buildroot.net/results/6e9ca550db07b44d023b37987e98bf04fe6cadfe | ORPH
    i686     |          davfs2-1.7.0          | NOK | http://autobuild.buildroot.net/results/3581b2e2d6368168df6e0cdfa8d5bdb4e1f70980 | ORPH
  powerpc    |          davfs2-1.7.0          | NOK | http://autobuild.buildroot.net/results/793c71e4f731a18e203d6eaa3ac8b6e2a9620c27 | ORPH
    i686     |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/ef567a0b4bc4c41e9bdb08c378f535e8838a575a | ORPH
   mipsel    |           efivar-38            | NOK | http://autobuild.buildroot.net/results/ccfb8dd3937eddcd53f875da4cef0294e03d01ab |     
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/f9a87f857428c684c31fe10adfcb620f3229f833 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/efb5007f7fcd00abb80a183344891108c6ff5245 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/72995fc6bd6426b9f7f194b47984dc13f3f63151 | ORPH
    arm      |        erlang-22.3.4.22        | NOK | http://autobuild.buildroot.net/results/7752fd533d1c3a50578bffa189ca5430d523639a |     
   arceb     |          ffmpeg-4.4.3          | NOK | http://autobuild.buildroot.net/results/615eddc4de3f143042638282056e483273e70931 |     
   armeb     |           file-5.43            | NOK | http://autobuild.buildroot.net/results/e1e473a3b00728a36e790d63a86bc68dc47fe158 | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/e278997e462480b449c10a9563ecf2aaf4786a25 | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/ae77ce5e9b96f4929ad0340103439f9051fa5bf0 | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/54edbb175b66125383b06a9b6b2d78038bd62b7e | ORPH
  riscv64    |    freeradius-client-1.1.7     | NOK | http://autobuild.buildroot.net/results/04f81c3dfcc618722175e170af2bd58eb27428fb |     
  mips64el   |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/77893bfb165733aad977900d2d6d1a3ca943e482 |     
   arceb     | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/d8d34fd6ac1a057fa77cd587d65ff60b75a131dd |     
   sparc     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/372c690eceb99bc3de616f616a4be9a2afaacc6d |     
 powerpc64   | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/66e2b634671d0b48beea855970f8f3a9753bb77e |     
   x86_64    | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/ba056035ceb1061baf3801d7c0856a39076c35c9 |     
    m68k     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/31de85ccf46d382cd5741074ffe93977404ca003 |     
    or1k     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/d8ed5a2a2c175ed5571313051c066b4288dfac9f |     
   sparc     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/32d768685a7d5ccbd30379a1bd820e54cf1aa600 |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/ba1c0c3d7054cc0b61891b023f36cf446ae08150 |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/817f6a24285b92f6615b948bb0d2ade45e6d43ae |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/321607c40a26da8621979cfc967be9e9ae9b5e33 |     
 microblaze  |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/984b937f1cf0d21464a8bc737732c005c133ac64 | ORPH
   mipsel    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/50c622fd343f34508ffd4c0c21b42a337a37e94c | ORPH
   s390x     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/d7a88bec6e3572353985d1f4d6b779988d013eea | ORPH
    i686     |         haproxy-2.6.5          | NOK | http://autobuild.buildroot.net/results/f6a52bfc3a99f0f6f0d3bf95e9ad36b1f18928d8 |     
 microblaze  |         hddtemp-0.4.3          | NOK | http://autobuild.buildroot.net/results/e84b7131f996302301dd0a8fd47362c9f2eab0bf |     
   sh4eb     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/9522ee41aa4742c7e252b155144e9ab0d7d07e64 |     
   x86_64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/2d9db8f8484fe9b4f046ac7370da957412f071d6 |     
   mipsel    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/621339cc411ad3e4131bcb5d023999de03a110ce |     
   sh4eb     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/92f160129064548b309b9686b20b6faa50198f3e |     
   armeb     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/33e85a406c38847e45904810423d24832c9caa34 |     
   armeb     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/40e25517fa9450fcecc6a9d579963e2f52ec9323 |     
    or1k     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/d1f17df5ad04541ae4f9350b8b6f8932ab801f92 |     
    arc      | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/a4e2d6806e54b8edb14ae1f9c15255ebf1095ee7 | ORPH
   arceb     | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/12d729ba45261cff5ed11c8e0d9efda7bc0d7bc2 | ORPH
  mips64el   |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/c5c6783003ffda28d0257c3b91cd626437769cd3 |     
powerpc64le  |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/f8e2ef6e203b6248241868b0a1a50182923c5351 |     
  aarch64    |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/06102cde33bf892c009aa82e6e6444290a9feaa7 |     
    i686     |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/bb3039cfb99fe6ef045a3c78c317e5eba857d202 |     
   mips64    |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/72cf31fc38a956bb44040c29372c05c6ad323c29 |     
   mips64    |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/fcc675c09cffe6521526b25624a170543b4aa45f |     
    arm      |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/f3b0f21cfc9421614e21e50fdf1e2064ae8c3712 |     
   mipsel    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/6c0a131b71154e389e4e387f43bd9d0e9e774d37 |     
   xtensa    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/43fda16ecb247dfa16949d8f6dd0440215c0c802 |     
    arc      |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/017fef362e13a82a941cd01b7193573b94b6f7a8 |     
   mips64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/9729e60c7443f23c0dd3ebc8a34f363606bfd7af |     
 powerpc64   |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/3678e587b886ed5eac4937b7c1b2290beddde1e8 |     
   mips64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/9289dd124971d34cdd2643acf1db7fd405cf024a |     
  sparc64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/8011c1f6b960326582948c82de7ad06c6cd43736 |     
 powerpc64   |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/29c214356f4b60427270fdc96d2ae37087756602 |     
   nios2     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/90b83891e51e3c69b105783d51581b43a983f9cd |     
   mips64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/5138037dd13361ac09fb25734a96e43f8ac91b11 |     
  sparc64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/f57e88aff47c750d430d6ae2b482f2d1cb1b2843 |     
   nios2     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/5126130ebb8dfe4b9148c228377846a915306b71 |     
  aarch64    |   host-python-greenlet-2.0.1   | NOK | http://autobuild.buildroot.net/results/6ce232b12601e51c1ea81c5a168c6eb31953e438 |     
   sparc     |   host-python-greenlet-2.0.1   | NOK | http://autobuild.buildroot.net/results/d97fdd276fddff23337a7391d324866f206e62b5 |     
   nios2     |   host-python-greenlet-2.0.1   | NOK | http://autobuild.buildroot.net/results/abd1edc2788b7725c3e3cde109561e273e015d32 |     
   mipsel    |     host-python-m2r-0.3.1      | NOK | http://autobuild.buildroot.net/results/98eba5079975760d176e41d328fffbbc9abeda0e |     
  riscv64    |        host-runc-1.1.4         | NOK | http://autobuild.buildroot.net/results/2c63069a3128a715d7746c0242a2d6b5a8db8b54 |     
powerpc64le  |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/3af44f0ad29635912335b55294bc06fac29ce990 |     
   s390x     |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/44a6d4eb1f20a4161451bafadce0757e62826a48 |     
   x86_64    |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/a62fbabab744a36a75326acf140c179e15eaab80 |     
 powerpc64   |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/c6eb31b002d352d5ab26af5c5fc26f4d5d5612d9 |     
   x86_64    |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/b8220ec8e1d6d5bbdffe36c3642108806ee141ca |     
   armeb     |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/e0136f8ccd9025fbe9564696065a291a8c27e568 |     
    or1k     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/cf6641ece16be874e6f913d1f6ceeb870871c6f0 |     
   armeb     | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/bb0b4b991613d0fcb576ded889d868aee1288d0b | ORPH
  aarch64    | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/af7725972122d09152e9a3de7b5e86a018dab778 | ORPH
  sparc64    |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/71327a7cd39bac285feb8a34d0507fc4d42b944b |     
   x86_64    |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/9cc61f7f24237c40dd070fdb55c98eaf68ad1909 |     
    mips     |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/d8a04c4c91f8e8bfcb8fef1b043f0462cb46ef6d |     
  sparc64    |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/269b4b01e88d748e12d8de9bbf2bce9e70a12b4d |     
   x86_64    | kvmtool-f77d646ba01d04be5aa... | NOK | http://autobuild.buildroot.net/results/2803c99f91bb1620f9948e23e877e0fec7d5cf81 |     
  mips64el   |    libabseil-cpp-20220623.1    | NOK | http://autobuild.buildroot.net/results/afe37d094dae89a6883e7a03bd116130246085e4 |     
  mips64el   |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/d27639d9ddd4ff5e2d566cb41985db44c76ff919 |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/8003144115a11d76ff191e6b5e1f44f5e527910a |     
powerpc64le  |         libdnet-1.16.1         | NOK | http://autobuild.buildroot.net/results/c5078da04392b11076350c75142600c4f2d709ce | ORPH
  mips64el   |         libdnet-1.16.1         | NOK | http://autobuild.buildroot.net/results/130510caca3dc0070a7ed073312bb8d62f2ee236 | ORPH
  sparc64    |         libdnet-1.16.1         | NOK | http://autobuild.buildroot.net/results/c4d1ce3de483e5a8b58707f0cfd50dc92f3789be | ORPH
  aarch64    |         libdnet-1.16.1         | NOK | http://autobuild.buildroot.net/results/4d932b0365a584df391d4a9dd0563b53da1c246d | ORPH
   armeb     |           libgcrypt            | TIM | http://autobuild.buildroot.net/results/4eb893277fefece563ffe7aa9ea6a23708d29573 |     
    arm      |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/49fb89792a249349e5139908c511035f2c66fd3c | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/ee48b971d8c1f840b1d17dce1e0e6bbaa8a57fab | ORPH
    i586     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/7f30733b8ca46057df8d6e02cb45ef4603db9b5c | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/9e648644e70d0b8874b21a17e3199f5338a4300e | ORPH
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/ae85c3758eacdf90b897abfbf937b62aaa296904 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/77b07a853b158fbb59c3362d93504be31777cfbe |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/f2d497d4633093b4b44cd3ea19f9ee3152bef85f |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/3386838e2ef9c8db4e889eba0e54e7325b3d4edb |     
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/032f2a6a30f969cf56d1febd145bc67b45a24326 | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/34727b0a7e5f52b911e1ad1b79d6de137b199af0 | ORPH
microblazeel |         libkcapi-1.4.0         | NOK | http://autobuild.buildroot.net/results/f82ac1f1eaf19b2e2b26c94606d19a6db8d6ffc6 |     
 microblaze  |         libkcapi-1.4.0         | NOK | http://autobuild.buildroot.net/results/bf56c14a8bfb1d9cbe937720492c398391b2f6d9 |     
  riscv64    |     liblog4c-localtime-1.0     | NOK | http://autobuild.buildroot.net/results/813ac8ac3853654330db5b4fda4b9c73922f93f3 |     
   armeb     |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/ec2b3c9d8ffe813e5dc7d5c7ac5bdc7d117113fb | ORPH
  mips64el   |       libmbim-legal-info       | NOK | http://autobuild.buildroot.net/results/06cb9426d097657b669b7970994584592bac9868 |     
  riscv64    | libutp-059c9449a104e440e4f9... | NOK | http://autobuild.buildroot.net/results/3ff5a8429a44cbb75274e297a25cbd5365226b15 |     
powerpc64le  |         libuwsc-3.3.5          | NOK | http://autobuild.buildroot.net/results/13b14a0343ba9b430cbab2edf85fbad75947af1b |     
    or1k     |      libvncserver-0.9.13       | NOK | http://autobuild.buildroot.net/results/3a491e341c5120d4c8e792b53ad00b0918636e67 | ORPH
    arm      |        lightning-2.1.3         | NOK | http://autobuild.buildroot.net/results/e26e30493924d1b438e75b32fd0a7799411fb3fe |     
   sh4aeb    |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/7e3ecdf16d7fe689eb305bc6db4cd1cc7201ead1 | ORPH
   sh4aeb    |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/cef81fce4438b7e84bd849eb9cfc57d5f123d3ac | ORPH
microblazeel |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/532f1a53c21f8539e8e65e1f590c8e02c1bac2b4 | ORPH
   x86_64    |          linux-6.0.12          | NOK | http://autobuild.buildroot.net/results/067bda666acae808763d2802a6025311b5606a81 | ORPH
   mipsel    |          linux-6.0.12          | NOK | http://autobuild.buildroot.net/results/ab7b1577a5a74d78551ae4b3cf301f59440efff8 | ORPH
    m68k     |          linux-6.0.12          | NOK | http://autobuild.buildroot.net/results/174097f472e4588a8d688e1e147a19e9c56f9c07 | ORPH
   arceb     |          linux-6.0.12          | NOK | http://autobuild.buildroot.net/results/09fa7a23422f55037fc59af5291ddb4d6374ed26 | ORPH
   mips64    |          linux-6.0.12          | NOK | http://autobuild.buildroot.net/results/5b1582b2a359d490d4dc82adf772f12770e181b4 | ORPH
   arceb     |          linux-6.0.12          | NOK | http://autobuild.buildroot.net/results/36fba0fbb3bf695c20ab3953bcd9c15d9801dd06 | ORPH
powerpc64le  |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/386e61dfe346534d2a3fb36f52707a78934541f0 | ORPH
   armeb     |        lpc32xxcdl-2.11         | NOK | http://autobuild.buildroot.net/results/4dfe0b0d7b4d80a570f1fcbe858cee393679b6e9 | ORPH
powerpc64le  |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/6dbe95ae1426b4e93ef6ac5993ff03ac824ea92a |     
    sh4      |       luaossl-20220711-0       | NOK | http://autobuild.buildroot.net/results/15fb4677a7696ae5d2132d92561454f983d7399c |     
    sh4      |         mesa3d-22.3.0          | NOK | http://autobuild.buildroot.net/results/bf0f7eec2b0bf0fd253e9a4dce754e18424087b8 |     
   x86_64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/549a26a02c18df176a16ea4ea8c4506d73dd1e7b |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/88254eb346999a29f7af6386c2893049ec71ad45 |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/39b1fcd6503bad3bf4dac82d676da2937329a24e |     
   s390x     |         nerdctl-1.0.0          | NOK | http://autobuild.buildroot.net/results/0eb4801ddb85d47366dbe40ff621708eb5040293 |     
   x86_64    |         nerdctl-1.0.0          | NOK | http://autobuild.buildroot.net/results/1932cdcbb581637ecfe5e303ab7bbe131610d3e6 |     
  powerpc    |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/be28d639c954b085cb9a7aadff6301afc1580477 |     
microblazeel |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/bf25a0e785c72b9704de8ac1cc757fc587667e02 | ORPH
 powerpc64   |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/62ae29109fe915a436af39eafe7b3b129d93a03b | ORPH
  sparc64    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/f67ef0e4f4dfd8745584889dbd4fd807cc1747ba | ORPH
    mips     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/1f4af6224e7f534129049270c1a8c7a441179469 | ORPH
   sh4eb     |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/8f639be9eb6b46d2f6f04541ed5f0a93b0b2fbd6 | ORPH
microblazeel |          ntpsec-1_2_1          | NOK | http://autobuild.buildroot.net/results/7a9ef2dc417821c3465944098cae9b65d4355e9c | ORPH
   sh4eb     |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/c1fd9263dd3a040fe26c02ed1b02b6879b24b4d1 | ORPH
powerpc64le  |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/71bb51ad40b1f92eb8c3df5e6a5b83f49998b52b | ORPH
    arm      |        open62541-v1.3.3        | NOK | http://autobuild.buildroot.net/results/90835beff36fe2279ed78f7a179fe1e39c91ec38 | ORPH
    m68k     |         openssh-9.1p1          | NOK | http://autobuild.buildroot.net/results/f9055f33f1754403e8bf54e0b0311c6a4e3531fb | ORPH
  sparc64    |         openssh-9.1p1          | NOK | http://autobuild.buildroot.net/results/d9a00fd0dc570ff2fbba773b20d55144bf50df8d | ORPH
    arc      | package/libmbim/libmbim.mk:... | NOK | http://autobuild.buildroot.net/results/32707b9e5bba5425a99be82b4313448d7ad53161 |     
  powerpc    | package/libmbim/libmbim.mk:... | NOK | http://autobuild.buildroot.net/results/3ce6aa67f0936578dde05fc9f0b03c3762874411 |     
    mips     | package/libmbim/libmbim.mk:... | NOK | http://autobuild.buildroot.net/results/42579f9d015d3e20b9697034978126f341b0bf6f |     
    arc      | package/libmbim/libmbim.mk:... | NOK | http://autobuild.buildroot.net/results/442e30ae95ce49a177acecbe3d82bfef36c28303 |     
powerpc64le  | package/libmbim/libmbim.mk:... | NOK | http://autobuild.buildroot.net/results/d715371da96d376743681d4811f3d7b78d17d3cf |     
   nios2     | package/libmbim/libmbim.mk:... | NOK | http://autobuild.buildroot.net/results/fab38737cb0c2235482c1360a6ee524453581cae |     
    or1k     | package/libmbim/libmbim.mk:... | NOK | http://autobuild.buildroot.net/results/1a7efdc17f9f79af38f4f3a5616c0701de9f2ad4 |     
 powerpc64   | package/vuejs-router/vuejs-... | NOK | http://autobuild.buildroot.net/results/d972fd5b819102c5c676e5c7f79f3410d824a9fa |     
powerpc64le  | package/vuejs-router/vuejs-... | NOK | http://autobuild.buildroot.net/results/88aa4d9001b41ae0966e2c75922cb0d81696a7ec |     
    or1k     |           php-8.1.12           | NOK | http://autobuild.buildroot.net/results/6e3295f196a6293c27aa589915a73cbb86714a05 |     
   x86_64    |      python-bcrypt-4.0.1       | NOK | http://autobuild.buildroot.net/results/81a976f2c1bad9ee4884473e04dddc4d9a2c1c89 |     
powerpc64le  |      python-bcrypt-4.0.1       | NOK | http://autobuild.buildroot.net/results/b03e1909292fa62e906e537146fd1a44ede5e828 |     
   arceb     |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/baa8021327129786a39f480b1bd67eb2d20c35bd |     
   mips64    |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/b0bdbe8dd7298dec71fe0b9d3026048756a2cb40 |     
    i686     |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/82e4fc16ecd0febd11dd950877583479c4379c12 |     
powerpc64le  |   python-cryptography-38.0.4   | NOK | http://autobuild.buildroot.net/results/d9fae5db2fc1cce966f3f629402605d43026496d |     
  aarch64    |   python-cryptography-38.0.4   | NOK | http://autobuild.buildroot.net/results/0ca0f3d5b169af70922a0dba3a4d04324c692390 |     
   x86_64    |   python-cryptography-38.0.4   | NOK | http://autobuild.buildroot.net/results/187b6476fe80ef8563ea44c9573b96882957802c |     
  sparc64    |   python-cryptography-38.0.4   | NOK | http://autobuild.buildroot.net/results/3b748c37bef32c26cfea1a3d14975b2446c5d7c3 |     
   mipsel    |      python-numpy-1.23.5       | NOK | http://autobuild.buildroot.net/results/6759675c8f10062b447b05122c7f7976106647e6 |     
 powerpc64   |      python-numpy-1.23.5       | NOK | http://autobuild.buildroot.net/results/182ee1b791d954c317495e826f2b3d9c1593cf36 |     
 powerpc64   |      python-numpy-1.23.5       | NOK | http://autobuild.buildroot.net/results/6b373c92b8637880d620a9e363b9396628d03928 |     
    mips     |      python-orjson-3.8.3       | NOK | http://autobuild.buildroot.net/results/73106dd754ca3a66a63573016ac459dea443fdbf |     
    mips     |           qemu-7.1.0           | NOK | http://autobuild.buildroot.net/results/c94757ed83c351d3a3e6ad7c7c3071832fd8f418 |     
 microblaze  |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/340b22426161e145cb78e51c94df21e9f03b0cfa |     
    arm      |            rauc-1.8            | NOK | http://autobuild.buildroot.net/results/fa3631dbe2027c337b10819950e07111acb66bb5 |     
    or1k     |            rauc-1.8            | NOK | http://autobuild.buildroot.net/results/55fe67bfcf026fede94473f012a82b08bb82325d |     
 powerpc64   | rtl8192eu-94bce7798bbb18de6... | NOK | http://autobuild.buildroot.net/results/d00f58b1a36b9a2a26fe34e5c190c2b5fd05cd2b |     
    sh4a     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/85b3b2ad938634e0fa49acf6017246b47812fc3b | ORPH
   sparc     |         sudo-1.9.11p2          | NOK | http://autobuild.buildroot.net/results/273286fdba0d3bd7de0a3c232a17618d06eb511e | ORPH
 aarch64_be  |         systemd-250.8          | NOK | http://autobuild.buildroot.net/results/edb694fc266004d9e89e9389a0287076e2383f56 |     
  mips64el   | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/53bddf6a56ec8caafaa06d57d05cbe65a40d566f | ORPH
   mipsel    | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/bf3ea0ab64575cc37ab8c5909fe3cca14829cc22 | ORPH
powerpc64le  |        traceroute-2.1.0        | NOK | http://autobuild.buildroot.net/results/ddf2b4e32b8cc4ab3970cb5a5fb57800f17d3df3 |     
  sparc64    |       uccp420wlan-6.9.1        | NOK | http://autobuild.buildroot.net/results/4522d1a5303cc5b0d0b1283699c97bb799895989 | ORPH
   s390x     | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/61a53fc409c517c01692f764dafb10f9e3c6fa9e |     
  sparc64    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/dddc63acbc1ddd38f0952100522def79035a345f |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/65d7ca4be95668da09c2756a5c1009a17aecbb80 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/8a5301be442c5a3d33b9a7ae3de85c858320358c |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/7ed5db7a40b39435d70948091bd319c3ced39f66 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/228616940036c36353f23f9a6aabf26c1094d064 |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/1c7007cecff31b0e505e55c54f368271cd5feb35 |     
   nios2     | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/31e923576b1574c495623d910c8d999e1e7dbe50 | ORPH
    mips     | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/9de4e7e8ac017c2b81ea82e3f90992d546332c34 | ORPH
 aarch64_be  | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/b5051ee3dfe82cb416a114a48363f1933c156522 | ORPH
   mips64    |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/4e0d15198e8d04db360a98e9194a5e4fcdfa9f83 | ORPH
   xtensa    |           vdr-2.6.1            | NOK | http://autobuild.buildroot.net/results/d02f4a12320ab7cc409dd9e4bde4eb520513942c |     
    or1k     |    vuejs-router-legal-info     | NOK | http://autobuild.buildroot.net/results/c3d9378e34745333ab05e8c8eee3ee0902df1bc3 |     
   nios2     |    vuejs-router-legal-info     | NOK | http://autobuild.buildroot.net/results/beac411246342a9445495bc7c8f6a7e7369b9c53 |     
    or1k     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/b99eedf8da5ecf19f08aa537f9f2acbb9b4927e7 | ORPH
   armeb     |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/113d336f9565ff575156516a87d73c12b69076d0 |     
 microblaze  |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/5931bcee6b852be13109e687689a9401d8c5f54e |     
    arm      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/82558d5ad844545af58a1a63335cc35ec65dac42 |     
    arm      |        xfsprogs-5.14.2         | NOK | http://autobuild.buildroot.net/results/db606c9752e050c9e0328231bfd0499ced4b8101 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/4343431e322859644fc3e6329c8274466f75e638 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/429811af83df57c9318cf51e01029cdaf021df55 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/c7f338d45dc5db2fed062704207b230ff6bd29ad | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/82ab24c7ba223bb8b33eb62ed0676e43b960d8db | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/b9775c6d714b46d79f719ae59ef012f5f55ab1af | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/35f15f8a2c6e16c163f03433520d1bf6cd303e67 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/7df32f94687010cf6c196f400cffeface472e68e | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/546741b8f2d83b213c079df2653a368d2a0e1a5c | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/1d83a02a6655c0d6f8483eedc8afab08dc15e9dc | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/6d313e59be42881f60048cae5c468db0cf7feda4 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/3eb417f7e1400a30be8c5d08365b56d912509235 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/e3ee3de32317e920db5571e2c37558243f02d92b | ORPH
    or1k     |           z3-4.11.2            | NOK | http://autobuild.buildroot.net/results/274145fdc46ccef15dfe76d16b4eb48c12efdd8e |     
 microblaze  |           z3-4.11.2            | NOK | http://autobuild.buildroot.net/results/44c1087c04c5f3cf8f8256f8ef6b4800ea3e170e |     
   mips64    |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/28021dbc502a7bcd5657ec832f1f942b35228eb6 |     
powerpc64le  |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/b6d8adad8a2e18ef2f8689e0730ffdcf2f9d991a |     
 microblaze  |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/49fb776f3442ff29ec9cc2f49761edabe70896ca |     
 microblaze  |           zstd-1.5.2           | NOK | http://autobuild.buildroot.net/results/c8e22432f9252f3dbd97aaa8796f03f262b41a13 |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

                 wavemon-0.9.4 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/55233cf4d3c30af549ee328acd7b4a73866eab39 | ORPH


Classification of failures by reason for 2022.08.x
--------------------------------------------------

host-pahole-73383b3a39afe86... | 3 
/home/buildroot/autobuild/i... | 1 
                apparmor-3.0.4 | 1 
                gerbera-1.10.0 | 1 
          host-elf2flt-2021.08 | 1 
                host-go-1.18.8 | 1 
               libcap-ng-0.8.3 | 1 
              libgcrypt-1.10.1 | 1 
       linux-5.10.109-cip5-rt4 | 1 
           linux-5.10.115-cip7 | 1 
                    sdl-1.2.15 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for 2022.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/e7d89f829c0de722b232455d3fefe004e3a1798a |     
   arceb     |         apparmor-3.0.4         | NOK | http://autobuild.buildroot.net/results/28017eae3838061164c944d2660ce4351516bff0 |     
  riscv64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/4681855d207dc64da09e2173af6b7c33d4bae2f5 |     
    m68k     |      host-elf2flt-2021.08      | NOK | http://autobuild.buildroot.net/results/09ba6819143d02705f92a3bc0e6ad7e1b1a2e002 | ORPH
  mips64el   |         host-go-1.18.8         | NOK | http://autobuild.buildroot.net/results/c74147012c9b33ff7166581fb0202fc3fd6b408d |     
   s390x     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/9a7f115422340f8b48c1a4466df8a67da3173e46 |     
  powerpc    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/01a1a5dded51723207173f23ba77d90ab9329978 |     
   mipsel    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/459704ebb2a6403d92704bbb475f6c9022a632bd |     
    or1k     |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/7c36961639740d61a9d1adcb28613312883bf1c4 |     
    arm      |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/f1f2366c2f6078f5f1ed9db9d82b2ef66332330f | ORPH
  mips64el   |    linux-5.10.109-cip5-rt4     | NOK | http://autobuild.buildroot.net/results/099825aad1be60f01158c0ce553a0b715ab77d6b | ORPH
 powerpc64   |      linux-5.10.115-cip7       | NOK | http://autobuild.buildroot.net/results/3694ff8829af4ffbb39690afda6093ce12396aba | ORPH
   sh4eb     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/5788f657a48c23cf0c709b7f29467e429093b6d4 | ORPH
  powerpc    |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/d28d891731870e783e56093a2a456a303bca24a0 |     


Gitlab CI results for 2022-12-12
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
           TestCrudiniPy3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3457320984  | ORPH 
...ernalToolchainCtngMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3457321230  | ORPH 
           TestIPythonPy3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3457321002  | ORPH 
          TestLuaLuaExpat | https://gitlab.com/buildroot.org/buildroot/-/jobs/3457321054  | ORPH 
         TestPythonPy3Can | https://gitlab.com/buildroot.org/buildroot/-/jobs/3457321141  | ORPH 
      TestPythonPy3Django | https://gitlab.com/buildroot.org/buildroot/-/jobs/3457321156  | ORPH 
      TestPythonPy3PyAlsa | https://gitlab.com/buildroot.org/buildroot/-/jobs/3457321175  | ORPH 
       TestPythonPy3Txaio | https://gitlab.com/buildroot.org/buildroot/-/jobs/3457321196  | ORPH 
                 TestSudo | https://gitlab.com/buildroot.org/buildroot/-/jobs/3457321212  | ORPH 
             TestZfsGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3457321221  | ORPH 
              TestZfsMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3457321222  | ORPH 
            TestZfsUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3457321223  | ORPH 



-- 
http://autobuild.buildroot.net

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

