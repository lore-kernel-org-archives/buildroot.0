Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69303C4332F
	for <buildroot@archiver.kernel.org>; Wed,  8 Nov 2023 06:37:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE8D74148A;
	Wed,  8 Nov 2023 06:37:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE8D74148A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aJhcb06iJ3dH; Wed,  8 Nov 2023 06:37:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F8E04149D;
	Wed,  8 Nov 2023 06:37:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F8E04149D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D0D041BF865
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 06:37:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A13B481E74
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 06:37:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A13B481E74
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0dF2JEsM0G2g for <buildroot@lists.busybox.net>;
 Wed,  8 Nov 2023 06:37:38 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7A77B81E71
 for <buildroot@buildroot.org>; Wed,  8 Nov 2023 06:37:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A77B81E71
Received: by mail.gandi.net (Postfix) with ESMTPSA id BF65AC0008
 for <buildroot@buildroot.org>; Wed,  8 Nov 2023 06:37:33 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Wed, 08 Nov 2023 06:37:33 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20231108063739.A13B481E74@smtp1.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1699425453; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=zyZQ8NUdN24HDMeF8+gwuh7fUbPXVntlNgdsvCZAjTU=;
 b=e4ov7Y+r6uz8MSiaghB4PtIdo6g5sxrgkYxFTz+u8qXMqDqHyVAeyrPhc9b3JjyPnRxm5b
 l9hmEMSFcPZhkSqX7T71HRiTvhv4oovjfsDDPrwRSmVWL0Q+lIxUN7yRz1dGvAwpRpcrP8
 Nz4NeHzAIbKnoUYeS9Q0JuXu19yhhRCZRn24+elIljaK6sEv6jISigAOKz3gmzfEy+XWL5
 k87FdvOhzvwEdnrOyJJty952b6vN9iqPE0EIrnBwWGRVINQaNh6Ae1pX3CepxUJbw8Mhil
 X2lH/30sBqF4VupZZ2CinFehpssy8BG8XO359No7oh7pWL9C9iGBhEWKm3nzIw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=e4ov7Y+r
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-11-07
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

Autobuild statistics for 2023-11-07
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  | 25  |  9  |  0  | 34  |
  2023.08.x  | 15  | 16  |  0  | 31  |
    master   | 87  | 79  |  4  | 170 |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 7 
                     linux-6.6 | 6 
                libressl-3.8.2 | 5 
              gcc-final-12.3.0 | 4 
         gobject-introspection | 4 
                elfutils-0.189 | 3 
glibc-2.38-27-g750a45a78390... | 3 
                libselinux-3.5 | 3 
                   openrc-0.51 | 3 
                    eza-0.14.0 | 2 
              gcc-final-11.4.0 | 2 
         host-gcc-final-12.3.0 | 2 
              host-rust-1.71.1 | 2 
        host-sentry-cli-2.20.3 | 2 
               mariadb-10.11.4 | 2 
                    pppd-2.5.0 | 2 
                    zeek-4.1.1 | 2 
                  acpid-2.0.34 | 1 
               apcupsd-3.14.14 | 1 
                    bat-0.23.0 | 1 
                   bird-2.0.12 | 1 
                 civetweb-1.16 | 1 
           comix-cursors-0.9.1 | 1 
                 coreutils-9.3 | 1 
                     criu-3.18 | 1 
          cryptodev-linux-1.13 | 1 
           dmraid-1.0.0.rc16-3 | 1 
                    fwup-1.9.1 | 1 
gcnano-binaries-0ac1a89d7a5... | 1 
  gobject-introspection-1.76.1 | 1 
         host-gcc-final-11.4.0 | 1 
                host-go-1.21.3 | 1 
              leptonica-1.82.0 | 1 
              libarchive-3.7.2 | 1 
     linux-5.10.162-cip24-rt10 | 1 
            linux-fusion-9.0.3 | 1 
ltrace-82c66409c7a93ca6ad2e... | 1 
                     lxc-5.0.3 | 1 
                  monit-5.33.0 | 1 
                    ncmpc-0.47 | 1 
                  ntp-4.2.8p17 | 1 
                nushell-0.85.0 | 1 
                    qemu-8.1.1 | 1 
        util-linux-libs-2.39.2 | 1 
                 wolfssl-5.6.4 | 1 
                xenomai-3.0.10 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |          acpid-2.0.34          | NOK | http://autobuild.buildroot.net/results/c7c7cd42dee6aad57156361e7f98ecff3a822142 | ORPH
   x86_64    |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/b61d3ef091cabc5fb2d9aecc3940f50ababcde8d |     
   mipsel    |           bat-0.23.0           | NOK | http://autobuild.buildroot.net/results/ae5710f684437f213a8ade47e1507e31feef8844 |     
    arc      |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/110eb0679ed85b8924a834526a3ffbb004b8a4f2 |     
  mips64el   |         civetweb-1.16          | NOK | http://autobuild.buildroot.net/results/0532463c1f2d9cbba6b5f6a58f3a4a80786466f3 | ORPH
   mips64    |      comix-cursors-0.9.1       | NOK | http://autobuild.buildroot.net/results/a1ff8212dfbd7aefd6d26c3846e50658b0a11b8a | ORPH
    sh4a     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/742717c41aac034a2147c573cf2b5a027a7bd355 | ORPH
    mips     |           criu-3.18            | NOK | http://autobuild.buildroot.net/results/b7b8860476de04980bd8c7241d3dd5a01a0251c8 |     
 powerpc64   |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.net/results/844113435b76e83df77bf311dd91487b50747b61 | ORPH
powerpc64le  |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/a3633bacc709a10c0263e3d2c07054398df4b2f4 | ORPH
   sh4eb     |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/ce83e2145798111f95d0c56ecf307bc003ff070e | ORPH
   arceb     |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/1546dcb1ab701a3af09ad1de13be4667e08e2776 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/b0e97de28501ad11ee4555e4a593c85abf8d4790 | ORPH
    mips     |           eza-0.14.0           | NOK | http://autobuild.buildroot.net/results/0f82d6adafbd0a69250c2ac42f55f31f7d429501 |     
   armeb     |           eza-0.14.0           | NOK | http://autobuild.buildroot.net/results/ea2392c70f51d95a57d6ffe400c84e85c477cf08 |     
   arceb     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/07b650c620cba65fa62ff30dd242ae2d5668c070 |     
  aarch64    |        gcc-final-11.4.0        | NOK | http://autobuild.buildroot.net/results/421b49dda60da4910af559d4b7dae0639743f1d9 |     
    arm      |        gcc-final-11.4.0        | NOK | http://autobuild.buildroot.net/results/a4432f7780826676cd78c515b281d1daeee31da0 |     
   armeb     |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/ac5f33cf7cdbc9f56f05e9cec1bdf1449b8e9b86 |     
  riscv64    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/3c980171d3068589af45c9b0e17d6882e2f07e1e |     
  riscv64    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/d83d6b9d0d1b8123305bc50b2916bfc256ba92cd |     
    arm      |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/9eb0e4fa5f650ebafc18a139bcd09c58ea1959e7 |     
    arm      | gcnano-binaries-0ac1a89d7a5... | NOK | http://autobuild.buildroot.net/results/5ca6a02efb86315df8dcba2b5079ac58ebcb618b |     
 powerpc64   | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/ac69e0b6c24461a11d379137193b5f4298a144bb |     
  powerpc    | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/37b587d265caa843e7df23796a2a7d20dd46abca |     
 powerpc64   | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/d0519bd6c01af703bf25b55929a50412b26a5c27 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/8307373c87a4bb6a672ad3778ff3f022f5607abf |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/27a1a39ab2e2703c5fb9bfa7c0097fd67b286510 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/2d661102749bb25fe5ae41f751b86fdf6f6f77b4 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/7a083c7450e5649f2b69e4b0785867b3b249ca3b |     
   nios2     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/af479f062fa9ccf3d88f00ee8159453880e4dee2 | ORPH
    mips     |     host-gcc-final-11.4.0      | NOK | http://autobuild.buildroot.net/results/ca13801b2d5a76a9a7e5cfd18ef21afd57b43c37 |     
 microblaze  |     host-gcc-final-12.3.0      | NOK | http://autobuild.buildroot.net/results/77f6186c514a59d0227b559a12a31e1607707ec1 |     
 microblaze  |     host-gcc-final-12.3.0      | NOK | http://autobuild.buildroot.net/results/62700c06a190a6aabddb12c91f60965d28f703ed |     
  aarch64    |         host-go-1.21.3         | NOK | http://autobuild.buildroot.net/results/431c23f44e705af0a8b13e444f275e5224303222 |     
   x86_64    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/cb82c775eca3a88e3987c3f65b4049a65cdb7d70 |     
   armeb     |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/b4003105327aef831aec058946748fd322ad25d7 |     
    arc      |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/ce16a5d036e8cea90b1c9ca9f72eff8e244c3cf8 |     
   x86_64    |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/574814bbcfb5a348a36b93291debe157a4047fea |     
    sh4a     |        leptonica-1.82.0        | NOK | http://autobuild.buildroot.net/results/9ce90ab9b2ab5d877842c943b0c780f060124a9e |     
  aarch64    |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/97ba42aaf456e5802ae6e67ae27e5503c610db72 |     
   sparc     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/eee1a15db4df31b72d6b5159b70cebd88575a198 | ORPH
microblazeel |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/1e775f9566391d74ed4c7ecc30aadaf54d4b294d | ORPH
  powerpc    |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/cdc81dcf29899bfd34b6410c769c8fa51e3299e8 | ORPH
microblazeel |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/2ad5a5a636a8742d70f89ed44f981ce0d2ddb678 | ORPH
    mips     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/57b88e0731660773527b0703c63a7db9d9079334 | ORPH
   arceb     |         libselinux-3.5         | NOK | http://autobuild.buildroot.net/results/50d6e899c47d987857ef70e3967ee53a8cb0ee05 |     
 microblaze  |         libselinux-3.5         | NOK | http://autobuild.buildroot.net/results/30bf1c6d4464a12a974817017680f0e166aae5d4 |     
   armeb     |         libselinux-3.5         | NOK | http://autobuild.buildroot.net/results/7545f6127526582d6815b46634ebc38b66c1ec2f |     
   mips64    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/7211158d67a9967540fc32936a668ba096ec7c81 | ORPH
   armeb     |           linux-6.6            | NOK | http://autobuild.buildroot.net/results/375c51cfac9e8420840bcd04aec2471d411661da | ORPH
  powerpc    |           linux-6.6            | NOK | http://autobuild.buildroot.net/results/00f094ec9006e988d849347dd43e844f301fb0d7 | ORPH
   s390x     |           linux-6.6            | NOK | http://autobuild.buildroot.net/results/bc1c6709aa4b9b36cfe6a60d425db88db199f592 | ORPH
   arceb     |           linux-6.6            | NOK | http://autobuild.buildroot.net/results/ab90d0becb47997f1a4caa3fe90f8114227af9a5 | ORPH
    mips     |           linux-6.6            | NOK | http://autobuild.buildroot.net/results/5a2c3fef4536f6fb01bc38bf66a9a6b684fc1298 | ORPH
  powerpc    |           linux-6.6            | NOK | http://autobuild.buildroot.net/results/f6ce40031c5ad05364fff59af185aa2af4bf2742 | ORPH
  sparc64    |       linux-fusion-9.0.3       | NOK | http://autobuild.buildroot.net/results/1f295f98d4d62d52b781e855caa112a3d1617bfa | ORPH
    arm      | ltrace-82c66409c7a93ca6ad2e... | NOK | http://autobuild.buildroot.net/results/d11d636cd500717f70b25206515894567ec45144 | ORPH
   armeb     |           lxc-5.0.3            | NOK | http://autobuild.buildroot.net/results/3a16bda219a00cbc1e357ee30be7546da907394d |     
powerpc64le  |        mariadb-10.11.4         | NOK | http://autobuild.buildroot.net/results/8450a312cba81afeddc12e0150705a9cbc92f41e | ORPH
  sparc64    |        mariadb-10.11.4         | NOK | http://autobuild.buildroot.net/results/9a84939ea04552de353b689941c20e39d9589555 | ORPH
    arc      |          monit-5.33.0          | NOK | http://autobuild.buildroot.net/results/bf8693388f49318467f1aa7bbd5a48bdcf8c0b56 |     
   mipsel    |           ncmpc-0.47           | NOK | http://autobuild.buildroot.net/results/f1a0258f8243799048602cdfae8d33f252c25746 |     
   sh4eb     |          ntp-4.2.8p17          | NOK | http://autobuild.buildroot.net/results/95abe9c6a116dab4102945f57353295c25e06581 |     
  sparc64    |         nushell-0.85.0         | NOK | http://autobuild.buildroot.net/results/30086a37172a5731ea6b3e9415bd83f6630d4a93 |     
    m68k     |          openrc-0.51           | NOK | http://autobuild.buildroot.net/results/748381e9084ddce20d80261d9c7b77e2cec6f8d8 |     
    arc      |          openrc-0.51           | NOK | http://autobuild.buildroot.net/results/a011ac6874754d4a542019acb2dda09fb0eb9f8f |     
   mips64    |          openrc-0.51           | NOK | http://autobuild.buildroot.net/results/b1b9837b4e2f076e39f26dd2b7a52e86fcfa9ce9 |     
  sparc64    |           pppd-2.5.0           | NOK | http://autobuild.buildroot.net/results/7c6fb63f1766c35e378097df15a51c0f9cdfb747 |     
  sparc64    |           pppd-2.5.0           | NOK | http://autobuild.buildroot.net/results/d325b6cd2864b97523e62de1f3b7bee4068618dc |     
  riscv32    |           qemu-8.1.1           | NOK | http://autobuild.buildroot.net/results/a472beaa24539d34370df9872506b6b886a1f2ce |     
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.net/results/22755e7fc1aed800b6fd54089b91fb1c55a58ea6 |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/6f60e1565a1638fe0b3c664f4e0661656a7f4d23 |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.net/results/5b79d0b7e5a5207f5c2a136b5e6d0fdafaca29a1 |     
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.net/results/5b535bc4e95787673f2cc2487ed919adb6a84ce2 |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/6b2d6ee54e73ce4d91daacb280acace7d274e8e1 |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/a6735c4210167e40ef6f19b295cf1c0ae8716ffe |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/e104c65a01b8e57528cd2344ed30c14ae96dd385 |     
   mips64    |     util-linux-libs-2.39.2     | NOK | http://autobuild.buildroot.net/results/2f80a5cdb523cc3c8c0f3693607a1be036b2ae98 | ORPH
  mips64el   |         wolfssl-5.6.4          | NOK | http://autobuild.buildroot.net/results/9dbb3a47d95bd0b41a48ee82bc80039b504ca8bf |     
 powerpc64   |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/c62b92a9fc33ceb717493288c5c42a98c072efc2 |     
microblazeel |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/701e30c350a87f6e769a80011f41312801b65442 |     
   x86_64    |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/7a52adfbed94d34855b72bafe1e430688121755c |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                  check-0.15.2 | 2 
                   bird-2.0.12 | 1 
                 dc3dd-7.2.641 | 1 
host-go-bootstrap-stage2-1.... | 1 
          linux-5.10.162-cip24 | 1 
            ocf-linux-20171122 | 1 
                   perl-5.36.0 | 1 
             simple-mail-2.3.0 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    sh4      |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/dfb51776634a399fa1c48c2396f163eb2ed99000 |     
   sparc     |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/389c349cc110954be24b6d0a471f2291aafd5aa4 | ORPH
  mips64el   |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/d26450a89ecee6c0d53c58d2bb04bbca897917ae | ORPH
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/f4494e943a5a906baf74adc81379bcdd4f40974a | ORPH
   xtensa    | host-go-bootstrap-stage2-1.... | NOK | http://autobuild.buildroot.net/results/1fa2ffc300bfe87cfb6c653088250c6de438f7e8 |     
   sh4aeb    |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/230723872accea81a4d469186408884406d4b7b5 | ORPH
    arm      |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/66e592573eb7a3f2d286a4d49b554db5ee65b641 |     
 microblaze  |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/b7a641ae813b8559763709dd34456ffb5f659070 |     
  sparc64    |       simple-mail-2.3.0        | NOK | http://autobuild.buildroot.net/results/edb66c480dd310cddd727811bb483bbe6b29ece1 |     


Classification of failures by reason for 2023.08.x
--------------------------------------------------

                elfutils-0.189 | 4 
glibc-2.37-45-gb4e23c75aea7... | 2 
                   bird-2.0.12 | 1 
                    brltty-6.5 | 1 
dvb-apps-3d43b280298c39a67d... | 1 
               host-go-1.20.10 | 1 
              host-rust-1.71.1 | 1 
           janus-gateway-1.1.2 | 1 
               libglib2-2.76.1 | 1 
                  linux-6.4.16 | 1 
               linux-pam-1.5.3 | 1 
                       unknown | 1 


Detail of failures for 2023.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/003f6fd2fab86f0ba013df576e29b55aa70a1613 |     
microblazeel |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/27bd7a974352c8c93536ae08079c36b46d452e2e |     
    or1k     | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/7b642f37b1c6cefff79b4f1a962d4e764e62a960 |     
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/e105a9ccfeeb9f8ba112d83af904436fedbddb23 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/b1decc34cb1810cc6a7c4b9b06daf6545975ee87 | ORPH
   arceb     |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/afa74e56fdae382a4acf1f71cb08547e71db47c7 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/1c1693e86d8ec1c1d275dcedb9b9bc497792c255 | ORPH
 powerpc64   | glibc-2.37-45-gb4e23c75aea7... | NOK | http://autobuild.buildroot.net/results/4b2c91462a145908cc75551a8a29878f31be6a18 |     
powerpc64le  | glibc-2.37-45-gb4e23c75aea7... | NOK | http://autobuild.buildroot.net/results/0bc38ee5b26c3f19495082c323f002a6499d086a |     
  mips64el   |        host-go-1.20.10         | NOK | http://autobuild.buildroot.net/results/e6c44481a7bc3bec326c064a97b0c8ace5091eb9 |     
   mipsel    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/8cbf774f937eccba4759356eaf34d5924189023e |     
    mips     |      janus-gateway-1.1.2       | NOK | http://autobuild.buildroot.net/results/e457eb66e624b919c65561c0173ac6178f0382c1 |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/bfacddfe79561b8086953ca9584ac807353d9904 |     
 aarch64_be  |          linux-6.4.16          | NOK | http://autobuild.buildroot.net/results/84deac9c941508cb31c56df1b3f21a0f1beda175 | ORPH
   sparc     |        linux-pam-1.5.3         | NOK | http://autobuild.buildroot.net/results/4d25fad8ed9dcaf55adc6a68210b309939737a2b | ORPH
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/78c8e9ddb0afe5dd88e2a0a1e7d67fb7eaea0a8f |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
