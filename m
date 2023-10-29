Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C47F3C4332F
	for <buildroot@archiver.kernel.org>; Sun, 29 Oct 2023 06:34:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 454296FC99;
	Sun, 29 Oct 2023 06:34:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 454296FC99
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dEFX9Onw0sGo; Sun, 29 Oct 2023 06:34:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B0036FCA1;
	Sun, 29 Oct 2023 06:34:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B0036FCA1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 47D151BF363
 for <buildroot@lists.busybox.net>; Sun, 29 Oct 2023 06:34:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E2AFB405C5
 for <buildroot@lists.busybox.net>; Sun, 29 Oct 2023 06:34:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E2AFB405C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lO4u6sqVrSz3 for <buildroot@lists.busybox.net>;
 Sun, 29 Oct 2023 06:34:45 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E5FE640164
 for <buildroot@buildroot.org>; Sun, 29 Oct 2023 06:34:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E5FE640164
Received: by mail.gandi.net (Postfix) with ESMTPSA id D532AFF812
 for <buildroot@buildroot.org>; Sun, 29 Oct 2023 06:34:41 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sun, 29 Oct 2023 06:34:41 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20231029063447.E2AFB405C5@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1698561281; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=4ROqOoJqtZlAorZkZ56i0YMjYY7X8EuJP3Rpw0mBHU4=;
 b=ZuwrCZkqvZ+g982yQbG2Fv7s6IFcx3Iihgyt4WSL+8kjHDTLuVW/rUU72BYHeP9+hGUjXX
 vqSh9KXhsdqmKRS/hjgH+Zf9fot3+eGxOSczDW4CDETmNKrIlFDj1CiCI8zgoaRnwkEjG7
 r1RVOdIkz7CWpNywS9Cc65RcNDFLeqkb1N2nST5TZGQKrbhQg0XSpb6I9q1nrrCHh9xgmR
 GjX1LVHU1qs+hgFaVl6sNDrsUQ/6K70zLNanEDwSLAthcfMYmNc50ZxA7XrICYmbpMDvnS
 /8IhNc182FQSaeyXh0Mj168RBVsZ448WUcYBYdi9/Z4lgL5MOqI1t4tFeowcDg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZuwrCZkq
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-10-28
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

Autobuild statistics for 2023-10-28
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  | 17  |  6  |  0  | 23  |
  2023.08.x  | 15  |  6  |  0  | 21  |
    master   | 39  | 82  |  0  | 121 |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 8 
                 openrc-0.43.3 | 7 
                   bird-2.0.12 | 6 
              gcc-final-12.3.0 | 5 
                   linux-6.5.8 | 4 
         spirv-tools-1.3.261.1 | 4 
              host-rust-1.71.1 | 3 
               linux-pam-1.5.3 | 3 
              liquid-dsp-1.5.0 | 3 
              gcc-final-11.4.0 | 2 
        host-sentry-cli-2.20.3 | 2 
              libarchive-3.7.2 | 2 
               libglib2-2.76.1 | 2 
                  monit-5.33.0 | 2 
                  motion-4.5.1 | 2 
                nushell-0.85.0 | 2 
                 samba4-4.19.1 | 2 
               apcupsd-3.14.14 | 1 
           at-spi2-core-2.48.3 | 1 
check-11970a7e112dfe243a2e6... | 1 
          cryptodev-linux-1.13 | 1 
         docker-compose-2.23.0 | 1 
                elfutils-0.189 | 1 
              fftw-quad-3.3.10 | 1 
glibc-2.38-27-g750a45a78390... | 1 
  gobject-introspection-1.76.1 | 1 
                    grub2-2.06 | 1 
                host-go-1.21.3 | 1 
              irqbalance-1.9.0 | 1 
            libmemcached-1.1.4 | 1 
                libselinux-3.5 | 1 
          linux-5.10.162-cip24 | 1 
ltrace-82c66409c7a93ca6ad2e... | 1 
                mongodb-4.2.18 | 1 
   openvmtools-11.3.5-18557794 | 1 
                    pppd-2.5.0 | 1 
                    ruby-3.1.3 | 1 
       spirv-headers-1.3.261.1 | 1 
               trace-cmd-2.9.7 | 1 
                xenomai-3.0.10 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/9c4637cbcb0ad25f2bd7bffbff6cdf4565bdc3d6 |     
   mipsel    |      at-spi2-core-2.48.3       | NOK | http://autobuild.buildroot.net/results/1c96b1bcd4edcd0d726c5cff1cabbaa514d7e536 |     
   x86_64    |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/a98c671e42241c2cc6393f794293592142d5ff8b |     
   sh4aeb    |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/17beebb3e156af16bfab49a195025d5f7590d00b |     
   x86_64    |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/82b1b07eef6fed903e62d149d4ae837160b67e93 |     
    i686     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/22e9388ee77c89066833b84f17ade6ed68e10fb0 |     
   mips64    |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/b356e0be3a526eb8e24503ecbf318cb2a27e2366 |     
   mipsel    |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/dce8459f911d9ca1e358048890b6b7b968263b3c |     
    arc      | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/26f55f56326534529f6cf91c12f08cc1651d1b77 | ORPH
   mipsel    |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.net/results/2ae20e4d0465e8899aae777e0c64aebe318d38f5 | ORPH
   x86_64    |     docker-compose-2.23.0      | NOK | http://autobuild.buildroot.net/results/58ea41d912513fe371a43b53198e0b476d2b4ede |     
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/4cc4d624581beb5cd15862ce7b2794eb66e236c4 | ORPH
powerpc64le  |        fftw-quad-3.3.10        | NOK | http://autobuild.buildroot.net/results/ba79decc92e7c017e6083d2efa3790e2ef6c6ba1 | ORPH
    or1k     |        gcc-final-11.4.0        | NOK | http://autobuild.buildroot.net/results/c91db3a6f039836a86db6a4eda1b52c1bd521925 |     
  riscv64    |        gcc-final-11.4.0        | NOK | http://autobuild.buildroot.net/results/d62ff2f6e83c81e4b204488d3ae6fb1a72e2173c |     
  riscv64    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/8ecc437bb4c2df9b40710f1222c9f817f7c9e433 |     
  riscv64    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/30523b9e26bcc49a5888e75445534231ae56a453 |     
  riscv64    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/390d2255731f7723fc7d9f5f13f6ffb7ccb229d1 |     
  riscv64    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/bb4bafcf1ad8d13b5769ace3fcf25a20ae278ef6 |     
    m68k     |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/84e2982489c5eb47d8d3b4c056a0c72d3da561ce |     
  powerpc    | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/a74cfadddc2adea37a234ff9f827dfabbc1ff4ae |     
    i686     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/70e8fef490eca118e9a94ec483450bda4d7104d9 | ORPH
    arm      |           grub2-2.06           | NOK | http://autobuild.buildroot.net/results/8fd74ec7aae3e9b5602644744012c8e5e94c16a4 |     
   mips64    |         host-go-1.21.3         | NOK | http://autobuild.buildroot.net/results/dd890e1befbeba5faf5b0cf80e737fb64c26413b |     
   mipsel    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/9e7b2add9bb3d9c41933b2fc125f10be8962e050 |     
   armeb     |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/46593270ea6eb53661cd141615ea9cfe36bb35d3 |     
  aarch64    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/707909455c2fb5637fdc0783a44d21ab69093d1b |     
   sh4eb     |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/0e75dd926d4b0c8a5e7e99b760f4f80fb76b2458 |     
 microblaze  |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/8b8ba5288fe3da81859f53eb8474aec558d36358 |     
   sparc     |        irqbalance-1.9.0        | NOK | http://autobuild.buildroot.net/results/da78821f5e12147df8ee1fb4cfd7f0c2042211da |     
powerpc64le  |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/07fe8422d228140f432f0963875ce53fd48bd62c |     
  riscv64    |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/82029895ea856f221a26a2bcd5fde5ccb191cda5 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/0468f506839aa1a26864539d658a0743d9333482 |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/6bba844865c32bf8c709053e2be3a821a8b50f35 |     
    arc      |       libmemcached-1.1.4       | NOK | http://autobuild.buildroot.net/results/00d54363bf812c07a42bfb4eb0f4e4b2c6bb9003 | ORPH
 microblaze  |         libselinux-3.5         | NOK | http://autobuild.buildroot.net/results/1479e3fb29879b741334dd9e2a49ae0132d1fd13 |     
powerpc64le  |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/a4293c5b7e81eae07c40a4c369fa59c951bc39c9 | ORPH
   mipsel    |          linux-6.5.8           | NOK | http://autobuild.buildroot.net/results/569f5dd8ca0d4d392aa9acf53ad58ce6d58d7611 | ORPH
    arm      |          linux-6.5.8           | NOK | http://autobuild.buildroot.net/results/665b4ad4b2f9a0b738f649c31815db1f55c06f6c | ORPH
microblazeel |          linux-6.5.8           | NOK | http://autobuild.buildroot.net/results/72f1981fd13182dbec86d1b8f9a6ed5e3abf1ba6 | ORPH
    mips     |          linux-6.5.8           | NOK | http://autobuild.buildroot.net/results/da8794715cf1d37c2abb4f7f1ab484ab8b6f926e | ORPH
   sparc     |        linux-pam-1.5.3         | NOK | http://autobuild.buildroot.net/results/a0b8c3a287c4b420ab937d8c92e8130453bd46c4 | ORPH
   sparc     |        linux-pam-1.5.3         | NOK | http://autobuild.buildroot.net/results/73e34c461f9c8e162584f0256f0a41df5cbea670 | ORPH
    arm      |        linux-pam-1.5.3         | NOK | http://autobuild.buildroot.net/results/bc0c77108a529b913dbecbd4baf97b8721a17028 | ORPH
    arm      |        liquid-dsp-1.5.0        | NOK | http://autobuild.buildroot.net/results/cf5ec48d468834d59ef5d0b1067d34af3a061969 |     
    i686     |        liquid-dsp-1.5.0        | NOK | http://autobuild.buildroot.net/results/852a4121dff6b660fe0e9383ef8f971678a4d7a7 |     
   x86_64    |        liquid-dsp-1.5.0        | NOK | http://autobuild.buildroot.net/results/11555089361d53f9734028c8781078ca1055e6ff |     
   x86_64    | ltrace-82c66409c7a93ca6ad2e... | NOK | http://autobuild.buildroot.net/results/fab58a9d13238dee7f3069029cf3beee737b6842 | ORPH
   x86_64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/f1ec704978ce7352890342f2babc6e39573c2fbd |     
   arceb     |          monit-5.33.0          | NOK | http://autobuild.buildroot.net/results/d29dc251b41d2e83dc7e7b1c2a198ec744a8b5e1 |     
   sparc     |          monit-5.33.0          | NOK | http://autobuild.buildroot.net/results/72448be2c6ebb10a3dde20e84c75a18360e51411 |     
   s390x     |          motion-4.5.1          | NOK | http://autobuild.buildroot.net/results/371f3cbc97ac7b31aedd03c1d25d377568eca6c1 |     
  powerpc    |          motion-4.5.1          | NOK | http://autobuild.buildroot.net/results/859764c490059ffee1da298e0e7f4df6502296c4 |     
  sparc64    |         nushell-0.85.0         | NOK | http://autobuild.buildroot.net/results/3fb882629cb1f36adab6e59f65a1ef17b0cb4fef |     
    mips     |         nushell-0.85.0         | NOK | http://autobuild.buildroot.net/results/ca8fbbbd4d68f345b885599856ecdf3a04b9f66d |     
   nios2     |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/c9ade5e9367237ce2de9e3cd7810131f067fa82a |     
 powerpc64   |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/9c8c090aa0557f83d8951b3edd9b9dcec19f132a |     
powerpc64le  |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/ce607fb7cb6b22a00637e9cc08845b0388222a7e |     
  sparc64    |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/b01b3071a7e497314beabaf436a14c16a7eaa137 |     
    arm      |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/a29e90b90f213baa2b6dc7ed99eea8937f50f124 |     
   x86_64    |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/a4afe60719bf08a7dc4edcb2c6acf790a87350ba |     
   mips64    |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/21290b5c8ceb8b0ea9c5a12921f2952368ab10de |     
   x86_64    |  openvmtools-11.3.5-18557794   | NOK | http://autobuild.buildroot.net/results/875b1df22d28f7458102fa6d9ec0895fe24932a2 |     
  sparc64    |           pppd-2.5.0           | NOK | http://autobuild.buildroot.net/results/83146b60ee7cb7ba01f11f1249c1d8bcbb8617fa |     
    arc      |           ruby-3.1.3           | NOK | http://autobuild.buildroot.net/results/a3b07ce03d1ad923f4f6d6214ddc1a4861d11fd0 |     
    or1k     |         samba4-4.19.1          | NOK | http://autobuild.buildroot.net/results/230d94fcfb237016cf010b2e91f9e33c8f64582e |     
    arm      |         samba4-4.19.1          | NOK | http://autobuild.buildroot.net/results/d11e9a06079acd73f1bd267d7cdceb348aa0f091 |     
   xtensa    |    spirv-headers-1.3.261.1     | NOK | http://autobuild.buildroot.net/results/4b94edf6dee03e74ff53939aa228069cc6ba4292 |     
  riscv32    |     spirv-tools-1.3.261.1      | NOK | http://autobuild.buildroot.net/results/41321c99ef42448320e5ca8d19e797cb5355d51c | ORPH
   armeb     |     spirv-tools-1.3.261.1      | NOK | http://autobuild.buildroot.net/results/5fe759a566a2475171c33cfd077a55c669fb2b27 | ORPH
  sparc64    |     spirv-tools-1.3.261.1      | NOK | http://autobuild.buildroot.net/results/f44be881a988fe9f90b713b2cec5fe7fbd91315e | ORPH
  sparc64    |     spirv-tools-1.3.261.1      | NOK | http://autobuild.buildroot.net/results/5f8989964f94ded7b2255e1f4ca94e0cf242b0c2 | ORPH
    sh4a     |        trace-cmd-2.9.7         | NOK | http://autobuild.buildroot.net/results/e5fb39324d4d99c9aec39d686fda9e1e18e6750e |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/aa4e142e0883faa24b7191618bd7e285f817c508 |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/05b4f63a6e0cb7c731129ff86699ce079e3f072c |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.net/results/ddfe0f287e52f3c84a9052dc0b1427be4de5bcbe |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/6e51cd25fccf6a7a55316e8722377195c115c2b1 |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.net/results/2aa60e5c53087f7423cb3f1677b71a805506e2fb |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/4c2d95e9edfc9ce4506bd97116134ada2f3db5ec |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/24589bd70ca57c0db2651b02d0d8afa3998c2ede |     
   armeb     |            unknown             | NOK | http://autobuild.buildroot.net/results/dcb5ff5b40b3363a4afc5444a812f246a0ba7b8f |     
   sh4eb     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/55f863811798dcf9052ecb0cbaec95e5fa3f1d33 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                elfutils-0.186 | 2 
              host-rust-1.67.1 | 2 
                libxml2-2.10.4 | 1 
                       unknown | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/2f1f230b82cd6725451b874107cebf37b0f41954 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/6b23a1e25bafbf844ba1a772e7fed3b8182a0047 | ORPH
  aarch64    |        host-rust-1.67.1        | NOK | http://autobuild.buildroot.net/results/532d67a98e051041d415fe19d8760129d8ecb653 |     
   mipsel    |        host-rust-1.67.1        | NOK | http://autobuild.buildroot.net/results/ecdebc67bf128583035d1f928692a9e354f7863a |     
   armeb     |         libxml2-2.10.4         | NOK | http://autobuild.buildroot.net/results/43c5cde010b6925a41d21af59d8ba7173bc12d6b |     
   sh4aeb    |            unknown             | NOK | http://autobuild.buildroot.net/results/e2a7e003beafcedb994996c808fab9e56a2d6261 |     


Classification of failures by reason for 2023.08.x
--------------------------------------------------

               libglib2-2.76.1 | 2 
               host-go-1.20.10 | 1 
               trace-cmd-2.9.7 | 1 
                       unknown | 1 
                xenomai-3.0.10 | 1 


Detail of failures for 2023.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |        host-go-1.20.10         | NOK | http://autobuild.buildroot.net/results/d092f1c786c563a6a53f257c32314e01169ef031 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/e306f52dfa9032bafa0bfccab02df08095f42050 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/13c5b3e0de5dc4b95999ef16a1a1fd92c0179160 |     
    arm      |        trace-cmd-2.9.7         | NOK | http://autobuild.buildroot.net/results/a9c77463a107f69d6da5813269616f9bbe9f06e1 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/7a1bdc79893b016b7ad98bdece320566e462215e |     
 aarch64_be  |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/3f8cb5b436d66fa61c661a03d86c56315b739431 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
