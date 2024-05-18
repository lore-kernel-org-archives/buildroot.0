Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6968EC25B74
	for <buildroot@archiver.kernel.org>; Sat, 18 May 2024 04:08:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7655040620;
	Sat, 18 May 2024 04:08:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oKLiPA0a4guH; Sat, 18 May 2024 04:08:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C07F840207
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C07F840207;
	Sat, 18 May 2024 04:08:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0D8AC1BF3EB
 for <buildroot@lists.busybox.net>; Sat, 18 May 2024 04:08:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E9DE240207
 for <buildroot@lists.busybox.net>; Sat, 18 May 2024 04:08:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I1ZT9M2UtCy0 for <buildroot@lists.busybox.net>;
 Sat, 18 May 2024 04:08:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7615C40184
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7615C40184
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7615C40184
 for <buildroot@buildroot.org>; Sat, 18 May 2024 04:08:14 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2C3E224000C
 for <buildroot@buildroot.org>; Sat, 18 May 2024 04:08:12 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sat, 18 May 2024 04:08:12 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1716005292; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Xcp1tlCGMySRWddG0rx0qH2u+N2pzqZq80qp0vrAd5U=;
 b=oEtyfiBkYeWf2a9bLU9Yeo2KuGC19pFu0IJkl0vTA1oYa7ClyC2lawdcgyNYMzOSSzzvYb
 1stgQErTFN2aZ9nEdcvR1fETtnzZRjLz+q8wf6AC9HKOkN8NhPHK90ZMHplqoC+/pCf1vE
 fSw6qXEthH/nnegR+vdc1NTi1HcVTG7I9CsctCoQrOmUhtgul+Bl4Im5/Ck+edd2o2iV0w
 NC6Hk3GtLv1OyPx7tX09l/FWiDYQjRXHAtvGEbwEGaZUsIBAPm7iu7RNZpEFzKsfQDBUpq
 Wb1092fywQyg4wNrC5s1f9Ua6xOfjPaMtKO6rWR+9Xzqzc+wg7wpTAI6IEwK2g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=oEtyfiBk
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-05-17
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
Message-ID: <20240518040812.oBDLk0GXYTehFmYbvBXkt0402KysD8E0nnolBhgdSLY@z>

Hello,

Autobuild statistics for 2024-05-17
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  9  |  6  |  1  | 16  |
    master   | 25  | 46  |  1  | 72  |

Classification of failures by reason for master
-----------------------------------------------

          libcamera-apps-1.2.1 | 4 
                fail2ban-1.0.2 | 3 
                libressl-3.8.4 | 3 
                elfutils-0.189 | 2 
              host-rust-1.74.1 | 2 
              libopenssl-3.3.0 | 2 
                 openssh-9.7p1 | 2 
                       unknown | 2 
aer-inject-9bd5e2c7886fca72... | 1 
           at-spi2-core-2.50.0 | 1 
                    bcc-0.29.1 | 1 
                   bird-2.0.12 | 1 
                  bitcoin-26.0 | 1 
                 cdrkit-1.1.11 | 1 
             containerd-1.7.14 | 1 
                     crun-1.12 | 1 
                  ffmpeg-6.1.1 | 1 
                flannel-0.25.1 | 1 
                   foot-1.16.2 | 1 
         gobject-introspection | 1 
               gocryptfs-2.3.2 | 1 
              gr-osmosdr-0.2.4 | 1 
 host-binutils-bare-metal-2.42 | 1 
                host-go-1.22.3 | 1 
host-heimdal-f4faaeaba371ff... | 1 
ibm-sw-tpm2-5452af422edeff7... | 1 
           mediastreamer-4.4.8 | 1 
                 minisign-0.11 | 1 
                 mokutil-0.7.1 | 1 
         python-remi-2022.7.27 | 1 
           python-zlmdb-22.6.1 | 1 
                 shadow-4.14.5 | 1 
                 uclibc-1.0.48 | 1 
                    volk-3.0.0 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/c22abf35511450009641d5b3ba4926a618aea619 | ORPH
microblazeel |      at-spi2-core-2.50.0       | NOK | http://autobuild.buildroot.net/results/7e22583ddc5264523894ed0c9a43fb3e2ac2da79 |     
    arm      |           bcc-0.29.1           | NOK | http://autobuild.buildroot.net/results/4829d41041e192d352dd2ff0098d725e10eb5f2b |     
   s390x     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/4eff1d9e9f9046ea4f3cb6ba06ac13aa4599ffaf |     
    m68k     |          bitcoin-26.0          | NOK | http://autobuild.buildroot.net/results/6eeb754d8bca462561f5238be671e1886d5881a5 |     
   mipsel    |         cdrkit-1.1.11          | NOK | http://autobuild.buildroot.net/results/061ddd156151af39351b2ba9a0983274116796ba |     
  riscv64    |       containerd-1.7.14        | NOK | http://autobuild.buildroot.net/results/0d6f242f978f3d5b139da28e2732354dc505e352 |     
   x86_64    |           crun-1.12            | NOK | http://autobuild.buildroot.net/results/87ac501cff14b71c1c857cb245ceca341bd12a6c |     
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/6f6329466e05651538df5bad90264dab51bbf9d3 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/e2d49f89641ab6efeadfc770944c31baca264b81 | ORPH
  mips64el   |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/b54395a85365642a7ebb8dce5479d52296633c07 |     
  riscv64    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/689bcb9ddaa1f8ef4a9ad450eca0b32da129e115 |     
   armeb     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/1419426d2e22b2c373ad9cb1bd194230759e7d66 |     
    arc      |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/ab6ce9fc47f128ae2075661181d95108d0355492 |     
  riscv64    |         flannel-0.25.1         | NOK | http://autobuild.buildroot.net/results/c67e70ce4fae0e93e3629b8ce5abf1644bb00555 |     
   armeb     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/7c622371ad2ea73ff6b736c373446085cd8376a6 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/a5e32bc08de77bd6e3eaabfd4b1c70958d90bab2 |     
  riscv64    |        gocryptfs-2.3.2         | NOK | http://autobuild.buildroot.net/results/fe3c6fc243ef5c92fd18a51adb4d02865c9532e6 |     
    arc      |        gr-osmosdr-0.2.4        | NOK | http://autobuild.buildroot.net/results/f009958c37902a224512b336fcb431903bdd0b96 |     
   armeb     | host-binutils-bare-metal-2.42  | NOK | http://autobuild.buildroot.net/results/3a799b0a75b5041bc7ef65119a0ab0703b348441 |     
  mips64el   |         host-go-1.22.3         | NOK | http://autobuild.buildroot.net/results/e8256985473a5250b96862f1996673830dc8894b |     
    sh4      | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/fc4ff9fd72f3073a35cb753af75eaad847a53ddb | ORPH
   armeb     |        host-rust-1.74.1        | NOK | http://autobuild.buildroot.net/results/3e478156eabadba2edd18522bda1935901a97335 |     
   x86_64    |        host-rust-1.74.1        | NOK | http://autobuild.buildroot.net/results/fd2b850d6548a15d591a46ac5c380fde27126378 |     
    arm      | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/296b709918f9ee1e864bba2df76fa040a42f9462 |     
    sh4      |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/e043fb784dea7dbb3657f6fb7b513b0fb0e440c3 |     
   xtensa    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/8cc2cd25a1fc31658bc7c3d54adbe8cc9ecde9ba |     
  mips64el   |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/7d96e244de9501565ba37c30d75d95a7f1df9e12 |     
powerpc64le  |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/b4e28badd3ae3f2eeb7d1f1c154d78b892ef3a33 |     
microblazeel |        libopenssl-3.3.0        | NOK | http://autobuild.buildroot.net/results/868af562e44637f935e57b61522bcd6b236af6a6 | ORPH
  riscv32    |        libopenssl-3.3.0        | NOK | http://autobuild.buildroot.net/results/d6aec1b445d1d76b50175293f68f045e941e02bf | ORPH
   xtensa    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/5b09774dabf2736036bfc7f76744d12fa0758a3a | ORPH
   arceb     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/49be7424a120019f2bdce298be1d43efb39389b4 | ORPH
    arc      |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/441c87b498affc49936d69838e93c6675e80710b | ORPH
 powerpc64   |      mediastreamer-4.4.8       | NOK | http://autobuild.buildroot.net/results/5eb134c0d312409bd5b4e90f014e220516160b94 | ORPH
    m68k     |         minisign-0.11          | NOK | http://autobuild.buildroot.net/results/9cc9fd17c7eb4a741c08f27f69764df4a26295fa |     
    arm      |         mokutil-0.7.1          | NOK | http://autobuild.buildroot.net/results/59e470ad6bf7f48314cd26ed4163c095e4c803ab |     
   mipsel    |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/f85a018f7336e0ad1b462382f6630ff8235c773a | ORPH
   mipsel    |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/caa77828066eab500d2725e9428c0462cff2ebcc | ORPH
  mips64el   |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/cd044cf8a5b0001e0a5677dc8a444be0cd17ae27 |     
    arm      |      python-zlmdb-22.6.1       | NOK | http://autobuild.buildroot.net/results/0652e0013cad8954103f58c4cd9bfeb8afca8f7b |     
  powerpc    |         shadow-4.14.5          | NOK | http://autobuild.buildroot.net/results/5af424b9d68e5c97a25492050827df241a4a54cf |     
   arceb     |         uclibc-1.0.48          | NOK | http://autobuild.buildroot.net/results/3fc9487e9c47bc148dca65b2723c98004a8f88bf |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/c17ee2434c63f8292451492574ec7923b8045c2c |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/2f569e0550597e97ae2f4348557976ffab766809 |     
  powerpc    |           volk-3.0.0           | NOK | http://autobuild.buildroot.net/results/28c8a2255db70ff560048acb10be6b6075d56a8f |     
    sh4      |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/8e4c524c20b5a6fdc99d1601caa8a5e384384dc3 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                   bird-2.0.12 | 1 
         gobject-introspection | 1 
          libcamera-apps-1.2.1 | 1 
               libglib2-2.76.1 | 1 
              libopenssl-3.2.1 | 1 
                    ncmpc-0.49 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/54b18957cf27dcede171c2c441edad775d1323fd |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/6bcacabe8d150c25f947c41963d0114c057e50aa |     
 powerpc64   |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/5bef9701d2213af8d3c4059adf605dce0a3e5eaa |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/6d88a391c4c51e8da7f55dc9dc185a05e35e0c29 |     
    arm      |        libopenssl-3.2.1        | NOK | http://autobuild.buildroot.net/results/fb03cda9f7c3de9a601954eb35f880be8b70d771 | ORPH
  riscv32    |           ncmpc-0.49           | NOK | http://autobuild.buildroot.net/results/8288566a211342b5e573eaa19dcc16eb468d3310 |     
 aarch64_be  |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/f50570b97f2ebbc5fe5bb759ed81a1697aa0745d |     


Gitlab CI results for 2024-05-17
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
       acmesystems_aria_g25_128mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/6865596448  |      
       acmesystems_aria_g25_256mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/6865596456  |      
    acmesystems_arietta_g25_128mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/6865596486  |      
    acmesystems_arietta_g25_256mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/6865596518  |      
             amarula_vyasa_rk3288 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6865596548  |      
                   armadeus_apf27 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6865596608  |      
                  at91sam9260eknf | https://gitlab.com/buildroot.org/buildroot/-/jobs/6865596657  |      
                   at91sam9g20dfc | https://gitlab.com/buildroot.org/buildroot/-/jobs/6865596664  |      
                 at91sam9g45m10ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/6865596668  |      
                     at91sam9rlek | https://gitlab.com/buildroot.org/buildroot/-/jobs/6865596682  |      
                     at91sam9x5ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/6865596687  |      
                 at91sam9x5ek_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/6865596691  |      
                 at91sam9x5ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/6865596701  |      
             at91sam9x5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/6865596706  |      
       atmel_sama5d3_xplained_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/6865596797  |      
                 atmel_sama5d3xek | https://gitlab.com/buildroot.org/buildroot/-/jobs/6865596810  |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/6865596917  | ORPH 
                   beagleboardx15 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6865596926  |      
                   beaglebone_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6865596939  |      
                     beagleboneai | https://gitlab.com/buildroot.org/buildroot/-/jobs/6865596946  |      
                          beaglev | https://gitlab.com/buildroot.org/buildroot/-/jobs/6865596949  |      
                      beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6865596959  |      
                  chromebook_snow | https://gitlab.com/buildroot.org/buildroot/-/jobs/6865596985  |      
                             ci20 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6865596992  |      
                      cubieboard2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6865596996  |      
            engicam_imx6qdl_icore | https://gitlab.com/buildroot.org/buildroot/-/jobs/6865597002  |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6865597007  |      
        engicam_imx6qdl_icore_rqs | https://gitlab.com/buildroot.org/buildroot/-/jobs/6865597012  |      
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/6865597023  |      
             engicam_imx6ul_isiot | https://gitlab.com/buildroot.org/buildroot/-/jobs/6865597030  |      
        freescale_imx6dlsabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/6865597041  |      
          freescale_imx6dlsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/6865597054  |      
         freescale_imx6qsabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/6865597071  |      
           freescale_imx6qsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/6865597074  |      
          freescale_imx6sxsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/6865597079  |      
           freescale_imx7dsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/6865597086  |      
             freescale_imx8dxlevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/6865597095  |      
              freescale_imx8mmevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/6865597102  |      
              freescale_imx8mnevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/6865597105  |      
              freescale_imx8mpevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/6865597113  |      
              freescale_imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/6865597126  |      
              freescale_imx8qmmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/6865597129  |      
             freescale_imx8qxpmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/6865597132  |      
           friendlyarm_nanopi_r2s | https://gitlab.com/buildroot.org/buildroot/-/jobs/6865597171  |      
                         imx23evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/6865597227  |      
                   imx6-sabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/6865597229  |      
                        imx6slevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/6865597240  |      
                       imx6sx-sdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/6865597244  |      
                        imx6ulevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/6865597248  |      
                       imx6ulpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/6865597256  |      
                        imx7dpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/6865597264  |      
                       imx8mmpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/6865597270  |      
                        imx8mpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/6865597285  |      
                        imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/6865597291  |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/6865597307  |      
                         lego_ev3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6865597347  |      
                       ls1028ardb | https://gitlab.com/buildroot.org/buildroot/-/jobs/6865597350  |      
                     ls1046a-frwy | https://gitlab.com/buildroot.org/buildroot/-/jobs/6865597352  |      
                          mx25pdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/6865597400  |      
                          mx51evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/6865597404  |      
                   mx6sx_udoo_neo | https://gitlab.com/buildroot.org/buildroot/-/jobs/6865597412  |      
                          mx6udoo | https://gitlab.com/buildroot.org/buildroot/-/jobs/6865597415  |      
                      nitrogen8mn | https://gitlab.com/buildroot.org/buildroot/-/jobs/6865597507  |      
              octavo_osd32mp1_brk | https://gitlab.com/buildroot.org/buildroot/-/jobs/6865597512  |      
              octavo_osd32mp1_red | https://gitlab.com/buildroot.org/buildroot/-/jobs/6865597513  |      
                        odroidxu4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6865597527  |      
                    openblocks_a6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6865597668  |      
                    orangepi_lite | https://gitlab.com/buildroot.org/buildroot/-/jobs/6865597683  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6865597676  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/6865597697  |      
                      orangepi_pc | https://gitlab.com/buildroot.org/buildroot/-/jobs/6865597706  |      
                      orangepi_r1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6865597717  |      
                       pandaboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/6865597768  |      
                           pine64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6865597790  |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/6865597800  |      
                    pine64_star64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6865597807  |      
                qemu_aarch64_sbsa | https://gitlab.com/buildroot.org/buildroot/-/jobs/6865597835  |      
               qemu_ppc64_pseries | https://gitlab.com/buildroot.org/buildroot/-/jobs/6865598810  |      
             qemu_ppc64le_pseries | https://gitlab.com/buildroot.org/buildroot/-/jobs/6865598893  |      
                     qemu_sh4_r2d | https://gitlab.com/buildroot.org/buildroot/-/jobs/6865599024  |      
                   qemu_sh4eb_r2d | https://gitlab.com/buildroot.org/buildroot/-/jobs/6865599037  |      
                  qemu_sparc_ss10 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6865599063  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/6875651750  | ORPH 
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/6875651891  |      
                           rock5b | https://gitlab.com/buildroot.org/buildroot/-/jobs/6875651932  |      
                           rock64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6875651970  |      
                       rock_pi_n8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6875652054  |      
             sipeed_licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/6875652641  |      
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6875652981  |      
                 snps_arc700_nsim | https://gitlab.com/buildroot.org/buildroot/-/jobs/6875653000  | ORPH 
                snps_archs38_hsdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/6875653147  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6875653190  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6875653880  |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6875653897  |      
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6875654063  |      
                         uevm5432 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6875654171  |      
                      visionfive2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6875654561  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
