Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CD2AC32771
	for <buildroot@archiver.kernel.org>; Wed, 28 Sep 2022 09:03:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 205D760B70;
	Wed, 28 Sep 2022 09:03:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 205D760B70
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nKLSAg8AOnjN; Wed, 28 Sep 2022 09:03:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14B41605B2;
	Wed, 28 Sep 2022 09:03:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 14B41605B2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1AD2D1BF831
 for <buildroot@lists.busybox.net>; Wed, 28 Sep 2022 09:03:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BBF264022C
 for <buildroot@lists.busybox.net>; Wed, 28 Sep 2022 09:03:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BBF264022C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y6C4M42utfni for <buildroot@lists.busybox.net>;
 Wed, 28 Sep 2022 09:03:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB8A340286
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AB8A340286
 for <buildroot@buildroot.org>; Wed, 28 Sep 2022 09:03:20 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id CEE561C0006
 for <buildroot@buildroot.org>; Wed, 28 Sep 2022 09:03:17 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 28 Sep 2022 09:03:17 -0000
Message-Id: <20220928090323.BBF264022C@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1664355798; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rzZIWo/eZuOCOAF9MP3hFE+8hyJCBP0m/UryzdcO9Tc=;
 b=EunxBwHafgD7rvsMszz0c3QwwI7mkGyq+18PN9ocRCeyRw15Pkf+xpyGx2wcvxaG4jqKsK
 NsnZykgQGi7NYiwYLSHBHdHTHjOpNzStabJHM9i6xi2XmIabOzz55DDwJjU8d8kDxRJDhJ
 /nSbUdlgsvWzHJwuVeOSYqR79VPZVFZfoMbeVnzG5NRYhGZkKJjK4OW4fNGkNwufywJQvy
 ohK3V2kRmogrUJfCz+Odn3z/5SChJT2jq13wa7RuLP2VvxEv3PQEEO/DypCsGGQfg/m6y5
 QskzHDJ/gt9aWaVlPbFB/lG2FOld8tyxmRJTZDqsi13CNZy5+MEs6JE8mD8dpw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=EunxBwHa
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-09-27
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

Autobuild statistics for 2022-09-27
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  | 16  |  1  |  0  | 17  |
  2022.05.x  | 27  | 16  |  0  | 43  |
    master   | 124 | 210 |  2  | 336 |

Classification of failures by reason for master
-----------------------------------------------

                      crun-1.5 | 18
        host-sentry-cli-1.59.0 | 15
                 sysvinit-2.99 | 13
            igd2-for-linux-2.1 | 11
            host-binutils-2.38 | 10
host-pahole-73383b3a39afe86... | 10
                 systemd-250.4 | 9 
              libarchive-3.6.1 | 8 
                       unknown | 7 
                gerbera-1.10.0 | 6 
                  autofs-5.1.8 | 5 
            btrfs-progs-5.16.2 | 5 
                     efivar-37 | 4 
                host-go-1.19.1 | 4 
              host-rust-1.64.0 | 4 
             libgpg-error-1.45 | 4 
glibc-2.36-44-g2628500f5dff... | 3 
               libcap-ng-0.8.3 | 3 
                 linux-5.17.15 | 3 
                    zeek-4.1.1 | 3 
               apcupsd-3.14.14 | 2 
                    bat-0.19.0 | 2 
casync-4ad9bcb94bc83ff36cfc... | 2 
                      gdb-11.2 | 2 
host-spirv-llvm-translator-... | 2 
        ltp-testsuite-20220527 | 2 
                    lxc-4.0.12 | 2 
                mongodb-4.2.18 | 2 
              open62541-v1.3.3 | 2 
                    sdl-1.2.15 | 2 
                tealdeer-1.5.0 | 2 
                 uclibc-1.0.42 | 2 
                    brltty-6.4 | 1 
dahdi-linux-5c840cf43838e06... | 1 
                 dash-0.5.11.5 | 1 
         docker-compose-2.10.0 | 1 
        edk2-edk2-stable202102 | 1 
                elfutils-0.186 | 1 
               fftw-quad-3.3.8 | 1 
                     file-5.41 | 1 
                     frr-8.3.1 | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
              fstrcmp-0.7.D001 | 1 
         gobject-introspection | 1 
                   hdparm-9.63 | 1 
           heirloom-mailx-12.5 | 1 
            host-binutils-2.37 | 1 
            host-binutils-2.39 | 1 
         host-gcc-final-11.3.0 | 1 
            igh-ethercat-1.5.2 | 1 
               ipmitool-1_8_19 | 1 
                     libgcrypt | 1 
               libglib2-2.72.3 | 1 
                     lz4-1.9.3 | 1 
            makedumpfile-1.7.0 | 1 
                  matio-1.5.22 | 1 
                 openal-1.22.0 | 1 
                 openssh-9.0p1 | 1 
                 protobuf-21.6 | 1 
    python-cryptography-38.0.1 | 1 
          python-orjson-3.7.11 | 1 
                    qemu-7.1.0 | 1 
qt5base-2ffb7ad8a1079a0444b... | 1 
                  reaver-1.6.6 | 1 
rtl8189es-39c17661136da48f8... | 1 
rtl8821au-4235b0ec7d7220a63... | 1 
             stress-ng-0.13.05 | 1 
              syslog-ng-3.37.1 | 1 
               tcf-agent-1.7.0 | 1 
toolchain-external-codescap... | 1 
                    volk-2.5.1 | 1 
                 wavemon-0.9.4 | 1 
                wtfutil-0.41.0 | 1 
                 zlib-ng-2.0.6 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/021e6b386059883c5d220e94bc2126ff21462118 |     
   arceb     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/6d809b44e8502cc2b943676a11e032675ff4c2c0 |     
 microblaze  |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/77a736397189f26eeb2c6336532518649e9453e0 |     
   s390x     |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/30cecbf46f46324ab27157db5c0299cb94efa7a7 |     
    mips     |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/a166e527af73faf01586764673b28df4d6ae3a87 |     
   nios2     |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/df9f5404a162d23d67280261ec3e53efbffefa3b |     
   sh4eb     |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/cbd9011b017c4b9cab0e6fa2f74bdc4d2014c37c |     
   armeb     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/38537f0630f3bf003ab918674afcf7ba2036eb35 |     
    arm      |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/c900c9c47f5474827c41e63be00cd0f3f19b953a |     
 microblaze  |           brltty-6.4           | NOK | http://autobuild.buildroot.net/results/a5cb2cc229961a269ce92d8bd2878a478eff9cbe |     
   s390x     |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/55f617aaf9b24ece9ed32688890438b20fb0ae23 | ORPH
   mipsel    |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/ede486a04d3ae880ce9dec9dc04f0fe722e69914 | ORPH
microblazeel |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/73e348325d319a16b4147b29c6b0346515eeb9c1 | ORPH
    i686     |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/b6ce6fbbe47c03f5d0e036712f6282bca714907b | ORPH
  aarch64    |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/f67c4d101feb5aea3fabee9899cc1bebd353398d | ORPH
  sparc64    | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/7646fb61763a24919dccc0a79b8dce7cc21c2132 |     
  sparc64    | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/dd66ae479bcecfa761f4a61042b361daf7a9d5fc |     
    arm      |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/b4eb2354425443594c428912a99ab3deeb10dda2 |     
  riscv32    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/d560d82be73d8d16a5ffadcfc564e5c268276992 |     
   mipsel    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/c41e9e803af2b57e4d21c26b671726f6154321a9 |     
    arm      |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/adf73bd78b53f8c8754f8d4c088dcabd8d455f1c |     
    arc      |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/a17b18d7b06fb1dfaca58fe4791626beecd5eeb7 |     
    arc      |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/dbaf9cf4df2970a8ad22510b58639d9fa7971050 |     
   armeb     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/7140fdc6b0ef5706ff8d63f12c08169e84900b63 |     
   xtensa    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/e2ba624a008c146bed5622ae49c5a991d79ad6fe |     
  aarch64    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/7ef4589924fb057e1f0c38f1ebbfe088d1d16ab5 |     
microblazeel |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/760ce98bff610754faab30d940af4fec48415ccb |     
    mips     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/944a5ab91892b40b5cf7d8a21546d8231b21d75b |     
    arc      |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/abe53c907080025c327880bc68943d17974357e0 |     
   mips64    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/710c6d3dcf677ffe6175118188a52137ee9c1db0 |     
  riscv32    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/eac4fe6034840aa8fc13e7d10b59c48eae49e9e9 |     
  aarch64    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/085c7144f06e90ac8b56a1a5301dd55c98e771cc |     
  riscv64    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/9c82bb1e4720e27dd0375cb9d56862f3554020b1 |     
   armeb     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/2a4fdf9e91c81f1894570d60b05fc673b0de2bc7 |     
    mips     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/9ad2854334ac4fe2459fcf8113f084e588432181 |     
    i686     | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/813b28b11d8d596c1549e74deed804a95d36ecf8 |     
 powerpc64   |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/1b73e38948d6015415e301718c592c813b2c8c24 | ORPH
powerpc64le  |     docker-compose-2.10.0      | NOK | http://autobuild.buildroot.net/results/164d8b2cda8855cbcf317deaf777378a20f00342 |     
    i686     |     edk2-edk2-stable202102     | NOK | http://autobuild.buildroot.net/results/dd97c4897a9488b458906dd166171293ba0ef6a7 |     
  mips64el   |           efivar-37            | NOK | http://autobuild.buildroot.net/results/7c95e85c9692c4fb7c36bd41938ce8272f8f2280 |     
  mips64el   |           efivar-37            | NOK | http://autobuild.buildroot.net/results/9daea60970bf3dd1ed7229d87999eb7e5d5e2748 |     
   x86_64    |           efivar-37            | NOK | http://autobuild.buildroot.net/results/5aa9e4ff4ef5c5aec52ac68133a0f29e78f2d7b0 |     
    i686     |           efivar-37            | NOK | http://autobuild.buildroot.net/results/7aeda1a64077b61a9f8ea4509056fdb6e75f56a0 |     
   arceb     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/41d56762375a047631635101b30e9063b24a54ad | ORPH
powerpc64le  |        fftw-quad-3.3.8         | NOK | http://autobuild.buildroot.net/results/722558fd9af42394394c2475eeef069e0b30c020 | ORPH
    mips     |           file-5.41            | NOK | http://autobuild.buildroot.net/results/86f57dacf28800135d471319b672e2ea35e6ade2 | ORPH
  mips64el   |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/05f4e63bbe3dfff58588feda1eba04158b16b627 |     
   armeb     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/60f8969500e744e89b27f53d2eb2a37cc28ea289 |     
    arc      | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/56db2463c3ed3bc7824a475fab9929295a61353f |     
   armeb     |        fstrcmp-0.7.D001        | NOK | http://autobuild.buildroot.net/results/f2427113d10ce9d0bb7bbf3bd5713ceb10dde3b9 |     
   mipsel    |            gdb-11.2            | NOK | http://autobuild.buildroot.net/results/b21e79dc29c8f11891c50c6cfd9e53d2ac903d52 | ORPH
    arm      |            gdb-11.2            | NOK | http://autobuild.buildroot.net/results/20e17dd7755baa2e4821340453cbef7f7d42aadf | ORPH
    or1k     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/61f01da48691d3a69a47a9279274cc9c7f17575b |     
    arm      |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/57ac87f03f0642aa0b6f6a6e072b254003c6624e |     
  sparc64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/44ce51d342d14c567d62ff615bfb3acecf148b5d |     
    sh4      |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/e62733767b0e9382c127cbfb510ea46054fd788c |     
  riscv64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/058510fba8822550dd1dcc3c2d0297342767f7c1 |     
  sparc64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/55fd74ad78f7058803968f300ffe13425afab9d8 |     
    or1k     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/35e47ffc5b66db35b0b7f09b6e6d91871ba69cf3 |     
microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/aa8b7af3d8787586902d10b25033fb5256bcef63 |     
    or1k     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/8b52d511f9fea24a122c909584f6fd38906f67fb |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/ca278b1adda5682c6546319fdcba93a9ebf3fac9 |     
   mips64    |          hdparm-9.63           | NOK | http://autobuild.buildroot.net/results/dc9911b22cb1b49c0ae1fdce7e26e0125d38b431 |     
    sh4a     |      heirloom-mailx-12.5       | NOK | http://autobuild.buildroot.net/results/8a89eae847701271242f3bb4947394531082bb2a |     
    i686     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/74cc977423bd6a7a08521365f040eae628d27933 |     
   s390x     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/279517d1b1209b55e64f45c6a0b5957b68f7a26d |     
 powerpc64   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/fe0481587b86f1bb2ff2be2cfe0842d2807ae758 |     
    sh4      |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/b691be858cb45f08f0d135007c04b333f409ad3e |     
    i586     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/40199c69410b01ce737145b6fb2d7c5f7ac072dd |     
   s390x     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/41843f2c0a3e4b58b396083e624afcbc12903047 |     
   x86_64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/aa699194ced4e1214971c773cee5edfba83cf05f |     
   mips64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/fb371d1c3e63fe13beb758a90f05aeda76dd9dce |     
   x86_64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/643e3b7aee88da394f22ba5cf8795ef4ac057db3 |     
   xtensa    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/fb65bae4bc2a20d2ce84c1f73e55c17cff56f8d6 |     
   s390x     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/9a4f0b219cbfa9a85e313114915c5b6df0fcbf79 |     
   sh4aeb    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/db7e141f2399818d0266c782bdb2e3709bd6a52a |     
   s390x     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/adef0a439aa502fd7e878d54d680b4fa065baa5d |     
  mips64el   |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/149b8dc4cb4269e98601c055dfa8354635aa6525 |     
   mips64    |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/aafac1dda4c03baa897cf876697088964e2aa12f |     
    i686     |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/cd478d11cf944decd0fe32bca1006e420024f718 |     
  mips64el   |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/eaf3ce9e4bf60d897a407a307acb54858c06428a |     
   sh4aeb    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/884154157447fc5d8e1ce09dd0ba2b85d23df17a |     
 aarch64_be  | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/6d2d224bcde6e0460dc5bd8935b95b70d6c7b0e1 |     
   mipsel    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/636283a7abc979c60f00c5e21807b824b734c13b |     
 aarch64_be  | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/64003ecef4eb15ac187739fe5fd57ea79581f8e2 |     
   x86_64    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/4abcaf51701a92c2701d8196570884f90755c546 |     
   armeb     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/3bbd5253fea82a5fabd6a2fdf00ea3d2df8c2f04 |     
 microblaze  | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/23e1cc64fc59eab65cbb8a15b6a9aabab2f88f5d |     
   mips64    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/d1803e5a297fbe799fba5217797bbcf72c1b53fe |     
    mips     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/1d6f311612320a6c8e9ce71575cebdf7a606645a |     
powerpc64le  | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/84cf078ebf99e26864bb5b4369b6049885ff074f |     
  sparc64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/32bff9e38a95aeb8d511626cc6c1cff07462bddd |     
powerpc64le  |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/48218aa5fe5bcd05e348da6f46410ecff447887f |     
  aarch64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/c703eacdad221458dd200b8000c614437ff42b97 |     
   x86_64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/9b0c2834e0aa3cffab9c04f9165aada46b1bbc77 |     
   arceb     |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/238e8ebefd8286889d3fe19a95e9f045876f8747 |     
   x86_64    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/9f3ad202249d9b69a96871f2c8bdc9f6ca395899 |     
   armeb     |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/cb2a8a10195acad9f6f5b04213e4e69d5a58e7c6 |     
  mips64el   |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/7ae37b2f7109232f42765023023939a6e6f38d53 |     
   x86_64    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/713d50b155fd08481d48c7ca85c4b18b902b71fb |     
   s390x     |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/e7850561ebf5ac0098c9af8858efefe02699dc9f |     
  mips64el   |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/6c2f29cf171430ad5557ccc3fecc127999fcfe68 |     
   xtensa    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/65c772de4a9da510df9cb48c7b0903e0341398f3 |     
    arc      |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/722f9d77215b4155f7bd9a763b377cd1605d47f8 |     
    i586     |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/feafb7066ea486fae4518beca628370e00344717 |     
    arm      |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/9c46665fa9901c97d5568edb96f7e3d2d771a554 |     
    i686     |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/a88aeebfba3cc5ba51040ef633e6f894cb0b2a76 |     
  sparc64    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/0675bfc6b9f6403377ce8caa512fdeb6c04417d4 |     
    m68k     |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/4b8048d5e74f60e2aa4217ef6ed6a07fb1224ca3 |     
  aarch64    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/d15acbf9792adef8756e1dbd8c6ff23d960d371b |     
    arm      | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/1f5dd0ded1ae444af49cc8a5f962a1ae7cb401f2 | ORPH
   x86_64    | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/1192a7d52d92aa694e5251a85488b451934950fa | ORPH
  sparc64    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/65859b1d8bc9fa098eb90442c09145fbdbb0e7b3 |     
   xtensa    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/92ff5dcaa240abbb0dde8c161d79ab113fb86783 |     
powerpc64le  |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/fbf19c5369a3c2cae325724dd7109839b22345b9 |     
    sh4a     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/f67bbda780b7bc92c64dc6cc3e715e6b74bed7c9 |     
   x86_64    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/cd7261c1129e02dd8932020212ea6e94660df9e3 |     
    m68k     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/746e609d3523f4968ca890f78e331201b0d66f2c |     
 powerpc64   |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/30e04081f0fe2fa0a81b4e4d174b46d7703ecb7b |     
 microblaze  |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/56cce4b9b9ba36087236aca2a4b45eb198e67edb |     
    sh4      |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/bc24ea21e1f7f715df8bee1851e7eb691a7791e5 |     
powerpc64le  |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/5bc794a26cb7caeed90f0dce1d1a1cdf3c91e12a |     
    mips     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/9374764e160279a21a7faf9438abff09729b283c |     
    arc      |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/120fa7f4510c9f8f40ef9203ac0d0898f5c82b32 |     
    or1k     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/34f8deb303949edc7bc833d40f196c807c00cac3 |     
    i686     |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/73d09759eb5d08153dad3cc639ee37e3e47e4812 |     
   s390x     |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/a9896d645b851ff43577f1b4fb9a869eacd1b7f8 |     
  mips64el   |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/328583ecb05da4095de062a54f6481e4db58cd67 |     
   nios2     |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/f45383d8ff37d6242d860e5db636f08d8b31ea89 |     
    or1k     |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/164e85509754d5efa48f1449bb4635a6f9f19748 |     
 microblaze  |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/cdacb1513ada274b80326d165fbc94fc523c6cc4 |     
    arc      |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/92c4bdf054d3de3939a1a95bf3721c14fccd4d55 |     
    arc      |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/7dadfc6bcb684d85e6cfce5bf0269124879b9352 |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/784622b7380cbcc17a6daa5750897fd6a4a2f65b |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/44f8f488f5382b55edd552012e2cc9295aaf150f |     
    or1k     |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/df59d739b66645404436680c7c795756ca9d2170 |     
   armeb     |           libgcrypt            | TIM | http://autobuild.buildroot.net/results/d452f78c10b59ea11b1b30c53448162ad5f9aa89 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/e188a3721e8d93ddfb6f0de250c18d8d09ef2b62 |     
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/3438964f6fcb6fe984360d130972bab24d291011 | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/d943b8ec32b427c325284b7d323e83f3c02d9b1a | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/2a910132175fe5c1ee8d29773f376a0ae63b83f1 | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/1772e08d55b5b8274e9fe4af5dd0b3c731021e52 | ORPH
   sparc     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/687f8f4c4df28335175e6f7e34436af7033d2048 | ORPH
    sh4a     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/47658f6cba9f2ecf21a0dde61c704c9a8706c39c | ORPH
  powerpc    |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/856b591ea74454135c8674a81e4c291694e88839 | ORPH
    arc      |     ltp-testsuite-20220527     | NOK | http://autobuild.buildroot.net/results/bb3050f4ed5973e3ad3f89c4346ed4db69fbefd0 |     
   sh4aeb    |     ltp-testsuite-20220527     | NOK | http://autobuild.buildroot.net/results/c8804629a6219ccc310d2d77fc329effd71ec957 |     
 powerpc64   |           lxc-4.0.12           | NOK | http://autobuild.buildroot.net/results/7a0c4836e20bbf2acef1571a9d422c1e79c22d14 |     
   s390x     |           lxc-4.0.12           | NOK | http://autobuild.buildroot.net/results/f18164d6cc6e73d06c726edf39e81a4047337fd5 |     
 microblaze  |           lz4-1.9.3            | NOK | http://autobuild.buildroot.net/results/9325f5b2f40ca2fa62183af6c54207e333df2cdc | ORPH
  mips64el   |       makedumpfile-1.7.0       | NOK | http://autobuild.buildroot.net/results/1c35c10769917c4690a2018340fb1b508c4d6cde |     
   nios2     |          matio-1.5.22          | NOK | http://autobuild.buildroot.net/results/49d77d1272c26ded17373413e057a1b5e6abbafe |     
  aarch64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/269a03d2956b086d3316345090d39445ee9758f0 |     
    arm      |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/bce5d0ed3bd7bc6235b9573330ccf668bb540dcc |     
   armeb     |        open62541-v1.3.3        | NOK | http://autobuild.buildroot.net/results/62a8f040774e95625c53c84a3bcaaeaeebdecab2 | ORPH
    mips     |        open62541-v1.3.3        | NOK | http://autobuild.buildroot.net/results/220525f945fba5219d6e9b6736b8da9d1333170d | ORPH
   mipsel    |         openal-1.22.0          | NOK | http://autobuild.buildroot.net/results/e9e29612799ede1463ceba0cc251e4e2109fa92e |     
    m68k     |         openssh-9.0p1          | NOK | http://autobuild.buildroot.net/results/d81017bb4f720421b2015de89db615840a1bd127 | ORPH
    m68k     |         protobuf-21.6          | NOK | http://autobuild.buildroot.net/results/3757a64ea020aef1573c916403992004bf32776e |     
   armeb     |   python-cryptography-38.0.1   | NOK | http://autobuild.buildroot.net/results/f6f2302491a68b5d5cac9ab8d7affa35fef65447 |     
    mips     |      python-orjson-3.7.11      | NOK | http://autobuild.buildroot.net/results/7244cd1b3b9e672caeda9e2253375a1deb7d2d84 |     
  riscv32    |           qemu-7.1.0           | NOK | http://autobuild.buildroot.net/results/b824b22cbb8eceda062629bb298d29a9ad35419b |     
    mips     | qt5base-2ffb7ad8a1079a0444b... | NOK | http://autobuild.buildroot.net/results/a956b48b782dbaa055d7146360465e2493a809d9 |     
   arceb     |          reaver-1.6.6          | NOK | http://autobuild.buildroot.net/results/d1c8bd9dd6358c16af7316ca552404903072ea46 |     
   armeb     | rtl8189es-39c17661136da48f8... | NOK | http://autobuild.buildroot.net/results/3bcad5e88876c86a2a3338961ed20f28b5953779 |     
   xtensa    | rtl8821au-4235b0ec7d7220a63... | NOK | http://autobuild.buildroot.net/results/a3db3a6540b67a1f1fe31d61fe1d6824d43f59f0 |     
    sh4      |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/20d84543c9cf582dea3a7998c6082312c2843662 | ORPH
    sh4      |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/47ffeca06509f356f05388804824663103624b48 | ORPH
 microblaze  |       stress-ng-0.13.05        | NOK | http://autobuild.buildroot.net/results/58362d162eb024ce8df5f40d1477e9a58caecd5d |     
   sparc     |        syslog-ng-3.37.1        | NOK | http://autobuild.buildroot.net/results/1208b973fb1be6faba42a9dff59452b2c0c4a3bc |     
   s390x     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/14388d829888b637cf21bd739fa37f483d165c92 |     
  sparc64    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/5c71b9331f6904fe53baa40d6e2b280269369fe4 |     
  aarch64    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/a0bb2ad2333a31c1a81b8dd0ed9850e007a3d911 |     
  mips64el   |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/031d89dc29e6dd4bf847ac3f7cd15c9d49de52ba |     
  aarch64    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/a855adcf2264c653adbd8e83f1f4b3b8e7d3bdf7 |     
 aarch64_be  |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/4da953be1286465f97d4b14d9af9e560bb6777a6 |     
   sh4aeb    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/f9ba77f50930bf7fde9e6620d12e6462263474f5 |     
  mips64el   |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/ebe69db65bf72aa72a482cb3df95625350b6e9a4 |     
 aarch64_be  |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/f97bcfd6aecc9eb205200aa63becdd003309149a |     
  sparc64    |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/f18019894becefc07878c600398d9eeff4734459 | ORPH
  aarch64    |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/194ed10a623611191c6db96fe68aa180b94d4815 | ORPH
   s390x     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/63bb60b1be497f03b116e9c1f8e559114efb5c79 | ORPH
 microblaze  |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/db3cb345963fec31e511bcc337714d8ec13a20db | ORPH
   s390x     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/359dc2aa44828be7a977d982b7204b0ebc12b5ec | ORPH
   armeb     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/f28958b8a0dd8b311a6816a51a4aa93b19e1b1f9 | ORPH
 aarch64_be  |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/8e04fc58e8f6e3337aefea29b23f9196a8742e06 | ORPH
   mips64    |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/cbaad0f670e4c361361fb9cc496c479b922119d1 | ORPH
   sh4eb     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/83654dc967a1ece0a9b03c061d9e2ae64a1a950e | ORPH
  sparc64    |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/99685f8185ab27cb7b9f3234befb5edd1d4dcebb | ORPH
    mips     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/f81956fdc22deda95a927c9d8f427719852d4f61 | ORPH
   armeb     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/8e2a0e5570fa351a935c5eef2df09c542f680dcb | ORPH
   nios2     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/46720ddfe3ae50c18d4f4a4898a4a22e8f560593 | ORPH
 microblaze  |        tcf-agent-1.7.0         | NOK | http://autobuild.buildroot.net/results/28ad814be5b10a81a2d22a221baad88e3330ab18 |     
 powerpc64   |         tealdeer-1.5.0         | NOK | http://autobuild.buildroot.net/results/47865d5ae2bad26de3bb684c63adf542087490e6 |     
 powerpc64   |         tealdeer-1.5.0         | NOK | http://autobuild.buildroot.net/results/95b6c0241930e269156692dc171bbcfe23d8dfe7 |     
    mips     | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/a3a1b1a08d84266214b3caa6adcbe3ac7818e673 | ORPH
  riscv64    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/4028ffd538fea215bcc7cdf4b2f02a2b377a6d7f |     
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/55e7163dcdd9582fe302229c5923852779c9a617 |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/f9b0e11996a6eb6efee80b7c2ca51e6fe0a65690 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/32f6af73bb4228c6c014d6e05dd36c4f2378fe8f |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/456818ae611203163dbb3d7afb989a7026eb28bc |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/404431f4b7363c82ae245ea0146b37cbcf981e32 |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/052528379242c4f6aa006097cd5a50adf0c30f25 |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.net/results/c8c840c909e4a3e90339a14de46c6fcab46df1fc |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/0384adaf61e480eefc5d8a372a7fd216df0e99a7 |     
    mips     |           volk-2.5.1           | NOK | http://autobuild.buildroot.net/results/2ec8ff3c81433dc3c68dd610c6870c0c5dfd324a |     
    arm      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/9ece9daf85312a2cbf9bbd2ef176e94fb65d6ee8 |     
   x86_64    |         wtfutil-0.41.0         | NOK | http://autobuild.buildroot.net/results/02cb8f60600899c29d92fcb6fe7198865e00fcd1 |     
   x86_64    |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/bab6be282a16bccad944a76a85746db44a1ff8b1 |     
    m68k     |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/68932b59aa95af06645e86e5ba65e54e9eb79c0f |     
 aarch64_be  |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/46886942a6ab1e686ae7377f4a23761d9309172f |     
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/932f401eceb69b21018a5d746a061960c9be3d54 | ORPH


Classification of failures by reason for 2022.02.x
--------------------------------------------------

         graphicsmagick-1.3.37 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |     graphicsmagick-1.3.37      | NOK | http://autobuild.buildroot.net/results/220c100dde49cec34a9a147d8f0cf331001ed1fa |     


Classification of failures by reason for 2022.05.x
--------------------------------------------------

         graphicsmagick-1.3.37 | 3 
               protobuf-3.20.1 | 2 
                 uclibc-1.0.41 | 2 
           docker-cli-20.10.18 | 1 
                  ffmpeg-4.4.2 | 1 
          host-gcc-final-9.4.0 | 1 
host-pahole-73383b3a39afe86... | 1 
             libopenssl-1.1.1q | 1 
                 linux-5.17.15 | 1 
make: *** wait: No child pr... | 1 
               openpgm-5-3-128 | 1 
                    qemu-7.0.0 | 1 


Detail of failures for 2022.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |      docker-cli-20.10.18       | NOK | http://autobuild.buildroot.net/results/485f9f9e3ab17fb05daa8801e32efc8cc31306a1 |     
  mips64el   |          ffmpeg-4.4.2          | NOK | http://autobuild.buildroot.net/results/955064fc109ddcf4a15b4bf4aefab09bf8e440c1 |     
    m68k     |     graphicsmagick-1.3.37      | NOK | http://autobuild.buildroot.net/results/1c77de03540929a47c878cc67a01186cb197c250 |     
    arc      |     graphicsmagick-1.3.37      | NOK | http://autobuild.buildroot.net/results/9d37176a866f4dce71fca2d8de98cbef0c8087e6 |     
    i586     |     graphicsmagick-1.3.37      | NOK | http://autobuild.buildroot.net/results/b2b49146c56d128306abab6a241132098345b5c0 |     
   x86_64    |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/7bc774ea83af265f327d76e00db26c821f131c76 |     
   xtensa    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/8ef3ab7b6572f0d983dcf33d398eb52a9b92436a |     
    m68k     |       libopenssl-1.1.1q        | NOK | http://autobuild.buildroot.net/results/8f998d02f9ddd0d817e5a92de9ce7a67d344e5b1 |     
    m68k     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/f39cbc9458fe8fb3be3a87eba90d432fd825dff6 | ORPH
    arc      | make: *** wait: No child pr... | NOK | http://autobuild.buildroot.net/results/63976883b288fdc2a85e83b4b7438302e4e38c2d |     
 powerpc64   |        openpgm-5-3-128         | NOK | http://autobuild.buildroot.net/results/d402b9f5e8694b50563d98c98431d45674c16c06 |     
    sh4      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/51b8d4a4e9a82d64a78406febfc86367d07539dd |     
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/376fe217b043e41e7120d316d3f42fc1a9bd49d9 |     
   mipsel    |           qemu-7.0.0           | NOK | http://autobuild.buildroot.net/results/ad7ea5a46e86adcd38a83af468fb1cbb93c455eb |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/137ec1f9240d2a9ae6e48e7175ecc7a2387595f6 |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/73230aec433c89ba2a06022e1ffb8791ab2d5010 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

