Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FC12C4167B
	for <buildroot@archiver.kernel.org>; Sat,  2 Dec 2023 08:28:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EBE7940103;
	Sat,  2 Dec 2023 08:27:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EBE7940103
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oFvXRwgcQI2M; Sat,  2 Dec 2023 08:27:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5BA0D40169;
	Sat,  2 Dec 2023 08:27:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5BA0D40169
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 40B381BF3BF
 for <buildroot@lists.busybox.net>; Sat,  2 Dec 2023 08:27:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DF64E40169
 for <buildroot@lists.busybox.net>; Sat,  2 Dec 2023 08:27:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF64E40169
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TISntrTNpdFB for <buildroot@lists.busybox.net>;
 Sat,  2 Dec 2023 08:27:53 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8207B40103
 for <buildroot@buildroot.org>; Sat,  2 Dec 2023 08:27:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8207B40103
Received: by mail.gandi.net (Postfix) with ESMTPSA id CB65EFF80D
 for <buildroot@buildroot.org>; Sat,  2 Dec 2023 08:27:49 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sat, 02 Dec 2023 08:27:49 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20231202082754.DF64E40169@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1701505669; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=sVsJmLAs2QB7asj6Symz74oU+khFJN+kx+Bb9Wnq8kE=;
 b=BB5h0R1f2N7ugGggwB8F1letwtR6Wc1/C87+163OvMmkrQiFTk1QfqzWl9jiiXjfc/pV5Z
 kWMdORKlvb+fzDBG+rPeXdD8UoTXJ2DgQbKq2+NTZS4nzCY7ap0ONO90ZwsXDA2mZq419q
 BqDeppVcuFvwmPfu9B42j/fXrDXfvIGbzJxjol0dHG5m83k6LSMsf2I8ckkEr7NAkxfcOa
 /a2yGszpxu7+dxKrGhwVZrNQXdiI6nkQALm795la55VfqYkfHHs3ADGSYejP4KbdiQ+tSV
 Y6y1/waZY9RHy+OkDH2g//GgCfpENn1777JfksiJBZC7JVtX7vY3UrxZPXR3aA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BB5h0R1f
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-12-01
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

Autobuild statistics for 2023-12-01
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  7  |  1  |  0  |  8  |
  2023.08.x  |  3  |  3  |  0  |  6  |
    master   | 43  | 35  |  1  | 79  |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 4 
  gobject-introspection-1.76.1 | 3 
glibc-2.38-27-g750a45a78390... | 2 
                libressl-3.8.2 | 2 
                   bird-2.0.12 | 1 
          cryptodev-linux-1.13 | 1 
              e2fsprogs-1.47.0 | 1 
        edk2-edk2-stable202308 | 1 
                elfutils-0.189 | 1 
                  ffmpeg-4.4.4 | 1 
         gobject-introspection | 1 
         host-gcc-final-12.3.0 | 1 
                host-go-1.21.4 | 1 
        host-sentry-cli-2.20.3 | 1 
kvmtool-f77d646ba01d04be5aa... | 1 
              libarchive-3.7.2 | 1 
               libglib2-2.76.1 | 1 
               libunwind-1.6.2 | 1 
                   linux-6.6.3 | 1 
                   linux-tools | 1 
        ltp-testsuite-20230929 | 1 
 Makefile:727: target-finalize | 1 
                    ngrep-1.47 | 1 
                    putty-0.79 | 1 
                     pv-1.6.20 | 1 
                python3-3.11.6 | 1 
              skalibs-2.12.0.1 | 1 
                xenomai-3.0.10 | 1 
               xwayland-23.1.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/7aa6395f3ee86fde8433dc4307b0293097e28b60 |     
   armeb     |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.net/results/35570f820a521c29c7db0a094b28558a71d3b7a8 | ORPH
   sh4aeb    |        e2fsprogs-1.47.0        | NOK | http://autobuild.buildroot.net/results/752fd06309b5b45198af1970ac878b15df60e537 | ORPH
    i686     |     edk2-edk2-stable202308     | NOK | http://autobuild.buildroot.net/results/2fe9f5acd18be07b487aee3d1a27a83c30080eb7 |     
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/dc2ca50204d4ea82bf3a11e6687e11e84898b442 | ORPH
    i686     |          ffmpeg-4.4.4          | NOK | http://autobuild.buildroot.net/results/9acb763c89ac4713a81e1d0786b24522551018cc |     
  powerpc    | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/0736972110d02ffa4d2f2d597ad8a445be0035f7 |     
powerpc64le  | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/fffffcfa222cf5c150ab7a1a9f0e20a918372dea |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/0fdd4dabbb294166b92a7fa0b0a469b327c28ad0 |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/992d30da24e9b8951cc15f458cd1d047a2f4e835 | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/5d6531e1599e5a64f8b031fd9e7e36a766bfab80 | ORPH
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/ada2f8701a01a6fd2469c396b0b4b87e0447501c | ORPH
microblazeel |     host-gcc-final-12.3.0      | NOK | http://autobuild.buildroot.net/results/f9dca620d42a29f05bad06208f308c1e155033f4 |     
   mips64    |         host-go-1.21.4         | NOK | http://autobuild.buildroot.net/results/fa18bb1eed8aafc8890eb3f3bf5492e2eb4a1cf5 |     
    i686     |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/02878ebaed507fe39883661cc1901a0d0ed5123a |     
   x86_64    | kvmtool-f77d646ba01d04be5aa... | NOK | http://autobuild.buildroot.net/results/76fa16fac3ba4e94c79ac8e11f09d0c1ec21eb8b | ORPH
 microblaze  |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/23a0191f64fc59e641e3d1c9ed32ff1c6f33d537 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/f2f22eabee6e42a6982ce1c676e74b5118cc79ff |     
 microblaze  |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/317753d70a9e03224e68bc1fadeea11df793aaeb | ORPH
    arc      |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/8cbb5cf2bf1458268a9e6923b16af62a4d04dd01 | ORPH
   mips64    |        libunwind-1.6.2         | NOK | http://autobuild.buildroot.net/results/cf45dfad383f9f68704e493485dc7b3613d323b7 | ORPH
 microblaze  |          linux-6.6.3           | NOK | http://autobuild.buildroot.net/results/05b28a77ef65fc1965231faeed126aef34f66125 | ORPH
    arc      |          linux-tools           | NOK | http://autobuild.buildroot.net/results/7674abb454b46ca768e44b6838a0d8724c772dd6 | ORPH
 microblaze  |     ltp-testsuite-20230929     | NOK | http://autobuild.buildroot.net/results/871515a5e3dfe45b6d7d665f5dd11586dafa08fb |     
    arm      | Makefile:727: target-finalize  | NOK | http://autobuild.buildroot.net/results/4a4942113594fdc61a1e9b59f0f14e9c84fb6d4f |     
powerpc64le  |           ngrep-1.47           | NOK | http://autobuild.buildroot.net/results/48b1b3ff159f1e689e5095209d96ed45155f0462 |     
   arceb     |           putty-0.79           | NOK | http://autobuild.buildroot.net/results/762018b8ef27a2cf722c25060bae7472a44727a1 |     
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/a132fae09b6b244ba3647724f3653cdaf7f84e45 | ORPH
   x86_64    |         python3-3.11.6         | NOK | http://autobuild.buildroot.net/results/44faec08dd0222889bdceb12628ebcb08c27041f |     
    or1k     |        skalibs-2.12.0.1        | NOK | http://autobuild.buildroot.net/results/20aaf40f7be26417cf33b2dea6e665bfeaefb2ed |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/b61d441fb578f33754d75fdd3bf4d20413cef714 |     
   armeb     |            unknown             | NOK | http://autobuild.buildroot.net/results/c1287d50e94b16432b740e961d6879a9b7ecea06 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/e1936687fef2ebe2dfddd0b28dcab7f5c1dec390 |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/9e60f671bf806c140e7df0533c954187c60aa8c1 |     
   xtensa    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/8eeab9f16984eb1b3df6b36e5512cc13ec168945 |     
powerpc64le  |        xwayland-23.1.1         | NOK | http://autobuild.buildroot.net/results/dc69a125c1e840d874e647ac28a4ebecfa460a99 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

               host-runc-1.1.7 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        host-runc-1.1.7         | NOK | http://autobuild.buildroot.net/results/232548b164d0e35b6f0d4d57218eec97d6097c02 |     


Classification of failures by reason for 2023.08.x
--------------------------------------------------

               host-go-1.20.11 | 1 
              host-rust-1.71.1 | 1 
              open62541-v1.3.6 | 1 


Detail of failures for 2023.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |        host-go-1.20.11         | NOK | http://autobuild.buildroot.net/results/15bde4c283ca1b481afd1fcb6655a22501c3f6d9 |     
  powerpc    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/02eaae99051ddca35e5a806e17a6347fa52ae647 |     
   nios2     |        open62541-v1.3.6        | NOK | http://autobuild.buildroot.net/results/11cf9fc84444d8ba54165d4b494e72c6b3602ad0 | ORPH


Gitlab CI results for 2023-12-01
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                          beaglev | https://gitlab.com/buildroot.org/buildroot/-/jobs/5653687283  |      
               broadcom_northstar | https://gitlab.com/buildroot.org/buildroot/-/jobs/5653687289  |      
              freescale_imx8mpevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/5653687340  |      
                       imx8mmpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/5653687440  |      
                        imx8mpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/5653687454  |      
                        imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/5653687457  |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/5653687482  |      
              octavo_osd32mp1_brk | https://gitlab.com/buildroot.org/buildroot/-/jobs/5653687589  |      
              octavo_osd32mp1_red | https://gitlab.com/buildroot.org/buildroot/-/jobs/5653687593  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5653687674  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/5653687685  |      
               qemu_ppc64_pseries | https://gitlab.com/buildroot.org/buildroot/-/jobs/5653687814  |      
             qemu_ppc64le_pseries | https://gitlab.com/buildroot.org/buildroot/-/jobs/5653687819  |      
                  qemu_ppc_bamboo | https://gitlab.com/buildroot.org/buildroot/-/jobs/5653687833  |      
               qemu_ppc_mpc8544ds | https://gitlab.com/buildroot.org/buildroot/-/jobs/5653687844  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/5653687888  | ORPH 
                 sipeed_lichee_rv | https://gitlab.com/buildroot.org/buildroot/-/jobs/5663278680  |      
             sipeed_licheepi_nano | https://gitlab.com/buildroot.org/buildroot/-/jobs/5663315847  |      
             sipeed_licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/5663326449  |      
                  sipeed_maix_bit | https://gitlab.com/buildroot.org/buildroot/-/jobs/5663340151  |      
           sipeed_maix_bit_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/5663361695  |      
                 sipeed_maix_dock | https://gitlab.com/buildroot.org/buildroot/-/jobs/5663374684  |      
                   sipeed_maix_go | https://gitlab.com/buildroot.org/buildroot/-/jobs/5663390979  |      
            sipeed_maix_go_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/5663404179  |      
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5663426092  |      
                 snps_arc700_nsim | https://gitlab.com/buildroot.org/buildroot/-/jobs/5663436589  |      
              snps_archs38_axs103 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5663450011  |      
                snps_archs38_haps | https://gitlab.com/buildroot.org/buildroot/-/jobs/5663458507  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5663481570  |      
                solidrun_clearfog | https://gitlab.com/buildroot.org/buildroot/-/jobs/5663504572  |      
                    spike_riscv64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5663530850  |      
              stm32f429_disco_xip | https://gitlab.com/buildroot.org/buildroot/-/jobs/5663544493  |      
              stm32f469_disco_xip | https://gitlab.com/buildroot.org/buildroot/-/jobs/5663562113  |      
               stm32f769_disco_sd | https://gitlab.com/buildroot.org/buildroot/-/jobs/5663569704  |      
                  stm32mp157a_dk1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5663579320  |      
                  stm32mp157c_dk2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5663591724  |      
        terasic_de10nano_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5663611166  |      
                      ti_am62x_sk | https://gitlab.com/buildroot.org/buildroot/-/jobs/5663624698  |      
                      ti_am64x_sk | https://gitlab.com/buildroot.org/buildroot/-/jobs/5663638364  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5663040206  |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5663651236  |      
                           ts5500 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5663659732  |      
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5663669055  |      
                         uevm5432 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5663679799  |      
                      visionfive2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5663693610  |      
                            warp7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5663723616  |      
                        warpboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/5663741345  |      
                    zynq_microzed | https://gitlab.com/buildroot.org/buildroot/-/jobs/5663748135  |      
                      zynq_qmtech | https://gitlab.com/buildroot.org/buildroot/-/jobs/5663758327  |      
                         zynq_zed | https://gitlab.com/buildroot.org/buildroot/-/jobs/5663770731  |      
                zynqmp_kria_kv260 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5663782455  |      
                    zynqmp_zcu102 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5663788830  |      
                    zynqmp_zcu106 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5663799303  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
