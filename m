Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CD65C47077
	for <buildroot@archiver.kernel.org>; Tue, 16 Jan 2024 06:45:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E70FB40A85;
	Tue, 16 Jan 2024 06:45:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E70FB40A85
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xW-CIK9HfeKv; Tue, 16 Jan 2024 06:45:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A14A140167;
	Tue, 16 Jan 2024 06:45:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A14A140167
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 89AE31BF417
 for <buildroot@lists.busybox.net>; Tue, 16 Jan 2024 06:45:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5EFEF40167
 for <buildroot@lists.busybox.net>; Tue, 16 Jan 2024 06:45:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5EFEF40167
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id efLTAbZywvUv for <buildroot@lists.busybox.net>;
 Tue, 16 Jan 2024 06:45:33 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 39EBA4015F
 for <buildroot@buildroot.org>; Tue, 16 Jan 2024 06:45:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 39EBA4015F
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3315A6000B
 for <buildroot@buildroot.org>; Tue, 16 Jan 2024 06:45:29 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Tue, 16 Jan 2024 06:45:29 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20240116064535.5EFEF40167@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1705387529; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=o1jLZUtoDEwqOkbm5AcLtrQ4O6RCb4OumT96Vq9zqes=;
 b=EPYeC72G6rBm2NTg7kUiXG6SwpWLGDIlJxK4M7O7nmGr5SzG2T5+O/hMCE0TQ9Ml3jyRjV
 Vk3YAn2nnLySwalyCRV46H5n4ma2tNN4u+YGj+icWLB3Ga+wJ//IJ9wCy7k9/9IGJvsgKd
 1zMHnXjKn9OqOe6GlkZZAhzDuR/1VFvCYxRRDjmVBxpb2E+DEZGwBpzCqK0KjjxG7BrelX
 pETJ7dC6TL+q/a7hiUrGF9DwCrWh5aMy4UY8Rt7VUhHH4Z1bY+zJUN+RVZ1GouwJt9eZZW
 iV/wKN6RtuaeVG1xXitVwydBO0+DSezTZ3exuewMnLcWyHznY8YnWPJ0Fk4lEQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=EPYeC72G
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-01-15
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

Autobuild statistics for 2024-01-15
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  1  |  2  |  0  |  3  |
  2023.11.x  |  1  |  6  |  0  |  7  |
    master   | 39  | 54  |  1  | 94  |

Classification of failures by reason for master
-----------------------------------------------

                   foot-1.16.2 | 4 
              host-rust-1.74.1 | 4 
                libressl-3.8.2 | 4 
                  stunnel-5.71 | 4 
                elfutils-0.189 | 3 
                    attr-2.5.2 | 2 
glibc-2.38-27-g750a45a78390... | 2 
  gobject-introspection-1.76.1 | 2 
              libarchive-3.7.2 | 2 
              libopenssl-3.2.0 | 2 
                  linux-6.6.11 | 2 
                 coreutils-9.3 | 1 
           dmraid-1.0.0.rc16-3 | 1 
fs/axfs/axfs.mk:32: /home/a... | 1 
gcnano-binaries-5d02efd5cb4... | 1 
                     gmp-6.3.0 | 1 
         gobject-introspection | 1 
             gstreamer1-1.22.8 | 1 
        host-sentry-cli-2.20.3 | 1 
               ipmitool-1_8_19 | 1 
              leptonica-1.83.1 | 1 
                libselinux-3.5 | 1 
            linux-fusion-9.0.3 | 1 
                   linux-tools | 1 
                memtest86-6.20 | 1 
                    ncmpc-0.49 | 1 
                    php-8.2.14 | 1 
               pipewire-0.3.81 | 1 
    python-cryptography-39.0.2 | 1 
   python-pydantic-core-2.14.5 | 1 
             strongswan-5.9.13 | 1 
                 sudo-1.9.15p5 | 1 
               tcf-agent-1.8.0 | 1 
ulog-0389d243352255f6182326... | 1 
                       unknown | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |           attr-2.5.2           | NOK | http://autobuild.buildroot.net/results/e019bd9b0fa2afa7fabcf4334383f4239f7f7a1e |     
microblazeel |           attr-2.5.2           | NOK | http://autobuild.buildroot.net/results/29c76e02becedf922bd7dc0533338c078bf77d2a |     
   sh4eb     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/9260a26dd4ab9e87f4c0334fc63cf4e33e99b54a | ORPH
   armeb     |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/1cb22e562e70303a734e76a99f351e8e5138cc07 | ORPH
   sh4aeb    |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/929d4d3de018dc7092d566389d45678265c4ac65 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/f3338d4714bce835b231d2a6177b0843ec6a72d2 | ORPH
   arceb     |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/3a09f9fe09faf8229f8400ee10f7dd81e04c941d | ORPH
 microblaze  |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/d8f47f3a23df2d7f38031c386269aaabec7a30c0 |     
   nios2     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/b00a91da6a8dbd39f929211faaf565f676b80a8c |     
   nios2     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/be7a26e28d7480e0cd958e211d242b3bc6273738 |     
   nios2     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/2d90945797f49880be3ece6d66253c7c59fb3e82 |     
   xtensa    | fs/axfs/axfs.mk:32: /home/a... | NOK | http://autobuild.buildroot.net/results/3ac5253dca8af00fd74791399d4eecd73650ce1f |     
    arm      | gcnano-binaries-5d02efd5cb4... | NOK | http://autobuild.buildroot.net/results/7e10145d5ff9ca4a3ba620e7bc2968350ce06479 |     
powerpc64le  | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/66f44b0c500f535c435c259c0c35def3bd7dc332 |     
powerpc64le  | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/81717a92582095b2fa66cc6e37c6af3c0285070f |     
  riscv64    |           gmp-6.3.0            | NOK | http://autobuild.buildroot.net/results/445db2c9113eeb118b51f4216b2a871e022fe6a3 | ORPH
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/c7a2fa88348f98fc786859468cc77ff9477b4592 |     
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/9562e68bf1a4c4a893110db06d3d02889ab8e200 | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/6af3a963e0e887e38a560f157b57c03f574f9084 | ORPH
  aarch64    |       gstreamer1-1.22.8        | NOK | http://autobuild.buildroot.net/results/1d118063ddb9afa0c0bccc5e802c36b1cdcabbac | ORPH
   armeb     |        host-rust-1.74.1        | NOK | http://autobuild.buildroot.net/results/e38e28ea879c5b8914f1b1043fc2103348c1bad4 |     
  aarch64    |        host-rust-1.74.1        | NOK | http://autobuild.buildroot.net/results/44582fc7b5266816046ef11e3a2e4a0bc31aea19 |     
    arm      |        host-rust-1.74.1        | NOK | http://autobuild.buildroot.net/results/9b4f28e3dca7a3fa5c815f243d2a02bf5f193fa1 |     
 powerpc64   |        host-rust-1.74.1        | NOK | http://autobuild.buildroot.net/results/b3d73cb0f7991d5dd8924cca83803957935ddbc0 |     
   mipsel    |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/0e6c4572690f880bef270ab21e4bb730bf43b9a1 |     
   mipsel    |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/c200bb9d888550289fd6f14d337306a6e789ba89 |     
   sh4aeb    |        leptonica-1.83.1        | NOK | http://autobuild.buildroot.net/results/f18979454399d9c728f9e017e4cc3a1b27458f5b |     
powerpc64le  |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/f0fdcaa9973c54e785be1098d57c243e7baef275 |     
    mips     |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/27b20a6bb00562bd61c750b7a353c2bc108e89ee |     
   s390x     |        libopenssl-3.2.0        | NOK | http://autobuild.buildroot.net/results/8b44185ead93774c6fd34ea8192935d1242527f3 | ORPH
   s390x     |        libopenssl-3.2.0        | NOK | http://autobuild.buildroot.net/results/5b5e24a8cc96635c7f891cb04e67d637c87d46e9 | ORPH
 powerpc64   |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/ef8cc1b23aa0ab8d1e47f387ff7590f8f2f9862b | ORPH
   s390x     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/49a84599388430b4dc8c53754a482bef0dc21211 | ORPH
    arc      |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/27fc611519e95546bc192e4e24965d6423649fd3 | ORPH
powerpc64le  |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/16befd25f64095691350fd86f263d4e29dca09e8 | ORPH
   sh4eb     |         libselinux-3.5         | NOK | http://autobuild.buildroot.net/results/c9aa4fd765f2afd3e306e79db34406d87bbb7963 |     
    mips     |          linux-6.6.11          | NOK | http://autobuild.buildroot.net/results/97f214f55000eba3c4fa739f66c17ad2e0091140 | ORPH
    m68k     |          linux-6.6.11          | NOK | http://autobuild.buildroot.net/results/4ac7b943560d8b95a0cabe223e1aa76c76925b6c | ORPH
powerpc64le  |       linux-fusion-9.0.3       | NOK | http://autobuild.buildroot.net/results/e55d6788c62bd5c3beb0da2dd1c5c42a4dd5de6b | ORPH
   s390x     |          linux-tools           | NOK | http://autobuild.buildroot.net/results/7ed69e34d4114fee59144344b672f92f35663031 | ORPH
    i686     |         memtest86-6.20         | NOK | http://autobuild.buildroot.net/results/dab12c61209de96b99e4f47bb009176393b6c61f |     
powerpc64le  |           ncmpc-0.49           | NOK | http://autobuild.buildroot.net/results/1d1c4d0c496d4a913b85c239cdd3b6ed4eeed145 |     
   sh4eb     |           php-8.2.14           | NOK | http://autobuild.buildroot.net/results/1f21b293565e51903315e867bfa9e4575bec5334 |     
   sh4aeb    |        pipewire-0.3.81         | NOK | http://autobuild.buildroot.net/results/14651e0cc43068bcc95be963bc1087a8d17224cb |     
   armeb     |   python-cryptography-39.0.2   | NOK | http://autobuild.buildroot.net/results/b599c57f7e3a8c39a1ff1f56600d48e557da1230 |     
  powerpc    |  python-pydantic-core-2.14.5   | NOK | http://autobuild.buildroot.net/results/dccba7aac905e1ef9f7d9ab269efc95a67dc4301 |     
    mips     |       strongswan-5.9.13        | NOK | http://autobuild.buildroot.net/results/141746ee36bf9ea4d3429c857144205f4f5a50ad |     
   armeb     |          stunnel-5.71          | NOK | http://autobuild.buildroot.net/results/863c9a92021f7ff680066ab5190129560da5662e |     
   s390x     |          stunnel-5.71          | NOK | http://autobuild.buildroot.net/results/49c403a07a899d6fe3d124dd0309fa63c4746185 |     
  sparc64    |          stunnel-5.71          | NOK | http://autobuild.buildroot.net/results/d0df244b6cb2f0c2bc534cfe7dd09795ceccd6f6 |     
  mips64el   |          stunnel-5.71          | NOK | http://autobuild.buildroot.net/results/c081c27dd0d7136ef4bc202cf13e16efc6f36ce6 |     
   mips64    |         sudo-1.9.15p5          | NOK | http://autobuild.buildroot.net/results/42b81b5baeb5212df29262e009d30606c5d80bfb | ORPH
powerpc64le  |        tcf-agent-1.8.0         | NOK | http://autobuild.buildroot.net/results/821049a692d4a64fa45b73e8e18eb48c36d46e6b |     
    mips     | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/fe7f591a3fdc2b529ae8cbbd3a2a8363ad0ba467 |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.net/results/8f619f628ec27b3cbc24eb329f6cd47c08e0d370 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

              open62541-v1.3.4 | 1 
                       unknown | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |        open62541-v1.3.4        | NOK | http://autobuild.buildroot.net/results/e02802594a16a12697c20b3d727c581401346fc0 | ORPH
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/38a325eb8329cd88664f02a68c0f4704f0ea07af |     


Classification of failures by reason for 2023.11.x
--------------------------------------------------

                libressl-3.8.2 | 3 
              host-rust-1.71.1 | 1 
               libglib2-2.76.1 | 1 
          linux-5.10.162-cip24 | 1 


Detail of failures for 2023.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/5e5d74802fed481780fdb945da6c3d5dfce40ac0 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/eff59dd7bc2cbe4c989d3204f04c98896f54350d |     
  mips64el   |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/6a5937934339cab13520abc109b503b1911d6d16 | ORPH
microblazeel |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/5a749be55d5e6a5f5a280d70149c4649c2cc4a91 | ORPH
   nios2     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/c482664ffd75bf1475c75de2918b29804bf77af9 | ORPH
   nios2     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/53f45ff90c64e6cfeba1e6af13c942a60b62dba7 | ORPH


Gitlab CI results for 2024-01-15
================================


-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
