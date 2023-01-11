Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4061C46467
	for <buildroot@archiver.kernel.org>; Wed, 11 Jan 2023 06:45:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24A7641879;
	Wed, 11 Jan 2023 06:45:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 24A7641879
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fXTQ58g_pt6k; Wed, 11 Jan 2023 06:45:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B649418F4;
	Wed, 11 Jan 2023 06:45:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B649418F4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 84E8B1BF339
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 06:45:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 48817403C6
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 06:45:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 48817403C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DxpWTuQYR15Y for <buildroot@lists.busybox.net>;
 Wed, 11 Jan 2023 06:45:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C1A45401A2
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C1A45401A2
 for <buildroot@buildroot.org>; Wed, 11 Jan 2023 06:45:10 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 11A01E0004
 for <buildroot@buildroot.org>; Wed, 11 Jan 2023 06:45:07 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Wed, 11 Jan 2023 06:45:07 -0000
Message-Id: <20230111064514.48817403C6@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1673419508; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=6rLBsikLiMSKKELNGurB3AG+Nr5mCVI0LikPyT1ieK4=;
 b=RaIHcofo8k3MtyRP+SL1MfQ8b+OEp7f1Us/S/++ZmB1o7ceqL0Lb7a2eFaf8Vah7PrZubD
 SdxFNDeNtZcLgt/LSGmf0FKx5Z6ADJQij2uMbY4wMjA8/cXGSUztN2nR0GZB6tTmNLIQZ8
 MHrPxl13kB/uk9lbZbexQbV2C62ecNP7LQIVSHMnyBt6fHUhX2zq2DbEHoeu+Qgdpjx7rj
 Rz6rYRCDwxIhDHpjISnkP4WU7O/QMlm1MY/J0eqeqXWKqtHoNplr3SHHHL2m/W5vwtPztj
 BErglH3yDpwtq9gUexWHDYcsd8gLX5iac3SnV95lo7Hd2MZmHB8fOIA7YeYjhg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RaIHcofo
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-01-10
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

Autobuild statistics for 2023-01-10
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  2  |  0  |  0  |  2  |
  2022.11.x  | 20  | 17  |  0  | 37  |
    master   | 159 | 309 |  5  | 473 |

Classification of failures by reason for master
-----------------------------------------------

               host-fwup-1.9.1 | 29
                   bash-5.2.15 | 27
                    fwup-1.9.1 | 16
                    opkg-0.4.5 | 12
                     xz-5.2.10 | 11
                   gvfs-1.48.1 | 10
                    pixz-1.0.7 | 7 
                    bat-0.19.0 | 6 
                    dust-0.8.1 | 6 
glibc-2.36-81-g4f4d7a13edfd... | 6 
                host-go-1.19.4 | 6 
         host-sentry-cli-2.8.0 | 6 
           janus-gateway-1.1.1 | 6 
               libglib2-2.72.3 | 6 
                       unknown | 6 
         gobject-introspection | 5 
  gobject-introspection-1.72.0 | 5 
                   linux-6.1.2 | 5 
                    norm-1.5.8 | 5 
             dahdi-linux-3.2.0 | 4 
            host-binutils-2.38 | 4 
              host-rust-1.66.0 | 4 
              hyperfine-1.14.0 | 4 
             libgpg-error-1.46 | 4 
           python-bcrypt-4.0.1 | 4 
    python-cryptography-38.0.4 | 4 
                gerbera-1.10.0 | 3 
                  jack2-1.9.21 | 3 
             lirc-tools-0.10.2 | 3 
            python-bunch-1.0.1 | 3 
              asterisk-16.29.1 | 2 
                    brltty-6.5 | 2 
                 dmalloc-5.6.5 | 2 
                elfutils-0.186 | 2 
         host-gcc-final-11.3.0 | 2 
    host-python-greenlet-2.0.1 | 2 
              libgcrypt-1.10.1 | 2 
                   libnss-3.87 | 2 
          lttng-modules-2.13.7 | 2 
                 nerdctl-1.0.0 | 2 
                   perl-5.34.1 | 2 
         python-greenlet-2.0.1 | 2 
ripgrep-af6b6c543b224d348a8... | 2 
toolchain-external-codescap... | 2 
                 wolfssl-5.5.3 | 2 
/home/buildroot/autobuild/i... | 1 
/home/buildroot/autobuild/i... | 1 
                  acpid-2.0.34 | 1 
             berkeleydb-5.3.28 | 1 
             bluez5_utils-5.65 | 1 
                  boost-1.80.0 | 1 
                  cairo-1.16.0 | 1 
             containerd-1.6.12 | 1 
                    crun-1.7.2 | 1 
              dropbear-2022.83 | 1 
                     efivar-38 | 1 
                   ethtool-6.1 | 1 
                     exim-4.96 | 1 
             f2fs-tools-1.15.0 | 1 
                 fdk-aac-2.0.2 | 1 
               fftw-quad-3.3.8 | 1 
                     file-5.43 | 1 
             fontconfig-2.13.1 | 1 
                     frr-8.3.1 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
                    gdal-3.5.1 | 1 
                gnu-efi-3.0.15 | 1 
gummiboot-2bcd919c681c952eb... | 1 
            host-binutils-2.39 | 1 
             host-delve-1.20.0 | 1 
              host-pahole-1.24 | 1 
    host-python-maturin-0.14.5 | 1 
                  kexec-2.0.25 | 1 
               libcap-ng-0.8.3 | 1 
         libcpprestsdk-2.10.18 | 1 
                libselinux-3.3 | 1 
               libvorbis-1.3.7 | 1 
                libxml2-2.10.3 | 1 
      linux-5.10.145-cip17-rt7 | 1 
                   luvi-2.13.0 | 1 
                     lxc-5.0.1 | 1 
make: *** wait: No child pr... | 1 
              memcached-1.6.17 | 1 
                    mpv-0.33.1 | 1 
                    musl-1.2.3 | 1 
                  ntp-4.2.8p15 | 1 
            ocf-linux-20171122 | 1 
                   opensbi-0.9 | 1 
                   pcre2-10.42 | 1 
                 proftpd-1.3.8 | 1 
           python-numpy-1.23.5 | 1 
                    qemu-7.2.0 | 1 
            quickjs-2021-03-27 | 1 
rtl8821cu-86cc5ceb7c28b9b99... | 1 
                       sed-4.9 | 1 
              sigrok-cli-0.7.2 | 1 
                  sscep-0.10.0 | 1 
           uboot-tools-2021.07 | 1 
                 uclibc-1.0.42 | 1 
               valgrind-3.19.0 | 1 
                   vnstat-2.10 | 1 
          wireshark-legal-info | 1 
               xfsprogs-5.14.2 | 1 
             xlib_libX11-1.8.3 | 1 
                 zlib-ng-2.0.6 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/6e7a1c5e982be97c2cfe4929fea278fb9fc0ddfc |     
   sh4eb     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/ada82c96da3871a780f4732f177f2e91ec1a015e |     
  mips64el   |          acpid-2.0.34          | NOK | http://autobuild.buildroot.net/results/76e27a93d9fc23b1e6dbb8dde759130a82606f4b | ORPH
    arc      |        asterisk-16.29.1        | NOK | http://autobuild.buildroot.net/results/0db892d79cb557d3e05214bc0e8402ab6295a414 |     
microblazeel |        asterisk-16.29.1        | NOK | http://autobuild.buildroot.net/results/098b29eb447d5c14e2d4e5b63f8088f00061df9d |     
   arceb     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/cb85177aaa9066e1b8880ab9adb4450dad29885e | ORPH
   sparc     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/69d6fa416f8c8548a8283ded0ce5fdc1410a6f77 | ORPH
   armeb     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/080eef2b5f92fb5a0a9ad6bcc8a17c31e48b910d | ORPH
    m68k     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/d31ee9a77a9bb4d93fb477b8de58e0a09f711e71 | ORPH
    m68k     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/d88ea684cb14c492549c87deb6e3dad214765ce2 | ORPH
  aarch64    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/82027a7c4227691e98c27a2c57d65a254a6d65a6 | ORPH
 microblaze  |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/4556c2e8f3147bea086ec0db9f4ac563deb56d0f | ORPH
microblazeel |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/952bf983cf91e85ce3fa1486a05ee3e4298e8375 | ORPH
   x86_64    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/193e4c7d0dc9f9a4943f5e6386d77642742108f2 | ORPH
microblazeel |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/53499a0797b837c141a3b0e2afa200ecdea5712e | ORPH
   mipsel    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/ed84c746ba4cd86a03d1c176c58606c360558860 | ORPH
   xtensa    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/6f417df4f0108f912e488f6499c0f88188b32cd0 | ORPH
   mipsel    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/f1decce5ab48242fef2198bf73b869db29df0dbd | ORPH
   x86_64    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/0b2f3b29f0ae1fccdd60b777cbc0383f45d5505c | ORPH
   arceb     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/d799597fa8c61e4c25d0d7c90f280470f125592a | ORPH
    arc      |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/6bdb643500f4a811eae78ca02005ff6ca0132295 | ORPH
    arm      |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/791a07a9b4e6688952fa5ee6922184dd163255d9 | ORPH
    arm      |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/dc00a5322aaa4e22e1376f7e64367b885126e7cf | ORPH
    m68k     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/3fe005829f8c3c89524da6eb1199f0c8216a0bdb | ORPH
   xtensa    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/fd0b2fc68392ac0c1b4d9d703d8ac8d9f535fd9d | ORPH
  powerpc    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/5b0ee8ef19820aaef194903f6484967dbd3be3ad | ORPH
    arc      |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/7c3dbdd7e6c2ca9583d723a95bc468d22501bc12 | ORPH
 microblaze  |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/d344a355873eb2f29d44f9f8ee7c6e46c4fe953f | ORPH
 aarch64_be  |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/e76ac4b43a88f3b474b14fd5c89c2d41f08e34f5 | ORPH
    m68k     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/80abd61b8550541229a45d4f3e799b8d783c20d8 | ORPH
    arc      |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/f97ee15abfef3b226a139e5efc2994657881070b | ORPH
   arceb     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/bb482c882d7de638c3d5d85f96ca5dcb1c317fa5 | ORPH
   s390x     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/c926df4f2b883e668fda22f0682323f5a432948f |     
  aarch64    |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/8527fe5671de39442d44d9409da64b4e470bffd7 |     
    i686     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/4852dfd54f1aa630a4ed67ecf20e386e2728fdc8 |     
  powerpc    |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/ead3a089b41d2dbfdda488d775d3861253e5f9e7 |     
powerpc64le  |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/8e494adf1395d88085c30285363bd07fdf0d851b |     
powerpc64le  |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/a1f3a0da4ae8b71d5f222a6a787ce31c085f1b17 |     
   sh4aeb    |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/7940666979977bb2ecb7c55b3fabac0bb492213e | ORPH
    sh4      |       bluez5_utils-5.65        | NOK | http://autobuild.buildroot.net/results/8e045585714043153aff3bb4e8113f8472771a5e |     
    arc      |          boost-1.80.0          | NOK | http://autobuild.buildroot.net/results/6ef95de3e8b0d5129c842d7e9e6e3c9d5fc4fb73 |     
    mips     |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/d4a47496af464287865df4f710943fb4571e356a |     
 microblaze  |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/c2a82e3812a60d5008bde02c2ed6b0ee6852399c |     
  aarch64    |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/5440d2ad9cfbe9e2eefe2866aa2ca8b0c64965b0 |     
    arm      |       containerd-1.6.12        | NOK | http://autobuild.buildroot.net/results/0f822fc6b0fa3047ffa9fe32ef1b4539949777fc |     
 microblaze  |           crun-1.7.2           | NOK | http://autobuild.buildroot.net/results/0e56ad3f5d3d5383e5c8552642b30a1bfce80a69 |     
  aarch64    |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/224529a244699963fd7aac7b1964d91a0df899cd |     
   armeb     |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/9ceedb2d261cae11652827d1507e2dd1931f8a7c |     
   sparc     |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/c44d7c5a0153556676023e4904905b1a8d750a38 |     
  sparc64    |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/f05a9dc80b71616669a86b3e1a7dcc04b4b61785 |     
  powerpc    |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/f9fb254a6f22e257dd4ed1154c0e6e11178c457b | ORPH
  powerpc    |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/6bb3f2be52cda2a59a554b51ec9fbb192b232864 | ORPH
    or1k     |        dropbear-2022.83        | NOK | http://autobuild.buildroot.net/results/ac2b1f80bcb62eb770a1c7f74da42e26f106f309 |     
   s390x     |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/e53874eca23beff0633057a66666014932f9fa12 | ORPH
   mipsel    |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/f69ee0ea97b9d06f6d9faa39f3fe7bc63429e4cc | ORPH
 powerpc64   |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/be7fdc4544d2de61986aef16881cfe3f229bffa4 | ORPH
powerpc64le  |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/2a48809f195af1dbed97c02484a4c499a551a84e | ORPH
 powerpc64   |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/c26e0a736a93bab249df5a68b370dfe5b38d8209 | ORPH
  mips64el   |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/f9e7fce6a4bae9bbaaf0302830bf652fa33ccc98 | ORPH
    arm      |           efivar-38            | NOK | http://autobuild.buildroot.net/results/ca604db4fe92dec463e7293cb8cc79d639c2aed5 |     
   arceb     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/be22f1bce9971e3e47855437f22b931ffd04d1d3 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/dc26a755fbf5297c6f2534a0d6853fb1e1004541 | ORPH
  aarch64    |          ethtool-6.1           | NOK | http://autobuild.buildroot.net/results/4b5e876c630e1556cb334c104b3367d5978fb329 |     
   armeb     |           exim-4.96            | NOK | http://autobuild.buildroot.net/results/47a659fa0e2046bb9582bcc676b90d1feb64dd3d |     
    or1k     |       f2fs-tools-1.15.0        | NOK | http://autobuild.buildroot.net/results/e04cb189bb12d0f39d785425214b24003dfe77f9 |     
   sh4aeb    |         fdk-aac-2.0.2          | NOK | http://autobuild.buildroot.net/results/3c3b6e689ad51243ce59db7d93198bc1e95eed72 |     
powerpc64le  |        fftw-quad-3.3.8         | NOK | http://autobuild.buildroot.net/results/518cb5c0ffb41d60312e94c9a17057d1990d5179 | ORPH
   armeb     |           file-5.43            | NOK | http://autobuild.buildroot.net/results/58bae1eb0f715fd06b0cd9cb64d1311e7dcdce0b | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/403a0135373aab6398e4d4bd069899d1110493f0 | ORPH
   arceb     |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/b88230ebdf9d3aca29ee5410478fc71b9596845b |     
    sh4      | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/74967c49e5b78f8ae73e287f7f5eb48518b83f9e |     
   armeb     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/050079cb0a88cd3b22363abe038b5ec027142ae8 |     
powerpc64le  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/6989681e6d178bde01d36abbd84808adf5468f65 |     
    m68k     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/bca205d702afc1f7d74d27df416241daa4d4c7e5 |     
   mips64    | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/6fef958e0bd9f2ca7642fe2a9c8ac0653ed491b6 |     
   s390x     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/672c2d592b9fe1b8de05b8160d90167a23c0de83 |     
 powerpc64   |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/7f3e9a870f1b68b27a07b132beb7ecb8d66631ab |     
  riscv64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/3557fcd30d14188655c8c1d5ad41a5cb9550dc8a |     
    i586     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/175143c0d5f9e57cc6e0ca5ac056a3c778dc2179 |     
   x86_64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/20b4f38dabc22024f751c1b15bc080edb5b41e50 |     
   x86_64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/403137250bbd00fb71f2df37dc64f6d1b36729b7 |     
   armeb     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/be6f8dd828c65595c2005a57de94d97c31e38981 |     
  powerpc    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/97b8d5c7e944029ebbb893ea5e1a40cf4fde5885 |     
   nios2     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/80661a017cbe374533a96967e5877305ee1da9fe |     
    i686     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/04ab4052437b3bb6dabb6c2595db22c12b9efb5f |     
    sh4a     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/4d06c32ec438cf9830547c1e70569d2ea9616caa |     
   sparc     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/7f29effd18fb2759a12c6c76582182c03a8ba4c1 |     
 aarch64_be  |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/09f65293cd345b3d6b88245a24e4d6b20d770205 |     
    i686     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/5efb54389a2f1d02ed23df617e3c0fcdc169369c |     
  sparc64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/b596ab7eb4629e8380cb3d5d692678a6b3fe6fa9 |     
    i686     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/4b2dccffce9fe72e64d44ad85fc6d9b53d02ec47 |     
   sh4eb     |           gdal-3.5.1           | NOK | http://autobuild.buildroot.net/results/09e2e51f74560b0397bc397043ab3832ab1c26f0 |     
  aarch64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/9937f2ce7482c08a127ac017f31e89a3fb3867c9 |     
powerpc64le  |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/87245ce6a145cb906c1ef56bf385c6c6cbde3ebf |     
   arceb     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/93ad61aff7bee16653680e76814744e062b02ced |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/c5af971b23530bff8bd737cd6e52eb819ac0cf16 |     
    arc      | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/e0e7f4b361ded5f79792b80ef0ae0ffe0723385c |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/97d27fa08759710442ebeb4ca7beb9ff4c351265 |     
  riscv64    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/4a6853a4c2daadc562a8aed63c67fcfa4ad3a943 |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/b0f5a1aee4ec889c86cf50b4bb68e2586b263244 |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/7e1cbb3c3dbb4a79c557686ff54b1c2e326f8760 |     
  mips64el   |         gnu-efi-3.0.15         | NOK | http://autobuild.buildroot.net/results/631d498747703c8f05b6ee304d696c16e1951150 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/77c33714ad7df0f1a25a9c5fa368ef10e9720dd5 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/e4009fc76c4e27ac9b163d59ea6925c1dfc1a658 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/5c56a5aef49a4ddcb4c97e23b19ebc531364ed8d |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/aaeb10e27f6dd300bbd73d46487063bec85fa59e |     
   armeb     |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/617dd0798b1541ca99f9a1032bc1da59f445fcfd |     
powerpc64le  |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/1d69c53493d595a0da4ecc146da738e5902b096a | ORPH
    or1k     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/29d9672ff5fb66430be231dcde1bb48692ad6da0 | ORPH
powerpc64le  |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/783661a0eade81777891bb6dbee550e8bf5bd940 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/bdde6109463ed766decafeb1813f60467ca46ec5 | ORPH
powerpc64le  |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/e6a02f5eb7ec0a3c0ac309db587243333b81de77 | ORPH
   x86_64    | gummiboot-2bcd919c681c952eb... | NOK | http://autobuild.buildroot.net/results/d973769e6fae532aaf9c1fe2e56db6192bf90e4e |     
    mips     |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/3b14b0dd569fb63bb88e54437cf5ae2aaa1cabf6 | ORPH
  aarch64    |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/512ea0fc29c008e6121e6324d2a4e38adfe19ad6 | ORPH
microblazeel |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/4eb84501cf43fbfe389ce9f76cf26e3574a083ef | ORPH
   x86_64    |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/2efdfab88106083149b9b63af59dc98a30577b8d | ORPH
    sh4      |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/b531bcaf886f62b04dbd365f9337d238739fd691 | ORPH
   mips64    |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/25c682431570c0a81867234554a96b9ecaf8eebf | ORPH
 aarch64_be  |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/81a7acb8411749381e803f195f75f99ed40b859c | ORPH
   x86_64    |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/55993cbb722ebac91927a0f6626655fd73ebe6cc | ORPH
   armeb     |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/2739ecbf2091a2de27cd0611456c70573790882d | ORPH
  aarch64    |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/92a76f87590e5357c10d0e31d9f1b04af25171a1 | ORPH
    i686     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/ab33ceb282ef0ac4af50a966656cdd86656b7f16 |     
    m68k     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/89fa99708e04067be3d1571444098426847b8022 |     
microblazeel |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/355fa1186f8fc1b33bdcf53f53d5e7508e13e325 |     
 powerpc64   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/40e40e759659b07a4f66e1d800ba89cbde566d2e |     
   x86_64    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/cd37fc5f99c939bbd5234dc794c89d27abd5f43d |     
  riscv64    |       host-delve-1.20.0        | NOK | http://autobuild.buildroot.net/results/843cb70bc66fb81b89a431f0973a3709f3e461f1 |     
  powerpc    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/4144a3a1af08e41849f585f77b6bc3ac81cee5c8 |     
    m68k     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/a5d531c1a61bca2a518c96ae960ff837bd6dbd6e |     
   sh4eb     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/df3ba6d62d0363978509a99c53f77ba0fe93fdc5 |     
   mipsel    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/8c49998244c834363997a925071b2ac7ba08b2a2 |     
    arm      |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/f1b6d190287b390327f3a7e3e4b867d19fb1f46f |     
    arm      |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/f328f01db0d7ca0deead2599931e001d426aa765 |     
    arm      |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/1695ee14c76dee6c9d0d64538416ffc917f565d3 |     
   arceb     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/e41f769d080a0d504100b0278a6f6176085a2ab1 |     
   mips64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/9fc0a14f8ae5f67f408c8bc22cb8e4610c70e152 |     
    or1k     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/48da5cf3e7f1e42f47d578fbdc5e65423c07744d |     
    or1k     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/9ec20f2e6a923127c1ab9e9bcbe94c896c8b4198 |     
    mips     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/e68fa67b40ac493afb9786db21e8fd58355d2361 |     
   armeb     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/23af4b0792e2274c1bf300377d8ca58ed453781c |     
 aarch64_be  |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/38051196e992da9696985e243c93d0d2e8225250 |     
   mips64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/df3d9ccfa0573c6a179246d7c81d312f91fc06a3 |     
 aarch64_be  |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/b5c88a4a810388eb1270395183170ca6043b72d7 |     
    i586     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/704e5a1985f608e52dac27788866d342a9562abb |     
   armeb     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/4816c33adc0b75ee889eb103a78a382207ba4d14 |     
  riscv32    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/629977bf3d54c89ae18ac64ecf34ae7701437233 |     
  aarch64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/5a35650f76dc84cfa086de1645ab0ba9219271f7 |     
    i586     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/2f0fc49b81375da2f32c81a77ff15829fa10426f |     
microblazeel |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/620564cc17f670b5bb1e84bfbcbd293375d8bd87 |     
 aarch64_be  |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/0e4ae8254854dcc8e6ca7c35796437871b74d1c3 |     
   arceb     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/26af9cfb405bf1226ddb265a363fee9065178491 |     
   x86_64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/43518f2753d20fd0ecc0b6e857c91716672fa07d |     
   xtensa    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/7422dd412c7f0f8c914084c0d569bc4d67900482 |     
    i686     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/e23eac5f24b4f8d2ab5993bf068c3dc15a1e93fd |     
  aarch64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/5c28f8590f7c2f75e73dacd6fc6b1155d5ae1a21 |     
   s390x     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/994f32bfc755a5c31e04470506616d8468ca1652 |     
microblazeel |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/72df3c7f7779d591c7a29f40381adf3ee95d022e |     
 microblaze  |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/a6d6d358e1d193164ee3e464e18438a36c4b498f |     
  aarch64    |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/0437833bbea69cc0c10cca859f433337ea1e1876 |     
  mips64el   |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/369665a0aa72caf64f30500b4a9830922e21a5fd |     
    i686     |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/2c3b90c1e806cbc5837f6eccae4698bf5c6edf8a |     
  mips64el   |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/cfd04e6f18ef1daa9a617ab3a141846fe97d3531 |     
    i686     |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/58a847c143004c7510814d6d698f3296d77e1eff |     
  mips64el   |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/2656cd5c04689069fdedc8ce410f53cb64ab72f2 |     
   x86_64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/1fe68593479b5b032c113c05a52aad924de15917 |     
    or1k     |   host-python-greenlet-2.0.1   | NOK | http://autobuild.buildroot.net/results/05394c067faff53f2b842a9fbbe8571ac46a7b42 |     
    sh4a     |   host-python-greenlet-2.0.1   | NOK | http://autobuild.buildroot.net/results/0ed47a11af82392f5d698d0e640c05ca677a6e79 |     
   mipsel    |   host-python-maturin-0.14.5   | NOK | http://autobuild.buildroot.net/results/10130440980295afaa79c3423832fbbbb1566525 |     
    i686     |        host-rust-1.66.0        | NOK | http://autobuild.buildroot.net/results/ed83313c2278851e94cd5ca07830c0b28bc08a12 |     
   mipsel    |        host-rust-1.66.0        | NOK | http://autobuild.buildroot.net/results/272ef4ff24367ac8e273ada157930a00c03220c1 |     
powerpc64le  |        host-rust-1.66.0        | NOK | http://autobuild.buildroot.net/results/47dd53e34e674510ca976df7f585dde90821c1ba |     
   x86_64    |        host-rust-1.66.0        | NOK | http://autobuild.buildroot.net/results/40f704a85e1c01d3f094a92621fa7b80c91fc087 |     
   armeb     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/626b9b59df6261cb7785a24314e9e958ff6557cc |     
   arceb     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/37959d2feb34bb600ba48ec4581c186dbbd6446b |     
powerpc64le  |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/82d2de7254713bbdc148a83e10ee0bdce85ee9ab |     
  mips64el   |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/ae72028fd183a2994ab73d5408d27f89a02cca93 |     
   sparc     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/c8c35e2a8b6bf41132c2d9ed0ba8f22aee736fe1 |     
  sparc64    |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/cae27fa6117f4eabbfb5a0b095a4ca18cfa13b9b |     
    i686     |        hyperfine-1.14.0        | NOK | http://autobuild.buildroot.net/results/e62890f0c4b022fb4a42736f47c8848c54b352eb | ORPH
    mips     |        hyperfine-1.14.0        | NOK | http://autobuild.buildroot.net/results/178bd550162cb07ff83b47e39a8b5b5fbe3bcecb | ORPH
  sparc64    |        hyperfine-1.14.0        | NOK | http://autobuild.buildroot.net/results/292bcf7c10515df739046e5b10145b0be24d437c | ORPH
  sparc64    |        hyperfine-1.14.0        | NOK | http://autobuild.buildroot.net/results/db7c60d3889ce91dc732b75447b734f0f054cd47 | ORPH
microblazeel |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/b5409e83666163774adce16129e3f6d1a86a86df |     
 aarch64_be  |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/fd44785d2b21a170a64bd5c3d0ada83ea108af2a |     
  mips64el   |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/178f159d21b51ab545d15f5086b6130b8ddc86d9 |     
  sparc64    |      janus-gateway-1.1.1       | NOK | http://autobuild.buildroot.net/results/6380295caad95873b95ee835dd3701f734a12be8 |     
   mipsel    |      janus-gateway-1.1.1       | NOK | http://autobuild.buildroot.net/results/cc0fff1e1274b2b99a7f0aed619d6fc0df67683c |     
    i686     |      janus-gateway-1.1.1       | NOK | http://autobuild.buildroot.net/results/e04665ecd871b245667b0c454b32772e06409bed |     
   x86_64    |      janus-gateway-1.1.1       | NOK | http://autobuild.buildroot.net/results/934310ed15e288affbbbe15c71a2598a8ba41167 |     
  sparc64    |      janus-gateway-1.1.1       | NOK | http://autobuild.buildroot.net/results/6897a609ddb42fb51b81007a7035c94695b61ebc |     
   sh4eb     |      janus-gateway-1.1.1       | NOK | http://autobuild.buildroot.net/results/681ce6a5132c9a7c94f9baf2daa08ac385079407 |     
   armeb     |          kexec-2.0.25          | NOK | http://autobuild.buildroot.net/results/60474357bf63240df0cfe94a8adf0f8765e3d72a | ORPH
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/2b0acbbdbc41476d2dbcacdaf8d1087ccabf9fb0 |     
   arceb     |     libcpprestsdk-2.10.18      | NOK | http://autobuild.buildroot.net/results/164b5c9e97babc0b5a72344a996f7a5f6e039f31 | ORPH
    arm      |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/4e5a0e8bab18744f0920d1b22385c7540fca4deb | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/2a893284754c5e2ce298ddae9547e5a92c424964 | ORPH
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/41fa31a566e96bd09415de668cd82ddc755631c8 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/bb0fbea33f937a279ccbe6202cab984a54f0038f |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/c9059d36581cda6c8b1d5d83d913301f335590ce |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/30123fdd59fea54c8c4cbe2c28caa464ac120aa7 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/30df7ffb3d10042485dd6f59f63961fb834ad1f5 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/fcb2dc0533a3f1b52a5aa94209980f86f4d863c8 |     
 aarch64_be  |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/87c23f335ece1996aaffd2144dc866e177eec5b5 | ORPH
 aarch64_be  |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/5659cc32e7ddb9274adc79762e1f7626984a9bdd | ORPH
 aarch64_be  |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/eb33246567dfc5e41a68ac68217e63de45a9feee | ORPH
  aarch64    |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/4d4db9f8ce4d0b8f79e41c2cae93d380049ae65a | ORPH
powerpc64le  |          libnss-3.87           | NOK | http://autobuild.buildroot.net/results/b7e03c838ddf012885ad3b3c967a7281d5028b2f |     
microblazeel |          libnss-3.87           | NOK | http://autobuild.buildroot.net/results/090d4d6b513161b53d4f890f5fe17c7a9af652ea |     
    or1k     |         libselinux-3.3         | NOK | http://autobuild.buildroot.net/results/fb433e7be631e03f5345c0c9a53fcd5efd3145e6 |     
  powerpc    |        libvorbis-1.3.7         | NOK | http://autobuild.buildroot.net/results/cec4befe07c99cda54f05680c6db749d7eed4d80 |     
   x86_64    |         libxml2-2.10.3         | NOK | http://autobuild.buildroot.net/results/95c65b8e3138bfe3711be289c71e9e09123badb6 |     
    arc      |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/9b5300556c4b314ad5fdecffa083bd7425aac7f6 | ORPH
    mips     |          linux-6.1.2           | NOK | http://autobuild.buildroot.net/results/32b077a08bfcfb5030e7fe8875ad49e871aeed6f | ORPH
   nios2     |          linux-6.1.2           | NOK | http://autobuild.buildroot.net/results/cbf532306d7bc36bef8c3ae90b0fd16ba8c6be5a | ORPH
    mips     |          linux-6.1.2           | NOK | http://autobuild.buildroot.net/results/e96f7011fa97e596e2d0e50e4e4fe37aee12b58b | ORPH
  powerpc    |          linux-6.1.2           | NOK | http://autobuild.buildroot.net/results/0b24c152b384ad5bad3c4babd6beeb0c8837acc7 | ORPH
    i686     |          linux-6.1.2           | NOK | http://autobuild.buildroot.net/results/24194e61f77997da15be1ecb799c4b9865af0e85 | ORPH
  mips64el   |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/1145a5841329fb9a621dec31a1ea17b7bbfbee5f | ORPH
   sparc     |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/881523139b2f960b26d51f4787cdcc4e33af0e37 | ORPH
 aarch64_be  |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/a87829c9855c2b399f4eb30367d0c42684873c9c | ORPH
   arceb     |      lttng-modules-2.13.7      | NOK | http://autobuild.buildroot.net/results/7053d4a35696a1833f6bed7e41aa6710fb7469b7 |     
  riscv64    |      lttng-modules-2.13.7      | NOK | http://autobuild.buildroot.net/results/488255d746585858186b9a8aefb8da114cf746eb |     
 aarch64_be  |          luvi-2.13.0           | NOK | http://autobuild.buildroot.net/results/47a4f2f11c5f71762775c237dedc0aceadd4fc21 | ORPH
 aarch64_be  |           lxc-5.0.1            | NOK | http://autobuild.buildroot.net/results/321bc4d905e4d54e7ae088a36f0d5e957767b659 |     
   mips64    | make: *** wait: No child pr... | NOK | http://autobuild.buildroot.net/results/8645838be88876ae309b45ee6abc8b0b1a3ad786 |     
microblazeel |        memcached-1.6.17        | NOK | http://autobuild.buildroot.net/results/f6bd3841c6a408459b2e5fe601865b56c8eab569 | ORPH
  aarch64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/cc2a009a7e5552e0c42f9a91564aead1527928ba |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/a7a4607b54aabefc8a799a1b957f0266a9e942b5 |     
  aarch64    |         nerdctl-1.0.0          | NOK | http://autobuild.buildroot.net/results/91744a3ef50e416dd27aa80437babd9447dc5503 |     
    i686     |         nerdctl-1.0.0          | NOK | http://autobuild.buildroot.net/results/0d42e8f44fa61bb06acd496a63faff72695c2f2a |     
  mips64el   |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/a3012655a93ff9bf810482cacc6559b297d41dfa | ORPH
   x86_64    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/f55ae7cac91cd03c49f61ce60211d828fd7c8d9d | ORPH
    arm      |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/ae1e7cf5358de7ba95ede0963f341907ef9c925d | ORPH
powerpc64le  |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/ce1f72b77531a1789455b1960f44b1342c0e74ea | ORPH
   mips64    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/b3ba36287603f2eee747bd5f43d67256e267c643 | ORPH
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/e58c62f12b11c0fe2ceb4482c48e4828bd181f99 | ORPH
   s390x     |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/317c91f4fb67191108e451d97c42c037f9616709 | ORPH
  riscv32    |          opensbi-0.9           | NOK | http://autobuild.buildroot.net/results/10405cfbcf7f37a2d37a7423ae6c714cab7dd654 |     
   nios2     |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/327be838dcdf2e402894a35689e474737de3a5ad | ORPH
   nios2     |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/0842aadd2e189b7f8ef3d4c596d020a2e0af46c6 | ORPH
   mips64    |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/2fc8710c53e5b5c1a1ee44c173cf26a89e960b44 | ORPH
  mips64el   |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/7abfafc9a0dbdb1462e32dba2700b328428646da | ORPH
powerpc64le  |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/9ba2b588debfefd66df9f0419581241d265f1379 | ORPH
 aarch64_be  |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/019f355bd6ceb6fde82ed6ed56f4bb11749c2915 | ORPH
   x86_64    |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/5dedc652f20d62e1d2597b88187054b8de365ece | ORPH
   nios2     |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/fdb2ec25debeae93fd67f7dafcda909dea2d5164 | ORPH
microblazeel |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/2a306b24d8e3153fcc736ac4355c892c6d64b980 | ORPH
   x86_64    |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/e9dc754ea9bfd69aa1c1b05905b904be380c7bbb | ORPH
 powerpc64   |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/1ebad3893c36f03adb51011677afa2939d0488f8 | ORPH
 powerpc64   |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/e292a8aa41eab0f7df35bc40cbf72179ecadc658 | ORPH
   sparc     |          pcre2-10.42           | NOK | http://autobuild.buildroot.net/results/17ab255507ae88ae74db5d9034c1a0f106dbe6e8 | ORPH
   arceb     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/4c3fa214a85a2ef65dd1f87f274d1b14a8511547 |     
    arc      |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/0d11ea62c74a51e3d8ac7dcc9caee630f0f16de7 |     
   mipsel    |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/6a479687436f80d9ec92c4ac6bebf615a5db15e7 |     
   mipsel    |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/b18463617a04c2111ba886e64cb93f7d1dd44ee6 |     
   armeb     |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/f8ac1f729a18726aa7c536149b9525292abfb869 |     
  aarch64    |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/89c8505f4cbeccf7dfe281649be30beb0c4d070f |     
 aarch64_be  |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/8e514e0da70236271f47a5876878f43f2135a18e |     
   x86_64    |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/bd896f7d6a3e8a090aa631868a5f1aa46fd2a148 |     
 aarch64_be  |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/9946721280835c84d21da34899940d1493642605 |     
    mips     |         proftpd-1.3.8          | NOK | http://autobuild.buildroot.net/results/07928467fc34b66e32ef9c7f15f843ca944129c5 |     
  sparc64    |      python-bcrypt-4.0.1       | NOK | http://autobuild.buildroot.net/results/945c328091a97e7d407d4d2824070010b7d4ebf2 |     
   s390x     |      python-bcrypt-4.0.1       | NOK | http://autobuild.buildroot.net/results/dcf8d63bfc936aec3449347fa0f3bff9776163c6 |     
   mipsel    |      python-bcrypt-4.0.1       | NOK | http://autobuild.buildroot.net/results/b80521ed138158b8131307990880ca3361c67474 |     
 powerpc64   |      python-bcrypt-4.0.1       | NOK | http://autobuild.buildroot.net/results/2f2a914aa4aa0892ec5c4bebcc2d6c27fed8b800 |     
   x86_64    |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/902f92a3f16ef3645c7adbec37b94d1528c41e0a |     
   nios2     |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/00a222d314b4e7b3196e0232fc129fb454f0133b |     
 aarch64_be  |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/4d823b5ca248443e65bc0550cf9b206dd5d0f8ad |     
  sparc64    |   python-cryptography-38.0.4   | NOK | http://autobuild.buildroot.net/results/8bffd78e90d6cff655cf0f577efff66929a60f62 |     
   mipsel    |   python-cryptography-38.0.4   | NOK | http://autobuild.buildroot.net/results/49b425872f2fa6784c5196540b9c3fe9c1f5073c |     
  sparc64    |   python-cryptography-38.0.4   | NOK | http://autobuild.buildroot.net/results/02d27b7620f85ca43c3073b214ad589fc6ebec1d |     
   mipsel    |   python-cryptography-38.0.4   | NOK | http://autobuild.buildroot.net/results/80c6e55f29801cd7436908b06e3be1381c4108c7 |     
   armeb     |     python-greenlet-2.0.1      | NOK | http://autobuild.buildroot.net/results/238269e0029a58bb30cd39691fcfd986b320dcb2 |     
    i686     |     python-greenlet-2.0.1      | NOK | http://autobuild.buildroot.net/results/192fb676f4e75d09082d2bb0b6ad0fa44f191a10 |     
    arm      |      python-numpy-1.23.5       | NOK | http://autobuild.buildroot.net/results/48f6012bcf43e4fbfdf9fb896d3eb62f819c6525 |     
    mips     |           qemu-7.2.0           | NOK | http://autobuild.buildroot.net/results/7819a36889ae75993429006afdce4f8913e1c80c |     
microblazeel |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/fe35afa8b6335fb84c2674aaac8d9151a232e30c |     
   x86_64    | ripgrep-af6b6c543b224d348a8... | NOK | http://autobuild.buildroot.net/results/ef331c47068262a0768f22d23df6c7981fe91d38 |     
   x86_64    | ripgrep-af6b6c543b224d348a8... | NOK | http://autobuild.buildroot.net/results/3506a43796e6f84f3329dd1beb017ee081d903c4 |     
    or1k     | rtl8821cu-86cc5ceb7c28b9b99... | NOK | http://autobuild.buildroot.net/results/aea6bc1e4f89bd1010dfdc9caa54c37edb567d5f |     
 powerpc64   |            sed-4.9             | NOK | http://autobuild.buildroot.net/results/6252d4697bb66deae0e2a99a1f8d55da03822d67 | ORPH
  aarch64    |        sigrok-cli-0.7.2        | NOK | http://autobuild.buildroot.net/results/5ece0bce88d700f164fcd3a89824156481c3b602 |     
   arceb     |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/8672f0324d39a96707b42deb3934c4f017094860 |     
  mips64el   | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/1896a3117c6a1bcd6661b05e71845a3533cbc918 | ORPH
   mips64    | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/e3c71aa269ee18fd249511db59451865ca1eb303 | ORPH
 microblaze  |      uboot-tools-2021.07       | NOK | http://autobuild.buildroot.net/results/e07016a2e458435b6cb2589e6cabcd57101acd0f |     
  riscv64    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/10777e4f51f0f6a6e38e7538f81d6c7006667631 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/b50460a1a1fc9d8de4b82ab18451d43edfae884b |     
   armeb     |            unknown             | NOK | http://autobuild.buildroot.net/results/bf27e87fce332524320a11c2b44605ba4233078b |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/3f5f185fad4653dc3d97e240b62e0c78dd07b924 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/4843aa561facfce43065261064662353ed6ac18c |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/a89eddfcbdfd101c14f1d22593724db2f5f39edb |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/4387a590c36c5ce82cc80d5477dcf84a61716ab5 |     
    mips     |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/485bd1341cc1d8065b8bcc11255890d5f0aa4a76 | ORPH
 powerpc64   |          vnstat-2.10           | NOK | http://autobuild.buildroot.net/results/e5064f2a9c95cf7cec1720c4bbdd1cb56c11b91e |     
   mipsel    |      wireshark-legal-info      | NOK | http://autobuild.buildroot.net/results/c5fbc5bd4176813a4d9285c2428fc49288881ab8 | ORPH
    mips     |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/e0c72bf287da7aade5da2b86d8805ef5a24dc5d6 |     
  riscv32    |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/dc8c3597d00299c30550335f5da5b1f3ee1bbb86 |     
    mips     |        xfsprogs-5.14.2         | NOK | http://autobuild.buildroot.net/results/5a90807b8cfe2fb850e5d4f13b8427184681806e | ORPH
    arm      |       xlib_libX11-1.8.3        | NOK | http://autobuild.buildroot.net/results/7ad5cc4e1c5bfcaf3d9dec2e45a3683bcf891fd1 |     
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/9a338629105dd1a9b625b30d656e392c619476b9 | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/d87de6dd302a24ce76ee357ca30a24448e4c86d8 | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/0c1ac9db17ccb4396ce566368138a66dcafa7158 | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/506de7f5e6284e714e25e5a0fce4fd5b8cdf8635 | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/e8c997cb79dd11c40b8e2c309461902701b15309 | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/ecb29edc39d54207da1bce903f074082271c046c | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/083223b5d3804779438635c80be65ea6f4f86fe5 | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/9ea762ca0636a9f55c4b64b8db4218dab2cfcf55 | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/0518df51fd7f972d283f2056c685a6f1ccab8c19 | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/23a3e5d276cc26a98468c86742d1048524ddefcd | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/0ce242cff9bc0463bd1c3bd11dd8d70dc2cc7965 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/c2542f86827a0fa82823252d65b5c193e8990258 | ORPH


Classification of failures by reason for 2022.11.x
--------------------------------------------------

              host-pahole-1.24 | 3 
                gerbera-1.10.0 | 2 
              host-rust-1.64.0 | 2 
/home/buildroot/autobuild/i... | 1 
                   audit-3.0.7 | 1 
                 avro-c-1.11.0 | 1 
                elfutils-0.186 | 1 
                     frr-8.3.1 | 1 
            host-binutils-2.39 | 1 
                   luvi-2.13.0 | 1 
                   opensbi-0.9 | 1 
                 wavemon-0.9.4 | 1 
                      xz-5.2.7 | 1 


Detail of failures for 2022.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/466d4acbd60de1d261fb27fdf9a76e251b8d810d |     
   armeb     |          audit-3.0.7           | NOK | http://autobuild.buildroot.net/results/aaa8a00cb7e6eb883b877ef6c435ca4e66e577a0 |     
    arm      |         avro-c-1.11.0          | NOK | http://autobuild.buildroot.net/results/c18d61be05859002dab2b04df1cfd663c3632503 |     
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/6b1495dbd0d23d1da960ea08bb3b312412e0ce91 | ORPH
   xtensa    |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/ffbc4d9c965413bd4e02c6a2ae9c92122885d8de |     
 powerpc64   |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/435343fc7c5d3caa9c29ec1914059bba43df368c |     
powerpc64le  |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/36ff25abe00bff7e62822a1b20203c7275ec53e7 |     
   mipsel    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/93026151ec4d50c3d3cf9a546a2cfe3981c31b01 |     
   mips64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/4eb7f46facfa8e66fdf0cd54b355bd68e2668611 |     
microblazeel |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/33ae32436aae4dc4b988fa713790d7bacde6cb0e |     
    sh4      |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/2eae1a9d8cb5871a07bee04d9fe068df94b27589 |     
  powerpc    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/7b62fa9ada1bf9d39ab86b488904f1e2772809cc |     
powerpc64le  |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/e081fde6a53aeb122d2c7e2d003a0c7c36513e9a |     
    mips     |          luvi-2.13.0           | NOK | http://autobuild.buildroot.net/results/3f4bc9ff15c7344807a3b20773ae9721fca5d35e | ORPH
  riscv32    |          opensbi-0.9           | NOK | http://autobuild.buildroot.net/results/f06d8feb85d60c032a4a51b38ef008ae44f50afb |     
   mipsel    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/a04a66535f07cd1e204bd1cb71fa635ebb0d0ff1 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/6cdc509b056a5791d361f347eeb3e3ff7b624410 | ORPH



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
