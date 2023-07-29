Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BAFCC001DC
	for <buildroot@archiver.kernel.org>; Sat, 29 Jul 2023 05:33:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5DE2140992;
	Sat, 29 Jul 2023 05:33:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5DE2140992
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XzeLqVsw-tJf; Sat, 29 Jul 2023 05:33:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 84A3B40993;
	Sat, 29 Jul 2023 05:33:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 84A3B40993
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 179B71BF3DB
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 05:33:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B3B96818CA
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 05:33:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B3B96818CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id useuf5Lacyt6 for <buildroot@lists.busybox.net>;
 Sat, 29 Jul 2023 05:33:47 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8B6058175B
 for <buildroot@buildroot.org>; Sat, 29 Jul 2023 05:33:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B6058175B
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8E253C0002
 for <buildroot@buildroot.org>; Sat, 29 Jul 2023 05:33:43 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sat, 29 Jul 2023 05:33:43 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20230729053348.B3B96818CA@smtp1.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1690608823; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vKCLMmBnaFbdM6F7fz6OLYEPtxmXCsuSPMAZYZXw3nE=;
 b=Rbq/d+9SPwdEVVJSh5o5KYf4aStOrJxYiK3615lwlzVAM1H2V498arJ0OLi7AtpNLl4IWJ
 aOQ9Vn2LTU7tF0V486iVckldDkMBfngikFDN+hZeMReLZEWZcKVs9LpE57p7CA9hRtJm7C
 meOoXEO90MFz0uZz+9tDMSGkB36RglBpZ0Kxw0sRyxVC28OCac8Mg4WTrBXa1x72hAxuzX
 wdTcJ/kIxgPrjmXgZ/uvC9Yv9E5gBHraSK/U93G3v5nA5jp4JonlgtszGgcxf0zusoCuQl
 Hs/iKDQFuUunJgU3qrl0pc4J7877aUJjiF1LwiFtOZteFbf4xJ0Nh7ZOB5iqjQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Rbq/d+9S
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-07-28
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

Autobuild statistics for 2023-07-28
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  2  |  3  |  0  |  5  |
  2023.05.x  |  5  |  2  |  0  |  7  |
    master   | 78  | 70  |  0  | 148 |

Classification of failures by reason for master
-----------------------------------------------

                   gupnp-1.4.3 | 7 
                       unknown | 5 
         host-sentry-cli-2.8.0 | 3 
                  acpid-2.0.34 | 2 
  gobject-introspection-1.74.0 | 2 
                haveged-1.9.18 | 2 
            host-binutils-2.38 | 2 
            host-binutils-2.39 | 2 
                host-go-1.20.6 | 2 
                   linux-6.4.7 | 2 
              open62541-v1.3.4 | 2 
    python-cryptography-39.0.2 | 2 
                    sdl-1.2.15 | 2 
                xenomai-3.0.10 | 2 
android-tools-4.2.2+git2013... | 1 
                  cairo-1.16.0 | 1 
                  check-0.15.2 | 1 
                 coreutils-9.3 | 1 
                elfutils-0.189 | 1 
             f2fs-tools-1.16.0 | 1 
              fluent-bit-2.1.7 | 1 
glibc-2.37-2-g9f8513dc64119... | 1 
                gnu-efi-3.0.15 | 1 
            host-binutils-2.40 | 1 
             host-ccache-4.8.2 | 1 
          host-fakeroot-1.32.1 | 1 
host-gdb-arc-2020.09-releas... | 1 
              host-rust-1.71.0 | 1 
                libglvnd-1.4.0 | 1 
              libopenssl-3.0.9 | 1 
                 libpng-1.6.40 | 1 
                  libunistring | 1 
                   linux-6.4.6 | 1 
              liquid-dsp-1.4.0 | 1 
                     lxc-5.0.2 | 1 
                     mtd-2.1.5 | 1 
                    musl-1.2.4 | 1 
                       netsurf | 1 
                   perl-5.36.1 | 1 
                     pound-4.8 | 1 
                          proj | 1 
                  reaver-1.6.6 | 1 
             stress-ng-0.15.07 | 1 
             util-linux-2.39.1 | 1 
               valgrind-3.21.0 | 1 
                 wolfssl-5.6.3 | 1 
               xfsprogs-5.14.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          acpid-2.0.34          | NOK | http://autobuild.buildroot.net/results/4a2abf09629cc508aa568fcc9e1170b30fde6afd | ORPH
  mips64el   |          acpid-2.0.34          | NOK | http://autobuild.buildroot.net/results/0624f2a5771bd9652f99eee24696c34593098596 | ORPH
powerpc64le  | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/a6715fccc79c4e9ee22c608a9db62e74f814cc96 |     
   xtensa    |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/d8af612a11665100d40b0035dda48b22630b48f2 |     
   xtensa    |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/0b869139d78b9beca85a08a879466cf7cc919da1 | ORPH
    sh4      |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/b772d0da23f7829872e0bd75b8a3f56e34faabef | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/7cfc3b651acf774672e6ebb6432d2b3fe23eb2d0 | ORPH
  aarch64    |       f2fs-tools-1.16.0        | NOK | http://autobuild.buildroot.net/results/35d410f22e75d9ea4637098e1ebb356d6884d6c7 |     
   s390x     |        fluent-bit-2.1.7        | NOK | http://autobuild.buildroot.net/results/d638390da721eb3bdfcc7a4229114b492aaead99 |     
  powerpc    | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/2006c000ffe48f5721391eec77cad9d1eed0ae5f |     
  mips64el   |         gnu-efi-3.0.15         | NOK | http://autobuild.buildroot.net/results/4ce5ed5145f9b5fa9314c3418cca1ad0b47a6589 |     
   s390x     |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/9130deb31fc694b1c270e47c9c6da6f86157a9d4 | ORPH
   armeb     |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/2bbcabac29331d88fcc3231959691fc86d25710b | ORPH
    mips     |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/43c5a07d28eccc67d08322aade820156fcd6651a |     
  aarch64    |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/a09e27aa5d6f0575230f1e84eb454c92a6717348 |     
microblazeel |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/fb75f9ab7b0fdd0f5a18b1a59e8ec9295ad5cd19 |     
   mips64    |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/8fb8b5b04f2270c92ca328a2bb582109995985db |     
    arm      |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/0633e7d17fc5e73868ccb3a6f47ce8f9b0db51db |     
   x86_64    |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/a62748dd02875ffe80111a8d662d8183b4e97862 |     
   x86_64    |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/c7c2108af764c0f2b5af205fd1ccb10a451b49f2 |     
   arceb     |         haveged-1.9.18         | NOK | http://autobuild.buildroot.net/results/64e798b8b73f83e19e49c4d340745196c4f40e77 |     
   arceb     |         haveged-1.9.18         | NOK | http://autobuild.buildroot.net/results/26d51b0077fd70b0dd15e82c66765bdb8d2aed22 |     
   mipsel    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/51ac910b7c95b75c222ec5bf544254678fc840ff |     
   sparc     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/1329528b5c938f4531f65bc9600ca3379f699098 |     
   armeb     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/169f48488c40b309125857406a65064c19eba998 |     
   mipsel    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/17e05d6c714bd06aa299dd101bb2492e5472c97f |     
 aarch64_be  |       host-binutils-2.40       | NOK | http://autobuild.buildroot.net/results/8826e0d6bde8cf3c55ce4e302d502632c1b1feb5 |     
  powerpc    |       host-ccache-4.8.2        | NOK | http://autobuild.buildroot.net/results/62e9b74e036e8a4d8f494d970192bf484d640cf5 | ORPH
    arm      |      host-fakeroot-1.32.1      | NOK | http://autobuild.buildroot.net/results/4465badeffcd2f5c2f81a152bcdbee30e74dcf2b | ORPH
   arceb     | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/f46c1715d4d82ddbd8fccaf12d46c1fe8e98a550 | ORPH
  riscv32    |         host-go-1.20.6         | NOK | http://autobuild.buildroot.net/results/9fe4c52dd16c5471b344743fa45ca88711a16f16 |     
powerpc64le  |         host-go-1.20.6         | NOK | http://autobuild.buildroot.net/results/f676636c7dd533d620a1dff2ab80222335295fcc |     
    arm      |        host-rust-1.71.0        | NOK | http://autobuild.buildroot.net/results/18d6806cda10fdb8a62b65e0afdf0da898dae79b |     
   sparc     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/73fb575cd7744c2173fe7833872c9ca235103e83 |     
   s390x     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/e6bb095b78d9bca4e52539911a0ccae4193f24bb |     
    arc      |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/be185527e796802ab1672863f6eb1b97c07be446 |     
    i686     |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/5a002b5297eb4cbb046111aac7519fb53a01ffef | ORPH
    i586     |        libopenssl-3.0.9        | NOK | http://autobuild.buildroot.net/results/ba926fc27cf3d97274729b3ec1cadb3229bd3af3 | ORPH
  riscv64    |         libpng-1.6.40          | NOK | http://autobuild.buildroot.net/results/e180434c507c3894191ad778237d9388032b9fcb |     
   x86_64    |          libunistring          | NOK | http://autobuild.buildroot.net/results/900e7424be7d0856057228ae6ad82313d59ac3a3 |     
    sh4a     |          linux-6.4.6           | NOK | http://autobuild.buildroot.net/results/a3fc7810b91dcc9b563e6bfc93e18fbb3b62d984 | ORPH
    sh4a     |          linux-6.4.7           | NOK | http://autobuild.buildroot.net/results/664a1bc1c2a652c9c3dbca9822d99e6152dca39d | ORPH
   nios2     |          linux-6.4.7           | NOK | http://autobuild.buildroot.net/results/d97fb1988b202ccd447bb4f047f46761006516a1 | ORPH
    arm      |        liquid-dsp-1.4.0        | NOK | http://autobuild.buildroot.net/results/33d6b1ff2b2c78db6ee4c9a4768e9359ce4f2b64 |     
   s390x     |           lxc-5.0.2            | NOK | http://autobuild.buildroot.net/results/c54ff13dca77471fd88d5962a1a5de0b250aa8fc |     
  riscv64    |           mtd-2.1.5            | NOK | http://autobuild.buildroot.net/results/f128e1172b4602fc88256563e5165c5b572ec620 | ORPH
  powerpc    |           musl-1.2.4           | NOK | http://autobuild.buildroot.net/results/f4e7d00a0335b5a483a28d3937256ad6700ba7d4 |     
    or1k     |            netsurf             | NOK | http://autobuild.buildroot.net/results/51857bf32dca0e08ebf999a0b41412d8b998c3e0 |     
   x86_64    |        open62541-v1.3.4        | NOK | http://autobuild.buildroot.net/results/629eb46d60b614c7dd45df2369171ffd0030b3bd | ORPH
   x86_64    |        open62541-v1.3.4        | NOK | http://autobuild.buildroot.net/results/11d83d1c13fa7faec55d8a1aac3544629126f6bf | ORPH
   arceb     |          perl-5.36.1           | NOK | http://autobuild.buildroot.net/results/aee08b7e91adddedae59f6c84671472044acfcca |     
  aarch64    |           pound-4.8            | NOK | http://autobuild.buildroot.net/results/3b4e5c2fc70f6f16cd91cd8e41cdeaca6407d43e | ORPH
 microblaze  |              proj              | NOK | http://autobuild.buildroot.net/results/d99308bbe716a339ab28c79cd80578eacebe65db |     
   armeb     |   python-cryptography-39.0.2   | NOK | http://autobuild.buildroot.net/results/9bcb590163b94b809667ad4b1eb70b01f2cecc6e |     
    mips     |   python-cryptography-39.0.2   | NOK | http://autobuild.buildroot.net/results/3eed9f12925fc7fdda5ea1afa3ac87165d60bcb2 |     
   arceb     |          reaver-1.6.6          | NOK | http://autobuild.buildroot.net/results/850929e84ecd53f47779d8cbd7cb1b79d9259ad6 |     
    sh4a     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/ec69ff0bcf65ed960a510c343f0715dddc4d9667 | ORPH
    sh4a     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/1ee7b62f9fc4f5683a6f285ec050d8856b5abd89 | ORPH
   x86_64    |       stress-ng-0.15.07        | NOK | http://autobuild.buildroot.net/results/9ec007d275e973e660cfa8940c7d516d85501eb6 |     
    i586     |            unknown             | NOK | http://autobuild.buildroot.net/results/2722cbcc5c49055fcffedf3575b2138ce52e42b8 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/77183517ffb1026b6f4acf5ef6a851efaac244fa |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/d71e6164ea17a41ce5cecb2d7d85604c5bdb4434 |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/43f18fa066170e23f1862506ebb762ad9056bc65 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/8113ca3832f4b0ceebec3615c9a3ada8625319d6 |     
    i686     |       util-linux-2.39.1        | NOK | http://autobuild.buildroot.net/results/9119e93dcbf83b2fc85d640ef6f5544753e5edfc | ORPH
  powerpc    |        valgrind-3.21.0         | NOK | http://autobuild.buildroot.net/results/7959c9742b47bbd7ca1eda3580e23f104e979370 | ORPH
   mipsel    |         wolfssl-5.6.3          | NOK | http://autobuild.buildroot.net/results/c69d64828f335350d73b9e5ffd92ba46a262370a |     
 powerpc64   |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/a3e39ff9bde9415b67458f46048a62045bf06746 |     
   arceb     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/7a041ff80233b70b6d02084fe187bb43e54f1dfc |     
  mips64el   |        xfsprogs-5.14.2         | NOK | http://autobuild.buildroot.net/results/428b6133f4203d32932d19fdfc932684cd44aa5e | ORPH


Classification of failures by reason for 2023.02.x
--------------------------------------------------

glibc-2.36-81-g4f4d7a13edfd... | 1 
               libglib2-2.72.3 | 1 
           v4l2loopback-0.12.7 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/58f52334d2e6a3ab914a0f97036b03a53481d646 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/312afdbf3c987a41ed1c5be3c447fc3071b5eecc |     
 powerpc64   |      v4l2loopback-0.12.7       | NOK | http://autobuild.buildroot.net/results/a12357087acc61b23660ebe97aedcc145daccc48 |     


Classification of failures by reason for 2023.05.x
--------------------------------------------------

              hyperfine-1.14.0 | 1 
        ltp-testsuite-20230127 | 1 


Detail of failures for 2023.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |        hyperfine-1.14.0        | NOK | http://autobuild.buildroot.net/results/2b7276e5ffdb77a4514102ab56166ad7e41312a3 | ORPH
  sparc64    |     ltp-testsuite-20230127     | NOK | http://autobuild.buildroot.net/results/f8a2b5be3beeb8255940ec80a8f2a512a054bc19 |     


Gitlab CI results for 2023-07-28
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
       acmesystems_aria_g25_128mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749555887  |      
             amarula_vyasa_rk3288 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749555892  |      
               asus_tinker_rk3288 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749555930  |      
   atmel_sama5d2_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749555949  |      
                bananapi_m2_ultra | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749555991  |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556001  | ORPH 
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556055  |      
           freescale_imx6qsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556074  |      
              freescale_imx8mmevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556081  |      
              freescale_imx8mnevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556084  |      
              freescale_imx8mpevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556085  |      
              freescale_imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556086  |      
              freescale_imx8qmmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556087  |      
             freescale_imx8qxpmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556088  |      
                 hifive_unleashed | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556098  |      
                 imx6-sabresd_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556102  |      
                       imx8mmpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556114  |      
                imx8mn_bsh_smm_s2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556116  |      
            imx8mn_bsh_smm_s2_pro | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556119  |      
                        imx8mpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556122  |      
                        imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556123  |      
                kontron_bl_imx8mm | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556125  |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556126  |      
              kontron_smarc_sal28 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556128  |      
                    licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556136  |      
               linksprite_pcduino | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556137  |      
                       ls1028ardb | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556139  |      
                            nezha | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556169  |      
                       nitrogen8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556175  |      
                      nitrogen8mm | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556176  |      
                      nitrogen8mn | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556177  |      
                      nitrogen8mp | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556178  |      
              octavo_osd32mp1_brk | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556181  |      
              octavo_osd32mp1_red | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556184  |      
        olimex_a10_olinuxino_lime | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556195  |      
             olimex_a13_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556199  |      
        olimex_a20_olinuxino_lime | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556204  |      
       olimex_a20_olinuxino_lime2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556201  |      
       olimex_a20_olinuxino_micro | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556206  |      
             olimex_a33_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556207  |      
             olimex_a64_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556208  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556221  |      
                     orangepi_one | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556224  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556225  |      
                 orangepi_pc_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556227  |      
                    orangepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556229  |      
               orangepi_zero_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556231  |      
              orangepi_zero_plus2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556230  |      
                   pc_x86_64_bios | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556234  |      
                    pc_x86_64_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556235  |      
             qemu_arm_vexpress_tz | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556249  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556310  | ORPH 
                 sipeed_lichee_rv | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556346  |      
            sipeed_lichee_rv_dock | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556347  |      
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556361  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556366  |      
                    versal_vck190 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556395  |      
                zynqmp_kria_kv260 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556414  |      
                    zynqmp_zcu102 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556417  |      
                    zynqmp_zcu106 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556420  |      


Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
        TestDockerCompose | https://gitlab.com/buildroot.org/buildroot/-/jobs/4725186390  | ORPH 
         TestGrubX8664EFI | https://gitlab.com/buildroot.org/buildroot/-/jobs/4725186190  | ORPH 
          TestGrubi386EFI | https://gitlab.com/buildroot.org/buildroot/-/jobs/4725186198  | ORPH 
      TestIso9660Grub2EFI | https://gitlab.com/buildroot.org/buildroot/-/jobs/4725186306  | ORPH 
   TestIso9660Grub2Hybrid | https://gitlab.com/buildroot.org/buildroot/-/jobs/4725186317  | ORPH 
                 TestLuvi | https://gitlab.com/buildroot.org/buildroot/-/jobs/4725186517  | ORPH 
               TestMender | https://gitlab.com/buildroot.org/buildroot/-/jobs/4725186525  | ORPH 
           TestNoTimezone | https://gitlab.com/buildroot.org/buildroot/-/jobs/4725186250  | ORPH 
                  TestOci | https://gitlab.com/buildroot.org/buildroot/-/jobs/4725186333  | ORPH 
   TestSELinuxSystemdExt4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4725186368  | ORPH 
...SELinuxSystemdSquashfs | https://gitlab.com/buildroot.org/buildroot/-/jobs/4725186370  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
