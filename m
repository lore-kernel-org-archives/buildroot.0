Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B643CC4167D
	for <buildroot@archiver.kernel.org>; Thu,  2 Nov 2023 06:50:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 461A284E63;
	Thu,  2 Nov 2023 06:50:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 461A284E63
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GMx2bfgsv1e5; Thu,  2 Nov 2023 06:50:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8565984E86;
	Thu,  2 Nov 2023 06:50:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8565984E86
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 381631BF489
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 06:50:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E16EE84E69
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 06:50:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E16EE84E69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mc7Z9YUXNVOj for <buildroot@lists.busybox.net>;
 Thu,  2 Nov 2023 06:50:32 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CC3EA84E63
 for <buildroot@buildroot.org>; Thu,  2 Nov 2023 06:50:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC3EA84E63
Received: by mail.gandi.net (Postfix) with ESMTPSA id 30FCA40003
 for <buildroot@buildroot.org>; Thu,  2 Nov 2023 06:50:30 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Thu, 02 Nov 2023 06:50:30 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20231102065036.E16EE84E69@smtp1.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1698907830; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=mjydp+uP37z4PmyaMI1yCBX01ltg4k5F0qOqHTgIytk=;
 b=NNf85UrwQmpir/iAWU9rGAlOMkQlCQf3tZIYUUY4ENMqQ4/oM0yqPJRWgFc2IFZqhXf+N8
 0P9o6xsAem0+EkpG0iDzgHGz1pkdFNsR4gXg1X40kVuLxZxk0okDYL5RNld7aVloztUOOo
 /QWu2zhusL9qkjbealIRe2gUbXVMihxC2+QdVn00isCQgeSS4RnWKjwNGclDiGy3HHT6rg
 WRL/kxk47osN3cLei3IsRhrHXG5b//vAlbzQ2aL5m7ZRGVWKAtBz4iGCBNskk4M8U6sKVk
 tY6QMp2mK9XdRL9AX6inUwH8QwrYVZ8T9hV4VtuHQSqzoudXgI8q+pMtiJLOzw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NNf85Urw
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-11-01
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

Autobuild statistics for 2023-11-01
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  | 12  | 11  |  1  | 24  |
  2023.08.x  | 21  | 12  |  0  | 33  |
    master   | 51  | 58  |  0  | 109 |

Classification of failures by reason for master
-----------------------------------------------

                 openrc-0.43.3 | 5 
                       unknown | 5 
  gobject-introspection-1.76.1 | 4 
                host-go-1.21.3 | 4 
                   bird-2.0.12 | 3 
                   linux-6.5.9 | 3 
               apcupsd-3.14.14 | 2 
                flashrom-1.3.0 | 2 
                    fmt-10.1.1 | 2 
              gcc-final-12.3.0 | 2 
        host-sentry-cli-2.20.3 | 2 
                    atop-2.9.0 | 1 
             batman-adv-2023.1 | 1 
                    brltty-6.5 | 1 
                     criu-3.18 | 1 
                    crun-1.8.4 | 1 
             dahdi-linux-3.2.0 | 1 
           dmraid-1.0.0.rc16-3 | 1 
         docker-compose-2.23.0 | 1 
                elfutils-0.189 | 1 
                   ethtool-6.5 | 1 
              gcc-final-11.4.0 | 1 
google-breakpad-c85eb4a59b6... | 1 
         host-gcc-final-12.3.0 | 1 
              host-rust-1.71.1 | 1 
                  jack2-1.9.21 | 1 
               libglib2-2.76.1 | 1 
     linux-5.10.162-cip24-rt10 | 1 
linux-syscall-support-e1e7b... | 1 
pistache-3ec9d7c4f8b828fdd3... | 1 
                    pppd-2.5.0 | 1 
                     squid-6.3 | 1 
                   uhd-4.3.0.0 | 1 
             util-linux-2.39.2 | 1 
                xenomai-3.0.10 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/bc556cd0b99084fe8ae2190a772d2063deda77ac |     
   mipsel    |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/d8b5eabf22029e089f348b629397afc28e929ffc |     
    i686     |           atop-2.9.0           | NOK | http://autobuild.buildroot.net/results/768bf55cd2cc63a0a2f9222478cd6c6a592e90f7 |     
    mips     |       batman-adv-2023.1        | NOK | http://autobuild.buildroot.net/results/f43435fd22456d7093e2c3bb579a5dc998e475f4 |     
    mips     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/9751c1879917ef99d90180ffa575362772c4b700 |     
   xtensa    |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/32aa4c32341197f29fbad0d7565a3c0df7df4836 |     
    sh4      |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/4c5b22f6e79342a2716f1101fa9348c6b13e9632 |     
    i686     |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/7f99b5bfd60919397e6209559b78124fa4adcda3 |     
 aarch64_be  |           criu-3.18            | NOK | http://autobuild.buildroot.net/results/8eaa881a926d138a0bfd3f1076246088994e883f |     
 microblaze  |           crun-1.8.4           | NOK | http://autobuild.buildroot.net/results/28f5dbf81e868ede28f39801fe3d773127a11fc8 |     
    i686     |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/f851431063677a7dc837557cb3c90c7958deb135 |     
    or1k     |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/0d566ed8252c2d5409e79fff798b0d23a10e296d | ORPH
   x86_64    |     docker-compose-2.23.0      | NOK | http://autobuild.buildroot.net/results/30db9af79322b676e53e03972267461947755e5d |     
   arceb     |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/c34d3ff2396fa1cfb51714b91be4344f071ce92f | ORPH
  aarch64    |          ethtool-6.5           | NOK | http://autobuild.buildroot.net/results/19de2d68c05764bbb5db7db13139d49f2048ff89 |     
    arm      |         flashrom-1.3.0         | NOK | http://autobuild.buildroot.net/results/3d408362b4fba6a854ea6f3c89c310c245290494 |     
  aarch64    |         flashrom-1.3.0         | NOK | http://autobuild.buildroot.net/results/cafabdff9915d11193f31e3f9ee34093296243de |     
    mips     |           fmt-10.1.1           | NOK | http://autobuild.buildroot.net/results/a89b960282e5268829f2ff1e90fb1dfab89b4347 |     
  mips64el   |           fmt-10.1.1           | NOK | http://autobuild.buildroot.net/results/803728f7f1230c4be50db24f555b5a5f569802bd |     
    arm      |        gcc-final-11.4.0        | NOK | http://autobuild.buildroot.net/results/adcd5d9abc08242406837d8db1c168f67115ff30 |     
  riscv64    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/004fffbfcc5c2b09ffab857cbd0c09ae80ee3280 |     
   x86_64    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/46c5b504c32d62c602cc20ca3fc3b84d0df6191b |     
    sh4      |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/fc8cae3039d836649b238fa5b58cf71a2faa1d90 | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/e40fed4eacfdfaf04edd06d1446cbb46d5bf3e1b | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/760f72d96c262328b1808b322c94cfad23177f09 | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/f0b3b7235642b14e8acf117ea8d1e0e110ea94a8 | ORPH
   x86_64    | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/0ce0791a60df514cbe188a279a785666b23420e5 |     
   armeb     |     host-gcc-final-12.3.0      | NOK | http://autobuild.buildroot.net/results/5299391e5cd0e6deed74b3d1b9ac1a161cf27dd8 |     
   s390x     |         host-go-1.21.3         | NOK | http://autobuild.buildroot.net/results/df2f6c41cb63a0223be3672f3b50745c5b9afd9f |     
  mips64el   |         host-go-1.21.3         | NOK | http://autobuild.buildroot.net/results/119b76bf7e942052e526390606980a209cbc3457 |     
  mips64el   |         host-go-1.21.3         | NOK | http://autobuild.buildroot.net/results/44c79bd611708b4f207c7d80ad308a3ddbc667d1 |     
  mips64el   |         host-go-1.21.3         | NOK | http://autobuild.buildroot.net/results/db61744962755833ee970f6c7e463a8bfd43b60a |     
powerpc64le  |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/dfd206e90e49755eb59367448ba58d69b991cf8c |     
 aarch64_be  |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/eb050ed5bdbe4faf0f849f993cbfa9d4eb3d4dc3 |     
    i586     |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/22ed97f556646e113118172cbb87adee21467ec5 |     
    m68k     |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/063ced7abe2b1606306a44169f5cc1f10234afc0 |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/6fb8a8b6027d22100dc2181a160a5903f34243aa |     
   armeb     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/c52d83657ae1980f42510ef0d4afdb9cb3087a28 | ORPH
   mips64    |          linux-6.5.9           | NOK | http://autobuild.buildroot.net/results/3aa060f5086da3bc1fa821518b527fc21f02d5fc | ORPH
   x86_64    |          linux-6.5.9           | NOK | http://autobuild.buildroot.net/results/1c7ae6f9dc0506ade328b3a197845ccea042d482 | ORPH
   mipsel    |          linux-6.5.9           | NOK | http://autobuild.buildroot.net/results/b3b17b4ccca6e7e4e4bb4a1862d5b6c28b78fac5 | ORPH
    mips     | linux-syscall-support-e1e7b... | NOK | http://autobuild.buildroot.net/results/5237ac64560f1c846be9a3b1e03c1be3ad9e9e42 |     
  aarch64    |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/05438ed5bfbe52b8652ec954fa82c57b84de629c |     
powerpc64le  |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/37169cdcaf0d5b3e2662bdfdd2ec51ff33327db8 |     
powerpc64le  |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/0db2eed3219fe4f05a7118143b4fb8634047b7cf |     
microblazeel |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/c023912be554b5360a5bc20702d6e0c44c18d55d |     
    or1k     |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/7f12d4c1ea83291eea0286cd17870e2762d4814a |     
microblazeel | pistache-3ec9d7c4f8b828fdd3... | NOK | http://autobuild.buildroot.net/results/d3b6eb6fb943d69571a311235944df879fccc831 | ORPH
  sparc64    |           pppd-2.5.0           | NOK | http://autobuild.buildroot.net/results/706f72aced80c79a25217b79841851b9bdb5c272 |     
    arc      |           squid-6.3            | NOK | http://autobuild.buildroot.net/results/0f256bf9a75755d424b35d9517dd36930a07bb20 | ORPH
   s390x     |          uhd-4.3.0.0           | NOK | http://autobuild.buildroot.net/results/2fcf58b2ecc7cd999a87646e0c2862a82588245d |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/8e3c520bc5928db02b12fb5f7693b506c96f6bf2 |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/9293ae3a3d12b9c3a9175be5f20baffd512d2fc0 |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/902689d562d9b0a2bf6a0277132c0b72aa4ad5cc |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/001e188370e3f5f00f57298f7cec428abd8bc0eb |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/a7aea07c1efa8207a04b2b1b16c1f3cab4ff868f |     
    arc      |       util-linux-2.39.2        | NOK | http://autobuild.buildroot.net/results/b1f1f13bb6c62721e2a59a96adbc693eddfc1f0d | ORPH
   s390x     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/939cdbe36b886161f35d4f922536f2f31ec7a0e7 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                   bird-2.0.12 | 2 
  gobject-introspection-1.72.0 | 2 
                elfutils-0.186 | 1 
                   flann-1.9.2 | 1 
         gobject-introspection | 1 
            host-binutils-2.37 | 1 
         host-gcc-final-11.4.0 | 1 
     host-moby-buildkit-0.11.6 | 1 
              host-rust-1.67.1 | 1 
                       unknown | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/469a1de6c9059a8ef58fdeed0bdb99c15e0f6198 |     
   sparc     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/850b5eb3796641b0651795b9b4e224488a2ab503 |     
   arceb     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/0b276c0970a4c014a078bea6b058dd67edb2baee | ORPH
  mips64el   |          flann-1.9.2           | NOK | http://autobuild.buildroot.net/results/73116bd739037d33e8fff2e8fc074ec19b12d492 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/64a534e37cfd34b8e0b59368eecc3ce5c6bc0250 |     
  powerpc    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/78d5d59eaa867a90d9bdf363e3619cd181a4538c | ORPH
    mips     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/7fa80ee97a67d07568b3da5439c7387d89bde3e5 | ORPH
powerpc64le  |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/3f17237043b225b072efcc5ddf3f260760881fb0 |     
microblazeel |     host-gcc-final-11.4.0      | NOK | http://autobuild.buildroot.net/results/bbb0c4baa5975a9ee11c7922ea922ec84879996e |     
  aarch64    |   host-moby-buildkit-0.11.6    | NOK | http://autobuild.buildroot.net/results/821a19d595f1c44ea275865c2f3e6bda4ac04f68 |     
  aarch64    |        host-rust-1.67.1        | NOK | http://autobuild.buildroot.net/results/257bf08a53cf3bb311dda6fdce9d21a022ad6d30 |     
   sh4eb     |            unknown             | NOK | http://autobuild.buildroot.net/results/75e7725cf023b8ca4c31a0f459f5dd2a9d26a7fd |     


Classification of failures by reason for 2023.08.x
--------------------------------------------------

                       unknown | 3 
                   bird-2.0.12 | 1 
           dmraid-1.0.0.rc16-3 | 1 
                   exim-4.96.2 | 1 
                     frr-8.4.2 | 1 
glibc-2.37-45-gb4e23c75aea7... | 1 
               host-go-1.20.10 | 1 
              host-rust-1.71.1 | 1 
               libglib2-2.76.1 | 1 
                  linux-6.4.16 | 1 


Detail of failures for 2023.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/993da4e5c1481477b0bbeabb3710ed21e5e06062 |     
   mipsel    |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/71870bc2d2be8a9a0ca6c1bb2e52f3fd22a925be | ORPH
   armeb     |          exim-4.96.2           | NOK | http://autobuild.buildroot.net/results/4c69cdf93718d4c8899123840455f7fa387eb2e5 |     
   xtensa    |           frr-8.4.2            | NOK | http://autobuild.buildroot.net/results/ec5258a9e7ba9cef148f40f8962e4651bd3ee195 |     
   arceb     | glibc-2.37-45-gb4e23c75aea7... | NOK | http://autobuild.buildroot.net/results/81767fb695ac04c44bd02cb6ab184351c2749736 |     
  mips64el   |        host-go-1.20.10         | NOK | http://autobuild.buildroot.net/results/53210060783c774504e9131bb5ad7fe89f0a2f88 |     
 powerpc64   |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/b36c57319f33b8bbf0633c05d941e6ef82402f0b |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/180aa7ad0cf25ad50706f246c14d1a89f8958f01 |     
    sh4a     |          linux-6.4.16          | NOK | http://autobuild.buildroot.net/results/6df7cf591b25c6687c50109cfa165174542697d9 | ORPH
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/50247eba82099618d9763b8509f814e59273fde1 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/f038d47376dbe3ddb4bc1fc2e06737a1f3052a13 |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/d332db360780005d088c1bf0790b351d1d8f6ff3 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
