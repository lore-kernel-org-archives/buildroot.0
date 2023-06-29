Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E3D6EB64D9
	for <buildroot@archiver.kernel.org>; Thu, 29 Jun 2023 04:40:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 88FC340982;
	Thu, 29 Jun 2023 04:40:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 88FC340982
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 952DRnNbzUq9; Thu, 29 Jun 2023 04:40:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6EFCA410D6;
	Thu, 29 Jun 2023 04:40:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6EFCA410D6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7E9E21BF33E
 for <buildroot@lists.busybox.net>; Thu, 29 Jun 2023 04:40:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 631FF410D6
 for <buildroot@lists.busybox.net>; Thu, 29 Jun 2023 04:40:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 631FF410D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PzFdmEZKJq-y for <buildroot@lists.busybox.net>;
 Thu, 29 Jun 2023 04:40:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 750B440982
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 750B440982
 for <buildroot@buildroot.org>; Thu, 29 Jun 2023 04:40:11 +0000 (UTC)
X-GND-Sasl: thomas.petazzoni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0F04BE0006
 for <buildroot@buildroot.org>; Thu, 29 Jun 2023 04:40:07 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Thu, 29 Jun 2023 04:40:07 -0000
Message-Id: <20230629044014.631FF410D6@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1688013608; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ncVHGa7uy9wH2C4Ky8jFJKNz87YDYyQy4puSCobWZiw=;
 b=a5OFMvlYs8RYYLfGrZ3h0KRoH6XO6RjuwX70wG/KGPruP6qzvXQ3O1LT8e/TqY2EUB5qNb
 HDkku9+4c+693hNelZDDdRzHvwWCPXsrUJdH3Bph7ZEUb1lj0XulOzGna2Rpz+IeKang2X
 u4sC+DqpV9EnJXlxKdnjTDDYv5wfSlzSVEmMi7Snpz8gnHB/c4KLDUQfpgbJUG3X/zej9W
 ATHLLJWqQe0f4wRrDT3OvFevSV7GeWIiQtjwduUNX93AVzE/Xo0XOzYaO28iaY1cs3L4iE
 g1LqDAqtW/x/7PvLmf026rVuPsSzZR7VbCtRbRdBXGzjch6cCH79c++scIxAog==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=a5OFMvlY
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-06-28
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

Autobuild statistics for 2023-06-28
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  3  |  5  |  0  |  8  |
    master   | 114 | 135 |  0  | 249 |

Classification of failures by reason for master
-----------------------------------------------

                alsa-lib-1.2.9 | 8 
                   gupnp-1.4.3 | 8 
             host-ccache-4.8.2 | 5 
                   linux-6.3.9 | 5 
                    strace-6.3 | 5 
                       unknown | 5 
            host-binutils-2.38 | 4 
              host-rust-1.70.0 | 4 
               libglib2-2.76.1 | 4 
                 agentpp-4.6.0 | 3 
                  check-0.15.2 | 3 
                elfutils-0.186 | 3 
                 mpg123-1.31.3 | 3 
      python-setuptools-68.0.0 | 3 
            quickjs-2021-03-27 | 3 
                    brltty-6.5 | 2 
                haveged-1.9.18 | 2 
               host-go-1.19.10 | 2 
igh-ethercat-2e2cef61318953... | 2 
          libedit-20221030-3.1 | 2 
        ltp-testsuite-20230127 | 2 
                  ntp-4.2.8p15 | 2 
                    olsr-0.9.8 | 2 
              open62541-v1.3.4 | 2 
                 opensc-0.23.0 | 2 
rtl8192eu-865656c3a1d1aee8c... | 2 
android-tools-4.2.2+git2013... | 1 
                 apache-2.4.57 | 1 
                    bat-0.23.0 | 1 
             batman-adv-2022.3 | 1 
             containerd-1.6.21 | 1 
                 coreutils-9.3 | 1 
             dahdi-linux-3.2.0 | 1 
        edk2-edk2-stable202208 | 1 
falcosecurity-libs-e5c53d64... | 1 
              fftw-quad-3.3.10 | 1 
             fontconfig-2.14.2 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
                 fwts-22.09.00 | 1 
                gkrellm-2.3.11 | 1 
glibc-2.37-2-g9f8513dc64119... | 1 
                     gmp-6.2.1 | 1 
  gobject-introspection-1.74.0 | 1 
            host-binutils-2.39 | 1 
              hyperfine-1.14.0 | 1 
                   i2pd-2.43.0 | 1 
kvmtool-f77d646ba01d04be5aa... | 1 
              libgcrypt-1.10.2 | 1 
                libmdbx-0.12.5 | 1 
             libopenh264-2.3.1 | 1 
               libsigsegv-2.14 | 1 
               lightning-2.2.1 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                     lxc-5.0.2 | 1 
                petitboot-1.13 | 1 
           python-pyicu-2.10.2 | 1 
                      rauc-1.9 | 1 
                  reaver-1.6.6 | 1 
                 samba4-4.18.2 | 1 
                   shadow-4.13 | 1 
             stress-ng-0.15.07 | 1 
               syslog-ng-4.1.1 | 1 
               tcf-agent-1.7.0 | 1 
              traceroute-2.1.0 | 1 
                  xvisor-0.3.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/f59c5e7a28d7d9aa20029f0a654fed90d9b498c7 |     
    arm      |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/3bbb8b859f9daa3f91c2bf3cfb4630f4e4f5fcd9 |     
 microblaze  |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/26f811282e819edc03036296e8c948bf05d22729 |     
 microblaze  |         alsa-lib-1.2.9         | NOK | http://autobuild.buildroot.net/results/f3cdda2731d166ac2da868761faf48fa3e3233c4 |     
 microblaze  |         alsa-lib-1.2.9         | NOK | http://autobuild.buildroot.net/results/b0c0de31fd6359e8fb6ea883218b8a2723069e2b |     
powerpc64le  |         alsa-lib-1.2.9         | NOK | http://autobuild.buildroot.net/results/c8bf118171df6195364dcca5ac99dc15eabd05fc |     
 microblaze  |         alsa-lib-1.2.9         | NOK | http://autobuild.buildroot.net/results/a48f411a5fb4b996c109e2178076defd631faec4 |     
microblazeel |         alsa-lib-1.2.9         | NOK | http://autobuild.buildroot.net/results/8c3e5a52adbb4d1932db9784f112a599eb0dde21 |     
 microblaze  |         alsa-lib-1.2.9         | NOK | http://autobuild.buildroot.net/results/7df7d515214a780635dbe84f305fdd9f11160754 |     
microblazeel |         alsa-lib-1.2.9         | NOK | http://autobuild.buildroot.net/results/e7cac0fc1d019d11fe6292e7b8e2af1c09c05e06 |     
microblazeel |         alsa-lib-1.2.9         | NOK | http://autobuild.buildroot.net/results/95c2759d5613efe13ecfa77ef0f1072947571e56 |     
   mips64    | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/a3f954a34d5abd5d736d41b34ae58f2cbf252043 |     
   armeb     |         apache-2.4.57          | NOK | http://autobuild.buildroot.net/results/f1bbcd0b4851cea4a35e3967b340d6cf1bad52e3 |     
   mipsel    |           bat-0.23.0           | NOK | http://autobuild.buildroot.net/results/29ae011886fc5349c02978482e1999de60cfccd8 |     
  sparc64    |       batman-adv-2022.3        | NOK | http://autobuild.buildroot.net/results/cd92a84e292b629f0d059727a0b6376c03bf00f2 |     
powerpc64le  |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/7e090f6efddf0552b6a6189f98274884dd641932 |     
 microblaze  |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/0b2205ab6f735ff97b763bd308a436181088cf2b |     
   x86_64    |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/59f07e5383b8bb72fab2da937fb689f4193fb95b | ORPH
powerpc64le  |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/ffc54ee2a411976c1db90799cd7273d5c11e0055 | ORPH
    arc      |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/23e3f07c46c36c40abd457b634aac978b21fc03d | ORPH
powerpc64le  |       containerd-1.6.21        | NOK | http://autobuild.buildroot.net/results/0ae83b123c70b0dd8be4d38ddacd1399e4cf0199 |     
   sparc     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/dcdd6154907acc488502993210fa8377dbdc5d24 | ORPH
powerpc64le  |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/39e0961a78fbf8ad8a7471bfe5821bd37e5f0afa |     
  aarch64    |     edk2-edk2-stable202208     | NOK | http://autobuild.buildroot.net/results/9373d7403d524b42e4408e35b4a750785d782f62 |     
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/66dce8ba63b2e553fecf4598b2d60e06f598c681 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/e0a3fcf0af7c32e0043ad9d15689a472010f1539 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/ad5518e93d5bd537088bdd2237f3f0f1e9799788 | ORPH
 aarch64_be  | falcosecurity-libs-e5c53d64... | NOK | http://autobuild.buildroot.net/results/848fb0cf05ecb8a05e14e88dad28847f67f7622d |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | http://autobuild.buildroot.net/results/3cca9e0e8196788d8464bfc3c52ac1edbd68685b | ORPH
  riscv64    |       fontconfig-2.14.2        | NOK | http://autobuild.buildroot.net/results/27e51b442cfabebb8487d30329f3663dbdccfa74 | ORPH
 microblaze  | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/5835d6b1f762874036fa2ead6f42e512f5753723 |     
    m68k     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/c76ab96d1f38f4bb8231d27e273b668a8448188c |     
    arm      | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/4045d121f9a47c184d63520ea259c8212acf7599 |     
powerpc64le  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/c60275a5d2a48f47720e6d9e5f3fc94ad0112ada |     
   x86_64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/69e47b4769834c2897a4cb887e29ed70067a34d0 |     
 powerpc64   | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/45ea726e39c41c9b35c19c2cf172dae75f0b5f28 |     
    arm      | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/a2acbb67e58d020d775b90482ef0b1dcbd1ae455 |     
   x86_64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/deb1623cb3eab6f4122d86dfbe10c82ceac7016a |     
    arm      | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/d1dacf373262275a4d7bb92e4e24074c0c5f9e57 |     
   x86_64    |         fwts-22.09.00          | NOK | http://autobuild.buildroot.net/results/ed4c028f21913d42c27d1b5d6942e7166e75de07 |     
   sparc     |         gkrellm-2.3.11         | NOK | http://autobuild.buildroot.net/results/457a857991dc6122e09cb447d40d25b24a27c77a |     
  powerpc    | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/c3fed73fcbdbeb51f0c18464db2deca2e371b7ee |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/3a35b3a7718697152075c3d42704f463ed2e5279 | ORPH
  sparc64    |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/902af68083d1fc9446221c3ddddbba9334b08461 | ORPH
   mips64    |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/12058d7a5d53b9f7c7949a3ad4de0eb40fefb288 |     
 powerpc64   |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/9caa3ecb2b5086b1cfdc68d37f3cb1ac1ad08102 |     
powerpc64le  |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/6c3d2cb507ea6e4f7c0bdcd08ac649df4bb094ba |     
    or1k     |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/634fbdf7540c17905e148f271cc24b10bb1cf71b |     
    i686     |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/cff5972a3e78a3866f278bf3ef45fd9bb9f8c286 |     
   mipsel    |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/3a036d9a5239d5e540b2e72ddf5044c11631dae0 |     
   nios2     |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/9301a697db6a6a0fc02d42e615a278899fc57630 |     
 powerpc64   |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/9ffd03a1ded76ba6bd99642426a2664c14051471 |     
   arceb     |         haveged-1.9.18         | NOK | http://autobuild.buildroot.net/results/3d0f9d10ac2f82614faa1bfdad0771f50867644a |     
    arc      |         haveged-1.9.18         | NOK | http://autobuild.buildroot.net/results/45659231c0ffc5e504a110f29b4a5c880925b7d4 |     
   x86_64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/4a5cf7d731e68c06fc151555d6bc0e51f05e68e7 |     
   s390x     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/02194debc5a24d8dfdbd70159eaac0303b12a8cf |     
    m68k     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/c8edb5185bb6b80d3d70e2ff44ada5f38a37f290 |     
   mips64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/a604fdbb216f6533ec815dcf5f1706d25b013533 |     
    arc      |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/4fea70c1fa89f0da1ac0f7560035ec41c5086f2f |     
 aarch64_be  |       host-ccache-4.8.2        | NOK | http://autobuild.buildroot.net/results/7afb581b44944174809aaab2c535931f781b587d | ORPH
  mips64el   |       host-ccache-4.8.2        | NOK | http://autobuild.buildroot.net/results/3197f8cb87899a0c056fd214540d95e61b1c746b | ORPH
  powerpc    |       host-ccache-4.8.2        | NOK | http://autobuild.buildroot.net/results/2f677876f568fcca644c96cc7a02ddf0c08f77b2 | ORPH
   nios2     |       host-ccache-4.8.2        | NOK | http://autobuild.buildroot.net/results/f5900148864b63c0f5f1df347e050251cfdb41f1 | ORPH
  aarch64    |       host-ccache-4.8.2        | NOK | http://autobuild.buildroot.net/results/ae6dcc99fad4c44791ca40036141d1e36919a7a3 | ORPH
   mips64    |        host-go-1.19.10         | NOK | http://autobuild.buildroot.net/results/b21c089d143575643d90322a610c210d13dcd864 |     
    i686     |        host-go-1.19.10         | NOK | http://autobuild.buildroot.net/results/0f91976ff2d3e04cd75e3ccefe76d4b1ef6ebb6d |     
 powerpc64   |        host-rust-1.70.0        | NOK | http://autobuild.buildroot.net/results/c74a581e3841a9afdb1ac5592c65f6526a86f5c3 |     
  aarch64    |        host-rust-1.70.0        | NOK | http://autobuild.buildroot.net/results/32a40d56717acf6ce13649d563d52521895cef9b |     
powerpc64le  |        host-rust-1.70.0        | NOK | http://autobuild.buildroot.net/results/75345c89933f18cdd325a7b8c0e89ce22342f83e |     
   mips64    |        host-rust-1.70.0        | NOK | http://autobuild.buildroot.net/results/0fe7f648d743331b4f99754d8402c598e2a7c38f |     
   armeb     |        hyperfine-1.14.0        | NOK | http://autobuild.buildroot.net/results/9739a9a12beb7b7ec6e3ae2c13b6b59c817771c1 | ORPH
   arceb     |          i2pd-2.43.0           | NOK | http://autobuild.buildroot.net/results/a00d1397a01199192786915087c6ad9183eb6c36 |     
   s390x     | igh-ethercat-2e2cef61318953... | NOK | http://autobuild.buildroot.net/results/b833a5795375c6e3897a9b20674e6d280a5aadca |     
   s390x     | igh-ethercat-2e2cef61318953... | NOK | http://autobuild.buildroot.net/results/ba505c2c8ed0b26333fe51f94b406c552445a67f |     
   x86_64    | kvmtool-f77d646ba01d04be5aa... | NOK | http://autobuild.buildroot.net/results/a7f1255b0102600630a2f63261b7cff34d11e835 | ORPH
    arc      |      libedit-20221030-3.1      | NOK | http://autobuild.buildroot.net/results/be63179da3a5bd6dadd5b3b8f3f4a807fe918099 |     
   sparc     |      libedit-20221030-3.1      | NOK | http://autobuild.buildroot.net/results/3a47e59882626fa34f60ea0a7b5eac98e40343e7 |     
    i686     |        libgcrypt-1.10.2        | NOK | http://autobuild.buildroot.net/results/56bde86a11ddbeb7dd2788be21ebfac2008fdfb5 | ORPH
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/b454621554b19060fe6dff71b2e66132a84e73c2 |     
   x86_64    |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/4eff9e18d9542e7f448a4fa26ce4c4ce80e5c231 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/8451834db0ac24624713dd127d34dd986784eea5 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/b7293ad252100b680283ce88be43222ebc29acf2 |     
    i586     |         libmdbx-0.12.5         | NOK | http://autobuild.buildroot.net/results/af6c7b8ae8555b3264c690b7d8fd914d2f817974 |     
  mips64el   |       libopenh264-2.3.1        | NOK | http://autobuild.buildroot.net/results/7c0a5fabf84ea439daadf9840448e0243a8c46c0 |     
  powerpc    |        libsigsegv-2.14         | NOK | http://autobuild.buildroot.net/results/55d0a824666d8125e26c013b45bbb66d1ed88a11 |     
   sparc     |        lightning-2.2.1         | NOK | http://autobuild.buildroot.net/results/a2133c341b62c5c938e7e6d0a4f7d34b570cacd6 |     
 aarch64_be  |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/0fa92721e0d8e536de6f44116f738dc267078079 | ORPH
   armeb     |          linux-6.3.9           | NOK | http://autobuild.buildroot.net/results/60534785ebdde66718b39df610bbf20dff57dfdc | ORPH
   nios2     |          linux-6.3.9           | NOK | http://autobuild.buildroot.net/results/eb5bb79b39719856e68d1414d7d0352556a0498b | ORPH
    i586     |          linux-6.3.9           | NOK | http://autobuild.buildroot.net/results/bee81adbfcbf4ff887d01ff783fcd978df6ae4d7 | ORPH
    arc      |          linux-6.3.9           | NOK | http://autobuild.buildroot.net/results/ef218b79c9bd1aeda25014fd7e7fafe06fa96c93 | ORPH
 aarch64_be  |          linux-6.3.9           | NOK | http://autobuild.buildroot.net/results/a9253393a1f0c00bea3139755cf24182ede6de48 | ORPH
  sparc64    |     ltp-testsuite-20230127     | NOK | http://autobuild.buildroot.net/results/1d8a236e98752d1da71b83478d30c8116b5d0ca8 |     
    i686     |     ltp-testsuite-20230127     | NOK | http://autobuild.buildroot.net/results/f0775def7b9565aa04c2ede90cfd8edeb164cdec |     
   nios2     |           lxc-5.0.2            | NOK | http://autobuild.buildroot.net/results/aa48485d1a03a2216c59b8acdb909e94b6041982 |     
   mipsel    |         mpg123-1.31.3          | NOK | http://autobuild.buildroot.net/results/ef5216de8619c8bd5cc14dbd9cffea47714458d9 | ORPH
    arc      |         mpg123-1.31.3          | NOK | http://autobuild.buildroot.net/results/c68909d30f1ca29a31a6ff9a1d3c36c1eca74b2b | ORPH
   armeb     |         mpg123-1.31.3          | NOK | http://autobuild.buildroot.net/results/ef72ba8298507a1841df3411bf467676fd1b30c0 | ORPH
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/c483bdb2bed3853bd4f1b8c47b07e6e2d8541b9d | ORPH
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/6f09f039d069239b768ff017ba6973d3a9f4f6c0 | ORPH
   nios2     |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/66437139a7a01450e1219840ae40ac37b8eaf35b | ORPH
 powerpc64   |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/fb0ad1d79451749264e9ee03090921fc56aa0a4d | ORPH
  powerpc    |        open62541-v1.3.4        | NOK | http://autobuild.buildroot.net/results/6ddb0bc047d6b79aa4aa2136d5028d353d35371e | ORPH
    arm      |        open62541-v1.3.4        | NOK | http://autobuild.buildroot.net/results/9ce121720bf23a899c00bd49a1759352a349e877 | ORPH
   armeb     |         opensc-0.23.0          | NOK | http://autobuild.buildroot.net/results/adb9b6d3518f1a699c09d242cebca8bc35dbdae3 | ORPH
    or1k     |         opensc-0.23.0          | NOK | http://autobuild.buildroot.net/results/2512f4d11310ef9f09880e04609ca5f2628b921e | ORPH
  aarch64    |         petitboot-1.13         | NOK | http://autobuild.buildroot.net/results/b0cd22e150a193c83d90ae8d4c7c8e09b9bc12ca |     
    arm      |      python-pyicu-2.10.2       | NOK | http://autobuild.buildroot.net/results/fef7fe660c98447672ab8493eef8e0db510d66b0 |     
   x86_64    |    python-setuptools-68.0.0    | NOK | http://autobuild.buildroot.net/results/236da013569055b5f84e5181721db73d309f3c92 |     
    or1k     |    python-setuptools-68.0.0    | NOK | http://autobuild.buildroot.net/results/37caac18b2607e450d689148d714de8e0d3f6e66 |     
 aarch64_be  |    python-setuptools-68.0.0    | NOK | http://autobuild.buildroot.net/results/e34840c993cd3d930da4513d0eb264c5b5e844ad |     
   s390x     |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/56ea43916f22980b1ddf54d0f9646902150366bd |     
  mips64el   |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/a2e9efae9a38f8cb30fa2862b406060359b05e24 |     
   mips64    |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/3cdffd2d60b3c6a57519ad567de750f3f0f8a33a |     
   mips64    |            rauc-1.9            | NOK | http://autobuild.buildroot.net/results/b53863612297e5b5e5e5cbc4e0cf78ceead2cdaa |     
   arceb     |          reaver-1.6.6          | NOK | http://autobuild.buildroot.net/results/8dbdee548ce024af792724eb4ea586ce679a5f22 |     
   arceb     | rtl8192eu-865656c3a1d1aee8c... | NOK | http://autobuild.buildroot.net/results/f03ce258c37f74e24105e9f444d39e611e8783a5 |     
powerpc64le  | rtl8192eu-865656c3a1d1aee8c... | NOK | http://autobuild.buildroot.net/results/425aeb0eea000857377721809bc757aa5203d49d |     
   mipsel    |         samba4-4.18.2          | NOK | http://autobuild.buildroot.net/results/63c469106e9daa198f77d8da7a5bb123edcce0f7 |     
   armeb     |          shadow-4.13           | NOK | http://autobuild.buildroot.net/results/b860cbf4989260e4fa09acb2562f8fe4a5614327 |     
    arc      |           strace-6.3           | NOK | http://autobuild.buildroot.net/results/a44a775b4758043f439dea03539eacca3a249185 |     
   s390x     |           strace-6.3           | NOK | http://autobuild.buildroot.net/results/95fe28363f4bd5e780f91d8e5eb8b491d9c669bc |     
    arm      |           strace-6.3           | NOK | http://autobuild.buildroot.net/results/23a9065bf8d8f850d52c1848d6c8d1b96dfc7a2d |     
   nios2     |           strace-6.3           | NOK | http://autobuild.buildroot.net/results/deddcf2d843770d48df68767bd016f2e99816492 |     
    or1k     |           strace-6.3           | NOK | http://autobuild.buildroot.net/results/d1167fbf25951d73d87d9c23ecf9a368e8bc9347 |     
 microblaze  |       stress-ng-0.15.07        | NOK | http://autobuild.buildroot.net/results/41e34310f13e5a6944a511adad27319ed686a198 |     
 aarch64_be  |        syslog-ng-4.1.1         | NOK | http://autobuild.buildroot.net/results/b342c3180622069e193951cd1e77d3df2697c4c5 |     
microblazeel |        tcf-agent-1.7.0         | NOK | http://autobuild.buildroot.net/results/c06c1883da4bab4e0883c270cec137dc07ba6b9a |     
microblazeel |        traceroute-2.1.0        | NOK | http://autobuild.buildroot.net/results/ae58af9a0d90529b09e29eb117318dd6767c130e |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/6b90993508d0736d066578353226f44269c09e75 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/94f1d94c03ca0cc38310162debec02d24637d31c |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.net/results/c38f9e5af373f1c887d50a1fb173066297add549 |     
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.net/results/edac32d5af18cca9a16bc804c5dd32078162865e |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/c4348ab04e5fde599d3a22c4f94924ac39533048 |     
   x86_64    |          xvisor-0.3.1          | NOK | http://autobuild.buildroot.net/results/236e79892faf6938dd51edebe1d9ae234bd69893 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

host-gdb-arc-2020.09-releas... | 1 
              host-rust-1.67.1 | 1 
               libglib2-2.72.3 | 1 
                 libnss-3.88.1 | 1 
                  linux-6.1.32 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   arceb     | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/29ff12cbedb07ee94244878c390401169c3cf35b | ORPH
   x86_64    |        host-rust-1.67.1        | NOK | http://autobuild.buildroot.net/results/f146ea2f1d7c22c456cfbb3ceed709d37fd96680 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/26ac21189802bc42b62d050ef16084d9c63c048d |     
   armeb     |         libnss-3.88.1          | NOK | http://autobuild.buildroot.net/results/263c39c9bc5911292368a7bef7068c5ce990ae9f |     
    m68k     |          linux-6.1.32          | NOK | http://autobuild.buildroot.net/results/43b6df053537fb13665485c41c00e9e9558f48a8 | ORPH



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
