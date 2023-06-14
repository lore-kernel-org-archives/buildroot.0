Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E5D5EB64D8
	for <buildroot@archiver.kernel.org>; Wed, 14 Jun 2023 04:41:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 944E840120;
	Wed, 14 Jun 2023 04:41:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 944E840120
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ztgH_-Kl7MrZ; Wed, 14 Jun 2023 04:41:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EF1A3404DA;
	Wed, 14 Jun 2023 04:41:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EF1A3404DA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 202421BF328
 for <buildroot@lists.busybox.net>; Wed, 14 Jun 2023 04:41:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E9AFB404DA
 for <buildroot@lists.busybox.net>; Wed, 14 Jun 2023 04:41:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E9AFB404DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b8Tft_B76-z9 for <buildroot@lists.busybox.net>;
 Wed, 14 Jun 2023 04:41:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 76C0B40120
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 76C0B40120
 for <buildroot@buildroot.org>; Wed, 14 Jun 2023 04:41:18 +0000 (UTC)
X-GND-Sasl: thomas.petazzoni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9F9A9E0006
 for <buildroot@buildroot.org>; Wed, 14 Jun 2023 04:41:15 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Wed, 14 Jun 2023 04:41:15 -0000
Message-Id: <20230614044120.E9AFB404DA@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1686717675; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=8OsraBnME/gM58Kb6i3JdiWTIADzyp3BOtwQmmFBJOw=;
 b=LcTPOWzEk9+i13A3KVyhdOJwHdRY+L5GPWxNO/Lvn+wOP5B0Dep2JGXOtMkDSdLq2Sw0fx
 JX8A+kueQKVj319SJYdNYEWxfd9wqGVMcL4mO1NSVRda6W1P9TWHgy/BZ0mFe7fXM+5TIA
 d7jy/xRwao3Khb7EaqoEcBVBdWRFZqmbPJgr5ad1vmqB9Qw+m/t8ovMMHnY8kDyNo08MRc
 H6fDfgoUe7rkZMqOQW03EEvKjZPqJgzMn0ZV3UadDtac8WVVq5RDmTnMrQqY3YguOIhTO+
 sshbxaQo7KnBuLfJMTGg7tAqa8ZiWXSSKz1do2IjpGvkNbyQTtw+mtGnpHA/5w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LcTPOWzE
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-06-13
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

Autobuild statistics for 2023-06-13
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  0  |  2  |  0  |  2  |
    master   | 67  | 65  |  0  | 132 |

Classification of failures by reason for master
-----------------------------------------------

   host-bootgen-xilinx_v2023.1 | 8 
                    strace-6.3 | 7 
  gobject-introspection-1.74.0 | 4 
              host-rust-1.68.2 | 3 
                   linux-6.3.6 | 3 
                    qemu-8.0.0 | 3 
                     audit-3.1 | 2 
glibc-2.37-2-g9f8513dc64119... | 2 
            host-binutils-2.37 | 2 
            host-binutils-2.38 | 2 
               host-go-1.19.10 | 2 
              libgcrypt-1.10.1 | 2 
               nfs-utils-2.6.3 | 2 
                    sdl-1.2.15 | 2 
                   shadow-4.13 | 2 
               apcupsd-3.14.14 | 1 
                  cmocka-1.1.5 | 1 
                elfutils-0.186 | 1 
                 enchant-2.3.3 | 1 
                     frr-8.4.2 | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
                haveged-1.9.18 | 1 
            host-binutils-2.39 | 1 
                       kmod-30 | 1 
              libsodium-1.0.18 | 1 
                    musl-1.2.3 | 1 
                  ntp-4.2.8p15 | 1 
            ocf-linux-20171122 | 1 
            quickjs-2021-03-27 | 1 
                   trinity-1.9 | 1 
                 wolfssl-5.5.3 | 1 
                xapp_xfd-1.1.4 | 1 
                     xterm-376 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   arceb     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/36eb115d23dcaefa38773498f9d3b608b9360dab |     
   x86_64    |           audit-3.1            | NOK | http://autobuild.buildroot.net/results/50def414ad85ef8a716d1253c5b760eafad22d9f |     
   x86_64    |           audit-3.1            | NOK | http://autobuild.buildroot.net/results/77014a640a55e0c5f0c33841ca4b4f354b8884cb |     
   armeb     |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/e0e4c44267fb4283692b533854d55a608a841e73 |     
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/09cd9ddb141b07c1d418768e7f54e4de79a5220e | ORPH
   sparc     |         enchant-2.3.3          | NOK | http://autobuild.buildroot.net/results/eaed07cabeeaf91285f6919ad00445f73244792e |     
   arceb     |           frr-8.4.2            | NOK | http://autobuild.buildroot.net/results/4c31108d65e8a9c28d4a1e70e4b24cb2b29623b4 |     
   arceb     | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/189336390d29e91537379f74119c7ee34c23c7bc |     
  sparc64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/b7ce5b063fdcb339ab892eb7cac8c1627ff28e3d |     
  powerpc    | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/ccbda713c71dc503baa68876f2e3852c86903157 |     
  powerpc    | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/f36f909b770036c80d43e0fe0511dd5f4a698903 |     
  sparc64    |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/e56a7ab8af8b0480eaaa3f0cb020fb129447ccd4 | ORPH
  sparc64    |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/c1658bcab468056c337e2c2a8aa279373674b2c6 | ORPH
   nios2     |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/0c43d96a1978ffd195649d7ad8eca108abb1923d | ORPH
   mipsel    |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/fffff9186b392fa56bea4b68801de6d2811498b9 | ORPH
  mips64el   |         haveged-1.9.18         | NOK | http://autobuild.buildroot.net/results/7eef0e2a668fa49b720207257ac8a33c0cd20728 |     
   s390x     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/fc5611a3d49b7d0d13e94ea10ad72bd932bcef96 |     
   mipsel    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/c1fd0b0e47ed93d101480d7724c6d896b2b16354 |     
    m68k     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/1c5682224bd4db531c2a8480f2a85f764c690cfe |     
  riscv32    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/42fb91d9a04792c1579ecf2bcaa1d3bfb9b620d4 |     
   nios2     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/3d6958aed921f6bd7c47a9b5b97711e23d9f673e |     
  powerpc    |  host-bootgen-xilinx_v2023.1   | NOK | http://autobuild.buildroot.net/results/9708080f672101d29d5856fd3d5fcfe36fe9107d |     
   s390x     |  host-bootgen-xilinx_v2023.1   | NOK | http://autobuild.buildroot.net/results/2cb4bb849c9a23a81f6a4643c18c15984d57320e |     
  sparc64    |  host-bootgen-xilinx_v2023.1   | NOK | http://autobuild.buildroot.net/results/41f6dd2e4110b619c466a5d21e1f05f286cfb0b2 |     
    sh4a     |  host-bootgen-xilinx_v2023.1   | NOK | http://autobuild.buildroot.net/results/92085e6fc278497b277e0da39887bd916488a60f |     
  aarch64    |  host-bootgen-xilinx_v2023.1   | NOK | http://autobuild.buildroot.net/results/f397fc349ce9db50bc5634cb5bd745b18c5a962b |     
    sh4a     |  host-bootgen-xilinx_v2023.1   | NOK | http://autobuild.buildroot.net/results/7381f3127c45fee325c96b3b5b9a18206d24bfff |     
 microblaze  |  host-bootgen-xilinx_v2023.1   | NOK | http://autobuild.buildroot.net/results/47a64b7d8be01da6f291504385b5dde5e004b299 |     
 aarch64_be  |  host-bootgen-xilinx_v2023.1   | NOK | http://autobuild.buildroot.net/results/1cb0a561d1d110530c25225d816bc202ae171b97 |     
  mips64el   |        host-go-1.19.10         | NOK | http://autobuild.buildroot.net/results/15da80f1eae5830b4046dc0e87d4efa59055e054 |     
  mips64el   |        host-go-1.19.10         | NOK | http://autobuild.buildroot.net/results/90dca6847b52e2559e11044f6ef9370031c7da54 |     
    i686     |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/0463d708125545107a800528496f0f39967c8950 |     
   s390x     |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/2a07a735cb86605f14894e80467329ede6b11c1b |     
  powerpc    |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/376f007efc0afd48230ffae74fb0ce8015920f7b |     
   mips64    |            kmod-30             | NOK | http://autobuild.buildroot.net/results/b4abcd527a0a7ca06b1ed8a8f45ddbce4df0b33d |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/8f89820109cac49820a7e88c2e04ae931329e2c0 | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/1d2a74d49b1dc5f7fb69621229958ab8f557ce71 | ORPH
   arceb     |        libsodium-1.0.18        | NOK | http://autobuild.buildroot.net/results/a4aab24b71bfbd3cf2ef40f916cbf17876502ea3 |     
powerpc64le  |          linux-6.3.6           | NOK | http://autobuild.buildroot.net/results/e301552050fd0ac39a0ccb78834f2cd8c34c53de | ORPH
   mipsel    |          linux-6.3.6           | NOK | http://autobuild.buildroot.net/results/b2e955c2ad086a65d89a0d2d9b3dea728aeb7469 | ORPH
  mips64el   |          linux-6.3.6           | NOK | http://autobuild.buildroot.net/results/159f88848647b3fa731c40b686519df250c83ae9 | ORPH
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/323b22a2ec4deea4b4335188b1ef96ff081e735a |     
    m68k     |        nfs-utils-2.6.3         | NOK | http://autobuild.buildroot.net/results/c912f6c927ccd3f0a5ab3c39a6309a04d1ac434e |     
   sparc     |        nfs-utils-2.6.3         | NOK | http://autobuild.buildroot.net/results/e8c4b4c4788e0ccd75f69b32e799177d9b95db44 |     
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/c0cf9d29ca38f598a737dd666cd965ac2ef9741b | ORPH
 microblaze  |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/df553c76c76186c7a5467893e8b18d70d59b2ba7 | ORPH
   mipsel    |           qemu-8.0.0           | NOK | http://autobuild.buildroot.net/results/287b4e8e77914a6181cab2b632b7e3412c3b781b |     
powerpc64le  |           qemu-8.0.0           | NOK | http://autobuild.buildroot.net/results/e444a02b899d325a9d99daed96b8cb96108383e7 |     
    mips     |           qemu-8.0.0           | NOK | http://autobuild.buildroot.net/results/dbdba73b0adeaeebb97da146e7df6c2cd0b48422 |     
 microblaze  |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/a58008930b6df9f122ba109bd41787b29a33fbf3 |     
   sh4eb     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/901cf3129251dd7458a2b9f99c1982d1f9a2cc5e | ORPH
    sh4      |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/d2215b0953e24436fa968e48c7e764a61b4b2ad8 | ORPH
   s390x     |          shadow-4.13           | NOK | http://autobuild.buildroot.net/results/2b15d2771f73bdf57900fd6813d82bd0eacd0520 |     
   s390x     |          shadow-4.13           | NOK | http://autobuild.buildroot.net/results/f889b6a008f6ffd9fa1095f12c08c4b5ba6299c7 |     
  mips64el   |           strace-6.3           | NOK | http://autobuild.buildroot.net/results/49b8f3a44e9e67e1b8c37f9b78ac9499a60a3712 |     
microblazeel |           strace-6.3           | NOK | http://autobuild.buildroot.net/results/b64307d82dd11fc941977acf7933892fc533d558 |     
    i686     |           strace-6.3           | NOK | http://autobuild.buildroot.net/results/5d32639960678f117b9b8ea72b702fc36cffb430 |     
   s390x     |           strace-6.3           | NOK | http://autobuild.buildroot.net/results/4b0adce4283530521f0b7ba0a626f2139005cbe6 |     
    or1k     |           strace-6.3           | NOK | http://autobuild.buildroot.net/results/dbe4989746424755bcbd674596b7a94937d95d3f |     
    or1k     |           strace-6.3           | NOK | http://autobuild.buildroot.net/results/c6d411ec18e0f0118e990e164a93df3186b09ce7 |     
   sh4aeb    |           strace-6.3           | NOK | http://autobuild.buildroot.net/results/d91a1df8c240e47b3b65439c5af6144094b742da |     
   x86_64    |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/2003d0d5dbe541157b0a6a2f43ede4c62b022044 | ORPH
    arm      |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/f27eca322f66caa6b778133484d1dcc7b5c64f65 |     
microblazeel |         xapp_xfd-1.1.4         | NOK | http://autobuild.buildroot.net/results/856b0f332b4a82a5ce308643c37a14d3c6aebcc1 |     
   sparc     |           xterm-376            | NOK | http://autobuild.buildroot.net/results/cd3f211c0c6f25b019e082b47647c37db635265f | ORPH


Classification of failures by reason for 2023.02.x
--------------------------------------------------

            host-binutils-2.38 | 1 
                    putty-0.76 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/03fe68dd5f79e86ea37398116b9336d8cb8afd36 |     
  aarch64    |           putty-0.76           | NOK | http://autobuild.buildroot.net/results/a326b0571760ba65bc43cdb9104ec5713de1c40a |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
