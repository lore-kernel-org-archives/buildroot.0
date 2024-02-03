Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8410C4828F
	for <buildroot@archiver.kernel.org>; Sat,  3 Feb 2024 17:58:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C0E241BBF;
	Sat,  3 Feb 2024 17:58:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C0E241BBF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Cs30yCo8Ls7s; Sat,  3 Feb 2024 17:58:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0377F41B4E;
	Sat,  3 Feb 2024 17:58:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0377F41B4E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2B0D01BF312
 for <buildroot@lists.busybox.net>; Sat,  3 Feb 2024 06:55:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2529960A66
 for <buildroot@lists.busybox.net>; Sat,  3 Feb 2024 06:55:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ixRgM_Wo16kw for <buildroot@lists.busybox.net>;
 Sat,  3 Feb 2024 06:55:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4EFA960A5E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4EFA960A5E
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4EFA960A5E
 for <buildroot@buildroot.org>; Sat,  3 Feb 2024 06:55:08 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 05B3D1C0006
 for <buildroot@buildroot.org>; Sat,  3 Feb 2024 06:55:05 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sat, 03 Feb 2024 06:55:05 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1706943306; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=KN+Q2q7CWxP2zkNx5389A5Z9ly5uIw3avGbjx2zUCwY=;
 b=i7mixpxk6u/D2I4yEATL7lgUnoN7fWMuIkJx89gydtnJfVPQBlE2jMxQKeFbDoyq3gxLao
 1PeqTULchPPposhsjXAS0Yq93WldeALgl/tWNdP3005zjCPdmsMaIyhA+0xwAr85w0vLS2
 5MuI6oVEiS8oYkojNAEBd7QsVBQYTAm0NdPegoxQChdrMw5nPe4O004GLuv198di4OJuNC
 37Zko0tStaBITzAGoqmTuW6K4UYDymGhGi1Wp3kupqve0u/URDBRi8lzthGWqTXrkoC82W
 smG9Vc3/+mqJd5pdEXmcUuvFYohxRypoE3nwNqfwjNv07YT78LEIsXXJLWFDWw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=i7mixpxk
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-02-02
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
Message-Id: <20240203175833.5C0E241BBF@smtp4.osuosl.org>

Hello,

Autobuild statistics for 2024-02-02
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  5  |  4  |  0  |  9  |
  2023.11.x  |  3  |  3  |  0  |  6  |
    master   | 48  | 46  |  0  | 94  |

Classification of failures by reason for master
-----------------------------------------------

                  axel-2.17.12 | 6 
                libressl-3.8.2 | 6 
                  linux-6.6.14 | 3 
                    attr-2.5.2 | 2 
cegui-00b4e1fe174da53b7ed72... | 2 
              libarchive-3.7.2 | 2 
              libopenssl-3.2.0 | 2 
               openblas-0.3.25 | 2 
                  stunnel-5.71 | 2 
             bluez5_utils-5.68 | 1 
                  boost-1.83.0 | 1 
check-11970a7e112dfe243a2e6... | 1 
                     crun-1.12 | 1 
           dmraid-1.0.0.rc16-3 | 1 
glibc-2.38-44-gd37c2b20a478... | 1 
  gobject-introspection-1.76.1 | 1 
         host-gcc-final-12.3.0 | 1 
              host-rust-1.74.1 | 1 
        host-sentry-cli-2.20.3 | 1 
                    htop-3.3.0 | 1 
               ipmitool-1_8_19 | 1 
      libabseil-cpp-20230802.1 | 1 
          libcamera-apps-1.2.1 | 1 
                   linux-tools | 1 
 Makefile:727: target-finalize | 1 
                 openssh-9.6p1 | 1 
                    php-8.2.15 | 1 
               tcf-agent-1.8.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |           attr-2.5.2           | NOK | http://autobuild.buildroot.net/results/cf06fd96f7e16cff9980af6f61edff0268970d6b |     
microblazeel |           attr-2.5.2           | NOK | http://autobuild.buildroot.net/results/05ce01cd38eb843727c63b0b234784be8640d5d0 |     
 aarch64_be  |          axel-2.17.12          | NOK | http://autobuild.buildroot.net/results/87cf5cca360001e3d5ed0524c0dd82daf1d958f4 |     
   mips64    |          axel-2.17.12          | NOK | http://autobuild.buildroot.net/results/185366701155050bc57c15cca7fe00d7b03212dd |     
powerpc64le  |          axel-2.17.12          | NOK | http://autobuild.buildroot.net/results/12f2a9002fcd839a5f4810c5c5f3fd990f99c878 |     
    m68k     |          axel-2.17.12          | NOK | http://autobuild.buildroot.net/results/33d7c66ed11c29c9e11998fa77fd01c6c01e7794 |     
  sparc64    |          axel-2.17.12          | NOK | http://autobuild.buildroot.net/results/8bbb5b681fe07a25b1697e61ebdc8ad6a12b68cd |     
   armeb     |          axel-2.17.12          | NOK | http://autobuild.buildroot.net/results/fa8a01b6556e46306d1b4bff5aae1dbc0d547d7f |     
   sh4aeb    |       bluez5_utils-5.68        | NOK | http://autobuild.buildroot.net/results/a3ef3041d27d13d8d12bbe4a5e38127fb910ed98 |     
    sh4      |          boost-1.83.0          | NOK | http://autobuild.buildroot.net/results/4a0c2d637964962c2e31140fb189d67b5c4c6a7c |     
microblazeel | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/4ff32eff551335875113c7e1c19ef88ec3c80e90 |     
   armeb     | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/74a1dcd1581ce3cf8816f458e4fd87a59ac0a6cc |     
  riscv64    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/f3b25683ab56789d2a31aa58abdd316802e6186a | ORPH
   arceb     |           crun-1.12            | NOK | http://autobuild.buildroot.net/results/536614905bc3dd80b4d8994e8d3827a506830bcf |     
   mips64    |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/d79a98238b3dd579186f46792d27231fa062dea9 | ORPH
powerpc64le  | glibc-2.38-44-gd37c2b20a478... | NOK | http://autobuild.buildroot.net/results/36614be506fed8023485fdf5fe65a97850a9b14e |     
    i686     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/60b92173ed6e2fa921103efe59e6e657099aebc2 | ORPH
    arm      |     host-gcc-final-12.3.0      | NOK | http://autobuild.buildroot.net/results/fffd8332f4f7d684b1cd1cf40853665f23addf5c |     
  aarch64    |        host-rust-1.74.1        | NOK | http://autobuild.buildroot.net/results/d9dab59fd0fbee06ff3abaffa3e844144476b649 |     
  mips64el   |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/4f03ef21b6828110b0ed5d4e8cc250ea2a7f7778 |     
    or1k     |           htop-3.3.0           | NOK | http://autobuild.buildroot.net/results/45bd7a30d91d82c07a7aed3a79d9e8c30b17406b | ORPH
   mipsel    |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/3c32271c779591e23b09a5e0acd00d3255352689 |     
 microblaze  |    libabseil-cpp-20230802.1    | NOK | http://autobuild.buildroot.net/results/438f0e5917703f83e392d2830b98e39644cefa6e |     
 powerpc64   |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/2c9a3a308199c99a5f43b4364f8cae0543927b63 |     
    arm      |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/031cb8089bda862b1b5b75fb2fb2c71bbdb3c05c |     
   armeb     |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/328b9220facf866fed1ab124dfda15cdbc2ea4ba |     
   s390x     |        libopenssl-3.2.0        | NOK | http://autobuild.buildroot.net/results/8774b2bc44d62b5e8232c2453a3586017656d8d2 | ORPH
   s390x     |        libopenssl-3.2.0        | NOK | http://autobuild.buildroot.net/results/457aacbdd953b5796ec4682f752014bb9f16c8b8 | ORPH
    m68k     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/787a284e0d253d30d3bebdc38505f91a4c901ab6 | ORPH
   mipsel    |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/dbc5448b23a446331f30ac5aebc73049bb32da20 | ORPH
microblazeel |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/c912a8a2c1f11dbb41d825f7724b2603f98f9f21 | ORPH
   mipsel    |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/8c329dd759cc7fff00ac13c3339b2bf8309aa4bd | ORPH
  powerpc    |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/c8e4952fd9ee8befdcaf4e0ba152ddb9f1e27ef0 | ORPH
    mips     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/aa416a196dc71b34ee9694b9048b8ed16d551f70 | ORPH
microblazeel |          linux-6.6.14          | NOK | http://autobuild.buildroot.net/results/7fef4db25ef4bf1fd3793a370e924489ce58afcc | ORPH
   mips64    |          linux-6.6.14          | NOK | http://autobuild.buildroot.net/results/018b7dfa2bfd1eaefbdb4de8883594612a0f0219 | ORPH
powerpc64le  |          linux-6.6.14          | NOK | http://autobuild.buildroot.net/results/ad087fcb33886ff06bdeb8532b78cc14028408ee | ORPH
powerpc64le  |          linux-tools           | NOK | http://autobuild.buildroot.net/results/4f8a3950c371cf1b9a880ff04e2b3d7097f2711d | ORPH
   mips64    | Makefile:727: target-finalize  | NOK | http://autobuild.buildroot.net/results/358eb1cbc37dc30755747c1a122af27e9cae2333 |     
   mips64    |        openblas-0.3.25         | NOK | http://autobuild.buildroot.net/results/e84a7e5c937c8ce3b3b6f5dc09000bc8b1ecd3b2 |     
    i686     |        openblas-0.3.25         | NOK | http://autobuild.buildroot.net/results/de38d38309bb5745e4559e2dd5fe140ba178aaa4 |     
   mipsel    |         openssh-9.6p1          | NOK | http://autobuild.buildroot.net/results/54396a537689d0063bec92f27b0b233b689355b9 | ORPH
microblazeel |           php-8.2.15           | NOK | http://autobuild.buildroot.net/results/d272d43046b4bb6b5f567949e0d406074c4bb32b |     
    m68k     |          stunnel-5.71          | NOK | http://autobuild.buildroot.net/results/8854672c48421f99639b1f1c0e783e52a4e8441e |     
   x86_64    |          stunnel-5.71          | NOK | http://autobuild.buildroot.net/results/a321014c26715945fa3107fdd4995e1d3359499a |     
powerpc64le  |        tcf-agent-1.8.0         | NOK | http://autobuild.buildroot.net/results/882e9e0e8d719db357ba5b42b7b290fa493993c0 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                 coreutils-9.1 | 1 
                elfutils-0.186 | 1 
            freeswitch-1.10.11 | 1 
                 raptor-2.0.15 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sh4eb     |         coreutils-9.1          | NOK | http://autobuild.buildroot.net/results/49ea74a69b85f3ee23e1360945afbf28cf8d329b | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/428b88bf8435327dff7d82cf53fa4079fada17a2 | ORPH
  sparc64    |       freeswitch-1.10.11       | NOK | http://autobuild.buildroot.net/results/5d6d561eb00de633af582846a7d424db103bbe76 |     
  riscv32    |         raptor-2.0.15          | NOK | http://autobuild.buildroot.net/results/c09ae7aa2cd79b5c16d09aaecde10cd2e7d4feaf | ORPH


Classification of failures by reason for 2023.11.x
--------------------------------------------------

                libressl-3.8.2 | 1 
            micropython-1.22.0 | 1 
                    proj-9.3.0 | 1 


Detail of failures for 2023.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/0fbf30496a563b6b7c2ec297bc28fb326659251d | ORPH
    i686     |       micropython-1.22.0       | NOK | http://autobuild.buildroot.net/results/d0fbbb4dbd0c16c07161bc7190d42a0509ac1f68 |     
  sparc64    |           proj-9.3.0           | NOK | http://autobuild.buildroot.net/results/3549aaa5942f804ef82ce30e87a2b01555432367 |     


Gitlab CI results for 2024-02-02
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
    acmesystems_arietta_g25_256mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/6069399598  |      
               arcturus_ucls1012a | https://gitlab.com/buildroot.org/buildroot/-/jobs/6069399619  |      
                   armadeus_apf28 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6069399669  |      
                  at91sam9260eknf | https://gitlab.com/buildroot.org/buildroot/-/jobs/6069399714  |      
                 at91sam9x5ek_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/6069400025  |      
           atmel_sama5d3_xplained | https://gitlab.com/buildroot.org/buildroot/-/jobs/6069400173  |      
   atmel_sama5d3_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/6069400233  |      
   atmel_sama5d4_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/6069400315  |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/6069400425  | ORPH 
                          beaglev | https://gitlab.com/buildroot.org/buildroot/-/jobs/6069400527  |      
               broadcom_northstar | https://gitlab.com/buildroot.org/buildroot/-/jobs/6069400544  |      
                  chromebook_snow | https://gitlab.com/buildroot.org/buildroot/-/jobs/6069400560  |      
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/6069400583  |      
         freescale_imx6qsabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/6069400600  |      
              freescale_imx8mmevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/6069400636  |      
              freescale_imx8mpevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/6069400645  |      
               freescale_p1025twr | https://gitlab.com/buildroot.org/buildroot/-/jobs/6069400662  | ORPH 
                 grinn_chiliboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/6069400693  |      
                 hifive_unleashed | https://gitlab.com/buildroot.org/buildroot/-/jobs/6069400702  |      
                   imx6-sabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/6069400718  |      
                        imx6slevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/6069400735  |      
                       imx6ulpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/6069400752  |      
                        imx7dpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/6069400759  |      
                       imx8mmpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/6069400760  |      
                        imx8mpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/6069400767  |      
                        imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/6069400771  |      
                    imxrt1050-evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/6069400773  |      
                kontron_bl_imx8mm | https://gitlab.com/buildroot.org/buildroot/-/jobs/6069400779  |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/6069400782  |      
                       ls1028ardb | https://gitlab.com/buildroot.org/buildroot/-/jobs/6069400794  |      
              octavo_osd32mp1_brk | https://gitlab.com/buildroot.org/buildroot/-/jobs/6069400867  |      
              octavo_osd32mp1_red | https://gitlab.com/buildroot.org/buildroot/-/jobs/6069400871  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6069400906  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/6069400913  |      
                   orangepi_zero3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6069400930  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/6069401106  | ORPH 
                raspberrypizero2w | https://gitlab.com/buildroot.org/buildroot/-/jobs/6069401118  |      
             sipeed_licheepi_nano | https://gitlab.com/buildroot.org/buildroot/-/jobs/6069401145  |      
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6069401255  |      
                 snps_arc700_nsim | https://gitlab.com/buildroot.org/buildroot/-/jobs/6069401262  | ORPH 
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6069401284  |      
                      ti_am62x_sk | https://gitlab.com/buildroot.org/buildroot/-/jobs/6069401414  |      
                      ti_am64x_sk | https://gitlab.com/buildroot.org/buildroot/-/jobs/6069401433  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6069401437  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
