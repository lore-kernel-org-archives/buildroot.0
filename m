Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66212C05027
	for <buildroot@archiver.kernel.org>; Thu,  2 Feb 2023 06:45:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C29658188B;
	Thu,  2 Feb 2023 06:45:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C29658188B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x8Q163026239; Thu,  2 Feb 2023 06:45:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 76348818A7;
	Thu,  2 Feb 2023 06:45:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 76348818A7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C22811BF681
 for <buildroot@lists.busybox.net>; Thu,  2 Feb 2023 06:45:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8A14641A37
 for <buildroot@lists.busybox.net>; Thu,  2 Feb 2023 06:45:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A14641A37
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jo9WqHyETTgl for <buildroot@lists.busybox.net>;
 Thu,  2 Feb 2023 06:45:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA66D41A09
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AA66D41A09
 for <buildroot@buildroot.org>; Thu,  2 Feb 2023 06:45:10 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id DCC381BF213
 for <buildroot@buildroot.org>; Thu,  2 Feb 2023 06:45:07 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Thu, 02 Feb 2023 06:45:07 -0000
Message-Id: <20230202064514.8A14641A37@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1675320308; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=SvvxrsATnDyLIVcvPAuKH99Rv3BizO5rdvWAFlIMyeA=;
 b=LR0Lgi0fff0D/yeSkcbaT25eBGE+KZOqNsxwN5Qd29AtK1xSuZyVT+xiYlXbt9p3wH3yTR
 02SFY/jXazfCsnrbbjMiCBI4oDdmTkgZf/8e6nkP0TuBkTaNbfJNlKVthBGfLhDc86v0vz
 /7XnyFUAITQm9twz2I5oorID5WMHVq33IgImWzwKgUsEJNwOYTkSUXqOG0my2HY1Wc+3WH
 JzsISIQnAVy5uGHALnjSXg+c9T6/bB/naL9/ALdFj0RZKZg5VzPeSdX2490i0G08NDqhMS
 YddhfD7kqK6nE/gDbx2MlmvTuf7wzwOiOgIUHhgbR35Hhx65yepA5QB7541/Zg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LR0Lgi0f
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-02-01
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

Autobuild statistics for 2023-02-01
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  3  |  2  |  0  |  5  |
  2022.11.x  | 14  | 19  |  0  | 33  |
    master   | 172 | 335 |  3  | 510 |

Classification of failures by reason for master
-----------------------------------------------

               host-fwup-1.9.1 | 28
                    fwup-1.9.1 | 18
                     xz-5.2.10 | 17
                  jack2-1.9.21 | 16
                host-go-1.19.5 | 11
                    norm-1.5.8 | 10
               libfuse3-3.13.0 | 8 
                    opkg-0.4.5 | 8 
                   bash-5.2.15 | 7 
              fluent-bit-2.0.8 | 7 
                   gvfs-1.48.1 | 7 
            host-binutils-2.38 | 7 
                   linux-6.1.5 | 7 
              host-pahole-1.24 | 6 
            python-bunch-1.0.1 | 6 
                  xxhash-0.8.1 | 6 
                gerbera-1.10.0 | 5 
glibc-2.36-81-g4f4d7a13edfd... | 5 
  gobject-introspection-1.72.0 | 5 
               libglib2-2.72.3 | 5 
             libgpg-error-1.46 | 5 
             dahdi-linux-3.2.0 | 4 
            host-binutils-2.37 | 4 
         host-sentry-cli-2.8.0 | 4 
               libcap-ng-0.8.3 | 4 
              libgcrypt-1.10.1 | 4 
                    pixz-1.0.7 | 4 
           python-bcrypt-4.0.1 | 4 
                       unknown | 4 
                 wolfssl-5.5.3 | 4 
                  zabbix-5.4.9 | 4 
                    brltty-6.5 | 3 
                elfutils-0.186 | 3 
             fontconfig-2.13.1 | 3 
       freeradius-client-1.1.7 | 3 
         gobject-introspection | 3 
              host-rust-1.66.1 | 3 
                 nerdctl-1.0.0 | 3 
                    bat-0.19.0 | 2 
google-breakpad-c85eb4a59b6... | 2 
            host-binutils-2.39 | 2 
              hyperfine-1.14.0 | 2 
          linux-5.10.145-cip17 | 2 
                mongodb-4.2.18 | 2 
                  netsurf-3.10 | 2 
                  ntp-4.2.8p15 | 2 
                   pcre2-10.42 | 2 
    python-cryptography-39.0.0 | 2 
              traceroute-2.1.0 | 2 
uqmi-0a19b5b77140465c29e2af... | 2 
                  acpid-2.0.34 | 1 
afboot-stm32-3566acd582e553... | 1 
                alsa-lib-1.2.8 | 1 
                apparmor-3.1.2 | 1 
             berkeleydb-5.3.28 | 1 
                   bird-2.0.11 | 1 
                  boost-1.80.0 | 1 
            btrfs-progs-5.16.2 | 1 
                    crun-1.7.2 | 1 
                     efivar-38 | 1 
               fftw-quad-3.3.8 | 1 
                    flac-1.4.2 | 1 
                   flann-1.9.2 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/cramfs/cramfs.mk:46: /tm... | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
fs/ubi/ubi.mk:51: /home/tho... | 1 
fs/ubi/ubi.mk:51: /tmp/inst... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
glmark2-06e78b67702b5413335... | 1 
                    glog-0.6.0 | 1 
gummiboot-2bcd919c681c952eb... | 1 
         host-gcc-final-10.4.0 | 1 
         host-gcc-final-11.3.0 | 1 
       host-gcc-initial-12.2.0 | 1 
    host-python-maturin-0.14.9 | 1 
                  kexec-2.0.25 | 1 
                       kmod-30 | 1 
                    libndp-1.8 | 1 
                   libnss-3.87 | 1 
               libvorbis-1.3.7 | 1 
            linux-fusion-9.0.3 | 1 
             lirc-tools-0.10.2 | 1 
        ltp-testsuite-20220930 | 1 
        lttng-babeltrace-1.5.7 | 1 
          lttng-modules-2.13.7 | 1 
                     lxc-5.0.2 | 1 
            ocf-linux-20171122 | 1 
              open62541-v1.3.4 | 1 
   openvmtools-11.3.5-18557794 | 1 
                 pixman-0.42.2 | 1 
               postgresql-15.1 | 1 
           python-numpy-1.23.5 | 1 
           python-orjson-3.8.4 | 1 
           python-pyicu-2.10.2 | 1 
            quickjs-2021-03-27 | 1 
             uccp420wlan-6.9.1 | 1 
                 uclibc-1.0.42 | 1 
                     vdr-2.6.3 | 1 
xdriver_xf86-video-geode-2.... | 1 
               xfsprogs-5.14.2 | 1 
                  xvisor-0.3.1 | 1 
                       zip-3.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |          acpid-2.0.34          | NOK | http://autobuild.buildroot.net/results/8d4e01c43ed62fa33327975abdcc37f8b17743e4 | ORPH
    arm      | afboot-stm32-3566acd582e553... | NOK | http://autobuild.buildroot.net/results/c08330c410abc384b008c923a7e0736fce5d968a |     
    or1k     |         alsa-lib-1.2.8         | NOK | http://autobuild.buildroot.net/results/02b21fd211bf4266028b72eb024df86bbb6d038c |     
   arceb     |         apparmor-3.1.2         | NOK | http://autobuild.buildroot.net/results/b4fe1287b42076c1d2b82da306f61d0b0d9e6479 |     
   arceb     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/dc81ba14f0cac9c70ec7e5beb7c16f0d2d6d4c86 | ORPH
   sparc     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/7ce2f336f8ede2eebfb2b8ba7d0405c89980464d | ORPH
    mips     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/d25c36fa0f32e56a4f9db8ed21bd98ca59920787 | ORPH
  powerpc    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/4f8da8a51ef877cdfaf6ab4fb936a22636bef5e1 | ORPH
  mips64el   |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/1f319789a87e055bbd074b020193b67adab4ac56 | ORPH
   xtensa    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/d40e87855a4b44fb207ddfec9183aca1336ed4d5 | ORPH
  powerpc    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/34bd798693455de1e569a8136da7cb3a697a19fd | ORPH
   x86_64    |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/3566a772ef76c31f5d427f968269b99adb0750bf |     
    mips     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/da25d808283e0ee099dad2ab7ca797c6ba0eb3b9 |     
    sh4      |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/f5083d1f8b98f923de8160aa89855733e10a7063 | ORPH
    arm      |          bird-2.0.11           | NOK | http://autobuild.buildroot.net/results/e2bbd0ca1fddaa71f223712be8e2e63f31ca2da1 |     
   arceb     |          boost-1.80.0          | NOK | http://autobuild.buildroot.net/results/392bd89315f4a5062558e647f77a3a5238c1a63e |     
   mipsel    |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/65b12428267b52a1368abef45779e63fd7a15af4 |     
    mips     |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/4339a830c763ed2efdc28b90e9f7a45438dfac9d |     
microblazeel |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/3eb49c8c41963ce22b94c179223129818e3ff03b |     
    or1k     |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/52a39ff69d2db9866ee3fc65567bdb9fb2181602 | ORPH
   mipsel    |           crun-1.7.2           | NOK | http://autobuild.buildroot.net/results/f7a7ddd433437fa778950281af04643d7db972c3 |     
  sparc64    |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/1bbc2b3eec84e1fc0686c1f148471d396d5b0898 |     
   armeb     |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/20021f9b71e0ea4692d44f7c7070c15b394ffab1 |     
  riscv64    |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/a0fea114fd79971c4ce4a4512cbce4d5923feaa3 |     
   s390x     |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/c3a799a4e9874dc850d086ce61ca215eb45cb4f6 |     
  aarch64    |           efivar-38            | NOK | http://autobuild.buildroot.net/results/1ba67891df0499237f315a59a3220a4078d9b62b |     
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/636b86910612560769e19ca6df5c74c291758525 | ORPH
   arceb     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/92c347d5cebb2cde9f91730748abf6b06380f0a0 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/96fd22c7cdedb7d02a560f46cfc298b7c9208023 | ORPH
powerpc64le  |        fftw-quad-3.3.8         | NOK | http://autobuild.buildroot.net/results/fd7aaabef32184afe0826e21d81b492935ccd5ee | ORPH
   sh4aeb    |           flac-1.4.2           | NOK | http://autobuild.buildroot.net/results/620eaa2419ae69dec66e02be13a2eb50a2b3af83 |     
  mips64el   |          flann-1.9.2           | NOK | http://autobuild.buildroot.net/results/5dcc29a942368cb4c0eb12c21b5c12fc877eded7 |     
 aarch64_be  |        fluent-bit-2.0.8        | NOK | http://autobuild.buildroot.net/results/db4dca11d2186c6aa1fc47bc7f34cad69a02acd3 |     
powerpc64le  |        fluent-bit-2.0.8        | NOK | http://autobuild.buildroot.net/results/7c0b6cd07d623c6dfa552634b57856c2faf3c5e2 |     
 aarch64_be  |        fluent-bit-2.0.8        | NOK | http://autobuild.buildroot.net/results/55b1f8d587a10357c228ff3c4313675239be9d21 |     
 powerpc64   |        fluent-bit-2.0.8        | NOK | http://autobuild.buildroot.net/results/2fc0a32d52be56525edaffcf7ec461c834e90854 |     
  aarch64    |        fluent-bit-2.0.8        | NOK | http://autobuild.buildroot.net/results/620b062db8a331f86a218e5b3b80395500f09435 |     
 aarch64_be  |        fluent-bit-2.0.8        | NOK | http://autobuild.buildroot.net/results/f0514c217fd5cb4d6f07bb8bd7aaf71e3e9b50cb |     
   s390x     |        fluent-bit-2.0.8        | NOK | http://autobuild.buildroot.net/results/df9901b7b52c7933e6a4ef4503f80e336e0e299e |     
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/0f303a32561b33aaa1dbb9c469333b9777180f13 | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/8c829744f7991d8dfd7447b70cdd61e5478ef9f9 | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/aeb4cb12ff37e96e036ab93bf15703e7753bbea2 | ORPH
  riscv64    |    freeradius-client-1.1.7     | NOK | http://autobuild.buildroot.net/results/25fbee9c28e5b3f114b06da35f1f0b0a8db44195 |     
  riscv64    |    freeradius-client-1.1.7     | NOK | http://autobuild.buildroot.net/results/3c2d0281cb26676ee4581c6fc4f747c0959309f9 |     
  riscv64    |    freeradius-client-1.1.7     | NOK | http://autobuild.buildroot.net/results/6afb37875b282c3475e420d9a3d424dafb80cb08 |     
    arc      | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/dcdd3b4cae74c4c0ca155e7db83db9032c35fdda |     
   mipsel    | fs/cramfs/cramfs.mk:46: /tm... | NOK | http://autobuild.buildroot.net/results/c3bab75326a425786798079ce330f5724dff0cc5 |     
    mips     | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/faa2cc501565a6d81f43b905feb0ecb25eea7a7e |     
    mips     | fs/ubi/ubi.mk:51: /home/tho... | NOK | http://autobuild.buildroot.net/results/ef488b35ef95912ad209ed062a998eb976055b29 |     
   mips64    | fs/ubi/ubi.mk:51: /tmp/inst... | NOK | http://autobuild.buildroot.net/results/ec6f6e7e9b643534ed37f41ecd27df0e7ddae731 |     
   s390x     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/dd412baf8f9312c42b59076bae1e85a60264461f |     
  powerpc    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/19494f7dc0d460eaed1b2006ef19a2e082d47ba7 |     
    or1k     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/ca536d3ccba15f8f57af23d6e15aaa23bd7824db |     
  mips64el   | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/b7e81ee0800602e08cb323b3a7cc64e720365052 |     
    or1k     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/f49e42e64e610d37a06fb6941558d28e561089c5 |     
   mips64    | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/0ef5021be1cb43728dd3e155fb547d926cd57152 |     
   s390x     | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/4a21636890fce1750ed285436fc5cdfb47d90b65 |     
   nios2     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/47c578e74e70ce22781bb05caf6712a43ef16ed8 |     
 microblaze  |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/d8f0dde87b56d9a9756f27b1288aff0996684adc |     
powerpc64le  |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/9e5c4ea12c1a6acacfe17d8bc2d0ff3499e86298 |     
   xtensa    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/7a9efd870165569a783f297475b2553824cbcb4d |     
  sparc64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/84b2e3e8bff331435e63e1e4a4ab6c699bad62b6 |     
   mips64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/b0e976bff8076fa5d50b2c1600111ab0ea8e3dc5 |     
 aarch64_be  |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/110fb35d4c9c022d600381106c7296385086d71e |     
 aarch64_be  |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/317507c834edbad4379f2f9b1913d0507dbeb6ff |     
    i686     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/ffefc92bd86d606ff1dcefc3c2710b1a88a04b6a |     
   nios2     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/7c92d4618440c66764bbbcbf1c9637f77f848571 |     
   x86_64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/75800541af18fca312cdc1bed32b6e2a18d34bcd |     
   nios2     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/ec81ad75862dd9e25a4464a535af5a484cb67f5f |     
  mips64el   |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/38185fa177eb5cc4905bec7760cb7bb4e4de3851 |     
    arm      |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/8214d7a33b1cb25d72450a429d2b933539a3b419 |     
    arc      |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/4f61473b4c68ce907109a05d1ed0cf3b14de97eb |     
    arc      |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/fb424825c21330b8a87703c3cbcd68c48810b100 |     
    sh4a     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/3b9d83a0f9d8c346aaf6900aea206952466d1685 |     
  mips64el   |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/8fe00f5a7b474d2f27dfc4f989e281e2c34d5dbd |     
 aarch64_be  |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/b033bb5f06ead6bf623cb54d576c7a9dcabad148 |     
   nios2     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/0732ccc310aa52d32b569e72733efe14ff61acb8 |     
  mips64el   |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/a7ceaa8cf8d0a50f5790fa2c0d96a99f4e3b876f |     
    sh4      |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/990d0286c3f63d93fb6f09f15511c9ee04ca1b9b |     
   x86_64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/838a4f0141c238e3391927ac08c23e79209cefc1 |     
    arc      | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/13db1f6bd84eecd70cca022e0543611d328346f5 |     
   arceb     | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/c1b0bb58c952bdcd0d6b63de3fc10385ea7e0b9a |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/490523b6260273d2e00a1bea66d2d4c49cbe501b |     
 powerpc64   | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/f01bd5b70a53313bef6e0500d2120ad58b3a5c97 |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/52daa688b341e28f8ded613665e359a72031e714 |     
  aarch64    | glmark2-06e78b67702b5413335... | NOK | http://autobuild.buildroot.net/results/bbd90f11975b691f694412a6fc3446f37dd7c0aa |     
  riscv64    |           glog-0.6.0           | NOK | http://autobuild.buildroot.net/results/49b6f8268a91e2392e880ce52b7f892ef41a0b55 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/e9106719c92cff325040720e94ecf384e59f76e6 |     
   armeb     |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/29730d4d341516f15a1f5dc5ded2419318b34ccd |     
   armeb     |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/d10553b4f92bc297a633bab4772aca5994860ea6 |     
   nios2     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/561d47cfe7a27ed0e25985aca39980ac69a43223 | ORPH
 powerpc64   |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/d616444a34ed8879fc1d61e7fe87545b49da7cf2 | ORPH
   x86_64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/f686adec0283da6c72076fe13cdbc5c1811ba5e4 | ORPH
   s390x     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/58c0fb46c87e76a44fac1f3d2927d3ea8295b4fa | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/e2e7ab69578cfbe3074baf2f94fc5e2c7cdc6e1e | ORPH
    arm      | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/b6e2cd511f913ebc626f7eadc0e2496c9f2977dc |     
   mipsel    | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/c3fb2f019663741947b0888cca9ab2f1309ab01c |     
    i586     | gummiboot-2bcd919c681c952eb... | NOK | http://autobuild.buildroot.net/results/b503ea7341d4e865ec9f288922d3063f08f8ea67 |     
   mipsel    |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/53816e64ab18541cb78c7cef62dda5873267f042 | ORPH
   s390x     |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/58246cc30cdb3e278597e9b63b58d5dab64280a8 | ORPH
   nios2     |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/7da35f6fac6df78ae91c840ef32af9a5f5d5a62f | ORPH
   x86_64    |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/daa230ffb7536175990669cfb95aae71b176e764 | ORPH
 powerpc64   |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/9ad4b3eabb1cfcd56a124bf5d0d42fd51d8234ef | ORPH
  sparc64    |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/115a27158ab16bd0f82c311849507610bd70e096 | ORPH
powerpc64le  |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/44463cd74d0b617c3aa246a6ed16f00a37ce25af | ORPH
   arceb     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/95a23561fff47cfaf91e0b5162b4300a8acc6698 |     
   mips64    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/64acd43cc8ca29ce1ea7df518118bde6e7d02309 |     
   xtensa    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/04cc6ad0b397e790c1d8932d7506a775edfb1bee |     
    sh4a     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/bcddcee118610404fe919172f70ad77c8bbb8782 |     
    or1k     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/2da7f810282f4e0832179b8df9a4f8808f0afcad |     
   mipsel    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/12c0f087748437dfda94414d10180fd7723afec5 |     
  riscv32    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/4b72e625c98bc61c07db63ad47b74024ee69d7c6 |     
   sparc     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/4d2af7a3894ef38c661bc34c778824712c1add29 |     
   mipsel    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/baa72f384a0765e12b065663c1fea62d3e18aa27 |     
    mips     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/6ada8e68fd706498aeac323d3972d20e6b62cde8 |     
 aarch64_be  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/ef3f25bbd04d65f1bf9b6f8cb25fea97a80046d8 |     
  powerpc    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/958fc489eb7ca7cf1551e77fd001a6bf7024bfdd |     
  powerpc    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/ceca9b5ceff75442c7605e0edd269b3a15ffea86 |     
   x86_64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/5dce05289e7961861d9b62d670a035aeaaa5f3ac |     
microblazeel |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/5fc0aa211fcba67a8a067c6d98963c8f518d34f5 |     
   xtensa    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/15219ce297be728b824b8afd1e4c3ecdf8624b26 |     
    or1k     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/0e167421afda575d421e5b75a02fe3cb2e4cfabe |     
  aarch64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/f5ac81272c40b6401d39fb83a2dbd58e9d5b7c60 |     
  aarch64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/fb3624fbe4e5229da498740b0bc8e0d3cfc4fa33 |     
  riscv32    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/a31edccedc11487dfa20f278d105c137f24b6247 |     
    sh4a     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/002b603eeb8380d29d0b8b0f3793293f67d165a2 |     
   mips64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/af1d596f53dd88c0976eeca6be0c1860b8b5b893 |     
    or1k     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/87187c6882a4d516a6582be13a7db25e38a774fd |     
    i686     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/6d17ba1217af25bc031cb47aa0dbc7fb835ca2af |     
    or1k     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/3cb5befc7c49f14321ddf575246007c220a44d74 |     
    m68k     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/e265ba753c441f6ae60075042e66e75b9073a9a4 |     
    arc      |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/29f0cabfe8c94fae0766c911175ae565d20c705c |     
   arceb     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/7514e3556b4112a75047f55ab2b44de407828a5c |     
    sh4a     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/e729b881ec8301b7e78988eb2e2262c88f9b3d1b |     
    sh4      |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/d9cb94c8003026c7d21e8882a34b7b6ba30c821b |     
  aarch64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/6c241f285208eedd646875ff38af4cab20c48f10 |     
 powerpc64   |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/3bdd030ecd1fd69693b4d7619ca96eb2cd87cee7 |     
   x86_64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/0ea27cb5dcc21884618dc50bd6c213aec8da38fb |     
    arc      |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/d70e0d4a0fa805baa376fcd72142be8271a2bfa3 |     
  riscv32    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/ff24569c9c25df649eaa282f78cf4111a16165b3 |     
   mipsel    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/2a7b0ff05e3420b0374b7dc25b5f9ab56194717f |     
   s390x     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/eb34fbaaf8d71aa5cc4674ee12842e2e40e28f6b |     
    mips     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/4bb36cf80ba1820881edd22f809d2bcb720862f4 |     
   armeb     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/e23676808ed36f0ade5ad531b89357e30b73af5b |     
    mips     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/c75aadf1a4132496ab64622b79593f4c41cd8196 |     
   x86_64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/ba7373995cfdbc3b53667e457e8661633816ad95 |     
  riscv32    |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/f9db426c5f9ef48e742b92851ca587dc6f82da33 |     
microblazeel |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/941abe8a57fc3a59059d7fc69e1e585552541fa2 |     
   arceb     |    host-gcc-initial-12.2.0     | NOK | http://autobuild.buildroot.net/results/655b9a44a07014d274238644846ff7c3e39a1b71 |     
   mips64    |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/ba8fa7af8352cd65a3a9d6927c8d40f6c01f2321 |     
  mips64el   |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/8e52dd78f29ae2e9352aca3f6c4209a35456d63a |     
  mips64el   |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/d01dce5e7dbf8063f71a62006c8e676fc629ff05 |     
    i686     |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/9d9f8ecedd25c29798f9c50cbda9789897f50922 |     
    i686     |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/f5e7f9b585da2f6002d0d38a126339fe1ebe55e8 |     
  mips64el   |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/d15e504fddc5c77a6861f4c3b3b9c7ff624d5e97 |     
    i686     |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/bf01a959c5608bde5c1efc0082733c20a7a17ba4 |     
  mips64el   |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/a65bc23a8cda34b8c1e365432aafab1c23f84579 |     
   mips64    |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/9db632607f4333469a3fcfb160147e47dbeaf475 |     
    i686     |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/799ef3267ab3bc357f40b721be968c58ae318b47 |     
    i686     |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/a6ed60544ffb0225a93e5fec397cba1b0528a0c1 |     
  mips64el   |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/aa2f23a6d551190df62eb26e6c135aa2bf1cce61 |     
   armeb     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/6993cd6183c6c33e9803bcaf8c8ca732e024e1dd |     
  powerpc    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/be14569c54b60a56ab37ac464fb86d128e5137ef |     
   armeb     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/8ca78ce116774286933c440fa8b00459a1f57fbc |     
  mips64el   |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/42dfec5afcc34e54e8ee8dacb9fa0f0e3f5b7ce3 |     
   armeb     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/c830eecb134dbead9003014dd93c17c8b0c3e569 |     
  sparc64    |   host-python-maturin-0.14.9   | NOK | http://autobuild.buildroot.net/results/23f802d3d7ba96939d36916bc4dcaedaf8eea4be |     
   armeb     |        host-rust-1.66.1        | NOK | http://autobuild.buildroot.net/results/d864e592014c24a5f1dd096fdec240d83e5c414a |     
   armeb     |        host-rust-1.66.1        | NOK | http://autobuild.buildroot.net/results/cb4711005dd0766b5f80d2a815bee131400d0e61 |     
   x86_64    |        host-rust-1.66.1        | NOK | http://autobuild.buildroot.net/results/202b42ca3c1a25ed8c1d05fb97e06b2be11d4483 |     
   mips64    |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/ec92ce423e04caec00328d55f81455625b732879 |     
   xtensa    |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/f8b48dd47d5d6ce912b9dce66b8fa30956b6e5fe |     
   arceb     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/57fed06f3cdd73436c81969aa98c86aae6ad128f |     
    or1k     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/54cc389fee1ca34ab6455aed1c084fc743e1133b |     
powerpc64le  |        hyperfine-1.14.0        | NOK | http://autobuild.buildroot.net/results/3eb0fa2dee6cbfbeae1f9640d399c362637801e5 | ORPH
   x86_64    |        hyperfine-1.14.0        | NOK | http://autobuild.buildroot.net/results/bb4190b8af3fbfc66b6a8537e0a1ff7b8e46ca37 | ORPH
   mips64    |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/68f7eec804e3159cbe90064691d1c7d53a0d62bf |     
  mips64el   |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/35ff103afa7315ba9c1ea35f5b3fd509dda3bf9f |     
  sparc64    |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/c82551eaa62a293731ad1626c8d599d58bb63a39 |     
powerpc64le  |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/c802c405966fad34548454d3860ab02e84671f34 |     
    mips     |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/de7c4851dc333df14ba9e2cef095e4a2d38a3fe6 |     
powerpc64le  |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/925d3000fee3ded8407766d2caf25357d1a370c5 |     
   s390x     |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/66a60e106e578464db8d22433738380a39790a03 |     
    mips     |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/ab0c68a7a4d7df7861f7a28b3126ff2ec851e316 |     
 aarch64_be  |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/a1eebcf786cc0af943ca5157bfdf975ccf40be43 |     
    arm      |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/4d9fb7d913aae1d321acd2c73b86c4c19eb58475 |     
    or1k     |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/2869b35a031faa9f05e172dda4baebb75e23d590 |     
powerpc64le  |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/60b12ca955739be9f49de1b52970e49163cda226 |     
 microblaze  |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/e50cfaa56bc7d29d21d30c57e4f677757fc6ccb0 |     
powerpc64le  |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/42cedb4d394ce1120334a2e5a3da4b4647ac12c5 |     
  powerpc    |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/e591241b7c7a51ad4a4c08593c9f7699ed73108d |     
  sparc64    |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/c46508633c74395ae1dc3b6e4cdeed9210a657d8 |     
   armeb     |          kexec-2.0.25          | NOK | http://autobuild.buildroot.net/results/27b3dff6575099e8e8f36bbf8283a551d0d20a91 | ORPH
   armeb     |            kmod-30             | NOK | http://autobuild.buildroot.net/results/40647bed164a8ad535b900fdf5d09d600ced6f3c |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/a9dd7e93994557fc267843fc4dfb542d914fd81a |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/6540f81fb4108b52a542d459bef7b466d5c36c6f |     
    or1k     |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/bad686930c52d2132dfae5965e168eada32232fc |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/a35e190e5f2e90b79e1365000359b851b5932a1a |     
    or1k     |        libfuse3-3.13.0         | NOK | http://autobuild.buildroot.net/results/5843f77eacf0c6a2f94c4854a19fa912faeeca6b |     
    mips     |        libfuse3-3.13.0         | NOK | http://autobuild.buildroot.net/results/a019fca7a6feef0e20922d37b5bf45529176bdeb |     
    i686     |        libfuse3-3.13.0         | NOK | http://autobuild.buildroot.net/results/af8160be7d79690e8a7fe3c92bd6ceb22fad1695 |     
   sh4eb     |        libfuse3-3.13.0         | NOK | http://autobuild.buildroot.net/results/b745ebcaf36a2ea8b34c8bf07e068324de1820b9 |     
powerpc64le  |        libfuse3-3.13.0         | NOK | http://autobuild.buildroot.net/results/49d2dbd03f4691e59094dbae1488180cd2c47e97 |     
powerpc64le  |        libfuse3-3.13.0         | NOK | http://autobuild.buildroot.net/results/856b295d5e94e15bd510cd6165b0636d1ca4bd60 |     
    i686     |        libfuse3-3.13.0         | NOK | http://autobuild.buildroot.net/results/19dd0243b3bc8c82914a852694ea75d802ef08ff |     
powerpc64le  |        libfuse3-3.13.0         | NOK | http://autobuild.buildroot.net/results/3938e6ba878fa2e12ebd52e4b5e34ddadc3ffdc1 |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/04b2c0044dd33f9457e480eac7c84e188a0bd7c8 | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/5e3afca87208aa77e8edae9470aaa1fb7080c8d7 | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/8059ae7fc5065dc7fb3e198d7de1ca537a1e9e00 | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/854704351646a6929dbfef19bfb55824f18d2b6f | ORPH
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/8e64223a4cb96e4e6c7b579646e27e23d09adfe5 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/892349acf9a72a36100edf5e6bf9fb8a6436a258 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/5b8adf7ac81928c3071d29a602b90fc22fd20b0b |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/d99f1b042e1a7cbb09056468380007e9c1234ddd |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/2ae46deb5f11b03d64709b702108313da523ab43 |     
 aarch64_be  |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/a16b3deffd616a0cd9b10eb962f82aa0c724cdba | ORPH
 aarch64_be  |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/f13e988c2e40653a5608914595bb073a63ae65e0 | ORPH
 aarch64_be  |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/26fb07ca54892a413a65a3bc0dc8809605a4133b | ORPH
 aarch64_be  |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/57034f1cf3c997d67445d8527a89c084c459dfd2 | ORPH
 aarch64_be  |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/f808d9a4fa13b39430633daa91b2e45b9f468113 | ORPH
  riscv64    |           libndp-1.8           | NOK | http://autobuild.buildroot.net/results/4dea0f50d6c3f884762be9fd7debfdf7f133123a |     
    sh4a     |          libnss-3.87           | NOK | http://autobuild.buildroot.net/results/9d18bd99f66699e1a7e0785160ffdb15adc38222 |     
  powerpc    |        libvorbis-1.3.7         | NOK | http://autobuild.buildroot.net/results/dab159120e693856917b5294dd0e1da80de35351 |     
    sh4a     |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/08d22bb5d3cb8f94b8a14e556f3f92dd879b4394 | ORPH
   mipsel    |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/8fd031cf2df528538973350da4653fb4fc0a3ee6 | ORPH
    mips     |          linux-6.1.5           | NOK | http://autobuild.buildroot.net/results/dd32e27f7a9355e454d5f09ce39369344f93d1e3 | ORPH
  powerpc    |          linux-6.1.5           | NOK | http://autobuild.buildroot.net/results/b6b5f6daf9732e125cd3023ba7870225430410ed | ORPH
    sh4a     |          linux-6.1.5           | NOK | http://autobuild.buildroot.net/results/52034975dfdd11d2e0cb7969bb395f00dbedad09 | ORPH
   mipsel    |          linux-6.1.5           | NOK | http://autobuild.buildroot.net/results/3835d604569739ad985fefb61642fb1f4c9ca488 | ORPH
    mips     |          linux-6.1.5           | NOK | http://autobuild.buildroot.net/results/62405e4b74fa93aa2327249ac5c60b37c7e37d32 | ORPH
  mips64el   |          linux-6.1.5           | NOK | http://autobuild.buildroot.net/results/d2fe49dffed2eae712f261a785963f6b86b79bed | ORPH
    mips     |          linux-6.1.5           | NOK | http://autobuild.buildroot.net/results/68b992424c4c5b9bda864088437aa726dab06efb | ORPH
  sparc64    |       linux-fusion-9.0.3       | NOK | http://autobuild.buildroot.net/results/8668b0debd4d6db3067044be7b5d08189ff8e617 | ORPH
  powerpc    |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/c1e72d7e71e0e75f36b6f2a4607310ff084be1cd | ORPH
   x86_64    |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/2d369d8b8a669e902bdc479961a43010264230d3 |     
   arceb     |     lttng-babeltrace-1.5.7     | NOK | http://autobuild.buildroot.net/results/e0e41ca10d8a847fadfbd9455d463a0d57b27bef |     
microblazeel |      lttng-modules-2.13.7      | NOK | http://autobuild.buildroot.net/results/b08b0c138d344bfbff18eb9f411d1357dab6fcb7 |     
 aarch64_be  |           lxc-5.0.2            | NOK | http://autobuild.buildroot.net/results/c7d8b6361275f0a8aa01e78814dfa19a84bde547 |     
  aarch64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/59dee59117659369e4bd5e296bf2825abd2bf72b |     
  aarch64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/ebf4151aac9718255f979015cf849cca754a2c51 |     
  aarch64    |         nerdctl-1.0.0          | NOK | http://autobuild.buildroot.net/results/a7c5f28f9e6cf8da7026bab5c2284fc4fc7e89f7 |     
    arm      |         nerdctl-1.0.0          | NOK | http://autobuild.buildroot.net/results/eaf0c6649b5663be911145622a306473849b2d0d |     
powerpc64le  |         nerdctl-1.0.0          | NOK | http://autobuild.buildroot.net/results/bad88cf7ac3ea53e28ba6e16e5a374f5fe1a0da2 |     
   mips64    |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/3c9f872868fca60f947b35593ea5135531334a43 |     
   nios2     |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/c29a210bfb3377f1c873981123ad8da91532a2ff |     
    i586     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/8600d58e2656ef0ec2c562c8676b98d59c5d73f4 | ORPH
microblazeel |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/de7028cea50e329fa27131fad2c48f4ba1dacda3 | ORPH
  riscv64    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/da7154b2a0dcd21474d92c451c6463be4d755776 | ORPH
  sparc64    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/d87331619ad6f837c6b8ae0cd516fb1aff72618e | ORPH
   nios2     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/12b76abb7d5df113656bc892b48edcaef105a6e3 | ORPH
    arm      |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/a7d2eeab76b1391e5733ef09dac751655b005a6c | ORPH
   sparc     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/197d98d06024806887621fdcffb3eb4bd7031ef6 | ORPH
   x86_64    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/4e9f9aaeaee2b228fb53aa84094c881b9ce9aa20 | ORPH
    m68k     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/859e7f4ab19806cd21dac1e097da2e0448926831 | ORPH
    m68k     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/3dfbe85fdd1e7a1bc8a132d925abe47f7a4bc7c4 | ORPH
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/1a1016e7aa77f5608f66c4344541c220e31fbd3b | ORPH
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/352911fba22bca1353b335772c70d1ffa75f3860 | ORPH
powerpc64le  |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/af7e6b185b932f0bfac9c113e9c4d129fd5d1faa | ORPH
   nios2     |        open62541-v1.3.4        | NOK | http://autobuild.buildroot.net/results/2b3bf9142d1de0a1f500ba53b82b52248458e32f | ORPH
   x86_64    |  openvmtools-11.3.5-18557794   | NOK | http://autobuild.buildroot.net/results/ecbe8f9244ba0764eae2f3db0007415b320f22bd |     
   mipsel    |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/29d5d20660318620befb78af3be06896d4a70e99 | ORPH
 powerpc64   |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/b844d753f5d1969e941e2a865c7ff760fde37d9c | ORPH
 aarch64_be  |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/7cc3bceddd4ba016164d31d2718138c43cb8b976 | ORPH
  sparc64    |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/5dc839d26b34824f78311c5e745d51209f7a1987 | ORPH
   s390x     |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/9a54d6267fb69657bf994f77a1193c37dff01066 | ORPH
 powerpc64   |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/f604b2e3cdc0b8d8fcdfc847a3b2c8904fff649c | ORPH
  powerpc    |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/87d5ebbe2db2358da05751c087e31b8528d8b0e7 | ORPH
    m68k     |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/3c0cb8ff764fb97c9d0498a4d58857351b659676 | ORPH
   sparc     |          pcre2-10.42           | NOK | http://autobuild.buildroot.net/results/c0143efe721bbbabb2f612a0db82b63064d6a7ae | ORPH
   sparc     |          pcre2-10.42           | NOK | http://autobuild.buildroot.net/results/117760f1157cad340e3021dfdbd770d5e6d0face | ORPH
    arm      |         pixman-0.42.2          | NOK | http://autobuild.buildroot.net/results/ef78c43674aea0fc7d8194fbed6bf35c50105844 |     
    sh4a     |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/359f12c8cdd3666e8658db0aa2fe1e3ae516db25 |     
   sparc     |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/ec2736b0ff7fd5f1237420472b8aa10b83d012c2 |     
  mips64el   |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/cf85b5e16809b32e0953c4f97f8fb1eeedcecddd |     
   sparc     |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/472fd0a7e739a547cd3e5795eeadf666ee41d5c8 |     
    sh4a     |        postgresql-15.1         | NOK | http://autobuild.buildroot.net/results/cf272cdc5be2faf4070de3d235ec7a0f7190867a |     
  powerpc    |      python-bcrypt-4.0.1       | NOK | http://autobuild.buildroot.net/results/6745e1ccf8707ce7893a6f9db6d42649b6b9f0e6 |     
   x86_64    |      python-bcrypt-4.0.1       | NOK | http://autobuild.buildroot.net/results/a3911b9240c2e4465187dc1588071807d2e552b9 |     
   s390x     |      python-bcrypt-4.0.1       | NOK | http://autobuild.buildroot.net/results/9b5bfbe43caffc3160f62600f15e13a0cd4deaf5 |     
 powerpc64   |      python-bcrypt-4.0.1       | NOK | http://autobuild.buildroot.net/results/57f80cdec8b5efb8bccbf7fc75465a9bb1b61a2f |     
 powerpc64   |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/fb179701f35ce0b92ac1fca8eb377d48bb8dd889 |     
   armeb     |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/accbb9c3c6adb2cabfec82af148a0b4d0ee2ebea |     
   nios2     |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/362db3810c48e46551271acd23363dd80f6f8b6c |     
   nios2     |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/4528413f52358f6c466f24cddbac5b56e677b042 |     
  aarch64    |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/64c53ee81df6567063d38bfd92b259b49cb1ea7e |     
   s390x     |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/0b24235b4df2fc7bdb4e4da7c43f3eabba591b61 |     
  sparc64    |   python-cryptography-39.0.0   | NOK | http://autobuild.buildroot.net/results/634697dba427bbf8b1c009f4f118d88b56c6477a |     
   x86_64    |   python-cryptography-39.0.0   | NOK | http://autobuild.buildroot.net/results/dd5bf18fb3bbe24293d2a0230fa1c8c7780fa739 |     
    mips     |      python-numpy-1.23.5       | NOK | http://autobuild.buildroot.net/results/a3e9984f816dc459dd180cd8aabd6ea090b3a748 |     
    mips     |      python-orjson-3.8.4       | NOK | http://autobuild.buildroot.net/results/7291d123479411e632b8380f0045a18814dc23ae |     
    arc      |      python-pyicu-2.10.2       | NOK | http://autobuild.buildroot.net/results/fb97a98cb6779c4976a9203f8c4d87e002cda3d9 |     
microblazeel |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/e404152462c16d5471cc9be35fa7a941a490f66b |     
    or1k     |        traceroute-2.1.0        | NOK | http://autobuild.buildroot.net/results/a17749f0b78eda4f4fdb4442e52567e45609878c |     
    i686     |        traceroute-2.1.0        | NOK | http://autobuild.buildroot.net/results/a62d899eb0ae6f104ee3b4af7ba9ff774fa6aada |     
  sparc64    |       uccp420wlan-6.9.1        | NOK | http://autobuild.buildroot.net/results/35b8790bb9ddd180b191da49d7ad20eb84f89495 | ORPH
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/17734790285de49b67f0712ab6e0e41b0738669b |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/ddda24c6899c2d9fbbbb1578c6ab49c5d8091b48 |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/493914a77ad443181c49b223157ca4f12e7af49b |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/423bc0739904c9a2ce63744cc3a31bd9f8205555 |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/ad99454be8f4b5327a3b727692e85d7c657bb84c |     
   xtensa    | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/93640e438729259cb8033ccfb656a60ba234d878 | ORPH
  sparc64    | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/4ea5c7051c65487f2fc8935430aca19167a37e01 | ORPH
    or1k     |           vdr-2.6.3            | NOK | http://autobuild.buildroot.net/results/135c05445b314ff24bddf197ee1dd99b74b8f5ce |     
    arm      |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/5a8d253b09f68028ba47f8d19de27f1d131b1734 |     
  riscv32    |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/d04a3109ab0fcbdeef789a6bae6211d7a2374320 |     
    mips     |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/4e70be2d2c161094cf33f161d784a212b7c21bea |     
   armeb     |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/7fc95c043573c92d76dad539183dbb7168591d08 |     
    i686     | xdriver_xf86-video-geode-2.... | NOK | http://autobuild.buildroot.net/results/d1dae8c7ba9dc82fbbcc5914ea3b378e48304617 |     
   mipsel    |        xfsprogs-5.14.2         | NOK | http://autobuild.buildroot.net/results/602eb6874b9c8c67a0cbe0ce07b16b652e69a1e3 | ORPH
   x86_64    |          xvisor-0.3.1          | NOK | http://autobuild.buildroot.net/results/27266075215b44e41c12aa9b925028b08a089bfd |     
  mips64el   |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/6be47f1f9957170e834625f13e2d01dc4b0d1c7e | ORPH
    arm      |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/0fc774f5538e682278f161c59ddfa9cfaedd9212 | ORPH
    mips     |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/82ae36bf03c1cb8fd192100e77c28c65e50dd954 | ORPH
    mips     |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/fb957653db5bd2a83ac4c13f3a1640ddaee3bc23 | ORPH
   mipsel    |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/37b528c1cab64063c93c5e5229fc2a62bdc4c3b2 | ORPH
    mips     |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/a11e3250a57115a25ca6b41777572b7a27b17247 | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/26cd3a80fb8208af25b22c8e2f7decec700f0a37 | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/12585ac99ee541b648d93fb5e1821c7cd07f8003 | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/5762fcfc8cba26b97836f792392f1d1b46634d47 | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/2f3a453718ff970c05379280c25a38eadbde3ba0 | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/c3ec9830f40989ca627c6affd1a444410f4173a0 | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/9e591e0c8fafc896ec9e5e186b6422eed6ce5aab | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/78992aa9ae6b1691c374873701d7c77445262d98 | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/0af3e80d8be9db4c4e97b6cd9d90bd73b9c6d2ae | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/b1e0f0617bf1cf1e2e8e3732131eb17b06fbf449 | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/9d306ab41666c88945982091404c1d7bfe1df9de | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/cb341041361d0901cb564594618f1e1cc734dc58 | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/46daa2e92eaceda60d9916dd35d240d7692c4d96 | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/52fd3cb7e5d11f476a9ccd192bf186d18147d74d | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/8cf2280a058136d1096eb140381a4afdd3369500 | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/c03dce385b6b120851e59147d3189860a463174d | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/86a0815bb605d9ba3ec2d4cd8bb3c4b3a533da9a | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/75977d059e01d17012a84d96bdcce74c4fc8d9e3 | ORPH
   nios2     |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/a0786eeca53356adf3223fcfb5967ca0a93d99aa |     
    arm      |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/e1c07778116c5a1cb764f9a900b3d5ca312c88d7 |     
    i686     |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/efcdb62725ee6494d7925d07f3eb2e31693042a9 |     
  riscv64    |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/56573730fa06e95a9bbce0c6501bdf27edbcb872 |     
   armeb     |            zip-3.0             | NOK | http://autobuild.buildroot.net/results/a10b59d2c896e361d74611e07fb5f03efd93a09e |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

          janus-gateway-0.11.6 | 1 
               poppler-22.10.0 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |      janus-gateway-0.11.6      | NOK | http://autobuild.buildroot.net/results/49f02a7e56d269e20a6b637683ce3c88975be111 |     
   xtensa    |        poppler-22.10.0         | NOK | http://autobuild.buildroot.net/results/ed27829893ba138098f70d409869e78a1cdaf186 |     


Classification of failures by reason for 2022.11.x
--------------------------------------------------

           python-numpy-1.23.4 | 3 
                  xxhash-0.8.1 | 2 
                     efivar-38 | 1 
                 fdk-aac-2.0.2 | 1 
                     frr-8.3.1 | 1 
glibc-2.36-66-ga1dc0be03c9d... | 1 
  gobject-introspection-1.72.0 | 1 
hawktracer-2ec19d7192334414... | 1 
            host-binutils-2.37 | 1 
           janus-gateway-1.0.3 | 1 
               libvorbis-1.3.7 | 1 
               lpc32xxcdl-2.11 | 1 
          lttng-modules-2.13.1 | 1 
                  mender-3.4.0 | 1 
                    qemu-7.1.0 | 1 
                      rauc-1.8 | 1 


Detail of failures for 2022.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           efivar-38            | NOK | http://autobuild.buildroot.net/results/fc15df0450babf29414d7e0ffc99eff448a891fd |     
   mipsel    |         fdk-aac-2.0.2          | NOK | http://autobuild.buildroot.net/results/b60c706ec3e45c61121ea5c43b96de9e7a203dff |     
    arc      |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/a282c5d458f1646d1180c159f79a11475ddf8a2e |     
   arceb     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/e485cf1b4452d1b7d2d9ec799d2c3cc4db2176dd |     
 powerpc64   |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/247e3c486c7b833545ba06623adb6fa2d2b2af49 | ORPH
  mips64el   | hawktracer-2ec19d7192334414... | NOK | http://autobuild.buildroot.net/results/4f29df86fb21c6812960b44250e0a752c2848492 |     
   mipsel    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/0863cdf354e9ba55a47b18c5560eb8327fcf965e |     
 aarch64_be  |      janus-gateway-1.0.3       | NOK | http://autobuild.buildroot.net/results/bcfb4e5b59a53be237ac3a5060f47179d3040532 |     
  powerpc    |        libvorbis-1.3.7         | NOK | http://autobuild.buildroot.net/results/b21f42543575c82cb42a47f99530e04a626f4a9a |     
   armeb     |        lpc32xxcdl-2.11         | NOK | http://autobuild.buildroot.net/results/c5b25a89447a078da003987c271346074412da12 | ORPH
    or1k     |      lttng-modules-2.13.1      | NOK | http://autobuild.buildroot.net/results/4c19083735070eb3c16f160ed1cb599a81c46a79 |     
   s390x     |          mender-3.4.0          | NOK | http://autobuild.buildroot.net/results/6cb111afdbf1f711ba16af5403556b19a0c772f4 |     
  aarch64    |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/4836b72161e14b73165ad8c1ba08d9c09ca621fb |     
  aarch64    |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/a50f3eb6463e0ebc141f6f2c4e1f00cd7e5a1d3b |     
   mipsel    |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/ac0bd4f2c1c795c86a5757d5af08cda3fcf8fe07 |     
  riscv32    |           qemu-7.1.0           | NOK | http://autobuild.buildroot.net/results/d61681a1760ccef534d4a7c41e96cef3d89e9fad |     
  powerpc    |            rauc-1.8            | NOK | http://autobuild.buildroot.net/results/da171c2a14700f21980f72a231986af966db20fc |     
   armeb     |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/f12e1cf38ab29f46be593cee365e55fef9d9227d | ORPH
   mipsel    |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/dbf3919a595e18415e658f34e3af56932b5129b3 | ORPH



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
