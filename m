Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E129DC07548
	for <buildroot@archiver.kernel.org>; Wed, 15 Nov 2023 06:39:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3924682391;
	Wed, 15 Nov 2023 06:39:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3924682391
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T9H1Cv00eoQr; Wed, 15 Nov 2023 06:39:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1FF8282425;
	Wed, 15 Nov 2023 06:39:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1FF8282425
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DA3441BF844
 for <buildroot@lists.busybox.net>; Wed, 15 Nov 2023 06:39:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9C29682391
 for <buildroot@lists.busybox.net>; Wed, 15 Nov 2023 06:39:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C29682391
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5uDbGRo_69Iq for <buildroot@lists.busybox.net>;
 Wed, 15 Nov 2023 06:38:59 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 652948247F
 for <buildroot@buildroot.org>; Wed, 15 Nov 2023 06:38:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 652948247F
Received: by mail.gandi.net (Postfix) with ESMTPSA id B69B320008
 for <buildroot@buildroot.org>; Wed, 15 Nov 2023 06:38:55 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Wed, 15 Nov 2023 06:38:55 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20231115063900.9C29682391@smtp1.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1700030335; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Y+wSLbu2UymA6lCBBhtcvtBdbKD2YA2V1IPRjz4AI2U=;
 b=cFHu6UvYrXLSVXxImUcrb9MffmZfVAk0Xy3D35/FB4mhw5zm+vOcd3+OCNFUGs9WcS5/aq
 rfiBem4ZN4d7Tf8VnQJvAVcaTrDxafax73N//m255F3uiRioINyPPpKtPlEefrPfabcu0p
 FNnUbwBdjDBZHb4cTIHBmprpB9uxJJaAJNPTlARQQ0RYTryh/LJAKnmzTHPw1YtCo51ru5
 0Z7UPjHKw5vG5lsBwa4/MVoBDTfSCrSTrngm3Jg4yLsmD0iU3X818OX3vy12+++XI2ZK4J
 4w2MUS1FcyPdrsOeQrngNOhnm8KmACAQyXFerC3kQc6D9TK2twApb7VySAAlmQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cFHu6UvY
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-11-14
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

Autobuild statistics for 2023-11-14
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  | 18  | 10  |  0  | 28  |
  2023.08.x  | 12  |  5  |  0  | 17  |
    master   | 42  | 52  |  2  | 96  |

Classification of failures by reason for master
-----------------------------------------------

                libressl-3.8.2 | 7 
                       unknown | 4 
                   bird-2.0.12 | 3 
                elfutils-0.189 | 3 
          python-msgpack-1.0.7 | 3 
         gobject-introspection | 2 
              host-rust-1.71.1 | 2 
                   linux-6.6.1 | 2 
                python3-3.11.6 | 2 
                  assimp-5.2.5 | 1 
check-11970a7e112dfe243a2e6... | 1 
                 coreutils-9.3 | 1 
          cryptodev-linux-1.13 | 1 
           dmraid-1.0.0.rc16-3 | 1 
              fluent-bit-2.1.7 | 1 
                     frr-8.4.2 | 1 
  gobject-introspection-1.76.1 | 1 
        host-sentry-cli-2.20.3 | 1 
                  janet-1.32.1 | 1 
              libarchive-3.7.2 | 1 
          libcamera-apps-1.3.0 | 1 
                libselinux-3.5 | 1 
ltrace-82c66409c7a93ca6ad2e... | 1 
               madplay-0.15.2b | 1 
 Makefile:727: target-finalize | 1 
               mariadb-10.11.4 | 1 
                   p7zip-17.04 | 1 
                    php-8.2.12 | 1 
                    pppd-2.5.0 | 1 
                     pv-1.6.20 | 1 
           python-bcrypt-4.0.1 | 1 
        python-pysensors-0.0.4 | 1 
               valgrind-3.22.0 | 1 
                xenomai-3.0.10 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |          assimp-5.2.5          | NOK | http://autobuild.buildroot.net/results/fd223f83e3d1bd0b6985d7910b1caaa716920d67 | ORPH
   s390x     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/f6e7bb810c924c52a0cac1e405d7dd8385756496 |     
    or1k     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/282eb2caf7e9465bb317131111cdbbaed289f45a |     
   armeb     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/510da6005c505ea63840257fcb0f127e2529f01d |     
  riscv64    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/1e0d15c68c275ea7802d9201a2b8729cd8b251fa | ORPH
    mips     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/3f21480c307079b35cafed11a4160a9eda2252af | ORPH
 aarch64_be  |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.net/results/70967fb33d790b5a8b05797c19a75104f5332662 | ORPH
   x86_64    |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/a35e27e7dc020bac05cdd7f6f5f76d8c5de59ba6 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/b64c02ae7b01abaef1c6b454616aab4626b509ff | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/c9d3ef564b3f5287591a145f949f8849754c42f8 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/24700a5a535d6dcb4ff9bcc59d19c88fffa150bc | ORPH
 microblaze  |        fluent-bit-2.1.7        | NOK | http://autobuild.buildroot.net/results/ff5c60cd038550453ce138fe2a9383af2f5d6f2f |     
    arc      |           frr-8.4.2            | NOK | http://autobuild.buildroot.net/results/977e1c3b245e1c9480dc2898ca028d4b49342f04 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/801556f0e62a323468540d129cc04f56f383b310 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/23302a9c2bf44c9d5937e48fc0591c1f5e2c8e1d |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/06da466e58a304a54c8621c45ffc158a7d15564f | ORPH
  aarch64    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/c8ac0cac87799f7717c833806da76f6cc38c0804 |     
   x86_64    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/3cd9b102f3a532c5f32b7833d4548ce70a848dd4 |     
  powerpc    |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/c26e04a03ced93aa778d1c553bb10ff144ae078a |     
  riscv64    |          janet-1.32.1          | NOK | http://autobuild.buildroot.net/results/f0771fc6c9905d3a6d60ce245df585b3c6096f7f |     
microblazeel |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/ee6763738911d415088e311d0c92fb7de7726e66 |     
  mips64el   |      libcamera-apps-1.3.0      | NOK | http://autobuild.buildroot.net/results/4a1baecec817a96470f865058aff5416eafc0adf |     
  mips64el   |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/aabea8c59ea487dd3dfae730534d1b14bd3fbf0d | ORPH
 microblaze  |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/00b7cfc2bde957b6edea38163e2bf531f1b5449b | ORPH
   sparc     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/7c40ae6c00e10270d6c836794abe80890025ae9c | ORPH
   s390x     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/8072a419e4cb14d69200f9b8cd924530f0ddc253 | ORPH
    arc      |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/b8acfcdb4c7aef690443c37562a97fbc87580d3c | ORPH
    arc      |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/908ec45c6e17873d2674d9b1adca1575d6cd651e | ORPH
   mipsel    |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/30f017e2b989d2747e8dbe81e219d13e8171990b | ORPH
 microblaze  |         libselinux-3.5         | NOK | http://autobuild.buildroot.net/results/15883bce9c01fe0ac0d398ab665c6b47db46e22d |     
    m68k     |          linux-6.6.1           | NOK | http://autobuild.buildroot.net/results/b9797f5c790d29bd224b0d16f03d38b98c466e71 | ORPH
   armeb     |          linux-6.6.1           | NOK | http://autobuild.buildroot.net/results/455ab9bd04aa2dd30c1770de9304cfa83e384b9c | ORPH
    mips     | ltrace-82c66409c7a93ca6ad2e... | NOK | http://autobuild.buildroot.net/results/dcafb69624f238f688ea348f10ce84187c464de8 | ORPH
   armeb     |        madplay-0.15.2b         | NOK | http://autobuild.buildroot.net/results/7716cf9830d81b781c1ea7045cd9ba720a80771b | ORPH
powerpc64le  | Makefile:727: target-finalize  | NOK | http://autobuild.buildroot.net/results/ef10aadff68fe5412a0656a879af9fd76a12b9c0 |     
 aarch64_be  |        mariadb-10.11.4         | NOK | http://autobuild.buildroot.net/results/ad0a8e5f7e721b74f483b57c92b43509319a47e3 | ORPH
  sparc64    |          p7zip-17.04           | NOK | http://autobuild.buildroot.net/results/c7f428a6393ee2852658f733efb508f8f155849e |     
    or1k     |           php-8.2.12           | NOK | http://autobuild.buildroot.net/results/6ac0845eeacc36f1d9e73e6b119e211f16243976 |     
  sparc64    |           pppd-2.5.0           | NOK | http://autobuild.buildroot.net/results/1beef06c9665a044331f2cff265cb33499633e86 |     
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/766d3747315960eb3df3b2354f607a8c7847ed60 | ORPH
   armeb     |      python-bcrypt-4.0.1       | NOK | http://autobuild.buildroot.net/results/e409c8cdaee3affd951dd47ba4f29011103d37da |     
  powerpc    |      python-msgpack-1.0.7      | NOK | http://autobuild.buildroot.net/results/5b6c44c704c87715dc0e1798cc01caec83504867 |     
 powerpc64   |      python-msgpack-1.0.7      | NOK | http://autobuild.buildroot.net/results/6ab4e1cbc24ff177633375f06747132669ac8f10 |     
   mipsel    |      python-msgpack-1.0.7      | NOK | http://autobuild.buildroot.net/results/778362452115560f07b9b38ec1fb32a308c0fc39 |     
   sh4eb     |     python-pysensors-0.0.4     | NOK | http://autobuild.buildroot.net/results/360c0cbbb0eb9aaedc96598201d876848ee9d6c5 |     
   x86_64    |         python3-3.11.6         | NOK | http://autobuild.buildroot.net/results/01f0623815841adf7e8975a02cf22c6d8426a61b |     
   x86_64    |         python3-3.11.6         | NOK | http://autobuild.buildroot.net/results/6445e44b1df6ee52c5eed48633b591c843f9dcc5 |     
   sh4aeb    |            unknown             | NOK | http://autobuild.buildroot.net/results/fe2245dfe3cf130c276e580e06c104848fa44ea7 |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.net/results/2c9691abda36d13d23c13246ecf91e8da2b1f355 |     
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.net/results/7291967e82ea289641a9ed6f8fda2882e6b3fbf2 |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/ca082bd93da4aa8435e92910af8eeef96dc16086 |     
   mipsel    |        valgrind-3.22.0         | NOK | http://autobuild.buildroot.net/results/2bffd839b4d449726051a40db351f08ea7e04729 | ORPH
   sh4eb     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/3a9e41a3db23c4e3b60d3cd90466344ae9ec471f |     
microblazeel |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/568411322f89682900bfc8750ec9c272a8cfe0b4 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                elfutils-0.186 | 3 
                   bird-2.0.12 | 1 
               host-go-1.20.11 | 1 
               libcap-ng-0.8.3 | 1 
               libglib2-2.72.3 | 1 
                  linux-6.1.62 | 1 
            python-sip-4.19.25 | 1 
             strongswan-5.9.11 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/fb9be70acacf7694443e8639e1bcafa66a77217e |     
   arceb     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/8a2903ee6dfb1e8d133e443c77634db8459c608f | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/33fe0b9a317f4759983c7b2c75bce640914877fd | ORPH
   arceb     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/f30e39d8ae43ad499b07d80f7b18fd8b6355b07e | ORPH
   mips64    |        host-go-1.20.11         | NOK | http://autobuild.buildroot.net/results/dce78f8df46778f40b4ecfdbde924468769db152 |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/282f14fbe1bfb105ba78c554bf9bcd9d8c044dec |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/18a6570e9e19aecf1d687914fe8cf6cb2c86606c |     
   s390x     |          linux-6.1.62          | NOK | http://autobuild.buildroot.net/results/9ac097b15db781b8ecfbb4603ddaed6dab9ea27c | ORPH
   xtensa    |       python-sip-4.19.25       | NOK | http://autobuild.buildroot.net/results/040492f12fdb9b52aa9aa090df4b8e24028b29a5 |     
   s390x     |       strongswan-5.9.11        | NOK | http://autobuild.buildroot.net/results/89152f32f05c5c307e0e818b5b2c1f8504e9c29e |     


Classification of failures by reason for 2023.08.x
--------------------------------------------------

                   bird-2.0.12 | 1 
check-11970a7e112dfe243a2e6... | 1 
               host-go-1.20.11 | 1 
                   trinity-1.9 | 1 
                       unknown | 1 


Detail of failures for 2023.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/49f0aca69244c89350811039ae52318f48addfdf |     
  aarch64    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/bb498e14baee59440d2db7e09ed1b55ffe0cc47a | ORPH
  mips64el   |        host-go-1.20.11         | NOK | http://autobuild.buildroot.net/results/af62578dbf2e58815513a0f34ea6c15924a60924 |     
   x86_64    |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/45a5786d9187152f11bb338a3917537ebe9ba79a | ORPH
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/0273426f16e615cfaa8074e7ca4764e1412dde3d |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
