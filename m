Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54BBDC4332F
	for <buildroot@archiver.kernel.org>; Sat, 11 Nov 2023 06:39:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F8A683A87;
	Sat, 11 Nov 2023 06:39:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F8A683A87
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G9QR3dP1GaWC; Sat, 11 Nov 2023 06:39:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 491BA83A9B;
	Sat, 11 Nov 2023 06:39:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 491BA83A9B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 68BA51BF286
 for <buildroot@lists.busybox.net>; Sat, 11 Nov 2023 06:39:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0C9B76101B
 for <buildroot@lists.busybox.net>; Sat, 11 Nov 2023 06:39:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C9B76101B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3Gzd8NUxkhgb for <buildroot@lists.busybox.net>;
 Sat, 11 Nov 2023 06:39:13 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9AAE360BB0
 for <buildroot@buildroot.org>; Sat, 11 Nov 2023 06:39:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9AAE360BB0
Received: by mail.gandi.net (Postfix) with ESMTPSA id B8F7B24000A
 for <buildroot@buildroot.org>; Sat, 11 Nov 2023 06:39:09 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sat, 11 Nov 2023 06:39:09 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20231111063915.0C9B76101B@smtp3.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1699684749; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Zo5746Pk2SsmkZxxktlniSQ+vAUxuy4+Txhnz06xjGw=;
 b=oU9VFF7RVf2X3a5CF9nqxlBLDeFzftzCOiVeRKdKz24jIPyDoDiC26LPYStctr7e8lPlXN
 OANU2YcuHF92Ts/2QK5duw4AGTDC7kAfBOVVgMCu6wwrmTIzN/1amipmSxxwKLbKAJXej0
 WCqkcxYBjNM4C9BnCaepdi3Vzi3xYnWILtkOpRr+EIV6ZXgSflZisedxy5XlAG62I0oXmp
 CfYISt1GW6bjj/78tGlOmsgOS0gDDDAK4HWmVlepD8q8s5NzegK86fpKah+0bWZAr3ygeZ
 SzV967w13/2w08/lcVBr4VF/f1uU5Xvh4T6JKyQ8znrXkiMxKbrOhIJN63l37w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=oU9VFF7R
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-11-10
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

Autobuild statistics for 2023-11-10
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  | 13  | 15  |  0  | 28  |
  2023.08.x  | 15  |  8  |  0  | 23  |
    master   | 38  | 62  |  1  | 101 |

Classification of failures by reason for master
-----------------------------------------------

              gcc-final-12.3.0 | 7 
                       unknown | 6 
                   bird-2.0.12 | 5 
                elfutils-0.189 | 4 
              host-rust-1.71.1 | 4 
          python-msgpack-1.0.7 | 3 
               apcupsd-3.14.14 | 2 
              gcc-final-11.4.0 | 2 
                host-go-1.21.4 | 2 
              libarchive-3.7.2 | 2 
                libressl-3.8.2 | 2 
               madplay-0.15.2b | 2 
            optee-client-4.0.0 | 2 
                  assimp-5.2.5 | 1 
                 coreutils-9.3 | 1 
          cryptodev-linux-1.13 | 1 
                    fmt-10.1.1 | 1 
              gcc-final-13.2.0 | 1 
glibc-2.38-27-g750a45a78390... | 1 
         gobject-introspection | 1 
  gobject-introspection-1.76.1 | 1 
host-firmware-utils-86739f2... | 1 
              libcamera-v0.1.0 | 1 
                libgdiplus-6.1 | 1 
            libmemcached-1.1.4 | 1 
              libostree-2023.7 | 1 
                libselinux-3.5 | 1 
                   libzlib-1.3 | 1 
ltrace-82c66409c7a93ca6ad2e... | 1 
                    opkg-0.6.2 | 1 
                   trinity-1.9 | 1 
ulog-0389d243352255f6182326... | 1 
                xenomai-3.0.10 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/f7c07007d5977b5d1ab87fb736f4801415be9678 |     
    or1k     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/c0ed1bec8e02a88a7e697422cd63e93a25429475 |     
   nios2     |          assimp-5.2.5          | NOK | http://autobuild.buildroot.net/results/2409a1c266f2a4545562b31c9135bc3b125bf741 | ORPH
  sparc64    |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/8351b1b421f0a9fa6cbdd6e397bd72c582aae2e3 |     
    sh4a     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/150253290d214c33c9627aa15ddac99c4320eaf3 |     
powerpc64le  |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/c40506a0e4c50f1f6c1ab03b0c76ad3bdd2a7fec |     
  riscv32    |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/ec1214c5133b371ede948e9aa1615da6553a14ae |     
   mipsel    |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/35713ed05ee8f0c28066d8e297f59fe5b1c2ca06 |     
   sparc     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/d71a9d51c6eb537d51f0c34584fb3ee10ac6a08d | ORPH
    or1k     |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.net/results/d7e6e907fa9a9da82678cc74520009c418db794a | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/dcc09513dc3147b4ec47087d8a0e3280496daf48 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/4bb0e5ebcec70ffd3c188257dc8f97444729b097 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/1b8a8062c9f2d027c2485e8aabd3227e94e1a752 | ORPH
    or1k     |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/e9c9230d9536d58e39ac8d2c026a24a29f1267ab | ORPH
   mipsel    |           fmt-10.1.1           | NOK | http://autobuild.buildroot.net/results/65648452485570cc4a3a2381095a1718c812dfc8 |     
   xtensa    |        gcc-final-11.4.0        | NOK | http://autobuild.buildroot.net/results/8fbc45c964dac2359896fa5b4531af2d71e70db9 |     
 aarch64_be  |        gcc-final-11.4.0        | NOK | http://autobuild.buildroot.net/results/10185ccf79b6ca791a0452b5e60b02e3b28fd7f9 |     
  riscv64    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/404a55d55d75258d02138318d8b4e3367bd26cb8 |     
   xtensa    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/317a885839a19936f6dcdd7d0fba1cac0989bb96 |     
  riscv64    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/51431ed069b92336f23164d51a4375ff087e580b |     
   xtensa    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/c76de683dac0da43dea4bfa3a4a1272052ef8efc |     
  riscv64    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/74044174fab1fbb05554dbc9611393120403d2c6 |     
  riscv64    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/02aa6720a2609e81e0ed72bf4d2e49021ac2a84b |     
  aarch64    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/123486a3feabca751b763a8bae14b12305ac35d9 |     
   mips64    |        gcc-final-13.2.0        | NOK | http://autobuild.buildroot.net/results/e06b5f966b62226546e1527a1e5d97b6c229cb88 |     
powerpc64le  | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/7bc2152bb874273731a23d2bbb7870d975cfa7db |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/cc60140eb61bb806fc35868042993c4df53d0952 |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/e97902aef747fbf0951bf0f2b9a178abec68c35a | ORPH
   arceb     | host-firmware-utils-86739f2... | NOK | http://autobuild.buildroot.net/results/6f273353dd69761d7ced033043eea09024014c82 |     
  mips64el   |         host-go-1.21.4         | NOK | http://autobuild.buildroot.net/results/7ac4460276cc985bfc29b466f0e918486f5df071 |     
   mips64    |         host-go-1.21.4         | NOK | http://autobuild.buildroot.net/results/2cc04fc9ca6f53a84f632095ce59c19e63418ac8 |     
   x86_64    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/090d326b62793428a5af56c3f972f6d39b587ac3 |     
   x86_64    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/b48563e82c6ab9b53fe06eefa9d778c47bc84133 |     
   x86_64    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/a089a19fe71843a6a471b0ad02dd96694785a473 |     
   x86_64    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/276f6d07083eb125950200c7326f74be4472faee |     
 powerpc64   |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/4682dbd8b30c5f4855cf1a72237d08a1b1ca551d |     
powerpc64le  |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/8bd71e531a0bdfe616eaa20d9700030a8c66cba0 |     
  aarch64    |        libcamera-v0.1.0        | NOK | http://autobuild.buildroot.net/results/2555a0d4a092b0851d36ae5561be0147f108ca6d |     
   sh4eb     |         libgdiplus-6.1         | NOK | http://autobuild.buildroot.net/results/5054ec4d52efad7a5ed6db73de860bf56f89945e |     
    or1k     |       libmemcached-1.1.4       | NOK | http://autobuild.buildroot.net/results/0241faf40e330dbce234a76aa5c85a4f50f2a13a | ORPH
   sparc     |        libostree-2023.7        | NOK | http://autobuild.buildroot.net/results/f3dd7e41e5802a64e1229ddf00f69c64a3414c5e |     
    m68k     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/c88dc6501a38e9097fa7d2d77dc6c1f2a99acd18 | ORPH
   xtensa    |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/afe718d303cc15d7f701137fda1d9a715dcf119b | ORPH
   mipsel    |         libselinux-3.5         | NOK | http://autobuild.buildroot.net/results/1b0fa2d01efe3d563676cbb4e674d11c4637d544 |     
   mips64    |          libzlib-1.3           | NOK | http://autobuild.buildroot.net/results/f0b0ccc5a43122f1646a8ded68850edbd4f72468 | ORPH
    arm      | ltrace-82c66409c7a93ca6ad2e... | NOK | http://autobuild.buildroot.net/results/135e65c4576d1264873aa879a0df80125c40cf4c | ORPH
    arm      |        madplay-0.15.2b         | NOK | http://autobuild.buildroot.net/results/fc80c25899ada358b5135c8aa04127249a488145 | ORPH
    arm      |        madplay-0.15.2b         | NOK | http://autobuild.buildroot.net/results/b9e3edec8ab3f94febee4a99dba41145beece30c | ORPH
 aarch64_be  |           opkg-0.6.2           | NOK | http://autobuild.buildroot.net/results/7d94a1f0d3450640b2396963f37985b5b9909fcb | ORPH
   nios2     |       optee-client-4.0.0       | NOK | http://autobuild.buildroot.net/results/d42bd60aa7f78885220b916464d26a3a3b44e4dd |     
    arc      |       optee-client-4.0.0       | NOK | http://autobuild.buildroot.net/results/2a94aba6f5d3a01da2a13f8ec53c07d072d6ca87 |     
    mips     |      python-msgpack-1.0.7      | NOK | http://autobuild.buildroot.net/results/cd8232989c474b5d06b0fd5861edcee23be05465 |     
   mips64    |      python-msgpack-1.0.7      | NOK | http://autobuild.buildroot.net/results/71996d5b2330a316511813be8b6c789739832f77 |     
   mips64    |      python-msgpack-1.0.7      | NOK | http://autobuild.buildroot.net/results/a54110a1fbdad654b316039b20685a7bce7eaf9e |     
   x86_64    |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/1836e9b65bd22cf7e2652767229d8ad9b314d453 | ORPH
 aarch64_be  | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/51ee58979b2f969ce065be835c63dd4049b12846 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/24a90ee320de1a7c9551ccb36e00d0e9f71d4cd1 |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.net/results/46f484c3956d7849145c458030b769bd95fc13ed |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/186876e72e3005c7c6a4a8b5724489eec92817ef |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/08c4376e076f45c527cb3ff53497fd5b2f7ece17 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/fab14132531cfd7a194c7af2759a1bd705f90f46 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/917a0947ac81d41cd8409c523a4b641fb8d89bd9 |     
    arm      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/5f73af1b273789f1d5af9d6e34f1e1a5bb6660a6 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                  check-0.15.2 | 2 
                   bird-2.0.12 | 1 
                     efivar-38 | 1 
                elfutils-0.186 | 1 
       freeradius-client-1.1.7 | 1 
  gobject-introspection-1.72.0 | 1 
                 highway-1.0.2 | 1 
            host-binutils-2.37 | 1 
               host-runc-1.1.7 | 1 
              host-rust-1.67.1 | 1 
        ltp-testsuite-20220930 | 1 
                    qemu-7.2.1 | 1 
             strongswan-5.9.11 | 1 
                       unknown | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    sh4      |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/6ee228646b2281d3bf60885fd655699fb6ea9e2a |     
  aarch64    |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/d731f628b8acea9afea55318cc1c8035cf463eec | ORPH
    arm      |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/e8f402db34e73c4b66bb704f58fd05af5a3132a8 | ORPH
  mips64el   |           efivar-38            | NOK | http://autobuild.buildroot.net/results/03beae6e7392747adc2ef50ee1f94a7daa6dd12d |     
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/6528df0846cadd9ef9bc9461125b06d4f45b36f9 | ORPH
  riscv64    |    freeradius-client-1.1.7     | NOK | http://autobuild.buildroot.net/results/6a14fcf9c857587df013f526d955f7a5d11f4f72 |     
   s390x     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/12bc45955c8a75efceeb6c4c1aa48c68ea0283c2 | ORPH
 aarch64_be  |         highway-1.0.2          | NOK | http://autobuild.buildroot.net/results/2293ed4b10d9838fd662d46da4f909f330aa7f18 |     
    mips     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/a356cbee7e92d3ba25bf8af0a40626a4000dfb50 |     
   sparc     |        host-runc-1.1.7         | NOK | http://autobuild.buildroot.net/results/0012e5694dd2e64791b07c8443bfa41fe4fb0280 |     
powerpc64le  |        host-rust-1.67.1        | NOK | http://autobuild.buildroot.net/results/f9cf37bb3d8a8d71b32b6991b594bae03b86ffb0 |     
   sh4aeb    |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/0b49542021a180eaa788aa7e191b46f5c609f6c7 |     
   mipsel    |           qemu-7.2.1           | NOK | http://autobuild.buildroot.net/results/a691c00f0ff2f8ac2268b3ef0bc230a0b969b017 |     
   s390x     |       strongswan-5.9.11        | NOK | http://autobuild.buildroot.net/results/146ae3dc2abecb544c98d232c3aa950eeb44b071 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/9d8a54ea536fdbc3a8d90743de9e05272d62950d |     


Classification of failures by reason for 2023.08.x
--------------------------------------------------

                   bird-2.0.12 | 1 
                elfutils-0.189 | 1 
  gobject-introspection-1.76.1 | 1 
         host-sentry-cli-2.8.0 | 1 
                libglvnd-1.4.0 | 1 
                libxml2-2.11.4 | 1 
                     pv-1.6.20 | 1 
    python-cryptography-39.0.2 | 1 


Detail of failures for 2023.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/25581093f9a865fe8ccf035e6168ff66eec522ed |     
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/eab6cb54112609291485883cf9b34fdbf53b8f72 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/2eaf2b692d8eec1f1b211e3b3815a905bb080d96 | ORPH
powerpc64le  |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/206bd28ce868f83882b8ac6f5ff66456fee8cb25 |     
    or1k     |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/33290f97f8683edb49e4acea725320cf29a88f43 | ORPH
   arceb     |         libxml2-2.11.4         | NOK | http://autobuild.buildroot.net/results/699e7df7076e28a93fea6266dee66de66323c8f0 |     
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/a55a92180b2e602364ed1827f90452a0bd3328fa | ORPH
   armeb     |   python-cryptography-39.0.2   | NOK | http://autobuild.buildroot.net/results/953cc88035ae544200ba807d70fd3532f4e9939d |     


Gitlab CI results for 2023-11-10
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
   atmel_sama5d2_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/5495565682  |      
                          beaglev | https://gitlab.com/buildroot.org/buildroot/-/jobs/5495565764  |      
               broadcom_northstar | https://gitlab.com/buildroot.org/buildroot/-/jobs/5495565782  |      
                     canaan_kd233 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5495565787  |      
              freescale_imx8mpevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/5495565925  |      
             freescale_imx8qxpmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/5495565937  |      
                       imx8mmpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/5495566038  |      
                        imx8mpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/5495566052  |      
                        imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/5495566055  |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/5495566065  |      
                          lafrite | https://gitlab.com/buildroot.org/buildroot/-/jobs/5495566073  |      
      microchip_sam9x60ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/5495566107  |      
              octavo_osd32mp1_brk | https://gitlab.com/buildroot.org/buildroot/-/jobs/5495566194  |      
              octavo_osd32mp1_red | https://gitlab.com/buildroot.org/buildroot/-/jobs/5495566198  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5495566265  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/5495566279  |      
                qemu_aarch64_sbsa | https://gitlab.com/buildroot.org/buildroot/-/jobs/5495566375  |      
                qemu_m68k_mcf5208 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5495566400  |      
              qemu_mips64r6_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/5495566435  |      
                  qemu_ppc_e500mc | https://gitlab.com/buildroot.org/buildroot/-/jobs/5495566452  |      
          qemu_riscv64_nommu_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/5495566465  |      
                qemu_riscv64_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/5495566467  |      
           qemu_xtensa_lx60_nommu | https://gitlab.com/buildroot.org/buildroot/-/jobs/5495566486  |      
                     raspberrypi0 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5495566487  | ORPH 
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/5495566498  | ORPH 
                        rockpro64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5506273873  |      
             sipeed_licheepi_nano | https://gitlab.com/buildroot.org/buildroot/-/jobs/5506274154  |      
                  sipeed_maix_bit | https://gitlab.com/buildroot.org/buildroot/-/jobs/5506274301  |      
           sipeed_maix_bit_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/5506274332  |      
                 sipeed_maix_dock | https://gitlab.com/buildroot.org/buildroot/-/jobs/5506274346  |      
          sipeed_maix_dock_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/5506274370  |      
                   sipeed_maix_go | https://gitlab.com/buildroot.org/buildroot/-/jobs/5506274655  |      
            sipeed_maix_go_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/5506274976  |      
                 sipeed_maixduino | https://gitlab.com/buildroot.org/buildroot/-/jobs/5506275157  |      
          sipeed_maixduino_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/5506275240  |      
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5506275272  |      
                 snps_arc700_nsim | https://gitlab.com/buildroot.org/buildroot/-/jobs/5506275291  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5506275383  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5506276317  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
