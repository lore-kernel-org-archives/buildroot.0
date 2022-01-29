Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 429D5C433F5
	for <buildroot@archiver.kernel.org>; Sat, 29 Jan 2022 07:08:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AC1EC400AF;
	Sat, 29 Jan 2022 07:08:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NKDzqAdhcSNt; Sat, 29 Jan 2022 07:08:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D7CC040217;
	Sat, 29 Jan 2022 07:08:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7FD521BF2F8
 for <buildroot@lists.busybox.net>; Sat, 29 Jan 2022 07:08:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7886340217
 for <buildroot@lists.busybox.net>; Sat, 29 Jan 2022 07:08:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZZxTJC9OMQvZ for <buildroot@lists.busybox.net>;
 Sat, 29 Jan 2022 07:08:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C16C9400AF
 for <buildroot@buildroot.org>; Sat, 29 Jan 2022 07:08:18 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7042B240010
 for <buildroot@buildroot.org>; Sat, 29 Jan 2022 07:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1643440095; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=P3IMprXgIXhUj1c/ASOw1PKUZuuhUVMq7ZQL2vZcJ/Y=;
 b=mnCELVy8aXKjY7Hic93+ahvMBscQpZRswUv9xzKsSlZ2OHdqfZ28tYShZu3MoXurD7Zg4d
 o98uoVkSPhx/Sljthq3/DzF2ZYPsFggAziskI7NcAjEsMJumaiuMZEMBY/YPsF95lJVkSU
 V4Ep6pd9GHmwMyJs0OgvVPJ+6K7xtQ8k0FUHDAfL1v5TXjW8ixOKdiaR567jeqKCK5zJaK
 VojomLqxIrj1DA0lcWe4dstMrDbdX6WLBDurSKFuNxEKouqVDOMZDwvA6XNyjjtWdrAG53
 5Dxu/hYO0grP219V4JZBvB4ppQZmip496Lvp8aDEUR5/qH+Y6RsVTwNNnlKZhQ==
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sat, 29 Jan 2022 07:08:15 -0000
Message-Id: <20220129070821.7886340217@smtp2.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-01-28
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

Autobuild statistics for 2022-01-28
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 56  |  3  |  0  | 59  |
  2021.11.x  | 24  |  3  |  0  | 27  |
    master   | 95  | 43  |  0  | 138 |

Classification of failures by reason for master
-----------------------------------------------

                  rygel-0.40.2 | 8 
                    efl-1.26.0 | 3 
                   guile-3.0.7 | 3 
               pulseview-0.4.2 | 3 
                 wavemon-0.9.4 | 3 
                  xvisor-0.3.1 | 3 
             bluez5_utils-5.63 | 2 
              cryptsetup-2.4.2 | 2 
                       frr-8.1 | 2 
                       unknown | 2 
                 apitrace-10.0 | 1 
google-breakpad-7515ab13768... | 1 
                 htpdate-1.3.3 | 1 
                libglvnd-1.3.2 | 1 
                log4cxx-0.12.0 | 1 
                 mesa3d-21.3.4 | 1 
               mongrel2-1.13.0 | 1 
                qt5base-5.15.2 | 1 
         rabbitmq-server-3.8.2 | 1 
                sg3_utils-1.47 | 1 
ulog-0389d243352255f6182326... | 1 
          xml-security-c-2.0.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |         apitrace-10.0          | NOK | http://autobuild.buildroot.net/results/7306bf05962fec30fbe98b1eb8ee09b3162b8080 |     
    arm      |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/483e199d98055bfaed4bb39d86be43d2399d7e44 |     
    arm      |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/2be71a93e34ed4187d803878140da8ad408ee69b |     
microblazeel |        cryptsetup-2.4.2        | NOK | http://autobuild.buildroot.net/results/6b634d116e474d250f6eead8c1851a4761753368 |     
microblazeel |        cryptsetup-2.4.2        | NOK | http://autobuild.buildroot.net/results/fba5a691df78bb168984b5cf59587ce8f3270b92 |     
    arm      |           efl-1.26.0           | NOK | http://autobuild.buildroot.net/results/d1b07a9da2572313b1cc5324460b3aea83802b25 |     
    arm      |           efl-1.26.0           | NOK | http://autobuild.buildroot.net/results/aca7ccd8ac96bade59a205c8a1a062cabdad531f |     
   mipsel    |           efl-1.26.0           | NOK | http://autobuild.buildroot.net/results/4cbfb7180715f540b7e6486ab00ba00535726345 |     
   nios2     |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/a66804073ad558869148ecbbeca23128658c336c |     
microblazeel |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/b7de1d85ee966b5c3a8a038163b215a856cba6c0 |     
   mipsel    | google-breakpad-7515ab13768... | NOK | http://autobuild.buildroot.net/results/3d0087f9d3be37963d471bcafbc1761464a7729a |     
  riscv64    |          guile-3.0.7           | NOK | http://autobuild.buildroot.net/results/a9beb47a528310541fc65e49d61123d16c450f6f | ORPH
    arm      |          guile-3.0.7           | NOK | http://autobuild.buildroot.net/results/c9634ecbe3462430a2a32d08dacf11d63813819c | ORPH
powerpc64le  |          guile-3.0.7           | NOK | http://autobuild.buildroot.net/results/03352427b91e7955351f0887c36077d2ce55effc | ORPH
    sh4      |         htpdate-1.3.3          | NOK | http://autobuild.buildroot.net/results/75ad8515916dfa056b17c97fdd95c7eb4d83a304 |     
    arm      |         libglvnd-1.3.2         | NOK | http://autobuild.buildroot.net/results/673dd087f7b8b60668cd7f2d67bf758f2de8c3bf | ORPH
    sh4      |         log4cxx-0.12.0         | NOK | http://autobuild.buildroot.net/results/41e47f76d7a86b25c9aff1d08beaeb39cb6c9e94 |     
    arm      |         mesa3d-21.3.4          | NOK | http://autobuild.buildroot.net/results/3b2e30d147dbdb4d9e74bd534cad8bb7a28ca1c8 |     
  mips64el   |        mongrel2-1.13.0         | NOK | http://autobuild.buildroot.net/results/80e167f6596aee56f1008f6bb286e3b326ceba89 |     
  mips64el   |        pulseview-0.4.2         | NOK | http://autobuild.buildroot.net/results/83843238e18b44b1c0c1dedd9b8204e80d8ec8c2 |     
  mips64el   |        pulseview-0.4.2         | NOK | http://autobuild.buildroot.net/results/7b2b2a07991d955581d8ec035b1d3d08dfc4c5e9 |     
  powerpc    |        pulseview-0.4.2         | NOK | http://autobuild.buildroot.net/results/9004c1019011286aabda757c6a14ec725c398f4f |     
    arm      |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/c762350e8deb6499d3b636e8b9410dc315f188ca |     
  riscv64    |     rabbitmq-server-3.8.2      | NOK | http://autobuild.buildroot.net/results/cb5abfef8bb9516860c65bbdc1780f6c67561e87 |     
    arc      |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/d4e193480d9a1c009cd889ccd4610e8601ff1a37 |     
  powerpc    |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/6601cb785519a9073bdd547f6a3b2d2a3f09aefe |     
   mipsel    |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/eade1c03916e6d644ebc7b8a995a45af99d173f3 |     
   nios2     |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/784016ef58af2861a7085f2e53965f68823d50b1 |     
    arm      |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/17a24db93f74a31a455ebe3cc2d6aa0caa08d0a3 |     
  riscv64    |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/2c9dd75b0da9a288ed33bc0c3d16021825649ad0 |     
    arc      |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/e3dd03bc02aeb8e1b0d9de6ffa153cdb36331114 |     
    arc      |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/1ecbdcb953d96afe9d7efee78bfe395892435a57 |     
    m68k     |         sg3_utils-1.47         | NOK | http://autobuild.buildroot.net/results/3517c60fcedd6b060a45255af79486a73cd2666f |     
 powerpc64   | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/f5cbcd3f762d18e8321a0ba7cb34f21bc4ebfda2 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/01313be3272fe7f40db0395bd446366feaa01718 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/e1a586c437bf1ce8e32ca08e922fb87b4cfc1a69 |     
  aarch64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/fee2aaa2f21cfa17ccf37852821d010015ad132b |     
  mips64el   |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/694a892b51530776f810a7b0afc51f4186164d2a |     
   nios2     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/03bfb07db28214ad0edcbef140826a1c27d740f4 |     
    arm      |      xml-security-c-2.0.4      | NOK | http://autobuild.buildroot.net/results/b6065efaa722f2da911c7cf150d446da621e8c71 |     
    arm      |          xvisor-0.3.1          | NOK | http://autobuild.buildroot.net/results/c50b17a15dbaf05e18e3125ddd215296c79434ab |     
    arm      |          xvisor-0.3.1          | NOK | http://autobuild.buildroot.net/results/e6e2eb7fc6f378d49d61d3609b0a8c07d5ab5d50 |     
    arm      |          xvisor-0.3.1          | NOK | http://autobuild.buildroot.net/results/42dfe2e445b020b6de8e8edcebe4358afcc3fb80 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 1 
           python-pybind-2.6.1 | 1 
                rocksdb-6.13.3 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/99fe839ac197ec7628c43b9d431595974de61d31 |     
  aarch64    |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/9bec461a1c7e35495a191bf28ca203625d67cebf |     
  powerpc    |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/c71492a8e99131863482085166ecea749162d6d4 |     


Classification of failures by reason for 2021.11.x
--------------------------------------------------

                nodejs-14.18.2 | 1 
                 openal-1.21.1 | 1 
                  weston-9.0.0 | 1 


Detail of failures for 2021.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |         nodejs-14.18.2         | NOK | http://autobuild.buildroot.net/results/1a828fcf92dd6dd3cfba396269825a258a24c3d0 |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/c3cea7e7267d81c31c8a190137c3264f17872e33 |     
    arm      |          weston-9.0.0          | NOK | http://autobuild.buildroot.net/results/f00b6197ba93e4581663be73ffb8903f62d81476 |     


Gitlab CI results for 2022-01-28
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                amarula_a64_relic | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478161  |      
                      andes_ae3xx | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478164  |      
               arcturus_ucls1012a | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478165  |      
                 arcturus_ucp1020 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478166  |      
                         arm_juno | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478168  |      
                   armadeus_apf27 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478170  |      
                  at91sam9260eknf | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478175  |      
                   at91sam9g20dfc | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478176  |      
                 at91sam9g45m10ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478177  |      
                     at91sam9rlek | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478178  |      
                     at91sam9x5ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478179  |      
                 at91sam9x5ek_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478180  |      
                 at91sam9x5ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478181  |      
             at91sam9x5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478182  |      
   atmel_sama5d27_som1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478183  |      
       atmel_sama5d2_xplained_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478184  |      
   atmel_sama5d2_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478185  |      
           atmel_sama5d3_xplained | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478186  |      
       atmel_sama5d3_xplained_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478187  |      
       atmel_sama5d3_xplained_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478188  |      
   atmel_sama5d3_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478189  |      
                 atmel_sama5d3xek | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478190  |      
           atmel_sama5d4_xplained | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478191  |      
       atmel_sama5d4_xplained_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478192  |      
       atmel_sama5d4_xplained_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478193  |      
   atmel_sama5d4_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478194  |      
                      bananapi_m1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478196  |      
                 bananapi_m1_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478197  |      
                 bananapi_m2_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478198  |      
                bananapi_m2_ultra | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478199  |      
                     bananapi_m64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478201  |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478202  |      
                   beagleboardx15 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478203  |      
                   beaglebone_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478205  |      
                          beaglev | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478207  |      
                      beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478208  |      
                  chromebook_snow | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478210  |      
                     csky_gx6605s | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478213  |      
            engicam_imx6qdl_icore | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478216  |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478217  |      
        engicam_imx6qdl_icore_rqs | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478219  |      
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478220  |      
             engicam_imx6ul_isiot | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478222  |      
           freescale_imx6qsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478236  |      
          freescale_imx6sxsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478238  |      
              freescale_imx8mnevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478246  |      
              freescale_imx8mpevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478248  |      
               freescale_p1025twr | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478255  |      
             freescale_t1040d4rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478256  |      
          freescale_t2080_qds_rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478258  |      
            friendlyarm_nanopc_t4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478260  |      
           friendlyarm_nanopi_a64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478262  |      
            friendlyarm_nanopi_m1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478264  | ORPH 
       friendlyarm_nanopi_m1_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478266  | ORPH 
            friendlyarm_nanopi_m4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478268  |      
           friendlyarm_nanopi_neo | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478274  |      
          friendlyarm_nanopi_neo2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478270  |      
          friendlyarm_nanopi_neo4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478273  |      
     friendlyarm_nanopi_neo_plus2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478276  |      
            friendlyarm_nanopi_r1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478278  |      
                          galileo | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478280  |      
                         imx23evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478287  |      
                       imx8mmpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478298  |      
                        imx8mpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478299  |      
                         lego_ev3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478304  |      
                    licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478305  |      
          microchip_sam9x60ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478307  |      
      microchip_sam9x60ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478309  |      
 microchip_sama5d27_wlsom1_ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478310  |      
...hip_sama5d27_wlsom1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478311  |      
        microchip_sama5d2_icp_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478312  |      
    microchip_sama5d2_icp_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478314  |      
          microchip_sama7g5ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478315  |      
      microchip_sama7g5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478316  |      
                          mx25pdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478319  |      
                        odroidxu4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478335  |      
          olimex_imx233_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478343  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478353  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478358  |      
                     orangepi_pc2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478359  |      
                    orangepi_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478362  | ORPH 
                   orangepi_prime | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478363  |      
                  orangepi_rk3399 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478366  |      
                     orangepi_win | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478368  |      
              orangepi_zero_plus2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478371  |      
                   pc_x86_64_bios | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478374  |      
                   pcengines_apu2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478376  |      
                           pine64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478377  |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478378  |      
               qemu_ppc64_pseries | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478400  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478427  |      
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478438  |      
                    roc_pc_rk3399 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478440  |      
                        rock_pi_4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478443  |      
                      rock_pi_n10 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478444  |      
                       rock_pi_n8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478445  |      
                        rockpro64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478446  |      
                 s6lx9_microboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478448  |      
                 snps_aarch64_vdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478450  |      
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478451  |      
              snps_archs38_axs103 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478452  |      
                snps_archs38_hsdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478457  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478460  |      
                solidrun_clearfog | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478461  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478478  |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478480  |      
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478482  |      
                        warpboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478491  |      
                    zynq_microzed | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478492  |      
                      zynq_qmtech | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478493  |      
                       zynq_zc706 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478494  |      
                         zynq_zed | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478495  |      
                    zynqmp_zcu106 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478496  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
