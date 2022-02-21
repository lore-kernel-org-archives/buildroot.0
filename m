Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5C69C433FE
	for <buildroot@archiver.kernel.org>; Mon, 21 Feb 2022 07:05:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1E43B404F9;
	Mon, 21 Feb 2022 07:05:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IThOFUPN6egF; Mon, 21 Feb 2022 07:05:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5ACA7404F0;
	Mon, 21 Feb 2022 07:05:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EA2881BF2F3
 for <buildroot@lists.busybox.net>; Mon, 21 Feb 2022 07:05:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E547A60BB1
 for <buildroot@lists.busybox.net>; Mon, 21 Feb 2022 07:05:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vm7ABWDyImzK for <buildroot@lists.busybox.net>;
 Mon, 21 Feb 2022 07:05:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::232])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F35CC60B99
 for <buildroot@buildroot.org>; Mon, 21 Feb 2022 07:05:37 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6009C20000A
 for <buildroot@buildroot.org>; Mon, 21 Feb 2022 07:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1645427134; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7rWmGHgdz5FGWYLpVZMV5XY+FF2QfYwVNVpqw5aoXIA=;
 b=c38jofdmOOHpiwyrdADc3n42k0t74/p3v0nUrcFzr0V6+mEz0l//HoIu0Jqo3Q550rJ06g
 rBEWDQo4HVa6pHwgwIN1Mud/UngqYm/ErUYzkqjj4zRWqFpSFnylBOPN19oIcXWp0cNdZ2
 IEp29fCv4lpqX2UCMP/F1LclxH9ACMuTYHwLnW3aOVrZKWfBYDhsMb/56Bn8WnHsoDqkAY
 RkJe/Dtr4NK/JWF1ktNEx9C93YttQP6g520u8JDy8SRcZIdIy9tGJ9TIy32I6wbi9QT0Ha
 /qtMboOOZQSG0aH4fNSHFjMOkXETViuqer/m+pHDJgwgxRTBpUkwTnnWHITTew==
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Mon, 21 Feb 2022 07:05:34 -0000
Message-Id: <20220221070541.E547A60BB1@smtp3.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-02-20
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

Autobuild statistics for 2022-02-20
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 47  | 50  |  0  | 97  |
  2021.11.x  | 10  | 44  |  0  | 54  |
    master   | 37  | 303 |  1  | 341 |

Classification of failures by reason for master
-----------------------------------------------

             host-cmake-3.16.9 | 46
              host-ncurses-6.1 | 46
       host-gcc-initial-10.3.0 | 20
       host-gettext-gnu-0.20.1 | 18
                host-m4-1.4.19 | 15
           host-python3-3.10.2 | 15
                       unknown | 15
           host-libselinux-3.3 | 12
              host-bison-3.8.2 | 7 
               host-flex-2.6.4 | 6 
                alsa-lib-1.2.6 | 5 
          host-binutils-2.36.1 | 5 
               acpica-20200717 | 4 
bpftool-a7f0e7f057283ae8af3... | 4 
       host-gcc-initial-11.2.0 | 4 
host-gcc-initial-arc-2020.0... | 4 
                 agentpp-4.3.1 | 3 
      host-libtextstyle-0.20.1 | 3 
               host-mpfr-4.1.0 | 3 
            host-pkgconf-1.6.3 | 3 
             libopenssl-1.1.1m | 3 
                   ncurses-6.1 | 3 
             berkeleydb-5.3.28 | 2 
             bluez5_utils-5.63 | 2 
                busybox-1.35.0 | 2 
                       frr-8.1 | 2 
               host-attr-2.5.1 | 2 
            host-autoconf-2.71 | 2 
           host-libxml2-2.9.12 | 2 
                libzlib-1.2.11 | 2 
                  acpid-2.0.33 | 1 
                 acsccid-1.1.8 | 1 
           argp-standalone-1.3 | 1 
                      atf-0.21 | 1 
                   audit-3.0.7 | 1 
                  axel-2.17.11 | 1 
                    bird-2.0.8 | 1 
                 civetweb-1.15 | 1 
                clamav-0.103.5 | 1 
                  connman-1.41 | 1 
              dieharder-3.31.1 | 1 
                elfutils-0.186 | 1 
                      gd-2.3.3 | 1 
                   gstd-0.13.0 | 1 
            host-fakeroot-1.26 | 1 
       host-gettext-tiny-0.3.2 | 1 
                host-gmp-6.2.1 | 1 
                 host-icu-70-1 | 1 
             host-libffi-3.4.2 | 1 
            host-libtool-2.4.6 | 1 
                host-mpc-1.2.1 | 1 
                host-pcre-8.45 | 1 
               host-swig-4.0.2 | 1 
        host-util-linux-2.37.3 | 1 
                 host-xz-5.2.5 | 1 
                 libiconv-1.15 | 1 
                   libnl-3.5.0 | 1 
librtlsdr-ed0317e6a58c09887... | 1 
           libsamplerate-0.1.9 | 1 
                libtirpc-1.3.2 | 1 
                 libusb-1.0.25 | 1 
                       libuwsc | 1 
               linux-pam-1.5.2 | 1 
                openjpeg-2.4.0 | 1 
               osm2pgsql-1.6.0 | 1 
               pcsc-lite-1.9.5 | 1 
               pulseview-0.4.2 | 1 
         python-greenlet-1.1.2 | 1 
    python-pygame-d61ea8eabd56 | 1 
                    ruby-3.1.0 | 1 
                  snmppp-3.4.2 | 1 
                 sqlite-3.37.2 | 1 
toolchain-external-codesour... | 1 
                 wavemon-0.9.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |        acpica-20200717         | NOK | http://autobuild.buildroot.net/results/3530201460e591148e72d68a11109ab8350eeade |     
    m68k     |        acpica-20200717         | NOK | http://autobuild.buildroot.net/results/08f8f216ca4b33eb0b10e255d45591419de9e822 |     
    arm      |        acpica-20200717         | NOK | http://autobuild.buildroot.net/results/1671322f56e65086d99ac4f314b0af5c7f0e6c3c |     
    sh4      |        acpica-20200717         | NOK | http://autobuild.buildroot.net/results/666756f2a11b55822e5755ee73ba55dff6aa6bef |     
    mips     |          acpid-2.0.33          | NOK | http://autobuild.buildroot.net/results/edfda442c3a36ce9646fc88f91c1fd022448f57a | ORPH
   x86_64    |         acsccid-1.1.8          | NOK | http://autobuild.buildroot.net/results/f8dfbf86ba69fe19279765243509d4dc37c0562c |     
  aarch64    |         agentpp-4.3.1          | NOK | http://autobuild.buildroot.net/results/8f53b3767de4b716c5dc024b5745896483fa3cc0 |     
    arc      |         agentpp-4.3.1          | NOK | http://autobuild.buildroot.net/results/2016a2b8d0a9352c7a91711daaebfcd17b11e60e |     
    i586     |         agentpp-4.3.1          | NOK | http://autobuild.buildroot.net/results/25368602e193dfa47ee7efa10f436227da2a7828 |     
  mips64el   |         alsa-lib-1.2.6         | NOK | http://autobuild.buildroot.net/results/9a248dba32248a1b134539df8bdfea58708ac0fc |     
microblazeel |         alsa-lib-1.2.6         | NOK | http://autobuild.buildroot.net/results/c4ce54e3e8a1c2647f770b02ca493fac29ea18ba |     
   x86_64    |         alsa-lib-1.2.6         | NOK | http://autobuild.buildroot.net/results/28c914e8c1a507860ced9d31d385e98430c5b1bf |     
   sparc     |         alsa-lib-1.2.6         | NOK | http://autobuild.buildroot.net/results/c85ca51d1fbbe3470bafb16b8f0859af67a445ae |     
powerpc64le  |         alsa-lib-1.2.6         | NOK | http://autobuild.buildroot.net/results/8c6b41922a5d7f6a0f4f6925f5510ff0b1991e16 |     
    i686     |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/2e071593928689257e9342c3a1acbf527a053063 |     
    arm      |            atf-0.21            | NOK | http://autobuild.buildroot.net/results/a46e3b508e95bc15a5b1f07174281a5414aebe69 | ORPH
    arm      |          audit-3.0.7           | NOK | http://autobuild.buildroot.net/results/8b19480650c923644ee0abf455ec5c2e1a133700 |     
    arm      |          axel-2.17.11          | NOK | http://autobuild.buildroot.net/results/d5ee8bcac65413b5396853e93083c7cf73ba2b32 |     
   mipsel    |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/8ba71c470bafe8b0b65cdfc5b3b06b06014477e2 | ORPH
   x86_64    |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/869ef5f0f87da0b16553e2175ec365627610412c | ORPH
    arm      |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/cd18354044450426616761a120c842f8e8a6d25d |     
  mips64el   |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/408fe05c60cfd227c67588fb99d95e26546f1e62 |     
    arm      |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/20688b309f32d1025f6a54141d5ed6dcb27abd0f |     
    or1k     | bpftool-a7f0e7f057283ae8af3... | NOK | http://autobuild.buildroot.net/results/dea546184521b22b7ecf4c506b95b88adf4f4566 |     
    m68k     | bpftool-a7f0e7f057283ae8af3... | NOK | http://autobuild.buildroot.net/results/951fb47b67501b90a36b635351c60c5376313a12 |     
    arm      | bpftool-a7f0e7f057283ae8af3... | NOK | http://autobuild.buildroot.net/results/a62ee58c5cabaa0355b99471e54dec55984fe31c |     
    or1k     | bpftool-a7f0e7f057283ae8af3... | NOK | http://autobuild.buildroot.net/results/673a4b1b599335aa93582d2e51c03805bd8508b5 |     
   x86_64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/63da2d2e4b23a9345497b1349f50c1abbd58e9cb | ORPH
  mips64el   |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/26d13876229871ec0917ee5ece1431ef15e2fee7 | ORPH
  mips64el   |         civetweb-1.15          | NOK | http://autobuild.buildroot.net/results/93a848d2e44675ee977b90563b585dd111afe915 | ORPH
    i686     |         clamav-0.103.5         | NOK | http://autobuild.buildroot.net/results/df925655dabd7e72e0cecaea353a1a6b45b9e9db |     
   x86_64    |          connman-1.41          | NOK | http://autobuild.buildroot.net/results/74da4f4deab5f0ae9405d063ad52a5d4904a964d |     
powerpc64le  |        dieharder-3.31.1        | NOK | http://autobuild.buildroot.net/results/90798958f1d8f01ea511d865fd39b2d237f79594 |     
   sparc     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/1dc3245ef598237f58929a5d8de1b67e294002a1 | ORPH
   xtensa    |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/0c66628bf6a9266f58f916923cb9f83aeb9012ab |     
   xtensa    |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/c382f75d78ad7f23c10a1c8049c8382205f8d90e |     
    i686     |            gd-2.3.3            | NOK | http://autobuild.buildroot.net/results/c4fc4ec0a9b77406a70ae069654169ffa7759b6b | ORPH
  mips64el   |          gstd-0.13.0           | NOK | http://autobuild.buildroot.net/results/69c5388e0e0e838de20ac694069129b5cc0f3f12 | ORPH
    arm      |        host-attr-2.5.1         | NOK | http://autobuild.buildroot.net/results/308a72134f32db06b84d3afabcd3ce8a50cca3f1 |     
  powerpc    |        host-attr-2.5.1         | NOK | http://autobuild.buildroot.net/results/851f64d219cc9c65caf9617f59b71564b704b564 |     
    arc      |       host-autoconf-2.71       | NOK | http://autobuild.buildroot.net/results/25f9f0eef3cff74595acbd4c927ac7e532bc91b4 | ORPH
  riscv64    |       host-autoconf-2.71       | NOK | http://autobuild.buildroot.net/results/a68b364af47f5382bf45036106df6a98c1f45646 | ORPH
    arm      |      host-binutils-2.36.1      | NOK | http://autobuild.buildroot.net/results/8658c28049138196352dad5da62f4ca710481a27 |     
   xtensa    |      host-binutils-2.36.1      | NOK | http://autobuild.buildroot.net/results/da70e5ebe34d2d74bd92c95540822ab9fe9e8488 |     
    arm      |      host-binutils-2.36.1      | NOK | http://autobuild.buildroot.net/results/1752d86d85aba10168a7911eb4c9ed1d199cdf2d |     
   s390x     |      host-binutils-2.36.1      | NOK | http://autobuild.buildroot.net/results/54a9bc94bb6fe159b631bd7acc17a96ac67adf08 |     
microblazeel |      host-binutils-2.36.1      | NOK | http://autobuild.buildroot.net/results/cc5407e4cef852225e34e16eda5f912bd0b524f2 |     
  powerpc    |        host-bison-3.8.2        | NOK | http://autobuild.buildroot.net/results/2a2e6b0eec7683d930b4e5a17689a68d5b94dc01 | ORPH
    arm      |        host-bison-3.8.2        | NOK | http://autobuild.buildroot.net/results/853366b37ea980d55f36650be606f830c0024e85 | ORPH
  powerpc    |        host-bison-3.8.2        | NOK | http://autobuild.buildroot.net/results/03d2cc88c92d60fb56ee61a08f0bb4028255e3c7 | ORPH
  nds32le    |        host-bison-3.8.2        | NOK | http://autobuild.buildroot.net/results/686c01548258315d275af7643156fd3679b1e3dc | ORPH
microblazeel |        host-bison-3.8.2        | NOK | http://autobuild.buildroot.net/results/532186e97e61c2095449aaaf01880badfc07ba02 | ORPH
    arm      |        host-bison-3.8.2        | NOK | http://autobuild.buildroot.net/results/f0df4a936554a8453e4d63fe68622a03369a4dac | ORPH
   sparc     |        host-bison-3.8.2        | NOK | http://autobuild.buildroot.net/results/d5d4b1a150567f57aaff71869785ad11f6b93c08 | ORPH
    arm      |       host-cmake-3.16.9        | NOK | http://autobuild.buildroot.net/results/3ce0133f3eb7e112715bf32d86c2362e5a93f64d |     
    m68k     |       host-cmake-3.16.9        | NOK | http://autobuild.buildroot.net/results/9bdbfdd94f0f1bf5c4d9b53cbb8e5702b4f9a3c7 |     
    arm      |       host-cmake-3.16.9        | NOK | http://autobuild.buildroot.net/results/7775f6418f12a78f1050f2c5504069295eff9a90 |     
    arm      |       host-cmake-3.16.9        | NOK | http://autobuild.buildroot.net/results/57ef5a8f72710748b7b2c3645fbc2efed6eb6221 |     
  riscv64    |       host-cmake-3.16.9        | NOK | http://autobuild.buildroot.net/results/7cd462669bbc9239bedf9f74ec090f85849ffd9e |     
    arm      |       host-cmake-3.16.9        | NOK | http://autobuild.buildroot.net/results/9dc290c02d771e39bb02e68a662cddf68184e58f |     
    arm      |       host-cmake-3.16.9        | NOK | http://autobuild.buildroot.net/results/708656c912a1079c55862603b49fc7ccd843822c |     
    arm      |       host-cmake-3.16.9        | NOK | http://autobuild.buildroot.net/results/0237a52b594003a5548a01934324d2fecf35d1af |     
   x86_64    |       host-cmake-3.16.9        | NOK | http://autobuild.buildroot.net/results/ff3815907bf2d5ab1189bc8112fc6abefaf7d5ce |     
   x86_64    |       host-cmake-3.16.9        | NOK | http://autobuild.buildroot.net/results/2639a567c20f0b27faa6a731656016833b5516fc |     
 powerpc64   |       host-cmake-3.16.9        | NOK | http://autobuild.buildroot.net/results/bbd310e08a2a2b372832a334fa3cce5abdf8e139 |     
   x86_64    |       host-cmake-3.16.9        | NOK | http://autobuild.buildroot.net/results/f9b5d752b18e6b75ff6c2b6641edf1d55881311f |     
  riscv64    |       host-cmake-3.16.9        | NOK | http://autobuild.buildroot.net/results/93e5da8a0f049cc3ea6ca5fa8868cff962698367 |     
  powerpc    |       host-cmake-3.16.9        | NOK | http://autobuild.buildroot.net/results/022ddccd7a6be9ebe7487132bce2b2c48b603a6a |     
   x86_64    |       host-cmake-3.16.9        | NOK | http://autobuild.buildroot.net/results/018dee9cd7ddf5d7722fff72ac198d1a6e4db2b7 |     
  powerpc    |       host-cmake-3.16.9        | NOK | http://autobuild.buildroot.net/results/09dacbbca0eda2ef4e4985a158c881b9fe47aee0 |     
microblazeel |       host-cmake-3.16.9        | NOK | http://autobuild.buildroot.net/results/f098e324116d156a77f73a1aa8437f8a54294855 |     
  riscv32    |       host-cmake-3.16.9        | NOK | http://autobuild.buildroot.net/results/a006f43a4b48bb8e1a71b27e54c07b5c6daa6074 |     
    arm      |       host-cmake-3.16.9        | NOK | http://autobuild.buildroot.net/results/0f4ece5fa0b0441fe087e04a14485cf2fa38b654 |     
   x86_64    |       host-cmake-3.16.9        | NOK | http://autobuild.buildroot.net/results/9352536ff40d9de24d0f984c3f14b4de3d3e046c |     
   x86_64    |       host-cmake-3.16.9        | NOK | http://autobuild.buildroot.net/results/66caf505b5ce7aaaca8d0bc8cbab06cc72758342 |     
   x86_64    |       host-cmake-3.16.9        | NOK | http://autobuild.buildroot.net/results/f53c017f4896aa421982d97c8b59b921f62d4d97 |     
    arm      |       host-cmake-3.16.9        | NOK | http://autobuild.buildroot.net/results/2df41004d2d96f1f701a10055c211172d895df98 |     
    arm      |       host-cmake-3.16.9        | NOK | http://autobuild.buildroot.net/results/12da101ba5431880cc409d4bfd4700c6e39f7ffa |     
  riscv64    |       host-cmake-3.16.9        | NOK | http://autobuild.buildroot.net/results/4cdc0f1c1c1dba14be259266ee881f7b57e3188f |     
    arm      |       host-cmake-3.16.9        | NOK | http://autobuild.buildroot.net/results/8dd449889294bac649b628e9bad3919ca07cf6dd |     
   sparc     |       host-cmake-3.16.9        | NOK | http://autobuild.buildroot.net/results/53903c80b04d8eedecb91972b6c8e2b7db0c1861 |     
   x86_64    |       host-cmake-3.16.9        | NOK | http://autobuild.buildroot.net/results/d05e8c284178c44bac5eff7294def1572c6dcf1e |     
  nds32le    |       host-cmake-3.16.9        | NOK | http://autobuild.buildroot.net/results/900ddd6e93bb964d512434c3654bff7b9a56cf63 |     
    arm      |       host-cmake-3.16.9        | NOK | http://autobuild.buildroot.net/results/5fe0dabcb0fd58b11a6eab3a198e24f1b7a95526 |     
    m68k     |       host-cmake-3.16.9        | NOK | http://autobuild.buildroot.net/results/26cb9fcc36b42efae9b42081a67518c7e8bd2a5b |     
microblazeel |       host-cmake-3.16.9        | NOK | http://autobuild.buildroot.net/results/4abfebf29884584a3836a9d29c0fa8e5e30029de |     
  nds32le    |       host-cmake-3.16.9        | NOK | http://autobuild.buildroot.net/results/46a4e18d4526e0fb1e9065f277381ab95fe1b00f |     
    arm      |       host-cmake-3.16.9        | NOK | http://autobuild.buildroot.net/results/e80a60b6bb60fd962a326c3f8041d625b4c08f03 |     
  mips64el   |       host-cmake-3.16.9        | NOK | http://autobuild.buildroot.net/results/3eb7d1e8349139d08ddc8001286ea54636c593c3 |     
  mips64el   |       host-cmake-3.16.9        | NOK | http://autobuild.buildroot.net/results/5e73023d69304ea072615eb50b38f5667a987fe9 |     
    sh4      |       host-cmake-3.16.9        | NOK | http://autobuild.buildroot.net/results/51ec75473ccd78c76b371ae7d98e434a726f6b32 |     
  mips64el   |       host-cmake-3.16.9        | NOK | http://autobuild.buildroot.net/results/10a5271ebcf7a5ed739916c7b30b9c7b9cd3e681 |     
   nios2     |       host-cmake-3.16.9        | NOK | http://autobuild.buildroot.net/results/ea100dc10189981ce013a6e808965567b2861dde |     
  mips64el   |       host-cmake-3.16.9        | NOK | http://autobuild.buildroot.net/results/2d954650b56d49eca72ede76f811410ae6310e8c |     
    arm      |       host-cmake-3.16.9        | NOK | http://autobuild.buildroot.net/results/c1aa9db62135726b52aec68eb81e40d073e0d557 |     
  powerpc    |       host-cmake-3.16.9        | NOK | http://autobuild.buildroot.net/results/12d2f441c07b639c5fbdf1041462c12d560ea402 |     
   nios2     |       host-cmake-3.16.9        | NOK | http://autobuild.buildroot.net/results/db3651195838ddef846a5b3ee33e430929bd6727 |     
   nios2     |       host-cmake-3.16.9        | NOK | http://autobuild.buildroot.net/results/d1a635558d7ded24acd0bfe0d6d88e2f58a35536 |     
   xtensa    |       host-cmake-3.16.9        | NOK | http://autobuild.buildroot.net/results/49e470356d98be2bb872dc227c8e6f5f93773013 |     
    arm      |       host-cmake-3.16.9        | NOK | http://autobuild.buildroot.net/results/f020f100b5c3e345d14fdab3091bb7e19a416975 |     
    arm      |       host-fakeroot-1.26       | NOK | http://autobuild.buildroot.net/results/75085a7ca278df438f277153e99a997d0381f1f9 | ORPH
    arm      |        host-flex-2.6.4         | NOK | http://autobuild.buildroot.net/results/e2f78cc61c8f0e731ea63108558246bb2b2c39b5 | ORPH
    arm      |        host-flex-2.6.4         | NOK | http://autobuild.buildroot.net/results/ba9391abf6841fcd9f6f62f48573de3301e2de2b | ORPH
    arm      |        host-flex-2.6.4         | NOK | http://autobuild.buildroot.net/results/78240849717e7a6931f9c30580b7a496b920dd02 | ORPH
   mipsel    |        host-flex-2.6.4         | NOK | http://autobuild.buildroot.net/results/1d1b5c83e1f4b714afcafa12a476ad922e344241 | ORPH
   x86_64    |        host-flex-2.6.4         | NOK | http://autobuild.buildroot.net/results/e313446a0b597968118f617a7c1a1ac13fd17ac5 | ORPH
    m68k     |        host-flex-2.6.4         | NOK | http://autobuild.buildroot.net/results/8f575694d0e46cb8346948585c8065144d84082d | ORPH
   s390x     |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/f03039af210d65a333a14e028ade1fab48084736 |     
  powerpc    |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/a80bccc0ccde7a43c1722dd6660679057c9233ef |     
   xtensa    |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/f559bba0e87529f7ee42ea5c30c7a15665f32a46 |     
    arm      |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/d60b16617d53cf676244bbcb8fec3e996ef8720f |     
  powerpc    |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/1c184af067464020285ac5da18bd9c6d188064d0 |     
    arm      |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/55a8782bcc4bcbda6e1c5b6c91195b45966f4d89 |     
  powerpc    |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/c3d2f0069dd5c6de57d96519c128181dd6f0ea69 |     
  powerpc    |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/7d0e49b78cb47d9b1b9190cf3c759a33706011b2 |     
   s390x     |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/b9957d5ca0708bdf6b277136bbb10b9cee509b45 |     
microblazeel |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/dcbaabe423977126311a009c0c10ddd3bd0182e3 |     
  riscv64    |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/a0940c528ff3bb52761e5e9c7114072dc52bae34 |     
   s390x     |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/d24a0f6468af9f6b219b2ea87eb995423d20955b |     
  powerpc    |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/d96a99c5fa00404b7d8aa92a127b46a9f68bcb48 |     
microblazeel |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/e7ed2dcb7cb42b05be15713aeb26818742941508 |     
  riscv64    |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/694e7db77d388cbb191554e2e8106d2fd730b913 |     
    arm      |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/114aafc637d3d2b5570eb0a793974d0246a91579 |     
  riscv64    |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/532fd659b51321742b2529b301426b5cae24a36b |     
microblazeel |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/e6b90734968eb443a1d1ae3d9ad075f73a20176b |     
  riscv64    |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/c46213c5eef048637a2cdba3d595823490f6635a |     
    arm      |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/28751bc7ac4c2ecd25ad689e74a1cdec304af830 |     
    arm      |    host-gcc-initial-11.2.0     | NOK | http://autobuild.buildroot.net/results/2152ec1ec6a8d1f0364256c12003bb32d2827275 |     
    arm      |    host-gcc-initial-11.2.0     | NOK | http://autobuild.buildroot.net/results/5ae09dbf90637d62056ab11f8ea9580db99d66e8 |     
    arm      |    host-gcc-initial-11.2.0     | NOK | http://autobuild.buildroot.net/results/4a2e2bcc6bc29d860658f974b82688536dac1de2 |     
    arm      |    host-gcc-initial-11.2.0     | NOK | http://autobuild.buildroot.net/results/39688e1f711145176bde1919c687ebd1dca65d65 |     
    arc      | host-gcc-initial-arc-2020.0... | NOK | http://autobuild.buildroot.net/results/2cd5947c6248d425b78658fa2911b3ca103991a0 |     
    arc      | host-gcc-initial-arc-2020.0... | NOK | http://autobuild.buildroot.net/results/f9f0b45488226e55464d90330ea350f4c91739c5 |     
    arc      | host-gcc-initial-arc-2020.0... | NOK | http://autobuild.buildroot.net/results/127224d67cde1070d4a0fb98b060f789633bceff |     
    arc      | host-gcc-initial-arc-2020.0... | NOK | http://autobuild.buildroot.net/results/7d0dda8152d68fa3a23f9f3c651bad6c34e3f0e6 |     
    m68k     |    host-gettext-gnu-0.20.1     | NOK | http://autobuild.buildroot.net/results/870c711031349cbd608cea516ae4710a2a4e5034 | ORPH
    arm      |    host-gettext-gnu-0.20.1     | NOK | http://autobuild.buildroot.net/results/11f67a38914289d52d85472994a64c73376d7de9 | ORPH
  riscv64    |    host-gettext-gnu-0.20.1     | NOK | http://autobuild.buildroot.net/results/aae1869566641dbeb74f011d0d8d4607d8fd2f0b | ORPH
    arm      |    host-gettext-gnu-0.20.1     | NOK | http://autobuild.buildroot.net/results/a7b44d4d9b7ab83701f0cfc1df38bead07ab9f18 | ORPH
  sparc64    |    host-gettext-gnu-0.20.1     | NOK | http://autobuild.buildroot.net/results/f463868207adbd6e15f66c737d9da025055fc845 | ORPH
   nios2     |    host-gettext-gnu-0.20.1     | NOK | http://autobuild.buildroot.net/results/41f79cfef1564f4dc50b4d10b15ebe4da9f5f68c | ORPH
   x86_64    |    host-gettext-gnu-0.20.1     | NOK | http://autobuild.buildroot.net/results/2a58ac9efdef6093c3be56dc2fffe906a9bce586 | ORPH
powerpc64le  |    host-gettext-gnu-0.20.1     | NOK | http://autobuild.buildroot.net/results/115bdb135a03c2b04ea49df3568d89125917d02d | ORPH
    arm      |    host-gettext-gnu-0.20.1     | NOK | http://autobuild.buildroot.net/results/0c46607f8faa54618dabc0f7e35a9716836b4ee7 | ORPH
    or1k     |    host-gettext-gnu-0.20.1     | NOK | http://autobuild.buildroot.net/results/cf1de1c70df9995b89eb29dd194553b014e91acf | ORPH
    arc      |    host-gettext-gnu-0.20.1     | NOK | http://autobuild.buildroot.net/results/6f213cd1fea751fe13845f1a57290c0846e976be | ORPH
  mips64el   |    host-gettext-gnu-0.20.1     | NOK | http://autobuild.buildroot.net/results/db6a930295a519333eb197ac6051e9526baa5fd6 | ORPH
   mipsel    |    host-gettext-gnu-0.20.1     | NOK | http://autobuild.buildroot.net/results/368c7b3be0c72ef6619b6ee1c61fbd85504bd691 | ORPH
   nios2     |    host-gettext-gnu-0.20.1     | NOK | http://autobuild.buildroot.net/results/d2520277c123ec9c83fc1aa016ad77bce50fc80b | ORPH
  riscv64    |    host-gettext-gnu-0.20.1     | NOK | http://autobuild.buildroot.net/results/4a30df93e278ff0d0373c05d81a71e091fce764d | ORPH
  mips64el   |    host-gettext-gnu-0.20.1     | NOK | http://autobuild.buildroot.net/results/e0c0b4955539e416dc9d22e25b33d9e5f559a46c | ORPH
   xtensa    |    host-gettext-gnu-0.20.1     | NOK | http://autobuild.buildroot.net/results/684ee467247154b0ca835ca9997e78c6bddaeac8 | ORPH
    arm      |    host-gettext-gnu-0.20.1     | NOK | http://autobuild.buildroot.net/results/f3f0555e14c7c285bb14d56d613f7301fb55268e | ORPH
  mips64el   |    host-gettext-tiny-0.3.2     | NOK | http://autobuild.buildroot.net/results/80d6d56964d97bb40888cff574a768655625ee46 |     
    arm      |         host-gmp-6.2.1         | NOK | http://autobuild.buildroot.net/results/72d2470dffcaf8091206e7d81368ea20ee57d314 | ORPH
microblazeel |         host-icu-70-1          | NOK | http://autobuild.buildroot.net/results/748667c39567469876f527ff036a89b6b66067e7 | ORPH
  aarch64    |       host-libffi-3.4.2        | NOK | http://autobuild.buildroot.net/results/cee32154aa5be2804ddfdcc487a53a65e1d7aef8 |     
    arc      |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/a83a7550b892a54a64ea3e93e3ba47b8e1bb1e28 |     
    arm      |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/f87e35538909da714d433c1f680b0c3976b76577 |     
  sparc64    |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/f1803776147652c46abddb26b7851c7d8f8ef772 |     
    sh4      |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/286ab3c6bcb1766aa9dac3f75d1b9f673277c6b8 |     
    i686     |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/c4dbf7cf6d82d7b206efcd0bd821130a45817adb |     
    arc      |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/72d8181857460c7b9a177fd7334d8ce543751080 |     
    arm      |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/9bd944e514735af80da0c20cfdd91c7e6211039c |     
  mips64el   |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/ff81f72c42aa5d4282d6c30f506348784688d82e |     
   sparc     |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/8a8aa929f27c3518dcf0871ad62c6ada218ce1a3 |     
  mips64el   |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/3992d8c99a2ebc333b038e6fca832e56e060278d |     
    sh4      |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/b4d16477833e7865b080bb431586cb678eb75e5c |     
microblazeel |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/c2f0ba52c1c0a0c5394107fb57bb473409aad60c |     
    i686     |    host-libtextstyle-0.20.1    | NOK | http://autobuild.buildroot.net/results/ea79ff2e65789874ea0e5cbd8ed9e6e930d27e2d | ORPH
    arm      |    host-libtextstyle-0.20.1    | NOK | http://autobuild.buildroot.net/results/7f492852b71a12aa87243f1024f39baead627f54 | ORPH
powerpc64le  |    host-libtextstyle-0.20.1    | NOK | http://autobuild.buildroot.net/results/4a4790b46eea9a4c8a926f909f47280a1d31adfd | ORPH
    arm      |       host-libtool-2.4.6       | NOK | http://autobuild.buildroot.net/results/d5f25920ddf38ee12858dbb99976b54ccb3276ca | ORPH
   x86_64    |      host-libxml2-2.9.12       | NOK | http://autobuild.buildroot.net/results/25a2bf49e972c76780c73a0b9c4f3d5be65d8152 |     
    or1k     |      host-libxml2-2.9.12       | NOK | http://autobuild.buildroot.net/results/ee4e4ec1d546244b522ff7693cdeb16725f5e712 |     
   sparc     |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/620b1055e34139f4d747de01949d8e9ce49179fe | ORPH
   mipsel    |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/bbf0af7ce3f4bce936a760c7d7605f830b10ae61 | ORPH
   x86_64    |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/7f89ac9e3925bea56272745332147fb1b331a326 | ORPH
  mips64el   |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/53b36952c6d179d069570cea312d2b4054c933e0 | ORPH
   mipsel    |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/30c80c7a5c0dcacba357272c1fcf73b7801c3afc | ORPH
   x86_64    |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/8ad62acbc96c02f943b0305560d0cec3b8449d76 | ORPH
    arm      |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/3b1a102e3eb9b6e24c6abf6a7644e8c4f24504de | ORPH
  mips64el   |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/c420b5da0a5c9dd143de4a42e15187c4b84e0809 | ORPH
  mips64el   |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/d2e5c11b4b6fe262d36e66ac96916fea2569fefb | ORPH
  mips64el   |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/33775b6bda4e5e7ff833b6e2c4dc54813ead8e82 | ORPH
  riscv64    |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/101c5e893d1750cbc61fc99650c1bfe2ccb90f78 | ORPH
  nds32le    |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/b557a6910dda6282c5054692552263dd6d0aff9b | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/7d39e7e2f669ca41b44ac4dbfef3843eb68b70c1 | ORPH
    arm      |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/22d92b7c2bc076f327b3f02873d3a4ebeb3660ec | ORPH
   sparc     |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/8573a1aa6de3c5b88c3ac045ad8f6f3558e3f841 | ORPH
   s390x     |         host-mpc-1.2.1         | NOK | http://autobuild.buildroot.net/results/a4f726bacc0a9866105f80fbb92cd436ffa36749 | ORPH
    arc      |        host-mpfr-4.1.0         | NOK | http://autobuild.buildroot.net/results/8d93e3429e6e48ddb14a53f91028aae96ae3cf63 | ORPH
    arc      |        host-mpfr-4.1.0         | NOK | http://autobuild.buildroot.net/results/d08709fef7acbc500a27bba50c9dcc78434e6b6e | ORPH
  riscv64    |        host-mpfr-4.1.0         | NOK | http://autobuild.buildroot.net/results/690199ae1abd82af15b29c94f016ada124c74e49 | ORPH
   mipsel    |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/a04f2c354fe48511ae7a15e8d935f2988e7b6038 | ORPH
    arc      |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/dbc3474989c221555a5cf72cbe624cb58b473165 | ORPH
   x86_64    |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/aa0ea01295cd1e137de786d8656ef013b9e1e499 | ORPH
  riscv64    |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/8cc8fd9c711db6926468f8016016044afc6afb67 | ORPH
    mips     |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/0d5eff0831a2cfb2d3f80a268971cb4e0c27c14a | ORPH
    m68k     |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/ff3faab487ef49f2fada151f0a0c6dc5ec4e6d1f | ORPH
microblazeel |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/53566f29c98238e843f507518202e5c47d560f57 | ORPH
   x86_64    |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/fca5f4054ccdb00e0fdfdc3cdb4e35306b862104 | ORPH
   xtensa    |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/3fa2f66b82974976baef8dd7c44f3cdde1032bde | ORPH
   nios2     |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/196fc2932c6a9d831d84846a2a7edb931ed12fb0 | ORPH
    i686     |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/657c7e3c05c53e6fd0b40a4e8882d39039471347 | ORPH
  mips64el   |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/ee5eb267d46a03f64a04047f398f76e7aa24291b | ORPH
    sh4      |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/2c180d8ebce140d2f4a851fb043884df9a31f76f | ORPH
  powerpc    |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/7f3bdcbf4750cd7f2b63c1ebad471dab76ff5d9c | ORPH
    i586     |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/1c770956544f0030eac2a655bc86d8ccaa4f7e0a | ORPH
   mipsel    |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/a67cebe85b39e936aca53107f48fe723c62f39a5 | ORPH
    arc      |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/ed3c67d49eed7a16421bbc48ca9c506447da5532 | ORPH
    arm      |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/753458ab9edc5d37d4ff89ade77dd22624ff3b2d | ORPH
    i586     |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/009c4ed6b390c12205a815185f7d3e9607add74c | ORPH
    arm      |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/e617016acdd42f6785e947a7f1635faa4de20467 | ORPH
  mips64el   |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/a6942b87fe7d27baacf13924df36fe6a8bd534c2 | ORPH
   sparc     |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/f8ff6399b092ed76ed8e820ebe11ca071f5693f9 | ORPH
    mips     |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/d451ca99d3d472fdd581f30ddd12332f4ccf35b4 | ORPH
  mips64el   |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/7aae9826558894d4122cf25ffe159fa653a36a7f | ORPH
    arm      |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/b388297f5ff86075926d9c19348d00ceecec669f | ORPH
   mipsel    |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/e577e59e3405d24843d4b16d57c0a18ff57af546 | ORPH
    arm      |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/e9f7d59e036844b5df2a0098fb9c0d77391c46c9 | ORPH
    arm      |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/382585ec23743a330da057f094e764761a1cdfc2 | ORPH
    arm      |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/cce84296ecb8a2aa06c417486c4ffa5d825a951d | ORPH
   x86_64    |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/5590a501d2bdcd73ceaf85d2ea79ae7ffe7b3ba2 | ORPH
    arm      |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/da7d5bffbedcea4d8d33f8212cc2ab35556976ba | ORPH
    arm      |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/867a3826dd86bcf89779f58a58ce313d5a8fc335 | ORPH
    i686     |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/f5d3113f6b1acbcb8230cc2992125415bc6bf549 | ORPH
   xtensa    |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/a752b6368dadf00e6f0b11504c799eeda30313d1 | ORPH
    arm      |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/b4a268fa72693e516494c223a762f38a0620cff6 | ORPH
    arm      |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/0b606b53e55c87a44b288eb8ce58734b7f1cc70b | ORPH
    arm      |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/af11e7c2c95ef8c911988443338a8cca56d03aab | ORPH
  mips64el   |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/fb810c0694706997cf1d4fdbf818d54b7f03622e | ORPH
    arm      |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/683aac9f140a20e6f7933fb04de68ead8d5a7520 | ORPH
  aarch64    |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/8fb79c0d6475908c207fab7bac7e33a73bba95a0 | ORPH
  riscv32    |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/66b9a81f1a9b960a96fcf6bb19331b72c693a310 | ORPH
microblazeel |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/9a07fa6792545c48988fb8055b7d004a4dccfd67 | ORPH
    i686     |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/2793bfbeb4399ddbb8f2c35695476517995cfe11 | ORPH
    or1k     |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/fe4a702f2fd5da58a40145a2f7a6acb9d6571a20 | ORPH
    or1k     |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/586b4b31cdd7561c848728ceae022b15c05b107f | ORPH
  riscv32    |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/087e10d1022f298dac8b6b11052e6f18860b482c | ORPH
   xtensa    |         host-pcre-8.45         | NOK | http://autobuild.buildroot.net/results/db772a46ee0d0e2a19fc6bba3c0e4cd16e686ba3 | ORPH
    i586     |       host-pkgconf-1.6.3       | NOK | http://autobuild.buildroot.net/results/10815078a3e060ac73be31c7611ce32f80c0dca7 | ORPH
    arm      |       host-pkgconf-1.6.3       | NOK | http://autobuild.buildroot.net/results/6f7de6528764f9536ac73ca7344268b7f4f82847 | ORPH
  mips64el   |       host-pkgconf-1.6.3       | NOK | http://autobuild.buildroot.net/results/534a1fa059b26a845eaaf93bfc7abdb6eb494bd0 | ORPH
  powerpc    |      host-python3-3.10.2       | NOK | http://autobuild.buildroot.net/results/4e977ae94e768f8f45e49989fc20d35fc7ba0367 |     
    arm      |      host-python3-3.10.2       | NOK | http://autobuild.buildroot.net/results/ab88a869b2688430f6abe79878faea013362549a |     
  riscv32    |      host-python3-3.10.2       | NOK | http://autobuild.buildroot.net/results/71df7ed82d7e9fb3bfb89b5a4dedfba439c938a1 |     
   mipsel    |      host-python3-3.10.2       | NOK | http://autobuild.buildroot.net/results/e6cf2dd1a289e98b89d6623b1d872c5b8f2544a9 |     
   nios2     |      host-python3-3.10.2       | NOK | http://autobuild.buildroot.net/results/6d273a836655b08a74b953a15523d43de0ed9e5c |     
   mipsel    |      host-python3-3.10.2       | NOK | http://autobuild.buildroot.net/results/ff18371dd9c13af9c057b3bf06835eb8f16efb94 |     
  riscv32    |      host-python3-3.10.2       | NOK | http://autobuild.buildroot.net/results/5eccf195e624369957b09164bdabb56ea1f4f3fd |     
  mips64el   |      host-python3-3.10.2       | NOK | http://autobuild.buildroot.net/results/ac88d0fba46fc9da3d49c182f01edbc9d20d94ab |     
   nios2     |      host-python3-3.10.2       | NOK | http://autobuild.buildroot.net/results/7db43790cb8cdc51533a1fd0fd3add6082fe1a69 |     
  sparc64    |      host-python3-3.10.2       | NOK | http://autobuild.buildroot.net/results/725a4e0e8b6f3f256ce3754ea4ba1a68e69d1654 |     
   mipsel    |      host-python3-3.10.2       | NOK | http://autobuild.buildroot.net/results/052678b50a0c422c35e996dae8c8a757b3e6fd1f |     
    m68k     |      host-python3-3.10.2       | NOK | http://autobuild.buildroot.net/results/fb8802683a18fc30a7a96cca4f054f17f2d98fcd |     
    m68k     |      host-python3-3.10.2       | NOK | http://autobuild.buildroot.net/results/0ac0d153b602c12e21584894ae9a3f542255de89 |     
    arm      |      host-python3-3.10.2       | NOK | http://autobuild.buildroot.net/results/d7cfa0eacf8894e9472e67741352c9840a7d3702 |     
   x86_64    |      host-python3-3.10.2       | NOK | http://autobuild.buildroot.net/results/649e07a9d51ae798152cf63b7f1ca2ddbc26d467 |     
    m68k     |        host-swig-4.0.2         | NOK | http://autobuild.buildroot.net/results/1e25675fcc4dc770496614318e203b642ce9cb3c |     
   nios2     |     host-util-linux-2.37.3     | NOK | http://autobuild.buildroot.net/results/b3b57f88321c7f6710a5b93270296fd3895f0423 | ORPH
    arm      |         host-xz-5.2.5          | NOK | http://autobuild.buildroot.net/results/b0eabc30b4dc51ed29628d27f991732a1872085a | ORPH
    arm      |         libiconv-1.15          | NOK | http://autobuild.buildroot.net/results/cfa52189d9778e55386bd8470dc9c68360624d53 | ORPH
    sh4      |          libnl-3.5.0           | NOK | http://autobuild.buildroot.net/results/3e776dc204d9a599041a52902eb2b25af68b2e14 | ORPH
powerpc64le  |       libopenssl-1.1.1m        | NOK | http://autobuild.buildroot.net/results/550fff194b12f7c1531c74177ab7fafe45c36932 |     
    arm      |       libopenssl-1.1.1m        | NOK | http://autobuild.buildroot.net/results/b8317fbcf5a97c7a95c2c205e5fefd3ceec7b1b8 |     
    or1k     |       libopenssl-1.1.1m        | NOK | http://autobuild.buildroot.net/results/534d5bce5c2a3ebf2b156f000da0eea3a3bdb250 |     
    arc      | librtlsdr-ed0317e6a58c09887... | NOK | http://autobuild.buildroot.net/results/fb34753d0b2191c73f0418f28c08ef1a9bc19ba7 |     
    i586     |      libsamplerate-0.1.9       | NOK | http://autobuild.buildroot.net/results/b74e4a5dcffa15ddf370db759e9803a1ccf27591 | ORPH
  powerpc    |         libtirpc-1.3.2         | NOK | http://autobuild.buildroot.net/results/e9e982e5439b6f4fbf425cfe233477eef393ac48 |     
 powerpc64   |         libusb-1.0.25          | NOK | http://autobuild.buildroot.net/results/94fcf202db66760ef448f148de01cfc3e406e653 |     
    arm      |            libuwsc             | TIM | http://autobuild.buildroot.net/results/0cdc8095062ad980da9c75ea23e93d3b672200df |     
    arc      |         libzlib-1.2.11         | NOK | http://autobuild.buildroot.net/results/ef1b9f540ea8abe1a5fdf1820478c8e0e3e5e515 | ORPH
    mips     |         libzlib-1.2.11         | NOK | http://autobuild.buildroot.net/results/266b14b0446f96acd4623a0cb6cb6d1e476a7875 | ORPH
  mips64el   |        linux-pam-1.5.2         | NOK | http://autobuild.buildroot.net/results/4d5a5adc9a9148ade9a239a93db7e9880ca18923 | ORPH
    arm      |          ncurses-6.1           | NOK | http://autobuild.buildroot.net/results/cfc11637305598516dbd8cabb0dc9710bbae506e | ORPH
    i686     |          ncurses-6.1           | NOK | http://autobuild.buildroot.net/results/83cab5f79ea923050484b2c10787344511f6fa91 | ORPH
   x86_64    |          ncurses-6.1           | NOK | http://autobuild.buildroot.net/results/c1ac13e97a0b8a4b74f2d35f571899309b81ae28 | ORPH
   x86_64    |         openjpeg-2.4.0         | NOK | http://autobuild.buildroot.net/results/9130ebdbd227902d2836aeeb33de1b37ac47f4c4 |     
  powerpc    |        osm2pgsql-1.6.0         | NOK | http://autobuild.buildroot.net/results/e9394aa3b785b09a491f27a1b69dc946a1523333 |     
  riscv64    |        pcsc-lite-1.9.5         | NOK | http://autobuild.buildroot.net/results/6c04e50a544ee7efea0ef80cada19acf6c6b1a85 | ORPH
    arm      |        pulseview-0.4.2         | NOK | http://autobuild.buildroot.net/results/032f69d67b2fc996349347ff86b02d794df882f4 |     
    arm      |     python-greenlet-1.1.2      | NOK | http://autobuild.buildroot.net/results/98c61da822599a4af6a4adda60e7eabe3616f928 |     
  powerpc    |   python-pygame-d61ea8eabd56   | NOK | http://autobuild.buildroot.net/results/1b81851b0c7f039296bbe01ca19e831926f96945 |     
  riscv64    |           ruby-3.1.0           | NOK | http://autobuild.buildroot.net/results/877f26a006cebf531fcf71d06abdc931f570b5b7 |     
microblazeel |          snmppp-3.4.2          | NOK | http://autobuild.buildroot.net/results/93bfa52af6f0d448f2f5697222b1dd6c53b5e74c |     
    arm      |         sqlite-3.37.2          | NOK | http://autobuild.buildroot.net/results/995270afbd20931b43bc5b638ad0c137c0426d42 |     
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/e64f613c617dda3828ca21dd3b7eda2b7f8800e2 | ORPH
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/2c3a3fe2c69fa1bb4c11eef8397c1cfc0cf83c87 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/bad306bab8de44c08f80779fb1b0fcbba6a29bea |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/51494266d2d636fec7c8fb604690e39719272326 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/9fc411081b02f0808ac0aa35542ab1cbe33a5d71 |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/830e8b954b78c43901c9e6228a6e14709686b04b |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/e27eb187a037e800a5e06eb6780bed66330781bd |     
  nds32le    |            unknown             | NOK | http://autobuild.buildroot.net/results/f51596e45f41750c7e2d3501d54703837e8b84de |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/0b67ac70254589cf8085dce4be531b743f242990 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/e0e395bdc31e5fa013a922faf7d4aeb2b572a3a7 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/1d392c260820faea3a469afdb5aa698deda2c233 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/74ab5cd320a415fe949d84bb3b0ce326697ed52c |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/43c8034dc85983c7bb3f51d812984d9cba53da80 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/c1ed54003841728bc2ed9c4572a758080f827cbe |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/f58bbd2bbad6608be6df83601f0be4d5dc2e996a |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/400c6cd7dccab27eae65a3663084c460895fe18c |     
    arm      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/0eaf0b392463297ed3cde3f74d53aa337517b247 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

              host-ncurses-6.1 | 12
             host-cmake-3.15.5 | 8 
        host-gcc-initial-9.4.0 | 6 
       host-gettext-gnu-0.20.1 | 5 
                alsa-lib-1.2.4 | 4 
              host-bison-3.7.1 | 3 
               host-flex-2.6.4 | 2 
                    acl-2.2.53 | 1 
             bluez5_utils-5.62 | 1 
                busybox-1.33.2 | 1 
            host-autoconf-2.69 | 1 
host-gcc-initial-arc-2020.0... | 1 
                host-m4-1.4.18 | 1 
            host-python3-3.9.9 | 1 
                   ncurses-6.1 | 1 
                rocksdb-6.13.3 | 1 
                       unknown | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           acl-2.2.53           | NOK | http://autobuild.buildroot.net/results/57d89025010766ac8b774c2b054d6d1cc5604846 |     
    arm      |         alsa-lib-1.2.4         | NOK | http://autobuild.buildroot.net/results/3e9db1da6d3b185f4a9adfa3673fe302129faa48 |     
  aarch64    |         alsa-lib-1.2.4         | NOK | http://autobuild.buildroot.net/results/fd6b7b90b904ef2b6066bbc3f57d6ba8a17f9572 |     
  aarch64    |         alsa-lib-1.2.4         | NOK | http://autobuild.buildroot.net/results/37e385276909657caba765fc686be73f6c5434dc |     
  powerpc    |         alsa-lib-1.2.4         | NOK | http://autobuild.buildroot.net/results/c8c20ef74329e6da01e5372da9b474a445c8827d |     
   nios2     |       bluez5_utils-5.62        | NOK | http://autobuild.buildroot.net/results/c1103f421e14eb3810a00b1f05c71d85a72bdc13 |     
  aarch64    |         busybox-1.33.2         | NOK | http://autobuild.buildroot.net/results/41aed9996699ce944503af88ab247d10a37563a2 | ORPH
    arm      |       host-autoconf-2.69       | NOK | http://autobuild.buildroot.net/results/12b93650cc31769ae1c9b85f7dea0c9edb908512 | ORPH
  riscv64    |        host-bison-3.7.1        | NOK | http://autobuild.buildroot.net/results/3db18f89666e4703e95d68605b986a1bfa7e7e42 | ORPH
    m68k     |        host-bison-3.7.1        | NOK | http://autobuild.buildroot.net/results/ded26d3cea53a2d6ea30bc5797cc4bca9afcd31a | ORPH
  powerpc    |        host-bison-3.7.1        | NOK | http://autobuild.buildroot.net/results/343ed7fe555824498ae443ffbd3c2b054d859713 | ORPH
  aarch64    |       host-cmake-3.15.5        | NOK | http://autobuild.buildroot.net/results/87594a0bd50f85fff7aad7c63260a52ec44ab10b |     
   mipsel    |       host-cmake-3.15.5        | NOK | http://autobuild.buildroot.net/results/74963d4b93d94720b0105df2c095e20bde4e16e3 |     
  aarch64    |       host-cmake-3.15.5        | NOK | http://autobuild.buildroot.net/results/a80f8016aee3306272de66bea7b590d1011a7fb4 |     
   nios2     |       host-cmake-3.15.5        | NOK | http://autobuild.buildroot.net/results/952cafc12bfae80a29fa09e62db4ff4923c834c1 |     
    mips     |       host-cmake-3.15.5        | NOK | http://autobuild.buildroot.net/results/988ab1c20ec6afe594f9eedb020f63b32df9de78 |     
    arm      |       host-cmake-3.15.5        | NOK | http://autobuild.buildroot.net/results/446bced66e6d41a17553f51008290acf16de278c |     
    m68k     |       host-cmake-3.15.5        | NOK | http://autobuild.buildroot.net/results/85af99cc6a46055ccd6d0bf5b3213a7bab03bc7e |     
   sparc     |       host-cmake-3.15.5        | NOK | http://autobuild.buildroot.net/results/5531459d268263ee848fa901f74f31c7bfa6f447 |     
  riscv64    |        host-flex-2.6.4         | NOK | http://autobuild.buildroot.net/results/5d03915d7127d106a3ef97fb72fb8e1fa8e9ff67 | ORPH
  riscv64    |        host-flex-2.6.4         | NOK | http://autobuild.buildroot.net/results/6b8db27c5716107f36778214e57448dace48f2ea | ORPH
   xtensa    |     host-gcc-initial-9.4.0     | NOK | http://autobuild.buildroot.net/results/088e3eadd204a3beaedc9fdcbb0118441adc24ba |     
    arm      |     host-gcc-initial-9.4.0     | NOK | http://autobuild.buildroot.net/results/5da0ae2824258713d9a0d7935bd390a7cebdc601 |     
    arm      |     host-gcc-initial-9.4.0     | NOK | http://autobuild.buildroot.net/results/0d84bcc1a843e31eeafe76276df8852852f0ff44 |     
    arm      |     host-gcc-initial-9.4.0     | NOK | http://autobuild.buildroot.net/results/b52f8ee6c37ed5b3e5df0a47bd3a7950be1d0d9c |     
  riscv64    |     host-gcc-initial-9.4.0     | NOK | http://autobuild.buildroot.net/results/e8a60c7c5ce0737f70e9d6a7e5f97ccdce44c009 |     
    arm      |     host-gcc-initial-9.4.0     | NOK | http://autobuild.buildroot.net/results/f90dcda46f624bf528ceb3da9666a932ade8aa5c |     
    arc      | host-gcc-initial-arc-2020.0... | NOK | http://autobuild.buildroot.net/results/9ae55331c43bdf82a755fe8d3001369814afe509 |     
    arm      |    host-gettext-gnu-0.20.1     | NOK | http://autobuild.buildroot.net/results/1f9b9b37317e98269b81a511fc027ff9d5228cbd | ORPH
    arm      |    host-gettext-gnu-0.20.1     | NOK | http://autobuild.buildroot.net/results/b9292e0a3f780b3fd980d7f1ad4cd7b54190ac54 | ORPH
    arm      |    host-gettext-gnu-0.20.1     | NOK | http://autobuild.buildroot.net/results/0ae6d19b915c7166a660c51d94297c5fce38eee8 | ORPH
    i586     |    host-gettext-gnu-0.20.1     | NOK | http://autobuild.buildroot.net/results/9ee3795ccbdb8c33f6fd25a3a4740d030ee1192c | ORPH
  nds32le    |    host-gettext-gnu-0.20.1     | NOK | http://autobuild.buildroot.net/results/530c15ef5553a5797c55594b89c068dc445e1cc8 | ORPH
    arm      |         host-m4-1.4.18         | NOK | http://autobuild.buildroot.net/results/a266d1c18d907e0259ee6929b2133239b4384637 | ORPH
  aarch64    |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/3ab5eb00373a92634fc4dc92a13a2064a67462f2 | ORPH
    m68k     |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/3d1785032146b39054137edc31c979c91c8f64b6 | ORPH
microblazeel |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/72d1128ece4ceaaafb926f07edaf2034a364cf1e | ORPH
  aarch64    |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/75706e47e808d5d9fd8ea4303aba3fd133ca4f9d | ORPH
  powerpc    |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/e7d392f9a921e154461ac5560d7d04b0b712187b | ORPH
   x86_64    |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/84464b7592277f1ad6cfb0dd04979a2fa5f7764b | ORPH
  sparc64    |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/7d21f92fcb8e66e913343a4072dd07b735b7b62d | ORPH
    or1k     |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/d67461a4e3726751e1eb9cfb1c6a2221c82da620 | ORPH
    arm      |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/f14155349a473450572f6de4e55ec42af10fa199 | ORPH
    arm      |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/facdc94d27e857d35e2cc2cf945a0bea01718ca4 | ORPH
  powerpc    |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/fcdcf487aa6c4b1dbbacf00195532788e0f910b0 | ORPH
    m68k     |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/2d5a5e03fffc70fe9cc143788aca7ca3a81289e8 | ORPH
    mips     |       host-python3-3.9.9       | NOK | http://autobuild.buildroot.net/results/4c1a4332193529fa2fe53a551de8910e01d2d79c |     
    arm      |          ncurses-6.1           | NOK | http://autobuild.buildroot.net/results/9099255c88836c7998326c8b2a435698f4dbbb0b | ORPH
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/445d6869cffdc75da80351abeb1a5587f848386e |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/469a8e4a78ef627fe64c60af3fe8d1c3128dda17 |     


Classification of failures by reason for 2021.11.x
--------------------------------------------------

             host-cmake-3.16.9 | 6 
              host-ncurses-6.1 | 6 
       host-gcc-initial-10.3.0 | 5 
       host-gettext-gnu-0.20.1 | 5 
                host-m4-1.4.19 | 3 
          host-binutils-2.36.1 | 2 
            host-python3-3.9.9 | 2 
                     acl-2.3.1 | 1 
                busybox-1.34.1 | 1 
                    flex-2.6.4 | 1 
              host-bison-3.8.2 | 1 
                host-gmp-6.2.1 | 1 
             host-libffi-3.4.2 | 1 
               host-mpfr-4.1.0 | 1 
            host-python-2.7.18 | 1 
                libgpiod-1.6.3 | 1 
                 libiconv-1.15 | 1 
               libvorbis-1.3.7 | 1 
                    mpfr-4.1.0 | 1 
                   ncurses-6.1 | 1 
                 openal-1.21.1 | 1 
                       unknown | 1 


Detail of failures for 2021.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |           acl-2.3.1            | NOK | http://autobuild.buildroot.net/results/e04187f1d55d4e457cebab61beec4838d67d1391 |     
   xtensa    |         busybox-1.34.1         | NOK | http://autobuild.buildroot.net/results/c4afb1b48f388b21a3ef65b4e5d90e17d8606887 | ORPH
  mips64el   |           flex-2.6.4           | NOK | http://autobuild.buildroot.net/results/6791b65bb4e30bde9098de7ffe299854703a2ec3 | ORPH
  powerpc    |      host-binutils-2.36.1      | NOK | http://autobuild.buildroot.net/results/7b63718702d23e054d8ca59fa93db98e5ad76311 |     
microblazeel |      host-binutils-2.36.1      | NOK | http://autobuild.buildroot.net/results/690ca4d5b6897160589f57eb37c15869a4acd9c3 |     
   s390x     |        host-bison-3.8.2        | NOK | http://autobuild.buildroot.net/results/371868f35d95503fd08e61c487ae92170aa71376 | ORPH
    arm      |       host-cmake-3.16.9        | NOK | http://autobuild.buildroot.net/results/fa037470ca7bc6b817ea80dd327e2a03521ec546 |     
   x86_64    |       host-cmake-3.16.9        | NOK | http://autobuild.buildroot.net/results/c9420a37ce29d3bbf2de3f2c24e6d7f3b8a6ec9d |     
    arm      |       host-cmake-3.16.9        | NOK | http://autobuild.buildroot.net/results/186f2eca9d9dade52070712e7075362a9b435ff2 |     
  nds32le    |       host-cmake-3.16.9        | NOK | http://autobuild.buildroot.net/results/e036723739a437c93e95d8c2034ef4dd3ae1531a |     
   mipsel    |       host-cmake-3.16.9        | NOK | http://autobuild.buildroot.net/results/08cf12e4abda470660ef1cf6ec1b866bc87bbbec |     
   nios2     |       host-cmake-3.16.9        | NOK | http://autobuild.buildroot.net/results/d700240e81c2a177646c48593aec654135aeaee7 |     
microblazeel |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/5b44c69db1244ef0a9903b030b3a6ec2a010a632 |     
  powerpc    |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/a484a2888c552ff01754657633098e45ab5fc718 |     
  powerpc    |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/c9c8b5ac15cb789196a3942351de802a346a44ce |     
    arm      |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/55dbd731ba0517387693e6417c425e29860ef0a9 |     
  powerpc    |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/e5a739805e087019facbe9164c3959831f7a770b |     
    i586     |    host-gettext-gnu-0.20.1     | NOK | http://autobuild.buildroot.net/results/1700e4fe273f8b2c62ed8aaf0b9deb4121be2d7e | ORPH
   nios2     |    host-gettext-gnu-0.20.1     | NOK | http://autobuild.buildroot.net/results/750cda121e5cfb72c2cce55fbc6493f257dde799 | ORPH
   x86_64    |    host-gettext-gnu-0.20.1     | NOK | http://autobuild.buildroot.net/results/85f15d58e8588f37711656a94ccd19e7b2e9a16c | ORPH
   mipsel    |    host-gettext-gnu-0.20.1     | NOK | http://autobuild.buildroot.net/results/96beeb980a07970fd128b38bb2d83e1b9ef17015 | ORPH
   x86_64    |    host-gettext-gnu-0.20.1     | NOK | http://autobuild.buildroot.net/results/7b5a4c33d212712db29b27cab185e51c1ffeb381 | ORPH
    arm      |         host-gmp-6.2.1         | NOK | http://autobuild.buildroot.net/results/06636ae6085527259dbc7c1384400b46a545652d | ORPH
  powerpc    |       host-libffi-3.4.2        | NOK | http://autobuild.buildroot.net/results/8534661cac8ecb474dd789165a354fa9225d3cbc |     
   nios2     |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/96fe66be74a3ac540fff3e745d4bd76744fcf5c3 | ORPH
   nios2     |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/f1de38389f75e5e7cacd55c5cd4040c621443e8e | ORPH
   x86_64    |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/482587a7a91855fec06c8de41950cd8f46157e9f | ORPH
  powerpc    |        host-mpfr-4.1.0         | NOK | http://autobuild.buildroot.net/results/a46d4867accbe2a7b5738afde0afe4fca045fecc | ORPH
    or1k     |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/6d1a99e9c0ec95cea334639d8df7a2e461ec9440 | ORPH
    m68k     |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/74f3e8ce4f41710c36c5ecb8f67a0bec671d0729 | ORPH
powerpc64le  |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/3f492d9c39f505bb5a04b9a07c049409a361647e | ORPH
    arm      |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/f0640891ae75e5590b9a7c4f7dfb06afd14bbe71 | ORPH
    arm      |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/1a729cfd9de579c7a692bb53e29ac1a4738638de | ORPH
  riscv32    |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/a2c8074dd5f06137ff922821ec76ad1f25b967af | ORPH
    arm      |       host-python-2.7.18       | NOK | http://autobuild.buildroot.net/results/1ecebba8e9f0dfe247b3ce1426356b92cc89bc68 |     
    m68k     |       host-python3-3.9.9       | NOK | http://autobuild.buildroot.net/results/ee5cf72ef37eb9e42d204d7b9ac767ae612ca7d7 |     
  mips64el   |       host-python3-3.9.9       | NOK | http://autobuild.buildroot.net/results/ccdc58cb3f6e46189ca8b8bc371834c9c7e9b009 |     
  powerpc    |         libgpiod-1.6.3         | NOK | http://autobuild.buildroot.net/results/bd75d187d9b92b11eeafed4fd62eae71fbf6df1c |     
  powerpc    |         libiconv-1.15          | NOK | http://autobuild.buildroot.net/results/6377402a3264bd7a8604a6dc2f7785591c702bbc | ORPH
  nds32le    |        libvorbis-1.3.7         | NOK | http://autobuild.buildroot.net/results/b0047fc3292f06dd8e5229556c6b6e2f4d2c1d4b |     
  nds32le    |           mpfr-4.1.0           | NOK | http://autobuild.buildroot.net/results/06a5a82d39393b736978bfeb0545b15b8d09c388 | ORPH
    arm      |          ncurses-6.1           | NOK | http://autobuild.buildroot.net/results/93c88483823dace7dce0f3a682e8e9c2affea917 | ORPH
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/8d0a7b4206668d4f1c6ae17c201b51f9734f7077 |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/b93b9409610fdcebf7e88b7048c4960a50da55ac |     


Gitlab CI results for 2022-02-20
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
           TestIPythonPy3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2088683795  | ORPH 
         TestLuaLuasyslog | https://gitlab.com/buildroot.org/buildroot/-/jobs/2088683903  | ORPH 
                  TestLxc | https://gitlab.com/buildroot.org/buildroot/-/jobs/2088683908  | ORPH 
      TestPythonPy3Pyyaml | https://gitlab.com/buildroot.org/buildroot/-/jobs/2088684091  | ORPH 
                 TestRust | https://gitlab.com/buildroot.org/buildroot/-/jobs/2088684137  | ORPH 
              TestRustBin | https://gitlab.com/buildroot.org/buildroot/-/jobs/2088684141  | ORPH 


Packages having a newer version
===============================

             name              | found by |        link to release-monitoring.org        |   version    |   upstream   | orph?
-------------------------------+----------+----------------------------------------------+--------------+--------------+-------
                           ace |  DISTRO  | https://release-monitoring.org/project/242395 | 7.0.1        | 7.0.6        |     
                        acpica |  DISTRO  | https://release-monitoring.org/project/00018 | 20200717     | 20211217     |     
            adwaita-icon-theme |  DISTRO  | https://release-monitoring.org/project/13117 | 3.37.2       | 41.0         |     
                       agentpp |  DISTRO  | https://release-monitoring.org/project/21316 | 4.3.1        | 4.5.3        |     
                      alsa-lib |  DISTRO  | https://release-monitoring.org/project/00038 | 1.2.6        | 1.2.6.1      |     
                  alsa-plugins |  DISTRO  | https://release-monitoring.org/project/00041 | 1.2.5        | 1.2.6        |     
                 android-tools |  GUESS   | https://release-monitoring.org/project/13989 | 4.2.2+git... | 12.0.0_r32   |     
                      apparmor |  DISTRO  | https://release-monitoring.org/project/94819 | 3.0.3        | 3.0.4        |     
                     armadillo |  DISTRO  | https://release-monitoring.org/project/07006 | 9.900.2      | 10.8.2       |     
                        assimp |  DISTRO  | https://release-monitoring.org/project/06988 | 5.1.6        | 5.2.1        |     
                      asterisk |  DISTRO  | https://release-monitoring.org/project/09838 | 16.21.1      | 19.2.0       |     
                   at-spi2-atk |  DISTRO  | https://release-monitoring.org/project/07840 | 2.34.2       | 2.38.0       |     
                  at-spi2-core |  DISTRO  | https://release-monitoring.org/project/07841 | 2.36.0       | 2.42.0       |     
              autoconf-archive |  DISTRO  | https://release-monitoring.org/project/00142 | 2021.02.19   | 2022.02.11   |     
                        avro-c |  DISTRO  | https://release-monitoring.org/project/59411 | 1.10.0       | 1.11.0       |     
               azure-iot-sdk-c |  DISTRO  | https://release-monitoring.org/project/21322 | LTS_01_20... | 3033-01-05   |     
                        babeld |  DISTRO  | https://release-monitoring.org/project/00154 | 1.9.2        | 1.10         | ORPH
                 balena-engine |  DISTRO  | https://release-monitoring.org/project/141616 | 19.03.14     | 20.10.11     | ORPH
                        batctl |  DISTRO  | https://release-monitoring.org/project/14740 | 2021.0       | 2022.0       |     
                    batman-adv |  DISTRO  | https://release-monitoring.org/project/19529 | 2021.4       | 2022.0       |     
                     bats-core |  DISTRO  | https://release-monitoring.org/project/10587 | 1.4.1        | 1.5.0        |     
                        bcg729 |  DISTRO  | https://release-monitoring.org/project/14743 | 1.0.4        | 1.1.1        |     
                     bctoolbox |  DISTRO  | https://release-monitoring.org/project/14746 | 4.4.8        | 5.1.2        | ORPH
                         bdwgc |  DISTRO  | https://release-monitoring.org/project/17108 | 8.0.6        | 8.2.0        |     
                     belle-sip |  DISTRO  | https://release-monitoring.org/project/14378 | 4.4.8        | 5.1.2        |     
                          belr |  DISTRO  | https://release-monitoring.org/project/80042 | 4.4.8        | 5.1.2        |     
                    berkeleydb |  GUESS   | https://release-monitoring.org/project/138386 | 5.3.28       | 18.1.5       | ORPH
                          bind |  DISTRO  | https://release-monitoring.org/project/14923 | 9.11.36      | 9.18.0       | ORPH
                      binutils |  DISTRO  | https://release-monitoring.org/project/07981 | 2.36.1       | 2.38         |     
                          bird |  DISTRO  | https://release-monitoring.org/project/00192 | 2.0.8        | 2.0.9        |     
                       bitcoin |  DISTRO  | https://release-monitoring.org/project/13618 | 0.21.2       | 22.0         |     
                        bonnie |  DISTRO  | https://release-monitoring.org/project/00212 | 1.03e        | 2.00a        | ORPH
                     bootstrap |  DISTRO  | https://release-monitoring.org/project/21578 | 4.3.1        | 5.1.3        |     
                         botan |  DISTRO  | https://release-monitoring.org/project/00214 | 2.18.2       | 2.19.1       | ORPH
                   btrfs-progs |  DISTRO  | https://release-monitoring.org/project/00227 | 5.15.1       | 5.16.2       | ORPH
                        c-icap |  DISTRO  | https://release-monitoring.org/project/21325 | 0.5.7        | 0.5.9        | ORPH
                c-icap-modules |  DISTRO  | https://release-monitoring.org/project/21326 | 0.5.4        | 0.5.5        | ORPH
                         cairo |  DISTRO  | https://release-monitoring.org/project/00247 | 1.16.0       | 1.17.4       |     
                     cantarell |  DISTRO  | https://release-monitoring.org/project/10888 | 0.0.25       | 0.303.1      | ORPH
                        ccache |  DISTRO  | https://release-monitoring.org/project/00257 | 3.7.12       | 4.5.1        | ORPH
                          ccid |  DISTRO  | https://release-monitoring.org/project/02612 | 1.4.34       | 1.5.0        | ORPH
                       chartjs |  DISTRO  | https://release-monitoring.org/project/85785 | 2.9.4        | 3.7.1        |     
                   checkpolicy |  DISTRO  | https://release-monitoring.org/project/00276 | 3.3          | 20200710     |     
                        chrony |  DISTRO  | https://release-monitoring.org/project/08810 | 4.1          | 4.2          | ORPH
                    cifs-utils |  DISTRO  | https://release-monitoring.org/project/00287 | 6.13         | 6.14         |     
                        circus |  DISTRO  | https://release-monitoring.org/project/21726 | 0.16.1       | 0.17.1       |     
                        clamav |  DISTRO  | https://release-monitoring.org/project/00291 | 0.103.5      | 0.104.2      |     
                         clang |  DISTRO  | https://release-monitoring.org/project/11811 | 9.0.1        | 13.0.1       |     
                         cmake |  DISTRO  | https://release-monitoring.org/project/00306 | 3.16.9       | 3.22.2       |     
                           cog |  DISTRO  | https://release-monitoring.org/project/21333 | 0.12.0       | 0.13.3       |     
                    containerd |  DISTRO  | https://release-monitoring.org/project/16460 | 1.5.9        | 1.6.0        |     
                          cups |  DISTRO  | https://release-monitoring.org/project/00380 | 2.4.0        | 2.4.1        |     
                  cups-filters |  DISTRO  | https://release-monitoring.org/project/05541 | 1.28.10      | 1.28.12      |     
                      cutelyst |  DISTRO  | https://release-monitoring.org/project/21335 | 2.11.0       | 3.2.0        |     
                        dacapo |  DISTRO  | https://release-monitoring.org/project/20546 | 9.12-MR1-... | 9.12-vbump   |     
                          daq3 |  DISTRO  | https://release-monitoring.org/project/212345 | 3.0.5        | 3.0.6        |     
                    datatables |  DISTRO  | https://release-monitoring.org/project/141588 | 1.10.20      | 1.11.4       |     
            datatables-buttons |  DISTRO  | https://release-monitoring.org/project/141589 | 1.6.1        | 2.2.2        |     
       datatables-fixedcolumns |  DISTRO  | https://release-monitoring.org/project/141590 | 3.3.0        | 4.0.2        |     
         datatables-responsive |  DISTRO  | https://release-monitoring.org/project/141591 | 2.2.3        | 2.2.9        |     
                         dc3dd |  DISTRO  | https://release-monitoring.org/project/15086 | 7.2.641      | 7.2.646      | ORPH
                   debianutils |  DISTRO  | https://release-monitoring.org/project/21341 | 4.11         | 5.7          | ORPH
                         delve |  DISTRO  | https://release-monitoring.org/project/40149 | 1.8.0        | 1.8.1        |     
                        dialog |  DISTRO  | https://release-monitoring.org/project/00431 | 1.3-20200327 | 1.3-20220117 | ORPH
                docker-compose |  DISTRO  | https://release-monitoring.org/project/06185 | 1.24.1       | 2.2.3        |     
                       dovecot |  DISTRO  | https://release-monitoring.org/project/00456 | 2.3.17.1     | 2.3.18       |     
                    drbd-utils |  DISTRO  | https://release-monitoring.org/project/00462 | 9.19.0       | 9.20.2       |     
                            dt |  DISTRO  | https://release-monitoring.org/project/21844 | 18.32        | 21.27        | ORPH
                       duktape |  DISTRO  | https://release-monitoring.org/project/21345 | 2.6.0        | 2.7.0        |     
                            ed |  DISTRO  | https://release-monitoring.org/project/00659 | 1.17         | 1.18         | ORPH
                          edk2 |  DISTRO  | https://release-monitoring.org/project/125953 | edk2-stab... | 202111       |     
                        efivar |  DISTRO  | https://release-monitoring.org/project/00664 | 37           | 38           |     
                           efl |  DISTRO  | https://release-monitoring.org/project/06128 | 1.26.1       | 1.26.2       |     
                         eigen |  DISTRO  | https://release-monitoring.org/project/00666 | 3.3.7        | 3.4.0        |     
                      ejabberd |  DISTRO  | https://release-monitoring.org/project/00667 | 20.07        | 21.12        |     
                        elixir |  DISTRO  | https://release-monitoring.org/project/00673 | 1.9.4        | 1.13.3       |     
                           ell |  DISTRO  | https://release-monitoring.org/project/17781 | 0.47         | 0.48         |     
                 enlightenment |  DISTRO  | https://release-monitoring.org/project/00698 | 0.25.1       | 0.25.3       |     
                        erlang |  DISTRO  | https://release-monitoring.org/project/00707 | 22.3.4.22    | 24.2.1       |     
                   erlang-eimp |  DISTRO  | https://release-monitoring.org/project/17060 | 1.0.17       | 1.0.21       |     
               erlang-goldrush |  DISTRO  | https://release-monitoring.org/project/09692 | 0.1.9        | 0.2.0        |     
                   erlang-idna |  DISTRO  | https://release-monitoring.org/project/45374 | 6.0.0        | 6.1.1        |     
                   erlang-jose |  DISTRO  | https://release-monitoring.org/project/16913 | 1.9.0        | 1.11.2       |     
                  erlang-lager |  DISTRO  | https://release-monitoring.org/project/00727 | 3.6.10       | 3.9.2        |     
                erlang-p1-acme |  DISTRO  | https://release-monitoring.org/project/45375 | 1.0.9        | 1.0.16       |     
           erlang-p1-cache-tab |  DISTRO  | https://release-monitoring.org/project/08757 | 1.0.25       | 1.0.29       |     
              erlang-p1-mqtree |  DISTRO  | https://release-monitoring.org/project/20220 | 1.0.10       | 1.0.14       |     
              erlang-p1-oauth2 |  DISTRO  | https://release-monitoring.org/project/09302 | 0.6.7        | 0.8.0        |     
                erlang-p1-pkix |  DISTRO  | https://release-monitoring.org/project/20539 | 1.0.6        | 1.0.8        |     
                 erlang-p1-sip |  DISTRO  | https://release-monitoring.org/project/10576 | 1.0.38       | 1.0.45       |     
          erlang-p1-stringprep |  DISTRO  | https://release-monitoring.org/project/09222 | 1.0.23       | 1.0.27       |     
                erlang-p1-stun |  DISTRO  | https://release-monitoring.org/project/09151 | 1.0.39       | 1.2.0        |     
                 erlang-p1-tls |  DISTRO  | https://release-monitoring.org/project/10455 | 1.1.9        | 1.1.13       |     
               erlang-p1-utils |  DISTRO  | https://release-monitoring.org/project/08643 | 1.0.20       | 1.0.24       |     
                 erlang-p1-xml |  DISTRO  | https://release-monitoring.org/project/10464 | 1.1.44       | 1.1.48       |     
                erlang-p1-xmpp |  DISTRO  | https://release-monitoring.org/project/12752 | 1.4.10       | 1.5.6        |     
                erlang-p1-yaml |  DISTRO  | https://release-monitoring.org/project/10243 | 1.0.28       | 1.0.32       |     
               erlang-p1-yconf |  DISTRO  | https://release-monitoring.org/project/45378 | 1.0.8        | 1.0.12       |     
                erlang-p1-zlib |  DISTRO  | https://release-monitoring.org/project/09283 | 1.0.9        | 1.0.10       |     
                   erofs-utils |  DISTRO  | https://release-monitoring.org/project/63188 | 1.3          | 1.4          |     
                       ethtool |  DISTRO  | https://release-monitoring.org/project/00763 | 5.15         | 5.16         |     
                      execline |  DISTRO  | https://release-monitoring.org/project/05482 | 2.8.0.1      | 2.8.2.0      |     
                        exempi |  DISTRO  | https://release-monitoring.org/project/00767 | 2.5.2        | 2.6.1        |     
                      fakeroot |  DISTRO  | https://release-monitoring.org/project/12048 | 1.26         | 1.27         | ORPH
                           feh |  DISTRO  | https://release-monitoring.org/project/00790 | 3.7.1        | 3.8          |     
                     fetchmail |  DISTRO  | https://release-monitoring.org/project/00801 | 6.4.24       | 6.4.27       |     
                        ffmpeg |  DISTRO  | https://release-monitoring.org/project/05405 | 4.4.1        | 5.0          |     
                   fftw-double |  DISTRO  | https://release-monitoring.org/project/00803 | 3.3.8        | 3.3.10       | ORPH
              fftw-long-double |  DISTRO  | https://release-monitoring.org/project/00803 | 3.3.8        | 3.3.10       | ORPH
                     fftw-quad |  DISTRO  | https://release-monitoring.org/project/00803 | 3.3.8        | 3.3.10       | ORPH
                   fftw-single |  DISTRO  | https://release-monitoring.org/project/00803 | 3.3.8        | 3.3.10       | ORPH
                           fio |  DISTRO  | https://release-monitoring.org/project/00806 | 3.28         | 3.29         |     
                       flannel |  DISTRO  | https://release-monitoring.org/project/07421 | 0.14.0       | 0.16.3       |     
                  flare-engine |  DISTRO  | https://release-monitoring.org/project/21433 | 1.12         | 1.13.04      |     
                    flare-game |  DISTRO  | https://release-monitoring.org/project/21434 | 1.12         | 1.13.04      |     
                          flot |  DISTRO  | https://release-monitoring.org/project/07184 | 0.8.3        | 4.2.2        | ORPH
                          fltk |  DISTRO  | https://release-monitoring.org/project/00823 | 1.3.7        | 1.3.8        | ORPH
                           fmc |  GUESS   | https://release-monitoring.org/project/145761 | fsl-sdk-v2.0 | 0.2.0        |     
                  font-awesome |  DISTRO  | https://release-monitoring.org/project/00826 | 4.7.0        | 6.0.0        | ORPH
                    fontconfig |  DISTRO  | https://release-monitoring.org/project/00827 | 2.13.1       | 2.13.96      | ORPH
                fuse-overlayfs |  DISTRO  | https://release-monitoring.org/project/101220 | 1.5.0        | 1.8.2        |     
                          fwts |  DISTRO  | https://release-monitoring.org/project/17383 | 21.11.00     | 22.01.00     |     
                        gauche |  DISTRO  | https://release-monitoring.org/project/00873 | 0.9.9        | 0.9.11       |     
                           gcr |  DISTRO  | https://release-monitoring.org/project/11801 | 3.40.0       | 3.41.0       | ORPH
                          gdbm |  DISTRO  | https://release-monitoring.org/project/00882 | 1.22         | 1.23         | ORPH
                    gdk-pixbuf |  DISTRO  | https://release-monitoring.org/project/09533 | 2.42.4       | 2.42.6       | ORPH
                        gensio |  DISTRO  | https://release-monitoring.org/project/67634 | 2.2.9        | 2.3.6        |     
                   gettext-gnu |  DISTRO  | https://release-monitoring.org/project/00898 | 0.20.1       | 0.21         | ORPH
                           git |  DISTRO  | https://release-monitoring.org/project/05350 | 2.31.1       | 2.35.1       |     
               glib-networking |  DISTRO  | https://release-monitoring.org/project/21353 | 2.70.0       | 2.70.1       | ORPH
                        glibmm |  DISTRO  | https://release-monitoring.org/project/07960 | 2.68.2       | 2.70.0       |     
                           glm |  DISTRO  | https://release-monitoring.org/project/01181 | 0.9.9.5      | 0.9.9.8      | ORPH
                       gnu-efi |  DISTRO  | https://release-monitoring.org/project/01202 | 3.0.10       | 3.0.14       |     
                        gnupg2 |  DISTRO  | https://release-monitoring.org/project/01215 | 2.2.32       | 2.3.4        | ORPH
                      gnuradio |  DISTRO  | https://release-monitoring.org/project/01217 | 3.8.2.0      | 3.10.1.1     |     
                        gnutls |  DISTRO  | https://release-monitoring.org/project/01221 | 3.7.2        | 3.7.3        |     
         gobject-introspection |  DISTRO  | https://release-monitoring.org/project/01223 | 1.70.0       | 1.71.0       | ORPH
                          gqrx |  DISTRO  | https://release-monitoring.org/project/09771 | 2.14.4       | 2.15.8       |     
                       granite |  DISTRO  | https://release-monitoring.org/project/05410 | 6.0.0        | 6.2.0        | ORPH
                          grpc |  DISTRO  | https://release-monitoring.org/project/19117 | 1.43.0       | 1.44.0       |     
                         grub2 |  DISTRO  | https://release-monitoring.org/project/01257 | 2.04         | 2.06         |     
     gsettings-desktop-schemas |  DISTRO  | https://release-monitoring.org/project/13139 | 3.36.1       | 41.0         | ORPH
                           gsl |  DISTRO  | https://release-monitoring.org/project/01267 | 2.6          | 2.7.1        | ORPH
                      gst1-imx |  DISTRO  | https://release-monitoring.org/project/21846 | 0.13.1       | 2.0.0        |     
                          gstd |  DISTRO  | https://release-monitoring.org/project/235022 | 0.13.0       | 0.13.2       | ORPH
                        gtkmm3 |  DISTRO  | https://release-monitoring.org/project/07963 | 3.22.0       | 4.6.0        |     
                 gtksourceview |  DISTRO  | https://release-monitoring.org/project/07724 | 3.24.7       | 5.3.2        |     
                         guile |  DISTRO  | https://release-monitoring.org/project/01277 | 3.0.7        | 3.0.8        |     
                    gutenprint |  DISTRO  | https://release-monitoring.org/project/01285 | 5.2.14       | 5.3.4        | ORPH
                          gvfs |  DISTRO  | https://release-monitoring.org/project/05496 | 1.48.1       | 1.49.90      | ORPH
                        hackrf |  DISTRO  | https://release-monitoring.org/project/06136 | 2018.01.1    | 2021.03.1    | ORPH
                       haproxy |  DISTRO  | https://release-monitoring.org/project/01298 | 2.4.8        | 2.5.3        |     
                      harfbuzz |  DISTRO  | https://release-monitoring.org/project/01299 | 3.3.2        | 3.4.0        |     
                       haveged |  DISTRO  | https://release-monitoring.org/project/11695 | 1.9.15       | 1.9.17       |     
                        hidapi |  DISTRO  | https://release-monitoring.org/project/05594 | 0.11.0       | 0.11.2       | ORPH
                         hplip |  DISTRO  | https://release-monitoring.org/project/01327 | 3.17.10      | 3.21.12      | ORPH
                        hwdata |  DISTRO  | https://release-monitoring.org/project/05387 | 0.355        | 0.356        | ORPH
                          i2pd |  DISTRO  | https://release-monitoring.org/project/21355 | 2.40.0       | 2.41.0       |     
                     ifenslave |  DISTRO  | https://release-monitoring.org/project/21670 | 2.9          | 2.13         | ORPH
                      ifupdown |  DISTRO  | https://release-monitoring.org/project/21673 | 0.8.16       | 0.8.37       | ORPH
                   imagemagick |  DISTRO  | https://release-monitoring.org/project/01372 | 7.1.0-19     | 7.1.0-25     | ORPH
                        imlib2 |  DISTRO  | https://release-monitoring.org/project/21676 | 1.7.3        | 1.8.0        |     
                 inotify-tools |  DISTRO  | https://release-monitoring.org/project/08864 | 3.20.2.2     | 3.22.1.0     | ORPH
             intel-mediadriver |  DISTRO  | https://release-monitoring.org/project/20341 | 22.1.1       | 22.2.1       |     
                intel-mediasdk |  DISTRO  | https://release-monitoring.org/project/21814 | 22.1.0       | 22.2.1       |     
               intel-microcode |  DISTRO  | https://release-monitoring.org/project/20614 | 20210608     | 20220207     | ORPH
                        iperf3 |  DISTRO  | https://release-monitoring.org/project/01389 | 3.10.1       | 3.11         |     
                      ipmiutil |  DISTRO  | https://release-monitoring.org/project/01391 | 3.1.7        | 3.1.8        |     
                      irrlicht |  DISTRO  | https://release-monitoring.org/project/01403 | 1.8.4        | 1.8.5        |     
                           isl |  DISTRO  | https://release-monitoring.org/project/13286 | 0.23         | 0.24         | ORPH
                           iwd |  DISTRO  | https://release-monitoring.org/project/18380 | 1.21         | 1.24         |     
                         jack1 |  DISTRO  | https://release-monitoring.org/project/59394 | 0.125.0      | 0.126.0      |     
                         jack2 |  DISTRO  | https://release-monitoring.org/project/21358 | 1.9.17       | 1.9.20       |     
                         janet |  DISTRO  | https://release-monitoring.org/project/155612 | 1.19.2       | 1.20.0       |     
                 janus-gateway |  DISTRO  | https://release-monitoring.org/project/15715 | 0.11.6       | 0.11.8       |     
                        jasper |  DISTRO  | https://release-monitoring.org/project/01421 | 2.0.33       | 3.0.2        |     
         jquery-datetimepicker |  DISTRO  | https://release-monitoring.org/project/13910 | 2.4.5        | 2.5.20       |     
               jquery-keyboard |  DISTRO  | https://release-monitoring.org/project/21681 | 1.18.12      | 1.30.4       | ORPH
                 jquery-mobile |  DISTRO  | https://release-monitoring.org/project/59395 | 1.4.3        | 1.4.5        | ORPH
                     jquery-ui |  DISTRO  | https://release-monitoring.org/project/21815 | 1.10.4       | 1.13.1       |     
              jquery-ui-themes |  DISTRO  | https://release-monitoring.org/project/21816 | 1.10.4       | 1.13.1       |     
                     json-glib |  DISTRO  | https://release-monitoring.org/project/13144 | 1.4.4        | 1.6.6        | ORPH
                         jszip |  DISTRO  | https://release-monitoring.org/project/141558 | 3.2.2        | 3.7.1        |     
       kf5-extra-cmake-modules |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.91.0       |     
               kf5-kcoreaddons |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.91.0       |     
           kf5-modemmanager-qt |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.91.0       |     
         kf5-networkmanager-qt |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.91.0       |     
                        kismet |  DISTRO  | https://release-monitoring.org/project/06966 | 2021-08-R1   | 2022-02-R1   | ORPH
     kodi-audiodecoder-modplug |  DISTRO  | https://release-monitoring.org/project/21818 | 19.0.2-Ma... | 20.2.0-Nexus |     
    kodi-audiodecoder-nosefart |  DISTRO  | https://release-monitoring.org/project/21819 | 19.0.2-Ma... | 20.2.0-Nexus |     
     kodi-audiodecoder-sidplay |  DISTRO  | https://release-monitoring.org/project/21820 | 19.0.1-Ma... | 20.2.0-Nexus |     
     kodi-audiodecoder-snesapu |  DISTRO  | https://release-monitoring.org/project/21802 | 19.0.2-Ma... | 20.2.0-Nexus |     
     kodi-audiodecoder-stsound |  DISTRO  | https://release-monitoring.org/project/21801 | 19.0.1-Ma... | 20.2.0-Nexus |     
    kodi-audiodecoder-timidity |  DISTRO  | https://release-monitoring.org/project/21800 | 19.0.2-Ma... | 20.2.0-Nexus |     
   kodi-audiodecoder-vgmstream |  DISTRO  | https://release-monitoring.org/project/21799 | 19.0.0-Ma... | 20.2.0-Nexus |     
        kodi-audioencoder-flac |  DISTRO  | https://release-monitoring.org/project/17755 | 19.0.1-Ma... | 20.2.0-Nexus |     
        kodi-audioencoder-lame |  DISTRO  | https://release-monitoring.org/project/21798 | 19.1.2-Ma... | 20.3.0-Nexus |     
      kodi-audioencoder-vorbis |  DISTRO  | https://release-monitoring.org/project/21797 | 19.0.1-Ma... | 20.2.0-Nexus |     
         kodi-audioencoder-wav |  DISTRO  | https://release-monitoring.org/project/21796 | 19.0.1-Ma... | 20.2.0-Nexus |     
     kodi-inputstream-adaptive |  DISTRO  | https://release-monitoring.org/project/21795 | 19.0.3-Ma... | 20.1.2-Nexus |     
 kodi-inputstream-ffmpegdirect |  DISTRO  | https://release-monitoring.org/project/177174 | 19.0.1-Ma... | 20.1.0-Nexus |     
         kodi-inputstream-rtmp |  DISTRO  | https://release-monitoring.org/project/21794 | 19.0.1-Ma... | 20.1.0-Nexus |     
      kodi-peripheral-joystick |  DISTRO  | https://release-monitoring.org/project/21793 | 19.0.1-Ma... | 20.1.0-Nexus |     
       kodi-peripheral-xarcade |  DISTRO  | https://release-monitoring.org/project/21791 | 19.0.1-Ma... | 20.1.1-Nexus |     
              kodi-pvr-argustv |  DISTRO  | https://release-monitoring.org/project/21788 | 19.2.1-Ma... | 20.4.1-Nexus |     
              kodi-pvr-dvblink |  DISTRO  | https://release-monitoring.org/project/21787 | 19.0.1-Ma... | 20.2.0-Nexus |     
            kodi-pvr-dvbviewer |  DISTRO  | https://release-monitoring.org/project/21786 | 19.0.2-Ma... | 20.2.0-Nexus |     
               kodi-pvr-filmon |  DISTRO  | https://release-monitoring.org/project/21785 | 19.0.1-Ma... | 20.2.1-Nexus |     
            kodi-pvr-hdhomerun |  DISTRO  | https://release-monitoring.org/project/21784 | 19.0.2-Ma... | 20.2.1-Nexus |     
                  kodi-pvr-hts |  DISTRO  | https://release-monitoring.org/project/21783 | 19.0.6-Ma... | 20.2.2-Nexus |     
           kodi-pvr-iptvsimple |  DISTRO  | https://release-monitoring.org/project/21782 | 19.1.0-Ma... | 20.3.0-Nexus |     
 kodi-pvr-mediaportal-tvserver |  DISTRO  | https://release-monitoring.org/project/21781 | 19.0.2-Ma... | 20.2.0-Nexus |     
               kodi-pvr-mythtv |  DISTRO  | https://release-monitoring.org/project/21780 | 19.0.7-Ma... | 20.2.4-Nexus |     
              kodi-pvr-nextpvr |  DISTRO  | https://release-monitoring.org/project/21779 | 19.0.3-Ma... | 20.2.2-Nexus |     
                 kodi-pvr-njoy |  DISTRO  | https://release-monitoring.org/project/21778 | 19.0.1-Ma... | 20.2.0-Nexus |     
              kodi-pvr-octonet |  DISTRO  | https://release-monitoring.org/project/100437 | 19.0.0-Ma... | 20.2.0-Nexus |     
                 kodi-pvr-pctv |  DISTRO  | https://release-monitoring.org/project/21777 | 19.0.1-Ma... | 20.2.0-Nexus |     
              kodi-pvr-plutotv |  DISTRO  | https://release-monitoring.org/project/241527 | 19.0.3-Ma... | 20.1.0-Nexus |     
              kodi-pvr-stalker |  DISTRO  | https://release-monitoring.org/project/21776 | 19.0.2-Ma... | 20.2.1-Nexus |     
                 kodi-pvr-vbox |  DISTRO  | https://release-monitoring.org/project/21775 | 19.0.0-Ma... | 20.2.0-Nexus |     
             kodi-pvr-vdr-vnsi |  DISTRO  | https://release-monitoring.org/project/21774 | 19.0.3-Ma... | 20.2.2-Nexus |     
               kodi-pvr-vuplus |  DISTRO  | https://release-monitoring.org/project/21773 | 19.0.0-Ma... | 20.2.0-Nexus |     
                kodi-pvr-waipu |  DISTRO  | https://release-monitoring.org/project/241529 | 19.1.1-Ma... | 20.3.0-Nexus |     
                  kodi-pvr-wmc |  DISTRO  | https://release-monitoring.org/project/21772 | 19.0.2-Ma... | 20.2.1-Nexus |     
               kodi-pvr-zattoo |  DISTRO  | https://release-monitoring.org/project/100438 | 19.7.10-M... | 20.2.1-Nexus |     
    kodi-screensaver-asteroids |  DISTRO  | https://release-monitoring.org/project/21771 | 19.0.1-Ma... | 20.1.0-Nexus |     
    kodi-screensaver-asterwave |  DISTRO  | https://release-monitoring.org/project/21770 | 19.0.1-Ma... | 20.1.0-Nexus |     
   kodi-screensaver-biogenesis |  DISTRO  | https://release-monitoring.org/project/21768 | 19.0.1-Ma... | 20.1.0-Nexus |     
      kodi-screensaver-cpblobs |  DISTRO  | https://release-monitoring.org/project/21767 | 19.0.1-Ma... | 20.1.0-Nexus |     
    kodi-screensaver-greynetic |  DISTRO  | https://release-monitoring.org/project/21765 | 19.0.1-Ma... | 20.1.0-Nexus |     
 kodi-screensaver-matrixtrails |  DISTRO  | https://release-monitoring.org/project/21764 | 19.0.1-Ma... | 20.1.0-Nexus |     
     kodi-screensaver-pingpong |  DISTRO  | https://release-monitoring.org/project/21763 | 19.0.1-Ma... | 20.1.0-Nexus |     
         kodi-screensaver-pyro |  DISTRO  | https://release-monitoring.org/project/21761 | 19.0.1-Ma... | 20.1.0-Nexus |     
         kodi-screensaver-rsxs |  DISTRO  | https://release-monitoring.org/project/21760 | 19.0.2-Ma... | 20.1.0-Nexus |     
        kodi-screensaver-stars |  DISTRO  | https://release-monitoring.org/project/21759 | 19.0.0-Ma... | 20.1.0-Nexus |     
           kodi-vfs-libarchive |  DISTRO  | https://release-monitoring.org/project/177173 | 19.0.1-Ma... | 20.1.0-Nexus |     
                  kodi-vfs-rar |  DISTRO  | https://release-monitoring.org/project/21900 | 19.0.1-Ma... | 20.1.0-Nexus |     
                 kodi-vfs-sftp |  DISTRO  | https://release-monitoring.org/project/21899 | 19.0.1-Ma... | 20.1.0-Nexus |     
    kodi-visualisation-fishbmc |  DISTRO  | https://release-monitoring.org/project/21758 | 19.0.1-Ma... | 20.1.0-Nexus |     
       kodi-visualisation-goom |  DISTRO  | https://release-monitoring.org/project/21757 | 19.0.1-Ma... | 20.1.0-Nexus |     
     kodi-visualisation-matrix |  DISTRO  | https://release-monitoring.org/project/177172 | 19.0.1-Ma... | 20.1.0-Nexus |     
  kodi-visualisation-shadertoy |  DISTRO  | https://release-monitoring.org/project/21756 | 19.1.2-Ma... | 20.2.0-Nexus |     
   kodi-visualisation-spectrum |  DISTRO  | https://release-monitoring.org/project/21755 | 19.0.1-Ma... | 20.1.0-Nexus |     
  kodi-visualisation-starburst |  DISTRO  | https://release-monitoring.org/project/85703 | 19.0.1-Ma... | 20.1.0-Nexus |     
   kodi-visualisation-waveform |  DISTRO  | https://release-monitoring.org/project/21753 | 19.0.2-Ma... | 20.1.0-Nexus |     
                       kvazaar |  DISTRO  | https://release-monitoring.org/project/12418 | 1.2.0        | 2.1.0        |     
                         lcms2 |  DISTRO  | https://release-monitoring.org/project/09815 | 2.13         | 2.13.1       |     
                       lensfun |  DISTRO  | https://release-monitoring.org/project/01548 | 0.3.2        | 0.3.95       |     
                         libao |  DISTRO  | https://release-monitoring.org/project/07629 | 1.2.0        | 1.2.2        | ORPH
                   libapparmor |  DISTRO  | https://release-monitoring.org/project/94819 | 3.0.3        | 3.0.4        |     
                    libarchive |  DISTRO  | https://release-monitoring.org/project/01558 | 3.5.3        | 3.6.0        |     
                   libblockdev |  DISTRO  | https://release-monitoring.org/project/09397 | 2.26         | 2.26-1       | ORPH
                        libbpf |  DISTRO  | https://release-monitoring.org/project/141355 | 0.6.1        | 0.7.0        |     
                        libbsd |  DISTRO  | https://release-monitoring.org/project/01567 | 0.11.3       | 0.11.5       |     
                        libcap |  DISTRO  | https://release-monitoring.org/project/01569 | 2.62         | 2.63         |     
                     libcgroup |  DISTRO  | https://release-monitoring.org/project/01575 | 0.42.2       | 2.0          |     
                     libcodec2 |  DISTRO  | https://release-monitoring.org/project/14605 | 1.0.1        | 1.03         |     
                        libdrm |  DISTRO  | https://release-monitoring.org/project/01596 | 2.4.109      | 2.4.110      |     
                   libfreeglut |  DISTRO  | https://release-monitoring.org/project/00846 | 3.2.1        | 3.2.2        |     
                       libfuse |  GUESS   | https://release-monitoring.org/project/00861 | 2.9.9        | 3.10.5       | ORPH
                     libgcrypt |  DISTRO  | https://release-monitoring.org/project/01623 | 1.9.4        | 1.10.0       | ORPH
                    libgdiplus |  DISTRO  | https://release-monitoring.org/project/06440 | 6.0.5        | 6.1          |     
                        libgee |  DISTRO  | https://release-monitoring.org/project/01625 | 0.20.4       | 0.20.5       |     
                       libgit2 |  DISTRO  | https://release-monitoring.org/project/01627 | 1.3.0        | 1.4.1        |     
                      libglade |  DISTRO  | https://release-monitoring.org/project/01174 | 2.6.4        | 3.38.2       | ORPH
                      libglib2 |  DISTRO  | https://release-monitoring.org/project/10024 | 2.70.0       | 2.70.4       |     
                      libglvnd |  DISTRO  | https://release-monitoring.org/project/12098 | 1.3.2        | 1.4.0        | ORPH
                  libgpg-error |  DISTRO  | https://release-monitoring.org/project/01628 | 1.42         | 1.44         | ORPH
                      libgpgme |  DISTRO  | https://release-monitoring.org/project/01239 | 1.16.0       | 1.17.0       | ORPH
                    libgphoto2 |  DISTRO  | https://release-monitoring.org/project/12558 | 2.5.27       | 2.5.28       | ORPH
                       libgtk2 |  DISTRO  | https://release-monitoring.org/project/13942 | 2.24.33      | 4.6.1        |     
                      libgudev |  DISTRO  | https://release-monitoring.org/project/07735 | 236          | 237          |     
                     libiberty |  DISTRO  | https://release-monitoring.org/project/07981 | 2.32         | 2.38         |     
                       libical |  DISTRO  | https://release-monitoring.org/project/01637 | 1.0.1        | 3.0.14       |     
                      libiconv |  DISTRO  | https://release-monitoring.org/project/10656 | 1.15         | 1.16         | ORPH
                  libimxvpuapi |  DISTRO  | https://release-monitoring.org/project/21479 | 0.10.3       | 2.2.0        |     
                      libinput |  DISTRO  | https://release-monitoring.org/project/05781 | 1.19.3       | 1.20.0       |     
                      libkcapi |  DISTRO  | https://release-monitoring.org/project/16828 | 1.1.5        | 1.3.1        | ORPH
                         libks |  DISTRO  | https://release-monitoring.org/project/241898 | 1.7.0        | 1.8.0        |     
                      libmhash |  DISTRO  | https://release-monitoring.org/project/21488 | 0.9.9.9      | 1.4          | ORPH
                  libminiupnpc |  DISTRO  | https://release-monitoring.org/project/01986 | 2.1.20201016 | 2.2.3        |     
                     libmspack |  DISTRO  | https://release-monitoring.org/project/16827 | 0.10.1alpha  | 1.9.1        |     
        libnetfilter_conntrack |  DISTRO  | https://release-monitoring.org/project/01675 | 1.0.8        | 1.0.9        |     
                        libnfs |  DISTRO  | https://release-monitoring.org/project/07325 | 4.0.0        | 5.0.1        | ORPH
                        libolm |  DISTRO  | https://release-monitoring.org/project/29706 | 3.2.9        | 3.2.10       |     
                    libopenssl |  DISTRO  | https://release-monitoring.org/project/02566 | 1.1.1m       | 3.0.1        |     
                     libosmium |  DISTRO  | https://release-monitoring.org/project/07023 | 2.17.3       | 2.18.0       |     
                   libpagekite |  DISTRO  | https://release-monitoring.org/project/21366 | 0.91.190530  | 0.91.201110  |     
            libpam-radius-auth |  DISTRO  | https://release-monitoring.org/project/57834 | 1.4.0        | 2.0.0        | ORPH
                       libpqxx |  DISTRO  | https://release-monitoring.org/project/21367 | 6.4.5        | 7.7.0        |     
                        libpri |  DISTRO  | https://release-monitoring.org/project/11042 | 1.5.0        | 1.6.0        |     
                         libqb |  DISTRO  | https://release-monitoring.org/project/09399 | 2.0.3        | 2.0.4        |     
                        libqmi |  DISTRO  | https://release-monitoring.org/project/07307 | 1.30.2       | 1.30.4       |     
                       librsvg |  DISTRO  | https://release-monitoring.org/project/05420 | 2.50.7       | 2.52.6       |     
                       librtas |  DISTRO  | https://release-monitoring.org/project/10717 | 2.0.2        | 2.0.3        | ORPH
                     libscrypt |  DISTRO  | https://release-monitoring.org/project/07380 | 1.21         | 1.22         |     
                   libsemanage |  DISTRO  | https://release-monitoring.org/project/01718 | 3.3          | 20200710     |     
                      libsepol |  DISTRO  | https://release-monitoring.org/project/01719 | 3.3          | 20200710     |     
                       libsigc |  DISTRO  | https://release-monitoring.org/project/07961 | 3.0.7        | 3.2.0        | ORPH
                    libsigsegv |  DISTRO  | https://release-monitoring.org/project/01722 | 2.13         | 2.14         |     
                       libsoup |  DISTRO  | https://release-monitoring.org/project/11483 | 2.74.0       | 3.0.4        |     
                       libsrtp |  DISTRO  | https://release-monitoring.org/project/18547 | 2.4.1        | 2.4.2        |     
                        libss7 |  DISTRO  | https://release-monitoring.org/project/21690 | 2.0.0        | 2.0.1        |     
                  libtextstyle |  DISTRO  | https://release-monitoring.org/project/00898 | 0.20.1       | 0.21         | ORPH
          libtorrent-rasterbar |  DISTRO  | https://release-monitoring.org/project/04166 | 1.2.15       | 2.0.5        |     
                     libunwind |  DISTRO  | https://release-monitoring.org/project/01748 | 1.5.0        | 1.6.2        | ORPH
                         libuv |  DISTRO  | https://release-monitoring.org/project/10784 | 1.42.0       | 1.43.0       |     
                   libva-utils |  DISTRO  | https://release-monitoring.org/project/16334 | 2.13.0       | 2.14.0       |     
                       libvips |  DISTRO  | https://release-monitoring.org/project/05097 | 8.10.6       | 8.12.2       |     
                       libvirt |  DISTRO  | https://release-monitoring.org/project/224041 | 7.10.0       | 8.0.0        |     
                 libwebsockets |  DISTRO  | https://release-monitoring.org/project/11181 | 4.0.21       | 4.3.1        |     
                     libxcrypt |  DISTRO  | https://release-monitoring.org/project/16436 | 4.4.27       | 4.4.28       |     
                  libxkbcommon |  DISTRO  | https://release-monitoring.org/project/01780 | 1.3.1        | 1.4.0        |     
                       libxml2 |  DISTRO  | https://release-monitoring.org/project/01783 | 2.9.12       | 2.9.13       |     
                     libxmlrpc |  DISTRO  | https://release-monitoring.org/project/09024 | r3119        | 1.51.07      |     
                      linphone |  DISTRO  | https://release-monitoring.org/project/01823 | 4.4.8        | 5.1.2        | ORPH
                linux-firmware |  DISTRO  | https://release-monitoring.org/project/141464 | 20211216     | 20220209     |     
                    liquid-dsp |  DISTRO  | https://release-monitoring.org/project/14535 | 1.3.2        | 1.4.0        |     
                       live555 |  DISTRO  | https://release-monitoring.org/project/12414 | 2021.05.03   | 2022.02.07   | ORPH
                           lld |  DISTRO  | https://release-monitoring.org/project/01830 | 9.0.1        | 13.0.1       |     
                         lldpd |  DISTRO  | https://release-monitoring.org/project/14019 | 1.0.9        | 1.0.13       | ORPH
                          llvm |  DISTRO  | https://release-monitoring.org/project/01830 | 9.0.1        | 13.0.1       |     
                     logrotate |  DISTRO  | https://release-monitoring.org/project/10567 | 3.18.0       | 3.19.0       |     
                          lpty |  DISTRO  | https://release-monitoring.org/project/11671 | 1.0.1-1      | 1.2.2        |     
                         ltris |  DISTRO  | https://release-monitoring.org/project/21503 | 1.2          | 1.2.3        |     
              lttng-babeltrace |  DISTRO  | https://release-monitoring.org/project/00155 | 1.5.7        | 1.5.8        |     
                   lttng-tools |  DISTRO  | https://release-monitoring.org/project/07136 | 2.13.2       | 2.13.4       |     
                           lua |  DISTRO  | https://release-monitoring.org/project/01847 | 5.1.5        | 5.4.4        |     
                lua-resty-http |  DISTRO  | https://release-monitoring.org/project/13887 | 0.15-0       | 0.16.1       |     
                           luv |  DISTRO  | https://release-monitoring.org/project/21510 | 1.42.0-1     | 1.43.0-0     |     
                          luvi |  DISTRO  | https://release-monitoring.org/project/21512 | 2.12.0       | 2.13.0       |     
                          lvm2 |  DISTRO  | https://release-monitoring.org/project/05354 | 2.03.14      | 2.03.15      | ORPH
                           lxc |  DISTRO  | https://release-monitoring.org/project/01860 | 4.0.11       | 4.0.12       |     
                          lynx |  DISTRO  | https://release-monitoring.org/project/01863 | 2.8.9rel.1   | 2.9.0        |     
                          lzop |  DISTRO  | https://release-monitoring.org/project/07486 | 1.03         | 1.04         |     
                          make |  DISTRO  | https://release-monitoring.org/project/01877 | 4.2.1        | 4.3          | ORPH
                       mariadb |  DISTRO  | https://release-monitoring.org/project/01887 | 10.3.30      | 10.8.2       | ORPH
             matchbox-keyboard |  DISTRO  | https://release-monitoring.org/project/230595 | 0.1          | 0.1.1        |     
                       mbedtls |  DISTRO  | https://release-monitoring.org/project/13824 | 2.28.0       | 3.1.0        |     
                         mdevd |  DISTRO  | https://release-monitoring.org/project/16553 | 0.1.4.0      | 0.1.5.1      |     
                 mediastreamer |  DISTRO  | https://release-monitoring.org/project/21746 | 4.4.8        | 5.1.2        | ORPH
                     memcached |  DISTRO  | https://release-monitoring.org/project/01965 | 1.6.12       | 1.6.14       | ORPH
                     memtest86 |  DISTRO  | https://release-monitoring.org/project/01966 | 5.01         | 5.31b        |     
                     memtester |  DISTRO  | https://release-monitoring.org/project/01967 | 4.5.0        | 4.5.1        |     
                        mender |  DISTRO  | https://release-monitoring.org/project/20629 | 3.1.0        | 3.2.1        |     
                        mesa3d |  DISTRO  | https://release-monitoring.org/project/01970 | 21.3.5       | 21.3.6       |     
                mesa3d-headers |  DISTRO  | https://release-monitoring.org/project/01970 | 21.3.5       | 21.3.6       |     
                         meson |  DISTRO  | https://release-monitoring.org/project/06472 | 0.61.1       | 0.61.2       |     
                      metacity |  DISTRO  | https://release-monitoring.org/project/15392 | 2.25.1       | 3.42.0       | ORPH
                      mfgtools |  DISTRO  | https://release-monitoring.org/project/21519 | 0.02         | 2.8.0        |     
                   micropython |  DISTRO  | https://release-monitoring.org/project/10539 | 1.17         | 1.18         |     
                         mimic |  DISTRO  | https://release-monitoring.org/project/21521 | 1.1.0        | 1.3.0.1      |     
                      minetest |  DISTRO  | https://release-monitoring.org/project/01978 | 5.4.1        | 5.5.0        |     
                 minetest-game |  DISTRO  | https://release-monitoring.org/project/21522 | 5.4.1        | 5.5.0        |     
                        moarvm |  DISTRO  | https://release-monitoring.org/project/21100 | 2021.10      | 2022.02      |     
mobile-broadband-provider-info |  DISTRO  | https://release-monitoring.org/project/10267 | 20190618     | 20210805     | ORPH
                 moby-buildkit |  DISTRO  | https://release-monitoring.org/project/20836 | 0.8.1        | 0.9.3        |     
                 modem-manager |  DISTRO  | https://release-monitoring.org/project/07306 | 1.16.10      | 1.18.6       |     
                       mongodb |  DISTRO  | https://release-monitoring.org/project/02008 | 4.2.18       | 5.2.1        |     
                      mongoose |  DISTRO  | https://release-monitoring.org/project/07603 | 7.2          | 7.6          |     
                         monit |  DISTRO  | https://release-monitoring.org/project/05483 | 5.26.0       | 5.31.0       |     
                          mono |  DISTRO  | https://release-monitoring.org/project/06360 | 6.12.0.90    | 6.12.0.173   |     
                        mpg123 |  DISTRO  | https://release-monitoring.org/project/12413 | 1.25.15      | 1.29.3       | ORPH
                           mpv |  DISTRO  | https://release-monitoring.org/project/05348 | 0.33.1       | 0.34.1       |     
                       msgpack |  DISTRO  | https://release-monitoring.org/project/12278 | 3.3.0        | 4.1.0        |     
                         msmtp |  DISTRO  | https://release-monitoring.org/project/02024 | 1.8.14       | 1.8.19       |     
                         mstpd |  DISTRO  | https://release-monitoring.org/project/235098 | 0.1.0        | 0.05         |     
                           mtd |  DISTRO  | https://release-monitoring.org/project/02026 | 2.1.3        | 2.1.4        |     
                           mtr |  DISTRO  | https://release-monitoring.org/project/02029 | 0.94         | 0.95         | ORPH
                         mupdf |  DISTRO  | https://release-monitoring.org/project/02034 | 1.18.0       | 1.19.0       |     
                          mutt |  DISTRO  | https://release-monitoring.org/project/02035 | 2.1.5        | 2.2.1        |     
                          nano |  DISTRO  | https://release-monitoring.org/project/02046 | 6.0          | 6.2          | ORPH
                           nbd |  DISTRO  | https://release-monitoring.org/project/02052 | 3.21         | 3.23         |     
                          ncdu |  DISTRO  | https://release-monitoring.org/project/06045 | 1.16         | 2.1          |     
                       ncurses |  DISTRO  | https://release-monitoring.org/project/02057 | 6.1          | 6.3-20220219 | ORPH
                       netdata |  DISTRO  | https://release-monitoring.org/project/11046 | 1.21.1       | 1.33.1       |     
                       netifrc |  DISTRO  | https://release-monitoring.org/project/21917 | 0.6.1        | 0.7.3        |     
                       netsnmp |  DISTRO  | https://release-monitoring.org/project/02062 | 5.9          | 5.9.1        | ORPH
       network-manager-openvpn |  DISTRO  | https://release-monitoring.org/project/69977 | 1.8.14       | 1.8.16       |     
                       nghttp2 |  DISTRO  | https://release-monitoring.org/project/08651 | 1.41.0       | 1.46.0       |     
                         nginx |  DISTRO  | https://release-monitoring.org/project/05413 | 1.20.1       | 1.21.6       |     
                        nodejs |  DISTRO  | https://release-monitoring.org/project/08251 | 14.18.3      | 17.5.0       |     
                      nss-mdns |  DISTRO  | https://release-monitoring.org/project/05491 | 0.14.1       | 0.15.1       | ORPH
                        nuttcp |  DISTRO  | https://release-monitoring.org/project/02511 | 6.1.2        | 8.2.2        |     
                 nvidia-driver |  DISTRO  | https://release-monitoring.org/project/21843 | 390.132      | 390.147      |     
               nvidia-modprobe |  DISTRO  | https://release-monitoring.org/project/141657 | 450.57       | 510.54       | ORPH
                          nvme |  DISTRO  | https://release-monitoring.org/project/09074 | 1.12         | 1.16         | ORPH
                     ocf-linux |  DISTRO  | https://release-monitoring.org/project/21541 | 20120127     | 20171122     | ORPH
                         ocrad |  DISTRO  | https://release-monitoring.org/project/02526 | 0.27         | 0.28         |     
                          ogre |  DISTRO  | https://release-monitoring.org/project/33334 | v1.12.12     | 13.3.1       |     
                     open62541 |  DISTRO  | https://release-monitoring.org/project/16896 | v1.2.2       | 1.2.4        | ORPH
                      openblas |  DISTRO  | https://release-monitoring.org/project/02540 | 0.3.18       | 0.3.20       | ORPH
                       opencv3 |  DISTRO  | https://release-monitoring.org/project/06615 | 3.4.17       | 4.5.5        |     
                openfpgaloader |  DISTRO  | https://release-monitoring.org/project/241709 | 0.6.1        | 0.7.0        |     
                       openjdk |  GUESS   | https://release-monitoring.org/project/176098 | 11.0.13+8    | 19+10        |     
                       openmpi |  DISTRO  | https://release-monitoring.org/project/02554 | 4.0.0        | 4.1.2        | ORPH
                 openpowerlink |  DISTRO  | https://release-monitoring.org/project/21550 | 2.7.1        | 2.7.2        |     
                        openrc |  DISTRO  | https://release-monitoring.org/project/11687 | 0.43.3       | 0.44.10      |     
               opentracing-cpp |  DISTRO  | https://release-monitoring.org/project/21553 | 1.5.1        | 1.6.0        |     
                   openvmtools |  DISTRO  | https://release-monitoring.org/project/10998 | 10.3.5-10... | 11.3.5       |     
                          opkg |  DISTRO  | https://release-monitoring.org/project/59397 | 0.4.5        | 0.5.0        | ORPH
                    opkg-utils |  DISTRO  | https://release-monitoring.org/project/59396 | 0.4.5        | 0.5.0        |     
               optee-benchmark |  DISTRO  | https://release-monitoring.org/project/21555 | 3.15.0       | 3.16.0       |     
                  optee-client |  DISTRO  | https://release-monitoring.org/project/21556 | 3.15.0       | 3.16.0       |     
                optee-examples |  DISTRO  | https://release-monitoring.org/project/21557 | 3.15.0       | 3.16.0       |     
                    optee-test |  DISTRO  | https://release-monitoring.org/project/21558 | 3.15.0       | 3.16.0       |     
                  oracle-mysql |  DISTRO  | https://release-monitoring.org/project/00334 | 5.1.73       | 8.0.28       | ORPH
                          ortp |  DISTRO  | https://release-monitoring.org/project/21691 | 4.4.8        | 5.1.2        | ORPH
                         pango |  DISTRO  | https://release-monitoring.org/project/11783 | 1.50.3       | 1.50.4       | ORPH
                       pangomm |  DISTRO  | https://release-monitoring.org/project/07958 | 2.48.2       | 2.50.0       |     
                    parprouted |  DISTRO  | https://release-monitoring.org/project/10309 | 0.7          | 0.65         | ORPH
                        parted |  DISTRO  | https://release-monitoring.org/project/02596 | 3.3          | 3.4          |     
                      patchelf |  DISTRO  | https://release-monitoring.org/project/02598 | 0.9          | 0.14.3       | ORPH
                     pax-utils |  DISTRO  | https://release-monitoring.org/project/02601 | 1.2.6        | 1.3.3        | ORPH
                     pcm-tools |  DISTRO  | https://release-monitoring.org/project/21377 | 202110       | 202201       | ORPH
                perl-crypt-cbc |  DISTRO  | https://release-monitoring.org/project/11930 | 2.33         | 3.04         |     
      perl-crypt-openssl-guess |  DISTRO  | https://release-monitoring.org/project/17375 | 0.12         | 0.15         |     
        perl-crypt-openssl-rsa |  DISTRO  | https://release-monitoring.org/project/02748 | 0.31         | 0.32         |     
                perl-dbd-mysql |  DISTRO  | https://release-monitoring.org/project/02807 | 4.046        | 4.050        |     
                       perl-gd |  DISTRO  | https://release-monitoring.org/project/12660 | 2.73         | 2.76         |     
              perl-http-daemon |  DISTRO  | https://release-monitoring.org/project/02975 | 6.12         | 6.13         |     
              perl-libwww-perl |  DISTRO  | https://release-monitoring.org/project/03024 | 6.60         | 6.61         |     
                perl-mail-dkim |  DISTRO  | https://release-monitoring.org/project/11868 | 1.20200824   | 1.20200907   |     
                 perl-net-http |  DISTRO  | https://release-monitoring.org/project/03152 | 6.21         | 6.22         |     
               perl-net-ssleay |  DISTRO  | https://release-monitoring.org/project/06575 | 1.85         | 1.92         |     
                  perl-sys-cpu |  DISTRO  | https://release-monitoring.org/project/14338 | 0.52         | 0.61         |     
               perl-xml-libxml |  DISTRO  | https://release-monitoring.org/project/03527 | 2.0134       | 2.0207       |     
                           php |  DISTRO  | https://release-monitoring.org/project/03627 | 8.0.16       | 8.1.3        |     
                      php-amqp |  DISTRO  | https://release-monitoring.org/project/15603 | 1.10.2       | 1.11.0       |     
                      php-apcu |  DISTRO  | https://release-monitoring.org/project/11010 | 5.1.20       | 5.1.21       |     
                     php-gnupg |  DISTRO  | https://release-monitoring.org/project/21743 | 1.5.0        | 1.5.1        | ORPH
                   php-imagick |  DISTRO  | https://release-monitoring.org/project/17401 | 3.5.0        | 3.7.0        | ORPH
                       php-pam |  DISTRO  | https://release-monitoring.org/project/241707 | 2.2.3        | 2.2.4        |     
                    php-xdebug |  DISTRO  | https://release-monitoring.org/project/13302 | 3.0.4        | 3.1.3        |     
                      php-yaml |  DISTRO  | https://release-monitoring.org/project/12515 | 2.2.1        | 2.2.2        | ORPH
                        pigpio |  DISTRO  | https://release-monitoring.org/project/21577 | 79           | 7301         |     
                          pigz |  DISTRO  | https://release-monitoring.org/project/03642 | 2.6          | 2.7          |     
                      pinentry |  DISTRO  | https://release-monitoring.org/project/03643 | 1.1.1        | 1.2.0        | ORPH
                      pipewire |  DISTRO  | https://release-monitoring.org/project/57357 | 0.3.45       | 0.3.47       |     
                       pkgconf |  DISTRO  | https://release-monitoring.org/project/12753 | 1.6.3        | 1.8.0        | ORPH
                          poco |  DISTRO  | https://release-monitoring.org/project/05418 | 1.10.1       | 1.11.1       |     
                          poke |  DISTRO  | https://release-monitoring.org/project/179926 | 1.4          | 2.1          | ORPH
               policycoreutils |  DISTRO  | https://release-monitoring.org/project/03680 | 3.2          | 20200710     |     
                       poppler |  DISTRO  | https://release-monitoring.org/project/03686 | 21.12.0      | 22.02.0      |     
                       postgis |  DISTRO  | https://release-monitoring.org/project/03694 | 3.2.0        | 3.2.1        |     
                 powerpc-utils |  DISTRO  | https://release-monitoring.org/project/10715 | 1.3.8        | 1.3.9        | ORPH
                      powertop |  DISTRO  | https://release-monitoring.org/project/03702 | 2.13         | 2.14         |     
                       proftpd |  DISTRO  | https://release-monitoring.org/project/07609 | 1.3.6e       | 1.3.7c       |     
                          proj |  DISTRO  | https://release-monitoring.org/project/21570 | 8.1.1        | 8.2.1        |     
                      protobuf |  DISTRO  | https://release-monitoring.org/project/03715 | 3.19.1       | 3.19.4       |     
                proxychains-ng |  DISTRO  | https://release-monitoring.org/project/06499 | 4.14         | 4.16         | ORPH
                          ptpd |  GUESS   | https://release-monitoring.org/project/03726 | 1.1.0        | 2.3.1        | ORPH
                       pugixml |  DISTRO  | https://release-monitoring.org/project/03728 | 1.11.4       | 1.12.1       |     
                    pulseaudio |  DISTRO  | https://release-monitoring.org/project/03729 | 14.2         | 15.0         |     
                  python-aenum |  DISTRO  | https://release-monitoring.org/project/34074 | 3.1.0        | 3.1.8        |     
             python-aioblescan |  DISTRO  | https://release-monitoring.org/project/21242 | 0.2.8        | 0.2.12       |     
                python-aiocoap |  DISTRO  | https://release-monitoring.org/project/21243 | 0.4.1        | 0.4.3        |     
             python-aioconsole |  DISTRO  | https://release-monitoring.org/project/21244 | 0.4.0        | 0.4.1        |     
        python-aiohttp-remotes |  DISTRO  | https://release-monitoring.org/project/21248 | 1.1.0        | 1.2.0        |     
                python-aiojobs |  DISTRO  | https://release-monitoring.org/project/21252 | 0.3.0        | 1.0.0        |     
              python-alsaaudio |  DISTRO  | https://release-monitoring.org/project/10072 | 0.8.4        | 0.9.0        |     
            python-argon2-cffi |  DISTRO  | https://release-monitoring.org/project/33377 | 21.1.0       | 21.3.0       |     
                  python-arrow |  DISTRO  | https://release-monitoring.org/project/05314 | 1.2.0        | 1.2.2        |     
                python-asgiref |  DISTRO  | https://release-monitoring.org/project/18462 | 3.3.4        | 3.5.0        |     
                   python-avro |  DISTRO  | https://release-monitoring.org/project/59411 | 1.10.0       | 1.11.0       |     
                 python-bidict |  DISTRO  | https://release-monitoring.org/project/114352 | 0.21.3       | 0.21.4       |     
                  python-bleak |  DISTRO  | https://release-monitoring.org/project/26271 | 0.12.1       | 0.14.2       |     
                  python-boto3 |  DISTRO  | https://release-monitoring.org/project/08778 | 1.19.2       | 1.21.3       |     
               python-botocore |  DISTRO  | https://release-monitoring.org/project/08748 | 1.22.2       | 1.24.3       |     
                    python-can |  DISTRO  | https://release-monitoring.org/project/17873 | 3.3.4        | 4.0.0        |     
                python-canopen |  DISTRO  | https://release-monitoring.org/project/23230 | 1.0.0        | 2.0.0b1      |     
               python-channels |  DISTRO  | https://release-monitoring.org/project/21937 | 2.3.1        | 3.0.4        |     
         python-channels-redis |  DISTRO  | https://release-monitoring.org/project/21936 | 2.4.1        | 3.3.1        |     
     python-charset-normalizer |  DISTRO  | https://release-monitoring.org/project/55366 | 2.0.11       | 2.0.12       |     
                python-cheroot |  DISTRO  | https://release-monitoring.org/project/20163 | 8.2.1        | 8.6.0        |     
               python-cherrypy |  DISTRO  | https://release-monitoring.org/project/03799 | 12.0.1       | 18.6.1       |     
                  python-click |  DISTRO  | https://release-monitoring.org/project/03802 | 7.1.2        | 8.0.4        |     
               python-colorlog |  DISTRO  | https://release-monitoring.org/project/12509 | 6.4.1        | 6.6.0        |     
         python-configshell-fb |  DISTRO  | https://release-monitoring.org/project/19734 | 1.1.29       | 1.5          |     
               python-crossbar |  DISTRO  | https://release-monitoring.org/project/21696 | 21.3.1       | 22.1.1       |     
                 python-cython |  DISTRO  | https://release-monitoring.org/project/12679 | 0.29.27      | 3.0.0a10     |     
                 python-daemon |  DISTRO  | https://release-monitoring.org/project/03816 | 2.2.3        | 2.3.0        |     
                 python-daphne |  DISTRO  | https://release-monitoring.org/project/21939 | 2.4.1        | 3.0.2        |     
              python-decorator |  DISTRO  | https://release-monitoring.org/project/03819 | 5.1.0        | 5.1.1        |     
                python-dialog3 |  DISTRO  | https://release-monitoring.org/project/03823 | 3.5.1        | 3.5.3        |     
                 python-distro |  DISTRO  | https://release-monitoring.org/project/12202 | 1.6.0        | 1.7.0        |     
              python-dnspython |  DISTRO  | https://release-monitoring.org/project/13190 | 2.1.0        | 2.2.0        |     
                 python-docker |  DISTRO  | https://release-monitoring.org/project/03847 | 4.1.0        | 5.0.3        |     
                  python-ecdsa |  DISTRO  | https://release-monitoring.org/project/08370 | 0.17.0       | 0.18.0b2     |     
               python-engineio |  DISTRO  | https://release-monitoring.org/project/15064 | 4.2.1        | 4.3.1        |     
            python-entrypoints |  DISTRO  | https://release-monitoring.org/project/12081 | 0.3          | 0.4          |     
               python-filelock |  DISTRO  | https://release-monitoring.org/project/11739 | 3.3.0        | 3.6.0        |     
                  python-flask |  DISTRO  | https://release-monitoring.org/project/03867 | 1.1.2        | 2.0.3        |     
     python-flask-expects-json |  DISTRO  | https://release-monitoring.org/project/127659 | 1.5.0        | 1.7.0        |     
          python-flask-jsonrpc |  DISTRO  | https://release-monitoring.org/project/21698 | 0.3.1        | 2.1.0        |     
       python-flask-sqlalchemy |  DISTRO  | https://release-monitoring.org/project/05701 | 2.4.1        | 2.5.1        |     
              python-flask-wtf |  DISTRO  | https://release-monitoring.org/project/05702 | 0.15.1       | 1.0.0        |     
                    python-git |  DISTRO  | https://release-monitoring.org/project/06459 | 3.1.24       | 3.1.27       |     
                 python-gitdb2 |  DISTRO  | https://release-monitoring.org/project/12730 | 4.0.7        | 4.0.9        |     
               python-greenlet |  DISTRO  | https://release-monitoring.org/project/06870 | 1.1.2        | 2.0.0a1      |     
               python-httplib2 |  DISTRO  | https://release-monitoring.org/project/03887 | 0.19.1       | 0.20.4       |     
               python-humanize |  DISTRO  | https://release-monitoring.org/project/19799 | 3.11.0       | 4.0.0        |     
              python-installer |  DISTRO  | https://release-monitoring.org/project/197662 | 0.4.0        | 0.5.0        |     
                python-ipython |  DISTRO  | https://release-monitoring.org/project/01399 | 7.31.1       | 8.0.1        |     
                python-iso8601 |  DISTRO  | https://release-monitoring.org/project/17228 | 0.1.14       | 1.0.2        |     
           python-itsdangerous |  DISTRO  | https://release-monitoring.org/project/03892 | 2.0.1        | 2.1.0        |     
                  python-iwlib |  DISTRO  | https://release-monitoring.org/project/51611 | 1.5          | 1.7.0        |     
         python-jaraco-classes |  DISTRO  | https://release-monitoring.org/project/20150 | 2.0          | 3.2.1        |     
       python-jaraco-functools |  DISTRO  | https://release-monitoring.org/project/20165 | 2.0          | 3.5.0        |     
             python-jsonschema |  DISTRO  | https://release-monitoring.org/project/03898 | 2.5.1        | 4.4.0        |     
                python-keyring |  DISTRO  | https://release-monitoring.org/project/03901 | 19.2.0       | 23.5.0       |     
             python-kiwisolver |  DISTRO  | https://release-monitoring.org/project/16910 | 1.1.0        | 1.3.2        |     
                python-libusb1 |  DISTRO  | https://release-monitoring.org/project/12301 | 2.0.1        | 3.0.0        |     
                   python-lxml |  DISTRO  | https://release-monitoring.org/project/03914 | 4.6.5        | 4.7.1        |     
                   python-mako |  DISTRO  | https://release-monitoring.org/project/03915 | 1.1.5        | 1.1.6        |     
               python-markdown |  DISTRO  | https://release-monitoring.org/project/03916 | 3.3.4        | 3.3.6        |     
              python-markdown2 |  DISTRO  | https://release-monitoring.org/project/03917 | 2.4.1        | 2.4.2        |     
             python-markupsafe |  DISTRO  | https://release-monitoring.org/project/03918 | 2.0.1        | 2.1.0        |     
             python-matplotlib |  DISTRO  | https://release-monitoring.org/project/03919 | 3.4.3        | 3.5.1        |     
        python-memory-profiler |  DISTRO  | https://release-monitoring.org/project/38508 | 0.58.0       | 0.60.0       |     
                python-mistune |  DISTRO  | https://release-monitoring.org/project/06189 | 0.8.4        | 2.0.2        |     
         python-more-itertools |  DISTRO  | https://release-monitoring.org/project/12201 | 8.10.0       | 8.12.0       |     
                  python-msgfy |  DISTRO  | https://release-monitoring.org/project/29716 | 0.1.0        | 0.2.0        |     
         python-networkmanager |  DISTRO  | https://release-monitoring.org/project/12909 | 2.1          | 2.2          |     
                  python-numpy |  DISTRO  | https://release-monitoring.org/project/02509 | 1.21.2       | 1.22.2       |     
               python-oauthlib |  DISTRO  | https://release-monitoring.org/project/05377 | 3.1.1        | 3.2.0        |     
          python-opcua-asyncio |  DISTRO  | https://release-monitoring.org/project/131612 | 0.8.4        | 0.98.9       |     
              python-paho-mqtt |  DISTRO  | https://release-monitoring.org/project/06084 | 1.4.0        | 1.6.1        |     
               python-paramiko |  DISTRO  | https://release-monitoring.org/project/03954 | 2.7.2        | 2.9.2        |     
                 python-pathpy |  DISTRO  | https://release-monitoring.org/project/21703 | 12.0.1       | 12.5.0       |     
                    python-pbr |  DISTRO  | https://release-monitoring.org/project/03960 | 5.6.0        | 5.8.1        |     
                 python-pillow |  DISTRO  | https://release-monitoring.org/project/07974 | 9.0.0        | 9.0.1        |     
                    python-pip |  DISTRO  | https://release-monitoring.org/project/06529 | 21.2.4       | 22.0.3       |     
                python-portend |  DISTRO  | https://release-monitoring.org/project/20203 | 2.5          | 3.1.0        |     
         python-prompt-toolkit |  DISTRO  | https://release-monitoring.org/project/08742 | 3.0.20       | 3.0.28       |     
               python-protobuf |  DISTRO  | https://release-monitoring.org/project/03715 | 3.19.1       | 3.19.4       |     
                 python-psutil |  DISTRO  | https://release-monitoring.org/project/03978 | 5.8.0        | 5.9.0        |     
               python-psycopg2 |  DISTRO  | https://release-monitoring.org/project/03979 | 2.9.1        | 2.9.3        |     
                   python-pudb |  DISTRO  | https://release-monitoring.org/project/03980 | 2021.1       | 2022.1       |     
                     python-py |  DISTRO  | https://release-monitoring.org/project/03981 | 1.10.0       | 1.11.0       |     
                 python-pybind |  DISTRO  | https://release-monitoring.org/project/13384 | 2.9.0        | 2.9.1        |     
                python-pycairo |  DISTRO  | https://release-monitoring.org/project/13166 | 1.19.1       | 1.20.1       |     
          python-pycryptodomex |  DISTRO  | https://release-monitoring.org/project/36851 | 3.14.0       | 3.14.1       |     
                  python-pydal |  DISTRO  | https://release-monitoring.org/project/21582 | 20210626.3   | 20220213.2   |     
               python-pydantic |  DISTRO  | https://release-monitoring.org/project/29768 | 1.8.2        | 1.9.0        |     
             python-pyelftools |  DISTRO  | https://release-monitoring.org/project/16219 | 0.27         | 0.28         |     
                 python-pygame |  DISTRO  | https://release-monitoring.org/project/17480 | d61ea8eabd56 | 2.1.2        |     
               python-pygments |  DISTRO  | https://release-monitoring.org/project/03986 | 2.7.4        | 2.11.2       |     
             python-pyhamcrest |  DISTRO  | https://release-monitoring.org/project/11633 | 2.0.2        | 2.0.3        |     
                  python-pyicu |  DISTRO  | https://release-monitoring.org/project/12004 | 1.9.7        | 2.8.1        |     
              python-pylibftdi |  DISTRO  | https://release-monitoring.org/project/21583 | 0.18.1       | 0.20.0       |     
               python-pymodbus |  DISTRO  | https://release-monitoring.org/project/15600 | 2.2.0        | 2.5.3        |     
                python-pymupdf |  DISTRO  | https://release-monitoring.org/project/17320 | 1.18.14      | 1.19.5       |     
              python-pyopenssl |  DISTRO  | https://release-monitoring.org/project/05535 | 21.0.0       | 22.0.0       |     
               python-pyparted |  DISTRO  | https://release-monitoring.org/project/15558 | 3.11.6       | 3.11.7       |     
                 python-pyphen |  DISTRO  | https://release-monitoring.org/project/19681 | 0.11.0       | 0.12.0       |     
                  python-pyqt5 |  DISTRO  | https://release-monitoring.org/project/20104 | 5.7          | 5.15.6       |     
               python-pyroute2 |  DISTRO  | https://release-monitoring.org/project/20081 | 0.5.7        | 0.6.6        |     
          python-pytablereader |  DISTRO  | https://release-monitoring.org/project/21592 | 0.26.1       | 0.31.1       |     
          python-pytablewriter |  DISTRO  | https://release-monitoring.org/project/21593 | 0.46.1       | 0.64.1       |     
                 python-pytest |  DISTRO  | https://release-monitoring.org/project/03765 | 6.2.5        | 7.0.1        |     
         python-pytest-asyncio |  DISTRO  | https://release-monitoring.org/project/07273 | 0.15.1       | 0.18.1       |     
                 python-pyudev |  DISTRO  | https://release-monitoring.org/project/08485 | 0.22.0       | 0.23.2       |     
                  python-pyzmq |  DISTRO  | https://release-monitoring.org/project/04104 | 19.0.2       | 22.3.0       |     
                  python-redis |  DISTRO  | https://release-monitoring.org/project/03992 | 3.5.3        | 4.1.4        |     
                python-reentry |  DISTRO  | https://release-monitoring.org/project/21596 | 1.3.2        | 1.3.3        |     
                  python-regex |  DISTRO  | https://release-monitoring.org/project/05548 | 2021.4.4     | 2022.1.18    |     
      python-requests-oauthlib |  DISTRO  | https://release-monitoring.org/project/11803 | 1.3.0        | 1.3.1        |     
               python-rpi-gpio |  DISTRO  | https://release-monitoring.org/project/12026 | 0.7.0        | 0.7.1        |     
             python-rpi-ws281x |  DISTRO  | https://release-monitoring.org/project/21898 | 4.3.0        | 4.3.2        |     
                    python-rsa |  DISTRO  | https://release-monitoring.org/project/08808 | 4.7.2        | 4.8          |     
              python-rtslib-fb |  DISTRO  | https://release-monitoring.org/project/19641 | 2.1.74       | 2.2          |     
             python-s3transfer |  DISTRO  | https://release-monitoring.org/project/10428 | 0.5.0        | 0.5.1        |     
          python-secretstorage |  DISTRO  | https://release-monitoring.org/project/04020 | 3.1.2        | 3.3.1        |     
       python-semantic-version |  DISTRO  | https://release-monitoring.org/project/06514 | 2.8.5        | 2.9.0        |     
             python-sentry-sdk |  DISTRO  | https://release-monitoring.org/project/21603 | 1.4.3        | 1.5.5        |     
       python-service-identity |  DISTRO  | https://release-monitoring.org/project/07917 | 18.1.0       | 21.1.0       |     
             python-setuptools |  DISTRO  | https://release-monitoring.org/project/04021 | 60.7.0       | 60.9.3       |     
             python-simplejson |  DISTRO  | https://release-monitoring.org/project/04026 | 3.17.5       | 3.17.6       |     
           python-simplesqlite |  DISTRO  | https://release-monitoring.org/project/21608 | 0.45.2       | 1.3.0        |     
                    python-sip |  DISTRO  | https://release-monitoring.org/project/13626 | 4.18         | 5.0.0        |     
                 python-smmap2 |  DISTRO  | https://release-monitoring.org/project/12729 | 4.0.0        | 5.0.0        |     
                 python-snappy |  DISTRO  | https://release-monitoring.org/project/07203 | 0.5.4        | 0.6.0        |     
               python-socketio |  DISTRO  | https://release-monitoring.org/project/21611 | 5.4.0        | 5.5.2        |     
              python-soupsieve |  DISTRO  | https://release-monitoring.org/project/27570 | 2.2.1        | 2.3.1        |     
             python-sqlalchemy |  DISTRO  | https://release-monitoring.org/project/04034 | 1.3.10       | 1.4.31       |     
           python-sqliteschema |  DISTRO  | https://release-monitoring.org/project/29718 | 1.2.1        | 1.3.0        |     
               python-sqlparse |  DISTRO  | https://release-monitoring.org/project/04038 | 0.3.0        | 0.4.2        |     
                python-tempora |  DISTRO  | https://release-monitoring.org/project/21225 | 1.14.1       | 5.0.1        |     
                 python-thrift |  DISTRO  | https://release-monitoring.org/project/21614 | 0.13.0       | 0.15.0       |     
               python-tinycss2 |  DISTRO  | https://release-monitoring.org/project/16655 | 1.1.0        | 1.1.1        |     
                  python-tomli |  DISTRO  | https://release-monitoring.org/project/207408 | 1.2.0        | 2.0.1        |     
                python-tornado |  DISTRO  | https://release-monitoring.org/project/07498 | 6.0.4        | 6.1          |     
                   python-tqdm |  DISTRO  | https://release-monitoring.org/project/11524 | 4.40.1       | 4.62.3       |     
              python-traitlets |  DISTRO  | https://release-monitoring.org/project/12211 | 5.1.0        | 5.1.1        |     
                   python-treq |  DISTRO  | https://release-monitoring.org/project/19614 | 20.3.0       | 22.2.0       |     
      python-typing-extensions |  DISTRO  | https://release-monitoring.org/project/19755 | 3.10.0.2     | 4.1.1        |     
                  python-ujson |  DISTRO  | https://release-monitoring.org/project/04076 | 4.2.0        | 5.1.0        |     
 python-unittest-xml-reporting |  DISTRO  | https://release-monitoring.org/project/72281 | 3.0.4        | 3.2.0        |     
             python-validators |  DISTRO  | https://release-monitoring.org/project/19818 | 0.15.0       | 0.18.2       |     
                python-wcwidth |  DISTRO  | https://release-monitoring.org/project/08743 | 0.1.9        | 0.2.5        |     
             python-weasyprint |  DISTRO  | https://release-monitoring.org/project/11057 | 53.4         | 54.1         |     
                 python-web2py |  DISTRO  | https://release-monitoring.org/project/20617 | 2.21.1       | 2.22.3       |     
                  python-webpy |  DISTRO  | https://release-monitoring.org/project/04090 | 0.40         | 0.62         |     
       python-websocket-client |  DISTRO  | https://release-monitoring.org/project/07288 | 0.58.0       | 1.2.3        |     
             python-websockets |  DISTRO  | https://release-monitoring.org/project/08100 | 10.0         | 10.1         |     
               python-werkzeug |  DISTRO  | https://release-monitoring.org/project/04092 | 1.0.1        | 2.0.3        |     
                  python-wrapt |  DISTRO  | https://release-monitoring.org/project/06108 | 1.12.1       | 1.13.3       |     
                python-wtforms |  DISTRO  | https://release-monitoring.org/project/11805 | 2.3.3        | 3.0.1        |     
                   python-xlib |  DISTRO  | https://release-monitoring.org/project/12180 | 0.27         | 0.31         |     
             python-xlsxwriter |  DISTRO  | https://release-monitoring.org/project/12031 | 3.0.1        | 3.0.2        |     
                   python-yarl |  DISTRO  | https://release-monitoring.org/project/12895 | 1.7.2        | 1.8.0        |     
               python-zeroconf |  DISTRO  | https://release-monitoring.org/project/12681 | 0.29.0       | 0.38.3       |     
                          qpdf |  DISTRO  | https://release-monitoring.org/project/05542 | 10.5.0       | 10.6.2       |     
                   qpid-proton |  DISTRO  | https://release-monitoring.org/project/15198 | 0.35.0       | 0.36.0       |     
                       qt5coap |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.2.3        |     
                        qt5knx |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.2.3        |     
                       qt5mqtt |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.2.3        |     
                      qt5opcua |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.2.3        |     
                  qt5webengine |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.2.3        |     
                        quazip |  DISTRO  | https://release-monitoring.org/project/04141 | 1.1          | 1.2          |     
                           qwt |  DISTRO  | https://release-monitoring.org/project/04147 | 6.1.6        | 6.2.0        | ORPH
               rabbitmq-server |  DISTRO  | https://release-monitoring.org/project/05585 | 3.8.2        | 3.9.13       |     
                        ranger |  DISTRO  | https://release-monitoring.org/project/07426 | 1.7.2        | 1.9.3        |     
                   restorecond |  DISTRO  | https://release-monitoring.org/project/16520 | 3.3          | 20200710     | ORPH
              riemann-c-client |  DISTRO  | https://release-monitoring.org/project/21389 | 1.10.4       | 1.10.5       | ORPH
                     rng-tools |  DISTRO  | https://release-monitoring.org/project/04202 | 6.14         | 6.15         |     
                       rocksdb |  DISTRO  | https://release-monitoring.org/project/15560 | 6.20.3       | 6.29.3       |     
                       rsyslog |  DISTRO  | https://release-monitoring.org/project/04218 | 8.2010.0     | 8.2202.0     |     
                          rtai |  DISTRO  | https://release-monitoring.org/project/21658 | 4.0.1        | 5.3          | ORPH
                          rtty |  DISTRO  | https://release-monitoring.org/project/87994 | 7.4.0        | 8.0.0        |     
                         rygel |  DISTRO  | https://release-monitoring.org/project/04751 | 0.40.2       | 0.40.3       |     
                    s390-tools |  DISTRO  | https://release-monitoring.org/project/10714 | 2.19.0       | 2.20.0       |     
                            s6 |  DISTRO  | https://release-monitoring.org/project/05485 | 2.10.0.3     | 2.11.0.1     |     
                        s6-dns |  DISTRO  | https://release-monitoring.org/project/16547 | 2.3.5.1      | 2.3.5.3      |     
                 s6-linux-init |  DISTRO  | https://release-monitoring.org/project/16552 | 1.0.6.3      | 1.0.7.2      |     
                s6-linux-utils |  DISTRO  | https://release-monitoring.org/project/16551 | 2.5.1.5      | 2.5.1.7      |     
                 s6-networking |  DISTRO  | https://release-monitoring.org/project/16550 | 2.4.1.1      | 2.5.1.0      |     
             s6-portable-utils |  DISTRO  | https://release-monitoring.org/project/16549 | 2.2.3.2      | 2.2.3.4      |     
                         s6-rc |  DISTRO  | https://release-monitoring.org/project/16548 | 0.5.2.2      | 0.5.3.0      |     
                      safeclib |  DISTRO  | https://release-monitoring.org/project/21385 | 3.7.1        | 01022022     |     
                        samba4 |  DISTRO  | https://release-monitoring.org/project/04758 | 4.15.4       | 4.15.5       |     
                 sane-backends |  DISTRO  | https://release-monitoring.org/project/04760 | 1.0.32       | 1.1.1        |     
                         scons |  DISTRO  | https://release-monitoring.org/project/04770 | 3.1.2        | 4.3.0        |     
                        screen |  DISTRO  | https://release-monitoring.org/project/04772 | 4.8.0        | 4.9.0        | ORPH
                       sdl_gfx |  DISTRO  | https://release-monitoring.org/project/04778 | 2.0.23       | 2.0.25       | ORPH
                        sdparm |  DISTRO  | https://release-monitoring.org/project/04787 | 1.10         | 1.12         |     
                       sedutil |  DISTRO  | https://release-monitoring.org/project/15203 | 1.15.1       | 1.20.0       |     
                    sentry-cli |  DISTRO  | https://release-monitoring.org/project/135642 | 1.59.0       | 1.72.2       |     
                 sentry-native |  DISTRO  | https://release-monitoring.org/project/135639 | 0.4.1        | 0.4.15       |     
                       ser2net |  DISTRO  | https://release-monitoring.org/project/21655 | 4.3.4        | 4.3.5        |     
                     sg3_utils |  DISTRO  | https://release-monitoring.org/project/04801 | 1.47         | 1.47r915     |     
              shared-mime-info |  DISTRO  | https://release-monitoring.org/project/05524 | 1.12         | 2.1          | ORPH
                          shim |  DISTRO  | https://release-monitoring.org/project/10719 | 15.4         | 15.5         |     
                       skalibs |  DISTRO  | https://release-monitoring.org/project/05486 | 2.10.0.3     | 2.11.1.0     |     
                        sngrep |  DISTRO  | https://release-monitoring.org/project/17075 | 1.4.7        | 1.4.10       | ORPH
                        snmppp |  DISTRO  | https://release-monitoring.org/project/21318 | 3.4.2        | 3.4.9        |     
                        snort3 |  DISTRO  | https://release-monitoring.org/project/13263 | 3.1.18.0     | 3.1.23.0     |     
                     sofia-sip |  DISTRO  | https://release-monitoring.org/project/10509 | 1.13.6-41... | 1.13.7       |     
                     softether |  DISTRO  | https://release-monitoring.org/project/21383 | 4.30-9700... | 4.38-9760... |     
       sound-theme-freedesktop |  DISTRO  | https://release-monitoring.org/project/10152 | 0.7          | 0.8          |     
                       spandsp |  DISTRO  | https://release-monitoring.org/project/12600 | 3.0.0-6ec... | 3.0.0        |     
                    sphinxbase |  DISTRO  | https://release-monitoring.org/project/20548 | 5prealpha    | 0.8          |     
                spice-protocol |  DISTRO  | https://release-monitoring.org/project/14892 | 0.14.3       | 0.14.4       |     
                         squid |  DISTRO  | https://release-monitoring.org/project/04880 | 5.3          | 5.4.1        | ORPH
                         sshfs |  DISTRO  | https://release-monitoring.org/project/11058 | 3.7.1        | 3.7.2        | ORPH
             start-stop-daemon |  DISTRO  | https://release-monitoring.org/project/08127 | 1.20.7.1     | 1.21.1       | ORPH
          startup-notification |  DISTRO  | https://release-monitoring.org/project/10089 | 0.9          | 0.12         | ORPH
                        stress |  DISTRO  | https://release-monitoring.org/project/08048 | 1.0.4        | 1.0.5        |     
                       stunnel |  DISTRO  | https://release-monitoring.org/project/04901 | 5.60         | 5.62         |     
                          sudo |  DISTRO  | https://release-monitoring.org/project/04906 | 1.9.8p2      | 1.9.9        | ORPH
                    supervisor |  DISTRO  | https://release-monitoring.org/project/16289 | 4.2.2        | 4.2.4        | ORPH
                       synergy |  DISTRO  | https://release-monitoring.org/project/05718 | 2.0.12-beta  | 2.3.2        |     
                        sysdig |  DISTRO  | https://release-monitoring.org/project/16898 | 0.23.1       | 0.28.0       |     
                     syslog-ng |  DISTRO  | https://release-monitoring.org/project/04930 | 3.34.1       | 3.35.1       |     
                       sysprof |  DISTRO  | https://release-monitoring.org/project/21649 | 1.2.0        | 3.42.1       |     
                       sysstat |  DISTRO  | https://release-monitoring.org/project/04931 | 12.4.2       | 12.5.5       | ORPH
             systemd-bootchart |  DISTRO  | https://release-monitoring.org/project/11774 | 233          | 234          |     
                      sysvinit |  DISTRO  | https://release-monitoring.org/project/21648 | 2.99         | 3.01         | ORPH
                         tclap |  DISTRO  | https://release-monitoring.org/project/04942 | 1.2.4        | 1.2.5        |     
                     tcpreplay |  DISTRO  | https://release-monitoring.org/project/13716 | 4.3.4        | 4.4.1        | ORPH
                        thrift |  DISTRO  | https://release-monitoring.org/project/05581 | 0.14.1       | 0.16.0       | ORPH
                   timescaledb |  DISTRO  | https://release-monitoring.org/project/17545 | 2.5.1        | 2.5.2        |     
                       tinyssh |  DISTRO  | https://release-monitoring.org/project/14678 | 20210601     | 20220101     |     
                       tinyxml |  DISTRO  | https://release-monitoring.org/project/10162 | 2.6.2_2      | 2.6.2        | ORPH
                           tio |  DISTRO  | https://release-monitoring.org/project/20587 | 1.32         | 1.35         |     
                          tmux |  DISTRO  | https://release-monitoring.org/project/04980 | 3.1c         | 3.2a         |     
                     tpm-tools |  DISTRO  | https://release-monitoring.org/project/21640 | 1.3.9.1      | 1.3.9.2      |     
                    tpm2-abrmd |  DISTRO  | https://release-monitoring.org/project/16819 | 2.3.3        | 2.4.0        | ORPH
                     tpm2-totp |  DISTRO  | https://release-monitoring.org/project/18790 | 0.2.1        | 0.3.0        |     
                      tpm2-tss |  DISTRO  | https://release-monitoring.org/project/12683 | 3.1.0        | 3.2.0        | ORPH
                     trace-cmd |  DISTRO  | https://release-monitoring.org/project/07873 | 2.9.6        | 2.9.7        |     
                          tree |  DISTRO  | https://release-monitoring.org/project/05006 | 1.8.0        | 2.0.2        |     
                   uboot-tools |  DISTRO  | https://release-monitoring.org/project/05022 | 2021.07      | 2022.01      |     
                       udpcast |  DISTRO  | https://release-monitoring.org/project/10206 | 20200328     | 20211207     | ORPH
                       uftrace |  DISTRO  | https://release-monitoring.org/project/195039 | 0.10         | 0.11         |     
                           uhd |  DISTRO  | https://release-monitoring.org/project/12572 | 3.15.0.0     | 4.1.0.5      |     
                       unbound |  DISTRO  | https://release-monitoring.org/project/05042 | 1.14.0       | 1.15.0       |     
              unclutter-xfixes |  DISTRO  | https://release-monitoring.org/project/09206 | 1.5          | 1.6          |     
                       unionfs |  DISTRO  | https://release-monitoring.org/project/17617 | 2.1          | 2.2          |     
                         unrar |  DISTRO  | https://release-monitoring.org/project/13306 | 6.1.3        | 6.1.4        | ORPH
                      upmpdcli |  DISTRO  | https://release-monitoring.org/project/15848 | 1.5.12       | 1.5.13       |     
                        upower |  DISTRO  | https://release-monitoring.org/project/05056 | 0.99.11      | 0.99.15      |     
                    util-linux |  DISTRO  | https://release-monitoring.org/project/08179 | 2.37.3       | 2.37.4       | ORPH
               util-linux-libs |  DISTRO  | https://release-monitoring.org/project/08179 | 2.37.3       | 2.37.4       | ORPH
                           uvw |  DISTRO  | https://release-monitoring.org/project/33083 | 2.10.0_li... | 2.11.0_li... |     
                          vala |  DISTRO  | https://release-monitoring.org/project/05065 | 0.52.4       | 0.55.3       | ORPH
                      valijson |  DISTRO  | https://release-monitoring.org/project/18452 | 0.3          | 0.6          |     
                           vim |  DISTRO  | https://release-monitoring.org/project/05092 | 8.2.4301     | 8.2.4424     | ORPH
                        vnstat |  DISTRO  | https://release-monitoring.org/project/07283 | 2.8          | 2.9          |     
                          vpnc |  DISTRO  | https://release-monitoring.org/project/15955 | 0.5.3r550... | 0.5.3        | ORPH
                         vuejs |  DISTRO  | https://release-monitoring.org/project/89353 | 3.2.22       | 3.2.31       |     
                vulkan-headers |  DISTRO  | https://release-monitoring.org/project/88835 | 1.2.203      | 1.3.206      | ORPH
                        waffle |  DISTRO  | https://release-monitoring.org/project/21633 | 1.6.1        | 1.7.0        |     
                       wayland |  DISTRO  | https://release-monitoring.org/project/10061 | 1.19.0       | 1.20.0       |     
                     waylandpp |  DISTRO  | https://release-monitoring.org/project/16969 | 0.2.8        | 0.2.9        |     
                          webp |  DISTRO  | https://release-monitoring.org/project/01761 | 1.2.1        | 1.2.2        |     
       webrtc-audio-processing |  DISTRO  | https://release-monitoring.org/project/15929 | 0.3.1        | 1.0          | ORPH
             wilc1000-firmware |  DISTRO  | https://release-monitoring.org/project/65598 | 14.1         | 15.6         |     
                          wine |  DISTRO  | https://release-monitoring.org/project/05134 | 6.0          | 7.2          |     
        wireguard-linux-compat |  DISTRO  | https://release-monitoring.org/project/62379 | 1.0.20210606 | 1.0.20211208 |     
                   wireplumber |  DISTRO  | https://release-monitoring.org/project/235056 | 0.4.2        | 0.4.8        | ORPH
                     wireshark |  DISTRO  | https://release-monitoring.org/project/05137 | 3.4.11       | 3.6.2        | ORPH
                       wlroots |  DISTRO  | https://release-monitoring.org/project/18357 | 0.14.1       | 0.15.1       |     
                       wolfssl |  DISTRO  | https://release-monitoring.org/project/21631 | 4.8.1-stable | 5.1.1        |     
                     wpewebkit |  DISTRO  | https://release-monitoring.org/project/17557 | 2.34.6       | 2.35.1       |     
                     xapp_luit |  DISTRO  | https://release-monitoring.org/project/15047 | 1.1.1        | 20220111     |     
                xdg-dbus-proxy |  DISTRO  | https://release-monitoring.org/project/58434 | 0.1.2        | 0.1.3        |     
                       xdotool |  DISTRO  | https://release-monitoring.org/project/08648 | 3.20160805.1 | 3.20211022.1 |     
   xdriver_xf86-input-libinput |  DISTRO  | https://release-monitoring.org/project/05782 | 1.2.0        | 1.2.1        |     
     xdriver_xf86-video-amdgpu |  DISTRO  | https://release-monitoring.org/project/15900 | 19.1.0       | 21.0.0       |     
                           xen |  DISTRO  | https://release-monitoring.org/project/05181 | 4.14.4       | 4.16.0       |     
                        xinetd |  DISTRO  | https://release-monitoring.org/project/06382 | 2.3.15       | 2.3.15.4     |     
              xkeyboard-config |  DISTRO  | https://release-monitoring.org/project/05191 | 2.34         | 2.35.1       |     
                         xmrig |  DISTRO  | https://release-monitoring.org/project/17499 | 6.16.3       | 6.16.4       |     
                  xscreensaver |  DISTRO  | https://release-monitoring.org/project/05269 | 5.45         | 6.02         |     
           xserver_xorg-server |  DISTRO  | https://release-monitoring.org/project/05250 | 21.1.2       | 21.1.3       |     
                xtables-addons |  DISTRO  | https://release-monitoring.org/project/07736 | 3.17         | 3.19         | ORPH
                         xterm |  DISTRO  | https://release-monitoring.org/project/05272 | 367          | 370          | ORPH
                      yaml-cpp |  DISTRO  | https://release-monitoring.org/project/05284 | 0.6.3        | 0.7.0        | ORPH
                        zabbix |  DISTRO  | https://release-monitoring.org/project/05492 | 5.4.9        | 6.0.0        |     
                           zfs |  DISTRO  | https://release-monitoring.org/project/11706 | 2.0.5        | 2.1.2        |     

Packages having CVEs
====================

CVEs for the 'master' branch
----------------------------

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                        apache | CVE-1999-0236    | https://security-tracker.debian.org/tracker/CVE-1999-0236   
                        apache | CVE-1999-0289    | https://security-tracker.debian.org/tracker/CVE-1999-0289   
                        apache | CVE-1999-0678    | https://security-tracker.debian.org/tracker/CVE-1999-0678   
                        apache | CVE-1999-1237    | https://security-tracker.debian.org/tracker/CVE-1999-1237   
                        apache | CVE-1999-1412    | https://security-tracker.debian.org/tracker/CVE-1999-1412   
                        apache | CVE-2007-0086    | https://security-tracker.debian.org/tracker/CVE-2007-0086   
                        apache | CVE-2007-0450    | https://security-tracker.debian.org/tracker/CVE-2007-0450   
                        apache | CVE-2007-4465    | https://security-tracker.debian.org/tracker/CVE-2007-4465   
                        apache | CVE-2007-5000    | https://security-tracker.debian.org/tracker/CVE-2007-5000   
                        apache | CVE-2007-6388    | https://security-tracker.debian.org/tracker/CVE-2007-6388   
                        apache | CVE-2007-6420    | https://security-tracker.debian.org/tracker/CVE-2007-6420   
                        apache | CVE-2007-6421    | https://security-tracker.debian.org/tracker/CVE-2007-6421   
                        apache | CVE-2007-6422    | https://security-tracker.debian.org/tracker/CVE-2007-6422   
                        apache | CVE-2007-6423    | https://security-tracker.debian.org/tracker/CVE-2007-6423   
                        apache | CVE-2008-0455    | https://security-tracker.debian.org/tracker/CVE-2008-0455   
                        apache | CVE-2008-2168    | https://security-tracker.debian.org/tracker/CVE-2008-2168   
                        apache | CVE-2008-2939    | https://security-tracker.debian.org/tracker/CVE-2008-2939   
                        apache | CVE-2009-1195    | https://security-tracker.debian.org/tracker/CVE-2009-1195   
                        apache | CVE-2009-1890    | https://security-tracker.debian.org/tracker/CVE-2009-1890   
                        apache | CVE-2009-1891    | https://security-tracker.debian.org/tracker/CVE-2009-1891   
                        apache | CVE-2009-2699    | https://security-tracker.debian.org/tracker/CVE-2009-2699   
                        apache | CVE-2010-0408    | https://security-tracker.debian.org/tracker/CVE-2010-0408   
                        apache | CVE-2010-0425    | https://security-tracker.debian.org/tracker/CVE-2010-0425   
                        apache | CVE-2010-0434    | https://security-tracker.debian.org/tracker/CVE-2010-0434   
                        apache | CVE-2010-1452    | https://security-tracker.debian.org/tracker/CVE-2010-1452   
                        apache | CVE-2014-0231    | https://security-tracker.debian.org/tracker/CVE-2014-0231   
                      apparmor | CVE-2016-1585    | https://security-tracker.debian.org/tracker/CVE-2016-1585   
                           apr | CVE-2021-35940   | https://security-tracker.debian.org/tracker/CVE-2021-35940  
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                          atop | CVE-2011-3618    | https://security-tracker.debian.org/tracker/CVE-2011-3618   
                         avahi | CVE-2021-3468    | https://security-tracker.debian.org/tracker/CVE-2021-3468   
                     belle-sip | CVE-2021-33056   | https://security-tracker.debian.org/tracker/CVE-2021-33056  
                     belle-sip | CVE-2021-43610   | https://security-tracker.debian.org/tracker/CVE-2021-43610  
                     belle-sip | CVE-2021-43611   | https://security-tracker.debian.org/tracker/CVE-2021-43611  
                        bento4 | CVE-2020-23331   | https://security-tracker.debian.org/tracker/CVE-2020-23331  
                        bento4 | CVE-2020-23332   | https://security-tracker.debian.org/tracker/CVE-2020-23332  
                    berkeleydb | CVE-2017-3604    | https://security-tracker.debian.org/tracker/CVE-2017-3604   
                    berkeleydb | CVE-2017-3605    | https://security-tracker.debian.org/tracker/CVE-2017-3605   
                    berkeleydb | CVE-2017-3606    | https://security-tracker.debian.org/tracker/CVE-2017-3606   
                    berkeleydb | CVE-2017-3607    | https://security-tracker.debian.org/tracker/CVE-2017-3607   
                    berkeleydb | CVE-2017-3608    | https://security-tracker.debian.org/tracker/CVE-2017-3608   
                    berkeleydb | CVE-2017-3609    | https://security-tracker.debian.org/tracker/CVE-2017-3609   
                    berkeleydb | CVE-2017-3610    | https://security-tracker.debian.org/tracker/CVE-2017-3610   
                    berkeleydb | CVE-2017-3611    | https://security-tracker.debian.org/tracker/CVE-2017-3611   
                    berkeleydb | CVE-2017-3612    | https://security-tracker.debian.org/tracker/CVE-2017-3612   
                    berkeleydb | CVE-2017-3613    | https://security-tracker.debian.org/tracker/CVE-2017-3613   
                    berkeleydb | CVE-2017-3614    | https://security-tracker.debian.org/tracker/CVE-2017-3614   
                    berkeleydb | CVE-2017-3615    | https://security-tracker.debian.org/tracker/CVE-2017-3615   
                    berkeleydb | CVE-2017-3616    | https://security-tracker.debian.org/tracker/CVE-2017-3616   
                    berkeleydb | CVE-2017-3617    | https://security-tracker.debian.org/tracker/CVE-2017-3617   
                    berkeleydb | CVE-2019-2708    | https://security-tracker.debian.org/tracker/CVE-2019-2708   
                    berkeleydb | CVE-2020-2981    | https://security-tracker.debian.org/tracker/CVE-2020-2981   
                      binutils | CVE-2021-45078   | https://security-tracker.debian.org/tracker/CVE-2021-45078  
                       bitcoin | CVE-2012-1909    | https://security-tracker.debian.org/tracker/CVE-2012-1909   
                       bitcoin | CVE-2012-4682    | https://security-tracker.debian.org/tracker/CVE-2012-4682   
                       bitcoin | CVE-2012-4683    | https://security-tracker.debian.org/tracker/CVE-2012-4683   
                       bitcoin | CVE-2013-2272    | https://security-tracker.debian.org/tracker/CVE-2013-2272   
                       bitcoin | CVE-2013-2273    | https://security-tracker.debian.org/tracker/CVE-2013-2273   
                       bitcoin | CVE-2013-2292    | https://security-tracker.debian.org/tracker/CVE-2013-2292   
                       bitcoin | CVE-2013-2293    | https://security-tracker.debian.org/tracker/CVE-2013-2293   
                       bitcoin | CVE-2013-3220    | https://security-tracker.debian.org/tracker/CVE-2013-3220   
                  bluez5_utils | CVE-2020-12352   | https://security-tracker.debian.org/tracker/CVE-2020-12352  
                  bluez5_utils | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
          bluez5_utils-headers | CVE-2020-12352   | https://security-tracker.debian.org/tracker/CVE-2020-12352  
          bluez5_utils-headers | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
                        bsdiff | CVE-2020-14315   | https://security-tracker.debian.org/tracker/CVE-2020-14315  
                         cairo | CVE-2019-6461    | https://security-tracker.debian.org/tracker/CVE-2019-6461   
                         cairo | CVE-2019-6462    | https://security-tracker.debian.org/tracker/CVE-2019-6462   
                         cairo | CVE-2020-35492   | https://security-tracker.debian.org/tracker/CVE-2020-35492  
                        clamav | CVE-2016-1405    | https://security-tracker.debian.org/tracker/CVE-2016-1405   
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
                      cryptopp | CVE-2021-43398   | https://security-tracker.debian.org/tracker/CVE-2021-43398  
                          cups | CVE-2018-6553    | https://security-tracker.debian.org/tracker/CVE-2018-6553   
                           cvs | CVE-2017-12836   | https://security-tracker.debian.org/tracker/CVE-2017-12836  
                          dbus | CVE-2020-35512   | https://security-tracker.debian.org/tracker/CVE-2020-35512  
                       dnsmasq | CVE-2021-45951   | https://security-tracker.debian.org/tracker/CVE-2021-45951  
                       dnsmasq | CVE-2021-45952   | https://security-tracker.debian.org/tracker/CVE-2021-45952  
                       dnsmasq | CVE-2021-45953   | https://security-tracker.debian.org/tracker/CVE-2021-45953  
                       dnsmasq | CVE-2021-45954   | https://security-tracker.debian.org/tracker/CVE-2021-45954  
                       dnsmasq | CVE-2021-45955   | https://security-tracker.debian.org/tracker/CVE-2021-45955  
                       dnsmasq | CVE-2021-45956   | https://security-tracker.debian.org/tracker/CVE-2021-45956  
                       dnsmasq | CVE-2021-45957   | https://security-tracker.debian.org/tracker/CVE-2021-45957  
                        docker | CVE-2014-0048    | https://security-tracker.debian.org/tracker/CVE-2014-0048   
                        docker | CVE-2014-8178    | https://security-tracker.debian.org/tracker/CVE-2014-8178   
                        docker | CVE-2014-8179    | https://security-tracker.debian.org/tracker/CVE-2014-8179   
                        docker | CVE-2015-1843    | https://security-tracker.debian.org/tracker/CVE-2015-1843   
                        docker | CVE-2015-3627    | https://security-tracker.debian.org/tracker/CVE-2015-3627   
                        docker | CVE-2015-3630    | https://security-tracker.debian.org/tracker/CVE-2015-3630   
                        docker | CVE-2015-3631    | https://security-tracker.debian.org/tracker/CVE-2015-3631   
                        docker | CVE-2016-3697    | https://security-tracker.debian.org/tracker/CVE-2016-3697   
                        docker | CVE-2017-14992   | https://security-tracker.debian.org/tracker/CVE-2017-14992  
                        docker | CVE-2019-13139   | https://security-tracker.debian.org/tracker/CVE-2019-13139  
                        docker | CVE-2019-13509   | https://security-tracker.debian.org/tracker/CVE-2019-13509  
                        docker | CVE-2019-15752   | https://security-tracker.debian.org/tracker/CVE-2019-15752  
                        docker | CVE-2019-16884   | https://security-tracker.debian.org/tracker/CVE-2019-16884  
                        docker | CVE-2019-5736    | https://security-tracker.debian.org/tracker/CVE-2019-5736   
                        docker | CVE-2020-27534   | https://security-tracker.debian.org/tracker/CVE-2020-27534  
                        docker | CVE-2021-21284   | https://security-tracker.debian.org/tracker/CVE-2021-21284  
                        docker | CVE-2021-21285   | https://security-tracker.debian.org/tracker/CVE-2021-21285  
                        docker | CVE-2021-3162    | https://security-tracker.debian.org/tracker/CVE-2021-3162   
                        docker | CVE-2021-33183   | https://security-tracker.debian.org/tracker/CVE-2021-33183  
                ecryptfs-utils | CVE-2016-1572    | https://security-tracker.debian.org/tracker/CVE-2016-1572   
                          edk2 | CVE-2014-4859    | https://security-tracker.debian.org/tracker/CVE-2014-4859   
                          edk2 | CVE-2014-4860    | https://security-tracker.debian.org/tracker/CVE-2014-4860   
                          edk2 | CVE-2014-8271    | https://security-tracker.debian.org/tracker/CVE-2014-8271   
                          edk2 | CVE-2019-14553   | https://security-tracker.debian.org/tracker/CVE-2019-14553  
                          edk2 | CVE-2019-14559   | https://security-tracker.debian.org/tracker/CVE-2019-14559  
                          edk2 | CVE-2019-14562   | https://security-tracker.debian.org/tracker/CVE-2019-14562  
                          edk2 | CVE-2019-14563   | https://security-tracker.debian.org/tracker/CVE-2019-14563  
                          edk2 | CVE-2019-14575   | https://security-tracker.debian.org/tracker/CVE-2019-14575  
                          edk2 | CVE-2019-14586   | https://security-tracker.debian.org/tracker/CVE-2019-14586  
                          edk2 | CVE-2019-14587   | https://security-tracker.debian.org/tracker/CVE-2019-14587  
                         emlog | CVE-2021-44584   | https://security-tracker.debian.org/tracker/CVE-2021-44584  
                        erlang | CVE-2020-35733   | https://security-tracker.debian.org/tracker/CVE-2020-35733  
                          exim | CVE-2020-28017   | https://security-tracker.debian.org/tracker/CVE-2020-28017  
                         exiv2 | CVE-2007-6353    | https://security-tracker.debian.org/tracker/CVE-2007-6353   
                        ffmpeg | CVE-2021-38291   | https://security-tracker.debian.org/tracker/CVE-2021-38291  
                         glibc | CVE-2010-4756    | https://security-tracker.debian.org/tracker/CVE-2010-4756   
                         glibc | CVE-2019-1010022 | https://security-tracker.debian.org/tracker/CVE-2019-1010022
                         glibc | CVE-2019-1010023 | https://security-tracker.debian.org/tracker/CVE-2019-1010023
                         glibc | CVE-2019-1010024 | https://security-tracker.debian.org/tracker/CVE-2019-1010024
                         glibc | CVE-2019-1010025 | https://security-tracker.debian.org/tracker/CVE-2019-1010025
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                            go | CVE-2020-29509   | https://security-tracker.debian.org/tracker/CVE-2020-29509  
                            go | CVE-2020-29511   | https://security-tracker.debian.org/tracker/CVE-2020-29511  
                graphicsmagick | CVE-2007-0770    | https://security-tracker.debian.org/tracker/CVE-2007-0770   
                graphicsmagick | CVE-2008-6621    | https://security-tracker.debian.org/tracker/CVE-2008-6621   
                     graphite2 | CVE-2017-5436    | https://security-tracker.debian.org/tracker/CVE-2017-5436   
                       haproxy | CVE-2016-2102    | https://security-tracker.debian.org/tracker/CVE-2016-2102   
                heirloom-mailx | CVE-2004-2771    | https://security-tracker.debian.org/tracker/CVE-2004-2771   
                   imagemagick | CVE-2007-1667    | https://security-tracker.debian.org/tracker/CVE-2007-1667   
                   imagemagick | CVE-2014-9804    | https://security-tracker.debian.org/tracker/CVE-2014-9804   
                   imagemagick | CVE-2014-9805    | https://security-tracker.debian.org/tracker/CVE-2014-9805   
                   imagemagick | CVE-2014-9806    | https://security-tracker.debian.org/tracker/CVE-2014-9806   
                   imagemagick | CVE-2014-9807    | https://security-tracker.debian.org/tracker/CVE-2014-9807   
                   imagemagick | CVE-2014-9808    | https://security-tracker.debian.org/tracker/CVE-2014-9808   
                   imagemagick | CVE-2014-9809    | https://security-tracker.debian.org/tracker/CVE-2014-9809   
                   imagemagick | CVE-2014-9810    | https://security-tracker.debian.org/tracker/CVE-2014-9810   
                   imagemagick | CVE-2014-9811    | https://security-tracker.debian.org/tracker/CVE-2014-9811   
                   imagemagick | CVE-2014-9812    | https://security-tracker.debian.org/tracker/CVE-2014-9812   
                   imagemagick | CVE-2014-9813    | https://security-tracker.debian.org/tracker/CVE-2014-9813   
                   imagemagick | CVE-2014-9814    | https://security-tracker.debian.org/tracker/CVE-2014-9814   
                   imagemagick | CVE-2014-9815    | https://security-tracker.debian.org/tracker/CVE-2014-9815   
                   imagemagick | CVE-2014-9816    | https://security-tracker.debian.org/tracker/CVE-2014-9816   
                   imagemagick | CVE-2014-9817    | https://security-tracker.debian.org/tracker/CVE-2014-9817   
                   imagemagick | CVE-2014-9818    | https://security-tracker.debian.org/tracker/CVE-2014-9818   
                   imagemagick | CVE-2014-9819    | https://security-tracker.debian.org/tracker/CVE-2014-9819   
                   imagemagick | CVE-2014-9820    | https://security-tracker.debian.org/tracker/CVE-2014-9820   
                   imagemagick | CVE-2014-9821    | https://security-tracker.debian.org/tracker/CVE-2014-9821   
                   imagemagick | CVE-2014-9822    | https://security-tracker.debian.org/tracker/CVE-2014-9822   
                   imagemagick | CVE-2014-9823    | https://security-tracker.debian.org/tracker/CVE-2014-9823   
                   imagemagick | CVE-2014-9824    | https://security-tracker.debian.org/tracker/CVE-2014-9824   
                   imagemagick | CVE-2014-9825    | https://security-tracker.debian.org/tracker/CVE-2014-9825   
                   imagemagick | CVE-2014-9826    | https://security-tracker.debian.org/tracker/CVE-2014-9826   
                   imagemagick | CVE-2014-9827    | https://security-tracker.debian.org/tracker/CVE-2014-9827   
                   imagemagick | CVE-2014-9828    | https://security-tracker.debian.org/tracker/CVE-2014-9828   
                   imagemagick | CVE-2014-9829    | https://security-tracker.debian.org/tracker/CVE-2014-9829   
                   imagemagick | CVE-2014-9830    | https://security-tracker.debian.org/tracker/CVE-2014-9830   
                   imagemagick | CVE-2014-9831    | https://security-tracker.debian.org/tracker/CVE-2014-9831   
                   imagemagick | CVE-2014-9848    | https://security-tracker.debian.org/tracker/CVE-2014-9848   
                   imagemagick | CVE-2014-9852    | https://security-tracker.debian.org/tracker/CVE-2014-9852   
                   imagemagick | CVE-2014-9853    | https://security-tracker.debian.org/tracker/CVE-2014-9853   
                   imagemagick | CVE-2014-9854    | https://security-tracker.debian.org/tracker/CVE-2014-9854   
                   imagemagick | CVE-2014-9907    | https://security-tracker.debian.org/tracker/CVE-2014-9907   
                   imagemagick | CVE-2016-10062   | https://security-tracker.debian.org/tracker/CVE-2016-10062  
                   imagemagick | CVE-2016-10144   | https://security-tracker.debian.org/tracker/CVE-2016-10144  
                   imagemagick | CVE-2016-10145   | https://security-tracker.debian.org/tracker/CVE-2016-10145  
                   imagemagick | CVE-2016-10146   | https://security-tracker.debian.org/tracker/CVE-2016-10146  
                   imagemagick | CVE-2016-7513    | https://security-tracker.debian.org/tracker/CVE-2016-7513   
                   imagemagick | CVE-2016-7514    | https://security-tracker.debian.org/tracker/CVE-2016-7514   
                   imagemagick | CVE-2016-7515    | https://security-tracker.debian.org/tracker/CVE-2016-7515   
                   imagemagick | CVE-2016-7516    | https://security-tracker.debian.org/tracker/CVE-2016-7516   
                   imagemagick | CVE-2016-7517    | https://security-tracker.debian.org/tracker/CVE-2016-7517   
                   imagemagick | CVE-2016-7518    | https://security-tracker.debian.org/tracker/CVE-2016-7518   
                   imagemagick | CVE-2016-7519    | https://security-tracker.debian.org/tracker/CVE-2016-7519   
                   imagemagick | CVE-2016-7520    | https://security-tracker.debian.org/tracker/CVE-2016-7520   
                   imagemagick | CVE-2016-7521    | https://security-tracker.debian.org/tracker/CVE-2016-7521   
                   imagemagick | CVE-2016-7522    | https://security-tracker.debian.org/tracker/CVE-2016-7522   
                   imagemagick | CVE-2016-7523    | https://security-tracker.debian.org/tracker/CVE-2016-7523   
                   imagemagick | CVE-2016-7524    | https://security-tracker.debian.org/tracker/CVE-2016-7524   
                   imagemagick | CVE-2016-7525    | https://security-tracker.debian.org/tracker/CVE-2016-7525   
                   imagemagick | CVE-2016-7526    | https://security-tracker.debian.org/tracker/CVE-2016-7526   
                   imagemagick | CVE-2016-7527    | https://security-tracker.debian.org/tracker/CVE-2016-7527   
                   imagemagick | CVE-2016-7528    | https://security-tracker.debian.org/tracker/CVE-2016-7528   
                   imagemagick | CVE-2016-7529    | https://security-tracker.debian.org/tracker/CVE-2016-7529   
                   imagemagick | CVE-2016-7530    | https://security-tracker.debian.org/tracker/CVE-2016-7530   
                   imagemagick | CVE-2016-7531    | https://security-tracker.debian.org/tracker/CVE-2016-7531   
                   imagemagick | CVE-2016-7532    | https://security-tracker.debian.org/tracker/CVE-2016-7532   
                   imagemagick | CVE-2016-7533    | https://security-tracker.debian.org/tracker/CVE-2016-7533   
                   imagemagick | CVE-2016-7534    | https://security-tracker.debian.org/tracker/CVE-2016-7534   
                   imagemagick | CVE-2016-7535    | https://security-tracker.debian.org/tracker/CVE-2016-7535   
                   imagemagick | CVE-2016-7536    | https://security-tracker.debian.org/tracker/CVE-2016-7536   
                   imagemagick | CVE-2016-7537    | https://security-tracker.debian.org/tracker/CVE-2016-7537   
                   imagemagick | CVE-2016-7538    | https://security-tracker.debian.org/tracker/CVE-2016-7538   
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                   imagemagick | CVE-2017-5509    | https://security-tracker.debian.org/tracker/CVE-2017-5509   
                   imagemagick | CVE-2017-5510    | https://security-tracker.debian.org/tracker/CVE-2017-5510   
                   imagemagick | CVE-2017-5511    | https://security-tracker.debian.org/tracker/CVE-2017-5511   
                        jasper | CVE-2015-8751    | https://security-tracker.debian.org/tracker/CVE-2015-8751   
                        jquery | CVE-2007-2379    | https://security-tracker.debian.org/tracker/CVE-2007-2379   
                         libao | CVE-2017-11548   | https://security-tracker.debian.org/tracker/CVE-2017-11548  
                        libbpf | CVE-2021-45940   | https://security-tracker.debian.org/tracker/CVE-2021-45940  
                        libbpf | CVE-2021-45941   | https://security-tracker.debian.org/tracker/CVE-2021-45941  
                  libfreeimage | CVE-2019-12211   | https://security-tracker.debian.org/tracker/CVE-2019-12211  
                  libfreeimage | CVE-2019-12212   | https://security-tracker.debian.org/tracker/CVE-2019-12212  
                  libfreeimage | CVE-2019-12213   | https://security-tracker.debian.org/tracker/CVE-2019-12213  
                  libfreeimage | CVE-2019-12214   | https://security-tracker.debian.org/tracker/CVE-2019-12214  
                     libiberty | CVE-2012-3509    | https://security-tracker.debian.org/tracker/CVE-2012-3509   
                     libiberty | CVE-2016-2226    | https://security-tracker.debian.org/tracker/CVE-2016-2226   
                     libiberty | CVE-2016-4487    | https://security-tracker.debian.org/tracker/CVE-2016-4487   
                     libiberty | CVE-2016-4488    | https://security-tracker.debian.org/tracker/CVE-2016-4488   
                     libiberty | CVE-2016-4489    | https://security-tracker.debian.org/tracker/CVE-2016-4489   
                     libiberty | CVE-2016-4490    | https://security-tracker.debian.org/tracker/CVE-2016-4490   
                     libiberty | CVE-2016-4491    | https://security-tracker.debian.org/tracker/CVE-2016-4491   
                     libiberty | CVE-2016-4492    | https://security-tracker.debian.org/tracker/CVE-2016-4492   
                     libiberty | CVE-2016-4493    | https://security-tracker.debian.org/tracker/CVE-2016-4493   
                     libiberty | CVE-2016-6131    | https://security-tracker.debian.org/tracker/CVE-2016-6131   
                   libiec61850 | CVE-2021-45769   | https://security-tracker.debian.org/tracker/CVE-2021-45769  
                       libkrb5 | CVE-1999-0143    | https://security-tracker.debian.org/tracker/CVE-1999-0143   
                       libkrb5 | CVE-1999-0713    | https://security-tracker.debian.org/tracker/CVE-1999-0713   
                       libkrb5 | CVE-2007-3149    | https://security-tracker.debian.org/tracker/CVE-2007-3149   
                       libkrb5 | CVE-2007-5894    | https://security-tracker.debian.org/tracker/CVE-2007-5894   
                       libkrb5 | CVE-2007-5902    | https://security-tracker.debian.org/tracker/CVE-2007-5902   
                       libkrb5 | CVE-2009-0844    | https://security-tracker.debian.org/tracker/CVE-2009-0844   
                       libkrb5 | CVE-2009-0846    | https://security-tracker.debian.org/tracker/CVE-2009-0846   
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                      libpjsip | CVE-2021-37706   | https://security-tracker.debian.org/tracker/CVE-2021-37706  
                      libpjsip | CVE-2021-41141   | https://security-tracker.debian.org/tracker/CVE-2021-41141  
                      libpjsip | CVE-2021-43804   | https://security-tracker.debian.org/tracker/CVE-2021-43804  
                      libpjsip | CVE-2021-43845   | https://security-tracker.debian.org/tracker/CVE-2021-43845  
                      libpjsip | CVE-2022-21722   | https://security-tracker.debian.org/tracker/CVE-2022-21722  
                      libpjsip | CVE-2022-21723   | https://security-tracker.debian.org/tracker/CVE-2022-21723  
                      libplist | CVE-2017-5834    | https://security-tracker.debian.org/tracker/CVE-2017-5834   
                      libplist | CVE-2017-5835    | https://security-tracker.debian.org/tracker/CVE-2017-5835   
                      libplist | CVE-2017-5836    | https://security-tracker.debian.org/tracker/CVE-2017-5836   
                    libtorrent | CVE-2009-1760    | https://security-tracker.debian.org/tracker/CVE-2009-1760   
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                       libvirt | CVE-2014-8135    | https://security-tracker.debian.org/tracker/CVE-2014-8135   
                       libvirt | CVE-2014-8136    | https://security-tracker.debian.org/tracker/CVE-2014-8136   
                       libvirt | CVE-2015-5313    | https://security-tracker.debian.org/tracker/CVE-2015-5313   
                       libvirt | CVE-2018-5748    | https://security-tracker.debian.org/tracker/CVE-2018-5748   
                       libvirt | CVE-2018-6764    | https://security-tracker.debian.org/tracker/CVE-2018-6764   
                         lrzsz | CVE-2018-10195   | https://security-tracker.debian.org/tracker/CVE-2018-10195  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2020-15888   | https://security-tracker.debian.org/tracker/CVE-2020-15888  
                           lua | CVE-2020-15945   | https://security-tracker.debian.org/tracker/CVE-2020-15945  
                           lua | CVE-2021-43519   | https://security-tracker.debian.org/tracker/CVE-2021-43519  
                       mariadb | CVE-2021-46658   | https://security-tracker.debian.org/tracker/CVE-2021-46658  
                       mariadb | CVE-2021-46659   | https://security-tracker.debian.org/tracker/CVE-2021-46659  
                       mariadb | CVE-2021-46661   | https://security-tracker.debian.org/tracker/CVE-2021-46661  
                       mariadb | CVE-2021-46662   | https://security-tracker.debian.org/tracker/CVE-2021-46662  
                       mariadb | CVE-2021-46663   | https://security-tracker.debian.org/tracker/CVE-2021-46663  
                       mariadb | CVE-2021-46664   | https://security-tracker.debian.org/tracker/CVE-2021-46664  
                       mariadb | CVE-2021-46665   | https://security-tracker.debian.org/tracker/CVE-2021-46665  
                       mariadb | CVE-2021-46667   | https://security-tracker.debian.org/tracker/CVE-2021-46667  
                       mariadb | CVE-2021-46668   | https://security-tracker.debian.org/tracker/CVE-2021-46668  
                       mariadb | CVE-2021-46669   | https://security-tracker.debian.org/tracker/CVE-2021-46669  
                         matio | CVE-2020-36428   | https://security-tracker.debian.org/tracker/CVE-2020-36428  
                         matio | CVE-2021-36977   | https://security-tracker.debian.org/tracker/CVE-2021-36977  
                       mbedtls | CVE-2021-45451   | https://security-tracker.debian.org/tracker/CVE-2021-45451  
                       mongodb | CVE-2014-8180    | https://security-tracker.debian.org/tracker/CVE-2014-8180   
                       mongodb | CVE-2017-18381   | https://security-tracker.debian.org/tracker/CVE-2017-18381  
                       mongodb | CVE-2017-2665    | https://security-tracker.debian.org/tracker/CVE-2017-2665   
                         mupdf | CVE-2017-5991    | https://security-tracker.debian.org/tracker/CVE-2017-5991   
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
                          nasm | CVE-2020-18974   | https://security-tracker.debian.org/tracker/CVE-2020-18974  
                       ncurses | CVE-2021-39537   | https://security-tracker.debian.org/tracker/CVE-2021-39537  
                           ntp | CVE-2014-9750    | https://security-tracker.debian.org/tracker/CVE-2014-9750   
                           ntp | CVE-2014-9751    | https://security-tracker.debian.org/tracker/CVE-2014-9751   
                           ntp | CVE-2015-7691    | https://security-tracker.debian.org/tracker/CVE-2015-7691   
                           ntp | CVE-2015-7692    | https://security-tracker.debian.org/tracker/CVE-2015-7692   
                           ntp | CVE-2015-7701    | https://security-tracker.debian.org/tracker/CVE-2015-7701   
                           ntp | CVE-2015-7702    | https://security-tracker.debian.org/tracker/CVE-2015-7702   
                           ntp | CVE-2015-7703    | https://security-tracker.debian.org/tracker/CVE-2015-7703   
                           ntp | CVE-2015-7704    | https://security-tracker.debian.org/tracker/CVE-2015-7704   
                           ntp | CVE-2015-7705    | https://security-tracker.debian.org/tracker/CVE-2015-7705   
                           ntp | CVE-2015-7849    | https://security-tracker.debian.org/tracker/CVE-2015-7849   
                           ntp | CVE-2015-7850    | https://security-tracker.debian.org/tracker/CVE-2015-7850   
                           ntp | CVE-2015-7852    | https://security-tracker.debian.org/tracker/CVE-2015-7852   
                           ntp | CVE-2015-7853    | https://security-tracker.debian.org/tracker/CVE-2015-7853   
                           ntp | CVE-2015-7854    | https://security-tracker.debian.org/tracker/CVE-2015-7854   
                           ntp | CVE-2015-7855    | https://security-tracker.debian.org/tracker/CVE-2015-7855   
                           ntp | CVE-2015-7973    | https://security-tracker.debian.org/tracker/CVE-2015-7973   
                           ntp | CVE-2015-7974    | https://security-tracker.debian.org/tracker/CVE-2015-7974   
                           ntp | CVE-2015-7977    | https://security-tracker.debian.org/tracker/CVE-2015-7977   
                           ntp | CVE-2016-2518    | https://security-tracker.debian.org/tracker/CVE-2016-2518   
                           ntp | CVE-2016-4953    | https://security-tracker.debian.org/tracker/CVE-2016-4953   
                           ntp | CVE-2016-4954    | https://security-tracker.debian.org/tracker/CVE-2016-4954   
                           ntp | CVE-2016-4955    | https://security-tracker.debian.org/tracker/CVE-2016-4955   
                           ntp | CVE-2016-4956    | https://security-tracker.debian.org/tracker/CVE-2016-4956   
                           ntp | CVE-2016-7426    | https://security-tracker.debian.org/tracker/CVE-2016-7426   
                           ntp | CVE-2016-7434    | https://security-tracker.debian.org/tracker/CVE-2016-7434   
                           ntp | CVE-2017-6458    | https://security-tracker.debian.org/tracker/CVE-2017-6458   
                           ntp | CVE-2018-7170    | https://security-tracker.debian.org/tracker/CVE-2018-7170   
                           ntp | CVE-2018-7185    | https://security-tracker.debian.org/tracker/CVE-2018-7185   
                           ntp | CVE-2019-11331   | https://security-tracker.debian.org/tracker/CVE-2019-11331  
                           ntp | CVE-2019-8936    | https://security-tracker.debian.org/tracker/CVE-2019-8936   
                           ntp | CVE-2020-11868   | https://security-tracker.debian.org/tracker/CVE-2020-11868  
                           ntp | CVE-2020-13817   | https://security-tracker.debian.org/tracker/CVE-2020-13817  
                       opencv3 | CVE-2019-14493   | https://security-tracker.debian.org/tracker/CVE-2019-14493  
                       opencv3 | CVE-2019-15939   | https://security-tracker.debian.org/tracker/CVE-2019-15939  
                       opencv3 | CVE-2019-19624   | https://security-tracker.debian.org/tracker/CVE-2019-19624  
                       openjdk | CVE-2009-2475    | https://security-tracker.debian.org/tracker/CVE-2009-2475   
                       openjdk | CVE-2009-2476    | https://security-tracker.debian.org/tracker/CVE-2009-2476   
                       openjdk | CVE-2009-2689    | https://security-tracker.debian.org/tracker/CVE-2009-2689   
                       openjdk | CVE-2009-2690    | https://security-tracker.debian.org/tracker/CVE-2009-2690   
                       openjdk | CVE-2009-3728    | https://security-tracker.debian.org/tracker/CVE-2009-3728   
                       openjdk | CVE-2009-3879    | https://security-tracker.debian.org/tracker/CVE-2009-3879   
                       openjdk | CVE-2009-3880    | https://security-tracker.debian.org/tracker/CVE-2009-3880   
                       openjdk | CVE-2009-3881    | https://security-tracker.debian.org/tracker/CVE-2009-3881   
                       openjdk | CVE-2009-3882    | https://security-tracker.debian.org/tracker/CVE-2009-3882   
                       openjdk | CVE-2009-3883    | https://security-tracker.debian.org/tracker/CVE-2009-3883   
                       openjdk | CVE-2009-3884    | https://security-tracker.debian.org/tracker/CVE-2009-3884   
                       openjdk | CVE-2013-0169    | https://security-tracker.debian.org/tracker/CVE-2013-0169   
                      openjpeg | CVE-2015-1239    | https://security-tracker.debian.org/tracker/CVE-2015-1239   
                      openjpeg | CVE-2016-7163    | https://security-tracker.debian.org/tracker/CVE-2016-7163   
                      openjpeg | CVE-2016-9675    | https://security-tracker.debian.org/tracker/CVE-2016-9675   
                      openjpeg | CVE-2021-29338   | https://security-tracker.debian.org/tracker/CVE-2021-29338  
                      openldap | CVE-2015-3276    | https://security-tracker.debian.org/tracker/CVE-2015-3276   
                       openssh | CVE-2007-2768    | https://security-tracker.debian.org/tracker/CVE-2007-2768   
                       openssh | CVE-2008-3844    | https://security-tracker.debian.org/tracker/CVE-2008-3844   
                       openssh | CVE-2014-9278    | https://security-tracker.debian.org/tracker/CVE-2014-9278   
                      openswan | CVE-2019-10155   | https://security-tracker.debian.org/tracker/CVE-2019-10155  
                         p7zip | CVE-2017-17969   | https://security-tracker.debian.org/tracker/CVE-2017-17969  
                         p7zip | CVE-2018-5996    | https://security-tracker.debian.org/tracker/CVE-2018-5996   
                         patch | CVE-2018-6952    | https://security-tracker.debian.org/tracker/CVE-2018-6952   
                         patch | CVE-2019-20633   | https://security-tracker.debian.org/tracker/CVE-2019-20633  
                           php | CVE-2007-2728    | https://security-tracker.debian.org/tracker/CVE-2007-2728   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                           php | CVE-2007-4596    | https://security-tracker.debian.org/tracker/CVE-2007-4596   
                        polkit | CVE-2021-4034    | https://security-tracker.debian.org/tracker/CVE-2021-4034   
                    postgresql | CVE-2017-8806    | https://security-tracker.debian.org/tracker/CVE-2017-8806   
                 powerpc-utils | CVE-2014-8165    | https://security-tracker.debian.org/tracker/CVE-2014-8165   
               python-m2crypto | CVE-2020-25657   | https://security-tracker.debian.org/tracker/CVE-2020-25657  
                    python-pip | CVE-2018-20225   | https://security-tracker.debian.org/tracker/CVE-2018-20225  
                          qemu | CVE-2018-18438   | https://security-tracker.debian.org/tracker/CVE-2018-18438  
                          qemu | CVE-2019-12067   | https://security-tracker.debian.org/tracker/CVE-2019-12067  
                          qemu | CVE-2021-20255   | https://security-tracker.debian.org/tracker/CVE-2021-20255  
                          qemu | CVE-2021-4145    | https://security-tracker.debian.org/tracker/CVE-2021-4145   
                        quagga | CVE-2016-4049    | https://security-tracker.debian.org/tracker/CVE-2016-4049   
                        quagga | CVE-2017-3224    | https://security-tracker.debian.org/tracker/CVE-2017-3224   
                        quagga | CVE-2021-44038   | https://security-tracker.debian.org/tracker/CVE-2021-44038  
               rabbitmq-server | CVE-2018-11087   | https://security-tracker.debian.org/tracker/CVE-2018-11087  
               rabbitmq-server | CVE-2018-1279    | https://security-tracker.debian.org/tracker/CVE-2018-1279   
               rabbitmq-server | CVE-2020-5419    | https://security-tracker.debian.org/tracker/CVE-2020-5419   
                        raptor | CVE-2020-25713   | https://security-tracker.debian.org/tracker/CVE-2020-25713  
                   resiprocate | CVE-2017-9454    | https://security-tracker.debian.org/tracker/CVE-2017-9454   
                        samba4 | CVE-2011-2411    | https://security-tracker.debian.org/tracker/CVE-2011-2411   
                        samba4 | CVE-2018-1050    | https://security-tracker.debian.org/tracker/CVE-2018-1050   
                        samba4 | CVE-2018-1057    | https://security-tracker.debian.org/tracker/CVE-2018-1057   
                           sdl | CVE-2019-13616   | https://security-tracker.debian.org/tracker/CVE-2019-13616  
                           sdl | CVE-2019-14906   | https://security-tracker.debian.org/tracker/CVE-2019-14906  
                           sdl | CVE-2019-7572    | https://security-tracker.debian.org/tracker/CVE-2019-7572   
                           sdl | CVE-2019-7573    | https://security-tracker.debian.org/tracker/CVE-2019-7573   
                           sdl | CVE-2019-7574    | https://security-tracker.debian.org/tracker/CVE-2019-7574   
                           sdl | CVE-2019-7575    | https://security-tracker.debian.org/tracker/CVE-2019-7575   
                           sdl | CVE-2019-7576    | https://security-tracker.debian.org/tracker/CVE-2019-7576   
                           sdl | CVE-2019-7577    | https://security-tracker.debian.org/tracker/CVE-2019-7577   
                           sdl | CVE-2019-7578    | https://security-tracker.debian.org/tracker/CVE-2019-7578   
                           sdl | CVE-2019-7635    | https://security-tracker.debian.org/tracker/CVE-2019-7635   
                           sdl | CVE-2019-7636    | https://security-tracker.debian.org/tracker/CVE-2019-7636   
                           sdl | CVE-2019-7637    | https://security-tracker.debian.org/tracker/CVE-2019-7637   
                           sdl | CVE-2019-7638    | https://security-tracker.debian.org/tracker/CVE-2019-7638   
                           sdl | CVE-2020-14409   | https://security-tracker.debian.org/tracker/CVE-2020-14409  
                           sdl | CVE-2020-14410   | https://security-tracker.debian.org/tracker/CVE-2020-14410  
                         smack | CVE-2014-0363    | https://security-tracker.debian.org/tracker/CVE-2014-0363   
                         smack | CVE-2014-0364    | https://security-tracker.debian.org/tracker/CVE-2014-0364   
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                         spice | CVE-2016-0749    | https://security-tracker.debian.org/tracker/CVE-2016-0749   
                         spice | CVE-2016-2150    | https://security-tracker.debian.org/tracker/CVE-2016-2150   
                         spice | CVE-2018-10893   | https://security-tracker.debian.org/tracker/CVE-2018-10893  
                        thttpd | CVE-2012-5640    | https://security-tracker.debian.org/tracker/CVE-2012-5640   
                          tiff | CVE-2015-7313    | https://security-tracker.debian.org/tracker/CVE-2015-7313   
                          tiff | CVE-2022-0561    | https://security-tracker.debian.org/tracker/CVE-2022-0561   
                          tiff | CVE-2022-0562    | https://security-tracker.debian.org/tracker/CVE-2022-0562   
                          tinc | CVE-2013-1428    | https://security-tracker.debian.org/tracker/CVE-2013-1428   
                           tor | CVE-2016-9079    | https://security-tracker.debian.org/tracker/CVE-2016-9079   
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                         unzip | CVE-2022-0529    | https://security-tracker.debian.org/tracker/CVE-2022-0529   
                         unzip | CVE-2022-0530    | https://security-tracker.debian.org/tracker/CVE-2022-0530   
                           vim | CVE-2022-0554    | https://security-tracker.debian.org/tracker/CVE-2022-0554   
                           xen | CVE-2011-1936    | https://security-tracker.debian.org/tracker/CVE-2011-1936   
                           xen | CVE-2011-3346    | https://security-tracker.debian.org/tracker/CVE-2011-3346   
                           xen | CVE-2014-2580    | https://security-tracker.debian.org/tracker/CVE-2014-2580   
                           xen | CVE-2014-3672    | https://security-tracker.debian.org/tracker/CVE-2014-3672   
                           xen | CVE-2015-7504    | https://security-tracker.debian.org/tracker/CVE-2015-7504   
                           xen | CVE-2015-8550    | https://security-tracker.debian.org/tracker/CVE-2015-8550   
                           xen | CVE-2015-8553    | https://security-tracker.debian.org/tracker/CVE-2015-8553   
                           xen | CVE-2016-3960    | https://security-tracker.debian.org/tracker/CVE-2016-3960   
                           xen | CVE-2016-7092    | https://security-tracker.debian.org/tracker/CVE-2016-7092   
                           xen | CVE-2016-9379    | https://security-tracker.debian.org/tracker/CVE-2016-9379   
                           xen | CVE-2016-9380    | https://security-tracker.debian.org/tracker/CVE-2016-9380   
                           xen | CVE-2016-9383    | https://security-tracker.debian.org/tracker/CVE-2016-9383   
                           xen | CVE-2016-9386    | https://security-tracker.debian.org/tracker/CVE-2016-9386   
                           xen | CVE-2017-12134   | https://security-tracker.debian.org/tracker/CVE-2017-12134  
                           xen | CVE-2017-12135   | https://security-tracker.debian.org/tracker/CVE-2017-12135  
                           xen | CVE-2017-12137   | https://security-tracker.debian.org/tracker/CVE-2017-12137  
                           xen | CVE-2017-7228    | https://security-tracker.debian.org/tracker/CVE-2017-7228   
                           xen | CVE-2018-5244    | https://security-tracker.debian.org/tracker/CVE-2018-5244   
                           xen | CVE-2018-8897    | https://security-tracker.debian.org/tracker/CVE-2018-8897   
                           xen | CVE-2021-26313   | https://security-tracker.debian.org/tracker/CVE-2021-26313  
                           xen | CVE-2021-26314   | https://security-tracker.debian.org/tracker/CVE-2021-26314  
                           xen | CVE-2021-28038   | https://security-tracker.debian.org/tracker/CVE-2021-28038  
                           xen | CVE-2021-28039   | https://security-tracker.debian.org/tracker/CVE-2021-28039  
                           xen | CVE-2021-28687   | https://security-tracker.debian.org/tracker/CVE-2021-28687  
                           xen | CVE-2021-28690   | https://security-tracker.debian.org/tracker/CVE-2021-28690  
                           xen | CVE-2021-28692   | https://security-tracker.debian.org/tracker/CVE-2021-28692  
                           xen | CVE-2021-28693   | https://security-tracker.debian.org/tracker/CVE-2021-28693  
                           xen | CVE-2021-28694   | https://security-tracker.debian.org/tracker/CVE-2021-28694  
                           xen | CVE-2021-28695   | https://security-tracker.debian.org/tracker/CVE-2021-28695  
                           xen | CVE-2021-28696   | https://security-tracker.debian.org/tracker/CVE-2021-28696  
                           xen | CVE-2021-28697   | https://security-tracker.debian.org/tracker/CVE-2021-28697  
                           xen | CVE-2021-28698   | https://security-tracker.debian.org/tracker/CVE-2021-28698  
                           xen | CVE-2021-28699   | https://security-tracker.debian.org/tracker/CVE-2021-28699  
                           xen | CVE-2021-28700   | https://security-tracker.debian.org/tracker/CVE-2021-28700  
                           xen | CVE-2021-28701   | https://security-tracker.debian.org/tracker/CVE-2021-28701  
                           xen | CVE-2021-28702   | https://security-tracker.debian.org/tracker/CVE-2021-28702  
                           xen | CVE-2021-28703   | https://security-tracker.debian.org/tracker/CVE-2021-28703  
                           xen | CVE-2021-28704   | https://security-tracker.debian.org/tracker/CVE-2021-28704  
                           xen | CVE-2021-28707   | https://security-tracker.debian.org/tracker/CVE-2021-28707  
                           xen | CVE-2021-28708   | https://security-tracker.debian.org/tracker/CVE-2021-28708  
                           xen | CVE-2021-28711   | https://security-tracker.debian.org/tracker/CVE-2021-28711  
                           xen | CVE-2021-28712   | https://security-tracker.debian.org/tracker/CVE-2021-28712  
                           xen | CVE-2021-28713   | https://security-tracker.debian.org/tracker/CVE-2021-28713  
                           xen | CVE-2022-23033   | https://security-tracker.debian.org/tracker/CVE-2022-23033  
                           xen | CVE-2022-23035   | https://security-tracker.debian.org/tracker/CVE-2022-23035  
                        xerces | CVE-2012-0880    | https://security-tracker.debian.org/tracker/CVE-2012-0880   
                  xscreensaver | CVE-2021-34557   | https://security-tracker.debian.org/tracker/CVE-2021-34557  
                         xterm | CVE-2022-24130   | https://security-tracker.debian.org/tracker/CVE-2022-24130  
                           zip | CVE-2018-13410   | https://security-tracker.debian.org/tracker/CVE-2018-13410  

CVEs for the '2021.02.x' branch
-------------------------------

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                        apache | CVE-1999-0236    | https://security-tracker.debian.org/tracker/CVE-1999-0236   
                        apache | CVE-1999-0289    | https://security-tracker.debian.org/tracker/CVE-1999-0289   
                        apache | CVE-1999-0678    | https://security-tracker.debian.org/tracker/CVE-1999-0678   
                        apache | CVE-1999-1237    | https://security-tracker.debian.org/tracker/CVE-1999-1237   
                        apache | CVE-1999-1412    | https://security-tracker.debian.org/tracker/CVE-1999-1412   
                        apache | CVE-2007-0086    | https://security-tracker.debian.org/tracker/CVE-2007-0086   
                        apache | CVE-2007-0450    | https://security-tracker.debian.org/tracker/CVE-2007-0450   
                        apache | CVE-2007-4465    | https://security-tracker.debian.org/tracker/CVE-2007-4465   
                        apache | CVE-2007-5000    | https://security-tracker.debian.org/tracker/CVE-2007-5000   
                        apache | CVE-2007-6388    | https://security-tracker.debian.org/tracker/CVE-2007-6388   
                        apache | CVE-2007-6420    | https://security-tracker.debian.org/tracker/CVE-2007-6420   
                        apache | CVE-2007-6421    | https://security-tracker.debian.org/tracker/CVE-2007-6421   
                        apache | CVE-2007-6422    | https://security-tracker.debian.org/tracker/CVE-2007-6422   
                        apache | CVE-2007-6423    | https://security-tracker.debian.org/tracker/CVE-2007-6423   
                        apache | CVE-2008-0455    | https://security-tracker.debian.org/tracker/CVE-2008-0455   
                        apache | CVE-2008-2168    | https://security-tracker.debian.org/tracker/CVE-2008-2168   
                        apache | CVE-2008-2939    | https://security-tracker.debian.org/tracker/CVE-2008-2939   
                        apache | CVE-2009-1195    | https://security-tracker.debian.org/tracker/CVE-2009-1195   
                        apache | CVE-2009-1890    | https://security-tracker.debian.org/tracker/CVE-2009-1890   
                        apache | CVE-2009-1891    | https://security-tracker.debian.org/tracker/CVE-2009-1891   
                        apache | CVE-2009-2699    | https://security-tracker.debian.org/tracker/CVE-2009-2699   
                        apache | CVE-2010-0408    | https://security-tracker.debian.org/tracker/CVE-2010-0408   
                        apache | CVE-2010-0425    | https://security-tracker.debian.org/tracker/CVE-2010-0425   
                        apache | CVE-2010-0434    | https://security-tracker.debian.org/tracker/CVE-2010-0434   
                        apache | CVE-2010-1452    | https://security-tracker.debian.org/tracker/CVE-2010-1452   
                        apache | CVE-2014-0231    | https://security-tracker.debian.org/tracker/CVE-2014-0231   
                      apparmor | CVE-2016-1585    | https://security-tracker.debian.org/tracker/CVE-2016-1585   
                           apr | CVE-2021-35940   | https://security-tracker.debian.org/tracker/CVE-2021-35940  
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                          atop | CVE-2011-3618    | https://security-tracker.debian.org/tracker/CVE-2011-3618   
                         avahi | CVE-2021-3468    | https://security-tracker.debian.org/tracker/CVE-2021-3468   
                          bash | CVE-2019-18276   | https://security-tracker.debian.org/tracker/CVE-2019-18276  
                     belle-sip | CVE-2021-33056   | https://security-tracker.debian.org/tracker/CVE-2021-33056  
                     belle-sip | CVE-2021-43610   | https://security-tracker.debian.org/tracker/CVE-2021-43610  
                     belle-sip | CVE-2021-43611   | https://security-tracker.debian.org/tracker/CVE-2021-43611  
                    berkeleydb | CVE-2017-3604    | https://security-tracker.debian.org/tracker/CVE-2017-3604   
                    berkeleydb | CVE-2017-3605    | https://security-tracker.debian.org/tracker/CVE-2017-3605   
                    berkeleydb | CVE-2017-3606    | https://security-tracker.debian.org/tracker/CVE-2017-3606   
                    berkeleydb | CVE-2017-3607    | https://security-tracker.debian.org/tracker/CVE-2017-3607   
                    berkeleydb | CVE-2017-3608    | https://security-tracker.debian.org/tracker/CVE-2017-3608   
                    berkeleydb | CVE-2017-3609    | https://security-tracker.debian.org/tracker/CVE-2017-3609   
                    berkeleydb | CVE-2017-3610    | https://security-tracker.debian.org/tracker/CVE-2017-3610   
                    berkeleydb | CVE-2017-3611    | https://security-tracker.debian.org/tracker/CVE-2017-3611   
                    berkeleydb | CVE-2017-3612    | https://security-tracker.debian.org/tracker/CVE-2017-3612   
                    berkeleydb | CVE-2017-3613    | https://security-tracker.debian.org/tracker/CVE-2017-3613   
                    berkeleydb | CVE-2017-3614    | https://security-tracker.debian.org/tracker/CVE-2017-3614   
                    berkeleydb | CVE-2017-3615    | https://security-tracker.debian.org/tracker/CVE-2017-3615   
                    berkeleydb | CVE-2017-3616    | https://security-tracker.debian.org/tracker/CVE-2017-3616   
                    berkeleydb | CVE-2017-3617    | https://security-tracker.debian.org/tracker/CVE-2017-3617   
                    berkeleydb | CVE-2019-2708    | https://security-tracker.debian.org/tracker/CVE-2019-2708   
                    berkeleydb | CVE-2020-2981    | https://security-tracker.debian.org/tracker/CVE-2020-2981   
                      binutils | CVE-2021-3487    | https://security-tracker.debian.org/tracker/CVE-2021-3487   
                      binutils | CVE-2021-45078   | https://security-tracker.debian.org/tracker/CVE-2021-45078  
                          bird | CVE-2021-26928   | https://security-tracker.debian.org/tracker/CVE-2021-26928  
                       bitcoin | CVE-2012-1909    | https://security-tracker.debian.org/tracker/CVE-2012-1909   
                       bitcoin | CVE-2012-4682    | https://security-tracker.debian.org/tracker/CVE-2012-4682   
                       bitcoin | CVE-2012-4683    | https://security-tracker.debian.org/tracker/CVE-2012-4683   
                       bitcoin | CVE-2013-2272    | https://security-tracker.debian.org/tracker/CVE-2013-2272   
                       bitcoin | CVE-2013-2273    | https://security-tracker.debian.org/tracker/CVE-2013-2273   
                       bitcoin | CVE-2013-2292    | https://security-tracker.debian.org/tracker/CVE-2013-2292   
                       bitcoin | CVE-2013-2293    | https://security-tracker.debian.org/tracker/CVE-2013-2293   
                       bitcoin | CVE-2013-3220    | https://security-tracker.debian.org/tracker/CVE-2013-3220   
                  bluez5_utils | CVE-2020-12352   | https://security-tracker.debian.org/tracker/CVE-2020-12352  
                  bluez5_utils | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
          bluez5_utils-headers | CVE-2020-12352   | https://security-tracker.debian.org/tracker/CVE-2020-12352  
          bluez5_utils-headers | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
                        bsdiff | CVE-2020-14315   | https://security-tracker.debian.org/tracker/CVE-2020-14315  
                       busybox | CVE-2021-42376   | https://security-tracker.debian.org/tracker/CVE-2021-42376  
                         cairo | CVE-2019-6461    | https://security-tracker.debian.org/tracker/CVE-2019-6461   
                         cairo | CVE-2019-6462    | https://security-tracker.debian.org/tracker/CVE-2019-6462   
                         cairo | CVE-2020-35492   | https://security-tracker.debian.org/tracker/CVE-2020-35492  
                        cereal | CVE-2020-11104   | https://security-tracker.debian.org/tracker/CVE-2020-11104  
                      civetweb | CVE-2020-27304   | https://security-tracker.debian.org/tracker/CVE-2020-27304  
                        clamav | CVE-2016-1405    | https://security-tracker.debian.org/tracker/CVE-2016-1405   
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
                      cryptopp | CVE-2021-43398   | https://security-tracker.debian.org/tracker/CVE-2021-43398  
                          cups | CVE-2018-6553    | https://security-tracker.debian.org/tracker/CVE-2018-6553   
                           cvs | CVE-2017-12836   | https://security-tracker.debian.org/tracker/CVE-2017-12836  
                          dbus | CVE-2020-35512   | https://security-tracker.debian.org/tracker/CVE-2020-35512  
                        docker | CVE-2014-0048    | https://security-tracker.debian.org/tracker/CVE-2014-0048   
                        docker | CVE-2014-8178    | https://security-tracker.debian.org/tracker/CVE-2014-8178   
                        docker | CVE-2014-8179    | https://security-tracker.debian.org/tracker/CVE-2014-8179   
                        docker | CVE-2015-1843    | https://security-tracker.debian.org/tracker/CVE-2015-1843   
                        docker | CVE-2015-3627    | https://security-tracker.debian.org/tracker/CVE-2015-3627   
                        docker | CVE-2015-3630    | https://security-tracker.debian.org/tracker/CVE-2015-3630   
                        docker | CVE-2015-3631    | https://security-tracker.debian.org/tracker/CVE-2015-3631   
                        docker | CVE-2016-3697    | https://security-tracker.debian.org/tracker/CVE-2016-3697   
                        docker | CVE-2017-14992   | https://security-tracker.debian.org/tracker/CVE-2017-14992  
                        docker | CVE-2019-13139   | https://security-tracker.debian.org/tracker/CVE-2019-13139  
                        docker | CVE-2019-13509   | https://security-tracker.debian.org/tracker/CVE-2019-13509  
                        docker | CVE-2019-15752   | https://security-tracker.debian.org/tracker/CVE-2019-15752  
                        docker | CVE-2019-16884   | https://security-tracker.debian.org/tracker/CVE-2019-16884  
                        docker | CVE-2019-5736    | https://security-tracker.debian.org/tracker/CVE-2019-5736   
                        docker | CVE-2020-27534   | https://security-tracker.debian.org/tracker/CVE-2020-27534  
                        docker | CVE-2021-21284   | https://security-tracker.debian.org/tracker/CVE-2021-21284  
                        docker | CVE-2021-21285   | https://security-tracker.debian.org/tracker/CVE-2021-21285  
                        docker | CVE-2021-3162    | https://security-tracker.debian.org/tracker/CVE-2021-3162   
                        docker | CVE-2021-33183   | https://security-tracker.debian.org/tracker/CVE-2021-33183  
                ecryptfs-utils | CVE-2016-1572    | https://security-tracker.debian.org/tracker/CVE-2016-1572   
                         emlog | CVE-2021-44584   | https://security-tracker.debian.org/tracker/CVE-2021-44584  
                        erlang | CVE-2020-35733   | https://security-tracker.debian.org/tracker/CVE-2020-35733  
                          exim | CVE-2020-28017   | https://security-tracker.debian.org/tracker/CVE-2020-28017  
                          exim | CVE-2021-38371   | https://security-tracker.debian.org/tracker/CVE-2021-38371  
                         exiv2 | CVE-2007-6353    | https://security-tracker.debian.org/tracker/CVE-2007-6353   
                        ffmpeg | CVE-2020-35965   | https://security-tracker.debian.org/tracker/CVE-2020-35965  
                        ffmpeg | CVE-2021-38291   | https://security-tracker.debian.org/tracker/CVE-2021-38291  
                   flatbuffers | CVE-2020-35864   | https://security-tracker.debian.org/tracker/CVE-2020-35864  
                         glibc | CVE-2010-4756    | https://security-tracker.debian.org/tracker/CVE-2010-4756   
                         glibc | CVE-2019-1010022 | https://security-tracker.debian.org/tracker/CVE-2019-1010022
                         glibc | CVE-2019-1010023 | https://security-tracker.debian.org/tracker/CVE-2019-1010023
                         glibc | CVE-2019-1010024 | https://security-tracker.debian.org/tracker/CVE-2019-1010024
                         glibc | CVE-2019-1010025 | https://security-tracker.debian.org/tracker/CVE-2019-1010025
                         glibc | CVE-2021-27645   | https://security-tracker.debian.org/tracker/CVE-2021-27645  
                         glibc | CVE-2021-38604   | https://security-tracker.debian.org/tracker/CVE-2021-38604  
                         glibc | CVE-2022-23218   | https://security-tracker.debian.org/tracker/CVE-2022-23218  
                         glibc | CVE-2022-23219   | https://security-tracker.debian.org/tracker/CVE-2022-23219  
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                            go | CVE-2020-29509   | https://security-tracker.debian.org/tracker/CVE-2020-29509  
                            go | CVE-2020-29511   | https://security-tracker.debian.org/tracker/CVE-2020-29511  
                            go | CVE-2021-29923   | https://security-tracker.debian.org/tracker/CVE-2021-29923  
                            go | CVE-2022-23772   | https://security-tracker.debian.org/tracker/CVE-2022-23772  
                            go | CVE-2022-23773   | https://security-tracker.debian.org/tracker/CVE-2022-23773  
                            go | CVE-2022-23806   | https://security-tracker.debian.org/tracker/CVE-2022-23806  
                graphicsmagick | CVE-2007-0770    | https://security-tracker.debian.org/tracker/CVE-2007-0770   
                graphicsmagick | CVE-2008-6621    | https://security-tracker.debian.org/tracker/CVE-2008-6621   
                     graphite2 | CVE-2017-5436    | https://security-tracker.debian.org/tracker/CVE-2017-5436   
                       haproxy | CVE-2016-2102    | https://security-tracker.debian.org/tracker/CVE-2016-2102   
                heirloom-mailx | CVE-2004-2771    | https://security-tracker.debian.org/tracker/CVE-2004-2771   
                       hostapd | CVE-2022-23303   | https://security-tracker.debian.org/tracker/CVE-2022-23303  
                       hostapd | CVE-2022-23304   | https://security-tracker.debian.org/tracker/CVE-2022-23304  
                   imagemagick | CVE-2007-1667    | https://security-tracker.debian.org/tracker/CVE-2007-1667   
                   imagemagick | CVE-2014-9804    | https://security-tracker.debian.org/tracker/CVE-2014-9804   
                   imagemagick | CVE-2014-9805    | https://security-tracker.debian.org/tracker/CVE-2014-9805   
                   imagemagick | CVE-2014-9806    | https://security-tracker.debian.org/tracker/CVE-2014-9806   
                   imagemagick | CVE-2014-9807    | https://security-tracker.debian.org/tracker/CVE-2014-9807   
                   imagemagick | CVE-2014-9808    | https://security-tracker.debian.org/tracker/CVE-2014-9808   
                   imagemagick | CVE-2014-9809    | https://security-tracker.debian.org/tracker/CVE-2014-9809   
                   imagemagick | CVE-2014-9810    | https://security-tracker.debian.org/tracker/CVE-2014-9810   
                   imagemagick | CVE-2014-9811    | https://security-tracker.debian.org/tracker/CVE-2014-9811   
                   imagemagick | CVE-2014-9812    | https://security-tracker.debian.org/tracker/CVE-2014-9812   
                   imagemagick | CVE-2014-9813    | https://security-tracker.debian.org/tracker/CVE-2014-9813   
                   imagemagick | CVE-2014-9814    | https://security-tracker.debian.org/tracker/CVE-2014-9814   
                   imagemagick | CVE-2014-9815    | https://security-tracker.debian.org/tracker/CVE-2014-9815   
                   imagemagick | CVE-2014-9816    | https://security-tracker.debian.org/tracker/CVE-2014-9816   
                   imagemagick | CVE-2014-9817    | https://security-tracker.debian.org/tracker/CVE-2014-9817   
                   imagemagick | CVE-2014-9818    | https://security-tracker.debian.org/tracker/CVE-2014-9818   
                   imagemagick | CVE-2014-9819    | https://security-tracker.debian.org/tracker/CVE-2014-9819   
                   imagemagick | CVE-2014-9820    | https://security-tracker.debian.org/tracker/CVE-2014-9820   
                   imagemagick | CVE-2014-9821    | https://security-tracker.debian.org/tracker/CVE-2014-9821   
                   imagemagick | CVE-2014-9822    | https://security-tracker.debian.org/tracker/CVE-2014-9822   
                   imagemagick | CVE-2014-9823    | https://security-tracker.debian.org/tracker/CVE-2014-9823   
                   imagemagick | CVE-2014-9824    | https://security-tracker.debian.org/tracker/CVE-2014-9824   
                   imagemagick | CVE-2014-9825    | https://security-tracker.debian.org/tracker/CVE-2014-9825   
                   imagemagick | CVE-2014-9826    | https://security-tracker.debian.org/tracker/CVE-2014-9826   
                   imagemagick | CVE-2014-9827    | https://security-tracker.debian.org/tracker/CVE-2014-9827   
                   imagemagick | CVE-2014-9828    | https://security-tracker.debian.org/tracker/CVE-2014-9828   
                   imagemagick | CVE-2014-9829    | https://security-tracker.debian.org/tracker/CVE-2014-9829   
                   imagemagick | CVE-2014-9830    | https://security-tracker.debian.org/tracker/CVE-2014-9830   
                   imagemagick | CVE-2014-9831    | https://security-tracker.debian.org/tracker/CVE-2014-9831   
                   imagemagick | CVE-2014-9848    | https://security-tracker.debian.org/tracker/CVE-2014-9848   
                   imagemagick | CVE-2014-9852    | https://security-tracker.debian.org/tracker/CVE-2014-9852   
                   imagemagick | CVE-2014-9853    | https://security-tracker.debian.org/tracker/CVE-2014-9853   
                   imagemagick | CVE-2014-9854    | https://security-tracker.debian.org/tracker/CVE-2014-9854   
                   imagemagick | CVE-2014-9907    | https://security-tracker.debian.org/tracker/CVE-2014-9907   
                   imagemagick | CVE-2016-10062   | https://security-tracker.debian.org/tracker/CVE-2016-10062  
                   imagemagick | CVE-2016-10144   | https://security-tracker.debian.org/tracker/CVE-2016-10144  
                   imagemagick | CVE-2016-10145   | https://security-tracker.debian.org/tracker/CVE-2016-10145  
                   imagemagick | CVE-2016-10146   | https://security-tracker.debian.org/tracker/CVE-2016-10146  
                   imagemagick | CVE-2016-7513    | https://security-tracker.debian.org/tracker/CVE-2016-7513   
                   imagemagick | CVE-2016-7514    | https://security-tracker.debian.org/tracker/CVE-2016-7514   
                   imagemagick | CVE-2016-7515    | https://security-tracker.debian.org/tracker/CVE-2016-7515   
                   imagemagick | CVE-2016-7516    | https://security-tracker.debian.org/tracker/CVE-2016-7516   
                   imagemagick | CVE-2016-7517    | https://security-tracker.debian.org/tracker/CVE-2016-7517   
                   imagemagick | CVE-2016-7518    | https://security-tracker.debian.org/tracker/CVE-2016-7518   
                   imagemagick | CVE-2016-7519    | https://security-tracker.debian.org/tracker/CVE-2016-7519   
                   imagemagick | CVE-2016-7520    | https://security-tracker.debian.org/tracker/CVE-2016-7520   
                   imagemagick | CVE-2016-7521    | https://security-tracker.debian.org/tracker/CVE-2016-7521   
                   imagemagick | CVE-2016-7522    | https://security-tracker.debian.org/tracker/CVE-2016-7522   
                   imagemagick | CVE-2016-7523    | https://security-tracker.debian.org/tracker/CVE-2016-7523   
                   imagemagick | CVE-2016-7524    | https://security-tracker.debian.org/tracker/CVE-2016-7524   
                   imagemagick | CVE-2016-7525    | https://security-tracker.debian.org/tracker/CVE-2016-7525   
                   imagemagick | CVE-2016-7526    | https://security-tracker.debian.org/tracker/CVE-2016-7526   
                   imagemagick | CVE-2016-7527    | https://security-tracker.debian.org/tracker/CVE-2016-7527   
                   imagemagick | CVE-2016-7528    | https://security-tracker.debian.org/tracker/CVE-2016-7528   
                   imagemagick | CVE-2016-7529    | https://security-tracker.debian.org/tracker/CVE-2016-7529   
                   imagemagick | CVE-2016-7530    | https://security-tracker.debian.org/tracker/CVE-2016-7530   
                   imagemagick | CVE-2016-7531    | https://security-tracker.debian.org/tracker/CVE-2016-7531   
                   imagemagick | CVE-2016-7532    | https://security-tracker.debian.org/tracker/CVE-2016-7532   
                   imagemagick | CVE-2016-7533    | https://security-tracker.debian.org/tracker/CVE-2016-7533   
                   imagemagick | CVE-2016-7534    | https://security-tracker.debian.org/tracker/CVE-2016-7534   
                   imagemagick | CVE-2016-7535    | https://security-tracker.debian.org/tracker/CVE-2016-7535   
                   imagemagick | CVE-2016-7536    | https://security-tracker.debian.org/tracker/CVE-2016-7536   
                   imagemagick | CVE-2016-7537    | https://security-tracker.debian.org/tracker/CVE-2016-7537   
                   imagemagick | CVE-2016-7538    | https://security-tracker.debian.org/tracker/CVE-2016-7538   
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                   imagemagick | CVE-2017-5509    | https://security-tracker.debian.org/tracker/CVE-2017-5509   
                   imagemagick | CVE-2017-5510    | https://security-tracker.debian.org/tracker/CVE-2017-5510   
                   imagemagick | CVE-2017-5511    | https://security-tracker.debian.org/tracker/CVE-2017-5511   
                       jansson | CVE-2020-36325   | https://security-tracker.debian.org/tracker/CVE-2020-36325  
                        jasper | CVE-2015-8751    | https://security-tracker.debian.org/tracker/CVE-2015-8751   
                         jhead | CVE-2020-6624    | https://security-tracker.debian.org/tracker/CVE-2020-6624   
                         jhead | CVE-2020-6625    | https://security-tracker.debian.org/tracker/CVE-2020-6625   
                        jquery | CVE-2007-2379    | https://security-tracker.debian.org/tracker/CVE-2007-2379   
                          kodi | CVE-2021-42917   | https://security-tracker.debian.org/tracker/CVE-2021-42917  
                         libao | CVE-2017-11548   | https://security-tracker.debian.org/tracker/CVE-2017-11548  
                    libarchive | CVE-2021-36976   | https://security-tracker.debian.org/tracker/CVE-2021-36976  
                      libesmtp | CVE-2019-19977   | https://security-tracker.debian.org/tracker/CVE-2019-19977  
                  libfreeimage | CVE-2019-12211   | https://security-tracker.debian.org/tracker/CVE-2019-12211  
                  libfreeimage | CVE-2019-12212   | https://security-tracker.debian.org/tracker/CVE-2019-12212  
                  libfreeimage | CVE-2019-12213   | https://security-tracker.debian.org/tracker/CVE-2019-12213  
                  libfreeimage | CVE-2019-12214   | https://security-tracker.debian.org/tracker/CVE-2019-12214  
                     libiberty | CVE-2012-3509    | https://security-tracker.debian.org/tracker/CVE-2012-3509   
                     libiberty | CVE-2016-2226    | https://security-tracker.debian.org/tracker/CVE-2016-2226   
                     libiberty | CVE-2016-4487    | https://security-tracker.debian.org/tracker/CVE-2016-4487   
                     libiberty | CVE-2016-4488    | https://security-tracker.debian.org/tracker/CVE-2016-4488   
                     libiberty | CVE-2016-4489    | https://security-tracker.debian.org/tracker/CVE-2016-4489   
                     libiberty | CVE-2016-4490    | https://security-tracker.debian.org/tracker/CVE-2016-4490   
                     libiberty | CVE-2016-4491    | https://security-tracker.debian.org/tracker/CVE-2016-4491   
                     libiberty | CVE-2016-4492    | https://security-tracker.debian.org/tracker/CVE-2016-4492   
                     libiberty | CVE-2016-4493    | https://security-tracker.debian.org/tracker/CVE-2016-4493   
                     libiberty | CVE-2016-6131    | https://security-tracker.debian.org/tracker/CVE-2016-6131   
                       libkrb5 | CVE-1999-0143    | https://security-tracker.debian.org/tracker/CVE-1999-0143   
                       libkrb5 | CVE-1999-0713    | https://security-tracker.debian.org/tracker/CVE-1999-0713   
                       libkrb5 | CVE-2007-3149    | https://security-tracker.debian.org/tracker/CVE-2007-3149   
                       libkrb5 | CVE-2007-5894    | https://security-tracker.debian.org/tracker/CVE-2007-5894   
                       libkrb5 | CVE-2007-5902    | https://security-tracker.debian.org/tracker/CVE-2007-5902   
                       libkrb5 | CVE-2009-0844    | https://security-tracker.debian.org/tracker/CVE-2009-0844   
                       libkrb5 | CVE-2009-0846    | https://security-tracker.debian.org/tracker/CVE-2009-0846   
                       libldns | CVE-2020-19860   | https://security-tracker.debian.org/tracker/CVE-2020-19860  
                       libldns | CVE-2020-19861   | https://security-tracker.debian.org/tracker/CVE-2020-19861  
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                        libnss | CVE-2021-43527   | https://security-tracker.debian.org/tracker/CVE-2021-43527  
                      libpjsip | CVE-2021-37706   | https://security-tracker.debian.org/tracker/CVE-2021-37706  
                      libpjsip | CVE-2021-41141   | https://security-tracker.debian.org/tracker/CVE-2021-41141  
                      libpjsip | CVE-2021-43804   | https://security-tracker.debian.org/tracker/CVE-2021-43804  
                      libpjsip | CVE-2021-43845   | https://security-tracker.debian.org/tracker/CVE-2021-43845  
                      libpjsip | CVE-2022-21722   | https://security-tracker.debian.org/tracker/CVE-2022-21722  
                      libpjsip | CVE-2022-21723   | https://security-tracker.debian.org/tracker/CVE-2022-21723  
                      libplist | CVE-2017-5834    | https://security-tracker.debian.org/tracker/CVE-2017-5834   
                      libplist | CVE-2017-5835    | https://security-tracker.debian.org/tracker/CVE-2017-5835   
                      libplist | CVE-2017-5836    | https://security-tracker.debian.org/tracker/CVE-2017-5836   
                      libressl | CVE-2021-41581   | https://security-tracker.debian.org/tracker/CVE-2021-41581  
                    libtorrent | CVE-2009-1760    | https://security-tracker.debian.org/tracker/CVE-2009-1760   
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                      lighttpd | CVE-2022-22707   | https://security-tracker.debian.org/tracker/CVE-2022-22707  
                         lrzsz | CVE-2018-10195   | https://security-tracker.debian.org/tracker/CVE-2018-10195  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2020-15888   | https://security-tracker.debian.org/tracker/CVE-2020-15888  
                           lua | CVE-2020-15945   | https://security-tracker.debian.org/tracker/CVE-2020-15945  
                           lua | CVE-2021-43519   | https://security-tracker.debian.org/tracker/CVE-2021-43519  
                       mariadb | CVE-2021-46658   | https://security-tracker.debian.org/tracker/CVE-2021-46658  
                       mariadb | CVE-2021-46659   | https://security-tracker.debian.org/tracker/CVE-2021-46659  
                       mariadb | CVE-2021-46661   | https://security-tracker.debian.org/tracker/CVE-2021-46661  
                       mariadb | CVE-2021-46662   | https://security-tracker.debian.org/tracker/CVE-2021-46662  
                       mariadb | CVE-2021-46663   | https://security-tracker.debian.org/tracker/CVE-2021-46663  
                       mariadb | CVE-2021-46664   | https://security-tracker.debian.org/tracker/CVE-2021-46664  
                       mariadb | CVE-2021-46665   | https://security-tracker.debian.org/tracker/CVE-2021-46665  
                       mariadb | CVE-2021-46667   | https://security-tracker.debian.org/tracker/CVE-2021-46667  
                       mariadb | CVE-2021-46668   | https://security-tracker.debian.org/tracker/CVE-2021-46668  
                       mariadb | CVE-2021-46669   | https://security-tracker.debian.org/tracker/CVE-2021-46669  
                         matio | CVE-2020-36428   | https://security-tracker.debian.org/tracker/CVE-2020-36428  
                       mbedtls | CVE-2020-36477   | https://security-tracker.debian.org/tracker/CVE-2020-36477  
                       mbedtls | CVE-2021-24119   | https://security-tracker.debian.org/tracker/CVE-2021-24119  
                       mbedtls | CVE-2021-45450   | https://security-tracker.debian.org/tracker/CVE-2021-45450  
                       mbedtls | CVE-2021-45451   | https://security-tracker.debian.org/tracker/CVE-2021-45451  
                        midori | CVE-2019-19916   | https://security-tracker.debian.org/tracker/CVE-2019-19916  
                      minetest | CVE-2022-24300   | https://security-tracker.debian.org/tracker/CVE-2022-24300  
                      minetest | CVE-2022-24301   | https://security-tracker.debian.org/tracker/CVE-2022-24301  
                       mongodb | CVE-2014-8180    | https://security-tracker.debian.org/tracker/CVE-2014-8180   
                       mongodb | CVE-2017-18381   | https://security-tracker.debian.org/tracker/CVE-2017-18381  
                       mongodb | CVE-2017-2665    | https://security-tracker.debian.org/tracker/CVE-2017-2665   
                        monkey | CVE-2013-1771    | https://security-tracker.debian.org/tracker/CVE-2013-1771   
                        monkey | CVE-2013-2183    | https://security-tracker.debian.org/tracker/CVE-2013-2183   
                           mpd | CVE-2020-7465    | https://security-tracker.debian.org/tracker/CVE-2020-7465   
                           mpd | CVE-2020-7466    | https://security-tracker.debian.org/tracker/CVE-2020-7466   
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
                          mutt | CVE-2021-32055   | https://security-tracker.debian.org/tracker/CVE-2021-32055  
                          nasm | CVE-2020-18974   | https://security-tracker.debian.org/tracker/CVE-2020-18974  
                       ncurses | CVE-2021-39537   | https://security-tracker.debian.org/tracker/CVE-2021-39537  
               network-manager | CVE-2021-20297   | https://security-tracker.debian.org/tracker/CVE-2021-20297  
                           ntp | CVE-2014-9750    | https://security-tracker.debian.org/tracker/CVE-2014-9750   
                           ntp | CVE-2014-9751    | https://security-tracker.debian.org/tracker/CVE-2014-9751   
                           ntp | CVE-2015-7691    | https://security-tracker.debian.org/tracker/CVE-2015-7691   
                           ntp | CVE-2015-7692    | https://security-tracker.debian.org/tracker/CVE-2015-7692   
                           ntp | CVE-2015-7701    | https://security-tracker.debian.org/tracker/CVE-2015-7701   
                           ntp | CVE-2015-7702    | https://security-tracker.debian.org/tracker/CVE-2015-7702   
                           ntp | CVE-2015-7703    | https://security-tracker.debian.org/tracker/CVE-2015-7703   
                           ntp | CVE-2015-7704    | https://security-tracker.debian.org/tracker/CVE-2015-7704   
                           ntp | CVE-2015-7705    | https://security-tracker.debian.org/tracker/CVE-2015-7705   
                           ntp | CVE-2015-7849    | https://security-tracker.debian.org/tracker/CVE-2015-7849   
                           ntp | CVE-2015-7850    | https://security-tracker.debian.org/tracker/CVE-2015-7850   
                           ntp | CVE-2015-7852    | https://security-tracker.debian.org/tracker/CVE-2015-7852   
                           ntp | CVE-2015-7853    | https://security-tracker.debian.org/tracker/CVE-2015-7853   
                           ntp | CVE-2015-7854    | https://security-tracker.debian.org/tracker/CVE-2015-7854   
                           ntp | CVE-2015-7855    | https://security-tracker.debian.org/tracker/CVE-2015-7855   
                           ntp | CVE-2015-7973    | https://security-tracker.debian.org/tracker/CVE-2015-7973   
                           ntp | CVE-2015-7974    | https://security-tracker.debian.org/tracker/CVE-2015-7974   
                           ntp | CVE-2015-7977    | https://security-tracker.debian.org/tracker/CVE-2015-7977   
                           ntp | CVE-2016-2518    | https://security-tracker.debian.org/tracker/CVE-2016-2518   
                           ntp | CVE-2016-4953    | https://security-tracker.debian.org/tracker/CVE-2016-4953   
                           ntp | CVE-2016-4954    | https://security-tracker.debian.org/tracker/CVE-2016-4954   
                           ntp | CVE-2016-4955    | https://security-tracker.debian.org/tracker/CVE-2016-4955   
                           ntp | CVE-2016-4956    | https://security-tracker.debian.org/tracker/CVE-2016-4956   
                           ntp | CVE-2016-7426    | https://security-tracker.debian.org/tracker/CVE-2016-7426   
                           ntp | CVE-2016-7434    | https://security-tracker.debian.org/tracker/CVE-2016-7434   
                           ntp | CVE-2017-6458    | https://security-tracker.debian.org/tracker/CVE-2017-6458   
                           ntp | CVE-2018-7170    | https://security-tracker.debian.org/tracker/CVE-2018-7170   
                           ntp | CVE-2018-7185    | https://security-tracker.debian.org/tracker/CVE-2018-7185   
                           ntp | CVE-2019-11331   | https://security-tracker.debian.org/tracker/CVE-2019-11331  
                           ntp | CVE-2019-8936    | https://security-tracker.debian.org/tracker/CVE-2019-8936   
                           ntp | CVE-2020-11868   | https://security-tracker.debian.org/tracker/CVE-2020-11868  
                           ntp | CVE-2020-13817   | https://security-tracker.debian.org/tracker/CVE-2020-13817  
                       opencv3 | CVE-2019-14493   | https://security-tracker.debian.org/tracker/CVE-2019-14493  
                       opencv3 | CVE-2019-15939   | https://security-tracker.debian.org/tracker/CVE-2019-15939  
                       opencv3 | CVE-2019-19624   | https://security-tracker.debian.org/tracker/CVE-2019-19624  
                       openjdk | CVE-2009-2475    | https://security-tracker.debian.org/tracker/CVE-2009-2475   
                       openjdk | CVE-2009-2476    | https://security-tracker.debian.org/tracker/CVE-2009-2476   
                       openjdk | CVE-2009-2689    | https://security-tracker.debian.org/tracker/CVE-2009-2689   
                       openjdk | CVE-2009-2690    | https://security-tracker.debian.org/tracker/CVE-2009-2690   
                       openjdk | CVE-2009-3728    | https://security-tracker.debian.org/tracker/CVE-2009-3728   
                       openjdk | CVE-2009-3879    | https://security-tracker.debian.org/tracker/CVE-2009-3879   
                       openjdk | CVE-2009-3880    | https://security-tracker.debian.org/tracker/CVE-2009-3880   
                       openjdk | CVE-2009-3881    | https://security-tracker.debian.org/tracker/CVE-2009-3881   
                       openjdk | CVE-2009-3882    | https://security-tracker.debian.org/tracker/CVE-2009-3882   
                       openjdk | CVE-2009-3883    | https://security-tracker.debian.org/tracker/CVE-2009-3883   
                       openjdk | CVE-2009-3884    | https://security-tracker.debian.org/tracker/CVE-2009-3884   
                       openjdk | CVE-2013-0169    | https://security-tracker.debian.org/tracker/CVE-2013-0169   
                      openjpeg | CVE-2015-1239    | https://security-tracker.debian.org/tracker/CVE-2015-1239   
                      openjpeg | CVE-2016-7163    | https://security-tracker.debian.org/tracker/CVE-2016-7163   
                      openjpeg | CVE-2016-9675    | https://security-tracker.debian.org/tracker/CVE-2016-9675   
                      openjpeg | CVE-2021-29338   | https://security-tracker.debian.org/tracker/CVE-2021-29338  
                      openldap | CVE-2015-3276    | https://security-tracker.debian.org/tracker/CVE-2015-3276   
                       openssh | CVE-2007-2768    | https://security-tracker.debian.org/tracker/CVE-2007-2768   
                       openssh | CVE-2008-3844    | https://security-tracker.debian.org/tracker/CVE-2008-3844   
                       openssh | CVE-2014-9278    | https://security-tracker.debian.org/tracker/CVE-2014-9278   
                      openswan | CVE-2019-10155   | https://security-tracker.debian.org/tracker/CVE-2019-10155  
                       openvpn | CVE-2021-3606    | https://security-tracker.debian.org/tracker/CVE-2021-3606   
                         patch | CVE-2018-6952    | https://security-tracker.debian.org/tracker/CVE-2018-6952   
                         patch | CVE-2019-20633   | https://security-tracker.debian.org/tracker/CVE-2019-20633  
                           php | CVE-2007-2728    | https://security-tracker.debian.org/tracker/CVE-2007-2728   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                           php | CVE-2007-4596    | https://security-tracker.debian.org/tracker/CVE-2007-4596   
                   php-imagick | CVE-2019-11037   | https://security-tracker.debian.org/tracker/CVE-2019-11037  
                        polkit | CVE-2021-4034    | https://security-tracker.debian.org/tracker/CVE-2021-4034   
                    postgresql | CVE-2017-8806    | https://security-tracker.debian.org/tracker/CVE-2017-8806   
                 powerpc-utils | CVE-2014-8165    | https://security-tracker.debian.org/tracker/CVE-2014-8165   
                      protobuf | CVE-2021-22570   | https://security-tracker.debian.org/tracker/CVE-2021-22570  
                        python | CVE-2015-5652    | https://security-tracker.debian.org/tracker/CVE-2015-5652   
                        python | CVE-2017-17522   | https://security-tracker.debian.org/tracker/CVE-2017-17522  
                        python | CVE-2017-18207   | https://security-tracker.debian.org/tracker/CVE-2017-18207  
                        python | CVE-2019-20907   | https://security-tracker.debian.org/tracker/CVE-2019-20907  
                        python | CVE-2019-9674    | https://security-tracker.debian.org/tracker/CVE-2019-9674   
                        python | CVE-2021-23336   | https://security-tracker.debian.org/tracker/CVE-2021-23336  
                        python | CVE-2022-0391    | https://security-tracker.debian.org/tracker/CVE-2022-0391   
               python-autobahn | CVE-2020-35678   | https://security-tracker.debian.org/tracker/CVE-2020-35678  
           python-cryptography | CVE-2020-36242   | https://security-tracker.debian.org/tracker/CVE-2020-36242  
                python-ipython | CVE-2022-21699   | https://security-tracker.debian.org/tracker/CVE-2022-21699  
               python-m2crypto | CVE-2020-25657   | https://security-tracker.debian.org/tracker/CVE-2020-25657  
                 python-pillow | CVE-2022-22815   | https://security-tracker.debian.org/tracker/CVE-2022-22815  
                 python-pillow | CVE-2022-22816   | https://security-tracker.debian.org/tracker/CVE-2022-22816  
                 python-pillow | CVE-2022-22817   | https://security-tracker.debian.org/tracker/CVE-2022-22817  
                    python-pip | CVE-2018-20225   | https://security-tracker.debian.org/tracker/CVE-2018-20225  
                python-twisted | CVE-2022-21712   | https://security-tracker.debian.org/tracker/CVE-2022-21712  
                          qemu | CVE-2018-18438   | https://security-tracker.debian.org/tracker/CVE-2018-18438  
                          qemu | CVE-2019-12067   | https://security-tracker.debian.org/tracker/CVE-2019-12067  
                          qemu | CVE-2020-35503   | https://security-tracker.debian.org/tracker/CVE-2020-35503  
                          qemu | CVE-2020-35504   | https://security-tracker.debian.org/tracker/CVE-2020-35504  
                          qemu | CVE-2020-35505   | https://security-tracker.debian.org/tracker/CVE-2020-35505  
                          qemu | CVE-2020-35506   | https://security-tracker.debian.org/tracker/CVE-2020-35506  
                          qemu | CVE-2020-35517   | https://security-tracker.debian.org/tracker/CVE-2020-35517  
                          qemu | CVE-2021-20181   | https://security-tracker.debian.org/tracker/CVE-2021-20181  
                          qemu | CVE-2021-20196   | https://security-tracker.debian.org/tracker/CVE-2021-20196  
                          qemu | CVE-2021-20203   | https://security-tracker.debian.org/tracker/CVE-2021-20203  
                          qemu | CVE-2021-20255   | https://security-tracker.debian.org/tracker/CVE-2021-20255  
                          qemu | CVE-2021-20263   | https://security-tracker.debian.org/tracker/CVE-2021-20263  
                          qemu | CVE-2021-3392    | https://security-tracker.debian.org/tracker/CVE-2021-3392   
                          qemu | CVE-2021-3409    | https://security-tracker.debian.org/tracker/CVE-2021-3409   
                          qemu | CVE-2021-3416    | https://security-tracker.debian.org/tracker/CVE-2021-3416   
                          qemu | CVE-2021-3507    | https://security-tracker.debian.org/tracker/CVE-2021-3507   
                          qemu | CVE-2021-3527    | https://security-tracker.debian.org/tracker/CVE-2021-3527   
                          qemu | CVE-2021-3544    | https://security-tracker.debian.org/tracker/CVE-2021-3544   
                          qemu | CVE-2021-3545    | https://security-tracker.debian.org/tracker/CVE-2021-3545   
                          qemu | CVE-2021-3546    | https://security-tracker.debian.org/tracker/CVE-2021-3546   
                          qemu | CVE-2021-3682    | https://security-tracker.debian.org/tracker/CVE-2021-3682   
                          qemu | CVE-2021-3713    | https://security-tracker.debian.org/tracker/CVE-2021-3713   
                          qemu | CVE-2021-4145    | https://security-tracker.debian.org/tracker/CVE-2021-4145   
                   qpid-proton | CVE-2016-2166    | https://security-tracker.debian.org/tracker/CVE-2016-2166   
                   qpid-proton | CVE-2016-4467    | https://security-tracker.debian.org/tracker/CVE-2016-4467   
                        quagga | CVE-2016-4049    | https://security-tracker.debian.org/tracker/CVE-2016-4049   
                        quagga | CVE-2017-3224    | https://security-tracker.debian.org/tracker/CVE-2017-3224   
                        quagga | CVE-2021-44038   | https://security-tracker.debian.org/tracker/CVE-2021-44038  
               rabbitmq-server | CVE-2018-11087   | https://security-tracker.debian.org/tracker/CVE-2018-11087  
               rabbitmq-server | CVE-2018-1279    | https://security-tracker.debian.org/tracker/CVE-2018-1279   
               rabbitmq-server | CVE-2020-5419    | https://security-tracker.debian.org/tracker/CVE-2020-5419   
                        raptor | CVE-2020-25713   | https://security-tracker.debian.org/tracker/CVE-2020-25713  
                   resiprocate | CVE-2017-9454    | https://security-tracker.debian.org/tracker/CVE-2017-9454   
                          ruby | CVE-2021-28966   | https://security-tracker.debian.org/tracker/CVE-2021-28966  
                          rust | CVE-2021-29922   | https://security-tracker.debian.org/tracker/CVE-2021-29922  
                          rust | CVE-2022-21658   | https://security-tracker.debian.org/tracker/CVE-2022-21658  
                        samba4 | CVE-2011-2411    | https://security-tracker.debian.org/tracker/CVE-2011-2411   
                        samba4 | CVE-2018-1050    | https://security-tracker.debian.org/tracker/CVE-2018-1050   
                        samba4 | CVE-2018-1057    | https://security-tracker.debian.org/tracker/CVE-2018-1057   
                           sdl | CVE-2019-13616   | https://security-tracker.debian.org/tracker/CVE-2019-13616  
                           sdl | CVE-2019-14906   | https://security-tracker.debian.org/tracker/CVE-2019-14906  
                           sdl | CVE-2019-7572    | https://security-tracker.debian.org/tracker/CVE-2019-7572   
                           sdl | CVE-2019-7573    | https://security-tracker.debian.org/tracker/CVE-2019-7573   
                           sdl | CVE-2019-7574    | https://security-tracker.debian.org/tracker/CVE-2019-7574   
                           sdl | CVE-2019-7575    | https://security-tracker.debian.org/tracker/CVE-2019-7575   
                           sdl | CVE-2019-7576    | https://security-tracker.debian.org/tracker/CVE-2019-7576   
                           sdl | CVE-2019-7577    | https://security-tracker.debian.org/tracker/CVE-2019-7577   
                           sdl | CVE-2019-7578    | https://security-tracker.debian.org/tracker/CVE-2019-7578   
                           sdl | CVE-2019-7635    | https://security-tracker.debian.org/tracker/CVE-2019-7635   
                           sdl | CVE-2019-7636    | https://security-tracker.debian.org/tracker/CVE-2019-7636   
                           sdl | CVE-2019-7637    | https://security-tracker.debian.org/tracker/CVE-2019-7637   
                           sdl | CVE-2019-7638    | https://security-tracker.debian.org/tracker/CVE-2019-7638   
                           sdl | CVE-2020-14409   | https://security-tracker.debian.org/tracker/CVE-2020-14409  
                           sdl | CVE-2020-14410   | https://security-tracker.debian.org/tracker/CVE-2020-14410  
                         smack | CVE-2014-0363    | https://security-tracker.debian.org/tracker/CVE-2014-0363   
                         smack | CVE-2014-0364    | https://security-tracker.debian.org/tracker/CVE-2014-0364   
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                         spice | CVE-2016-0749    | https://security-tracker.debian.org/tracker/CVE-2016-0749   
                         spice | CVE-2016-2150    | https://security-tracker.debian.org/tracker/CVE-2016-2150   
                         spice | CVE-2018-10893   | https://security-tracker.debian.org/tracker/CVE-2018-10893  
                    strongswan | CVE-2021-45079   | https://security-tracker.debian.org/tracker/CVE-2021-45079  
                          sudo | CVE-2021-3156    | https://security-tracker.debian.org/tracker/CVE-2021-3156   
                        thttpd | CVE-2012-5640    | https://security-tracker.debian.org/tracker/CVE-2012-5640   
                          tiff | CVE-2015-7313    | https://security-tracker.debian.org/tracker/CVE-2015-7313   
                          tiff | CVE-2022-0561    | https://security-tracker.debian.org/tracker/CVE-2022-0561   
                          tiff | CVE-2022-0562    | https://security-tracker.debian.org/tracker/CVE-2022-0562   
                          tinc | CVE-2013-1428    | https://security-tracker.debian.org/tracker/CVE-2013-1428   
                           tor | CVE-2016-9079    | https://security-tracker.debian.org/tracker/CVE-2016-9079   
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                    tpm2-tools | CVE-2021-3565    | https://security-tracker.debian.org/tracker/CVE-2021-3565   
                   uboot-tools | CVE-2021-27097   | https://security-tracker.debian.org/tracker/CVE-2021-27097  
                   uboot-tools | CVE-2021-27138   | https://security-tracker.debian.org/tracker/CVE-2021-27138  
                         unzip | CVE-2022-0529    | https://security-tracker.debian.org/tracker/CVE-2022-0529   
                         unzip | CVE-2022-0530    | https://security-tracker.debian.org/tracker/CVE-2022-0530   
                    util-linux | CVE-2021-37600   | https://security-tracker.debian.org/tracker/CVE-2021-37600  
               util-linux-libs | CVE-2021-37600   | https://security-tracker.debian.org/tracker/CVE-2021-37600  
                           vim | CVE-2022-0554    | https://security-tracker.debian.org/tracker/CVE-2022-0554   
                     webkitgtk | CVE-2021-42762   | https://security-tracker.debian.org/tracker/CVE-2021-42762  
                     webkitgtk | CVE-2021-45481   | https://security-tracker.debian.org/tracker/CVE-2021-45481  
                     webkitgtk | CVE-2021-45482   | https://security-tracker.debian.org/tracker/CVE-2021-45482  
                     webkitgtk | CVE-2021-45483   | https://security-tracker.debian.org/tracker/CVE-2021-45483  
                          wget | CVE-2021-31879   | https://security-tracker.debian.org/tracker/CVE-2021-31879  
                wpa_supplicant | CVE-2022-23303   | https://security-tracker.debian.org/tracker/CVE-2022-23303  
                wpa_supplicant | CVE-2022-23304   | https://security-tracker.debian.org/tracker/CVE-2022-23304  
                     wpewebkit | CVE-2021-42762   | https://security-tracker.debian.org/tracker/CVE-2021-42762  
                           xen | CVE-2011-1936    | https://security-tracker.debian.org/tracker/CVE-2011-1936   
                           xen | CVE-2011-3346    | https://security-tracker.debian.org/tracker/CVE-2011-3346   
                           xen | CVE-2014-2580    | https://security-tracker.debian.org/tracker/CVE-2014-2580   
                           xen | CVE-2014-3672    | https://security-tracker.debian.org/tracker/CVE-2014-3672   
                           xen | CVE-2015-7504    | https://security-tracker.debian.org/tracker/CVE-2015-7504   
                           xen | CVE-2015-8550    | https://security-tracker.debian.org/tracker/CVE-2015-8550   
                           xen | CVE-2015-8553    | https://security-tracker.debian.org/tracker/CVE-2015-8553   
                           xen | CVE-2016-3960    | https://security-tracker.debian.org/tracker/CVE-2016-3960   
                           xen | CVE-2016-7092    | https://security-tracker.debian.org/tracker/CVE-2016-7092   
                           xen | CVE-2016-9379    | https://security-tracker.debian.org/tracker/CVE-2016-9379   
                           xen | CVE-2016-9380    | https://security-tracker.debian.org/tracker/CVE-2016-9380   
                           xen | CVE-2016-9383    | https://security-tracker.debian.org/tracker/CVE-2016-9383   
                           xen | CVE-2016-9386    | https://security-tracker.debian.org/tracker/CVE-2016-9386   
                           xen | CVE-2017-12134   | https://security-tracker.debian.org/tracker/CVE-2017-12134  
                           xen | CVE-2017-12135   | https://security-tracker.debian.org/tracker/CVE-2017-12135  
                           xen | CVE-2017-12137   | https://security-tracker.debian.org/tracker/CVE-2017-12137  
                           xen | CVE-2017-7228    | https://security-tracker.debian.org/tracker/CVE-2017-7228   
                           xen | CVE-2018-5244    | https://security-tracker.debian.org/tracker/CVE-2018-5244   
                           xen | CVE-2018-8897    | https://security-tracker.debian.org/tracker/CVE-2018-8897   
                           xen | CVE-2021-26313   | https://security-tracker.debian.org/tracker/CVE-2021-26313  
                           xen | CVE-2021-26314   | https://security-tracker.debian.org/tracker/CVE-2021-26314  
                           xen | CVE-2021-28038   | https://security-tracker.debian.org/tracker/CVE-2021-28038  
                           xen | CVE-2021-28039   | https://security-tracker.debian.org/tracker/CVE-2021-28039  
                           xen | CVE-2021-28687   | https://security-tracker.debian.org/tracker/CVE-2021-28687  
                           xen | CVE-2021-28690   | https://security-tracker.debian.org/tracker/CVE-2021-28690  
                           xen | CVE-2021-28692   | https://security-tracker.debian.org/tracker/CVE-2021-28692  
                           xen | CVE-2021-28693   | https://security-tracker.debian.org/tracker/CVE-2021-28693  
                           xen | CVE-2021-28694   | https://security-tracker.debian.org/tracker/CVE-2021-28694  
                           xen | CVE-2021-28695   | https://security-tracker.debian.org/tracker/CVE-2021-28695  
                           xen | CVE-2021-28696   | https://security-tracker.debian.org/tracker/CVE-2021-28696  
                           xen | CVE-2021-28697   | https://security-tracker.debian.org/tracker/CVE-2021-28697  
                           xen | CVE-2021-28698   | https://security-tracker.debian.org/tracker/CVE-2021-28698  
                           xen | CVE-2021-28699   | https://security-tracker.debian.org/tracker/CVE-2021-28699  
                           xen | CVE-2021-28700   | https://security-tracker.debian.org/tracker/CVE-2021-28700  
                           xen | CVE-2021-28701   | https://security-tracker.debian.org/tracker/CVE-2021-28701  
                           xen | CVE-2021-28702   | https://security-tracker.debian.org/tracker/CVE-2021-28702  
                           xen | CVE-2021-28703   | https://security-tracker.debian.org/tracker/CVE-2021-28703  
                           xen | CVE-2021-28704   | https://security-tracker.debian.org/tracker/CVE-2021-28704  
                           xen | CVE-2021-28707   | https://security-tracker.debian.org/tracker/CVE-2021-28707  
                           xen | CVE-2021-28708   | https://security-tracker.debian.org/tracker/CVE-2021-28708  
                           xen | CVE-2021-28711   | https://security-tracker.debian.org/tracker/CVE-2021-28711  
                           xen | CVE-2021-28712   | https://security-tracker.debian.org/tracker/CVE-2021-28712  
                           xen | CVE-2021-28713   | https://security-tracker.debian.org/tracker/CVE-2021-28713  
                           xen | CVE-2022-23033   | https://security-tracker.debian.org/tracker/CVE-2022-23033  
                           xen | CVE-2022-23035   | https://security-tracker.debian.org/tracker/CVE-2022-23035  
                        xerces | CVE-2012-0880    | https://security-tracker.debian.org/tracker/CVE-2012-0880   
                  xscreensaver | CVE-2021-34557   | https://security-tracker.debian.org/tracker/CVE-2021-34557  
                         xterm | CVE-2022-24130   | https://security-tracker.debian.org/tracker/CVE-2022-24130  
                           zip | CVE-2018-13410   | https://security-tracker.debian.org/tracker/CVE-2018-13410  

CVEs for the '2021.11.x' branch
-------------------------------

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                        apache | CVE-1999-0236    | https://security-tracker.debian.org/tracker/CVE-1999-0236   
                        apache | CVE-1999-0289    | https://security-tracker.debian.org/tracker/CVE-1999-0289   
                        apache | CVE-1999-0678    | https://security-tracker.debian.org/tracker/CVE-1999-0678   
                        apache | CVE-1999-1237    | https://security-tracker.debian.org/tracker/CVE-1999-1237   
                        apache | CVE-1999-1412    | https://security-tracker.debian.org/tracker/CVE-1999-1412   
                        apache | CVE-2007-0086    | https://security-tracker.debian.org/tracker/CVE-2007-0086   
                        apache | CVE-2007-0450    | https://security-tracker.debian.org/tracker/CVE-2007-0450   
                        apache | CVE-2007-4465    | https://security-tracker.debian.org/tracker/CVE-2007-4465   
                        apache | CVE-2007-5000    | https://security-tracker.debian.org/tracker/CVE-2007-5000   
                        apache | CVE-2007-6388    | https://security-tracker.debian.org/tracker/CVE-2007-6388   
                        apache | CVE-2007-6420    | https://security-tracker.debian.org/tracker/CVE-2007-6420   
                        apache | CVE-2007-6421    | https://security-tracker.debian.org/tracker/CVE-2007-6421   
                        apache | CVE-2007-6422    | https://security-tracker.debian.org/tracker/CVE-2007-6422   
                        apache | CVE-2007-6423    | https://security-tracker.debian.org/tracker/CVE-2007-6423   
                        apache | CVE-2008-0455    | https://security-tracker.debian.org/tracker/CVE-2008-0455   
                        apache | CVE-2008-2168    | https://security-tracker.debian.org/tracker/CVE-2008-2168   
                        apache | CVE-2008-2939    | https://security-tracker.debian.org/tracker/CVE-2008-2939   
                        apache | CVE-2009-1195    | https://security-tracker.debian.org/tracker/CVE-2009-1195   
                        apache | CVE-2009-1890    | https://security-tracker.debian.org/tracker/CVE-2009-1890   
                        apache | CVE-2009-1891    | https://security-tracker.debian.org/tracker/CVE-2009-1891   
                        apache | CVE-2009-2699    | https://security-tracker.debian.org/tracker/CVE-2009-2699   
                        apache | CVE-2010-0408    | https://security-tracker.debian.org/tracker/CVE-2010-0408   
                        apache | CVE-2010-0425    | https://security-tracker.debian.org/tracker/CVE-2010-0425   
                        apache | CVE-2010-0434    | https://security-tracker.debian.org/tracker/CVE-2010-0434   
                        apache | CVE-2010-1452    | https://security-tracker.debian.org/tracker/CVE-2010-1452   
                        apache | CVE-2014-0231    | https://security-tracker.debian.org/tracker/CVE-2014-0231   
                      apparmor | CVE-2016-1585    | https://security-tracker.debian.org/tracker/CVE-2016-1585   
                           apr | CVE-2021-35940   | https://security-tracker.debian.org/tracker/CVE-2021-35940  
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                          atop | CVE-2011-3618    | https://security-tracker.debian.org/tracker/CVE-2011-3618   
                         avahi | CVE-2021-3468    | https://security-tracker.debian.org/tracker/CVE-2021-3468   
                     belle-sip | CVE-2021-33056   | https://security-tracker.debian.org/tracker/CVE-2021-33056  
                     belle-sip | CVE-2021-43610   | https://security-tracker.debian.org/tracker/CVE-2021-43610  
                     belle-sip | CVE-2021-43611   | https://security-tracker.debian.org/tracker/CVE-2021-43611  
                    berkeleydb | CVE-2017-3604    | https://security-tracker.debian.org/tracker/CVE-2017-3604   
                    berkeleydb | CVE-2017-3605    | https://security-tracker.debian.org/tracker/CVE-2017-3605   
                    berkeleydb | CVE-2017-3606    | https://security-tracker.debian.org/tracker/CVE-2017-3606   
                    berkeleydb | CVE-2017-3607    | https://security-tracker.debian.org/tracker/CVE-2017-3607   
                    berkeleydb | CVE-2017-3608    | https://security-tracker.debian.org/tracker/CVE-2017-3608   
                    berkeleydb | CVE-2017-3609    | https://security-tracker.debian.org/tracker/CVE-2017-3609   
                    berkeleydb | CVE-2017-3610    | https://security-tracker.debian.org/tracker/CVE-2017-3610   
                    berkeleydb | CVE-2017-3611    | https://security-tracker.debian.org/tracker/CVE-2017-3611   
                    berkeleydb | CVE-2017-3612    | https://security-tracker.debian.org/tracker/CVE-2017-3612   
                    berkeleydb | CVE-2017-3613    | https://security-tracker.debian.org/tracker/CVE-2017-3613   
                    berkeleydb | CVE-2017-3614    | https://security-tracker.debian.org/tracker/CVE-2017-3614   
                    berkeleydb | CVE-2017-3615    | https://security-tracker.debian.org/tracker/CVE-2017-3615   
                    berkeleydb | CVE-2017-3616    | https://security-tracker.debian.org/tracker/CVE-2017-3616   
                    berkeleydb | CVE-2017-3617    | https://security-tracker.debian.org/tracker/CVE-2017-3617   
                    berkeleydb | CVE-2019-2708    | https://security-tracker.debian.org/tracker/CVE-2019-2708   
                    berkeleydb | CVE-2020-2981    | https://security-tracker.debian.org/tracker/CVE-2020-2981   
                      binutils | CVE-2021-45078   | https://security-tracker.debian.org/tracker/CVE-2021-45078  
                       bitcoin | CVE-2012-1909    | https://security-tracker.debian.org/tracker/CVE-2012-1909   
                       bitcoin | CVE-2012-4682    | https://security-tracker.debian.org/tracker/CVE-2012-4682   
                       bitcoin | CVE-2012-4683    | https://security-tracker.debian.org/tracker/CVE-2012-4683   
                       bitcoin | CVE-2013-2272    | https://security-tracker.debian.org/tracker/CVE-2013-2272   
                       bitcoin | CVE-2013-2273    | https://security-tracker.debian.org/tracker/CVE-2013-2273   
                       bitcoin | CVE-2013-2292    | https://security-tracker.debian.org/tracker/CVE-2013-2292   
                       bitcoin | CVE-2013-2293    | https://security-tracker.debian.org/tracker/CVE-2013-2293   
                       bitcoin | CVE-2013-3220    | https://security-tracker.debian.org/tracker/CVE-2013-3220   
                  bluez5_utils | CVE-2020-12352   | https://security-tracker.debian.org/tracker/CVE-2020-12352  
                  bluez5_utils | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
          bluez5_utils-headers | CVE-2020-12352   | https://security-tracker.debian.org/tracker/CVE-2020-12352  
          bluez5_utils-headers | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
                        bsdiff | CVE-2020-14315   | https://security-tracker.debian.org/tracker/CVE-2020-14315  
                         cairo | CVE-2019-6461    | https://security-tracker.debian.org/tracker/CVE-2019-6461   
                         cairo | CVE-2019-6462    | https://security-tracker.debian.org/tracker/CVE-2019-6462   
                         cairo | CVE-2020-35492   | https://security-tracker.debian.org/tracker/CVE-2020-35492  
                        cereal | CVE-2020-11104   | https://security-tracker.debian.org/tracker/CVE-2020-11104  
                        clamav | CVE-2016-1405    | https://security-tracker.debian.org/tracker/CVE-2016-1405   
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
                      cryptopp | CVE-2021-43398   | https://security-tracker.debian.org/tracker/CVE-2021-43398  
                          cups | CVE-2018-6553    | https://security-tracker.debian.org/tracker/CVE-2018-6553   
                           cvs | CVE-2017-12836   | https://security-tracker.debian.org/tracker/CVE-2017-12836  
                          dbus | CVE-2020-35512   | https://security-tracker.debian.org/tracker/CVE-2020-35512  
                        docker | CVE-2014-0048    | https://security-tracker.debian.org/tracker/CVE-2014-0048   
                        docker | CVE-2014-8178    | https://security-tracker.debian.org/tracker/CVE-2014-8178   
                        docker | CVE-2014-8179    | https://security-tracker.debian.org/tracker/CVE-2014-8179   
                        docker | CVE-2015-1843    | https://security-tracker.debian.org/tracker/CVE-2015-1843   
                        docker | CVE-2015-3627    | https://security-tracker.debian.org/tracker/CVE-2015-3627   
                        docker | CVE-2015-3630    | https://security-tracker.debian.org/tracker/CVE-2015-3630   
                        docker | CVE-2015-3631    | https://security-tracker.debian.org/tracker/CVE-2015-3631   
                        docker | CVE-2016-3697    | https://security-tracker.debian.org/tracker/CVE-2016-3697   
                        docker | CVE-2017-14992   | https://security-tracker.debian.org/tracker/CVE-2017-14992  
                        docker | CVE-2019-13139   | https://security-tracker.debian.org/tracker/CVE-2019-13139  
                        docker | CVE-2019-13509   | https://security-tracker.debian.org/tracker/CVE-2019-13509  
                        docker | CVE-2019-15752   | https://security-tracker.debian.org/tracker/CVE-2019-15752  
                        docker | CVE-2019-16884   | https://security-tracker.debian.org/tracker/CVE-2019-16884  
                        docker | CVE-2019-5736    | https://security-tracker.debian.org/tracker/CVE-2019-5736   
                        docker | CVE-2020-27534   | https://security-tracker.debian.org/tracker/CVE-2020-27534  
                        docker | CVE-2021-21284   | https://security-tracker.debian.org/tracker/CVE-2021-21284  
                        docker | CVE-2021-21285   | https://security-tracker.debian.org/tracker/CVE-2021-21285  
                        docker | CVE-2021-3162    | https://security-tracker.debian.org/tracker/CVE-2021-3162   
                        docker | CVE-2021-33183   | https://security-tracker.debian.org/tracker/CVE-2021-33183  
                ecryptfs-utils | CVE-2016-1572    | https://security-tracker.debian.org/tracker/CVE-2016-1572   
                          edk2 | CVE-2014-4859    | https://security-tracker.debian.org/tracker/CVE-2014-4859   
                          edk2 | CVE-2014-4860    | https://security-tracker.debian.org/tracker/CVE-2014-4860   
                          edk2 | CVE-2014-8271    | https://security-tracker.debian.org/tracker/CVE-2014-8271   
                          edk2 | CVE-2019-14553   | https://security-tracker.debian.org/tracker/CVE-2019-14553  
                          edk2 | CVE-2019-14559   | https://security-tracker.debian.org/tracker/CVE-2019-14559  
                          edk2 | CVE-2019-14562   | https://security-tracker.debian.org/tracker/CVE-2019-14562  
                          edk2 | CVE-2019-14563   | https://security-tracker.debian.org/tracker/CVE-2019-14563  
                          edk2 | CVE-2019-14575   | https://security-tracker.debian.org/tracker/CVE-2019-14575  
                          edk2 | CVE-2019-14586   | https://security-tracker.debian.org/tracker/CVE-2019-14586  
                          edk2 | CVE-2019-14587   | https://security-tracker.debian.org/tracker/CVE-2019-14587  
                         emlog | CVE-2021-44584   | https://security-tracker.debian.org/tracker/CVE-2021-44584  
                        erlang | CVE-2020-35733   | https://security-tracker.debian.org/tracker/CVE-2020-35733  
                          exim | CVE-2020-28017   | https://security-tracker.debian.org/tracker/CVE-2020-28017  
                         exiv2 | CVE-2007-6353    | https://security-tracker.debian.org/tracker/CVE-2007-6353   
                        ffmpeg | CVE-2021-38291   | https://security-tracker.debian.org/tracker/CVE-2021-38291  
                         glibc | CVE-2010-4756    | https://security-tracker.debian.org/tracker/CVE-2010-4756   
                         glibc | CVE-2019-1010022 | https://security-tracker.debian.org/tracker/CVE-2019-1010022
                         glibc | CVE-2019-1010023 | https://security-tracker.debian.org/tracker/CVE-2019-1010023
                         glibc | CVE-2019-1010024 | https://security-tracker.debian.org/tracker/CVE-2019-1010024
                         glibc | CVE-2019-1010025 | https://security-tracker.debian.org/tracker/CVE-2019-1010025
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                            go | CVE-2020-29509   | https://security-tracker.debian.org/tracker/CVE-2020-29509  
                            go | CVE-2020-29511   | https://security-tracker.debian.org/tracker/CVE-2020-29511  
                            go | CVE-2022-23772   | https://security-tracker.debian.org/tracker/CVE-2022-23772  
                            go | CVE-2022-23773   | https://security-tracker.debian.org/tracker/CVE-2022-23773  
                            go | CVE-2022-23806   | https://security-tracker.debian.org/tracker/CVE-2022-23806  
                graphicsmagick | CVE-2007-0770    | https://security-tracker.debian.org/tracker/CVE-2007-0770   
                graphicsmagick | CVE-2008-6621    | https://security-tracker.debian.org/tracker/CVE-2008-6621   
                     graphite2 | CVE-2017-5436    | https://security-tracker.debian.org/tracker/CVE-2017-5436   
                       haproxy | CVE-2016-2102    | https://security-tracker.debian.org/tracker/CVE-2016-2102   
                heirloom-mailx | CVE-2004-2771    | https://security-tracker.debian.org/tracker/CVE-2004-2771   
                       hostapd | CVE-2022-23303   | https://security-tracker.debian.org/tracker/CVE-2022-23303  
                       hostapd | CVE-2022-23304   | https://security-tracker.debian.org/tracker/CVE-2022-23304  
                   imagemagick | CVE-2007-1667    | https://security-tracker.debian.org/tracker/CVE-2007-1667   
                   imagemagick | CVE-2014-9804    | https://security-tracker.debian.org/tracker/CVE-2014-9804   
                   imagemagick | CVE-2014-9805    | https://security-tracker.debian.org/tracker/CVE-2014-9805   
                   imagemagick | CVE-2014-9806    | https://security-tracker.debian.org/tracker/CVE-2014-9806   
                   imagemagick | CVE-2014-9807    | https://security-tracker.debian.org/tracker/CVE-2014-9807   
                   imagemagick | CVE-2014-9808    | https://security-tracker.debian.org/tracker/CVE-2014-9808   
                   imagemagick | CVE-2014-9809    | https://security-tracker.debian.org/tracker/CVE-2014-9809   
                   imagemagick | CVE-2014-9810    | https://security-tracker.debian.org/tracker/CVE-2014-9810   
                   imagemagick | CVE-2014-9811    | https://security-tracker.debian.org/tracker/CVE-2014-9811   
                   imagemagick | CVE-2014-9812    | https://security-tracker.debian.org/tracker/CVE-2014-9812   
                   imagemagick | CVE-2014-9813    | https://security-tracker.debian.org/tracker/CVE-2014-9813   
                   imagemagick | CVE-2014-9814    | https://security-tracker.debian.org/tracker/CVE-2014-9814   
                   imagemagick | CVE-2014-9815    | https://security-tracker.debian.org/tracker/CVE-2014-9815   
                   imagemagick | CVE-2014-9816    | https://security-tracker.debian.org/tracker/CVE-2014-9816   
                   imagemagick | CVE-2014-9817    | https://security-tracker.debian.org/tracker/CVE-2014-9817   
                   imagemagick | CVE-2014-9818    | https://security-tracker.debian.org/tracker/CVE-2014-9818   
                   imagemagick | CVE-2014-9819    | https://security-tracker.debian.org/tracker/CVE-2014-9819   
                   imagemagick | CVE-2014-9820    | https://security-tracker.debian.org/tracker/CVE-2014-9820   
                   imagemagick | CVE-2014-9821    | https://security-tracker.debian.org/tracker/CVE-2014-9821   
                   imagemagick | CVE-2014-9822    | https://security-tracker.debian.org/tracker/CVE-2014-9822   
                   imagemagick | CVE-2014-9823    | https://security-tracker.debian.org/tracker/CVE-2014-9823   
                   imagemagick | CVE-2014-9824    | https://security-tracker.debian.org/tracker/CVE-2014-9824   
                   imagemagick | CVE-2014-9825    | https://security-tracker.debian.org/tracker/CVE-2014-9825   
                   imagemagick | CVE-2014-9826    | https://security-tracker.debian.org/tracker/CVE-2014-9826   
                   imagemagick | CVE-2014-9827    | https://security-tracker.debian.org/tracker/CVE-2014-9827   
                   imagemagick | CVE-2014-9828    | https://security-tracker.debian.org/tracker/CVE-2014-9828   
                   imagemagick | CVE-2014-9829    | https://security-tracker.debian.org/tracker/CVE-2014-9829   
                   imagemagick | CVE-2014-9830    | https://security-tracker.debian.org/tracker/CVE-2014-9830   
                   imagemagick | CVE-2014-9831    | https://security-tracker.debian.org/tracker/CVE-2014-9831   
                   imagemagick | CVE-2014-9848    | https://security-tracker.debian.org/tracker/CVE-2014-9848   
                   imagemagick | CVE-2014-9852    | https://security-tracker.debian.org/tracker/CVE-2014-9852   
                   imagemagick | CVE-2014-9853    | https://security-tracker.debian.org/tracker/CVE-2014-9853   
                   imagemagick | CVE-2014-9854    | https://security-tracker.debian.org/tracker/CVE-2014-9854   
                   imagemagick | CVE-2014-9907    | https://security-tracker.debian.org/tracker/CVE-2014-9907   
                   imagemagick | CVE-2016-10062   | https://security-tracker.debian.org/tracker/CVE-2016-10062  
                   imagemagick | CVE-2016-10144   | https://security-tracker.debian.org/tracker/CVE-2016-10144  
                   imagemagick | CVE-2016-10145   | https://security-tracker.debian.org/tracker/CVE-2016-10145  
                   imagemagick | CVE-2016-10146   | https://security-tracker.debian.org/tracker/CVE-2016-10146  
                   imagemagick | CVE-2016-7513    | https://security-tracker.debian.org/tracker/CVE-2016-7513   
                   imagemagick | CVE-2016-7514    | https://security-tracker.debian.org/tracker/CVE-2016-7514   
                   imagemagick | CVE-2016-7515    | https://security-tracker.debian.org/tracker/CVE-2016-7515   
                   imagemagick | CVE-2016-7516    | https://security-tracker.debian.org/tracker/CVE-2016-7516   
                   imagemagick | CVE-2016-7517    | https://security-tracker.debian.org/tracker/CVE-2016-7517   
                   imagemagick | CVE-2016-7518    | https://security-tracker.debian.org/tracker/CVE-2016-7518   
                   imagemagick | CVE-2016-7519    | https://security-tracker.debian.org/tracker/CVE-2016-7519   
                   imagemagick | CVE-2016-7520    | https://security-tracker.debian.org/tracker/CVE-2016-7520   
                   imagemagick | CVE-2016-7521    | https://security-tracker.debian.org/tracker/CVE-2016-7521   
                   imagemagick | CVE-2016-7522    | https://security-tracker.debian.org/tracker/CVE-2016-7522   
                   imagemagick | CVE-2016-7523    | https://security-tracker.debian.org/tracker/CVE-2016-7523   
                   imagemagick | CVE-2016-7524    | https://security-tracker.debian.org/tracker/CVE-2016-7524   
                   imagemagick | CVE-2016-7525    | https://security-tracker.debian.org/tracker/CVE-2016-7525   
                   imagemagick | CVE-2016-7526    | https://security-tracker.debian.org/tracker/CVE-2016-7526   
                   imagemagick | CVE-2016-7527    | https://security-tracker.debian.org/tracker/CVE-2016-7527   
                   imagemagick | CVE-2016-7528    | https://security-tracker.debian.org/tracker/CVE-2016-7528   
                   imagemagick | CVE-2016-7529    | https://security-tracker.debian.org/tracker/CVE-2016-7529   
                   imagemagick | CVE-2016-7530    | https://security-tracker.debian.org/tracker/CVE-2016-7530   
                   imagemagick | CVE-2016-7531    | https://security-tracker.debian.org/tracker/CVE-2016-7531   
                   imagemagick | CVE-2016-7532    | https://security-tracker.debian.org/tracker/CVE-2016-7532   
                   imagemagick | CVE-2016-7533    | https://security-tracker.debian.org/tracker/CVE-2016-7533   
                   imagemagick | CVE-2016-7534    | https://security-tracker.debian.org/tracker/CVE-2016-7534   
                   imagemagick | CVE-2016-7535    | https://security-tracker.debian.org/tracker/CVE-2016-7535   
                   imagemagick | CVE-2016-7536    | https://security-tracker.debian.org/tracker/CVE-2016-7536   
                   imagemagick | CVE-2016-7537    | https://security-tracker.debian.org/tracker/CVE-2016-7537   
                   imagemagick | CVE-2016-7538    | https://security-tracker.debian.org/tracker/CVE-2016-7538   
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                   imagemagick | CVE-2017-5509    | https://security-tracker.debian.org/tracker/CVE-2017-5509   
                   imagemagick | CVE-2017-5510    | https://security-tracker.debian.org/tracker/CVE-2017-5510   
                   imagemagick | CVE-2017-5511    | https://security-tracker.debian.org/tracker/CVE-2017-5511   
                       jansson | CVE-2020-36325   | https://security-tracker.debian.org/tracker/CVE-2020-36325  
                        jasper | CVE-2015-8751    | https://security-tracker.debian.org/tracker/CVE-2015-8751   
                        jquery | CVE-2007-2379    | https://security-tracker.debian.org/tracker/CVE-2007-2379   
                         libao | CVE-2017-11548   | https://security-tracker.debian.org/tracker/CVE-2017-11548  
                    libarchive | CVE-2021-36976   | https://security-tracker.debian.org/tracker/CVE-2021-36976  
                  libfreeimage | CVE-2019-12211   | https://security-tracker.debian.org/tracker/CVE-2019-12211  
                  libfreeimage | CVE-2019-12212   | https://security-tracker.debian.org/tracker/CVE-2019-12212  
                  libfreeimage | CVE-2019-12213   | https://security-tracker.debian.org/tracker/CVE-2019-12213  
                  libfreeimage | CVE-2019-12214   | https://security-tracker.debian.org/tracker/CVE-2019-12214  
                     libiberty | CVE-2012-3509    | https://security-tracker.debian.org/tracker/CVE-2012-3509   
                     libiberty | CVE-2016-2226    | https://security-tracker.debian.org/tracker/CVE-2016-2226   
                     libiberty | CVE-2016-4487    | https://security-tracker.debian.org/tracker/CVE-2016-4487   
                     libiberty | CVE-2016-4488    | https://security-tracker.debian.org/tracker/CVE-2016-4488   
                     libiberty | CVE-2016-4489    | https://security-tracker.debian.org/tracker/CVE-2016-4489   
                     libiberty | CVE-2016-4490    | https://security-tracker.debian.org/tracker/CVE-2016-4490   
                     libiberty | CVE-2016-4491    | https://security-tracker.debian.org/tracker/CVE-2016-4491   
                     libiberty | CVE-2016-4492    | https://security-tracker.debian.org/tracker/CVE-2016-4492   
                     libiberty | CVE-2016-4493    | https://security-tracker.debian.org/tracker/CVE-2016-4493   
                     libiberty | CVE-2016-6131    | https://security-tracker.debian.org/tracker/CVE-2016-6131   
                   libiec61850 | CVE-2021-45769   | https://security-tracker.debian.org/tracker/CVE-2021-45769  
                       libkrb5 | CVE-1999-0143    | https://security-tracker.debian.org/tracker/CVE-1999-0143   
                       libkrb5 | CVE-1999-0713    | https://security-tracker.debian.org/tracker/CVE-1999-0713   
                       libkrb5 | CVE-2007-3149    | https://security-tracker.debian.org/tracker/CVE-2007-3149   
                       libkrb5 | CVE-2007-5894    | https://security-tracker.debian.org/tracker/CVE-2007-5894   
                       libkrb5 | CVE-2007-5902    | https://security-tracker.debian.org/tracker/CVE-2007-5902   
                       libkrb5 | CVE-2009-0844    | https://security-tracker.debian.org/tracker/CVE-2009-0844   
                       libkrb5 | CVE-2009-0846    | https://security-tracker.debian.org/tracker/CVE-2009-0846   
                       libldns | CVE-2020-19860   | https://security-tracker.debian.org/tracker/CVE-2020-19860  
                       libldns | CVE-2020-19861   | https://security-tracker.debian.org/tracker/CVE-2020-19861  
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                      libpjsip | CVE-2021-37706   | https://security-tracker.debian.org/tracker/CVE-2021-37706  
                      libpjsip | CVE-2021-41141   | https://security-tracker.debian.org/tracker/CVE-2021-41141  
                      libpjsip | CVE-2021-43804   | https://security-tracker.debian.org/tracker/CVE-2021-43804  
                      libpjsip | CVE-2021-43845   | https://security-tracker.debian.org/tracker/CVE-2021-43845  
                      libpjsip | CVE-2022-21722   | https://security-tracker.debian.org/tracker/CVE-2022-21722  
                      libpjsip | CVE-2022-21723   | https://security-tracker.debian.org/tracker/CVE-2022-21723  
                      libplist | CVE-2017-5834    | https://security-tracker.debian.org/tracker/CVE-2017-5834   
                      libplist | CVE-2017-5835    | https://security-tracker.debian.org/tracker/CVE-2017-5835   
                      libplist | CVE-2017-5836    | https://security-tracker.debian.org/tracker/CVE-2017-5836   
                    libtorrent | CVE-2009-1760    | https://security-tracker.debian.org/tracker/CVE-2009-1760   
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                       libvirt | CVE-2014-8135    | https://security-tracker.debian.org/tracker/CVE-2014-8135   
                       libvirt | CVE-2014-8136    | https://security-tracker.debian.org/tracker/CVE-2014-8136   
                       libvirt | CVE-2015-5313    | https://security-tracker.debian.org/tracker/CVE-2015-5313   
                       libvirt | CVE-2018-5748    | https://security-tracker.debian.org/tracker/CVE-2018-5748   
                       libvirt | CVE-2018-6764    | https://security-tracker.debian.org/tracker/CVE-2018-6764   
                      lighttpd | CVE-2022-22707   | https://security-tracker.debian.org/tracker/CVE-2022-22707  
                         lrzsz | CVE-2018-10195   | https://security-tracker.debian.org/tracker/CVE-2018-10195  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2020-15888   | https://security-tracker.debian.org/tracker/CVE-2020-15888  
                           lua | CVE-2020-15945   | https://security-tracker.debian.org/tracker/CVE-2020-15945  
                           lua | CVE-2021-43519   | https://security-tracker.debian.org/tracker/CVE-2021-43519  
                       mariadb | CVE-2021-46658   | https://security-tracker.debian.org/tracker/CVE-2021-46658  
                       mariadb | CVE-2021-46659   | https://security-tracker.debian.org/tracker/CVE-2021-46659  
                       mariadb | CVE-2021-46661   | https://security-tracker.debian.org/tracker/CVE-2021-46661  
                       mariadb | CVE-2021-46662   | https://security-tracker.debian.org/tracker/CVE-2021-46662  
                       mariadb | CVE-2021-46663   | https://security-tracker.debian.org/tracker/CVE-2021-46663  
                       mariadb | CVE-2021-46664   | https://security-tracker.debian.org/tracker/CVE-2021-46664  
                       mariadb | CVE-2021-46665   | https://security-tracker.debian.org/tracker/CVE-2021-46665  
                       mariadb | CVE-2021-46667   | https://security-tracker.debian.org/tracker/CVE-2021-46667  
                       mariadb | CVE-2021-46668   | https://security-tracker.debian.org/tracker/CVE-2021-46668  
                       mariadb | CVE-2021-46669   | https://security-tracker.debian.org/tracker/CVE-2021-46669  
                         matio | CVE-2020-36428   | https://security-tracker.debian.org/tracker/CVE-2020-36428  
                         matio | CVE-2021-36977   | https://security-tracker.debian.org/tracker/CVE-2021-36977  
                       mbedtls | CVE-2020-36477   | https://security-tracker.debian.org/tracker/CVE-2020-36477  
                       mbedtls | CVE-2021-24119   | https://security-tracker.debian.org/tracker/CVE-2021-24119  
                       mbedtls | CVE-2021-45450   | https://security-tracker.debian.org/tracker/CVE-2021-45450  
                       mbedtls | CVE-2021-45451   | https://security-tracker.debian.org/tracker/CVE-2021-45451  
                        midori | CVE-2019-19916   | https://security-tracker.debian.org/tracker/CVE-2019-19916  
                       mongodb | CVE-2014-8180    | https://security-tracker.debian.org/tracker/CVE-2014-8180   
                       mongodb | CVE-2017-18381   | https://security-tracker.debian.org/tracker/CVE-2017-18381  
                       mongodb | CVE-2017-2665    | https://security-tracker.debian.org/tracker/CVE-2017-2665   
                           mpd | CVE-2020-7465    | https://security-tracker.debian.org/tracker/CVE-2020-7465   
                           mpd | CVE-2020-7466    | https://security-tracker.debian.org/tracker/CVE-2020-7466   
                         mupdf | CVE-2017-5991    | https://security-tracker.debian.org/tracker/CVE-2017-5991   
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
                          nasm | CVE-2020-18974   | https://security-tracker.debian.org/tracker/CVE-2020-18974  
                       ncurses | CVE-2021-39537   | https://security-tracker.debian.org/tracker/CVE-2021-39537  
                           ntp | CVE-2014-9750    | https://security-tracker.debian.org/tracker/CVE-2014-9750   
                           ntp | CVE-2014-9751    | https://security-tracker.debian.org/tracker/CVE-2014-9751   
                           ntp | CVE-2015-7691    | https://security-tracker.debian.org/tracker/CVE-2015-7691   
                           ntp | CVE-2015-7692    | https://security-tracker.debian.org/tracker/CVE-2015-7692   
                           ntp | CVE-2015-7701    | https://security-tracker.debian.org/tracker/CVE-2015-7701   
                           ntp | CVE-2015-7702    | https://security-tracker.debian.org/tracker/CVE-2015-7702   
                           ntp | CVE-2015-7703    | https://security-tracker.debian.org/tracker/CVE-2015-7703   
                           ntp | CVE-2015-7704    | https://security-tracker.debian.org/tracker/CVE-2015-7704   
                           ntp | CVE-2015-7705    | https://security-tracker.debian.org/tracker/CVE-2015-7705   
                           ntp | CVE-2015-7849    | https://security-tracker.debian.org/tracker/CVE-2015-7849   
                           ntp | CVE-2015-7850    | https://security-tracker.debian.org/tracker/CVE-2015-7850   
                           ntp | CVE-2015-7852    | https://security-tracker.debian.org/tracker/CVE-2015-7852   
                           ntp | CVE-2015-7853    | https://security-tracker.debian.org/tracker/CVE-2015-7853   
                           ntp | CVE-2015-7854    | https://security-tracker.debian.org/tracker/CVE-2015-7854   
                           ntp | CVE-2015-7855    | https://security-tracker.debian.org/tracker/CVE-2015-7855   
                           ntp | CVE-2015-7973    | https://security-tracker.debian.org/tracker/CVE-2015-7973   
                           ntp | CVE-2015-7974    | https://security-tracker.debian.org/tracker/CVE-2015-7974   
                           ntp | CVE-2015-7977    | https://security-tracker.debian.org/tracker/CVE-2015-7977   
                           ntp | CVE-2016-2518    | https://security-tracker.debian.org/tracker/CVE-2016-2518   
                           ntp | CVE-2016-4953    | https://security-tracker.debian.org/tracker/CVE-2016-4953   
                           ntp | CVE-2016-4954    | https://security-tracker.debian.org/tracker/CVE-2016-4954   
                           ntp | CVE-2016-4955    | https://security-tracker.debian.org/tracker/CVE-2016-4955   
                           ntp | CVE-2016-4956    | https://security-tracker.debian.org/tracker/CVE-2016-4956   
                           ntp | CVE-2016-7426    | https://security-tracker.debian.org/tracker/CVE-2016-7426   
                           ntp | CVE-2016-7434    | https://security-tracker.debian.org/tracker/CVE-2016-7434   
                           ntp | CVE-2017-6458    | https://security-tracker.debian.org/tracker/CVE-2017-6458   
                           ntp | CVE-2018-7170    | https://security-tracker.debian.org/tracker/CVE-2018-7170   
                           ntp | CVE-2018-7185    | https://security-tracker.debian.org/tracker/CVE-2018-7185   
                           ntp | CVE-2019-11331   | https://security-tracker.debian.org/tracker/CVE-2019-11331  
                           ntp | CVE-2019-8936    | https://security-tracker.debian.org/tracker/CVE-2019-8936   
                           ntp | CVE-2020-11868   | https://security-tracker.debian.org/tracker/CVE-2020-11868  
                           ntp | CVE-2020-13817   | https://security-tracker.debian.org/tracker/CVE-2020-13817  
                       opencv3 | CVE-2019-14493   | https://security-tracker.debian.org/tracker/CVE-2019-14493  
                       opencv3 | CVE-2019-15939   | https://security-tracker.debian.org/tracker/CVE-2019-15939  
                       opencv3 | CVE-2019-19624   | https://security-tracker.debian.org/tracker/CVE-2019-19624  
                       openjdk | CVE-2009-2475    | https://security-tracker.debian.org/tracker/CVE-2009-2475   
                       openjdk | CVE-2009-2476    | https://security-tracker.debian.org/tracker/CVE-2009-2476   
                       openjdk | CVE-2009-2689    | https://security-tracker.debian.org/tracker/CVE-2009-2689   
                       openjdk | CVE-2009-2690    | https://security-tracker.debian.org/tracker/CVE-2009-2690   
                       openjdk | CVE-2009-3728    | https://security-tracker.debian.org/tracker/CVE-2009-3728   
                       openjdk | CVE-2009-3879    | https://security-tracker.debian.org/tracker/CVE-2009-3879   
                       openjdk | CVE-2009-3880    | https://security-tracker.debian.org/tracker/CVE-2009-3880   
                       openjdk | CVE-2009-3881    | https://security-tracker.debian.org/tracker/CVE-2009-3881   
                       openjdk | CVE-2009-3882    | https://security-tracker.debian.org/tracker/CVE-2009-3882   
                       openjdk | CVE-2009-3883    | https://security-tracker.debian.org/tracker/CVE-2009-3883   
                       openjdk | CVE-2009-3884    | https://security-tracker.debian.org/tracker/CVE-2009-3884   
                       openjdk | CVE-2013-0169    | https://security-tracker.debian.org/tracker/CVE-2013-0169   
                      openjpeg | CVE-2015-1239    | https://security-tracker.debian.org/tracker/CVE-2015-1239   
                      openjpeg | CVE-2016-7163    | https://security-tracker.debian.org/tracker/CVE-2016-7163   
                      openjpeg | CVE-2016-9675    | https://security-tracker.debian.org/tracker/CVE-2016-9675   
                      openjpeg | CVE-2021-29338   | https://security-tracker.debian.org/tracker/CVE-2021-29338  
                      openldap | CVE-2015-3276    | https://security-tracker.debian.org/tracker/CVE-2015-3276   
                       openssh | CVE-2007-2768    | https://security-tracker.debian.org/tracker/CVE-2007-2768   
                       openssh | CVE-2008-3844    | https://security-tracker.debian.org/tracker/CVE-2008-3844   
                       openssh | CVE-2014-9278    | https://security-tracker.debian.org/tracker/CVE-2014-9278   
                      openswan | CVE-2019-10155   | https://security-tracker.debian.org/tracker/CVE-2019-10155  
                         p7zip | CVE-2017-17969   | https://security-tracker.debian.org/tracker/CVE-2017-17969  
                         p7zip | CVE-2018-5996    | https://security-tracker.debian.org/tracker/CVE-2018-5996   
                         patch | CVE-2018-6952    | https://security-tracker.debian.org/tracker/CVE-2018-6952   
                         patch | CVE-2019-20633   | https://security-tracker.debian.org/tracker/CVE-2019-20633  
                           php | CVE-2007-2728    | https://security-tracker.debian.org/tracker/CVE-2007-2728   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                           php | CVE-2007-4596    | https://security-tracker.debian.org/tracker/CVE-2007-4596   
                        polkit | CVE-2021-4034    | https://security-tracker.debian.org/tracker/CVE-2021-4034   
                    postgresql | CVE-2017-8806    | https://security-tracker.debian.org/tracker/CVE-2017-8806   
                 powerpc-utils | CVE-2014-8165    | https://security-tracker.debian.org/tracker/CVE-2014-8165   
                        python | CVE-2015-5652    | https://security-tracker.debian.org/tracker/CVE-2015-5652   
                        python | CVE-2017-17522   | https://security-tracker.debian.org/tracker/CVE-2017-17522  
                        python | CVE-2017-18207   | https://security-tracker.debian.org/tracker/CVE-2017-18207  
                        python | CVE-2019-20907   | https://security-tracker.debian.org/tracker/CVE-2019-20907  
                        python | CVE-2019-9674    | https://security-tracker.debian.org/tracker/CVE-2019-9674   
                        python | CVE-2021-23336   | https://security-tracker.debian.org/tracker/CVE-2021-23336  
                        python | CVE-2022-0391    | https://security-tracker.debian.org/tracker/CVE-2022-0391   
                python-ipython | CVE-2022-21699   | https://security-tracker.debian.org/tracker/CVE-2022-21699  
               python-m2crypto | CVE-2020-25657   | https://security-tracker.debian.org/tracker/CVE-2020-25657  
                 python-pillow | CVE-2022-22815   | https://security-tracker.debian.org/tracker/CVE-2022-22815  
                 python-pillow | CVE-2022-22816   | https://security-tracker.debian.org/tracker/CVE-2022-22816  
                 python-pillow | CVE-2022-22817   | https://security-tracker.debian.org/tracker/CVE-2022-22817  
                    python-pip | CVE-2018-20225   | https://security-tracker.debian.org/tracker/CVE-2018-20225  
                python-twisted | CVE-2022-21712   | https://security-tracker.debian.org/tracker/CVE-2022-21712  
                          qemu | CVE-2018-18438   | https://security-tracker.debian.org/tracker/CVE-2018-18438  
                          qemu | CVE-2019-12067   | https://security-tracker.debian.org/tracker/CVE-2019-12067  
                          qemu | CVE-2021-20255   | https://security-tracker.debian.org/tracker/CVE-2021-20255  
                          qemu | CVE-2021-3682    | https://security-tracker.debian.org/tracker/CVE-2021-3682   
                          qemu | CVE-2021-3713    | https://security-tracker.debian.org/tracker/CVE-2021-3713   
                          qemu | CVE-2021-4145    | https://security-tracker.debian.org/tracker/CVE-2021-4145   
                        quagga | CVE-2016-4049    | https://security-tracker.debian.org/tracker/CVE-2016-4049   
                        quagga | CVE-2017-3224    | https://security-tracker.debian.org/tracker/CVE-2017-3224   
                        quagga | CVE-2021-44038   | https://security-tracker.debian.org/tracker/CVE-2021-44038  
               rabbitmq-server | CVE-2018-11087   | https://security-tracker.debian.org/tracker/CVE-2018-11087  
               rabbitmq-server | CVE-2018-1279    | https://security-tracker.debian.org/tracker/CVE-2018-1279   
               rabbitmq-server | CVE-2020-5419    | https://security-tracker.debian.org/tracker/CVE-2020-5419   
                        raptor | CVE-2020-25713   | https://security-tracker.debian.org/tracker/CVE-2020-25713  
                   resiprocate | CVE-2017-9454    | https://security-tracker.debian.org/tracker/CVE-2017-9454   
                          rust | CVE-2022-21658   | https://security-tracker.debian.org/tracker/CVE-2022-21658  
                        samba4 | CVE-2011-2411    | https://security-tracker.debian.org/tracker/CVE-2011-2411   
                        samba4 | CVE-2018-1050    | https://security-tracker.debian.org/tracker/CVE-2018-1050   
                        samba4 | CVE-2018-1057    | https://security-tracker.debian.org/tracker/CVE-2018-1057   
                           sdl | CVE-2019-13616   | https://security-tracker.debian.org/tracker/CVE-2019-13616  
                           sdl | CVE-2019-14906   | https://security-tracker.debian.org/tracker/CVE-2019-14906  
                           sdl | CVE-2019-7572    | https://security-tracker.debian.org/tracker/CVE-2019-7572   
                           sdl | CVE-2019-7573    | https://security-tracker.debian.org/tracker/CVE-2019-7573   
                           sdl | CVE-2019-7574    | https://security-tracker.debian.org/tracker/CVE-2019-7574   
                           sdl | CVE-2019-7575    | https://security-tracker.debian.org/tracker/CVE-2019-7575   
                           sdl | CVE-2019-7576    | https://security-tracker.debian.org/tracker/CVE-2019-7576   
                           sdl | CVE-2019-7577    | https://security-tracker.debian.org/tracker/CVE-2019-7577   
                           sdl | CVE-2019-7578    | https://security-tracker.debian.org/tracker/CVE-2019-7578   
                           sdl | CVE-2019-7635    | https://security-tracker.debian.org/tracker/CVE-2019-7635   
                           sdl | CVE-2019-7636    | https://security-tracker.debian.org/tracker/CVE-2019-7636   
                           sdl | CVE-2019-7637    | https://security-tracker.debian.org/tracker/CVE-2019-7637   
                           sdl | CVE-2019-7638    | https://security-tracker.debian.org/tracker/CVE-2019-7638   
                           sdl | CVE-2020-14409   | https://security-tracker.debian.org/tracker/CVE-2020-14409  
                           sdl | CVE-2020-14410   | https://security-tracker.debian.org/tracker/CVE-2020-14410  
                         smack | CVE-2014-0363    | https://security-tracker.debian.org/tracker/CVE-2014-0363   
                         smack | CVE-2014-0364    | https://security-tracker.debian.org/tracker/CVE-2014-0364   
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                         spice | CVE-2016-0749    | https://security-tracker.debian.org/tracker/CVE-2016-0749   
                         spice | CVE-2016-2150    | https://security-tracker.debian.org/tracker/CVE-2016-2150   
                         spice | CVE-2018-10893   | https://security-tracker.debian.org/tracker/CVE-2018-10893  
                        sqlite | CVE-2021-36690   | https://security-tracker.debian.org/tracker/CVE-2021-36690  
                    strongswan | CVE-2021-45079   | https://security-tracker.debian.org/tracker/CVE-2021-45079  
                        thttpd | CVE-2012-5640    | https://security-tracker.debian.org/tracker/CVE-2012-5640   
                          tiff | CVE-2015-7313    | https://security-tracker.debian.org/tracker/CVE-2015-7313   
                          tiff | CVE-2022-0561    | https://security-tracker.debian.org/tracker/CVE-2022-0561   
                          tiff | CVE-2022-0562    | https://security-tracker.debian.org/tracker/CVE-2022-0562   
                          tinc | CVE-2013-1428    | https://security-tracker.debian.org/tracker/CVE-2013-1428   
                           tor | CVE-2016-9079    | https://security-tracker.debian.org/tracker/CVE-2016-9079   
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                         unzip | CVE-2022-0529    | https://security-tracker.debian.org/tracker/CVE-2022-0529   
                         unzip | CVE-2022-0530    | https://security-tracker.debian.org/tracker/CVE-2022-0530   
                           vim | CVE-2022-0554    | https://security-tracker.debian.org/tracker/CVE-2022-0554   
                     webkitgtk | CVE-2021-42762   | https://security-tracker.debian.org/tracker/CVE-2021-42762  
                wpa_supplicant | CVE-2022-23303   | https://security-tracker.debian.org/tracker/CVE-2022-23303  
                wpa_supplicant | CVE-2022-23304   | https://security-tracker.debian.org/tracker/CVE-2022-23304  
                     wpewebkit | CVE-2021-42762   | https://security-tracker.debian.org/tracker/CVE-2021-42762  
                           xen | CVE-2011-1936    | https://security-tracker.debian.org/tracker/CVE-2011-1936   
                           xen | CVE-2011-3346    | https://security-tracker.debian.org/tracker/CVE-2011-3346   
                           xen | CVE-2014-2580    | https://security-tracker.debian.org/tracker/CVE-2014-2580   
                           xen | CVE-2014-3672    | https://security-tracker.debian.org/tracker/CVE-2014-3672   
                           xen | CVE-2015-7504    | https://security-tracker.debian.org/tracker/CVE-2015-7504   
                           xen | CVE-2015-8550    | https://security-tracker.debian.org/tracker/CVE-2015-8550   
                           xen | CVE-2015-8553    | https://security-tracker.debian.org/tracker/CVE-2015-8553   
                           xen | CVE-2016-3960    | https://security-tracker.debian.org/tracker/CVE-2016-3960   
                           xen | CVE-2016-7092    | https://security-tracker.debian.org/tracker/CVE-2016-7092   
                           xen | CVE-2016-9379    | https://security-tracker.debian.org/tracker/CVE-2016-9379   
                           xen | CVE-2016-9380    | https://security-tracker.debian.org/tracker/CVE-2016-9380   
                           xen | CVE-2016-9383    | https://security-tracker.debian.org/tracker/CVE-2016-9383   
                           xen | CVE-2016-9386    | https://security-tracker.debian.org/tracker/CVE-2016-9386   
                           xen | CVE-2017-12134   | https://security-tracker.debian.org/tracker/CVE-2017-12134  
                           xen | CVE-2017-12135   | https://security-tracker.debian.org/tracker/CVE-2017-12135  
                           xen | CVE-2017-12137   | https://security-tracker.debian.org/tracker/CVE-2017-12137  
                           xen | CVE-2017-7228    | https://security-tracker.debian.org/tracker/CVE-2017-7228   
                           xen | CVE-2018-5244    | https://security-tracker.debian.org/tracker/CVE-2018-5244   
                           xen | CVE-2018-8897    | https://security-tracker.debian.org/tracker/CVE-2018-8897   
                           xen | CVE-2021-26313   | https://security-tracker.debian.org/tracker/CVE-2021-26313  
                           xen | CVE-2021-26314   | https://security-tracker.debian.org/tracker/CVE-2021-26314  
                           xen | CVE-2021-28038   | https://security-tracker.debian.org/tracker/CVE-2021-28038  
                           xen | CVE-2021-28039   | https://security-tracker.debian.org/tracker/CVE-2021-28039  
                           xen | CVE-2021-28687   | https://security-tracker.debian.org/tracker/CVE-2021-28687  
                           xen | CVE-2021-28690   | https://security-tracker.debian.org/tracker/CVE-2021-28690  
                           xen | CVE-2021-28692   | https://security-tracker.debian.org/tracker/CVE-2021-28692  
                           xen | CVE-2021-28693   | https://security-tracker.debian.org/tracker/CVE-2021-28693  
                           xen | CVE-2021-28694   | https://security-tracker.debian.org/tracker/CVE-2021-28694  
                           xen | CVE-2021-28695   | https://security-tracker.debian.org/tracker/CVE-2021-28695  
                           xen | CVE-2021-28696   | https://security-tracker.debian.org/tracker/CVE-2021-28696  
                           xen | CVE-2021-28697   | https://security-tracker.debian.org/tracker/CVE-2021-28697  
                           xen | CVE-2021-28698   | https://security-tracker.debian.org/tracker/CVE-2021-28698  
                           xen | CVE-2021-28699   | https://security-tracker.debian.org/tracker/CVE-2021-28699  
                           xen | CVE-2021-28700   | https://security-tracker.debian.org/tracker/CVE-2021-28700  
                           xen | CVE-2021-28701   | https://security-tracker.debian.org/tracker/CVE-2021-28701  
                           xen | CVE-2021-28702   | https://security-tracker.debian.org/tracker/CVE-2021-28702  
                           xen | CVE-2021-28703   | https://security-tracker.debian.org/tracker/CVE-2021-28703  
                           xen | CVE-2021-28704   | https://security-tracker.debian.org/tracker/CVE-2021-28704  
                           xen | CVE-2021-28707   | https://security-tracker.debian.org/tracker/CVE-2021-28707  
                           xen | CVE-2021-28708   | https://security-tracker.debian.org/tracker/CVE-2021-28708  
                           xen | CVE-2021-28711   | https://security-tracker.debian.org/tracker/CVE-2021-28711  
                           xen | CVE-2021-28712   | https://security-tracker.debian.org/tracker/CVE-2021-28712  
                           xen | CVE-2021-28713   | https://security-tracker.debian.org/tracker/CVE-2021-28713  
                           xen | CVE-2022-23033   | https://security-tracker.debian.org/tracker/CVE-2022-23033  
                           xen | CVE-2022-23035   | https://security-tracker.debian.org/tracker/CVE-2022-23035  
                        xerces | CVE-2012-0880    | https://security-tracker.debian.org/tracker/CVE-2012-0880   
                  xscreensaver | CVE-2021-34557   | https://security-tracker.debian.org/tracker/CVE-2021-34557  
                         xterm | CVE-2022-24130   | https://security-tracker.debian.org/tracker/CVE-2022-24130  
                           zip | CVE-2018-13410   | https://security-tracker.debian.org/tracker/CVE-2018-13410  


-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
