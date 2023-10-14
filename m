Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58206CDB465
	for <buildroot@archiver.kernel.org>; Sat, 14 Oct 2023 05:37:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A2E4560B88;
	Sat, 14 Oct 2023 05:37:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A2E4560B88
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h5QqEUWBj1P7; Sat, 14 Oct 2023 05:37:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F5EF60BA6;
	Sat, 14 Oct 2023 05:37:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F5EF60BA6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 811181BF31A
 for <buildroot@lists.busybox.net>; Sat, 14 Oct 2023 05:37:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 41FFE60BA6
 for <buildroot@lists.busybox.net>; Sat, 14 Oct 2023 05:37:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 41FFE60BA6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GEePc74UfSl3 for <buildroot@lists.busybox.net>;
 Sat, 14 Oct 2023 05:37:00 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 74B4E60B88
 for <buildroot@buildroot.org>; Sat, 14 Oct 2023 05:36:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 74B4E60B88
Received: by mail.gandi.net (Postfix) with ESMTPSA id 62E951BF20F
 for <buildroot@buildroot.org>; Sat, 14 Oct 2023 05:36:56 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sat, 14 Oct 2023 05:36:56 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20231014053702.41FFE60BA6@smtp3.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1697261816; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=apNvdxAf4WpAYdWMyIFc7Rvru4tjEdt1B7HOYI1ri6k=;
 b=VwQOAuuIe8TMEbxvLnCO0NWoSyzZuiyanDgSZkQOwwvMVqq4jZ9SvSaJ2qXFt39YHMWedp
 gHU0uhz6kYzFG6TLNc3yMcaBEk+lA33lBsTuFEmaNu5mlozao25czrkv1cAsW6v1+06hfh
 xkleWTWExgf4aulET7yiZUipaUEQpPYS7FRHlcndR2D4gJAsYqI0AqrHr2mYSKzFKgTjPT
 pP63rnnxgXx/Dfamqjd6SATL9l95atOQyFw+RSJJ+Gd5RuGikKVZdloxtjFGYGu6vv4ieh
 RV2nCc1ZSaWCfNT1vbI0BkrEbe5v5ggmnAOLftwBR2JDMPDQTjJRbJBHpKxYbg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=VwQOAuuI
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-10-13
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

Autobuild statistics for 2023-10-13
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  | 13  | 10  |  0  | 23  |
  2023.08.x  | 13  |  6  |  0  | 19  |
    master   | 88  | 114 |  0  | 202 |

Classification of failures by reason for master
-----------------------------------------------

                 openrc-0.43.3 | 17
             alsa-utils-1.2.10 | 9 
              gcc-final-12.3.0 | 9 
                host-go-1.21.3 | 6 
                   linux-6.5.7 | 5 
               mariadb-10.11.4 | 5 
         spirv-tools-1.3.261.1 | 5 
               alsa-lib-1.2.10 | 4 
                   bird-2.0.12 | 3 
              memcached-1.6.21 | 3 
                 coreutils-9.3 | 2 
                elfutils-0.189 | 2 
              libarchive-3.7.2 | 2 
               libglib2-2.76.1 | 2 
                    ncmpc-0.47 | 2 
               openblas-0.3.24 | 2 
                    pppd-2.5.0 | 2 
                       unknown | 2 
                  acpid-2.0.34 | 1 
                    bat-0.23.0 | 1 
                    brltty-6.5 | 1 
                  conmon-2.1.8 | 1 
          cryptodev-linux-1.13 | 1 
                    dust-0.8.1 | 1 
        edk2-edk2-stable202308 | 1 
                 erlang-26.0.2 | 1 
                  ffmpeg-4.4.4 | 1 
              gcc-final-13.2.0 | 1 
glibc-2.38-27-g750a45a78390... | 1 
  gobject-introspection-1.76.1 | 1 
         host-gcc-final-12.3.0 | 1 
              host-rust-1.71.1 | 1 
        host-sentry-cli-2.20.3 | 1 
              libostree-2023.6 | 1 
                libselinux-3.5 | 1 
                 libv4l-1.24.1 | 1 
          linux-5.10.162-cip24 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                   linux-tools | 1 
          lttng-modules-2.13.7 | 1 
                   mutt-2.2.12 | 1 
                 pango-1.50.14 | 1 
                   pcre2-10.42 | 1 
                      poke-3.0 | 1 
                   systemd-254 | 1 
                      tar-1.35 | 1 
                tpm2-tss-3.2.2 | 1 
                usbguard-1.1.2 | 1 
               valgrind-3.21.0 | 1 
x264-baee400fa9ced6f5481a72... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          acpid-2.0.34          | NOK | http://autobuild.buildroot.net/results/251023cf51dc234314073967ab1698b454f738d5 | ORPH
  powerpc    |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/481ac9da78d977ff4ee14a00b4b344d1e2d293a1 |     
    i686     |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/a57f1c0ec0709d8010e6f14969faf35c0508da13 |     
   mips64    |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/902103db2cdce93e7c566c74fee075db0e9b70a3 |     
   x86_64    |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/f84f064120f693ae8b1e8ee954d1d0d7731a80fc |     
    i686     |       alsa-utils-1.2.10        | NOK | http://autobuild.buildroot.net/results/1d2c20257724c651cf801cf865e171f50e261e7f |     
  powerpc    |       alsa-utils-1.2.10        | NOK | http://autobuild.buildroot.net/results/a00aa41bbae29d211b2939d899a621112f6ed9e0 |     
   sh4aeb    |       alsa-utils-1.2.10        | NOK | http://autobuild.buildroot.net/results/5a03cba08bf24d61c816b8e2f257c18004bad3d7 |     
    arc      |       alsa-utils-1.2.10        | NOK | http://autobuild.buildroot.net/results/2561e1f14ac2ff0c272c20f096e6f8469a6ffa44 |     
   x86_64    |       alsa-utils-1.2.10        | NOK | http://autobuild.buildroot.net/results/241d170015c04313647b66e9dc1cb797364c0f33 |     
    or1k     |       alsa-utils-1.2.10        | NOK | http://autobuild.buildroot.net/results/9d5ef1bb088b69b1c2838bc482c51b7a840a3e93 |     
  sparc64    |       alsa-utils-1.2.10        | NOK | http://autobuild.buildroot.net/results/af3ed2e9b00f1be0e585a2db3b22e8d006b58250 |     
  aarch64    |       alsa-utils-1.2.10        | NOK | http://autobuild.buildroot.net/results/f2beba0cc5ffda9f27e609fe95486ab22f4f5574 |     
 aarch64_be  |       alsa-utils-1.2.10        | NOK | http://autobuild.buildroot.net/results/b383b6bf77f1c947d87f5d0b088963b85f5f3fd1 |     
   armeb     |           bat-0.23.0           | NOK | http://autobuild.buildroot.net/results/cead55d7df7db450fbafbd70ebe799b7675ad681 |     
   armeb     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/9a09ebd9d676a8ffed678296472a69d9ea879d51 |     
    arc      |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/c601197b89b911ae318026310cee99124fb2d970 |     
  powerpc    |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/cbb78de5d842506c8d156a8fdb2111b5c15f6f1e |     
microblazeel |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/5f3af77a3104c138cf00c98adc9526459145e6b2 |     
   sparc     |          conmon-2.1.8          | NOK | http://autobuild.buildroot.net/results/f5a554bd7d71ea92ae05202b921eab9a5e95a973 |     
    mips     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/3ee0b65f25cfe6d8c0e48bfac87b2f9706b59f20 | ORPH
    or1k     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/2af5cf88720ffb93aaed3fe6a65091bd963ef8ef | ORPH
   arceb     |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.net/results/cdf78824aecd90a73c379720a026a341e69627f8 | ORPH
   armeb     |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/7c9a6de5d167fb3734b2f3012afeefaa8021220a | ORPH
    i686     |     edk2-edk2-stable202308     | NOK | http://autobuild.buildroot.net/results/61cd42fda236c5507842604a4db8c28b0b8ebe2f |     
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/a2b1f801f4533ded8a95e423d883ed7001c26259 | ORPH
   nios2     |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/ae7373105dc383cb5a1b784fcd4d5a4ff0c9d4e6 | ORPH
   x86_64    |         erlang-26.0.2          | NOK | http://autobuild.buildroot.net/results/007358eb184dece4d203a8514a6d473f8b116619 |     
    i686     |          ffmpeg-4.4.4          | NOK | http://autobuild.buildroot.net/results/983beccc3c1366130524a8b85a69931bddaf2046 |     
  riscv64    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/492887de1da1d8dde551c0f1745c65d6216140a6 |     
   mips64    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/3a481dc60971f9f144290ef6bd213c9f76e64594 |     
  riscv64    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/2d1fab7e81727f7c2c1a85ba0fd53d8a858f2cf0 |     
   armeb     |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/14a6d5432d4df4d35aff5a87cfcd059e2cf22486 |     
 aarch64_be  |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/270ae0c201c6d47d975943b1418e6a2e1395c3fb |     
  riscv64    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/45411af96bdb0c336dc4b5a1574107f9435ba0d4 |     
  riscv64    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/833884c404d00679b98b48896095e5734fcb6be9 |     
   xtensa    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/f0a78d0e8feccde63f44f8adf566de005e785228 |     
  riscv64    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/c0666eb5f2bd405bc47a363cacc2279303ba1912 |     
   x86_64    |        gcc-final-13.2.0        | NOK | http://autobuild.buildroot.net/results/ed264c8f35d0d922ef8b2044614c5dd04e10c47f |     
 powerpc64   | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/dad34bdd6d86af5f66e027adea35ffe124d7db1f |     
   nios2     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/034d65b81b93a8c97c64565da46f970d036765f8 | ORPH
microblazeel |     host-gcc-final-12.3.0      | NOK | http://autobuild.buildroot.net/results/8e04390222984ecba8a48114fe27d260cf5e3070 |     
  mips64el   |         host-go-1.21.3         | NOK | http://autobuild.buildroot.net/results/1f00e1b024d0dcf776ab5e9bec82bad159d2ad8f |     
powerpc64le  |         host-go-1.21.3         | NOK | http://autobuild.buildroot.net/results/80ad00874fcdaec212b0ebe79837720a032c292b |     
  mips64el   |         host-go-1.21.3         | NOK | http://autobuild.buildroot.net/results/976e7ccfcd818868575f1d9f328c955820e87018 |     
  mips64el   |         host-go-1.21.3         | NOK | http://autobuild.buildroot.net/results/17249cbfb451378abcae3be8f367383139a5f1b8 |     
   nios2     |         host-go-1.21.3         | NOK | http://autobuild.buildroot.net/results/ec2e3b9855168293201ac84c7eb54a279fc53b15 |     
  mips64el   |         host-go-1.21.3         | NOK | http://autobuild.buildroot.net/results/a32004c9eb031ef79370de3de39d409eeca45224 |     
   s390x     |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/4623ad817128bc44bd8aad1f32c28ba0b30a863e |     
   s390x     |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/2fc08b07153ce3e38e0d1ed34fad524c0d5ea9d3 |     
 microblaze  |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/cd98d951ab762dbf5fd03477748042a7fc2c52da |     
    arm      |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/c117d29b3c40ff96f6a788545bac70a745ddebef |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/9476fc4d2ed8f29b1f942a05fd21a4ad9b892531 |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/1cb9c2c01c4cba054bcbb6830bfa27b42bc5f053 |     
    arm      |        libostree-2023.6        | NOK | http://autobuild.buildroot.net/results/31ca0dd49f5ec39fa71d039619bdc3ca0e89d987 |     
microblazeel |         libselinux-3.5         | NOK | http://autobuild.buildroot.net/results/8b03dcb1211ddf35936a6c0a3b6f837c79800cf9 |     
    m68k     |         libv4l-1.24.1          | NOK | http://autobuild.buildroot.net/results/445f074e4c66e06032455be7fc8f2f9c243852ce |     
   x86_64    |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/37db1aea1cf2e61addf73f66c153b7a1614336bf | ORPH
    i686     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/5de8c58db5729d90e842783c3f51ac7725d8381c | ORPH
    sh4a     |          linux-6.5.7           | NOK | http://autobuild.buildroot.net/results/caa7411af800aa9226940f6b5925e90ca0c0489f | ORPH
 powerpc64   |          linux-6.5.7           | NOK | http://autobuild.buildroot.net/results/1e38a3812bf103418f1518583d446090005f45af | ORPH
  mips64el   |          linux-6.5.7           | NOK | http://autobuild.buildroot.net/results/b925fe0dc865c3ca3cfb900dbc9d09c0ad865df0 | ORPH
   mips64    |          linux-6.5.7           | NOK | http://autobuild.buildroot.net/results/54f6547d0c6002ca1eae17a791aca34d8ffb44c8 | ORPH
powerpc64le  |          linux-6.5.7           | NOK | http://autobuild.buildroot.net/results/4ba333bb3b0d7ad7dc0e50e79d608360248ddb5c | ORPH
    i686     |          linux-tools           | NOK | http://autobuild.buildroot.net/results/e329fdbf2b9be57531abcc4104b8e92d78b5f645 | ORPH
  aarch64    |      lttng-modules-2.13.7      | NOK | http://autobuild.buildroot.net/results/3d454bf766463b9a57b4395f20115362ec8e5462 |     
  powerpc    |        mariadb-10.11.4         | NOK | http://autobuild.buildroot.net/results/9bf8a234d8e796ff3ab41a504532d45573a3fe59 | ORPH
   xtensa    |        mariadb-10.11.4         | NOK | http://autobuild.buildroot.net/results/c64b34a0b4a6e0bdc70620412436c34cf28a0ff7 | ORPH
powerpc64le  |        mariadb-10.11.4         | NOK | http://autobuild.buildroot.net/results/0789fcf7732dc2e70cfaa3aeba2ca8a86d2a4a4c | ORPH
   s390x     |        mariadb-10.11.4         | NOK | http://autobuild.buildroot.net/results/d70c65363eb9c1729fcfd4d7b47fc09ecd1e31c0 | ORPH
powerpc64le  |        mariadb-10.11.4         | NOK | http://autobuild.buildroot.net/results/d256032dcfde72d50f8a5be79f828d4122139320 | ORPH
   xtensa    |        memcached-1.6.21        | NOK | http://autobuild.buildroot.net/results/c06d0f270689c80dc2a99d264e782a8e54db62ff | ORPH
    arc      |        memcached-1.6.21        | NOK | http://autobuild.buildroot.net/results/bc89372da294962168e899df1be59072312e2c8a | ORPH
  powerpc    |        memcached-1.6.21        | NOK | http://autobuild.buildroot.net/results/fd21b0a8f332aa648e4dd8a8b74881b64bc4f79f | ORPH
   armeb     |          mutt-2.2.12           | NOK | http://autobuild.buildroot.net/results/b4f2d1ad77fb8b97accc4150d8249de145cb9cf4 |     
   mipsel    |           ncmpc-0.47           | NOK | http://autobuild.buildroot.net/results/f5884167f177bf86bc394acd6c6d62d4d494c2ba |     
microblazeel |           ncmpc-0.47           | NOK | http://autobuild.buildroot.net/results/996164bca901842ad0c4ed6655a9f03cbb28ce5c |     
   mips64    |        openblas-0.3.24         | NOK | http://autobuild.buildroot.net/results/fbf4b7ec58c37e9786adb7e7146adb8dc0efdd7d |     
    i686     |        openblas-0.3.24         | NOK | http://autobuild.buildroot.net/results/cf297f9ac5dded372d2bb2e7fd552f0e47dcaeee |     
 powerpc64   |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/5fee37ac55628d4e8e3eb4f88b04db33506a5c89 |     
    mips     |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/441d61539d533688cca71f8fcc5c3b6ee1b91532 |     
 aarch64_be  |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/ae2d8d4ec2539be0aaf6b067226776554739c097 |     
  mips64el   |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/bdd57c92e039ea4bba8b8c830e79b711b1dcaf9a |     
   nios2     |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/2eb8c9077d3dd39bb4c835fc48e61aabecd6031b |     
  powerpc    |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/021c1f7395a309d7b69a174bf20ff60c9fbecb8d |     
   armeb     |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/558f13c399f74acc75f384051bef597697d73d93 |     
    arm      |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/7e21bd12e3ab80816bec743183c1ad5caf8061f0 |     
   s390x     |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/c741e472cdc0a3e8a8b46a88f53e2e8dca74d367 |     
    mips     |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/a9005109f3078b9606ce20e5f466ca69ad431590 |     
 aarch64_be  |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/622ebb8061ee169eca384771c44960d16ca7033a |     
   x86_64    |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/8e3f477d25ac550fd6983bac7b71ce5b5767748f |     
 powerpc64   |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/603299299b4d869a76fbe4760ebfe5505074f2e2 |     
   sh4aeb    |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/a03a3d5a5f473f37bbfd5c01c006771cc3d8ff15 |     
   armeb     |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/562045f5cebd261c13c1d8d806d10ad0624882c1 |     
   s390x     |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/36107efefb6e522e1578ceaf69f4a6aed6152a74 |     
   sh4eb     |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/4e314fd029a0bdd99f65b913637936bd146c2fa0 |     
   s390x     |         pango-1.50.14          | NOK | http://autobuild.buildroot.net/results/38040bb26a3a098e35ad8e3680ca805a0ee327b0 | ORPH
    mips     |          pcre2-10.42           | NOK | http://autobuild.buildroot.net/results/40e52f70be576ffaf5ca2e20c0ff4b1a349900f9 | ORPH
  sparc64    |            poke-3.0            | NOK | http://autobuild.buildroot.net/results/840b540eb013304477d11e7acc064b5e2c36ef80 | ORPH
  sparc64    |           pppd-2.5.0           | NOK | http://autobuild.buildroot.net/results/bb40f323c93e63888af9fd9d3ae058ed98c6f97f |     
  sparc64    |           pppd-2.5.0           | NOK | http://autobuild.buildroot.net/results/97b35ba147632da012921c12217358f9ff93b141 |     
   x86_64    |     spirv-tools-1.3.261.1      | NOK | http://autobuild.buildroot.net/results/deb20180bdf6e87149735f667a43d9a164e98354 | ORPH
    mips     |     spirv-tools-1.3.261.1      | NOK | http://autobuild.buildroot.net/results/3503e484b37e9239ba46338725ee07a6783754f0 | ORPH
    arm      |     spirv-tools-1.3.261.1      | NOK | http://autobuild.buildroot.net/results/597760cfc643bed49d5da968d7f30ba2861370e9 | ORPH
microblazeel |     spirv-tools-1.3.261.1      | NOK | http://autobuild.buildroot.net/results/8527d094434e82b62d09489f83ddcf49be3cdc89 | ORPH
 aarch64_be  |     spirv-tools-1.3.261.1      | NOK | http://autobuild.buildroot.net/results/929ba5858ceeeccad2a5ac3741cec7acbbe23ef9 | ORPH
   s390x     |          systemd-254           | NOK | http://autobuild.buildroot.net/results/293fc5f10afe342439166954073fed1a091cce20 |     
   xtensa    |            tar-1.35            | NOK | http://autobuild.buildroot.net/results/2d8f0dab69b2d18f60d7b29eb8d1005663c3577b | ORPH
 aarch64_be  |         tpm2-tss-3.2.2         | NOK | http://autobuild.buildroot.net/results/e0bb431d7d658b558c30d67ec5d7650fff9715a8 | ORPH
    sh4a     |            unknown             | NOK | http://autobuild.buildroot.net/results/b26c43d753463a22597e373e241dcc4f956eff42 |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/0a3cc15de64a10e8f4324eb632ce3978e1ef4026 |     
   arceb     |         usbguard-1.1.2         | NOK | http://autobuild.buildroot.net/results/c3ac232326a92811f8497ef44ac5a5b63b02996f |     
  mips64el   |        valgrind-3.21.0         | NOK | http://autobuild.buildroot.net/results/b20a8161873f9d631e613b7cf424acbf6cef444a | ORPH
    i686     | x264-baee400fa9ced6f5481a72... | NOK | http://autobuild.buildroot.net/results/78d01c69c92ab01cf66b9962003521515ffc9f23 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                   bird-2.0.12 | 3 
                host-go-1.20.9 | 2 
              host-rust-1.67.1 | 2 
                elfutils-0.186 | 1 
            host-binutils-2.39 | 1 
                    qemu-7.2.1 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/28ad0a23bb6d6048ec94fb401f7e3ef905f5a375 |     
   armeb     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/2e4e2ebc0916c1a80439dc9ced60d437528ba593 |     
   mips64    |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/8c59a0ecbdb1e2eff7258e60628eb0396638fc5b |     
   arceb     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/94c558bc8bd90cedeef7223b126327a38a5f3df5 | ORPH
 microblaze  |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/ed95b30b18fc1ad625d50c0e1c2ce77a0785b6b4 |     
  mips64el   |         host-go-1.20.9         | NOK | http://autobuild.buildroot.net/results/7716b71e6c355f6386db9e97162c9d6c8af75f8a |     
   mips64    |         host-go-1.20.9         | NOK | http://autobuild.buildroot.net/results/9a9ae6e30dd46ec4054ceea888c70607218a162b |     
    mips     |        host-rust-1.67.1        | NOK | http://autobuild.buildroot.net/results/f636075250957d5c9112f65cc671f37f696f643a |     
   x86_64    |        host-rust-1.67.1        | NOK | http://autobuild.buildroot.net/results/e7df70d18dbcc99d378fa90da0e71f3a654f0a40 |     
  aarch64    |           qemu-7.2.1           | NOK | http://autobuild.buildroot.net/results/0e74f55f3ac85b90162b826ff4cd0bb305f290ee |     


Classification of failures by reason for 2023.08.x
--------------------------------------------------

  gobject-introspection-1.76.1 | 2 
              host-rust-1.71.1 | 2 
                   bird-2.0.12 | 1 
       python-stack-data-0.6.2 | 1 


Detail of failures for 2023.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/191b684a1862c87a3fce30172d5f96d3611ec4dd |     
   sh4aeb    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/96063e644d954378ce604c6665927721c0ef0850 | ORPH
   mipsel    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/a0b678803192bd8df3f0a8807c381330585e4d5f | ORPH
   mipsel    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/a8f60b099b6759cd5df6672cc93415a3e053ae67 |     
powerpc64le  |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/4c804e3578e9843a3ba16165a458dc77314ef43f |     
   s390x     |    python-stack-data-0.6.2     | NOK | http://autobuild.buildroot.net/results/866dfc5ca64daafeb59dea4e6eb32f827355ebc6 |     


Gitlab CI results for 2023-10-13
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                 at91sam9x5ek_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/5276539719  |      
             at91sam9x5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/5276539725  |      
                          beaglev | https://gitlab.com/buildroot.org/buildroot/-/jobs/5276539782  |      
               broadcom_northstar | https://gitlab.com/buildroot.org/buildroot/-/jobs/5276539787  |      
                     canaan_kd233 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5276539789  |      
              freescale_imx8mpevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/5276539858  |      
                 grinn_chiliboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/5276539899  |      
                       imx8mmpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/5276539967  |      
                        imx8mpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/5276539991  |      
                        imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/5276540001  |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/5276540020  |      
            microchip_mpfs_icicle | https://gitlab.com/buildroot.org/buildroot/-/jobs/5276540061  |      
              octavo_osd32mp1_brk | https://gitlab.com/buildroot.org/buildroot/-/jobs/5276540153  |      
              octavo_osd32mp1_red | https://gitlab.com/buildroot.org/buildroot/-/jobs/5276540156  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5276540186  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/5276540192  |      
                qemu_m68k_mcf5208 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5276540268  |      
          qemu_riscv64_nommu_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/5276540294  |      
           qemu_xtensa_lx60_nommu | https://gitlab.com/buildroot.org/buildroot/-/jobs/5285816899  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/5285836583  | ORPH 
                  sipeed_maix_bit | https://gitlab.com/buildroot.org/buildroot/-/jobs/5285838372  |      
           sipeed_maix_bit_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/5285838387  |      
                 sipeed_maix_dock | https://gitlab.com/buildroot.org/buildroot/-/jobs/5285838487  |      
          sipeed_maix_dock_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/5285838704  |      
                   sipeed_maix_go | https://gitlab.com/buildroot.org/buildroot/-/jobs/5285838976  |      
            sipeed_maix_go_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/5285839425  |      
                 sipeed_maixduino | https://gitlab.com/buildroot.org/buildroot/-/jobs/5285839492  |      
          sipeed_maixduino_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/5285839529  |      
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5285839654  |      
                 snps_arc700_nsim | https://gitlab.com/buildroot.org/buildroot/-/jobs/5285839721  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5285839990  |      
                  stm32mp157a_dk1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5285840392  |      
                  stm32mp157c_dk2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5285840446  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5285840749  |      


Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
           TestIPythonPy3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5248971447  | ORPH 
...erlayfsVarBackingFstab | https://gitlab.com/buildroot.org/buildroot/-/jobs/5248971040  | ORPH 
...yfsVarBackingMountUnit | https://gitlab.com/buildroot.org/buildroot/-/jobs/5248971043  | ORPH 
...busbrokerDbusOverlayfs | https://gitlab.com/buildroot.org/buildroot/-/jobs/5248971057  | ORPH 
          TestLuaLsqlite3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5248971573  | ORPH 
           TestLuaLuacURL | https://gitlab.com/buildroot.org/buildroot/-/jobs/5248971659  | ORPH 
       TestLuajitLsqlite3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5248971579  | ORPH 
        TestLuajitLuacURL | https://gitlab.com/buildroot.org/buildroot/-/jobs/5248971661  | ORPH 
                  TestOla | https://gitlab.com/buildroot.org/buildroot/-/jobs/5248972107  | ORPH 
          TestPolkitInitd | https://gitlab.com/buildroot.org/buildroot/-/jobs/5248972256  | ORPH 
        TestPolkitSystemd | https://gitlab.com/buildroot.org/buildroot/-/jobs/5248972261  | ORPH 
       TestPythonPahoMQTT | https://gitlab.com/buildroot.org/buildroot/-/jobs/5248972480  | ORPH 
   TestPythonPy3Construct | https://gitlab.com/buildroot.org/buildroot/-/jobs/5248972348  | ORPH 
  TestPythonPy3Dicttoxml2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5248972370  | ORPH 
    TestPythonPy3Dtschema | https://gitlab.com/buildroot.org/buildroot/-/jobs/5248972378  | ORPH 
        TestPythonPy3Hkdf | https://gitlab.com/buildroot.org/buildroot/-/jobs/5248972413  | ORPH 
...PythonPy3MagicWormhole | https://gitlab.com/buildroot.org/buildroot/-/jobs/5248972447  | ORPH 
        TestPythonPy3Mako | https://gitlab.com/buildroot.org/buildroot/-/jobs/5248972457  | ORPH 
     TestPythonPy3MakoExt | https://gitlab.com/buildroot.org/buildroot/-/jobs/5248972464  | ORPH 
     TestPythonPy3Passlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/5248972481  | ORPH 
      TestPythonPy3Pynacl | https://gitlab.com/buildroot.org/buildroot/-/jobs/5248972501  | ORPH 
       TestPythonPy3Pysmb | https://gitlab.com/buildroot.org/buildroot/-/jobs/5248972507  | ORPH 
      TestPythonPy3Pyyaml | https://gitlab.com/buildroot.org/buildroot/-/jobs/5248972522  | ORPH 
         TestPythonPy3RSA | https://gitlab.com/buildroot.org/buildroot/-/jobs/5248972547  | ORPH 
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/5248972564  | ORPH 
      TestPythonPy3Spake2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5248972594  | ORPH 
             TestStressNG | https://gitlab.com/buildroot.org/buildroot/-/jobs/5248972758  | ORPH 
             TestZfsGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/5248972875  | ORPH 
              TestZfsMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/5248972883  | ORPH 
            TestZfsUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/5248972897  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
