Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8933FC001E0
	for <buildroot@archiver.kernel.org>; Sat, 12 Aug 2023 05:42:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08E9C607EC;
	Sat, 12 Aug 2023 05:42:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 08E9C607EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pLMUffg9iBWd; Sat, 12 Aug 2023 05:42:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA4B360804;
	Sat, 12 Aug 2023 05:42:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA4B360804
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CE5DB1BF291
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 05:42:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7F144400D2
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 05:42:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7F144400D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BtqOcMfFwmq4 for <buildroot@lists.busybox.net>;
 Sat, 12 Aug 2023 05:42:06 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B2E49400B8
 for <buildroot@buildroot.org>; Sat, 12 Aug 2023 05:42:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B2E49400B8
Received: by mail.gandi.net (Postfix) with ESMTPSA id B1F2CC0009
 for <buildroot@buildroot.org>; Sat, 12 Aug 2023 05:42:03 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sat, 12 Aug 2023 05:42:03 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20230812054207.7F144400D2@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1691818923; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=WHEPdJfBFe9Yy78/23OruB5ZxpTRat4Q0kl+QXTM5ck=;
 b=pw/EoNnXKMEpbWjdb847B1V08YdMHRy6E7AfjlgeJUSTw8ui2ujOjjJj1UCCaEntjVqzcN
 tFAiLjK+ZuTBlESM2rhKDcblNvdHBanYnuYTTkanGZcQns0+WJ/T7+scUM01HPhZ/eFVAT
 nJYJUhW2ka1M8MaCYs4Jvs++gsP41T2O9IdA9mRoKEbUCrT0Pkd14iQkxqgkhWf8hPUrkU
 KV3VSCf9srEuK6NTjS+kBmfur5254499fT25XhLRbUoqv7Dwei8uQdmwNXVb+NF8MsPz8g
 zUBE8LCmNv3HUMFo8queQDk7PkiimsqVE/agaidNzbbyhUN4EizVWVSA3Z4OJA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=pw/EoNnX
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-08-11
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

Autobuild statistics for 2023-08-11
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  9  |  4  |  1  | 14  |
  2023.05.x  |  2  |  3  |  0  |  5  |
    master   | 53  | 31  |  0  | 84  |

Classification of failures by reason for master
-----------------------------------------------

             f2fs-tools-1.16.0 | 2 
  gobject-introspection-1.76.1 | 2 
        linux-headers-4.19.290 | 2 
             batman-adv-2022.3 | 1 
  binutils-arc-2020.09-release | 1 
                  boost-1.82.0 | 1 
                  cairo-1.16.0 | 1 
          cryptodev-linux-1.13 | 1 
                 dhcp-4.4.3-P1 | 1 
           dmraid-1.0.0.rc16-3 | 1 
              e2fsprogs-1.47.0 | 1 
                elfutils-0.189 | 1 
esp-hosted-11e90f185a5a9922... | 1 
            gdk-pixbuf-2.42.10 | 1 
glibc-2.37-2-g9f8513dc64119... | 1 
                host-go-1.20.7 | 1 
              host-rust-1.71.0 | 1 
                libsoup-2.74.2 | 1 
               lightning-2.2.2 | 1 
                   linux-tools | 1 
                 mpg123-1.31.3 | 1 
                netdata-1.33.1 | 1 
                     pv-1.6.20 | 1 
            quickjs-2021-03-27 | 1 
rtl8189fs-75a566a830037c7d1... | 1 
             util-linux-2.39.1 | 1 
                xenomai-3.0.10 | 1 
               xfsprogs-5.14.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |       batman-adv-2022.3        | NOK | http://autobuild.buildroot.net/results/875609216c866f3b033050aa3558e69ac446a9e1 |     
    arc      |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/922aac3359e8b632fb0cc701309420f8a09b5350 |     
   s390x     |          boost-1.82.0          | NOK | http://autobuild.buildroot.net/results/fb017ccbf63075ba2af9b01c8636aad554fac333 |     
   xtensa    |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/bfcde3c035092d28cec35b087d5a5e487241b2b3 |     
    or1k     |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.net/results/a16f9248fd729a0c1db89677ce9c2931aba7d07c | ORPH
   xtensa    |         dhcp-4.4.3-P1          | NOK | http://autobuild.buildroot.net/results/71f1616e97c139713fc97bc080d8a3abefee1aae | ORPH
   mipsel    |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/c6fc3a7f03171cced5a26246d14113c29e641086 | ORPH
    sh4      |        e2fsprogs-1.47.0        | NOK | http://autobuild.buildroot.net/results/fb7e9c8b02b979b3a75185c0afa4ab0ca654f6f6 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/a15be7074cb0622afb8e8749f11ce41f417995af | ORPH
   nios2     | esp-hosted-11e90f185a5a9922... | NOK | http://autobuild.buildroot.net/results/cdf65ad07aba1d86f195576a2317c83aeb3dfce2 |     
   armeb     |       f2fs-tools-1.16.0        | NOK | http://autobuild.buildroot.net/results/f823d6972bc5c1b62e2ba6f9af63d38ab412e120 |     
 aarch64_be  |       f2fs-tools-1.16.0        | NOK | http://autobuild.buildroot.net/results/f3b938c2f5788cf498742e5bdc2f0cb4e5c0f043 |     
    or1k     |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/f593a0b64d98935c7ce823aaadf0b41d1219c66f | ORPH
powerpc64le  | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/849cc19565208e7396c26037d43567be530e8fb6 |     
   nios2     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/3daba60ba1e5697ccefd4cc68bfb7ae0fb2b78f0 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/8958ccaadec697b16b001b75e02a3be1463c6072 | ORPH
  mips64el   |         host-go-1.20.7         | NOK | http://autobuild.buildroot.net/results/ad8d0b3b854134b54ce81ad2bfdec02904f8a39f |     
  aarch64    |        host-rust-1.71.0        | NOK | http://autobuild.buildroot.net/results/159de677283ecca34140a5a3c02b3eeada01184e |     
   s390x     |         libsoup-2.74.2         | NOK | http://autobuild.buildroot.net/results/3eb0da0f405fe27f74004aec45594697d5587926 |     
  mips64el   |        lightning-2.2.2         | NOK | http://autobuild.buildroot.net/results/828647ce3d53725809289b970b092227d729b1ba |     
 aarch64_be  |     linux-headers-4.19.290     | NOK | http://autobuild.buildroot.net/results/153096eba16115dc2e87f7966bc39fee4e77be7b | ORPH
 powerpc64   |     linux-headers-4.19.290     | NOK | http://autobuild.buildroot.net/results/806c8e3f83a14bac5ae0050950e25e730a1a4dcf | ORPH
    arc      |          linux-tools           | NOK | http://autobuild.buildroot.net/results/e90e4f99d00a70edfa5d1e7714094c0851001c13 | ORPH
  sparc64    |         mpg123-1.31.3          | NOK | http://autobuild.buildroot.net/results/2ac0e1b12a6b8815cd2cbca743c5c1af66a4d816 |     
  mips64el   |         netdata-1.33.1         | NOK | http://autobuild.buildroot.net/results/e029bc30c16e2e81a4ac215b102dea285e56bf29 |     
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/1c51fa1640b54c64c63389f811aaaeeb59bfa055 | ORPH
   armeb     |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/4214c05f4b9d5b88017c254cc01386ec1167e82e |     
powerpc64le  | rtl8189fs-75a566a830037c7d1... | NOK | http://autobuild.buildroot.net/results/692becce49620e7012911af799c7d54a54092a3a |     
    or1k     |       util-linux-2.39.1        | NOK | http://autobuild.buildroot.net/results/d502bc9236b577e2470a30ffc39c21579b038a1c | ORPH
   mipsel    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/9566318e6931513bebae91a4c9b0ef738198458a |     
    arm      |        xfsprogs-5.14.2         | NOK | http://autobuild.buildroot.net/results/3bd7de784953ab1fa70bf5572eccd7b10e4a0e17 | ORPH


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                 fdk-aac-2.0.2 | 1 
                        ffmpeg | 1 
       freeradius-client-1.1.7 | 1 
              host-rust-1.67.1 | 1 
                    olsr-0.9.8 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     |         fdk-aac-2.0.2          | NOK | http://autobuild.buildroot.net/results/385fd6126e5ae36d91d61fc66f94371ae9efd937 |     
  riscv64    |             ffmpeg             | TIM | http://autobuild.buildroot.net/results/77af02ae8910f5094c5e024abc4a6d027aeea3b8 |     
  riscv64    |    freeradius-client-1.1.7     | NOK | http://autobuild.buildroot.net/results/626ecfb9409a2d359631150b9fb34ffc3316de6e |     
 powerpc64   |        host-rust-1.67.1        | NOK | http://autobuild.buildroot.net/results/a27b51b565be98a0d1408aa6b89b3a5b20ceeff4 |     
    mips     |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/defe88d1190d3bc6304ecbdee563553bcda6d5b4 | ORPH


Classification of failures by reason for 2023.05.x
--------------------------------------------------

fs/ubifs/ubifs.mk:49: /home... | 1 
          linux-5.10.162-cip24 | 1 
toolchain-external-codescap... | 1 


Detail of failures for 2023.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/5708bf79c3b1dd89e4251753b7bfbe371af4d527 |     
microblazeel |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/608fae76c018e922a01b1da6b0a6a8b462c0a8cd | ORPH
   mips64    | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/ac42fa8ac0aa8fac655abd162dcd11246c9daebf | ORPH


Gitlab CI results for 2023-08-11
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                   andes_ae350_45 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4839059655  |      
                        avenger96 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4839059915  |      
                          beaglev | https://gitlab.com/buildroot.org/buildroot/-/jobs/4839059972  |      
                             ci20 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4839060016  |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4839060030  |      
           freescale_imx6qsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/4839060074  |      
              freescale_imx8mmevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/4839060088  |      
              freescale_imx8mnevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/4839060092  |      
              freescale_imx8mpevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/4839060094  |      
              freescale_imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/4839060100  |      
              freescale_imx8qmmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/4839060101  |      
             freescale_imx8qxpmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/4839060106  |      
                 hifive_unleashed | https://gitlab.com/buildroot.org/buildroot/-/jobs/4839060137  |      
                 imx6-sabresd_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4839060161  |      
                       imx8mmpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/4839060200  |      
                        imx8mpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/4839060219  |      
                        imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/4839060221  |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/4839060225  |      
                       ls1028ardb | https://gitlab.com/buildroot.org/buildroot/-/jobs/4839060243  |      
...hip_sama5d27_wlsom1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/4839060259  |      
        microchip_sama5d2_icp_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/4839060262  |      
          microchip_sama7g5ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/4839060267  |      
      microchip_sama7g5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/4839060272  |      
                         mx6cubox | https://gitlab.com/buildroot.org/buildroot/-/jobs/4839060285  |      
                   mx6sx_udoo_neo | https://gitlab.com/buildroot.org/buildroot/-/jobs/4839060289  |      
                          mx6udoo | https://gitlab.com/buildroot.org/buildroot/-/jobs/4839060292  |      
                      nexbox_a95x | https://gitlab.com/buildroot.org/buildroot/-/jobs/4839060295  |      
              octavo_osd32mp1_brk | https://gitlab.com/buildroot.org/buildroot/-/jobs/4839060328  |      
              octavo_osd32mp1_red | https://gitlab.com/buildroot.org/buildroot/-/jobs/4839060334  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4839060399  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/4839060408  |      
                   pc_x86_64_bios | https://gitlab.com/buildroot.org/buildroot/-/jobs/4839060426  |      
                    pc_x86_64_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/4839060430  |      
             qemu_arm_vexpress_tz | https://gitlab.com/buildroot.org/buildroot/-/jobs/4839060472  |      
                     qemu_sh4_r2d | https://gitlab.com/buildroot.org/buildroot/-/jobs/4839060544  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/4839060566  | ORPH 
                           rock5b | https://gitlab.com/buildroot.org/buildroot/-/jobs/4839060582  |      
           sipeed_maix_bit_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/4839060605  |      
          sipeed_maix_dock_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/4839060608  |      
                   sipeed_maix_go | https://gitlab.com/buildroot.org/buildroot/-/jobs/4839060609  |      
            sipeed_maix_go_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/4839060613  |      
                 sipeed_maixduino | https://gitlab.com/buildroot.org/buildroot/-/jobs/4839060615  |      
          sipeed_maixduino_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/4839060616  |      
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4839060618  |      
              snps_archs38_axs103 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4839060623  |      
                snps_archs38_haps | https://gitlab.com/buildroot.org/buildroot/-/jobs/4839060625  |      
                snps_archs38_hsdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/4839060627  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4839060631  |      
                solidrun_clearfog | https://gitlab.com/buildroot.org/buildroot/-/jobs/4839060633  |      
          solidrun_clearfog_gt_8k | https://gitlab.com/buildroot.org/buildroot/-/jobs/4839060634  |      
            solidrun_macchiatobin | https://gitlab.com/buildroot.org/buildroot/-/jobs/4839060635  | ORPH 
                    spike_riscv64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4839060638  |      
              stm32f429_disco_xip | https://gitlab.com/buildroot.org/buildroot/-/jobs/4839060642  |      
               stm32f469_disco_sd | https://gitlab.com/buildroot.org/buildroot/-/jobs/4839060653  |      
              stm32f469_disco_xip | https://gitlab.com/buildroot.org/buildroot/-/jobs/4839060655  |      
               stm32f769_disco_sd | https://gitlab.com/buildroot.org/buildroot/-/jobs/4839060656  |      
                  stm32mp157a_dk1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4839060659  |      
                  stm32mp157c_dk2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4839060660  |      
              stm32mp157c_odyssey | https://gitlab.com/buildroot.org/buildroot/-/jobs/4839060665  |      
        terasic_de10nano_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4839060671  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4839060675  |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4839060677  |      
                           ts5500 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4839060679  |      
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4839060683  |      
                         uevm5432 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4839060685  |      
                    versal_vck190 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4839060691  |      
                       visionfive | https://gitlab.com/buildroot.org/buildroot/-/jobs/4839060706  |      
                      visionfive2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4839060694  |      
                        wandboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/4839060727  |      
                            warp7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4839060745  |      
                        warpboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/4839060748  |      
                    zynq_microzed | https://gitlab.com/buildroot.org/buildroot/-/jobs/4839060750  |      
                      zynq_qmtech | https://gitlab.com/buildroot.org/buildroot/-/jobs/4839060752  |      
                       zynq_zc706 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4839060755  |      
                         zynq_zed | https://gitlab.com/buildroot.org/buildroot/-/jobs/4839060758  |      
                zynqmp_kria_kv260 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4839060760  |      
                    zynqmp_zcu102 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4839060762  |      
                    zynqmp_zcu106 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4839060767  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
