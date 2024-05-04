Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0A3DC4345F
	for <buildroot@archiver.kernel.org>; Sat,  4 May 2024 04:00:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 211C040180;
	Sat,  4 May 2024 04:00:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2U3OwYByMBkB; Sat,  4 May 2024 04:00:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8348540199
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8348540199;
	Sat,  4 May 2024 04:00:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B88AC1BF3C3
 for <buildroot@lists.busybox.net>; Sat,  4 May 2024 04:00:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B193540199
 for <buildroot@lists.busybox.net>; Sat,  4 May 2024 04:00:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4q6PhG6ibwyh for <buildroot@lists.busybox.net>;
 Sat,  4 May 2024 04:00:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1AF6940180
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1AF6940180
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1AF6940180
 for <buildroot@buildroot.org>; Sat,  4 May 2024 04:00:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 10BBA60013
 for <buildroot@buildroot.org>; Sat,  4 May 2024 04:00:49 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sat, 04 May 2024 04:00:49 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1714795250; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=zn7JbM3Z4in1Q9KzffHfVJnDnTpNDCYykBHFAG2sOqc=;
 b=iPQf2zhJrW5j1XGsUKrjvd0MZtLaaHUDkXK6ZnUJKlAB+7Teuw9q2Fe5AeZoZ+5tN5B98G
 S1kU9o4TQZWBFNfcKlfoAytdalOHv52KJ1WkrOLCOIaW2KtG3ymXgcuzum8RdP9cfVUVlb
 pxPlbVO0IWns2yr+o+kjx+dRxOuDG6XxGfvd55hehO0eeluEGIi6l5RVJlNLUCqKvaXw+b
 RbfKKL8VbT1nbF/+e/SgVsNpuJwiPHSEYMHXAtc0O+amDYfJOfLhFLmHSI0U/b7NeqVv47
 BVx/N8lb0KAXn0PLVG9Ms16W6NBCy1Kvpxf77m4TYAX+MmtRq0EqrE/BUgtenw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=iPQf2zhJ
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-05-03
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
Message-ID: <20240504040049.OsmaIXxlalp6ZpDzIdnZhmpZB9nc2NdnHNOiOc7QJa0@z>

Hello,

Autobuild statistics for 2024-05-03
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  5  |  6  |  0  | 11  |
    master   | 15  | 55  |  0  | 70  |

Classification of failures by reason for master
-----------------------------------------------

          host-libglib2-2.76.1 | 32
                   foot-1.16.2 | 2 
ibm-sw-tpm2-5452af422edeff7... | 2 
                libressl-3.8.4 | 2 
          python-grpcio-1.60.0 | 2 
                       unknown | 2 
                    bcc-0.29.1 | 1 
check-11970a7e112dfe243a2e6... | 1 
                  clang-15.0.3 | 1 
             containerd-1.7.14 | 1 
                 coreutils-9.3 | 1 
                fail2ban-1.0.2 | 1 
glibc-2.39-5-ge0910f1d3278f... | 1 
                gnu-efi-3.0.18 | 1 
host-heimdal-f4faaeaba371ff... | 1 
          libcamera-apps-1.2.1 | 1 
                  libsepol-3.5 | 1 
                     mdadm-4.3 | 1 
                    proj-9.3.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |           bcc-0.29.1           | NOK | http://autobuild.buildroot.net/results/68d8678103d717761a7ae6bf0915be9b3e702f68 |     
  riscv64    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/f49a72d3b6c2d5bf1046aeb6d8e5bae3bca35385 | ORPH
    arm      |          clang-15.0.3          | NOK | http://autobuild.buildroot.net/results/34e8500d2bd90043e936f250fb5468fc7664680f |     
  riscv64    |       containerd-1.7.14        | NOK | http://autobuild.buildroot.net/results/d200fcab9bb78abc7eb81376a86b1c1bf0c6b960 |     
    i686     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/3fb463d408958eac8733f81c81a4c43d5e79a0b2 | ORPH
  mips64el   |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/922fc8659a8feed0f5ba76b0fb9eb6ccadbd16ca |     
 microblaze  |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/f3a46b62c104ffb6e0a37634cb4923d4a0949202 |     
   nios2     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/18966278b0ab5c973553c3867232c8165a805d0e |     
powerpc64le  | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/cd80c93d271a31acaf96acdcf2e5089b5c8d1182 |     
  riscv64    |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/2034e767094a1d97ab8bc935dc7735b604f250ce |     
  aarch64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/770bfdd0bc4493e4db75789c9527b6f95b0fbae5 | ORPH
    mips     |      host-libglib2-2.76.1      | NOK | http://autobuild.buildroot.net/results/6b6b47f417b43aca8785650f2fa3ed587c41f5a5 |     
    m68k     |      host-libglib2-2.76.1      | NOK | http://autobuild.buildroot.net/results/c3828284339280e2c9c3217243eb2654daac8d17 |     
   nios2     |      host-libglib2-2.76.1      | NOK | http://autobuild.buildroot.net/results/33c9828d6f083d5e320b8dbd0d7a04c86a149e98 |     
  powerpc    |      host-libglib2-2.76.1      | NOK | http://autobuild.buildroot.net/results/b0f37fec97c2aa8ab66df16717a53fa82c8f77fc |     
  mips64el   |      host-libglib2-2.76.1      | NOK | http://autobuild.buildroot.net/results/f6793ba01bd8245b32d7bf50cc321d9a982ae373 |     
  mips64el   |      host-libglib2-2.76.1      | NOK | http://autobuild.buildroot.net/results/e5a6276239e7d9478230619a24dc2d3959d7d185 |     
  riscv32    |      host-libglib2-2.76.1      | NOK | http://autobuild.buildroot.net/results/f207d4efe2e1d6566e6cbd91089e59406d7cdb76 |     
   sh4eb     |      host-libglib2-2.76.1      | NOK | http://autobuild.buildroot.net/results/c0a3735bb38c96f5e20c57222556dd5094a9548c |     
   armeb     |      host-libglib2-2.76.1      | NOK | http://autobuild.buildroot.net/results/b0811136f306ba7af270fd34e64f90de55d7cadf |     
 aarch64_be  |      host-libglib2-2.76.1      | NOK | http://autobuild.buildroot.net/results/4e4fce5da4849ef5bc5990a37f4fd58cd3d22ec0 |     
   arceb     |      host-libglib2-2.76.1      | NOK | http://autobuild.buildroot.net/results/b38541756ae8819d1b21ceb191be94a553d8e3bd |     
powerpc64le  |      host-libglib2-2.76.1      | NOK | http://autobuild.buildroot.net/results/b5a6cd7c2d4a46d3ee5125defb790b59d9b1155b |     
 powerpc64   |      host-libglib2-2.76.1      | NOK | http://autobuild.buildroot.net/results/64fc3c2aa21564b7fd5697c44d2a7b6246437df2 |     
   mipsel    |      host-libglib2-2.76.1      | NOK | http://autobuild.buildroot.net/results/3e40b53a62e9b4d642f8c255d2ecfa92906fa8df |     
   arceb     |      host-libglib2-2.76.1      | NOK | http://autobuild.buildroot.net/results/84957f20996a21e011a0c08cc856a0e56fd8132d |     
    arc      |      host-libglib2-2.76.1      | NOK | http://autobuild.buildroot.net/results/ea5844163661854564cfbcaa4580b6b0a5c54905 |     
    i686     |      host-libglib2-2.76.1      | NOK | http://autobuild.buildroot.net/results/67b56a3d02463da271a02bac61672edc5e210533 |     
  sparc64    |      host-libglib2-2.76.1      | NOK | http://autobuild.buildroot.net/results/d361c2406b1a3d59026af8b10c92a4c505cf5de1 |     
   nios2     |      host-libglib2-2.76.1      | NOK | http://autobuild.buildroot.net/results/7ba02c2db60c0f579db0c5c66bbfea72993836ac |     
    i686     |      host-libglib2-2.76.1      | NOK | http://autobuild.buildroot.net/results/c6601729a4a53c036b8004ed452694c80f2e6eda |     
   mips64    |      host-libglib2-2.76.1      | NOK | http://autobuild.buildroot.net/results/da2de69886bb6d5e2b09aaf6512f5b59f901a199 |     
    m68k     |      host-libglib2-2.76.1      | NOK | http://autobuild.buildroot.net/results/4e2effa7bc5eaf13be5e6ca0f040a2b471e57b5f |     
    m68k     |      host-libglib2-2.76.1      | NOK | http://autobuild.buildroot.net/results/ed4821b1c7d4db655f51330ecdd4621d6863288d |     
    or1k     |      host-libglib2-2.76.1      | NOK | http://autobuild.buildroot.net/results/9df0f6467c4884a439f667692b08c5df00c534f0 |     
   nios2     |      host-libglib2-2.76.1      | NOK | http://autobuild.buildroot.net/results/73090666bf31ee1715b91b7bc3662ca5a470162e |     
    or1k     |      host-libglib2-2.76.1      | NOK | http://autobuild.buildroot.net/results/c1d2fada1ea160226ec7af4a7f00622c16737218 |     
   nios2     |      host-libglib2-2.76.1      | NOK | http://autobuild.buildroot.net/results/b2c5252aa4fed9a9fe2371338860eb20e779e217 |     
   mipsel    |      host-libglib2-2.76.1      | NOK | http://autobuild.buildroot.net/results/2d6b2a0378aba74a0cf9e8683bfca52be1ae5e2f |     
  mips64el   |      host-libglib2-2.76.1      | NOK | http://autobuild.buildroot.net/results/8da21d3fb15e622829fab7dc6392db04edabcebd |     
   x86_64    |      host-libglib2-2.76.1      | NOK | http://autobuild.buildroot.net/results/4f0373b417c0d2bc887f295a1d8b46183f22e972 |     
    arc      |      host-libglib2-2.76.1      | NOK | http://autobuild.buildroot.net/results/aa8e4884584da2427a6c9ae2349a2e3259556517 |     
  sparc64    |      host-libglib2-2.76.1      | NOK | http://autobuild.buildroot.net/results/36ca7e15fb2ca9ad2e348ae0374f5c72aa4ee7cc |     
  powerpc    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/c68c8183f3c5fea94398a9ed6670732e7930dd22 |     
   s390x     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/e911e5fe60efb0068ca105ae1663e06c9ae3e265 |     
   mipsel    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/b5731ca1d622220df03bc43b85930c78cb75eb5d |     
    m68k     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/b6cd0f249f3fc54d84dc81902729434a9574cecf | ORPH
   arceb     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/83c7d10322fa45768fe38405a1ff2d0ed724e6c0 | ORPH
   xtensa    |          libsepol-3.5          | NOK | http://autobuild.buildroot.net/results/85419e308b8b26e225fab95e9ee5dcff8f474a8b |     
   xtensa    |           mdadm-4.3            | NOK | http://autobuild.buildroot.net/results/6a836977d79dcbe09fbb3fe6d18e4cee4783286b | ORPH
    arm      |           proj-9.3.0           | NOK | http://autobuild.buildroot.net/results/3a24b65e6de2dc8e12badbdb3d0d45ff538ac029 |     
  mips64el   |      python-grpcio-1.60.0      | NOK | http://autobuild.buildroot.net/results/d9843635899b3dfb1d8fe4194b1f5731654475c4 |     
    arm      |      python-grpcio-1.60.0      | NOK | http://autobuild.buildroot.net/results/2a52ed8bac055e6c59fcb535e00de0db293d2adb |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/13e4b70783c8bf31fa55773a915dc363aec2a00d |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/49dbbe156af9521b5beba9ec81801061bff8e1fa |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                elfutils-0.189 | 2 
                  bitcoin-26.0 | 1 
                 coreutils-9.3 | 1 
          libcamera-apps-1.2.1 | 1 
                       unknown | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |          bitcoin-26.0          | NOK | http://autobuild.buildroot.net/results/4695c9ad1ff014469686debaf07eba76aebf570e |     
    arc      |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/d418c1756319c8e110e01321135048ff8e67a319 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/71bd1cd65731b350dce6842c47be8c06fb83ab11 | ORPH
    arc      |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/c24fa5691325549a7dde864d85f94891ba578b53 | ORPH
    arc      |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/f9d9d11b1da6bf0abe6724902aa007f8c493e198 |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/c264d1c2a786d887d73ec68db89d50edc6dad8a1 |     


Gitlab CI results for 2024-05-03
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
       acmesystems_aria_g25_128mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/6761770420  |      
       acmesystems_aria_g25_256mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/6761770421  |      
    acmesystems_arietta_g25_128mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/6761770422  |      
    acmesystems_arietta_g25_256mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/6761770423  |      
                  at91sam9260eknf | https://gitlab.com/buildroot.org/buildroot/-/jobs/6761770449  |      
                   at91sam9g20dfc | https://gitlab.com/buildroot.org/buildroot/-/jobs/6761770451  |      
                 at91sam9g45m10ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/6761770455  |      
                     at91sam9rlek | https://gitlab.com/buildroot.org/buildroot/-/jobs/6761770457  |      
                     at91sam9x5ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/6761770458  |      
                 at91sam9x5ek_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/6761770474  |      
                 at91sam9x5ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/6761770477  |      
             at91sam9x5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/6761770480  |      
   atmel_sama5d27_som1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/6761770482  |      
   atmel_sama5d2_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/6761770485  |      
       atmel_sama5d3_xplained_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/6761770493  |      
   atmel_sama5d3_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/6761770498  |      
                 atmel_sama5d3xek | https://gitlab.com/buildroot.org/buildroot/-/jobs/6761770500  |      
       atmel_sama5d4_xplained_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/6761770505  |      
   atmel_sama5d4_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/6761770511  |      
                        avenger96 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6761770513  |      
                avnet_rzboard_v2l | https://gitlab.com/buildroot.org/buildroot/-/jobs/6761770515  |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/6761770521  | ORPH 
                   beagleboardx15 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6761770522  |      
                   beaglebone_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6761770526  |      
                          beaglev | https://gitlab.com/buildroot.org/buildroot/-/jobs/6761770529  |      
                      beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6761770530  |      
                  chromebook_snow | https://gitlab.com/buildroot.org/buildroot/-/jobs/6761770537  |      
                             ci20 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6761770540  |      
                      cubieboard2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6761770542  |      
            engicam_imx6qdl_icore | https://gitlab.com/buildroot.org/buildroot/-/jobs/6761770545  |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6761770547  |      
        engicam_imx6qdl_icore_rqs | https://gitlab.com/buildroot.org/buildroot/-/jobs/6761770551  |      
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/6761770553  |      
             engicam_imx6ul_isiot | https://gitlab.com/buildroot.org/buildroot/-/jobs/6761770554  |      
           friendlyarm_nanopi_r2s | https://gitlab.com/buildroot.org/buildroot/-/jobs/6761770583  |      
                        imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/6761770616  |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/6761770622  |      
                         lego_ev3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6761770625  |      
      microchip_sam9x60ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/6761770634  |      
...hip_sama5d27_wlsom1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/6761770637  |      
    microchip_sama5d2_icp_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/6761770639  |      
      microchip_sama7g5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/6761770641  |      
                          mx25pdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/6761770646  |      
              octavo_osd32mp1_brk | https://gitlab.com/buildroot.org/buildroot/-/jobs/6761770664  |      
              octavo_osd32mp1_red | https://gitlab.com/buildroot.org/buildroot/-/jobs/6761770666  |      
                        odroidxu4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6761770670  |      
          olimex_imx233_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/6761770682  |      
                    openblocks_a6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6761770687  |      
                    orangepi_lite | https://gitlab.com/buildroot.org/buildroot/-/jobs/6761770689  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6761770688  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/6761770691  |      
                      orangepi_pc | https://gitlab.com/buildroot.org/buildroot/-/jobs/6761770696  |      
                      orangepi_r1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6761770701  |      
                           pine64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6761770718  |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/6761770720  |      
                    pine64_star64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6761770721  |      
               qemu_ppc64_pseries | https://gitlab.com/buildroot.org/buildroot/-/jobs/6761770753  |      
             qemu_ppc64le_pseries | https://gitlab.com/buildroot.org/buildroot/-/jobs/6761770755  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/6761770784  | ORPH 
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/6761770792  |      
                           rock5b | https://gitlab.com/buildroot.org/buildroot/-/jobs/6761770794  |      
                           rock64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6761770796  |      
                       rock_pi_n8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6761770797  |      
                       sheevaplug | https://gitlab.com/buildroot.org/buildroot/-/jobs/6761770801  |      
            sipeed_lichee_rv_dock | https://gitlab.com/buildroot.org/buildroot/-/jobs/6761770803  |      
             sipeed_licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/6761770805  |      
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6761770815  |      
                 snps_arc700_nsim | https://gitlab.com/buildroot.org/buildroot/-/jobs/6761770816  | ORPH 
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6771330998  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6771331616  |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6771331623  |      
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6771331706  |      
                      visionfive2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6771331807  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
