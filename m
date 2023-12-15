Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5ECDC4332F
	for <buildroot@archiver.kernel.org>; Fri, 15 Dec 2023 06:44:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 38ABB4012F;
	Fri, 15 Dec 2023 06:44:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 38ABB4012F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k8naW58DOb5D; Fri, 15 Dec 2023 06:44:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D449740143;
	Fri, 15 Dec 2023 06:44:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D449740143
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C8B671BF418
 for <buildroot@lists.busybox.net>; Fri, 15 Dec 2023 06:44:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4D95441DF7
 for <buildroot@lists.busybox.net>; Fri, 15 Dec 2023 06:44:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D95441DF7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zMJ--DGbRkAA for <buildroot@lists.busybox.net>;
 Fri, 15 Dec 2023 06:44:44 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 635DF41DA3
 for <buildroot@buildroot.org>; Fri, 15 Dec 2023 06:44:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 635DF41DA3
Received: by mail.gandi.net (Postfix) with ESMTPSA id 73430C000C
 for <buildroot@buildroot.org>; Fri, 15 Dec 2023 06:44:40 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Fri, 15 Dec 2023 06:44:40 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20231215064447.4D95441DF7@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1702622680; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=BwOcOexGZPvB9fMJhxiO8kqYOpfY5ND4lshf0SzSEX0=;
 b=RETwIawB5z81AzH4VDOtVOwAxZuG2DUnhjExBW3QeRDpVR49TtEgXD0YEejNq2KTjkpyM0
 7R1TBNE5n2YAkjxlRQ5/zAnuDT+tGYADULZrGRCv0+g1FHn/UXNHAZXHCet4IrdqZ04IBg
 YXUyjjh5SmZlkzhOOY52ZIIj0Rq7VFalMED7xXLlEXvxzf1sNzGMBfOlRBmgpZ9oh5kM9k
 KJWk6VUYli+H6ryFurmqHlUk4ET5c/H/+tIPCdVWKhy37t7vnriKTFQ1uObZJid7sSCosf
 oni7gnT5ANHQqI4kk733y761RoBs5MXRQc2UHImqgzzCkaeyo3hxpYgMS3AAwA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RETwIawB
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-12-14
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

Autobuild statistics for 2023-12-14
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  5  |  2  |  0  |  7  |
  2023.08.x  |  5  |  3  |  0  |  8  |
    master   | 50  | 35  |  0  | 85  |

Classification of failures by reason for master
-----------------------------------------------

  gobject-introspection-1.76.1 | 3 
              host-rust-1.71.1 | 3 
                   linux-6.6.3 | 3 
glibc-2.38-27-g750a45a78390... | 2 
        host-sentry-cli-2.20.3 | 2 
                       unknown | 2 
                    bat-0.23.0 | 1 
check-11970a7e112dfe243a2e6... | 1 
                   cpuload-0.3 | 1 
          cryptodev-linux-1.13 | 1 
                elfutils-0.189 | 1 
fs/jffs2/jffs2.mk:71: /home... | 1 
              libarchive-3.7.2 | 1 
                 libcurl-8.5.0 | 1 
          linux-5.10.162-cip24 | 1 
            linux-fusion-9.0.3 | 1 
        ltp-testsuite-20230929 | 1 
 Makefile:727: target-finalize | 1 
                memtest86-6.20 | 1 
                  nginx-1.24.0 | 1 
                   perl-5.36.3 | 1 
                 powertop-2.15 | 1 
           uboot-tools-2021.07 | 1 
uclibc-ng-test-0f303c63fab7... | 1 
ulog-0389d243352255f6182326... | 1 
                xenomai-3.0.10 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |           bat-0.23.0           | NOK | http://autobuild.buildroot.net/results/7ccbaef85dc41e68a72351e9c99a686ec3b88470 |     
  riscv64    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/85a521fb0fee3cc9426f8f227b6680478adbed12 | ORPH
   arceb     |          cpuload-0.3           | NOK | http://autobuild.buildroot.net/results/a1ac9fefc2d4ef46a5c238956d8c6364c3065500 |     
   nios2     |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.net/results/785a2c426c286b23f4625d5fe3c6a121ab443688 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/d8ac502bfcc309a7b52f3804db3440019fe8089a | ORPH
  riscv32    | fs/jffs2/jffs2.mk:71: /home... | NOK | http://autobuild.buildroot.net/results/5137867b103d99c02a81ff544a68168b35b4ee3e |     
  powerpc    | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/c82ed1995c1be39d9c95626299a025b1834bad0c |     
    arc      | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/a8aebf3aa16078675235b1a8a7c4b0aa393d9db2 |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/01bc8928d79a2c681a706d5daa6d0d92a82f08e2 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/d22a901624e03ec22aeb734e26aaf7ace9041d25 | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/808a372890c8b90d15f6635e5cf28ef973c1a800 | ORPH
    i686     |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/4e22c8baaf291345dce41e6ae5bd5860ffca3039 |     
   x86_64    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/593850663c0839934c8475fa1f5c98f28d0c107b |     
   s390x     |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/b2376c95507103217c8d39514ea4c7077a977890 |     
 microblaze  |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/8e2fb27e36ecf86eace12d209249ab5fa16eb6a9 |     
    arc      |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/a278a0e0d7d05e015eeff007fec738576cb43226 |     
 powerpc64   |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/3809351dd1d404d5c2617817c475c6464a688bb6 |     
  mips64el   |         libcurl-8.5.0          | NOK | http://autobuild.buildroot.net/results/dafa7e44d2bde57e549207821b5f6c0a646d10e0 |     
   nios2     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/b551046d57a6726a143d3aa423d483748f3d1b41 | ORPH
   mipsel    |          linux-6.6.3           | NOK | http://autobuild.buildroot.net/results/0a6489db6238f8fde551978deca1aa621fafc17c | ORPH
  mips64el   |          linux-6.6.3           | NOK | http://autobuild.buildroot.net/results/10dcbe1422433bc531ea1e04b61995542825ca0a | ORPH
  powerpc    |          linux-6.6.3           | NOK | http://autobuild.buildroot.net/results/f8fa79a2d0743c0b53a7d046fcae342041f6d3e0 | ORPH
 powerpc64   |       linux-fusion-9.0.3       | NOK | http://autobuild.buildroot.net/results/75ca1ed45a0792b34ff446ee6c4b056ef4be0b84 | ORPH
    i686     |     ltp-testsuite-20230929     | NOK | http://autobuild.buildroot.net/results/a1dd4e115874f74abc3704cbf37d76f6e3360297 |     
  sparc64    | Makefile:727: target-finalize  | NOK | http://autobuild.buildroot.net/results/8421775b0f8ec0452ea0051c0722f0c92e8f080b |     
   x86_64    |         memtest86-6.20         | NOK | http://autobuild.buildroot.net/results/27fef622f536530017b4546422e8ae12bb77e164 |     
    or1k     |          nginx-1.24.0          | NOK | http://autobuild.buildroot.net/results/28159f0a77882a57276d43b3a125e23fcf651fd9 |     
    i686     |          perl-5.36.3           | NOK | http://autobuild.buildroot.net/results/ac87227812774f7ab62e656088b325f33b93f048 |     
   mipsel    |         powertop-2.15          | NOK | http://autobuild.buildroot.net/results/a3a68a9a1632afa826868a6b4ada0df856500aaf |     
    or1k     |      uboot-tools-2021.07       | NOK | http://autobuild.buildroot.net/results/eaf08c1b76284a04ac1e06c71c13162e4c5b3898 | ORPH
   mips64    | uclibc-ng-test-0f303c63fab7... | NOK | http://autobuild.buildroot.net/results/82a21c816038538942574b58ecb219c678f5075b |     
   nios2     | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/8164ee2f2dd3d84f3fcc131817f91189871c5dda |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/d2b9847fe39a78380b48327d23939ad8cc051852 |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/3417d29444bf1660e12a11f1d664e1ba49378785 |     
   x86_64    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/90adb17859df8df32953b5c7a0fdc7007ecdc0ed |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                  check-0.15.2 | 1 
                  reaver-1.6.6 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/37aacd7ea06b3c7e43c4ba7362413600dcd3db34 | ORPH
    arc      |          reaver-1.6.6          | NOK | http://autobuild.buildroot.net/results/a7b778e22470c120cd143fbe0d4ace435905b54e |     


Classification of failures by reason for 2023.08.x
--------------------------------------------------

              host-rust-1.71.1 | 1 
                python3-3.11.6 | 1 
ulog-0389d243352255f6182326... | 1 


Detail of failures for 2023.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/ad8b817b4661dd378d98faa599966980f3313075 |     
   x86_64    |         python3-3.11.6         | NOK | http://autobuild.buildroot.net/results/73c8913e1829dcebb742b9456e357f2c948b1592 |     
   sh4aeb    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/a993d092bc9de9b4ccfddd039a776db4ff9f1bb9 |     


Gitlab CI results for 2023-12-14
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
       acmesystems_aria_g25_256mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887092  |      
    acmesystems_arietta_g25_256mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887108  |      
             amarula_vyasa_rk3288 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887117  |      
                   andes_ae350_45 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887123  |      
               arcturus_ucls1012a | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887131  |      
                 arcturus_ucp1020 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887135  |      
                 arm_foundationv8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887141  |      
                   armadeus_apf27 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887145  |      
                   armadeus_apf28 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887150  |      
                   armadeus_apf51 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887155  |      
                aspeed_ast2500evb | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887163  |      
                aspeed_ast2600evb | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887168  |      
             asus_tinker-s_rk3288 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887177  |      
               asus_tinker_rk3288 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887180  |      
                  at91sam9260eknf | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887184  |      
                   at91sam9g20dfc | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887188  |      
                 at91sam9g45m10ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887191  |      
                     at91sam9rlek | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887194  |      
                     at91sam9x5ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887196  |      
                 at91sam9x5ek_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887200  |      
                 at91sam9x5ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887204  |      
             at91sam9x5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887207  |      
   atmel_sama5d27_som1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887210  |      
       atmel_sama5d2_xplained_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887213  |      
   atmel_sama5d2_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887216  |      
           atmel_sama5d3_xplained | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887219  |      
       atmel_sama5d3_xplained_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887221  |      
       atmel_sama5d3_xplained_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887225  |      
                 atmel_sama5d3xek | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887229  |      
           atmel_sama5d4_xplained | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887230  |      
       atmel_sama5d4_xplained_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887231  |      
       atmel_sama5d4_xplained_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887235  |      
   atmel_sama5d4_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887238  |      
                        avenger96 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887240  |      
                bananapi_m2_berry | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887242  |      
                bananapi_m2_ultra | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887244  |      
                 bananapi_m2_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887246  |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887251  | ORPH 
                   beagleboardx15 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887255  |      
                       beaglebone | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887259  |      
                   beaglebone_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887262  |      
                     beagleboneai | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887267  |      
                          beaglev | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887269  |      
                      beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887274  |      
               broadcom_northstar | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887277  |      
                     canaan_kd233 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887279  |      
                   chromebook_elm | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887282  |      
                  chromebook_snow | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887286  |      
                             ci20 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887288  |      
                      cubieboard2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887292  |      
            engicam_imx6qdl_icore | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887296  |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887301  |      
        engicam_imx6qdl_icore_rqs | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887304  |      
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887308  |      
             engicam_imx6ul_isiot | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887310  |      
               freescale_imx28evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887312  |      
        freescale_imx6dlsabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887317  |      
          freescale_imx6dlsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887320  |      
         freescale_imx6qsabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887323  |      
           freescale_imx6qsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887326  |      
          freescale_imx6sxsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887330  |      
             freescale_imx6ullevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887332  |      
           freescale_imx7dsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887334  |      
             freescale_imx8dxlevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887335  |      
              freescale_imx8mmevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887339  |      
              freescale_imx8mnevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887342  |      
              freescale_imx8mpevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887343  |      
              freescale_imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887346  |      
              freescale_imx8qmmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887349  |      
             freescale_imx8qxpmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887352  |      
               freescale_p1025twr | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887356  | ORPH 
             freescale_t1040d4rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887357  | ORPH 
          freescale_t2080_qds_rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887359  | ORPH 
                          galileo | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887363  |      
          globalscale_espressobin | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887366  |      
                 grinn_chiliboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887368  |      
                  grinn_liteboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887371  |      
                 hifive_unleashed | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887375  |      
               icnova-a20-adb4006 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887378  |      
                         imx23evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887379  |      
                   imx6-sabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887380  |      
                     imx6-sabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887385  |      
                 imx6-sabresd_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887388  |      
                        imx6slevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887389  |      
                       imx6sx-sdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887394  |      
                        imx6ulevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887396  |      
                       imx6ullevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887398  |      
                       imx6ulpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887400  |      
                        imx7d-sdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887404  |      
                       imx8mmpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887410  |      
                imx8mn_bsh_smm_s2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887413  |      
                        imx8mpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887419  |      
                        imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887423  |      
                    imxrt1050-evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887425  |      
                kontron_bl_imx8mm | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887432  |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887435  |      
                          lafrite | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887439  |      
                         lego_ev3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887443  |      
               linksprite_pcduino | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887445  |      
                       ls1028ardb | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887449  |      
                     ls1046a-frwy | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887452  |      
                mender_x86_64_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887454  | ORPH 
          microchip_sam9x60ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887458  |      
 microchip_sama5d27_wlsom1_ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887464  |      
...hip_sama5d27_wlsom1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887467  |      
        microchip_sama5d2_icp_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887470  |      
    microchip_sama5d2_icp_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887472  |      
          microchip_sama7g5ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887474  |      
      microchip_sama7g5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887475  |      
                  minnowboard_max | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887477  |      
                          mx25pdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887480  |      
                          mx51evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887482  |      
                         mx53loco | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887485  |      
                         mx6cubox | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887486  |      
                   mx6sx_udoo_neo | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887489  |      
                      nexbox_a95x | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887494  |      
                            nezha | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887499  |      
                      nitrogen6sx | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887501  |      
                       nitrogen6x | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887504  |      
                        nitrogen7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887505  |      
                       nitrogen8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887507  |      
                      nitrogen8mm | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887508  |      
                      nitrogen8mn | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887512  |      
                      nitrogen8mp | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887514  |      
              octavo_osd32mp1_brk | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887516  |      
              octavo_osd32mp1_red | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887519  |      
                         odroidc2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887520  |      
                        odroidxu4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887522  |      
             olimex_a13_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887528  |      
        olimex_a20_olinuxino_lime | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887532  |      
       olimex_a20_olinuxino_lime2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887531  |      
       olimex_a20_olinuxino_micro | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887533  |      
             olimex_a33_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887535  |      
             olimex_a64_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887538  |      
          olimex_imx233_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887540  |      
    olimex_stmp157_olinuxino_lime | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887541  |      
                       olpc_xo175 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887543  |      
                    openblocks_a6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887546  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887547  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887555  |      
                      orangepi_r1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887564  |      
                    orangepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887568  |      
               orangepi_zero_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887573  |      
              orangepi_zero_plus2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887569  |      
                       pandaboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887579  |      
                   pc_x86_64_bios | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887585  |      
                    pc_x86_64_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887592  |      
                   pcengines_apu2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887609  |      
                           pine64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887612  |      
                  pine64_pinecube | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887618  |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887621  |      
                qemu_aarch64_ebbr | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887624  |      
                qemu_aarch64_sbsa | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887626  |      
                qemu_aarch64_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887630  |      
                    qemu_arm_ebbr | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887633  |      
               qemu_arm_versatile | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887635  |      
             qemu_arm_vexpress_tz | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887643  |      
                qemu_m68k_mcf5208 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887646  |      
                   qemu_m68k_q800 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887649  |      
            qemu_microblazebe_mmu | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887652  |      
            qemu_microblazeel_mmu | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887653  |      
              qemu_mips32r2_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887657  |      
            qemu_mips32r2el_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887660  |      
              qemu_mips32r6_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887663  |      
            qemu_mips32r6el_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887668  |      
                qemu_mips64_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887670  |      
              qemu_mips64el_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887673  |      
              qemu_mips64r6_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887675  |      
                 qemu_nios2_10m50 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887679  |      
                        qemu_or1k | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887682  |      
                 qemu_ppc64_e5500 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887683  |      
               qemu_ppc64_pseries | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887686  |      
            qemu_ppc64le_powernv8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887687  |      
             qemu_ppc64le_pseries | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887690  |      
                  qemu_ppc_bamboo | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887692  |      
                  qemu_ppc_e500mc | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887695  |      
                 qemu_ppc_g3beige | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887697  |      
                   qemu_ppc_mac99 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887700  |      
               qemu_ppc_mpc8544ds | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887706  |      
                qemu_riscv32_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887707  |      
          qemu_riscv64_nommu_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887710  |      
                qemu_riscv64_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887711  |      
                       qemu_s390x | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887714  |      
                     qemu_sh4_r2d | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887716  |      
                   qemu_sh4eb_r2d | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887718  |      
               qemu_sparc64_sun4u | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887721  |      
                         qemu_x86 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887725  |      
                      qemu_x86_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887724  |      
                 qemu_xtensa_lx60 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887729  |      
           qemu_xtensa_lx60_nommu | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887732  |      
                     raspberrypi0 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887735  | ORPH 
                    raspberrypi0w | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887738  | ORPH 
                     raspberrypi2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887742  | ORPH 
                     raspberrypi3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887747  |      
                  raspberrypi3_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887746  | ORPH 
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887748  | ORPH 
                     raspberrypi4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887755  | ORPH 
                  raspberrypi4_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887752  | ORPH 
                 raspberrypicm4io | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887765  | ORPH 
              raspberrypicm4io_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887760  | ORPH 
                raspberrypizero2w | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887771  |      
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887773  |      
                    roc_pc_rk3399 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887774  |      
                           rock5b | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887778  |      
                           rock64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887779  |      
                       rock_pi_n8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887782  |      
                        rockpro64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887786  |      
                      roseapplepi | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887789  |      
                 s6lx9_microboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887791  |      
                       sheevaplug | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887794  |      
                 sipeed_lichee_rv | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887796  |      
            sipeed_lichee_rv_dock | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887798  |      
             sipeed_licheepi_nano | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887801  |      
             sipeed_licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887804  |      
                  sipeed_maix_bit | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887806  |      
           sipeed_maix_bit_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887808  |      
                 sipeed_maix_dock | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887809  |      
          sipeed_maix_dock_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887811  |      
                   sipeed_maix_go | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887813  |      
            sipeed_maix_go_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887816  |      
                 sipeed_maixduino | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887819  |      
          sipeed_maixduino_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887822  |      
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887825  |      
                 snps_arc700_nsim | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887828  | ORPH 
              snps_archs38_axs103 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887830  |      
                snps_archs38_haps | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887832  |      
                snps_archs38_hsdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887837  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887841  |      
                solidrun_clearfog | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887845  |      
          solidrun_clearfog_gt_8k | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887848  |      
            solidrun_macchiatobin | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887851  | ORPH 
                    spike_riscv64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887853  |      
              stm32f429_disco_xip | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887855  |      
               stm32f469_disco_sd | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887860  |      
              stm32f469_disco_xip | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887862  |      
               stm32f769_disco_sd | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887864  |      
                  stm32mp157c_dk2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887870  |      
              stm32mp157c_odyssey | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887874  |      
        terasic_de10nano_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887879  |      
                      ti_am62x_sk | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887882  |      
                      ti_am64x_sk | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887890  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887896  |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887900  |      
                           ts5500 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887905  |      
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887910  |      
                         uevm5432 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887923  |      
                    versal_vck190 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887926  |      
                       visionfive | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887931  |      
                      visionfive2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887928  |      
                        wandboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887936  |      
                            warp7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887940  |      
                        warpboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887941  |      
                    zynq_microzed | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887944  |      
                       zynq_zc702 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887947  |      
                       zynq_zc706 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887951  |      
                         zynq_zed | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887953  |      
                zynqmp_kria_kr260 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887955  |      
                zynqmp_kria_kv260 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887960  |      
                    zynqmp_zcu102 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887962  |      
                    zynqmp_zcu104 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887964  |      
                    zynqmp_zcu106 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5749887972  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

